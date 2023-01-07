Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1E8660DBD
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 11:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070B310E181;
	Sat,  7 Jan 2023 10:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D8A10E181
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 10:22:53 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id n12so3942577pjp.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 02:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nT9gdnbLGuBpWnVg5M2Oo4GmVRIc3FKsY2Rh+Wszh3E=;
 b=g/GC21wmf8/MD5LCSsmqw0UM9NPshE0aYYzre7tVqamk7Oyn+DzAMclqiKsgTKXDn4
 ywWy0J6TrILXWq2wgD5zZuI0dwqPYzwix1l72zqSd+PXFJ7gGJM4Pov4BnzTglck6Q9C
 qgRfAuZogdAtS3kDGHsmijJT2ErxmhKQYDAXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nT9gdnbLGuBpWnVg5M2Oo4GmVRIc3FKsY2Rh+Wszh3E=;
 b=wVfwLmS6y3RwS7j8wUA8HxXhAHZ0DES7oQaM6K9dyeZEPLlP/tA80TQX+H/XLW5IuE
 INZqxthNpdlYnIRAwQ74jAmhWzP0ZtSda+VYvnMjxSp7ey/+UFtVE/1fRkao7Vc94CK3
 Lqx0QAYJVIH52O8wyQ9l559VgCGh+X5pmnfqLCVHqwh9fH2tx7Hoq8d3qXkFQSqhFou6
 NpRVHYzQXzmdHue4y24Q7spRx1g7lo6tQU92nFM3GjwdxUW1hUu6e8n5alKQtoGKwf8K
 xpV2/TBE4JPoHuD71R2n4guJmcfJuMwStm7MN/Y6CLcaXfJ5oc00xpDHn6jFCpbv6uc0
 +Mmg==
X-Gm-Message-State: AFqh2kpv40FK8nIVWTNEP4CC9KfpHbUM6Cciy+yDqDoezxawP9kyKqUe
 5CcS9aSLfm+2XsgCdA+z0rY7dg==
X-Google-Smtp-Source: AMrXdXshQueVSSjO1qfCj7EmNNm2bUD58eRfmn/kGRv+NVvqzWZPI1/73g/Jc2D6nYXH7+8ktZI3oA==
X-Received: by 2002:a17:902:edc5:b0:192:c882:703e with SMTP id
 q5-20020a170902edc500b00192c882703emr20430020plk.43.1673086973113; 
 Sat, 07 Jan 2023 02:22:53 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:180d:95e8:f4:84fb])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a170903228100b001892af9472esm2366362plh.261.2023.01.07.02.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 02:22:52 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v8 2/9] platform/chrome: cros_ec_typec: Purge blocking switch
 devlinks
Date: Sat,  7 Jan 2023 18:22:24 +0800
Message-Id: <20230107102231.23682-3-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230107102231.23682-1-treapking@chromium.org>
References: <20230107102231.23682-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, devicetree@vger.kernel.org,
 Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Pin-yen Lin <treapking@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Prashant Malani <pmalani@chromium.org>

When using OF graph, the fw_devlink code will create links between the
individual port driver (cros-ec-typec here) and the parent device for
a Type-C switch (like mode-switch). Since the mode-switch will in turn
have the usb-c-connector (i.e the child of the port driver) as a
supplier, fw_devlink will not be able to resolve the cyclic dependency
correctly.

As a result, the mode-switch driver probe() never runs, so mode-switches
are never registered. Because of that, the port driver probe constantly
fails with -EPROBE_DEFER, because the Type-C connector class requires all
switch devices to be registered prior to port registration.

To break this deadlock and allow the mode-switch registration to occur,
purge all the usb-c-connector nodes' absent suppliers. This eliminates
the connector as a supplier for a switch and allows it to be probed.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

(no changes since v7)

Changes in v7:
- Fix the long comment lines

Changes in v6:
- New in v6

 drivers/platform/chrome/cros_ec_typec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 2a7ff14dc37e..302474a647cc 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -382,6 +382,16 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 		return -EINVAL;
 	}
 
+	/*
+	 * OF graph may have set up some device links with switches,
+	 * since connectors have their own compatible. Purge these
+	 * to avoid a deadlock in switch probe (the switch mistakenly
+	 * assumes the connector is a supplier).
+	 */
+	if (dev_of_node(dev))
+		device_for_each_child_node(dev, fwnode)
+			fw_devlink_purge_absent_suppliers(fwnode);
+
 	/* DT uses "reg" to specify port number. */
 	port_prop = dev->of_node ? "reg" : "port-number";
 	device_for_each_child_node(dev, fwnode) {
-- 
2.39.0.314.g84b9a713c41-goog

