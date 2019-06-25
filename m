Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C885642E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BAF6E2E3;
	Wed, 26 Jun 2019 08:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A6D6E171
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:34:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v14so18635067wrr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ZSWbqFAdYMHZSBHSRb1jfufvzOhyuDcLok5vmyDpAk=;
 b=YxkTqkMz7nS5pMEDvB/bjBPI1Szmtt3LmQuztgWzrAFw3gqWNIPNBc7Tz6F+PyyD8z
 nH/kkhj3dyZ4/4PI4+kBvrJmjnlNTWXcoTNNDmz+bQ6HKAwFe3fHQg33GMTpD3M1Svdx
 5ICr/Kg0utK0w6ytAIgoelLwRF24wfs9fVdr4cqyok1JRtLZSkTYUig1H7h93Dkh1NYg
 yX+metkyOcYhdbB189+DAb67xRRuzSn07dRa6879UtB2uKruND1HC5CacQ0apaQxPjGr
 OVuHAEywX/he4I0Pu/bUCnsrbtPcbDi37WgulaKj7dKoDMj/7oZ/I75DiiLu1kZ9L/m8
 VRGQ==
X-Gm-Message-State: APjAAAWVb8lHJgy0g3ab568fB8EG+xN4pJsyLfiR6sCLxAGCNw1eRV3q
 UCjsieYUozufCdqfWhbp3PiSCw==
X-Google-Smtp-Source: APXvYqxBEmrDBznAn14GIGVfoHIVRb3pDwaOfikmLmN/GvkdUV1EAMzyMBq7WLZPIpw1AC69xAAo+Q==
X-Received: by 2002:a05:6000:114b:: with SMTP id
 d11mr47787109wrx.167.1561480492966; 
 Tue, 25 Jun 2019 09:34:52 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.34.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 09:34:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 01/12] backlight: gpio: allow to probe non-pdata devices from
 board files
Date: Tue, 25 Jun 2019 18:34:23 +0200
Message-Id: <20190625163434.13620-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
References: <20190625163434.13620-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ZSWbqFAdYMHZSBHSRb1jfufvzOhyuDcLok5vmyDpAk=;
 b=SJOSCbrBbZkjOqrPgnuNAn3R5vfXS6muglF3i2rYm4u0+9MfY8ZtiyCWhaoSYkXO8w
 eOFkyeVW0jcrhK2bzRVm7OVFfxNNRuPXIaA1Pc5QIbfMItUzavJ+NDMN8n9e0L9FS8p6
 tq7TTeGdzaX0136DmFa1LftA7xw+cPs//R7BxHfmQaa/vNwriSWQhE6HYmKQuFbGDxDq
 Bg5erLaGp0cgJlgeiEOIPYKLnoR9icCMSctMhsB1HZzmQqp3udL5+Sn4pNOcL9yKERsx
 Z5y5KpcxAJ9+MaE4zx8TVcaHvHGAnMEpPRGOC89hkmJe4zcmW8hColHnvm5z1nJEKHx+
 Lt5A==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCkN1
cnJlbnRseSB3ZSBjYW4gb25seSBwcm9iZSBkZXZpY2VzIHRoYXQgZWl0aGVyIHVzZSBkZXZpY2Ug
dHJlZSBvciBwYXNzCnBsYXRmb3JtIGRhdGEgdG8gcHJvYmUoKS4gUmVuYW1lIGdwaW9fYmFja2xp
Z2h0X3Byb2JlX2R0KCkgdG8KZ3Bpb19iYWNrbGlnaHRfcHJvYmVfcHJvcCgpIGFuZCB1c2UgZ2Vu
ZXJpYyBkZXZpY2UgcHJvcGVydGllcyBpbnN0ZWFkCm9mIE9GIHNwZWNpZmljIGhlbHBlcnMuIFJl
dmVyc2UgdGhlIGxvZ2ljIGNoZWNraW5nIHRoZSBwcmVzZW5jZSBvZgpwbGF0Zm9ybSBkYXRhIGlu
IHByb2JlKCkuIFRoaXMgd2F5IHdlIGNhbiBwcm9iZSBkZXZpY2VzKCkgcmVnaXN0ZXJlZApmcm9t
IG1hY2hpbmUgY29kZSB0aGF0IG5laXRoZXIgaGF2ZSBhIERUIG5vZGUgbm9yIHVzZSBwbGF0Zm9y
bSBkYXRhLgoKU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tp
QGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdo
dC5jIHwgMjQgKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19i
YWNrbGlnaHQuYwppbmRleCBiOTMwMGYzZTFlZTYuLjY1NGMxOWQzYTgxZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYworKysgYi9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCkBAIC01NCwxNSArNTQsMTQgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBiYWNrbGlnaHRfb3BzIGdwaW9fYmFja2xpZ2h0X29wcyA9IHsKIAkuY2hl
Y2tfZmIJPSBncGlvX2JhY2tsaWdodF9jaGVja19mYiwKIH07CiAKLXN0YXRpYyBpbnQgZ3Bpb19i
YWNrbGlnaHRfcHJvYmVfZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKLQkJCQkgICBz
dHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCkKK3N0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJv
YmVfcHJvcChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAorCQkJCSAgICAgc3RydWN0IGdw
aW9fYmFja2xpZ2h0ICpnYmwpCiB7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsK
LQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOwogCWVudW0gZ3Bpb2RfZmxh
Z3MgZmxhZ3M7CiAJaW50IHJldDsKIAotCWdibC0+ZGVmX3ZhbHVlID0gb2ZfcHJvcGVydHlfcmVh
ZF9ib29sKG5wLCAiZGVmYXVsdC1vbiIpOworCWdibC0+ZGVmX3ZhbHVlID0gZGV2aWNlX3Byb3Bl
cnR5X3JlYWRfYm9vbChkZXYsICJkZWZhdWx0LW9uIik7CiAJZmxhZ3MgPSBnYmwtPmRlZl92YWx1
ZSA/IEdQSU9EX09VVF9ISUdIIDogR1BJT0RfT1VUX0xPVzsKIAogCWdibC0+Z3Bpb2QgPSBkZXZt
X2dwaW9kX2dldChkZXYsIE5VTEwsIGZsYWdzKTsKQEAgLTg2LDI2ICs4NSwxNSBAQCBzdGF0aWMg
aW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJ
c3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVzIHByb3BzOwogCXN0cnVjdCBiYWNrbGlnaHRfZGV2
aWNlICpibDsKIAlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibDsKLQlzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGU7CiAJaW50IHJldDsKIAotCWlmICghcGRhdGEgJiYg
IW5wKSB7Ci0JCWRldl9lcnIoJnBkZXYtPmRldiwKLQkJCSJmYWlsZWQgdG8gZmluZCBwbGF0Zm9y
bSBkYXRhIG9yIGRldmljZSB0cmVlIG5vZGUuXG4iKTsKLQkJcmV0dXJuIC1FTk9ERVY7Ci0JfQot
CiAJZ2JsID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqZ2JsKSwgR0ZQX0tFUk5F
TCk7CiAJaWYgKGdibCA9PSBOVUxMKQogCQlyZXR1cm4gLUVOT01FTTsKIAogCWdibC0+ZGV2ID0g
JnBkZXYtPmRldjsKIAotCWlmIChucCkgewotCQlyZXQgPSBncGlvX2JhY2tsaWdodF9wcm9iZV9k
dChwZGV2LCBnYmwpOwotCQlpZiAocmV0KQotCQkJcmV0dXJuIHJldDsKLQl9IGVsc2UgeworCWlm
IChwZGF0YSkgewogCQkvKgogCQkgKiBMZWdhY3kgcGxhdGZvcm0gZGF0YSBHUElPIHJldHJpZXZl
YWwuIERvIG5vdCBleHBhbmQKIAkJICogdGhlIHVzZSBvZiB0aGlzIGNvZGUgcGF0aCwgY3VycmVu
dGx5IG9ubHkgdXNlZCBieSBvbmUKQEAgLTEyNiw2ICsxMTQsMTAgQEAgc3RhdGljIGludCBncGlv
X2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlnYmwtPmdw
aW9kID0gZ3Bpb190b19kZXNjKHBkYXRhLT5ncGlvKTsKIAkJaWYgKCFnYmwtPmdwaW9kKQogCQkJ
cmV0dXJuIC1FSU5WQUw7CisJfSBlbHNlIHsKKwkJcmV0ID0gZ3Bpb19iYWNrbGlnaHRfcHJvYmVf
cHJvcChwZGV2LCBnYmwpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKIAl9CiAKIAltZW1z
ZXQoJnByb3BzLCAwLCBzaXplb2YocHJvcHMpKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
