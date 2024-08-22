Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3007E95B60C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 15:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4B410EA09;
	Thu, 22 Aug 2024 13:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Vgs6UwiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A2410EA09
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 13:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HfTBNkjfdb9wyCg5ugKbLG5PwbqngWOfI/qo3cEv4mA=; b=Vgs6UwiUGEQLLdVMGYqCBhOkJ2
 intZU4JIXdTCkkROQUzWtIDbTogDGERPU67CwXMv5NrT9BYpOeZeGOg7TcXM17s00nylUvIeCXynt
 n9mT04OwOIgh5Pyza4zFjT5VxOnNAtZo3T6JSaRayGjpW22Gj3VJ6Jj/zReYzSRsDorrakbS1VuRc
 mhRjZ8xhv+x32ZzKRS+C2eV5oI71tcThz0JKKkSkC38tfpjOuA5hNz9WITLJN2nTm4W03sQV382Kp
 fHefN7SpdUXCafy/SjJBYIxiB0YEIK26V+0Ah7hsG3Uiz1QVr+svQ38m/X9YRW+P63BfDnje9E1fc
 pMFBQrGw==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sh7ZR-003YzS-Ql; Thu, 22 Aug 2024 15:09:45 +0200
Message-ID: <a3cd743c-6f21-49ad-98bc-2e1f0cfd34f6@igalia.com>
Date: Thu, 22 Aug 2024 10:09:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/9] drm/vc4: hdmi: Handle error case of
 pm_runtime_resume_and_get
To: Stefan Wahren <wahrenst@gmx.net>, Russell King <linux@armlinux.org.uk>,
 Doug Anderson <dianders@chromium.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-list@raspberrypi.com
References: <20240821214052.6800-1-wahrenst@gmx.net>
 <20240821214052.6800-3-wahrenst@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240821214052.6800-3-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Stefan,

On 8/21/24 18:40, Stefan Wahren wrote:
> The commit 0f5251339eda ("drm/vc4: hdmi: Make sure the controller is
> powered in detect") introduced the necessary power management handling
> to avoid register access while controller is powered down.
> Unfortunately it just print a warning if pm_runtime_resume_and_get()
> fails and proceed anyway.
> 
> This could happen during suspend to idle. So we must assume it is unsafe
> to access the HDMI register. So bail out properly.
> 
> Fixes: 0f5251339eda ("drm/vc4: hdmi: Make sure the controller is powered in detect")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Maíra Canal <mcanal@igalia.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Applied to drm/kernel/drm-misc-next!

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index d57c4a5948c8..cb424604484f 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -429,6 +429,7 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
>   {
>   	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
>   	enum drm_connector_status status = connector_status_disconnected;
> +	int ret;
> 
>   	/*
>   	 * NOTE: This function should really take vc4_hdmi->mutex, but
> @@ -441,7 +442,12 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
>   	 * the lock for now.
>   	 */
> 
> -	WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
> +	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
> +	if (ret) {
> +		drm_err_once(connector->dev, "Failed to retain HDMI power domain: %d\n",
> +			     ret);
> +		return connector_status_unknown;
> +	}
> 
>   	if (vc4_hdmi->hpd_gpio) {
>   		if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
> --
> 2.34.1
> 
