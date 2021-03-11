Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A6D337944
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 17:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BFE6EE5F;
	Thu, 11 Mar 2021 16:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0FF6EE5F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 16:26:14 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id u18so10426382plc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 08:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SChis0vGtZm1iq7sn+k+kRfgAmu4A3E0FlpMCLrCELA=;
 b=Fwk+UjJ0YxT/opsR8q2Gj6tortEnKgTe7PCG6ouj55/LwL+tkFKu4/rEiQI7ewppE5
 tEMqOK/G3Uq61YTawZFd+5CqoiZAx1HGS1RrkRsdsn5IYVF8Y3cT3OHHn40JwD4RYwxd
 dqsTu8M4Ddij677k0ouz+21oqhyBU90MEzYS90CAF1mwy6eIgPeSAe25lRYKkP9Ql9aj
 OWJce4UvSXtWpVHS32Q/VlmSeWv1aJG6Uuv0+ySJbMu+dGZRXHYhlhB+0knRt1HGinnP
 UqVFAKb8gn4K+txvZKzvsBeGf2XV/0pEH51TaHGIz1JJhw7TAZJYc9Ak1MK3l/h+LiWF
 2XdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SChis0vGtZm1iq7sn+k+kRfgAmu4A3E0FlpMCLrCELA=;
 b=nEKPmrunVbuoHN6rMMu/nyWvVljnAp0Be3TgkuiGEXGlnZnTpiqQS6j60YOuz3Yf4s
 y/7zD5RcgyshsHTMgM3eZZJPEXTv6IIaWlO8Wd9L9H7rbzY1P9zzOx3pKNitndfSpSDf
 dOCPVo/oK/hMM41O5rKoh+Au0eMwrxVOegMTjaLsqUTpqXspGihd+z2VrJUfSFMMdtpx
 Py5GqIWWHIIRc+iWmvdwkL82jwgPEltpB/yCejnakrDxjiQr8Xc6XxcoNg/5E20pdrFc
 HJFDWrin+6hu/0ssvb2t3wHIAyDqsYbap85FJ1AMt0npxDKSLeTpiZBdfVwBK4jXUipP
 47RA==
X-Gm-Message-State: AOAM531uVlHmGWpHbG4bK/nB3paIaEzB7YitoEnAzhl+AyvojZHfJWnl
 +r/hF9yvLSPenAaQyLQOGDyLWrc40C/rCw==
X-Google-Smtp-Source: ABdhPJwUpgWEzezVg6p28dn+4kJc4IOQJQ/RKwiy17fkqGK4ddJQ8fn8H954sSWmhL7AfgZjSZtPAA==
X-Received: by 2002:a17:90a:9309:: with SMTP id
 p9mr8713000pjo.174.1615479973205; 
 Thu, 11 Mar 2021 08:26:13 -0800 (PST)
Received: from omlet.lan (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id x7sm2992216pfp.23.2021.03.11.08.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 08:26:12 -0800 (PST)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	mintel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gem: Drop relocation support on all new hardware (v4)
Date: Thu, 11 Mar 2021 10:26:06 -0600
Message-Id: <20210311162606.1045592-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310215007.782649-1-jason@jlekstrand.net>
References: <20210310215007.782649-1-jason@jlekstrand.net>
MIME-Version: 1.0
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
Cc: Dave Airlie <airlied@redhat.com>, Keith Packard <keithp@keithp.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Vulkan driver in Mesa for Intel hardware never uses relocations if
it's running on a version of i915 that supports at least softpin which
all versions of i915 supporting Gen12 do.  On the OpenGL side, Gen12+ is
only supported by iris which never uses relocations.  The older i965
driver in Mesa does use relocations but it only supports Intel hardware
through Gen11 and has been deprecated for all hardware Gen9+.  The
compute driver also never uses relocations.  This only leaves the media
driver which is supposed to be switching to softpin going forward.
Making softpin a requirement for all future hardware seems reasonable.

There is one piece of hardware enabled by default in i915: RKL which was
enabled by e22fa6f0a976 which has not yet landed in drm-next so this
almost but not really a userspace API change for RKL.  If it becomes a
problem, we can always add !IS_ROCKETLAKE(eb->i915) to the condition.

Rejecting relocations starting with newer Gen12 platforms has the
benefit that we don't have to bother supporting it on platforms with
local memory.  Given how much CPU touching of memory is required for
relocations, not having to do so on platforms where not all memory is
directly CPU-accessible carries significant advantages.

v2 (Jason Ekstrand):
 - Allow TGL-LP platforms as they've already shipped

v3 (Jason Ekstrand):
 - WARN_ON platforms with LMEM support in case the check is wrong

v4 (Jason Ekstrand):
 - Call out Rocket Lake in the commit message

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Acked-by: Keith Packard <keithp@keithp.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 99772f37bff60..b02dbd16bfa03 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1764,7 +1764,8 @@ eb_relocate_vma_slow(struct i915_execbuffer *eb, struct eb_vma *ev)
 	return err;
 }
 
-static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
+static int check_relocations(const struct i915_execbuffer *eb,
+			     const struct drm_i915_gem_exec_object2 *entry)
 {
 	const char __user *addr, *end;
 	unsigned long size;
@@ -1774,6 +1775,14 @@ static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
 	if (size == 0)
 		return 0;
 
+	/* Relocations are disallowed for all platforms after TGL-LP */
+	if (INTEL_GEN(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
+		return -EINVAL;
+
+	/* All discrete memory platforms are Gen12 or above */
+	if (WARN_ON(HAS_LMEM(eb->i915)))
+		return -EINVAL;
+
 	if (size > N_RELOC(ULONG_MAX))
 		return -EINVAL;
 
@@ -1807,7 +1816,7 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
 		if (nreloc == 0)
 			continue;
 
-		err = check_relocations(&eb->exec[i]);
+		err = check_relocations(eb, &eb->exec[i]);
 		if (err)
 			goto err;
 
@@ -1880,7 +1889,7 @@ static int eb_prefault_relocations(const struct i915_execbuffer *eb)
 	for (i = 0; i < count; i++) {
 		int err;
 
-		err = check_relocations(&eb->exec[i]);
+		err = check_relocations(eb, &eb->exec[i]);
 		if (err)
 			return err;
 	}
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
