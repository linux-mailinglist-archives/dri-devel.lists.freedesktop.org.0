Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D13E9CFF63
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 15:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112EE10E1D8;
	Sat, 16 Nov 2024 14:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cB/HdMjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D9B10E1D6;
 Sat, 16 Nov 2024 14:53:36 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6cbd12cfd7aso5067036d6.1; 
 Sat, 16 Nov 2024 06:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731768815; x=1732373615; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y5w18TC/XqToiPnKHIqS08fMoPWyZsrQKnC8ktE2ifE=;
 b=cB/HdMjX5f5nCai9Aju+lZyDO7m1oIBn8GB+JJBZ4SJd1pLJwP4B2o+KUb7KLZRy86
 BWSTSbg2wWUM8QaleoWceSbtIqhDyyEgHxtMiLrPYzBPTD1Nwpc+fqeFMwRlpUm1/Lu+
 b/T2cOMsIpCt3Xj8adpCV6V/F8UiwOn6A0Ht3GXrmf8/d+IEsFV0XNbVL7wdhtq6Sg16
 JZwc0OhwPvR8zo8kyxqM9MBzve/MfhA20wG5jYr1uYYlubX2OK3nO1tRKwF/794LmxX4
 fCZrZknupWFLJ79vxHOJX+aLDU8xP2koJo/FpMpIO77rrqEfzNTRmWlX3qd01TF+qbNT
 Q28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731768815; x=1732373615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y5w18TC/XqToiPnKHIqS08fMoPWyZsrQKnC8ktE2ifE=;
 b=AJmhxrpjLm/LPrc6uctw+jl8++g2hz+xlVqPs9z+SN/hf2ZOD2aQxw2zZnZWRBJ1bT
 nmHoRiMuH9588pEE4aDcL0edxvfzb7mCb4cQiNGxkJq4S8c0tquBkgBqAEbyiugVyEpX
 bCulpNp+QYi1WdbLCZ6bjFQGqOegwwR7YdC0iLAyvMxAXYas/bSjYLeYCoqNVkojj7G8
 2bHTdt87BJkYOAuDv1gzhJ07ifgTT0mEMg6u+n/YqKG01fuqx6bgbJtqfQTd9nfMc8y+
 jECTUhPHmFasJtmf0LSXvuf8P24r4IPpfNEqd+zA6LihwM/DCA4AjrMYIeg7Bt+Ofohs
 a29A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUcIWMpz+kri5/fXTum/GGyo6A8JwFgFpNppY6rEoqFqO0f5WCXzDf5Ff31Gih/59pbN1QayA74PI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhTWqVUt0hEloCaWw3hvqUvwBtEEHo5kcO1QNmmav4UTUPVlZB
 gQofJ6eA8TBIbqY5YgC91sEggdLg9rEKNMNYWvkzXCFnb1oXvtlKdwv0uTYC
X-Google-Smtp-Source: AGHT+IFbNjlBN8vxDnwTU+NgGqojA9343CAYRNPR2iP4IKd9IZFcIm/xVlgaPm6E1VpDmjmwNehvlQ==
X-Received: by 2002:a05:620a:25c6:b0:7a9:a3a3:2917 with SMTP id
 af79cd13be357-7b3622bca02mr372224085a.7.1731768814834; 
 Sat, 16 Nov 2024 06:53:34 -0800 (PST)
Received: from tr4.amd.com (mkmvpn.amd.com. [165.204.54.211])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b35c99c6easm266083885a.31.2024.11.16.06.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Nov 2024 06:53:33 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.12
Date: Sat, 16 Nov 2024 09:53:20 -0500
Message-ID: <20241116145320.2507156-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.0
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

Hi Dave, Simona,

One last minute patch to fix a regression.

The following changes since commit 7013a8268d311fded6c7a6528fc1de82668e75f6:

  drm/amd: Fix initialization mistake for NBIO 7.7.0 (2024-11-12 17:37:39 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.12-2024-11-16

for you to fetch changes up to 44f392fbf628a7ff2d8bb8e83ca1851261f81a6f:

  Revert "drm/amd/pm: correct the workload setting" (2024-11-16 09:41:11 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.12-2024-11-16:

amdgpu:
- Revert a swsmu patch to fix a regression

----------------------------------------------------------------
Alex Deucher (1):
      Revert "drm/amd/pm: correct the workload setting"

 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 49 +++++++---------------
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  5 ++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  5 +--
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  5 +--
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 20 +++------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  5 +--
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  9 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  8 ----
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  2 -
 12 files changed, 36 insertions(+), 84 deletions(-)
