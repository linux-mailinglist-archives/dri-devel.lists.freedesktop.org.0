Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA145F7E48
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 21:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134F710E0CC;
	Fri,  7 Oct 2022 19:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE4810E0C9;
 Fri,  7 Oct 2022 19:47:48 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id o5so3489136wms.1;
 Fri, 07 Oct 2022 12:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aQIAtfxw9qFz9Hl/XRNhdWvv/WP4PsamsNA94vPOScw=;
 b=CWEz1G2S7PpTw3YqmzToiMwiNbuD1Drf7WmIgIG8V7JJvKYsk/ZIOpnPDfjkqNtj4u
 x30Wo/rBxvwnjxsrYw4VshH3VQRaJNJBS9dwf2gCSam8zVwT0x57jLY0PkzPhtjRvgru
 yS4DFP4pSMkpeCuO9D5YZWKbdxEPxQ7p8LzZEf5/CVfFcZeDkP+bz6t9Ne7SGq+his84
 FbyRlu5tBAMBVqeBr2ppFUJmG+9yQMlSq0OJ8QiwrN6HLr5Q55oU0RnQFjnA7qLh7PMq
 udmzxQlqNKIaMlrC1eUYEpZsqX8u/rhlv+eTU/IyYY9xZmwr1rYWaF7ZqOk8eSiOY4lC
 qaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aQIAtfxw9qFz9Hl/XRNhdWvv/WP4PsamsNA94vPOScw=;
 b=xEab4Wz+XiNYFsbgrYylB41sCpNZaQItM1Ct5j8g3FjbI2fz3owSVjyBcICAusMgJH
 jVb7wt8nLbHKiMHGARTtj2Vdd/zCr4UHgNeekWLltUcuTiiF4dZYuTRQ3tgn/NaoiYdZ
 BdioGgvNAFKPGT7fkAAoX+y8Z8VDPSUd/uct3saRkIpE4HIe/2z5KWEI5ufGVQ/G8ScT
 JliI7nHO8yA3GCk71Ldg2vE+QsvbFWSVxXwqlVrDZ6i4x7XC7JPyrBmvEz/tFafV+5wu
 1YM+Jqs82k7ps17+xVQjT12dn9G/UmAZImNw9u2jHeKjokGuAkL8+reOyU3aTn4djCh+
 VW/w==
X-Gm-Message-State: ACrzQf1Nb54qvRaiE5s7voHJXhwTmpjyyMhnE9XAu93ITTOXHdfq1oL0
 7WoUKtL1HGHJCndRkPr2U44=
X-Google-Smtp-Source: AMsMyM7/YTveBhPU+ZlmzDgp++oNS+vvRqhX5gWak6BuDVO4QseTU9T6OaWBOMN9HuEbtuNn71dvDw==
X-Received: by 2002:a05:600c:4ed3:b0:3b4:ade9:ecf0 with SMTP id
 g19-20020a05600c4ed300b003b4ade9ecf0mr11769784wmq.46.1665172066974; 
 Fri, 07 Oct 2022 12:47:46 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 e17-20020adfdbd1000000b0022ae59d472esm2705304wrj.112.2022.10.07.12.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 12:47:46 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/gem: remove redundant assignments to variable ret
Date: Fri,  7 Oct 2022 20:47:45 +0100
Message-Id: <20221007194745.2749277-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable ret is being assigned with a value that is never read
both before and after a while-loop. The variable is being re-assigned
inside the while-loop and afterwards on the call to the function
i915_gem_object_lock_interruptible. Remove the redundants assignments.

Cleans up clang scan-build warnings:

warning: Although the value stored to 'ret' is used in the
enclosing expression, the value is never actually read
from 'ret' [deadcode.DeadStores]

warning: Value stored to 'ret' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index d4398948f016..b7e24476a0fd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -292,7 +292,7 @@ int i915_gem_object_userptr_submit_init(struct drm_i915_gem_object *obj)
 	if (!i915_gem_object_is_readonly(obj))
 		gup_flags |= FOLL_WRITE;
 
-	pinned = ret = 0;
+	pinned = 0;
 	while (pinned < num_pages) {
 		ret = pin_user_pages_fast(obj->userptr.ptr + pinned * PAGE_SIZE,
 					  num_pages - pinned, gup_flags,
@@ -302,7 +302,6 @@ int i915_gem_object_userptr_submit_init(struct drm_i915_gem_object *obj)
 
 		pinned += ret;
 	}
-	ret = 0;
 
 	ret = i915_gem_object_lock_interruptible(obj, NULL);
 	if (ret)
-- 
2.37.3

