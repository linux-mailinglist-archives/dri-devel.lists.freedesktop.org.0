Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F702496CB5
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 15:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBE010ED46;
	Sat, 22 Jan 2022 14:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C91210ED46
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 14:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642862161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iMoDmTVNmITbklh5q/t/44BNAz/LykE1HqAeIjzQA3M=;
 b=UbK4UtqrIvBxf7GyfJC3xU6ew+qaYtCFrRfc/WIHyiC20wOLO/Xz7AaGFIZy1sWowtRkFs
 yySaH6azf0w0zErS/ZNTMwN1ZwqEsmKnDxn1jkfdflqHWV2DaIe+PAaJBLWe/bvdyqu1Qj
 y8a/mnMud3sJ2aqa7VzxNv4/N62RpHw=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-I3y8eEDbP1GJ0gDcGwGCvg-1; Sat, 22 Jan 2022 09:35:59 -0500
X-MC-Unique: I3y8eEDbP1GJ0gDcGwGCvg-1
Received: by mail-ot1-f70.google.com with SMTP id
 h17-20020a9d7991000000b0059b4230fc63so7400117otm.13
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 06:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iMoDmTVNmITbklh5q/t/44BNAz/LykE1HqAeIjzQA3M=;
 b=dKFrJ8fQh87wFghDlBN7t594QQHxwn529WGUbNW4arnV7lihAbxR2J/flx6ymhsaLK
 9Y1uad1IcsUJ3r8UC4Cu+e8/xfPGMTQ8P48jZNgoEiGqkEnDthwwjLeSVSXYq1IFFYDo
 a9zz4OX6yWhI2ckAQzLcdGhIxIqPXMy09bkeGNrxYExvpi+IulSugjO3wWCEW/46IppQ
 DOh4iwPRJo2JYXz/M8sjTtSlvTmKLQF9HQLR3n3BXglZEz+DzTcjPHxssPkyZMmH9vO+
 Exgtnl9z7iL4LiYymLOw2JKKXTxIPQl0D/6+xNrkgXy3uyKChUyHVtJf8J5VfBL9slfe
 9VEw==
X-Gm-Message-State: AOAM533brJt5NoVn2vbKXUyY+xC2SpC+3F2uOhEzA1StzweFqfxtF0Os
 jqChDPDvzSOcH8CT4KMh4vX/bUYpyD1aSxqAZv7d9EdkD0oaNGswPXDD2B8vo4ID9SZlwSWF7IS
 E8UeZII1Jf/PZ1GTlydzzyQU9gVgH
X-Received: by 2002:a05:6830:25d0:: with SMTP id
 d16mr6221818otu.362.1642862158911; 
 Sat, 22 Jan 2022 06:35:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgc0T99YhICS47P7DM3QV6ViRHJuBhuoL3AAcXMdbyPUZZgVBeGsTVqm4QwhQs0NqYaB+Bjg==
X-Received: by 2002:a05:6830:25d0:: with SMTP id
 d16mr6221798otu.362.1642862158724; 
 Sat, 22 Jan 2022 06:35:58 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id w13sm2943114oik.52.2022.01.22.06.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 06:35:58 -0800 (PST)
From: trix@redhat.com
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/amdkfd: simplify else if to else check of
 MIGRATION_COPY_DIR
Date: Sat, 22 Jan 2022 06:35:49 -0800
Message-Id: <20220122143549.914925-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

The enum MIGRATION_COPY_DIR type has 2 values.  So
the else-if can be converted to an else.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index d986f9ee0e1f4..c06c44f37b00e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -146,7 +146,8 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 			gart_s = svm_migrate_direct_mapping_addr(adev, *vram);
 			r = svm_migrate_gart_map(ring, size, sys, &gart_d, 0);
 
-		} else if (direction == FROM_RAM_TO_VRAM) {
+		} else {
+			/* direction == FROM_RAM_TO_VRAM */
 			r = svm_migrate_gart_map(ring, size, sys, &gart_s,
 						 KFD_IOCTL_SVM_FLAG_GPU_RO);
 			gart_d = svm_migrate_direct_mapping_addr(adev, *vram);
-- 
2.26.3

