Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FB37270E0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 23:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9218110E556;
	Wed,  7 Jun 2023 21:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E4E89919
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 21:53:26 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-65242634690so4647761b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 14:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686174805; x=1688766805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+rHz1jZnjpSiv5HKR2V1CEWNHmLWqUe5SsAOtRVLc3E=;
 b=hdbjyXWzHfwxcUwfwb+qucn8Y1kzJgDBVnByK1lmUyw+Rig23C+S4Y6GODf2Asa3Rj
 9LFMI+tJIkfnSgqmixDuthZjEXGWhYiiE9sj2Kk1wy9zu2bWc/lao9ZXaAP0IItUKllQ
 EP4VvisdXYOA1Pwgd8nvslaeA7bwp/nRScBzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686174805; x=1688766805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+rHz1jZnjpSiv5HKR2V1CEWNHmLWqUe5SsAOtRVLc3E=;
 b=JKWNe1EILcZJpwt/86d0UmjrI2sm+nbhAZ0w8cThQ1GCojbNIi+0mqwE/KQeR8yvIW
 OsU35H8VLb37hVtMQA1fnoqOAutNOiRtpDtAHY6fYUaj0f3sOBQ5DiXPdA0x0vdrBY2K
 iTW6yTtHzMVvX910yhClNJ9W2dZe2k/OQLXPsZRHHZuz4AQPLZqfD23Zl3/WQsgXMNdk
 GrUPzWVCDz9iInoYo34uN2mCzWONMM7Pdb1mpEOwFOf7mnT8BzLsmYE+aqL+llXCNJpE
 WDP0ekOp83sT9BnihyxCYLCwSJi5opOJi4xl0NJzUQ0NwLGVs/aow/LmsjrhanKJeJPj
 TaCg==
X-Gm-Message-State: AC+VfDx758YrvQtv63Ed6AkQhkGNs33Cv7JyBAP7zQPD3rULju/IEQHy
 imrY2umwXUjSOOqMoQYJUSIv5w==
X-Google-Smtp-Source: ACHHUZ7GXOi0BDtmluJJtn8nBAWrlKsnF0+Wl1UzQH3rklC/MVh2AxN6R5XSxLdaljfXJrjfP6JISw==
X-Received: by 2002:a05:6a00:114e:b0:643:98cb:ec1 with SMTP id
 b14-20020a056a00114e00b0064398cb0ec1mr5634126pfm.0.1686174805605; 
 Wed, 07 Jun 2023 14:53:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:34b2:b638:6b53:f6c2])
 by smtp.gmail.com with ESMTPSA id
 j25-20020aa78d19000000b0065dd1e7c2c1sm1376486pfe.63.2023.06.07.14.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 14:53:25 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follower
Date: Wed,  7 Jun 2023 14:49:30 -0700
Message-ID: <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230607215224.2067679-1-dianders@chromium.org>
References: <20230607215224.2067679-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
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

Changes in v2:
- i2c_hid_core_panel_prepared() and ..._unpreparing() are now static.

 drivers/hid/i2c-hid/i2c-hid-core.c | 82 +++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index fa8a1ca43d7f..368db3ae612f 100644
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
@@ -1058,6 +1062,34 @@ static int i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
 	return ret;
 }
 
+static int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)
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
+static int i2c_hid_core_panel_unpreparing(struct drm_panel_follower *follower)
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
2.41.0.162.gfafddb0af9-goog

