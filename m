Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC1740E9B3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 20:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F89D6E909;
	Thu, 16 Sep 2021 18:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097E66E821
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:16:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 36002223E4;
 Thu, 16 Sep 2021 18:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631816164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMdYSH8yHZ1KdMOhwOuuE+SL6YgkkXhlg3PLd/C/J7I=;
 b=xiXdyMWyIZhzyai4Dle9GImcw6OLbUV9wcSdAhL9We20zQoEiE6aV7zY3aLtnvIDGckiFS
 ndybaEFZLsucNIWdlfH8TfSeJKkZ0Ri7B2Tmh/ldrcCeo8EcFrd96nuwSGZKxNY3vwvcyd
 UTQa9hwRxzMpw55XTCQ64lkR+ZDVE6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631816164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMdYSH8yHZ1KdMOhwOuuE+SL6YgkkXhlg3PLd/C/J7I=;
 b=Y4XSCKyYoBbKGiL4dQ6LY5T/sKsvhySvG1O14vD2n8HEwCH5f3i890wBHUm6u/LhThd7j0
 LDN0Ht9ZXQ79xWBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E9AE113F79;
 Thu, 16 Sep 2021 18:16:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4HwaOOOJQ2FleQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Sep 2021 18:16:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch, hdegoede@redhat.com,
 marcan@marcan.st, maz@kernel.org, akpm@linux-foundation.org,
 npiggin@gmail.com, thunder.leizhen@huawei.com, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/5] lib: devres: Add managed arch_phys_wc_add()
Date: Thu, 16 Sep 2021 20:15:57 +0200
Message-Id: <20210916181601.9146-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916181601.9146-1-tzimmermann@suse.de>
References: <20210916181601.9146-1-tzimmermann@suse.de>
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

Add devm_arch_phys_wc_add() as managed wrapper around arch_phys_wc_add().
Useful for several grahpics drivers that set framebuffer memory to write
combining.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/io.h |  2 ++
 lib/devres.c       | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/linux/io.h b/include/linux/io.h
index 9595151d800d..fcd8ea79c5df 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -132,6 +132,8 @@ static inline int arch_phys_wc_index(int handle)
 #endif
 #endif
 
+int devm_arch_phys_wc_add(struct device *dev, unsigned long base, unsigned long size);
+
 enum {
 	/* See memremap() kernel-doc for usage description... */
 	MEMREMAP_WB = 1 << 0,
diff --git a/lib/devres.c b/lib/devres.c
index b0e1c6702c71..24d4d849ff67 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -528,3 +528,39 @@ void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
 }
 EXPORT_SYMBOL(pcim_iounmap_regions);
 #endif /* CONFIG_PCI */
+
+static void devm_arch_phys_ac_add_release(struct device *dev, void *res)
+{
+	arch_phys_wc_del(*((int *)res));
+}
+
+/**
+ * devm_arch_phys_wc_add - Managed arch_phys_wc_add()
+ * @dev: Managed device
+ * @base: Memory base address
+ * @size: Size of memory range
+ *
+ * Adds a WC MTRR using arch_phys_wc_add() and sets up a release callback.
+ * See arch_phys_wc_add() for more information.
+ */
+int devm_arch_phys_wc_add(struct device *dev, unsigned long base, unsigned long size)
+{
+	int *mtrr;
+	int ret;
+
+	mtrr = devres_alloc(devm_arch_phys_ac_add_release, sizeof(*mtrr), GFP_KERNEL);
+	if (!mtrr)
+		return -ENOMEM;
+
+	ret = arch_phys_wc_add(base, size);
+	if (ret < 0) {
+		devres_free(mtrr);
+		return ret;
+	}
+
+	*mtrr = ret;
+	devres_add(dev, mtrr);
+
+	return ret;
+}
+EXPORT_SYMBOL(devm_arch_phys_wc_add);
-- 
2.33.0

