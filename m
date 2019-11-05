Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD570EFDD1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 13:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0149B6EA42;
	Tue,  5 Nov 2019 12:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1086EA42
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 12:59:49 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRyR0-0006ao-Nv; Tue, 05 Nov 2019 12:59:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D1134274301E; Tue,  5 Nov 2019 12:59:45 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] drm/tegra: Fix regulator_get_optional() misuse
Date: Tue,  5 Nov 2019 12:59:42 +0000
Message-Id: <20191105125943.34729-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iFTVrYBWldjdkzW4JZSdAbgJD9mchpp3GHteGBcrZ8A=; b=rM8HUP7vSr369xXLxxXEq8irU
 6fYZedFYbcmsD4l6CFVXW6O2OuPWWY2G5S43+xBj28YCuydxJHW9C+7j+97g0dclDqeaqhiB2BRMw
 Neyk4Rv0vCqD3SisQlkqp1TapRCHQMYCdZZY5b+8a0nlxFMV1vmflyeR5jy0Mier7hLjk=;
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
Cc: linux-tegra@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHRlZ3JhIGRyaXZlciByZXF1ZXN0cyBhIHN1cHBseSB1c2luZyByZWd1bGF0b3JfZ2V0X29w
dGlvbmFsKCkKYnV0IGJvdGggdGhlIG5hbWUgb2YgdGhlIHN1cHBseSBhbmQgdGhlIHVzYWdlIHBh
dHRlcm4gc3VnZ2VzdCB0aGF0IGl0IGlzCmJlaW5nIHVzZWQgZm9yIHRoZSBtYWluIHBvd2VyIGZv
ciB0aGUgZGV2aWNlIGFuZCBpcyBub3QgYXQgYWxsIG9wdGlvbmFsCmZvciB0aGUgZGV2aWNlIGZv
ciBmdW5jdGlvbiwgdGhlcmUgaXMgbm8gbWVhbmluZ2Z1bCBoYW5kbGluZyBmb3IgYWJzZW50CnN1
cHBsaWVzLiAgU3VjaCByZWd1bGF0b3JzIHNob3VsZCB1c2UgdGhlIHZhbmlsbGEgcmVndWxhdG9y
X2dldCgpCmludGVyZmFjZSwgaXQgd2lsbCBlbnN1cmUgdGhhdCBldmVuIGlmIGEgc3VwcGx5IGlz
IG5vdCBkZXNjcmliZWQgaW4gdGhlCnN5c3RlbSBpbnRlZ3JhdGlvbiBvbmUgd2lsbCBiZSBwcm92
aWRlZCBpbiBzb2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2Vy
bmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHBhdXguYyB8IDMyICsrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2Rw
YXV4LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHBhdXguYwppbmRleCA2MjJjZGYxYWQyNDYu
LjM4Njg2ZjU2ZWEyZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwYXV4LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwYXV4LmMKQEAgLTUwNSwxOCArNTA1LDE0IEBA
IHN0YXRpYyBpbnQgdGVncmFfZHBhdXhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAkJcmV0dXJuIGVycjsKIAl9CiAKLQlkcGF1eC0+dmRkID0gZGV2bV9yZWd1bGF0b3JfZ2V0
X29wdGlvbmFsKCZwZGV2LT5kZXYsICJ2ZGQiKTsKKwlkcGF1eC0+dmRkID0gZGV2bV9yZWd1bGF0
b3JfZ2V0KCZwZGV2LT5kZXYsICJ2ZGQiKTsKIAlpZiAoSVNfRVJSKGRwYXV4LT52ZGQpKSB7Ci0J
CWlmIChQVFJfRVJSKGRwYXV4LT52ZGQpICE9IC1FTk9ERVYpIHsKLQkJCWlmIChQVFJfRVJSKGRw
YXV4LT52ZGQpICE9IC1FUFJPQkVfREVGRVIpCi0JCQkJZGV2X2VycigmcGRldi0+ZGV2LAotCQkJ
CQkiZmFpbGVkIHRvIGdldCBWREQgc3VwcGx5OiAlbGRcbiIsCi0JCQkJCVBUUl9FUlIoZHBhdXgt
PnZkZCkpOwotCi0JCQlyZXR1cm4gUFRSX0VSUihkcGF1eC0+dmRkKTsKLQkJfQorCQlpZiAoUFRS
X0VSUihkcGF1eC0+dmRkKSAhPSAtRVBST0JFX0RFRkVSKQorCQkJZGV2X2VycigmcGRldi0+ZGV2
LAorCQkJCSJmYWlsZWQgdG8gZ2V0IFZERCBzdXBwbHk6ICVsZFxuIiwKKwkJCQlQVFJfRVJSKGRw
YXV4LT52ZGQpKTsKIAotCQlkcGF1eC0+dmRkID0gTlVMTDsKKwkJcmV0dXJuIFBUUl9FUlIoZHBh
dXgtPnZkZCk7CiAJfQogCiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgZHBhdXgpOwpAQCAt
NzMxLDExICs3MjcsOSBAQCBpbnQgZHJtX2RwX2F1eF9hdHRhY2goc3RydWN0IGRybV9kcF9hdXgg
KmF1eCwgc3RydWN0IHRlZ3JhX291dHB1dCAqb3V0cHV0KQogCWlmIChvdXRwdXQtPnBhbmVsKSB7
CiAJCWVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgc3RhdHVzOwogCi0JCWlmIChkcGF1eC0+dmRk
KSB7Ci0JCQllcnIgPSByZWd1bGF0b3JfZW5hYmxlKGRwYXV4LT52ZGQpOwotCQkJaWYgKGVyciA8
IDApCi0JCQkJcmV0dXJuIGVycjsKLQkJfQorCQllcnIgPSByZWd1bGF0b3JfZW5hYmxlKGRwYXV4
LT52ZGQpOworCQlpZiAoZXJyIDwgMCkKKwkJCXJldHVybiBlcnI7CiAKIAkJdGltZW91dCA9IGpp
ZmZpZXMgKyBtc2Vjc190b19qaWZmaWVzKDI1MCk7CiAKQEAgLTc2NywxMSArNzYxLDkgQEAgaW50
IGRybV9kcF9hdXhfZGV0YWNoKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgpCiAJaWYgKGRwYXV4LT5v
dXRwdXQtPnBhbmVsKSB7CiAJCWVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgc3RhdHVzOwogCi0J
CWlmIChkcGF1eC0+dmRkKSB7Ci0JCQllcnIgPSByZWd1bGF0b3JfZGlzYWJsZShkcGF1eC0+dmRk
KTsKLQkJCWlmIChlcnIgPCAwKQotCQkJCXJldHVybiBlcnI7Ci0JCX0KKwkJZXJyID0gcmVndWxh
dG9yX2Rpc2FibGUoZHBhdXgtPnZkZCk7CisJCWlmIChlcnIgPCAwKQorCQkJcmV0dXJuIGVycjsK
IAogCQl0aW1lb3V0ID0gamlmZmllcyArIG1zZWNzX3RvX2ppZmZpZXMoMjUwKTsKIAotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
