Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F374850ADB
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 19:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9A310E1CD;
	Sun, 11 Feb 2024 18:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="lJhUPB+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (unknown [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF85910E1CD
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 18:49:05 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9872E87964;
 Sun, 11 Feb 2024 19:48:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1707677333;
 bh=bEJVj/82KszpjXYIhxFXJWu+z739f31qmr8n7dyXGZ0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lJhUPB+uaq5Ov2fyNPlMllGGofXif0nxsM/TMNlY/FH1ZIKwRysAzxL01/iBkQuru
 d2sXTXpfMM09IICMXTS2oNBGNqnBLBedmWq7fNerMuYareYG0dexiUiF63YT5GJR3s
 n0uTnTfnIskEE/Mg9Wsxg9Qgytc7EBUCuUIVMEv/klnWmcwOMuAsscJZQ0WxrrPY1g
 SZI4W6P4vkJ7vWPcBwaSQt7dFw+o2eTTr+SpMT41dgR5YGo+6HToIfP2WKO4jkofrm
 9J0P6m4sOUE//lL4fI6A5i2yBuqToQ+kavN3wPFuX9B4ntU+hlzFiJLVazKg+jMEbL
 t4R0GGYczbQAA==
Message-ID: <7d3670a5-dc7e-4311-b250-70d503a36f89@denx.de>
Date: Sun, 11 Feb 2024 19:48:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/lcdif: Do not disable clock on already suspended
 hardware
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
References: <20240118183924.144221-1-marex@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240118183924.144221-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 1/18/24 19:39, Marek Vasut wrote:
> In case the LCDIF is enabled in DT but unused, the clock used by the
> LCDIF are not enabled. Those clock may even have a use count of 0 in
> case there are no other users of those clock. This can happen e.g. in
> case the LCDIF drives HDMI bridge which has no panel plugged into the
> HDMI connector.
> 
> Do not attempt to disable clock in the suspend callback and re-enable
> clock in the resume callback unless the LCDIF is enabled and was in
> use before the system entered suspend, otherwise the driver might end
> up trying to disable clock which are already disabled with use count
> 0, and would trigger a warning from clock core about this condition.
> 
> Note that the lcdif_rpm_suspend() and lcdif_rpm_resume() functions
> internally perform the clock disable and enable operations and act
> as runtime PM hooks too.
> 
> Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>   drivers/gpu/drm/mxsfb/lcdif_drv.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index ea10bf81582e9..0f895b8a99d62 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -343,6 +343,9 @@ static int __maybe_unused lcdif_suspend(struct device *dev)
>   	if (ret)
>   		return ret;
>   
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
>   	return lcdif_rpm_suspend(dev);
>   }
>   
> @@ -350,7 +353,8 @@ static int __maybe_unused lcdif_resume(struct device *dev)
>   {
>   	struct drm_device *drm = dev_get_drvdata(dev);
>   
> -	lcdif_rpm_resume(dev);
> +	if (!pm_runtime_suspended(dev))
> +		lcdif_rpm_resume(dev);
>   
>   	return drm_mode_config_helper_resume(drm);
>   }

Is this OK to pick up ? Some AB/RB/input would be appreciated, thanks !
