Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891759EB710
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 17:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7DB10E3C2;
	Tue, 10 Dec 2024 16:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SBHDUgxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479AF10E2CC;
 Tue, 10 Dec 2024 16:51:45 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-21636268e43so35163475ad.2; 
 Tue, 10 Dec 2024 08:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733849505; x=1734454305; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JuzEEwZKQf9j9mqhaN0lST/eQY9CbMt5tK8I46FKdZM=;
 b=SBHDUgxRImDpF4RhulmPN1WOtZb5l7Iy3tE6cI/hmUZFaaSfpUrJDq7ayAuFyfuxcx
 oW1IvqEiSFYc1yoXxHCIQ0HEsmUNOqX3y7MXurgbnQp7/RhtkHKHrLFcSr6k/M653DIM
 R/QIPiD05CAOTEAy8to8Cb/wkgnZuTGMeMV8Fwq7vKGEaEyXAfta2os+Pd0bij8g78wz
 z4x0r4Utqng50iHMPrq4A91q3QYzk/ZW18REr8OoWfwrZS0Lc8+1lUwCiTGDw9N5Fv0h
 o6dA8SXAJAVW9jPjoHAnjDQnHrXzdeTjZII4K2RgXQ6d2gW6N/Yij8dKGb56DH76vU2i
 hXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733849505; x=1734454305;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JuzEEwZKQf9j9mqhaN0lST/eQY9CbMt5tK8I46FKdZM=;
 b=rJPSVVeIvIZMH2lPNMvPG3pQHcpWAGpk9OdIdWopw2916/GvsEBZ+5UP6a2lv65EdF
 on2ZzE71h95iXHTVk1AxiLSSpAgGJ36WUXfjvrz90RrxGwihqpwiMrkQ73yQ49v80qI4
 wQ98jv8Om0eXmnjoGmLzyyfDAq3Ph1beqEPp6e8RtzUM5bafpuAjaQpQpzW2qCpCihWK
 eMrhkXTN2dshBKTf9mmTCW81UMl49Bl4b3Dpwv4assdIt4+wuzGm6nBMIZE23mce7Ii7
 d3XUJjvbTOseNi1IErAgL5VBwXbxaal6XwoWDblEVTfzSAUZIcSSAMHiwsFnC9iQQL5l
 hrAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAd1B/2EC6ugSnKipyELM2Lcwei0dgvjvEO73THfTiajUUAmLER6/XxKUA9Nz6MhTFuV0IQOkaots=@lists.freedesktop.org,
 AJvYcCVOrS6GM0cY0ldKGvHbP4Do1UfDnHKXefjLcjMdiNu2oKqiP8TaWK26L1IYAFkcJGW2k0mO1xJTyb2g@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWwNaAfae0umyugx1YBGKyG/E6Fp6qHlG1+82lW4GU/T55uybW
 KKsdmNRBw6dJ4RoLSeFEIRYjB9ktPZbYlZLByAYIcH45kY9cZhOW
X-Gm-Gg: ASbGncvfnDuwVKdoJ4swyPw9TP0gpWuMePwiz1F2dRjJeRbe7niyEt2yEHQuUDhse9Y
 NQG7ScyE3cOrsPYW6DKVoLOjrjn9Q3hTjoXJjnbEYgAz67hx2/ihemACdvKABtvF6g5AKUpA8dg
 PxK9Bc3Dk0eUYVl9gMr3tMKHkCeU61wzR638EQZzLvOCcdUs7mMSRyYQrv9gXyXutJLP+lCgty2
 hlvT8HE+Ur/KlZGBeS6N0iJlfo6IX4CIIKAw/W+3zXkSlwAqn/AZMa4uHUfVVZ1+QlTT+i41mME
 iiwKXJSSrtko6n5ItNlpCkzhZC/Z
X-Google-Smtp-Source: AGHT+IHq5GJLA69hWJIqMBI3xX9I2B1vs+oiOQMLHk1Gt8OrfhdtpCShimUSU+G1kzy0p/Cgwakamg==
X-Received: by 2002:a17:902:e750:b0:216:3c36:69a7 with SMTP id
 d9443c01a7336-2166a0987ddmr69103725ad.45.1733849504588; 
 Tue, 10 Dec 2024 08:51:44 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216363a3176sm51054905ad.246.2024.12.10.08.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:51:44 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno
 GPUs), Jason Gunthorpe <jgg@ziepe.ca>,
 Joao Martins <joao.m.martins@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-pm@vger.kernel.org (open list:SUSPEND TO RAM),
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Sean Paul <sean@poorly.run>
Subject: [PATCH v11 0/4] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date: Tue, 10 Dec 2024 08:51:18 -0800
Message-ID: <20241210165127.600817-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
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

v2:  Fix an armv7/32b build error in the last patch
v3:  Incorperate Will Deacon's suggestion to make the interface
     callback based.
v4:  Actually wire up the callback
v5:  Drop the callback approach
v6:  Make walk-data struct pgtable specific and rename
     io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
v8:  Pass pte pointer to callback so it can modify the actual pte
v9:  Fix selftests_running case
v10: Call visit cb for all nodes traversed, leave the decision about
     whether to care about non-leaf nodes to the callback
v11: Adjust logic in 3/4 [smostafa@]

Rob Clark (4):
  iommu/io-pgtable-arm: Make pgtable walker more generic
  iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
  iommu/io-pgtable-arm: Add way to debug pgtable walk
  drm/msm: Extend gpu devcore dumps with pgtbl info

 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  10 ++
 drivers/gpu/drm/msm/msm_gpu.c           |   9 ++
 drivers/gpu/drm/msm/msm_gpu.h           |   8 ++
 drivers/gpu/drm/msm/msm_iommu.c         |  22 ++++
 drivers/gpu/drm/msm/msm_mmu.h           |   3 +-
 drivers/iommu/io-pgtable-arm.c          | 157 +++++++++++++++---------
 include/linux/io-pgtable.h              |  15 +++
 7 files changed, 167 insertions(+), 57 deletions(-)

-- 
2.47.1

