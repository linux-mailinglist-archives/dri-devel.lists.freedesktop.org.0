Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5373CD6D99
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 18:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182F810E32E;
	Mon, 22 Dec 2025 17:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WcGEHnOd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A46210E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 17:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766425404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mG3GBuEVPwNetHpE7r/70ie0gOHuvVJYQoZvD8wClRw=;
 b=WcGEHnOdHHXVI/YUM+F8H5rHe7lR/2yRcxez7hrSbqP6Grc/fex080c9OLVEiOxhE33PMD
 mTsBKXwEKRmJ8Oo85B0/LPrcSXYQNZmT3GRiG3oyfqXbD3xX2lppTSDjuwXi055tBMYbY4
 gP5D8DxqequYA5f2EMAg3CeG0kffPMw=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-Bby7I5qrPwmLWJTjYUMHZg-1; Mon, 22 Dec 2025 12:43:23 -0500
X-MC-Unique: Bby7I5qrPwmLWJTjYUMHZg-1
X-Mimecast-MFC-AGG-ID: Bby7I5qrPwmLWJTjYUMHZg_1766425402
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b5edecdf94eso7149748a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766425402; x=1767030202;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mG3GBuEVPwNetHpE7r/70ie0gOHuvVJYQoZvD8wClRw=;
 b=B5Fx7uKc0RH8ESr0foj+iRlvOCO8zRDa1iHDWX7qE54ytQLJ/9nn+T4NstqVLnDwhg
 AOE5J8AknQWy+ZF7Nv43xkI2GlTYlrPBvMOPZQOKx7K6Hv7LF3noDMZXYbuk2N8dhQ44
 Bza0+wTCLXdJz214oPfiU4OEv/sisLRp1zIioNm/vGNjI1yWkkU5E4HVAaj/iasEdKRh
 YNGj039YP/CMkNmpMB9YysbQDSI6Lon9fr8y8FzEkbMGmU/8IEDYuZMN6CDCZKEinuZZ
 08+4BuENklsQuuBKGpEhBas6SzYMeRqO/BQLFPIhKqKWxK1iRrPb8+k84L3YAr6UOnLq
 zInA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgAVoQefv+YiE1/uxvTyg+I6N92qs17USa2RZDiNcFN3W1lBVg6+Taebm7viKMHcUgwRc5wT4yVt4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTDZ2gFFfpY1GhWZ5j8pg+urjFEPynMwmZaEYSwyvFAnZt2sEZ
 8uyB6LDq6p+sHimlOelFhZKEAWt885E/Fy//Z1OZdXe8yQR5+odu9X4jjECMQk9k4sUYBXnHpnu
 tgVuA4jdB9w7iPyxY7qsODALTbi65dPR+LOMwmpKDXLae3EiDKgJkw7QxY2hIUZuad9w0Gw==
X-Gm-Gg: AY/fxX4JxSKMm7K8bMh3X272zbF939jyiIh+xHCKAQdMfo0QWId61E1gyXizQfPFwBy
 8d/t6REIDxWI1dWEukWd4kPx9Aym+h2YCEThlMo+eUiqnY3HQuHglyXMWPKRH5LPkMfyibx7eWl
 xBhY0aF1ZZYL1vT2/EwkGzFIBYnMkt6wSkpK0+vxT38yTmG1EVT1XR+I2ZDK07UycTG6VuAA9pe
 WSYTBQ7YJVVRphjffgsk6o1xBgxHemTrALI1UcOZWcDmiaYMhQddLJmsQ+y3UMDtJEgBOmZV3ns
 eHbIioGfAWPe9btyQSmalZmobCcRbnAKRJnbhfSU8xuuA8Xijzmtz0nhc1txwQ7uB8qTRvay5Fy
 903wcXHaxoZKWPA==
X-Received: by 2002:a05:7022:3c88:b0:11a:6424:f40f with SMTP id
 a92af1059eb24-121722fd1e7mr9423130c88.36.1766425401721; 
 Mon, 22 Dec 2025 09:43:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHGeD8sn5NdEFT/L4992/tLVF5man9MpIOwm0i4U9mIbJtZc6sZ3neUr1VFBGLEiHQ9joHfw==
X-Received: by 2002:a05:7022:3c88:b0:11a:6424:f40f with SMTP id
 a92af1059eb24-121722fd1e7mr9423091c88.36.1766425401034; 
 Mon, 22 Dec 2025 09:43:21 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e4:8e00:b6e2:5e18:4823:58ce])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfdd0sm47629542c88.4.2025.12.22.09.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 09:43:20 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Mon, 22 Dec 2025 12:42:48 -0500
Subject: [PATCH] Revert duplicate "drm/amdgpu: disable peer-to-peer access
 for DCC-enabled GC12 VRAM surfaces"
MIME-Version: 1.0
Message-Id: <20251222-fix-duplicate-amdgpu-v1-1-18e928420d15@redhat.com>
X-B4-Tracking: v=1; b=H4sIABeDSWkC/x2MWwqAIBAArxL73YJuSdBVog/LzRZ6iFYE0d2TP
 gdm5oHEUThBWzwQ+ZIk+5ZBlwWMs908o7jMQIqMJiKc5EZ3hkVGezDa1flwYl0r3QzaVIYHyGm
 InL1/2/Xv+wFZ1N7WZgAAAA==
X-Change-ID: 20251222-fix-duplicate-amdgpu-44017b1535eb
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Peter Colberg <pcolberg@redhat.com>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yJe2buf_CvFOeEitchAKCaGM9fPChZfJhRvOIF7H8-o_1766425402
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

This reverts commit 22a36e660d014925114feb09a2680bb3c2d1e279 once,
which was merged twice due to an incorrect backmerge resolution.

Fixes: ce0478b02ed2 ("Merge tag 'v6.18-rc6' into drm-next")
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index e22cfa7c6d32f286de94c6e0947c20db41894b68..c1461317eb29877446e69562a58e17a77203a79e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -83,18 +83,6 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	int r;
 
-	/*
-	 * Disable peer-to-peer access for DCC-enabled VRAM surfaces on GFX12+.
-	 * Such buffers cannot be safely accessed over P2P due to device-local
-	 * compression metadata. Fallback to system-memory path instead.
-	 * Device supports GFX12 (GC 12.x or newer)
-	 * BO was created with the AMDGPU_GEM_CREATE_GFX12_DCC flag
-	 *
-	 */
-	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(12, 0, 0) &&
-	    bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC)
-		attach->peer2peer = false;
-
 	/*
 	 * Disable peer-to-peer access for DCC-enabled VRAM surfaces on GFX12+.
 	 * Such buffers cannot be safely accessed over P2P due to device-local

---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-fix-duplicate-amdgpu-44017b1535eb

Best regards,
-- 
Peter Colberg <pcolberg@redhat.com>

