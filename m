Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0193161C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 15:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4B010E3C2;
	Mon, 15 Jul 2024 13:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BQ1/isWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F0910E3C9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 13:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721051545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CMRK0FAuRn48/f8vk7h8IrU23AJ1MPeYBe5TQ+OfZZ8=;
 b=BQ1/isWD1rDCfgiGBUUc2r+R45yiUoBoUMo/dBSny6BUXESi0kWNELtqT1lUETcaSF3GIC
 S9NZyPy5IfPqUrbull7Ul4mSxYHKnDp60gk0Yr+wVZGmcWgwmc7v3olRBwCaf9oCkCxMWb
 KK7/jyaJ5e1Y5poQ/lHDVNhN2K1h36g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-GcGJzuzUPemW3ilaacQRBg-1; Mon, 15 Jul 2024 09:52:23 -0400
X-MC-Unique: GcGJzuzUPemW3ilaacQRBg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a77e024eaa4so373972266b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 06:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721051542; x=1721656342;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CMRK0FAuRn48/f8vk7h8IrU23AJ1MPeYBe5TQ+OfZZ8=;
 b=YBWJV3ZlsSXK3ra5Wa4f7VfH1y6RNsuWsukqg/bJl8jkIu8V/I9KEKgck3Wcg5aGS7
 1vHG1vLxHnizNKQo6P47i8NCWxeuwNj7vRkovDb4PoL91s9CzoeaJLUroCWfEr3a19cJ
 pjNR4S4c1Lky3kChG9FSb4wiZjALF/i3+nD/4N0ItYl2O9ZVaZyBgqSy5iQe0/Cc47r+
 7WA2zjB6akUWxcnwGsFpSgmuEgZGEMdXy8BkPeKBCA/DOB9vVPi18X6LNFtbLuCu8KjD
 2sgrJbxfXFoyjRXj5xGrqT8M+W4b0EdYeEGxaWLVc7yDt+l2MWsjo9jixH+3EoQCfNFQ
 GTGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwoZVfQE88Q8N3TpLoTm/eY1UBvOMiMR7qclsHSDq5YF0UpLHgfRgnaFDKouqzIOg/UEnw02VY4+CrtUZQE591FbzTZnE7B3HHnoFiRRTm
X-Gm-Message-State: AOJu0YzNBxmgSYkR85EXSzGya9W/CgpIYVGEQUEm9RgXAQtVeXmEUbz7
 t8PsGo9Avr6qLH6UKzuOIvdoSuEGXFZycScI8RAQ48NBUwIteD7tafc+BaM3rcpVC4BfnJ5KoM/
 SFDDGwmqQKuc2C4Ui3pAFnqkddB+XkTxQwc2PxCcwPggB8xZYrVs+pKEs/v3OJkB80g==
X-Received: by 2002:a17:907:9711:b0:a72:6ff6:b932 with SMTP id
 a640c23a62f3a-a780b8844a1mr1653846366b.51.1721051541853; 
 Mon, 15 Jul 2024 06:52:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHwjV8KRnnz7iEjDpqsJ3D7PuPRD+rt8CqWAu8VqRYuDBEHehNYKk7YfxnNje69qgJqdGDIw==
X-Received: by 2002:a17:907:9711:b0:a72:6ff6:b932 with SMTP id
 a640c23a62f3a-a780b8844a1mr1653844866b.51.1721051541493; 
 Mon, 15 Jul 2024 06:52:21 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:a4d3:4896:56d4:f050])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5b48dbsm212469066b.57.2024.07.15.06.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 06:52:20 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/gpuvm: fix missing dependency to DRM_EXEC
Date: Mon, 15 Jul 2024 15:51:33 +0200
Message-ID: <20240715135158.133287-1-dakr@redhat.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In commit 50c1a36f594b ("drm/gpuvm: track/lock/validate external/evicted
objects") we started using drm_exec, but did not select DRM_EXEC in the
Kconfig for DRM_GPUVM, fix this.

Cc: Christian König <christian.koenig@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 50c1a36f594b ("drm/gpuvm: track/lock/validate external/evicted objects")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index d0aa277fc3bf..d08d79bbb0f6 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -254,6 +254,7 @@ config DRM_EXEC
 config DRM_GPUVM
 	tristate
 	depends on DRM
+	select DRM_EXEC
 	help
 	  GPU-VM representation providing helpers to manage a GPUs virtual
 	  address space

base-commit: 833cd3e9ad8360785b6c23c82dd3856df00732d9
-- 
2.45.2

