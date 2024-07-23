Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB54593A4ED
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 19:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1C110E427;
	Tue, 23 Jul 2024 17:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Y/KpqwE6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE9110E427
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 17:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1721755644; x=1722360444; i=wahrenst@gmx.net;
 bh=80fjjAf9XBmhMPzSq4fA1co69LzROIvpMlHPKGRpFfo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Y/KpqwE6ibEsV6yVHuH8aRQNyQdjStlltEWXEQjuX6Nd/jrbur0r+XmG3qKnkNsZ
 BTvhsCTzT7W0kBbtv/8Lv5zqADvkjQOExyVSDgvURiNe7WSWT9I5AbTie/oZxGDEP
 wDv2GAM7so+ZSMDaRmrWlWMbHotwfbAFLYgNK48yTHYc2a4bxukSC73ZA/2ijIbDU
 AHaNP+MlB/qLmOdL0T7AYtUfcnMLZIoSwWKqtQtwIpOthT00ZcXUwqdMFR7gcf8Pz
 Uo5TpFLjAdk4/sPEV1LZLhPHO0aKQufqK+qiScRimfuKRyq6CntG1snlkCpZQJvMY
 jBtoydziH6XXzdqiMA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N79uI-1sFai008ei-00vs3P; Tue, 23
 Jul 2024 19:27:24 +0200
Message-ID: <7f498dd6-f21e-481c-bff9-1449327ac94a@gmx.net>
Date: Tue, 23 Jul 2024 19:27:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] drm/vc4: hdmi: Handle error case of
 pm_runtime_resume_and_get
To: Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Jiri Slaby <jirislaby@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Scott Branden <sbranden@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 Ray Jui <rjui@broadcom.com>, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630153652.318882-7-wahrenst@gmx.net>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240630153652.318882-7-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Nzd9l7pAHFgSgPujxmJeeQJNfuVnleLtW7GuiqkrRWzJSKop67p
 CkCMyNTcAlgTI6rANC3i6Hr+cwhws5UFKyfxhJYlT+fFiE6H1IKQKNxG30c3ZlcIk8SLEmj
 DiwyUF/125vIN7zUdywBPNMJZf58SsvuGdwiRcWJ9FbzcA9V8CIKdofia2cmgA2Y3PUT+TO
 t8b0OZe6qUAU/9Lo6vaUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wpdg22WfDQk=;AKCwxABGI9PRvrQviv1h7ESd+Sp
 o1MZ8bg8S3PJomoQA+DXQ5d+bR0slqcHco8FPUCX5gHvCtYLhYqqimQx9IrVOvaFYr6ZhK+Fu
 Q0d+UQWui6jQfVr6O73GT1zvOJIEYZKED90eo0DgZYPZFw1AYrpreC1gmP05iV8hvdF2ZogHN
 +7mRQZoWKGwOpkL9D/a93huFBvzzuf+qpGKZrEjVM28Gnc2pIEMyFaecMjKCYiLHHeYEkoO6P
 AkSPL9c/z2zPD2Y84gAuDiGoCe7RjIPxLS6ZbhNgPKeCmm+IfBBfbaxesBwxHOOYtLHiPQJ7b
 hdZFeHlP3ydrRtpU0I7isoXu6jJl2E9kLEQB2Y3gIT7UNt79vAdMVvs1vET0U6QqTtK6ssG2u
 EEt9oUWFvcOSCy2dOZEnRL1pDrS3KNMnxizI5c3WGv8K+kVTL8V2IbiLGwLRS4J+za/7sj4XV
 W92kziet+mXRzjRgcwn8o0jnJQF+smk2+arLjtOgeo2u5bHTEFwCNktD+KwBXIHFRg0Lbz+JV
 LrUVR0ri5IaJDVoNOECoTQLhVAUH+GmVb1vp9Az9r6a48N4qr6pDI+7/Em6XcW0n9iT05djGT
 +LTtUyaslE7etrGgLADfvDRwTOoTnHRljG+J2qISrPNHTKBlAcAvMTNq72vecrMF+qEwpAcQf
 aeVf1Q2BKarzFGhxLvGT4WW6MExX/cH065q8CFyiNIUuVxNvxq0suE5RbIHrCl7jpSZTS6u82
 wJuNhGK7fKr9Ti/jCyN50fWRai61FVL+Z2ohG6MH7LeMr34S6kAfv/UUmqmrXhPY9fl+tPg7p
 LkreV75flkZIMi94z3lu7sWA==
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

Hello,

Am 30.06.24 um 17:36 schrieb Stefan Wahren:
> The commit 0f5251339eda ("drm/vc4: hdmi: Make sure the controller is
> powered in detect") introduced the necessary power management handling
> to avoid register access while controller is powered down.
> Unfortunately it just print a warning if pm_runtime_resume_and_get()
> fails and proceed anyway.
>
> This could happen during suspend to idle. So we must assume it is unsafe
> to access the HDMI register. So bail out properly.
>
> Fixes: 0f5251339eda ("drm/vc4: hdmi: Make sure the controller is powered=
 in detect")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hd=
mi.c
> index d57c4a5948c8..b3a42b709718 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -429,6 +429,7 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_=
connector *connector,
>   {
>   	struct vc4_hdmi *vc4_hdmi =3D connector_to_vc4_hdmi(connector);
>   	enum drm_connector_status status =3D connector_status_disconnected;
> +	int ret;
>
>   	/*
>   	 * NOTE: This function should really take vc4_hdmi->mutex, but
> @@ -441,7 +442,11 @@ static int vc4_hdmi_connector_detect_ctx(struct drm=
_connector *connector,
>   	 * the lock for now.
>   	 */
>
> -	WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
> +	ret =3D pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
> +	if (ret) {
> +		DRM_ERROR("Failed to retain HDMI power domain: %d\n", ret);
> +		return status;
I noticed today that the enum drm_connector_status also supports
connector_status_unknown. Wouldn't this be a more appropriate return
value in this error case?

Why isn't status initialized with connector_status_unknown at all?

Best regards
> +	}
>
>   	if (vc4_hdmi->hpd_gpio) {
>   		if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
> --
> 2.34.1
>

