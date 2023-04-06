Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCE66DA2C5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530E510ECEF;
	Thu,  6 Apr 2023 20:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B97B10ECED
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:31:39 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id jw24so4216404ejc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0o/5+RoY1xsbRUDa2AFV0+g4brx+liGdLo6ECyosb9g=;
 b=e1j2ok3u7VKsR1y6roskcfNxp1+JClKqjk7Csr46nCNqwp+tvujjHQEMIxbTKklgfQ
 xf1Q+6FoEZZaW0f3QmwUdOlf+txDQNXpyppc7ZPBeyq5F1sEugpq0ioWRrBR/9emC3Qk
 P0pPSi2jA6Yb5MC3ihtndLjnK427/fl1CpixkdRPS4uuZOXTnJPNT0vYQsShb2NttnKy
 Qmjsx9Q8X3FnKjQ8PnDQ89IjAC2xYBdayz5zCxdwn3liVhMBr+51fP3qqFdOT03SWUOo
 jIiHY08xSbx2ArReXkFEzh9RIvmLh3EpyMkqjCofJl85Ziun01chGFqxDu6nxJfbJXsB
 YXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0o/5+RoY1xsbRUDa2AFV0+g4brx+liGdLo6ECyosb9g=;
 b=qiLRZ4f7mDk1OW02MK1X4VBPwgJzMYDfX5bbu8qOsmErVRY7SDlsevPGGWMFsqQdEB
 hGhNsyYZ7DTiTU0t+PFG/rRXs7KEh/Hv4R6sJmTLoVhSo83WHlbruzCvgkNQJ5WFHylE
 zSP5PPYTsLAULoi9nNVErzrWG3PwPiLzQxGq4FfIks1PaV0mXQwSoII5Iva52Io7vNUS
 +We4eACpxEtDVAZ7bPVru+2F+qsFOiobJm2b5q6liS2icNUei1eS61rOL8eprKJ19Byf
 4CyMdh0IyiP12qDrF4kuKKufg/I5pyOMz4Jf09bodAPz2ZUmcsZj4cnZmGQlFLubdbES
 hFaw==
X-Gm-Message-State: AAQBX9fkNtBGMCOaKG7wW7D5AiylA+4pL/gLK9yUE4EyQNkSDSysBrp2
 7kRVQ3uGwWJv0ewgkxcsGteHag==
X-Google-Smtp-Source: AKy350an67ONjArurlKU83f3QFsUI86J4oBoCp0dWaiAvD+CmcW+xp7O+S3fVmQkXomQA9I3TeWW/w==
X-Received: by 2002:a17:906:924f:b0:884:9217:4536 with SMTP id
 c15-20020a170906924f00b0088492174536mr73325ejx.64.1680813097470; 
 Thu, 06 Apr 2023 13:31:37 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:31:37 -0700 (PDT)
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
Subject: [PATCH 10/68] hwmon: axi-fan: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:05 +0200
Message-Id: <20230406203103.3011503-11-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/axi-fan-control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
index 6724e0dd3088..5fd136baf1cd 100644
--- a/drivers/hwmon/axi-fan-control.c
+++ b/drivers/hwmon/axi-fan-control.c
@@ -394,7 +394,7 @@ static int axi_fan_control_init(struct axi_fan_control_data *ctl,
 	return ret;
 }
 
-static const struct hwmon_channel_info *axi_fan_control_info[] = {
+static const struct hwmon_channel_info * const axi_fan_control_info[] = {
 	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT),
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_LABEL),
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
-- 
2.34.1

