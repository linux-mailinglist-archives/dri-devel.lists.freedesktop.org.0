Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E4989E452
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 22:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091BB112F32;
	Tue,  9 Apr 2024 20:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="MrSmirbW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B5D112F32
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 20:25:45 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7d03a6a11a2so272714039f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 13:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712694344; x=1713299144;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sBJiED0TyH4RQk18xi+RG5P3LrKHVX44W8sTVR9okKc=;
 b=MrSmirbW0fGbdnO9T6yo0TCVOtNDBWLcMjqIAOtaSCu7PQed/SzPuZn2oZ8u9jZoqW
 SGlTwMeoyazL3NgS0KfdlnTEclJSy6qXLHUvuL/qREsGtA24nR4vLi8X0FdyssHK/agm
 3yw57dWpDK/Tyakrf8Yryo0E1QpCUPPCxz2ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712694344; x=1713299144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sBJiED0TyH4RQk18xi+RG5P3LrKHVX44W8sTVR9okKc=;
 b=Ek53U3onG8qaDC1+w2ylKOqARBoDws5rUgWdd5IhptAmKd4M7/5OOeqlrHWi70iA29
 PMzxAqRI0NcTKnczcz7JDGS1cRa655jhQlDRalx684WwiO9r8GmAcFwz2nGrDwrIss8R
 GBStKlH9FGKCkbezdcQc9yqYiAsDfnxr6Obw8mYtE0/Z47MP/bue9s37YuPgnwA/Up2P
 Gu+VDvJI5GthMN5yfJE8CZm6wQyp03C5yKbDuX2D/70QtSUwsFUC/E0NwoDbS9j6NDrF
 FdyEgA+GxVt8Dm+rXeimpbRtAQqHDkdxOApNuMsMSNNJjjoj+bp/QiPOUYpscjWcEYd0
 mDrQ==
X-Gm-Message-State: AOJu0YwNV3nIN0KZqmiCadOIBasP2qMKt+22k6d+WojkM0pIXpEX9x2R
 hANADkr9llZCJyUoPKS0OXRX0hX6pfDX1ypUlJvah2lEB6nKw8U5dDMTlSq14InWXsilbrOKoRA
 MQq06d9aEcn4Qfw+Qj4RoD1tpk76gpBl7fWZX3MDw1Yvp/KtwSlfwudHJH+wWBKP8bqVNN8R93J
 5jp4KlTJtnZpxfmF9GKaRptBsuRjQ99qOacYcbjObFYU1UT5rbE/uV
X-Google-Smtp-Source: AGHT+IEDGG0D4I7B5IUcym90bLh5GJB5vmqKhZFjci+VUaWMWjuzPiZq7sCzcSTdNxgSyD/MdmsKlA==
X-Received: by 2002:a6b:7a44:0:b0:7d5:dc67:156c with SMTP id
 k4-20020a6b7a44000000b007d5dc67156cmr925849iop.13.1712694344186; 
 Tue, 09 Apr 2024 13:25:44 -0700 (PDT)
Received: from localhost ([173.205.42.30]) by smtp.gmail.com with ESMTPSA id
 j4-20020a05663822c400b0047ad636c705sm3428070jat.73.2024.04.09.13.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 13:25:43 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 0/4] Fix memory limits for STDU
Date: Sat,  6 Apr 2024 04:11:15 -0500
Message-Id: <20240406091119.26567-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240401195645.31081-1-ian.forbes@broadcom.com>
References: <20240401195645.31081-1-ian.forbes@broadcom.com>
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

v2:
 - Fix bug when not using 3D
 - Remove STDU code from generic code path
 - Always use KiB when logging kibibytes

Ian Forbes (4):
  drm/vmwgfx: Filter modes which exceed graphics memory
  drm/vmwgfx: 3D disabled should not effect STDU memory limits
  drm/vmwgfx: Remove STDU logic from generic mode_valid function
  drm/vmwgfx: Standardize use of kibibytes when logging

 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 19 ++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |  3 --
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  4 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 26 ++++++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          | 32 ++++++++++++++++++-
 5 files changed, 48 insertions(+), 36 deletions(-)

-- 
2.34.1

