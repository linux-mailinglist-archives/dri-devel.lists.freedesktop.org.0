Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E16A2AdmGnp/wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:37:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE8D165CF1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D515B10E7EC;
	Fri, 20 Feb 2026 08:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="UowcRtqo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1421510E7E9;
 Fri, 20 Feb 2026 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1771576666;
 bh=VBco7zVB9VTaGgt3tIx7GWoTZdb6hMaqwzco395EbzY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UowcRtqovuImaK2Jkc1EvmNPZ+17LmsPylMzA+5fL6T5z1sw38RYQ9fif8TF3b3h4
 mIFP9/G+0Nlhw7m2Gbl1dRBcZHvWuD+lxYHsap3cNDE8vSZ8LtnQNDBiEt4pCXSeP0
 O/hEbQlZq7kBrYJjRqNz/bhOO4pa2fDHCF90DdwV4cllOzcaEQL4ccnUyap563hoxw
 KJMwqNG84d9+DH9zjD7xkvitx0G2NskG0IMJ776kwW3Wm+jq/wzPRD/Sb5yFeVNBli
 2JtVH4Ch3JnNWTk8bRNaNaVJoCxnCrl7gW7G9SPvOEpLgofq+bZ/RB8XZXwgLF0ow/
 wuEjRVLi1+S6g==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [i915-rt v6 23/24] PREEMPT_RT injection
Date: Fri, 20 Feb 2026 09:37:21 +0100
Message-ID: <20260220083657.28815-49-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220083657.28815-26-dev@lankhorst.se>
References: <20260220083657.28815-26-dev@lankhorst.se>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lankhorst.se,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lankhorst.se:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dev@lankhorst.se,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lankhorst.se:+];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CDE8D165CF1
X-Rspamd-Action: no action

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/Kconfig.debug | 15 ---------------
 drivers/gpu/drm/xe/Kconfig.debug   |  5 +++++
 kernel/Kconfig.preempt             |  4 ++--
 3 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 3562a02ef7adc..0ab10ff41e38d 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -233,21 +233,6 @@ config DRM_I915_LOW_LEVEL_TRACEPOINTS
 
 	  If in doubt, say "N".
 
-config DRM_I915_DEBUG_VBLANK_EVADE
-	bool "Enable extra debug warnings for vblank evasion"
-	depends on DRM_I915
-	default n
-	help
-	  Choose this option to turn on extra debug warnings for the
-	  vblank evade mechanism. This gives a warning every time the
-	  the deadline allotted for the vblank evade critical section
-	  is exceeded, even if there isn't an actual risk of missing
-	  the vblank.
-
-	  Recommended for driver developers only.
-
-	  If in doubt, say "N".
-
 config DRM_I915_DEBUG_RUNTIME_PM
 	bool "Enable extra state checking for runtime PM"
 	depends on DRM_I915
diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 01227c77f6d70..1d5f11c6e88f3 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -30,6 +30,11 @@ config DRM_XE_DEBUG
 
 	  If in doubt, say "N".
 
+config DRM_I915_DEBUG_VBLANK_EVADE
+        def_bool y
+        depends on DRM_XE
+
+
 config DRM_XE_DEBUG_VM
 	bool "Enable extra VM debugging info"
 	default n
diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index da326800c1c9b..68a6d42c55abe 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -87,9 +87,9 @@ config PREEMPT_LAZY
 endchoice
 
 config PREEMPT_RT
-	bool "Fully Preemptible Kernel (Real-Time)"
-	depends on EXPERT && ARCH_SUPPORTS_RT && !COMPILE_TEST
+	def_bool y
 	select PREEMPTION
+	depends on ARCH_SUPPORTS_RT
 	help
 	  This option turns the kernel into a real-time kernel by replacing
 	  various locking primitives (spinlocks, rwlocks, etc.) with
-- 
2.51.0

