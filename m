Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E0A6DA2C4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACF510ECEE;
	Thu,  6 Apr 2023 20:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D0710ECDC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:31:34 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id n21so4219242ejz.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5OysLbRAf3FePlMQAvxi6ECtmAIY3wqal/J8BkLquJ4=;
 b=WAF8L0SzNrjHfnlyjmVp6od9k2EnBovOLiPR+pKqvJ7byni4G13TBQS3Safv+UA7xm
 63g+Vjp5DECN1x4IqQ6BA2GuXw+v9oP9uAI4ht7dB6qHYzbSHGYoL8Usys29aYBaJds+
 DXUwpkw8yoE8hqXIi5PaOSm8MuRCc1yYKjeXcXgmbc+c2GpFtIkrNv+ggfp0l9cVLEGk
 pxkxIG9EAgY4d0n5oktwaV4yIlPk+D4YKu9vWOncvI+amxpV92hSlGGHxl94tVpg+3ZK
 A3RtPXsssapZNNRuRkMneXWKhNDamsLBi7NCu3kE5nvvtkfqSA4H1lYScDAV8cfOJyCx
 lGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5OysLbRAf3FePlMQAvxi6ECtmAIY3wqal/J8BkLquJ4=;
 b=YjzTsj0q8EFUiCUlPC9r2xyu7sCFb4NubJK/vwsldsLB/9mc2dFcLPy8DQmbSBz8IZ
 rDRHTQja+aeLZy33jnoiUogajaPgLIp/Bb9lOZHq9s++15Xm25O5p89Pv0sp0/CGPB/s
 dlEkX8omvM3TzG6w77u6jI0nPffYCnqLzBguiqudBcsX0bmWz2eIQOzKvsIUT2JGbO62
 B6bu7tAIqP3hR4mR7CcC1s4Kl1wDgE23GqOfroBE2zfHDluzM8/rF/7lO/OOGDDgwDLr
 6BsIJ05rKYOx+WtYEii1KRT1BOrOnhlsonH6d1DnpxVuc/9HLyrhOPVw5nW0Nfny0Ya/
 DCbQ==
X-Gm-Message-State: AAQBX9cN2udKuu5F+lQ8Mpv7tqwhIkTZYVdZ2wBq+5aIbKWhHZ680Iem
 L8956YujuuPAVUTZy1VVsjgVwQ==
X-Google-Smtp-Source: AKy350ZG+kU5MGyTXsT6ZvJ+plxOSXcJkKLmeifDg92uAby6efORfna3F71Oh1L4yH5Ox9lEdI3V3g==
X-Received: by 2002:a17:907:2c61:b0:931:32f5:1f31 with SMTP id
 ib1-20020a1709072c6100b0093132f51f31mr244641ejc.9.1680813093118; 
 Thu, 06 Apr 2023 13:31:33 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:31:32 -0700 (PDT)
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
Subject: [PATCH 08/68] hwmon: aquacomputer: constify pointers to
 hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:03 +0200
Message-Id: <20230406203103.3011503-9-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/aquacomputer_d5next.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 17fad3142118..3bd35d833e69 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1038,7 +1038,7 @@ static const struct hwmon_ops aqc_hwmon_ops = {
 	.write = aqc_write
 };
 
-static const struct hwmon_channel_info *aqc_info[] = {
+static const struct hwmon_channel_info * const aqc_info[] = {
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_OFFSET,
 			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_OFFSET,
-- 
2.34.1

