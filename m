Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CFB528023
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 10:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A38110E25A;
	Mon, 16 May 2022 08:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03F910F3CF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 08:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GN36Sq29tndBQ4PitufvQoYicK+sGcL7xxa4gTV6Sco=; b=qbibZvciFI4PN8ZmuQN7Pa6bfO
 ACytLQGtllE6kQ25qPv4RT5tdDWPkd5slNmO2ph6Xz81k/WKDdftbfZjlaLXixHBleBsYdjvktXsG
 r99BVFmnJSnOM91maqJyb/k/VkGi1OVTEumvD3GZibbDuioMOEY7HgWMZz1tqNFtD0zCfA6bOaWLd
 LD+ipJBm4q8kvEBVyhF7Vn9Tr5cKo/YsjjH9eylks9iRfE8NQG06S0yijSfCmzLLVPdqQ7HSTuqmC
 0ctdNohExD3A84dTa3PT4N5v4MmcEFoxvCW3XlpUKRZIUBFyl0SO6fapkIls3OSxEC0nUhcDk/ege
 3B0VA45Q==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <cyndis@kapsi.fi>)
 id 1nqWTe-0005fd-QS; Mon, 16 May 2022 11:53:18 +0300
From: cyndis@kapsi.fi
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com
Subject: [PATCH v5 4/9] gpu: host1x: Program context stream ID on submission
Date: Mon, 16 May 2022 11:52:53 +0300
Message-Id: <20220516085258.1227691-5-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516085258.1227691-1-cyndis@kapsi.fi>
References: <20220516085258.1227691-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add code to do stream ID switching at the beginning of a job. The
stream ID is switched to the stream ID specified by the context
passed in the job structure.

Before switching the stream ID, an OP_DONE wait is done on the
channel's engine to ensure that there is no residual ongoing
work that might do DMA using the new stream ID.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v5:
* Add fallback stream ID. Not used yet, will be needed for
  full featured opcode sequence.
* Rename host1x_context to host1x_memory_context
v4:
* Rename job->context to job->memory_context for clarity
---
 drivers/gpu/host1x/hw/channel_hw.c        | 52 +++++++++++++++++++++--
 drivers/gpu/host1x/hw/host1x06_hardware.h | 10 +++++
 drivers/gpu/host1x/hw/host1x07_hardware.h | 10 +++++
 include/linux/host1x.h                    |  8 ++++
 4 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index 6b40e9af1e88..f84caf06621a 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -180,6 +180,45 @@ static void host1x_enable_gather_filter(struct host1x_channel *ch)
 #endif
 }
 
+static void host1x_channel_program_engine_streamid(struct host1x_job *job)
+{
+#if HOST1X_HW >= 6
+	u32 fence;
+
+	if (!job->memory_context)
+		return;
+
+	fence = host1x_syncpt_incr_max(job->syncpt, 1);
+
+	/* First, increment a syncpoint on OP_DONE condition.. */
+
+	host1x_cdma_push(&job->channel->cdma,
+		host1x_opcode_nonincr(HOST1X_UCLASS_INCR_SYNCPT, 1),
+		HOST1X_UCLASS_INCR_SYNCPT_INDX_F(job->syncpt->id) |
+			HOST1X_UCLASS_INCR_SYNCPT_COND_F(1));
+
+	/* Wait for syncpoint to increment */
+
+	host1x_cdma_push(&job->channel->cdma,
+		host1x_opcode_setclass(HOST1X_CLASS_HOST1X,
+			host1x_uclass_wait_syncpt_r(), 1),
+		host1x_class_host_wait_syncpt(job->syncpt->id, fence));
+
+	/*
+	 * Now that we know the engine is idle, return to class and
+	 * change stream ID.
+	 */
+
+	host1x_cdma_push(&job->channel->cdma,
+		host1x_opcode_setclass(job->class, 0, 0),
+		HOST1X_OPCODE_NOP);
+
+	host1x_cdma_push(&job->channel->cdma,
+		host1x_opcode_setpayload(job->memory_context->stream_id),
+		host1x_opcode_setstreamid(job->engine_streamid_offset / 4));
+#endif
+}
+
 static int channel_submit(struct host1x_job *job)
 {
 	struct host1x_channel *ch = job->channel;
@@ -236,18 +275,23 @@ static int channel_submit(struct host1x_job *job)
 	if (sp->base)
 		synchronize_syncpt_base(job);
 
-	syncval = host1x_syncpt_incr_max(sp, user_syncpt_incrs);
-
 	host1x_hw_syncpt_assign_to_channel(host, sp, ch);
 
-	job->syncpt_end = syncval;
-
 	/* add a setclass for modules that require it */
 	if (job->class)
 		host1x_cdma_push(&ch->cdma,
 				 host1x_opcode_setclass(job->class, 0, 0),
 				 HOST1X_OPCODE_NOP);
 
+	/*
+	 * Ensure engine DMA is idle and set new stream ID. May increment
+	 * syncpt max.
+	 */
+	host1x_channel_program_engine_streamid(job);
+
+	syncval = host1x_syncpt_incr_max(sp, user_syncpt_incrs);
+	job->syncpt_end = syncval;
+
 	submit_gathers(job, syncval - user_syncpt_incrs);
 
 	/* end CDMA submit & stash pinned hMems into sync queue */
diff --git a/drivers/gpu/host1x/hw/host1x06_hardware.h b/drivers/gpu/host1x/hw/host1x06_hardware.h
index 01a142a09800..5d515745eee7 100644
--- a/drivers/gpu/host1x/hw/host1x06_hardware.h
+++ b/drivers/gpu/host1x/hw/host1x06_hardware.h
@@ -127,6 +127,16 @@ static inline u32 host1x_opcode_gather_incr(unsigned offset, unsigned count)
 	return (6 << 28) | (offset << 16) | BIT(15) | BIT(14) | count;
 }
 
+static inline u32 host1x_opcode_setstreamid(unsigned streamid)
+{
+	return (7 << 28) | streamid;
+}
+
+static inline u32 host1x_opcode_setpayload(unsigned payload)
+{
+	return (9 << 28) | payload;
+}
+
 static inline u32 host1x_opcode_gather_wide(unsigned count)
 {
 	return (12 << 28) | count;
diff --git a/drivers/gpu/host1x/hw/host1x07_hardware.h b/drivers/gpu/host1x/hw/host1x07_hardware.h
index e6582172ebfd..82c0cc9bb0b5 100644
--- a/drivers/gpu/host1x/hw/host1x07_hardware.h
+++ b/drivers/gpu/host1x/hw/host1x07_hardware.h
@@ -127,6 +127,16 @@ static inline u32 host1x_opcode_gather_incr(unsigned offset, unsigned count)
 	return (6 << 28) | (offset << 16) | BIT(15) | BIT(14) | count;
 }
 
+static inline u32 host1x_opcode_setstreamid(unsigned streamid)
+{
+	return (7 << 28) | streamid;
+}
+
+static inline u32 host1x_opcode_setpayload(unsigned payload)
+{
+	return (9 << 28) | payload;
+}
+
 static inline u32 host1x_opcode_gather_wide(unsigned count)
 {
 	return (12 << 28) | count;
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 75cf996b0087..1b7dd67c7801 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -321,6 +321,14 @@ struct host1x_job {
 
 	/* Whether host1x-side firewall should be ran for this job or not */
 	bool enable_firewall;
+
+	/* Options for configuring engine data stream ID */
+	/* Context device to use for job */
+	struct host1x_memory_context *memory_context;
+	/* Stream ID to use if context isolation is disabled (!memory_context) */
+	u32 engine_fallback_streamid;
+	/* Engine offset to program stream ID to */
+	u32 engine_streamid_offset;
 };
 
 struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
-- 
2.36.1

