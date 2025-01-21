Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B45A1773F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 07:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A901A10E08C;
	Tue, 21 Jan 2025 06:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cJRcKeJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C9510E08C;
 Tue, 21 Jan 2025 06:17:49 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-216728b1836so87943775ad.0; 
 Mon, 20 Jan 2025 22:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737440269; x=1738045069; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=iDq0kPb84WczT9MQeJwoPJOmDSoc1BTBjNUEr3cEsPE=;
 b=cJRcKeJJJm05wBUbN2HJMAFvvI0T/TjWkdgqWPiN4XCYGd5k0lHIGg8/Ov5gPLp+AL
 qr9jd8dHVfrIaCMsluMgiki0yrkA0bmDrWMPcbnbEm9aPodu3tEmjncNZ5wYHnVFFpua
 fOnJd9I3p8QbyGPWJ/rZmUI9GEnGR1zUPIAnNNiK/EjyNGZVDeNBc5S62AOpvbtQQ3ZM
 0XT4K6hih3nHF2ouD1Odjb7Z7GvmT7qFPjXMww3oNcuhX3dzF0PhPkrIkgGt0KtCYtYa
 f+Ow1KY+hV7XAQ/11fESTyu5P82p6iFcVzre4aATgYBwYyrooGsHyblhdCDHu8TYSmQK
 IYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737440269; x=1738045069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDq0kPb84WczT9MQeJwoPJOmDSoc1BTBjNUEr3cEsPE=;
 b=Gwsuv0ee6xxS4ZoqFhLCR+TS6oRx9+ART9pJXsyyUFX01n3WEytGb5mDgIqDqZrZ4b
 G4ysCjZVow0voeeqfYd4uLUT27b+S4qALd1333ImX4Co+v3sS3sxW7IJ8X3fBDyKaQ3e
 6o0901yF1TUQWLW+fwYzwd+cXZRaiN8jms5Y7eXuqTUNYgou6+dkeHerPOpPusDh8YOx
 sv/VIqeAUS6366bNFy8E2d0fxbgUkEQ9S/3jvwamXsHXLTA6sEK5252kq6vGyKoMbEaT
 zEhQXDAjnjKIfV1HX5Z2WhlxOwQ+Ou9NKcTTEp8kX9E2brQ8lLC03NppgjzuJmsyYgOb
 5WTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXZgRGlvISc7AEPHjvY5pRxJoaJKD/dSogoNL2IpowhG/y32pzXj0vCBv81Qs+Ut34qQoV2zhRqYg=@lists.freedesktop.org,
 AJvYcCWz+cwPr9K7kyReg6o68e4+dCa2sjseDqZ0kYjDktiWFOdvqps3tA55J4yn5W/fOmteNR7sq/cj46c=@lists.freedesktop.org,
 AJvYcCXvrzpEc+Zc/Gb+1o3KrY0ZRKWkIJ7lFmi43XYjwq+ewPMGoQgVcHITIXduB5CNpj0+cGprIUquS/wF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxM+5rpP9zk5kpLo4N3TAQKwgp/DIRwhFRUk3sT8gRw+249OiZV
 IIQkrt+ebkf48/f+ce4Ad1n53Ljklt0Rf6/2aBi4mYmIjtEefBtI
X-Gm-Gg: ASbGncuaHyC+UFG3R0EYossWQcM5QN/w/l3dBzMmRAFayQnlLuy7T0Gp4uPjOV8qDoJ
 GAbnh+n491aiJxQJdDKB0UZ7Ogp+p6GDxGovlAJhusKQ5FDi/5Yov4ggp671iY/ae6VH5gxoa6/
 5wY2FQS+RKpJ+N0ZFKVRxzGx5draFfpZPyVJ+UMO+E/ZAzo9VPvKmhUugp7T7i4FLifXBCOeLpJ
 vFr2woip5JsVlOI5/bcnC7SHO4BXZRVct11XEqr4F2NmtnCGo7rnqcWc03uMSFGlolnhwS5h35Y
 YxRk1yg=
X-Google-Smtp-Source: AGHT+IF03Y1LucOCV0tkeb8S5YCR33VCgat/S0g+S0RzWRHq65CWm/1TVpTRfQRl8e4mZA9td+6kiQ==
X-Received: by 2002:a05:6a20:9190:b0:1d9:2b51:3ccd with SMTP id
 adf61e73a8af0-1eb214602ddmr28737989637.7.1737440269120; 
 Mon, 20 Jan 2025 22:17:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-a9bdd30d1fdsm8087715a12.60.2025.01.20.22.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 22:17:48 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Laight <david.laight.linux@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] drm/i915/backlight: Return immediately when scale() finds
 invalid parameters
Date: Mon, 20 Jan 2025 22:17:46 -0800
Message-ID: <20250121061746.2730572-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
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

The scale() functions detects invalid parameters, but continues
its calculations anyway. This causes bad results if negative values
are used for unsigned operations. Worst case, a division by 0 error
will be seen if source_min == source_max.

On top of that, after v6.13, the sequence of WARN_ON() followed by clamp()
may result in a build error with gcc 13.x.

drivers/gpu/drm/i915/display/intel_backlight.c: In function 'scale':
include/linux/compiler_types.h:542:45: error:
	call to '__compiletime_assert_415' declared with attribute error:
	clamp() low limit source_min greater than high limit source_max

This happens if the compiler decides to rearrange the code as follows.

        if (source_min > source_max) {
                WARN(..);
                /* Do the clamp() knowing that source_min > source_max */
                source_val = clamp(source_val, source_min, source_max);
        } else {
                /* Do the clamp knowing that source_min <= source_max */
                source_val = clamp(source_val, source_min, source_max);
        }

Fix the problem by evaluating the return values from WARN_ON and returning
immediately after a warning. While at it, fix divide by zero error seen
if source_min == source_max.

Analyzed-by: Linus Torvalds <torvalds@linux-foundation.org>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/i915/display/intel_backlight.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index 3f81a726cc7d..ad49bd4a1c12 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -40,8 +40,11 @@ static u32 scale(u32 source_val,
 {
 	u64 target_val;
 
-	WARN_ON(source_min > source_max);
-	WARN_ON(target_min > target_max);
+	if (WARN_ON(target_min > target_max))
+		return target_min;
+
+	if (WARN_ON(source_min > source_max) || source_min == source_max)
+		return target_min + (target_max - target_min) / 2;
 
 	/* defensive */
 	source_val = clamp(source_val, source_min, source_max);
-- 
2.45.2

