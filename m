Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA2A6634ED
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 00:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BA810E0BB;
	Mon,  9 Jan 2023 23:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CCC10E0BB;
 Mon,  9 Jan 2023 23:16:10 +0000 (UTC)
Received: from localhost.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5D8883EB5B;
 Tue, 10 Jan 2023 00:16:07 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org
Subject: [PATCH v3] drm/msm/dpu: Disallow unallocated resources to be returned
Date: Tue, 10 Jan 2023 00:15:55 +0100
Message-Id: <20230109231556.344977-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.39.0
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
Cc: Vinod Koul <vkoul@kernel.org>, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Drew Davenport <ddavenport@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the event that the topology requests resources that have not been
created by the system (because they are typically not represented in
dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
blocks, until their allocation/assignment is being sanity-checked in
"drm/msm/dpu: Reject topologies for which no DSC blocks are available")
remain NULL but will still be returned out of
dpu_rm_get_assigned_resources, where the caller expects to get an array
containing num_blks valid pointers (but instead gets these NULLs).

To prevent this from happening, where null-pointer dereferences
typically result in a hard-to-debug platform lockup, num_blks shouldn't
increase past NULL blocks and will print an error and break instead.
After all, max_blks represents the static size of the maximum number of
blocks whereas the actual amount varies per platform.

^1: which can happen after a git rebase ended up moving additions to
_dpu_cfg to a different struct which has the same patch context.

Fixes: bb00a452d6f7 ("drm/msm/dpu: Refactor resource manager")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---

Changes since v2:
- Dropped all 7 other patches that were queued for -next;
- Reworded error message to clarify that the requested resource should
  have already been allocated, rather than sounding like
  dpu_rm_get_assigned_resources is (re)allocating/(re)assigning
  resources here;
- This patch is now (implicitly!) based after "drm/msm/dpu: Reject
  topologies for which no DSC blocks are available", which should make
  it impossible to reach this condition, making it more of a safeguard
  in case of future code changes and/or hidden issues: and is more
  clearly conveyed in the patch message as well.

v2: https://lore.kernel.org/linux-arm-msm/20221221231943.1961117-5-marijn.suijten@somainline.org/

 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 73b3442e7467..7ada957adbbb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -660,6 +660,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 				  blks_size, enc_id);
 			break;
 		}
+		if (!hw_blks[i]) {
+			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
+				  type, enc_id);
+			break;
+		}
 		blks[num_blks++] = hw_blks[i];
 	}
 
-- 
2.39.0

