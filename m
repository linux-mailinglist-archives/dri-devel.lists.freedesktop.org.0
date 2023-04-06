Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F18C6DA2DB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C6410ECFA;
	Thu,  6 Apr 2023 20:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAB210ECF9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:32:03 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id 11so4213857ejw.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y2mVQ5empood++BDorTJ/weXm8Mrumxl4wyeCMmuFPc=;
 b=DRP5f0xCBkopIx7BmxPv6s1+3FId1k68mLGA9qo2Ng8EZstP3Sy+utxgejlyUM/RcI
 EsKNucC0AtqH8zTLd7M+LjOzpl/Mz2ZgGFwbDXqLWo24co2uqs4y08qAPGD0epTPmUDn
 HqbghHxgsKm2QGnpbFyDEjWpRJqlqR2VA0YIYYuVb3ug34fTs78bGdoN6T7iz+xcPavI
 eEZLasfB8HV22tARMLXazLczPKWcfXzyRpJX/RRm/ftFCizli/zRyzL7zdvp+RJZJwWP
 sKPh4Ii4UelEha6smoN1/1l2X1RzB4E9iLl1hxkgjT6138duMap5w2dVkOmyLbZ2FjsU
 opug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y2mVQ5empood++BDorTJ/weXm8Mrumxl4wyeCMmuFPc=;
 b=AFYGCze7I4r2phwzZeySkU0W+TeS+BxRsxqohrqoYNr1v3y6vBPtnLGpB2/0Zrb7xE
 So+3nRUbUV0xR6mzRGZfI5Jz/TeDSOadlvWxApq8J0/unYFp6HNeCilPnV2jVNlbXXRB
 lTHYKetjsE2o9uQZHuSH1MMZveYpX+KKJ+lwX98NvcjHIrGAIht/5xvmT/kgAtDfiRum
 H5xR4N7vGIab644tZz4yOljlzxVQtlKtBDBiryJgJIbJX/EZaa3XXqS+0uShfU1X9N0H
 aQFf/1cXlXQR31htj3PL6ca/Dj7GTWM77DDVdBXAiGOB8RbazBmIBIiAs8poHTb9paad
 L9aA==
X-Gm-Message-State: AAQBX9cESJyuQ5d7SjBqjn39iAgdcfRgLRDHdTnBmzoTrhYjYXpo7dZQ
 JVaRKXGXhCsyI4P7qgrNn43Lug==
X-Google-Smtp-Source: AKy350at4RVASepxc3SPs3+U+hY5w5cRaraJu7UW9VBSvb5rm8OUubA+yjerPfhwRUJ+h3KdjE6snA==
X-Received: by 2002:a17:906:46da:b0:949:8772:8195 with SMTP id
 k26-20020a17090646da00b0094987728195mr134045ejs.38.1680813123383; 
 Thu, 06 Apr 2023 13:32:03 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:32:02 -0700 (PDT)
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
Subject: [PATCH 21/68] hwmon: intel-m10-bmc: constify pointers to
 hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:16 +0200
Message-Id: <20230406203103.3011503-22-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/intel-m10-bmc-hwmon.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/intel-m10-bmc-hwmon.c b/drivers/hwmon/intel-m10-bmc-hwmon.c
index 2f0323c14bab..6512f4bec79a 100644
--- a/drivers/hwmon/intel-m10-bmc-hwmon.c
+++ b/drivers/hwmon/intel-m10-bmc-hwmon.c
@@ -24,7 +24,7 @@ struct m10bmc_sdata {
 
 struct m10bmc_hwmon_board_data {
 	const struct m10bmc_sdata *tables[hwmon_max];
-	const struct hwmon_channel_info **hinfo;
+	const struct hwmon_channel_info * const *hinfo;
 };
 
 struct m10bmc_hwmon {
@@ -67,7 +67,7 @@ static const struct m10bmc_sdata n3000bmc_power_tbl[] = {
 	{ 0x160, 0x0, 0x0, 0x0, 0x0, 1000, "Board Power" },
 };
 
-static const struct hwmon_channel_info *n3000bmc_hinfo[] = {
+static const struct hwmon_channel_info * const n3000bmc_hinfo[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
 			   HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_LABEL,
@@ -154,7 +154,7 @@ static const struct m10bmc_hwmon_board_data n3000bmc_hwmon_bdata = {
 	.hinfo = n3000bmc_hinfo,
 };
 
-static const struct hwmon_channel_info *d5005bmc_hinfo[] = {
+static const struct hwmon_channel_info * const d5005bmc_hinfo[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
 			   HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_LABEL,
@@ -280,7 +280,7 @@ static const struct m10bmc_sdata n5010bmc_curr_tbl[] = {
 	{ 0x1a0, 0x0, 0x0, 0x0, 0x0, 1, "CVL2 0.8V Current" },
 };
 
-static const struct hwmon_channel_info *n5010bmc_hinfo[] = {
+static const struct hwmon_channel_info * const n5010bmc_hinfo[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL,
@@ -432,7 +432,7 @@ static const struct m10bmc_sdata n6000bmc_power_tbl[] = {
 	{ 0x724, 0x0, 0x0, 0x0, 0x0, 1, "Board Power" },
 };
 
-static const struct hwmon_channel_info *n6000bmc_hinfo[] = {
+static const struct hwmon_channel_info * const n6000bmc_hinfo[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
 			   HWMON_T_LABEL,
-- 
2.34.1

