Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Zt0VOqdhgGlR7gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 09:34:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E784C9B5C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 09:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4877C10E3AA;
	Mon,  2 Feb 2026 08:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=139.com header.i=@139.com header.b="Ru87Sg2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from n169-112.mail.139.com (n169-112.mail.139.com [120.232.169.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B458610E287;
 Mon,  2 Feb 2026 07:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=139.com; s=dkim; l=0;
 h=from:subject:message-id:to:cc:mime-version;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=Ru87Sg2J4uUcZvOOY0u4R1y0rScgFix+Fg13nGRGqpYiaXWvhYa8/7S4rABN01KpqwqIzlSY/O/pr
 5NYTrjvPrF5Z+W1Tkmfut0Ycc+afSCBkOaeKBtIHYCjjTgqdh1F4sGUEbGOGlYZaYnBYt91Un1tJ9j
 +F+7LppXinG47VkM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from NTT-kernel-dev (unknown[60.247.85.88])
 by rmsmtp-lg-appmail-27-12032 (RichMail) with SMTP id 2f0069805926d3d-01d60;
 Mon, 02 Feb 2026 15:58:35 +0800 (CST)
X-RM-TRANSID: 2f0069805926d3d-01d60
From: Li hongliang <1468888505@139.com>
To: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	rbmccav@gmail.com
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 6.1.y] drm/radeon: delete radeon_fence_process in is_signaled,
 no deadlock
Date: Mon,  2 Feb 2026 15:58:55 +0800
Message-Id: <20260202075855.947632-1-1468888505@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Feb 2026 08:34:36 +0000
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
X-Spamd-Result: default: False [1.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[139.com:s=dkim];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	ARC_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	DMARC_NA(0.00)[139.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[139.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1468888505@139.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[139.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 9E784C9B5C
X-Rspamd-Action: no action

From: Robert McClinton <rbmccav@gmail.com>

[ Upstream commit 9eb00b5f5697bd56baa3222c7a1426fa15bacfb5 ]

Delete the attempt to progress the queue when checking if fence is
signaled. This avoids deadlock.

dma-fence_ops::signaled can be called with the fence lock in unknown
state. For radeon, the fence lock is also the wait queue lock. This can
cause a self deadlock when signaled() tries to make forward progress on
the wait queue. But advancing the queue is unneeded because incorrectly
returning false from signaled() is perfectly acceptable.

Link: https://github.com/brave/brave-browser/issues/49182
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4641
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Robert McClinton <rbmccav@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 527ba26e50ec2ca2be9c7c82f3ad42998a75d0db)
Cc: stable@vger.kernel.org
[ Minor conflict resolved. ]
Signed-off-by: Li hongliang <1468888505@139.com>
---
 drivers/gpu/drm/radeon/radeon_fence.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 73e3117420bf..1f2a12a43dd3 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -362,14 +362,6 @@ static bool radeon_fence_is_signaled(struct dma_fence *f)
 		return true;
 	}
 
-	if (down_read_trylock(&rdev->exclusive_lock)) {
-		radeon_fence_process(rdev, ring);
-		up_read(&rdev->exclusive_lock);
-
-		if (atomic64_read(&rdev->fence_drv[ring].last_seq) >= seq) {
-			return true;
-		}
-	}
 	return false;
 }
 
-- 
2.34.1


