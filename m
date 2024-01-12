Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB73582C1D2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 15:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4826610EAF1;
	Fri, 12 Jan 2024 14:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0D110EB20
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 14:30:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e636fd3d2so9441995e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 06:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705069804; x=1705674604; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z+wi6LxV5EZ0n10N9SHFswFNcko0BVzpNz628Oa0p9E=;
 b=PAMcasgnH0xIUcfFkR9ZEbjAUrpLuEFhK26OB9XCqaUGpqDv9D1lxie+Vwar0qUPjA
 1X+GG1JrsuZtvV3i4z+QJXINTGcByutk8+9oAa6TzyuAdQRYbEQW3PaG3ZTDJc1Mbd4R
 nAQGVw5d3FB2k6LJiMHtHHyZSUxdCFd4fA1MVCypL3HB3Yiw39+C3zN5A3m5UF26fYoe
 6jZSAMwszoBnx0bePo1O6SkcYKSSMxvK4h+rMLjYxzIfhV8X9SCTbF5XCAcGUtyeNYt0
 qNFR0efuEYzaYIevprT/xUxpWJXKRYW+KaoIHdm24uQQzuogCTt76Lx2HWwiDiuvBl2I
 kvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705069804; x=1705674604;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z+wi6LxV5EZ0n10N9SHFswFNcko0BVzpNz628Oa0p9E=;
 b=VjX9uPGEijwsmmLB5RTqhSDMBMiq5dE1Fe20sOwhDcolHNJn8yTlW2qNafugiY+lic
 5/L/Z0LSUVjcR/aGT2Bkhbj7eWlKhVOe6hcKT593Cx7apjt4ebimGy0lojt9qODDs5sM
 rmoejG6wJsrErueICi5JMcRwhKlfXQLgHdoWvHrFR8qjpYEniqABgNI0EA2PAMHgW+HS
 sfOEfm/+CJfzHv0bzvrHlyddQrHuAKYuftNr0KWbD+lnwZUNpOpfgXzLEymkvl8y5zX9
 N/nauXRfVS4ipiJ4hmJH0pN5+KGCG9sFJKQCPNApY7OVF47rRW54tYSU77zR9/L1QaRg
 EO0w==
X-Gm-Message-State: AOJu0YzvW3yQ3hMka+lEkbA8ExXkCm64pqnJeiy3kPbBBlRyrEboaHyn
 M6EWdDkIk+56NkZcH6/ZbDjGJkLTXDaSTQ==
X-Google-Smtp-Source: AGHT+IFEpB1LZ1xc3CQ44FCbNbDdLXUyk9YByyFqv5s3twL1MZ7zUuKibTl7Ck+2HxkJODQhK7YCyQ==
X-Received: by 2002:a05:600c:4ecc:b0:40e:500c:23d8 with SMTP id
 g12-20020a05600c4ecc00b0040e500c23d8mr791947wmq.151.1705069804093; 
 Fri, 12 Jan 2024 06:30:04 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b0040e4bcfd826sm6116088wmp.47.2024.01.12.06.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 06:30:03 -0800 (PST)
Date: Fri, 12 Jan 2024 17:30:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yang Wang <kevinyang.wang@amd.com>
Subject: [PATCH] drm/amdgpu: fix return value in aca_bank_hwip_is_matched()
Message-ID: <b311c5e2-ae9a-4558-a51a-a332d0fdfd9b@moroto.mountain>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The aca_bank_hwip_is_matched() function is type bool.  This error path
return -EINVAL which is cast to true, but it should return false
instead.

Fixes: 22a4fa4709e3 ("drm/amdgpu: implement RAS ACA driver framework")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
index 6074a529caf7..1d3ae7c241e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
@@ -182,7 +182,7 @@ static bool aca_bank_hwip_is_matched(struct aca_bank *bank, enum aca_hwip_type t
 	u64 ipid;
 
 	if (!bank || type == ACA_HWIP_TYPE_UNKNOW)
-		return -EINVAL;
+		return false;
 
 	hwip = &aca_hwid_mcatypes[type];
 	if (!hwip->hwid)
-- 
2.43.0

