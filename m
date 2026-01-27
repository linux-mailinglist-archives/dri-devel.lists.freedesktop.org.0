Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM33HEqBeGkzqgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:11:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096A69186F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC12710E4F3;
	Tue, 27 Jan 2026 09:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="ARDcksx7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5056910E49A;
 Tue, 27 Jan 2026 09:11:32 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260127091130euoutp014c75f018134d9523a802741a4410d6be~Oi4Ej8mLk0793907939euoutp01d;
 Tue, 27 Jan 2026 09:11:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260127091130euoutp014c75f018134d9523a802741a4410d6be~Oi4Ej8mLk0793907939euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1769505090;
 bh=o3uYq+bvJ8IHWH6k2uOihpa6CKY0ItOKPXbc7h/Pz2g=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=ARDcksx7il7K+UJhL3qOUbJrzsCnWlDnWMyBKycHeHqFCGmyemgus6UZuDTSdf+bf
 sio+/WnMIcFH7Q4EvSeQJPsiIhXonBavFn5UetIdLJJLlTvKiDVGsd1YhwF3xweOeh
 qSQI7psb+mdS7QYSc32Br4lqAOSfjZL27eQp/MjQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20260127091130eucas1p1440fbe9f7c4c663fa3a68f6fcb86470d~Oi4EUDQLX2294122941eucas1p1s;
 Tue, 27 Jan 2026 09:11:30 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20260127091128eusmtip12e05e437c03450178ad4e2539faa417e~Oi4CsG4iT0357803578eusmtip1P;
 Tue, 27 Jan 2026 09:11:28 +0000 (GMT)
Message-ID: <002704a5-9ccb-4abb-beaf-5a448c17ea39@samsung.com>
Date: Tue, 27 Jan 2026 10:11:27 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Stevenson
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
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <jiq5ublhbfzuv3qsz3n6bve32wmto5hxc6mxppb2i2wagykafx@d235legi4r5o>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260127091130eucas1p1440fbe9f7c4c663fa3a68f6fcb86470d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
X-EPHeader: CA
X-CMS-RootMailID: 20260126174455eucas1p1f219202580a1033d3e881adc4f37f206
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
 <20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
 <5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
 <CGME20260126174455eucas1p1f219202580a1033d3e881adc4f37f206@eucas1p1.samsung.com>
 <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
 <jiq5ublhbfzuv3qsz3n6bve32wmto5hxc6mxppb2i2wagykafx@d235legi4r5o>
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
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,raspberrypi.com,igalia.com,sholland.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,nxp.com,pengutronix.de,collabora.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[39];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,samsung.com:mid,samsung.com:dkim]
X-Rspamd-Queue-Id: 096A69186F
X-Rspamd-Action: no action

On 26.01.2026 20:00, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 06:44:52PM +0100, Marek Szyprowski wrote:
>> On 26.01.2026 18:42, Marek Szyprowski wrote:
>>> On 07.01.2026 19:14, Dmitry Baryshkov wrote:
>>>> Implement the clear_infoframe callback, disabling corresponding
>>>> InfoFrame type.
>>>>
>>>> Acked-by: Maxime Ripard <mripard@kernel.org>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> This patch landed recently in linux-next as commit 3a4ceb89a972
>>> ("drm/vc4: hdmi: implement clear_infoframe"). In my tests I found that
>>> it causes the following regression on Qualcomm RB5 board:
>> Please ignore my report, it looks that automated bisecting got a bit
>> confused.
> See https://lore.kernel.org/dri-devel/9ebc0582b0f7990d7df992a07ec8ef7f@kernel.org/T/#t
>
> I'm going to push it to drm-misc-next-fixes.

Thanks for pointing that patch! It fixed my issue.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

