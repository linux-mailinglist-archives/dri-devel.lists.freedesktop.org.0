Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C943D34DD39
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 02:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B7D6E5BB;
	Tue, 30 Mar 2021 00:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC6D6E5BB;
 Tue, 30 Mar 2021 00:49:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C9D5C6024A;
 Tue, 30 Mar 2021 00:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617065366;
 bh=1AEhlMQR7Kcjy4rHT+iMsNAQIfcij05kfYf7xqfywJU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=lyWNyVKNAZNH9fBOvHYF5AapC5C5QMCivVQUUg82j1WKyEIDl0fVFX2iV+zoH6OGx
 JjBaU/EhWoTIV6unM5YEcdv7WFeOeYENVEcuMpm6Mq949uxXi37TN7BvfXFETUpgJf
 g2iXOhDQpxqeqLzpaE7Rf6qrU1e2xnKGVBfk/phe5de516ZX/U+bpG5jlx94ZhI6gY
 t4/hx546rNQ0AzhkiGeBgRN+dphdQJ4e+STi/6uDoKzxQIn1BiWBq5yOnpo/VB+2WA
 bPmiKR+nSwCC8Me1H07vsAQvH81dtHNS/6qnTdBGQA21zGiwLi3ABNFRbHN5Q4YOa8
 iYIfD6HoGu9eQ==
MIME-Version: 1.0
In-Reply-To: <20210327110305.3289784-13-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-13-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 12/25] drm/msm/dsi: use devm_clk_*register to registe
 DSI PHY clocks
From: Stephen Boyd <sboyd@kernel.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Date: Mon, 29 Mar 2021 17:49:25 -0700
Message-ID: <161706536549.3012082.7354929654800829210@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Subject should say register instead of registe

Quoting Dmitry Baryshkov (2021-03-27 04:02:52)
> Use devres-enabled version of clock registration functions. This lets us
> remove dsi_pll destroy callbacks completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h                 |  4 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 84 ++++---------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 35 +-------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 50 +++++------
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 39 +++------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 84 ++++---------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         | 17 ----
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |  4 -
>  10 files changed, 71 insertions(+), 249 deletions(-)

Awesome diffstat!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
