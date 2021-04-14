Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8902435F714
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4D96E93D;
	Wed, 14 Apr 2021 15:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1B66E93E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 15:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618413088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWj3DnOXodLriM5MBUvwzzfku67ab3+bGwLOp0tAVFk=;
 b=fiLdO0zpXOfs4JKbchOx+vi/e6P7q0nbbAmu0kiz5fXuBHPoKHZBBJtJW2RLWbA54tPQ+f
 h1VMhvYCgaK3PQOL3HukzZfDZuOkmv7h3layiY9ddlpqEhIqbG5PjiOpT5f5jounCnoZtv
 TyAi7e/o7I9+zd7P83rVPmJl6Lwg68o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-UkreENd0NmGAO2RFElak0Q-1; Wed, 14 Apr 2021 11:11:24 -0400
X-MC-Unique: UkreENd0NmGAO2RFElak0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E17C5A6861;
 Wed, 14 Apr 2021 15:11:21 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-168.ams2.redhat.com [10.36.112.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A8F25D6A8;
 Wed, 14 Apr 2021 15:11:18 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <mgross@linux.intel.com>,
 Andy Shevchenko <andy@infradead.org>
Subject: [PATCH resend 7/9] platform/x86: thinkpad_acpi: Get privacy-screen /
 lcdshadow ACPI handles only once
Date: Wed, 14 Apr 2021 17:10:47 +0200
Message-Id: <20210414151049.95828-8-hdegoede@redhat.com>
In-Reply-To: <20210414151049.95828-1-hdegoede@redhat.com>
References: <20210414151049.95828-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Marco Trevisan <marco.trevisan@canonical.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sebastien Bacher <seb128@ubuntu.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Mark Pearson <markpearson@lenovo.com>,
 Mario Limonciello <mario.limonciello@outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get the privacy-screen / lcdshadow ACPI handles once and cache them,
instead of retrieving them every time we need them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 683c175cc28a..fe919700b8ae 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9759,19 +9759,15 @@ static struct ibm_struct battery_driver_data = {
  * LCD Shadow subdriver, for the Lenovo PrivacyGuard feature
  */
 
+static acpi_handle lcdshadow_get_handle;
+static acpi_handle lcdshadow_set_handle;
 static int lcdshadow_state;
 
 static int lcdshadow_on_off(bool state)
 {
-	acpi_handle set_shadow_handle;
 	int output;
 
-	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "SSSS", &set_shadow_handle))) {
-		pr_warn("Thinkpad ACPI has no %s interface.\n", "SSSS");
-		return -EIO;
-	}
-
-	if (!acpi_evalf(set_shadow_handle, &output, NULL, "dd", (int)state))
+	if (!acpi_evalf(lcdshadow_set_handle, &output, NULL, "dd", (int)state))
 		return -EIO;
 
 	lcdshadow_state = state;
@@ -9789,15 +9785,17 @@ static int lcdshadow_set(bool on)
 
 static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
 {
-	acpi_handle get_shadow_handle;
+	acpi_status status1, status2;
 	int output;
 
-	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GSSS", &get_shadow_handle))) {
+	status1 = acpi_get_handle(hkey_handle, "GSSS", &lcdshadow_get_handle);
+	status2 = acpi_get_handle(hkey_handle, "SSSS", &lcdshadow_set_handle);
+	if (ACPI_FAILURE(status1) || ACPI_FAILURE(status2)) {
 		lcdshadow_state = -ENODEV;
 		return 0;
 	}
 
-	if (!acpi_evalf(get_shadow_handle, &output, NULL, "dd", 0)) {
+	if (!acpi_evalf(lcdshadow_get_handle, &output, NULL, "dd", 0)) {
 		lcdshadow_state = -EIO;
 		return -EIO;
 	}
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
