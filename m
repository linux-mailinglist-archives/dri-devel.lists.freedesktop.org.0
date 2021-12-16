Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D879A477A08
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 18:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D079D10EC09;
	Thu, 16 Dec 2021 17:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A954310EC19
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 17:10:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 bg2-20020a05600c3c8200b0034565c2be15so2270485wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 09:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/875UjIeI/WJ8vJETC0FE0YD/vlu8AvDtauH40Y2gWE=;
 b=csjFl4i8BgqLJ6vlmytOL5VCujMEkqZNZj36sscCD18vuWsyVxWvMjokPjes9slSh3
 ZyaTE3U0f/e3NkKCvueAgEv7lARIYj6+ASipSy3lkt5UndutsAMsL+dOU5TYkIRwOP0j
 yDodkrZ2UIDnL+oDG+ELW21SrhVF1ZL0cUQRL1AcF8P+o3tDHHe35CQOP4hAsTpPJbSt
 7INU0Lx/o3U/M9js0v5Oe1V9BnJfuNVItL/kUlWLf72Ip2ZIndtQOBMSXdb+lU2J5QmS
 XtExVQxpsLKj6abUuEtV+Jt7kDDiHZoVAHswLoVH4BHb+Jl4+qGzl9NDmv0KGuWOApHu
 GxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/875UjIeI/WJ8vJETC0FE0YD/vlu8AvDtauH40Y2gWE=;
 b=LSe3MyjkkyUMLx6hPmn+biSFqB1zRe791rnK/OABgpmCOJergJdh7nKmBjgyZRll8N
 A6Ilab6u8+25i8QumOzpFEdhBA8dh/hWIXVzp+6KcI8HYmuURJ5inPUCXK0yISp8ICdv
 vkKqt4dHWD8wbGdwF9YrB7/Ag4sBwnW3SjeScXrYe4e91DkTd4oBQR8AiNKhNWCX/xMt
 e1e4bsWMPnv458wtnlzLb+d9FVC8EHwUW8DtDyGslyzseQSTjSbmZPuxQRIqSupoCj5R
 2arNUqcHdgHBph+RAtPHV7f6EuoLKD9ENPwZRDMnlPCcz1UOJTrzTGoYd7RM1oJ8SOtd
 AgRw==
X-Gm-Message-State: AOAM530GBC7p7CA6sXE4+h+McmXiRwKrQTokOsdrFxHBqIiaVZcjCOTn
 7K1bf+ygnqc+FD7mjZpaPpq17w==
X-Google-Smtp-Source: ABdhPJxjxNIeJB6nYaZJ8T7V31trycXob0pijctG1UTk/tVAxm08sBb0CYmIcG8LFq7+Y/4oikmC6Q==
X-Received: by 2002:a05:600c:a06:: with SMTP id z6mr5902582wmp.9.1639674619142; 
 Thu, 16 Dec 2021 09:10:19 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id e12sm6808415wrq.20.2021.12.16.09.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 09:10:18 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/cma-helper: Describe what a "contiguous chunk" actually
 means
Date: Thu, 16 Dec 2021 17:10:04 +0000
Message-Id: <20211216171004.18166-1-daniel.thompson@linaro.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since it's inception in 2012 it has been understood that the DRM GEM CMA
helpers do not depend on CMA as the backend allocator. In fact the first
bug fix to ensure the cma-helpers work correctly with an IOMMU backend
appeared in 2014. However currently the documentation for
drm_gem_cma_create() talks about "a contiguous chunk of memory" without
making clear which address space it will be a contiguous part of.
Additionally the CMA introduction is actively misleading because it only
contemplates the CMA backend.

This matters because when the device accesses the bus through an IOMMU
(and don't use the CMA backend) then the allocated memory is contiguous
only in the IOVA space. This is a significant difference compared to the
CMA bankend and the behaviour can be a surprise even to someone who does
a reasonable level of code browsing (but doesn't find all the relevant
function pointers ;-) ).

Improve the kernel doc comments accordingly.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 8467783e92f3..81d7181deebd 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -32,10 +32,10 @@
  *
  * For devices the access the memory bus through an (external) IOMMU then
  * the buffer objects can be scattered in physical memory but linearized
- * in the IOVA space by the MMU.
+ * in the IOVA space by the IOMMU.
  *
  * For other devices we must rely on the Contiguous Memory Allocator to
- * reserve a pool of memory at early boot that is used to service requests
+ * reserve a pool of memory at early boot. This is then used to service requests
  * for large blocks of physically contiguous memory.
  */


base-commit: 2585cf9dfaaddf00b069673f27bb3f8530e2039c
prerequisite-patch-id: bfcd9122d2546ec77e0bd987663777192002bc91
--
2.34.1

