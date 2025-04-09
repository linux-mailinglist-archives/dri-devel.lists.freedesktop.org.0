Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E5CA82882
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 16:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576F810E918;
	Wed,  9 Apr 2025 14:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GvQkpW4P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C89F10E918;
 Wed,  9 Apr 2025 14:47:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 16F335C4AE7;
 Wed,  9 Apr 2025 14:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FFDC4CEEE;
 Wed,  9 Apr 2025 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744210067;
 bh=ji/0WKfDuZz1CAwKz/ZybtrsgX+mKgql4YfuRrLSe7Y=;
 h=From:Subject:Date:To:Cc:From;
 b=GvQkpW4PiR9zdWlVmXMb8UJq/yUM2yfBHZt8BZPf+RUR7dZsKEpl3GYehJDgky3+J
 xb8H12Sva8VoEITNYWFXcC0yGKfzvqElvqGjTSirNF+2wYjo6BkiZ3ZI+ffnRC+3ZC
 ZA1wQ8pP3f6kf06AnYv+GtzM6enrIpLk4Cncv4XiLy8iQkD9oNfMKPfTzYUU8HmCkQ
 JM1eFsZDZe50iF/yg+3II6wtYqumMelSWi2a7n4eQELLlS/cnWY11yhMpe4QSBi17s
 D5OpgmQ3dpFuxllD+JyRuBfJQXmD7p41AXzPqKsVmQIvaNoNs9c0sYKLWkIOQzlZl2
 j7kq4XWjz5Z/w==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/4] Retrieve information about DDR from SMEM
Date: Wed, 09 Apr 2025 16:47:28 +0200
Message-Id: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAICI9mcC/x3MTQqAIBBA4avErBM08qeuEhGiU81CC40IpLsnL
 b/FewUyJsIMY1Mg4U2Zjlgh2gbcbuOGjHw1dLyTvOcDu46THMsBw+KTDY6pXmlhtHVGSajZmXC
 l519O8/t+whgWzGIAAAA=
X-Change-ID: 20250409-topic-smem_dramc-6467187ac865
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744210063; l=1496;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ji/0WKfDuZz1CAwKz/ZybtrsgX+mKgql4YfuRrLSe7Y=;
 b=c7R7yPcUkBHQOwE2hoz8t4W9GhNYc/PRxrBiB9Sed6VzU1zJIsUk4Bac4G98pCP0PWDrOwngA
 Jk8deOjsENpB6u0YyU9/D/sMvd0Z4mEGOB42gNYtc5hN+u4/wJyoz61
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

SMEM allows the OS to retrieve information about the DDR memory.
Among that information, is a semi-magic value called 'HBB', or Highest
Bank address Bit, which multimedia drivers (for hardware like Adreno
and MDSS) must retrieve in order to program the IP blocks correctly.

This series introduces an API to retrieve that value, uses it in the
aforementioned programming sequences and exposes available DDR
frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
information can be exposed in the future, as needed.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (4):
      soc: qcom: Expose DDR data from SMEM
      drm/msm/a5xx: Get HBB dynamically, if available
      drm/msm/a6xx: Get HBB dynamically, if available
      drm/msm/mdss: Get HBB dynamically, if available

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  13 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  22 ++-
 drivers/gpu/drm/msm/msm_mdss.c        |  35 ++++-
 drivers/soc/qcom/Makefile             |   3 +-
 drivers/soc/qcom/smem.c               |  14 +-
 drivers/soc/qcom/smem.h               |   9 ++
 drivers/soc/qcom/smem_dramc.c         | 287 ++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/smem.h         |   4 +
 8 files changed, 371 insertions(+), 16 deletions(-)
---
base-commit: 46086739de22d72319e37c37a134d32db52e1c5c
change-id: 20250409-topic-smem_dramc-6467187ac865

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

