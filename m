Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFEB8A20DC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 23:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D751910E561;
	Thu, 11 Apr 2024 21:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="C8Sv8dX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC39A10E561
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 21:27:03 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-78d5b1a34fdso16497985a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 14:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712870822; x=1713475622;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DPACrYKrlSJ3aOmv8VH0pMSoG+HEgCapW63w8TCNmhM=;
 b=C8Sv8dX9I1GCK6C8i2aKttlcZ+XkiaDAB9avJMMY7U75T7k6JUSX76vz6+14vYX4KY
 Wgl8URE26sEixBAXYqgEzo6iAEJOxkc3r/bPaItXZRhcMiHSs789y0p5g/X20Jw9Pqci
 MYvd7nMVpni+Ct4rT4W16YR+2bQtbDeqYFrIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712870822; x=1713475622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DPACrYKrlSJ3aOmv8VH0pMSoG+HEgCapW63w8TCNmhM=;
 b=Mtu7gSqphst4HfUL6SfNzvNoaOZIer0I4Mdpt5q9/pY5Zn9l19t47J5YC4WlFZ2yNn
 DPhUjcXoLuSyk6rHfPBKkGflBcbNxL4J4s0J9nx6pNNjs/qP5kZA6AuLRvgA2A/3gjbk
 6/t2n/O2eBgumQt6N+RO0mn55Lauxc236gRut2NYQ1ENjrvY0dwl+wgvEX3EOM2hSMdR
 dKmI5cm0qbXIgXO6/dMTAbyV8P5/XbDz/19DVCTYiL+JwoUgcbHQh01YrxigAflCQLVv
 xHDmksXUq/UFVLKSoZ9yd4R8bL7SpztFLBt0NGKp44SIgBSX+UdOFhwttHSET7jd+Qed
 CPug==
X-Gm-Message-State: AOJu0Yw9daZdaCznheawQM52042ZUQZl5GkgzaU/wJvbGlpEPIj6C9Q/
 zTlww8Q6kIrVtqnnlw5R7Fgh1Q6HW/G35CzA1g58TTO43nI1Hab41cTN4gBsEqYkG21ffBUVAhh
 ldNdy62g9G3IMGpO20v17d62eMoTcujcTVQC6Va+/iNz1qhrmLYQAGsGaqtKoPor40l+vDmJsAI
 M5uuWK/USh59v/mJVyJSflxbPqgFs4QKhs1J6HxXHj4PfOlIxXe5yC
X-Google-Smtp-Source: AGHT+IELofl2Jfx4MqeloYKdntARtxQR6pmr2P4RgiXImg9A2vIDnPxSsur0bqRthCEz4vwUiGVmMg==
X-Received: by 2002:ae9:f112:0:b0:78d:6be3:4c01 with SMTP id
 k18-20020ae9f112000000b0078d6be34c01mr852168qkg.4.1712870822287; 
 Thu, 11 Apr 2024 14:27:02 -0700 (PDT)
Received: from localhost ([173.205.42.30]) by smtp.gmail.com with ESMTPSA id
 c9-20020a05620a200900b0078d7213de13sm1496239qka.136.2024.04.11.14.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 14:27:02 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH 0/4] Fix memory limits for STDU
Date: Thu, 11 Apr 2024 16:26:47 -0500
Message-Id: <20240411212651.540-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

Fixes a bug where modes that are too large for the device are exposed
and set causing a black screen on boot.

Resending as Patchwork did not like my last submission.

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

