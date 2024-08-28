Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BB5963C25
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 09:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8D010E3EE;
	Thu, 29 Aug 2024 07:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="B2RQ2aBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50C710E57E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:16:50 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-715c160e231so2022584b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724858210; x=1725463010;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MGorGxckmvbXxL6wgNnUsbdoW3Ac8a0ImG5glZMucZ8=;
 b=B2RQ2aBs+6PU6kJTyg3KbBMuWdfMgGFDz1HLwP94KEnd4fU01h6LVzpmgZLPY61h8e
 u7kGShRCyg0fB1mawLsnVvTrjVBj70VX8CWdvH7S3YABdXTxQ3AdLwfkE90Hbnrumeh7
 92JYnAQXQWv1e/86qXVC3qkiVjkvW2gXKVJb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724858210; x=1725463010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MGorGxckmvbXxL6wgNnUsbdoW3Ac8a0ImG5glZMucZ8=;
 b=EGKGnOcuLZPuMRdHAIyteJkzCpJKl96CU61+85Q9EFmezF6RN8zVI/b11dyK+fAydy
 qMlL+bBY4WwTjAqqhbJTHNBhqsQka6Sy6SiLKc+fIufRTa4+ht0DYfdA8yusNV4RVQ4Z
 Mtnjy28u02MnbGQocANtElsWj/ca2Wf/DsXdICPN61nbdDv8W6yOC+5I7ml82FjQ3YN9
 xLf/Rf3/pAQyrOmwxLW+WyuC9FP5lBKcI4XfSekHw9hmXUd3uVVvtNE+OQ7haviqcWgc
 iQhT94gr6wbWp2gr8otlIA5b/UhMJlGoAE72k0sqPknX97CwuGn6Y+2OJxMiH80QBji0
 GJZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHRi+2hkk4VnO9jYA45InePHHErIShALWB2VN99i/wd3WJ8xKbiFeLtgROjqcK8d3gJ+i+aCRUdrk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfEsh5GSpuNPXbiVlRCjzZAdaJ/NlrE28B06vLYP23IhvDbJYN
 SmbmfQMVOoRqjERdHsExK20QvcgMdvNE4MJvOG37OBZb79k6AuT/ahyUt8VCDg==
X-Google-Smtp-Source: AGHT+IHh7AFyXRDDkAshsWM9475dqzQbE9aMYa4K9mjb6QVCeNbGlYkoS7LO5r9jYiUaTcHHtxhNHA==
X-Received: by 2002:a05:6a20:d492:b0:1c4:a7a0:a7d4 with SMTP id
 adf61e73a8af0-1cc89d15ec2mr21365161637.7.1724858210082; 
 Wed, 28 Aug 2024 08:16:50 -0700 (PDT)
Received: from fedora.. ([66.170.99.2]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7143430608csm10273508b3a.153.2024.08.28.08.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 08:16:49 -0700 (PDT)
From: Vamsi Krishna Brahmajosyula <vamsi-krishna.brahmajosyula@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: jesse.zhang@amd.com, alexander.deucher@amd.com, sashal@kernel.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com,
 vasavi.sirnapalli@broadcom.com,
 Vamsi Krishna Brahmajosyula <vamsi-krishna.brahmajosyula@broadcom.com>
Subject: [PATCH v4.19-v6.1] drm/amdgpu: Using uninitialized value *size when
 calling
Date: Wed, 28 Aug 2024 10:15:56 -0500
Message-ID: <20240828151607.448360-2-vamsi-krishna.brahmajosyula@broadcom.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Aug 2024 07:02:29 +0000
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

From: Jesse Zhang <jesse.zhang@amd.com>

[ Upstream commit 88a9a467c548d0b3c7761b4fd54a68e70f9c0944 ]

Initialize the size before calling amdgpu_vce_cs_reloc, such as case 0x03000001.
V2: To really improve the handling we would actually
   need to have a separate value of 0xffffffff.(Christian)

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Vamsi Krishna Brahmajosyula <vamsi-krishna.brahmajosyula@broadcom.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index ecaa2d748..0a28daa14 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -725,7 +725,8 @@ int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser *p, uint32_t ib_idx)
 	uint32_t created = 0;
 	uint32_t allocated = 0;
 	uint32_t tmp, handle = 0;
-	uint32_t *size = &tmp;
+	uint32_t dummy = 0xffffffff;
+	uint32_t *size = &dummy;
 	unsigned idx;
 	int i, r = 0;
 
-- 
2.39.4

