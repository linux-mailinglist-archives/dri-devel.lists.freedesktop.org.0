Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210191B7FCB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091186EB13;
	Fri, 24 Apr 2020 20:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 5684 seconds by postgrey-1.36 at gabe;
 Fri, 24 Apr 2020 16:26:27 UTC
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E6389F41;
 Fri, 24 Apr 2020 16:26:27 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=default;
 t=1587745584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8mdi2DQZnKTxhiyh5ltJlv4SJnThbSF3Vb3HnH3+DYU=;
 b=EM1KJp2Tn3uJ4k4JmB8agIjC8AO5zxy2CWr3tlHRh/VeOutwbf6EbybYXiabug4NXaOv77
 BmPHjcchgF4NBvEy2nDq6iOpOQA/vS1egSLhZXHyZZ2Uy+ybaxnW5ShJJuD9anR0B///Dv
 21x+3Ntcfp+3U0c6XL8z8yAnOuuNeJ0=
From: Kenny Levinsen <kl@kl.wtf>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: make drm_file use keyed wakeups
Date: Fri, 24 Apr 2020 18:26:15 +0200
Message-Id: <20200424162615.10461-1-kl@kl.wtf>
MIME-Version: 1.0
X-Spam-Score: 4.90
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:07:59 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, Kenny Levinsen <kl@kl.wtf>,
 tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some processes, such as systemd, are only polling for EPOLLERR|EPOLLHUP.
As drm_file uses unkeyed wakeups, such a poll can receive many spurious
wakeups from uninteresting events if, for example, the file description
is subscribed to vblank events. This is the case with systemd, as it
polls a file description from logind that is shared with the users'
compositor.

Use keyed wakeups to allow the wakeup target to more efficiently discard
these uninteresting events.

Signed-off-by: Kenny Levinsen <kl@kl.wtf>
---
 drivers/gpu/drm/drm_file.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index c4c704e01961..ec25b3d979d9 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -608,7 +608,8 @@ ssize_t drm_read(struct file *filp, char __user *buffer,
 				file_priv->event_space -= length;
 				list_add(&e->link, &file_priv->event_list);
 				spin_unlock_irq(&dev->event_lock);
-				wake_up_interruptible(&file_priv->event_wait);
+				wake_up_interruptible_poll(&file_priv->event_wait,
+					EPOLLIN | EPOLLRDNORM);
 				break;
 			}
 
@@ -804,7 +805,8 @@ void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
 	list_del(&e->pending_link);
 	list_add_tail(&e->link,
 		      &e->file_priv->event_list);
-	wake_up_interruptible(&e->file_priv->event_wait);
+	wake_up_interruptible_poll(&e->file_priv->event_wait,
+		EPOLLIN | EPOLLRDNORM);
 }
 EXPORT_SYMBOL(drm_send_event_locked);
 
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
