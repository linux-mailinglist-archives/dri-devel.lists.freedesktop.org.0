Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCYXFvT0hWnHIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:04:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AC3FE977
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C439E10E7B2;
	Fri,  6 Feb 2026 14:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qPCZ4Ghb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EBB10E7B0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 14:04:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BEC9DC243B8;
 Fri,  6 Feb 2026 14:04:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2F7B160729;
 Fri,  6 Feb 2026 14:04:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50438119D1929; Fri,  6 Feb 2026 15:04:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770386669; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=d70krws98qMbryfn/12Zb3xwhE2iiVZ6JA0PmydolRU=;
 b=qPCZ4GhbgSvh7oc+x3hfb/WxEKcrK6O2VtHn9ZUnKHIWbmuwpDPS+JVzXwRZvJjY52JV/q
 jRFNs9CU0xQoxAmTuVScqUmJr3RhJksmzPmC2iDxOIGOKozVtX3K0+pFhuAw87JTmlzOzO
 Mx7asUoldGGsbCO1CxidWKqAh6wVT4SkqjyaR14D4D/lxH/+TnRz846TduWs57dgblA7K2
 qq8aj5PKT39GkueFiEWEvJOcmHo1rod8gM8pqXd1pJ+UJU/zVu6F/+Oy2EP5MnYL2KIUVh
 AJXEPBPb7T4XHikvoDSeE/Goj7h2+A7djgwt/yvu7WKYngnH526TrWO6uKX5cQ==
Message-ID: <e6dd0f45-1d64-48b8-bc76-43cc29fabec2@bootlin.com>
Date: Fri, 6 Feb 2026 15:04:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] drm/vkms: Support setting custom background color
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Diederik de Haas <diederik@cknow-tech.com>
References: <20260204-rk3588-bgcolor-v7-0-78d1d01c5ca1@collabora.com>
 <20260204-rk3588-bgcolor-v7-3-78d1d01c5ca1@collabora.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260204-rk3588-bgcolor-v7-3-78d1d01c5ca1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cristian.ciocaltea@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:jani.nikula@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:nfraprado@collabora.com,m:diederik@cknow-tech.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[louis.chauvet@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[louis.chauvet@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.979];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,cknow-tech.com:email]
X-Rspamd-Queue-Id: A3AC3FE977
X-Rspamd-Action: no action



On 2/4/26 21:02, Cristian Ciocaltea wrote:
> Make use of the BACKGROUND_COLOR CRTC property when filling the
> background during blending.  It already defaults to solid black.
> 
> Since the internal representation of the pixel color in VKMS relies on
> 16 bits of precision, use the newly introduced DRM_ARGB64_GET{R|G|B}()
> helpers to access the individual components of the background color
> property, which is compliant with DRM_FORMAT_ARGB16161616.
> 
> It's worth noting the alpha component is ignored, hence non-opaque
> background colors are not supported.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   drivers/gpu/drm/vkms/vkms_composer.c | 10 ++++++++--
>   drivers/gpu/drm/vkms/vkms_crtc.c     |  3 +++
>   2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index cd85de4ffd03..83d217085ad0 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -475,8 +475,14 @@ static void blend(struct vkms_writeback_job *wb,
>   {
>   	struct vkms_plane_state **plane = crtc_state->active_planes;
>   	u32 n_active_planes = crtc_state->num_active_planes;
> -
> -	const struct pixel_argb_u16 background_color = { .a = 0xffff };
> +	u64 bgcolor = crtc_state->base.background_color;
> +
> +	const struct pixel_argb_u16 background_color = {
> +		.a = 0xffff,
> +		.r = DRM_ARGB64_GETR(bgcolor),
> +		.g = DRM_ARGB64_GETG(bgcolor),
> +		.b = DRM_ARGB64_GETB(bgcolor),
> +	};
>   
>   	int crtc_y_limit = crtc_state->base.mode.vdisplay;
>   	int crtc_x_limit = crtc_state->base.mode.hdisplay;
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 9a7db1d51022..2514c367f710 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -4,6 +4,7 @@
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_blend.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
> @@ -228,6 +229,8 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
>   
>   	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
>   
> +	drm_crtc_attach_background_color_property(crtc);
> +
>   	spin_lock_init(&vkms_out->lock);
>   	spin_lock_init(&vkms_out->composer_lock);
>   
> 

