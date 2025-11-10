Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0CAC49A4D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 23:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA32910E0FB;
	Mon, 10 Nov 2025 22:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b="ETvnV6Wt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22BF10E414
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 15:48:31 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-782e93932ffso2631220b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 07:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1762789711; x=1763394511;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RxG8U113OCt23H5vQ5qb7boZb0Fnj6MtbM9jk8M6/fE=;
 b=ETvnV6WtAlbBs6iYvwU8QmxWWWnBtjX56cHOYMqsF7j+jL2rLJzg5TKiGIJ6JEsw8G
 JfHudGcIxPZ7OXeIy/d2j6HhcqxWS9hQjTpx/QwmfwxJ2YOPNhFyy5U8l8QFoFpCClYC
 qDTmJonG7XMHVvPw7onigvwXO1wiF6FsQWF8Yqwe07l/q9RtrcyrkEVfuEGFB9quOFhV
 LrUQcLv0578uHkOluO/+xasUksqFI3Ttpy1GzRWNdnrz197ijgyr+UjQsjpTyJ+EYuDy
 8OwLKFibt3NY98IXWxjtAu9dpU8g95H4N8yPAjTPGYzDAdWLE/fehAMI4RT/djWuC0oH
 TtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762789711; x=1763394511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RxG8U113OCt23H5vQ5qb7boZb0Fnj6MtbM9jk8M6/fE=;
 b=Q6bZF/oXiqAb0HUSvKCh9TgrgMRyX1FD8EQGABaUulxMsCGWfE2p+0Aecn+9cO0mtY
 YOLWxUx7LxkE+mXeSpl+KLATEXjZ6zCRO2IF/1SYi15/y0j0v0sij5oMAAkkAc8PZL0l
 7yEfiDAMSfBrs7K4dd5pNahas07wI1NuUJGpCBxk2amd/mbDny1C0tyKoimuwYBdbwK/
 TEs5pLRGZUBSd22XtoGWiYAJIHRtx/CzB9+2GfWAqIRp7mVBb26zwlMN9EUX3Rm5cGCg
 hSqMjG1Vk1chgSrF3f4Ci49efFdq2KU9ZNPdqoJKx1VNiAHJ2zXkFhE8Ct2F2STXaOE7
 E9NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/RA2+Y+vp9Jl2vYNwztr897WOaWBCazSi8R+Q21YMK2s8vT9tKFc6qadaLudvl2lluZlPgayfYk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxecV/Hy4bbtY4L5+XZgxUHEx7CttVWmmeKZyjJWPIIunGe/2ma
 c0igxIpAE97ePPT2FemrANOcoBKlNbkALQB8b+tkMwCROX00q7fpEqS3/fHTi6JFC1k=
X-Gm-Gg: ASbGncsNvH9eaauMu3Wot2Pk9lmbvbcUa7nxmD5MC8ewMhtMdR0m42jjB82aoGAd1Ww
 6fvQWpR/OdsnQX2T1bWz+xKwQrrAHmHFd9Wuk8l8Z3EIaVVMvmTBLj5DXtwksGSw29Gdv+5azbt
 Dn/EyMmATdX9/55B9oEArsKDPYV70gPCIj4hLiSQsEuE0486ymt7vp0ltGKS+5gw4FIIv78vRg8
 lxL2WqfDrUFIWSIFe6HDOflxNtXx73I3mEa67836TNGHL/BleCjl7EdN7wU95OxRDFO7Rfbz0kS
 1KFZZNlwLaC5fFI2KFopPr22YNBMggqwM1FXd9o/dTDN6Iy2SrOJeg7N04HHRc8o4vCBAcf+NT4
 DltGFH5TJk2jyRJYqEDdIlNRt8iH2lP6Rtl7mklKLNFgLF6WJugIr5/2+u5OdnRq8CIEEPUNAI4
 07g3lXJs2+dbxC/Q==
X-Google-Smtp-Source: AGHT+IGX0/sQPJZ9IFWURUjUR6+qkfpN6BmZpg4nLetcbOD7FksfDUtQyFd6hLj0vw2F7Br4vT6eeg==
X-Received: by 2002:a05:6a00:2e25:b0:7ab:78be:3212 with SMTP id
 d2e1a72fcca58-7b2266a90abmr10078556b3a.19.1762789710801; 
 Mon, 10 Nov 2025 07:48:30 -0800 (PST)
Received: from localhost.localdomain ([49.37.219.248])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7b0ccc59de7sm12151593b3a.65.2025.11.10.07.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 07:48:30 -0800 (PST)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: zack.rusin@broadcom.com
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
 bcm-kernel-feedback-list@broadcom.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Fix potential memory leak in vmw_fifo_create()
Date: Mon, 10 Nov 2025 21:18:09 +0530
Message-ID: <20251110154812.85766-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Nov 2025 22:46:48 +0000
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

The memory allocated for fifo and fifo->static_buffer is not freed on
one of the error paths. Fix that by freeing them.

Fixes: c451af78f301 ("drm/vmwgfx: Fail to initialize on broken configs")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Found using static analysis.

 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
index 8fe02131a6c4..a9fbdfd3a718 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
@@ -150,6 +150,8 @@ struct vmw_fifo_state *vmw_fifo_create(struct vmw_private *dev_priv)
 	if (unlikely(min >= max)) {
 		drm_warn(&dev_priv->drm,
 			 "FIFO memory is not usable. Driver failed to initialize.");
+		vfree(fifo->static_buffer);
+		kfree(fifo);
 		return ERR_PTR(-ENXIO);
 	}
 
-- 
2.43.0

