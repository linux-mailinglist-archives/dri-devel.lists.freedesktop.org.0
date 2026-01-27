Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO7cACeMeGmqqwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:57:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81FC92365
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA8C10E4F7;
	Tue, 27 Jan 2026 09:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gBe75YEO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0942510E4F7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 09:57:46 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4801bc32725so42450105e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 01:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769507864; x=1770112664; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s3fgVVbcQTtRJV48S+nyNEv2JNUdtpWQtsHANx8ZpfI=;
 b=gBe75YEOrgY+55p0KicGIjoVEQ/1HfvKPwc4vhBTEuWMqpEHOIQ6srSDJllQMLR4r3
 2m8+mg9ulDCh87qk8f+faZqmx67mpOvKldbXBDojXI6HCiCRBsAm54Vu41HEaiSS8dY1
 mL8eWOmybLxGiDWKrLvTHJevm2UIxXeEkbbTlzrfWN7V8svj3z0w2jN+XUmRsvP7NVY5
 I5eABbnP4H/+3CydbAXepT4Rlz+pKrX7EXTtCNiKLxRJV8t+4G7gF4vLQn2XULlZXBN3
 aWXA+de9Epm0T8Rvopx0tyAZhrtLU1qO8OshiS69k232s14zRqgnPadsj3RfNgpiMCbp
 vxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769507864; x=1770112664;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=s3fgVVbcQTtRJV48S+nyNEv2JNUdtpWQtsHANx8ZpfI=;
 b=ufgmkxNh4hEVgcIs0uDAIj9r0ckU/kMVBJ36BI2FQxSqaqP9r/hVbvV+S0TT3zGF4d
 +WwTZUUvjAugFb/gZRdQHzpNhHgiQ3HQm7/YYsXjTZA7PKr34OtkX0Z3FN6YXI3ZK9PI
 a9x3zcPR+vGA1z3CWOlQgvYOdtEWEcBX9jl/HKC7PA/aYNPBSHcmC//UN77cE5JIVwgD
 8iYG90WhahbCpjb/ZzDv1pc3yC+clMLhRzAlPjKjgikMXMrgq/g4Q3qFtGSH1eD5OTkM
 4gjNbTGNA4q4SQdB2ZJduMadnkdlwtWPjoSvHa2VEKLds0SJGX7N6hhoJ3zrDBgK+Ryk
 y4rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW43Yj3GSz9sPVPYP8oxLsBwTmMYnwpiJijxexzjCyjVsIYizSepTVBzUff9OHBme5cmeENNkPVSqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2c6H9FmiGn7MuNRriCz3sC1V+Hq747an5O4x/kfFIMO29Cfou
 D6ZYwGwpat9zLFgfyaoF6jzAudpSKGgj/qIHv3SzD7cD3lGvB68Js9UzBzJBosv5GV4=
X-Gm-Gg: AZuq6aLWQpxXu4AykFHAYUZ3IGWQc9r+bsiTIKPqa6I84rWDGD7e7JmCz6ETKkLej7o
 sbIKZWt7JYj5XAWzkWnrjK9azV82v9Sor2KLZp1kuoe61BMX9WBjPvyp61wqx+fRMeOxHTn0qrl
 2K5R85Dp6QM75E4VfT5t+tpyRb36yG1hfDEI0wkXaXP+VcVZkpm6/GoeAsbGhQ/HOVASArOHsHQ
 x7APxEU/6St21RSeRZAeNd/3Icu/+w11YGWPz/bJ4a8/aXprcBgzwUgc/Hmmfrh8k7lkqdKC5zQ
 FTvl3NYg2ttpruDPL9YPlyRHaQrv7C2oJlHnzb2Frdwh3nDslwlCEFfV1QmoVa/HxVhPGLyvgeD
 9Cs00U87KumrajHb+UQAutPnYKjP6/oKJXKCvC9PG+jgWi9qBCH7wQuaUzo322enF365ft7KpIn
 1xnlssy0VrF6GmZb3zPrM6p8eM5gPcYLg=
X-Received: by 2002:a05:600c:4e90:b0:477:582e:7a81 with SMTP id
 5b1f17b1804b1-48069c2a907mr13201485e9.4.1769507864355; 
 Tue, 27 Jan 2026 01:57:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 01:57:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Jan 2026 10:57:29 +0100
Subject: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4559;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HsXR1ZRReSjuIteRzdqoskAI8e3z5XUN7HnkD9ouWkI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwSkkdAKRmon7OGOT9uwsmrBncm8jOyh0zpmdxa
 TQoDShyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMEgAKCRB33NvayMhJ0V4oD/
 9CadGb5W2hLBSTWJcLX1TKMCmKU/DooSZsZyM2Dl6diO3GC2Oi8oNYdFJb+fnacWdtNol23goMlDcb
 st32xe8hVi+AGrdQPZZYF1q4IymW9DgplcUvn7/hZNbEj/BD1MMTqM76d3BbM5zatqPYudBPq4V8qk
 /aR+uQcMDexhYyKIBX0eIYH+cm/aAHbmcfaxxYyGy5HFRYtK0zMYZhwC0xKwYoyy5rdixE2HQRJ6NW
 dt6P0SALIxUZnql3S1G3tjWtYnTPIog0c1G6ROjXl+gY+BRJRa68gYA+o/j3N6VTtbWvyj1aFMwpOW
 06cyZ8Dm0n68LQ6ROLVvnYtVZA3mKEKPkgaAdnnZhL71G9El6/CYu0mA/Xth/0SRMZcdmaQ7NCNjuf
 h+5SePhDJZQ7Bo1VzCrb6fRtdkswbktqkuhQLRMcm0IaZ6cJiwGUaDXSBU3yVEVRsfTctLx2B7AXOj
 7T5JLrPtPitBn1hDOEV9cEkZwvp1jDfRwzDcylnAG9+XwkI0NRTt9QYSOHscyafCFYLTt8hdZzFUFZ
 pql0g1eA2RoILdRDM/+Jvv+HWancC/TTNIEYt1MPQnFSa2UzNGkLXaZ/N3NJJ67VB4a410tGdp61cx
 3dj3kn/tG9eM5rdZyQ3VymgcCnmUKryhJifhlCkcdAl7BPXnjP/cI3L/5Kfg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:brgl@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: A81FC92365
X-Rspamd-Action: no action

Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
power control which connects over PCIe and requires specific power supplies
to start up.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pci/pwrctrl/Kconfig                 | 10 ++++
 drivers/pci/pwrctrl/Makefile                |  2 +
 drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c | 88 +++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+)

diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
index e0f999f299bb..5a94e60d0d3e 100644
--- a/drivers/pci/pwrctrl/Kconfig
+++ b/drivers/pci/pwrctrl/Kconfig
@@ -11,6 +11,16 @@ config PCI_PWRCTRL_PWRSEQ
 	select POWER_SEQUENCING
 	select PCI_PWRCTRL
 
+config PCI_PWRCTRL_UPD720201
+	tristate "PCI Power Control driver for the UPD720201 USB3 Host Controller"
+	select PCI_PWRCTRL
+	help
+	  Say Y here to enable the PCI Power Control driver of the UPD720201
+	  USB3 Host Controller.
+
+	  The voltage regulators powering the rails of the PCI slots
+	  are expected to be defined in the devicetree node of the PCI device.
+
 config PCI_PWRCTRL_SLOT
 	tristate "PCI Power Control driver for PCI slots"
 	select PCI_PWRCTRL
diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
index 13b02282106c..a99f85de8a3d 100644
--- a/drivers/pci/pwrctrl/Makefile
+++ b/drivers/pci/pwrctrl/Makefile
@@ -5,6 +5,8 @@ pci-pwrctrl-core-y			:= core.o
 
 obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)	+= pci-pwrctrl-pwrseq.o
 
+obj-$(CONFIG_PCI_PWRCTRL_UPD720201)	+= pci-pwrctrl-upd720201.o
+
 obj-$(CONFIG_PCI_PWRCTRL_SLOT)		+= pci-pwrctrl-slot.o
 pci-pwrctrl-slot-y			:= slot.o
 
diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
new file mode 100644
index 000000000000..db96bbb69c21
--- /dev/null
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Based on upd720201.c:
+ * Copyright (C) 2024 Linaro Ltd.
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pci-pwrctrl.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+struct pci_pwrctrl_upd720201_data {
+	struct pci_pwrctrl ctx;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
+};
+
+static void devm_pci_pwrctrl_upd720201_power_off(void *data)
+{
+	struct pci_pwrctrl_upd720201_data *upd720201 = data;
+
+	regulator_bulk_disable(upd720201->num_supplies, upd720201->supplies);
+	regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
+}
+
+static int pci_pwrctrl_upd720201_probe(struct platform_device *pdev)
+{
+	struct pci_pwrctrl_upd720201_data *upd720201;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	upd720201 = devm_kzalloc(dev, sizeof(*upd720201), GFP_KERNEL);
+	if (!upd720201)
+		return -ENOMEM;
+
+	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
+					&upd720201->supplies);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to get upd720201 regulators\n");
+		return ret;
+	}
+
+	upd720201->num_supplies = ret;
+	ret = regulator_bulk_enable(upd720201->num_supplies, upd720201->supplies);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to enable upd720201 regulators\n");
+		regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_upd720201_power_off,
+				       upd720201);
+	if (ret)
+		return ret;
+
+	pci_pwrctrl_init(&upd720201->ctx, dev);
+
+	ret = devm_pci_pwrctrl_device_set_ready(dev, &upd720201->ctx);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
+
+	return 0;
+}
+
+static const struct of_device_id pci_pwrctrl_upd720201_of_match[] = {
+	{
+		.compatible = "pci1912,0014",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pci_pwrctrl_upd720201_of_match);
+
+static struct platform_driver pci_pwrctrl_upd720201_driver = {
+	.driver = {
+		.name = "pci-pwrctrl-upd720201",
+		.of_match_table = pci_pwrctrl_upd720201_of_match,
+	},
+	.probe = pci_pwrctrl_upd720201_probe,
+};
+module_platform_driver(pci_pwrctrl_upd720201_driver);
+
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_DESCRIPTION("PCI Power Control driver for UPD720201 USB3 Host Controller");
+MODULE_LICENSE("GPL");

-- 
2.34.1

