Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JMuLCLvnmk/XwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:46:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6456A1978D9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD0B10E756;
	Wed, 25 Feb 2026 12:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aZJjIEBr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEE910E08B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:46:17 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43767807cf3so4952479f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 04:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772023576; x=1772628376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q97leBUZ6iXO6Mof7p/W19wcP1ASx9yxVnD9x21iO8o=;
 b=aZJjIEBr+dNdU7TyTvBJtA61PL6dFbaT3PYkLM96OTvHJ0ZtClENSNqTcwjNh5i3ud
 oqplw9+9UFVyxVa02M9Ck0FBCoGES8DfzE0o+fvbTkDwSw4MBxGEsOhWN+jt0cRFTvV1
 oFGHzSKdl1wBOKGz89FtzF/xlUKGxKzpUbOcbZyFchhVFzOMkkDY0XVwihoI2qbZlbYl
 RkpS1xmhwsXN9quGPc/z/vCH9nE2yENAKvU/5VDC1J4l6DE6PON+qHadKaOAq+N4ggpi
 HZ2ZwD7UpzY3OMVxYba8YGgY65SfhA6Ec2kW3IXqKveRwes/re2WWrm+aFXMH4q+6POx
 KF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772023576; x=1772628376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q97leBUZ6iXO6Mof7p/W19wcP1ASx9yxVnD9x21iO8o=;
 b=GVcX4oZnNdEPsCyzhIW5iTTGN+iCOApy50U6KyQocS8oo2Se22MuUHnI6twHDXdhdQ
 BP+o34MpWfnz2B/z36GDp8Qu7FYM8L0Yd2EIZ+v4MultRDUx+mHV7/Y9nVk+TrJlNud7
 qwjoUD/983AQRBb4F5ByZKJrf52M1llqsbKpZ2puqMs61pDkAHBBBdquCkGrT+BnLHsr
 MCYOaCAK+bY3VwBopZGubSp776TjODzP/hWqdeTAqnX8uQHy127qWtJZBmfvCJY1JPFY
 w98tXcBn4jZO0UWDnOLDO8NlUOEZvzTtnv97fftXmjnIRsp9KqNmhvYdakly4ak7Gaj3
 PPWQ==
X-Gm-Message-State: AOJu0YwwLdy+NXiPpO+NoU+XemdrP9RqLzxSNBTNXYfdSzExaStDoESb
 AKoT8au3i26bxENW3ejuC3dOMl9X36gX4pi77uCeQ6tPNUsSWCk4FauQ
X-Gm-Gg: ATEYQzwJ7F2nQ9kwveD+vtrGiBdsG5pJyAoV8c7H4CYNndanZNrkufRb+KT2rzBeP0H
 1/taTG+ZUNLrEfeUt+Z8iWHESwT+e92VFeF4+Pbt9RasIsw7s4UzzI7SibgpY0fhJGet7pxQhG8
 xaWLO/mP8YtIdtW9o/hM1lOcsaebxaXam4YrL3qUduV0+ULbg+kMf7ChRFcN9eiLgAgrkNG/w9F
 mSyeOK+KQkbFyg4y98yKSCX5eTcVjyS4yuY8WRaK3MA/vd1RSJzAT5y/+bWwq6ngqz/My2XqQsn
 zlLJdIyLtfZw/FH/RBCAURVQVObEWi3MF5KnanlqrQjxiGV6lKt9J0cJb1MJWYXSqjmfjpQcfGt
 Mr9e0AtcXIc7tTc7GFF8t1tZCPS+HCToWPwmcYTEhBzBv/topJK3Jk4OePWCDp7yhbALF9mDhuD
 2ZYaoC/McpAhfIV914zwqvAU41Ln/Wu6fTCNtkcNgu+6Mb753WWw75eG1lziOQerCCNG5g
X-Received: by 2002:a05:600c:1381:b0:483:7783:5373 with SMTP id
 5b1f17b1804b1-483c21a5835mr4391115e9.23.1772023575661; 
 Wed, 25 Feb 2026 04:46:15 -0800 (PST)
Received: from Arch-Spectre.dur.ac.uk ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcb9b97sm18419995e9.7.2026.02.25.04.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 04:46:15 -0800 (PST)
From: Yicong Hui <yiconghui@gmail.com>
To: christian.koenig@amd.com,
	michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Yicong Hui <yiconghui@gmail.com>
Subject: [RFC PATCH v3 2/3] drm/syncobj: Add
 DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR ioctl flag
Date: Wed, 25 Feb 2026 12:46:08 +0000
Message-ID: <20260225124609.968505-3-yiconghui@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225124609.968505-1-yiconghui@gmail.com>
References: <20260225124609.968505-1-yiconghui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:yiconghui@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: 6456A1978D9
X-Rspamd-Action: no action

Add DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR ioctl flag for the
ioctls DRM_IOCTL_SYNCOBJ_WAIT and DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT, which
will make them abort their wait and return the error code and its
associated syncobj.

Suggested-by: Christian König <christian.koenig@amd.com>
Suggested-by: Michel Dänzer <michel.daenzer@mailbox.org>
Signed-off-by: Yicong Hui <yiconghui@gmail.com>
---
Changes in v3:
* Fixed inline comments by converting to multi-line comments in
accordance to kernel style guidelines.
* Used dma_fence_get_status to query error instead of getting it
directly.

 drivers/gpu/drm/drm_syncobj.c | 27 +++++++++++++++++++++++----
 include/uapi/drm/drm.h        |  6 ++++++
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index b74e491f9d8b..2b23f638c1cc 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1042,6 +1042,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 	struct dma_fence *fence;
 	uint64_t *points;
 	uint32_t signaled_count, i;
+	int status;
 
 	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
 		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
@@ -1139,6 +1140,14 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 			if (!fence)
 				continue;
 
+			status = dma_fence_get_status(fence);
+			if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR) && status < 0) {
+				if (idx)
+					*idx = i;
+				timeout = status;
+				goto done_waiting;
+			}
+
 			if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE) ||
 			    dma_fence_is_signaled(fence) ||
 			    (!entries[i].fence_cb.func &&
@@ -1242,8 +1251,12 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
 							 wait->flags,
 							 timeout, &first,
 							 deadline);
-		if (timeout < 0)
+		if (timeout < 0) {
+			if (wait->flags & DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR)
+				wait->first_signaled = first;
+
 			return timeout;
+		}
 		wait->first_signaled = first;
 	} else {
 		timeout = drm_timeout_abs_to_jiffies(timeline_wait->timeout_nsec);
@@ -1253,8 +1266,12 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
 							 timeline_wait->flags,
 							 timeout, &first,
 							 deadline);
-		if (timeout < 0)
+		if (timeout < 0) {
+			if (timeline_wait->flags & DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR)
+				timeline_wait->first_signaled = first;
+
 			return timeout;
+		}
 		timeline_wait->first_signaled = first;
 	}
 	return 0;
@@ -1332,7 +1349,8 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 
 	possible_flags = DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
 			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
-			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
+			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE |
+			 DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR;
 
 	if (args->flags & ~possible_flags)
 		return -EINVAL;
@@ -1376,7 +1394,8 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 	possible_flags = DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
 			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
 			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE |
-			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
+			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE |
+			 DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR;
 
 	if (args->flags & ~possible_flags)
 		return -EINVAL;
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 213b4dc9b612..e998d9351525 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -977,6 +977,12 @@ struct drm_syncobj_transfer {
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE (1 << 3) /* set fence deadline to deadline_nsec */
+/*
+ * As soon as any of the fences in the set have an error,
+ * abort waiting and return its error code. Index of this
+ * first failed fence is returned in first_signaled.
+ */
+#define DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR (1 << 4)
 struct drm_syncobj_wait {
 	__u64 handles;
 	/* absolute timeout */
-- 
2.53.0

