Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6305E6DA2D1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A16010ECF5;
	Thu,  6 Apr 2023 20:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C18610ECF5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:31:51 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50479981ed6so3339a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=55wB6FwAFZR2J5GJ5M7aLn7D6PzulcN06rOSgXVQC4g=;
 b=EN2rt01WdBFTfSRBAls5Y9NM9nGaiaOcOOWu7OR6lKgUGnk0HwhDZSKRgwtXQBEk6H
 4LP/Z/rIIPuYLly2xAQm/zGWSnVonmN+shsh4KytuvDM++yV6T9RP5gjpxRM898KCLNc
 7pR2KwQ0n+0BkcM4u3crCcPJOVO69dmEzdmDwYlMHOjsmD+7YAnFBP3BJP0uiCxlEqOL
 s6aEgmXJSPqPouPrcqFMWR6YUIDONYoTO98GEm/Bl2xe+tQ3tXO2dsLp2zEI/y6QWcx0
 4hRAAiWJx+Un89DSN7t8fqL4QbGj1Q+02Ga3JTwbZtmIGZhVEhM7ZePOLWeX62uVqhT9
 x10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55wB6FwAFZR2J5GJ5M7aLn7D6PzulcN06rOSgXVQC4g=;
 b=R2+rtehvjHdfIriqKn/HZe53WNzeMC2bkq9MpOzWyY9d5fh6UWbf0OJawyZ/TiAXfD
 GACv5ONJ5CvLJOwSVRGfIADG+saboyibJTAYgDLyytX/1ysrc0bO22ksRmIs+LmHdf/i
 yjma/GhbfxFjXTn0Hmj7zB4igaeOWi5iVJV/exJ+lae2Xayr+AaNisy4G6E63RnccTpk
 AdY+N2t/iL+aaUomB9jbPcjo7W7UdfDHQzIT2bjE1ebPNDAnj6M41bvVb9mlgrbwIDeB
 CHe6WQFbJhMyH4hT7d2qYZ/AF0/Eb0r/edsAoH9PP5JzBlZWcIVKYn2ngUNYcFquezYP
 0Vow==
X-Gm-Message-State: AAQBX9cT5RUyhB6LwkQPO+YtRE3QOBClHDEyXJAGsrmDyd6+Jqzv1MI7
 y/P9LsQ0dfSGRXl6h2fSVX1Ozg==
X-Google-Smtp-Source: AKy350bRWnrdy2ZCvoo0Syhpuo+hNru3eCGoBtu3JdLZjamkW5ZAZx1rYF9xlQuD0w6bpQtTeZFYtA==
X-Received: by 2002:aa7:c602:0:b0:502:22fe:ef3c with SMTP id
 h2-20020aa7c602000000b0050222feef3cmr603299edq.41.1680813109276; 
 Thu, 06 Apr 2023 13:31:49 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:31:48 -0700 (PDT)
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
Subject: [PATCH 15/68] hwmon: emc2305: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:10 +0200
Message-Id: <20230406203103.3011503-16-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/emc2305.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index f65467fbd86c..723f57518c9a 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -479,7 +479,7 @@ static const struct hwmon_ops emc2305_ops = {
 	.write = emc2305_write,
 };
 
-static const struct hwmon_channel_info *emc2305_info[] = {
+static const struct hwmon_channel_info * const emc2305_info[] = {
 	HWMON_CHANNEL_INFO(fan,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
-- 
2.34.1

