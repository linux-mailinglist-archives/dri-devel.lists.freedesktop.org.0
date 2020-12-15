Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC9A2DAF0F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 15:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC866E3D0;
	Tue, 15 Dec 2020 14:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C0E6E3C6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608043127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CA11H/hjEhbgy7tnphG2KLHb+jmHcRmnL5DLgtJD9b0=;
 b=i4j6hXOjxGSTEUZUlQREC5tcGRdQ71YuYlhBlxm5rwRPAxq4QN2ALBrkpfdB+6G2bhQr/Z
 hHcSKyJ1lbcRUk+ZiArmhzCkpkZNPiGgW9CYqFZ/kVwH1Gj6jri0nkd0/OSf1ccMIB4xhX
 ASiyNQyeqKPKxmmYCCGi29uCQNiM4Oo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-XM54aQ79Pzq11dBHxhcniQ-1; Tue, 15 Dec 2020 09:38:45 -0500
X-MC-Unique: XM54aQ79Pzq11dBHxhcniQ-1
Received: by mail-qk1-f197.google.com with SMTP id 188so6772353qkh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 06:38:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CA11H/hjEhbgy7tnphG2KLHb+jmHcRmnL5DLgtJD9b0=;
 b=SeZoYDIrpHgm9pUI/nkxysZt2qQ28t5UYfiDSWK+vUKPr1pFUY8BOpkkxfoyn3uEbd
 jer8QamjFzNyP7urg8tn6lW/uHSXoJMUe+fkRWrNTTAvbmd6c0k6yENw6FWrjrwkUydj
 2ESK1EIPLVOQHdDDrmM3Wx18b4P47eqS5TNbvpZetNILCieCR5BQ1lBsNqLaAPgf6mY8
 nkox0VFxXxI9U6NwWBz3MTxyBQ4Uzv+CLdUtdTR3VamqCinJb/zTVvrdor/+Gf7Sz7ZW
 Ty8g5DNVN0dls90JSJps65dtLAS8gEwJ/15jEIuTuctTNyLnfwV24BUjnxoBejhozIQH
 9qPQ==
X-Gm-Message-State: AOAM532+bGkPkG8bJm84g8ohS8Br8JymPE62ZNYPGyT6bVw3v38bMmiC
 EzcfZ4xKzMvE/ZAIjt67v/fnV/L1MsZ4s1UvD54VqhDjHOh8yUL+zNHPoU5uAr3/ke1Ol6aAA1w
 NDgYGjbPswD7vqimQjLohhQoJD8Fw
X-Received: by 2002:ac8:6ec5:: with SMTP id f5mr38380280qtv.56.1608043124635; 
 Tue, 15 Dec 2020 06:38:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzv/jCdfHqYOSQUF3qGweRu3h36fTJyA9ZrWvPOpg/YPfe7jHGmISC3hdRzS09ANHjuNAsAYg==
X-Received: by 2002:ac8:6ec5:: with SMTP id f5mr38380257qtv.56.1608043124444; 
 Tue, 15 Dec 2020 06:38:44 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id m10sm16456643qtg.52.2020.12.15.06.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:38:43 -0800 (PST)
From: trix@redhat.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, lee.jones@linaro.org, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com, sonny.jiang@amd.com, xinhui.pan@amd.com,
 colin.king@canonical.com, James.Zhu@amd.com, leo.liu@amd.com,
 thong.thai@amd.com, vegopala@amd.com, boyuan.zhang@amd.com,
 Monk.Liu@amd.com, mh12gx2825@gmail.com
Subject: [PATCH] drm/amdgpu: remove h from printk format specifier
Date: Tue, 15 Dec 2020 06:38:35 -0800
Message-Id: <20201215143835.1874487-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

See Documentation/core-api/printk-formats.rst.
h should no longer be used in the format specifier for printk.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 7c5b60e53482..8b989670ed66 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -240,7 +240,7 @@ int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
 
 		version_major = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xff;
 		version_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
-		DRM_INFO("Found UVD firmware Version: %hu.%hu Family ID: %hu\n",
+		DRM_INFO("Found UVD firmware Version: %u.%u Family ID: %u\n",
 			version_major, version_minor, family_id);
 
 		/*
@@ -267,7 +267,7 @@ int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
 		dec_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
 		enc_minor = (le32_to_cpu(hdr->ucode_version) >> 24) & 0x3f;
 		enc_major = (le32_to_cpu(hdr->ucode_version) >> 30) & 0x3;
-		DRM_INFO("Found UVD firmware ENC: %hu.%hu DEC: .%hu Family ID: %hu\n",
+		DRM_INFO("Found UVD firmware ENC: %u.%u DEC: .%u Family ID: %u\n",
 			enc_major, enc_minor, dec_minor, family_id);
 
 		adev->uvd.max_handles = AMDGPU_MAX_UVD_HANDLES;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 4861f8ddc1b5..ea6a62f67e38 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -179,7 +179,7 @@ int amdgpu_vce_sw_init(struct amdgpu_device *adev, unsigned long size)
 	version_major = (ucode_version >> 20) & 0xfff;
 	version_minor = (ucode_version >> 8) & 0xfff;
 	binary_id = ucode_version & 0xff;
-	DRM_INFO("Found VCE firmware Version: %hhd.%hhd Binary ID: %hhd\n",
+	DRM_INFO("Found VCE firmware Version: %d.%d Binary ID: %d\n",
 		version_major, version_minor, binary_id);
 	adev->vce.fw_version = ((version_major << 24) | (version_minor << 16) |
 				(binary_id << 8));
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index 1e756186e3f8..99b82f3c2617 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -181,7 +181,7 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 		enc_major = fw_check;
 		dec_ver = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xf;
 		vep = (le32_to_cpu(hdr->ucode_version) >> 28) & 0xf;
-		DRM_INFO("Found VCN firmware Version ENC: %hu.%hu DEC: %hu VEP: %hu Revision: %hu\n",
+		DRM_INFO("Found VCN firmware Version ENC: %u.%u DEC: %u VEP: %u Revision: %u\n",
 			enc_major, enc_minor, dec_ver, vep, fw_rev);
 	} else {
 		unsigned int version_major, version_minor, family_id;
@@ -189,7 +189,7 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 		family_id = le32_to_cpu(hdr->ucode_version) & 0xff;
 		version_major = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xff;
 		version_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
-		DRM_INFO("Found VCN firmware Version: %hu.%hu Family ID: %hu\n",
+		DRM_INFO("Found VCN firmware Version: %u.%u Family ID: %u\n",
 			version_major, version_minor, family_id);
 	}
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
