Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id msNQCpDilGmjIgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 22:50:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C987A151038
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 22:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C5110E4F1;
	Tue, 17 Feb 2026 21:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=r-sc.ca header.i=@r-sc.ca header.b="eNv5WZ30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-13.smtp.spacemail.com (out-13.smtp.spacemail.com
 [63.250.43.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF0010E2B6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 21:50:01 +0000 (UTC)
Received: from mac.pk.shawcable.net (S0106dceb699ec90f.pk.shawcable.net
 [24.69.43.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.spacemail.com (Postfix) with ESMTPSA id 4fFtNT5Q57z6tkL;
 Tue, 17 Feb 2026 21:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
 s=spacemail; t=1771364427;
 bh=I99tBoI9TXIsELu4UV+lme4CdAPu87/8INed4CLN2Xc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eNv5WZ309Xa1dp3x4ZA8q8+PncDehOESp9osofBRzyx9aaRASOJxXC3C3SfJ0tcGL
 IMw9hleVIxPWBRSchSJuMAEv7uoQBCtTlygEMBY7BIvwJ2btipId7KAQMs0WOGoOfK
 NW25zRpzP7o8OuHIgTToNa01h2FqCEo3pkApVpfYKHxDIE9LukuY77Bh4YJQF2o/DC
 DeBprkYjEYSe9Ugcc0mKQLJPGvvFACdO6H22vtg8RsXKsT1aUDRQa1MS7TZVqtJKJj
 UkGDgY5JgHvOw3tleHPfYiVw6XscpcKHdSCegGp44sAFUSyBsqDTeEIzgL7jVQxOkK
 S+8e3JJkArDpA==
From: Ross Cawston <ross@r-sc.ca>
Date: Tue, 17 Feb 2026 13:39:52 -0800
Subject: [PATCH 4/5] accel/rocket: Skip CNA/Core S_POINTER initialization
 for standalone tasks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260217-accel-rocket-clean-base-v1-4-d72354325a25@r-sc.ca>
References: <20260217-accel-rocket-clean-base-v1-0-d72354325a25@r-sc.ca>
In-Reply-To: <20260217-accel-rocket-clean-base-v1-0-d72354325a25@r-sc.ca>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Ross Cawston <ross@r-sc.ca>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771364416; l=3130;
 i=ross@r-sc.ca; s=20260217; h=from:subject:message-id;
 bh=O8dvO9jPl5/KKxBPfvLRBDq6Xf6UbiLZvL/YK3iBv6E=;
 b=FUfnHHgYQ3mGQnnW03s2TeWiOl5l1ePobjC4leeQItxLJwGfzksgx9brJvYAl5DJ2/76Aq+AY
 T+UM3Hbb4U1Ct3zp8s1xBnAkYKNeCrnFbOuJRL0E8tfH05IYu/ocZS5
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
X-Rspamd-Queue-Id: C987A151038
X-Rspamd-Action: no action

Standalone DPU (element-wise) and PPU (pooling, etc.) tasks do not use
the CNA or Core blocks. Writing S_POINTER to those blocks re-arms them
with stale/uninitialized state, leading to corruption.

Introduce ROCKET_TASK_SKIP_CNA_CORE flag (added in previous patch) so
userspace can indicate such tasks. When set, skip the CNA and Core
S_POINTER MMIO writes.

Also move the per-core extra bit (bit 28 × core index) inside the same
conditional - it is only needed when CNA/Core are actually used.

Signed-off-by: Ross Cawston <ross@r-sc.ca>
---
 drivers/accel/rocket/rocket_job.c | 41 +++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 34898084cc56..1dcc0c945f7f 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -116,7 +116,6 @@ rocket_copy_tasks(struct drm_device *dev,
 static void rocket_job_hw_submit(struct rocket_core *core, struct rocket_job *job)
 {
 	struct rocket_task *task;
-	unsigned int extra_bit;
 
 	/* Don't queue the job if a reset is in progress */
 	if (atomic_read(&core->reset.pending))
@@ -129,17 +128,35 @@ static void rocket_job_hw_submit(struct rocket_core *core, struct rocket_job *jo
 
 	rocket_pc_writel(core, BASE_ADDRESS, 0x1);
 
-	 /* From rknpu, in the TRM this bit is marked as reserved */
-	extra_bit = 0x10000000 * core->index;
-	rocket_cna_writel(core, S_POINTER, CNA_S_POINTER_POINTER_PP_EN(1) |
-					   CNA_S_POINTER_EXECUTER_PP_EN(1) |
-					   CNA_S_POINTER_POINTER_PP_MODE(1) |
-					   extra_bit);
-
-	rocket_core_writel(core, S_POINTER, CORE_S_POINTER_POINTER_PP_EN(1) |
-					    CORE_S_POINTER_EXECUTER_PP_EN(1) |
-					    CORE_S_POINTER_POINTER_PP_MODE(1) |
-					    extra_bit);
+	/*
+	 * Initialize CNA and Core S_POINTER for ping-pong mode via MMIO.
+	 *
+	 * Each core needs a per-core extra_bit (bit 28 * core_index) which
+	 * the TRM marks as reserved but the BSP rknpu driver sets. Without
+	 * it, non-zero cores hang. This MUST be done via MMIO (not regcmd)
+	 * because userspace doesn't know which core the scheduler picks.
+	 *
+	 * For standalone DPU/PPU tasks (element-wise ops, pooling), CNA
+	 * and Core have no work. Writing their S_POINTERs would re-arm
+	 * them with stale state from the previous conv task, corrupting
+	 * the DPU/PPU output. Userspace signals this via the
+	 * ROCKET_TASK_SKIP_CNA_CORE flag.
+	 */
+	if (!(task->flags & ROCKET_TASK_SKIP_CNA_CORE)) {
+		unsigned int extra_bit = 0x10000000 * core->index;
+
+		rocket_cna_writel(core, S_POINTER,
+				  CNA_S_POINTER_POINTER_PP_EN(1) |
+				  CNA_S_POINTER_EXECUTER_PP_EN(1) |
+				  CNA_S_POINTER_POINTER_PP_MODE(1) |
+				  extra_bit);
+
+		rocket_core_writel(core, S_POINTER,
+				   CORE_S_POINTER_POINTER_PP_EN(1) |
+				   CORE_S_POINTER_EXECUTER_PP_EN(1) |
+				   CORE_S_POINTER_POINTER_PP_MODE(1) |
+				   extra_bit);
+	}
 
 	rocket_pc_writel(core, BASE_ADDRESS, task->regcmd);
 	rocket_pc_writel(core, REGISTER_AMOUNTS,

-- 
2.52.0

