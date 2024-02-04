Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC72849554
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 09:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E08410E506;
	Mon,  5 Feb 2024 08:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dpoE2CIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D9110E1F7
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 14:54:12 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-5d4d15ec7c5so3318631a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Feb 2024 06:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707058452; x=1707663252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n3whH72L6JbdpRMThqcQPd4/z6Z10Hs1Q/PHuiiBNDc=;
 b=dpoE2CIN6BKZ9aLDg3oQ/9wXjj8//tJVXXTJipB18bnrxACQkzpXZLsV98bTJ55W9f
 fTs6+oeEb4f7mdPQi9LLNQtu2X1S3QJxNxCnGxfYCbPfVIEb/ZtG2PhPkhD/0CuSW0Zm
 3OATyH8RMHlxOF+vuL3R3rO8oxLjwegbd2og3xpADvh1+x14MVXjUMYqL+4UiVUlQgZi
 cVFqAh3QNdH+pgNpbHDeAxkBmFBqSa2sHv5/wECzLCUwzICob38Kq0GCOFX1xe74R2Gi
 b1sK+xjWQl3aJllToOfZMcv3CjyZNfqp6uIYNmOaPe8KL7OFVPyLWcifwzZS8k4voqOR
 /2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707058452; x=1707663252;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n3whH72L6JbdpRMThqcQPd4/z6Z10Hs1Q/PHuiiBNDc=;
 b=FGRMoKREmvOkXyt+8/tWcrujz0dJ8gkSAb4nW6+4/ZzBeEwYGNsn8Lw3S5Qm077SRz
 w9fXziHEndOZQUGTVXGlzjzP/dpwB82539XJnpuld7todm/mE7uHZVZXRB+GoJ1+5zt1
 Pr2oM+axuNxdq6c8Cc8jVhkwDJ59kN1ZV+Otd9bSHNwgwZAkj4LsZfm51wqA/D+sjDLK
 WE9YfFf5hV4L28+Ygyy4f8MMrn4UftN0CYSUZGi2EIYEBol88q8KenFT6tskk2UJWydA
 4wXbgTtnVDMUhgk6iEn5xoDMcalDAo7f9oMfducHFQoaH5DxGnN8mtpjuc6lkICCZItP
 IxmQ==
X-Gm-Message-State: AOJu0YxTKwKgNFSKvE0tf790+pX9cTk/okc+ooCPMzCEBhPG5N+Pxp8Z
 cjwZKzKUnM4LZGiBlxfmFzuKOfH3ttWEtHpvSjdzK+EMXOduu1df
X-Google-Smtp-Source: AGHT+IFKIQr25L6upTbF8DkN0oy7iPsUjkCU30eKPdE7KclI3lrjTImtO2y4SXNynkzRWEBAMcvVhQ==
X-Received: by 2002:a05:6a21:7894:b0:19c:90fc:f0d3 with SMTP id
 bf20-20020a056a21789400b0019c90fcf0d3mr17292149pzc.46.1707058452169; 
 Sun, 04 Feb 2024 06:54:12 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWLgqaoTUsz8EFM/UWYR3wQRQToleUGy8Ejzwo/789riZZr+R3Rshzv2kutEzaRCTuN3XfGdXrZD2B8scfYl/n/ALi5iP/2FdAlDxHj82y2r+55fXKl91xQU3Yiu4Ob84gzeuluSNaK60AGRZbt/i2qlhWhpne/wbubqe4JhngqEQBb43RiMrFDbWt9IYXvjtPOF+5l0yx0V/BsWaS6DZ7Db4a427vyVOGGrQxMrRYvaAXcfXBr5hSzIPg=
Received: from localhost ([103.139.191.218])
 by smtp.gmail.com with UTF8SMTPSA id
 lw10-20020a056a00750a00b006de11c980e5sm4864257pfb.80.2024.02.04.06.54.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Feb 2024 06:54:11 -0800 (PST)
From: Kartik Agarwala <agarwala.kartik@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Kartik Agarwala <agarwala.kartik@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: fix kernel-doc warning in drm_vram_mm
Date: Sun,  4 Feb 2024 20:23:48 +0530
Message-Id: <20240204145348.56924-1-agarwala.kartik@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Feb 2024 08:26:04 +0000
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

Fix kernel-doc warning in drm_vram_mm struct generated due to 
obselete field.

Signed-off-by: Kartik Agarwala <agarwala.kartik@gmail.com>
---
 include/drm/drm_gem_vram_helper.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index e18429f09..c89c9bafe 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -170,7 +170,6 @@ void drm_gem_vram_simple_display_pipe_cleanup_fb(
  * @vram_base:	Base address of the managed video memory
  * @vram_size:	Size of the managed video memory in bytes
  * @bdev:	The TTM BO device.
- * @funcs:	TTM BO functions
  *
  * The fields &struct drm_vram_mm.vram_base and
  * &struct drm_vram_mm.vrm_size are managed by VRAM MM, but are
-- 
2.34.1

