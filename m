Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E52F87CDAD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 14:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D405E10E116;
	Fri, 15 Mar 2024 13:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hIeK3IEB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61D910E116
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 13:04:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D9107616F7;
 Fri, 15 Mar 2024 13:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36CBC433C7;
 Fri, 15 Mar 2024 13:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710507896;
 bh=DvGI8Ea9CrQMc930SjFSluQ/GjUlhlbAS/EJEnqtjTo=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=hIeK3IEBIb6JAM9AZ/wvuH6aNzZGxylrAJRiLiGcHiZgEKx/uWiC6SEEmPlwCYvAD
 AZ4C87I2Tz0Mt6ogAzjumauuMWCfhHbASjxypGuMU0JASw/XmAWsL40XfnF6EEgYFB
 YEBwL5TE0M5q84QeAWr7NWx4Phe5gaLIjHcVab5MG4PdAGwf+DtQj9ePiKDlE1SAtr
 WTCn286Jg1O5nmqXSf/V0bNXrLw0wtE22iPRU+buqFbD11TdhNmeFmyM2uaBMIAiNu
 vK4okWTZPWdolle9rIQF8GEzzmSA/YLGZohUJPn9WJ86Kqc92s1oEEIsNnd1FfA3oQ
 BfPpmKmlQVz4w==
Message-ID: <c3dbb1f483849c7ee6f61223514e5d16@kernel.org>
Date: Fri, 15 Mar 2024 13:04:53 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH v4 1/5] clk: sunxi-ng: common: Support minimum and
 maximum rate
In-Reply-To: <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
References: <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 stable@vger.kernel.org, "Chen-Yu
 Tsai" <wens@csie.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, =?utf-8?b?R3VpZG8gR8O8bnRoZXI=?= <agx@sigxcpu.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Ondrej Jirman" <megi@xff.cz>, "Purism
 Kernel Team" <kernel@puri.sm>, "Rob Herring" <robh+dt@kernel.org>, "Sam
 Ravnborg" <sam@ravnborg.org>, "Samuel Holland" <samuel@sholland.org>, "Stephen
 Boyd" <sboyd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Sun, 10 Mar 2024 14:21:11 +0100, Frank Oltmanns wrote:
> The Allwinner SoC's typically have an upper and lower limit for their
> clocks' rates. Up until now, support for that has been implemented
> separately for each clock type.
> 
> Implement that functionality in the sunxi-ng's common part making use of
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
