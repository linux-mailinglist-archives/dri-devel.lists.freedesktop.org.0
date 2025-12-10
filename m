Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231B7CB26B6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 09:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC3410E6A9;
	Wed, 10 Dec 2025 08:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tem0U3dQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1724210E6A9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 08:31:55 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b7bd8b170e0so129804666b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 00:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765355513; x=1765960313;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lSMdgZiYQlpcrCoz/a1I+Tk8d9M7yHxRNKGn/fSx/9c=;
 b=tem0U3dQ2U1j4SmXenz2Hfo/ITrrfb7gGfNeKilKMORyy/2f7bssMAUG6gfbsPjc6U
 JTc7DS57zstED0hXtyxI53ykRjTr5CfFV5sCrvFdCSYb3esofgb0hTEcTUdS5VZNdhbh
 10A8k834iadRTUyDttTRMRdeVILT98S5o1az1aG3qev5wgzUUtr9t1YJgPWtWtW1B2jO
 /UxD8Z7OPUbG71u65CVWCdNLxNZ6MSPjLyjzNQ258ygTyGfh+fVBlIQ/5r8q3dQ7QJzp
 PWLTOtKJ6/IiNwn0tluLyHgA64B1gqKKacdA9kPjETlf+O5qYY6cJhLAZxwhuvg91Aii
 8H7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765355513; x=1765960313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lSMdgZiYQlpcrCoz/a1I+Tk8d9M7yHxRNKGn/fSx/9c=;
 b=ZGCpJufyO6feACVjaM5YZYlsOMq5NlzeV3sHhSteBYQywfmsYfp6+Z5RGyt/KL9oX5
 e18gE/F74P2kQaOVb2ZfKujS43PIYA9S02+0KNeIoyFxDJDXL+3sO7eeCPATKx5V5m3S
 HONjLiPs3Ieh4s9YfYNlTmBgVCn9Wy4/SW08rA7s5Kp4fMiQMSKJ5D8U8CZzYYJiPQG5
 Mk6ejXCs+RqlLV+bjB/LCbeIb5MfnVGdI8NfDIrnql9zV/OLjN0Oz10SlSW8BxE4s8MU
 OI8ztnvllL4B3b5JYrdBnA9qR83Sta1b0SDuAOh0zl96ORq2RlkYXlxPLUxa6CCSw5RM
 ZZ9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD3dzwsYPy4SjqkBFkOdRr3wIkhyS7yRtlVakhBlesVm9J2f73GkHhlyYeGfSmAAN8hbvuiOLbnDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9XHQqsjxW8NzL2J5JJNS0Zdg0qU4t/o19owLlwJ5KEXbhlsKX
 CHFxRVT3pisW5Oo+PdQMKkmGYry2wbU4KhNKqRwNrMD+RiTzvm45YTeoWgsszRrglOE=
X-Gm-Gg: AY/fxX6/qKBaRny9BfXbibzHOCCLUrgylEuLYZsPvb3msQMxcbUifTEjwPxNECasMDd
 8uc4GYIqbMLFecTVbtGk/6aPlvtPeNJ9GKa5j3ZDJlRk7f/ZsLbUQxXhAhAOK8cDhKSdIZ9Jxns
 oe5PLbnN7ewNnQipoSorivWlU+qOqyNuFct/XpUR2SlUxrjQUx66BYoYuZZpyiFdPUP4qg9sOR2
 1sU6EHfFHl95giXg8SvkSLf9zZ5WftL0MR8Id48JYq1TF5r2skyXwdtfYvS6uoSHGUiecIxjJn1
 FNU/VFZvK3MK1XGRhIFNXbTHNLbPxAquA1Lb5Mq9b831L0dggk4xOOVYOauBfahOe+9YV1FUG/a
 9Sk+SUAmuwIRW7ST6UhFXrqRNDShZ33HKWJCGqxGeZ5MCIMJYRDB88X+PFhiX6d3XcpdmWhYcgF
 qawBC3zyO17cL2GOl9
X-Google-Smtp-Source: AGHT+IFYDRtX5PoiZPxafkMiANC8Xf6Bj78BEbFQEysHNafXsqKHXNdBL6htv855tq3hOMwvxyT2DQ==
X-Received: by 2002:a17:906:dc89:b0:b7a:1b3:5e52 with SMTP id
 a640c23a62f3a-b7ce8245e92mr181408966b.17.1765355513484; 
 Wed, 10 Dec 2025 00:31:53 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-b79f4975c56sm1602897366b.33.2025.12.10.00.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 00:31:53 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhil R <akhilrajeev@nvidia.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 2/2] host1x: Convert to bus methods
Date: Wed, 10 Dec 2025 09:31:38 +0100
Message-ID: <dd55d034c68953268ea416aa5c13e41b158fcbb4.1765355236.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
References: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3411;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=FFNspWcgr6JBh3jF6KiuWIJwLT9QVchWO/Z3r4hqr+s=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhkxL/XeniljWpVlqZprUz387O3yFDZsen0Dv82P2G2Sm3
 TlnKlbUyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEVC3Y/zu/fWz+PrXm6LS0
 dE5ho5k693/XWU84d3BxsdDGBK8J1dxsNlGXf78pl87kPVPNdPVFGHN/poPqz/XF2R+y4+P+1Pm
 uF4y9sNcp+StnnJ+woIjkh4kejO9X8ru5rza4Jv51C38E74xrNc+9+s/5tdZ2eKV8MPe/cbB8iu
 cJA8ud7316C22vnJ8Va705o+iMduCiwGk7jKrzVOL++s14Lv+wt93cRPTHzfK2Ob1enG0Va8y73
 AR/zb+W8Z1zSvTLS2YKRjzB/H1W97rMXDljNyk1tquedzktlBzCnO2smc3YUKHdeTDPcUruiQf6
 sUVfGVMl1taKv/g0yShu35X6slxd4de/9vOe3K3QXAYA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The callbacks .probe(), .remove() and .shutdown() for device_drivers
should go away. So migrate to bus methods. There are two differences
that need addressing:

 - The bus remove callback returns void while the driver remove callback
   returns int (the actual value is ignored by the core).
 - The bus shutdown callback is also called for unbound devices, so an
   additional check for dev->driver != NULL is needed.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/gpu/host1x/bus.c | 67 ++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index fd89512d4488..c0d7a9b5f07a 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -346,6 +346,36 @@ static int host1x_device_uevent(const struct device *dev,
 	return 0;
 }
 
+static int host1x_device_probe(struct device *dev)
+{
+	struct host1x_driver *driver = to_host1x_driver(dev->driver);
+	struct host1x_device *device = to_host1x_device(dev);
+
+	if (driver->probe)
+		return driver->probe(device);
+
+	return 0;
+}
+
+static void host1x_device_remove(struct device *dev)
+{
+	struct host1x_driver *driver = to_host1x_driver(dev->driver);
+	struct host1x_device *device = to_host1x_device(dev);
+
+	if (driver->remove)
+		driver->remove(device);
+}
+
+static void host1x_device_shutdown(struct device *dev)
+{
+	struct host1x_driver *driver = to_host1x_driver(dev->driver);
+	struct host1x_device *device = to_host1x_device(dev);
+
+	if (dev->driver && driver->shutdown)
+		driver->shutdown(device);
+}
+
+
 static const struct dev_pm_ops host1x_device_pm_ops = {
 	.suspend = pm_generic_suspend,
 	.resume = pm_generic_resume,
@@ -359,6 +389,9 @@ const struct bus_type host1x_bus_type = {
 	.name = "host1x",
 	.match = host1x_device_match,
 	.uevent = host1x_device_uevent,
+	.probe = host1x_device_probe,
+	.remove = host1x_device_remove,
+	.shutdown = host1x_device_shutdown,
 	.pm = &host1x_device_pm_ops,
 };
 
@@ -611,37 +644,6 @@ int host1x_unregister(struct host1x *host1x)
 	return 0;
 }
 
-static int host1x_device_probe(struct device *dev)
-{
-	struct host1x_driver *driver = to_host1x_driver(dev->driver);
-	struct host1x_device *device = to_host1x_device(dev);
-
-	if (driver->probe)
-		return driver->probe(device);
-
-	return 0;
-}
-
-static int host1x_device_remove(struct device *dev)
-{
-	struct host1x_driver *driver = to_host1x_driver(dev->driver);
-	struct host1x_device *device = to_host1x_device(dev);
-
-	if (driver->remove)
-		driver->remove(device);
-
-	return 0;
-}
-
-static void host1x_device_shutdown(struct device *dev)
-{
-	struct host1x_driver *driver = to_host1x_driver(dev->driver);
-	struct host1x_device *device = to_host1x_device(dev);
-
-	if (driver->shutdown)
-		driver->shutdown(device);
-}
-
 /**
  * host1x_driver_register_full() - register a host1x driver
  * @driver: host1x driver
@@ -672,9 +674,6 @@ int host1x_driver_register_full(struct host1x_driver *driver,
 
 	driver->driver.bus = &host1x_bus_type;
 	driver->driver.owner = owner;
-	driver->driver.probe = host1x_device_probe;
-	driver->driver.remove = host1x_device_remove;
-	driver->driver.shutdown = host1x_device_shutdown;
 
 	return driver_register(&driver->driver);
 }
-- 
2.47.3

