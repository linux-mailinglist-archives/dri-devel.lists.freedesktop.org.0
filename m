Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILGTBJTilGmWIgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 22:50:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F7F151067
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 22:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCC310E530;
	Tue, 17 Feb 2026 21:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=r-sc.ca header.i=@r-sc.ca header.b="c+3i52pm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-13.smtp.spacemail.com (out-13.smtp.spacemail.com
 [63.250.43.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1969110E2B6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 21:50:02 +0000 (UTC)
Received: from mac.pk.shawcable.net (S0106dceb699ec90f.pk.shawcable.net
 [24.69.43.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.spacemail.com (Postfix) with ESMTPSA id 4fFtNR3f8pz6tkM;
 Tue, 17 Feb 2026 21:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
 s=spacemail; t=1771364425;
 bh=i2/2h3twt+ZWYOxhg0qj91iP6oQyKNIMoDg7PwtB6dM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=c+3i52pmVkNyW4+sGHjRAOEnAUW4mTtO74haAYbbJoox6EWlBsdaj7RbUBdmQ5RKI
 orodcK38f86+s0uOfrepwndtxpDojsN1ZkRVMDHxQ5Xjs1rvZNTm1rFz0/mF75AoUd
 yoUmGS1DBHppy43DT+RpIHZ8BlvT4kIUUuyrPSLJ7r7EhBiFzJkZeLB50mp+ryxPtb
 zaG0EuL/NI3qkf2RcPm9khtaHxypJzePhW0AQKg+pe/jt4qoxhDn/LfHJXbqev0HOM
 jn1U4mHjZXYHxJ1GScoOLR+nQGMilhjnU3nz96K2OmqZifZYs7dIH/JVvT54US96gI
 0y/iaPqicVMxg==
From: Ross Cawston <ross@r-sc.ca>
Date: Tue, 17 Feb 2026 13:39:51 -0800
Subject: [PATCH 3/5] accel/rocket: Add per-task flags and interrupt mask to
 UAPI and kernel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-accel-rocket-clean-base-v1-3-d72354325a25@r-sc.ca>
References: <20260217-accel-rocket-clean-base-v1-0-d72354325a25@r-sc.ca>
In-Reply-To: <20260217-accel-rocket-clean-base-v1-0-d72354325a25@r-sc.ca>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Ross Cawston <ross@r-sc.ca>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771364416; l=2842;
 i=ross@r-sc.ca; s=20260217; h=from:subject:message-id;
 bh=VVUhz8zvdbOtmRMr4903pZBKIMyDW8HDNtWn1p9X3mM=;
 b=7tce/8rUj1Ez3tX+T0SIKAC4ZjopLXBhKwyEg/mnXfYPbXVkyXtt0l7pOSnWi/5X8wFa+LuQF
 exqoacfWxmIDe5Hp+IvpGz4nIOCjAVZXaGhivB9am17tl9QULoUmh0E
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
X-Rspamd-Queue-Id: B8F7F151067
X-Rspamd-Action: no action

Add two new fields to struct drm_rocket_task (UAPI) and struct rocket_task
(kernel):

- u32 int_mask: which block completion interrupt(s) should signal task done
- u32 flags: currently only ROCKET_TASK_SKIP_CNA_CORE

In rocket_copy_tasks():
- copy the new fields
- default int_mask to DPU_0 | DPU_1 when userspace passes zero (backward compatible)

No functional change yet - old userspace continues to work unchanged.

Signed-off-by: Ross Cawston <ross@r-sc.ca>
---
 drivers/accel/rocket/rocket_job.c |  8 ++++++++
 drivers/accel/rocket/rocket_job.h |  2 ++
 include/uapi/drm/rocket_accel.h   | 25 +++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 369b60805d5f..34898084cc56 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -96,6 +96,14 @@ rocket_copy_tasks(struct drm_device *dev,
 
 		rjob->tasks[i].regcmd = task.regcmd;
 		rjob->tasks[i].regcmd_count = task.regcmd_count;
+		rjob->tasks[i].int_mask = task.int_mask;
+		rjob->tasks[i].flags = task.flags;
+
+		/* Default to DPU completion if no mask specified */
+		if (!rjob->tasks[i].int_mask) {
+			rjob->tasks[i].int_mask = PC_INTERRUPT_MASK_DPU_0 |
+									PC_INTERRUPT_MASK_DPU_1;
+		}
 	}
 
 	return 0;
diff --git a/drivers/accel/rocket/rocket_job.h b/drivers/accel/rocket/rocket_job.h
index 4ae00feec3b9..6931dfed8615 100644
--- a/drivers/accel/rocket/rocket_job.h
+++ b/drivers/accel/rocket/rocket_job.h
@@ -13,6 +13,8 @@
 struct rocket_task {
 	u64 regcmd;
 	u32 regcmd_count;
+	u32 int_mask;
+	u32 flags;
 };
 
 struct rocket_job {
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
index d0685e372b79..ae0d8e48afcd 100644
--- a/include/uapi/drm/rocket_accel.h
+++ b/include/uapi/drm/rocket_accel.h
@@ -90,6 +90,11 @@ struct drm_rocket_fini_bo {
 	__u32 reserved;
 };
 
+/**
+ * Flags for drm_rocket_task.flags
+ */
+#define ROCKET_TASK_SKIP_CNA_CORE		0x1
+
 /**
  * struct drm_rocket_task - A task to be run on the NPU
  *
@@ -106,6 +111,26 @@ struct drm_rocket_task {
 	 * buffer
 	 */
 	__u32 regcmd_count;
+
+	/**
+	 * Input: Interrupt mask specifying which block completion signals
+	 * that this task is done. Uses PC_INTERRUPT_MASK_* bits.
+	 *
+	 * For conv/DPU tasks: DPU_0 | DPU_1 (0x0300)
+	 * For PPU tasks:      PPU_0 | PPU_1 (0x0C00)
+	 *
+	 * If zero, defaults to DPU_0 | DPU_1 for backwards compatibility.
+	 */
+	__u32 int_mask;
+
+	/**
+	 * Input: Task flags.
+	 *
+	 * ROCKET_TASK_SKIP_CNA_CORE: Skip CNA and Core S_POINTER MMIO
+	 * writes for this task. Used for standalone DPU element-wise
+	 * and PPU pooling tasks that don't use CNA/Core.
+	 */
+	__u32 flags;
 };
 
 /**

-- 
2.52.0

