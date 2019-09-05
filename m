Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 880A4AB2C4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB64D6E157;
	Fri,  6 Sep 2019 07:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F34C6E122
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:09 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 205so2082135pfw.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rjuaqfgsXjJPwAACoDEoQUxKOEl2ZmoHXoDNdOHfK/8=;
 b=MbaaCpGbEiWdKH8CTcB644wuqVI/po6O6Y9wMaKhOXDG2ih7IH/buGDW8UZ2EvoRpg
 nW8uw0ScQzf/m8d9sWEsImlbTYc7zbiAANVrG+Mq8B3jru1YFrQzpod5uj2JzrL7UWXQ
 Y7P98ZHsTqkko9fXWmdI9KOnYWYCkpmbr+oGs40F7gXYnDLX9XusXejjETycbLCD8eys
 LMtO9JSIE2mnL6JiTal9qUvFBb/XMWl/Kq3XN0bbXj+cx4Sd2GWvGcB9Sni2+MxajuNE
 JGZ5Ptd85kBECf/aSFUWyESQLaSGjPzEMc6VAagAvinLxN6DAWLhgKWrrxDxUvlG3zvk
 J/XA==
X-Gm-Message-State: APjAAAUKUCxxGGifpaHa+03vviEjpnW6pCm+QfaJTYo5DBWcctfiqr4j
 PV2/3kfppyeBSrblb5mkupWVEg==
X-Google-Smtp-Source: APXvYqwjC/u78z/zaGM+j2+m/kS1EooYMEgWtfeDDH4gvURdMNHJyy5MyPkUpGOGmsnrWffGg8MToQ==
X-Received: by 2002:a63:394:: with SMTP id 142mr3929328pgd.43.1567700288547;
 Thu, 05 Sep 2019 09:18:08 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:08 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 06/18] ASoC: tlv320aic31xx: Handle inverted BCLK in
 non-DSP modes
Date: Thu,  5 Sep 2019 10:17:47 -0600
Message-Id: <20190905161759.28036-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rjuaqfgsXjJPwAACoDEoQUxKOEl2ZmoHXoDNdOHfK/8=;
 b=DhtZCS6pEqVXAANTeuPn229D+BZX3X67QaHqNgnEKoio/f3XFGIKudVgM5FDU+7o8L
 nQ6C8zCJpGUG562Tdrhhk+jzdjUxPEUMlyMrosXluqm8s7BPYWWQ2Sfl8GPdcyN3+vz3
 WgC0nx5vQPM/ac0gkVSlnhW9uet9jY41HdO0XoqnQ4dQQgwZRDvRXdAX5pdKiXWoz78p
 gJ/gB20nx7nFBvvCBuWrSZgl46CenVN2LnP6ZluOUqhvk/2lQx7TA+V1EqPfUJ0tOjn4
 d9umZlIflwKbjOrolidHP4+2mwXkt5JzsO/HIsQg2gt2s/+L0G/cpcGqNlGMyilyzdUy
 uaqw==
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

RnJvbTogIkFuZHJldyBGLiBEYXZpcyIgPGFmZEB0aS5jb20+Cgpjb21taXQgZGNiNDA3YjI1N2Fm
MDZmYTU4YjA1NDRlYzAxZWM5ZTBkMzkyN2UwMiB1cHN0cmVhbQoKQ3VycmVudGx5IEJDTEsgaW52
ZXJ0aW5nIGlzIG9ubHkgaGFuZGxlZCB3aGVuIHRoZSBEQUkgZm9ybWF0IGlzCkRTUCwgYnV0IHRo
ZSBCQ0xLIG1heSBiZSBpbnZlcnRlZCBpbiBhbnkgc3VwcG9ydGVkIG1vZGUuIFdpdGhvdXQKdGhp
cyB1c2luZyB0aGlzIENPREVDIGluIGFueSBvdGhlciBtb2RlIHRoYW4gRFNQIHdpdGggdGhlIEJD
TEsKaW52ZXJ0ZWQgbGVhZHMgdG8gYmFkIHNhbXBsaW5nIHRpbWluZyBhbmQgdmVyeSBwb29yIGF1
ZGlvIHF1YWxpdHkuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgRi4gRGF2aXMgPGFmZEB0aS5jb20+
ClNpZ25lZC1vZmYtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KU2lnbmVkLW9m
Zi1ieTogTWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4KLS0tCiBz
b3VuZC9zb2MvY29kZWNzL3RsdjMyMGFpYzMxeHguYyB8IDI4ICsrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL3RsdjMyMGFpYzMxeHguYyBiL3NvdW5k
L3NvYy9jb2RlY3MvdGx2MzIwYWljMzF4eC5jCmluZGV4IDU0YTg3YTkwNWViNi4uZDNiZDBiZjE1
ZGRiIDEwMDY0NAotLS0gYS9zb3VuZC9zb2MvY29kZWNzL3RsdjMyMGFpYzMxeHguYworKysgYi9z
b3VuZC9zb2MvY29kZWNzL3RsdjMyMGFpYzMxeHguYwpAQCAtOTI0LDYgKzkyNCwxOCBAQCBzdGF0
aWMgaW50IGFpYzMxeHhfc2V0X2RhaV9mbXQoc3RydWN0IHNuZF9zb2NfZGFpICpjb2RlY19kYWks
CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAorCS8qIHNpZ25hbCBwb2xhcml0eSAqLworCXN3aXRj
aCAoZm10ICYgU05EX1NPQ19EQUlGTVRfSU5WX01BU0spIHsKKwljYXNlIFNORF9TT0NfREFJRk1U
X05CX05GOgorCQlicmVhazsKKwljYXNlIFNORF9TT0NfREFJRk1UX0lCX05GOgorCQlpZmFjZV9y
ZWcyIHw9IEFJQzMxWFhfQkNMS0lOVl9NQVNLOworCQlicmVhazsKKwlkZWZhdWx0OgorCQlkZXZf
ZXJyKGNvZGVjLT5kZXYsICJJbnZhbGlkIERBSSBjbG9jayBzaWduYWwgcG9sYXJpdHlcbiIpOwor
CQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKIAkvKiBpbnRlcmZhY2UgZm9ybWF0ICovCiAJc3dpdGNo
IChmbXQgJiBTTkRfU09DX0RBSUZNVF9GT1JNQVRfTUFTSykgewogCWNhc2UgU05EX1NPQ19EQUlG
TVRfSTJTOgpAQCAtOTMxLDE2ICs5NDMsMTIgQEAgc3RhdGljIGludCBhaWMzMXh4X3NldF9kYWlf
Zm10KHN0cnVjdCBzbmRfc29jX2RhaSAqY29kZWNfZGFpLAogCWNhc2UgU05EX1NPQ19EQUlGTVRf
RFNQX0E6CiAJCWRzcF9hX3ZhbCA9IDB4MTsKIAljYXNlIFNORF9TT0NfREFJRk1UX0RTUF9COgot
CQkvKiBOT1RFOiBCQ0xLSU5WIGJpdCB2YWx1ZSAxIGVxdWFzIE5CIGFuZCAwIGVxdWFscyBJQiAq
LwotCQlzd2l0Y2ggKGZtdCAmIFNORF9TT0NfREFJRk1UX0lOVl9NQVNLKSB7Ci0JCWNhc2UgU05E
X1NPQ19EQUlGTVRfTkJfTkY6Ci0JCQlpZmFjZV9yZWcyIHw9IEFJQzMxWFhfQkNMS0lOVl9NQVNL
OwotCQkJYnJlYWs7Ci0JCWNhc2UgU05EX1NPQ19EQUlGTVRfSUJfTkY6Ci0JCQlicmVhazsKLQkJ
ZGVmYXVsdDoKLQkJCXJldHVybiAtRUlOVkFMOwotCQl9CisJCS8qCisJCSAqIE5PVEU6IFRoaXMg
Q09ERUMgc2FtcGxlcyBvbiB0aGUgZmFsbGluZyBlZGdlIG9mIEJDTEsgaW4KKwkJICogRFNQIG1v
ZGUsIHRoaXMgaXMgaW52ZXJ0ZWQgY29tcGFyZWQgdG8gd2hhdCBtb3N0IERBSXMKKwkJICogZXhw
ZWN0LCBzbyB3ZSBpbnZlcnQgZm9yIHRoaXMgbW9kZQorCQkgKi8KKwkJaWZhY2VfcmVnMiBePSBB
SUMzMVhYX0JDTEtJTlZfTUFTSzsKIAkJaWZhY2VfcmVnMSB8PSAoQUlDMzFYWF9EU1BfTU9ERSA8
PAogCQkJICAgICAgIEFJQzMxWFhfSUZBQ0UxX0RBVEFUWVBFX1NISUZUKTsKIAkJYnJlYWs7Ci0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
