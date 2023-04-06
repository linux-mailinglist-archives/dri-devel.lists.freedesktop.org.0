Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271796DA2D0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDEF10ECF4;
	Thu,  6 Apr 2023 20:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DA610ECF3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:31:48 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id 11so4212427ejw.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8kO+PL2OFiPmkOUfRzx6T8b5f8KU+CAGl37StCrMXYs=;
 b=lYo5bC7iQfW8JnfvljadSqJdwd+jSfv9/x+oLITfhU9jsiq6GDzYZ1VDzUKfmv3LmW
 Ici63XQmaGqd8hcJaUwb+omhio2Z3bnDvX8bWMMMMDbil9f5gvNd8ufl2qUq9b59mA4A
 5WagyI+jE8NPsww/pU2d3IJqVrejUStThru5Dfwv8oj40mBP1D6yZNx6nb19oowt21+n
 gQ68nf5/FjDx9z6b6VOfTVk7JUEt4YeyvrMTMA63d6c9OBXhmvVfqEWtSUJbEimAIe1d
 yy8dLmraQMmNdye7f7BtbBUyhFLKSN5PPrjuCjXeZFt8fZunMo3egoNDLE6yhLy/g4YM
 bwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8kO+PL2OFiPmkOUfRzx6T8b5f8KU+CAGl37StCrMXYs=;
 b=tZlIZ2yih3hfgKhD3+AjMfvIwzIuIJFqTTmvwAHC4wheXuqMlms9S2CS7Lz84qlgGx
 KGYsMBsSv34oc1Y0j/gMhrA0ZbRSQhXx5qv5JbvJrbaDf/lawQ8JWjVpvcaNjfLO8sU6
 5U3NU5tA+AmN4bKsm3rqlLCBkWfWayZYKtF0styvLWqj7eWLfkLR9QJwMX0JcFT7efzO
 /eNYs4iYIFNphnlC5ss+2xKXkRMmGAhX6U0T6R+F29Q6euIs8wEkT4lOhEh1b7QS2/90
 Q87ZYG0o8KTR8PAONU2jjun4jdHp5mnzNY87N3JX/Rn8OOxKu1VWlfJDOm+9wLXT+vv3
 xUoA==
X-Gm-Message-State: AAQBX9ehdqW1Xadx38xzlfyhUxTun1I8nmw+5+c/rWBvxBC4h+McUbpT
 /TjHflb0Yl6XkSRPLw23El2lBQ==
X-Google-Smtp-Source: AKy350YcLjLUUz1vvV2Oec0ITUhNxaSebo05M98PAAOHSS8hMv2/No8ivJPosNn6kB+9Ksg+aAx6JQ==
X-Received: by 2002:a17:907:a702:b0:934:60b1:a4b7 with SMTP id
 vw2-20020a170907a70200b0093460b1a4b7mr93238ejc.51.1680813106993; 
 Thu, 06 Apr 2023 13:31:46 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:31:46 -0700 (PDT)
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
Subject: [PATCH 14/68] hwmon: drivetemp: constify pointers to
 hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:09 +0200
Message-Id: <20230406203103.3011503-15-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/drivetemp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
index 8e5759b42390..e73b7bfc6af3 100644
--- a/drivers/hwmon/drivetemp.c
+++ b/drivers/hwmon/drivetemp.c
@@ -526,7 +526,7 @@ static umode_t drivetemp_is_visible(const void *data,
 	return 0;
 }
 
-static const struct hwmon_channel_info *drivetemp_info[] = {
+static const struct hwmon_channel_info * const drivetemp_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT |
-- 
2.34.1

