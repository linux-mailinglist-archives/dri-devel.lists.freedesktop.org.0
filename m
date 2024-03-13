Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BDC87AB9D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 17:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D379B10E92D;
	Wed, 13 Mar 2024 16:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tCOqwPWn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0F510E92D;
 Wed, 13 Mar 2024 16:44:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5EA5861491;
 Wed, 13 Mar 2024 16:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAADC433C7;
 Wed, 13 Mar 2024 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710348252;
 bh=VTTFzsvOky8Qg//+bu+HuHKwbeUvi/yDE2Nv0TmQXFA=;
 h=From:To:Cc:Subject:Date:From;
 b=tCOqwPWnVDgFqUw57rmRyoo3rHLoHwfG3u55CePgkDiSmjYDbAx2fhiVZxkji1HC4
 CYdEaDIRvXg1oaynhHYPzkG54TYgWvpHxOgaXYnzxN/NDmlPQs5LzPlWOfPx0zeVF4
 kW/aaP6eVMI665RHYe+rlbiAY7zcw+cw8EpKw55H1Qn34yPAkt5UWz8mu8ygRI6mYS
 sWMHnjAmL221X2fHAVCTs5yunVrHfwVKKQCeIT26y0KT1DcNYC19+Su3C+eVil/1Ec
 +aAnqWlBAk0ZGZqOwwRkSrMzBWNtXKdbIA8Zq3Ow9Tu9LZvO0gFERwvPZ2m8/C26gx
 C0C1BD5Xd3eEw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan+linaro@kernel.org>) id 1rkRiF-00000000629-17bo;
 Wed, 13 Mar 2024 17:44:19 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] drm/msm/dp: fix runtime PM leaks on hotplug
Date: Wed, 13 Mar 2024 17:43:04 +0100
Message-ID: <20240313164306.23133-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

As I've reported elsewhere, I've been hitting runtime PM usage count
leaks when investigated a DisplayPort hotplug regression on the Lenovo
ThinkPad X13s. [1]

This series addresses two obvious leaks on disconnect and on connect
failures, respectively.

Johan


[1] https://lore.kernel.org/lkml/Ze8Ke_M2xHyPYCu-@hovoldconsulting.com/


Johan Hovold (2):
  drm/msm/dp: fix runtime PM leak on disconnect
  drm/msm/dp: fix runtime PM leak on connect failure

 drivers/gpu/drm/msm/dp/dp_display.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.43.2

