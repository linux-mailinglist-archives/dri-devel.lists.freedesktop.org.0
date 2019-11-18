Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C59F4101B07
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169F06EBEF;
	Tue, 19 Nov 2019 08:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C09F6E823
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:55 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m4so15494846ljj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J2fZoY0R7IbQjoE/jwqG69vNLdHsoiOa5JN/luWf3e0=;
 b=kt9B7srFauBtjfk2HLVuyiNGmC7l2UDbT5XhA+O8zPOF3ACCqtM5BHlDulHkq8FvVU
 W9ye9+9vcBJgl8JWd/r4mXiUI99zuXxxWzzBh9MjUrEQkO8kMJYkA1GTvwCsEUcqVy+Q
 kgnDou8ik7eHn3Fbg3P17RyIC6YIfYn4d3ujR7qqmbEjnAhqHmIXS9h5kQPEpNgI4RNy
 bigYBtFIBQdWw4K9TyCgdt/GDXxkKUFYAT9g1HSlree/ZGOO6KcPUyCB2MERytRD1wq2
 5QcQrmJZwTEGhowLrFthPz9t2TXK7zjjz/4xVzOEN+ko1NQoL0NmV/ffFGm6XGAXOXxY
 kP7Q==
X-Gm-Message-State: APjAAAWp6DzWTbP2tFzdLIf6eFigmKUcIJ09JnFDzadAmcRuI7JmspRL
 J/egZJpC/HKjj0z7H5QLxnc=
X-Google-Smtp-Source: APXvYqz8ghWzEWo16209Cas+BFJnfWldFab38K4eefHAlKvmnAkeVTZ//bkXMQihDlZJIBr4ukwNjg==
X-Received: by 2002:a2e:9b06:: with SMTP id u6mr963460lji.34.1574107553665;
 Mon, 18 Nov 2019 12:05:53 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:53 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 23/29] memory: tegra124-emc: Register as interconnect
 provider
Date: Mon, 18 Nov 2019 23:02:41 +0300
Message-Id: <20191118200247.3567-24-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J2fZoY0R7IbQjoE/jwqG69vNLdHsoiOa5JN/luWf3e0=;
 b=TTGoXoCUGYgNLTlP5iXVrRXJPwkha1zSQ5AjyRhu1bMfayjzqzarGQeoe7vELP8Nxj
 3vI5/0aOZXaZCRmJyKUU6mmLqM86R4X7aOL5sT1vVAbpgAfvV6uUS10yDdqq0+a0/RG2
 qb5m+2UGJGO6yVqYwWnjw7ZY98IKLQe7jnYgq6XFnTo03LBK/xV1xxyzbh+Nz4Ph2Tcp
 tDe/CWeFPSp0CCAGOLrMX6EoX0VegVJzBS2ZaOWKq0Jhpbqv6NExUuLztuGgi8c/+YxI
 oq0GT1+fhZC5YJ1ky6L1cBdsQRMy7lu3KZh5OE44z8QokmQbIvRQOftu6NWOReH3/V7r
 YWnQ==
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

RU1DIG5vdyBwcm92aWRlcyBNQyB3aXRoIG1lbW9yeSBiYW5kd2lkdGggdXNpbmcgaW50ZXJjb25u
ZWN0IEFQSS4KClNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNv
bT4KLS0tCiBkcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTEyNC1lbWMuYyB8IDI0ICsrKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTEyNC1lbWMuYyBiL2RyaXZlcnMvbWVt
b3J5L3RlZ3JhL3RlZ3JhMTI0LWVtYy5jCmluZGV4IDJjNzMyNjA2NTRiYS4uYzk0NzhkY2JlZWNl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTEyNC1lbWMuYworKysgYi9k
cml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTEyNC1lbWMuYwpAQCAtMjUsNiArMjUsNyBAQAogI2Rl
ZmluZSBFTUNfRkJJT19DRkc1CQkJCTB4MTA0CiAjZGVmaW5lCUVNQ19GQklPX0NGRzVfRFJBTV9U
WVBFX01BU0sJCTB4MwogI2RlZmluZQlFTUNfRkJJT19DRkc1X0RSQU1fVFlQRV9TSElGVAkJMAor
I2RlZmluZSBFTUNfRkJJT19DRkc1X0RSQU1fV0lEVEhfWDY0CQlCSVQoNCkKIAogI2RlZmluZSBF
TUNfSU5UU1RBVFVTCQkJCTB4MAogI2RlZmluZSBFTUNfSU5UU1RBVFVTX0NMS0NIQU5HRV9DT01Q
TEVURQlCSVQoNCkKQEAgLTEwODAsMTEgKzEwODEsMjggQEAgc3RhdGljIHZvaWQgZW1jX2RlYnVn
ZnNfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCB0ZWdyYV9lbWMgKmVtYykKIAkJZGV2
X2VycihkZXYsICJmYWlsZWQgdG8gY3JlYXRlIGRlYnVnZnMgZW50cnlcbiIpOwogfQogCitzdGF0
aWMgdW5zaWduZWQgaW50IGVtY19kcmFtX2RhdGFfYnVzX3dpZHRoX2J5dGVzKHN0cnVjdCB0ZWdy
YV9lbWMgKmVtYykKK3sKKwl1bnNpZ25lZCBpbnQgYnVzX3dpZHRoOworCXUzMiBlbWNfY2ZnOwor
CisJZW1jX2NmZyA9IHJlYWRsX3JlbGF4ZWQoZW1jLT5yZWdzICsgRU1DX0ZCSU9fQ0ZHNSk7CisJ
aWYgKGVtY19jZmcgJiBFTUNfRkJJT19DRkc1X0RSQU1fV0lEVEhfWDY0KQorCQlidXNfd2lkdGgg
PSA2NDsKKwllbHNlCisJCWJ1c193aWR0aCA9IDMyOworCisJZGV2X2luZm8oZW1jLT5kZXYsICJE
UkFNIGRhdGEtYnVzIHdpZHRoOiAldWJpdFxuIiwgYnVzX3dpZHRoKTsKKworCXJldHVybiBidXNf
d2lkdGggLyA4OworfQorCiBzdGF0aWMgaW50IHRlZ3JhX2VtY19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm1jOwogCXN0cnVj
dCBkZXZpY2Vfbm9kZSAqbnA7CiAJc3RydWN0IHRlZ3JhX2VtYyAqZW1jOworCXVuc2lnbmVkIGlu
dCBidXNfd2lkdGg7CiAJdTMyIHJhbV9jb2RlOwogCWludCBlcnI7CiAKQEAgLTExNDYsNiArMTE2
NCwxMiBAQCBzdGF0aWMgaW50IHRlZ3JhX2VtY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCWlmIChJU19FTkFCTEVEKENPTkZJR19ERUJVR19GUykpCiAJCWVtY19kZWJ1Z2Zz
X2luaXQoJnBkZXYtPmRldiwgZW1jKTsKIAorCWJ1c193aWR0aCA9IGVtY19kcmFtX2RhdGFfYnVz
X3dpZHRoX2J5dGVzKGVtYyk7CisKKwllcnIgPSB0ZWdyYV9pY2NfZW1jX3NldHVwX2ludGVyY29u
bmVjdCgmcGRldi0+ZGV2LCBidXNfd2lkdGgpOworCWlmIChlcnIpCisJCWRldl9lcnIoJnBkZXYt
PmRldiwgImZhaWxlZCB0byBpbml0aWFsaXplIElDQzogJWRcbiIsIGVycik7CisKIAlyZXR1cm4g
MDsKIH07CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
