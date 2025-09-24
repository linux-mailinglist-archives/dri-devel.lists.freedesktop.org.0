Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA66B99ECF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 14:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08B210E162;
	Wed, 24 Sep 2025 12:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R6eHiqs2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A05710E1BC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 12:48:58 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-57d8ff3944dso4047116e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 05:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758718136; x=1759322936; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C7JhEQyLJ4tStQZeMjbdNTURPvFyv2MDrZVanIpjsKA=;
 b=R6eHiqs2H9liM6ZqKfBY4vbeWsKIZaOcmec3hCR/3r7grCz1ff/jWE6xC0+RnRq8M+
 FPleW4z2Cp2/uwW3Lc3FeoMD0idTF++onUkpmTfZiI6sQ80keSu12hjkns0ZErIywyQ8
 9lHNEHbL15YCeXjd6wint8nuDLna8RInrIyTRo6kmyeBGuwQjoD4Ntj1Q6YXvvN8SfZz
 GLRR7LjHYNZdFewUeyV6Eng3rQjMy/76OzGktsrmD+felhINgN1+EbbB5mAqJ66sM3ug
 0r404/DgcbqAuQ5O7cYY0E+72py6JXXICs/IU4F0eOdttAhIkiV2CmED2kgxANDppx6q
 +P1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758718136; x=1759322936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C7JhEQyLJ4tStQZeMjbdNTURPvFyv2MDrZVanIpjsKA=;
 b=ZqCYVbG5SdE90fPG4W7CE/JQpPU8oV7ME7ffSRpBySRu9mIOM7+0AVF/u2BRizYLJO
 9YyK+vksGAyIujHpwDXeP6pZ8HPtY6RyP88NnM42uupVg2QmLC6AWorKHWXD2X0hB24K
 v1wbGH/acUn0Mab58S4AscqvMWuVWHo7uMEEaAt0ewJMgrLRtR5slz0rrXltQdwnuk0G
 hJpVz76DE+btXBmFeLKS7l+TRbTYjebOKUyeh5ukZYJj0v1jAVId5W/R8RDUwHptPrvS
 +3LHdgmaMswEohnS9Xlz6YCKy8d/15bDx4fmMAThVDNSFP8U0ukD9vzNt5qaEtVKezKU
 xZbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqeMl3C3FItQaN2hSo5dxMldpGRgYMw2iZykIVK5kFAVQ7v7d3uCRMgJwl8qqN1UOOIjum4BUHU98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy4HCE3L22EM+okUCNj6CrFukyg9UsKcpps/j4RVPiI/XlJK3+
 EB/P2yHgwOniOUOoCZt7NfMsGY8FnRDBSzt8CgjjQIuUVgrie5DqPDWE
X-Gm-Gg: ASbGncs4RXg2+vMpfbz9YHEVRNvwVLRCCBurrN2dcZ4m/8EruT/mn0+4RkggeZq5OL4
 OPII82I2VFVUhUUngBfciT255m7qtTvEGHyeJL0dymG9VqcoqNlRzmNR92bsS5pTXhwqRzZcRh5
 j76jj5tz0Nop6QsIsiiZMs7etjAP0UrNm1m0MJx2n9ktfj8YReo/GuBkHFlHk0PtVRp/4bgkjbM
 kOlOZmkdvQEcbPjHeDanv1ksGXV/72pcuLgOVVZ5XeriY0Ms8q7fT1OaX0bQEkbXlmSqIkxyvFl
 kl1pHTvF9xIQ+Wt6F4yeQO/WZ0gd7qkvfRJbl/rTEk741TUteuMTqskxxCCAOBDPtCdLEqWCpnG
 SHtIL2xR9gqbX3YU/zxKZ63BP7oroE23WPixvl35b73zpgBgnTMAaJAwh0l7fV9fbxFrdmb6jOg
 0TVyGMAvJ6InqFM5Lv
X-Google-Smtp-Source: AGHT+IGsCjQ5kbJbHGIPwqnOsa+Tesxxo/+eEFeOI/jBB9wKGApdlCpF0dLkSsx1lqdtZ8hj+A5qAQ==
X-Received: by 2002:a05:6512:3b88:b0:55f:595f:9a31 with SMTP id
 2adb3069b0e04-580745c448dmr2342043e87.51.1758718136145; 
 Wed, 24 Sep 2025 05:48:56 -0700 (PDT)
Received: from localhost.localdomain
 (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a9668090sm5052943e87.109.2025.09.24.05.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 05:48:55 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Alexandr Sapozhnkiov <alsp705@gmail.com>, linux-media@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH] gpu: i915: fix error return in mmap_offset_attach()
Date: Wed, 24 Sep 2025 15:48:50 +0300
Message-ID: <20250924124852.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Return value of function drm_vma_node_allow_once(), 
called at i915_gem_mman.c:672, is not checked.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 75f5b0e871ef..eb76f8f2bd95 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -758,8 +758,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
 	mmo = insert_mmo(obj, mmo);
 	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
 out:
-	if (file)
-		drm_vma_node_allow_once(&mmo->vma_node, file);
+	if (file) {
+		err = drm_vma_node_allow_once(&mmo->vma_node, file);
+		if (err)
+			goto err;
+	}
 	return mmo;
 
 err:
-- 
2.43.0
