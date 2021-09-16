Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2E640E9B2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 20:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6EA6E57E;
	Thu, 16 Sep 2021 18:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD216E57E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:16:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7C323223E7;
 Thu, 16 Sep 2021 18:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631816164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X5jWyntKao/5/t7BXjsuPe0qf6PhsdqVWHUX41cSqV8=;
 b=QsDxTcWUPVm71MKVOp7upKy5w7yLwFyodAu5vullxKqogX6yF5N7NLP0+dastxIeF586R9
 7tH7so5zuV6tEBNwFksuIR9JvjMRNc/+dlrr9HS4CsZ8r5Q9S2L0maAZzR2Hg2HvTP/TX7
 x4ACZS26Y1xeyP7bPDtsHjY41d5l0sw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631816164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X5jWyntKao/5/t7BXjsuPe0qf6PhsdqVWHUX41cSqV8=;
 b=um+qbOU96VBrhaTdUOJ+9+MdC0Xzkhfdu8X1tob+24YQ6wNX+yhwSCC4WuGllx4yrf8Xo+
 xuRYRjjGztnhqbDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CADD13D67;
 Thu, 16 Sep 2021 18:16:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wEPaDeSJQ2FleQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Sep 2021 18:16:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch, hdegoede@redhat.com,
 marcan@marcan.st, maz@kernel.org, akpm@linux-foundation.org,
 npiggin@gmail.com, thunder.leizhen@huawei.com, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/5] lib: devres: Add managed arch_io_reserve_memtype_wc()
Date: Thu, 16 Sep 2021 20:15:58 +0200
Message-Id: <20210916181601.9146-3-tzimmermann@suse.de>
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

Add devm_arch_io_reserve_memtype_wc() as managed wrapper around
arch_io_reserve_memtype_wc(). Useful for several grahpics drivers
that set framebuffer memory to write combining.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/io.h |  3 +++
 lib/devres.c       | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/include/linux/io.h b/include/linux/io.h
index fcd8ea79c5df..5fc800390fe4 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -168,4 +168,7 @@ static inline void arch_io_free_memtype_wc(resource_size_t base,
 }
 #endif
 
+int devm_arch_io_reserve_memtype_wc(struct device *dev, resource_size_t start,
+				    resource_size_t size);
+
 #endif /* _LINUX_IO_H */
diff --git a/lib/devres.c b/lib/devres.c
index 24d4d849ff67..14664bbb4875 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -564,3 +564,49 @@ int devm_arch_phys_wc_add(struct device *dev, unsigned long base, unsigned long
 	return ret;
 }
 EXPORT_SYMBOL(devm_arch_phys_wc_add);
+
+struct arch_io_reserve_memtype_wc_devres {
+	resource_size_t start;
+	resource_size_t size;
+};
+
+static void devm_arch_io_free_memtype_wc_release(struct device *dev, void *res)
+{
+	const struct arch_io_reserve_memtype_wc_devres *this = res;
+
+	arch_io_free_memtype_wc(this->start, this->size);
+}
+
+/**
+ * devm_arch_io_reserve_memtype_wc - Managed arch_io_reserve_memtype_wc()
+ * @dev: Managed device
+ * @start: Memory base address
+ * @size: Size of memory range
+ *
+ * Reserves a memory range with WC caching using arch_io_reserve_memtype_wc()
+ * and sets up a release callback See arch_io_reserve_memtype_wc() for more
+ * information.
+ */
+int devm_arch_io_reserve_memtype_wc(struct device *dev, resource_size_t start,
+				    resource_size_t size)
+{
+	struct arch_io_reserve_memtype_wc_devres *dr;
+	int ret;
+
+	dr = devres_alloc(devm_arch_io_free_memtype_wc_release, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	ret = arch_io_reserve_memtype_wc(start, size);
+	if (ret < 0) {
+		devres_free(dr);
+		return ret;
+	}
+
+	dr->start = start;
+	dr->size = size;
+	devres_add(dev, dr);
+
+	return ret;
+}
+EXPORT_SYMBOL(devm_arch_io_reserve_memtype_wc);
-- 
2.33.0

