Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A086DA2CF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C1F10ECF3;
	Thu,  6 Apr 2023 20:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E5C10ECF2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:31:45 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id by26so4206952ejb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ymHpZXssNqtDonOR2b4TMkX8XWnhpqpU7TZ/WfwdEo=;
 b=ZJsDhBuEnPU+XWsjRJuN9cu2H5d7cZRGkWPMvVrVibqBEt20qzWv2LIYXtXHwCOpG4
 hdNNPRGP6dEHQUXFmMBY+mhG15TWKjdVfHVCFIwnK7DXsTA0xd73GTpMm01GkE6ih1CW
 a+/9/Etlv1Wj91vR1YQPpAj50OfT26vlQ46X84PlTmP/R7Zi7jp9ZNITIjEm8NV95/N2
 LOgS39xpR+dgFnuFtr2sYBTHvSWskgfqgOQe5ux6zNS+nbfb7ogFAOjF/3eFODK755A9
 DSBgFlMzJQ2HJgjfexIT/HhFUQFS8LZrmzjq6p9XDTl5G0tRjxwDakBmsoePD+gcMeDl
 wB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ymHpZXssNqtDonOR2b4TMkX8XWnhpqpU7TZ/WfwdEo=;
 b=BFnB/BGZshhvt8PVl9m6l5CxZCRPqIi0TTsjNub2DMbEyR/ykMN5vm63vdJAWyq5vj
 iSNtsmNfA/3Tjei3mMlZ8QJzneoXNNkBUWF4OeFurs31l8d5fKe/6PZQJF8jJAf9N/BM
 +6hqP1DtjVQN17rxUYIrntQBdP3INdXXY2pCCzUY6iNw0VEWnwgDq97kfTGdBdggm6kC
 wFkQuh2Bk00tUXpeKA20kXazCKHycdretcWLK/4X95A6vIc5HAosrdh7I1O+DHy/s9VH
 XG+ztn6gM+uTO1WYuN4e02JmEwFlmeRxIV0fpgsZDrvCyGsJC45ClwhhWvPNqwpUEHYC
 j6Xw==
X-Gm-Message-State: AAQBX9e9oXqfPm9E+qOMrg43tJrLlrZ40yKuKmvUbP32iouDUi5m53ii
 mIr3bdIVCVq3GNWdC3GK43ypfA==
X-Google-Smtp-Source: AKy350bucCri+8AHWtLb5wN33M8gUHT7vaZfhbXGtulRDaMMlZTYuwavPaD95Oj0MIEjw9jPUIYk/g==
X-Received: by 2002:a17:906:442:b0:932:1af9:7386 with SMTP id
 e2-20020a170906044200b009321af97386mr135600eja.27.1680813104409; 
 Thu, 06 Apr 2023 13:31:44 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:31:44 -0700 (PDT)
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
Subject: [PATCH 13/68] hwmon: dell-smm: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:08 +0200
Message-Id: <20230406203103.3011503-14-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/dell-smm-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 7ac778aedc68..44aaf9b9191d 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -920,7 +920,7 @@ static const struct hwmon_ops dell_smm_ops = {
 	.write = dell_smm_write,
 };
 
-static const struct hwmon_channel_info *dell_smm_info[] = {
+static const struct hwmon_channel_info * const dell_smm_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_LABEL,
-- 
2.34.1

