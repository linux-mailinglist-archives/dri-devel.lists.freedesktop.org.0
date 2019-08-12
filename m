Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10718E6D0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8676E8FA;
	Thu, 15 Aug 2019 08:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407EF6E4F1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:50:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 10so12053383wmp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 05:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nuL4TLbuiajteIBUcLht3A9vUK/cqgNo9Cf0dYF6/nc=;
 b=cjkraxB8KUqa87EvISNih3+/T2A158UBoGTugkbUi4QCgnbK+HEk+rxqI6B5m2RnDt
 16jZis2Na4wjFw7OdbIlnEDLaqhmsr16rzV5BIsLPAoEKao3wYkrg+Qn4hjFHT98kjVk
 bTWanc/4U9IW78pqGQQOQqHaYNmMwtr5W7E7HfNo5O4+lIxmJdDsxZRE8ElDMEBhSntU
 33MwxI17Hz65J7x+HjC2Hpgg4NRkAoL6apK/KmS+pnt/W8WzJo+PTUtDPrwVT5cPS2pF
 O4nRFrVY7OUKIS4V9qN2RFZsaiwPszUHlB96ql8d2PNAfKcm8pajF34JWgg60BReGVH9
 6UJg==
X-Gm-Message-State: APjAAAVj69tkeWG0cxQzKWtn/S7wsGUvPWAsp0MFiGgiO2JDn5ir/TlR
 taL2xBBCbrAC1UJPbtnai49wAg==
X-Google-Smtp-Source: APXvYqzz/wdsFPSBb7Iv51fpxD7mYrRzkV5Mt16VX8X+OU4vA0sD1wYsRjv5/wSlhihAoZqsMX27Aw==
X-Received: by 2002:a1c:7a02:: with SMTP id v2mr27485520wmc.159.1565614231714; 
 Mon, 12 Aug 2019 05:50:31 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e11sm13740504wrc.4.2019.08.12.05.50.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:50:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [RESEND PATCH v2 8/8] drm/bridge: dw-hdmi-i2s: add .get_eld support
Date: Mon, 12 Aug 2019 14:50:16 +0200
Message-Id: <20190812125016.20169-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812120726.1528-9-jbrunet@baylibre.com>
References: <20190812120726.1528-9-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nuL4TLbuiajteIBUcLht3A9vUK/cqgNo9Cf0dYF6/nc=;
 b=hS7Kx+wOvRPyPbK4skt43H1PfDxHj/p/cn434dg/BQt9yVt/ySb9q4VxmXqpbcQvqR
 GavtSTsLNe7rVhEjG9UPXpd0Q7ymkWVCgxHP386VObqiwHXgMFGPBTQr5lKcLnI5D10z
 IqGc1dLK1K9isXdUt/aZcrMcFzgt2z3Bru0+ZqQX6A6fzH3MhBHTaq05EXAHg9DhamBm
 eIjC+dOqRKSvw5FRqmqCJgzh3bZNJe4gc/YH9Gi0jmgpJouQ1nSXlc/7LBH/9FvJWrg1
 ckSYGMBCIFESxN1VyIveMVps/K52K7gnD9oUz2/vJfT3BzZmGTNHlrJZTauoo4NF+A0i
 Kuig==
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
YXVkaW8uYwppbmRleCBiOGVjZTljMWJhMmMuLjFkMTVjZjliNjgyMSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwpAQCAtMTAs
NiArMTAsNyBAQAogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogCiAjaW5jbHVkZSA8ZHJtL2Jy
aWRnZS9kd19oZG1pLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+CiAKICNpbmNsdWRlIDxz
b3VuZC9oZG1pLWNvZGVjLmg+CiAKQEAgLTEyMSw2ICsxMjIsMTUgQEAgc3RhdGljIHZvaWQgZHdf
aGRtaV9pMnNfYXVkaW9fc2h1dGRvd24oc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQog
CWR3X2hkbWlfYXVkaW9fZGlzYWJsZShoZG1pKTsKIH0KIAorc3RhdGljIGludCBkd19oZG1pX2ky
c19nZXRfZWxkKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgdWludDhfdCAqYnVmLAor
CQkJICAgICAgIHNpemVfdCBsZW4pCit7CisJc3RydWN0IGR3X2hkbWlfaTJzX2F1ZGlvX2RhdGEg
KmF1ZGlvID0gZGF0YTsKKworCW1lbWNweShidWYsIGF1ZGlvLT5lbGQsIG1pbl90KHNpemVfdCwg
TUFYX0VMRF9CWVRFUywgbGVuKSk7CisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBpbnQgZHdfaGRt
aV9pMnNfZ2V0X2RhaV9pZChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwKIAkJ
CQkgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqZW5kcG9pbnQpCiB7CkBAIC0xNDQsNiArMTU0LDcgQEAg
c3RhdGljIGludCBkd19oZG1pX2kyc19nZXRfZGFpX2lkKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVu
dCAqY29tcG9uZW50LAogc3RhdGljIHN0cnVjdCBoZG1pX2NvZGVjX29wcyBkd19oZG1pX2kyc19v
cHMgPSB7CiAJLmh3X3BhcmFtcwk9IGR3X2hkbWlfaTJzX2h3X3BhcmFtcywKIAkuYXVkaW9fc2h1
dGRvd24JPSBkd19oZG1pX2kyc19hdWRpb19zaHV0ZG93biwKKwkuZ2V0X2VsZAk9IGR3X2hkbWlf
aTJzX2dldF9lbGQsCiAJLmdldF9kYWlfaWQJPSBkd19oZG1pX2kyc19nZXRfZGFpX2lkLAogfTsK
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwppbmRleCBiZWQ0YmIw
MTdhZmQuLjhkZjY5YzlkYmZhZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLmMKQEAgLTI3OTcsNiArMjc5Nyw3IEBAIF9fZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2LAogCQlzdHJ1Y3QgZHdfaGRtaV9pMnNfYXVkaW9fZGF0YSBhdWRp
bzsKIAogCQlhdWRpby5oZG1pCT0gaGRtaTsKKwkJYXVkaW8uZWxkCT0gaGRtaS0+Y29ubmVjdG9y
LmVsZDsKIAkJYXVkaW8ud3JpdGUJPSBoZG1pX3dyaXRlYjsKIAkJYXVkaW8ucmVhZAk9IGhkbWlf
cmVhZGI7CiAJCWhkbWktPmVuYWJsZV9hdWRpbyA9IGR3X2hkbWlfaTJzX2F1ZGlvX2VuYWJsZTsK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
