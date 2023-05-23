Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 653CD70E56E
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 21:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0511E10E4AD;
	Tue, 23 May 2023 19:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0771610E4AC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 19:31:18 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5304d0d1eddso4318599a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684870278; x=1687462278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NwhjQZCvvhy/Fhe2cqOT5ULwyvfB9FhkM1yVz/dZTsc=;
 b=ZGVLMSlqBZzADdesr0F46WBsI6jocekqCveWms8L17Hg3V4+Iy0jhIMir6AN/GMZEa
 DHCurLabujU9TMOtIhSTwTIfHiEeQmSjTfhRl46KfNaPW8Wf5beMWP6+yimlnoOdk499
 rNp2X4A9iIdKI1mpk6mxx74zmAa+dhz0UT9Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684870278; x=1687462278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NwhjQZCvvhy/Fhe2cqOT5ULwyvfB9FhkM1yVz/dZTsc=;
 b=A3raZuo2ZZvq2u8ImETKPiY7/jlq83vGyWLvtg/98js6FKkt677ytAOrb9erEsXm9a
 xEdtG9I3njXBd1D1PdfxVM7SSpGeDIVvX0rUxn/NfccEybR5jt1YHSLRWHkvS1eK9o4U
 U4HgQZwL+5Nu2j6+VaMDpUYIFNouZwmxG4AM1fihie+j3JnRK7oaUsxYV2YwIvDaIPvS
 H72rrPUDtHCL4HwxbbA46YUWAZ6iJ3b/vhXEkzhjdqOi/Ha7OSN/nzC0oF9dBGGyAnC6
 wXvFnJarN1ESvaK68C0oLqgEfowvYzJH3aPnseAsJCzA/Z77OTT05h6wMXB2rDlb2n1y
 +nMg==
X-Gm-Message-State: AC+VfDyQRhv01VMutnwewWfWjZRFnB5r+Knyq1spBO2r03cqXWa9PiBZ
 +r6lifmz9k+1/w5s6fZ/g+w9rw==
X-Google-Smtp-Source: ACHHUZ5H3AXhDwPU6wHfhEkRIiYBkTVn1VvEuEpa+4Uf48lxfP80EXQc0E9CeDOQop0j/jx/UAsT1w==
X-Received: by 2002:a17:90b:1056:b0:252:94b5:36f1 with SMTP id
 gq22-20020a17090b105600b0025294b536f1mr12968558pjb.27.1684870278159; 
 Tue, 23 May 2023 12:31:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:af98:af9d:ed15:f8b3])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902b49200b001aaef9d0102sm7109947plr.197.2023.05.23.12.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 12:31:17 -0700 (PDT)
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
Subject: [PATCH 4/9] HID: i2c-hid: Switch to SYSTEM_SLEEP_PM_OPS()
Date: Tue, 23 May 2023 12:27:58 -0700
Message-ID: <20230523122802.4.Ib2a2865bd3c0b068432259dfc7d76cebcbb512be@changeid>
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

The SYSTEM_SLEEP_PM_OPS() allows us to get rid of '#ifdef
CONFIG_PM_SLEEP', as talked about in commit 1a3c7bb08826 ("PM: core:
Add new *_PM_OPS macros, deprecate old ones").

This change is expected to have no functional effect.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/hid/i2c-hid/i2c-hid-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index efbba0465eef..19d985c20a5c 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1085,7 +1085,6 @@ void i2c_hid_core_shutdown(struct i2c_client *client)
 }
 EXPORT_SYMBOL_GPL(i2c_hid_core_shutdown);
 
-#ifdef CONFIG_PM_SLEEP
 static int i2c_hid_core_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -1138,10 +1137,9 @@ static int i2c_hid_core_resume(struct device *dev)
 
 	return hid_driver_reset_resume(hid);
 }
-#endif
 
 const struct dev_pm_ops i2c_hid_core_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
+	SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
 };
 EXPORT_SYMBOL_GPL(i2c_hid_core_pm);
 
-- 
2.40.1.698.g37aff9b760-goog

