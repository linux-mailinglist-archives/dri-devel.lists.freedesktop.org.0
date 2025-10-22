Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AC9BFB86F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 13:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C517E10E754;
	Wed, 22 Oct 2025 11:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g43Y0L14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D7610E75A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 11:04:09 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-471066cfc2aso19715045e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761131047; x=1761735847; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=60d4FN8I12bjhkv2m/h29YuwY/zOYE0TJa+JTgDeqZ8=;
 b=g43Y0L14q7Kxxb7CZ9QoYbMWFW5x4wMPy0l6c23O1A+HbPu+lWbCsfphfll4HO4So9
 VTg5bRjy+l5vS3b5BHXQvfdsown5RKcKuRh+XdOenGW+hIwlJB3fcFVY4m8a97nMZxvd
 WnoSvWxEpQnE3nZvppxgW5wvAHS8mYTKIovLC/Qs2FM4oinUu3GVI2fmhB6IB8PnHFsH
 QC4OsqQwn/0O5mWgTFy7nwLYc7e7stDzJMS4xPe4Qj0UDEa16L56GYo106v/OejgxiD3
 aS1ilNMBr9i3vFEqSNa/DfR2NLCuGEbB+aLc4SNvUdSCJ53Tyecf0LBGELPB1y5+ZMWv
 RsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761131047; x=1761735847;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=60d4FN8I12bjhkv2m/h29YuwY/zOYE0TJa+JTgDeqZ8=;
 b=Qt+X22pGA+3T/g6gIZQBRpzLSWXxAxxYgXoPcJWq4h3mLgfibZh5ZwbNEW3BtKnNVf
 oE1tqbVxZgSrxJobKzewf7lYaP6RZ8esZNen5PKhEicMCxb5dOs+hMtYqv3Nx7erDDbw
 ygY0hdvUcHyh15VgfIDDJRJA53OJqd1LekPkOf2GN9eImXvb+PEetRJBe1M+WK+cJ89Q
 2wiAhvcva36JUdJGOjNBwpeVy+GZXWzAAnANnBPvHkg7LgXZUnvCocxXwqb/boEmNOP3
 cAwGSgUHzxJz8WFjcBQAA7+nE6CaiIUhsoi7PaNBSt4OsO5RaYn654C7+LF1F9MKr9r2
 KAnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN2R7uP8B/+Yfs234jv0QN/v6bERF60icS5ioZj5L+KmYTTMNglcQ93BAlGcpMfn2BLTGRGq7JHpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+iOvX66vc1Ux3XelT492wOLFyYXugNmcaYs++0gBYRuDGlj62
 kDhBcmNzTwl5Tapic1ltGRdBH1/Y72hDg/TGHt/Yic+WXaCfp7zEwhVnucRx5o9+BMY=
X-Gm-Gg: ASbGncugdKD8aVii+G+BkLXyfhMUV+Tmwchf7F0MAkjCOXT8WpK4UT+0T5jFIybse8v
 V6vb5u99Hy0QhEVa3gv5ogCGSM4gFK4PxnOWj1eIUpAiLIDT7BrgP4BLBwA2CAzpljslMSkFfLX
 qZrzdOl7gXeSs5Lc6OezCbIGMUUaugCjvKCPpPQdWlYYmf1fw+dPGcE2sf4LESHnyvkz523xjrE
 UrwjSqKaI2Jpa6OZazyEOf7+rQ575rN08GXVaoWfAG025goF8QR+eyTdiZipIZLjgIJdHexcWeZ
 eoZelIBWZTlGwcIzn/dQ8gheq66gtj6HsJuwsS6+gOzI8SbM+pZX7HuIuV69UyNlCw9A5t3fR3m
 gBSBzY2cijEejM+e7j+cXFx9b1bUpJ8m212YRB+jveObLGPfMGhY+0sD+6IYKmkxlDAwycGM9DX
 eYcBU9az5O9XzSiovolSPVjuWAWYA=
X-Google-Smtp-Source: AGHT+IGVxOZg/SGvzQXDgSR7/+Whdk7ScvRjRe/N1IbTeIwwfj/PV9uPXXlolfy5kHmMZfmv0uyAbQ==
X-Received: by 2002:a05:600c:4e8e:b0:46e:46c7:b79a with SMTP id
 5b1f17b1804b1-4711786c702mr178910745e9.2.1761131047078; 
 Wed, 22 Oct 2025 04:04:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-475c427c3casm38721405e9.4.2025.10.22.04.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 04:04:06 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:04:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amd/ras: Fix memory corruption in
 ras_core_convert_timestamp_to_time()
Message-ID: <aPi6I5z5oenppEuu@stanley.mountain>
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

The div64_u64_rem() function takes a u64 as a remainder.  Passing an int
pointer to it will result in memory corruption.  Change
"remaining_seconds" from int to u64.

Fixes: ace232eff50e ("drm/amdgpu: Add ras module files into amdgpu")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/ras/rascore/ras_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_core.c b/drivers/gpu/drm/amd/ras/rascore/ras_core.c
index 01122b55c98a..d8a004878a64 100644
--- a/drivers/gpu/drm/amd/ras/rascore/ras_core.c
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_core.c
@@ -67,9 +67,10 @@ int ras_core_convert_timestamp_to_time(struct ras_core_context *ras_core,
 	int seconds_per_day = 24 * 60 * 60;
 	int seconds_per_hour = 60 * 60;
 	int seconds_per_minute = 60;
-	int days, remaining_seconds;
+	uint64_t remaining_seconds;
+	int days;
 
-	days = div64_u64_rem(timestamp, seconds_per_day, (uint64_t *)&remaining_seconds);
+	days = div64_u64_rem(timestamp, seconds_per_day, &remaining_seconds);
 
 	/* utc_timestamp follows the Unix epoch */
 	year = 1970;
-- 
2.51.0

