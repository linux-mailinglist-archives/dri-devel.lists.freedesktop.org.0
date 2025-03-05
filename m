Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A10A50368
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D4110E715;
	Wed,  5 Mar 2025 15:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DN7HGSZ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE8F10E715
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 15:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741188394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EWytTCujcELs5/4BiTEaWtlYBtC+JW3njDIGrLsFaXA=;
 b=DN7HGSZ0jga934RSpMfHEAAfHKsXnuTi/7kfl5igvosTjX+wtvwPlPypOAfQMxRUgkUeBJ
 /U0w2e8Az2FQEIXpD5VjmonCbNhxuaeFPqzJH90MBLG4UvRUoTUyg+LDt5kl7DBIxbGe1E
 dy7w3Ed2C9RnmbeEOO71cZ5aOO+hBIM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-oWLuZE_qOPSjocfPaPhYZw-1; Wed, 05 Mar 2025 10:26:33 -0500
X-MC-Unique: oWLuZE_qOPSjocfPaPhYZw-1
X-Mimecast-MFC-AGG-ID: oWLuZE_qOPSjocfPaPhYZw_1741188392
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-22366901375so21239205ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 07:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741188392; x=1741793192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EWytTCujcELs5/4BiTEaWtlYBtC+JW3njDIGrLsFaXA=;
 b=fH5pCQRC1IGnHg98b8mRRvuJ6TET77mcXkEn8qDyVop7iVvD6IfArs3mFOK8Hg6eu0
 GsTQnG7YoAIqsrVJO4edTGsA0A8oEbUIrmtn/koQKtRSoaMcc3BunRPwGqYiOQNCHhEd
 2VG69XQaisGpQGN9DryqRYDPGvFGAn0vrCFy2XH+rDBQsbR1vt5goFg2Ie/kTmeYoPK6
 AJPfKAmBNN/n3jQkUMv0avsJCb4aQ3v6B0FeBud2DOKjoPzHv9kVJkgLuMtV2gvbQ4K4
 0+5DIjOegEPmGAIAolkFPwwvCLQ8xJ6Oow/mUAcU9utQEvHG/wn3+VPiReIkfPzUSrwz
 qODw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyI1fEZvOUeTTr+ZLVdSZBZpUq/7xbTf3iHggIUmhaih6CMF9IlMIjuab87mlWrS1rH+lXRXs0kZ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYISbsmALlZDQAHTRZzEzz0e1XOBX3Js6RA4cDywQLxkfX6cuT
 hoP099zsEN/YAk4YjDpb78Cza9H/ZjeLnZP6WuhjgmTXnv/f+5Dgz1lXDAo5cjFV/gHRwB51j9+
 Ghr/xK9JobUn0KNYTOqT0FYKX6P1O1y6dxchzD3UL+5HYsiobaQ3/i/buYNtMjNqM6w==
X-Gm-Gg: ASbGncsa/yb/1ijcpovZ8OVc1Hp7FU9TnMGxo4GsRAP5pI5GYuLFU9UbJMA6pc3ZK0S
 2E1LARSvZYvSzXOzdp+1HOTXdPb48TvutVA2lF0ya2gxczCC/EIwWtZKGNwD0zYw4o9cIiE5Mbv
 1kgbLh27QbdGHEDQHZI8WT+/4Vs04sIPIYl2VGZ7rMJ8ST6sjWRGmf1WVBgrVfwF1HxyCWedDbQ
 0rIlE6EiuIMLB3ShtKouwwjNKzTb9qmUBiUAS2+1ZJPJa7YIRDbbA+gn5jo2GWrw3QyW82iWsye
 OsVaLSyrCtQwW2xG
X-Received: by 2002:a05:6a00:9a0:b0:736:38b1:51c3 with SMTP id
 d2e1a72fcca58-7366e75b316mr13315904b3a.10.1741188392426; 
 Wed, 05 Mar 2025 07:26:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1AgdJworx0wc6ga7cTSTBOuDEcumamKctgiwANw8/Rb3cfxQmtMLlo6lyVJUiuFftqJ0LQA==
X-Received: by 2002:a05:6a00:9a0:b0:736:38b1:51c3 with SMTP id
 d2e1a72fcca58-7366e75b316mr13315865b3a.10.1741188392100; 
 Wed, 05 Mar 2025 07:26:32 -0800 (PST)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7364b4eff66sm6983292b3a.83.2025.03.05.07.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 07:26:31 -0800 (PST)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kraxel@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com, akpm@linux-foundation.org,
 urezki@gmail.com, hch@infradead.org, dmitry.osipenko@collabora.com,
 jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 linux-mm@kvack.org
Subject: [PATCH drm-next 0/2] Enhance drm_panic Support for Virtio-GPU
Date: Thu,  6 Mar 2025 00:25:52 +0900
Message-ID: <20250305152555.318159-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bLATxfPbgcUWEX61LyoUPE0tivK-uSMXBaFI1wHn78Y_1741188392
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Hi

This patch series proposes enhancement for drm_panic. While virtio-gpu
currently supports drm_panic [1], it is limited to vmapped shmem BOs.
IOW, it does not work in non-VT FB environments, such as GUI desktops.
This limitation arises because shmem BOs require vmap, which cannot be
used in a panic handler since vmap is sleepable and takes locks. To
address this, drm_panic needs an atomic variant of vmap.

The first patch (1/2) introduces atomic_vmap, and the second patch (2/2)
updates the existing virtio drm_panic implementation to use the
atomic_vmap. I've tested these changes in both Gnome and VT
environments, and they work correctly.

Best regards,
Ryosuke

[1] https://patchwork.freedesktop.org/patch/635658/ 

Ryosuke Yasuoka (2):
  vmalloc: Add atomic_vmap
  drm/virtio: Use atomic_vmap to work drm_panic in GUI

 drivers/gpu/drm/drm_gem.c              |  51 ++++++++++++
 drivers/gpu/drm/drm_gem_shmem_helper.c |  51 ++++++++++++
 drivers/gpu/drm/virtio/virtgpu_plane.c |  14 +++-
 include/drm/drm_gem.h                  |   1 +
 include/drm/drm_gem_shmem_helper.h     |   2 +
 include/linux/vmalloc.h                |   2 +
 mm/internal.h                          |   5 ++
 mm/vmalloc.c                           | 105 +++++++++++++++++++++++++
 8 files changed, 228 insertions(+), 3 deletions(-)


base-commit: e21cba704714c301d04c5fd37a693734b623872a
-- 
2.48.1

