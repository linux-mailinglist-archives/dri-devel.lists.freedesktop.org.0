Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 041E752813F
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 12:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009DC10E81B;
	Mon, 16 May 2022 10:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAF110E7B7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 10:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uOwqaF85BPufjNmSTdi3rQT+xpb0ifYZ9SvKkmU1oqA=; b=SVufKZ7NdlP/H+Ob2x17KMRF58
 0NxjdZm49nYO6+6kXxiW076UBxi0TNSvojP7hZ4jga8BiNa6yfPrWN9pZxDZRg/W92J90Af7iaQIx
 HTZXdkMAzcaC2D+44C2rsiiFlHCHsKqpwsugHzZCm/1NKhK6u9J7EOwNGfoR1KuVTH2qG1mqpS4mc
 yAE1AOaYpSundI99G4Jf5TrBHHTpZ2UUMghhKIqI0aCfbe6XlLrdv9yxEEpAYZfIMzxTGzl565REp
 QmfFd6ZmxBbdUob21gdoYJL5aflDX2CKOZRpNcRvGPqIT4u2gRrD7EqbM5Roph6txoaX7aWIeqwdB
 m01IXEBQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <cyndis@kapsi.fi>)
 id 1nqXYg-0005yU-B6; Mon, 16 May 2022 13:02:34 +0300
From: cyndis@kapsi.fi
To: thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
Subject: [PATCH v1 10/13] gpu: host1x: Rewrite job opcode sequence
Date: Mon, 16 May 2022 13:02:10 +0300
Message-Id: <20220516100213.1536571-11-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516100213.1536571-1-cyndis@kapsi.fi>
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

For new (Tegra186+) SoCs, use a new ('full-featured') job opcode
sequence that is compatible with virtualization. In particular,
the Host1x hardware in Tegra234 is more strict regarding the sequence,
requiring ACQUIRE_MLOCK-SETCLASS-SETSTREAMID opcodes to occur in
that sequence without gaps (except for SETPAYLOAD), so let's do it
properly in one go now.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/hw/channel_hw.c | 144 +++++++++++++++++------------
 1 file changed, 85 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index f84caf06621a..4eb7fb2e4f0a 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -47,10 +47,41 @@ static void trace_write_gather(struct host1x_cdma *cdma, struct host1x_bo *bo,
 	}
 }
 
-static void submit_wait(struct host1x_cdma *cdma, u32 id, u32 threshold,
+static void submit_wait(struct host1x_job *job, u32 id, u32 threshold,
 			u32 next_class)
 {
-#if HOST1X_HW >= 2
+	struct host1x_cdma *cdma = &job->channel->cdma;
+
+#if HOST1X_HW >= 6
+	u32 stream_id;
+
+	/*
+	 * If a memory context has been set, use it. Otherwise
+	 * (if context isolation is disabled) use the engine's
+	 * firmware stream ID.
+	 */
+	if (job->memory_context)
+		stream_id = job->memory_context->stream_id;
+	else
+		stream_id = job->engine_fallback_streamid;
+
+	host1x_cdma_push_wide(cdma,
+		host1x_opcode_setclass(
+			HOST1X_CLASS_HOST1X,
+			HOST1X_UCLASS_LOAD_SYNCPT_PAYLOAD_32,
+			/* WAIT_SYNCPT_32 is at SYNCPT_PAYLOAD_32+2 */
+			BIT(0) | BIT(2)
+		),
+		threshold,
+		id,
+		HOST1X_OPCODE_NOP
+	);
+	host1x_cdma_push_wide(&job->channel->cdma,
+		host1x_opcode_setclass(job->class, 0, 0),
+		host1x_opcode_setpayload(stream_id),
+		host1x_opcode_setstreamid(job->engine_streamid_offset / 4),
+		HOST1X_OPCODE_NOP);
+#elif HOST1X_HW >= 2
 	host1x_cdma_push_wide(cdma,
 		host1x_opcode_setclass(
 			HOST1X_CLASS_HOST1X,
@@ -97,7 +128,7 @@ static void submit_gathers(struct host1x_job *job, u32 job_syncpt_base)
 			else
 				threshold = cmd->wait.threshold;
 
-			submit_wait(cdma, cmd->wait.id, threshold, cmd->wait.next_class);
+			submit_wait(job, cmd->wait.id, threshold, cmd->wait.next_class);
 		} else {
 			struct host1x_job_gather *g = &cmd->gather;
 
@@ -180,42 +211,70 @@ static void host1x_enable_gather_filter(struct host1x_channel *ch)
 #endif
 }
 
-static void host1x_channel_program_engine_streamid(struct host1x_job *job)
+static void channel_program_cdma(struct host1x_job *job)
 {
+	struct host1x_cdma *cdma = &job->channel->cdma;
+	struct host1x_syncpt *sp = job->syncpt;
+
 #if HOST1X_HW >= 6
 	u32 fence;
 
-	if (!job->memory_context)
-		return;
+	/* Enter engine class with invalid stream ID. */
+	host1x_cdma_push_wide(cdma,
+		host1x_opcode_acquire_mlock(job->class),
+		host1x_opcode_setclass(job->class, 0, 0),
+		host1x_opcode_setpayload(0),
+		host1x_opcode_setstreamid(job->engine_streamid_offset / 4));
 
-	fence = host1x_syncpt_incr_max(job->syncpt, 1);
+	/* Before switching stream ID to real stream ID, ensure engine is idle. */
+	fence = host1x_syncpt_incr_max(sp, 1);
+	host1x_cdma_push(&job->channel->cdma,
+		host1x_opcode_nonincr(HOST1X_UCLASS_INCR_SYNCPT, 1),
+		HOST1X_UCLASS_INCR_SYNCPT_INDX_F(job->syncpt->id) |
+			HOST1X_UCLASS_INCR_SYNCPT_COND_F(4));
+	submit_wait(job, job->syncpt->id, fence, job->class);
 
-	/* First, increment a syncpoint on OP_DONE condition.. */
+	/* Submit work. */
+	job->syncpt_end = host1x_syncpt_incr_max(sp, job->syncpt_incrs);
+	submit_gathers(job, job->syncpt_end - job->syncpt_incrs);
 
+	/* Before releasing MLOCK, ensure engine is idle again. */
+	fence = host1x_syncpt_incr_max(sp, 1);
 	host1x_cdma_push(&job->channel->cdma,
 		host1x_opcode_nonincr(HOST1X_UCLASS_INCR_SYNCPT, 1),
 		HOST1X_UCLASS_INCR_SYNCPT_INDX_F(job->syncpt->id) |
-			HOST1X_UCLASS_INCR_SYNCPT_COND_F(1));
+			HOST1X_UCLASS_INCR_SYNCPT_COND_F(4));
+	submit_wait(job, job->syncpt->id, fence, job->class);
 
-	/* Wait for syncpoint to increment */
+	/* Release MLOCK. */
+	host1x_cdma_push(cdma,
+		HOST1X_OPCODE_NOP, host1x_opcode_release_mlock(job->class));
+#else
+	if (job->serialize) {
+		/*
+		 * Force serialization by inserting a host wait for the
+		 * previous job to finish before this one can commence.
+		 */
+		host1x_cdma_push(cdma,
+				 host1x_opcode_setclass(HOST1X_CLASS_HOST1X,
+					host1x_uclass_wait_syncpt_r(), 1),
+				 host1x_class_host_wait_syncpt(job->syncpt->id,
+					host1x_syncpt_read_max(sp)));
+	}
 
-	host1x_cdma_push(&job->channel->cdma,
-		host1x_opcode_setclass(HOST1X_CLASS_HOST1X,
-			host1x_uclass_wait_syncpt_r(), 1),
-		host1x_class_host_wait_syncpt(job->syncpt->id, fence));
+	/* Synchronize base register to allow using it for relative waiting */
+	if (sp->base)
+		synchronize_syncpt_base(job);
 
-	/*
-	 * Now that we know the engine is idle, return to class and
-	 * change stream ID.
-	 */
+	/* add a setclass for modules that require it */
+	if (job->class)
+		host1x_cdma_push(cdma,
+				 host1x_opcode_setclass(job->class, 0, 0),
+				 HOST1X_OPCODE_NOP);
 
-	host1x_cdma_push(&job->channel->cdma,
-		host1x_opcode_setclass(job->class, 0, 0),
-		HOST1X_OPCODE_NOP);
+	job->syncpt_end = host1x_syncpt_incr_max(sp, job->syncpt_incrs);
 
-	host1x_cdma_push(&job->channel->cdma,
-		host1x_opcode_setpayload(job->memory_context->stream_id),
-		host1x_opcode_setstreamid(job->engine_streamid_offset / 4));
+	submit_gathers(job, job->syncpt_end - job->syncpt_incrs);
 #endif
 }
 
@@ -223,7 +282,6 @@ static int channel_submit(struct host1x_job *job)
 {
 	struct host1x_channel *ch = job->channel;
 	struct host1x_syncpt *sp = job->syncpt;
-	u32 user_syncpt_incrs = job->syncpt_incrs;
 	u32 prev_max = 0;
 	u32 syncval;
 	int err;
@@ -251,6 +309,7 @@ static int channel_submit(struct host1x_job *job)
 
 	host1x_channel_set_streamid(ch);
 	host1x_enable_gather_filter(ch);
+	host1x_hw_syncpt_assign_to_channel(host, sp, ch);
 
 	/* begin a CDMA submit */
 	err = host1x_cdma_begin(&ch->cdma, job);
@@ -259,40 +318,7 @@ static int channel_submit(struct host1x_job *job)
 		goto error;
 	}
 
-	if (job->serialize) {
-		/*
-		 * Force serialization by inserting a host wait for the
-		 * previous job to finish before this one can commence.
-		 */
-		host1x_cdma_push(&ch->cdma,
-				 host1x_opcode_setclass(HOST1X_CLASS_HOST1X,
-					host1x_uclass_wait_syncpt_r(), 1),
-				 host1x_class_host_wait_syncpt(job->syncpt->id,
-					host1x_syncpt_read_max(sp)));
-	}
-
-	/* Synchronize base register to allow using it for relative waiting */
-	if (sp->base)
-		synchronize_syncpt_base(job);
-
-	host1x_hw_syncpt_assign_to_channel(host, sp, ch);
-
-	/* add a setclass for modules that require it */
-	if (job->class)
-		host1x_cdma_push(&ch->cdma,
-				 host1x_opcode_setclass(job->class, 0, 0),
-				 HOST1X_OPCODE_NOP);
-
-	/*
-	 * Ensure engine DMA is idle and set new stream ID. May increment
-	 * syncpt max.
-	 */
-	host1x_channel_program_engine_streamid(job);
-
-	syncval = host1x_syncpt_incr_max(sp, user_syncpt_incrs);
-	job->syncpt_end = syncval;
-
-	submit_gathers(job, syncval - user_syncpt_incrs);
+	channel_program_cdma(job);
 
 	/* end CDMA submit & stash pinned hMems into sync queue */
 	host1x_cdma_end(&ch->cdma, job);
-- 
2.36.1

