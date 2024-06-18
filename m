Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C990D990
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 18:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0547F10E727;
	Tue, 18 Jun 2024 16:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LhIExLFm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B9C10E726;
 Tue, 18 Jun 2024 16:43:07 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-70627716174so339273b3a.3; 
 Tue, 18 Jun 2024 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718728986; x=1719333786; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XvXhSojD9nxkcyZeCeKyHAlvRSq1UhDBytHKg5xTnCM=;
 b=LhIExLFmnoKHh0W2kqyyEaUP7W3WQpwoYsYMaEYBhePWR4utkNQi3YKfSfxpxmLyQV
 MBwvjiPPF5VS9LsRO70fM0pInFIDrrKjae7XxR06fgah8N1IGBl0edx1KQKBsXuARXGU
 L5XpeZL9S3SrXutsaka7fz/IUXdoh7yMuaMcX+Q+WceT/Z9CyCB3AQ88cFsCQWgeQ2MM
 ykWzoNa1TyBhZdsk36QQm18hLz9gFQ4c9XZjIlzHV45/8OFFg6ETWxIh99RkmFY8al61
 I/qBXHX9LHXTEn8P8uPtTXbPYE75c6VDAa/merXuv8KMnL7xxt+MSnQcQKylRczfI+Qx
 AuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718728986; x=1719333786;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XvXhSojD9nxkcyZeCeKyHAlvRSq1UhDBytHKg5xTnCM=;
 b=dKD7jOv34MPMXHcazuN1jUTmKsOAbKunqhLb5vW8sg9mqZi/G4Sxf+mf+Vr5tqWrpA
 8smBpgnZGXMR1sS4bRdeoWeOYww0RkI4ZDW/6URt5tH5YF2xRPtLCUWpOmS0WZp2LwjP
 HW49syz+JJEtoEYAl/+9VypIlV29+oHGr70nVZTb5LRKHSueov5WP2pDQQAY6RGltjvB
 fE+k9xYi3xcy9bo4gIxB/70GV55djpjLVuJze6nCPygmARGNcyd618VfoQmvKU68HplF
 bOvKNs7Cnv+djYODVE+CnnNF2XAjscAsuyYKUvKpV1v6LagLhiaTE6Sf6zrCWqr41cIS
 Bc8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV76dW7kq9RQADNgc7qi/+/eE7NKQlFDREzfABd3c5IzH4VJ0p/kOJfJzcHG5IdZFHzpe275sRtfmNI1exEbb6vJiySxyzBpUjR61TbXpdp
X-Gm-Message-State: AOJu0YyR7ap39qzG8Q/TSEh29vX0xSfHjpBszsNcFszBycpyUZLFgViR
 5AjwK3jSl2EpS/bxIUTTduIUWKKjupoy0RcAJhA8ZD2eEOXwV25G98VUDQ==
X-Google-Smtp-Source: AGHT+IFbMiwhc/wRKW0CBE3zZpglm8jK3Q2B1o7O/xsHqHyLxf+YslV9ODcnMWNxYAhfhPJtzS+xpg==
X-Received: by 2002:a05:6a20:3c92:b0:1bc:af91:55a2 with SMTP id
 adf61e73a8af0-1bcbb5b5e8cmr72098637.36.1718728986112; 
 Tue, 18 Jun 2024 09:43:06 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9a0f736a0sm9417625ad.119.2024.06.18.09.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 09:43:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-kernel@vger.kernel.org (open list),
 linux-pm@vger.kernel.org (open list:SUSPEND TO RAM),
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH v4 0/5] drm/msm/adreno: Introduce/rework device hw catalog
Date: Tue, 18 Jun 2024 09:42:46 -0700
Message-ID: <20240618164303.66615-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Split the single flat gpulist table into per-gen tables that exist in
their own per-gen files, and start moving more info into the device
table.  This at least gets all the big tables of register settings out
of the heart of the a6xx_gpu code.  Probably more could be moved, to
remove at least some of the per-gen if/else ladders, but this seemed
like a reasonably good start.

v2: Drop sentinel table entries
v3: Fix typo
v4: More const, fix missing a702 protect regs

Rob Clark (5):
  drm/msm/adreno: Split up giant device table
  drm/msm/adreno: Split catalog into separate files
  drm/msm/adreno: Move hwcg regs to a6xx hw catalog
  drm/msm/adreno: Move hwcg table into a6xx specific info
  drm/msm/adreno: Move CP_PROTECT settings to hw catalog

 drivers/gpu/drm/msm/Makefile               |    5 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |   52 +
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |   81 ++
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |   50 +
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c  |  148 +++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 1240 ++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  880 +-------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   11 +
 drivers/gpu/drm/msm/adreno/adreno_device.c |  624 +---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   32 +-
 10 files changed, 1649 insertions(+), 1474 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/adreno/a2xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a3xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a4xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a5xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a6xx_catalog.c

-- 
2.45.2

