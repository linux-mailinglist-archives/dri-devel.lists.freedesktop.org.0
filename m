Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F6E6DA2D3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5DD10ECF7;
	Thu,  6 Apr 2023 20:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B5410ECF8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:31:55 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-93071f06a9dso138854466b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IMDS7DWeOGd1oXvvAq27Q40JyJ5tNkqdlBZXR66E9jc=;
 b=lGzZVAzr/SMPp5RADHMYy0lwwj1yV1xjGhALicSHU5BGnrobNZovzYVnY41wP8R7PO
 djbqeoZm0ay5iLRDoFOdVDJaJK2TK8hr9uzKetRKHEtIOhlMPsxzO+L89dLaS4iKnBFj
 odwt7WUbOvzUgXHttgae5xK6MdLktNuDw0E1G4i620jz4z5OcfU2dIZ0pnQG0bPhMo0o
 26AxsHgdVYA7zCzJ96BoTELp3riSwXeeB69Hmk1uZkmW69HU5lY7ZhpzUAYyxoWLm4rb
 sl8NwZdrT8Fpmbg9DjmgVjrwiM7XfJKKjDFkrTfVw433fe9LdglO2cwbzVeWT6zKs6f3
 jg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IMDS7DWeOGd1oXvvAq27Q40JyJ5tNkqdlBZXR66E9jc=;
 b=cGqtqLYqZbpRs0H2ZYzgGzBwtHOVJobfa0NeJ/SbJd1rAeq9o9wUT3aBx/T7i4Ei4x
 7Qy067zxy02nXYv+zL6uiHgRNnsF+L3vBrpgQPRAXmdJAbk1d0T46bbq4gzFOmRgvfzR
 /n0UCOkWPO1GcJI7jODNGg0WbXdZ73ANeek4/HlrLYSeMPNmTTIzzY+zqas8NZ8as7Zv
 Ej9b0Ks4nIUk6yQB868r3zf+2GxsHH7EYkgm6k1eE3jPpSDGmuMCW0eCCNZ5O3OI7pPD
 ugD/77EAlmsJtPD835R3VdTQ1LkxO4lMpSuhCbyncjlrnMNASu3xICrjqvcD9WZkP5PY
 eOpw==
X-Gm-Message-State: AAQBX9fxR8Cs+nDASYzhmnAcZtM7ij/F29VUoqLhQ/++zsN0Bc1PQTx1
 7BLu45Y2nllKwVehmgOjl0XohQ==
X-Google-Smtp-Source: AKy350aAyIrGW0PB9afhSj3XaLXU246uMMRzGoEwDk1xzzK7No0F8351o7M4LdpnTvKKZ+R6miepfQ==
X-Received: by 2002:a05:6402:1653:b0:4fd:2007:d40b with SMTP id
 s19-20020a056402165300b004fd2007d40bmr804080edx.9.1680813113718; 
 Thu, 06 Apr 2023 13:31:53 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:31:53 -0700 (PDT)
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
Subject: [PATCH 17/68] hwmon: gxp-fan: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:12 +0200
Message-Id: <20230406203103.3011503-18-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/gxp-fan-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gxp-fan-ctrl.c b/drivers/hwmon/gxp-fan-ctrl.c
index 0014b8b0fd41..2e05bc2f627a 100644
--- a/drivers/hwmon/gxp-fan-ctrl.c
+++ b/drivers/hwmon/gxp-fan-ctrl.c
@@ -168,7 +168,7 @@ static const struct hwmon_ops gxp_fan_ctrl_ops = {
 	.write = gxp_fan_ctrl_write,
 };
 
-static const struct hwmon_channel_info *gxp_fan_ctrl_info[] = {
+static const struct hwmon_channel_info * const gxp_fan_ctrl_info[] = {
 	HWMON_CHANNEL_INFO(fan,
 			   HWMON_F_FAULT | HWMON_F_ENABLE,
 			   HWMON_F_FAULT | HWMON_F_ENABLE,
-- 
2.34.1

