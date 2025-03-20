Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B69A6ADC6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B6A10E6C5;
	Thu, 20 Mar 2025 18:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TXrePw4U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFFB10E6B3;
 Thu, 20 Mar 2025 18:54:03 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-85d9a87660fso112670139f.1; 
 Thu, 20 Mar 2025 11:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496842; x=1743101642; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JTbNTI64Sdb94F5FeGTeZQmx91wNwlAKHYCBLiEXOdM=;
 b=TXrePw4UHTxj3YKy/gFx9OplMDSQ8l3uzquqX85StriKDP1Iax6XW3PQJo0DnilQt5
 tOLOVcU4LOSYK1AqgtSaDVHR0Jhe+h7RRGzp+23uyRp16tAHgxLB71VL/bxYjkfALOA7
 62Cv0vC22GRO0RlLIKxVPpKMtlIYkPUz+zRTQ68e47DyGSbbYm3EW6gLMNMOWuANYkan
 uQRy+5ljNPzB0NP/0vjww/wmOgNoBFy4a80X4VJZrGJc7Zcj3CcivVpBxokOITK3s7nE
 fw7haKs/rKsHmIfWt3KkjBjnkm+WtusOaNVBtERqUhoI3Agl7kYtB/57oqrRB91/SnAu
 l1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496842; x=1743101642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JTbNTI64Sdb94F5FeGTeZQmx91wNwlAKHYCBLiEXOdM=;
 b=c8oPX65yzVh9jlPp3W2XsHqY0/SdwGf3qlxYBVKo0kCioBS8v2rOJe6XOKGb0npwgd
 tZWdVp9XgIBKXlDF17jM7m+QiXXhAmLVOlG8V0GD7LEVq3R6qLJjd+roDs/QdI6Keu/8
 Cu69aSMZQP21q3JebEt6JhW9lRKtRJRDb06N3sHqlSf0YhOVwXHqrKcqZBftcbALmp4g
 TOw40axCuoX4a6WLtB1O7B3QqDf4GRGg7cAApWxxtF5NWeT43SVFINNt+/nQiBCQn5jn
 IjCy4LJ5xsFcXMuL6b8r0RxkEugBz2v0cSE1sF8mdvhn1XWENQTu6vi+vdPCLCRgZnlw
 xm3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+9dvuK4FJpOm/UCXBWypmqmyBYCz5HZzBKmAB3Pjz6+8B0k4R1/s7W2WhxM34NYPA5oFC5I0q@lists.freedesktop.org,
 AJvYcCUjf02y7pmA5FUk9tkmFjopdvsO4KagDwHYA7pefGcgEj9v0Xp5mad4SDlnMiAVXtdNGqyKt9a1lJ8s@lists.freedesktop.org,
 AJvYcCVp7ThmOsgy07gxl/1hEXnHa+HpjweH7BXO5okuXsR4zSUMf1EqY3zNEEDLuoFnMqT8U5dOiGm7ib3/fNtDL20cyQ==@lists.freedesktop.org,
 AJvYcCX3hfkGQV2p5uEnnfn9QwFwb2xJ43tFBWKphFQl6qJwxWhNrFmBTH7c6NUgS3W/HtYuAdIBjmeBF5Ui0FEKPw==@lists.freedesktop.org,
 AJvYcCXoP3KoFmVljA2pjA29UstbPGnufK09IMdRVzAvVF+q2LtlJEr+2esx4g5n3lTWR2BSMhvPiZEjsyG1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiCYlC+VaP7Zoem1Cch2gE6YkpHJYE9xnmtizFfXzUcqyp1NjK
 mHbRHB3s5F1pki1pH65JBpwUKs4kJ7gLjkSMbeUufFeSwoDPQyIS
X-Gm-Gg: ASbGncs8E9kELUFWBn0UgPFEVJT+EZzgv2NZFnOC6sDo2jLadBaMtu4u1ALE+indwsH
 kVvraxjsPbv6QMfiGPnaVJsmyte1XozCeePEa0rPAuPLhPN3XMKHUQN4uqSFeoGhPfgJ2ETr9oo
 LClTNPhfHkIHA5lhchAPKIUWgh6xwzwTfp88yl1L4VBSv9QapXMkgPH/GxLnP8z95sO7V/lHOiH
 2J0u10+k2o0YHs4HHqs5eQGd+QjQFVFOF/7Q18jaJNBxvKZt9msb2KMTPyIRCyK9avOryQz6m+O
 sDgpl01Va+P8JRq1fb+myjuTJysPBc1sfsP8YyiBzUWELyNN4RqLvSjursKjHtOxpqKbZ/AcSxM
 FLg==
X-Google-Smtp-Source: AGHT+IGJ+F5hgXSEX8LPUK8KbWY2gpleoQ+3CsjZCEJhiphZtgFJ/4Ts9qzOdYEYS2jHaPKn3rXpJQ==
X-Received: by 2002:a05:6602:7219:b0:85b:5869:b6a with SMTP id
 ca18e2360f4ac-85e2ca35c40mr46952939f.3.1742496842400; 
 Thu, 20 Mar 2025 11:54:02 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:54:01 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 51/59] drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
Date: Thu, 20 Mar 2025 12:52:29 -0600
Message-ID: <20250320185238.447458-52-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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
index 0f32471c8533..2b4f862fe5d4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -279,6 +279,8 @@ static int vmw_probe(struct pci_dev *, const struct pci_device_id *);
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 			      void *ptr);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pages");
 module_param_named(restrict_iommu, vmw_restrict_iommu, int, 0600);
 MODULE_PARM_DESC(force_coherent, "Force coherent TTM pages");
-- 
2.49.0

