Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFD18AF73F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 21:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC6810E252;
	Tue, 23 Apr 2024 19:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex.ru header.i=@yandex.ru header.b="bzDQ0x6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 596 seconds by postgrey-1.36 at gabe;
 Tue, 23 Apr 2024 19:23:37 UTC
Received: from forward206c.mail.yandex.net (forward206c.mail.yandex.net
 [178.154.239.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FDF10E252
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 19:23:37 +0000 (UTC)
Received: from forward103c.mail.yandex.net (forward103c.mail.yandex.net
 [IPv6:2a02:6b8:c03:500:1:45:d181:d103])
 by forward206c.mail.yandex.net (Yandex) with ESMTPS id 1CD58637D9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 22:14:12 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c08:1699:0:640:fad2:0])
 by forward103c.mail.yandex.net (Yandex) with ESMTPS id 1AE3C608F2;
 Tue, 23 Apr 2024 22:13:38 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id aDQ1Y2KV04Y0-2XDCZw09; 
 Tue, 23 Apr 2024 22:13:37 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1713899617; bh=m8rHljVzEMT49ON9+udmCkXCxIYBV78xM53MloEwSVg=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=bzDQ0x6ZF12N0ud7Slsp9GrH9ITSqPAo2r2k+XXWXExf++djG65wpSwIgDjo1w6zy
 jACK33lfOLEIeG2SSK7GTiRGaClpZRgLCwNs2KzvmHTobV8vdVmCEtFGdg+rW03be4
 /88zq9IR+dyqpHpxNc03SGG6eo+Q5QXcDZFKdOfU=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lvc-project@linuxtesting.org, Dmitry Antipov <dmantipov@yandex.ru>,
 syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com
Subject: [PATCH] [RFC] dma-buf: fix race condition between poll and close
Date: Tue, 23 Apr 2024 22:13:10 +0300
Message-ID: <20240423191310.19437-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Syzbot has found the race condition where 'fput()' is in progress
when 'dma_buf_poll()' makes an attempt to hold the 'struct file'
with zero 'f_count'. So use explicit 'atomic_long_inc_not_zero()'
to detect such a case and cancel an undergoing poll activity with
EPOLLERR.

Reported-by: syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5d4cb6b4409edfd18646
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/dma-buf/dma-buf.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8fe5aa67b167..39eb75d23219 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -266,8 +266,17 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		spin_unlock_irq(&dmabuf->poll.lock);
 
 		if (events & EPOLLOUT) {
-			/* Paired with fput in dma_buf_poll_cb */
-			get_file(dmabuf->file);
+			/*
+			 * Catch the case when fput() is in progress
+			 * (e.g. due to close() from another thread).
+			 * Otherwise the paired fput() will be issued
+			 * from dma_buf_poll_cb().
+			 */
+			if (unlikely(!atomic_long_inc_not_zero(&file->f_count))) {
+				events = EPOLLERR;
+				dcb->active = 0;
+				goto out;
+			}
 
 			if (!dma_buf_poll_add_cb(resv, true, dcb))
 				/* No callback queued, wake up any other waiters */
@@ -289,8 +298,12 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		spin_unlock_irq(&dmabuf->poll.lock);
 
 		if (events & EPOLLIN) {
-			/* Paired with fput in dma_buf_poll_cb */
-			get_file(dmabuf->file);
+			/* See above */
+			if (unlikely(!atomic_long_inc_not_zero(&file->f_count))) {
+				events = EPOLLERR;
+				dcb->active = 0;
+				goto out;
+			}
 
 			if (!dma_buf_poll_add_cb(resv, false, dcb))
 				/* No callback queued, wake up any other waiters */
@@ -299,7 +312,7 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 				events &= ~EPOLLIN;
 		}
 	}
-
+out:
 	dma_resv_unlock(resv);
 	return events;
 }
-- 
2.44.0

