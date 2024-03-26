Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8270788C64B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC1F10F020;
	Tue, 26 Mar 2024 15:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NikPNzag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A89F10EB82;
 Tue, 26 Mar 2024 15:06:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 74260612BE;
 Tue, 26 Mar 2024 15:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C59C43390;
 Tue, 26 Mar 2024 15:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711465606;
 bh=01R4o89skC9mMhEqK+LcqdaFSJT7bI5I12tQM6+HOi8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NikPNzagaQ+CDSMXqShgXElR3I3yb4Y5dbO540Uu6Vzcmj56Q7TnbPGxjhqYHT0Oq
 0l2t81kChzsS1DS5H1Abv4IMzTMLJZ/wr7pMjF0PiSbDDaqehiU9U05HiTpJ0GtbrU
 HeU0d5eSswKAoq02FnD2IOEE1nAIE7DUvzOViAXlt8ADQvxT/E71pNaIM7PG8X15Xa
 ZkDZs3NGO/6+oyeA6L9UTXl55dmtG+IPg42mn8uL6zE+mY6gDwFJg/3z/U9bIBcLr/
 Bl3mLUuIHxqVAeWXG91h/Qst/rPYkS8J35DFvgLSgxjFW+Te6Nq2owULyKqH4011+s
 fvkwa3CQlC4LA==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 26 Mar 2024 08:11:32 -0700
Subject: [PATCH 4/6] drm/msm/dp: Use function arguments for aux writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-msm-dp-cleanup-v1-4-e775556ecec0@quicinc.com>
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3889;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=OGQGdcYpP/wYyvD9AcFcPxIGkVinB3aiEgxfZBK8ts4=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmAuWi1kOqvXMLrq0dCKxSnv3iMCr1CKkr5hEGk
 EjUkd6kPUKJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZgLlohUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXKlA/+Psn2oZyyM5bfZYqL/17qHfBtGblE4Og7NO0Rr4R
 KDwYmNNRsGGR+kfKzofLIn7LyCpEbWNyvxugh3Z2XLIo8gKAf7o80w4VNP9ladmjT9qIcp80bY6
 yLIb8weLoDiuTG8Jj/EvGgS5aVnZxJrxAI5DozUWPRQo6suRqNcoeljziav9RHNX0dP171fVwTt
 jfXqpfSJHgiBxlbBNu3bQ4tPbCqxUiqBBszLFKzJ5yMY84Ih9V7Eq5SBHjA56tufdxxPpIkzVU1
 NsKw6w12ZfEIYhMOFlJFYFWCD/0fJ3B3aKrNd2le8Hzlb8F5oZupQnETFc9DnOYTu7gxznPrrFs
 6xkRbMyhwxOBx/1drVwUl4Dvs2QP6laK2AzKeQLNR757HAOAZTbgKvNJ528+Mu/Z8sYQmHXQUnj
 v8SIGcxuSqNPQKhnkXUydNj/kha83OtyvMnLXAX4QsEgXLNmgVkMxQ7Nr4ZMHfhWDS6j4Cyjbvl
 3wLFECmNSBK4wTRtLouVbzHHzQ69TsCtwqOXufV36ATfKLr38OfmEeJYaEWlE0PG6Zaxq2iACKX
 gWbDTTKTVdVa+8dn7JJstCY7haXF52xCRQwGle1AWn3usYPixhB1GIoZXpN6VovCBrwo7nMxsnG
 6dJRTaruXIU6WSdLBakNQRKIx7bxceKHtQLSyk8Y/LZg=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
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

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The dp_aux write operations takes the data to be operated on through a
member of struct dp_catalog, rather than as an argument to the function.

No state is maintained other than across the calling of the functions,
so replace this member with a function argument.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     | 9 +++------
 drivers/gpu/drm/msm/dp/dp_catalog.c | 8 ++++----
 drivers/gpu/drm/msm/dp/dp_catalog.h | 5 ++---
 3 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index adbd5a367395..2c8bcc60692a 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -87,8 +87,7 @@ static ssize_t dp_aux_write(struct dp_aux_private *aux,
 		/* index = 0, write */
 		if (i == 0)
 			reg |= DP_AUX_DATA_INDEX_WRITE;
-		aux->catalog->aux_data = reg;
-		dp_catalog_aux_write_data(aux->catalog);
+		dp_catalog_aux_write_data(aux->catalog, reg);
 	}
 
 	dp_catalog_aux_clear_trans(aux->catalog, false);
@@ -106,8 +105,7 @@ static ssize_t dp_aux_write(struct dp_aux_private *aux,
 	}
 
 	reg |= DP_AUX_TRANS_CTRL_GO;
-	aux->catalog->aux_data = reg;
-	dp_catalog_aux_write_trans(aux->catalog);
+	dp_catalog_aux_write_trans(aux->catalog, reg);
 
 	return len;
 }
@@ -145,8 +143,7 @@ static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
 	data = DP_AUX_DATA_INDEX_WRITE; /* INDEX_WRITE */
 	data |= DP_AUX_DATA_READ;  /* read */
 
-	aux->catalog->aux_data = data;
-	dp_catalog_aux_write_data(aux->catalog);
+	dp_catalog_aux_write_data(aux->catalog, data);
 
 	dp = msg->buffer;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 55114a6aba7e..295bd4cb72cc 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -169,21 +169,21 @@ u32 dp_catalog_aux_read_data(struct dp_catalog *dp_catalog)
 	return dp_read_aux(catalog, REG_DP_AUX_DATA);
 }
 
-int dp_catalog_aux_write_data(struct dp_catalog *dp_catalog)
+int dp_catalog_aux_write_data(struct dp_catalog *dp_catalog, u32 data)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
-	dp_write_aux(catalog, REG_DP_AUX_DATA, dp_catalog->aux_data);
+	dp_write_aux(catalog, REG_DP_AUX_DATA, data);
 	return 0;
 }
 
-int dp_catalog_aux_write_trans(struct dp_catalog *dp_catalog)
+int dp_catalog_aux_write_trans(struct dp_catalog *dp_catalog, u32 data)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
-	dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, dp_catalog->aux_data);
+	dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, data);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 2c2dbeee7634..290ef8180c12 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -48,7 +48,6 @@ enum dp_catalog_audio_header_type {
 };
 
 struct dp_catalog {
-	u32 aux_data;
 	u32 total;
 	u32 sync_start;
 	u32 width_blanking;
@@ -64,8 +63,8 @@ void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *d
 
 /* AUX APIs */
 u32 dp_catalog_aux_read_data(struct dp_catalog *dp_catalog);
-int dp_catalog_aux_write_data(struct dp_catalog *dp_catalog);
-int dp_catalog_aux_write_trans(struct dp_catalog *dp_catalog);
+int dp_catalog_aux_write_data(struct dp_catalog *dp_catalog, u32 data);
+int dp_catalog_aux_write_trans(struct dp_catalog *dp_catalog, u32 data);
 int dp_catalog_aux_clear_trans(struct dp_catalog *dp_catalog, bool read);
 int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);

-- 
2.43.0

