Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBE8985927
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA8510E96B;
	Wed, 25 Sep 2024 11:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IOd4zPHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AE010E96B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 11:50:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2382B5C1082;
 Wed, 25 Sep 2024 11:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63071C4CEC3;
 Wed, 25 Sep 2024 11:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727265022;
 bh=cvP9jbF3l/+lb4R0PjYQwIsiOeONJZeaHUD4wRSrJDk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IOd4zPHQTj6qSp+DcNJDkbJL6FZDKuCPWOJBy7X/yc2wkaArQR87mSMEV709o9SOe
 kQl+UcIfFgE8mbOrNYYwREnk2EIvPkpa0RMFkIY2/1GXQGpbO1tZB8J0wq0q28OttR
 O55qS2gzEBE1uQ6/T3gC3O2kUMWSL2/QhCK3cSN7aZrJ/NjWT18XCcIy3DKlX+R0Y3
 yu9bIzl4G1uHGm2OXL82Kpj6QeNqVobUM9Ze1jIVpiKJAlQQHwKxB2/wQkLs7kgQ4A
 ZVkIYb0ogOxE52+KP83P6eB6Q8PStvNpzeGybKb1ANIjiQnRoGYID9XPt35A/bg3wa
 MK6nb9j+pmPpA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Sasha Levin <sashal@kernel.org>, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 196/244] drm/printer: Allow NULL data in
 devcoredump printer
Date: Wed, 25 Sep 2024 07:26:57 -0400
Message-ID: <20240925113641.1297102-196-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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

From: Matthew Brost <matthew.brost@intel.com>

[ Upstream commit 53369581dc0c68a5700ed51e1660f44c4b2bb524 ]

We want to determine the size of the devcoredump before writing it out.
To that end, we will run the devcoredump printer with NULL data to get
the size, alloc data based on the generated offset, then run the
devcorecump again with a valid data pointer to print.  This necessitates
not writing data to the data pointer on the initial pass, when it is
NULL.

v5:
 - Better commit message (Jonathan)
 - Add kerenl doc with examples (Jani)

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240801154118.2547543-3-matthew.brost@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_print.c | 13 +++++----
 include/drm/drm_print.h     | 54 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index cf24dfdeb6b27..0081190201a7f 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -100,8 +100,9 @@ void __drm_puts_coredump(struct drm_printer *p, const char *str)
 			copy = iterator->remain;
 
 		/* Copy out the bit of the string that we need */
-		memcpy(iterator->data,
-			str + (iterator->start - iterator->offset), copy);
+		if (iterator->data)
+			memcpy(iterator->data,
+			       str + (iterator->start - iterator->offset), copy);
 
 		iterator->offset = iterator->start + copy;
 		iterator->remain -= copy;
@@ -110,7 +111,8 @@ void __drm_puts_coredump(struct drm_printer *p, const char *str)
 
 		len = min_t(ssize_t, strlen(str), iterator->remain);
 
-		memcpy(iterator->data + pos, str, len);
+		if (iterator->data)
+			memcpy(iterator->data + pos, str, len);
 
 		iterator->offset += len;
 		iterator->remain -= len;
@@ -140,8 +142,9 @@ void __drm_printfn_coredump(struct drm_printer *p, struct va_format *vaf)
 	if ((iterator->offset >= iterator->start) && (len < iterator->remain)) {
 		ssize_t pos = iterator->offset - iterator->start;
 
-		snprintf(((char *) iterator->data) + pos,
-			iterator->remain, "%pV", vaf);
+		if (iterator->data)
+			snprintf(((char *) iterator->data) + pos,
+				 iterator->remain, "%pV", vaf);
 
 		iterator->offset += len;
 		iterator->remain -= len;
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 5d9dff5149c99..d2676831d765d 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -221,7 +221,8 @@ drm_vprintf(struct drm_printer *p, const char *fmt, va_list *va)
 
 /**
  * struct drm_print_iterator - local struct used with drm_printer_coredump
- * @data: Pointer to the devcoredump output buffer
+ * @data: Pointer to the devcoredump output buffer, can be NULL if using
+ * drm_printer_coredump to determine size of devcoredump
  * @start: The offset within the buffer to start writing
  * @remain: The number of bytes to write for this iteration
  */
@@ -266,6 +267,57 @@ struct drm_print_iterator {
  *			coredump_read, ...)
  *	}
  *
+ * The above example has a time complexity of O(N^2), where N is the size of the
+ * devcoredump. This is acceptable for small devcoredumps but scales poorly for
+ * larger ones.
+ *
+ * Another use case for drm_coredump_printer is to capture the devcoredump into
+ * a saved buffer before the dev_coredump() callback. This involves two passes:
+ * one to determine the size of the devcoredump and another to print it to a
+ * buffer. Then, in dev_coredump(), copy from the saved buffer into the
+ * devcoredump read buffer.
+ *
+ * For example::
+ *
+ *	char *devcoredump_saved_buffer;
+ *
+ *	ssize_t __coredump_print(char *buffer, ssize_t count, ...)
+ *	{
+ *		struct drm_print_iterator iter;
+ *		struct drm_printer p;
+ *
+ *		iter.data = buffer;
+ *		iter.start = 0;
+ *		iter.remain = count;
+ *
+ *		p = drm_coredump_printer(&iter);
+ *
+ *		drm_printf(p, "foo=%d\n", foo);
+ *		...
+ *		return count - iter.remain;
+ *	}
+ *
+ *	void coredump_print(...)
+ *	{
+ *		ssize_t count;
+ *
+ *		count = __coredump_print(NULL, INT_MAX, ...);
+ *		devcoredump_saved_buffer = kvmalloc(count, GFP_KERNEL);
+ *		__coredump_print(devcoredump_saved_buffer, count, ...);
+ *	}
+ *
+ *	void coredump_read(char *buffer, loff_t offset, size_t count,
+ *			   void *data, size_t datalen)
+ *	{
+ *		...
+ *		memcpy(buffer, devcoredump_saved_buffer + offset, count);
+ *		...
+ *	}
+ *
+ * The above example has a time complexity of O(N*2), where N is the size of the
+ * devcoredump. This scales better than the previous example for larger
+ * devcoredumps.
+ *
  * RETURNS:
  * The &drm_printer object
  */
-- 
2.43.0

