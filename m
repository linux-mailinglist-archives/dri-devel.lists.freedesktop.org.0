Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A2985336E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 15:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC22C10E48F;
	Tue, 13 Feb 2024 14:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="VTk1MIcw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3181B10E741
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 14:44:05 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6e0a4823881so1683389b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 06:44:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707835445; x=1708440245;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDRCf7ye9xUGIdI7KZ1wE8lwvkdkrKbfelIrWiQUH+M=;
 b=gDmsMDv6zs1nwU4n3xpG/Pp/4mQkDlZyk19hlIsq8QUkuGYyuj2PP4xqUB3paBtmzp
 SHazvwxyVl5knnsejIgux8bYayz+OVknEmaPyYSbQMrl+vfkPOAfBj0XVcEy09NKWzUh
 BgLKNzcg8j6zZIfPZ1jUj+BhVPv+IqkL6ou6Sq5UGzGoY5wR7uVL8Pz+NjjIYfHnSXtI
 Yf6mMud1scFtVBV9Vg31DfuDurGwXa7t83DN3O/vqoGKpiuAg5C1hZF1L/cdW9wBjCVF
 AvVZ5hdIKOSq4bmM2yem8n1grOzl2VNFpqA+Oqy3ZWeQnIjPm0n6pzla8YDw/iSqQeyj
 fICw==
X-Gm-Message-State: AOJu0YyDeh6byjJYeKH4KfbjEwSo0C1jk4khGJ0EK1doKTNz2ntPCYhA
 XQiPtJhmoitr8XrWlZ2s/7BPBtSbOWccCw7c5tV/KwbMqeBDRpCJ
X-Google-Smtp-Source: AGHT+IECKRQ10VVWIfTc7i8RGgPeMMQjZe6ON9CKBQ5AHK2U/7V0yqbkv1diwDwHiBighxb5JpNBwQ==
X-Received: by 2002:a05:6a20:ac44:b0:19e:cf31:6a0e with SMTP id
 dh4-20020a056a20ac4400b0019ecf316a0emr4865642pzb.21.1707835444800; 
 Tue, 13 Feb 2024 06:44:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVyfbOB2X0I0PrSw+QrU98DWPh1l0diw2Aa3gK/TLI+rgap1TDwsM2KNfZEVtHr+VcuXMRrCBjV9NM0drF8i+uY+C/ieENiWrbp+vu6aAN+OoN139QFol72Ar+sRJk5BQRy790BF/vJGhG81F9mUPksm1TLhPSUx4TS+NtLuNVfWwSnTSITX6vgH3qAiouGk7kjEkr/cfp5v50alDJ5VoyRqdO0bF3n1S7hynBqsb56fQ/vS1rSgc5Eh3iZMoo619E=
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 m8-20020aa78a08000000b006e05cb7fd1fsm7432886pfa.164.2024.02.13.06.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 06:44:03 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1707835443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yDRCf7ye9xUGIdI7KZ1wE8lwvkdkrKbfelIrWiQUH+M=;
 b=VTk1MIcw2cz8FjyYdu7eW21tm3izS9RYkPAtNDSYGsZzuYjtys9Dx4eYxi6On766QmoSQO
 mXmUI4CAq6zxqd8sCmtFmjfVmJaMkINzvxHf3/ZNXHBEVMmUAq5VZ3HRAsZ/HZPJ5T+UA2
 /cuOGIRSjgIWVoJTXOY4ZoXX/UYrTUSZnQAVcHTwOKTgTKlLWZgHY6ZF96+ogFesuaUU5j
 42yazbDPpTPY+x45n8ilg27uwNRvCanMXemV0eF+HCbQ7VvckdI+/4S0jIwkzlojPqBADk
 b3kez1O4G63VlnkO9jxmPkh+6a0K7SzD0u/Hrwsa326jPgxQAPUkAgsnpUANOA==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Tue, 13 Feb 2024 11:44:40 -0300
Subject: [PATCH] gpu: host1x: bus: make host1x_bus_type const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240213-bus_cleanup-host1x-v1-1-54ec51b5d14f@marliere.net>
X-B4-Tracking: v=1; b=H4sIAFeAy2UC/x3MTQqAIBBA4avErBPU/qirRITWWANh4VQI0d2Tl
 t/ivQcYAyFDlz0Q8Cam3SeoPINpNX5BQXMyaKlLqVUh7MXjtKHx1yHWnU8VhWxd42RdV9q2kMI
 joKP4T/vhfT8z1m2nZAAAAA==
To: Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=crbHlNdRuniw2NTMAltR/X7KbWQ8GebDd/koBr7yWkk=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBly4BaVcxkCof6n/WVt9Egdz342JxvMV9lxVyXp
 DTWuj8m8xCJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZcuAWgAKCRDJC4p8Y4ZY
 pjF/D/9gmXE6O1HQMJGkb2GijzxXRF2Av0KO1ZnvItTkGhzuNS65CBGLsNlk7fzs6DJPl9CgQV1
 dYegZBcRf4a2A0Tdk1kBn0PUES0I7ZDXhmZLbPPZJzdzOc42wQy8aUzlbejQxVPI0CF1etv7+ps
 dJfK8CrA29vFlLXX8urUg+rvlpH4AtQX6E/gzGGm3QZCCegGcnyIoFzt27e9+I3DWUABlYWR7GZ
 AHOPkPSrKdDJfb+tFcQom6coxe25TRKVrCFKUH2vIj9xeczw3ObdEZzztiXGZpNpFkYRTSif88K
 5OyNlB3q/kDp8Hz8aftr2RzFFvKF6y9sBZg+IwbsLVtsjBze7zWm0VFoQlQz9lCg1LbfPGc1GfV
 DiGUlMy+b99qnYwjJH5SnsmZjNO2viDwcAEF05PtfZBJf7Dj7uyVXP90WxQrTgZJg8zde6A+wKi
 m+vzkssHF3thQaBU+6CvzG9qqEr5eXZjT9D7KBnWRyxgdyHgTUcLB81yx96oXqoPENQQlkfMD8N
 yooGBuz5RAtUVbmysQBPW519pWdJx2yd9pkOPS0hAR2CIHxvb7cxYnJoF0EM5LCSIWbi5xi2KVv
 yz/d11vtdtluE4PLiwcjn+V5eKZylxhU4NO3lurksEp4mlOnNg0Wd7SC4qmkZIO3CIL6wBoU2t4
 h49Vh+/yY4TNwag==
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

Since commit d492cc2573a0 ("driver core: device.h: make struct
bus_type a const *"), the driver core can properly handle constant
struct bus_type, move the host1x_bus_type variable to be a constant
structure as well, placing it into read-only memory which can not be
modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/gpu/host1x/bus.c | 2 +-
 drivers/gpu/host1x/bus.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 4d16a3396c4a..a20dad7f0333 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -382,7 +382,7 @@ static const struct dev_pm_ops host1x_device_pm_ops = {
 	.restore = pm_generic_restore,
 };
 
-struct bus_type host1x_bus_type = {
+const struct bus_type host1x_bus_type = {
 	.name = "host1x",
 	.match = host1x_device_match,
 	.uevent = host1x_device_uevent,
diff --git a/drivers/gpu/host1x/bus.h b/drivers/gpu/host1x/bus.h
index a4adf9abc3b4..a80ceadfeb34 100644
--- a/drivers/gpu/host1x/bus.h
+++ b/drivers/gpu/host1x/bus.h
@@ -10,7 +10,7 @@
 struct bus_type;
 struct host1x;
 
-extern struct bus_type host1x_bus_type;
+extern const struct bus_type host1x_bus_type;
 
 int host1x_register(struct host1x *host1x);
 int host1x_unregister(struct host1x *host1x);

---
base-commit: 2429b3c529da29d4277d519bd66d034842dcd70c
change-id: 20240213-bus_cleanup-host1x-09f7f06652b9

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

