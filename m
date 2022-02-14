Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA04B5AC3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 20:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1993210E2EC;
	Mon, 14 Feb 2022 19:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D742B10E2D2;
 Mon, 14 Feb 2022 19:59:03 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 n19-20020a17090ade9300b001b9892a7bf9so243291pjv.5; 
 Mon, 14 Feb 2022 11:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O9KHV0/N+Gfd1GRgecao8wegxCnC38XHEZ75QGyEISc=;
 b=hosVhwFvGBdDFJM59PwgE1Wy9Oe3mkF9MnrGUFJ9FoiCAhftxx37tYIU9SOTBqcsD7
 wsSPNn3E0BoWvjzNAhs6aGwTAJpIfmq3ajNXqAsN6l9CR21k7REe7ZOUYKwd1ydYLUoC
 rI1fJy9gv3Jjz+5gQMh75lP41vSXjq/5PKYCvS9PPjL7bfHFKLInVSA9KdF4baDlCGcF
 W6P6zMRghtpvPi7xln6B39B/6mywe2eEhYl9L6bUnwoy0DxEN70P9DLeKGLpmwLmQiu/
 Ji5pdoom7+afBUJqEBm0RoPL4YBYxTGYzj2lmXtkG1ptnEHTAq5yfWaxNmDLkNFb4pyX
 1Sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O9KHV0/N+Gfd1GRgecao8wegxCnC38XHEZ75QGyEISc=;
 b=meWTITqmKivkDuhsa5FsIf2KZsogblXZPq+S4RHvSc5P8hjFGwkW3Ux0HoZBRGDLRw
 IXPczPwAYW3LlLneARIvMQN0FyElRkF31Juyw8T4QUD2M/fz0KvACn77JUtTyGey0ClA
 yyVydqrA4Baf7Oc4/KnciiHWfLUISxNaYbcRE8Qfk1zgrSa6V5JZ0Akdh3XEysLTAPI3
 7Nr2ioOHC1f7BZccdV6OfBqoLJdjvFnJ6l8Qo/EW7et/6pWQqS0MiHuzOTFwFJF93Wsd
 eb1MX/FbKRFHnv43z4ZOniCzLNjNFBT3Ewn/2oeVOtBmaA8kqWiKyuPgVeUdwv1m5uuE
 bZpg==
X-Gm-Message-State: AOAM5326/L+cGR83K/9hftNiA+WHJgJYIWbtqX6fIotI34gzp6ZCHK/D
 llmaKTWLCL05fC723gEz75k=
X-Google-Smtp-Source: ABdhPJzhIOI72ps9ZuG6CEVrnqdXFSMazidGQ6xcG6wA+W2GqdMXI1JFgJBqpJ/chzdS9CFqPj7wCg==
X-Received: by 2002:a17:90b:4d84:b0:1b9:4109:7118 with SMTP id
 oj4-20020a17090b4d8400b001b941097118mr263383pjb.119.1644868743175; 
 Mon, 14 Feb 2022 11:59:03 -0800 (PST)
Received: from tong-desktop.local
 (99-105-211-126.lightspeed.sntcca.sbcglobal.net. [99.105.211.126])
 by smtp.googlemail.com with ESMTPSA id v2sm14663291pjt.55.2022.02.14.11.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 11:59:02 -0800 (PST)
From: Tong Zhang <ztong0001@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH v2] drm/i915: fix build issue when using clang
Date: Mon, 14 Feb 2022 11:58:20 -0800
Message-Id: <20220214195821.29809-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YglQW7gVNoRJ7QpQ@dev-arch.archlinux-ax161>
References: <YglQW7gVNoRJ7QpQ@dev-arch.archlinux-ax161>
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
Cc: Tong Zhang <ztong0001@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm/i915 adds some extra cflags, namely -Wall, which causes
instances of -Wformat-security to appear when building with clang, even
though this warning is turned off kernel-wide in the main Makefile:

> drivers/gpu/drm/i915/gt/intel_gt.c:983:2: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
>         GEM_TRACE("ERROR\n");
>         ^~~~~~~~~~~~~~~~~~~~
> ./drivers/gpu/drm/i915/i915_gem.h:76:24: note: expanded from macro 'GEM_TRACE'
>  #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
>                        ^~~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/kernel.h:369:3: note: expanded from macro 'trace_printk'
>                 do_trace_printk(fmt, ##__VA_ARGS__);    \
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/kernel.h:383:30: note: expanded from macro 'do_trace_printk'
>                 __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
>                                           ^~~~~~~~~~~~~~~~
>drivers/gpu/drm/i915/gt/intel_gt.c:983:2: note: treat the string as an argument to avoid this

This does not happen with GCC because it does not enable
-Wformat-security with -Wall. Disable -Wformat-security within the i915
Makefile so that these warnings do not show up with clang.

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---

v2: revise commit message

 drivers/gpu/drm/i915/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 1b62b9f65196..c04e05a3d39f 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -13,6 +13,7 @@
 # will most likely get a sudden build breakage... Hopefully we will fix
 # new warnings before CI updates!
 subdir-ccflags-y := -Wall -Wextra
+subdir-ccflags-y += -Wno-format-security
 subdir-ccflags-y += -Wno-unused-parameter
 subdir-ccflags-y += -Wno-type-limits
 subdir-ccflags-y += -Wno-missing-field-initializers
-- 
2.25.1

