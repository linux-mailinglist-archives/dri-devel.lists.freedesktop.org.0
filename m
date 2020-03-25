Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B51F7191DFD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 01:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F53089CB3;
	Wed, 25 Mar 2020 00:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D532D89CB3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 00:26:34 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 31so890645wrs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 17:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rj8Usyuc/6LE55XQ3cnpPsi7zX2DrkjvBhggI9Q5r9k=;
 b=HzYiH63POq7B49pW0wP2hpqAVOCwEeqmaNAlcgBRilZCc/1rQwluoWYPwsMtjQhEc6
 7CoQydMytozdzvuRtNGft5KlpNZ46ng7UvK1k8qEPUqILO46u/gM7BJfkoLqvtwq+3Lc
 OBGMjn3Gk5Ezl9uShZ+o9+w2q5MLMUDbLOx9tOwKOF2mHzG2pPeU32l2TB0d+waLceRs
 hgWpyvANSWeCLoFrHQPGep14vCgWD2mRf6Bxwcs+prWYrr17TpKH/pYza+meFjvqvoDE
 gKqkt1LaWsYy0tRJipO0Foxq69Ue+HJcpFIy8OYTVPZPy9DqTBs610zl8P/1wNIP7t2d
 xjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rj8Usyuc/6LE55XQ3cnpPsi7zX2DrkjvBhggI9Q5r9k=;
 b=IPkqwG50LcdDShPoEYp6YKmvVSV1I5sLgUBIFBxIshueI43gmfdP+m/AdlLsSj0NcP
 FtbzptBur1KhHLedH6wg6UgbsNFgoixmwEhRVSRIYfpTuMOg62+OaRSTDQxiZAPLrGff
 hdqdfwJpOooxnzu+YGLwhI4mHRBlMaeexnc4ix1xKDh/IhV7Hv1074p+12HxwCT75Z7K
 647Fa1dNImJhPMGiRvZnNkZgMIxv5PJ/ufzb1wg82M9akZJQ1BCLM6zEI/6zFOXmh1un
 HlCf83471fXT62H48GnMedmwMnoJNejVCULSUQYdcWdlKRUXuGkYwmER/qt6DjmBwTE1
 Y37Q==
X-Gm-Message-State: ANhLgQ0PBLRW0uJVIG+xZMclmRsUcWlqsMoBrtOBxAACgWQtXm0KDnjQ
 Ych4VU0bTqL7CEzqwkqZ1xViHMpNuzY=
X-Google-Smtp-Source: ADFU+vsT9Fvufr6bkmyhTAKYYMQwm8TJHj+QIsmsmaaoYupLHQzrKKyuPIU7CYusAVzIOH3pj2GS5g==
X-Received: by 2002:adf:f503:: with SMTP id q3mr325736wro.135.1585095993317;
 Tue, 24 Mar 2020 17:26:33 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id a64sm6632935wmh.39.2020.03.24.17.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 17:26:32 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/3] AMDGPU / RADEON / DRM Fix mapping of user pages
Date: Wed, 25 Mar 2020 00:24:47 +0000
Message-Id: <20200325002450.5240-1-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
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
Cc: airlied@linux.ie, bigbeeshane@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set is to fix a bug in amdgpu / radeon drm that results in
a crash when dma_map_sg combines elemnets within a scatterlist table. 

There are 2 shortfalls in the current kernel.

1) AMDGPU / RADEON assumes that the requested and created scatterlist
   table lengths using from dma_map_sg are equal. This may not be the
   case using the newer dma-iommu implementation

2) drm_prime does not fetch the length of the scatterlist
   via the correct dma macro, this can use the incorrect length
   being used (>0) in places where dma_map_sg has updated the table
   elements.

   The sg_dma_len macro is representative of the length of the sg item
   after dma_map_sg

Example Crash :
> [drm:amdgpu_ttm_backend_bind [amdgpu]] *ERROR* failed to pin userptr

This happens in OpenCL applications, causing them to crash or hang, on
either amdgpu-pro or ROCm OpenCL implementations

Shane Francis (3):
  drm/prime: use dma length macro when mapping sg to arrays
  drm/amdgpu: fix scatter-gather mapping with user pages
  drm/radeon: fix scatter-gather mapping with user pages

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 drivers/gpu/drm/drm_prime.c             | 4 +++-
 drivers/gpu/drm/radeon/radeon_ttm.c     | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
