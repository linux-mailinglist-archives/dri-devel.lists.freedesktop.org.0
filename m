Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1EF3070E1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD9E6E90B;
	Thu, 28 Jan 2021 08:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8EF6E871
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 17:29:16 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1611768552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEjZOp8GCAMOFRDg3oxg2+c+yhJVKyviPPXBu30pB3M=;
 b=x5DdagCitRCeNaECo9vEZ9pJbd1M0ZplYkKkAjc8QW0CHzjVY7UWUUicofqsOid5Q7EPBU
 h6UT8880uQCZFqfYEJQsT0ljopcnGmn+KNzDk7YxD+tWFcvpGY4FVYEfwfLf9icLAHiJj6
 0KaYwOrBhnYF0TdK4ot5QKMODZpZLxxkphf+IBHYoy6ycoEHMkghsnNlrDRDsl+kjM3uTN
 8UzABcKxFOHEZFXeu+qtQpIJ4MfZ5Au6yF+K1btEPulpXgMp0zpzDMcvZosIMqmXIT2jJ3
 WKOIKNYqx22zlk+sNSkkIh36y9GV2DOdTZOqw89eb25B39LaAnN3zaG0Dp4xJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1611768552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEjZOp8GCAMOFRDg3oxg2+c+yhJVKyviPPXBu30pB3M=;
 b=3mHHww0ekTNZQhFmyUrOo+BHpk3ndmBHPbOOrpIKC+nD/NGyK6GFpxA4OWYmPpIqhrQC3I
 7Z2gFMbob2t1HdDw==
To: linux-omap@vger.kernel.org
Subject: [PATCH 1/2] video: omap: Remove in_interrupt() usage.
Date: Wed, 27 Jan 2021 18:29:01 +0100
Message-Id: <20210127172902.145335-2-bigeasy@linutronix.de>
In-Reply-To: <20210127172902.145335-1-bigeasy@linutronix.de>
References: <20210127172902.145335-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org,
 "Ahmed S. Darwish" <a.darwish@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Ahmed S. Darwish" <a.darwish@linutronix.de>

alloc_req() uses in_interrupt() to detect if it is safe to use down().

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be separated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

The semaphore is used as a counting semaphore, initialized with the
number of slots in the request pool minus IRQ_REQ_POOL_SIZE - which are
reserved for the in_interrupt() user to ensure that a request is always
available. The preemptible user will block on the semphore waiting for a
request to become available in case there are no requests available.

Replace in_interrupt() with a `can_sleep' argument to indicate if it is
safe to block on the sempahore.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/video/fbdev/omap/hwa742.c | 42 ++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/omap/hwa742.c b/drivers/video/fbdev/omap/hwa742.c
index cfe63932f8255..b191bef22d984 100644
--- a/drivers/video/fbdev/omap/hwa742.c
+++ b/drivers/video/fbdev/omap/hwa742.c
@@ -100,6 +100,14 @@ struct {
 	struct hwa742_request	req_pool[REQ_POOL_SIZE];
 	struct list_head	pending_req_list;
 	struct list_head	free_req_list;
+
+	/*
+	 * @req_lock: protect request slots pool and its tracking lists
+	 * @req_sema: counter; slot allocators from task contexts must
+	 *            push it down before acquiring a slot. This
+	 *            guarantees that atomic contexts will always have
+	 *            a minimum of IRQ_REQ_POOL_SIZE slots available.
+	 */
 	struct semaphore	req_sema;
 	spinlock_t		req_lock;
 
@@ -224,13 +232,13 @@ static void disable_tearsync(void)
 	hwa742_write_reg(HWA742_NDP_CTRL, b);
 }
 
-static inline struct hwa742_request *alloc_req(void)
+static inline struct hwa742_request *alloc_req(bool can_sleep)
 {
 	unsigned long flags;
 	struct hwa742_request *req;
 	int req_flags = 0;
 
-	if (!in_interrupt())
+	if (can_sleep)
 		down(&hwa742.req_sema);
 	else
 		req_flags = REQ_FROM_IRQ_POOL;
@@ -399,8 +407,8 @@ static void send_frame_complete(void *data)
 	hwa742.int_ctrl->enable_plane(OMAPFB_PLANE_GFX, 0);
 }
 
-#define ADD_PREQ(_x, _y, _w, _h) do {		\
-	req = alloc_req();			\
+#define ADD_PREQ(_x, _y, _w, _h, can_sleep) do {\
+	req = alloc_req(can_sleep);		\
 	req->handler	= send_frame_handler;	\
 	req->complete	= send_frame_complete;	\
 	req->par.update.x = _x;			\
@@ -413,7 +421,8 @@ static void send_frame_complete(void *data)
 } while(0)
 
 static void create_req_list(struct omapfb_update_window *win,
-			    struct list_head *req_head)
+			    struct list_head *req_head,
+			    bool can_sleep)
 {
 	struct hwa742_request *req;
 	int x = win->x;
@@ -427,7 +436,7 @@ static void create_req_list(struct omapfb_update_window *win,
 	color_mode = win->format & OMAPFB_FORMAT_MASK;
 
 	if (x & 1) {
-		ADD_PREQ(x, y, 1, height);
+		ADD_PREQ(x, y, 1, height, can_sleep);
 		width--;
 		x++;
 		flags &= ~OMAPFB_FORMAT_FLAG_TEARSYNC;
@@ -439,19 +448,19 @@ static void create_req_list(struct omapfb_update_window *win,
 
 		if (xspan * height * 2 > hwa742.max_transmit_size) {
 			yspan = hwa742.max_transmit_size / (xspan * 2);
-			ADD_PREQ(x, ystart, xspan, yspan);
+			ADD_PREQ(x, ystart, xspan, yspan, can_sleep);
 			ystart += yspan;
 			yspan = height - yspan;
 			flags &= ~OMAPFB_FORMAT_FLAG_TEARSYNC;
 		}
 
-		ADD_PREQ(x, ystart, xspan, yspan);
+		ADD_PREQ(x, ystart, xspan, yspan, can_sleep);
 		x += xspan;
 		width -= xspan;
 		flags &= ~OMAPFB_FORMAT_FLAG_TEARSYNC;
 	}
 	if (width)
-		ADD_PREQ(x, y, 1, height);
+		ADD_PREQ(x, y, 1, height, can_sleep);
 }
 
 static void auto_update_complete(void *data)
@@ -461,12 +470,12 @@ static void auto_update_complete(void *data)
 			  jiffies + HWA742_AUTO_UPDATE_TIME);
 }
 
-static void hwa742_update_window_auto(struct timer_list *unused)
+static void __hwa742_update_window_auto(bool can_sleep)
 {
 	LIST_HEAD(req_list);
 	struct hwa742_request *last;
 
-	create_req_list(&hwa742.auto_update_window, &req_list);
+	create_req_list(&hwa742.auto_update_window, &req_list, can_sleep);
 	last = list_entry(req_list.prev, struct hwa742_request, entry);
 
 	last->complete = auto_update_complete;
@@ -475,6 +484,11 @@ static void hwa742_update_window_auto(struct timer_list *unused)
 	submit_req_list(&req_list);
 }
 
+static void hwa742_update_window_auto(struct timer_list *unused)
+{
+	__hwa742_update_window_auto(false);
+}
+
 int hwa742_update_window_async(struct fb_info *fbi,
 				 struct omapfb_update_window *win,
 				 void (*complete_callback)(void *arg),
@@ -497,7 +511,7 @@ int hwa742_update_window_async(struct fb_info *fbi,
 		goto out;
 	}
 
-	create_req_list(win, &req_list);
+	create_req_list(win, &req_list, true);
 	last = list_entry(req_list.prev, struct hwa742_request, entry);
 
 	last->complete = complete_callback;
@@ -544,7 +558,7 @@ static void hwa742_sync(void)
 	struct hwa742_request *req;
 	struct completion comp;
 
-	req = alloc_req();
+	req = alloc_req(true);
 
 	req->handler = sync_handler;
 	req->complete = NULL;
@@ -599,7 +613,7 @@ static int hwa742_set_update_mode(enum omapfb_update_mode mode)
 		omapfb_notify_clients(hwa742.fbdev, OMAPFB_EVENT_READY);
 		break;
 	case OMAPFB_AUTO_UPDATE:
-		hwa742_update_window_auto(0);
+		__hwa742_update_window_auto(true);
 		break;
 	case OMAPFB_UPDATE_DISABLED:
 		break;
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
