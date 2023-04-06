Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B786DA308
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 22:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B2A10ED11;
	Thu,  6 Apr 2023 20:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B916010ED11
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 20:32:52 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id 11so4218974ejw.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 13:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F6xd2tffMesWFruLPM1ew1mkLwGCByzlCgeOCdIQWX8=;
 b=DwuJ2jedcpUw2EfvPj3qQD1GgTtcC/5Qz7Treay1VS8UPa/mRtH03W7FaWhnMeSVe0
 PR60NrOAMxI36GmZqVwHD489+b1fGEZXoaQmBJb8peldCOzclB6kz61j2O9c0o5njqSO
 y1ufd3TaYUXMgcSkqCXKyd/2sV8X3tI/OrX1pC2epQLCA+MC2DO6GQ44uHahiMQMOtSr
 zRDVEBJbiCJ/xklk8TCU5UPVgnqvvD4C/TsZNszCuOXo6NLxg+og6J50vyYNv19AS2iV
 NrFNV1DpY2Qyg0dFBMRhrb5DyS26YyhZ3QxL4x4LK7L737Iqxdg2U52WTqMDM1Rtw5Yf
 FynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F6xd2tffMesWFruLPM1ew1mkLwGCByzlCgeOCdIQWX8=;
 b=lWUQ1bdZiXRjIR0tPoWozEJVv73kZynChAfE/IPrWnRf2wXiXh5CXhmh7KCTPbgPL3
 P0MQ4rjf60g09spszOXm3o+2IgkWgysOI7/vTcHZD9mQp4XkINj99IPrb+ZXf3Oi2Jcp
 Z/yTwGSBSbNyW7eDa8dFXxCP3Gj9D/htLJqO0I2VccoAy/DMNkkzeYkKEsg17eP0/DFD
 wV3o7KrzUSRfSaM66Eqkq9W2l5aqi1CwMh6NiBqOzObofXyWRFrDerk4EDZd4vbzBRCo
 9nnz5ItFaJTLlueimhsFB+8XJZYUv1ypF8rh0k6k/T2PeY/olJF3JXNCNF8wM20w9X0J
 ZApg==
X-Gm-Message-State: AAQBX9eWiGQdkR6j9ks4f5OroIZgRd6GkWpr25gXmVh/O6idNoMzZnC7
 ia9Fbow+dG2fjYwikx5NrL0bPw==
X-Google-Smtp-Source: AKy350YQQ4yv0Yy1Sm/TSHO4269gRNFhi/NQTvipZiwH14XFvPbV3LSIfiiAbAQvS7lc25T4DePO7Q==
X-Received: by 2002:a17:906:a414:b0:905:a46b:a725 with SMTP id
 l20-20020a170906a41400b00905a46ba725mr6085652ejz.16.1680813171250; 
 Thu, 06 Apr 2023 13:32:51 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:32:50 -0700 (PDT)
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
Subject: [PATCH 41/68] hwmon: max6650: constify pointers to hwmon_channel_info
Date: Thu,  6 Apr 2023 22:30:36 +0200
Message-Id: <20230406203103.3011503-42-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/max6650.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index f8d4534ce172..19e2c762ed2d 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -737,7 +737,7 @@ static umode_t max6650_is_visible(const void *_data,
 	return 0;
 }
 
-static const struct hwmon_channel_info *max6650_info[] = {
+static const struct hwmon_channel_info * const max6650_info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_DIV |
 			   HWMON_F_MIN_ALARM | HWMON_F_MAX_ALARM |
 			   HWMON_F_FAULT,
-- 
2.34.1

