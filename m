Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841656DA2C9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2798810ECED;
	Thu,  6 Apr 2023 20:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E07810ECED
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:31:40 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id g18so4212132ejj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MMh9pMv1c2N5CZKj6o4hVDzOl36SVdvTrKYi4l5Ys4M=;
 b=bpvK+tpA6trKtvJrV4DZCtbwNaI1kDImEVeVQL637eqQHty8z4Qq9fSRbGNcHRWRG/
 FPMf9aY2qxiCS6r+3ssc+K9dV71SFj0TYCnZ2GHj5F16M/z752xuBwB8YxPNXqAuuARn
 TZrkjmRJ/rQCutKuBNz2TU/i/xu064lmxWLYCKcWS54oyvpm2JboWOLAXeyI8hy8SoVK
 pjZ3tPar2gZ6Gfrpr+nUYGX2MDmRbgg2z/AKPjwETZd3VjfaMa47TfTd9QpVeKAgh4c7
 D91heJ9XLjTA52/d2UQYgc+iTqtGkcUYCtjf6kKM9ouXIhYev1rb5rlvfNp/wprEAqHK
 ip/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MMh9pMv1c2N5CZKj6o4hVDzOl36SVdvTrKYi4l5Ys4M=;
 b=eDOLTbLGrefGcknQlXKYtasuf9p9ZT7b92gYC+LlGHs8VbCv626QlKbzKW2Rlcr/2H
 D2dI2kNbCAwza6wocUw+tdczgtfHElBX6ydDwvwll3hBMX+Qghhy6UFCUxCPzUNXfx98
 fl+ds+7h2snVseu1RmBS5M1IsnqsussOhAG3OtCxkh1qgoMttr8gDsIGeJOlp6nLddPJ
 zRKV8r3CyrHJeo/OIXzUnWY4gbZrAy1bGbXIcxL/rzNYAIPpp7lVH6e1iW89UzKqwx4C
 +XtgUsW+3sxxTIn90Utfl9npWKOAugG7IPlog8GbCwUKZtg4uS6rrfhYZzckjgveqArW
 W5cA==
X-Gm-Message-State: AAQBX9dum7B3/kC71jxs8bR3Lmbmgx6NqFEsJWGOzJNvegv6HFtPAcSd
 8TQLzC59k6eN2y+sWE1z+wqq8A==
X-Google-Smtp-Source: AKy350Yud0CdyQeRWD/f32T/icmKifXpYmvMz9y9aU59vYOZT5+tyTqiYLMimp0uRkG+9Xvbh1C6OQ==
X-Received: by 2002:a17:906:24d7:b0:932:2874:cc5 with SMTP id
 f23-20020a17090624d700b0093228740cc5mr235929ejb.16.1680813099901; 
 Thu, 06 Apr 2023 13:31:39 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:31:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Oded Gabbay <ogabbay@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Marius Zachmann <mail@mariuszachmann.de>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Clemens Ladisch <clemens@ladisch.de>, Rudolf Marek <r.marek@assembler.cz>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Jonas Malaco <jonas@protocubo.io>,
 Aleksandr Mezin <mezin.alexander@gmail.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
 Iwona Winiarska <iwona.winiarska@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans de Goede <hdegoede@redhat.com>, Michael Walle <michael@walle.cc>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Agathe Porte <agathe.porte@nokia.com>,
 Eric Tremblay <etremblay@distech-controls.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Luka Perkov <luka.perkov@sartura.hr>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, patches@opensource.cirrus.com,
 openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 11/68] hwmon: bt1-pvt: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:06 +0200
Message-Id: <20230406203103.3011503-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
References: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Statically allocated array of pointed to hwmon_channel_info can be made
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/bt1-pvt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/bt1-pvt.c b/drivers/hwmon/bt1-pvt.c
index 21ab172774ec..8d402a627306 100644
--- a/drivers/hwmon/bt1-pvt.c
+++ b/drivers/hwmon/bt1-pvt.c
@@ -379,7 +379,7 @@ static int pvt_read_alarm(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
 	return 0;
 }
 
-static const struct hwmon_channel_info *pvt_channel_info[] = {
+static const struct hwmon_channel_info * const pvt_channel_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
@@ -523,7 +523,7 @@ static int pvt_read_alarm(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
 	return -EOPNOTSUPP;
 }
 
-static const struct hwmon_channel_info *pvt_channel_info[] = {
+static const struct hwmon_channel_info * const pvt_channel_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
-- 
2.34.1

