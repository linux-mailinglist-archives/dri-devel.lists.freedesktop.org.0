Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576E3924AB6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B468010E710;
	Tue,  2 Jul 2024 21:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="djl9Fo9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5997310E714;
 Tue,  2 Jul 2024 21:59:26 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-7f3cc78afb6so165132239f.0; 
 Tue, 02 Jul 2024 14:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957565; x=1720562365; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEobEBAhQNxO/3OZFKP2IkCx5XlfGH8UelPAprxIIQY=;
 b=djl9Fo9pVIfkFoW7W35WU7Or90DkPZ6B7EMXVqpRDewP9TmI31WTHHwATw5/30XWc7
 jp8mWpC7YoUlugDaknDnT8oSuc/1pWJZw83Dr5BPWNetpNa2GmWLCDAIyEDJc4asyJG7
 KzrjWPFFv1RyoithxFq0DDfem3ebo2Vt/BGuaoYOqXSPnfUIMkrVPWd/lxum3VCLXCPQ
 WMBt25HqbyH7P/2T6MrutGrSlOohqTf5Qg5vjAfbjZIn64Eu8C/BOZMKGVFOrUX7vkTV
 ZTSMgCXvMxzkfIWFDQgTQPx1KRMc1Y2pc1+x4+Ihza37Cil5ec03plffFtSZEmpIgL6F
 t/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957565; x=1720562365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEobEBAhQNxO/3OZFKP2IkCx5XlfGH8UelPAprxIIQY=;
 b=bR0g8vZnFwMB3lk2umfNL032uW6q6iSy4UYIa7zpN6oRZwl/+QrErDdI/3yNeXLiV4
 ujavOOeUZAB5INctR0K/HYTOaokHe9uB7XheIcR0toQl8mxZkRPP4HMGkJGSMHHun75K
 x8BkAk/drJ0Xae+eoMSN1OAgsCRVvxZrHVKdT8LYIm2Yo04BNT2MwH+k/yphr6V+SWzB
 XEpd7iDwvijVHFu0XTp1C2gFP+Zen49QXuyXW1Zhu7WuE4RySGFGokd8VT0WGg0ttY2E
 9dHP8sPLtLFnScYrnfT0NaivkEHf5Z6Alm/4dDlMLoOdBnug+ucAdyYFA9LtXc4NqjVn
 Kzyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMZUqsQ1OYU3VbMpRWxVmShYVD2HZVyJKLwZSYfLlR5Cr1295UZjDg6vEKNjWdGtSCCv6s6TJRUioJrms947O17A3/t+JIAWv/4gpEVFfN52fbET0+UoWzCw7QIgs3xqUJDo5zyr/xUOLk31f6lNxa3IWKWLR4gxvf0qK/sqBtNe4HrP7S5kTgqIdKPJ6CoHUMZ27KTRtRRDBWhubLO7cx+0smccXwKpVrkRO85Iafm6q/vHQ=
X-Gm-Message-State: AOJu0YzW6lHoGOOmiHx8rF+yiw319+tcPhaqGzU4IVFMsV7dEhJ60L58
 AOK3+ahKBkjhz/pNvkXNXAGcJEZgaOF9Q6aCrq4G/SeftHQVMs2W
X-Google-Smtp-Source: AGHT+IFcOC83OBkwA2hxGjvMqaxztbP+AvzQjxD0yqNmEddDILLw49t8Koh55fzABZc6BNNbXU+pEw==
X-Received: by 2002:a05:6602:1305:b0:7f6:5694:d874 with SMTP id
 ca18e2360f4ac-7f65694d913mr239273439f.20.1719957565593; 
 Tue, 02 Jul 2024 14:59:25 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 46/53] drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
Date: Tue,  2 Jul 2024 15:57:51 -0600
Message-ID: <20240702215804.2201271-62-jim.cromie@gmail.com>
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

