Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DCBAD994C
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 02:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F122010E9BD;
	Sat, 14 Jun 2025 00:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gVYacL2n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307A810E9BD
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 00:56:50 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-71173646662so7394647b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 17:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749862609; x=1750467409; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mdIKn3wdJO2XExN/WHdwt4Lo65I7MBUrtS2tDyrRbMg=;
 b=gVYacL2nt8Kd+mMPD/tiwdboeN5GrE/tPljKjkDFyGXpds1EKIXo06uTrDldPrY/wJ
 VzKgbDeX4W0NErQVGSZoRa13xRuZYe2hc9pa1rYsaLiTeCuxZVFTNejhEljrc6PUVBgd
 txrlY6UBBqJjRP7HZXfd1lf4JjT7keb9J3HQoWjxyS8SJdHxakanaGbIL9t/Gidb0mjj
 yPYnyHXY4W9OEccKhJyadesY+TWb0vtLFH5W7p0dwZpL9KDwyud7MVNT/MqXHubXLMUQ
 l4MgyjksEP9QBKWDyPaK5AaKCj08gccHuFpNShCC5UzrVXcHZr81SwaJjK9aAhfKklfH
 x0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749862609; x=1750467409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mdIKn3wdJO2XExN/WHdwt4Lo65I7MBUrtS2tDyrRbMg=;
 b=LIC32HU7wkyMF9PdepgtIMJ102SJ4Y0aGLAygtncD1ABDawutfNCwWP2Hoivnc+jBF
 pNARWvPKkBwUH7fcwC/kt2rP9GrihzqMSsMubGeVDIxvLRrDNKMF2tcwpJ2k6pjFNvqL
 9Z85WS8NoMy3yxRlLqyHddzrg32UhbhBkyI+EoIh/o/z6XymT44uyRmjTai6dzHUS7FN
 AHemxO9fcwPhiaus8kP9eVdT/ywDsYzjPcdODdz9RO0IrLLOvPeQsSnsCgs+Yyo9Mare
 utT6MDr8PKvWYx0xPb7atz0HVZsXmGaO2zmvIoTWaDKDlV+8yvOdhawsvDMqpHRqXDaX
 Gzug==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6kd9dbqWWeVjfjXxV9kv3zf+BRJqTuq+wCVKCX7QPf/1oBcjvFiGQBlcOXF3aeK6u7H2vWPLDa74=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz59aeJGhzjL7R7GD/Bs/3hxkX7DFXgD0UupEy3OgNVdK9gd+s
 LHzl8NL2u2HA1J6La1bqi7Xvbl5vUPHNArRqf8GUX8lDEHee/9JQlio1
X-Gm-Gg: ASbGncsKvpXnO3DF4aYcBoWqnGlhtwVpo5a/Hvl+QLCqW+wke+FPHdWJZG7KvW/j+sM
 kdDcKz5a8IVnreYceIgqxOpkHeOkD5S2nwNiy5U2isOUjeYW6LFNbWAkuSWDHpyODj1ApNjoeGO
 FEAJxNwg9WudmlExcQiYcmpOe8sjCufaYQNW9ZbIdifwjKiH1okgpS3J5SXSA2Cay4ZDO+RmGSW
 Jr0lpJV23m5SKCpHLlp7FGomJ6V9xeR5Za6fG7cxiV5EQS+oOTPFASBOfWPUHwUmh/7WL//+3zV
 MGvtpliFhBg0YKX6Jqh1fjNI6kwdGxs9gtpUPl1m7zXX47WfOs0UM0U20HdLsqKTrV1JETMZur+
 o
X-Google-Smtp-Source: AGHT+IHLuKsPDjX21BdIOxWNUoG6I+EDot9WFeuTidGb7Kc6z6wZKt2memdE+eHsyv1q3F406LRI1g==
X-Received: by 2002:a05:690c:6c0a:b0:70e:6105:2360 with SMTP id
 00721157ae682-71175508ef1mr21399277b3.24.1749862609220; 
 Fri, 13 Jun 2025 17:56:49 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-711520bb0aasm8618007b3.51.2025.06.13.17.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 17:56:48 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: deller@gmx.de
Cc: alexguo1023@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: tdfxfb: Fix potential divide by zero
Date: Fri, 13 Jun 2025 20:56:46 -0400
Message-Id: <20250614005646.3117593-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Variable var->pixclock can be set by user. In case it equals to
zero, divide by zero would occur in tdfxfb_check_var. Similar
crashes have happened in other fbdev drivers. We fix this by
checking whether 'pixclock' is zero.

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/video/fbdev/tdfxfb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index 51ebe78359ec..2100857fa7b3 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -495,6 +495,9 @@ static int tdfxfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 			return -EINVAL;
 		}
 	}
+	
+	if (var->pixclock <= KHZ2PICOS(par->max_pixclock))
+		var->pixclock = KHZ2PICOS(par->max_pixclock) + 1;
 
 	if (PICOS2KHZ(var->pixclock) > par->max_pixclock) {
 		DPRINTK("pixclock too high (%ldKHz)\n",
-- 
2.34.1

