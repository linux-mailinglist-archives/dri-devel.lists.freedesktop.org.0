Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F19B19219
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D2810E4C7;
	Sun,  3 Aug 2025 03:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RW/k87Qq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C379310E4CF;
 Sun,  3 Aug 2025 03:59:38 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3e40ac40940so12344435ab.0; 
 Sat, 02 Aug 2025 20:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193578; x=1754798378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YD1c9lgMbY1eaVT6v6ivEZXAlodIcOc1Rh1pqLxYHFs=;
 b=RW/k87QqqBABdLhLuQ01dPFAiGMl+5zdn4m0Btk/rxTlxJLz41TUt6p1ZQM24SJ84L
 jA6VCiS5Mc5ef9n+ek+/eldDsgr3CLvZy6PbW1w6C34OoHRVDh6fzOxAvkJq6sR06nCL
 p4JyMXcgTAQSkq/LwcvblR4Yi6kac6AHQUXNaAD3geid4JABooEt/vZSoll2QD2TyiXR
 RsLIjNVPJsDU3/ibrZXa6xkjlmHEmDm2mhpTF+dXX+I0rLXRmZEF78pQXNKw4AvnbFoA
 lNW6L2ev2un97ydaneVNJ/i2EL/3BN4LpkN7ekB+j8eHSjzD5kA35CoHm97//1Bh6mhr
 iKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193578; x=1754798378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YD1c9lgMbY1eaVT6v6ivEZXAlodIcOc1Rh1pqLxYHFs=;
 b=vTrW9KpEawaZXcOFBk+a4YrBuaMcZKD985OKYdOebIkLHZF8ojDDxvS3QZ0V1yfZyD
 t2mXoUWXaOFIklaNgS5vWk7Z0VevSL7jPJh2tum/hwna8u0VLhZALZQoWHu7Bkhlhp+U
 RXaqLR070V/ObVe7/1+my+g+UGAvFag2GzaA/SSbRD/RBQr9fCAHxcwykDNtogOsjrxQ
 6tcXjioKRg59UiE6qvHQkKKWBmTFiO+ZLOVPWNDuPYTEJLAviY8t/q9UVE5f99h7vhv+
 MII4m472n1vJEa7Ou+3XcSAIJVByhXpHPHlvwoTtzUgbpEXKV7/CX+cnPa8AIMJ3/wYk
 FCJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV73nD72G/JuvTNb/NG0hQul08Cg/Sxjeu+/t2mSLybWTo9wWgRm0/TzgOETb6c1mOqXMZJvnQsZL4+n+HTqA==@lists.freedesktop.org,
 AJvYcCVdyGQKQj433P+Dq9mGoKXr55oLYu7bU5i5wKuP7TkJgrZgvtRiQKzz85CNJ4EfuggvVNKzvMLCjB/k@lists.freedesktop.org,
 AJvYcCVr03sCayX/6vOC+1HTGm/E+VgUsakhBQ838msAA4wZ3w+1IaEHS4jiScmdYN/08skJL6XaJQTP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwicK8qW0zNkYZjnZAYyYl9eL1eAjngiNyo3CyfZ1i+MHxTYf3m
 6rviN5MXJm5uUKdoWO/99x9Vs9JGB2PcaeJkjAtRZRffIh5u3xIUH/2W
X-Gm-Gg: ASbGncteVm+wvg14oJIY4919e7ZmzF6EBShBcISUZVx/m2HRaaSYiAEF8aA2iy0hunV
 JBOP6zX2BCKDib/jE6+A6gYr8tTkyN7LFYJzW/jr1Rb+SEyn22dWWp1mL9v3+xY48YgJOb6cksV
 gJTFrmgrwI8CH1rFhV8BaPWePthT3+CPoPceRHSvGB3N3u8X3/M4zU1pOi05WiU8917oOLhL9bb
 8Mxi0RQySjKp8QALZB76vwCeCLxUkEzh6jvxgYyP1Oh8EMaTSnJiwcHNmFpXA+Fdfn5dUezYeKt
 wF4ubp2voPENIWt348KD1rkNZ9VPFbCwp/Gtbu+Z1O4XhQvWoq3bl7ROVo4wU2eZlDWgA1dmLgL
 SIJwEsHIhmV3wH3Oj+iMlWPB2Q7sTBhtBk8EHbKcyO8itU1NyIaS3xhmsiADZYTj+3Qq/ZwGuOJ
 yO+fjlShp0lvXC
X-Google-Smtp-Source: AGHT+IEjmtrpy7aLLw6jvxFkKmow/fhVsLi167CpcWmTeMCa0QQeXgukw0jkAUEoPTovODFGo/PAgg==
X-Received: by 2002:a05:6e02:4403:20b0:3e4:64e:4fce with SMTP id
 e9e14a558f8ab-3e4064e55d9mr146712775ab.8.1754193578031; 
 Sat, 02 Aug 2025 20:59:38 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 44/58] drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
Date: Sat,  2 Aug 2025 21:58:02 -0600
Message-ID: <20250803035816.603405-45-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

tiny/simpledrm has 3 DRM_UT_DRIVER debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index a1c3119330def..3562d6dacdc9c 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -34,6 +34,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * Helpers for simplefb
  */
-- 
2.50.1

