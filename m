Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184228373A8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 21:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1153710EC43;
	Mon, 22 Jan 2024 20:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F09210E478
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 09:42:18 +0000 (UTC)
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1705915946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jI9DlXT7q3GaWbI6RXpbPK5d/trpQX7G53NQmpuRe4k=;
 b=hYJsxK/nFw9kM+yLF7yK13u6pBoIyyWWWM+qam2WOTmrxUbkv4p3/xi5WMrW9J7hZiecIP
 fLPahgGTtBwtCIPGxYZMIJxcKdjhq/chQksaduxg14ceXPjKUu2aJqsu2OdG75PTgrKikG
 6SrH1JvS8kVK0s3cXbPX6bK4KJ/5Uxg2te3RjJHJmwEilbsV8yBYStHZNd5gDMj8hQmRxH
 R1vUL3IYf/jWqRJxRZ+AL0nR1K9+0wd3UHj/F1lWwa8cwEnedL40WNDlHuUA3e4GtnMz+I
 HIDFQdTfwB8uqxzfVMxJyQ4Irx5Td0ZYZk2CL4ZylZ64ecCq1+Emn6ezD7OZqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1705915946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jI9DlXT7q3GaWbI6RXpbPK5d/trpQX7G53NQmpuRe4k=;
 b=xzskzyWcCKHtP7hz9wnTAgvrugSHhsC7eLqGBPPNVKSETV4AxfhLA9i+QfA4Rdr3aFQKLA
 2exuJtl4KL+R8zCg==
To: linux-doc@vger.kernel.org
Subject: [PATCH 0/2] kernel-doc: Do not pre-process comments
Date: Mon, 22 Jan 2024 10:31:50 +0100
Message-Id: <20240122093152.22536-1-anna-maria@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 22 Jan 2024 20:25:31 +0000
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this is a repost of the RFC queue
https://lkml.kernel.org/r/20240116151456.48238-1-anna-maria@linutronix.de

Jonathan Corbet is fine with this change and mentioned in an answer the
following:

  "The kernel-doc change should really go together with the DRM change.
  I'm happy to carry both with an ack from DRMland or have the kernel-doc
  patch go through the DRM tree, whichever is easiest."

But back to the patchset: Commit 654784284430 ("kernel-doc: bugfix -
multi-line macros") introduces pre-processing of backslashes at the end of
a line to not break multi-line macros. This pre-processing is done
independently if it is inside code or inside a comment.

This illustation of a hierarchy as a code block inside a kernel-doc comment
has a backslash at the end of the line:

---8<---
/**
 * DOC: hierarchy
 *
 *                    Top Level
 *                /               \
 *         Child A                 Child B
 */
---8<---

It will be displayed as:

---8<---
	     Top Level
	 /                *        Child A                 Child B
---8<---


As I asked for a solution on the linux-doc mailing list, I got some
suggestions with workarounds and also got the suggestion by Matthew Wilcox
to adapt the backslash preprocessing in kernel-doc script. I tested it and
fixed then the newly produced warnings which are covered in the first
patch. The processing of the documentation seems to work - but please don't
rely on my tests as I'm not a perl neither a kernel-doc expert.

Thanks,

	Anna-Maria



Anna-Maria Behnsen (2):
  drm/vram-helper: Fix 'multi-line' kernel-doc comments
  scripts/kernel-doc: Do not process backslash lines in comments

 drivers/gpu/drm/drm_gem_vram_helper.c | 44 ++++++++++++---------------
 include/drm/drm_gem_vram_helper.h     | 16 +++++-----
 scripts/kernel-doc                    |  2 +-
 3 files changed, 29 insertions(+), 33 deletions(-)

-- 
2.39.2

