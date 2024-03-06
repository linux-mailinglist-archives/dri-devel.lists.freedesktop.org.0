Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DEF873DB8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 18:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64C91133A8;
	Wed,  6 Mar 2024 17:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GjdImPow";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766B01133A3;
 Wed,  6 Mar 2024 17:47:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 445A7CE22D5;
 Wed,  6 Mar 2024 17:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58894C433C7;
 Wed,  6 Mar 2024 17:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709747239;
 bh=M3Qnc0kB0MnG72TbxAy6mHm1CxTe6WFO/XsmSNzWFVw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GjdImPowRYEm7/pn8xhSYm8k0V/sHqvsew0j9xUc57MReIzjVdqeWmCsWzYmlMySF
 CfBySFrHga5H2Qf6vt/zyUDw8zd8d0Ohh5YXjI8GhdHCMIQ3nvLP4W937LbOdHqNPG
 Z14JCvmc7QSTew/N6rNuK+331Zh62FjZoJBbqaFj6yExTn2Umgykb57TjpErB2h/x7
 0kUTvb0Yk4tZ1IN2ZWJNOLBO1oIlUfGBLwbJutYSPZDKX5cpp7bD54VlSzDZard27D
 EbABchSyftcWpB2WAWozeCp7rVKXdTktq08MkNwYfrRuvWMGYRK93YDuBboviG3f2c
 zWvA0oEYqASXw==
From: Vinod Koul <vkoul@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Johan Hovold <johan+linaro@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20240217150228.5788-1-johan+linaro@kernel.org>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
Subject: Re: (subset) [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm
 bridge use-after-free
Message-Id: <170974723198.898356.8197875205136329255.b4-ty@kernel.org>
Date: Wed, 06 Mar 2024 23:17:11 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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


On Sat, 17 Feb 2024 16:02:22 +0100, Johan Hovold wrote:
> Starting with 6.8-rc1 the internal display sometimes fails to come up on
> machines like the Lenovo ThinkPad X13s and the logs indicate that this
> is due to a regression in the DRM subsystem [1].
> 
> This series fixes a race in the pmic_glink_altmode driver which was
> exposed / triggered by the transparent DRM bridges rework that went into
> 6.8-rc1 and that manifested itself as a bridge failing to attach and
> sometimes triggering a NULL-pointer dereference.
> 
> [...]

Applied, thanks!

[5/6] phy: qcom-qmp-combo: fix drm bridge registration
      commit: d2d7b8e88023b75320662c2305d61779ff060950
[6/6] phy: qcom-qmp-combo: fix type-c switch registration
      commit: 47b412c1ea77112f1148b4edd71700a388c7c80f

Best regards,
-- 
~Vinod


