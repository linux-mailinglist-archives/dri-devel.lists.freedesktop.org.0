Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2180FCE82A0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 21:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3623710E6E5;
	Mon, 29 Dec 2025 20:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WaUDKhY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9E910E240;
 Mon, 29 Dec 2025 20:47:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1B2BB6000A;
 Mon, 29 Dec 2025 20:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6529C4CEF7;
 Mon, 29 Dec 2025 20:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767041267;
 bh=cZ1YMjEQdtWm1h+Qj/+oWufM5Kr5tCMOqx9g54cvDbY=;
 h=From:Subject:Date:To:Cc:From;
 b=WaUDKhY+qdY9x+/OLvwRyFr0hW/B2lP7hhNOtCnux5d0vFF25f5zSz/0WsS+/TGYS
 H4S8KHv6BbTQngvUmUijGuleInueak2Pt5XOGf4NcMUv9pkdLuFt4s+qsvo5UVju6b
 s+jXZqYrFi3ELY+aZOtqfhPJYMAnqUoYwqzuJKRaicSpdqIbYiKVGQ1Cl0iKOrQqZL
 Wnu/GlSVXAM2tcRLpBjfGm1gPYlz2pgq/570cFwW01Jhl5rm47quRQbES4IW1KYNcw
 3oLMIVMMzcvGjUCgXiYMATOqep7Vch0ib2t22CAVVt+YD/GLjgW3uE+u62EwaRZZTM
 2pridrhK2TAWA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [RFT PATCH 0/3] Add missing CX_MEM/DBGC GPU regions for SM6115/QCM2290
Date: Mon, 29 Dec 2025 21:47:38 +0100
Message-Id: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOroUmkC/x3MQQqAIBBA0avErBN0wLKuEiGlk82mRCuC6O5Jy
 7f4/4FMiSlDXz2Q6OLM+1ag6grcOm2BBPtiQIlaIXbi2CM70SilbaG0IZ7Wz8GJtjOIDeKsjYe
 Sx0QL3/96GN/3AzVpBylqAAAA
X-Change-ID: 20251229-topic-6115_2290_gpu_dbgc-79822622b58d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767041261; l=861;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=cZ1YMjEQdtWm1h+Qj/+oWufM5Kr5tCMOqx9g54cvDbY=;
 b=sOYNqtWr/LOe1ZrHy6LYfEhDMAbaCDc9C1+BkopyGK45Ous2LLAYszjqQfoBvkO7HQFXGxzUB
 ueAmn3t1YZwAG9v6/FnsUzLe5F35mZFpyd4mkNs+hX4T/sWHz8A0lsV
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

These regions were previously left undescribed, fix that.

Compile-tested only, the driver shouldn't break though.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: display/msm/gpu: Straighten out reg-names on A619L/610/702
      arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU regions
      arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions

 Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ------
 arch/arm64/boot/dts/qcom/agatti.dtsi                   | 8 ++++++--
 arch/arm64/boot/dts/qcom/sm6115.dtsi                   | 8 ++++++--
 3 files changed, 12 insertions(+), 10 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251229-topic-6115_2290_gpu_dbgc-79822622b58d

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

