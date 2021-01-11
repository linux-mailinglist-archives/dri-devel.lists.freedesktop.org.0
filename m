Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D07A32F12CD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 14:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807CE6E0B7;
	Mon, 11 Jan 2021 13:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5061B89FC9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JpaHpEgMxNEJtMbY9QYGfKpCqLloxFjHFKPFDzy5jHQ=; b=v1ZTFsyXrj66rzgWdUrLvnHOpC
 aRd1xq8U0vXqadG88kU13KS6IY0hQQwF5hyTznIE46pBOdPxGAiUkN0HkAotoUktq24UpD3oS5tP0
 +spQuKLTtT3mLSpSvgLf742ih+MNqsFk7TE0yhvFRAYUqWAGFtpR0zU2gcv9vVsDV/kr9lRJ6HOn7
 PkL8Cc5RfPJ7M5aCRFpPoWRYOtqs/aPtyCfd8fkSwKxn/XC+v1cpmp5v5J1zoGdhebCAbrqsqt0JE
 1xgtq3+GfYaSqsebvySjU6cjZlYOEXHItdNtWa3hOmKUq6LSiqhex+6oJj42sCbl9x0w4bIyb0uJZ
 NN5c8LAg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kywo7-0002tl-TT; Mon, 11 Jan 2021 15:00:27 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v5 21/21] drm/tegra: Add job firewall
Date: Mon, 11 Jan 2021 15:00:19 +0200
Message-Id: <20210111130019.3515669-22-mperttunen@nvidia.com>
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

Add a firewall that validates jobs before submission to ensure
they don't do anything they aren't allowed to do, like accessing
memory they should not access.

The firewall is functionality-wise a copy of the firewall already
implemented in gpu/host1x. It is copied here as it makes more
sense for it to live on the DRM side, as it is only needed for
userspace job submissions, and generally the data it needs to
do its job is easier to access here.

In the future, the other implementation will be removed.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v5:
* Support SETCLASS opcode
v3:
* New patch
---
 drivers/gpu/drm/tegra/Makefile        |   1 +
 drivers/gpu/drm/tegra/uapi/firewall.c | 221 ++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/uapi/submit.c   |  14 +-
 drivers/gpu/drm/tegra/uapi/submit.h   |   4 +
 4 files changed, 237 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/uapi/firewall.c

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index 059322e88943..4e3295f436f1 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -5,6 +5,7 @@ tegra-drm-y := \
 	drm.o \
 	uapi/uapi.o \
 	uapi/submit.o \
+	uapi/firewall.o \
 	uapi/gather_bo.o \
 	gem.o \
 	fb.o \
diff --git a/drivers/gpu/drm/tegra/uapi/firewall.c b/drivers/gpu/drm/tegra/uapi/firewall.c
new file mode 100644
index 000000000000..57427c2d23fa
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi/firewall.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2010-2020 NVIDIA Corporation */
+
+#include "../drm.h"
+#include "../uapi.h"
+
+#include "submit.h"
+
+struct tegra_drm_firewall {
+	struct tegra_drm_submit_data *submit;
+	struct tegra_drm_client *client;
+	u32 *data;
+	u32 pos;
+	u32 end;
+	u32 class;
+};
+
+static int fw_next(struct tegra_drm_firewall *fw, u32 *word)
+{
+	if (fw->pos == fw->end)
+		return -EINVAL;
+
+	*word = fw->data[fw->pos++];
+
+	return 0;
+}
+
+static bool fw_check_addr_valid(struct tegra_drm_firewall *fw, u32 offset)
+{
+	u32 i;
+
+	for (i = 0; i < fw->submit->num_used_mappings; i++) {
+		struct tegra_drm_mapping *m = fw->submit->used_mappings[i].mapping;
+
+		if (offset >= m->iova && offset <= m->iova_end)
+			return true;
+	}
+
+	return false;
+}
+
+static int fw_check_reg(struct tegra_drm_firewall *fw, u32 offset)
+{
+	bool is_addr;
+	u32 word;
+	int err;
+
+	err = fw_next(fw, &word);
+	if (err)
+		return err;
+
+	if (!fw->client->ops->is_addr_reg)
+		return 0;
+
+	is_addr = fw->client->ops->is_addr_reg(fw->client->base.dev, fw->class,
+					       offset);
+
+	if (!is_addr)
+		return 0;
+
+	if (!fw_check_addr_valid(fw, word))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int fw_check_regs_seq(struct tegra_drm_firewall *fw, u32 offset,
+			     u32 count, bool incr)
+{
+	u32 i;
+
+	for (i = 0; i < count; i++) {
+		if (fw_check_reg(fw, offset))
+			return -EINVAL;
+
+		if (incr)
+			offset++;
+	}
+
+	return 0;
+}
+
+static int fw_check_regs_mask(struct tegra_drm_firewall *fw, u32 offset,
+			      u16 mask)
+{
+	unsigned long bmask = mask;
+	unsigned int bit;
+
+	for_each_set_bit(bit, &bmask, 16) {
+		if (fw_check_reg(fw, offset+bit))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int fw_check_regs_imm(struct tegra_drm_firewall *fw, u32 offset)
+{
+	bool is_addr;
+
+	is_addr = fw->client->ops->is_addr_reg(fw->client->base.dev, fw->class,
+					       offset);
+	if (is_addr)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int fw_check_class(struct tegra_drm_firewall *fw, u32 class)
+{
+	if (!fw->client->ops->is_valid_class)
+		return -EINVAL;
+
+	if (!fw->client->ops->is_valid_class(class))
+		return -EINVAL;
+
+	return 0;
+}
+
+enum {
+        HOST1X_OPCODE_SETCLASS  = 0x00,
+        HOST1X_OPCODE_INCR      = 0x01,
+        HOST1X_OPCODE_NONINCR   = 0x02,
+        HOST1X_OPCODE_MASK      = 0x03,
+        HOST1X_OPCODE_IMM       = 0x04,
+        HOST1X_OPCODE_RESTART   = 0x05,
+        HOST1X_OPCODE_GATHER    = 0x06,
+        HOST1X_OPCODE_SETSTRMID = 0x07,
+        HOST1X_OPCODE_SETAPPID  = 0x08,
+        HOST1X_OPCODE_SETPYLD   = 0x09,
+        HOST1X_OPCODE_INCR_W    = 0x0a,
+        HOST1X_OPCODE_NONINCR_W = 0x0b,
+        HOST1X_OPCODE_GATHER_W  = 0x0c,
+        HOST1X_OPCODE_RESTART_W = 0x0d,
+        HOST1X_OPCODE_EXTEND    = 0x0e,
+};
+
+int tegra_drm_fw_validate(struct tegra_drm_client *client, u32 *data, u32 start,
+			  u32 words, struct tegra_drm_submit_data *submit,
+			  u32 *job_class)
+{
+	struct tegra_drm_firewall fw = {
+		.submit = submit,
+		.client = client,
+		.data = data,
+		.pos = start,
+		.end = start+words,
+		.class = *job_class,
+	};
+	bool payload_valid = false;
+	u32 payload;
+	int err;
+
+	while (fw.pos != fw.end) {
+		u32 word, opcode, offset, count, mask, class;
+
+		err = fw_next(&fw, &word);
+		if (err)
+			return err;
+
+		opcode = (word & 0xf0000000) >> 28;
+
+		switch (opcode) {
+		case HOST1X_OPCODE_SETCLASS:
+			offset = word >> 16 & 0xfff;
+			mask = word & 0x3f;
+			class = (word >> 6) & 0x3ff;
+			err = fw_check_class(&fw, class);
+			fw.class = class;
+			*job_class = class;
+			if (!err)
+				err = fw_check_regs_mask(&fw, offset, mask);
+			break;
+		case HOST1X_OPCODE_INCR:
+			offset = (word >> 16) & 0xfff;
+			count = word & 0xffff;
+			err = fw_check_regs_seq(&fw, offset, count, true);
+			break;
+		case HOST1X_OPCODE_NONINCR:
+			offset = (word >> 16) & 0xfff;
+			count = word & 0xffff;
+			err = fw_check_regs_seq(&fw, offset, count, false);
+			break;
+		case HOST1X_OPCODE_MASK:
+			offset = (word >> 16) & 0xfff;
+			mask = word & 0xffff;
+			err = fw_check_regs_mask(&fw, offset, mask);
+			break;
+		case HOST1X_OPCODE_IMM:
+			/* IMM cannot reasonably be used to write a pointer */
+			offset = (word >> 16) & 0xfff;
+			err = fw_check_regs_imm(&fw, offset);
+			break;
+		case HOST1X_OPCODE_SETPYLD:
+			payload = word & 0xffff;
+			payload_valid = true;
+			break;
+		case HOST1X_OPCODE_INCR_W:
+			if (!payload_valid)
+				return -EINVAL;
+
+			offset = word & 0x3fffff;
+			err = fw_check_regs_seq(&fw, offset, payload, true);
+			break;
+		case HOST1X_OPCODE_NONINCR_W:
+			if (!payload_valid)
+				return -EINVAL;
+
+			offset = word & 0x3fffff;
+			err = fw_check_regs_seq(&fw, offset, payload, false);
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/tegra/uapi/submit.c b/drivers/gpu/drm/tegra/uapi/submit.c
index 398be3065e21..8633844ae3d7 100644
--- a/drivers/gpu/drm/tegra/uapi/submit.c
+++ b/drivers/gpu/drm/tegra/uapi/submit.c
@@ -224,7 +224,8 @@ static int submit_job_add_gather(struct host1x_job *job,
 				 struct tegra_drm_channel_ctx *ctx,
 				 struct drm_tegra_submit_cmd_gather_uptr *cmd,
 				 struct gather_bo *bo, u32 *offset,
-				 struct tegra_drm_submit_data *job_data)
+				 struct tegra_drm_submit_data *job_data,
+				 u32 *class)
 {
 	u32 next_offset;
 
@@ -241,6 +242,10 @@ static int submit_job_add_gather(struct host1x_job *job,
 	if (next_offset > bo->gather_data_words)
 		return -EINVAL;
 
+	if (tegra_drm_fw_validate(ctx->client, bo->gather_data, *offset,
+				  cmd->words, job_data, class))
+		return -EINVAL;
+
 	host1x_job_add_gather(job, &bo->base, cmd->words, *offset * 4);
 
 	*offset = next_offset;
@@ -255,10 +260,13 @@ static int submit_create_job(struct drm_device *drm, struct host1x_job **pjob,
 			     struct tegra_drm_submit_data *job_data)
 {
 	struct drm_tegra_submit_cmd *cmds;
-	u32 i, gather_offset = 0;
+	u32 i, gather_offset = 0, class;
 	struct host1x_job *job;
 	int err;
 
+	/* Set initial class for firewall. */
+	class = ctx->client->base.class;
+
 	cmds = alloc_copy_user_array(u64_to_user_ptr(args->cmds_ptr),
 				     args->num_cmds, sizeof(*cmds));
 	if (IS_ERR(cmds))
@@ -284,7 +292,7 @@ static int submit_create_job(struct drm_device *drm, struct host1x_job **pjob,
 		if (cmd->type == DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR) {
 			err = submit_job_add_gather(job, ctx, &cmd->gather_uptr,
 						    bo, &gather_offset,
-						    job_data);
+						    job_data, &class);
 			if (err)
 				goto free_job;
 		} else if (cmd->type == DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT) {
diff --git a/drivers/gpu/drm/tegra/uapi/submit.h b/drivers/gpu/drm/tegra/uapi/submit.h
index 0a165e9e4bda..cf6a2f0a29fc 100644
--- a/drivers/gpu/drm/tegra/uapi/submit.h
+++ b/drivers/gpu/drm/tegra/uapi/submit.h
@@ -14,4 +14,8 @@ struct tegra_drm_submit_data {
 	u32 num_used_mappings;
 };
 
+int tegra_drm_fw_validate(struct tegra_drm_client *client, u32 *data, u32 start,
+			  u32 words, struct tegra_drm_submit_data *submit,
+			  u32 *job_class);
+
 #endif
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
