Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4D1CA76F7
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AAF10EB0E;
	Fri,  5 Dec 2025 11:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Hg/DzCUJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE1610EAE9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 11:39:25 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-42b3669ca3dso1025772f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 03:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764934764; x=1765539564; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dIKUJhPtyy099q/7pEHPgqG0DHnRRHLJr8Bo5eZ+wuQ=;
 b=Hg/DzCUJ8YeF9XjkkSKk9V4qA9SrxeNHzQpQehlyNH59RzU8JoH+DihGu9WIX9gwyq
 xbRUAeG8vevcdkqkoCPDz+ZO8HceWyYl6wcbZQxPWgbuNf95E4U8GWKhmpV3Q/SB3Lq6
 UqSn8oKRIGzT/NuE2UeKQ6CrZhWW6wEJsngNCDStqbB0xWCBaj1bRBYrKVXHVuLN+N1e
 dI3QDggDyco9u8UuAA/Egc9rsOkUci4VedT2tiXTQH9ycityf+rpfOY9/Wtv3j7miZyd
 i9ql7ojiYUEGwXXKBwO0gNhn/ItdNYKdn9DW9i+/VVOZ7CZb9sDcMljwtIW7DYCJjtMx
 tUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764934764; x=1765539564;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dIKUJhPtyy099q/7pEHPgqG0DHnRRHLJr8Bo5eZ+wuQ=;
 b=nxPkp/vSnrIcpFfkx+p1yarqwzFNxnvWfuxXliXm0ukKBbqBRFURJhxWbUE5mbV9V+
 Q2bxNE4hg0/tOnqDST/hHMJf/MLF5jBdX6fRu9AD7bkGSEkD6OlufiK3dvoWeQ34CgoQ
 D4vJ/9lU6EpbSDPPwsSzN7oiwtImWM4ZpU/c6cha57796Jxwcx7aehxrxmjjln7b9bx3
 JVJdc9j5HluBjDHoN/+GcFBOUf39PWtj5AzsI/PniJFZMs9suU+u4ulpCHUdnqTvqjkU
 A4BEkQCc/oFHxEyqiOEQbDC67xBHDJAea3vG9f0UP/dyEKB6yg3jBvopyCFuZtwWTOG0
 DO9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKoJUxb5r04i0+L/sUYWn6W6hr+lRl8EoxA0oC4wxxaaNVMlqpzSjBzWQa+w/DpfglRAHn5DbCA04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1RoOE4YTPLA7niZnpM1sOv+GLFve64nMYyAV50RTgT8q+bMMm
 KajqazWj+tn8nj2QPor0aXI3dIM7N3v6urK08Fvb7H8U00VoDcBJcoxTmNrhmpwKlqY=
X-Gm-Gg: ASbGncva7e0kIckdcjEVJKPTGh2NlYMe3FDf6f1biwwhWv0r8Z9pn57BwQWuyK7QPv8
 Y2PzfMVwT8Iy1n1mm3QF3O7GtIfEDZiVXiqFd1fyM5Az8mamPhI4r2m7Btbk80u/MrUumgKY6Eg
 1UGgVFfZYpLah6Ze3YN0yqdIugZSsOGGX3y9ElEIPIM9WrE1jN3rE9HqNQ1XuUeMQuPI1yEe8cf
 2pAZjxgZNid7l38kOlCO+ea9LasxH0rammAyZy5rL8/TN5nsHXXFLQSLIsZyQBER6DD2lNgK8pc
 LDBrNxfsQHHrBKyIvLZN9Nj1mpqWISodxPL8MV6KWaBGVQVWv8B0ieoaTe4I8Sym7B0JcAlt7YS
 4zU42K7nyuoFQR+8vnbMAUmT1fovUJgJdDY4oOGcPmZIHBqd2SxW4CISl0VdFZ6HT3OKhV7P0yO
 Bi2N36JLikRDmwfQtO
X-Google-Smtp-Source: AGHT+IF7EWPLDwvBvMYYg19nIBOlQAnWMyTfDzDj21hkC8CsbxS4hgVB39BlXGxYOuNd95H6B+H2Lg==
X-Received: by 2002:a05:6000:1acc:b0:3eb:d906:e553 with SMTP id
 ffacd0b85a97d-42f731cbf01mr9856490f8f.55.1764934764129; 
 Fri, 05 Dec 2025 03:39:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-42f7cbff352sm8357272f8f.17.2025.12.05.03.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 03:39:23 -0800 (PST)
Date: Fri, 5 Dec 2025 14:39:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe/xe_sriov_vfio: Fix return value in
 xe_sriov_vfio_migration_supported()
Message-ID: <aTLEZ4g-FD-iMQ2V@stanley.mountain>
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

The xe_sriov_vfio_migration_supported() function is type bool so
returning -EPERM means returning true.  Return false instead.

Fixes: 17f22465c5a5 ("drm/xe/pf: Export helpers for VFIO")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_sriov_vfio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
index e9a7615bb5c5..3da81af97b8b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vfio.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
@@ -21,7 +21,7 @@ EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_get_pf, "xe-vfio-pci");
 bool xe_sriov_vfio_migration_supported(struct xe_device *xe)
 {
 	if (!IS_SRIOV_PF(xe))
-		return -EPERM;
+		return false;
 
 	return xe_sriov_pf_migration_supported(xe);
 }
-- 
2.51.0

