Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1755101AF6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1446E071;
	Tue, 19 Nov 2019 08:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696D26E82A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:49 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id g3so20410198ljl.11
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RivrnPfKPJ1QjkTxDFy4+4mnpF6bQPNEwpXOnU84LBo=;
 b=dhM7cIUuaCA2tyFYMOCU4/JKwHMrOtSC+lqu8zmQaPpKP8bR1jXu2CQhzzWCYRU874
 5LnnfGrkStB71Xrzoi2IXiDqW8m6JOGddM8OVCAVN2X+K5KHo7k/zYYmGZfiRu1kgXSh
 5NzqsyZNt453jO/lO6BcvZu0ywc9TbMWCpINV7luG781sIBqQfJO49zFiltzrGhgbQuu
 gqPGRcMG8wE6Yoqecc1022ZSVgW9zjKKrTkQDFqxk4g21EZr3cDVA9H0IJnASZoDeFwo
 xO7sczAwr6R0ahfOwQI9qAfX+QJwdBFcx0VYYx4UaES1HdoUOjBFCcCUgRI3JuNshojJ
 rbqQ==
X-Gm-Message-State: APjAAAUbZOONNTjH+Y7dN7oO3SXAL3af/OFwtGvXK3XaqLzoUAehy3FM
 RdpdmX6XmuLiBV5NRx2HxaU=
X-Google-Smtp-Source: APXvYqxN2fEW1G50B88GZs16ah4/AIE0PFaf5KjnCo7R/1WTHrNNfwDpOyxCG1M6gA57deEBF5n2yA==
X-Received: by 2002:a2e:7016:: with SMTP id l22mr880467ljc.227.1574107547802; 
 Mon, 18 Nov 2019 12:05:47 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:47 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 17/29] memory: tegra20-emc: Use
 devm_platform_ioremap_resource
Date: Mon, 18 Nov 2019 23:02:35 +0300
Message-Id: <20191118200247.3567-18-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RivrnPfKPJ1QjkTxDFy4+4mnpF6bQPNEwpXOnU84LBo=;
 b=iMIcUz/V15iBFRh5EoTXSUl6GOXqIKU6gCU6NxvhnpUqkX19Nx5FkiBzUdGS71xdBt
 LsUvGX/njNSt534oUI9MeY+A7GffrnfaLhl3HfVfMXs0EN1YwRtdIv33aDA1rSK1JN5T
 AnlwF6UrRBQhG4RE0JW+5EH8HlzCdRJ34ZmCD3X0FSpOX5AvQeslSI7D+l6bRQH4/NBg
 9+4n/efyUHWxpsu/EHDXckvxlNEdG4yMhGly4XlHL8ucp7JDedCzY2VzaUuneJHrFEce
 /WQ4C+p5ep2aimUwhH2owSGiO0y59fW/MbskFtGGlqLC0qrNKgTbrhrZJCfmPt47vQVh
 gpeQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXRpbGl6ZSB0aGF0IHJlbGF0aXZlbHkgbmV3IGhlbHBlciB3aGljaCBtYWtlcyBjb2RlIGEgYml0
IGNsZWFuZXIuCgpTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmEyMC1lbWMuYyB8IDQgKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMjAtZW1jLmMgYi9kcml2ZXJzL21lbW9yeS90ZWdy
YS90ZWdyYTIwLWVtYy5jCmluZGV4IDFiMjNiMWMzNDQ3Ni4uZDJlZmQwYzY1OGMwIDEwMDY0NAot
LS0gYS9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTIwLWVtYy5jCisrKyBiL2RyaXZlcnMvbWVt
b3J5L3RlZ3JhL3RlZ3JhMjAtZW1jLmMKQEAgLTQ4Miw3ICs0ODIsNiBAQCBzdGF0aWMgaW50IHRl
Z3JhX2VtY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnA7CiAJc3RydWN0IHRlZ3JhX2VtYyAqZW1jOwotCXN0cnVjdCByZXNvdXJj
ZSAqcmVzOwogCWludCBpcnEsIGVycjsKIAogCS8qIGRyaXZlciBoYXMgbm90aGluZyB0byBkbyBp
biBhIGNhc2Ugb2YgbWVtb3J5IHRpbWluZyBhYnNlbmNlICovCkBAIC01MTgsOCArNTE3LDcgQEAg
c3RhdGljIGludCB0ZWdyYV9lbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IAlpZiAoZXJyKQogCQlyZXR1cm4gZXJyOwogCi0JcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNl
KHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKLQllbWMtPnJlZ3MgPSBkZXZtX2lvcmVtYXBfcmVz
b3VyY2UoJnBkZXYtPmRldiwgcmVzKTsKKwllbWMtPnJlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVt
YXBfcmVzb3VyY2UocGRldiwgMCk7CiAJaWYgKElTX0VSUihlbWMtPnJlZ3MpKQogCQlyZXR1cm4g
UFRSX0VSUihlbWMtPnJlZ3MpOwogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
