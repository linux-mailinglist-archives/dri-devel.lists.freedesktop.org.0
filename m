Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F84210491
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71BC6E7DC;
	Wed,  1 Jul 2020 07:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CE46E5C3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 04:27:07 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id z2so17484774qts.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 21:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0wIgs3VKhIuaXHVPWmnow5qLXIDMbpb3CKsGv/tv2Rk=;
 b=fvMTkwlF68FklyfTloViaxEICph/kC2zKCH6JBOpKRAJfLRbgiI9qaQ18FIKeKVtiz
 ff95WfXrYG/YuNqsgmNCwmXASHNY0fdZ9CyOvShO3Wa1sIPTsRv+hBq4sLDia52UUk4N
 V4/3hyKf2UWqBGesZq5Anle8Nwic/sftQD3Pt46sFTW9V87syXv/AwHhjXhbesDR2neJ
 q/W9tHv/qIlcmxQtWUcgEzSrgcZxxopLyK4uncNWGQ/zwIjBAFTdylUWCDA+rbQE+0c9
 LOu3lyF8B4cPY7KiKbGTqSQ2HED35AGoYdlJh0VMWpgzD5GkREYoNfZswzOIEmBDzG7H
 Kwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0wIgs3VKhIuaXHVPWmnow5qLXIDMbpb3CKsGv/tv2Rk=;
 b=GFxZLekwGFRFfO3n2jR2h7pnyM4dQ6nmE7FZ1qd1u7ykI5mKHDpt8wKqPwzs9NNuoZ
 2K12f8b+Ggd2c3tm5XTUHm0T4tohwXL1JfTvJYqfcqSSDBHt0BvMcV7xIce84R5k47dF
 uWT8kJFKzZ8/KPNBrkwkdigMYu2Z8AfwwIX9YBxZ2bB8FjV+P0RD3hZoy/OeHRHAShYY
 cBfV1OWdmU9pxqc/x1By9yN90Zm6PJFWut1qifwPue0Z6JKANSnWsPhHEsrApB7NpLTZ
 nHcfStQcehh1Tgc+uatg/VP1ahOYfRHsvvVeoYkWrawoGpCx1oo/pMyw46rGCRkVE4Nx
 iWfg==
X-Gm-Message-State: AOAM531h3uqPBXKZlO0jR82Jfmm03XKRDi73BrBOZffvOJfHWkTkGIOa
 K/fncyXuN+X79JgWplx8VSXbsQ==
X-Google-Smtp-Source: ABdhPJzgIuK/4NY14D4tI2IOCwMzUL2HpMoesgwdny5dP+EQJUm13F7z14AXMpnBiliTjyAcrD+F0Q==
X-Received: by 2002:aed:3904:: with SMTP id l4mr20927805qte.370.1593577626394; 
 Tue, 30 Jun 2020 21:27:06 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id 195sm4816483qkl.37.2020.06.30.21.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 21:27:05 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH] interconnect: qcom: add functions to query addr/cmds for
 a path
Date: Wed,  1 Jul 2020 00:25:25 -0400
Message-Id: <20200701042528.12321-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, kbuild test robot <lkp@intel.com>,
 "open list:INTERCONNECT API" <linux-pm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <sean@poorly.run>, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The a6xx GMU can vote for ddr and cnoc bandwidth, but it needs to be able
to query the interconnect driver for bcm addresses and commands.

I'm not sure what is the best way to go about implementing this, this is
what I came up with.

I included a quick example of how this can be used by the a6xx driver to
fill out the GMU bw_table (two ddr bandwidth levels in this example, note
this would be using the frequency table in dts and not hardcoded values).

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 20 ++++-------
 drivers/interconnect/qcom/icc-rpmh.c  | 50 +++++++++++++++++++++++++++
 include/soc/qcom/icc.h                | 11 ++++++
 3 files changed, 68 insertions(+), 13 deletions(-)
 create mode 100644 include/soc/qcom/icc.h

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index ccd44d0418f8..1fb8f0480be3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -4,6 +4,7 @@
 #include <linux/completion.h>
 #include <linux/circ_buf.h>
 #include <linux/list.h>
+#include <soc/qcom/icc.h>
 
 #include "a6xx_gmu.h"
 #include "a6xx_gmu.xml.h"
@@ -320,24 +321,18 @@ static void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][2] =  0x60000001;
 }
 
-static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg, struct icc_path *path)
 {
 	/*
 	 * Send a single "off" entry just to get things running
 	 * TODO: bus scaling
 	 */
-	msg->bw_level_num = 1;
-
-	msg->ddr_cmds_num = 3;
+	msg->bw_level_num = 2;
 	msg->ddr_wait_bitmask = 0x01;
 
-	msg->ddr_cmds_addrs[0] = 0x50000;
-	msg->ddr_cmds_addrs[1] = 0x50004;
-	msg->ddr_cmds_addrs[2] = 0x5007c;
-
-	msg->ddr_cmds_data[0][0] =  0x40000000;
-	msg->ddr_cmds_data[0][1] =  0x40000000;
-	msg->ddr_cmds_data[0][2] =  0x40000000;
+	msg->ddr_cmds_num = qcom_icc_query_addr(path, msg->ddr_cmds_addrs);
+	qcom_icc_query_cmd(path, msg->ddr_cmds_data[0], 0, 0);
+	qcom_icc_query_cmd(path, msg->ddr_cmds_data[1], 0, 7216000);
 
 	/*
 	 * These are the CX (CNOC) votes - these are used by the GMU but the
@@ -388,7 +383,6 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][2] =  0x60000001;
 }
 
-
 static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_msg_bw_table msg = { 0 };
@@ -400,7 +394,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 	else if (adreno_is_a640(adreno_gpu))
 		a640_build_bw_table(&msg);
 	else if (adreno_is_a650(adreno_gpu))
-		a650_build_bw_table(&msg);
+		a650_build_bw_table(&msg, adreno_gpu->base.icc_path);
 	else
 		a6xx_build_bw_table(&msg);
 
diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index 3ac5182c9ab2..3ce2920330f9 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -9,6 +9,7 @@
 
 #include "bcm-voter.h"
 #include "icc-rpmh.h"
+#include "../internal.h"
 
 /**
  * qcom_icc_pre_aggregate - cleans up stale values from prior icc_set
@@ -92,6 +93,55 @@ int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 }
 EXPORT_SYMBOL_GPL(qcom_icc_set);
 
+static u32 bcm_query(struct qcom_icc_bcm *bcm, u64 sum_avg, u64 max_peak)
+{
+	u64 temp, agg_peak = 0;
+	int i;
+
+	for (i = 0; i < bcm->num_nodes; i++) {
+		temp = max_peak * bcm->aux_data.width;
+		do_div(temp, bcm->nodes[i]->buswidth);
+		agg_peak = max(agg_peak, temp);
+	}
+
+	temp = agg_peak * 1000ULL;
+	do_div(temp, bcm->aux_data.unit);
+
+	// TODO vote_x
+
+	return BCM_TCS_CMD(true, temp != 0, 0, temp);
+}
+
+int qcom_icc_query_addr(struct icc_path *path, u32 *addr)
+{
+	struct qcom_icc_node *qn;
+	int i, j, k = 0;
+
+	for (i = 0; i < path->num_nodes; i++) {
+		qn = path->reqs[i].node->data;
+		for (j = 0; j < qn->num_bcms; j++, k++)
+			addr[k] = qn->bcms[j]->addr;
+	}
+
+	return k;
+}
+EXPORT_SYMBOL_GPL(qcom_icc_query_addr);
+
+int qcom_icc_query_cmd(struct icc_path *path, u32 *cmd, u64 avg, u64 max)
+{
+	struct qcom_icc_node *qn;
+	int i, j, k = 0;
+
+	for (i = 0; i < path->num_nodes; i++) {
+		qn = path->reqs[i].node->data;
+		for (j = 0; j < qn->num_bcms; j++, k++)
+			cmd[k] = bcm_query(qn->bcms[j], avg, max);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_icc_query_cmd);
+
 /**
  * qcom_icc_bcm_init - populates bcm aux data and connect qnodes
  * @bcm: bcm to be initialized
diff --git a/include/soc/qcom/icc.h b/include/soc/qcom/icc.h
new file mode 100644
index 000000000000..8d0ddde49739
--- /dev/null
+++ b/include/soc/qcom/icc.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_QCOM_ICC_H__
+#define __SOC_QCOM_ICC_H__
+
+#include <linux/interconnect.h>
+
+int qcom_icc_query_addr(struct icc_path *path, u32 *addr);
+int qcom_icc_query_cmd(struct icc_path *path, u32 *cmd, u64 avg, u64 max);
+
+#endif /* __SOC_QCOM_ICC_H__ */
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
