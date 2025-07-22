Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2284B0E552
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 23:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEAE10E70F;
	Tue, 22 Jul 2025 21:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HtX43Sk5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C3510E274;
 Tue, 22 Jul 2025 21:17:45 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7e32c21ca52so23946685a.0; 
 Tue, 22 Jul 2025 14:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753219064; x=1753823864; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Cexht8Ep7iJV5NQmaqpXtQhmXD0krdDQCxLXZ5pJ04=;
 b=HtX43Sk5q73EZDiQrLGcE9c3QROTwRHX7jBhhIzRiLkhi8TJlZ+YwEU3GE/O5b80tl
 PXMzdMZTVF+IrF4PVoi6JmJ57Wli2DSABt21W1E/egWJGYto+JXoDSnOeXH+j/y0fDLj
 4hSfzLlBfMPq1ZZrBPaeBKDxq5TZjJeRzU7M4zf1fmperFTbxDOPDyu97tKlNeTJTvCF
 xx/Ido3HPSEhR7H/EDqyOsr/5GuGP6QWu3TCJSmWKEw2DaWck/jkJzaBpPiaU8lCti8L
 pormhX2t0XsfgUrh9bIZ3Mpjg7ByoKuEk5XcSodjqwSS6zLZpun11FL1bm/PwJihnuIQ
 t8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753219064; x=1753823864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Cexht8Ep7iJV5NQmaqpXtQhmXD0krdDQCxLXZ5pJ04=;
 b=i1i/oeAy6B75r8NbvXp5bI/jiH/2Ku7Kfqp74whmc8Bu03ecXwd865JPgN/kFCw/mh
 RBptd/SpxMPXisl7UdyqcNvjCqmaIFFpwqjjur+Pg+BusvQaUa9xMRYsMSwIXWRMD7Ye
 CiTRlNdYL0JttrDNosmy+xIXGPsXazivj3b29NGlQmABUIDHil1kOJGt8QXmmIDaBMcq
 P2N3cOXuIslc9+2i32PkseyOZjDseLa2oRLaXMbnGfrkIUwK59D11cryRzgeKVDwEqfd
 x6aKxCSUPeorEcxumOLrhDrQWsZTJsoe9mn+MwvR7rtj8S6/6QTJgkIIPpjfC6QFJ397
 RZow==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6ujotziqcoQR+ODLhVr2hfcs36ru95Lj+xBUubHrhUGwGsHN2dxJcoIdAslzUMd5Pc04OCjB0BSOm@lists.freedesktop.org,
 AJvYcCXw6sdjwf9mBHtbnWCllL+R2GfKrsYZmDOgaVeNBkLcOEwg19J09oZnvEMV11r9590y/lfqZRYYWWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFhY1vMfhrtHHvz1TzOAUHGbQYOC5AjkVqxvv8S+Z9MsPwfD3j
 yvfC+LGgPa7X//Jjr0YrCckz9pPEzPzOuKPPFcbUp3NlQHMGJRkSE4M=
X-Gm-Gg: ASbGncuNKJIrf5m8MeH1Yw5/LA2kGoreQjtGhhBldv7CziXb+PgV3iPUmpNvx03qISP
 Q8UBYB8bvRithL/+EQwi2eiKLnKJs8SebYdDnbqm7KLn/C509hXVuG5OY1f2/XrOe6nMZKe7UP7
 XG0/HUsSOlMb58vySan75UEuOCpM3WB6Dj1nyrj+5pRm91y6uPhPxtJr8EW4a6NH1TodVMG5DoF
 g23Rpdxw9nc5Lmk8CJ956t2R6uyS2mwT9o/bIxbnHS1bJy3mh0qD+PKyvAyu2+omlG0LwgoZQKK
 4T5w2BipB5Y4QCpCrlGaoqyoATgGl4HZ1ilqd5irGAA/yiP8etSsxu8U2L428WmpJ2qfx8HiSv4
 AiySKYsjC3wEhEQ8+e7I2mKYj5xFs0A==
X-Google-Smtp-Source: AGHT+IE/MpJ1aJEcf6uIJ+8Or+5rNscHlCsMb7jqpnefW/nDyf5wJzo0n/quIZ7eod05PIUmZvDb/A==
X-Received: by 2002:ad4:5ba7:0:b0:6e8:fee2:aae2 with SMTP id
 6a1803df08f44-70700672aebmr3725206d6.9.1753219064144; 
 Tue, 22 Jul 2025 14:17:44 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7051ba6b0fasm54823786d6.65.2025.07.22.14.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 14:17:43 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 tglx@linutronix.de, krzysztof.kozlowski@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drm/msm/dpu: Add a null ptr check for
 dpu_encoder_needs_modeset
Date: Tue, 22 Jul 2025 16:17:40 -0500
Message-Id: <20250722211740.3697191-1-chenyuan0y@gmail.com>
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

The drm_atomic_get_new_connector_state() can return NULL if the
connector is not part of the atomic state. Add a check to prevent
a NULL pointer dereference.

This follows the same pattern used in dpu_encoder_update_topology()
within the same file, which checks for NULL before using conn_state.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 1ce69c265a53 ("drm/msm/dpu: move resource allocation to CRTC")
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c0ed110a7d30..4bddb9504796 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -729,6 +729,8 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_st
 		return false;
 
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state)
+		return false;
 
 	/**
 	 * These checks are duplicated from dpu_encoder_update_topology() since
-- 
2.34.1

