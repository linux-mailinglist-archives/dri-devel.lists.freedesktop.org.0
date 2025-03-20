Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AF2A6ADBA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E0310E6B1;
	Thu, 20 Mar 2025 18:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eng5vj2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A039B10E6C9;
 Thu, 20 Mar 2025 18:53:58 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-85b4277d03fso43918539f.1; 
 Thu, 20 Mar 2025 11:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496838; x=1743101638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ck+/k2kUl1gxvAy57O83XENj4jmXSLh8yxG6/aZ/GV4=;
 b=eng5vj2eS3E0Y8v3vph4qe4l4g++jwuuj5Ww6G+wh9gYxRyQNEtvBMZ7o4TqXrEPa2
 0r+A1mhHLmO0D/HMif8EWNizU+/YYCXZ2jzEoL0Ui2RYyOHysJBKfEXnXD7Tlouh1gAQ
 DpAIvBmpbh4ABDWkjAYnUHi7L+D2E3DJZfcYq6O+zB2Mm+RuXL9NIlwP4Cc+DQZynWdq
 3kyn3Fkr/CedrBMEPo5gnh9cS+CMRbsH2ht0VsR/X5Z44b05u5RxVGJPfXz3yaB9YWV7
 KdMhgWUHJVm3X3puSGGjs/TJoxtBCNo95IE4fd3vDJBwrbU5ZctstvKv5tlInknSrjwU
 IkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496838; x=1743101638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ck+/k2kUl1gxvAy57O83XENj4jmXSLh8yxG6/aZ/GV4=;
 b=bLIZk1c3D7eKPUhJ8Abb+XwDW1ry4L6lDWYJpd4N9Y7ZkRrmFiL6QW8N4Yz5vRgD6z
 +FMnKVG1Ep41B2EBmpTIDN5Eynmubeuj6o6sFi54KzF8lIzDtbl802K4m/SdTxoEHioe
 COn3m/fZfVqeEkeqSpoxV4r9s5iSZdie8SiWPUxUKq6hPAItxeS2ohVher1sZeR5elSD
 ythQH9Vly4dL+ssdILBIGgvwpx3bYwj2+jcGLbli/gcynVrmnFkOoL263zcfypdZxU7n
 7CZodlqiHsYfwxhNEFqd5R+1AC0gxSBJh/XaKVR+b7EIMrTsiM/95KZvK3Dsw2sPXin3
 gedA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCXct9bS0IaB8k+B3XM2wQ4tSfSpl6sH9mnVJLj1bHnUKtqQvDKp99hiJvYIhjhBvOro/40V2oTxITyl5dshNC/g==@lists.freedesktop.org,
 AJvYcCUEXyFmA+W5ILlgfhDZfO8J4tjddICujMR/OBZrPfWn4i47ofAv1clwR6y00EP6niSGhlxDi7e8@lists.freedesktop.org,
 AJvYcCUseNjcfFFG+hFA7LXqmoz75hu6/FRlmSV5yffkqAhSvri+Ct/1iyAkr0zTKN4ULXaEpmq7sbYmtdoO@lists.freedesktop.org,
 AJvYcCVYwK7Po4iRNRcoFdR7QJdazo27funskv/q7/u/A25EQwKqizj5pK938FQMnvTbkqggzmIhEagaMmgNNefXHA==@lists.freedesktop.org,
 AJvYcCVqcrc7tqLK45Hgoi3wYdhXxPL7wW8JDkEWLVNXnfrpIVJdYftvfc2Zp6ME4yQQZjwOXQ4lFVGWR85/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqKYm0n5WyN+/mq1RgQg/msj98VrKjp0p699YgK+aD7GsmiY/C
 L81OLTRuoN59Wpf84yNe8ZsJgVOqaoPm4MMv02bly4PMqft9jckP
X-Gm-Gg: ASbGnctHXpqMDwav2M3aDGPIpIhaqMDZEwaHEiNZARipt2orsOq5CVFZMPn2lsV87PX
 cI4gHYM8ZmNQRc9b7AkRkhbE09/ehKgfpBVqe4qXYuKweztgqjXr+Fm3qrfmLXAzX/xabhBnKhP
 l8K5IlM9Nt8vVuMjfKHhRbjy2SAhN/xp0vtnjIDfkzmsRf5HeYvjhmTp8G8H1YGbf5APUWx6Jg2
 97nc0XzsnYIMeO4eEjuHHPq6XDagaLM8gtVTS5oQA/I0mB7/UMoYO/RLScUnrkt5EfUItJnVYTP
 QnOtnzZTFxKHr7vWHYtiQu3/t7jUG7FlPKiE0f5Rkfwlz4105nfAibZ2QATb6+BrNT8LhM6yqA+
 Tzw==
X-Google-Smtp-Source: AGHT+IGUEti7ctdmH6bFLDYmAxNDQnvD0h8GxVJRFPAW11NDjRFBr4OYo/0+VvPBBTOSLXboR9af1g==
X-Received: by 2002:a05:6602:3607:b0:85d:f74b:f8a8 with SMTP id
 ca18e2360f4ac-85e2ca19fa0mr39028039f.2.1742496837861; 
 Thu, 20 Mar 2025 11:53:57 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:57 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 47/59] drm-dyndbg: add DRM_CLASSMAP_USE to bochs
Date: Thu, 20 Mar 2025 12:52:25 -0600
Message-ID: <20250320185238.447458-48-jim.cromie@gmail.com>
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

tiny/bochs has 5 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/bochs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 8706763af8fb..dbcc8ba70dfa 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -59,6 +59,8 @@ static int bochs_modeset = -1;
 static int defx = 1024;
 static int defy = 768;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 module_param_named(modeset, bochs_modeset, int, 0444);
 MODULE_PARM_DESC(modeset, "enable/disable kernel modesetting");
 
-- 
2.49.0

