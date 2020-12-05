Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0772A2CF8B0
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 02:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C409E6E39B;
	Sat,  5 Dec 2020 01:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F026E364
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 01:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607132629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+TO2oSaQ81IHJLncB8OI5/1JnLZbRs6jJE1YPlG8SE=;
 b=ZgJaLiX2Jb1eEqLxvFkozKpjQ+Ey+HuNPTBnkHcjn5riiFdOymYv3DZNzEQiZAOA3UbtY/
 iee5EQnWWm/WFAvudAPDCsptZtAeucWKY+ZNDnWsADITmRbIoKVRFSGdhjg58TVv5US2wo
 zhBxCypV4i6AgbZkKCCvDsWdtjv45XE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-AsaoKEgGMOyymeR2UkUFOA-1; Fri, 04 Dec 2020 20:43:47 -0500
X-MC-Unique: AsaoKEgGMOyymeR2UkUFOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 016A6107ACE4;
 Sat,  5 Dec 2020 01:43:46 +0000 (UTC)
Received: from cantor.redhat.com (ovpn-114-119.phx2.redhat.com [10.3.114.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BAC060917;
 Sat,  5 Dec 2020 01:43:45 +0000 (UTC)
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] tpm_tis: Disable interrupts if interrupt storm detected
Date: Fri,  4 Dec 2020 18:43:39 -0700
Message-Id: <20201205014340.148235-4-jsnitsel@redhat.com>
In-Reply-To: <20201205014340.148235-1-jsnitsel@redhat.com>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Hans de Goede <hdegoede@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>,
 Matthew Garrett <mjg59@google.com>, Peter Huewe <peterhuewe@gmx.de>,
 linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When enabling the interrupt code for the tpm_tis driver we have
noticed some systems have a bios issue causing an interrupt storm to
occur. The issue isn't limited to a single tpm or system manufacturer
so keeping a denylist of systems with the issue isn't optimal. Instead
try to detect the problem occurring, disable interrupts, and revert to
polling when it happens.

Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Peter Huewe <peterhuewe@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Matthew Garrett <mjg59@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
---
v3: - Change include from linux/kernel_stat.h to linux/irq.h
v2: - drop tpm_tis specific workqueue and use just system_w

drivers/char/tpm/tpm_tis_core.c | 27 +++++++++++++++++++++++++++
 drivers/char/tpm/tpm_tis_core.h |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index 92c51c6cfd1b..d817ff5664d1 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -24,6 +24,8 @@
 #include <linux/wait.h>
 #include <linux/acpi.h>
 #include <linux/freezer.h>
+#include <linux/workqueue.h>
+#include <linux/irq.h>
 #include "tpm.h"
 #include "tpm_tis_core.h"
 
@@ -715,9 +717,23 @@ static irqreturn_t tis_int_handler(int dummy, void *dev_id)
 {
 	struct tpm_chip *chip = dev_id;
 	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
+	static bool check_storm = true;
+	static unsigned int check_start;
 	u32 interrupt;
 	int i, rc;
 
+	if (unlikely(check_storm)) {
+		if (!check_start) {
+			check_start = jiffies_to_msecs(jiffies);
+		} else if ((kstat_irqs(priv->irq) > 1000) &&
+			   (jiffies_to_msecs(jiffies) - check_start < 500)) {
+			check_storm = false;
+			schedule_work(&priv->storm_work);
+		} else if (jiffies_to_msecs(jiffies) - check_start >= 500) {
+			check_storm = false;
+		}
+	}
+
 	rc = tpm_tis_read32(priv, TPM_INT_STATUS(priv->locality), &interrupt);
 	if (rc < 0)
 		return IRQ_NONE;
@@ -943,6 +959,14 @@ static const struct tpm_class_ops tpm_tis = {
 	.clk_enable = tpm_tis_clkrun_enable,
 };
 
+static void tpm_tis_storm_work(struct work_struct *work)
+{
+	struct tpm_tis_data *priv = container_of(work, struct tpm_tis_data, storm_work);
+
+	disable_interrupts(priv->chip);
+	dev_warn(&priv->chip->dev, "Interrupt storm detected, using polling.\n");
+}
+
 int tpm_tis_core_init(struct device *dev, struct tpm_tis_data *priv, int irq,
 		      const struct tpm_tis_phy_ops *phy_ops,
 		      acpi_handle acpi_dev_handle)
@@ -959,6 +983,9 @@ int tpm_tis_core_init(struct device *dev, struct tpm_tis_data *priv, int irq,
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
 
+	priv->chip = chip;
+	INIT_WORK(&priv->storm_work, tpm_tis_storm_work);
+
 #ifdef CONFIG_ACPI
 	chip->acpi_dev_handle = acpi_dev_handle;
 #endif
diff --git a/drivers/char/tpm/tpm_tis_core.h b/drivers/char/tpm/tpm_tis_core.h
index 9b2d32a59f67..973297ee2e16 100644
--- a/drivers/char/tpm/tpm_tis_core.h
+++ b/drivers/char/tpm/tpm_tis_core.h
@@ -95,6 +95,8 @@ struct tpm_tis_data {
 	u16 clkrun_enabled;
 	wait_queue_head_t int_queue;
 	wait_queue_head_t read_queue;
+	struct work_struct storm_work;
+	struct tpm_chip *chip;
 	const struct tpm_tis_phy_ops *phy_ops;
 	unsigned short rng_quality;
 };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
