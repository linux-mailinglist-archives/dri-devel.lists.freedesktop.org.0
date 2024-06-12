Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2063905739
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 17:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB88010E8A3;
	Wed, 12 Jun 2024 15:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hX6j1Y89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A989510E7B9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:36:50 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1f68834bfdfso50923745ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718199410; x=1718804210; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jalggb5KAXiKiH+TC/KM4w8VMC75sAk2yBUzqDTF5+g=;
 b=hX6j1Y89ZTudD8hhAzhvERn64bhwkGjDBOetsFRqHAkNTuIxcf7P6w+wnfODJ8HTzx
 +SIjmBXumbRCL9imh3mq/zx/5hc3rL+hfQs64PSmQNdyhVe2i4oGYzfkVjUHNQHp/iVf
 4oRWHqRN7jvJ4I+oe3N4bY4G8l876zyevPPNu26yVrAuYZ5g6Wc61/pknQIboijhf+05
 q7DLIEZZrbIfOmMjXK1Vpho4syZNDlfQ27mDUOh4JBvqOr1PORop9XnJEHraCawIfW6A
 xdiwcLf1bA1dOHbs4ty2pjDThKCYL0OP+cMXIM/ajeyHEzT9e1kvU5IVaNS45rPoBa4l
 hrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718199410; x=1718804210;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jalggb5KAXiKiH+TC/KM4w8VMC75sAk2yBUzqDTF5+g=;
 b=SS+xgFZFHZ8rItpVh4ON4rknrj1PSAkzrOdyA2BkBCaYv3HeszFOYIyepaorNiKh0M
 moIs2MpgQZDEE+jFNO6pcUa2EXRu7YfdOXIkqdZjHLIFxZbODT+89GY4CJCBieKpRVXA
 yPqbutcR5Q73Fskz4j2ND/bLfr/3DnYGcHE9DprRRyY7XyW9RIWWYXNh0KcW0/FCOEBh
 kBIrx/6X05FmNzJ77iZ1KrWsBDGUGloaruXkGx+KJRW7L1NA2u/8d30n0TKuV1km8F0N
 8IsSmPnJsJiWu0k8c4QQPhbQs+7MFXEv60h6y31RI07TvLPz8WloJEORCChZoBSHIC1Q
 cGPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc4fqsD0L4p3N630fAm6QtSLDKcHduSIZ2NJXFVT1KV7YaoKWvGJjTebJhiVsw5LM3BgOmhcsGGxVsJe3cU6A33sK4m5s4Wd04Asvgh5dd
X-Gm-Message-State: AOJu0YzO0ZDcyCZuZ1nAyKOGjJ2H56MmR66QasyVjVBn04CjUBr+AQMl
 CpCq2kodE2/cIs1sG4uNBcQsWxBFbJTs/nJBeeONdROwCT+8+Vz7
X-Google-Smtp-Source: AGHT+IGJXOsSf9sVXW5Q5P3oht0VLzqOpHaHDBQ6BtEZVDQwNdrvibraCh4yXrfl2vD1iK5zCr/CIg==
X-Received: by 2002:a17:902:ce92:b0:1f6:612b:96eb with SMTP id
 d9443c01a7336-1f83b7ae9d7mr23032955ad.50.1718199409822; 
 Wed, 12 Jun 2024 06:36:49 -0700 (PDT)
Received: from distilledx.localdomain ([103.246.195.195])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f845e0ca86sm7291815ad.0.2024.06.12.06.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 06:36:49 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com
Cc: Tejas Vipin <tejasvipin76@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, linus.walleij@linaro.org, dmitry.baryshkov@linaro.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] fix handling of incorrect arguments by mipi_dsi_msleep
Date: Wed, 12 Jun 2024 19:05:41 +0530
Message-ID: <20240612133550.473279-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Jun 2024 15:43:14 +0000
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

mipi_dsi_msleep is currently defined such that it treats ctx as an
argument passed by value. In the case of ctx being passed by
reference, it doesn't raise an error, but instead evaluates the
resulting expression in an undesired manner. Since the majority of the
usage of this function passes ctx by reference (similar to
other functions), mipi_dsi_msleep can be modified to treat ctx as a
pointer and do it correctly, and the other calls to this macro can be
adjusted accordingly.

Tejas Vipin (2):
  drm/panel : himax-hx83102: fix incorrect argument to mipi_dsi_msleep
  drm/mipi-dsi: fix handling of ctx in mipi_dsi_msleep

 drivers/gpu/drm/panel/panel-himax-hx83102.c | 6 +++---
 include/drm/drm_mipi_dsi.h                  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.45.2

