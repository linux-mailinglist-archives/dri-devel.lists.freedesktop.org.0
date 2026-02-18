Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CY3Md3ClWmNUgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 14:47:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE7E156D2E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 14:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B60110E5C8;
	Wed, 18 Feb 2026 13:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D849010E5C3;
 Wed, 18 Feb 2026 13:47:03 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 398093F213;
 Wed, 18 Feb 2026 14:47:00 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: linux-pci@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH v2 3/5] vgaarb: mark vga_get family as __must_check
Date: Wed, 18 Feb 2026 22:46:31 +0900
Message-ID: <20260218134633.461181-4-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218134633.461181-1-Simon.Richter@hogyros.de>
References: <20260217170419.236739-1-Simon.Richter@hogyros.de>
 <20260218134633.461181-1-Simon.Richter@hogyros.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,hogyros.de:mid,hogyros.de:email]
X-Rspamd-Queue-Id: 9DE7E156D2E
X-Rspamd-Action: no action

These functions can return an error, but some callers expect they don't,
and unconditionally access VGA registers afterwards and call vga_put.

Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
---
 include/linux/vgaarb.h | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
index 97129a1bbb7d..eed524c67c22 100644
--- a/include/linux/vgaarb.h
+++ b/include/linux/vgaarb.h
@@ -27,7 +27,8 @@ struct pci_dev;
 
 #ifdef CONFIG_VGA_ARB
 void vga_set_legacy_decoding(struct pci_dev *pdev, unsigned int decodes);
-int vga_get(struct pci_dev *pdev, unsigned int rsrc, int interruptible);
+int __must_check vga_get(struct pci_dev *pdev, unsigned int rsrc,
+			 int interruptible);
 void vga_put(struct pci_dev *pdev, unsigned int rsrc);
 struct pci_dev *vga_default_device(void);
 void vga_set_default_device(struct pci_dev *pdev);
@@ -39,8 +40,8 @@ static inline void vga_set_legacy_decoding(struct pci_dev *pdev,
 		unsigned int decodes)
 {
 };
-static inline int vga_get(struct pci_dev *pdev, unsigned int rsrc,
-		int interruptible)
+static inline int __must_check vga_get(struct pci_dev *pdev, unsigned int rsrc,
+				       int interruptible)
 {
 	return 0;
 }
@@ -74,8 +75,8 @@ static inline int vga_client_register(struct pci_dev *pdev,
  *
  * On success, release the VGA resource again with vga_put().
  */
-static inline int vga_get_interruptible(struct pci_dev *pdev,
-					unsigned int rsrc)
+static inline int __must_check vga_get_interruptible(struct pci_dev *pdev,
+						     unsigned int rsrc)
 {
 	return vga_get(pdev, rsrc, 1);
 }
@@ -89,8 +90,8 @@ static inline int vga_get_interruptible(struct pci_dev *pdev,
  *
  * On success, release the VGA resource again with vga_put().
  */
-static inline int vga_get_uninterruptible(struct pci_dev *pdev,
-					  unsigned int rsrc)
+static inline int __must_check vga_get_uninterruptible(struct pci_dev *pdev,
+						       unsigned int rsrc)
 {
 	return vga_get(pdev, rsrc, 0);
 }
-- 
2.47.3

