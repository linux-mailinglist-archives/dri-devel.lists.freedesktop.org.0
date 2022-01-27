Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D52C549EBFC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8511710E50E;
	Thu, 27 Jan 2022 20:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A64010E5AB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:02:38 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id 133so3283719pgb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 12:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ckuMr+Ncb/jcw9TvP8N13lANp/qUitpt+atxz271bCg=;
 b=VCDCJ2XXoEo5R2boVBxoQIPLBYXRZ4ygF5m58BNpDlZWi0b2RKflooEmM0NvSKn47v
 M8K2o4X4DejnrnAjIJ9q3+1sECxzMIDHOFpFmOMgT91R+rXZdeyhn45ubWI9MY4y+lGt
 LQpRvpFof698nsHlX6PxiqwGND/FxZPe/vWmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ckuMr+Ncb/jcw9TvP8N13lANp/qUitpt+atxz271bCg=;
 b=We+313CahAhokcVolw2Wg68i/UMFDlnNWrOfjdz6hAv23R8zVI/pF/juRWFMlW5j56
 V0jRzLHYgnmFjEO4IoH+Eu5LGPkgDPLxge/BmkUqEiR6PPMZ0iRXwM4njiYEkvLWgMGE
 lbIFdn+JDS7onh9QTdbkKWPIDp+4hcXtgOda7IvmzTLg3ciGjXVKNxsy4Y32J11CsMXd
 jbig9SVvyOL80h0mGxh68wsE13OGtMHissSSjzo2SM4GUcExT0qPKmNQnwOs7AUGtB5F
 aEBMmB0bEYOkz8kZ3dcZvxDlfevC1X18nPwYLftiSoy6qgrh6urg1B7idw/O76OMqaT5
 pIZg==
X-Gm-Message-State: AOAM533XaA3ikgUlM7Z44+IPk0GC6PSP96GSKYePq7XbakQPZ/qlLD0B
 XeW3MZudCalvJtLfmhD88dKE6A==
X-Google-Smtp-Source: ABdhPJzi7TeBcTmXGNEgo6gqdKnb0pcCN6RMeqZ8Q6M/Rim3Xa3q76WIvhpg51Dhu0lKrNyj5S5Unw==
X-Received: by 2002:a62:e116:: with SMTP id q22mr4473788pfh.48.1643313757782; 
 Thu, 27 Jan 2022 12:02:37 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:02:37 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 32/35] usb: typec: port-mapper: Migrate to aggregate driver
Date: Thu, 27 Jan 2022 12:01:38 -0800
Message-Id: <20220127200141.1295328-33-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220127200141.1295328-1-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/usb/typec/port-mapper.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/port-mapper.c b/drivers/usb/typec/port-mapper.c
index 07d307418b47..33fbebc6a85b 100644
--- a/drivers/usb/typec/port-mapper.c
+++ b/drivers/usb/typec/port-mapper.c
@@ -11,19 +11,27 @@
 
 #include "class.h"
 
-static int typec_aggregate_bind(struct device *dev)
+static int typec_aggregate_probe(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
+
 	return component_bind_all(dev, NULL);
 }
 
-static void typec_aggregate_unbind(struct device *dev)
+static void typec_aggregate_remove(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
+
 	component_unbind_all(dev, NULL);
 }
 
-static const struct component_master_ops typec_aggregate_ops = {
-	.bind = typec_aggregate_bind,
-	.unbind = typec_aggregate_unbind,
+static struct aggregate_driver typec_aggregate_driver = {
+	.probe = typec_aggregate_probe,
+	.remove = typec_aggregate_remove,
+	.driver = {
+		.name = "typec_aggregate",
+		.owner = THIS_MODULE,
+	},
 };
 
 struct each_port_arg {
@@ -69,10 +77,10 @@ int typec_link_ports(struct typec_port *con)
 	 * improvements to the component framework. Right now you can only have
 	 * one master per device.
 	 */
-	return component_master_add_with_match(&con->dev, &typec_aggregate_ops, arg.match);
+	return component_aggregate_register(&con->dev, &typec_aggregate_driver, arg.match);
 }
 
 void typec_unlink_ports(struct typec_port *con)
 {
-	component_master_del(&con->dev, &typec_aggregate_ops);
+	component_aggregate_unregister(&con->dev, &typec_aggregate_driver);
 }
-- 
https://chromeos.dev

