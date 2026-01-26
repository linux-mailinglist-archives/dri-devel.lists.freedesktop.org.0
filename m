Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL+VLyeAd2m9hgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 15:54:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644D489C62
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 15:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B584210E452;
	Mon, 26 Jan 2026 14:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="latfrhts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6770E10E467
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 14:54:25 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20260126145423euoutp020e778fc6eeeee58fc42de0fcf64f6784~OT6Kn0YJh2157621576euoutp02X
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 14:54:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20260126145423euoutp020e778fc6eeeee58fc42de0fcf64f6784~OT6Kn0YJh2157621576euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1769439263;
 bh=FJ6dndNVnr43t5sh/dPsANRRiyWCeTFjxztR0Zx4Cp0=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=latfrhtsmG8RtRz6JSigyMYSADZ/lFu31gIaRZXGoM25xpFM4HGx1IOuvYmKN1tVi
 4sUcfPGg12Uh96uCRj+XIOl41w0DhSrap4g8zmAdpw5cd90hIFkCoUbnyZzvvTOpe9
 xdDk4RRnYRMWithrPUfQAQa3VFcYmsfAwG6Bib6g=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260126145422eucas1p243889bf4ac456996ce7ed05111331d67~OT6KA7zOj1143511435eucas1p2B;
 Mon, 26 Jan 2026 14:54:22 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260126145422eusmtip2d1a656619f59b16d7baae0d47ee79283~OT6JQxXP51987919879eusmtip2T;
 Mon, 26 Jan 2026 14:54:22 +0000 (GMT)
Message-ID: <ac1832c1-e63b-45ba-9c57-83e56b34ed6d@samsung.com>
Date: Mon, 26 Jan 2026 15:54:21 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/3] drm/bridge: samsung-dsim: move bridge init sequence
 to atomic_enable
From: Marek Szyprowski <m.szyprowski@samsung.com>
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
In-Reply-To: <1db5ffdf-924b-49cb-a057-802a1bfe6073@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260126145422eucas1p243889bf4ac456996ce7ed05111331d67
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260124172136eucas1p1e7a2da65c3fca268ea68f12506c6c19e
X-EPHeader: CA
X-CMS-RootMailID: 20260124172136eucas1p1e7a2da65c3fca268ea68f12506c6c19e
References: <20260124-exynos-dsim-fixes-v1-0-122d047a23d1@disroot.org>
 <CGME20260124172136eucas1p1e7a2da65c3fca268ea68f12506c6c19e@eucas1p1.samsung.com>
 <20260124-exynos-dsim-fixes-v1-1-122d047a23d1@disroot.org>
 <1db5ffdf-924b-49cb-a057-802a1bfe6073@samsung.com>
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kauschluss@disroot.org,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[disroot.org,samsung.com,amarulasolutions.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,samsung.com:mid,samsung.com:dkim,disroot.org:email]
X-Rspamd-Queue-Id: 644D489C62
X-Rspamd-Action: no action

On 26.01.2026 09:57, Marek Szyprowski wrote:
> On 24.01.2026 18:20, Kaustabh Chakraborty wrote:
>> Since commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
>> pre-enable and post-disable"), pre-enable sequence is called before the
>> CRTC is enabled.
>>
>> This causes unintended side-effects (abberation among potentially other
>> things) in the display when samsung_dsim_init() is called in the
>> pre-enable part of the sequence. Call it in samsung_dsim_atomic_enable()
>> instead.
>>
>> Cc: stable@vger.kernel.org # v6.17 and later
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>
> I'm not sure if this will be needed:
>
> https://lore.kernel.org/all/20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com/ 
>

Even more, there is a pending similar patch:

https://lore.kernel.org/all/20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com/

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

