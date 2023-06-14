Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 959A873112C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 09:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7990010E083;
	Thu, 15 Jun 2023 07:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D275310E12A;
 Wed, 14 Jun 2023 12:36:06 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6537d2a8c20so5259125b3a.2; 
 Wed, 14 Jun 2023 05:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686746165; x=1689338165;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4e+Pwp+021TOiqEOI55JQb3RjMEOtcdSeHsod/nYw0o=;
 b=V+SK9acdDTnYBrQKZHF8LeRsGMn16ZHTwKjr6/V6NkXCuBoLLzDUu2M0Nfa+OFigNK
 V4mQFdEHDLPFNGAHcke1u4x7oi0gwn+8sSer3mbHXMTPH4KzJ9EHm7s6O7S8YuK2HChJ
 /3Z/Ndb5PEZlD/1RlJPV63dLNOflrGTYfxFYmOhTgJ6/K7qwLvsbI1BmE0URxNHCVRXo
 9R2P0rV1z6rLJ6IfG7arZAz9VmdPMFRQ6xpVawkJQ1w+PTLcc2T9pMQa4lhz4V2yo/EW
 +EQhBPpZFjsn/mbRUj0tN2+wlhbExNE2qB0PJFzysg1AAEeDMpDC6NSsKLyfXZ0iDzEN
 VSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686746165; x=1689338165;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4e+Pwp+021TOiqEOI55JQb3RjMEOtcdSeHsod/nYw0o=;
 b=RiavSbgxVowel/jI1zKggqqF62sZMlzSTe2QrQCV67M5gcMB1Pz1gk0eOzgn98Yxlb
 uDRiQ7tyWp2b+hETN98FnrZlKfdfevW0PvBhDjww8a4sJUSsp1v8a7SeNi+G4HDAWz0O
 rAlQWaTHPkcmVHAwJ7hq+QMbuGhRlcNbq1L82CAXfw2dH1mMGZJAM7kD0JiasEV8yocZ
 k9Dbq7uF5eoDspeTGGkjaEqweWFX4ReKeHP1y9Bk0v/CsSwCl3DKNv66PZ8Bj+u8Gp8I
 Y7AqKIWnK33aYcorG+FVtx3oPj6+T//XHTezo+TfA1hqGe/NGxvo4BYH5cmVIG2WYzzN
 Jm2g==
X-Gm-Message-State: AC+VfDz6Z5nHcx+ZFvNshqLw7gqPLfLSWQMsZssH5qbymxmO+4ReoDCw
 BiA6ZK4FLErO+P/mVFe5I7QbbT+AE5qdwonI
X-Google-Smtp-Source: ACHHUZ4+dJFI8HJ6v4oIutm5MrkaLnh0wkcAaLETYhTmKqSAen1q8lTzmzcujbzgFoRsU+WyzbV+Tg==
X-Received: by 2002:a05:6a00:2352:b0:665:bd58:c948 with SMTP id
 j18-20020a056a00235200b00665bd58c948mr2301728pfj.8.1686746164598; 
 Wed, 14 Jun 2023 05:36:04 -0700 (PDT)
Received: from sumitra.com ([117.245.169.18]) by smtp.gmail.com with ESMTPSA id
 j1-20020aa78001000000b00634dde2992bsm10250199pfi.132.2023.06.14.05.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 05:36:04 -0700 (PDT)
Date: Wed, 14 Jun 2023 05:35:56 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: Call page_address() on page acquired with
 GFP_KERNEL flag
Message-ID: <20230614123556.GA381200@sumitra.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 15 Jun 2023 07:46:51 +0000
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

Pages allocated with GFP_KERNEL cannot come from Highmem.
That is why there is no need to call kmap() on them.

Therefore, don't call kmap() on the page coming from
vma_res->bi.pages using for_each_sgt_page() in
i915_vma_coredump_create().

Use a plain page_address() to get the kernel address instead.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index f020c0086fbc..6f51cb4fc55c 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1164,9 +1164,8 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 
 			drm_clflush_pages(&page, 1);
 
-			s = kmap(page);
+			s = page_address(page);
 			ret = compress_page(compress, s, dst, false);
-			kunmap(page);
 
 			drm_clflush_pages(&page, 1);
 
-- 
2.25.1

