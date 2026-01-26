Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UChENGgsd2nacwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:57:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A6B85AB1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF33F10E3C2;
	Mon, 26 Jan 2026 08:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="XJ1Kyd/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C9E10E3B3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:57:06 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20260126085703euoutp024696b934ca68c76c3ee29ecba0049ebb~OPCK-kz1z2750727507euoutp02Z
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:57:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20260126085703euoutp024696b934ca68c76c3ee29ecba0049ebb~OPCK-kz1z2750727507euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1769417823;
 bh=PWcnq9fS5szFbjeETPL6IVSHfuuHn9KkLDU267P2J7s=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=XJ1Kyd/jacBLckjoc9q6J+PjMcGS98Ycr1zUlH0t8Zc1c1FHEOhgAMZB27d0fppp/
 6wIF20UUhOo8cNSkR78SP6ZTumJN7SQiuspM+BOQcu2A9/yPxw39/cYReBwagn3ZxM
 314hRMlZUIUHMp/KScTzc7pms+qnMgCzpQ4Qrmx8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20260126085703eucas1p1b2e7523f2f899396b9bc5eed64d63a7b~OPCKptgbw1601316013eucas1p1t;
 Mon, 26 Jan 2026 08:57:03 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260126085702eusmtip28f556c7e1168f5170037948f35863cd0~OPCJ279El0256102561eusmtip2k;
 Mon, 26 Jan 2026 08:57:02 +0000 (GMT)
Message-ID: <1db5ffdf-924b-49cb-a057-802a1bfe6073@samsung.com>
Date: Mon, 26 Jan 2026 09:57:01 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/3] drm/bridge: samsung-dsim: move bridge init sequence
 to atomic_enable
To: Kaustabh Chakraborty <kauschluss@disroot.org>, Inki Dae
 <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260124-exynos-dsim-fixes-v1-1-122d047a23d1@disroot.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260126085703eucas1p1b2e7523f2f899396b9bc5eed64d63a7b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260124172136eucas1p1e7a2da65c3fca268ea68f12506c6c19e
X-EPHeader: CA
X-CMS-RootMailID: 20260124172136eucas1p1e7a2da65c3fca268ea68f12506c6c19e
References: <20260124-exynos-dsim-fixes-v1-0-122d047a23d1@disroot.org>
 <CGME20260124172136eucas1p1e7a2da65c3fca268ea68f12506c6c19e@eucas1p1.samsung.com>
 <20260124-exynos-dsim-fixes-v1-1-122d047a23d1@disroot.org>
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
X-Spamd-Result: default: False [0.20 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:kauschluss@disroot.org,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[disroot.org,samsung.com,amarulasolutions.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 99A6B85AB1
X-Rspamd-Action: no action

On 24.01.2026 18:20, Kaustabh Chakraborty wrote:
> Since commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
> pre-enable and post-disable"), pre-enable sequence is called before the
> CRTC is enabled.
>
> This causes unintended side-effects (abberation among potentially other
> things) in the display when samsung_dsim_init() is called in the
> pre-enable part of the sequence. Call it in samsung_dsim_atomic_enable()
> instead.
>
> Cc: stable@vger.kernel.org # v6.17 and later
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

I'm not sure if this will be needed:

https://lore.kernel.org/all/20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com/


> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 1d85e706c74b9..975f8b50ae660 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1655,6 +1655,13 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>   	}
>   
>   	dsi->state |= DSIM_STATE_ENABLED;
> +}
> +
> +static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> +				       struct drm_atomic_state *state)
> +{
> +	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> +	int ret;
>   
>   	/*
>   	 * For Exynos-DSIM the downstream bridge, or panel are expecting
> @@ -1665,12 +1672,6 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>   		if (ret)
>   			return;
>   	}
> -}
> -
> -static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> -				       struct drm_atomic_state *state)
> -{
> -	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>   
>   	samsung_dsim_set_display_mode(dsi);
>   	samsung_dsim_set_display_enable(dsi, true);
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

