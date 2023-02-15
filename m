Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A241E698884
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 00:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C7A10EC8C;
	Wed, 15 Feb 2023 23:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F3610EC86
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 23:02:32 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7D2B81F544;
 Thu, 16 Feb 2023 00:02:24 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 0/3] drm/msm/dpu: Initialize SSPP scaler version (from
 register read)
Date: Thu, 16 Feb 2023 00:02:22 +0100
Message-Id: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH9k7WMC/x2NwQrCMBBEf6Xs2YUmElB/RTykcWoXQgy7WAql/
 +7q8c3MY3YyqMDoNuykWMXk3RzCaaCy5PYCy9OZ4hjPYwyJzXpnK7lCeYX+9hyuc/TukkoCuTl
 lA0+aW1ncbZ9aPeyKWbb/1f1xHF+RhmoWegAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Archit Taneja <architt@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
X-Mailer: b4 0.12.1
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Random inspection of the SSPP code surfaced that the version field of
dpu_scaler_blk was never assigned in the catalog, resulting in wrong
codepaths to be taken within dpu_hw_setup_scaler3 based on a 0 version.
Rectify this by reading an accurate value from a register (that is not
equal to the values represented by DPU_SSPP_SCALER_QSEEDx enum
variants) and deleting dead code around QSEED versioning.

Future changes should likely get rid of the distinction between QSEED3
and up, as these are now purely determined from the register value.
Furthermore implementations could look at the scaler subblk .id field
rather than the SSPP feature bits, which currently hold redundant
information.

---
Marijn Suijten (3):
      drm/msm/dpu: Read previously-uninitialized SSPP scaler version from hw
      drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
      drm/msm/dpu: Drop unused qseed_type from catalog dpu_caps

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 12 ++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    |  9 +++------
 4 files changed, 11 insertions(+), 26 deletions(-)
---
base-commit: 9d9019bcea1aac7eed64a1a4966282b6b7b141c8
change-id: 20230215-sspp-scaler-version-19f221585c5e

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

