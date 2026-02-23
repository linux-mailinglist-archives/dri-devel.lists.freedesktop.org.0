Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Dl+A1linWksPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AAA183BDE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE69910E4F1;
	Tue, 24 Feb 2026 08:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="dVSoW8g1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973179.qiye.163.com (mail-m1973179.qiye.163.com
 [220.197.31.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1489310E3D2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 15:55:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 34b4045df;
 Mon, 23 Feb 2026 23:55:50 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Philipp Stanner <phasta@kernel.org>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 25/37] accel/qaic: Replace pci_alloc_irq_vectors() with
 pcim_alloc_irq_vectors()
Date: Mon, 23 Feb 2026 23:55:43 +0800
Message-Id: <1771862143-89507-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0a9c8b36cac509cckunm2c284481987e59
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhkdS1YdQ08ZHk1JT04dSkpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=dVSoW8g1lEI3HkEB6qjaZRW4c9soowDTVMHkEgroBTKM8VWjhfseLOy4FI+2x/5jgz6wXVSuPmsJzTmDFf8t6dvsXUHTIfS3IUSQZb6GGJNczS1QMpXh/6wXvRLfABeIRnWaceT/Xa5Qs0wpg7Yt8zpsK1EnLFn3P3UwG84f614=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=YC4f9L+xeX6KWxsvQnkRnBIDjAYLF8oj1n+EW/lf3qs=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Tue, 24 Feb 2026 08:33:17 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jeff.hugo@oss.qualcomm.com,m:ogabbay@kernel.org,m:linux-arm-msm@vger.kernel.org,m:bhelgaas@google.com,m:phasta@kernel.org,m:linux-pci@vger.kernel.org,m:shawn.lin@rock-chips.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shawn.lin@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,rock-chips.com:mid,rock-chips.com:dkim,rock-chips.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: A6AAA183BDE
X-Rspamd-Action: no action

pcim_enable_device() no longer automatically manages IRQ vectors via devres.
Drivers must now manually call pci_free_irq_vectors() for cleanup. Alternatively,
pcim_alloc_irq_vectors() should be used.

To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: linux-pci@vger.kernel.org
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/accel/qaic/qaic_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 4c70bd9..2b2e0c5 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -525,9 +525,9 @@ static int init_msi(struct qaic_device *qdev, struct pci_dev *pdev)
 	int i;
 
 	/* Managed release since we use pcim_enable_device */
-	ret = pci_alloc_irq_vectors(pdev, irq_count, irq_count, PCI_IRQ_MSI | PCI_IRQ_MSIX);
+	ret = pcim_alloc_irq_vectors(pdev, irq_count, irq_count, PCI_IRQ_MSI | PCI_IRQ_MSIX);
 	if (ret == -ENOSPC) {
-		ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
+		ret = pcim_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
 		if (ret < 0)
 			return ret;
 
-- 
2.7.4

