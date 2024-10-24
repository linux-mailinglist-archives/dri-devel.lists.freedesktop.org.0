Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E120E9B0436
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 15:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA14D10EAFD;
	Fri, 25 Oct 2024 13:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V8Nz3HK/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9039010E0AA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 18:31:35 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb3da341c9so14303041fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 11:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729794693; x=1730399493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jOBu1OMmvywWy1HbeYv/LsS1VtoCNLbACKbDMs6n65U=;
 b=V8Nz3HK/w7nTa40aRmqsBVntYpeOu0oiy76YLb6Slj/kZW8i1lzrxvL4Xqu1igm3bV
 BOPuahIMoIbDqMlizT5t3TZuoP0uYtUJkYAoi6SFz2mYlrbt0KCO3gzq46OcHNREMspb
 +wNwNxx79mEwRx8LoweIOjYvEx1sQiHLlcU90vYQses9zCSmgm6Favg3wMtLC1MApatT
 bexjzR07QaQhiZ+fL7hoyXlep54+/7EHmO/Ev91XchJFSA1jO2CuhAoljzQCppDXyIW+
 Du1tR5ZbaNPh903/liNuZzmRq52llIRaaERk/6M8Ug8sGvQWLlFRFYguU0YTeNlrX3ki
 /ZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729794693; x=1730399493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jOBu1OMmvywWy1HbeYv/LsS1VtoCNLbACKbDMs6n65U=;
 b=py2j2lhRFTDISmyEu700k4kZfj/qQbKmK17wC4zPM4ZRkV79vlqda+gQawtTLcrqLZ
 1r1FiQEOHpjF0p7dR3zYTRRNHhgyYbsO6umhJxcQg+wkdaaQUbPX4rVdRU+3Eu0AT0HQ
 iDzn4gFmblIz5eyeysTJcFx6stf3wQq9AfGOzqZA9En6jYWjq37KtCELWCgolg97owtY
 qifipz/Ul+5Cg8NJsY5JcsvO16uSO/1rx3lvsYXvniDxdErSg/gTYuBJT+JiltxldKnG
 CV8tBcDWAQ4IVDvt9z5ZMMk3ez2ddC2UCFxOJSm64TDx/AAsNJVqzLEuPzG7O3bi+YY2
 JlTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlxW1xmnp95AVvNV9CHLrHIY+nivih+BVbtplkempwcqpxhcEppddIt/8gcFXGleXH4CtIuLPpIz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsQ1QoXx+hhZBa6/Vys0dKcoZmRVaOHvcdpXmOgtmp1g5Pdfbq
 O5v8sPP4Nh4eM6sJ4g+JHP0WfzDojjV/yzYuGAjBjYdHCpQjBR/y
X-Google-Smtp-Source: AGHT+IHuCw6IlDpWujNFu50s6SeTHaw+23ZfZcLCN5zf5QBQZOpBGoJig/6yaGz8saMNSIZtlq9+KA==
X-Received: by 2002:a2e:b8cb:0:b0:2fb:3445:a4af with SMTP id
 38308e7fff4ca-2fc9d31133cmr40221691fa.21.1729794692924; 
 Thu, 24 Oct 2024 11:31:32 -0700 (PDT)
Received: from localhost.localdomain (46-138-2-161.dynamic.spd-mgts.ru.
 [46.138.2.161]) by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-2fb9ae1262bsm14769871fa.117.2024.10.24.11.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 11:31:32 -0700 (PDT)
From: Artem Sdvizhkov <raclesdv@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Artem Sdvizhkov <raclesdv@gmail.com>, lvc-project@linuxtesting.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Eric Anholt <eric@anholt.net>, Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH 5.10] drm/shmem-helper: Fix BUG_ON() on mmap(PROT_WRITE,
 MAP_PRIVATE)
Date: Thu, 24 Oct 2024 21:31:06 +0300
Message-Id: <20241024183106.26151-1-raclesdv@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Oct 2024 13:32:50 +0000
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

commit 39bc27bd688066a63e56f7f64ad34fae03fbe3b8 upstream.

Lack of check for copy-on-write (COW) mapping in drm_gem_shmem_mmap
allows users to call mmap with PROT_WRITE and MAP_PRIVATE flag
causing a kernel panic due to BUG_ON in vmf_insert_pfn_prot:
BUG_ON((vma->vm_flags & VM_PFNMAP) && is_cow_mapping(vma->vm_flags));

Return -EINVAL early if COW mapping is detected.

This bug affects all drm drivers using default shmem helpers.
It can be reproduced by this simple example:
void *ptr = mmap(0, size, PROT_WRITE, MAP_PRIVATE, fd, mmap_offset);
ptr[0] = 0;

Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Eric Anholt <eric@anholt.net>
Cc: Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.2+
Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20240520100514.925681-1-jacek.lawrynowicz@linux.intel.com
[Artem: bp to fix CVE-2024-39497, in order to adapt this patch to branch 5.10
add header file mm/internal.h]
Signed-off-by: Artem Sdvizhkov <raclesdv@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index e8f07305e279..37f347f39c88 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -17,6 +17,8 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 
+#include "../../../mm/internal.h"   /* is_cow_mapping() */
+
 /**
  * DOC: overview
  *
@@ -630,6 +632,9 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 		return ret;
 	}
 
+	if (is_cow_mapping(vma->vm_flags))
+		return -EINVAL;
+
 	shmem = to_drm_gem_shmem_obj(obj);
 
 	ret = drm_gem_shmem_get_pages(shmem);
-- 
2.43.0

