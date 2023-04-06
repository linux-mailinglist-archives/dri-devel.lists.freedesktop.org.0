Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C15806DA2DD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1380210ECFC;
	Thu,  6 Apr 2023 20:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9B210ECFE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:32:01 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id 11so4213641ejw.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7Jy8Z4lQeZ0wRB6o7UIjx/s2l2tRer+BWQLAS8zWPg=;
 b=Z2eFE6i7URGSrUcq19N/qYIU6025nFLK2hWRYbP7q/Cq06Q69LTeZs5RMcQTIMXLVb
 3GHpjVPXAqoVVTOw6JK42HXPDXsTbbsqk4Kwz1CSpH2dicwn7L3p65C+xVDebLPONsHT
 pHUTiFhJhi53VA8QEY6qBY9w2OgxhjcwL+GG1X7ApeF/CYuxstrcEuf3/hopgWFiFrOI
 weqXUj7Jn1UWWf1nKdrL/UU31no/btv0AYqzRv3ZMmjd6QfDg6RiR0NS7benxEF+sQK6
 R1mBFXwD5ecjSe6BvqnE5orT7bskqLCxT8XxJ5oeu+D3fsYmXXR4GBDYcPO6jVEBvqia
 nBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o7Jy8Z4lQeZ0wRB6o7UIjx/s2l2tRer+BWQLAS8zWPg=;
 b=YlJ4HpkMO1fxkkq+EwP1IKvfw3foyquHs9ECok7749XObrCvg1LkOVzZ+3lavum6U9
 4niwOmzFArGNDHTCyYQ5fg5E6PUmXmdrPI03edekSkKRxnw1E8aP6VuVcIklb53OsAsD
 m2qz6+oEVdS7zvWRfFxd2FezFQ00amfwhNIhtoXSSbc3XMIm7LEsPkn6GNKY32+uBeF2
 PZrUevseNwlCtMJfyamRRDmsVPMtD555vmBjGqvT4wSM93b5vjgYRcTgiNsDJt5V/18o
 SlT060ewMF+KHmUkMKRcFIS3pH+7W6NnR0h52haDMzADDxT6EzQPcj9i3LFNjbM6AeCG
 3HlA==
X-Gm-Message-State: AAQBX9euiKr/bDyLXL2qnujjJrqNXvO9D+pJqVzqRbcCIZncpZQYY+pR
 FsJ9sW1jdirOJDJ0uBf6j5JpVA==
X-Google-Smtp-Source: AKy350ZWpcLNtPVNGNTGeWcT9D6JcdnabpEIq7kEjhcu9FSp1PxTjFsVhQwwsMEPT5I+96ZRKvmQ6Q==
X-Received: by 2002:a17:906:6046:b0:93e:9362:7607 with SMTP id
 p6-20020a170906604600b0093e93627607mr129978ejj.20.1680813121112; 
 Thu, 06 Apr 2023 13:32:01 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:32:00 -0700 (PDT)
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
Subject: [PATCH 20/68] hwmon: ina3221: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:15 +0200
Message-Id: <20230406203103.3011503-21-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/ina3221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index f3a4c5633b1e..2735e3782ffb 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -650,7 +650,7 @@ static umode_t ina3221_is_visible(const void *drvdata,
 				   HWMON_C_CRIT | HWMON_C_CRIT_ALARM | \
 				   HWMON_C_MAX | HWMON_C_MAX_ALARM)
 
-static const struct hwmon_channel_info *ina3221_info[] = {
+static const struct hwmon_channel_info * const ina3221_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_SAMPLES,
 			   HWMON_C_UPDATE_INTERVAL),
-- 
2.34.1

