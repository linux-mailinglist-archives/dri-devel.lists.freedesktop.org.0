Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2579464DE5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 13:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3E16EBA8;
	Wed,  1 Dec 2021 12:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56DB6EBA8
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 12:30:11 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1msOkR-00015d-J2; Wed, 01 Dec 2021 13:30:07 +0100
Message-ID: <40a8113ebb566f3c87648ffa86d39846fc63d8a4.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: constify static struct cooling_ops
From: Lucas Stach <l.stach@pengutronix.de>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 01 Dec 2021 13:30:06 +0100
In-Reply-To: <20211128201916.10230-1-rikard.falkeborn@gmail.com>
References: <20211128201916.10230-1-rikard.falkeborn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Sonntag, dem 28.11.2021 um 21:19 +0100 schrieb Rikard Falkeborn:
> The only usage of cooling_ops is to pass its address to
> thermal_of_cooling_device_register(), which takes a pointer to const
> struct thermal_cooling_device_ops as input. Make it const to allow the
> compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Applied to my etnaviv/next branch.

Regards,
Lucas

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 06bde46df451..37018bc55810 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1658,7 +1658,7 @@ etnaviv_gpu_cooling_set_cur_state(struct thermal_cooling_device *cdev,
>  	return 0;
>  }
>  
> -static struct thermal_cooling_device_ops cooling_ops = {
> +static const struct thermal_cooling_device_ops cooling_ops = {
>  	.get_max_state = etnaviv_gpu_cooling_get_max_state,
>  	.get_cur_state = etnaviv_gpu_cooling_get_cur_state,
>  	.set_cur_state = etnaviv_gpu_cooling_set_cur_state,


