Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CE16DA307
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F9910ECFE;
	Thu,  6 Apr 2023 20:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5751210ED10
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:32:49 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id n21so4226446ejz.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vhwGvdUF+7fwd5PhumtiSc1TmIcW9E51JLUOeBF/1GY=;
 b=b9hQWvBcTnT1CUox4p9xbf1lbIXxG+RcvFWZwo2pgara5YORXkPLb4bfBDlokb2BIx
 hZhHAKykuzPaPpfC7buTpoVB/PLte4iZ6zHzYuapEjD2RmuvnC+v3fpPc23ZA9tUG8dc
 UIfJ0ex6pVJ6IzIaABBmX48wcvbnLstESzKnIm+4wCvLvUO/dbh8pAUzkIeU14fR4uPg
 vi2swW+1RI4Gr1xmu7z3k7iq0UUqugnDJ/4HQD/29BTFtD/te1wziIcY7eUiMrJQjmXT
 HihL1r7FuCTTouAufUEhJPOUlUNET9+gaWESIsAub9bGEvpwAikPbdjoVpgZEVoJaaVs
 VOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vhwGvdUF+7fwd5PhumtiSc1TmIcW9E51JLUOeBF/1GY=;
 b=wpQZKKdhm9yZ/scVQY124jWamJWZMYRmbT67r3j4hyT1FCj7Xqu8jA9NK0nSiDb0rd
 ogtFg8VSt/KfqxKWLTlg/A5dOdxfVN/AgMwj0gKex/apmywL9kCNW3iJYekBE2f9UHu4
 FWIasjvPjOofjwlki1WtBqNPOi/qgLwaiq5eT7j+pJbO52MZqSc6QO9usv1z7A4xZYi1
 /OKDlLfddhjZQR47UrcBq7JxA5jL+ce+gjNs0biaugbnwvoaTZJuZiwRe8VZQshjjuY3
 rGu1vwKD4Jy4goXKeJnCkMA2jeE++vJpB/oG3btiQbNb7pN+w+XTPPSj9knL05L5uheB
 FRXg==
X-Gm-Message-State: AAQBX9eF0v8iM8QVBD2blte+T6wFDQm+KnOxPAj2d8+pjKg+WSFDhDs6
 CwU5kvYAWpOtlnT8Lp5Vwl3VAA==
X-Google-Smtp-Source: AKy350YxlEKCAkb5JxJK97l9oFq9lZAvm34QPhLiTrraT2zzuotNJJY0LVHdegiqyqoXFm+OMtm2Vw==
X-Received: by 2002:a17:906:d787:b0:920:388c:5c60 with SMTP id
 pj7-20020a170906d78700b00920388c5c60mr119377ejb.41.1680813168917; 
 Thu, 06 Apr 2023 13:32:48 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:32:48 -0700 (PDT)
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
Subject: [PATCH 40/68] hwmon: max6621: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:35 +0200
Message-Id: <20230406203103.3011503-41-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/max6621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
index 7821132e17fa..0656eb1e7959 100644
--- a/drivers/hwmon/max6621.c
+++ b/drivers/hwmon/max6621.c
@@ -449,7 +449,7 @@ static const struct regmap_config max6621_regmap_config = {
 	.num_reg_defaults = ARRAY_SIZE(max6621_regmap_default),
 };
 
-static const struct hwmon_channel_info *max6621_info[] = {
+static const struct hwmon_channel_info * const max6621_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
-- 
2.34.1

