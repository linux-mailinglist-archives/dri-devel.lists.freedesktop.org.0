Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF62F12B7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 14:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A9A89D00;
	Mon, 11 Jan 2021 13:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77EE26E09C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U4LMapHebtqQLMY7HEgN7zFM2ivBVZziq+5m4D+W0WE=; b=astueCCDkN5AJ4VghQUXJtxvJ9
 CtOoLIj44JkIBsIM10T7e3PuVwJS15ZN1S8ZDc9u/Su2IFeWs8qrU3RttJGEimd6EcelOGOoATvR8
 km9FwagT7Pail0kEJ7XfhKviLTkwzt4x8LMcb42L7JWckfEfoP1haOYPadz/IVh7mRmo6Ym1w+ViQ
 dn6/OTbHuviBx0OVdDnGlRs11nX7O9ocnEIqcUS+qFzKA2lvCIWcINyOVIbVRvJViuRb0/dHKO78/
 QGEU1GvdHmNRyVnzBTgHbBNS8T7QPKLyTwlB4McwwOZH4nCep6aQwWKj9SQEymRok+7P7GwZVDI0Q
 TQ9RCVbw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kywo6-0002tl-F5; Mon, 11 Jan 2021 15:00:26 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v5 04/21] gpu: host1x: Remove cancelled waiters immediately
Date: Mon, 11 Jan 2021 15:00:02 +0200
Message-Id: <20210111130019.3515669-5-mperttunen@nvidia.com>
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

Before this patch, cancelled waiters would only be cleaned up
once their threshold value was reached. Make host1x_intr_put_ref
process the cancellation immediately to fix this.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v5:
* Add parameter to flush, i.e. wait for all pending waiters to
  complete before returning. The reason this is not always true
  is that the pending waiter might be the place that is calling
  the put_ref.
---
 drivers/gpu/host1x/intr.c   | 23 +++++++++++++++++------
 drivers/gpu/host1x/intr.h   |  4 +++-
 drivers/gpu/host1x/syncpt.c |  2 +-
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
index 9245add23b5d..70e1096a4fe9 100644
--- a/drivers/gpu/host1x/intr.c
+++ b/drivers/gpu/host1x/intr.c
@@ -242,18 +242,29 @@ int host1x_intr_add_action(struct host1x *host, struct host1x_syncpt *syncpt,
 	return 0;
 }
 
-void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref)
+void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref,
+			 bool flush)
 {
 	struct host1x_waitlist *waiter = ref;
 	struct host1x_syncpt *syncpt;
 
-	while (atomic_cmpxchg(&waiter->state, WLS_PENDING, WLS_CANCELLED) ==
-	       WLS_REMOVED)
-		schedule();
+	atomic_cmpxchg(&waiter->state, WLS_PENDING, WLS_CANCELLED);
 
 	syncpt = host->syncpt + id;
-	(void)process_wait_list(host, syncpt,
-				host1x_syncpt_load(host->syncpt + id));
+
+	spin_lock(&syncpt->intr.lock);
+	if (atomic_cmpxchg(&waiter->state, WLS_CANCELLED, WLS_HANDLED) ==
+	    WLS_CANCELLED) {
+		list_del(&waiter->list);
+		kref_put(&waiter->refcount, waiter_release);
+	}
+	spin_unlock(&syncpt->intr.lock);
+
+	if (flush) {
+		/* Wait until any concurrently executing handler has finished. */
+		while (atomic_read(&waiter->state) != WLS_HANDLED)
+			cpu_relax();
+	}
 
 	kref_put(&waiter->refcount, waiter_release);
 }
diff --git a/drivers/gpu/host1x/intr.h b/drivers/gpu/host1x/intr.h
index aac38194398f..6ea55e615e3a 100644
--- a/drivers/gpu/host1x/intr.h
+++ b/drivers/gpu/host1x/intr.h
@@ -74,8 +74,10 @@ int host1x_intr_add_action(struct host1x *host, struct host1x_syncpt *syncpt,
  * Unreference an action submitted to host1x_intr_add_action().
  * You must call this if you passed non-NULL as ref.
  * @ref the ref returned from host1x_intr_add_action()
+ * @flush wait until any pending handlers have completed before returning.
  */
-void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref);
+void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref,
+			 bool flush);
 
 /* Initialize host1x sync point interrupt */
 int host1x_intr_init(struct host1x *host, unsigned int irq_sync);
diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 5982fdf64e1c..e48b4595cf53 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -293,7 +293,7 @@ int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
 		}
 	}
 
-	host1x_intr_put_ref(sp->host, sp->id, ref);
+	host1x_intr_put_ref(sp->host, sp->id, ref, true);
 
 done:
 	return err;
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
