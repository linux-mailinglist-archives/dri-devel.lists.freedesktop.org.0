Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F5B734574
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 10:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F77610E0DB;
	Sun, 18 Jun 2023 08:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CBB10E00D;
 Sat, 17 Jun 2023 18:04:29 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-543ae674f37so1012188a12.1; 
 Sat, 17 Jun 2023 11:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687025068; x=1689617068;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TAXkLrzOYTyQH4veg/Dt+9+g8a33rt2RkO+aGzgEOIA=;
 b=EPj4hELLQ/zwqn/azC16NEZei2+FnhMoui6L4UfP+pc7OUzilqwcpT1vzX2af90O5L
 NzyKK+UoT7FhGRFHmi87jGoNKutjag5SCA3fzfFi0kAirpG3LuMPgbv/SbozPR4RCb6f
 1wyueZswBpStzhmO18cUEcxC3+SrmyfDEopp20ZR4TNwF/+t/MfNjJrBfrsBB0y6hxPg
 3slnv6LFNDUU4qfge+mCv9MCICKRB49EUpT3oqU0zgcxA84rO3qwJH3K1Hgk+rGIAZOr
 zlWXF9fZUx7rZAnrFsscVQ3eNluXuE+qJpH6/Trli8TwQKjxAiBnOOx98qS3alCdopfK
 9V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687025068; x=1689617068;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TAXkLrzOYTyQH4veg/Dt+9+g8a33rt2RkO+aGzgEOIA=;
 b=jbDdwC4+cTtP4K2EzxgCcfCoOGPbIjeJT+sw1EliK5Nu4eW32Nl0olHeG4pxiHeZPF
 HovKxubMIWHVuNLmn/rW/WTHoqmdRSXplTi25oRGlR+1pBPGHeAU2i4AE82M4c3ND6SB
 3t9maJ0sYFJCGnKSwFYjtNZp+snCC8x6TWiGUDiD7wM7upna1FvW4afIxTBFxWUExunR
 iZWOyOokxIM1sVEowOSflDQhkJSoxuVriyWddRBfMCxKruPgDz9Pqzo+R3cRyibCDiYW
 pS+rMSWtbTgqqQr13Om/UqiLJKRf2biWvfohRWo6XSOAXf8cytgxpH4FxMYuPvfSh2Tr
 HZuw==
X-Gm-Message-State: AC+VfDzKvZjttUtvJ9CeHhr98YGh9TodBFLwx9Rv/kCJOUSp/e1wkdlc
 VkAh5fga+UXas0ug2ewNGPw=
X-Google-Smtp-Source: ACHHUZ6PvHQ/Ekv32QbsmQuxA6xm6VWsWXZcW5Y38eZX3M54/kRRT71RSXLM/IMiHAuIDJSvQx6pZA==
X-Received: by 2002:a05:6a20:5483:b0:11f:9124:ab1a with SMTP id
 i3-20020a056a20548300b0011f9124ab1amr1335789pzk.6.1687025068298; 
 Sat, 17 Jun 2023 11:04:28 -0700 (PDT)
Received: from sumitra.com ([117.199.158.52]) by smtp.gmail.com with ESMTPSA id
 d24-20020aa78698000000b0065fd8075ba0sm853873pfo.212.2023.06.17.11.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jun 2023 11:04:27 -0700 (PDT)
Date: Sat, 17 Jun 2023 11:04:20 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/i915: Replace kmap() with kmap_local_page()
Message-ID: <20230617180420.GA410966@sumitra.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 18 Jun 2023 08:21:45 +0000
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
Cc: Deepak R Varma <drv@mailo.com>, Fabio <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Sumitra Sharma <sumitraartsy@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kmap() has been deprecated in favor of the kmap_local_page()
due to high cost, restricted mapping space, the overhead of a
global lock for synchronization, and making the process sleep
in the absence of free slots.

kmap_local_page() is faster than kmap() and offers thread-local
and CPU-local mappings, take pagefaults in a local kmap region
and preserves preemption by saving the mappings of outgoing tasks
and restoring those of the incoming one during a context switch.

The mapping is kept thread local in the function
“i915_vma_coredump_create” in i915_gpu_error.c

Therefore, replace kmap() with kmap_local_page().

Suggested-by: Ira Weiny <ira.weiny@intel.com>

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---

Changes in v2:
	- Replace kmap() with kmap_local_page().
	- Change commit subject and message.

 drivers/gpu/drm/i915/i915_gpu_error.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index f020c0086fbc..bc41500eedf5 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1164,9 +1164,9 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 
 			drm_clflush_pages(&page, 1);
 
-			s = kmap(page);
+			s = kmap_local_page(page);
 			ret = compress_page(compress, s, dst, false);
-			kunmap(page);
+			kunmap_local(s);
 
 			drm_clflush_pages(&page, 1);
 
-- 
2.25.1

