Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 517321D602F
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 11:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B116E1DE;
	Sat, 16 May 2020 09:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDADC6ED21;
 Sat, 16 May 2020 02:36:04 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id s198so4075957oie.6;
 Fri, 15 May 2020 19:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KPeuzuHEDvzwNnkRCqowgBAU6EUQ7TCPeetBb+t1Bdo=;
 b=aGmFPqdutHEPouBg3Si9ID8mt8l+QV684XJPaZrlFTWA7mam49jOuR0mXI2jOavU8z
 lrkl20RBQ0BVaopc7Yb3YJqEUcJnp3ShFPF6HjwKi31C1ZqciisHIWuGF6Nu0c+75mKx
 nMNYULyB0bTOEw/EAx5Pn3EMUZcEUwXjbJ0GomitQYbc73J0qApYBwf+gQz8ygkF3Au8
 n2/uk/gL2wQJ0KDNbbGonwu02NtWBXva+NKSKSZG5MBrVFEV+AwhLGzJc3/DfDWTkYCQ
 eCPhu6V+nHt37Ub/Yy+Zpwcoki+EAfgTtg8e23OWIlxwNPpAUjWZlInl31PJ1r8H/tuU
 Ch6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KPeuzuHEDvzwNnkRCqowgBAU6EUQ7TCPeetBb+t1Bdo=;
 b=ugLgTqVELb8HKNrtoqWmpKJjeTA4rJBhkG/LIzEBHkmX0k1VjLEg3Vg72qKGa2rTM0
 BMyMR3NRrLmgjwsAFIBvgV1zD8VqJM7+HKZo+0j9DIKsliKxxNvcI/QHgNmWF/jQsX/H
 hupxF+fa4hfl2bHOYHNUt5+mfLrdYCvboMiLvMxn531uO2AYKB5OMI9gzHRll6cXh1oV
 IexujLj7zC4WQfML/vc1qOJNONfwvQh1DVls0iANwS0f0wjCqLo2tUZOpxmI81/JzFoU
 RoERFwWrCFVT13cWm36E2E/xvcl7A3hQY3bGl5PzoG6iM/xdS56ExyNMhFqJDq4MrSLL
 Upuw==
X-Gm-Message-State: AOAM533dx7ZeUEQpWGL0nhvb4BVTGcvW1sdSxEgRObm7HZaq4t/Sekfp
 GL+xFghZtIvP3Hax91cNp7s=
X-Google-Smtp-Source: ABdhPJy47Nsv2i4H/OPmjeTG+IFTltW99Dl2+E64qa4UnzF9iYY27a+pUPAga7zdZ/0Ztw3+0h5YWA==
X-Received: by 2002:aca:908:: with SMTP id 8mr4438837oij.170.1589596563884;
 Fri, 15 May 2020 19:36:03 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id t15sm1112821oov.32.2020.05.15.19.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 19:36:03 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915: Mark check_shadow_context_ppgtt as maybe unused
Date: Fri, 15 May 2020 19:35:45 -0700
Message-Id: <20200516023545.3332334-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Sat, 16 May 2020 09:58:59 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When CONFIG_DRM_I915_DEBUG_GEM is not set, clang warns:

drivers/gpu/drm/i915/gvt/scheduler.c:884:1: warning: function
'check_shadow_context_ppgtt' is not needed and will not be emitted
[-Wunneeded-internal-declaration]
check_shadow_context_ppgtt(struct execlist_ring_context *c, struct
intel_vgpu_mm *m)
^
1 warning generated.

This warning is similar to -Wunused-function but rather than warning
that the function is completely unused, it warns that it is used in some
expression within the file but that expression will be evaluated to a
constant or be optimized away in the final assembly, essentially making
it appeared used but really isn't. Usually, this happens when a function
or variable is only used in sizeof, where it will appear to be used but
will be evaluated at compile time and not be required to be emitted.

In this case, the function is only used in GEM_BUG_ON, which is defined
as BUILD_BUG_ON_INVALID, which intentionally follows this pattern. To
fix this warning, add __maybe_unused to make it clear that this is
intentional depending on the configuration.

Fixes: bec3df930fbd ("drm/i915/gvt: Support PPGTT table load command")
Link: https://github.com/ClangBuiltLinux/linux/issues/1027
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index f776c92de8d7..0fb1df71c637 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -880,7 +880,7 @@ static void update_guest_pdps(struct intel_vgpu *vgpu,
 				gpa + i * 8, &pdp[7 - i], 4);
 }
 
-static bool
+static __maybe_unused bool
 check_shadow_context_ppgtt(struct execlist_ring_context *c, struct intel_vgpu_mm *m)
 {
 	if (m->ppgtt_mm.root_entry_type == GTT_TYPE_PPGTT_ROOT_L4_ENTRY) {

base-commit: bdecf38f228bcca73b31ada98b5b7ba1215eb9c9
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
