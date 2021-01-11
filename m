Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F43D2F12CC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 14:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DB66E0AF;
	Mon, 11 Jan 2021 13:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F85689FAC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NQHUey42Lf31HCOzICAgBsvMeIlAomA9qpBiQ71+FcQ=; b=U3pFQRP0ImdFPak3CPk8/MHsO6
 JPBHpwOXFgBGACgR0Bu7a06SJC48wt8K40NHuMi7aGZXBY34j23y+EDXlhAnyXD/TfejreUnD+yJb
 fuhl59y5sk8nP5d9XieGjYdRGkOqh29Ei99SxBDEMzc4YrT4qP44yh7Zkp8jdhA4F4nMzI87LmLsR
 smbMtXmvhV6AaqlvENuFFYtxgdYVzvczOZN3TQCKfteYXOeCtPJd0iDyGqwsaxfUXSjLDnIM0Nha9
 WKft3+21lfn6u8Ofd2VXnDg1ADpKxc3oPq7DSrSKMGL77T3j6uKCyYiyUlhNSPVo4PNWnPJidaIap
 vi4D+Cgg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kywo7-0002tl-4s; Mon, 11 Jan 2021 15:00:27 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v5 12/21] gpu: host1x: Add support for syncpoint waits in CDMA
 pushbuffer
Date: Mon, 11 Jan 2021 15:00:10 +0200
Message-Id: <20210111130019.3515669-13-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210111130019.3515669-1-mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for inserting syncpoint waits in the CDMA pushbuffer.
These waits need to be done in HOST1X class, while gather submitted
by the application execute in engine class.

Support is added by converting the gather list of job into a command
list that can include both gathers and waits. When the job is
submitted, these commands are pushed as the appropriate opcodes
on the CDMA pushbuffer.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/hw/channel_hw.c | 51 +++++++++++++++--------
 drivers/gpu/host1x/hw/debug_hw.c   |  9 +++-
 drivers/gpu/host1x/job.c           | 67 +++++++++++++++++++++---------
 drivers/gpu/host1x/job.h           | 14 +++++++
 include/linux/host1x.h             |  5 ++-
 5 files changed, 105 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index bf21512e5078..d88a32f73f5e 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -55,31 +55,46 @@ static void submit_gathers(struct host1x_job *job)
 #endif
 	unsigned int i;
 
-	for (i = 0; i < job->num_gathers; i++) {
-		struct host1x_job_gather *g = &job->gathers[i];
-		dma_addr_t addr = g->base + g->offset;
-		u32 op2, op3;
+	for (i = 0; i < job->num_cmds; i++) {
+		struct host1x_job_cmd *cmd = &job->cmds[i];
 
-		op2 = lower_32_bits(addr);
-		op3 = upper_32_bits(addr);
+		if (cmd->is_wait) {
+			/* TODO use modern wait */
+			host1x_cdma_push(cdma,
+				 host1x_opcode_setclass(HOST1X_CLASS_HOST1X,
+					host1x_uclass_wait_syncpt_r(), 1),
+				 host1x_class_host_wait_syncpt(cmd->wait.id,
+					cmd->wait.threshold));
+			host1x_cdma_push(
+				cdma, host1x_opcode_setclass(job->class, 0, 0),
+				HOST1X_OPCODE_NOP);
+		} else {
+			struct host1x_job_gather *g = &cmd->gather;
 
-		trace_write_gather(cdma, g->bo, g->offset, g->words);
+			dma_addr_t addr = g->base + g->offset;
+			u32 op2, op3;
 
-		if (op3 != 0) {
+			op2 = lower_32_bits(addr);
+			op3 = upper_32_bits(addr);
+
+			trace_write_gather(cdma, g->bo, g->offset, g->words);
+
+			if (op3 != 0) {
 #if HOST1X_HW >= 6
-			u32 op1 = host1x_opcode_gather_wide(g->words);
-			u32 op4 = HOST1X_OPCODE_NOP;
+				u32 op1 = host1x_opcode_gather_wide(g->words);
+				u32 op4 = HOST1X_OPCODE_NOP;
 
-			host1x_cdma_push_wide(cdma, op1, op2, op3, op4);
+				host1x_cdma_push_wide(cdma, op1, op2, op3, op4);
 #else
-			dev_err(dev, "invalid gather for push buffer %pad\n",
-				&addr);
-			continue;
+				dev_err(dev, "invalid gather for push buffer %pad\n",
+					&addr);
+				continue;
 #endif
-		} else {
-			u32 op1 = host1x_opcode_gather(g->words);
+			} else {
+				u32 op1 = host1x_opcode_gather(g->words);
 
-			host1x_cdma_push(cdma, op1, op2);
+				host1x_cdma_push(cdma, op1, op2);
+			}
 		}
 	}
 }
@@ -126,7 +141,7 @@ static int channel_submit(struct host1x_job *job)
 	struct host1x *host = dev_get_drvdata(ch->dev->parent);
 
 	trace_host1x_channel_submit(dev_name(ch->dev),
-				    job->num_gathers, job->num_relocs,
+				    job->num_cmds, job->num_relocs,
 				    job->syncpt->id, job->syncpt_incrs);
 
 	/* before error checks, return current max */
diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
index ceb48229d14b..35952fd5597e 100644
--- a/drivers/gpu/host1x/hw/debug_hw.c
+++ b/drivers/gpu/host1x/hw/debug_hw.c
@@ -208,10 +208,15 @@ static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
 				    job->first_get, job->timeout,
 				    job->num_slots, job->num_unpins);
 
-		for (i = 0; i < job->num_gathers; i++) {
-			struct host1x_job_gather *g = &job->gathers[i];
+		for (i = 0; i < job->num_cmds; i++) {
+			struct host1x_job_gather *g;
 			u32 *mapped;
 
+			if (job->cmds[i].is_wait)
+				continue;
+
+			g = &job->cmds[i].gather;
+
 			if (job->gather_copy_mapped)
 				mapped = (u32 *)job->gather_copy_mapped;
 			else
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 09097e19c0d0..a2ba9995582a 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -38,7 +38,7 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 	total = sizeof(struct host1x_job) +
 		(u64)num_relocs * sizeof(struct host1x_reloc) +
 		(u64)num_unpins * sizeof(struct host1x_job_unpin_data) +
-		(u64)num_cmdbufs * sizeof(struct host1x_job_gather) +
+		(u64)num_cmdbufs * sizeof(struct host1x_job_cmd) +
 		(u64)num_unpins * sizeof(dma_addr_t) +
 		(u64)num_unpins * sizeof(u32 *);
 	if (total > ULONG_MAX)
@@ -57,8 +57,8 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 	mem += num_relocs * sizeof(struct host1x_reloc);
 	job->unpins = num_unpins ? mem : NULL;
 	mem += num_unpins * sizeof(struct host1x_job_unpin_data);
-	job->gathers = num_cmdbufs ? mem : NULL;
-	mem += num_cmdbufs * sizeof(struct host1x_job_gather);
+	job->cmds = num_cmdbufs ? mem : NULL;
+	mem += num_cmdbufs * sizeof(struct host1x_job_cmd);
 	job->addr_phys = num_unpins ? mem : NULL;
 
 	job->reloc_addr_phys = job->addr_phys;
@@ -101,22 +101,35 @@ EXPORT_SYMBOL(host1x_job_put);
 void host1x_job_add_gather(struct host1x_job *job, struct host1x_bo *bo,
 			   unsigned int words, unsigned int offset)
 {
-	struct host1x_job_gather *gather = &job->gathers[job->num_gathers];
+	struct host1x_job_gather *gather = &job->cmds[job->num_cmds].gather;
 
 	gather->words = words;
 	gather->bo = bo;
 	gather->offset = offset;
 
-	job->num_gathers++;
+	job->num_cmds++;
 }
 EXPORT_SYMBOL(host1x_job_add_gather);
 
+void host1x_job_add_wait(struct host1x_job *job, u32 id, u32 thresh)
+{
+	struct host1x_job_cmd *cmd = &job->cmds[job->num_cmds];
+
+	cmd->is_wait = true;
+	cmd->wait.id = id;
+	cmd->wait.threshold = thresh;
+
+	job->num_cmds++;
+}
+EXPORT_SYMBOL(host1x_job_add_wait);
+
 static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 {
 	struct host1x_client *client = job->client;
 	struct device *dev = client->dev;
 	struct host1x_job_gather *g;
 	struct iommu_domain *domain;
+	struct sg_table *sgt;
 	unsigned int i;
 	int err;
 
@@ -126,7 +139,6 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 	for (i = 0; i < job->num_relocs; i++) {
 		struct host1x_reloc *reloc = &job->relocs[i];
 		dma_addr_t phys_addr, *phys;
-		struct sg_table *sgt;
 
 		reloc->target.bo = host1x_bo_get(reloc->target.bo);
 		if (!reloc->target.bo) {
@@ -202,17 +214,20 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
 		return 0;
 
-	for (i = 0; i < job->num_gathers; i++) {
+	for (i = 0; i < job->num_cmds; i++) {
 		size_t gather_size = 0;
 		struct scatterlist *sg;
-		struct sg_table *sgt;
 		dma_addr_t phys_addr;
 		unsigned long shift;
 		struct iova *alloc;
 		dma_addr_t *phys;
 		unsigned int j;
 
-		g = &job->gathers[i];
+		if (job->cmds[i].is_wait)
+			continue;
+
+		g = &job->cmds[i].gather;
+
 		g->bo = host1x_bo_get(g->bo);
 		if (!g->bo) {
 			err = -EINVAL;
@@ -545,8 +560,13 @@ static inline int copy_gathers(struct device *host, struct host1x_job *job,
 	fw.num_relocs = job->num_relocs;
 	fw.class = job->class;
 
-	for (i = 0; i < job->num_gathers; i++) {
-		struct host1x_job_gather *g = &job->gathers[i];
+	for (i = 0; i < job->num_cmds; i++) {
+		struct host1x_job_gather *g;
+
+		if (job->cmds[i].is_wait)
+			continue;
+
+		g = &job->cmds[i].gather;
 
 		size += g->words * sizeof(u32);
 	}
@@ -568,10 +588,14 @@ static inline int copy_gathers(struct device *host, struct host1x_job *job,
 
 	job->gather_copy_size = size;
 
-	for (i = 0; i < job->num_gathers; i++) {
-		struct host1x_job_gather *g = &job->gathers[i];
+	for (i = 0; i < job->num_cmds; i++) {
+		struct host1x_job_gather *g;
 		void *gather;
 
+		if (job->cmds[i].is_wait)
+			continue;
+		g = &job->cmds[i].gather;
+
 		/* Copy the gather */
 		gather = host1x_bo_mmap(g->bo);
 		memcpy(job->gather_copy_mapped + offset, gather + g->offset,
@@ -614,8 +638,12 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 	}
 
 	/* patch gathers */
-	for (i = 0; i < job->num_gathers; i++) {
-		struct host1x_job_gather *g = &job->gathers[i];
+	for (i = 0; i < job->num_cmds; i++) {
+		struct host1x_job_gather *g;
+
+		if (job->cmds[i].is_wait)
+			continue;
+		g = &job->cmds[i].gather;
 
 		/* process each gather mem only once */
 		if (g->handled)
@@ -625,10 +653,11 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
 			g->base = job->gather_addr_phys[i];
 
-		for (j = i + 1; j < job->num_gathers; j++) {
-			if (job->gathers[j].bo == g->bo) {
-				job->gathers[j].handled = true;
-				job->gathers[j].base = g->base;
+		for (j = i + 1; j < job->num_cmds; j++) {
+			if (!job->cmds[j].is_wait &&
+			    job->cmds[j].gather.bo == g->bo) {
+				job->cmds[j].gather.handled = true;
+				job->cmds[j].gather.base = g->base;
 			}
 		}
 
diff --git a/drivers/gpu/host1x/job.h b/drivers/gpu/host1x/job.h
index 94bc2e4ae241..33adfaede842 100644
--- a/drivers/gpu/host1x/job.h
+++ b/drivers/gpu/host1x/job.h
@@ -18,6 +18,20 @@ struct host1x_job_gather {
 	bool handled;
 };
 
+struct host1x_job_wait {
+	u32 id;
+	u32 threshold;
+};
+
+struct host1x_job_cmd {
+	bool is_wait;
+
+	union {
+		struct host1x_job_gather gather;
+		struct host1x_job_wait wait;
+	};
+};
+
 struct host1x_job_unpin_data {
 	struct host1x_bo *bo;
 	struct sg_table *sgt;
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index d48cab563d5c..0a46d12b69f0 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -215,8 +215,8 @@ struct host1x_job {
 	struct host1x_client *client;
 
 	/* Gathers and their memory */
-	struct host1x_job_gather *gathers;
-	unsigned int num_gathers;
+	struct host1x_job_cmd *cmds;
+	unsigned int num_cmds;
 
 	/* Array of handles to be pinned & unpinned */
 	struct host1x_reloc *relocs;
@@ -275,6 +275,7 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 				    u32 num_cmdbufs, u32 num_relocs);
 void host1x_job_add_gather(struct host1x_job *job, struct host1x_bo *bo,
 			   unsigned int words, unsigned int offset);
+void host1x_job_add_wait(struct host1x_job *job, u32 id, u32 thresh);
 struct host1x_job *host1x_job_get(struct host1x_job *job);
 void host1x_job_put(struct host1x_job *job);
 int host1x_job_pin(struct host1x_job *job, struct device *dev);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
