Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60599A2E0ED
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 22:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBDE10E097;
	Sun,  9 Feb 2025 21:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C8C10E09F;
 Sun,  9 Feb 2025 21:43:06 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D953F20189;
 Sun,  9 Feb 2025 22:42:58 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 0/3] drm/msm: Initial fixes for DUALPIPE (+DSC) topology
Date: Sun, 09 Feb 2025 22:42:51 +0100
Message-Id: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFshqWcC/42Py26DMBBFfwV53als4wegqup/VFkYPCQjYUxtQ
 I2i/Hsdom666m7ujHTO3BvLmAgz66obS7hTpjiXIF8qNlzcfEYgXzKTXCquhAGfAoQcgGZayU3
 gNzcttCD4PMBI35ihHrkVuud1PypWQEvC41A4n6eSL5TXmK6HcxeP7S/e/ge/C+BgG4c1YutMa
 z9yDI7miWZ8jenMTvenNOHXVgqtTzMLmLM7CnXVWxFqLqQEv2wghIA1LnGK5yvsEgRorrHVrVF
 ubP/g3x+VepcRhhgCrV2FXjde8BqNd0I7peQ4NlYb27SNNY0famdMGctj9x+nBKsXcQEAAA==
X-Change-ID: 20240416-drm-msm-initial-dualpipe-dsc-fixes-3f0715b03bf4
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2983;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=7iQeAa2scXE3ZIzMVva1f79wDDea0/qP7onDXsbm9Ps=;
 b=owEBbQKS/ZANAwAIAfFi0jHH5IZ2AcsmYgBnqSFdxu2CR2ze+AQ7M195h1/C/TpArGiTkE2pB
 woHN0p+LPaJAjMEAAEIAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCZ6khXQAKCRDxYtIxx+SG
 djrjEACKVj6FsoZsvRDiP8kpL5aey9nLdXbume5bJujSMGoMrm5WLXIa0+cm62lhoK5dWgIFNFM
 wrlNlO/AgnUBeEJmJdhOvrusqHqtXrWLKZ/lZczSg8fi/adZtZ4io7xNOMGxU0SPYtvvE3MsKvu
 DLBDgDOIx7ZQkpodHayG9hc2xD/4kV6IjL4edgAX/0EDRIqUXAn3e4jSzLHLYM5Q2RaIMr27Bxl
 T7kjs6ydiE0W0wUslcH6rcRPtRpb8hvQ0XZY6DG7/Z5xYpcIjjWBLg26v5LHP0QJHkj/oFqp4jD
 /VcEFkfDR/VRaW6WLDqBCEIEs3pUFMRZr7cqcDcsTxPA/y+MoKw5vdAf2Nj+74xZIXCX5Z06Ho+
 +HS49UV4RMBsZmDVJlhy5QTxXx0oZV9WFHjRpCqsyAr4esYXoDs20I2Bcgd7fwYa4Ym3IRWuxZt
 u3d/r/46qnMRnV8gGu3jv2lMBPoanK60MlXBoMdiGJjhkFpQkvxQ7AYuaGHOUviGW5MNmIG5SpO
 yQcXBsn7YgCPIoAAza7T0xyrGCW18YzqKt9xnDQI7VeKyCePRakAnTLfzQBkOHuao4G1Y7XzeCF
 Hxnx8rjk9+4mP2VF9qRF1+kMKQDk1JoZ0FJKM8+7yRr1d3bgRBIiKeBQtRdnZ6u6mpUGYXkN3QO
 dCE8rGMo3tNbV7A==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676
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

This series covers a step-up towards supporting the DUALPIPE DSC
topology, also known as 2:2:2 topology (on active-CTL hardware).  It
involves 2 layer mixers, 2 DSC compression encoders, and 2 interfaces
(on DSI, this is called bonded-DSI) where bandwidth constraints (e.g. 4k
panels at 120Hz) require two interfaces to transmit pixel data.

Enabling this topology will be hard(er) than downstream as hacking a
layout type in DTS won't be describing the hardware, but "dynamically"
determining it at runtime may pose some of a challenge that is left to a
future series.  Such changes will also involve the 1:1:1 topology needed
for constrained hardware like the Fairphone 5 on SC7280 with access to
only one DSC encoder and thus ruled out of the current 2:2:1 topology.

Likewise, the patches and discussions around improving active-CTL
configuration to support bonded interfaces (that share a single CTL
block) are still in full swing and hence elided from this series, apart
from one patch to fix the ACTIVE_DSC register coding to support updates,
so that it is not forgotten about.

This issue and successful resolution of all the problems is discussed
and demonstrated in https://gitlab.freedesktop.org/drm/msm/-/issues/41.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
Changes in v2:
- Dropped patches that were applied;
- dsi_mgr_setup_components() now sets both the usecase and phy_mode
  prior to calling msm_dsi_host_register(), and for non-bonded too;
- Added patch to remove a forced num_intf = 1 when DSC is enabled;
- Reworked hdisplay/2 "fix" when calculating "DSC timing" to instead use
  dsc->slice_count, allowing us to remove msm_dsc_get_slices_per_intf()
  entirely;
- Link to v1: https://lore.kernel.org/r/20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org

Depends on:
- https://lore.kernel.org/linux-arm-msm/20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org/
  (only to prevent conflicts with the patch that removes a hardcoded
   num_intf = 1;).

---
Marijn Suijten (3):
      drm/msm/dsi: Use existing per-interface slice count in DSC timing
      drm/msm/dsi: Set PHY usescase (and mode) before registering DSI host
      drm/msm/dpu: Remove arbitrary limit of 1 interface in DSC topology

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  7 ++++---
 drivers/gpu/drm/msm/dsi/dsi_host.c          |  8 ++++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c       | 30 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_dsc_helper.h        | 11 -----------
 4 files changed, 27 insertions(+), 29 deletions(-)
---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20240416-drm-msm-initial-dualpipe-dsc-fixes-3f0715b03bf4
prerequisite-message-id: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
prerequisite-patch-id: 9ed44ae089b173f452a6603e6739b0b3bf2d9274

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

