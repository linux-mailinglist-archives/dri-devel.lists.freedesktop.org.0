Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB98E314F54
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC66C6EB11;
	Tue,  9 Feb 2021 12:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E91C6EB11;
 Tue,  9 Feb 2021 12:44:46 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612874684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CnAZWyHsMvRuVoQBbABX1cuaet1SaUalvFLRT0zo2Jk=;
 b=J5PpBYwt/RcstbyYuLpanmGj0CNldqmdXpMZYgEw1pksp8dQ0qe9en9G+ZHoXfgrZqfm+8
 9iyJHbUOoNwO0Q0x4icQ9X6urJEzwutjRfmQhRcu59t1+Z51XP/9/s5QUBYeUymutfmKYA
 bVEciEHyd8PwajaExxYLkiNvOS5ugKQBJnnLOWVYy48fbvWSLd6yhhexXZHuvEErqi1bRV
 FW/EhNBzjGQwiRzajil5ouDlnzppLIMWskeNjgfMpJi5VUQRSJQq0UUjVKuWREdJTzaBrF
 Idz0l8o8XeTRKZQsPbJanyiGtV9nKbaNjr40sTqzbugR3a2GML8QbLt25P+EEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612874684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CnAZWyHsMvRuVoQBbABX1cuaet1SaUalvFLRT0zo2Jk=;
 b=YzI1/qQ0aD1nYQJdqEtzhkyVqLSTh2HPyOc76EzDNDkmJZFZkUcHruVLd3c6hp4iyF25U+
 eLZmgMYxfHzAXhBA==
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu: Replace in_task() in gfx_v8_0_parse_sq_irq()
Date: Tue,  9 Feb 2021 13:44:39 +0100
Message-Id: <20210209124439.408140-4-bigeasy@linutronix.de>
In-Reply-To: <20210209124439.408140-1-bigeasy@linutronix.de>
References: <20210209124439.408140-1-bigeasy@linutronix.de>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gfx_v8_0_parse_sq_irq() is using in_task() to distinguish if it is
invoked from a workqueue worker or directly from the interrupt handler.

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be separated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

gfx_v8_0_parse_sq_irq() is invoked directly either from a worker or from
the interrupt service routine. The worker is only bypassed if the worker
is already busy.

Add an argument `from_wq' to gfx_v8_0_parse_sq_irq() which is true if
invoked from the worker.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 37639214cbbbd..f346afce82ea0 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -6719,7 +6719,8 @@ static int gfx_v8_0_cp_ecc_error_irq(struct amdgpu_device *adev,
 	return 0;
 }
 
-static void gfx_v8_0_parse_sq_irq(struct amdgpu_device *adev, unsigned ih_data)
+static void gfx_v8_0_parse_sq_irq(struct amdgpu_device *adev, unsigned ih_data,
+				  bool from_wq)
 {
 	u32 enc, se_id, sh_id, cu_id;
 	char type[20];
@@ -6757,7 +6758,7 @@ static void gfx_v8_0_parse_sq_irq(struct amdgpu_device *adev, unsigned ih_data)
 			 * or from BH in which case we can access SQ_EDC_INFO
 			 * instance
 			 */
-			if (in_task()) {
+			if (from_wq) {
 				mutex_lock(&adev->grbm_idx_mutex);
 				gfx_v8_0_select_se_sh(adev, se_id, sh_id, cu_id);
 
@@ -6795,7 +6796,7 @@ static void gfx_v8_0_sq_irq_work_func(struct work_struct *work)
 	struct amdgpu_device *adev = container_of(work, struct amdgpu_device, gfx.sq_work.work);
 	struct sq_work *sq_work = container_of(work, struct sq_work, work);
 
-	gfx_v8_0_parse_sq_irq(adev, sq_work->ih_data);
+	gfx_v8_0_parse_sq_irq(adev, sq_work->ih_data, true);
 }
 
 static int gfx_v8_0_sq_irq(struct amdgpu_device *adev,
@@ -6810,7 +6811,7 @@ static int gfx_v8_0_sq_irq(struct amdgpu_device *adev,
 	 * just print whatever info is possible directly from the ISR.
 	 */
 	if (work_pending(&adev->gfx.sq_work.work)) {
-		gfx_v8_0_parse_sq_irq(adev, ih_data);
+		gfx_v8_0_parse_sq_irq(adev, ih_data, false);
 	} else {
 		adev->gfx.sq_work.ih_data = ih_data;
 		schedule_work(&adev->gfx.sq_work.work);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
