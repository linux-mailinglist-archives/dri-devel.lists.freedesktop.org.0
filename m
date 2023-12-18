Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0F5817CFA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 22:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E022810E38D;
	Mon, 18 Dec 2023 21:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405F710E394
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 20:34:34 +0000 (UTC)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1702893461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQgbUD/9nx5mi5GS7bnC72VqZMbKoUb8rPJa0pNUbQg=;
 b=Kkxi3zSonUFc6y94k8nGCK8agXTv2WfFgXRqzSp3Kk+EiUi7x+4dK3FUjlcRqGkqKnqrdG
 kb8BZYzCINHtS1fVRyZf7x+513wa1htBnuxQmfHW+ipRyBldeMol/tQQjK6WMkAxuB3x6K
 x8B+X5gwp697Y88VxGi60b4L/rUbzzD+8ILa8C+86UpcVy922Z+CjbUOPVqhCRDMcCDu0I
 6H4/oeqWUo/2lr6tyNgT+jEndcAWIYt4FDNOfX3cSQKyo5trqc6JMZGTffcRRBnajXkN4r
 estX+xLS1zqN2YQaL4H1thIpODq6P2R9DzFsGaaBWsuXXA+2hNhFi/W0S98fWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1702893461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQgbUD/9nx5mi5GS7bnC72VqZMbKoUb8rPJa0pNUbQg=;
 b=faqY/3zT2f1RnxKjUVyMNBjYHnbagbsIJ2OtxRfsf+0e6/fXqcPT1MzTJJJRoZZvDJzJid
 B41FU8hSdvRtjnAA==
To: Jaya Kumar <jayalk@intworks.biz>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Antonino Daplas <adaplas@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Paul Mundt <lethal@linux-sh.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] fb: flush deferred IO before closing
Date: Mon, 18 Dec 2023 10:57:31 +0100
Message-Id: <bd017f29c0c3d0a91e7be35520d3994218465562.1702890493.git.namcao@linutronix.de>
In-Reply-To: <cover.1702890493.git.namcao@linutronix.de>
References: <cover.1702890493.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 18 Dec 2023 21:52:28 +0000
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
Cc: Nam Cao <namcao@linutronix.de>, bigeasy@linutronix.de,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When framebuffer gets closed, the queued deferred IO gets cancelled. This
can cause some last display data to vanish. This is problematic for users
who send a still image to the framebuffer, then close the file: the image
may never appear.

To ensure none of display data get lost, flush the queued deferred IO
first before closing.

Another possible solution is to delete the cancel_delayed_work_sync()
instead. The difference is that the display may appear some time after
closing. However, the clearing of page mapping after this needs to be
removed too, because the page mapping is used by the deferred work. It is
not completely obvious whether it is okay to not clear the page mapping.
For a patch intended for stable trees, go with the simple and obvious
solution.

Fixes: 60b59beafba8 ("fbdev: mm: Deferred IO support")
Cc: stable@vger.kernel.org
Signed-off-by: Nam Cao <namcao@linutronix.de>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/video/fbdev/core/fb_defio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core=
/fb_defio.c
index 6c8b81c452f0..1ae1d35a5942 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -313,7 +313,7 @@ static void fb_deferred_io_lastclose(struct fb_info *in=
fo)
 	struct page *page;
 	int i;
=20
-	cancel_delayed_work_sync(&info->deferred_work);
+	flush_delayed_work(&info->deferred_work);
=20
 	/* clear out the mapping that we setup */
 	for (i =3D 0 ; i < info->fix.smem_len; i +=3D PAGE_SIZE) {
--=20
2.39.2

