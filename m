Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E73D034CD
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D5610E73E;
	Thu,  8 Jan 2026 14:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XRWhHE5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C9110E73D;
 Thu,  8 Jan 2026 14:22:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E461E60131;
 Thu,  8 Jan 2026 14:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A617AC116C6;
 Thu,  8 Jan 2026 14:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767882128;
 bh=tKu8wkafqE/pA3rwnLcxiFY9F8b5UhRYf0wNzWuzPpM=;
 h=From:Subject:Date:To:Cc:From;
 b=XRWhHE5AUko/ik131W3SeengvwvCPMdMs1jCIqvovh1DDZpDyI10Fd5l9Uf1SBppF
 bN0hNTika5p0V9AusPCDKzOIQYfqxMxubGr5O+/NN4+v7l0oM1a3fi7j6uS5AXTU3l
 vR6h5FrpElEKxLX9GOZhzdRJC4mnRxe4rqcAYsQGSjMLMPHOfdGjXPyepO+pKnVQa7
 vE+WoWV1Nk2jdIdgiWCKlJJXBEaofc32GqqBxWe34/cMBULKjuSZv0a+GBCVQyxOAB
 Olm7LT1i2xklj8Jtn9OWNTgddekfBaf3UI9m0sdsx2JlsYf9rYoV+JFzKKKIxMtbQE
 5SCsvCtM8hm3g==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v3 0/3] Retrieve information about DDR from SMEM
Date: Thu, 08 Jan 2026 15:21:49 +0100
Message-Id: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH29X2kC/33N0QrCIBSA4VcZXudQp27rqveICFFrQs7lWVIM3
 z23qy5GNwf+A+c7CwIbnQV0rBYUbXLgwliiOVRID2q8W+xMacQIE4STHs9hchqDt/5qovIaSy5
 b2rVKd1KgcjZFe3PvjTxfSg8O5hA/24dE1+0fLFFMcM+NIEIbIfrmFADq50s9dPC+LgOtZmI/D
 iU7DiuOscpQwSRvKd9xcs5fSrjRC/8AAAA=
X-Change-ID: 20250409-topic-smem_dramc-6467187ac865
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767882123; l=2277;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=tKu8wkafqE/pA3rwnLcxiFY9F8b5UhRYf0wNzWuzPpM=;
 b=zIWs5L9xG9MfqFbQxITrMz2UL59R32IAFpo0lqHAVUIgRlQROs0ALC6ktTPU59YCI9XuTP1LS
 cPkEEKecVCGCCek0CjjmY/0qUYvQnFJRMjbxYkMLQ6l2TaIJEL/hDX5
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

Patch 3 should really be merged after 1&2

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v3:
- Support v6 and v7 DDRInfo (v7 is used on e.g. Hamoa)
- Handle rare cases of DDRInfo v5 with additional trailing data
- Rebase/adjust to SSoT UBWC
- Expose hbb value in debugfs
- cosmetic changes
- Link to v2: https://lore.kernel.org/r/20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com

Changes in v2:
- Avoid checking for < 0 on unsigned types
- Overwrite Adreno UBWC data to keep the data shared with userspace
  coherent with what's programmed into the hardware
- Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
  branches separately
- Pick up Bjorn's rb on patch 1
- Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com

---
Konrad Dybcio (3):
      soc: qcom: smem: Expose DDR data from SMEM
      soc: qcom: ubwc: Get HBB from SMEM
      drm/msm/adreno: Trust the SSoT UBWC config

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  11 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  82 +------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |   5 -
 drivers/soc/qcom/Makefile               |   3 +-
 drivers/soc/qcom/smem.c                 |  14 +-
 drivers/soc/qcom/smem.h                 |   9 +
 drivers/soc/qcom/smem_dramc.c           | 408 ++++++++++++++++++++++++++++++++
 drivers/soc/qcom/ubwc_config.c          |  69 ++++--
 include/linux/soc/qcom/smem.h           |   4 +
 9 files changed, 485 insertions(+), 120 deletions(-)
---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20250409-topic-smem_dramc-6467187ac865

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

