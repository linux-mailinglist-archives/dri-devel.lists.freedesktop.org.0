Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCpnN/IEhWlW7gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:00:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7417AF7533
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0EB10E11C;
	Thu,  5 Feb 2026 21:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NAiqYT8q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD3D10E0AD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770325230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bysblly79RF2LtPRkhZUIzq0xEXxTiQQ0zgHTCq8A+8=;
 b=NAiqYT8qGMPx43MitMIhmq67vPynXyjOd88HnEnHu/24opjYuX4pQOGqbzoPJob7ntjhcs
 nylnQF84KYnCsWPdW14/AryBHI8CBUhJb+yPTUgLWpjrBmp3picgA63YRe0Jhg0/OX4HSl
 hCI0bueUZuWcUhHj+KddmHT1AK+LlbQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-vIHXOuddN5ieoX58YKt0ig-1; Thu, 05 Feb 2026 16:00:27 -0500
X-MC-Unique: vIHXOuddN5ieoX58YKt0ig-1
X-Mimecast-MFC-AGG-ID: vIHXOuddN5ieoX58YKt0ig_1770325226
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8947d477a09so47146746d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 13:00:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770325226; x=1770930026;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bysblly79RF2LtPRkhZUIzq0xEXxTiQQ0zgHTCq8A+8=;
 b=tiAHGmhCZ2cJQK8hxcQLOMcW9HzlKZF0cH+7JaOBS1lvAqtmjdw+Mvbno/tVi0q1My
 33T5HeHGG9sWSFKj160/wuMV0OMHVzVwR/I0ax/DvdzMgJbG/dET4O8Z3JKF+cjzOx0m
 qKXEWsMWWB7xoq8o+2Q/JAGEKu7eGv4+6liS4eqfCZo8cQUS2vBuBWtdJONzcWXJ4LTb
 QvShvnIJNyUtJsMXDjZJHjBsvhapFchIqLBA38cRy7VMvVjQ2d657c5OC6Qkacsd8i/j
 vkehgACmWR72szinhleGAesSWBJPIQSXD4wlTa50skRpzuAkymXp5eesSp4ILecUc7gj
 MZJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrt2aAA0P3H0BiyAn8kTU08MFCnC8VO715or1kfyf+dYOgVjimEr4wPqpkbU3sxG26vDr7vpf3mzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcS/bxuMhgi2Ug2Vsj/yghBzcPDc3qL+80GPyy1D8usqPSgpCe
 UQTgaZw1TayQwHTF5urFtgH24zYRAtyZTjA4k+eF9hkI3Unqlvm1x9xOz+MopZkB0joKzSVFgps
 XHZCxWEDbXZw7aDoZ8U2ewKYEhdwzaeiRpVG8LUfIlY0fx1twXDXd7XeiR9rO21g6FzISoQ==
X-Gm-Gg: AZuq6aK0ltf/YPTNqwAp5LK0YDjGaiP8MEpPBRaSIoQxLlcLKDZqP5mu4EUMrhIfBIY
 bpwM+97VWc9P6hZAgwkJH+JQG8fXNEC6tGoQRrnFqlajOMvuN26rGT6urJSshRtqkEZ9+ciBm28
 hXWuLFVkfg0sesXAlrkksz54Nm16QGh9URJPY4nBlQ7nDOZWPzP8/q++TZUxD/dUvHrslh6/IfS
 oOfjD5PvqiA5SnWrtx/SQE9VQ99Lh7mVmad0LwchVqgB9dPYKM+pjXBJ1geiTcTBkjbU0e5lnWT
 M5vjk6Z8J1JT5KyDPvbhNnesfauWc8DaX5juyPkfXZL5NIzDx7+Zg+H7Muzsm05LlAw/X5rIBbS
 lfM+ZhrYrKb8gUv4=
X-Received: by 2002:ad4:5c45:0:b0:882:6cd3:7f64 with SMTP id
 6a1803df08f44-8953cc8c1c3mr6671096d6.44.1770325225699; 
 Thu, 05 Feb 2026 13:00:25 -0800 (PST)
X-Received: by 2002:ad4:5c45:0:b0:882:6cd3:7f64 with SMTP id
 6a1803df08f44-8953cc8c1c3mr6669906d6.44.1770325225055; 
 Thu, 05 Feb 2026 13:00:25 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 13:00:22 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:49 -0500
Subject: [PATCH v2 02/10] fpga: dfl-pci: set driver flag to disable SR-IOV
 on remove()
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-2-ef9400c7767b@redhat.com>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
In-Reply-To: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev, 
 Peter Colberg <pcolberg@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cT7r0V7VmIVcRfLFpMudAyM6AQCDbPIQ_Pr7IUGbqNw_1770325226
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:abdiel.janulgue@gmail.com,m:daniel.almeida@collabora.com,m:robin.murphy@arm.com,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:yilun.xu@intel.com,m:trix@redhat.com,m:mdf@kernel.org,m:rafael@kernel.org,m:linux-pci@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:acourbot@nvidia.com,m:apopple@nvidia.com,m:joelagnelf@nvidia.com,m:jhubbard@nvidia.com,m:zhiw@nvidia.com,m:nouveau@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-fpga@vger.kernel.org,m:driver-core@lists.linux.dev,m:pcolberg@redhat.com,m:jgg@ziepe.ca,m:alexgaynor@gmail.com,m:boqunfeng@gmail.com,
 m:abdieljanulgue@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pcolberg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[41];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,linuxfoundation.org,intel.com,ffwll.ch,lwn.net,redhat.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pcolberg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7417AF7533
X-Rspamd-Action: no action

Set the flag managed_sriov in the pci_driver structure to show how a
PCI driver may opt into disabling the Single Root I/O Virtualization
(SR-IOV) capability of the device when the driver is removed.

Merge the function cci_remove_feature_devs() into cci_pci_remove().

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Demonstrate flag managed_sriov for dfl-pci driver.
---
 drivers/fpga/dfl-pci.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
index 602807d6afcc09af9e1d53368b41460ef86545d8..7965c307f9b79bdd2c2c3277d519ab2c4e701797 100644
--- a/drivers/fpga/dfl-pci.c
+++ b/drivers/fpga/dfl-pci.c
@@ -125,15 +125,6 @@ static int cci_init_drvdata(struct pci_dev *pcidev)
 	return 0;
 }
 
-static void cci_remove_feature_devs(struct pci_dev *pcidev)
-{
-	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
-
-	/* remove all children feature devices */
-	dfl_fpga_feature_devs_remove(drvdata->cdev);
-	cci_pci_free_irq(pcidev);
-}
-
 static int *cci_pci_create_irq_table(struct pci_dev *pcidev, unsigned int nvec)
 {
 	unsigned int i;
@@ -425,10 +416,11 @@ static int cci_pci_sriov_configure(struct pci_dev *pcidev, int num_vfs)
 
 static void cci_pci_remove(struct pci_dev *pcidev)
 {
-	if (dev_is_pf(&pcidev->dev))
-		cci_pci_sriov_configure(pcidev, 0);
+	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
 
-	cci_remove_feature_devs(pcidev);
+	/* remove all children feature devices */
+	dfl_fpga_feature_devs_remove(drvdata->cdev);
+	cci_pci_free_irq(pcidev);
 }
 
 static struct pci_driver cci_pci_driver = {
@@ -437,6 +429,7 @@ static struct pci_driver cci_pci_driver = {
 	.probe = cci_pci_probe,
 	.remove = cci_pci_remove,
 	.sriov_configure = cci_pci_sriov_configure,
+	.managed_sriov = true,
 };
 
 module_pci_driver(cci_pci_driver);

-- 
2.52.0

