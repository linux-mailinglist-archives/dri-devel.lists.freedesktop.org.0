Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KgrH5filGmjIgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 22:50:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFF715106E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 22:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC2210E52C;
	Tue, 17 Feb 2026 21:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=r-sc.ca header.i=@r-sc.ca header.b="M7VU6osu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-13.smtp.spacemail.com (out-13.smtp.spacemail.com
 [63.250.43.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9507710E2B6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 21:50:01 +0000 (UTC)
Received: from mac.pk.shawcable.net (S0106dceb699ec90f.pk.shawcable.net
 [24.69.43.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.spacemail.com (Postfix) with ESMTPSA id 4fFtNX09XLz6tkL;
 Tue, 17 Feb 2026 21:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
 s=spacemail; t=1771364429;
 bh=5Uwy6bs1Cu3Ac5nEuDpfkKyR0IflWXmYqx0YiyUoMG8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=M7VU6osuYR6HrU3vBA9eg5GVCmLkn7ea8rhTEYrz9abHI5NTraXwc30RLt8WCXT+c
 PdyzAFlGLMwYfaio8MnsGdqumgJf/X7nsdQmtUd6h8+zR7H18kyNbq6DUk5eixaUWi
 +gY4X7iwjBw+p+8jBPQLR9wxXv1t4ga7cdf+ApS7E0ZZMqsThuJMijPMK9I5fIEMz7
 d2FOsCJGKkQer58CCusZDisLhFbf4SdE8KMqAzteISVBp6Z8k+mcR6g6gb5tlAOQXr
 +oiFfSTscMxpOVnIsKqgx0L6dmmtW5Fjh6WjSXvy6EYVgmRQ6sUCtyFOjHTVCapCFc
 BQRXiuozzwXqA==
From: Ross Cawston <ross@r-sc.ca>
Date: Tue, 17 Feb 2026 13:39:53 -0800
Subject: [PATCH 5/5] accel/rocket: Use per-task interrupt mask and handle
 PPU completion interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260217-accel-rocket-clean-base-v1-5-d72354325a25@r-sc.ca>
References: <20260217-accel-rocket-clean-base-v1-0-d72354325a25@r-sc.ca>
In-Reply-To: <20260217-accel-rocket-clean-base-v1-0-d72354325a25@r-sc.ca>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Ross Cawston <ross@r-sc.ca>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771364416; l=2929;
 i=ross@r-sc.ca; s=20260217; h=from:subject:message-id;
 bh=HWs1IC84v/YwZQbKpNwoGA0gGWlv8oAPh64TkdQpIug=;
 b=0rgR3wqnVOIYyoNpDkvr/gy3tbo9wKUJ9qM52KuhTyctnPeFJa4yPynjJ/VXvSIOmrmk+l+sr
 v8eOz6MDQ5RBZbDHgb3VWeRKXUur3aLY6dY+d1SOOl+8LhM964SPt8k
X-Developer-Key: i=ross@r-sc.ca; a=ed25519;
 pk=c50mfTDLKsgS2tlqXEZEvb/VGiLvxjsLOw5M50DxhtM=
X-Envelope-From: ross@r-sc.ca
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[r-sc.ca:s=spacemail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[r-sc.ca];
	FORGED_RECIPIENTS(0.00)[m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:ross@r-sc.ca,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ross@r-sc.ca,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[tomeuvizoso.net,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross@r-sc.ca,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[r-sc.ca:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,r-sc.ca:mid,r-sc.ca:dkim,r-sc.ca:email]
X-Rspamd-Queue-Id: 2FFF715106E
X-Rspamd-Action: no action

The current driver hard-codes interrupt mask and clear to DPU_0 | DPU_1
and only checks DPU completion in the IRQ handler. This causes timeouts
on PPU-only tasks and DPU→PPU pipelined jobs.

Use the new per-task int_mask field to set INTERRUPT_MASK to the
correct terminal block(s):
  - conv / standalone DPU → DPU_0 | DPU_1
  - PPU / DPU→PPU pipeline → PPU_0 | PPU_1

Also:
- clear all relevant interrupt bits (0x1ffff) instead of just DPU
- accept PPU_0 / PPU_1 completions in the IRQ handler

Fixes correct completion detection for non-convolutional and pipelined
workloads.

Signed-off-by: Ross Cawston <ross@r-sc.ca>
---
 drivers/accel/rocket/rocket_job.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 1dcc0c945f7f..ce54913baa46 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -162,8 +162,20 @@ static void rocket_job_hw_submit(struct rocket_core *core, struct rocket_job *jo
 	rocket_pc_writel(core, REGISTER_AMOUNTS,
 			 PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT((task->regcmd_count + 1) / 2 - 1));
 
-	rocket_pc_writel(core, INTERRUPT_MASK, PC_INTERRUPT_MASK_DPU_0 | PC_INTERRUPT_MASK_DPU_1);
-	rocket_pc_writel(core, INTERRUPT_CLEAR, PC_INTERRUPT_CLEAR_DPU_0 | PC_INTERRUPT_CLEAR_DPU_1);
+	/*
+	 * Enable interrupts for the last block in this task's pipeline.
+	 *
+	 * The int_mask field from userspace specifies which block completion
+	 * signals that this task is done:
+	 *   - Conv/DPU tasks: DPU_0 | DPU_1
+	 *   - PPU tasks (DPU→PPU pipeline): PPU_0 | PPU_1
+	 *
+	 * Only enabling the terminal block's interrupt prevents the kernel
+	 * from stopping the pipeline early (e.g. DPU fires before PPU has
+	 * finished writing its output).
+	 */
+	rocket_pc_writel(core, INTERRUPT_MASK, task->int_mask);
+	rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
 
 	rocket_pc_writel(core, TASK_CON, PC_TASK_CON_RESERVED_0(1) |
 					 PC_TASK_CON_TASK_COUNT_CLEAR(1) |
@@ -449,8 +461,17 @@ static irqreturn_t rocket_job_irq_handler(int irq, void *data)
 	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
 	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_WRITE_ERROR);
 
-	if (!(raw_status & PC_INTERRUPT_RAW_STATUS_DPU_0 ||
-	      raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1))
+	/*
+	 * Check for any job completion interrupt: DPU or PPU.
+	 *
+	 * Conv and standalone DPU jobs signal via DPU_0/DPU_1.
+	 * PPU pooling jobs signal via PPU_0/PPU_1.
+	 * We must recognize both to avoid PPU job timeouts.
+	 */
+	if (!(raw_status & (PC_INTERRUPT_RAW_STATUS_DPU_0 |
+						PC_INTERRUPT_RAW_STATUS_DPU_1 |
+						PC_INTERRUPT_RAW_STATUS_PPU_0 |
+						PC_INTERRUPT_RAW_STATUS_PPU_1)))
 		return IRQ_NONE;
 
 	rocket_pc_writel(core, INTERRUPT_MASK, 0x0);

-- 
2.52.0

