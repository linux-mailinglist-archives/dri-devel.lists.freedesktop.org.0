Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BB0B9DE79
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4914510E877;
	Thu, 25 Sep 2025 07:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="jnyhz+dV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 599 seconds by postgrey-1.36 at gabe;
 Wed, 24 Sep 2025 14:12:35 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628E610E72D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 14:12:35 +0000 (UTC)
Received: from petrov-tower.intra.ispras.ru (unknown [10.10.2.58])
 by mail.ispras.ru (Postfix) with ESMTPSA id 67E5B402837E;
 Wed, 24 Sep 2025 14:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 67E5B402837E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1758722553;
 bh=T0+3uqja+AcM3h5mmWLoH6MCphRpuvic80vfhVRNM+s=;
 h=From:To:Cc:Subject:Date:From;
 b=jnyhz+dVVoAGjN7Ld89McMTj9+MUNsLcickFRlb5ZL9rAlGNExS+L8tKJs4uhjeyG
 09A8bmFobZTnQZ1W4vXqaOiPltZjn3KJW8xBWMWvAM7DwAysMsMKyyb7bNujhxAvQX
 yjE/LDFUpap7RBzBeY6T7POH1g/VD51pvBY7xIGo=
From: Oleg Petrov <o.petrov@ispras.ru>
To: Julia Lawall <Julia.Lawall@inria.fr>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Oleg Petrov <o.petrov@ispras.ru>, Nicolas Palix <nicolas.palix@imag.fr>,
 cocci@inria.fr, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Vadim Mutilin <mutilin@ispras.ru>, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH] cocci: drm: report devm-allocated arguments and fields
Date: Wed, 24 Sep 2025 17:01:26 +0300
Message-Id: <20250924140126.23027-1-o.petrov@ispras.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 25 Sep 2025 07:47:05 +0000
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

Add two Coccinelle rules: (1) flag a devres-managed pointer
passed to a drm-init function, and (2) flag a devres-managed
pointer assigned to a field of drm-managed struct. The mismatch
of the lifespan between devres- and drm-managed memory can cause
a use-after-free error. The rules' have high confidence.

badarg: Report when a pointer to devres-managed memory is passed
   as the second argument to several drm_*_init* functions that
   (a) have such rule documented or (b) are some simple wrappers
   to such a function.

badarg2: The same, but pass the devm-allocated pointer through
   an intermediate variable before passing to a drm-init function.

badfield: Report when a devm-allocated pointer is assigned to a
   field of a drm-managed struct.

Found by Linux Verification Center (linuxtesting.org).

Signed-off-by: Oleg Petrov <o.petrov@ispras.ru>
---
v1: Among drivers/gpu/drm, Coccinelle finds 7 functions (b) that call
functions (a). I included 5 of those in the rule. I did not check other files.
The functions are the same for v6.1+.
Patch https://lore.kernel.org/all/20240216125040.8968-1-e.orlova@ispras.ru/
fixes such violations in stm module. badargs are obvious from diff,
and the badfield is fixed in first lines where ldev is allocated.
 .../coccinelle/api/drm_dont_devm_alloc.cocci  | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 scripts/coccinelle/api/drm_dont_devm_alloc.cocci

diff --git a/scripts/coccinelle/api/drm_dont_devm_alloc.cocci b/scripts/coccinelle/api/drm_dont_devm_alloc.cocci
new file mode 100644
index 000000000000..693977e98666
--- /dev/null
+++ b/scripts/coccinelle/api/drm_dont_devm_alloc.cocci
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-only
+///
+/// Find (1) devres-allocated (usually by devm_kzalloc) argument to drm_*_init
+/// functions or (2) assignment of devres-allocated pointer to a field of a drm-
+/// allocated struct (usually dev_private of drm_device). The mismatch of the
+/// lifespan between devres- and drm-managed memory can cause a use-after-free.
+//
+// Confidence: High
+// Copyright: (C) 2025 Oleg Petrov ISPRAS
+// Options: --no-includes --include-headers
+//
+
+virtual report
+virtual org
+
+// find devm-allocated (devres-managed) second arg for drm*init functions
+@badarg exists@
+position p;
+expression devm,e;
+@@
+// only devm_kzalloc is really used
+devm = \(devm_kzalloc\|devm_kcalloc\|devm_kmalloc\|devm_kmalloc_array\)(...);
+...
+// The kernel-doc comments (v6+) for these 5 functions
+// forbid them to use devm-allocated argument.
+( drm_connector_init
+| drm_crtc_init_with_planes
+| drm_connector_init_with_ddc
+| drm_encoder_init
+| drm_universal_plane_init
+// These are the wrappers found in drivers/gpu/drm/*.c
+// i.e. these call those above and just pass the second argument.
+| drm_bridge_connector_init
+| drm_crtc_init
+| drm_plane_init
+// drm_simple_display_pipe_init // does not apply
+| drm_simple_encoder_init
+| drm_writeback_connector_init
+// mipi_dbi_dev_init_with_formats // does not apply
+) ( e,<+...devm@p...+>,...)
+
+// same as above, but with an intermediate local variable
+@badarg2 exists@
+position p;
+expression devm,e;
+identifier vitm;
+@@
+// only devm_kzalloc is really used
+devm = \(devm_kzalloc\|devm_kcalloc\|devm_kmalloc\|devm_kmalloc_array\)(...);
+...
+vitm = <+...devm...+>;
+...
+// The kernel-doc comments (v6+) for these 5 functions
+// forbid them to use devm-allocated argument.
+( drm_connector_init
+| drm_crtc_init_with_planes
+| drm_connector_init_with_ddc
+| drm_encoder_init
+| drm_universal_plane_init
+// These are the wrappers found in drivers/gpu/drm/*.c
+// i.e. these call those above and just pass the second argument.
+| drm_bridge_connector_init
+| drm_crtc_init
+| drm_plane_init
+// drm_simple_display_pipe_init // does not apply
+| drm_simple_encoder_init
+| drm_writeback_connector_init
+// mipi_dbi_dev_init_with_formats // does not apply
+) ( e,<+...devm@p...+>,...)
+
+// find direct assignment of devres-managed memory to drm device
+@badfield exists@
+position p;
+expression drm,devm;
+identifier f;
+@@
+(
+drm = \(drm_dev_alloc\|drmm_kzalloc\|drmm_kcalloc\|drmm_kmalloc\|drmm_kmalloc_array\)(...);
+...
+devm = \(devm_kzalloc\|devm_kcalloc\|devm_kmalloc\|devm_kmalloc_array\)(...);
+|
+devm = \(devm_kzalloc\|devm_kcalloc\|devm_kmalloc\|devm_kmalloc_array\)(...);
+...
+drm = \(drm_dev_alloc\|drmm_kzalloc\|drmm_kcalloc\|drmm_kmalloc\|drmm_kmalloc_array\)(...);
+)
+...
+drm->f =@p <+...devm...+>;
+
+
+@script:python depends on report@
+p << badarg.p;
+@@
+msg = "WARNING devm-allocated argument in a drm-init; use drmm-init family (or drmm-alloc)."
+coccilib.report.print_report(p[0], msg)
+
+@script:python depends on org@
+p << badarg.p;
+@@
+msg = "WARNING devm-allocated argument in a drm-init; use drmm-init family (or drmm-alloc)."
+coccilib.org.print_report(p[0], msg)
+
+@script:python depends on report@
+p << badarg2.p;
+@@
+msg = "WARNING devm-allocated argument in a drm-init; use drmm-init family (or drmm-alloc)."
+coccilib.report.print_report(p[0], msg)
+
+@script:python depends on org@
+p << badarg2.p;
+@@
+msg = "WARNING devm-allocated argument in a drm-init; use drmm-init family (or drmm-alloc)."
+coccilib.org.print_report(p[0], msg)
+
+@script:python depends on report@
+p << badfield.p;
+@@
+msg = "WARNING devm-allocated field in a drmm-allocated struct; consider drmm-init family or use drmm-alloc."
+coccilib.report.print_report(p[0], msg)
+
+@script:python depends on org@
+p << badfield.p;
+@@
+msg = "WARNING devm-allocated field in a drmm-allocated struct; consider drmm-init family or use drmm-alloc."
+coccilib.org.print_report(p[0], msg)
-- 
2.34.1

