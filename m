Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBFE37185D
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 17:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECA86E8DC;
	Mon,  3 May 2021 15:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F8D6E8D5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620056842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mXQb5SssYm+Qr51jjse1jKyzMXwZ7Gev3EsN+ioOyCk=;
 b=g2V9b+H/2rKdo6tv0MhrWVmxCjIMNd0R/a2zowmw16hZZGQvbY9z9wOr7vkE1FyQYvLi4w
 D/uj3VIeBMTtcl7ksfkUmogNEg+r8M6nvlSydfWnegR6wlFih7jVIeIWZcoZ3b07bxyGja
 gf6g8iwnJBGIdrlyep2QpzeKqODfAyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-uk_U4nWXO6Kodr9IuqNxnQ-1; Mon, 03 May 2021 11:47:19 -0400
X-MC-Unique: uk_U4nWXO6Kodr9IuqNxnQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46C5F818418;
 Mon,  3 May 2021 15:47:17 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-158.ams2.redhat.com [10.36.112.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 729C610246F1;
 Mon,  3 May 2021 15:47:14 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 7/9] usb: typec: altmodes/displayport: Make
 dp_altmode_notify() more generic
Date: Mon,  3 May 2021 17:46:45 +0200
Message-Id: <20210503154647.142551-8-hdegoede@redhat.com>
In-Reply-To: <20210503154647.142551-1-hdegoede@redhat.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
MIME-Version: 1.0
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make dp_altmode_notify() handle the dp->data.conf == 0 case too,
rather then having separate code-paths for this in various places
which call it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/altmodes/displayport.c | 35 +++++++++---------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index b7f094435b00..aa669b9cf70e 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -66,10 +66,17 @@ struct dp_altmode {
 
 static int dp_altmode_notify(struct dp_altmode *dp)
 {
-	u8 state = get_count_order(DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
+	unsigned long conf;
+	u8 state;
+
+	if (dp->data.conf) {
+		state = get_count_order(DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
+		conf = TYPEC_MODAL_STATE(state);
+	} else {
+		conf = TYPEC_STATE_USB;
+	}
 
-	return typec_altmode_notify(dp->alt, TYPEC_MODAL_STATE(state),
-				   &dp->data);
+	return typec_altmode_notify(dp->alt, conf, &dp->data);
 }
 
 static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
@@ -137,21 +144,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 
 static int dp_altmode_configured(struct dp_altmode *dp)
 {
-	int ret;
-
 	sysfs_notify(&dp->alt->dev.kobj, "displayport", "configuration");
-
-	if (!dp->data.conf)
-		return typec_altmode_notify(dp->alt, TYPEC_STATE_USB,
-					    &dp->data);
-
-	ret = dp_altmode_notify(dp);
-	if (ret)
-		return ret;
-
 	sysfs_notify(&dp->alt->dev.kobj, "displayport", "pin_assignment");
 
-	return 0;
+	return dp_altmode_notify(dp);
 }
 
 static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
@@ -172,13 +168,8 @@ static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
 	}
 
 	ret = typec_altmode_vdm(dp->alt, header, &conf, 2);
-	if (ret) {
-		if (DP_CONF_GET_PIN_ASSIGN(dp->data.conf))
-			dp_altmode_notify(dp);
-		else
-			typec_altmode_notify(dp->alt, TYPEC_STATE_USB,
-					     &dp->data);
-	}
+	if (ret)
+		dp_altmode_notify(dp);
 
 	return ret;
 }
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
