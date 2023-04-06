Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E116DA2ED
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E930710ED02;
	Thu,  6 Apr 2023 20:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6A410ECFB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:32:20 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id qb20so4219170ejc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3WDgIBkollEzDBIBjWhtjP5ugtMko4aj0Kcc2FaKa74=;
 b=R/wx04KxX7kTGS1tkTDAu14ouXso0l5PgJMuS4BC9ZqoTgFumWIY68wpkSHtUdTlIO
 gF2BT/RMDFfHRWEiTPUeuWoo4JOFvGl7cObxgV2+6qm9dkk7RIp2iktkHCnHWNDPqYz+
 0vrhmwkd7YTHzw+T8QjC4SzIidAEMivBBBrmnKmpbPSGjDQxltVG9Gkm/3WCQrY0iUaa
 D20+FPkuIq1jyWZSimsciJJuYFCfZ2LXGh7l1uJB4C6XfZGjqnTuJ9hZ6IDQ0H4FjptS
 QeYOYdf7Hwzh55/ssuHtp90ccijyIeibonJYzVGsV7H9xnxX/WxOuGQ9SR/bt8zj1KiM
 fdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3WDgIBkollEzDBIBjWhtjP5ugtMko4aj0Kcc2FaKa74=;
 b=rJb8XBJpW9ZW8KiIEdkSo1ag7yUCWBWh8RlWHWW7hdXqjUj1rEvYjvNU9NXTFVvqAv
 D/Bb+0tZ0TALCcpYCErxkWL03AhZDGDzhQDpicJ32Q1J/A7yvC1FR7WzQhw/aP4QjRfr
 f093ToDXoCBerOHe3G8xJiQqERD40noidNZcEfR2BSXneKl5Jiq7Wdf7dmndow9OcyvK
 SDoAUtY1f0WMzFey/bIQ2iDOStm73re6UdRiKYSUMOcA0bgjCR3Lf6lpjEXP2gj+i4Ln
 YNI4+juiQl/YJNi1wYD828HT1njIxD3c+okXN5bx0wex9iS46OCg1olwXr4nRgedRR7m
 qwiw==
X-Gm-Message-State: AAQBX9f2H2HUlLChd7zglrs3M1cPGBYxGQGkOuFjvRCDoJFasUs9WpWY
 AHKT7uVVbhbbxq3gzMIKC5E3lg==
X-Google-Smtp-Source: AKy350Z2LdQYIdnwn8LF++hSLAjg3GDMSKGQ3iuIRuhmX80GFpyd6xkh5ySgSj0g/RAFei0/4fSjhA==
X-Received: by 2002:a17:906:b05:b0:926:9c33:ea4 with SMTP id
 u5-20020a1709060b0500b009269c330ea4mr221643ejg.27.1680813139797; 
 Thu, 06 Apr 2023 13:32:19 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:32:19 -0700 (PDT)
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
Subject: [PATCH 28/68] hwmon: lm95241: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:23 +0200
Message-Id: <20230406203103.3011503-29-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/lm95241.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
index f1ed777a8735..647a90570bc6 100644
--- a/drivers/hwmon/lm95241.c
+++ b/drivers/hwmon/lm95241.c
@@ -409,7 +409,7 @@ static void lm95241_init_client(struct i2c_client *client,
 				  data->model);
 }
 
-static const struct hwmon_channel_info *lm95241_info[] = {
+static const struct hwmon_channel_info * const lm95241_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
-- 
2.34.1

