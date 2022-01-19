Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E414938EC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 11:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB39F10E7A0;
	Wed, 19 Jan 2022 10:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC9010E796
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 10:51:34 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nA8Ym-0004NV-S7; Wed, 19 Jan 2022 11:51:24 +0100
Message-ID: <bb71f83d4897ce818348522d9594b091478073ff.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Add missing pm_runtime_put
From: Lucas Stach <l.stach@pengutronix.de>
To: Yongzhi Liu <lyz_cs@pku.edu.cn>, linux+etnaviv@armlinux.org.uk, 
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch, 
 etnaviv@lists.freedesktop.org
Date: Wed, 19 Jan 2022 11:51:20 +0100
In-Reply-To: <1642515391-19329-1-git-send-email-lyz_cs@pku.edu.cn>
References: <1642515391-19329-1-git-send-email-lyz_cs@pku.edu.cn>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, dem 18.01.2022 um 06:16 -0800 schrieb Yongzhi Liu:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code, thus a matching decrement is needed
> on the error handling path to keep the counter balanced.
> 
Instead of adding more error handling code here, I would prefer to
convert this to pm_runtime_resume_and_get to avoid this issue.

Regards,
Lucas

> Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 242a5fd..5e81a98 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1714,6 +1714,9 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
>  	return 0;
>  
>  out_sched:
> +#ifdef CONFIG_PM
> +	pm_runtime_put_autosuspend(gpu->dev);
> +#endif
>  	etnaviv_sched_fini(gpu);
>  
>  out_workqueue:


