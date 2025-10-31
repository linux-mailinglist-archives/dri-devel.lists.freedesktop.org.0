Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CCAC249F5
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885A510EBA7;
	Fri, 31 Oct 2025 10:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fxw8ZDJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785DE10EBA7;
 Fri, 31 Oct 2025 10:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761908004; x=1793444004;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CGvpYN53Edp0HZ0W7hX9qwx6unmwE61P8STK4QgrYfk=;
 b=Fxw8ZDJ67ZOmgzowHaliV0fG43H297sL0180jlOFZQMK/CtGomWcCAsw
 FiiWe6xKULsUfakdUXH41Y5VWBusfsYkfCW/jpnuDgYPia8dZWrWe6mWc
 SypkGTEHpXWMb/8zAgQo2HEPGyVf4fJmx5of36mv1JQPu5YCo5RGk+ztC
 MQ4bQxOAAAZPCQlXKe/5c3cRU/KcCmxW0X5zHMzqA5YeGxiEUMVxVLDwt
 NJzcVGAqq2XNYzL8JXz2BKitmv5Ojf4yScqr3kG5a8It2402R2ta9tLh/
 PeCvCDKij4edFpf53iWrRziU/bWzy50eH0Wack+aJ53CpHsC92pNgufiJ g==;
X-CSE-ConnectionGUID: OeAXlTZRQRGodabcHBJjHw==
X-CSE-MsgGUID: iscTr6vyTLCzJzttWPa/ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67722678"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="67722678"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 03:53:23 -0700
X-CSE-ConnectionGUID: XaJV+kfHRS+Ak5d68sTGZQ==
X-CSE-MsgGUID: WFK/JoO9Rr6bYxnXg5ZDUg==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.51])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 03:53:19 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?=EA=B9=80=EA=B0=95=EB=AF=BC?= <km.kim1503@gmail.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH] drm/i915/gem: Fix NULL pointer dereference in
 eb_release_vmas()
Date: Fri, 31 Oct 2025 11:53:00 +0100
Message-ID: <20251031105259.72927-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

Set eb->vma[i+1].vma to NULL to prevent eb_release_vmas() from
processing unitialized data, leading to a potential NULL dereference.

During the execution of eb_lookup_vmas(), the eb->vma array is
successively filled up with struct eb_vma objects. This process includes
calling eb_add_vma(), which might fail; however, even in the event of
failure, eb->vma[i].vma is set for the currently processes buffer.

If eb_add_vma() fails, eb_lookup_vmas() returns with an error, which
prompts a call to eb_release_vmas() to clean up the mess. Since
eb_lookup_vmas() might fail during processing any (possibly not first)
buffer, eb_release_vmas() checks whether a buffer's vma is NULL to know
which one has failed first. The NULL is set if the vma cannot be set or
is invalid in some way, but during and after the eb_add_vma() call, it
is set to a valid pointer for the currently processed eb_vma.

This means that during the check in eb_release_vmas(), the buffer that
failed eb_add_vma() (say, eb->vma[i]) is processed (and rightfully so,
since the vma associated with it still needs cleanup), but eb->vma[i+1]
is left completely uninitialized (since the loop was broken prematurely
after failing on eb_add_vma() for eb->vma[i]). Therefore
eb->vma[i+1].vma has junk in it, and if that junk is not NULL, that vma
will be processed by eb_release_vmas(), leading to memory corruption.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15062

Reported-by: 김강민 <km.kim1503@gmail.com>
Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 39c7c32e1e74..0f8f02e22c03 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -960,18 +960,27 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
 		}
 
 		err = eb_add_vma(eb, &current_batch, i, vma);
-		if (err)
+		if (err) {
+			if (i + 1 < eb->buffer_count) {
+				/*
+				 * Execbuffer code expects last vma entry to be NULL,
+				 * since we already initialized this entry,
+				 * set the next value to NULL or we mess up
+				 * cleanup handling.
+				 */
+				eb->vma[i + 1].vma = NULL;
+			}
+
 			return err;
+		}
 
 		if (i915_gem_object_is_userptr(vma->obj)) {
 			err = i915_gem_object_userptr_submit_init(vma->obj);
 			if (err) {
 				if (i + 1 < eb->buffer_count) {
 					/*
-					 * Execbuffer code expects last vma entry to be NULL,
-					 * since we already initialized this entry,
-					 * set the next value to NULL or we mess up
-					 * cleanup handling.
+					 * Set the next vma to null, for the same
+					 * reason as above.
 					 */
 					eb->vma[i + 1].vma = NULL;
 				}
-- 
2.45.2

