Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6421D8CAB8E
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 12:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D307410E53E;
	Tue, 21 May 2024 10:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZwSQICE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E9010E53E;
 Tue, 21 May 2024 10:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hf/yC7NJa0sOftg0gcNGvCpAXeMWu6J0ohrh7VBrpp4=; b=ZwSQICE8xG2e4p3X0+Ct0mQaW+
 3jewHxoHIqD0gUCzXMxE3I8xxAlbkRsz877ztTrNVzbnYIe02eW86zVAW3vNSbL+r4WAE5JJVnhcQ
 fWdrwZFDENM2hkIQ2CCXcLmTVJ0v1omIxt/dMGAsXekUxhYKyGJDDZsnsxhqSLpeIln5iTA7Urtdm
 E/VgvL3BI14GOkw9advIo4UlJgIxNoKZ0hSK04crgEVcigIyjVHUSbZo1brP2KDvQzA2BL8YtOmqV
 qBr57Qy37xdzt8UE8rji88RXJl/E+f4+h28DIr/4Ql248NpOpqNVnzTwfqKDPKcE9DjwAa7V1VDBr
 Mv0R7Q3Q==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s9MTX-00Aaky-Pc; Tue, 21 May 2024 12:12:07 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 kernel test robot <oliver.sang@intel.com>,
 Kees Cook <keescook@chromium.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915: 2 GiB of relocations ought to be enough for anybody*
Date: Tue, 21 May 2024 11:12:01 +0100
Message-ID: <20240521101201.18978-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Kernel test robot reports i915 can hit a warn in kvmalloc_node which has
a purpose of dissalowing crazy size kernel allocations. This was added in
7661809d493b ("mm: don't allow oversized kvmalloc() calls"):

       /* Don't even allow crazy sizes */
       if (WARN_ON_ONCE(size > INT_MAX))
               return NULL;

This would be kind of okay since i915 at one point dropped the need for
making a shadow copy of the relocation list, but then it got re-added in
fd1500fcd442 ("Revert "drm/i915/gem: Drop relocation slowpath".") a year
after Linus added the above warning.

It is plausible that the issue was not seen until now because to trigger
gem_exec_reloc test requires a combination of an relatively older
generation hardware but with at least 8GiB of RAM installed. Probably even
more depending on runtime checks.

Lets cap what we allow userspace to pass in using the matching limit.
There should be no issue for real userspace since we are talking about
"crazy" number of relocations which have no practical purpose.

*) Well IGT tests might get upset but they can be easily adjusted.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202405151008.6ddd1aaf-oliver.sang@intel.com
Cc: Kees Cook <keescook@chromium.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index d3a771afb083..4b34bf4fde77 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1533,7 +1533,7 @@ static int eb_relocate_vma(struct i915_execbuffer *eb, struct eb_vma *ev)
 		u64_to_user_ptr(entry->relocs_ptr);
 	unsigned long remain = entry->relocation_count;
 
-	if (unlikely(remain > N_RELOC(ULONG_MAX)))
+	if (unlikely(remain > N_RELOC(INT_MAX)))
 		return -EINVAL;
 
 	/*
@@ -1641,7 +1641,7 @@ static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
 	if (size == 0)
 		return 0;
 
-	if (size > N_RELOC(ULONG_MAX))
+	if (size > N_RELOC(INT_MAX))
 		return -EINVAL;
 
 	addr = u64_to_user_ptr(entry->relocs_ptr);
-- 
2.44.0

