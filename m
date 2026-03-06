Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDRKN0HvqmncYwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 16:14:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542B0223961
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 16:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E8B10E3D8;
	Fri,  6 Mar 2026 15:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B0110E3ED;
 Fri,  6 Mar 2026 15:14:05 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 13D6D3F1E5;
 Fri,  6 Mar 2026 16:14:02 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH v3 1/1] drm/i915: handle failure from vga_get_uninterruptible()
Date: Sat,  7 Mar 2026 00:13:16 +0900
Message-ID: <20260306151347.758836-1-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218131131.460105-1-Simon.Richter@hogyros.de>
References: <20260218131131.460105-1-Simon.Richter@hogyros.de>
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
X-Rspamd-Queue-Id: 542B0223961
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[hogyros.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Simon.Richter@hogyros.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.218];
	TAGGED_RCPT(0.00)[dri-devel];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,gitlab.freedesktop.org:url,hogyros.de:mid,hogyros.de:email]
X-Rspamd-Action: no action

The vga_get_uninterruptible() function can return an error if it fails to
set up VGA decoding for the requested device.

If VGA decoding is unavailable, we don't need to be careful to leave the
VGA emulation in a usable state, as vgacon will also be unable to get
access later on, so just skip over the VGA accesses and the vga_put() call
matching the failed vga_get_uninterruptible().

Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1824
---
 drivers/gpu/drm/i915/display/intel_vga.c | 33 +++++++++++++++++++-----
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index 6fc3e3702cb8..9832a4ade318 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -112,12 +112,16 @@ static bool intel_pci_bridge_set_vga(struct pci_dev *pdev, bool enable)
 	return old & PCI_BRIDGE_CTL_VGA;
 }
 
-static bool intel_vga_get(struct intel_display *display, bool mmio)
+static int intel_vga_get(struct intel_display *display, bool mmio,
+			 bool *old_io_decode)
 {
 	struct pci_dev *pdev = to_pci_dev(display->drm->dev);
+	int err;
 
-	if (mmio)
-		return false;
+	if (mmio) {
+		*old_io_decode = false;
+		return 0;
+	}
 
 	/*
 	 * Bypass the VGA arbiter on the iGPU and just enable
@@ -130,10 +134,15 @@ static bool intel_vga_get(struct intel_display *display, bool mmio)
 	 * grab any VGA IO access when IO decode is enabled, regardless
 	 * of how any other VGA routing bits are configured.
 	 */
-	if (display->platform.dgfx)
-		vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
+	if (display->platform.dgfx) {
+		err = vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
+		if (err)
+			return err;
+	}
+
+	*old_io_decode = intel_pci_set_io_decode(pdev, true);
 
-	return intel_pci_set_io_decode(pdev, true);
+	return 0;
 }
 
 static void intel_vga_put(struct intel_display *display, bool io_decode, bool mmio)
@@ -175,6 +184,7 @@ void intel_vga_disable(struct intel_display *display)
 	bool io_decode;
 	u8 msr, sr1;
 	u32 tmp;
+	int err;
 
 	if (!intel_vga_decode_is_enabled(display)) {
 		drm_dbg_kms(display->drm, "VGA decode is disabled\n");
@@ -216,7 +226,16 @@ void intel_vga_disable(struct intel_display *display)
 			goto reset_vgacntr;
 	}
 
-	io_decode = intel_vga_get(display, mmio);
+	/*
+	 * This should not fail, because the vga_get() family of functions
+	 * will only report errors for dGPUs that are unreachable via the
+	 * bridge, and cannot be made reachable either. We shouldn't even
+	 * get here for this case, but if we do, we assume that the bridge
+	 * will also refuse future requests to forward VGA accesses.
+	 */
+	err = intel_vga_get(display, mmio, &io_decode);
+	if (err)
+		goto reset_vgacntr;
 
 	drm_WARN_ON(display->drm, !mmio && !intel_pci_has_vga_io_decode(pdev));
 
-- 
2.47.3

