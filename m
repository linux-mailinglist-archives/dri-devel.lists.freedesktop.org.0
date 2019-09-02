Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88421A54EB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF34189C14;
	Mon,  2 Sep 2019 11:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6289B89C14
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:31:52 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c3so13648530wrd.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=srBm4Ktgq0cSVneUfh1AFH6P8a+ZVsFKSo7DHCjJP98=;
 b=mBfDgHa5DOs7+Ew8ovJt8kanjhnilywcJbkxAcumWzGWVS4KiOo9X9wnklWcijAI+y
 rtCslLHQbCQA1uvPdE4HNjzUhyDQef+rOTvxDeWjkcCFsV5vSNK5f0tpY0aihwsmfN+7
 7JOWp/yH2Q+dqHWkuePFZi1g5MZwqKseW+vIHKcl8bwmmVVkmhkDn2Q9ZLmaqWK3LZA2
 O5hZh7zXxFPbAJvPNScu6U5RMd2qbkiKq869e3XT0qAlxGFOov2Q6WkGaJ0+CLatu+mS
 x3PV9WvkOwx9odSiDo9KtQi+v6Vwrtsy0B+JB4Yjy4z7Zs88FF1J6UNkT5+Mz7mh7GBO
 0dGg==
X-Gm-Message-State: APjAAAUngR6wVbfkaYmY7dZ/gLndUIaKOV0aRRGN/UlPgqvZ4Syxpkki
 037mAZv1/bQkN0T/II91MC4SUoPp
X-Google-Smtp-Source: APXvYqyFb5J6REviV0856UT1/10jUrih7nXTlNVYeuiLIkDY0NJT/zBIc9u+M2orLOebv4wX83kv/A==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr5628133wro.319.1567423910634; 
 Mon, 02 Sep 2019 04:31:50 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id s26sm2451060wrs.63.2019.09.02.04.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:49 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/21] drm/dp: Do not busy-loop during link training
Date: Mon,  2 Sep 2019 13:31:13 +0200
Message-Id: <20190902113121.31323-14-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=srBm4Ktgq0cSVneUfh1AFH6P8a+ZVsFKSo7DHCjJP98=;
 b=nzHi/GxT5/ePnSwlgdwg5Va5pE4LyBlxarwHq4CSBmlo2AeiAq2Wj39hYZVY2hZ+SQ
 x4MLwhPd2ua9ggE8JPcwGXP0v+w7a+jP42dUwu3qVzcBVp2ZfaOtELHgB4UWw17GPmY8
 5AumQL7C0Va315qKXmYUE9/9VRVGMeprPJsHuldD7XDh0g5HzbiufV92vQYCxrYnIbu5
 mla1XtlvtgmTmn6Hxd2l+k/L507fMUmQ15yFtu1k+J0IwEitTY1Nu76TD087cBcvD/2k
 Liyz2cRyy+wo23WrWr4HLLYUOs4/VjgYVZ69WPkQ9dbo5/4A+STqZ9/5uIv/bvD87Cjg
 ECww==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClVzZSBtaWNyb3NlY29u
ZCBzbGVlcHMgZm9yIHRoZSBjbG9jayByZWNvdmVyeSBhbmQgY2hhbm5lbCBlcXVhbGl6YXRpb24K
ZGVsYXlzIGR1cmluZyBsaW5rIHRyYWluaW5nLiBUaGUgZHVyYXRpb24gb2YgdGhlc2UgZGVsYXlz
IGNhbiBiZSBmcm9tCjEwMCB1cyB1cCB0byAxNiBtcy4gSXQgaXMgcnVkZSB0byBidXN5LWxvb3Ag
Zm9yIHRoYXQgYW1vdW50IG9mIHRpbWUuCgpXaGlsZSBhdCBpdCwgYWxzbyBjb252ZXJ0IHRvIHN0
YW5kYXJkIGNvZGluZyBzdHlsZSBieSBwdXR0aW5nIHRoZQpvcGVuaW5nIGJyYWNlcyBpbiBhIGZ1
bmN0aW9uIGRlZmluaXRpb24gb24gYSBuZXcgbGluZS4KCnYyOiB1c2UgY29ycmVjdCBtdWx0aXBs
aWVyIGZvciB0cmFpbmluZyBkZWxheXMgKFBoaWxpcHAgWmFiZWwpCgpTaWduZWQtb2ZmLWJ5OiBU
aGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfaGVscGVyLmMgfCAzMCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9oZWxwZXIuYwppbmRleCA0MTEyNTcwZGJlNjcuLjY4MWQyODk4ODc3NiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX2hlbHBlci5jCkBAIC0xMjAsMzMgKzEyMCwzOSBAQCB1OCBkcm1fZHBfZ2V0X2FkanVzdF9y
ZXF1ZXN0X3ByZV9lbXBoYXNpcyhjb25zdCB1OCBsaW5rX3N0YXR1c1tEUF9MSU5LX1NUQVRVU19T
SQogfQogRVhQT1JUX1NZTUJPTChkcm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3ByZV9lbXBoYXNp
cyk7CiAKLXZvaWQgZHJtX2RwX2xpbmtfdHJhaW5fY2xvY2tfcmVjb3ZlcnlfZGVsYXkoY29uc3Qg
dTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pIHsKLQlpbnQgcmRfaW50ZXJ2YWwgPSBkcGNk
W0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0gJgotCQkJICBEUF9UUkFJTklOR19BVVhfUkRf
TUFTSzsKK3ZvaWQgZHJtX2RwX2xpbmtfdHJhaW5fY2xvY2tfcmVjb3ZlcnlfZGVsYXkoY29uc3Qg
dTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pCit7CisJdW5zaWduZWQgaW50IHJkX2ludGVy
dmFsID0gZHBjZFtEUF9UUkFJTklOR19BVVhfUkRfSU5URVJWQUxdICYKKwkJCQkJRFBfVFJBSU5J
TkdfQVVYX1JEX01BU0s7CiAKIAlpZiAocmRfaW50ZXJ2YWwgPiA0KQotCQlEUk1fREVCVUdfS01T
KCJBVVggaW50ZXJ2YWwgJWQsIG91dCBvZiByYW5nZSAobWF4IDQpXG4iLAorCQlEUk1fREVCVUdf
S01TKCJBVVggaW50ZXJ2YWwgJXUsIG91dCBvZiByYW5nZSAobWF4IDQpXG4iLAogCQkJICAgICAg
cmRfaW50ZXJ2YWwpOwogCiAJaWYgKHJkX2ludGVydmFsID09IDAgfHwgZHBjZFtEUF9EUENEX1JF
Vl0gPj0gRFBfRFBDRF9SRVZfMTQpCi0JCXVkZWxheSgxMDApOworCQlyZF9pbnRlcnZhbCA9IDEw
MDsKIAllbHNlCi0JCW1kZWxheShyZF9pbnRlcnZhbCAqIDQpOworCQlyZF9pbnRlcnZhbCAqPSA0
ICogVVNFQ19QRVJfTVNFQzsKKworCXVzbGVlcF9yYW5nZShyZF9pbnRlcnZhbCwgcmRfaW50ZXJ2
YWwgKiAyKTsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2RwX2xpbmtfdHJhaW5fY2xvY2tfcmVjb3Zl
cnlfZGVsYXkpOwogCi12b2lkIGRybV9kcF9saW5rX3RyYWluX2NoYW5uZWxfZXFfZGVsYXkoY29u
c3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pIHsKLQlpbnQgcmRfaW50ZXJ2YWwgPSBk
cGNkW0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0gJgotCQkJICBEUF9UUkFJTklOR19BVVhf
UkRfTUFTSzsKK3ZvaWQgZHJtX2RwX2xpbmtfdHJhaW5fY2hhbm5lbF9lcV9kZWxheShjb25zdCB1
OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKK3sKKwl1bnNpZ25lZCBpbnQgcmRfaW50ZXJ2
YWwgPSBkcGNkW0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0gJgorCQkJCQlEUF9UUkFJTklO
R19BVVhfUkRfTUFTSzsKIAogCWlmIChyZF9pbnRlcnZhbCA+IDQpCi0JCURSTV9ERUJVR19LTVMo
IkFVWCBpbnRlcnZhbCAlZCwgb3V0IG9mIHJhbmdlIChtYXggNClcbiIsCisJCURSTV9ERUJVR19L
TVMoIkFVWCBpbnRlcnZhbCAldSwgb3V0IG9mIHJhbmdlIChtYXggNClcbiIsCiAJCQkgICAgICBy
ZF9pbnRlcnZhbCk7CiAKIAlpZiAocmRfaW50ZXJ2YWwgPT0gMCkKLQkJdWRlbGF5KDQwMCk7CisJ
CXJkX2ludGVydmFsID0gNDAwOwogCWVsc2UKLQkJbWRlbGF5KHJkX2ludGVydmFsICogNCk7CisJ
CXJkX2ludGVydmFsICo9IDQgKiBVU0VDX1BFUl9NU0VDOworCisJdXNsZWVwX3JhbmdlKHJkX2lu
dGVydmFsLCByZF9pbnRlcnZhbCAqIDIpOwogfQogRVhQT1JUX1NZTUJPTChkcm1fZHBfbGlua190
cmFpbl9jaGFubmVsX2VxX2RlbGF5KTsKIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
