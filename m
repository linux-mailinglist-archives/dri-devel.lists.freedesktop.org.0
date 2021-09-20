Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD67411674
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 16:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D096E505;
	Mon, 20 Sep 2021 14:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE58F6E507
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:10:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 47AC0200DC;
 Mon, 20 Sep 2021 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632147053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/MscUZ8zYse27OkX0a1P8ZDlHrlQZMF/IcTTGKupVE=;
 b=cfpIpfknrHqPyfw8aDF46jcLiMoE6uv+EbIbhJTpOPG4aww661RatnL2flO/EGeS3X2i2B
 qUAihD4OFXl3xWV3tr0hOyxn/fF+f1bKXuu6cDTAGYeUwNdI3CVytob4pwn2mLJgUK8O2j
 yZA7dIV3ZoW1YhsP+i4EAg/qngNzjgw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632147053;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/MscUZ8zYse27OkX0a1P8ZDlHrlQZMF/IcTTGKupVE=;
 b=JYmjgjXLGy4K8lPp1gLmAaOtxZrzaqLth/Jv6wimgZfq01i6Em0USvZktyO3wk3cTnLi3E
 dIcVI03AahSYTeDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 27564143AD;
 Mon, 20 Sep 2021 14:10:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oON9CG2WSGG0cgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Sep 2021 14:10:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/5] drm/gma500: Disable PCI device during shutdown
Date: Mon, 20 Sep 2021 16:10:48 +0200
Message-Id: <20210920141051.30988-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920141051.30988-1-tzimmermann@suse.de>
References: <20210920141051.30988-1-tzimmermann@suse.de>
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

Use managed disablement of PCI devices via pcim_device_enable().
Disables the PCI device and simplifies error rollback in probe
function.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/psb_drv.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 05f42e66af86..80ef2f0562c3 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -448,15 +448,13 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct drm_device *dev;
 	int ret;
 
-	ret = pci_enable_device(pdev);
+	ret = pcim_enable_device(pdev);
 	if (ret)
 		return ret;
 
 	dev = drm_dev_alloc(&driver, &pdev->dev);
-	if (IS_ERR(dev)) {
-		ret = PTR_ERR(dev);
-		goto err_pci_disable_device;
-	}
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
 
 	pci_set_drvdata(pdev, dev);
 
@@ -474,8 +472,6 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	psb_driver_unload(dev);
 err_drm_dev_put:
 	drm_dev_put(dev);
-err_pci_disable_device:
-	pci_disable_device(pdev);
 	return ret;
 }
 
-- 
2.33.0

