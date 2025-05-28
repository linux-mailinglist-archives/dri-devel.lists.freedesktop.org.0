Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE548AC6220
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 08:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4FA10E1C9;
	Wed, 28 May 2025 06:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="lY3RS0ZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D238D10E1C9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 06:41:32 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250528064129euoutp02171698b4afe454778c944ce508f9de87~DnbcN4BfV1107011070euoutp02V
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 06:41:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250528064129euoutp02171698b4afe454778c944ce508f9de87~DnbcN4BfV1107011070euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748414489;
 bh=1CqYlDJ7Pye3W/xNL1WCDcZNkM1De9lFuAMds043EQQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=lY3RS0ZJCY2FT4ZRA2JOyjYq04zRvZ/4bCvl64owpge97u/lq1XtOcDil8YCp4lsE
 yXqHY55aN6rKYm9Lf8AVNtfsfmp8laLHWb61qmve4OaJI5QlCi7DmuZd81R/jBq8Aw
 DpMPhKEPqgn0Wd6dvtI6k4Z5me09lv2EO/JjpukY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250528064129eucas1p2cf0cc2407e45422e9598a01b5dc0906f~DnbbxmIM51574615746eucas1p20;
 Wed, 28 May 2025 06:41:29 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250528064128eusmtip150027ece79e69b35d778441f1de3c0c8~Dnba22_l10218602186eusmtip1F;
 Wed, 28 May 2025 06:41:28 +0000 (GMT)
Message-ID: <d96f5578-4c87-4b94-b42f-7e8e54d75b04@samsung.com>
Date: Wed, 28 May 2025 08:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] drm/bridge: samsung-dsim: Stop controlling
 vsync display FIFO flush in panels
To: Philipp Zabel <p.zabel@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Artur Weber <aweber.kernel@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250527-dsi-vsync-flush-v1-0-9b4ea4578729@pengutronix.de>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250528064129eucas1p2cf0cc2407e45422e9598a01b5dc0906f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250527141451eucas1p268427354487325dd2fc1302a94f40c1a
X-EPHeader: CA
X-CMS-RootMailID: 20250527141451eucas1p268427354487325dd2fc1302a94f40c1a
References: <CGME20250527141451eucas1p268427354487325dd2fc1302a94f40c1a@eucas1p2.samsung.com>
 <20250527-dsi-vsync-flush-v1-0-9b4ea4578729@pengutronix.de>
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

On 27.05.2025 16:14, Philipp Zabel wrote:
> This series enables the vsync flush feature in the samsung-dsim driver
> unconditionally and removes the MIPI_DSI_MODE_VSYNC_FLUSH flag.
>
> Background: I've recently seen shifted display issues on two different
> i.MX8MM boards (mxsfb + samsung-dsim) with different DSI panels.
> The symptoms were horizonally shifted display contents, with a stable
> offset, in about 0.1 to 0.6 percent of modesets.
> Enabling the MIPI_DSI_MODE_VSYNC_FLUSH flag in the panels' mode_flags
> fixed the issue in both cases.
>
> The samsung-dsim driver is the only DSI bridge driver that uses this
> flag: If the flag is absent, the driver sets the DSIM_MFLUSH_VS bit in
> the DSIM_CONFIG_REG register, which disables the vsync flush feature.
> The reset value of this bit is cleared (vsync flush is default-enabled).
> According to the i.MX8MM reference manual,
>
>      "It needs that Main display FIFO should be flushed for deleting
>       garbage data."
>
> This appears to match the comment in mxsfb_reset_block() in mxsfb_kms.c:
>
>      /*
>       * It seems, you can't re-program the controller if it is still
>       * running. This may lead to shifted pictures (FIFO issue?), so
>       * first stop the controller and drain its FIFOs.
>       */
>
> Now I wonder why the bit is controlled by a flag in the panel drivers.
> Whether the display controller pushes up to a FIFO worth of garbage data
> into the DSI bridge during initialization seems to be a property of the
> display controller / DSI bridge integration (whether this is due to
> hardware or driver bugs), not a specific requirement of the panel.
> Surely no panel needs to receive a partial line of garbage data in front
> of the first frame?
>
> Instead of adding the flag to every panel connected to affected SoCs,
> the vsync flush feature could just be enabled unconditionally.
> Clearing an already-empty display FIFO should have no effect, unless
> I'm missing something? With that, the MIPI_DSI_MODE_VSYNC_FLUSH flag
> would not be used anymore and could be removed.

The Exynos5433 datasheet doesn't give us anything more about this bit:

"Auto flush of display FIFO in only video mode.
It requires that the display FIFO should be flushed for
deleting garbage data in video mode."

Your reasoning seems to be correct, it probably slipped into 
MIPI_DSI_MODE flags just because it is in the same register.

Feel free to add:

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

