Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC276DA302
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2AB10ED0F;
	Thu,  6 Apr 2023 20:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2629910ED0D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:32:47 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id j22so4228812ejv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KSE59ealLQGHAo2Ku4q/7kg+0lPG4LrulmfGJlBd0ZM=;
 b=L6tafJzL7iokaK6Im2wvNbxtPfUxPXdCSGsMaWxwbyBHMH5eN00dzBsXBw3wwwJ+MS
 Wa+82tzfWCZQxNiDXLLYzMwaNxb/pjfdcoy3GOBW8NSS7JlPcK9CCbDgRLwcPugvQ10+
 NtdpVlbf0e6cdfJfj4+yzQnfbWNm2zmAZJjViX1ICsqTKQsPsYEwBBeGwSCIGhU9X9QV
 gva/svt7TM9U4+IK5jGDZZNTWxTDH9+XmxdcZuuGRdm9OqUcg9D/kOUyjOSx1clNGP4N
 221m5pE1b+lfaU7G2d8GSdFOU/j3Fl2fS8HO8VXdtw26CBWNrb/PTwylA2dThs96eRhm
 49+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KSE59ealLQGHAo2Ku4q/7kg+0lPG4LrulmfGJlBd0ZM=;
 b=YYiIBBCvuwwm2V3G2R2ivrlMzCYcv8tR+q+z18CIzCW/Dako/2AnFdi/suPQN1fXFy
 /hSG8xlO+y79VeC8hLmkLdA1IegmR/XxvM63/rVzKq4CLspaB+a4X5cWB4bsKxHtj5fO
 Vr50aPDy7yixQslGM1XNzm+EaLI2QWJsNKFpd7sFhotmgBPh/jO2vg5eQ0jGSWDB84gP
 Guw3+ElZHAk/97qPgr7RcwWlvLYVgVMU44172+moRsCoawCGkrvwSsMR2Yr37CgJmga7
 46Dv+NTQoQD7YId+K/X6BydstEX1tysTAJbyP10AiR46v2D97D3HssvZrddj7MPn4UPK
 W+qg==
X-Gm-Message-State: AAQBX9cUuq/EiY0IiAhzzfM47Q/4VEjmrNBjbS8NteSqH/WDUgh5et+G
 973QEi3wQ6dFnfGJviduhdPM+w==
X-Google-Smtp-Source: AKy350aZj+3xCiX8S0pmVurfz0JVDCPQPUB25bHCuItaGxTlBdkkkiR0kaYcyf2W183XNNf/H26hTg==
X-Received: by 2002:a17:906:d0d2:b0:933:1134:be1e with SMTP id
 bq18-20020a170906d0d200b009331134be1emr115611ejb.53.1680813166736; 
 Thu, 06 Apr 2023 13:32:46 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:32:46 -0700 (PDT)
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
Subject: [PATCH 39/68] hwmon: max6620: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:34 +0200
Message-Id: <20230406203103.3011503-40-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/max6620.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
index 202b6438179d..0f277d945ea2 100644
--- a/drivers/hwmon/max6620.c
+++ b/drivers/hwmon/max6620.c
@@ -401,7 +401,7 @@ max6620_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	return ret;
 }
 
-static const struct hwmon_channel_info *max6620_info[] = {
+static const struct hwmon_channel_info * const max6620_info[] = {
 	HWMON_CHANNEL_INFO(fan,
 			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
 			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
-- 
2.34.1

