Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38918AB7176
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 18:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E88E10E690;
	Wed, 14 May 2025 16:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mSO7sQw7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4308310E68A;
 Wed, 14 May 2025 16:33:42 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b1f7357b5b6so4555593a12.0; 
 Wed, 14 May 2025 09:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747240421; x=1747845221; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xVkxVRdg2M/AIh3AWsgwH9hFnfAOA4U3vxBTP/C0R3M=;
 b=mSO7sQw7hCrVZjtp96VmrzUHVEYS9tr8XED3S2KOlfdljkR1eZi80NzSuQvsSxmV5g
 adUv5lOiE0mGZ4Cl/CrHSVwUcl9Rechhnzr1GKeEli/R6ciikkYdlKcOIRez/u/tFwxJ
 PpDjtyTSghg9/PSfe3A+YSnNsZ4gljGmgs5/n4QE3y5eerIEU8qZVcaBHPbsPodP9MLl
 MxdfaET7OAa31l5OEK6/5sgdE6JicjD7tmr0/eZMUtEoJ41u8uYBHvsnx126kIQRfGn0
 zrjral16AGXcIbeJvK6K7vyzBnVNYtXYcVrVbiiFQdTaaT39ATt7w23HS0kk6EQp2V5t
 YBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747240421; x=1747845221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xVkxVRdg2M/AIh3AWsgwH9hFnfAOA4U3vxBTP/C0R3M=;
 b=FTEpXPWpP4KshZ8XakYSVJpilsrHaBZcc4wUvxBGslpg0ofVmBlObH/obp0YBLYtVW
 Eh1vHPXMv8S1HWsbNPQkDs5bNV0AH2oUps+JWGKYojV5WVMwtFbB7jnTjOSdx8eMbA4h
 3qWDiUL9vWORaWYBU+390EWgWZ1qlG66JwHEkDu2z6Jm1ZE5SdMcNzqg7wAOFD/B43GQ
 UYOt3D4QXu38oQAz9ikKGUEzMnkU6t109KIvDs4Z+oo1pUSi+dX9VCteU7pVveyJMKwu
 GDXpu69MmMoA7/SDA63MAX+2guN9naihtxDse+cynPG17RNvS2kAlP659q41kwdwcxfK
 kvFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP+d7RUSR59JDz3VWh6qewoztAszXw5g49FbMZ6NiRVy/X2xCwnju7ThUSkqTrCsgllV1AwHExjxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTRpZH0JSsWNzZK1fPvzC+70nQpV/IzfL5DgYPRvA3uVUZpPKL
 GCUKVKxTYsGRQ14+kePvgTbj7gTYT+owQGPZ7zBxxCnfBFr4bWdS0D/Vfg==
X-Gm-Gg: ASbGnct5xcdNa9fsnUmMQ/rjnP/Z1xaATU0YMXsbdUc+YjcxPmJy3+U3kKv5prm2DVo
 1DW1UN+bDkd5i+NDtoIeiet2g6WiwRGf3F6VQntETc+ht4QMvveWGX40j5QZDgaaBmiCc62QXSs
 PhPmaA+qMH6cuZ2Vw1UGpbuFiKJpUqTsPvkN6v86RQo6YWBWvzKawNbCUHbciWJ8FosOZnVZ3TU
 kkqRUc7wMV/elfqmx8URVBXvDNmfVLKUD8X2BZ1iCLPhXPEXb7dKqNhdLznxGZIEO6vwPDOcPxP
 jHlWIIF+XhlGvUEwlnSkKeud0vPmtSL72JeA785liCpvNjzc6FBxRu2y/H6u9b5vrJIB28vRQCp
 LDEIIgYvZdv8Obkl8k/F7OJU1Zw==
X-Google-Smtp-Source: AGHT+IHatQ6/wd/syK5i39NkoDdy1R1SzksD0uoYCBe2eTGgXV9Acjls0e/9P3cZzXmWvFE8Ptffeg==
X-Received: by 2002:a17:90b:4acb:b0:2ee:b4bf:2d06 with SMTP id
 98e67ed59e1d1-30e2e6133d8mr5740820a91.19.1747240419803; 
 Wed, 14 May 2025 09:33:39 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e33424d3bsm1759592a91.11.2025.05.14.09.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:33:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 0/2] drm/msm: Fix a couple submit leaks
Date: Wed, 14 May 2025 09:33:31 -0700
Message-ID: <20250514163334.23544-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
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

A couple things I found in the process of debugging VM_BIND, with all
the kernel debug knobs turned on.

Rob Clark (2):
  drm/msm: Fix a fence leak in submit error path
  drm/msm: Fix another leak in the submit error path

 drivers/gpu/drm/msm/msm_gem_submit.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

-- 
2.49.0

