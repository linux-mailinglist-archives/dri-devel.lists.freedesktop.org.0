Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA8C6695CF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 12:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115D310E9F3;
	Fri, 13 Jan 2023 11:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3113310E9F3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 11:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673610099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=isVOZ9GRr18rPWGPzYgy4dJ/cFyoVZ1pgMHiAqQq1BA=;
 b=Cg26p/Es3OMrOVUD7Z1NGNynFzFkhYHu5pHw7NyKF51ypK2cftilLfJBlNwg/6g4u3YMYX
 QrmbSpio/vt1BNloQFydVTdt56YcKhx13NqOaOUcWGt67fcrhn7fadgSpBS87q3dXb3SWh
 /FohTrE4nwILfxtIwzPpIJaOPXGoNec=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-4ftcf2kwPuepngchr3KO3A-1; Fri, 13 Jan 2023 06:41:36 -0500
X-MC-Unique: 4ftcf2kwPuepngchr3KO3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1C933813F34;
 Fri, 13 Jan 2023 11:41:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C09544078904;
 Fri, 13 Jan 2023 11:41:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH] ACPI: video: Add backlight=native DMI quirk for Acer Aspire
 4810T
Date: Fri, 13 Jan 2023 12:41:26 +0100
Message-Id: <20230113114126.172078-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Acer Aspire 4810T predates Windows 8, so it defaults to using
acpi_video# for backlight control, but this is non functional on
this model.

Add a DMI quirk to use the native backlight interface which does
work properly.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index d4edd64dcc2f..fb526ba8825b 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -515,6 +515,14 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "Precision 7510"),
 		},
 	},
+	{
+	 .callback = video_detect_force_native,
+	 /* Acer Aspire 4810T */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 4810T"),
+		},
+	},
 	{
 	 .callback = video_detect_force_native,
 	 /* Acer Aspire 5738z */
-- 
2.39.0

