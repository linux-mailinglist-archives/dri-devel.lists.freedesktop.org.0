Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A52FE592
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F84F6E8EF;
	Thu, 21 Jan 2021 08:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09806E187
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 13:21:44 +0000 (UTC)
Date: Wed, 20 Jan 2021 13:21:29 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 2/3] drm/ingenic: Register devm action to cleanup
 encoders
To: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <TFI8NQ.468S4PLHPA963@crapouillou.net>
In-Reply-To: <CAKMK7uFaP7xcw90=KqiGJd7Mt-gD-spvcxvOZr2Txhyv5vcBvw@mail.gmail.com>
References: <20210120123535.40226-1-paul@crapouillou.net>
 <20210120123535.40226-3-paul@crapouillou.net>
 <CAKMK7uFaP7xcw90=KqiGJd7Mt-gD-spvcxvOZr2Txhyv5vcBvw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:31 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, od@zcrc.me,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 stable <stable@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le mer. 20 janv. 2021 =E0 14:01, Daniel Vetter <daniel@ffwll.ch> a =

=E9crit :
> On Wed, Jan 20, 2021 at 1:36 PM Paul Cercueil <paul@crapouillou.net> =

> wrote:
>> =

>>  Since the encoders have been devm-allocated, they will be freed way
>>  before drm_mode_config_cleanup() is called. To avoid use-after-free
>>  conditions, we then must ensure that drm_encoder_cleanup() is called
>>  before the encoders are freed.
>> =

>>  v2: Use the new __drmm_simple_encoder_alloc() function
>> =

>>  Fixes: c369cb27c267 ("drm/ingenic: Support multiple panels/bridges")
>>  Cc: <stable@vger.kernel.org> # 5.8+
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>> =

>>  Notes:
>>      Use the V1 of this patch to fix v5.11 and older kernels. This =

>> V2 only
>>      applies on the current drm-misc-next branch.
>> =

>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 16 +++++++---------
>>   1 file changed, 7 insertions(+), 9 deletions(-)
>> =

>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =

>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index 7bb31fbee29d..158433b4c084 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -1014,20 +1014,18 @@ static int ingenic_drm_bind(struct device =

>> *dev, bool has_components)
>>                          bridge =3D =

>> devm_drm_panel_bridge_add_typed(dev, panel,
>>                                                                   =

>> DRM_MODE_CONNECTOR_DPI);
>> =

>>  -               encoder =3D devm_kzalloc(dev, sizeof(*encoder), =

>> GFP_KERNEL);
>>  -               if (!encoder)
>>  -                       return -ENOMEM;
>>  +               encoder =3D __drmm_simple_encoder_alloc(drm, =

>> sizeof(*encoder), 0,
> =

> Please don't use the __ prefixed functions, those are the internal
> ones. The official one comes with type checking and all that included.
> Otherwise lgtm.
> -Daniel

The non-prefixed one assumes that I want to allocate a struct that =

contains the encoder, not just the drm_encoder itself.

-Paul

>>  +                                                     =

>> DRM_MODE_ENCODER_DPI);
>>  +               if (IS_ERR(encoder)) {
>>  +                       ret =3D PTR_ERR(encoder);
>>  +                       dev_err(dev, "Failed to init encoder: =

>> %d\n", ret);
>>  +                       return ret;
>>  +               }
>> =

>>                  encoder->possible_crtcs =3D 1;
>> =

>>                  drm_encoder_helper_add(encoder, =

>> &ingenic_drm_encoder_helper_funcs);
>> =

>>  -               ret =3D drm_simple_encoder_init(drm, encoder, =

>> DRM_MODE_ENCODER_DPI);
>>  -               if (ret) {
>>  -                       dev_err(dev, "Failed to init encoder: =

>> %d\n", ret);
>>  -                       return ret;
>>  -               }
>>  -
>>                  ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
>>                  if (ret) {
>>                          dev_err(dev, "Unable to attach bridge\n");
>>  --
>>  2.29.2
>> =

> =

> =

> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
