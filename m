Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F27B19226
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD3710E4CF;
	Sun,  3 Aug 2025 03:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dv1ApU+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DDD10E4D5;
 Sun,  3 Aug 2025 03:59:46 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3e3d238b3a7so39934595ab.0; 
 Sat, 02 Aug 2025 20:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193585; x=1754798385; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=elSrGuxO7Gdrr9JiYJ8JX6gnRfA3s/NTbfdze1JVBo8=;
 b=dv1ApU+7q70ylSsvDkeYah1JwGojHudBxoSNEsJyeb1eT1b7AKFVkYclF8j9TGLbgS
 yL66MffD3oDA5pOiCy+kDg+Q77DHRukZ4n9GsdoAx76OHIQz+NKqU9lavfBFpACdg0uR
 fPmcpd4GemNZCUq5P8duqSN1OaYCF1BU36Rm88m38WJvhvE3hiOcfh/s5+m65Z+983bI
 rTVJ6uejzutZ4qTKdqkDlpRGNCg0PZs/oWtpzfMmbil69oXMNEL9OA0OXthKTTdKG0F7
 vOT9c79X7ZQo6arVpQFK98hGZLvloJznN5g8Fb7JEyHYNjPFVp71Tlp3+GayFTP5w1Q+
 qp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193585; x=1754798385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=elSrGuxO7Gdrr9JiYJ8JX6gnRfA3s/NTbfdze1JVBo8=;
 b=bNMmMjkdKwDLIq5KBPtt88pN7PEeSTQ/EBPvQoLyasdd/j93YGZbjVIjgNBj+IJLV+
 DOCTHYs3RbdUugv/Q4EjJg1J8JV+KMc0dpyNbVFwT6gaX5ZK92TSkjU0LBgncAUSinIw
 w3HsRhcsLk1YEyukwWSnOQNdaKD8VlQzJoIFdxLcBmlJLQDqvtbBjjz1zHTAir3O3tp1
 IGsy2J4eDqmkYGTVwy8RMz0KopNDWNrxm7NHBkSVRKO4qNB4EukMjt2uIiP4Sp5ozIef
 xk/4sDDAcFe6zMJma2N3lYec2rJMv0MsFyTXy4ODGQ+qg2nfjL0Fnc/E38rlMCWKXqnb
 crSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWTHNPEsgbyunYHyKRel6OR+e2T8NvUxSch4XqK62Np7Jr7/qqYwQDWUDp7G93F1UX//VsU08D5yoe@lists.freedesktop.org,
 AJvYcCUkkAJdbmRaueC6ejhzL+J/ccUpha3AKNr3qpJI7mq5mB5mtwYz08mHydntnlWyCrR/EQlQS/t6@lists.freedesktop.org,
 AJvYcCXNYXCcAh3+bZuVUDPxaco1E0TJNwH3GBVqcnRU2/sVnR9B/lG2MjwvsSslS0AI9hQSJsTDjLyRTQRhVyJF/g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsME6c/wQHnjd62KXrGjReBXjIDdxn4FKZ7s5ahlppcobMXAbi
 jpiN9AweuB0BlQ4dnu596i/ho1Zus1HEIBIQoY7uOXNsb0UJuncv36qs
X-Gm-Gg: ASbGncvcZdEmhVymLVg6mCLIoOIbxBt5ZrVCaSVTfX7vUOwil0Cc5H+wbFP5Yv6gl4q
 i1UHUfyNl+/TGZpmVWePcFIlFYWAYlWN6Tp/epylGiPTHdBDH3P+oQjD1NkwzlH8x/n+iUpsMOx
 P6gX5iwZdPrIxV9ajlg2wbYQspwyxZ+kHS1Cy8LL4hSGi6iT5yXWQtV+G+3/srOzXlIvHM5fIt5
 t1OMi9sRz9VupilEN6tlzq+8lDDQJkahV/4M9kTqohWhkcfh/Ig78kC6JuT99zGRjxfgk6P0T9X
 eqj0B+Jlp3gUmoBekOWh3afZliJMzEZIe2XreWMEXeqDh8YVfCwbqDerN3TZuINOGoeKj1scL1i
 HZlXlE2yE32tFibLQ+ivznbUW2piJYrRJw7Xz6hNweVUbyptQMmzI1qdu8PjLpIbELRF/7nOBaI
 4+zg==
X-Google-Smtp-Source: AGHT+IH2v/yHbrftOiZCv+3aNfsvxCzIweIV2VBjxfjxpqhUxRJcHX4wYrnxPDdmodWbE9uh3slotg==
X-Received: by 2002:a05:6e02:1f0d:b0:3de:25cb:42cc with SMTP id
 e9e14a558f8ab-3e416192458mr92390555ab.10.1754193585333; 
 Sat, 02 Aug 2025 20:59:45 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 49/58] drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
Date: Sat,  2 Aug 2025 21:58:07 -0600
Message-ID: <20250803035816.603405-50-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

The vmwgfx driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 5205552b1970c..24e9f6fde1bbf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -259,6 +259,8 @@ static int vmw_probe(struct pci_dev *, const struct pci_device_id *);
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 			      void *ptr);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pages");
 module_param_named(restrict_iommu, vmw_restrict_iommu, int, 0600);
 MODULE_PARM_DESC(force_coherent, "Force coherent TTM pages");
-- 
2.50.1

