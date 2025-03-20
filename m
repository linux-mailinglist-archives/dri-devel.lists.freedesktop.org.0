Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE34A6ADCE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D5810E6E9;
	Thu, 20 Mar 2025 18:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hMQp15MW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE44110E69B;
 Thu, 20 Mar 2025 18:54:08 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-85da5a36679so109018239f.3; 
 Thu, 20 Mar 2025 11:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496848; x=1743101648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1ua5S//H69kDLjZ/ereYDRSGWaurp/ZUyrfcdHp8ig=;
 b=hMQp15MWDc0C+Z/KJyoec17muSo2vRRoP/7duKyIXP9jQMR3AUHAIVtRkAZIMTUh8F
 qeNOU5g6adovIwOGGTE3hKFz+f3yA7EVLBCQqM1HC2qWoAyD15mdiXVKNxl/mZvhJYC6
 q1FE+VK4CFQP1kfpycav/a+/HnBCUkFZWQvFn4gHPV1c36dHYRk5pWhYndAEh0KWd0Iv
 H2KQFr7kXCQ/69+rKnyp/W2nlvDoVt+bM5xnpg295wr4veLAeSDtT9x7vfS4haijbIT/
 agPcK8/uo0WymJGN4u83AdVg0weZVA+WB9hZNvbakofPfuGKTnurBBpkrB43gTMMTJkR
 dVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496848; x=1743101648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1ua5S//H69kDLjZ/ereYDRSGWaurp/ZUyrfcdHp8ig=;
 b=OG9dxVvLi/isRIZJPDdqL/qWFkx3/XEMd0j2flX2iPkI7oU9rZGnR/7sF5a7fr2u8J
 4yaNsUoM7GEgKbwTez6UZpJWCT+w1MeOAM6wCJeJRF8KG7pSkIAkrHTpy3Ik8TUNRY/8
 BbLFwiT7WzeeUb3u+amOH/H9R3rPJhE3quoZPvfZ2unp6HkIGUUHxgNBoan86C0/AoRH
 ljvyxMmV2pqOjx9w4i4OH1Mz+Nmy8JbT6wlW2GU1lrgLS8tt/44MMAg8BtkjmVkeEvkT
 a76quDcDZdGeAzi0vMD8MZ9KC1f5XgtS9+3T5LNvLPkLeYy8zC6wiPgpIZ3G7zij1kMB
 cINg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqsr6OAg54fBdb2RTSDnIn/nhv3gHHcwduYS+UWXLiKh5JB/c5eafqKjfwuy6cEdVsnWi1JXrH@lists.freedesktop.org,
 AJvYcCX/XT8YiPUhVfnRSw9pusDMeUMc3LWS4ZD6vmVpA460WSh+0a7oBQKKUcpLF8f/rXajS1hoCXsbxD3O@lists.freedesktop.org,
 AJvYcCXWJh3Ewv9iqk2eiBgK1vvAUn+vBM3zkQKzjQCrgdDG4MM8tWhUb0DVNe46+PL8eAgDLz1k4GVCv7JWXhIgew==@lists.freedesktop.org,
 AJvYcCXb7nPKcfMkfD7R95/yPF/QL0z2IFbJ9MYggzxucvIDS7JJTfUvAtySAXooXzXXKikbgJBKtEHJuylNTq0/+G0qSg==@lists.freedesktop.org,
 AJvYcCXpo0cOC3in46V2OoxD9TYAYT1w1gViXA3f8UZh84BCL5t0JuXeL1NyxMJA3zeZGa8QlSWLjZLS/B4U@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQq2VggP8s0NYVkkXLU5Trqf6s/rPsayRxilX14EEfR78HS91W
 206clV5MRDrJnC1ldcT+BWNhT+U0TyAkzzJN0hkAV6rSCf/h8wQ3
X-Gm-Gg: ASbGncteNXTqvWaAXhnMZrBy53x9lIex1bAMQL0Erv+KD9V7GXZaXPlQUc+JbO4a7VK
 8LUfvfPoKSVc9krLqQfYbnI2K7lpy0wn+oO9mYGIbMAcXXejAxMgiO1KS8/s47x61ULbT3IgC8/
 f9K38BLwAxe/ybDgfEz1a4sXfqWPuUQkZslmIFAdb0JYe8TKjusLqWcIjckFbjYSBm1P07BoyGO
 sihyVJLOmnOS4bGeUIVO49GSXY41HZ/jLDCgJSlCEC00LotwF73WDr3uh8zrC7vtnKXT74YrNZs
 qnovIVl3FfQtSXed8hg7Wnpr8+d7BpPWAz0zdKAV10UWRlvvOBgEIHWU18BlrN+sSPPRaC+Jo4F
 x2g==
X-Google-Smtp-Source: AGHT+IF1BVm3oe17yrUphtZQXL8NOfypQ6M9iJgJRk9AIUUygDykxaFcqniPfeAk5RCxls2FZZiEnQ==
X-Received: by 2002:a05:6602:3997:b0:85a:ec03:b124 with SMTP id
 ca18e2360f4ac-85e2ca64293mr50159939f.4.1742496848117; 
 Thu, 20 Mar 2025 11:54:08 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:54:07 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 56/59] drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
Date: Thu, 20 Mar 2025 12:52:34 -0600
Message-ID: <20250320185238.447458-57-jim.cromie@gmail.com>
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

The qxl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 417061ae59eb..c18577a3153d 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -66,6 +66,8 @@ module_param_named(modeset, qxl_modeset, int, 0400);
 MODULE_PARM_DESC(num_heads, "Number of virtual crtcs to expose (default 4)");
 module_param_named(num_heads, qxl_num_crtc, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
-- 
2.49.0

