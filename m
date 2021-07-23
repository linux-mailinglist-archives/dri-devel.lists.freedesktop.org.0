Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DB93D30CC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 02:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719F66F884;
	Fri, 23 Jul 2021 00:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA81B6F880
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 00:22:17 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id j1so6659540pjj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 17:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QIfL2wi4rwyW3wFJc4TBxi5hgLk5jqj90hpJmrNmT08=;
 b=ffzYNOq+5NVIrjnzOEMQvzZiScPi84W+VikPLqJD6LV9d9YyiO2l7ClDARkhr/K97M
 pFa+YpWWemm8hWsjssa1u+22dNYXE7YcTvlFyc3sxbWbbJGCjPmb59fPeLMf1jgsrKDk
 sTbH07TxjFiFNzZRPa1ELyE0P0wB6UQE1NT+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QIfL2wi4rwyW3wFJc4TBxi5hgLk5jqj90hpJmrNmT08=;
 b=oxQo1YjfgoSRJf/6gJqhY4ciqBcTdwacHVh4QGbqTHIlgrvEQYA/dQh0gLcatyoPcJ
 r9zh8z2HJCMe0ojLmYXVLxylNFozfIMUHQA//2c/i/9yEYLunfrq+WhxKnCYGS2AJ2p+
 Zdt7j1aHZdsEuTykdLfBSE8sKc3TyKbzaY/1kndiDYPXJ8JNNlvzXQBZG303KXzC3ChT
 BJOgAjA3v5+WBmUa2vGfD4dRh20KZtAYGzEEKnX4OY3/8q+CMcbi8IN5rm5BMYGVewbU
 LD4fXiiFWvdEY/aSTck3gRX60dLy+wRQ2n8cvMHwr9zEsyCe2YGw2t6uVCCs1AWCpvY3
 cY5Q==
X-Gm-Message-State: AOAM533u9qyh3FCvKLqwRAYojxfI2ynbJtNj9yrscKNgnrgg791jzyt4
 Ea5n2TRf25LrGJ7wW8rnUvpShA==
X-Google-Smtp-Source: ABdhPJxWVzz5mUT/xV8/8vfmjmFYzTrPcG2YkgBhXf9lv6EOfBA5NQ4+xu9T8hBisfib0fVtYQEr8w==
X-Received: by 2002:a63:ee06:: with SMTP id e6mr2400550pgi.374.1626999737393; 
 Thu, 22 Jul 2021 17:22:17 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:5e70:6a49:67b5:2b7e])
 by smtp.gmail.com with ESMTPSA id iy13sm4072377pjb.28.2021.07.22.17.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 17:22:16 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 6/8] drm/panel-simple: Split the delay structure out of
 the panel description
Date: Thu, 22 Jul 2021 17:21:44 -0700
Message-Id: <20210722172104.RFC.6.I11c226341f8e86d376a53d5ec11cb82f6fd2c38c@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210723002146.1962910-1-dianders@chromium.org>
References: <20210723002146.1962910-1-dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steev Klimaszewski <steev@kali.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the case where we can read an EDID for a panel the only part of the
panel description that can't be found directly from the EDID is the
description of the delays. Let's break the delay structure out so that
we can specify just the delays for panels that are detected by EDID.

This is simple code motion. No functional change is intended.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 191 ++++++++++++++-------------
 1 file changed, 98 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c08bc70f7798..80bc60648ecf 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -41,6 +41,103 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 
+/**
+ * struct panel_delay - Describes delays for a simple panel.
+ */
+struct panel_delay {
+	/**
+	 * @prepare: Time for the panel to become ready.
+	 *
+	 * The time (in milliseconds) that it takes for the panel to
+	 * become ready and start receiving video data
+	 */
+	unsigned int prepare;
+
+	/**
+	 * @hpd_absent_delay: Time to wait if HPD isn't hooked up.
+	 *
+	 * Add this to the prepare delay if we know Hot Plug Detect
+	 * isn't used.
+	 */
+	unsigned int hpd_absent_delay;
+
+	/**
+	 * @prepare_to_enable: Time between prepare and enable.
+	 *
+	 * The minimum time, in milliseconds, that needs to have passed
+	 * between when prepare finished and enable may begin. If at
+	 * enable time less time has passed since prepare finished,
+	 * the driver waits for the remaining time.
+	 *
+	 * If a fixed enable delay is also specified, we'll start
+	 * counting before delaying for the fixed delay.
+	 *
+	 * If a fixed prepare delay is also specified, we won't start
+	 * counting until after the fixed delay. We can't overlap this
+	 * fixed delay with the min time because the fixed delay
+	 * doesn't happen at the end of the function if a HPD GPIO was
+	 * specified.
+	 *
+	 * In other words:
+	 *   prepare()
+	 *     ...
+	 *     // do fixed prepare delay
+	 *     // wait for HPD GPIO if applicable
+	 *     // start counting for prepare_to_enable
+	 *
+	 *   enable()
+	 *     // do fixed enable delay
+	 *     // enforce prepare_to_enable min time
+	 */
+	unsigned int prepare_to_enable;
+
+	/**
+	 * @power_to_enable: Time for the power to enable the display on.
+	 *
+	 * The time (in milliseconds) to wait after powering up the display
+	 * before asserting its enable pin.
+	 */
+	unsigned int power_to_enable;
+
+	/**
+	 * @disable_to_power_off: Time for the disable to power the display off.
+	 *
+	 * The time (in milliseconds) to wait before powering off the display
+	 * after deasserting its enable pin.
+	 */
+	unsigned int disable_to_power_off;
+
+	/**
+	 * @enable: Time for the panel to display a valid frame.
+	 *
+	 * The time (in milliseconds) that it takes for the panel to
+	 * display the first valid frame after starting to receive
+	 * video data.
+	 */
+	unsigned int enable;
+
+	/**
+	 * @disable: Time for the panel to turn the display off.
+	 *
+	 * The time (in milliseconds) that it takes for the panel to
+	 * turn the display off (no content is visible).
+	 */
+	unsigned int disable;
+
+	/**
+	 * @unprepare: Time to power down completely.
+	 *
+	 * The time (in milliseconds) that it takes for the panel
+	 * to power itself down completely.
+	 *
+	 * This time is used to prevent a future "prepare" from
+	 * starting until at least this many milliseconds has passed.
+	 * If at prepare time less time has passed since unprepare
+	 * finished, the driver waits for the remaining time.
+	 */
+	unsigned int unprepare;
+};
+
 /**
  * struct panel_desc - Describes a simple panel.
  */
@@ -85,99 +182,7 @@ struct panel_desc {
 	} size;
 
 	/** @delay: Structure containing various delay values for this panel. */
-	struct {
-		/**
-		 * @delay.prepare: Time for the panel to become ready.
-		 *
-		 * The time (in milliseconds) that it takes for the panel to
-		 * become ready and start receiving video data
-		 */
-		unsigned int prepare;
-
-		/**
-		 * @delay.hpd_absent_delay: Time to wait if HPD isn't hooked up.
-		 *
-		 * Add this to the prepare delay if we know Hot Plug Detect
-		 * isn't used.
-		 */
-		unsigned int hpd_absent_delay;
-
-		/**
-		 * @delay.prepare_to_enable: Time between prepare and enable.
-		 *
-		 * The minimum time, in milliseconds, that needs to have passed
-		 * between when prepare finished and enable may begin. If at
-		 * enable time less time has passed since prepare finished,
-		 * the driver waits for the remaining time.
-		 *
-		 * If a fixed enable delay is also specified, we'll start
-		 * counting before delaying for the fixed delay.
-		 *
-		 * If a fixed prepare delay is also specified, we won't start
-		 * counting until after the fixed delay. We can't overlap this
-		 * fixed delay with the min time because the fixed delay
-		 * doesn't happen at the end of the function if a HPD GPIO was
-		 * specified.
-		 *
-		 * In other words:
-		 *   prepare()
-		 *     ...
-		 *     // do fixed prepare delay
-		 *     // wait for HPD GPIO if applicable
-		 *     // start counting for prepare_to_enable
-		 *
-		 *   enable()
-		 *     // do fixed enable delay
-		 *     // enforce prepare_to_enable min time
-		 */
-		unsigned int prepare_to_enable;
-
-		/**
-		 * @delay.power_to_enable: Time for the power to enable the display on.
-		 *
-		 * The time (in milliseconds) to wait after powering up the display
-		 * before asserting its enable pin.
-		 */
-		unsigned int power_to_enable;
-
-		/**
-		 * @delay.disable_to_power_off: Time for the disable to power the display off.
-		 *
-		 * The time (in milliseconds) to wait before powering off the display
-		 * after deasserting its enable pin.
-		 */
-		unsigned int disable_to_power_off;
-
-		/**
-		 * @delay.enable: Time for the panel to display a valid frame.
-		 *
-		 * The time (in milliseconds) that it takes for the panel to
-		 * display the first valid frame after starting to receive
-		 * video data.
-		 */
-		unsigned int enable;
-
-		/**
-		 * @delay.disable: Time for the panel to turn the display off.
-		 *
-		 * The time (in milliseconds) that it takes for the panel to
-		 * turn the display off (no content is visible).
-		 */
-		unsigned int disable;
-
-		/**
-		 * @delay.unprepare: Time to power down completely.
-		 *
-		 * The time (in milliseconds) that it takes for the panel
-		 * to power itself down completely.
-		 *
-		 * This time is used to prevent a future "prepare" from
-		 * starting until at least this many milliseconds has passed.
-		 * If at prepare time less time has passed since unprepare
-		 * finished, the driver waits for the remaining time.
-		 */
-		unsigned int unprepare;
-	} delay;
+	struct panel_delay delay;
 
 	/** @bus_format: See MEDIA_BUS_FMT_... defines. */
 	u32 bus_format;
-- 
2.32.0.432.gabb21c7263-goog

