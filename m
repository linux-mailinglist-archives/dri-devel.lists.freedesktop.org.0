Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEEB70E585
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 21:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0358910E4B4;
	Tue, 23 May 2023 19:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8317A10E4AE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 19:31:28 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1ae557aaf1dso296465ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684870288; x=1687462288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=39PsOXs9zk855s8jQNy2CTlBaJON6A8TZDNhmmH/46Q=;
 b=GhI0C1TWak8+SbPb8fwi5YtahbPMUZ0q/xInXun3S9DYRbA5Ge3H9tdwPIREn6nwjE
 P0NSDWJJsCFsCfBimENA7d99Zzn2dZ0qOatCq9UiE4ucZ+9HBcsBrd0zPUL/yqHrtfyh
 UoSylkf8Zht+WYlD2AUIAy3mU3mfinXBoQVvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684870288; x=1687462288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=39PsOXs9zk855s8jQNy2CTlBaJON6A8TZDNhmmH/46Q=;
 b=SugDDsbzJLw+C1GYboXwIXr4XsSMRW+rSgLL3I4op8hIvracGlskoJUckTeVgW7FBv
 2GzEMPSFIDyaIC1zatU/TeWPuf0mbfLxancdBhOd6xav1sgNlIMRWEM5JwIszWOSx6Lm
 WvD6HPUeaj/ZoJCTQpV1VQcFtVpftWb+Ha1P9WjORErhw0FFjLIcjxtSeDfXfrLVpTeE
 4J1rsTv+BTK7VZXRHjFpWv5SbP049p+UJWx7ex9QAx4ETuQ06dHsK6O51E1Z0QdF18Su
 1GRUWkMRwt8V282BmRH1N9lNW/4Qfx9d2PRhZULYZj1dZMoskLwg1K6ZjzOObnhl/NfL
 hoAA==
X-Gm-Message-State: AC+VfDwpSvYL/MALv+RGqpPO94RxvUWRLqqGOKeXweDn1U2+1bfy9t2/
 taUcjFlbWjCFYa9lzN6XoVG9gg==
X-Google-Smtp-Source: ACHHUZ4fsf7entq/TqQHyVWqJq0weOB/V/hoJn2umvRJrVqBR2ysA/a7Oxt/kBOm+TCRkfQxrBtHdQ==
X-Received: by 2002:a17:902:ea08:b0:1af:cbb6:61ff with SMTP id
 s8-20020a170902ea0800b001afcbb661ffmr3900923plg.64.1684870287842; 
 Tue, 23 May 2023 12:31:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:af98:af9d:ed15:f8b3])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902b49200b001aaef9d0102sm7109947plr.197.2023.05.23.12.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 12:31:27 -0700 (PDT)
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
Subject: [PATCH 8/9] HID: i2c-hid: Do panel follower work on the system_wq
Date: Tue, 23 May 2023 12:28:02 -0700
Message-ID: <20230523122802.8.I962bb462ede779005341c49320740ed95810021d@changeid>
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

Turning on an i2c-hid device can be a slow process. This is why
i2c-hid devices use PROBE_PREFER_ASYNCHRONOUS. Unfortunately, when
we're a panel follower the i2c-hid power up sequence now blocks the
power on of the panel. Let's fix that by scheduling the work on the
system_wq.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/hid/i2c-hid/i2c-hid-core.c | 42 +++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index f1bb89377e8d..800f0dc6f6cf 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -110,7 +110,9 @@ struct i2c_hid {
 
 	struct i2chid_ops	*ops;
 	struct drm_panel_follower panel_follower;
+	struct work_struct	panel_follower_prepare_work;
 	bool			is_panel_follower;
+	bool			prepare_work_finished;
 };
 
 static const struct i2c_hid_quirks {
@@ -1062,10 +1064,12 @@ int i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
 	return ret;
 }
 
-int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)
+void ihid_core_panel_prepare_work(struct work_struct *work)
 {
-	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
+	struct i2c_hid *ihid = container_of(work, struct i2c_hid,
+					    panel_follower_prepare_work);
 	struct hid_device *hid = ihid->hid;
+	int ret;
 
 	/*
 	 * hid->version is set on the first power up. If it's still zero then
@@ -1073,15 +1077,44 @@ int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)
 	 * steps.
 	 */
 	if (!hid->version)
-		return i2c_hid_core_initial_power_up(ihid);
+		ret = i2c_hid_core_initial_power_up(ihid);
+	else
+		ret = i2c_hid_core_resume(ihid);
 
-	return i2c_hid_core_resume(ihid);
+	if (ret)
+		dev_warn(&ihid->client->dev, "Power on failed: %d\n", ret);
+	else
+		WRITE_ONCE(ihid->prepare_work_finished, true);
+
+	/* Match with i2c_hid_core_panel_unpreparing() */
+	smp_wmb();
+}
+
+int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)
+{
+	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
+
+	/*
+	 * Powering on a touchscreen can be a slow process. Queue the work to
+	 * the system workqueue so we don't block the panel's power up.
+	 */
+	WRITE_ONCE(ihid->prepare_work_finished, false);
+	schedule_work(&ihid->panel_follower_prepare_work);
+
+	return 0;
 }
 
 int i2c_hid_core_panel_unpreparing(struct drm_panel_follower *follower)
 {
 	struct i2c_hid *ihid = container_of(follower, struct i2c_hid, panel_follower);
 
+	cancel_work_sync(&ihid->panel_follower_prepare_work);
+
+	/* Match with ihid_core_panel_prepare_work() */
+	smp_rmb();
+	if (!READ_ONCE(ihid->prepare_work_finished))
+		return 0;
+
 	return i2c_hid_core_suspend(ihid);
 }
 
@@ -1124,6 +1157,7 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 
 	init_waitqueue_head(&ihid->wait);
 	mutex_init(&ihid->reset_lock);
+	INIT_WORK(&ihid->panel_follower_prepare_work, ihid_core_panel_prepare_work);
 
 	/* we need to allocate the command buffer without knowing the maximum
 	 * size of the reports. Let's use HID_MIN_BUFFER_SIZE, then we do the
-- 
2.40.1.698.g37aff9b760-goog

