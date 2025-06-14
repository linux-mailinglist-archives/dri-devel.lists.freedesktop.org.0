Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD939AD9A28
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 07:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A254710E1F8;
	Sat, 14 Jun 2025 05:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UsSJmvhS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3AE10E1F8
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 05:11:05 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e812c817de0so2492819276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 22:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749877864; x=1750482664; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CHjv9BHr/Bsn0d/syXcvcyuTrhfwt4Dz6/Z8OFUN72Y=;
 b=UsSJmvhSsVR5dOZUMpuDRSHfvbQsYjGZap2qGzYctpCBq+ADOCc82c2q2z/NOmv/qV
 8bEZ2beKrIEBGmLAOhDFbWfjTPPvIxFWbOmAyNVhR9Ao1Uu6NoSb797RRd93HI8jlqMi
 nDGbT12H6eAjel9xMHKZ0mE8MB/phm1v8chCEi7s2i1qhMqQ70/0OEdTgm5QGpSqAMjC
 I38R2qazSv9NThDGSZh6h/4vc88bVxXRpZcSTy+jbTLoal+ax+5jKhLSx96oldc8ZKmK
 Cj8MVp0Ev7AEbC1S/q7dxZdIO1dfTnIpqN1OuHkdqME39vI5FgRhQThu+IobqzYOFRj5
 6qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749877864; x=1750482664;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CHjv9BHr/Bsn0d/syXcvcyuTrhfwt4Dz6/Z8OFUN72Y=;
 b=a7XDKOn/rw2dQMT8ujBJaKjiJdjVgZSfg2kI+kzb4ggxrUa+6hgZYtRMbz/P1cksAH
 cJhrF6HYS54V1I9csaDsjsycUsL3khPI9WK3IQs/kACShNgJreQbIU8GRoxLMO5ZQnDf
 ZlyuU0eaEf1AxRr/8fUeXWGub8SWEtqYLruoS304bLF22nljDZqL2Zq/mVhc8caskzN9
 nTh6p1JW6VgUdXuufdbwWd8097aDvf6Qu7iXDfSaRI7tSBNQOYc/7U7DfwvW0/2pluyj
 nV2Yp7q1ADgDPO9OxePqEDx1FHiSP5oswb5hEhJqFw9SLB5ystCEy+EdZYyk9SAcXlVK
 KwPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzmQvCPJYzNnnafKCZkxJQE0Obb/yVuWUbdPyea5rqsPpwJyp3Ne3WcKkHIKs6mCkr6eWPSUEH4o4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWfYUtWUbaYKn5iUinnCWj8cbdPxrHbVRrA/h2EMl46k5dv/at
 AJOcsnUf4XuWHG36fZK2mnapiproI5cXe9wYx+occ03BWSbAtqkYiCnq
X-Gm-Gg: ASbGncvssV6wuwATha6mUOQl0PGI2wRLQK+uWtsvUf/7FNf1l1hGCgnWtHIFt/zb01H
 9aJQRSLdaYR8W9/RgxAr6uq6wSCtNNB3JHzZKFoS3A1y0TuRFysVrOr84mYTRV7moMPxlpL/85G
 aYbjVs7j/AUqr6Az2ZUAOXaCm2uw3yxkKbmjyWltlazn0DvJlAXDnN8Bj63x4wHVFGk3L14OPRO
 5kKd5b1ysdVMsEUqtTRlIwx8zIVEeq7p2qsUfzfzL34KXuwySxbITlFPA/tLO7Hwkej1qAW/C+M
 VJ51cHTsPNam6lYDYMpJOVKyvyU5j4K4ANWFn653iGhytALtGJ1srqzpzQbFVXQ4fx7K0i6PM9i
 B
X-Google-Smtp-Source: AGHT+IEBZRhqEoaI9+qTaFDDjh/m2Lcu/ckWlS6mfL4zM53CFmqJYkhil3ZYqx46+B9QzyibLGttkA==
X-Received: by 2002:a05:6902:218e:b0:e82:54:5ae3 with SMTP id
 3f1490d57ef6-e822acab8camr3466928276.10.1749877864466; 
 Fri, 13 Jun 2025 22:11:04 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e820e099598sm1524227276.21.2025.06.13.22.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 22:11:04 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: deller@gmx.de
Cc: alexguo1023@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: sm501: Fix potential divide by zero
Date: Sat, 14 Jun 2025 01:11:00 -0400
Message-Id: <20250614051100.3501316-1-alexguo1023@gmail.com>
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
zero, divide by zero would occur in sm501fb_set_par_common.
Similar crashes have happened in other fbdev drivers.
We cannot find the default vaild value for pixclock for driver
sm501, so we fix this by checking whether 'pixclock' is zero.

Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
Error out if 'pixclock' equals zero")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/video/fbdev/sm501fb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index ed6f4f43e2d5..a294b4e1c4aa 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -506,7 +506,9 @@ static int sm501fb_set_par_common(struct fb_info *info,
 			fbi->regs + head_addr);
 
 	/* program CRT clock  */
-
+	
+	if (!var->pixclock)
+		return -EINVAL;
 	pixclock = sm501fb_ps_to_hz(var->pixclock);
 
 	sm501pixclock = sm501_set_clock(fbi->dev->parent, clock_type,
-- 
2.34.1

