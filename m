Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB8E8570B2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 23:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BC410EA52;
	Thu, 15 Feb 2024 22:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nQsqi21v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE2A10EA59
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 22:48:09 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-411d231ea71so11033565e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 14:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708037288; x=1708642088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VxZz8dpdlBG3f4JnaEViziH04upv3BIHYbzmShbS36A=;
 b=nQsqi21vdhyWl8UrDWAXzIzw1tN+pza3B2mBQA1FcZXxR/GIWootn9igBLXatjXumh
 voW7AaTqgvnqTzr2r/Y3nJ/dTKkJA2e963eMrBot+9oayjK1rvwsncasWc4DDKN8CnCI
 bPPQKU+YJ8NnqdxjrhNAsywrenXx/2VLBR9UaLO9iEFoYWs0Dhs+J5eLgTGTcqySLx/R
 YWmsA/ZNJjPSIg7wJoU+kZ7JEGFXR2hlwcGzARXQSWwwmD7yEuwyCL/HyhWQftGcWf5A
 kHHPWVd0sm8xinz/jl+4KMV2fGklASSmTqi01GFUdvXfbHoeUjGpC2+5MXhRe2OIJI4q
 SXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708037288; x=1708642088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VxZz8dpdlBG3f4JnaEViziH04upv3BIHYbzmShbS36A=;
 b=OWoZ2XqLJAuo2ACB50Yw4joVT2S3UZ3rjnHS9bzTkGkYIbgKVYaz71lENVjYEN5JOM
 3lr0Yig7qAjozqmalf7LcygP9YS04mt09dSzgTq2bWRD3H9GC2ugIK1ehvmkSy7IXUDn
 ydNOy3CQFhJAINlDhNq4oaZxBiNukFYU5WmgT1duFOaTPUOZR4F+FcWi7hIMx5ljfi3s
 oWhyL5bUkQGrU8YerZfmHT4Kh/EsgXW7xsPbiOPCWxtnFhPsH5IULQ9MVWIgUlxFvXFa
 /AzrU3avycgyAqjGU4uuvUyIIesSRM5YYjU4Oj0By5P9Vhp/l8fUy+zf1l/n3xgqjkg1
 YcSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIzwlP9lshpNuxn9c839GwkXCu0LofIyjvVfETkNBecC3j5PnYEBiN+5iNWEhMobSHTYvq+Hl1ixPtMztVJWjD9+xh1gwm0cl1J50tF8Cv
X-Gm-Message-State: AOJu0YwsvoDTmfKgkdaT8bFPv15gmz/IfYx5GrjKqqGc7omAD9KYRXeC
 uREs/0JPYSuDu/njY0YrbdziVxlDGYWhs9FDIo0vCF6eJZfm3eV7/tpoz6gxgpQ=
X-Google-Smtp-Source: AGHT+IEHcn7vuCmdD0vbj0K6OCuGp4jwkwobudrNE34EGoVaEDBiYwLOq3sO8rU1BKDdccJHXR7NqA==
X-Received: by 2002:a05:600c:3b28:b0:410:1d3b:3424 with SMTP id
 m40-20020a05600c3b2800b004101d3b3424mr2460999wms.28.1708037287695; 
 Thu, 15 Feb 2024 14:48:07 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 l3-20020a1c7903000000b00410b98a5c77sm442936wme.32.2024.02.15.14.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 14:48:07 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: David Airlie <airlied@redhat.com>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] agp/amd64: remove redundant assignment to variable i
Date: Thu, 15 Feb 2024 22:48:06 +0000
Message-Id: <20240215224806.2074087-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The variable i is being initialized with a value that is never read,
it is being re-assigned in the next for-loop statement. The
initialization is redundant and can be removed.

Cleans up clang scan build warning:
drivers/char/agp/amd64-agp.c:336:2: warning: Value stored to 'i' is
never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/char/agp/amd64-agp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index ce8651436609..47bd3b8a54b4 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -333,7 +333,6 @@ static int cache_nbs(struct pci_dev *pdev, u32 cap_ptr)
 	if (!amd_nb_has_feature(AMD_NB_GART))
 		return -ENODEV;
 
-	i = 0;
 	for (i = 0; i < amd_nb_num(); i++) {
 		struct pci_dev *dev = node_to_amd_nb(i)->misc;
 		if (fix_northbridge(dev, pdev, cap_ptr) < 0) {
-- 
2.39.2

