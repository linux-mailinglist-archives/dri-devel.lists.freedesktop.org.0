Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D49AA3A776
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 20:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D6010E746;
	Tue, 18 Feb 2025 19:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="a/wu02P8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E80010E747
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 19:30:45 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5ded368fcd9so7835837a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 11:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907044; x=1740511844;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hjJyNDYGWNlVfx3UHGcOmdtWcFRQpeErkJQFZDrnkgk=;
 b=a/wu02P85Wc7E/mZLDgcNQ6oy3mCuQ8btXTXYbqwTIO3F5aTX3+91hphWb2GzJ6ujY
 jZHmtUKLzlEWl6nntG4gxJcV40w9vHfTVvwEhzuYk2n5uBg66x1K3EQZp9zYaxf7bSnv
 j5Mich1lW1gzf/QsWgGC+kSpIMVap21btTjRXbIAit94yIF4DlKAselLvgroTPNUXSf8
 VoK6/npxNMixTLhzjqgl0Kz43PaG8L6Jik/u9Y55NGPz8AnzyIEiYUiv6nT+RWlXV1Yq
 6O5FHTDMDZ12lx8VIHIXDnLZfq2pxfAz65Gf/gYo+XJUKDWjKZmZDKpPeyOtacv62nhY
 V7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739907044; x=1740511844;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjJyNDYGWNlVfx3UHGcOmdtWcFRQpeErkJQFZDrnkgk=;
 b=qdxLmGp7SEYx1nDlj47BRuc9PCoknIi0OvxgY3Vi/6L89jDVVveTgiS372MNb/TYrw
 Ncx59r+YnL2Rz1dVApXQ+wGoAOC8X/g5qUtVvNstQUBU+hWFWAdcjDfScwy54x1ws+pk
 1QHKs2nD7xKnQaS1OeVB0U84ua+Wx/W3M+a17M36/OCN7hEf40cBumFIeitcy52TvOxe
 KJEz5cyvbWVMv+H2Y30/SWlCKgPnaWTIYdWZ0L91KRYpBr9pBuV8/5mZhNZa1g5g2A2s
 sQTIHbDf8voSGaOkl0jtg5EAEVNyMM7wCv28s7qPVaCsDNUOUt/uB62OjxEm6iLqHvz7
 c4+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqgozIBWMlz97O70qzczk4azv8r72aiwdIWnHUmroIf5qkAQjCgw9IiBYyoqHEybJNnY1r3lySqW0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwasrSRWTsLMqg0x5zvpszwxF0y+fUYYHHzSoihze3VXSWVTFZf
 XK1nFfx4RW/DnI0LgYpLVPTvvzeMOObAqpxR5Hd1aIEZllCf55666UwtY6DQdYQ=
X-Gm-Gg: ASbGncsmbC4v6QogAcZXId9KUvO28H4JL/Hz5hrtvbli+/EiKV6BiKjSWjxvIHdkuYi
 Bp06QuXE5KnTJz12XficeyRxpqzArU959qZmez6BIt+r35neuWeiRkFbYsmoTu838SfaRZp5hNx
 mQBmWYAjbhA4PJrYF0WJXbm0lnJLcYx1/5/QgdPWRTDJAfep7ZtcbvSMYcJ91mQAKkPmqZJoObb
 zjahfDV1H5ax88eXolLL+PQmpi+ksUZ0UU9fexG2www2J3GjXJA1Lj423oEZCXGiaWoOKbMFmfZ
 rLGeL2nQ0NKPIXj4a0WNMtCx07kV
X-Google-Smtp-Source: AGHT+IECmlrf1Z+1L2rx/ADMh1RlCaQ+nxKiAFCqRveAMzjHV+oepi3NANZfof9OC/6vmxpoOyaleQ==
X-Received: by 2002:a05:6402:50c7:b0:5e0:87fb:72fb with SMTP id
 4fb4d7f45d1cf-5e089510c40mr694282a12.6.1739907044107; 
 Tue, 18 Feb 2025 11:30:44 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 11:30:43 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:49 +0100
Subject: [PATCH v4 4/8] platform: arm64: lenovo-yoga-c630: use the
 auxiliary device creation helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-aux-device-create-helper-v4-4-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973; i=jbrunet@baylibre.com; 
 h=from:subject:message-id;
 bh=Cr25mWKeZ/YkxEU3AVjqGal7txJ2589uVh41kSdabtQ=; 
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/SD4OL52K/QfMKVSEvyPzO6g3xqyAnnznv2
 tNz5v43QBWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf0gAKCRDm/A8cN/La
 hQ3NEACMePloQ6q9Op19MgwdvWmpVPN0pvC4qMKEleBTPpWgSbX07LzsOs33BF6DElzTXnPBE7V
 Hc6gTFj4eFpmZWZ0JLOLUmssy6Psl/FT45fjkiI6n1fz3DAwt9ZAHMX8li1/hrg9Jm8kTJTxkdT
 4bDV79Tklwis8J/7ZD2hJKoV02hT7FGm3mi0VzB65ZDGv6b5LcNmbZn95vUsmM9vQKOlyDsZ+5j
 xQZKbwufaGoPkjT64mDVnAKoZdF3vNaNN5Yje/d9tiezCjghHjEQXg8nP5TIJgDzYrbByCFDCQ2
 uO6nlODoPUfF90cbT60YJAE7QcCQOsrjt8e2+MvwcZdOMX6+e4wy3mIs24V2+8OKbSSxEO46L2l
 Bq5ehm93JeFwihWXwSSzccoDgTdL9uTM0T+n7gXSmVWMuo9FQ7ezZ1NcVkhY0hIn/oSI7yHdM9C
 oDiWNvNBvsV3+EksgLl8g8CFq0b8ykBaFZsBO19TLYDtzd0YUEbvkjbHjpFaDvVWVQFbxmFOiOm
 RwwfbcTkpQ8yKuwqtYNwng31MbhKDu90tRu3Q02h5kBTCZ8xPP4EIT+baSgD9YzWlOAKtcjFrRT
 Er3q3PLeaKRm/ZarDvM72dgEjzwT5TsJ6qku+wsH87MnixceMMf524tJXp0zcQWBJYtba1cPB09
 RzDUMDBKnqETK4A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/platform/arm64/lenovo-yoga-c630.c | 40 +++----------------------------
 1 file changed, 3 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
index 1f05c9a6a89d5ee146144062f5d2e36795c56639..75060c842b249c1b4cab21fef943266ae0b31d32 100644
--- a/drivers/platform/arm64/lenovo-yoga-c630.c
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -191,50 +191,16 @@ void yoga_c630_ec_unregister_notify(struct yoga_c630_ec *ec, struct notifier_blo
 }
 EXPORT_SYMBOL_GPL(yoga_c630_ec_unregister_notify);
 
-static void yoga_c630_aux_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static void yoga_c630_aux_remove(void *data)
-{
-	struct auxiliary_device *adev = data;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
 static int yoga_c630_aux_init(struct device *parent, const char *name,
 			      struct yoga_c630_ec *ec)
 {
 	struct auxiliary_device *adev;
-	int ret;
 
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	adev = devm_auxiliary_device_create(parent, name, ec);
 	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->id = 0;
-	adev->dev.parent = parent;
-	adev->dev.release = yoga_c630_aux_release;
-	adev->dev.platform_data = ec;
-
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ret;
-	}
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
+		return -ENODEV;
 
-	return devm_add_action_or_reset(parent, yoga_c630_aux_remove, adev);
+	return 0;
 }
 
 static int yoga_c630_ec_probe(struct i2c_client *client)

-- 
2.47.2

