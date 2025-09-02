Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99124B400E9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1486710E6B3;
	Tue,  2 Sep 2025 12:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g+H6nq0S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0094710E6B3;
 Tue,  2 Sep 2025 12:41:39 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3d1bf79d75aso1055994f8f.0; 
 Tue, 02 Sep 2025 05:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756816898; x=1757421698; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bLl+JLjIhJwlWgN4ocOU2hzq7YznyPeqJKD3znSlmKM=;
 b=g+H6nq0S82hbmHz9FPZgQ6I9x+p+7ezaBi1ch/Ixr6yb8S7ZWsADxayumRwQ/0lik3
 hKru0ukF/w6varHxQga9Dt+t7Pb2KEI+KIRkDelbopPMN4M49GJT0J2W9yYJLTf2qfSF
 cYQa2+2ZuX2otcMnRL9VrqKEhDyBSAKPKHvP3Ty+UhpZoTDQv1d90jql0I9QVv00RajD
 7gBf0w6uFQ3PXpON0mm2kL3d90XecYKeqNkLc5KKvs7NKRU1kjGsjsMAHuX4TKZmvuzE
 IPlflQ13MWzYA4IYyNS9AwDWBjyiZD0U+dxv08ZZmhgSgUrsq7kaNIZF3XwRoLmeqdT/
 iF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756816898; x=1757421698;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bLl+JLjIhJwlWgN4ocOU2hzq7YznyPeqJKD3znSlmKM=;
 b=k63PGvePvaazCpQs4nJONpBakj09Q0w8NzOUloD45LosJEcP4taPHIgXfJXEq5OD4y
 kdD6WLsbceEv72aCdGmZeupe03A01Q9+tRoKGTnye0JA7YX4d0Apsbav3ErsrACubY/I
 0Ubx9p3IybIKGGwl5ECWGK+R3wpwBEnNTJQ5DUF0OJ6khGsKs9jZ7tN2TbZeCVF3vWjW
 oXIhJ150CrzNoUq4L38PPt9zj0xLeZBlamtZsrtEI4KmO3SVhHNB+efYXIbodhDVwD04
 4k10gpAHpwKPkaQLDHeICFhfGo6fXvN1Arej6rfMV5uWJTJBj0STuKYzO5tvkX/Mhcpd
 17AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSkQbUiWS4Ay17V5mdO30uYZ++2P5Ve/94LGeXoLF69tM5qePXauOk8+20GiJna3I76btkkNqk@lists.freedesktop.org,
 AJvYcCWtAJQhlMbnnvCcp/d9Hkt5FldM9B7gESj25TERJ+/RH6i2U/AsdKtY3DSeJwcJkuC6MOkzCOoBDsjo@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJV06kywn55UojHiSYceqjTrRylfwL6L8g3N739RvU73y3wlEk
 ckK1bkEZvoFbLri1EZIbb5RdqDjE//wZbTzpeupuDkPxvMqXPFESywXh
X-Gm-Gg: ASbGnctEbUtbeXH5ThsHa4wQaghCHGWQUM58EB0FbVbn9MzWvNt0Bcd+EC/11HagCzJ
 PzCHzxwUbwVTr6euWMtDjTmlDIup7y9HVZZiWW+8bkFLW7dRCZr9LvS5zekmp57NG6i/ZzrNaRb
 Kjk7u28lCeqNAiApWFqhfeWme5OuwhkiCRb4ps/zp4kXqt/+Lmizh07KwSxbkUeDmEkonh7UnVK
 RMgw55scpi1H/v052VIAA7+ejnFZRR5P5jRX9/Vm+XXXE/6di0e4iAvPQg1hZvGEJORzBwMfcc/
 cP3YqhGcgQ2aTEWDxziftXcD8xvfDn/mdT4wSQXx5q4G9vRCs/313IgcPIbZSlkNWWyop/b92j6
 akv281i4ed53qtRZANVzrVlLfprufIs8=
X-Google-Smtp-Source: AGHT+IEz5I9J4HFpTbmwM96KDxKRFH9y58DSSHqyixEB5HxWInPxE6QIjGk6UgfMHbUWnP2ymlC0Og==
X-Received: by 2002:a05:6000:4020:b0:3c6:c737:d39f with SMTP id
 ffacd0b85a97d-3d1dc5a5641mr10228606f8f.3.1756816898145; 
 Tue, 02 Sep 2025 05:41:38 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3cf276d5e5fsm19738997f8f.27.2025.09.02.05.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 05:41:36 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, John Clements <john.clements@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/amdgpu: Fix missing error return on kzalloc
 failure
Date: Tue,  2 Sep 2025 13:40:50 +0100
Message-ID: <20250902124050.2628822-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
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

Currently the kzalloc failure check just sets reports the failure
and sets the variable ret to -ENOMEM, which is not checked later
for this specific error. Fix this by just returning -ENOMEM rather
than setting ret.

Fixes: 4fb930715468 ("drm/amd/amdgpu: remove redundant host to psp cmd buf allocations")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 1d6e1d5de8fa..3696f48c233b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -448,7 +448,7 @@ static int psp_sw_init(struct amdgpu_ip_block *ip_block)
 	psp->cmd = kzalloc(sizeof(struct psp_gfx_cmd_resp), GFP_KERNEL);
 	if (!psp->cmd) {
 		dev_err(adev->dev, "Failed to allocate memory to command buffer!\n");
-		ret = -ENOMEM;
+		return -ENOMEM;
 	}
 
 	adev->psp.xgmi_context.supports_extended_data =
-- 
2.51.0

