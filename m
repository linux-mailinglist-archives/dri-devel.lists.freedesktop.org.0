Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B77ABA0A6
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 18:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F48910EB19;
	Fri, 16 May 2025 16:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S+yUg2IR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABDD10EB17;
 Fri, 16 May 2025 16:13:27 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5f4d0da2d2cso4228996a12.3; 
 Fri, 16 May 2025 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747412006; x=1748016806; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hLJmovg9plUQcWnyMDtPPXJApgKGoEewf0WKlQ2WBJ4=;
 b=S+yUg2IRCdIldUZxccDCkfEItaoLe5zPvCaYRBJvk2ycbLccW6h+mLa2AewhU0gXU9
 kpU9IMk6o517n3GVGNrUop2Nsl2a4gKadPlmJG7bL6W3uWJ0ClbN/8DHI8pYZBq4Ht+U
 csKfQM5+AxjxLw1MS8C4VuXKFxQEFgJgeKYY4gnR/Ph/jmGDB2a4bmf4XFsB5b+FwXbi
 GbJ4y2ILfb/lSr9V2Mps1neP6lwVwWNk34QVGEQCCVN64uLB4KI45bRu4ENlf0aUHshf
 TGGzwoJX6pF4UzE1ZGr7NA7u7roB9YHwTDvxIxAtxQXFw8R2Hvnw3+D+0Jb1eZYra8JM
 nW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747412006; x=1748016806;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hLJmovg9plUQcWnyMDtPPXJApgKGoEewf0WKlQ2WBJ4=;
 b=Ll8l9oh8tRnq/PL75REbGxhFtVPVgp9yXRMqh6OgW/Jt6dVh6D61TCXnZIo9sQ/sPD
 Bs7IJv005x7l0fnoEzrXixqCRh1lx7wxqSf1HnAC2k6ri5HNz5JhmT9zfssLKGzPyrYU
 v5gKdSxHEfE+tNMpRAb2tgI+OBy4QkhO47WDVmHs+d7ebIp2iL17EtclJTnNp5pqlUaf
 FgcB6CFZvc1m/B0DVq3fZoi6YVBNrdRnO+eSgWooWBuHFn7vV097FO/p/JKvFnmd7JQq
 AYx+Z8tgNY4SRI9eKnW3a2jkLsVlcyA9AKdhZz+dSBifQKqkO2mHOzsEVr7jQzZs+Ltm
 aJRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwsuEYgCy7hgUIQjKgjPpojSSfA8Qm3K2rtFVpQ2zVkoPIx2N3ckXWXc1q17sx5D7C6GTUpI1M@lists.freedesktop.org,
 AJvYcCXrOBLoO2rCcQBjVkL8dYh3lDqRKKVP4Sr8XYCizB6b36DqiLONtAdR/Z/k6bzGpvnnLKqVLOBUR3/E@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0AKGNJbLlyH3mdABd2kmA7LbEFK6E1uYqt+D3HlpKYLQoLMtH
 GrLDbRjGRU6hKndFAMy6MdaoFYI7wyY9vf0yA6pxX9lhs0dEeNpHH2rF
X-Gm-Gg: ASbGncuVhg1d/3lz9dJrAIV4tzii+pZsO42Rl4EN90PKJMYB6FZHDaEx/Bztg5glqI2
 /6i6pYC5TqQgSiaQjrdE7v17t8mbS17HRqXxfRN+xT6LB/yudpBVO9E2PXfvW6Qv4msAG2utLXb
 oWFjU3AzTeFBrPwHrsxW7bfqIpHWFIfXIk7sAZ+FE6rril7lGtNA1axyP0QJXJJSGi2q6I0yOfR
 4+wAof/nbHJ04ywWSbfxiaoc8B/RlsgNvbPaQbUPUV2fZutjNqK3Y+RGt01xQl8kGQztKvCypjK
 PSxsscn7n+qMmCgEJnAh7DkUAgkHDfRi4FZ0pIQ=
X-Google-Smtp-Source: AGHT+IHNN4EPAuY1cd4IMbE8HdxTl2O6RmOg1nWALDwkNAMDfdDvrOuPS2dn2gOhqkvwH1ifaGmjtA==
X-Received: by 2002:a05:6402:5cd:b0:5f6:4a5b:9305 with SMTP id
 4fb4d7f45d1cf-60119cd4192mr2838792a12.33.1747412005973; 
 Fri, 16 May 2025 09:13:25 -0700 (PDT)
Received: from pc ([165.51.5.169]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ae3888esm1616084a12.65.2025.05.16.09.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 09:13:25 -0700 (PDT)
Date: Fri, 16 May 2025 17:13:22 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] drm/amdgpu: check return value of xa_store()
Message-ID: <aCdkIkNOQgnA5Pou@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

xa_store() may fail so check its return value and if error occurred free
numa_info and return NULL.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 707e131f89d2..bff82ac651f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -876,7 +876,7 @@ static inline uint64_t amdgpu_acpi_get_numa_size(int nid)
 
 static struct amdgpu_numa_info *amdgpu_acpi_get_numa_info(uint32_t pxm)
 {
-	struct amdgpu_numa_info *numa_info;
+	struct amdgpu_numa_info *numa_info, *old;
 	int nid;
 
 	numa_info = xa_load(&numa_info_xa, pxm);
@@ -898,7 +898,11 @@ static struct amdgpu_numa_info *amdgpu_acpi_get_numa_info(uint32_t pxm)
 		} else {
 			numa_info->size = amdgpu_acpi_get_numa_size(nid);
 		}
-		xa_store(&numa_info_xa, numa_info->pxm, numa_info, GFP_KERNEL);
+		old  = xa_store(&numa_info_xa, numa_info->pxm, numa_info, GFP_KERNEL);
+		if (xa_is_err(old)) {
+			kfree(numa_info);
+			return NULL;
+		}
 	}
 
 	return numa_info;
-- 
2.43.0

