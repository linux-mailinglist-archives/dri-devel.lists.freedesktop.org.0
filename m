Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBDBA84B5A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 19:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107A310E367;
	Thu, 10 Apr 2025 17:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OSkZG0aC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C99110E00D;
 Thu, 10 Apr 2025 17:44:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B9F8BA4A9AF;
 Thu, 10 Apr 2025 17:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9EFC4CEDD;
 Thu, 10 Apr 2025 17:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744307040;
 bh=kB4QNAAppV15ZuP1LMhUMLMfHgT1XEDI5J57Qvqk9A8=;
 h=From:Subject:Date:To:Cc:From;
 b=OSkZG0aCy0I7g5gf1twPji37giaipM088tZEfTjoFny+B0LYPsbVztsbV0F9F5DSd
 D5lk0mw0q5jZzTf3dpBDE1M8L8E83Gba9uphMR9Uyhl/9u/aXQ7qxwovfKQsn+AbPB
 XVTjDNulTuWjxieSeEWlH/+sRkHtGzhosXGjl3thGc6sh0ERaqq9R3Zdf7XMHTw50k
 Jtc8rTM2KV6C0WdPkVPywC1X8TJi3+3EcANhV3URyOKLMgGlvB8cIdTBo61a5ASGjy
 mIAu8dCFFf0NhWHbMPvBZ/a57fuFeuRSsKHEqd1BTFaI1bBcFiO0R4CVqP78GjMf/T
 /60bFJ0CXWLgg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/4] Retrieve information about DDR from SMEM
Date: Thu, 10 Apr 2025 19:43:43 +0200
Message-Id: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE8D+GcC/32NQQrCMBREr1L+2pQ0JmnryntIkZBE+8E0Nb8Wp
 eTuxh7AzcAbmDcbkE/oCU7VBsmvSBinAuJQgR3NdPcMXWEQXCguec+WOKNlFHy4umSCZVrqtul
 aYzutoMzm5G/43pWXofCItMT02R/W5tf+ka0N46yXTnFlnVL98RyJ6ufLPGwMoS4BQ875C7CDb
 Uq3AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744307035; l=1906;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=kB4QNAAppV15ZuP1LMhUMLMfHgT1XEDI5J57Qvqk9A8=;
 b=dDP9gtMOHaECK+JRgwCAtY61jI74F1uXdY6VRPGOdFHzueFljuQ3VrToIXKhq0JJn7Qv/FAUv
 9xSsC+fBPIxCQe4dPn1/PeaxaPg6VtMxkeUqtDQjDWv87aGoo5kcOFL
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
Changes in v2:
- Avoid checking for < 0 on unsigned types
- Overwrite Adreno UBWC data to keep the data shared with userspace
  coherent with what's programmed into the hardware
- Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
  branches separately
- Pick up Bjorn's rb on patch 1
- Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com

---
Konrad Dybcio (4):
      soc: qcom: Expose DDR data from SMEM
      drm/msm/a5xx: Get HBB dynamically, if available
      drm/msm/a6xx: Get HBB dynamically, if available
      drm/msm/mdss: Get HBB dynamically, if available

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  15 +-
 drivers/gpu/drm/msm/msm_mdss.c        |  30 ++--
 drivers/soc/qcom/Makefile             |   3 +-
 drivers/soc/qcom/smem.c               |  14 +-
 drivers/soc/qcom/smem.h               |   9 ++
 drivers/soc/qcom/smem_dramc.c         | 287 ++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/smem.h         |   4 +
 8 files changed, 360 insertions(+), 14 deletions(-)
---
base-commit: 46086739de22d72319e37c37a134d32db52e1c5c
change-id: 20250409-topic-smem_dramc-6467187ac865

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

