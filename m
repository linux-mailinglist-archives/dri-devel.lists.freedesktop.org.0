Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC4F5A05D5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C21D088B;
	Thu, 25 Aug 2022 01:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08E2D07D8;
 Thu, 25 Aug 2022 01:35:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DFE461ACA;
 Thu, 25 Aug 2022 01:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B234C433B5;
 Thu, 25 Aug 2022 01:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391315;
 bh=qmw4u6COLTwvaLK+bLJshKnE190TMO7IZtcrz4O2igw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d+hFIIz1e/hzqbEjAzwswWyOYgNvig8Zn7GXC3+kh3fK2s2Y+4hy4LRp0xNRur3/H
 EgHO+I/RgVu0RaJ4TFS82NuM3mbgWakWkpWmHiOtOVD8vaORucCLdGbniL5lx/PlOU
 /syfvW9qIfENz9JbLhIuk7aBZs+8y6bw6fJgm75bhubeSCw/4PJxEt34X2K6YK82p3
 tcG21AtTAtTVLixzOYXKw7owqt7XQKu5GxV0q8AyzHZjOyP4Q2JhUr/qYEYYuB/4fb
 p77dX4fLuavq+WeEdIRr3ChjKwwG2N6czGlVp0tkeJljmafKsZGrj+a78ny1U1s7Wq
 gkpkARFNFg6jg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 13/38] drm/amdkfd: Handle restart of
 kfd_ioctl_wait_events
Date: Wed, 24 Aug 2022 21:33:36 -0400
Message-Id: <20220825013401.22096-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013401.22096-1-sashal@kernel.org>
References: <20220825013401.22096-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Xiaogang Chen <Xiaogang.Chen@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Felix Kuehling <Felix.Kuehling@amd.com>

[ Upstream commit bea9a56afbc4b5a41ea579b8b0dc5e189b439504 ]

When kfd_ioctl_wait_events needs to restart due to a signal, we need to
update the timeout to account for the time already elapsed. We also need
to undo auto_reset of events that have signaled already, so that the
restarted ioctl will be able to count those signals again.

This fixes infinite hangs when kfd_ioctl_wait_events is interrupted by a
signal.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-and-tested-by: Xiaogang Chen <Xiaogang.Chen@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c  | 24 ++++++++++++------------
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  2 +-
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 1c7016958d6d..bfca17ca399c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -814,7 +814,7 @@ static int kfd_ioctl_wait_events(struct file *filp, struct kfd_process *p,
 	err = kfd_wait_on_events(p, args->num_events,
 			(void __user *)args->events_ptr,
 			(args->wait_for_all != 0),
-			args->timeout, &args->wait_result);
+			&args->timeout, &args->wait_result);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index 4df9c36146ba..cbc20d779e5a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -895,7 +895,8 @@ static long user_timeout_to_jiffies(uint32_t user_timeout_ms)
 	return msecs_to_jiffies(user_timeout_ms) + 1;
 }
 
-static void free_waiters(uint32_t num_events, struct kfd_event_waiter *waiters)
+static void free_waiters(uint32_t num_events, struct kfd_event_waiter *waiters,
+			 bool undo_auto_reset)
 {
 	uint32_t i;
 
@@ -904,6 +905,9 @@ static void free_waiters(uint32_t num_events, struct kfd_event_waiter *waiters)
 			spin_lock(&waiters[i].event->lock);
 			remove_wait_queue(&waiters[i].event->wq,
 					  &waiters[i].wait);
+			if (undo_auto_reset && waiters[i].activated &&
+			    waiters[i].event && waiters[i].event->auto_reset)
+				set_event(waiters[i].event);
 			spin_unlock(&waiters[i].event->lock);
 		}
 
@@ -912,7 +916,7 @@ static void free_waiters(uint32_t num_events, struct kfd_event_waiter *waiters)
 
 int kfd_wait_on_events(struct kfd_process *p,
 		       uint32_t num_events, void __user *data,
-		       bool all, uint32_t user_timeout_ms,
+		       bool all, uint32_t *user_timeout_ms,
 		       uint32_t *wait_result)
 {
 	struct kfd_event_data __user *events =
@@ -921,7 +925,7 @@ int kfd_wait_on_events(struct kfd_process *p,
 	int ret = 0;
 
 	struct kfd_event_waiter *event_waiters = NULL;
-	long timeout = user_timeout_to_jiffies(user_timeout_ms);
+	long timeout = user_timeout_to_jiffies(*user_timeout_ms);
 
 	event_waiters = alloc_event_waiters(num_events);
 	if (!event_waiters) {
@@ -971,15 +975,11 @@ int kfd_wait_on_events(struct kfd_process *p,
 		}
 
 		if (signal_pending(current)) {
-			/*
-			 * This is wrong when a nonzero, non-infinite timeout
-			 * is specified. We need to use
-			 * ERESTARTSYS_RESTARTBLOCK, but struct restart_block
-			 * contains a union with data for each user and it's
-			 * in generic kernel code that I don't want to
-			 * touch yet.
-			 */
 			ret = -ERESTARTSYS;
+			if (*user_timeout_ms != KFD_EVENT_TIMEOUT_IMMEDIATE &&
+			    *user_timeout_ms != KFD_EVENT_TIMEOUT_INFINITE)
+				*user_timeout_ms = jiffies_to_msecs(
+					max(0l, timeout-1));
 			break;
 		}
 
@@ -1020,7 +1020,7 @@ int kfd_wait_on_events(struct kfd_process *p,
 					       event_waiters, events);
 
 out_unlock:
-	free_waiters(num_events, event_waiters);
+	free_waiters(num_events, event_waiters, ret == -ERESTARTSYS);
 	mutex_unlock(&p->event_mutex);
 out:
 	if (ret)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 2585d6e61d42..c6eec54b8102 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1314,7 +1314,7 @@ void kfd_event_free_process(struct kfd_process *p);
 int kfd_event_mmap(struct kfd_process *process, struct vm_area_struct *vma);
 int kfd_wait_on_events(struct kfd_process *p,
 		       uint32_t num_events, void __user *data,
-		       bool all, uint32_t user_timeout_ms,
+		       bool all, uint32_t *user_timeout_ms,
 		       uint32_t *wait_result);
 void kfd_signal_event_interrupt(u32 pasid, uint32_t partial_id,
 				uint32_t valid_id_bits);
-- 
2.35.1

