Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD30470E580
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 21:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC1E10E4B2;
	Tue, 23 May 2023 19:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CDF10E4B0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 19:31:26 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2533b600d35so81837a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684870285; x=1687462285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=op3rjFIJK/G9SNN79lGhiUqi1w2mTlKVdZk1BckkQF0=;
 b=iZIs4UHnjY3vorngte3ZhnAZ8Wacu4ZILkY03JYuq9YY0p1IKzrhkIN7lcochBBA/K
 mzhnGtgfxNEFLTi5Io1SgJWb8B1k4S87J5t76ciW0EqGdX0A+ntuKA6l2vA0LOoIdFYI
 vLGsrgX/SzpeveZsaAqsAUY983U8YLapwwfsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684870285; x=1687462285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=op3rjFIJK/G9SNN79lGhiUqi1w2mTlKVdZk1BckkQF0=;
 b=eGW4Pow/EHVhozbAarpl8kDC3wDDdlCBuKIFy3egHwa88FgBT/AUZYSUNKP7OzmSQL
 bBXMOvsn1oMJEWcD+2Wh+pX7YekJeRdFjmB6rHDoeLe14is7AhymSOT1tXynk/qHkbh7
 f/FMgaxQEjSMnXagIGSjMqx4hCo0Jp+7nGu4qSSkmKpelM32iv0IBP/jB+2IHCJpR0+m
 igaZu9Wesu3bacEEVJ0FyrYF/k41yjq3+IpzZbqLLDrKstSUZC47XXGqxOsT+VSNPgYl
 M4k8n3SENEhJWT2zsd6JzBFYRGtAgBpv8RD++IYDldFLtzVYKMcBVS1k2kGels2qNXc9
 at2w==
X-Gm-Message-State: AC+VfDxI4EGnApdsZaipHCWibWwYp1mB6hsttbBHiSPyUTIRXRPRwghg
 Y1wa6/wTDHcPuYEhtoq2uUfF7Q==
X-Google-Smtp-Source: ACHHUZ59R/VZKaFBBuQCIrfYdSblmP+QUBFpk+quHC1m5oJIuUo32z8/y3nkQfaFsLE5wZiywnekqg==
X-Received: by 2002:a17:90b:46d1:b0:247:529f:92d7 with SMTP id
 jx17-20020a17090b46d100b00247529f92d7mr15761298pjb.8.1684870285561; 
 Tue, 23 May 2023 12:31:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:af98:af9d:ed15:f8b3])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902b49200b001aaef9d0102sm7109947plr.197.2023.05.23.12.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 12:31:24 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 7/9] HID: i2c-hid: Support being a panel follower
Date: Tue, 23 May 2023 12:28:01 -0700
Message-ID: <20230523122802.7.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230523193017.4109557-1-dianders@chromium.org>
References: <20230523193017.4109557-1-dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-input@vger.kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As talked about in the patch ("drm/panel: Add a way for other devices
to follow panel state"), we really want to keep the power states of a
touchscreen and the panel it's attached to in sync with each other. In
that spirit, add support to i2c-hid to be a panel follower. This will
let the i2c-hid driver get informed when the panel is powered on and
off. From there we can match the i2c-hid device's power state to that
of the panel.

NOTE: this patch specifically _doesn't_ use pm_runtime to keep track
of / manage the power state of the i2c-hid device, even though my
first instinct said that would be the way to go. Specific problems
with using pm_runtime():
* The initial power up couldn't happen in a runtime resume function
  since it create sub-devices and, apparently, that's not good to do
  in your resume function.
* Managing our power state with pm_runtime meant fighting to make the
  right thing happen at system suspend to prevent the system from
  trying to resume us only to suspend us again. While this might be
  able to be solved, it added complexity.
Overall the code without pm_runtime() ended up being smaller and
easier to understand.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/hid/i2c-hid/i2c-hid-core.c | 82 +++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 34c0d98b4976..f1bb89377e8d 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -38,6 +38,8 @@
 #include <linux/mutex.h>
 #include <asm/unaligned.h>
 
+#include <drm/drm_panel.h>
+
 #include "../hid-ids.h"
 #include "i2c-hid.h"
 
@@ -107,6 +109,8 @@ struct i2c_hid {
 	struct mutex		reset_lock;
 
 	struct i2chid_ops	*ops;
+	struct drm_panel_follower panel_follower;
+	bool			is_panel_follower;
 };
 
 static const struct i2c_hid_quirks {
@@ -1058,6 +1062,34 @@ int i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
 	return ret;
 }
 
+int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)
+{
+	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
+	struct hid_device *hid = ihid->hid;
+
+	/*
+	 * hid->version is set on the first power up. If it's still zero then
+	 * this is the first power on so we should perform initial power up
+	 * steps.
+	 */
+	if (!hid->version)
+		return i2c_hid_core_initial_power_up(ihid);
+
+	return i2c_hid_core_resume(ihid);
+}
+
+int i2c_hid_core_panel_unpreparing(struct drm_panel_follower *follower)
+{
+	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
+
+	return i2c_hid_core_suspend(ihid);
+}
+
+static const struct drm_panel_follower_funcs i2c_hid_core_panel_follower_funcs = {
+	.panel_prepared = i2c_hid_core_panel_prepared,
+	.panel_unpreparing = i2c_hid_core_panel_unpreparing,
+};
+
 int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 		       u16 hid_descriptor_address, u32 quirks)
 {
@@ -1119,6 +1151,41 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	hid->bus = BUS_I2C;
 	hid->initial_quirks = quirks;
 
+	/*
+	 * See if we're following a panel. If drm_panel_add_follower()
+	 * returns no error then we are.
+	 */
+	ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_funcs;
+	ret = drm_panel_add_follower(&client->dev, &ihid->panel_follower);
+	if (!ret) {
+		/* We're a follower. That means we'll power things up later. */
+		ihid->is_panel_follower = true;
+
+		/*
+		 * If we're not in control of our own power up/power down then
+		 * we can't do the logic to manage wakeups. Give a warning if
+		 * a user thought that was possible then force the capability
+		 * off.
+		 */
+		if (device_can_wakeup(&client->dev)) {
+			dev_warn(&client->dev, "Can't wakeup if following panel\n");
+			device_set_wakeup_capable(&client->dev, false);
+		}
+
+		return 0;
+	}
+
+	/*
+	 * -ENODEV means that we're not following a panel, so any other error
+	 * is a real problem (like -EPROBE_DEFER, -ENOMEM, ...).
+	 */
+	if (ret != -ENODEV)
+		goto err_mem_free;
+
+	/*
+	 * We're not following a panel. That's fine and means that we
+	 * can power up right away.
+	 */
 	ret = i2c_hid_core_initial_power_up(ihid);
 	if (ret)
 		goto err_mem_free;
@@ -1143,7 +1210,14 @@ void i2c_hid_core_remove(struct i2c_client *client)
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 	struct hid_device *hid;
 
-	i2c_hid_core_power_down(ihid);
+	/*
+	 * If we're a follower, the act of unfollowing will cause us to be
+	 * powered down. Otherwise we need to manually do it.
+	 */
+	if (ihid->is_panel_follower)
+		drm_panel_remove_follower(&ihid->panel_follower);
+	else
+		i2c_hid_core_power_down(ihid);
 
 	hid = ihid->hid;
 	hid_destroy_device(hid);
@@ -1171,6 +1245,9 @@ static int i2c_hid_core_pm_suspend(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 
+	if (ihid->is_panel_follower)
+		return 0;
+
 	return i2c_hid_core_suspend(ihid);
 }
 
@@ -1179,6 +1256,9 @@ static int i2c_hid_core_pm_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 
+	if (ihid->is_panel_follower)
+		return 0;
+
 	return i2c_hid_core_resume(ihid);
 }
 
-- 
2.40.1.698.g37aff9b760-goog

