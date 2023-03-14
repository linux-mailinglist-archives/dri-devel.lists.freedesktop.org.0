Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA966B956A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 14:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3ADE10E7E3;
	Tue, 14 Mar 2023 13:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4901D10E7E4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 13:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678799185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hMEgWvZUG6qO1PqKglF/V8CaNHty0qtVjMQOxDeWDFc=;
 b=DUL6CFuMbIOoD4c4OFi6hJsSx+/q4oxNAUeJGKQWCOksmErY1KxdPotw/qH+H9NKs9AISr
 1ss7k8IFtt98Yj2ZyLYz4VunoiWORxBJb+kqRgFzUU+v38q2EiHahDCf2to8zhtTcCd4wQ
 PB0HwA2mpxvhMLkJy2P7h09JW7GubOs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-voWz7tHbNFaSjtbbLQU3hw-1; Tue, 14 Mar 2023 09:06:23 -0400
X-MC-Unique: voWz7tHbNFaSjtbbLQU3hw-1
Received: by mail-qk1-f200.google.com with SMTP id
 l27-20020a05620a211b00b00745b3e62004so2102528qkl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 06:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678799182;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hMEgWvZUG6qO1PqKglF/V8CaNHty0qtVjMQOxDeWDFc=;
 b=qXViEq+4H3zJvYARRO+6jskn/QcVYccRDg2hooIf7c5jc9gPC7hEJ+JdVizh5b87QO
 Nu3Nfd7/NrytJhF7YOlZ8x+2oCp+ftlBsqB/SDFF8NGKZMLyPJlEcTDgw3OPeLdNtpD4
 fQPkNmpZAN4T9sCLVn5F0m2l7IQgLZfk4uSfhZLohQA+O9DxFgT7WXTDKlzG3IkqxDGi
 MfCp0oklfdWnei8uKd84GHfkEXFdYzKfASUaxRaehk4R80lm0LaQ3Fd7rupucArh/6y4
 tyZjcqFmH3vnuLC321BZKnGFJNbVMiI6bvQ5p3oJ/1VykIGJ5DXEN+beXlOkgeo35DQG
 CcpQ==
X-Gm-Message-State: AO0yUKUTE1uex5pN71ZjducqUAaachtLCsP7z004Caf4uIvRKdn6nrGf
 e+SC4PmFwxaDeTjzNkk6didpFRHS+9eE/0jL2+xWfBAej6esZde/1Tju9JS2K0UvrIabT23K00E
 7zVr2v+7LZsOvJsCkMFohkgzqfbc+
X-Received: by 2002:ac8:5e08:0:b0:3bf:c83d:5d4c with SMTP id
 h8-20020ac85e08000000b003bfc83d5d4cmr59779105qtx.64.1678799182203; 
 Tue, 14 Mar 2023 06:06:22 -0700 (PDT)
X-Google-Smtp-Source: AK7set9k9IedTfQ65vtzZ6gDRjmULVgJGaURZvyzzIxUwogrHRw3OQKTz3pFVe2b8l6tkgGNH294DA==
X-Received: by 2002:ac8:5e08:0:b0:3bf:c83d:5d4c with SMTP id
 h8-20020ac85e08000000b003bfc83d5d4cmr59779062qtx.64.1678799181828; 
 Tue, 14 Mar 2023 06:06:21 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 185-20020a3706c2000000b0070648cf78bdsm1731416qkg.54.2023.03.14.06.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 06:06:21 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: remove unused variable rbo
Date: Tue, 14 Mar 2023 09:06:16 -0400
Message-Id: <20230314130616.2170856-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc with W=1 reports this error
drivers/gpu/drm/radeon/radeon_ttm.c:201:27: error:
  variable ‘rbo’ set but not used [-Werror=unused-but-set-variable]
  201 |         struct radeon_bo *rbo;
      |                           ^~~

rbo use was removed with
commit f87c1f0b7b79 ("drm/ttm: prevent moving of pinned BOs")
Since the variable is not used, remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 2220cdf6a3f6..0ea430ee5256 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -198,7 +198,6 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 {
 	struct ttm_resource *old_mem = bo->resource;
 	struct radeon_device *rdev;
-	struct radeon_bo *rbo;
 	int r;
 
 	if (new_mem->mem_type == TTM_PL_TT) {
@@ -211,7 +210,6 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (r)
 		return r;
 
-	rbo = container_of(bo, struct radeon_bo, tbo);
 	rdev = radeon_get_rdev(bo->bdev);
 	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM &&
 			 bo->ttm == NULL)) {
-- 
2.27.0

