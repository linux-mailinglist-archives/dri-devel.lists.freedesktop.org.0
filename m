Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5463A29D8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FDB6ECF0;
	Thu, 10 Jun 2021 11:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE5F6ECE7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dpIDknq0iJWidcpDZEuLzTBwstSubmqlJoZEI/HqFRs=; b=d0M5do4Q4aOJEYx9++q/+1sVxA
 7+sZBG4syOHlCOn0QJIYrFyTOSvAtH/0TMJjAHmIP1976JANFx0KLNmlo5i8AnURUvdqnMqcx0XPy
 LmNxakZacBiKk+Nx09EAKcnMPeOqzRojlF97eFvMoN/Hdt/1ZZUU8QrjcpiG9tZMOQ1XbYhsaxX3B
 g246pJG10MQzCm27SSPQg04qWdqTC5RQU8Rbya8H03fcDVJaBNjXp3Vo4S7iUy0DzwIFjsFeGjgOV
 MpaM+RsEgs5XANGGOy76mT+XrpkUbGCX5HOE7ydSmpAwcAcqF0w6brU4W2hXKXd0sMXxDk9p8hprc
 260kU3qA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lrIUt-0001s7-Oz; Thu, 10 Jun 2021 14:05:15 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v7 14/15] drm/tegra: Add job firewall
Date: Thu, 10 Jun 2021 14:04:55 +0300
Message-Id: <20210610110456.3692391-15-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210610110456.3692391-1-mperttunen@nvidia.com>
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
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
v6:
* If .is_valid_class is not set, match against client's
  class
* Fix indentation
* Return to previous class after a WAIT command
* Print warning detailing error when rejecting a command
  buffer
* Removed uapi subdirectory
v5:
* Support SETCLASS opcode
v3:
* New patch
---
 drivers/gpu/drm/tegra/Makefile   |   1 +
 drivers/gpu/drm/tegra/firewall.c | 254 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/submit.c   |  12 +-
 drivers/gpu/drm/tegra/submit.h   |   4 +
 4 files changed, 269 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/firewall.c

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index ab4289d1c991..5d2039f0c734 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -6,6 +6,7 @@ tegra-drm-y := \
 	uapi.o \
 	submit.o \
 	gather_bo.o \
+	firewall.o \
 	gem.o \
 	fb.o \
 	dp.o \
diff --git a/drivers/gpu/drm/tegra/firewall.c b/drivers/gpu/drm/tegra/firewall.c
new file mode 100644
index 000000000000..1824d2db0e2c
--- /dev/null
+++ b/drivers/gpu/drm/tegra/firewall.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2010-2020 NVIDIA Corporation */
+
+#include "drm.h"
+#include "submit.h"
+#include "uapi.h"
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
+	if (!fw->client->ops->is_valid_class) {
+		if (class == fw->client->base.class)
+			return 0;
+		else
+			return -EINVAL;
+	}
+
+	if (!fw->client->ops->is_valid_class(class))
+		return -EINVAL;
+
+	return 0;
+}
+
+enum {
+	HOST1X_OPCODE_SETCLASS  = 0x00,
+	HOST1X_OPCODE_INCR      = 0x01,
+	HOST1X_OPCODE_NONINCR   = 0x02,
+	HOST1X_OPCODE_MASK      = 0x03,
+	HOST1X_OPCODE_IMM       = 0x04,
+	HOST1X_OPCODE_RESTART   = 0x05,
+	HOST1X_OPCODE_GATHER    = 0x06,
+	HOST1X_OPCODE_SETSTRMID = 0x07,
+	HOST1X_OPCODE_SETAPPID  = 0x08,
+	HOST1X_OPCODE_SETPYLD   = 0x09,
+	HOST1X_OPCODE_INCR_W    = 0x0a,
+	HOST1X_OPCODE_NONINCR_W = 0x0b,
+	HOST1X_OPCODE_GATHER_W  = 0x0c,
+	HOST1X_OPCODE_RESTART_W = 0x0d,
+	HOST1X_OPCODE_EXTEND    = 0x0e,
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
+			if (err)
+				dev_warn(client->base.dev,
+					 "illegal SETCLASS(offset=0x%x, mask=0x%x, class=0x%x) at word %u",
+					 offset, mask, class, fw.pos-1);
+			break;
+		case HOST1X_OPCODE_INCR:
+			offset = (word >> 16) & 0xfff;
+			count = word & 0xffff;
+			err = fw_check_regs_seq(&fw, offset, count, true);
+			if (err)
+				dev_warn(client->base.dev,
+					 "illegal INCR(offset=0x%x, count=%u) in class 0x%x at word %u",
+					 offset, count, fw.class, fw.pos-1);
+			break;
+		case HOST1X_OPCODE_NONINCR:
+			offset = (word >> 16) & 0xfff;
+			count = word & 0xffff;
+			err = fw_check_regs_seq(&fw, offset, count, false);
+			if (err)
+				dev_warn(client->base.dev,
+					 "illegal NONINCR(offset=0x%x, count=%u) in class 0x%x at word %u",
+					 offset, count, fw.class, fw.pos-1);
+			break;
+		case HOST1X_OPCODE_MASK:
+			offset = (word >> 16) & 0xfff;
+			mask = word & 0xffff;
+			err = fw_check_regs_mask(&fw, offset, mask);
+			if (err)
+				dev_warn(client->base.dev,
+					 "illegal MASK(offset=0x%x, mask=0x%x) in class 0x%x at word %u",
+					 offset, mask, fw.class, fw.pos-1);
+			break;
+		case HOST1X_OPCODE_IMM:
+			/* IMM cannot reasonably be used to write a pointer */
+			offset = (word >> 16) & 0xfff;
+			err = fw_check_regs_imm(&fw, offset);
+			if (err)
+				dev_warn(client->base.dev,
+					 "illegal IMM(offset=0x%x) in class 0x%x at word %u",
+					 offset, fw.class, fw.pos-1);
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
+			if (err)
+				dev_warn(client->base.dev,
+					 "illegal INCR_W(offset=0x%x) in class 0x%x at word %u",
+					 offset, fw.class, fw.pos-1);
+			break;
+		case HOST1X_OPCODE_NONINCR_W:
+			if (!payload_valid)
+				return -EINVAL;
+
+			offset = word & 0x3fffff;
+			err = fw_check_regs_seq(&fw, offset, payload, false);
+			if (err)
+				dev_warn(client->base.dev,
+					 "illegal NONINCR(offset=0x%x) in class 0x%x at word %u",
+					 offset, fw.class, fw.pos-1);
+			break;
+		default:
+			dev_warn(client->base.dev, "illegal opcode at word %u",
+				 fw.pos-1);
+			return -EINVAL;
+		}
+
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index e3200c10ca9e..558ef9d05f5d 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -250,7 +250,8 @@ static int submit_job_add_gather(struct host1x_job *job,
 				 struct tegra_drm_context *ctx,
 				 struct drm_tegra_submit_cmd_gather_uptr *cmd,
 				 struct gather_bo *bo, u32 *offset,
-				 struct tegra_drm_submit_data *job_data)
+				 struct tegra_drm_submit_data *job_data,
+				 u32 *class)
 {
 	u32 next_offset;
 
@@ -275,6 +276,12 @@ static int submit_job_add_gather(struct host1x_job *job,
 		return -EINVAL;
 	}
 
+	if (tegra_drm_fw_validate(ctx->client, bo->gather_data, *offset,
+				  cmd->words, job_data, class)) {
+		SUBMIT_ERR(ctx, "job was rejected by firewall");
+		return -EINVAL;
+	}
+
 	host1x_job_add_gather(job, &bo->base, cmd->words, *offset * 4);
 
 	*offset = next_offset;
@@ -331,7 +338,8 @@ static int submit_create_job(struct host1x_job **pjob,
 		if (cmd->type == DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR) {
 			err = submit_job_add_gather(job, ctx,
 						    &cmd->gather_uptr, bo,
-						    &gather_offset, job_data);
+						    &gather_offset, job_data,
+						    &class);
 			if (err)
 				goto free_job;
 		} else if (cmd->type == DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT) {
diff --git a/drivers/gpu/drm/tegra/submit.h b/drivers/gpu/drm/tegra/submit.h
index 0a165e9e4bda..cf6a2f0a29fc 100644
--- a/drivers/gpu/drm/tegra/submit.h
+++ b/drivers/gpu/drm/tegra/submit.h
@@ -14,4 +14,8 @@ struct tegra_drm_submit_data {
 	u32 num_used_mappings;
 };
 
+int tegra_drm_fw_validate(struct tegra_drm_client *client, u32 *data, u32 start,
+			  u32 words, struct tegra_drm_submit_data *submit,
+			  u32 *job_class);
+
 #endif
-- 
2.30.1

