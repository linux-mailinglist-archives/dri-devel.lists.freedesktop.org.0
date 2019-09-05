Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2314AB2D0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EF26E16D;
	Fri,  6 Sep 2019 07:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B872E6E044
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:14 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id w10so1680564pgj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tpqdWISBmI7/K+eXW/BM3B61WGwPfixYNx9jyTHk1dU=;
 b=Rh/e4QZNeW569JIHlkL6MsIN0au7EmkpoAQyG12Rp6VcM5pLRTDClG+MkZDwZL9RXk
 lKN2GtG/EzeAynbYw11OMgvKee8y5b8s3SiiNQsSHSQR0JWq9VFemmWjDSj/zcBDNIYl
 Hjqt3dqWvX4ArHB5Uf60+b9jbyN+4SvEVbFm3mnl/ito2J5vKnFl0SvMoz6Hg88Q4fvf
 q1ebEPHvg8AksLJfKyndMHemAtrdBGAX00tBxktd690HTDWYHBVaVd212EoQuK3I2ao3
 EjkBSlRn8xJCF6+3IYok75rjATS0F2JI6H6IXfOe5ZIwQUqgYU6tuUK41RYrDeQFCRgh
 245g==
X-Gm-Message-State: APjAAAXRVVV17ODm2DLs6rhKaxy93zJy7Wmm3Vv4eThE3PT93mZO6l2H
 ygOq3v+5mqlM+No/qeRMC3VPJAdQqaY=
X-Google-Smtp-Source: APXvYqzLPzIYaG0mi1vPeoIIvWEzHscZk32TWtoUUzrIK69h3pf7m60GZNfheMkCm5xxBpsI0LrElA==
X-Received: by 2002:aa7:8e08:: with SMTP id c8mr849847pfr.238.1567700294324;
 Thu, 05 Sep 2019 09:18:14 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:13 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 11/18] misc: pci_endpoint_test: Fix BUG_ON error
 during pci_disable_msi()
Date: Thu,  5 Sep 2019 10:17:52 -0600
Message-Id: <20190905161759.28036-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tpqdWISBmI7/K+eXW/BM3B61WGwPfixYNx9jyTHk1dU=;
 b=K5DiiY2Fgz6MUrPKTtz10HsJkolwwVvGrdqBD69mgIMaQbkMXiTRCgCbb2ZyUxaTSS
 TsurgVMOb8XwbIXgdyeF+rfzsvnXsAM1sHLEQ4y5Ke840f0eEdtxvvN3Pb5ZdVwNLiXE
 UV+r4cWr5AN6DgFXtNn2GrDrgfsbA6uZcFqrnHfIbgan0lx/1+ZKIyh6gDp63fdh/v9I
 KCxMrdpVzkF4eB9dCxcnzu4IORv5zjU09dggJmJTVefvcrHEGmUqyNXgA3hCndJldZef
 81oH34LbhykA0VcHebAOIDd2RLBykltXAikm9fusMU2Bx4GGt+Kmw89s92q1rKZ+QSBQ
 hcng==
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogS2lzaG9uIFZpamF5IEFicmFoYW0gSSA8a2lzaG9uQHRpLmNvbT4KCmNvbW1pdCBiNzYz
NmU4MTZhZGNiNTJiYzk2YjZmYjdiYzlkMTQxY2JmZDE3ZGRiIHVwc3RyZWFtCgpwY2lfZGlzYWJs
ZV9tc2koKSB0aHJvd3MgYSBLZXJuZWwgQlVHIGlmIHRoZSBkcml2ZXIgaGFzIHN1Y2Nlc3NmdWxs
eQpyZXF1ZXN0ZWQgYW4gSVJRIGFuZCBub3QgcmVsZWFzZWQgaXQuIEZpeCBpdCBoZXJlIGJ5IGZy
ZWVpbmcgSVJRcyBiZWZvcmUKaW52b2tpbmcgcGNpX2Rpc2FibGVfbXNpKCkuCgpTaWduZWQtb2Zm
LWJ5OiBLaXNob24gVmlqYXkgQWJyYWhhbSBJIDxraXNob25AdGkuY29tPgpTaWduZWQtb2ZmLWJ5
OiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBNYXRo
aWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvbWlz
Yy9wY2lfZW5kcG9pbnRfdGVzdC5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9wY2lfZW5kcG9pbnRfdGVzdC5j
IGIvZHJpdmVycy9taXNjL3BjaV9lbmRwb2ludF90ZXN0LmMKaW5kZXggNTA0ZmE2ODA4MjVkLi4y
MzBmMWU4NTM4ZGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWlzYy9wY2lfZW5kcG9pbnRfdGVzdC5j
CisrKyBiL2RyaXZlcnMvbWlzYy9wY2lfZW5kcG9pbnRfdGVzdC5jCkBAIC05Miw2ICs5Miw3IEBA
IHN0cnVjdCBwY2lfZW5kcG9pbnRfdGVzdCB7CiAJdm9pZCBfX2lvbWVtCSpiYXJbNl07CiAJc3Ry
dWN0IGNvbXBsZXRpb24gaXJxX3JhaXNlZDsKIAlpbnQJCWxhc3RfaXJxOworCWludAkJbnVtX2ly
cXM7CiAJLyogbXV0ZXggdG8gcHJvdGVjdCB0aGUgaW9jdGxzICovCiAJc3RydWN0IG11dGV4CW11
dGV4OwogCXN0cnVjdCBtaXNjZGV2aWNlIG1pc2NkZXY7CkBAIC01MTQsNiArNTE1LDcgQEAgc3Rh
dGljIGludCBwY2lfZW5kcG9pbnRfdGVzdF9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAkJ
aXJxID0gcGNpX2FsbG9jX2lycV92ZWN0b3JzKHBkZXYsIDEsIDMyLCBQQ0lfSVJRX01TSSk7CiAJ
CWlmIChpcnEgPCAwKQogCQkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0IE1TSSBpbnRlcnJ1
cHRzXG4iKTsKKwkJdGVzdC0+bnVtX2lycXMgPSBpcnE7CiAJfQogCiAJZXJyID0gZGV2bV9yZXF1
ZXN0X2lycShkZXYsIHBkZXYtPmlycSwgcGNpX2VuZHBvaW50X3Rlc3RfaXJxaGFuZGxlciwKQEAg
LTU4MSw2ICs1ODMsOSBAQCBzdGF0aWMgaW50IHBjaV9lbmRwb2ludF90ZXN0X3Byb2JlKHN0cnVj
dCBwY2lfZGV2ICpwZGV2LAogCQkJcGNpX2lvdW5tYXAocGRldiwgdGVzdC0+YmFyW2Jhcl0pOwog
CX0KIAorCWZvciAoaSA9IDA7IGkgPCBpcnE7IGkrKykKKwkJZGV2bV9mcmVlX2lycShkZXYsIHBk
ZXYtPmlycSArIGksIHRlc3QpOworCiBlcnJfZGlzYWJsZV9tc2k6CiAJcGNpX2Rpc2FibGVfbXNp
KHBkZXYpOwogCXBjaV9yZWxlYXNlX3JlZ2lvbnMocGRldik7CkBAIC01OTQsNiArNTk5LDcgQEAg
c3RhdGljIGludCBwY2lfZW5kcG9pbnRfdGVzdF9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwK
IHN0YXRpYyB2b2lkIHBjaV9lbmRwb2ludF90ZXN0X3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRl
dikKIHsKIAlpbnQgaWQ7CisJaW50IGk7CiAJZW51bSBwY2lfYmFybm8gYmFyOwogCXN0cnVjdCBw
Y2lfZW5kcG9pbnRfdGVzdCAqdGVzdCA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3Qg
bWlzY2RldmljZSAqbWlzY19kZXZpY2UgPSAmdGVzdC0+bWlzY2RldjsKQEAgLTYwOSw2ICs2MTUs
OCBAQCBzdGF0aWMgdm9pZCBwY2lfZW5kcG9pbnRfdGVzdF9yZW1vdmUoc3RydWN0IHBjaV9kZXYg
KnBkZXYpCiAJCWlmICh0ZXN0LT5iYXJbYmFyXSkKIAkJCXBjaV9pb3VubWFwKHBkZXYsIHRlc3Qt
PmJhcltiYXJdKTsKIAl9CisJZm9yIChpID0gMDsgaSA8IHRlc3QtPm51bV9pcnFzOyBpKyspCisJ
CWRldm1fZnJlZV9pcnEoJnBkZXYtPmRldiwgcGRldi0+aXJxICsgaSwgdGVzdCk7CiAJcGNpX2Rp
c2FibGVfbXNpKHBkZXYpOwogCXBjaV9yZWxlYXNlX3JlZ2lvbnMocGRldik7CiAJcGNpX2Rpc2Fi
bGVfZGV2aWNlKHBkZXYpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
