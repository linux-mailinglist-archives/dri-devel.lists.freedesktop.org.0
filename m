Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0767FCFDAE5
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C5810E5A5;
	Wed,  7 Jan 2026 12:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ivCOlkKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6D610E5A5;
 Wed,  7 Jan 2026 12:32:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E94936000A;
 Wed,  7 Jan 2026 12:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E98FC4CEF7;
 Wed,  7 Jan 2026 12:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767789142;
 bh=2Nqjd5umGqQTshG/6KasLg0SyW2HMZV1B1Lxjp2ecFg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ivCOlkKs/3FPom4CAQW/8n5+RtJ+Ktgpa46WuEDsbvA9PTBeWuC7vV4+xBeDgQh6I
 F+ikAwBIMxkTYm3UK5stlQN0iulvCSSl6E2JV1u4QXCSkGcTAkSB2mkHdzw/EdIDvc
 FUSAzwPfQKz6h4ZHo8/hDOFRATtO4FNaGq9u8a+Hb0DB/mfzr37+BspAyH9jtluOP9
 BThkvDxk9LJUGONm+dsYPaEtV1NScUVsoM3A4nX+KbKavoAkonyRlYC4BOBp/n+kNt
 uNOpMaeFLn9fsFJzYYAUv+hgwkrlZmLWtZDdw79Ff4blsc6mcmnifNIw3KUSZqGA+X
 RP1wITi7KGfyw==
Message-ID: <57ad1884d9080ebc37abf8b96ab71abf@kernel.org>
Date: Wed, 07 Jan 2026 12:32:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 04/10] drm/connector: make clear_infoframe callback
 mandatory for HDMI connectors
In-Reply-To: <20251224-limit-infoframes-2-v3-4-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-4-7fd3cacfefed@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Chen-Yu
 Tsai" <wens@kernel.org>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>,
 "Rob Clark" <robin.clark@oss.qualcomm.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sean Paul" <sean@poorly.run>,
 "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
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

On Wed, 24 Dec 2025 03:02:53 +0200, Dmitry Baryshkov wrote:
> We already require both hdmi_write_infoframe and hdmi_clear_infoframe
> for bridges implementing DRM_BRIDGE_OP_HDMI. It makes sense to require
> the clear_infoframes callback for HDMI connectors utilizing
> drmm_connector_hdmi_init().
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
