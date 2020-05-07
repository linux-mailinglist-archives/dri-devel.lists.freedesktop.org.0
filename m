Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14531C952F
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D2B6EA21;
	Thu,  7 May 2020 15:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08F86EA21
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:36:21 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id n11so2649179pgl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qr2jOJU0nwDv3Zr5vF5a1me04s/gPafFoUQXU1q5+ss=;
 b=Dg61HoqY1LAIcueDBXUPrLd0RnoSUrdiQ6+1UgvwN+TwSM17e3utL+hSyUHwpdMmRx
 I/3vKqC0ePOnLwf7pARVHgNcT78La1weUjOl1ct9sVCbPeEB/8szqDLvV10CZ9ic4nOE
 LA7NflXVGpNTTXIGveNaIiTjl3k4kmkbogkxbDpc8lThBwzFsd8IA64fSa203pu9aMMw
 tKHY18wxk59ftSkD3Zke0JA3S4EvZh3sw9dEVwJ9942AMnwtGWuafG9m5MRp4WaJSq5K
 cnhr5QmFtTzbs7QRmsSCW/ClkKcp7EH8VfxJHZh/hmAKYUsobd6/ho5j5R3yJJ6VgbFz
 GTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qr2jOJU0nwDv3Zr5vF5a1me04s/gPafFoUQXU1q5+ss=;
 b=pF2kNsPE/yMQV2mXxFcNxfVmolDCjSLUbA0RFwVLwhCJvq3ZlRPHdpxAHdalqZhokB
 mHPDAs1WwoLdUbxNv/0a/xaSeH5CTo0nXqNM7HhAgTfZZhl4mVmtR75wD/zgHH5PaSO8
 qpfWKXLnPv8O/56DMbeMnXhH0KS4sGclLXPcybEdwUcgGZbA1EuKUjfybGY7QAtRGWJ9
 lFEgi5P2fypZFHw6Gc+k14RV4PvOo8OQ/1Gqima84NG+fLF+PrSBw6Ytpa2W+K2Z9o1o
 ZG6eVaM4GP8xYrEz6WPUMFWO+Rm87pgrkrlay7NActnSU57RML0/8weNZfiDxfmDoLYs
 pP9w==
X-Gm-Message-State: AGi0Pua7M9XJZStEi2RS+rzFlIhCOmjrLs4TcZavoemLT0EkXJjQhM5a
 x5pgrTSZ5ztEj4Z6xHQaXG+cVg==
X-Google-Smtp-Source: APiQypIqkSWv8SubQOaXBzJ48rBKY7KMbeKWezbcFxkcB1zHX8qMSbY/OQEAtl6LptJaAEjic5w4yw==
X-Received: by 2002:a62:34c1:: with SMTP id b184mr14226847pfa.73.1588865781338; 
 Thu, 07 May 2020 08:36:21 -0700 (PDT)
Received: from omlet.com ([2605:6000:1026:c273::ce4])
 by smtp.gmail.com with ESMTPSA id c2sm5229469pfp.118.2020.05.07.08.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:36:20 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] RFC: i915: Drop relocation support on Gen12+
Date: Thu,  7 May 2020 10:36:00 -0500
Message-Id: <20200507153600.314454-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.26.2
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
Cc: Dave Airlie <airlied@redhat.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Vulkan driver in Mesa for Intel hardware never uses relocations if
it's running on a version of i915 that supports at least softpin which
all versions of i915 supporting Gen12 do.  On the OpenGL side, Gen12 is
only supported by iris which never uses relocations.  The older i965
driver in Mesa does use relocations but it only supports Intel hardware
through Gen11 and has been deprecated for all hardware Gen9+. The entire
relocation UAPI and related infrastructure, therefore, doesn't have any
open-source userspace consumer starting with Gen12.

Rejecting relocations starting with Gen12 has the benefit that we don't
have to bother supporting it on platforms with local memory.  Given how
much CPU touching of memory is required for relocations, not having to
do so on platforms where not all memory is directly CPU-accessible
carries significant advantages.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 4f9c1f5a4dedb..e10c93aff945d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1533,7 +1533,8 @@ eb_relocate_vma_slow(struct i915_execbuffer *eb, struct i915_vma *vma)
 	return err;
 }
 
-static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
+static int check_relocations(const struct i915_execbuffer *eb,
+			     const struct drm_i915_gem_exec_object2 *entry)
 {
 	const char __user *addr, *end;
 	unsigned long size;
@@ -1543,6 +1544,9 @@ static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
 	if (size == 0)
 		return 0;
 
+	if (size && eb->reloc_cache.gen >= 12)
+		return -EINVAL;
+
 	if (size > N_RELOC(ULONG_MAX))
 		return -EINVAL;
 
@@ -1576,7 +1580,7 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
 		if (nreloc == 0)
 			continue;
 
-		err = check_relocations(&eb->exec[i]);
+		err = check_relocations(eb, &eb->exec[i]);
 		if (err)
 			goto err;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
