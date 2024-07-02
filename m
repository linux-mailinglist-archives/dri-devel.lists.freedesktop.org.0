Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66718924AB2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37FF10E71E;
	Tue,  2 Jul 2024 21:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z2cJq00i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1116710E70C;
 Tue,  2 Jul 2024 21:59:24 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-7f3c5af0a04so246304739f.0; 
 Tue, 02 Jul 2024 14:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957563; x=1720562363; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEobEBAhQNxO/3OZFKP2IkCx5XlfGH8UelPAprxIIQY=;
 b=Z2cJq00izWtYrkz1PR39P17tRi9mUs7wpIHvu9nPeI+TYMxWlY7MKmzsvAAAIfXgwB
 YER/DAwgMCIoz/3LQtbC1pQmzVx7x99+tdy444UyDp/2F/YQ2KfZ4ry65mse1JpyUnPF
 MjMk4HV7obGweS+hrnwYOtqZrsEEWgI5c1Y4fV+thdASTLO4vkrC/X8AaS9S/ZY+NSua
 qa15Auj3Rwv/dsadEtsKAqe+x7K8sSt/x9wABZLh1d5itL6fFHDPxCAihahLY256Jreb
 C2jV0IQPsgV98FGcSoe3VtiLP83v6kn8XRbRrUC5Zjepmon98jHPpeVN6Y8Gp/aiF9kn
 CFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957563; x=1720562363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEobEBAhQNxO/3OZFKP2IkCx5XlfGH8UelPAprxIIQY=;
 b=U+BdQwTtLfHPsRIwbmo6gzhgJugL/DwdTvbCCbuf5RZVG7xPnT9Lr0OapuYs8bXmOQ
 BbCe1riWK59LDEZTCgilbEBS2QxXYS+JJAfPXx1WNpuEVjLoFUSZc9/IkHWnG7UE0vuD
 Q1bRRBB8jn0DT70XJOeO5bUjvGN5MQK28EO2ZLIQtJwWwl7yssvV41b2Qi3aiShcVeVS
 4zH8q+sPHwf+E2w5MNpOhdEgDeRh2wGHZQZFgk1zpkcdnPhcuIIeTK8LBnO2T34c2jAw
 6QG18Axe+n90XMhvN94cuJ7K4J+Dcfj49PfxaVomlek34/ZasiwEOHHHg5dzuOXb/DqJ
 6/DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjBIidSkxoOrx9TatQbAzbkty6V0jh2Y00Hs2wOJNwjvFWO/DtbsRWiVdEeBoi2d2TRnoBOmPp2M6IPl0eG4DXv6V5/Y9+iwa6VeIfAt/S2ESTIkZ+8GD7EAPDTU0Mb+uw43dZNkYGbsY5VDbr468G4Dqi8ZKCWzjFsB2oMNLhYYLSE2JMRuqHS8Saz0C5/9KK50AzFvn16DQt1Put/kvNva57KIMKLq3HB+KxizMPUR4g/ss=
X-Gm-Message-State: AOJu0YxcXyQ+hV54q48wZ6nSKYvrDrACVs6ChJpr/lG8jJgCh9icjIW1
 P2jWrTxjHWU0/Wj7KyBBFLNx53FY0YrJKp6Npqdeue5S/gC+zn7w
X-Google-Smtp-Source: AGHT+IEXFuB8CgCOnXQJuoSrwTgJZdvIHg9MnoO0JAh6apXbcdNr+8WN+3OWZHzErKCmZl0N7gDJwQ==
X-Received: by 2002:a6b:7f02:0:b0:7f6:1b9f:8939 with SMTP id
 ca18e2360f4ac-7f62ee0c85bmr999438639f.7.1719957563268; 
 Tue, 02 Jul 2024 14:59:23 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:22 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 45/52] drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
Date: Tue,  2 Jul 2024 15:57:49 -0600
Message-ID: <20240702215804.2201271-60-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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
index 58fb40c93100..c159f4d186a3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -275,6 +275,8 @@ static int vmw_probe(struct pci_dev *, const struct pci_device_id *);
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 			      void *ptr);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pages");
 module_param_named(restrict_iommu, vmw_restrict_iommu, int, 0600);
 MODULE_PARM_DESC(force_coherent, "Force coherent TTM pages");
-- 
2.45.2

