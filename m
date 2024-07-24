Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F093B004
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 12:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244CD897E0;
	Wed, 24 Jul 2024 10:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB1F897E0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 10:55:55 +0000 (UTC)
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by APP-05 (Coremail) with SMTP id zQCowAB3XTin3aBmvIa8AA--.42398S2;
 Wed, 24 Jul 2024 18:55:45 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: jani.nikula@linux.intel.com
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 make24@iscas.ac.cn, mripard@kernel.org, noralf@tronnes.org,
 sam@ravnborg.org, stable@vger.kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH v3] drm/client: fix null pointer dereference in
 drm_client_modeset_probe
Date: Wed, 24 Jul 2024 18:55:35 +0800
Message-Id: <20240724105535.1524294-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87ikwvf6ol.fsf@intel.com>
References: <87ikwvf6ol.fsf@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: zQCowAB3XTin3aBmvIa8AA--.42398S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1xtF4DWr4ruw43KFWkXrb_yoW8tw4xpr
 s8GF90yFW0qF9rKFs2v3WxuF13Z3W3Jr48GF17J3Z3C3Z0gry5tryYvr15WF9rCr13KF10
 qF12yFW3XF4qyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQvtAUUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Jul 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:=0D
> On Wed, 24 Jul 2024, Ma Ke <make24@iscas.ac.cn> wrote:=0D
> > In drm_client_modeset_probe(), the return value of drm_mode_duplicate()=
 is=0D
> > assigned to modeset->mode, which will lead to a possible NULL pointer=0D
> > dereference on failure of drm_mode_duplicate(). Add a check to avoid np=
d.=0D
> >=0D
> > Cc: stable@vger.kernel.org=0D
> > Fixes: cf13909aee05 ("drm/fb-helper: Move out modeset config code")=0D
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>=0D
> > ---=0D
> > Changes in v3:=0D
> > - modified patch as suggestions, returned error directly when failing t=
o =0D
> > get modeset->mode.=0D
> =0D
> This is not what I suggested, and you can't just return here either.=0D
> =0D
> BR,=0D
> Jani.=0D
> =0D
=0D
I have carefully read through your comments. Based on your comments on the =
=0D
patchs I submitted, I am uncertain about the appropriate course of action =
=0D
following the return value check(whether to continue or to return directly,=
=0D
as both are common approaches in dealing with function drm_mode_duplicate()=
=0D
in Linux kernel, and such handling has received 'acked-by' in similar =0D
vulnerabilities). Could you provide some advice on this matter? Certainly, =
=0D
adding a return value check is essential, the reasons for which have been =
=0D
detailed in the vulnerability description. I am looking forward to your =0D
guidance and response. Thank you!=0D
=0D
Best regards,=0D
=0D
Ma Ke=0D
=0D
> =0D
> > Changes in v2:=0D
> > - added the recipient's email address, due to the prolonged absence of =
a =0D
> > response from the recipients.=0D
> > - added Cc stable.=0D
> > ---=0D
> >  drivers/gpu/drm/drm_client_modeset.c | 3 +++=0D
> >  1 file changed, 3 insertions(+)=0D
> >=0D
> > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm=
_client_modeset.c=0D
> > index 31af5cf37a09..750b8dce0f90 100644=0D
> > --- a/drivers/gpu/drm/drm_client_modeset.c=0D
> > +++ b/drivers/gpu/drm/drm_client_modeset.c=0D
> > @@ -880,6 +880,9 @@ int drm_client_modeset_probe(struct drm_client_dev =
*client, unsigned int width,=0D
> >  =0D
> >  			kfree(modeset->mode);=0D
> >  			modeset->mode =3D drm_mode_duplicate(dev, mode);=0D
> > +			if (!modeset->mode)=0D
> > +				return 0;=0D
> > +=0D
> >  			drm_connector_get(connector);=0D
> >  			modeset->connectors[modeset->num_connectors++] =3D connector;=0D
> >  			modeset->x =3D offset->x;=0D
> =0D
> -- =0D
> Jani Nikula, Intel=

