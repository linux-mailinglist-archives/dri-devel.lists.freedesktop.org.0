Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529898CD977
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 19:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC9310F1B8;
	Thu, 23 May 2024 17:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UoafEal3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2B810F1B7;
 Thu, 23 May 2024 17:52:31 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-68185f92bfdso34974a12.0; 
 Thu, 23 May 2024 10:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716486750; x=1717091550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G6bfu+bhhkfLjZgMfcumMPy+A+KJDQ31ZI+nlFrepqo=;
 b=UoafEal3ufLm6PLWHk4TT5E9GafHGSAwJYs5fUbV8q7/jK4IbdMdQzffZpFBquYkpq
 NsKwwkP6XLC52802Rv2NNTCXsY4gZRNE+fQoFuiHjl6Zfa2jU+yI8Ave4DLSD/l7pVp/
 eMzg8SR7fa3YITfWtDGQprk2rCpQijaI7s1ig5jUTC3tN7rhOzt5r8g1AXFC8NlHFjMt
 2zlagXSsuPjvkTYX0Oxie4shoZTK1+wIMMkujWOajpv7VXEbk4qyaq7Q5lLrLzV85S+W
 sAvpjWQ/x5I6sopTGgYZ4Cjlg9TQgT1k3JgefKSKoF35kMPeyNge1USLD9K1Xb1euVCv
 V1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716486750; x=1717091550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G6bfu+bhhkfLjZgMfcumMPy+A+KJDQ31ZI+nlFrepqo=;
 b=p5mzvxJ0jWKG4Qe1zxPgZRlh+tbCB3EoVqpzgud3zcOiAm9dWwpGIxwdJG4qmuePSG
 6hvuSspIPDuL1PTz0hIPWJwr8M8rj8fNn9l5bGS2I074sTGVxY6pbJ0J1a4vTUHv4nj2
 9tMobSfb5qGkoEB6xe/2/t96VLIH+zfoOJ5IJ/6PHSPuQp13mO5L9gR7vRrAroXx34Pu
 JV48P0jjnO0JbRUctNalxwaFXiIt6oRSpkSE8UQ7QOTY3xI0D3H4F4M5ajZim2w1kE+D
 rN3bA4EBUxPxr1f/O1JKZDwRQgiwoXaMyNYiI3CjNBeWw949J+NRgWbtm3rC/GCPonzS
 qDWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqLlu4QGNl0eOcRQYu6fiVbNZH73Dg8smOtlHgGQEVTfsoC4I6uHb3O7/9ylfCZMG6gBcLJwsPmGiC4JUIk0SMGxb8ruE9uonkpV7703CK
X-Gm-Message-State: AOJu0YzRQJ/bpoD13C8hSAVx1w7u/lYtjuBRY/IXMVAcAZE1ZXmFyxSp
 miyIUYwT8mrSW5e6QDzNdJy/16hAh7D1OrEsUqRznDoNfFd18vqSzJZJ7g==
X-Google-Smtp-Source: AGHT+IHvfjzUer2CoBJAM367aQfyuIiKPe9JX5y3lgO0SB5+ywdrrZbwTN4dupnWt0YKqTjVHdV00w==
X-Received: by 2002:a17:90a:1788:b0:2ae:6e16:da91 with SMTP id
 98e67ed59e1d1-2bd9f461d5fmr5924366a91.29.1716486749999; 
 Thu, 23 May 2024 10:52:29 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2bdda058d7asm1825463a91.55.2024.05.23.10.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 10:52:29 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
 Jason Gunthorpe <jgg@ziepe.ca>, Joao Martins <joao.m.martins@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-pm@vger.kernel.org (open list:POWER MANAGEMENT CORE),
 Lu Baolu <baolu.lu@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH v4 0/2] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date: Thu, 23 May 2024 10:52:20 -0700
Message-ID: <20240523175227.117984-1-robdclark@gmail.com>
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
v4: Actually wire up the callback

Rob Clark (2):
  iommu/io-pgtable-arm: Add way to debug pgtable walk
  drm/msm: Extend gpu devcore dumps with pgtbl info

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 +++++
 drivers/gpu/drm/msm/msm_gpu.c           | 22 +++++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++
 drivers/gpu/drm/msm/msm_iommu.c         | 18 +++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  5 ++-
 drivers/iommu/io-pgtable-arm.c          | 51 ++++++++++++++++++++-----
 include/linux/io-pgtable.h              |  4 ++
 7 files changed, 108 insertions(+), 10 deletions(-)

-- 
2.45.1

