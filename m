Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C1F673F00
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0588410E9A9;
	Thu, 19 Jan 2023 16:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6733510E9A9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 16:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674146280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uN67L3mizLHUx2cS89kxYYWRsxiQKiVw7aSFGWTMetY=;
 b=ANQB71GiyyVY1I/lOtohXlSPFWsZtVyxJNq2EDK3W9IQ0/KF3JmIAwvMlngLQxyBGXuDYG
 uF3c/YHEy+81fv2FuiUNkelyOkBW/+YYSMN1PoqgjNni7aM2bTEWLp7itKosevhiONN540
 PigMc36ZxU9++xJLm0BMYdRVCAmHI7c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-_eHQkZpnMe6tW7RmOzCilg-1; Thu, 19 Jan 2023 11:37:55 -0500
X-MC-Unique: _eHQkZpnMe6tW7RmOzCilg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA0A73C0CD44;
 Thu, 19 Jan 2023 16:37:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E413A2026D76;
 Thu, 19 Jan 2023 16:37:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH 1/2] ACPI: video: Add backlight=native DMI quirk for HP
 Pavilion g6-1d80nr
Date: Thu, 19 Jan 2023 17:37:43 +0100
Message-Id: <20230119163744.548749-2-hdegoede@redhat.com>
In-Reply-To: <20230119163744.548749-1-hdegoede@redhat.com>
References: <20230119163744.548749-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

The HP Pavilion g6-1d80nr predates Windows 8, so it defaults to using
acpi_video# for backlight control, but this is non functional on
this model.

Add a DMI quirk to use the native backlight interface which does
work properly.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index fb526ba8825b..c660dd6f896e 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -618,6 +618,15 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "UX303UB"),
 		},
 	},
+	{
+	 .callback = video_detect_force_native,
+	 /* HP Pavilion g6-1d80nr / B4U19UA */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "HP Pavilion g6 Notebook PC"),
+		DMI_MATCH(DMI_PRODUCT_SKU, "B4U19UA"),
+		},
+	},
 	{
 	 .callback = video_detect_force_native,
 	 /* Samsung N150P */
-- 
2.39.0

