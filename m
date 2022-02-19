Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B94BC975
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 18:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0DE10FF58;
	Sat, 19 Feb 2022 17:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D0F10FF55
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 17:02:34 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id ik27so827557plb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 09:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JDxmYIM8I0UHDFtNzfKhVrh+LAL9uJ//iBVpmzyjpD8=;
 b=bfkvqTNbGC0DdhOwIPwSY1qRb5B76PXNb+SxqNRNze7cN4qBNLEeT8w6zuE3/mnqZ3
 kFid1tcwL7jpwjSkXTnqiwAZewoU205uGxuOTAXWKfEGjxcKHhlo4uGdsl0X9xYWSy7O
 pcR6hGH8Gj2w104R5RudiEEdh5FwOr2AawvwM2teKU/syLKY/mPHG0x01Nzt7Tli1XZ7
 ag4X2mFLvKpXVNkB34OEWmWl9EEQiVHgt3x6nVEF9S5NaSTUmKH2IMqjSCGyB6sUoORz
 S3zZqQAjGK13Uonrb8g6bKGEOZ6gP4zV+OwooUgHOWrrDwHfBIdyqzmEJJQSpvNXgclS
 xSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JDxmYIM8I0UHDFtNzfKhVrh+LAL9uJ//iBVpmzyjpD8=;
 b=c57x8PtZyJ+GHRGRifmrgGsa52qOLkqluavPSxy/QJ973VVxoRKz4qtXDlyfzJ92RO
 w7t+6yjQ6mA3j1X5yimXZkHmIVbuHThrJiDnjukD5KiRhWUBOml0EqM7FPD0EgSeWN2b
 cEOn546WSAqXlkDpcexHWx+ZWm/R1y7cPSODEXl3BAIZRL4T1jHCf7L0Siwo7LAmmfhv
 ZUKYf73c3yQ7BktqtOCxokpGFNAu3izujr82Lli5GnA99i/EgDK282Lpu0/VgJXhGYYn
 ZwW3R0HAZaDb1eKcBj3UODfbhyCLxeKu9KhuTvtJfl4Crtyoz06jDKANQggytwpU68oN
 5DUg==
X-Gm-Message-State: AOAM532brReY2PP2pSLOgAU1E+g4guEMk77ODlE8SLExuVMazbHWuGk2
 F/N51QSW2bVWp5VfHuXmIYQbEIAUqf4=
X-Google-Smtp-Source: ABdhPJwNFTzgFD5Dxvg2t7x24UnqKLQIqCny6cm/SHjHpm8VoDCpT63w7lHReOZLzg/mrOjXulYbaA==
X-Received: by 2002:a17:90b:117:b0:1b8:e632:c589 with SMTP id
 p23-20020a17090b011700b001b8e632c589mr13581026pjz.26.1645290153686; 
 Sat, 19 Feb 2022 09:02:33 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 z16sm6244371pfw.159.2022.02.19.09.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 09:02:32 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: Remove restriction of non-zero blob_flags
Date: Sat, 19 Feb 2022 09:03:01 -0800
Message-Id: <20220219170301.545432-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

With native userspace drivers in guest, a lot of GEM objects need to be
neither shared nor mappable.  And in fact making everything mappable
and/or sharable results in unreasonably high fd usage in host VMM.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
This is for a thing I'm working on, a new virtgpu context type that
allows for running native userspace driver in the guest, with a
thin shim in the host VMM.  In this case, the guest has a lot of
GEM buffer objects which need to be neither shared nor mappable.

This supersedes https://patchwork.freedesktop.org/patch/475127/

 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 69f1952f3144..3a8078f2ee27 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -617,8 +617,7 @@ static int verify_blob(struct virtio_gpu_device *vgdev,
 	if (!vgdev->has_resource_blob)
 		return -EINVAL;
 
-	if ((rc_blob->blob_flags & ~VIRTGPU_BLOB_FLAG_USE_MASK) ||
-	    !rc_blob->blob_flags)
+	if (rc_blob->blob_flags & ~VIRTGPU_BLOB_FLAG_USE_MASK)
 		return -EINVAL;
 
 	if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE) {
-- 
2.34.1

