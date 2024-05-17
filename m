Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411CF8C8C54
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 20:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F5510E338;
	Fri, 17 May 2024 18:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="bA24EgmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2240310E338
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 18:48:32 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-69b730fc89bso4904136d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 11:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715971710; x=1716576510;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RHJi6vHZhlinh2jLFRXNNxKNaAlEx2EEWv3D1gLiq0E=;
 b=bA24EgmBnV/lMI7gL7EBOm0vE2p3WqGYw+N5WTfUQPq3FDe6u3TTIhFd40/cpVC4s3
 YmNadibCGQGRq4O8/S0b4jhCB2WoBYBAJt9iLm25w0BTDdhulNDiSKtHh3Ca8KLYuxQL
 UmeRS6qLQO/MghCcIWE3SNuCS3qRb76dJWBT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715971710; x=1716576510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RHJi6vHZhlinh2jLFRXNNxKNaAlEx2EEWv3D1gLiq0E=;
 b=b5DVu1ojTaZZpsgtVj7B+r4uUu+9gRaiIs8nEEAqCGOhLcPdiDiuhS8CIabK0Jdo7Q
 6OvF6b0+qiywNUezIXPMzxebrAC/szF4RCcwna0/a4vwcB7aYGstBgrcIVVgtr1dwblK
 /1hLomn7ypx/XkeDDnOSsqUsag4+n7zPuhg2UHpLZGotT13G8qxQ7bep1O3Px5Ou7neO
 YSS3xT7IkwOJrrYhKerSW4LkpOx/PiPNxDwQwh045PwYHltOKgbB8w68z6MKvVw1qNnD
 cdzABhkCT6h0HV76NlvxeP7Nt7dkYXvtygmBz1i6AtbKiJuOVxt8Peu6jOGOT5MsoTao
 kmdQ==
X-Gm-Message-State: AOJu0YzUPr2lYXsWySfKnI/Mavp+K70oW8W+tKaSgLC0etkJUVq96nXf
 0o74qeURUzIfr4WBTBMa56cwv/02qMBUMVeCwLXODKx8I8jgfsmoxu9Ys6X4Mcqi9Tma+32kN+g
 IN+tNeSKXy6/TzdqQ0FPxpDpVWENId1+1CFG80GhxdFnIInYOBRq1DF5N/NWas82oyXUlQUHHN7
 ePcXolrUffutliuVyAMbWrTNlIskhvqwYnmTmM+fVbb/y2/e9gqg==
X-Google-Smtp-Source: AGHT+IHTN8hgyJLOGT71baKPyJUEJb7P6pnrkrnmKYO9Z45FUqkQ+InsJ8cZUDUkY9W5WgRp8oJfJg==
X-Received: by 2002:a05:6214:319e:b0:6a3:5bb8:12dd with SMTP id
 6a1803df08f44-6a35bb83836mr93068546d6.56.1715971710476; 
 Fri, 17 May 2024 11:48:30 -0700 (PDT)
Received: from localhost ([192.19.144.250]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f179649sm88400046d6.16.2024.05.17.11.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 11:48:28 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 0/4] Fix memory limits for STDU
Date: Fri, 17 May 2024 13:48:07 -0500
Message-Id: <20240517184811.25807-1-ian.forbes@broadcom.com>
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

v2: Fixed llvmpipe over-alignment bug.

Ian Forbes (4):
  drm/vmwgfx: Filter modes which exceed graphics memory
  drm/vmwgfx: 3D disabled should not effect STDU memory limits
  drm/vmwgfx: Remove STDU logic from generic mode_valid function
  drm/vmwgfx: Standardize use of kibibytes when logging

 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 19 +++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |  3 --
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 26 ++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          | 43 ++++++++++++++++++-
 5 files changed, 58 insertions(+), 37 deletions(-)

-- 
2.34.1

