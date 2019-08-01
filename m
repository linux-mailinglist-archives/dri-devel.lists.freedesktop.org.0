Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2082F7D3DA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 05:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EE06E34B;
	Thu,  1 Aug 2019 03:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613F16E346
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 03:45:05 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id i189so33157181pfg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F6mhNt9xKY3uV6IZqhaRNS+0qqJSN5zpoSD/eavy3uU=;
 b=UAEHGTYfPOe1tLye6C4C/YEoBje/lbxybKkiHilKKzvFLZPjRknR0mSMCehor3FEa0
 pLHX8+JBUO2GrH7tCnC9tm1+XGQAyLMYIYT0FT4F0391qr2UCSOiIU+4OdmuRyP3LHAd
 svucr2hW1AX8lq6CJfp8XcskJPtSZJBi4EpizS05f699q/jgkePv4zqDFVIYKOLlcHRe
 t7cE2wwjYCNXrBAeubRaqtoZ/6B8g19kmqbF/RD/zH+bQxZagNGXZ4MB6U3wmZnbFaNl
 bwk3a+6/Czlsh1R7Tba8tjB4q1hSXkytQmXxytdjL+6pUt2703myFC16Cvs9pmDZAUgv
 ekxw==
X-Gm-Message-State: APjAAAWsv2875ypl8UnhY6+hg4bRgTLP1i7ePn1/rxszl3KSlresNZ1z
 vaLSDVmRP/RV/PR8qpraDUVKwQ==
X-Google-Smtp-Source: APXvYqzUf9MX/78dPWJhL5pQmUlIgIXdOyov3muaXgm6GM6xJ64ZGPwiBUJA5inxS8yWFTdCXCsnuw==
X-Received: by 2002:aa7:93bb:: with SMTP id x27mr52442349pff.10.1564631102402; 
 Wed, 31 Jul 2019 20:45:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h70sm64775674pgc.36.2019.07.31.20.45.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 20:45:01 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 11/26] drm: kirin: Move workqueue to ade_hw_ctx structure
Date: Thu,  1 Aug 2019 03:44:24 +0000
Message-Id: <20190801034439.98227-12-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801034439.98227-1-john.stultz@linaro.org>
References: <20190801034439.98227-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F6mhNt9xKY3uV6IZqhaRNS+0qqJSN5zpoSD/eavy3uU=;
 b=vEzEX4JHVuUi5sYWo6MR1DLYLnODyR9Lkq+GuIce+gy0uur0/q7RL3aqHaX60sB2QY
 e0vT1vQfQB3bxmbNeWqNTHaoJxk/z/Mr567FQbh3EVVuekusAb0zloFF5PbR8W8/f1uW
 G8vwxvMZtt2GoBiEwTUHQ5U6UJTEfwa98UVB8mimPQphNKA4h6Fio4aEHXmUgz+/Gx8H
 yoQjKUIehHdbRSvgLX5jcXqYYRfqE88vbn8IHAe3WQXjHUurf1B4FRZUOhc7Y4DSl+lW
 86BsFdYSqDfLWQe1fr/jA1WUeGK+v+9v8IfI8BJMI741YvdP+y+A9a63vDkGZjWePEWh
 94vw==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHdvcmtxdWV1ZSB1c2VkIHRvIHJlc2V0IHRoZSBkaXNwbGF5IHdoZW4gd2UgaGl0IGFuIExE
SQp1bmRlcmZsb3cgZXJyb3IgaXMgQURFIHNwZWNpZmljLCBzbyBzaW5jZSB0aGlzIHBhdGNoIHNl
cmllcwp3b3JrcyB0byBtYWtlIHRoZSBraXJpbl9jcnRjIHN0cnVjdHVyZSBtb3JlIGdlbmVyaWMs
IG1vdmUgdGhlCndvcmtxdWV1ZSB0byB0aGUgYWRlX2h3X2N0eCBzdHJ1Y3R1cmUgaW5zdGVhZC4K
CkNjOiBSb25ncm9uZyBab3UgPHpvdXJvbmdyb25nQGdtYWlsLmNvbT4KQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
Q2M6IGRyaS1kZXZlbCA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4KQ2M6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxp
bmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1f
YWRlLmMgfCAxMiArKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9r
aXJpbi9raXJpbl9kcm1fYWRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tp
cmluX2RybV9hZGUuYwppbmRleCAwZTBmZTFjYjk0NWYuLmVjNDg1N2U0NWI2ZSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKQEAgLTUyLDYg
KzUyLDcgQEAgc3RydWN0IGFkZV9od19jdHggewogCXN0cnVjdCBjbGsgKm1lZGlhX25vY19jbGs7
CiAJc3RydWN0IGNsayAqYWRlX3BpeF9jbGs7CiAJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJlc2V0
OworCXN0cnVjdCB3b3JrX3N0cnVjdCBkaXNwbGF5X3Jlc2V0X3dxOwogCWJvb2wgcG93ZXJfb247
CiAJaW50IGlycTsKIApAQCAtNjEsNyArNjIsNiBAQCBzdHJ1Y3QgYWRlX2h3X2N0eCB7CiBzdHJ1
Y3Qga2lyaW5fY3J0YyB7CiAJc3RydWN0IGRybV9jcnRjIGJhc2U7CiAJdm9pZCAqaHdfY3R4Owot
CXN0cnVjdCB3b3JrX3N0cnVjdCBkaXNwbGF5X3Jlc2V0X3dxOwogCWJvb2wgZW5hYmxlOwogfTsK
IApAQCAtMzQ5LDkgKzM0OSw5IEBAIHN0YXRpYyB2b2lkIGFkZV9jcnRjX2Rpc2FibGVfdmJsYW5r
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIAogc3RhdGljIHZvaWQgZHJtX3VuZGVyZmxvd193cShz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiB7Ci0Jc3RydWN0IGtpcmluX2NydGMgKmFjcnRjID0g
Y29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBraXJpbl9jcnRjLAorCXN0cnVjdCBhZGVfaHdfY3R4
ICpjdHggPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IGFkZV9od19jdHgsCiAJCQkJCSAgICAg
IGRpc3BsYXlfcmVzZXRfd3EpOwotCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gKCZhY3J0
Yy0+YmFzZSktPmRldjsKKwlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGN0eC0+Y3J0Yy0+
ZGV2OwogCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZTsKIAogCXN0YXRlID0gZHJtX2F0
b21pY19oZWxwZXJfc3VzcGVuZChkcm1fZGV2KTsKQEAgLTM2Miw3ICszNjIsNiBAQCBzdGF0aWMg
aXJxcmV0dXJuX3QgYWRlX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCiB7CiAJc3Ry
dWN0IGFkZV9od19jdHggKmN0eCA9IGRhdGE7CiAJc3RydWN0IGRybV9jcnRjICpjcnRjID0gY3R4
LT5jcnRjOwotCXN0cnVjdCBraXJpbl9jcnRjICprY3J0YyA9IHRvX2tpcmluX2NydGMoY3J0Yyk7
CiAJdm9pZCBfX2lvbWVtICpiYXNlID0gY3R4LT5iYXNlOwogCXUzMiBzdGF0dXM7CiAKQEAgLTM3
OSw3ICszNzgsNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgYWRlX2lycV9oYW5kbGVyKGludCBpcnEs
IHZvaWQgKmRhdGEpCiAJCWFkZV91cGRhdGVfYml0cyhiYXNlICsgTERJX0lOVF9DTFIsIFVOREVS
RkxPV19JTlRfRU5fT0ZTVCwKIAkJCQlNQVNLKDEpLCAxKTsKIAkJRFJNX0VSUk9SKCJMREkgdW5k
ZXJmbG93ISIpOwotCQlzY2hlZHVsZV93b3JrKCZrY3J0Yy0+ZGlzcGxheV9yZXNldF93cSk7CisJ
CXNjaGVkdWxlX3dvcmsoJmN0eC0+ZGlzcGxheV9yZXNldF93cSk7CiAJfQogCiAJcmV0dXJuIElS
UV9IQU5ETEVEOwpAQCAtMTAxNiw2ICsxMDE1LDcgQEAgc3RhdGljIHZvaWQgKmFkZV9od19jdHhf
YWxsb2Moc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKIAlpZiAocmV0KQogCQlyZXR1cm4g
RVJSX1BUUigtRUlPKTsKIAorCUlOSVRfV09SSygmY3R4LT5kaXNwbGF5X3Jlc2V0X3dxLCBkcm1f
dW5kZXJmbG93X3dxKTsKIAljdHgtPmNydGMgPSBjcnRjOwogCiAJcmV0dXJuIGN0eDsKQEAgLTEw
NzEsOCArMTA3MSw2IEBAIHN0YXRpYyBpbnQgYWRlX2RybV9pbml0KHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCUlOSVRfV09SSygma2Ny
dGMtPmRpc3BsYXlfcmVzZXRfd3EsIGRybV91bmRlcmZsb3dfd3EpOwotCiAJcmV0dXJuIDA7CiB9
CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
