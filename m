Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E410E9550EA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 20:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAF810E81D;
	Fri, 16 Aug 2024 18:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Ep1yTZVK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238F410E81D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 18:33:36 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6b78c980981so11588646d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 11:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723833216; x=1724438016;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jj2Hi4rK8eMgm/Yi9gqpbHzqEwzWK6A8Mz5DUGZq3HY=;
 b=Ep1yTZVKHN/QDiDDzg1JZu3olCBNZkNgojPTR4/W+VKrIRN1JjIHB3bzrrrpSx7QFF
 xSVvYT8PksSGERRkxEtLl+007nmXr2XvEfTzMtlpHlzRklXoMp+ttzi95rarIGsQsW0S
 IXV30defIrpNAzd+CF4kAP9YhXP1yOAuIkyng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723833216; x=1724438016;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jj2Hi4rK8eMgm/Yi9gqpbHzqEwzWK6A8Mz5DUGZq3HY=;
 b=nMOlRBc5GlBOtZ1d64FqQYjiWmYGSbPTiy9Ufx5G/eKIw898hIZM72Vrdll+Ff6wpd
 68SJfyDBxX/zuJb90d79X0tw8zSjCESJOTY0D6F6SjzsiT7WbFfybMNbOWOx1BIODCyt
 EKZ4Xk/GlffQ+F+uNOaceFwdBkHvxPQ9QEDqpgcNs+qqscStBNOaXf3XBne1A4KU7eb8
 8IdxQG5G45dwgRcfy2Boi96nL3iP4XpBfv8cBa81r6PXf0QhMfv1ooeoc1/ay2ERc5Aj
 Ep0BCUvFXI+QneR/uzgW2KqtsvzJRPM9fjiHDbu2ITLT20X8bBPAFt0aa/keEqucK3sJ
 01rQ==
X-Gm-Message-State: AOJu0YwDKVB2J1J5PApaFHqR1Qhe/xOEFIAKSQrbLpXf8BuRy2mzye5C
 vQtS+K9OUfA+CWEEnf0Gksb9Y4jC7ZP5lfES+tpHtf7WZpOasQ8rD0mp5O70xxwEVuNRFCFhHWB
 gWZd5m88346AvneIqpsuN0TWXuaNlpAm8UHFqjrUZgNt9a2a36UCy3vAZ7HZ1+uSN6HQ3afc1hX
 IZSrGVLtdaXPFIQUuh6pmuKKsloaolA6X0O9XRWv41ClNJbzS4og==
X-Google-Smtp-Source: AGHT+IF5qZsnUMkEQJ9dvkXAGbwft03oQFa4kTZNi69qno5zgR9ztFHBJWjJ/Z32IDa4WMCBy97HuA==
X-Received: by 2002:a05:6214:5883:b0:6bf:4fc2:b9ad with SMTP id
 6a1803df08f44-6bf7ceff7eemr32616066d6.50.1723833215540; 
 Fri, 16 Aug 2024 11:33:35 -0700 (PDT)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bf6fe26c71sm20164106d6.61.2024.08.16.11.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 11:33:35 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH 0/3] Various prime/dumb buffer fixes
Date: Fri, 16 Aug 2024 14:32:04 -0400
Message-ID: <20240816183332.31961-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
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

This is the same series I've sent out earlier but with one extra patch,
that fixes the dumb buffer coherency on low mem systems.

The second patch has also been updated to not use math functions.

Zack Rusin (3):
  drm/vmwgfx: Prevent unmapping active read buffers
  drm/vmwgfx: Fix prime with external buffers
  drm/vmwgfx: Disable coherent dumb buffers without 3d

 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c    | 114 +++++++++++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      |  13 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h      |   3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c    |  12 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |   6 +-
 6 files changed, 136 insertions(+), 16 deletions(-)

-- 
2.43.0

