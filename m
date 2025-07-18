Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7126BB0AB5E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 23:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792C710E048;
	Fri, 18 Jul 2025 21:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RSQCYqQE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EB310E048
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 21:23:08 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-72c172f1de1so1535188a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 14:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752873788; x=1753478588; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tK+4glzE3WnB4vC6DvcGs4atxT+1n6gCTpv11Qz3u6E=;
 b=RSQCYqQEH5U47tBhd+7p3+7xJUekzZeksJ12jn1Yc857CwKx9QLD8qTDuQi0B8IsWP
 maYd9lOLy76nINYKRvAihzF0A6Wg+RW81vd0pEUeJ0xuYqfkwtP80B944hySNJx4yQMx
 Gh1EDRV2BD1cL2TauCqMHs229RCb2lWN1AFhe4VFYCZMXjW1x6ReETHgozZuFf6tCrtz
 TwkEshfZLbNHir2ScMMK0wiRBmliubKHoqAXObgWkR6Lo93gPn2OcvaPHzcBGe0bLbWh
 ER03714aMRhDNGPRCMT8XcZkK6qushayTb/oKQuHgJGs2Ko7OS3JYohPgdBh0CnbpdJq
 rUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752873788; x=1753478588;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tK+4glzE3WnB4vC6DvcGs4atxT+1n6gCTpv11Qz3u6E=;
 b=IxZ5hBAyXtJY0jgMjhlLNT54i1WyFiITv+/9/yuITrxwZpZS+s+Ziuu22V5Dge4kw3
 eydJ+wiKRK5sudX9vI/CtZ89+C0jswwSwdSqSmn6agPw6bQcJ5rdTHMwC8ao/MrYr0Dk
 vGf4KPgLKruAxVH2Df32UMSU4Fr5uxidK/e+rp0/vmfMBHcj3LqqOXbc5QAVHMYSPQSM
 AEqCDHFEb41XeEdqmTDulHOR/Sw4I15kAnW8qH9TGOPygo9OoFQBIFQxBHIIFW0sBAAQ
 riLghHH6+pCzq0n3mwvTMXrtubFJdKqZKe/ngXO58gUjiz4tEBh/ojcLrjYxKPcnuo+8
 LZIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxu+6em9gQvvYc64Lwn3soeCXXRZ4Xmm8uSRJL+bQBHNtxacxNwgQT/GRk20h+5F8P3t6DOGQuL38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjkLq/Aa2U92FCDg7X54G5eRkoc+P0VPwWKEBlMcS1bh2/lGge
 2ATET7ks+UDlgQS/amPza0Rs2NNPvFJJ4TOfMdna5/ZQJPLZWe6dlR4Y492Dse0B10Y=
X-Gm-Gg: ASbGncsAafM2tOforvH3J4viP1XMwfwC2j1yZYXuoq5L+hFcZNJ22ziduJiTsqFYEKC
 vXC8InczyHeOWnEsL2Drcq5OmIoCi8DlRBxxJeTYb5wGKS7WpXD4YL2CMSjanNoufS6X/mhvVOM
 iftfeYo41X2Bd7PEQScXAFg7AcHcXRmaN32qaRWpMj+kGXwF3IB4eg3kh0KJ12ZiZQCigAC6pgB
 7ydwtX94owaON5un5kkATZ+/gtYmyaAq5fiCaZzdMKrsbsPmJpyYdz3b5+YdUL29wXcCrTIMW/n
 AqWyk7nvRPP73To49bptkwWd0Yf/fVPoNfXSBm4dIGDWMsI/Ff2+fNt24YmF7XwqTl8nKl5dsoj
 IshjHpJ0FiSM=
X-Google-Smtp-Source: AGHT+IF9VLx8mE8trvjMG7+MlGusZoBXTEIHkS13K0W7mcIBsGRVkXXT81gfglD97zg1dabcDIqGHA==
X-Received: by 2002:a05:6830:8008:b0:73c:fb75:cee5 with SMTP id
 46e09a7af769-73e65f33953mr8211210a34.0.1752873787612; 
 Fri, 18 Jul 2025 14:23:07 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
 by smtp.gmail.com with UTF8SMTPSA id
 46e09a7af769-73e83560306sm949902a34.13.2025.07.18.14.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 14:23:07 -0700 (PDT)
Date: Fri, 18 Jul 2025 16:23:05 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe: Fix an IS_ERR() vs NULL bug in
 xe_tile_alloc_vram()
Message-ID: <5449065e-9758-4711-b706-78771c0753c4@sabinyo.mountain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The xe_vram_region_alloc() function returns NULL on error.  It never
returns error pointers.  Update the error checking to match.

Fixes: 4b0a5f5ce784 ("drm/xe: Unify the initialization of VRAM regions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_tile.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 0be0a5c57ef4..d49ba3401963 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -120,8 +120,8 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 		return 0;
 
 	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
-	if (IS_ERR(vram))
-		return PTR_ERR(vram);
+	if (!vram)
+		return -ENOMEM;
 	tile->mem.vram = vram;
 
 	return 0;
-- 
2.47.2

