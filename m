Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B85AB013FC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 09:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E7D10E264;
	Fri, 11 Jul 2025 07:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ozfb4Ymi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2321310E264;
 Fri, 11 Jul 2025 07:04:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EF82F611BD;
 Fri, 11 Jul 2025 07:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7B7C4CEEF;
 Fri, 11 Jul 2025 07:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752217463;
 bh=uK5/A21fH/ybXkIrVUNquGOGWtk5qo5hMSx0pRcrghQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ozfb4Ymiyjz9klNEQNJ7+XMATYrXDol/mZYRFbfu5CreWryhHBADzdHTjmGWT6pCI
 2LI8Hg3YRs0dd48sDHV7Eivso+OTPLMGaTu1Xav9SaYjTT9eRvxnnxhOL1kS6k7eTQ
 bXrKPl8f85Qk1zPAVj+UGD9+AU58t3/QWCmFB06enVeBKPHHaplP5gj24nlTkj0deB
 Iopp5WPNP9nBuHVUExF+gSTKayUaynoxmromiXtiwoLlEmTz0YeOmQC4EfcF9HVpeZ
 ex81Qyb0Ajht4BpSAF2dNL7n5bqyR5EY+VeBDQjOBjZSiSFHbzueV2hpjJqv5B0JRX
 AsYgFP/435ZLg==
Message-ID: <1513c2dd4793403c32ccbbef4b5774e3@kernel.org>
Date: Fri, 11 Jul 2025 07:04:21 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH 8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert from
 round_rate() to determine_rate()
In-Reply-To: <20250710-drm-clk-round-rate-v1-8-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-8-601b9ea384c3@redhat.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, "Abhinav Kumar" <abhinav.kumar@linux.dev>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Chen-Yu
 Tsai" <wens@csie.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Fabio Estevam" <festevam@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>,
 "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>, "Linus
 Walleij" <linus.walleij@linaro.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Philippe Cornu" <philippe.cornu@foss.st.com>,
 "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>,
 "Rob Clark" <robin.clark@oss.qualcomm.com>, "Samuel
 Holland" <samuel@sholland.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Sean
 Paul" <sean@poorly.run>, "Shawn Guo" <shawnguo@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Stephen
 Boyd" <sboyd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Yannick
 Fertre" <yannick.fertre@foss.st.com>
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

On Thu, 10 Jul 2025 13:43:09 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
