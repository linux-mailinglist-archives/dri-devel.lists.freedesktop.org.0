Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA5ECACF39
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 12:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62F510E0A6;
	Mon,  8 Dec 2025 11:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IOm4weY7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAB210E0A6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 11:06:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 608BA44418;
 Mon,  8 Dec 2025 11:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F8BC4CEF1;
 Mon,  8 Dec 2025 11:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765191973;
 bh=+Sg4+xUyee1JdQ9aNzal0X1KGSxSHxdpxDRWre8j8BY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=IOm4weY7TQGzaGOq9hS9L4Rw5s5O2X4t18f++QMBkFetLbd9WX4JEk2F+x+p39to0
 wki37JFXH/Zr+f+T5z7MmQA6fpjGF6GUrATz9sWrHV2JAaUU395O7VU43JpztG1mpq
 KgVegQPaV2r4vuEohxqhODX7VQvhZALfdSCINStSM393Ks9noAyLTs32hY6a1GuXn7
 yiV3kozVHZ+bi5cIxv/qX678bSnWrNEWTjOBlveCzJ6mqgF1vJT+bPm8xt11xBhCq4
 lh9I8oBTDygDeM06pa8UJiO8dMlR5jz+yOYrFtOtsnlt6OT2+1dOiOrV6/fPDZHdCc
 6YWWBMQ7lv40A==
Message-ID: <b2cd921b3682355b0c64d107f1dae998@kernel.org>
Date: Mon, 08 Dec 2025 11:06:10 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 0/4] drm: Revert and fix enable/disable sequence
In-Reply-To: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Aradhya
 Bhatia" <aradhya.bhatia@linux.dev>, "Chaoyi Chen" <chaoyi.chen@rock-chips.com>,
 "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas
 Karlman" <jonas@kwiboo.se>, "Jyri Sarha" <jyri.sarha@iki.fi>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Linus Walleij" <linusw@kernel.org>, "Louis-Alexis
 Eyraud" <louisalexis.eyraud@collabora.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>,
 "Marek Vasut" <marek.vasut+renesas@mailbox.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Vicente Bergas" <vicencb@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 5 Dec 2025 11:51:47 +0200, Tomi Valkeinen wrote:
> Changing the enable/disable sequence in commit c9b1150a68d9
> ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> has caused regressions on multiple platforms: R-Car, MCDE, Rockchip.
> 
> This is an alternate series to Linus' series:
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
