Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A88A79445
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04AE10E8A4;
	Wed,  2 Apr 2025 17:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X461quz7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AA510E899;
 Wed,  2 Apr 2025 17:42:53 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3d5e43e4725so476775ab.1; 
 Wed, 02 Apr 2025 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615772; x=1744220572; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FATfNmmYepyBuSsmf/EtXKQeipPGgu5dSGlE3AdOnp0=;
 b=X461quz74ut6acwpjggJ80Dw4AAhBDuVeQV+S+cuPdy82WGts87eBSAorkr/rlDikg
 qvpSo53+vIWYy1yAzhrVCeRFyj0EhM0vsn7uuLRyfKrvX7YagUS7rqM0ilSYEs1Ccik/
 /HoXYnCyBFinbzXxmUrP3EYe2RqC2CJzABc0jp5PI7kmU5A8HRJ9OU2139yI+z6gRmbr
 kSOmLpNUtpLD1DjJpao64yAKJB42jfdgvmjVuGvO+yx1tCY7P8xyJV5Kf9xis/7fsy02
 1jrHqoFQjDaccymolD86mW6/f/SmKW2cSV9ZtXjqJUBQ3MrBabIOuGARglyG0Q5UXbAB
 pQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615772; x=1744220572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FATfNmmYepyBuSsmf/EtXKQeipPGgu5dSGlE3AdOnp0=;
 b=Q0OpzweKp8o1soNMGdTf0UX1g8U6eTPfaC4IBPGeXC7nlZFHGCPBZ1aDP2vPxQf1Ou
 Q6PK8P3mcd3c4PYWE2wHSV2QpPcX+yN4ddUbQ5Dw4JXNdylE+cKdKedw+YD7aQUwDLNN
 +24Sx1hkX4uRcOHHxj5fvfgW7CkZX/Rase5p1cNblYKOHlCZaOp7FdOCyj5zU0A4dVAe
 Kdnm+XVLsfwMICnpA+rU50QPGjoUSDhl9BxMPt3p4M4KhT3MASYYZo6+Tq7YGjooIdnc
 Y3+Vv0B3o+dazgpIIZS8qHW6dwjeQkX77F1bZ5Y3oDpxLa/XDVX4L8CwlrsLDI+Z9lfR
 iK0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRU525boEL3jhOYNDtnfbvpc4paJOjLMkqfULQjnsrbvXtbBZuJ+/duwj+Zhmwl3SASKP9KULkcsnL9Rm6ww==@lists.freedesktop.org,
 AJvYcCWBjQO0LLTkyPZ05IkFtu45OJlNA9se1X2JLh/QIsHCLhxOPhLBt43uRrn67Lrc58EaDtPEgUAz@lists.freedesktop.org,
 AJvYcCWjymL+uuhZf48vUXjP7AtuX+B1HSrkHoqD4UDT9W3Bhwh+z2aebX458iv8uEDb1JdM6mQor5j7be2S@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVbSIXafq+AWPJdk8U+go3tAU7KTuXsIpMA/FtvhhmymcQEVES
 lyccfxRXS2qzSj0xnOV/p7gdZqHryW6+xA0E7AzZjIzlCpgV1dQD
X-Gm-Gg: ASbGnctNLP4BcCbBzaiWsgohIk9Jl0tquNkOIA62MEzAW6y+pjiB6P50EXFgU6+ChN5
 W6y0nU7kfUhcVclbDVtB/+2YbXheWEXJebBd5jUdBVnoTiQAX9izQdMOKgJK/Q0Jie5o1RPybwP
 PaQ0hYRtZ7IURgSj+Vn2kSbSl8pgO8DLwlPICDIRSpKhOmSKRMIz8ML1pZJRTxDWEAG8+qNFYGc
 gU9MFl3jSMK27xQEkHgkKA1uxvk12I6RsOhhCouN141vgmPXGI0gZy36yvGdEtOu/+xn11zwnsX
 G/1ooc156F7j1czyc//iotmsdI1dqtuzI02rYXpc5vJp5H1t+L5ZqKy9nR7r4XHEYLmNDdar0X6
 FXA==
X-Google-Smtp-Source: AGHT+IGe4ZjeecOx7VkTalotPIU8Orb/rdY2ZWXpy2CrhIYZ0sCG25kLdKxcJbOn9Bsi7SG3UWODzQ==
X-Received: by 2002:a05:6e02:b4a:b0:3d4:36da:19a9 with SMTP id
 e9e14a558f8ab-3d6d5535b1amr35121145ab.15.1743615772465; 
 Wed, 02 Apr 2025 10:42:52 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 39/54] drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
Date: Wed,  2 Apr 2025 11:41:41 -0600
Message-ID: <20250402174156.1246171-40-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

Invoke DRM_CLASSMAP_USE from xe_drm_client.c.  When built with
CONFIG_DRM_USE_DYNAMIC_DEBUG=y, this tells dydnbg that Xe has
drm.debug callsites.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 2d4874d2b922..756dba5c88f8 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -21,6 +21,8 @@
 #include "xe_pm.h"
 #include "xe_trace.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /**
  * DOC: DRM Client usage stats
  *
-- 
2.49.0

