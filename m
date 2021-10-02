Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9552641FD31
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 18:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F176F4C6;
	Sat,  2 Oct 2021 16:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BC56F4B5
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 16:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633192618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x54z3MQgiCfOrz9jnqnzG0UQQYo8bsysv9CWq6awoRA=;
 b=JvBFzNgnmCy7Gzjate9Om2nWBppQMrbbnH1yTcJjt+PURHFo51OBuCm5OQ13S8EeysDIfM
 id6YqiyAsTQkEYqZ3fmfmWVIfl7Dnuz3l0H/qkjohp9vleXR0ntiFQlP6vw7BTo18Kel0K
 CWPMrTgz8X83FmTyUHbMBT3clWAF3pY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-y1x9NC8MOy-g7c4_-15hKA-1; Sat, 02 Oct 2021 12:36:56 -0400
X-MC-Unique: y1x9NC8MOy-g7c4_-15hKA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57E27814313;
 Sat,  2 Oct 2021 16:36:54 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 363B5100763D;
 Sat,  2 Oct 2021 16:36:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>,
 Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH 07/10] platform/x86: thinkpad_acpi: Get privacy-screen /
 lcdshadow ACPI handles only once
Date: Sat,  2 Oct 2021 18:36:15 +0200
Message-Id: <20211002163618.99175-8-hdegoede@redhat.com>
In-Reply-To: <20211002163618.99175-1-hdegoede@redhat.com>
References: <20211002163618.99175-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Get the privacy-screen / lcdshadow ACPI handles once and cache them,
instead of retrieving them every time we need them.

Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 83c88a8ebaf2..b8f2556c4797 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9819,19 +9819,15 @@ static struct ibm_struct battery_driver_data = {
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
@@ -9849,15 +9845,17 @@ static int lcdshadow_set(bool on)
 
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

