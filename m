Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHYYDVSelGmrFwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:59:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF83314E749
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255A910E522;
	Tue, 17 Feb 2026 16:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 387 seconds by postgrey-1.36 at gabe;
 Tue, 17 Feb 2026 16:58:53 UTC
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E5810E51E;
 Tue, 17 Feb 2026 16:58:53 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 4B16F3F204;
 Tue, 17 Feb 2026 17:52:25 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH 1/1] drm/i915: handle failure from vga_get
Date: Wed, 18 Feb 2026 01:51:02 +0900
Message-ID: <20260217165214.236482-2-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260217165214.236482-1-Simon.Richter@hogyros.de>
References: <20260217165214.236482-1-Simon.Richter@hogyros.de>
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
X-Spamd-Result: default: False [0.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[Simon.Richter@hogyros.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hogyros.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: AF83314E749
X-Rspamd-Action: no action

This function returns an error code. If that code is non-zero, VGA decoding
is undefined, and the lock counter has not been increased, so it is not valid
to access registers or call vga_put afterwards.

Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1824
---
 drivers/gpu/drm/i915/display/intel_vga.c | 29 ++++++++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index 6fc3e3702cb8..4118c451d53c 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -112,12 +112,17 @@ static bool intel_pci_bridge_set_vga(struct pci_dev *pdev, bool enable)
 	return old & PCI_BRIDGE_CTL_VGA;
 }
 
-static bool intel_vga_get(struct intel_display *display, bool mmio)
+static int __must_check intel_vga_get(struct intel_display *display,
+	bool mmio, bool *old_io_decode)
 {
 	struct pci_dev *pdev = to_pci_dev(display->drm->dev);
+	int err;
 
 	if (mmio)
-		return false;
+	{
+		*old_io_decode = false;
+		return 0;
+	}
 
 	/*
 	 * Bypass the VGA arbiter on the iGPU and just enable
@@ -131,9 +136,14 @@ static bool intel_vga_get(struct intel_display *display, bool mmio)
 	 * of how any other VGA routing bits are configured.
 	 */
 	if (display->platform.dgfx)
-		vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
+	{
+		err = vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
+		if (unlikely(err))
+			return err;
+	}
 
-	return intel_pci_set_io_decode(pdev, true);
+	*old_io_decode = intel_pci_set_io_decode(pdev, true);
+	return 0;
 }
 
 static void intel_vga_put(struct intel_display *display, bool io_decode, bool mmio)
@@ -175,6 +185,7 @@ void intel_vga_disable(struct intel_display *display)
 	bool io_decode;
 	u8 msr, sr1;
 	u32 tmp;
+	int err;
 
 	if (!intel_vga_decode_is_enabled(display)) {
 		drm_dbg_kms(display->drm, "VGA decode is disabled\n");
@@ -216,7 +227,15 @@ void intel_vga_disable(struct intel_display *display)
 			goto reset_vgacntr;
 	}
 
-	io_decode = intel_vga_get(display, mmio);
+	/* This should not fail, because vga_get will only report errors for
+	 * dGPUs that are unreachable via the bridge, and cannot be made
+	 * reachable either. We shouldn't even get here for this case, but if
+	 * we do, we assume that the bridge will also refuse future requests
+	 * to forward VGA accesses.
+	 */
+	err = intel_vga_get(display, mmio, &io_decode);
+	if (unlikely(err))
+		goto reset_vgacntr;
 
 	drm_WARN_ON(display->drm, !mmio && !intel_pci_has_vga_io_decode(pdev));
 
-- 
2.47.3

