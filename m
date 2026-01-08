Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC91AD05F07
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 20:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DA510E0E4;
	Thu,  8 Jan 2026 19:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gvyZrxiu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349FB10E129
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 19:57:28 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-42fb2314f52so1868340f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 11:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767902247; x=1768507047; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QCRWVLE8KYqwVCUSR+leEM1QO2iDsc6SFUmiGPEHzWo=;
 b=gvyZrxiuJP3qXGrCo/ne1YXDWbBJ6oQHPD/PmYxufL9eeAmOm42hAIUyQSY4eaBYpN
 0A+voW3wT2/twxzKogBEyNWnqKV9cK2OE+8dH+KHYK2lTgMkIrqkHBsClWHz4nRfMeEw
 uxQVSLBAwpDc7qR0hNhgFwPZgHhH38L0OaGrmS4F0zRHj5xjHvrt+1xtjTJ7Cadimkl1
 /BN8k5Vng41MK46PYlGjCLYOMqgJ7UC6iwq35Bhiz0gR2SqIF3oKKJIUxoijfVH8YM/g
 Ki9KmUWFo/th0UYsvQwRIwrDrZCKgwdWqDLEVBBb2/AOSIFACOAdGHI++Qn0DO/P2QG7
 Oeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767902247; x=1768507047;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QCRWVLE8KYqwVCUSR+leEM1QO2iDsc6SFUmiGPEHzWo=;
 b=hWWPJn+qOQ1vgsiZT+b2ImwXh9tpji9PsVSjhe19JyzGgp9ShoFWtpYRdCkDYoWkGB
 eKf+cErttlF0CywYgroS6HA1yw1KYo+MFEmR0U+OjeXcPIbfGJZwBRWBZjQ+usXuwMhO
 boHktkjKWhhZNg07dXqN41ojkQvclcVTV7YMHlJigHpkdI82bRVVNH8Y6A7J70KS1gSu
 DoZSMwlUUldA1+Pn+c5Lpn3DFPMRp7iO9MeV+hpZExmZhsFctf44AooicYw0UuoDXiLU
 rM0YbqZxBAmhSKYYrOdS+jrlZ5ElG+jzxMyhDD4PjTEv2x22c876RYL42Vwg1PGJjC9s
 pH2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb76mnE2iKPAAI15MuIjekQ2uJRhtDxNZdpFm2Bx5TclmwVUX43emNiAZvvqO4WI9pci9U7VhEzxo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjmlrWCX1dFasG3wrUQkCAJ9dMWne7PXoKcp5Nl7hhEChQfCpt
 ++01QixfaNRr8IbIJahI2Y56+ATngHmcAavdavAGS5zu0MvBWwPyoJyWMmVJ7HHlCMU=
X-Gm-Gg: AY/fxX4kYnImSARkFxEDigMxR0//SHG2PyvjwFJx8eFxZwdbzd3Z4OD+oO/AtUpMKN7
 rWXSSey9+6HBP/y/rm4qjlhyeCYcOsTBr6i8sYq4JpMZML11X0NmjQnOMR1NI6UHAqX9ar50Lt2
 JwaLhhfJBNQdEfNAR1tMHKAZLMoHTsw0PfwNTBys62gEbCWGjJERXJ4jE380KFxG9De7e0DuJ6U
 agIRvsiwxGjBf3w0zj3OSCZRkdxgSaMpU/8iG9t8/ZzS63OXnE4lgWUA9hnNPTRPvwVjojyfwDv
 02Iv+0pegq6H0/K1REoHOCRA0QTDgQZsAIyjwro9PTDDFmSYAi51gPG/PZTD+4Ivh+oLsGTIoTJ
 dvsMzWyurqM6T9tqpOfpLSXHXsv5M1oq695pZWzQrfdN4gUH4ZX7VKr0A5/n+3gAwOdWdEm8KCE
 NWKBlfDB9yqf8SPPU1
X-Google-Smtp-Source: AGHT+IFcp3VtHt/q/Alt1immzh6zHpZoD2LnzhIVd+S2uek5Z3OEZpx2nKLWt2bXAXJEShIrU12xOw==
X-Received: by 2002:a05:6000:24c6:b0:430:f742:fbb4 with SMTP id
 ffacd0b85a97d-432c37a4f66mr8711115f8f.43.1767902246566; 
 Thu, 08 Jan 2026 11:57:26 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df91fsm18529516f8f.23.2026.01.08.11.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 11:57:26 -0800 (PST)
Date: Thu, 8 Jan 2026 22:57:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm: remove some dead code
Message-ID: <aWAMIhZLxUcecbLd@stanley.mountain>
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

This is supposed to test for integer overflow but it is wrong and
unnecessary.  The size_add()/mul() macros return SIZE_MAX when there is
an integer overflow.  This code saves the SIZE_MAX to a u64 and then
tests if the result is greater than SIZE_MAX which it never will be.
Fortunately, when we try to allocate SIZE_MAX bytes the allocation
will fail.  We even pass __GFP_NOWARN so the allocation fails
harmlessly and quietly.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 8 +-------
 1 file changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 71d5238437eb..7968c2dccff0 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -947,15 +947,9 @@ vm_bind_job_create(struct drm_device *dev, struct drm_file *file,
 		   struct msm_gpu_submitqueue *queue, uint32_t nr_ops)
 {
 	struct msm_vm_bind_job *job;
-	uint64_t sz;
 	int ret;
 
-	sz = struct_size(job, ops, nr_ops);
-
-	if (sz > SIZE_MAX)
-		return ERR_PTR(-ENOMEM);
-
-	job = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN);
+	job = kzalloc(struct_size(job, ops, nr_ops), GFP_KERNEL | __GFP_NOWARN);
 	if (!job)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.51.0

