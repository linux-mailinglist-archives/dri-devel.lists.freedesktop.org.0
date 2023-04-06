Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9576DA2D6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAAC10ED0A;
	Thu,  6 Apr 2023 20:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E2310ECF9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:31:57 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id j22so4223918ejv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mL4brmswtz5kXr1fmKwInCxjlH6he8VKwj0V627SpbA=;
 b=RjZypuk+y5AU7f3XGxF5Rl/jr+svjnDPTN9iBF6vzU2NIzHfxpiTldbo9kjAyzTdbg
 siMjyV5++Q/pJbxL3XpSeIi5EYdDDBVkmNTDsZR7PASY3ISre7+gaVxy617XJ98Iz28T
 6XxNmWW3iK3GSbUNNXZWOdt+LPtPv3AOZd/sfF1Gx2iDkRv8hDvlYixMzzWZkOS59c2U
 Cr7A2FRodgYfoRP7uAoT/UEfvocSX5XwEetx8J54khfAJRRib2MIkTpjqVAXRfX8eZsP
 Td7j3+I1vKj7aIDWtHX87uEC8KUPDhqVYm1n/Zk9DE43P/PjyqbFFqI6cXyIPIce4d4m
 IL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mL4brmswtz5kXr1fmKwInCxjlH6he8VKwj0V627SpbA=;
 b=d9GUXM5KRtANG6V+WRQOEIb1ctyCZLTO1rgEezhNQgMGuBTf5PzresXGXGiVfU3aMj
 MtSqCQva8uYv31H8jOgiOGAsV5Z9mxtjy46Db8O9KncIy0HOJGfOQ1xHakAgt804Owfp
 yTrWRjf/7T1iKgOpy5mHREN0HQ6O/9e81/tP+1Qr9pX7F7kK+s7EDHp+P7qcMrJNC+rv
 fBr5yjhfw/KWPRgMRfBJww8ElvMXp7S43ehHychgrbJaOejA7dcUaSSiKUk+VR1fxnfP
 7j7Ay2U7TocwRb3iVWyQDK+F3j87Yn8T6QgP5/dqPjyK43IQpK+fYV11R+cp9s7aIXh0
 5d2A==
X-Gm-Message-State: AAQBX9dTQ96VdesgWrdazvPUPXSbmW2M+ZNigCGkHK4sT4ID6Ypp+Gy9
 uSVLGaGf1bWnnbla6d7UpWoMtA==
X-Google-Smtp-Source: AKy350ZCJBJl8mtDFBbKnabpZnzVxKYkofKV7TXIl6boLppM6CpYFOeo9dFuZLiozCFvFobLsk6V3Q==
X-Received: by 2002:a17:906:aec8:b0:931:59f:d42 with SMTP id
 me8-20020a170906aec800b00931059f0d42mr171521ejb.29.1680813116456; 
 Thu, 06 Apr 2023 13:31:56 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:31:55 -0700 (PDT)
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
Subject: [PATCH 18/68] hwmon: i5500_temp: constify pointers to
 hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:13 +0200
Message-Id: <20230406203103.3011503-19-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/i5500_temp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/i5500_temp.c b/drivers/hwmon/i5500_temp.c
index 23b9f94fe0a9..7b00b38c7f7b 100644
--- a/drivers/hwmon/i5500_temp.c
+++ b/drivers/hwmon/i5500_temp.c
@@ -88,7 +88,7 @@ static const struct hwmon_ops i5500_ops = {
 	.read = i5500_read,
 };
 
-static const struct hwmon_channel_info *i5500_info[] = {
+static const struct hwmon_channel_info * const i5500_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST | HWMON_T_CRIT |
-- 
2.34.1

