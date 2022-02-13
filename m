Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E024B39DB
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 07:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F4E10F2F7;
	Sun, 13 Feb 2022 06:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE85B10F2F7;
 Sun, 13 Feb 2022 06:51:34 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id c4so2417836pfl.7;
 Sat, 12 Feb 2022 22:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8jN3bHrs2SjohtF/Og+xdp1QXzW54h0HCo7HFf5/MZw=;
 b=eGO6WKGk4GF2G1wmSF6YwpVCyUpzoU7kgAHkt2OWvZscvoVLb2sotXMmB0JArmFkdH
 GZxv240kCgeHEhPXTYzUDow84izMIzZxlfxRqdHQ6poqNxgqd3SBEdZaBIbOt2VfzCOz
 WB90oXtyxZJqjWoJkG72qtck4qMxHp+GNv+NNlHkFfVAzLOP6WpCXganJp/d3GKhz3Yp
 dDQ2IWWdYJRDLLYVl86vEf0KIoDIv6kqdWbViLcQzUP/6utM0FpBiWqZQKW5fLsjZNxa
 AqbUxPohLLEDKau9zLqZLxyzAnQdLrzEjf/iAMJb2D4TcTY3N0qUMmOdvnfMu8pjio9Y
 a0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8jN3bHrs2SjohtF/Og+xdp1QXzW54h0HCo7HFf5/MZw=;
 b=sHrPkIwCfE5ZcONUxGpo5XNYMhvgPQMkvqtnFGXp6DcE32hB/E4b0d40/9w3u64q/Y
 ekKMlWnGltzW+Pxn4RjMYRQUqWu32D7b0fChPB84CsvsC1a4RdRUNwlos5Re4jzkQncV
 rV7A8S6YzTTbr7eVOwtYMnNunRKVswizANfsKEdn1GRPJPlRoobFuA04+O/gI2qK8JdY
 NTUepk4xqsNRMZ2ekLW1s2BSWtZNLbJIFJFbEOus+lCi7FNsiH5znf1Cydc72xSoKc+b
 3Zho91B3gcjri/CfJQIq7WLDSTsVSLk1gQ6rAzJsi4M4FBnDSSh8EszRfjHI2bsEI7qN
 3tiw==
X-Gm-Message-State: AOAM531UlFFv0A8V6SFiM0XMVV2eAQVt0j46eHDdjZpl9McC4PHaOiip
 xjvUYfsggjeMw8ybpxWDj8Q=
X-Google-Smtp-Source: ABdhPJzJFjlAe/vGkkjEE8ukKoZrPMom+3E9OHjTtQHdOrydJ0vW9rr7l+VrgOEHXNJQZysF9XqUjQ==
X-Received: by 2002:a63:d318:: with SMTP id b24mr7253607pgg.255.1644735094326; 
 Sat, 12 Feb 2022 22:51:34 -0800 (PST)
Received: from ubuntu-server.local
 (99-105-211-126.lightspeed.sntcca.sbcglobal.net. [99.105.211.126])
 by smtp.googlemail.com with ESMTPSA id v2sm9794515pjt.55.2022.02.12.22.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 22:51:34 -0800 (PST)
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
Subject: [PATCH] drm/i915: fix build issue when using clang
Date: Sat, 12 Feb 2022 22:51:06 -0800
Message-Id: <20220213065106.48062-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
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

drm/i915 target adds some extra cflags, especially it does re-apply -Wall.
In clang this will override -Wno-format-security and cause the build to
fail when CONFIG_DRM_I915_WERROR=y. While with GCC this does not happen.
We reapply -Wno-format-security here to get around this issue.

drivers/gpu/drm/i915/gt/intel_gt.c:983:2: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        GEM_TRACE("ERROR\n");
        ^~~~~~~~~~~~~~~~~~~~
./drivers/gpu/drm/i915/i915_gem.h:76:24: note: expanded from macro 'GEM_TRACE'
 #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/kernel.h:369:3: note: expanded from macro 'trace_printk'
                do_trace_printk(fmt, ##__VA_ARGS__);    \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/kernel.h:383:30: note: expanded from macro 'do_trace_printk'
                __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
                                           ^~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/gt/intel_gt.c:983:2: note: treat the string as an argument to avoid this

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
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

