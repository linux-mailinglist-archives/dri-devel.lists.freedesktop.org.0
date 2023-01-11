Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686C7665F66
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE10410E76F;
	Wed, 11 Jan 2023 15:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D9A10E2B2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:41:24 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id m3so11408922wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 07:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=94eajVQl3EIphKCpXXhL7CnxhOfjsXCJp+mdLyrDZk0=;
 b=f7KHQ8uU7yo7cC1q+hRAYyai9jdEOJCO8tU1UcHPeDOQzr3zT9mcNDiHKbkAh9YMdi
 PcqaMKKeizVMG9LtdqmhoiqGGOE/2lkXWI8gQheuKM7IeiU6H+0SevQsiVwVjpCuYqMs
 pIc2/KEnN2fQGSipr275BOLjvkdqRmvXH0z6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=94eajVQl3EIphKCpXXhL7CnxhOfjsXCJp+mdLyrDZk0=;
 b=QL5ohgcc3Pt/8fU/uKvuXzzjO/1xXAVXPiPZHveS05HqHClE6Uba80A//kcTRGWciJ
 TKmZbJAbeZm/ALjZ+a006/cu3KH9upNozQpzILWKPurg2U6dniFfv6VdN4tp+Y/h4ImB
 9gzcwBmENosV4HCTy/qH5SK5c7SmexFYcZGcmlOj6RdfdVa9xvfLIrK/7xTxWd9IqPm9
 0FRblCsUMb7jGD5eTZfpMvLBsTIDepzq/KaDhbOVHTJsyee72g93l9bng73t8E5cLyUT
 mSm7zsKc7MQqjlqO2xBaLB7zbK/vjLF8DmYkIDgd9UbK2VIPz+I3HKGkYTh9b+ft7mi8
 YriQ==
X-Gm-Message-State: AFqh2kqAirl4UIvz7JlxF2FpVAjPRgjU++pD/u80F/4cXz+6h882tQbY
 RwxfGkWjn1e0opUw8HMrd13Y2FPnX1e4Bx3J
X-Google-Smtp-Source: AMrXdXtf8JLpJynpq+UdfDiN+hQzDfbaEU0ALxQMv3+e3jXFqbhaPY9flDL5OZP4Gg/LNzzywZZOJw==
X-Received: by 2002:a05:600c:4e4f:b0:3cf:9d32:db67 with SMTP id
 e15-20020a05600c4e4f00b003cf9d32db67mr52259243wmq.3.1673451682597; 
 Wed, 11 Jan 2023 07:41:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003d9e74dd9b2sm15936149wmq.9.2023.01.11.07.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 07:41:21 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/11] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Date: Wed, 11 Jan 2023 16:41:03 +0100
Message-Id: <20230111154112.90575-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This one nukes all framebuffers, which is a bit much. In reality
gma500 is igpu and never shipped with anything discrete, so there should
not be any difference.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index cd9c73f5a64a..9b0daf90dc50 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -429,7 +429,7 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	 * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then we
 	 *       might be able to read the framebuffer range from the device.
 	 */
-	ret = drm_aperture_remove_framebuffers(true, &driver);
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
 	if (ret)
 		return ret;
 
-- 
2.39.0

