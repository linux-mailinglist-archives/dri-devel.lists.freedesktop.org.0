Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E242AAE08
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EA98979E;
	Sun,  8 Nov 2020 22:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAE86E059
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 16:38:38 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id v11so782358qtq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 08:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l//k+DSsx34Nc1jx/NivWPrPdB1Y2U4G87NDV4sY8fM=;
 b=J+dH50Ir6c9uH6K2wDO7IcS4bmFe8lOV8q7+I16iVL9sjS3ctqlKrze3+q9Dn3fH/p
 RpMwzXUMrzNbJyPmx+TInGqyYah2NJUHYeomnGj+eemuaR379i/7d8r5X8giuFbGhR7y
 wrM6ajU8PG6oJDbIPQ9ERXxj/66peBmKJWpqMXvriAry6Z3WSgCMRWZe9tfZ3T9X9y9j
 QTQwPL+nomvaHWeZlEFoV04dF9gYsCCXTk8CeYNMv10M/BfwBV6pZXPdNV9t7LDRtRoO
 6lEJFo7vdOQFlmWWaJ8vZA+GtzvCwj4m3nO1x+NSb0nhaMaTJE3zVpMpDnJ4erK0/xQF
 ZzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l//k+DSsx34Nc1jx/NivWPrPdB1Y2U4G87NDV4sY8fM=;
 b=A4nWJ0JEMGIWj7nMQX6mycXBjAtEag8+3YRbxfDDT7IL5Aq/vnpXqVvvHPkL2daZno
 ZeKtk9WnTmj49X/PABtQ5JP0HtOeBdQWiwXN1xWE4g5iHW9tZAKq28dCBBfLukDNwuOx
 kB7s09DP/ku1CFNqhgTjaUop7sbifVUOyHvnY6KpfIVy3tWgawbo6DD/ss4rk6mbcNbp
 A3uZ6mm2qCY/L23VVzhNA8S40sA8AfXoMETW+b/IP8C0zfWYdHOCbcx6mMoZIwCmVEOC
 UKC91Gew9aNB4BQ19u1TrOm5dZM1Hb4G71LYXjxis3pzPO5Yi3b/dBXPEQFDCp45rKwJ
 mJAQ==
X-Gm-Message-State: AOAM532W40ECZMzilMtk2jKzxpPjpdg5fRS3i3CWq7ScWJ3uJAxBm4I/
 zcwdY9gqChLbJy8CkrsNJCxaHg==
X-Google-Smtp-Source: ABdhPJxHUWgYZ4frcBST4WltJsrhWPJrimgJHKRjTXKm4KGGNoJ82BuMMEXhzlmb3W3E9MA/bng0Qg==
X-Received: by 2002:ac8:5748:: with SMTP id 8mr2284612qtx.114.1604680717401;
 Fri, 06 Nov 2020 08:38:37 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id s3sm860000qkj.27.2020.11.06.08.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:38:36 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/5] drm/msm: support for host-cached BOs
Date: Fri,  6 Nov 2020 11:34:29 -0500
Message-Id: <20201106163437.30836-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is to support cached and cached-coherent memory types in vulkan.

v2:
 - added patches 2/3 to enable using dma_ops_bypass
 - changed DRM_MSM_GEM_SYNC_CACHE patch to use dma_sync_sg_for_device()
   and dma_sync_sg_for_cpu(), and renamed sync flags.

Not sure I did the right thing with for the dma_ops_bypass part,
this is what I came up with reading the emails.

Jonathan Marek (5):
  drm/msm: add MSM_BO_CACHED_COHERENT
  dma-direct: add dma_direct_bypass() to force direct ops
  drm/msm: call dma_direct_bypass()
  drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent cache maintenance
  drm/msm: bump up the uapi version

 drivers/gpu/drm/msm/Kconfig                |  1 +
 drivers/gpu/drm/msm/adreno/adreno_device.c |  1 +
 drivers/gpu/drm/msm/msm_drv.c              | 32 +++++++++++++++++++---
 drivers/gpu/drm/msm/msm_drv.h              |  3 ++
 drivers/gpu/drm/msm/msm_gem.c              | 31 +++++++++++++++++++++
 include/linux/dma-direct.h                 |  9 ++++++
 include/uapi/drm/msm_drm.h                 | 25 +++++++++++++++--
 kernel/dma/direct.c                        | 23 ++++++++++++++++
 8 files changed, 118 insertions(+), 7 deletions(-)

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
