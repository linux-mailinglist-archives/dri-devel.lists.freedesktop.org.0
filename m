Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3ED825346
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 13:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C110F10E5EC;
	Fri,  5 Jan 2024 12:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DE610E5EC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 12:20:40 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a298accc440so23217866b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 04:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704457239; x=1705062039; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VPgoGs4JCmFCXEz83XMMwyrfsqP4QMFdJVq1Hj+FDjY=;
 b=mSNt6E7cHwPW1HpT/6gSYIcUObdFm81KsCT4SYwchfSlP+AEaFm2pn8wwN4l8mMbAy
 lQcae/FC/G2964ij2iDWj7cGMOmdIDBO5qBjKM3GHUwJdlZJO1muFxKTKesAJimscFtF
 vqY/eOnJ7uGlutfOLF6V5Wj2PNcx7HE3ik2i5chRFjI8JcetYtqggAs7UN3Xbb9KB7DT
 WaAjsHC6LO4aGEQDMuEH5NqSs7TUR/WCsy7qMDLg7Bh84jA+/e99iFG9dbVWVBM8V3rf
 AxwTLkTftDtFsJs0KbCdaMg0k1B3O+1UGWXr2aZSbFlkr6n4JO3CKoYcmidNyfC8Gqgs
 E8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704457239; x=1705062039;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VPgoGs4JCmFCXEz83XMMwyrfsqP4QMFdJVq1Hj+FDjY=;
 b=udReQB0GO5He7ooOENqP+HH4YpMxGuwvUl01dYpdXJAQAIltRWgKZCQ7hB491euZmY
 wrT9EX+AOzVfg7efb9VX9OwMY8fvDRp3rJ938cLlenPUoWR9DROqEUvJssTCrhQ5Ylnc
 tlZZEBI8HVs/0cdh3Zp/ETb4Y3k3/giyNL4MH6AnuAI5FraWkMDsk6eeSXPbE/Z9p3SX
 RSVtSnusSSb0b37DehvNlkl2ZztG6wo94zbaBGk/0rCxSWyGgMSR/fgxyYuQnfeh4opb
 278m657oDRyuwLpOYURLNQsun8E0WJWwCqztWRix7rY0AXbhdac8m+/d1RRFLenwzNJz
 5Rqg==
X-Gm-Message-State: AOJu0YzNa+BnlORfKsJJcON7AuI2wVMOhLxHWDJMN8p7l7TkMWvchR1d
 58Yeinxa8T3RGILdIBSNKcr4BzreOJVfbg==
X-Google-Smtp-Source: AGHT+IGTi4ByJkUR6/L3sBCprInPncsNYvpNn81WSpgeD5kLCGkvWCFb+4d+d6d898+eLssOzT1V0A==
X-Received: by 2002:a17:906:51c1:b0:a28:fa55:3597 with SMTP id
 v1-20020a17090651c100b00a28fa553597mr923237ejk.98.1704457239116; 
 Fri, 05 Jan 2024 04:20:39 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 r3-20020a170906704300b00a27e4d34455sm820240ejj.183.2024.01.05.04.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 04:20:38 -0800 (PST)
Date: Fri, 5 Jan 2024 15:20:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] drm/xe/selftests: Fix an error pointer dereference bug
Message-ID: <5c0db456-2d8a-485f-875d-6408386fcaa5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Pallavi Mishra <pallavi.mishra@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check if "bo" is an error pointer before calling xe_bo_lock() on it.

Fixes: d6abc18d6693 ("drm/xe/xe2: Modify xe_bo_test for system memory")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 412b2e7ce40c..3436fd9cf2b2 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -125,14 +125,13 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 
 	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
 			       ttm_bo_type_device, bo_flags);
-
-	xe_bo_lock(bo, false);
-
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "Failed to create bo.\n");
 		return;
 	}
 
+	xe_bo_lock(bo, false);
+
 	kunit_info(test, "Verifying that CCS data is cleared on creation.\n");
 	ret = ccs_test_migrate(tile, bo, false, 0ULL, 0xdeadbeefdeadbeefULL,
 			       test);
-- 
2.42.0

