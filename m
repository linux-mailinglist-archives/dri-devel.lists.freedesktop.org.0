Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6859414E4A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 18:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1ED6EC42;
	Wed, 22 Sep 2021 16:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993416EC42
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 16:45:31 +0000 (UTC)
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mT5N7-0001Oz-HF; Wed, 22 Sep 2021 18:45:25 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Colin King <colin.king@canonical.com>, Sandy Huang <hjc@rock-chips.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Alex Bee <knaerzche@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/rockchip: Remove redundant assignment of
 pointer connector
Date: Wed, 22 Sep 2021 18:45:24 +0200
Message-ID: <22365175.EbdSka62eY@diego>
In-Reply-To: <27c79f7a-8e4c-fad8-c6cf-a89793f2e3c6@gmail.com>
References: <20210922112416.182134-1-colin.king@canonical.com>
 <27c79f7a-8e4c-fad8-c6cf-a89793f2e3c6@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Alex,

Am Mittwoch, 22. September 2021, 18:35:38 CEST schrieb Alex Bee:
> Hi Colin,
> Am 22.09.21 um 13:24 schrieb Colin King:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The pointer connector is being assigned a value that is never
> > read, it is being updated immediately afterwards. The assignment
> > is redundant and can be removed.
> 
> The pointer to the connector is used in rockchip_rgb_fini for 
> drm_connector_cleanup.
> It's pretty much the same for the encoder, btw.

I think the issue is more the two lines

	connector = &rgb->connector;
 	connector = drm_bridge_connector_init(rgb->drm_dev, encoder);

hence the connector = &rgb->connector being overwritten immediately after

Now that I look at it again, the whole approach looks strange.
drm_bridge_connector_init() creates the connector structure and
returns a pointer to it.

So the first line below sets the connector pointer to point to the
&rgb->connector element and the second line then set a completely
different address into it.

So the connector element in rockchip_lvds and rockchip_rgb should actually
become a pointer itself to hold the connector element returned from
drm_bridge_connector_init() .


Heiko

> 
> Regards,
> 
> Alex
> > 
> > Addresses-Coverity: ("Unused value")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >   drivers/gpu/drm/rockchip/rockchip_rgb.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
> > index 09be9678f2bd..18fb84068a64 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
> > @@ -150,7 +150,6 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
> >   	if (ret)
> >   		goto err_free_encoder;
> >   
> > -	connector = &rgb->connector;
> >   	connector = drm_bridge_connector_init(rgb->drm_dev, encoder);
> >   	if (IS_ERR(connector)) {
> >   		DRM_DEV_ERROR(drm_dev->dev,
> > 
> 
> 




