Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHVwFwZirGkPpQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 18:36:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED8A22D056
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 18:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299A710E361;
	Sat,  7 Mar 2026 17:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267CF10E1CD;
 Sat,  7 Mar 2026 17:36:00 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 7E3633F51E;
 Sat,  7 Mar 2026 18:35:57 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: linux-pci@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH v3 2/5] vgaarb: pass errors from pci_set_vga_state() up
Date: Sun,  8 Mar 2026 02:35:35 +0900
Message-ID: <20260307173538.763188-3-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260307173538.763188-1-Simon.Richter@hogyros.de>
References: <20260307173538.763188-1-Simon.Richter@hogyros.de>
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
X-Rspamd-Queue-Id: 2ED8A22D056
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
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Simon.Richter@hogyros.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.096];
	TAGGED_RCPT(0.00)[dri-devel];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hogyros.de:mid,hogyros.de:email]
X-Rspamd-Action: no action

pci_set_vga_state() returns an error code, which so far has been ignored by
the only caller, __vga_tryget(), so forward it to the caller. As the return
type of __vga_tryget() is a pointer, wrap the error in ERR_PTR().

Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
---
 drivers/pci/vgaarb.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 22b2b6ebdefd..c360eee11dd9 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -215,6 +215,7 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 	struct vga_device *conflict;
 	unsigned int pci_bits;
 	u32 flags = 0;
+	int err;
 
 	/*
 	 * Account for "normal" resources to lock. If we decode the legacy,
@@ -307,7 +308,9 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 		if (change_bridge)
 			flags |= PCI_VGA_STATE_CHANGE_BRIDGE;
 
-		pci_set_vga_state(conflict->pdev, false, pci_bits, flags);
+		err = pci_set_vga_state(conflict->pdev, false, pci_bits, flags);
+		if (err)
+			return ERR_PTR(err);
 		conflict->owns &= ~match;
 
 		/* If we disabled normal decoding, reflect it in owns */
@@ -337,7 +340,9 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 	if (wants & VGA_RSRC_LEGACY_MASK)
 		flags |= PCI_VGA_STATE_CHANGE_BRIDGE;
 
-	pci_set_vga_state(vgadev->pdev, true, pci_bits, flags);
+	err = pci_set_vga_state(vgadev->pdev, true, pci_bits, flags);
+	if (err)
+		return ERR_PTR(err);
 
 	vgadev->owns |= wants;
 lock_them:
@@ -455,6 +460,10 @@ int vga_get(struct pci_dev *pdev, unsigned int rsrc, int interruptible)
 		}
 		conflict = __vga_tryget(vgadev, rsrc);
 		spin_unlock_irqrestore(&vga_lock, flags);
+		if (IS_ERR(conflict)) {
+			rc = PTR_ERR(conflict);
+			break;
+		}
 		if (conflict == NULL)
 			break;
 
-- 
2.47.3

