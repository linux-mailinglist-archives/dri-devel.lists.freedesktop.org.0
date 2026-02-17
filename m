Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OSFIbSflGknGAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 18:04:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBFA14E7E9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 18:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89A210E523;
	Tue, 17 Feb 2026 17:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14CC10E52B;
 Tue, 17 Feb 2026 17:04:46 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 176873F206;
 Tue, 17 Feb 2026 18:04:43 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: linux-pci@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH 2/5] vgaarb: pass errors from pci_set_vga_state up
Date: Wed, 18 Feb 2026 02:04:16 +0900
Message-ID: <20260217170419.236739-3-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260217170419.236739-1-Simon.Richter@hogyros.de>
References: <20260217170419.236739-1-Simon.Richter@hogyros.de>
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
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[Simon.Richter@hogyros.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hogyros.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5DBFA14E7E9
X-Rspamd-Action: no action

pci_set_vga_state returns an error code, which so far has been ignored. Pass
this code through __vga_tryget (via ERR_PTR).

Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
---
 drivers/pci/vgaarb.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 5c2719cb1bfa..322c028539f0 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -215,6 +215,7 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 	struct vga_device *conflict;
 	unsigned int pci_bits;
 	u32 flags = 0;
+	int err = 0;
 
 	/*
 	 * Account for "normal" resources to lock. If we decode the legacy,
@@ -307,7 +308,9 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 		if (change_bridge)
 			flags |= PCI_VGA_STATE_CHANGE_BRIDGE;
 
-		pci_set_vga_state(conflict->pdev, false, pci_bits, flags);
+		err = pci_set_vga_state(conflict->pdev, false, pci_bits, flags);
+		if (unlikely(err))
+			return ERR_PTR(err);
 		conflict->owns &= ~match;
 
 		/* If we disabled normal decoding, reflect it in owns */
@@ -337,7 +340,9 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 	if (wants & VGA_RSRC_LEGACY_MASK)
 		flags |= PCI_VGA_STATE_CHANGE_BRIDGE;
 
-	pci_set_vga_state(vgadev->pdev, true, pci_bits, flags);
+	err = pci_set_vga_state(vgadev->pdev, true, pci_bits, flags);
+	if (unlikely(err))
+		return ERR_PTR(err);
 
 	vgadev->owns |= wants;
 lock_them:
@@ -455,6 +460,11 @@ int vga_get(struct pci_dev *pdev, unsigned int rsrc, int interruptible)
 		}
 		conflict = __vga_tryget(vgadev, rsrc);
 		spin_unlock_irqrestore(&vga_lock, flags);
+		if (IS_ERR(conflict))
+		{
+			rc = PTR_ERR(conflict);
+			break;
+		}
 		if (conflict == NULL)
 			break;
 
-- 
2.47.3

