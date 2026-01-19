Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FD7D3A477
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 11:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C4610E30A;
	Mon, 19 Jan 2026 10:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IoP7E/9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D774510E2A4;
 Mon, 19 Jan 2026 10:13:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BA8A46014E;
 Mon, 19 Jan 2026 10:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E657EC116C6;
 Mon, 19 Jan 2026 10:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768817626;
 bh=1P25O01V1+pU3qLbbBJW/GjfXAE5BGBvNtHpKC+MLLk=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=IoP7E/9pRu+7PDLd0H764jZC/uaNamD0WEa4z1KHQ1LWmWDuerkPTvD00JtG85EOm
 SzdPIkNXbCfn6Md0mGJ1ogDNrUlWfYU1KRUElYJpxZ3ji5qbTBJlJDcSjQcC2+mviQ
 ZE/wyaZPh8k7s/KFqIk92XNEj6nHbp+MKbgOVDgXzCLBRNPoVgD69UHUxtGvi1aqJi
 iNASTiwUxup4KrDlPpADUKJgItJpUr2eliuygQdOW5LikrdFAKge0CU9xKkXvS/5es
 ZLften5mQg2ZaW9SoWZc5htrDu8insI8Ww82s/O0GqFp0V6EbvOVPO8lCv97yl2k9S
 EZ2Y8jIU3vGdw==
Message-ID: <2fb910198a3be542215592ac3f22d6b2@kernel.org>
Date: Mon, 19 Jan 2026 10:13:43 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: check the infoframes behaviour
In-Reply-To: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
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

On Wed, 7 Jan 2026 20:14:58 +0200, Dmitry Baryshkov wrote:
> Verify the InfoFrames behaviour. Check that reporting InfoFrame as
> unsupported doesn't result in a commit error. Also check that HDR and
> Audio InfoFrames are not triggered if corresponding features are not
> enabled.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
