Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1350489C911
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 17:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76E0112736;
	Mon,  8 Apr 2024 15:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ENCH81Uj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A00F112734
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 15:56:11 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6ed0e9ccca1so1829820b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712591771; x=1713196571;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A3S+sayV8Xb4fBOHSM111duhifwyMfUVXCb44YuSt5A=;
 b=ENCH81UjfvZgWPVEHFJKo1vb+LxyDxG+0rs0YMJbpFW9IH790jA8H37nAw/ckSnR0b
 7voQGc75ept8iL5Rz4OCqPsauc6wD9ZgFDotp/7LzV2wdkyT43hbTnJr6Rt8Uoh8OStT
 N2Wv5L3LDEg7lWgb1v1oZX1I6ea3fCmXk/OOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712591771; x=1713196571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A3S+sayV8Xb4fBOHSM111duhifwyMfUVXCb44YuSt5A=;
 b=q6Iz24wXQpdsM0H+ZJXOuMRGKl98ldR40BmnsJGcX/uYzcZ6+8hduIBXxm1u4/KXi7
 WQ3OYfK9zNNM5J2THE7QGXVejmS1TPRF3YuVP2ZzP2lqf5AiqYkTAa6nvj6pdpti4K9H
 hB4u60Pj4VS1fAYCbSYzd7VPFFc4sPE+aGGbkmunH90UkhXfU3XW54yLZ6IhmsvE+xJx
 fKk1S4tr8tG0Ik3vmKUxeRrLwbZVVFMegUfFK65NeyZ1NuVBHGRXixWe1pJNIu/ntuxc
 L7FJnOTiFcEInd04UQvYbJVL+/epZJoHEVvY9AIUJ4D8GXJgRKLIZFsskM8K7DnNSfTc
 1ECA==
X-Gm-Message-State: AOJu0YwIMLasJNyMhUjP3M3Psk10U3008gvrWGyZ6QmlWQ3fiNPFry/C
 4RPhHtzGSxqAiIeRXhqEWJJTyosKxZ+2lRVltlF/mf1IgByzBtt0TKqYPGvMSzFcIP7Avar9Bmu
 uqP19cjt0ZdEolLgGpQxcHYMTamQiYu4ZnNmKgszrLjPUn7dpY+zJlIPh9u/lGxNviQx14MzrSs
 vZlKd8g4rzepwnHMHGdLHPbQ5gGPXbnpkM6G8n7ucJuPa+j1BMqw==
X-Google-Smtp-Source: AGHT+IFSU94hghksr4pU6DSn3YL0aeuWM0Ki29quuWZaYCGHog3UR5UilX0eyDeTOKdJQAO2AB9Zrg==
X-Received: by 2002:a05:6a20:c889:b0:1a7:a067:63f9 with SMTP id
 hb9-20020a056a20c88900b001a7a06763f9mr38586pzb.33.1712591771221; 
 Mon, 08 Apr 2024 08:56:11 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b006e64c9bc2b3sm6912402pfo.11.2024.04.08.08.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 08:56:10 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] drm/ttm: Print the memory decryption status just once
Date: Mon,  8 Apr 2024 11:56:05 -0400
Message-Id: <20240408155605.1398631-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Stop printing the TT memory decryption status info each time tt is created
and instead print it just once.

Reduces the spam in the system logs when running guests with SEV enabled.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 71ce046327cf ("drm/ttm: Make sure the mapped tt pages are decrypted when needed")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: <stable@vger.kernel.org> # v5.14+
---
 drivers/gpu/drm/ttm/ttm_tt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 578a7c37f00b..d776e3f87064 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -92,7 +92,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
 	 */
 	if (bdev->pool.use_dma_alloc && cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
 		page_flags |= TTM_TT_FLAG_DECRYPTED;
-		drm_info(ddev, "TT memory decryption enabled.");
+		drm_info_once(ddev, "TT memory decryption enabled.");
 	}
 
 	bo->ttm = bdev->funcs->ttm_tt_create(bo, page_flags);
-- 
2.40.1

