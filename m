Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 951F060E0A7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 14:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3505F10E4ED;
	Wed, 26 Oct 2022 12:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96AA10E4ED
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 12:31:06 +0000 (UTC)
Received: from [192.168.2.190] (109-252-112-196.nat.spd-mgts.ru
 [109.252.112.196])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A160F660283C;
 Wed, 26 Oct 2022 13:31:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666787465;
 bh=cVeQ921nr1AcNBVj1P6cg8IcXyv7Hv4rrSLvF9n0vLk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SJWsV0ogx4gukVqrHHNKVgKYZ0kQz8qF4ZbwVQbXmfCAcWW4X8jM2jbdSIC6O+ROD
 mlrhJWseWDEdiODY58uwsEURti2LqQwah7CejmrvhqIDfSJt/tIR1Cnr0f3IUM+G55
 QRpxyefWC1CNP6ov7hkqLEMDJXITcPtUtJIoJ0DWwY/Kn9O2PqLXOft56F+tpwa5Fj
 i1TExjR1seBKD05WzlfypAdVrIKgqz9+cbe8v5VNIG6T/ulg8qYxU5a/nLOYhlY4ey
 HRJkDF0H5nFUjK5uXNE7oWp4/VdZkAGoPWtxCR8LVla4tW9PUTM7jdP4pf0IMwFpss
 XHXynQR2p0ORA==
Message-ID: <c3c49aec-f307-3679-55a8-eb2c33fb84aa@collabora.com>
Date: Wed, 26 Oct 2022 15:31:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm/rockchip: dw_hdmi: filter regulator -EPROBE_DEFER
 error messages
Content-Language: en-US
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org
References: <20220926203752.5430-1-aurelien@aurel32.net>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220926203752.5430-1-aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 "open list:DRM DRIVERS FOR ROCKCHIP" <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/26/22 23:37, Aurelien Jarno wrote:
> When the avdd-0v9 or avdd-1v8 supply are not yet available, EPROBE_DEFER
> is returned by rockchip_hdmi_parse_dt(). This causes the following error
> message to be printed multiple times:
> 
>     dwhdmi-rockchip fe0a0000.hdmi: [drm:dw_hdmi_rockchip_bind [rockchipdrm]] *ERROR* Unable to parse OF data
> 
> Fix that by not printing the message when rockchip_hdmi_parse_dt()
> returns -EPROBE_DEFER.
> 
> Fixes: ca80c4eb4b01 ("drm/rockchip: dw_hdmi: add regulator support")
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index c14f88893868..2f4b8f64cbad 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -565,7 +565,8 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
>  
>  	ret = rockchip_hdmi_parse_dt(hdmi);
>  	if (ret) {
> -		DRM_DEV_ERROR(hdmi->dev, "Unable to parse OF data\n");
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(hdmi->dev, "Unable to parse OF data\n");
>  		return ret;
>  	}
>  

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Nit: all the DRM_DEV_ERROR() usage in this function is inappropriate to
me. These errors should be converted to dev_err_probe(), IMO.

-- 
Best regards,
Dmitry

