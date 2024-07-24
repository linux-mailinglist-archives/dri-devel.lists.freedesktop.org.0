Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7AC93B0EA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 14:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B4310E6AF;
	Wed, 24 Jul 2024 12:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WWndbcm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D106F10E6A4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 12:25:02 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-7a03ada9660so684227a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 05:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721823902; x=1722428702; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6joYOx0BmGiTZxFoD0gHd6sgxiMC43Zesk3xRX+VQmE=;
 b=WWndbcm9YmQgypL7yuJZjO3vUtQBN/ekA4qwZMtxICTGYwUqnFAV6DilPUzkscSm5p
 zmIpaloDEIgbysVtliC3NdSE+t5uaq4Jr/iW4+eBvef4+C0VDCf5fHRmK14ZQNFqyC2n
 sEfTELsIXH3txr29qyTc8dMqO7CZSufnOAkB8A76bad+F7prJt2KjJ+puIm71EgZjMtf
 CyWmBy8w2fkZ2m10w1253dgcvfC2RD5hEznXOKGZV1ltWXReDTwKydk2YUL8bWGp52Km
 DMxTSNsuEe3aCXiqI0EB/kirFAv7NzYmxwiXXEjrnubAqVrG/LBxYP45Nj+kRfTuXW9P
 fVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721823902; x=1722428702;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6joYOx0BmGiTZxFoD0gHd6sgxiMC43Zesk3xRX+VQmE=;
 b=go5sZZbY+pRT7w/3ilrNprS1UIGLMVwdaUgs+753gW0UpVssrXSofFwD6LXX3OlVsn
 /s7yKWW9mDhcGlfxbSBJ3HG+3gd7cWfXYvX7NKSYEzvRwC5n0PFFZPxtPo1LeFigcd5C
 /OgsTNDeqyXzohr3pS93svUV2WGgZmAGeVksbAgHzxnloreIoga41RQtHsaRheMDH8ug
 HdIFyNDncTpTV/WY6mBPcF1onf3RuN8PK2u70+wqwaJqI1eRys6DuL3cd3KiY9vnpHwO
 yiujYBwatFNV/JrGRc7GaH4oaqzpe0/YzlSkuDV1mkrJ8k8dYr1YApuGuAgAWVDbYblv
 aPtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUALt6gt9Cw1iTG2Nbch9WAqK3pfZbjAMpRFD6BrPtL2xAE5PzkqFd4lVH0+9EmcBi4TvJf0uUj7/cfFwl8zLIG0bNF0uU3BtD9wsAH/o+u
X-Gm-Message-State: AOJu0YyUFySprpXLEPeedlUCZiMA0+CnMSZy3C9XDltrY7Jv99SCLlq7
 a3iOs2i5jAWFPBsLECZsIA35V8ruc9685TlBCPhMbgAoxYMlVimp
X-Google-Smtp-Source: AGHT+IEhv78htgJIo9VcY9TZwJxBejeM8ZwITF+GEbARpUDs7CsIgvsAhhu44kAfmwaD3+tS/G78fA==
X-Received: by 2002:a17:90b:1c03:b0:2c8:87e:c2d9 with SMTP id
 98e67ed59e1d1-2cd2751d7fdmr9586493a91.39.1721823902201; 
 Wed, 24 Jul 2024 05:25:02 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cdb76001d6sm1481454a91.48.2024.07.24.05.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 05:25:01 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 0/2] Allow errors to be silenced in multi functions
Date: Wed, 24 Jul 2024 17:54:45 +0530
Message-ID: <20240724122447.284165-1-tejasvipin76@gmail.com>
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

Multi functions so far always print errors when any function fails. This
may not always be desirable, so a new member of mipi_dsi_multi_context
is introduced to allow errors to be silenced.

The larger implication of this is that all the old non-multi functions
can be replaced entirely by the multi functions without any loss of
functionality once all the panels are changed to use multi functions.

Tejas Vipin (2):
  drm/mipi-dsi: Add quiet member to mipi_dsi_multi_context struct
  drm/mipi-dsi: Change multi functions to use quiet member of
    mipi_dsi_multi_context

 drivers/gpu/drm/drm_mipi_dsi.c | 20 ++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     | 10 ++++++++++
 2 files changed, 30 insertions(+)

-- 
2.45.2

