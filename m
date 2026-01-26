Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIhmIh6od2lrjwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 18:45:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3F18B9C6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 18:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CD810E459;
	Mon, 26 Jan 2026 17:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="EcUJtwIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A7810E459
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 17:44:57 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20260126174455euoutp02672a86f4aa950dcb6186a3c4ea3e9c49~OWPEJIrBp1456614566euoutp023;
 Mon, 26 Jan 2026 17:44:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20260126174455euoutp02672a86f4aa950dcb6186a3c4ea3e9c49~OWPEJIrBp1456614566euoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1769449495;
 bh=ViZnPApGmUm2J4gBM2q37ZW/xc0HmDYJ2pAdJ6BXznM=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=EcUJtwIvikdAG2aaXvnIrEnVxjxp6sqj+eN+ReWnmhAZcoZTykDAYnBGn45TjgV9j
 6IydmTmfZcw7aIGKkxgoTwMd/FiRl51Qw8mUSbmfRj6dgT0++ll3wq8V+YBs81C+BN
 XVtyFbTgY9a2qQn8fxHgi1EnWme/xadUYtn7+BUU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206~OWPDiMXHA2201722017eucas1p1L;
 Mon, 26 Jan 2026 17:44:55 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20260126174453eusmtip1343282648a6e7de9c928b52e4daf95d0~OWPBrT1zi0390203902eusmtip1Q;
 Mon, 26 Jan 2026 17:44:53 +0000 (GMT)
Message-ID: <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
Date: Mon, 26 Jan 2026 18:44:52 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav
 Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
In-Reply-To: <5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
X-EPHeader: CA
X-CMS-RootMailID: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
 <20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
 <5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
 <CGME20260126174455eucas1p1f219202580a1033d3e881adc4f37f206@eucas1p1.samsung.com>
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
	RCPT_COUNT_TWELVE(0.00)[39];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:victor.liu@nxp.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.f
 reedesktop.org,m:linux-rockchip@lists.infradead.org,m:jernejskrabec@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,raspberrypi.com,igalia.com,sholland.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,nxp.com,pengutronix.de,collabora.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,samsung.com:mid,samsung.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DB3F18B9C6
X-Rspamd-Action: no action

On 26.01.2026 18:42, Marek Szyprowski wrote:
> On 07.01.2026 19:14, Dmitry Baryshkov wrote:
>> Implement the clear_infoframe callback, disabling corresponding
>> InfoFrame type.
>>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> This patch landed recently in linux-next as commit 3a4ceb89a972 
> ("drm/vc4: hdmi: implement clear_infoframe"). In my tests I found that 
> it causes the following regression on Qualcomm RB5 board:
>
Please ignore my report, it looks that automated bisecting got a bit 
confused.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

