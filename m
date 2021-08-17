Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1173EF624
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 01:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B0B6E0B6;
	Tue, 17 Aug 2021 23:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBC66E0B6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:34:01 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id n18so311601pgm.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 16:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U7L3iTWvFeKzQZgTZBYuu/YUTifINCL6rloAW56Sueo=;
 b=cPp2q0zHkABpipQd22hctmFNb7d5XbI+Yr3Wlui5lS+wNCEbWm/jrfXi0SsdGkBZBy
 kNssaBUvlpSA0/3d93mjdylrN5wWJseywhns0H7+ifqop3z0yYCoyXaVYc27vt5J9Ds3
 nt5pbnKJXlIMO21n4RDSIsciO8SCbBSNS7TTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U7L3iTWvFeKzQZgTZBYuu/YUTifINCL6rloAW56Sueo=;
 b=OyCAMn7pcnaL7sWPWatq3zsOJdqkNJPtZnU794PxAQ12SooPezxkV6gG2k+5bE4Irj
 HepzOv+r8q2PVJaadG1YjLHei6UOBaqG3VQIYwPOsAXjlH0QWUN8zIfsG2sG3APp4BnD
 W4oy2Qqo8I2n6cDW9y9DiN/em8h5s0GNf2i1vVoUINlyNwwEVdRNJlfY9M680ve7kUF5
 3UZS0i9g3mj8wwPywnNgb9kpsdv6e1jgNLGNH/8/wdGeVj4YGA8tbpGiDAL0kSG7DrUS
 pfJcsSifJ5f6q9xU2yC02z/hF2FuaUFxueCx1A1jB6efVsWR/LZQcoWCQQbAMnJ2sUFO
 322Q==
X-Gm-Message-State: AOAM533Ts+x24g0Z68AivzqbJqKUPLMtb+8zKh569INkU+DSeV9NCIVm
 1qQfC3UthzGGPeoS32IP6BnEoQ==
X-Google-Smtp-Source: ABdhPJwVvsgK+hN0mp/hLlJbbqFVCT2WxxErPND+/Sl/VFpa9RiNVt/B5g+/R+LAhv4DvpsXm+AQsA==
X-Received: by 2002:a63:2242:: with SMTP id t2mr5640643pgm.111.1629243241066; 
 Tue, 17 Aug 2021 16:34:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y7sm3788896pfp.102.2021.08.17.16.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 16:34:00 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kees Cook <keescook@chromium.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH] drm/i915: Use designated initializers for init/exit table
Date: Tue, 17 Aug 2021 16:33:57 -0700
Message-Id: <20210817233357.2379455-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931; h=from:subject;
 bh=3vefYKepCH02DY2DFMy76mE6JeEwlcTf4QCOk25BRc0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHEdkZjQOgOcHFIG7gF74UWCI9mpEXduXimK17i4O
 f9S9xD+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRxHZAAKCRCJcvTf3G3AJpt9D/
 46cS4zE4GyL48YH64ZVHHu+vSCMZ2y9ICvz089nWWd/xC4nutt6TlTaruazmMWEss5CvmhZWdTZ0is
 hUCdS2mBn+tTmXFbT5vR/xCCvWrdN6eFjAEyyO2ZrkuT0Csvqs+DW0lCicQBEucdXVW9isU/dHAySO
 isr77QjyRyhSlNv853518QUz/bFHgVemcpboADt2OlpqUvC5G9GvpnHwMUFL2iwjoahaCZCGPUHoaK
 bvWo0G9IGnDjStnkcELfukZV4gjvDFhsR5Q5VSaJsadxPY2WsLuzqbeX4dmrI0JZd+fxhHqPZN4MNu
 Eoc/E2fKXWiq3LZFmOnvVuHbqf0NjS/cqNmxqeIHjfOFZOhsz0FQ42KGxAaeVPUpMk0/LsYCbvdJkS
 VVyVu/+7PA47JMxssJKToB1dQ/gOW9oiLCERNabEitMIhTq9LNZNU9VbL+dytwtiO56Aoun3duHPXi
 KCc2NM58GIzsrDIhx6rCojc0WgDRcZO6TLaXLqJTDKfl6u7v4zlEKP5vcdABZmQ00527ztYj0bEpzP
 Gx1o7zty6fN0A0iE7gtlV8x2VDVPqf9QqaHloNpQ/+unWH7hm2q0xEuEjaGFGiwxmEdod1KGYiUweF
 UND6SwTy0VwD95qAni9oQqS6YuocTdb8Akr2DyQHfLz0tnFXUhj3ugA4IT4Q==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

The kernel builds with -Werror=designated-init, and __designated_init
is used by CONFIG_GCC_PLUGIN_RANDSTRUCT for automatically selected (all
function pointer) structures. Include the field names in the init/exit
table. Avoids warnings like:

drivers/gpu/drm/i915/i915_module.c:59:4: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Fixes: a04ea6ae7c67 ("drm/i915: Use a table for i915_init/exit (v2)")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/i915/i915_module.c | 37 +++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
index c578ea8f56a0..d8b4482c69d0 100644
--- a/drivers/gpu/drm/i915/i915_module.c
+++ b/drivers/gpu/drm/i915/i915_module.c
@@ -47,19 +47,30 @@ static const struct {
    int (*init)(void);
    void (*exit)(void);
 } init_funcs[] = {
-	{ i915_check_nomodeset, NULL },
-	{ i915_active_module_init, i915_active_module_exit },
-	{ i915_buddy_module_init, i915_buddy_module_exit },
-	{ i915_context_module_init, i915_context_module_exit },
-	{ i915_gem_context_module_init, i915_gem_context_module_exit },
-	{ i915_objects_module_init, i915_objects_module_exit },
-	{ i915_request_module_init, i915_request_module_exit },
-	{ i915_scheduler_module_init, i915_scheduler_module_exit },
-	{ i915_vma_module_init, i915_vma_module_exit },
-	{ i915_mock_selftests, NULL },
-	{ i915_pmu_init, i915_pmu_exit },
-	{ i915_register_pci_driver, i915_unregister_pci_driver },
-	{ i915_perf_sysctl_register, i915_perf_sysctl_unregister },
+	{ .init = i915_check_nomodeset },
+	{ .init = i915_active_module_init,
+	  .exit = i915_active_module_exit },
+	{ .init = i915_buddy_module_init,
+	  .exit = i915_buddy_module_exit },
+	{ .init = i915_context_module_init,
+	  .exit = i915_context_module_exit },
+	{ .init = i915_gem_context_module_init,
+	  .exit = i915_gem_context_module_exit },
+	{ .init = i915_objects_module_init,
+	  .exit = i915_objects_module_exit },
+	{ .init = i915_request_module_init,
+	  .exit = i915_request_module_exit },
+	{ .init = i915_scheduler_module_init,
+	  .exit = i915_scheduler_module_exit },
+	{ .init = i915_vma_module_init,
+	  .exit = i915_vma_module_exit },
+	{ .init = i915_mock_selftests },
+	{ .init = i915_pmu_init,
+	  .exit = i915_pmu_exit },
+	{ .init = i915_register_pci_driver,
+	  .exit = i915_unregister_pci_driver },
+	{ .init = i915_perf_sysctl_register,
+	  .exit = i915_perf_sysctl_unregister },
 };
 static int init_progress;
 
-- 
2.30.2

