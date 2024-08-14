Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F99595226B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 21:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B3310E51F;
	Wed, 14 Aug 2024 19:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YjTshvdv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F46A10E51F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 19:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723662154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnCD2jCv8+LRBXs1DCD1n71FWSSYMHrFi8IT/1BCheY=;
 b=YjTshvdvAN30nRyCOqCPJ6n2v93RV/6xxgK9nfZPv0z69nZiGUKzZNO+/gQSK/kJ5ejnDp
 w2lyN80x8lYbYG5dZyLtq8Jlod7u2Cr2mpCSRI5Q6r2KVb3ICbYllm9cRFQdckk2DiPOb3
 VwyTNYupeCiaPNFM0In+FWdIro+cZsI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-205--yCz_wvxPGiD8RTeLWKdOg-1; Wed,
 14 Aug 2024 15:02:18 -0400
X-MC-Unique: -yCz_wvxPGiD8RTeLWKdOg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 87B7A1955F06; Wed, 14 Aug 2024 19:02:13 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.22])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8C3E319560AA; Wed, 14 Aug 2024 19:02:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH 3/3] ACPI: video: Add backlight=native quirk for Dell OptiPlex
 7760 AIO
Date: Wed, 14 Aug 2024 21:01:59 +0200
Message-ID: <20240814190159.15650-4-hdegoede@redhat.com>
In-Reply-To: <20240814190159.15650-1-hdegoede@redhat.com>
References: <20240814190159.15650-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

Dell All In One (AIO) models released after 2017 may use a backlight
controller board connected to an UART.

In DSDT this uart port will be defined as:

   Name (_HID, "DELL0501")
   Name (_CID, EisaId ("PNP0501")

The Dell OptiPlex 7760 AIO has an ACPI device for one if its UARTs with
the above _HID + _CID. Loading the dell-uart-backlight driver shows that
there actually is a backlight controller board attached to the UART,
which reports a firmware version of "G&MX01-V15".

But the backlight controller board does not actually control the backlight
brightness and the GPU's native backlight control method does work.

Add a quirk to use the GPU's native backlight control method on this model.

Fixes: 484bae9e4d6a ("platform/x86: Add new Dell UART backlight driver")
Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2303936
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index e509dcbf3090..674b9db7a1ef 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -823,6 +823,21 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		},
 	},
 
+	/*
+	 * Dell AIO (All in Ones) which advertise an UART attached backlight
+	 * controller board in their ACPI tables (and may even have one), but
+	 * which need native backlight control nevertheless.
+	 */
+	{
+	 /* https://bugzilla.redhat.com/show_bug.cgi?id=2303936 */
+	 .callback = video_detect_force_native,
+	 /* Dell OptiPlex 7760 AIO */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7760 AIO"),
+		},
+	},
+
 	/*
 	 * Models which have nvidia-ec-wmi support, but should not use it.
 	 * Note this indicates a likely firmware bug on these models and should
-- 
2.46.0

