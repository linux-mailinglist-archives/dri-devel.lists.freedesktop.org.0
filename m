Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FB885AC42
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 20:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC80410E0AD;
	Mon, 19 Feb 2024 19:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="OdT28Q8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A49510E0AD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 19:47:43 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1d7393de183so37165865ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 11:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708372062; x=1708976862;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E+1K1rDAoLT3yvvcU1xTbjvAZD33p95do2MZR1pqzhU=;
 b=njajegTnorRLdzke883MxssA30Tl6VPRWT/SdbP3ZP9ojLaPIc2kreuEOi8nNZYBMc
 t5A8xqRO0hvXGPUFm7ehzoxIgLgR8+RkDoBuSnr71EuLkbBrF6aJasoEwVSEx1gUiEqz
 6KYSPe65oB5cmh5xBPJo7itgZuaJccyEeqnFaPRgC8HcyPSlGaWqDA/Zh+YBp937c4Q6
 Smxmz4F3aC95XaN96uEner/gV3m5IvzKfQfW1JIUWrSI2QjuWy6YvgNomXUMcPWBGiTn
 JQ/ju4h7yMCD0IFndetn4vaOZ1yHnYBh+zNVqtQXkoVih01ODEMkph2l5tZQnBKqL30c
 9t4g==
X-Gm-Message-State: AOJu0YyoLytEK90E9C6xleAiKmgvWs/Z7pGVTpxPIuhw+hNx0b/YS2W2
 UU4vEESCQxXdZQyHlzzFbIxEAhjFIWN6LrCB4YO3LOA7sGPc19kv
X-Google-Smtp-Source: AGHT+IFLdoebQIS/JcbaR+WTW0StOHvz1lg/dtXrJusjwcgDG/iiyXXo8Mi0KYUwCxIZnHDolT/HyA==
X-Received: by 2002:a17:902:c246:b0:1db:d256:932d with SMTP id
 6-20020a170902c24600b001dbd256932dmr5196936plg.10.1708372062528; 
 Mon, 19 Feb 2024 11:47:42 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a17090331d000b001d9773a1993sm4772917ple.213.2024.02.19.11.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 11:47:42 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1708372061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E+1K1rDAoLT3yvvcU1xTbjvAZD33p95do2MZR1pqzhU=;
 b=OdT28Q8rBK4R7VC1plQYbox3WZs33fwXo+7EeigrLboYI08hmVA/URzu0izOoSnjtPWxbD
 xGcaHv36+cCtT+fSpMLvGA5i7vnW4QHy7By+GrlhIZreP3TRFxnn4LcisGZnUvtW/jRC1x
 xAORX9gyynsmvqK/0Xi3DU+m9W/W0mNA9fZOKwoevXkabVQa4iaJ2kX/9LmGtgOoEC64U0
 Buq5kDil4WWppoQ6KO4qZ3//q3l/v4XrAQaoKlnA4MWz2XEP88g2zC2fezrd+d84syh1G1
 Lkqvh0FbzwXRY7yh1BSDwJ9UNmS+sbfEc0dRmo0jfCgj+0O/gqhae1CBm8zGlQ==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Mon, 19 Feb 2024 16:48:28 -0300
Subject: [PATCH] accel: constify the struct device_type usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-device_cleanup-accel-v1-1-5031e5046cff@marliere.net>
X-B4-Tracking: v=1; b=H4sIAIuw02UC/x2MQQqAIBAAvxJ7TlDrYl+JCFvXWhATpQjCvycdB
 2bmhUKZqcDUvZDp5sJnbKD6DvCwcSfBrjFoqUeplRGuSUgrBrLxSsIiUhDWGOlw2PyGClqaMnl
 +/u281PoBgY4uiWYAAAA=
To: Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=E0gu0dftav8MaXjX+7OAo3ktmwiz3PI/6cLVfZ9kBDM=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl07CMzkpkFXTFG76NJv+ATsU02RkTl3tfEbF2q
 nEqfBlPSjOJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZdOwjAAKCRDJC4p8Y4ZY
 ph33D/9ue3+Q6/AEYZ8oe7dOzJSV9lsxOuLRgBPtR22qxrIICYQHPY8LGmiQCsURaP4Eqce30P8
 GOyP9QkMkvJpdi1liki9/kNAJDSal5cH8ZhjSzl3o88ZWPROoKDR0Qa4r88qQMPF52EPoTfW1RZ
 pRRnh4leiPk5APBIw52MKjDsH1g9A5ZY95WieSUhA9gsxJ7XuVvdE2kW4SwyyFHhLEZ6SZVLtXN
 p5WjubxnK8qHoHvYtY/2tMZCOz2A4Ku5jRoeYOSuIEhS3i79HN16Jsf/6nf/i2OGi6F/ehp4DoU
 ePE7ja2Pmm/OmzQlHJd5uKqDuo/nwvtL/LXLsdu4s/NVP9gvIZkWgFhl+UND7M9hsD3VNNtJkj0
 p77aDr2p82Ey7ITJd8F9ZxrkhdATf1hger/00R55IcOQ3Had8PkSIrdkkdud7mJdaupkzhTR2Ti
 VQSBuVDmIdzzlBGovKzZAuODskhmlkS1t5fjuJDp3WyAvSV65J3sIoGiiHM+9B1fqMP90fxtbGB
 Wp+bTfWX28zeizLGfBcRlT9UFs8R1VnVJTcDGUWKmmQUuHIq/BaqzxoMMNDi7uJ3KHrXVoOqmsx
 P8Ob/mkZDKVzVVsP2lLNXG8MKj8pnvna2g7HvjhQVeJ+zYKFIE+P/dGfJRdKnGB7tlp0RMWzOa9
 VabkXivaMdt4Ehg==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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

Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
core can properly handle constant struct device_type. Move the
accel_sysfs_device_minor variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/accel/drm_accel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index 24cac4c0274b..16c3edb8c46e 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -23,7 +23,7 @@ static struct idr accel_minors_idr;
 
 static struct dentry *accel_debugfs_root;
 
-static struct device_type accel_sysfs_device_minor = {
+static const struct device_type accel_sysfs_device_minor = {
 	.name = "accel_minor"
 };
 

---
base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
change-id: 20240219-device_cleanup-accel-a990dc3bfbc1

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

