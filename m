Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1E22FCB05
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 07:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD766E12E;
	Wed, 20 Jan 2021 06:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 348 seconds by postgrey-1.36 at gabe;
 Wed, 20 Jan 2021 06:34:11 UTC
Received: from condef-05.nifty.com (condef-05.nifty.com [202.248.20.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945376E12E;
 Wed, 20 Jan 2021 06:34:11 +0000 (UTC)
Received: from conuserg-10.nifty.com ([10.126.8.73])by condef-05.nifty.com
 with ESMTP id 10K6Oqeo016013; Wed, 20 Jan 2021 15:24:52 +0900
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net
 [126.26.94.251]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 10K6Nskv000951;
 Wed, 20 Jan 2021 15:23:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 10K6Nskv000951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611123835;
 bh=1JrYU8+EbJufEwrJi23/GxY2VE/PHExCTFg+NH0kfF8=;
 h=From:To:Cc:Subject:Date:From;
 b=pQthdvoM7RX8d6r5+I7dpdk0z0OAI33IVQgRjIYNHskv+uiNyGJRuaYkNrLCL61/v
 PKjMVOWdBkefCKjHqL7eLPuKNRBeigvyLUu9m/iE0YmLU1v0Cq64ziBBveazsCo328
 d5kqkp/shU4dAN3/kw3/68GjX+fxG8mYhy5rf2b1LPHT0vDXvCa1nxIht6eG3wqMjI
 keAY8LNL/CHObN8jK1Wyl5zTYc/oSQmAtBeHmIOlfvBQAsV3LNb5vs0cBztCYMCycL
 yBW4wbhvi2dDrjje4cLwUJP0ISPzWtXalHFW+OdG5kqvZ6YWf57o6VSDwFyLwRk/LV
 Bkv9fkAxAa7Pg==
X-Nifty-SrcIP: [126.26.94.251]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: use always-y instead of extra-y
Date: Wed, 20 Jan 2021 15:23:51 +0900
Message-Id: <20210120062351.3011786-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 David Airlie <airlied@linux.ie>, Jan Kiszka <jan.kiszka@siemens.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Kieran Bingham <kbingham@kernel.org>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As commit d0e628cd817f ("kbuild: doc: clarify the difference between
extra-y and always-y") explained, extra-y should be used for listing
the prerequsites of vmlinux. always-y is a better fix here.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/devicetree/bindings/Makefile |  8 ++++----
 drivers/gpu/drm/i915/Makefile              |  2 +-
 scripts/Makefile.lib                       | 10 +++++-----
 scripts/gdb/linux/Makefile                 |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 8f2b054bec5a..90fcad98984d 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -78,10 +78,10 @@ $(obj)/processed-schema.json: $(DT_SCHEMA_FILES) check_dtschema_version FORCE
 
 endif
 
-extra-$(CHECK_DT_BINDING) += processed-schema-examples.json
-extra-$(CHECK_DTBS) += processed-schema.json
-extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
-extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
+always-$(CHECK_DT_BINDING) += processed-schema-examples.json
+always-$(CHECK_DTBS)       += processed-schema.json
+always-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
+always-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
 
 # Hack: avoid 'Argument list too long' error for 'make clean'. Remove most of
 # build artifacts here before they are processed by scripts/Makefile.clean
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 6d9e81ea67f4..938221894d0c 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -294,7 +294,7 @@ no-header-test := \
 	gvt/mpt.h \
 	gvt/scheduler.h
 
-extra-$(CONFIG_DRM_I915_WERROR) += \
+always-$(CONFIG_DRM_I915_WERROR) += \
 	$(patsubst %.h,%.hdrtest, $(filter-out $(no-header-test), \
 		$(shell cd $(srctree)/$(src) && find * -name '*.h')))
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 4612a887f28e..b8e587a17dcc 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -64,12 +64,12 @@ always-y += $(userprogs-always-y) $(userprogs-always-m)
 
 # DTB
 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
-extra-y				+= $(dtb-y)
-extra-$(CONFIG_OF_ALL_DTBS)	+= $(dtb-)
+always-y			+= $(dtb-y)
+always-$(CONFIG_OF_ALL_DTBS)	+= $(dtb-)
 
 ifneq ($(CHECK_DTBS),)
-extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
-extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
+always-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
+always-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
 endif
 
 # Add subdir path
@@ -230,7 +230,7 @@ $(obj)/%: $(src)/%_shipped
 #	target: source(s) FORCE
 #		$(if_changed,ld/objcopy/gzip)
 #
-#	and add target to extra-y so that we know we have to
+#	and add target to 'targets' so that we know we have to
 #	read in the saved command line
 
 # Linking
diff --git a/scripts/gdb/linux/Makefile b/scripts/gdb/linux/Makefile
index 124755087510..13903073cbff 100644
--- a/scripts/gdb/linux/Makefile
+++ b/scripts/gdb/linux/Makefile
@@ -18,7 +18,7 @@ quiet_cmd_gen_constants_py = GEN     $@
 	$(CPP) -E -x c -P $(c_flags) $< > $@ ;\
 	sed -i '1,/<!-- end-c-headers -->/d;' $@
 
-extra-y += constants.py
+always-y += constants.py
 $(obj)/constants.py: $(src)/constants.py.in FORCE
 	$(call if_changed_dep,gen_constants_py)
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
