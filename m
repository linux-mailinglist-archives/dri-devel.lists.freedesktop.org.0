Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66B6A18077
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0470610E24A;
	Tue, 21 Jan 2025 14:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oa+xTOG2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF36810E07E;
 Tue, 21 Jan 2025 14:52:07 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2ee46851b5eso7722128a91.1; 
 Tue, 21 Jan 2025 06:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737471127; x=1738075927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=porkxhj/+zcH8ElSFH8+hwoffhoJj1DhPV3pdsVdFTc=;
 b=Oa+xTOG2ydgG5pGwVrMIAwZtNwX2NGSPQoGmlcfeqBgLgvizgvMaMZwMStGNSIjjkA
 tI5V/GEitFDg7Y0rBY5A2J3F7afc37kRVvlY6o6lLyEPtftcO0ebHZzGsc8ODyA1r04s
 l+wKfMEZ7odn9uLKs9MKtTpiYT9AttjIe5/94zHRdb+XV4Vq2R16lUmgp6c4hHLE9Lai
 xVss/pk/aDm/SGRBsZn2WtTi+o+lzA5fG8RytX6wMDRxOGihhiQYsW8RnnQhQo8MMc+L
 wMsonSCANRiR4RJeq+oKk2A8Guh45egqzsqVs8B6N6q5YZpE8+Fo3BqTgQI5uUVFTzNT
 /UIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737471127; x=1738075927;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=porkxhj/+zcH8ElSFH8+hwoffhoJj1DhPV3pdsVdFTc=;
 b=XDuAkAr/m9vrM7jV7nrP0hnbXrzGOLXgjJBU2URveRiy19nR5hfmaqk9ZHztDUFe6x
 vsmVEDV6ZUctvjWx7Fe6Lq4Z5QPy0XawD6TeUUd+E5cIuhGA6THeSRxfPZNbTVhQy+Hn
 8mVrmP1ulvYKrl93BBiolnO0aQ7Lt6/LaATy4u27gZgcAHcIWU/pe39BZ8EYjYOr3IEe
 MRg0XuEJFJpDOIKGc5tla553m2GQ2TS2I21HtwnKtP2k1m1E4ILUi+VFI2NHtw3qvsnY
 5qvUHBkV79zHt5ftOMqfxP2+dFb+wiuwX9U49Q7+u8H7knOjdfpByCLJQJKvYP5lgPOf
 3sjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHsDVbaVfxoStTNJfhp7eO/rIeX5rCTJIBVcJ263KiPbJMrX+RlU0jYrRBQkYQNzeGvcmGJJOkass=@lists.freedesktop.org,
 AJvYcCWM8OF3xAviaBEfqIeyIlyToHdHlIx92LrddL4dSue5ehLqxVYZGCmE1ZdpAJYRA7FsETYXIo6oIu8=@lists.freedesktop.org,
 AJvYcCX1uiEG7/T3IZQyXpcPfEu4ENaGPf6NVJTH5zxsy14bght2BVKRSoxLgLGnp5LiGHxEXLEZ0dK+TCV8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwFkHSQqh9c1GzxDL5OT0Pyy8ukjvAIY0NIGuDDTioAMHpXZX2
 ng9Ln5c2+FhL9PFMUlpsns5TAdRaiEP1KwCiLh7aPqsUFBBOkp6z
X-Gm-Gg: ASbGncv609kc9kgvKbIZSdrABkzf0KdjuSL/6DAtLMOOvvfUBzjQeTGFPArrjfLYVTi
 LWR5DliVNwZwy2YlxKJCyEUXLJf/4ReqRS4pS0RkANIi/fH6Hh1NyjPWzYj7GkvlTVZW4EQ2qG6
 vL+EWn251IO+avr7lIqxKCWvrbKqj2hMEOIxv7czQT6OotMZSOcwvVjUI4d3HNmQs2LgYOZwoih
 T+hFLbApVEdiKMaqAWWdOHb/blTVLAZqf743/ImTYisSK75ixvbxPnoXBhOI3ZUbFDzpsNBaX8K
 k4k6+ps=
X-Google-Smtp-Source: AGHT+IHG6AulQAMp9lo7QPMhMqUcQBMJUVIU2FAi1WsQ3R8uLGEj/dWdq1k/P/GXTHjvvZU/GSkHbg==
X-Received: by 2002:a05:6a00:1743:b0:725:f1b1:cbc5 with SMTP id
 d2e1a72fcca58-72daf931e97mr28621439b3a.3.1737471127314; 
 Tue, 21 Jan 2025 06:52:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dabac5a46sm9354747b3a.177.2025.01.21.06.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 06:52:06 -0800 (PST)
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
Subject: [PATCH v2] drm/i915/backlight: Return immediately when scale() finds
 invalid parameters
Date: Tue, 21 Jan 2025 06:52:03 -0800
Message-ID: <20250121145203.2851237-1-linux@roeck-us.net>
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
v2: Simplify code to always return target_min after a warning,
    and also warn if source_min == source_max.

 drivers/gpu/drm/i915/display/intel_backlight.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index 3f81a726cc7d..ca588bed82b9 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -40,8 +40,9 @@ static u32 scale(u32 source_val,
 {
 	u64 target_val;
 
-	WARN_ON(source_min > source_max);
-	WARN_ON(target_min > target_max);
+	if (WARN_ON(source_min >= source_max) ||
+	    WARN_ON(target_min > target_max))
+		return target_min;
 
 	/* defensive */
 	source_val = clamp(source_val, source_min, source_max);
-- 
2.45.2

