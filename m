Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCE582534C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 13:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF83A10E5E5;
	Fri,  5 Jan 2024 12:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5490010E5E5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 12:22:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso1093870f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 04:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704457347; x=1705062147; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sGBscisyTSw/b2M1zSYK36n9y5Z4TnelnT//si07xms=;
 b=LcuU8TBkXaSE1XqYIR5xaN9qU3j/Tlz9WDVZjxN2ZilKoRGs+yljV6lxvEDzEdjDoF
 psWj3OubxdjnEsb0ootr4m5G1QYGHQrF50b91xg1AUfHksNkHRrD+LI4wQ3FfRRGx+W3
 uPkj4iccqDWvP6tPkdbm7oYcE2BbtCQvGyafx4EeElsWyoWM7HEXNZSyjAguhCnMo1+D
 2bpmgo6X1L+TpiQA3wo7sKcUgRqJGvy8gwvHRgHtqNVrRm/mn7iLHAo9VhO7ESh++Usp
 GhgazO85W7RbpJvBQRgzpH0lA0YNLfaUvVdBMbbypY7a6MibrsFUkZkb2DnnYT41qMFx
 a8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704457347; x=1705062147;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sGBscisyTSw/b2M1zSYK36n9y5Z4TnelnT//si07xms=;
 b=b4EyaeiwNunSvgcQ9ckKHkwsYq1QzqHknh1HPgrDurkDKixBFQBoTjFeMpCB8y4/CS
 Yg0+msZQftD2kuysZ2HefjfEZoC1+wA2Ugunti7459YH4ApvcdMxg/vYyXRfi6CRKblK
 pZ3cfQtlEmuRzp5f9bC4adnIPEGrrHdMirU/+Ca8dExeZo35/MLTCezyYtoPOyNv1AG/
 L2Qj8n1Qp34bO33weiNfAuMvz4ZEtQfivg5IRgS4SrzXMiUsSnQPQ9ye5jiCDuchXiFq
 E2AqSYtd/BysEMMlVQZCV/k9L4L0/vk9VgLSLUAibl6fHI/SVJo0+jxLfqy895jm4eVf
 95Cw==
X-Gm-Message-State: AOJu0YzBBLWjbcN3jW7NCoijmu0xccl9rVBbEpMOSMu8a6H+aPmZVPWB
 RsJGPAhCJi01drMHD0pk81jH1cCm3SXJgA==
X-Google-Smtp-Source: AGHT+IGT9fzaBi710ATXJxb0FerLWIsQ3l4gQxWJgA6mtydUZQ2+rmZLq4bt4feS2DdowkKD2D79Tg==
X-Received: by 2002:adf:ec05:0:b0:337:46ce:6239 with SMTP id
 x5-20020adfec05000000b0033746ce6239mr1113868wrn.60.1704457346718; 
 Fri, 05 Jan 2024 04:22:26 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 d3-20020adffd83000000b003367e35abd4sm1296723wrr.71.2024.01.05.04.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 04:22:26 -0800 (PST)
Date: Fri, 5 Jan 2024 15:22:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] drm/xe/device: clean up on error in probe()
Message-ID: <c8984fe2-dc1a-4ba8-97c9-5c83f53a0d09@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This error path should clean up before returning.

Smatch detected this bug:
  drivers/gpu/drm/xe/xe_device.c:487 xe_device_probe() warn: missing unwind goto?

Fixes: 4cb12b71923b ("drm/xe/xe2: Determine bios enablement for flat ccs on igfx")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Speeking of static analysis, someone should probably run Sparse on this
driver.  There are some missing annotations.

drivers/gpu/drm/xe/xe_mmio.h:65:72: warning: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/xe/xe_mmio.h:65:72:    expected void const volatile [noderef] __iomem *addr
drivers/gpu/drm/xe/xe_mmio.h:65:72:    got void *

 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d9ae77fe7382..b8d8da546670 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -484,7 +484,7 @@ int xe_device_probe(struct xe_device *xe)
 
 	err = xe_device_set_has_flat_ccs(xe);
 	if (err)
-		return err;
+		goto err_irq_shutdown;
 
 	err = xe_mmio_probe_vram(xe);
 	if (err)
-- 
2.42.0

