Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BA78E6C9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8F46E931;
	Thu, 15 Aug 2019 08:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B31F6E4FE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:07:38 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m125so7483269wmm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 05:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jc9/cSBhIwTuXPvQDL6txYFXAJblot8ynaeVI0KB+kI=;
 b=dozbbXDE93YThcwaYy05b66CKRp36NR+HfwLNJcHOIxl4+Ezqw2Do26lhv5nuD6OqX
 a25D1Bwb9OwGjj8tn6tRd43pteH3LU5/RK+bHhoEa4eCCE3byVsxtkEtNF7Xp8uE07i8
 EMViyZPGnfy8bKZjnAH5g5Ve5dtwZOIzRIPXGSR7GHX0Osymfi0+gGcsQJgBpyxs/F35
 ZryBDuVTFpJJjYi/mJNhb9QbaYvJRF0SCM11gN1azsU0HzVbi9xH3V4Hr7//JGzV7tQq
 t4nTf82b8Kx6anx+F8+gzBvCNIiU1MwWSCxuryPUNylVZ6Yet7z1/HgiypyXUOutVIjh
 dLWQ==
X-Gm-Message-State: APjAAAW8u4f1er3MNP+Pw6OLqNyWFJ4kUmp+1bb6BRNQX9Sl4JrK6zE8
 sXOGPgDVc8tV9nIQ4Wgptf3KXw==
X-Google-Smtp-Source: APXvYqyA8FXUTAV5OWQlM4IOpnMuM4a1amICXKUVnbBgBqhQLoLXQVYGeXcaLrL4ghbO8MhHX2OFhw==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr28033074wmg.111.1565611657147; 
 Mon, 12 Aug 2019 05:07:37 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 8/8] drm/bridge: dw-hdmi-i2s: add .get_eld support
Date: Mon, 12 Aug 2019 14:07:26 +0200
Message-Id: <20190812120726.1528-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812120726.1528-1-jbrunet@baylibre.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jc9/cSBhIwTuXPvQDL6txYFXAJblot8ynaeVI0KB+kI=;
 b=JCgKaHjiK9nXytoYeRJc1oNQnDr/iTA4L8Cs/nMSQTvwrHCjI8V6q/fMKElW1iq4kH
 QVfNygjYCJLIR2X+73dkH1YWR5jd4IZKoHby+j8qpmF4XhZajY4Kjk0JETHWN8nefT3I
 BfO806OgbneAJNQFFiN1knQc1xLRpBUENeHPFywv44hICM1gob6lINnEr6lMqhzVnZI0
 45ko6hz6x7sRZ4R5nYlMEf5MlYQPrQ0o3lAqjqwFZ8KdHKkua1sCJd0NOmLrjZP+qAlF
 e2qBWgoDEBeqiW5bZLuERfieGV41O7+oENtJiTUejXx6Sj1XEVjw8F1jz4H8xldgpDiF
 UFHg==
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvdmlkZSB0aGUgZWxkIHRvIHRoZSBnZW5lcmljIGhkbWktY29kZWMgZHJpdmVyLgpUaGlzIHdp
bGwgbGV0IHRoZSBkcml2ZXIgZW5mb3JjZSB0aGUgbWF4aW11bSBjaGFubmVsIG51bWJlciBhbmQg
c2V0IHRoZQpjaGFubmVsIGFsbG9jYXRpb24gZGVwZW5kaW5nIG9uIHRoZSBoZG1pIHNpbmsuCgpD
YzogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgpTaWduZWQtb2ZmLWJ5OiBKZXJvbWUg
QnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWktYXVkaW8uaCAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMgfCAxMSArKysrKysrKysrKwogZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgICAgICAgICAgIHwgIDEgKwogMyBm
aWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWF1ZGlvLmggYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWktYXVkaW8uaAppbmRleCA2M2I1NzU2ZjQ2M2IuLmNiMDdkYzBk
YTVhNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1p
LWF1ZGlvLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWF1
ZGlvLmgKQEAgLTE0LDYgKzE0LDcgQEAgc3RydWN0IGR3X2hkbWlfYXVkaW9fZGF0YSB7CiAKIHN0
cnVjdCBkd19oZG1pX2kyc19hdWRpb19kYXRhIHsKIAlzdHJ1Y3QgZHdfaGRtaSAqaGRtaTsKKwl1
OCAqZWxkOwogCiAJdm9pZCAoKndyaXRlKShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgdTggdmFsLCBp
bnQgb2Zmc2V0KTsKIAl1OCAoKnJlYWQpKHN0cnVjdCBkd19oZG1pICpoZG1pLCBpbnQgb2Zmc2V0
KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1p
MnMtYXVkaW8uYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMt
YXVkaW8uYwppbmRleCBiOGVjZTljMWJhMmMuLjYyZTczN2I4MTQ2MiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwpAQCAtMTAs
NiArMTAsNyBAQAogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogCiAjaW5jbHVkZSA8ZHJtL2Jy
aWRnZS9kd19oZG1pLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+CiAKICNpbmNsdWRlIDxz
b3VuZC9oZG1pLWNvZGVjLmg+CiAKQEAgLTEyMSw2ICsxMjIsMTUgQEAgc3RhdGljIHZvaWQgZHdf
aGRtaV9pMnNfYXVkaW9fc2h1dGRvd24oc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQog
CWR3X2hkbWlfYXVkaW9fZGlzYWJsZShoZG1pKTsKIH0KIAorc3RhdGljIGludCBkd19oZG1pX2ky
c19nZXRfZWxkKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgdWludDhfdCAqYnVmLAor
CQkJICAgICAgIHNpemVfdCBsZW4pCit7CisJc3RydWN0IGR3X2hkbWlfaTJzX2F1ZGlvX2RhdGEg
KmF1ZGlvID0gZGF0YTsKKworCW1lbWNweShidWYsIGF1ZGlvLT5lbGQsIG1pbihzaXplb2YoTUFY
X0VMRF9CWVRFUyksIGxlbikpOworCXJldHVybiAwOworfQorCiBzdGF0aWMgaW50IGR3X2hkbWlf
aTJzX2dldF9kYWlfaWQoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsCiAJCQkJ
ICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmVuZHBvaW50KQogewpAQCAtMTQ0LDYgKzE1NCw3IEBAIHN0
YXRpYyBpbnQgZHdfaGRtaV9pMnNfZ2V0X2RhaV9pZChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQg
KmNvbXBvbmVudCwKIHN0YXRpYyBzdHJ1Y3QgaGRtaV9jb2RlY19vcHMgZHdfaGRtaV9pMnNfb3Bz
ID0gewogCS5od19wYXJhbXMJPSBkd19oZG1pX2kyc19od19wYXJhbXMsCiAJLmF1ZGlvX3NodXRk
b3duCT0gZHdfaGRtaV9pMnNfYXVkaW9fc2h1dGRvd24sCisJLmdldF9lbGQJPSBkd19oZG1pX2ky
c19nZXRfZWxkLAogCS5nZXRfZGFpX2lkCT0gZHdfaGRtaV9pMnNfZ2V0X2RhaV9pZCwKIH07CiAK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKaW5kZXggYmVkNGJiMDE3
YWZkLi44ZGY2OWM5ZGJmYWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS5jCkBAIC0yNzk3LDYgKzI3OTcsNyBAQCBfX2R3X2hkbWlfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldiwKIAkJc3RydWN0IGR3X2hkbWlfaTJzX2F1ZGlvX2RhdGEgYXVkaW87
CiAKIAkJYXVkaW8uaGRtaQk9IGhkbWk7CisJCWF1ZGlvLmVsZAk9IGhkbWktPmNvbm5lY3Rvci5l
bGQ7CiAJCWF1ZGlvLndyaXRlCT0gaGRtaV93cml0ZWI7CiAJCWF1ZGlvLnJlYWQJPSBoZG1pX3Jl
YWRiOwogCQloZG1pLT5lbmFibGVfYXVkaW8gPSBkd19oZG1pX2kyc19hdWRpb19lbmFibGU7Ci0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
