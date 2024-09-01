Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA4296749C
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 06:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9FB10E12C;
	Sun,  1 Sep 2024 04:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gO+228wa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4237510E17F
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 04:07:24 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7141285db14so2760251b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 21:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725163644; x=1725768444;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nad3jYq+zuMNkdjkLGBBGQbMhdXY1+s1WlyYMjA8ho4=;
 b=gO+228waWIg0zDO7yIRLs1bWsmT2VOaHaiLs7OxERe38fohEzUO3g14avhvpmFRTP6
 9jmn+EjV88mh1pcJkVlPF0uJZSYEIpVCWq0dKMK9JJ+Rdqs6e4ZytESCn4NVy3MpAqwB
 c31uSRFYE/d6OBxGpaYsECKyV7pzAXbwZ1WJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725163644; x=1725768444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nad3jYq+zuMNkdjkLGBBGQbMhdXY1+s1WlyYMjA8ho4=;
 b=Xv3ZshkTaZwL/uBP7tySznzJeJ527OsxLMME3EMVvrbuOe2MrDwYtdtkaoOeFjbNfJ
 LI0MEtLsuyCKfg9TCyr7fchIAslVRBMT0M9B7Pn53AKDfw5X1iBKJ4rsAvLsl/9VH88H
 hVKIgQ+pofkM89z3dBaKXeO6eaaYuoOxNhkzdHz4gIsEIvfA55ClzFiOGtwjz1vggXOH
 gERXJN9kmUurm79R/VZX7fSpee4gVmtbanvlJ2fbYqemajHPhV+PEqnm4D1sJgRoP2Pr
 ppI5kwjeOUTgKJ2gXMRIsIPy+zinbPNsSXU3x6KfxilST070NXuzV/Fm+qM99ag5MUuv
 DkkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkhBUQVyME84U7E5m5a1lFWObsJJPKMHBz4DaYVsZhTHKgCQXybK4/TlUrfUMXmi/OpWIAwR4aLfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4DVIHLiQAn2WbCWiGtCcOTYoaBP3ypzp7GsYJpR8cDYaYgsc0
 RvznFnTW5uhjLqGn59CYF4QQy+nDlPuW6sQpYSOKL+7h/o0qPn3A17/liu0K5Q==
X-Google-Smtp-Source: AGHT+IE4gRNS1Wle0dhusZLk2Qf9YkMQZghXHbtMZ6oKKSwEP4ondmRftvf+lk7yL+f1D9vFEqjyTA==
X-Received: by 2002:a05:6a00:91d8:b0:714:147c:1377 with SMTP id
 d2e1a72fcca58-7173b5c8556mr4671065b3a.7.1725163643536; 
 Sat, 31 Aug 2024 21:07:23 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-715e569ef39sm4828452b3a.122.2024.08.31.21.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Aug 2024 21:07:23 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 10/18] devcon property: Document devcon_match_fn_t
Date: Sat, 31 Aug 2024 21:06:48 -0700
Message-ID: <20240901040658.157425-11-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240901040658.157425-1-swboyd@chromium.org>
References: <20240901040658.157425-1-swboyd@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The usage of this match function is hard to understand at a glance.
Document the arguments and the return value so it is clear how to
implement the function.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 include/linux/property.h | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/include/linux/property.h b/include/linux/property.h
index 61fc20e5f81f..797b1eeda7d2 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -507,8 +507,25 @@ unsigned int fwnode_graph_get_endpoint_count(const struct fwnode_handle *fwnode,
 int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 				struct fwnode_endpoint *endpoint);
 
-typedef void *(*devcon_match_fn_t)(const struct fwnode_handle *fwnode, const char *id,
-				   void *data);
+/**
+ * devcon_match_fn_t - device connection match function
+ * @fwnode: Remote connection's device node
+ * @con_id: Identifier for the connection
+ * @data: Match function caller specific data
+ *
+ * Implement a callback with this function signature to search a fwnode's
+ * connections for a match with a function like device_connection_find_match().
+ * This function will be called possibly multiple times, once for each
+ * connection. The match function should inspect the @fwnode to look for a
+ * match. The @con_id and @data provided are the same as the @con_id and @data
+ * arguments passed to the functions that take a devcon_match_fn_t argument.
+ *
+ * Note: This function can be called multiple times.
+ *
+ * Return: Pointer to match or NULL if no match found.
+ */
+typedef void *(*devcon_match_fn_t)(const struct fwnode_handle *fwnode,
+				   const char *con_id, void *data);
 
 void *fwnode_connection_find_match(const struct fwnode_handle *fwnode,
 				   const char *con_id, void *data,
-- 
https://chromeos.dev

