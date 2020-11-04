Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A32A78C0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E676E176;
	Thu,  5 Nov 2020 08:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB87689E11;
 Wed,  4 Nov 2020 15:03:47 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id j18so17513728pfa.0;
 Wed, 04 Nov 2020 07:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=Cpcyf2os5AGZUKltjzw6mmvdqbBSobD8RORnek/XVyo=;
 b=D8ncMu08T1OvGeBwqUDALGzrifbn52YuhJiLosvBbOamy07+NM4aRofAi6wpZhFu7o
 h6+vsSgcuCac+V2pdkw8jQUXQO4fMMNMHJJYkr1bwJqmmZZICd+PzKySiGcaGb2iIoVr
 OBL0dalld+I48UA6Fx5fpYfVGzZ+KxU9rUqlwKfiRqWvuX2vZLeEDrl4vLNaHUYCvLhj
 DcCQXPJTYd0UjGjzrFXenLrwgbyNDEncChAJ31m+CXLgt6Kbx6vYJZa5FkLttq8S07Lk
 ySRi1mkBE+5tARxbwx6uKCIV9dFa2jCUNVrB2IpckikzQVS81JiZdJvQO7401/mfHR/8
 vWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Cpcyf2os5AGZUKltjzw6mmvdqbBSobD8RORnek/XVyo=;
 b=p23rT2Qb9xRwV+9tNZsQRWlLbBRYdnBfdIFQEyAyWRh7VO6XSl0Np9mbJyNlInS/Qz
 hRbWUL4AuWPcJ914K20uDCWL4LHoooHz6u0+w6lw9gZ5ESXcdS2f0JRX+mCvRqvVvI1R
 U0mJhNXpR+qfB8ZXEqpXwLUaq8XZ9LvfCKfUuLKgBR0JGax0EBxGjtieLxiF/3IcLhpX
 /5+D5SWmtYZq5CtiM3Ul+cRpBqfMxu9I1zT46iFOOalI2nXSDdg2BErAtEeUoctQOdIT
 ld8QS1ShaJK+4XM0gil5gCGjjrnmJ6jOSxLKOZBmmkrHWR4eFt46bQBkl6FnvEMpTj55
 Eq8A==
X-Gm-Message-State: AOAM530nVpJdSW8BbFjvjEdJWL40NfGt6m0ZZgj7T6+ygXXum8AV/khb
 XL5XcHrJFeaMgwNFTpkGBPE=
X-Google-Smtp-Source: ABdhPJwAnv8VuhxZLOh69pT/O6WNOFA7xnF9jPLzCeTgfTiii/Zr65gXy4oBF1C/+g76XjU5+oip1w==
X-Received: by 2002:a17:90b:30d2:: with SMTP id
 hi18mr4834398pjb.186.1604502227223; 
 Wed, 04 Nov 2020 07:03:47 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id 21sm2831827pfv.122.2020.11.04.07.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 07:03:46 -0800 (PST)
Date: Wed, 4 Nov 2020 20:33:39 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/perf: replace idr_init() by idr_init_base()
Message-ID: <20201104150339.GA68663@localhost>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

idr_init() uses base 0 which is an invalid identifier. The new function
idr_init_base allows IDR to set the ID lookup from base 1. This avoids
all lookups that otherwise starts from 0 since 0 is always unused.

References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/i915/i915_perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index e94976976571..2d033255b7cf 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4367,7 +4367,7 @@ void i915_perf_init(struct drm_i915_private *i915)
 			RUNTIME_INFO(i915)->cs_timestamp_frequency_hz / 2;
 
 		mutex_init(&perf->metrics_lock);
-		idr_init(&perf->metrics_idr);
+		idr_init_base(&perf->metrics_idr, 1);
 
 		/* We set up some ratelimit state to potentially throttle any
 		 * _NOTES about spurious, invalid OA reports which we don't
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
