Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5225E8CC83D
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 23:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC2B10EDAD;
	Wed, 22 May 2024 21:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CJdoYKRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EB110EDAD;
 Wed, 22 May 2024 21:50:26 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-5b283d2b1b4so3184368eaf.0; 
 Wed, 22 May 2024 14:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716414625; x=1717019425; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zBAoZG0al1m+JA3ktgdRMgrP5Z9mDaaNRS9hpWp/qPE=;
 b=CJdoYKRX8nAuADr7zldbFBkTi/V+rHIwC0tozIj1lf66EAO0fhmSayb3KjJvt/leG+
 WL5gjTZRtfNSwJ2wIcBWRUQVxmExeoSuuO1gD/VpZ02mBtbFyYBIEmSeOnRLgvVz7SHN
 Ruf1EXMbawuoQKeE2vitJ6FWlHShRnEDhjZnZER9R2m7FKpm/cr7UA8j3SMeJZ2OqJzn
 3PLUI1ylWAzprc/XmTtssx082OpZB+ZGnIKlaQnMO+g6ZeZVepmuqwJtb/9JMCgeZ8v7
 IoaR00M1kWDaM7UV5BQJxE5YbTdeZq548TX5LWrQfqhPX8e0MytsChtpzpEvAxlFR/1D
 WDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716414625; x=1717019425;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zBAoZG0al1m+JA3ktgdRMgrP5Z9mDaaNRS9hpWp/qPE=;
 b=nrKhRKbd+nmGMLX/WXvCtnpJxorw5PcQXv1aspOmC3DHxnctm7DgqZHfK+DO8/7z+1
 Ri9sU8R0knyRjLIFjSWoyo8YIubeleauFM6d76Ma57fFrQQAVUHZvMlQX5pojBVplpRA
 MHOuaSB3C0lIEhgVtSYfmCHGvyKIyJdWOGbdCTkE1c0slMGmvsQXhXZ+0MePzhiVyeyu
 LZSUovRqAENdP79PyBJpPOzTHji2AWgYMNv3XjKB7rZyJmkzKwWZRNAGc76JVZjI3M3u
 RFyEszReVuRC+OBW8betBy9LisnglzkxQePrY00pBs1NFI9d+D0DJSKJt4ctpvoasYYi
 GI3w==
X-Gm-Message-State: AOJu0Yy2ucBZJ5ZB4SO/ic1sE7O/GYc2NpiBJMleWN2curzs3ouKXvnq
 NPhlsx9Ge18EZmYjdRZW2jwZjCRtbciny/PfdMAIZMUdb1Xfx8ukdeJifg==
X-Google-Smtp-Source: AGHT+IEJ5Jxw6Dx7ysWEw9SOQIKtcpP6HWnvE1UIWEcK7zpJ4dBNansEqpDAUp5l6zKniQsabf2Azw==
X-Received: by 2002:a05:6359:704b:b0:18d:9e5f:aaec with SMTP id
 e5c5f4694b2df-1979213ec36mr296068055d.31.1716414624804; 
 Wed, 22 May 2024 14:50:24 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f677a20c6bsm13037190b3a.129.2024.05.22.14.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 14:50:23 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
 Jason Gunthorpe <jgg@ziepe.ca>, Joao Martins <joao.m.martins@oracle.com>,
 Joerg Roedel <jroedel@suse.de>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-pm@vger.kernel.org (open list:POWER MANAGEMENT CORE),
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH v3 0/2] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date: Wed, 22 May 2024 14:50:03 -0700
Message-ID: <20240522215014.26007-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This series extends io-pgtable-arm with a method to retrieve the page
table entries traversed in the process of address translation, and then
beefs up drm/msm gpu devcore dump to include this (and additional info)
in the devcore dump.

This is a respin of https://patchwork.freedesktop.org/series/94968/
(minus a patch that was already merged)

v2: Fix an armv7/32b build error in the last patch
v3: Incorperate Will Deacon's suggestion to make the interface
    callback based.

Rob Clark (2):
  iommu/io-pgtable-arm: Add way to debug pgtable walk
  drm/msm: Extend gpu devcore dumps with pgtbl info

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 +++++
 drivers/gpu/drm/msm/msm_gpu.c           | 22 +++++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++
 drivers/gpu/drm/msm/msm_iommu.c         | 18 +++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  5 ++-
 drivers/iommu/io-pgtable-arm.c          | 50 ++++++++++++++++++++-----
 include/linux/io-pgtable.h              |  4 ++
 7 files changed, 107 insertions(+), 10 deletions(-)

-- 
2.45.1

