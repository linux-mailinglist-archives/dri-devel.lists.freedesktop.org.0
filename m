Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 382A182C98
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F2789ECB;
	Tue,  6 Aug 2019 07:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2482D6E459
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:41:16 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id u25so62703015wmc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 06:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+WcHBmr4prRt0vIkSfM9PPUqwEgU3pvt4JgB//l4IQ=;
 b=stlw5ko1NYZJA75GgsWwzcLKFvF4w28KpekltxMC4kN1W7KiuOOZnKGszVnctqhysI
 Aslz8y72MkUK6WEglT6LV90JoCaZuY3haq2DKHznG4UFn4e1J1Al2rM2UQ6ALkyUq0JF
 L84P/IT3VqxKt2Y8WnsWDAYCPfNnz5+P2ExI0big89hlnUoEGC42iuOGZgP5sl8KDFm9
 NhqgG4HxdEN1JDbkK/RTSp68dAIZiv0KEb0pyYr2wat9b4al+qlO9ZTQCtV495kN7trA
 ldJrmiJWZJXFnGCdURXfcikMEehY5VF3dt8vH2RCjPfy2+YBRAXVtWS/Ce+6LrgMwpnK
 l04Q==
X-Gm-Message-State: APjAAAXHpDXxGOciRY+wIUM9j1zAWRL5u8EQrLXE3HReOQfCvQCpbDi7
 /vT6NI8Uc8Ce1H+Lgb6Ci1e7yg==
X-Google-Smtp-Source: APXvYqy/drVrAb85EbTmmCjdLZAL3PlrstNRykKo/mQZKHCMjPluiL7BXjLnhtg2pTt038NuwCvmCA==
X-Received: by 2002:a1c:480a:: with SMTP id v10mr18887642wma.120.1565012474656; 
 Mon, 05 Aug 2019 06:41:14 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 8/8] drm/bridge: dw-hdmi-i2s: add .get_eld support
Date: Mon,  5 Aug 2019 15:41:02 +0200
Message-Id: <20190805134102.24173-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805134102.24173-1-jbrunet@baylibre.com>
References: <20190805134102.24173-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+WcHBmr4prRt0vIkSfM9PPUqwEgU3pvt4JgB//l4IQ=;
 b=djq1XNNCaa80etpmbt/t52jE3VOpu447E/HlXbMrdXc4UCAeGM1biJA8j1G/SxpTSI
 v+VzJq4HpD++RmUH3M6U3m+jS8S2emGkORh5sRBm2LnD9l6vrNZNF8aqU+4Z1nZXDBvZ
 uNvwfeYVTsBbHmQ94RdlN/ll9Xb00pD7PfEn9Ef/bE+ysLCoMdKRAtubd3m2ovyEq/qY
 IdB3WIu2s2PYsQ53POMt1Q7JvfrjWPiqZ6MrTYCRz+1WSPX/3JoDdnzghdJQLSskqINU
 eKFIJqbT0a7cN2Lngixg3wJqPQrhYfjyovnI9dvgYknO7XVgISZUhzYhvXawyv4IVOdA
 YzFA==
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
ZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMgfCAxMCArKysrKysrKysrCiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyAgICAgICAgICAgfCAgMSArCiAzIGZp
bGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktYXVkaW8uaCBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS1hdWRpby5oCmluZGV4IDYzYjU3NTZmNDYzYi4uY2IwN2RjMGRh
NWE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkt
YXVkaW8uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktYXVk
aW8uaApAQCAtMTQsNiArMTQsNyBAQCBzdHJ1Y3QgZHdfaGRtaV9hdWRpb19kYXRhIHsKIAogc3Ry
dWN0IGR3X2hkbWlfaTJzX2F1ZGlvX2RhdGEgewogCXN0cnVjdCBkd19oZG1pICpoZG1pOworCXU4
ICplbGQ7CiAKIAl2b2lkICgqd3JpdGUpKHN0cnVjdCBkd19oZG1pICpoZG1pLCB1OCB2YWwsIGlu
dCBvZmZzZXQpOwogCXU4ICgqcmVhZCkoc3RydWN0IGR3X2hkbWkgKmhkbWksIGludCBvZmZzZXQp
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWky
cy1hdWRpby5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1h
dWRpby5jCmluZGV4IGI4ZWNlOWMxYmEyYy4uMTRkNDk5YjM0NGMwIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCkBAIC0xMjEs
NiArMTIxLDE1IEBAIHN0YXRpYyB2b2lkIGR3X2hkbWlfaTJzX2F1ZGlvX3NodXRkb3duKHN0cnVj
dCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkKIAlkd19oZG1pX2F1ZGlvX2Rpc2FibGUoaGRtaSk7
CiB9CiAKK3N0YXRpYyBpbnQgZHdfaGRtaV9pMnNfZ2V0X2VsZChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHZvaWQgKmRhdGEsIHVpbnQ4X3QgKmJ1ZiwKKwkJCSAgICAgICBzaXplX3QgbGVuKQoreworCXN0
cnVjdCBkd19oZG1pX2kyc19hdWRpb19kYXRhICphdWRpbyA9IGRhdGE7CisKKwltZW1jcHkoYnVm
LCBhdWRpby0+ZWxkLCBtaW4oc2l6ZW9mKGF1ZGlvLT5lbGQpLCBsZW4pKTsKKwlyZXR1cm4gMDsK
K30KKwogc3RhdGljIGludCBkd19oZG1pX2kyc19nZXRfZGFpX2lkKHN0cnVjdCBzbmRfc29jX2Nv
bXBvbmVudCAqY29tcG9uZW50LAogCQkJCSAgc3RydWN0IGRldmljZV9ub2RlICplbmRwb2ludCkK
IHsKQEAgLTE0NCw2ICsxNTMsNyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfaTJzX2dldF9kYWlfaWQo
c3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsCiBzdGF0aWMgc3RydWN0IGhkbWlf
Y29kZWNfb3BzIGR3X2hkbWlfaTJzX29wcyA9IHsKIAkuaHdfcGFyYW1zCT0gZHdfaGRtaV9pMnNf
aHdfcGFyYW1zLAogCS5hdWRpb19zaHV0ZG93bgk9IGR3X2hkbWlfaTJzX2F1ZGlvX3NodXRkb3du
LAorCS5nZXRfZWxkCT0gZHdfaGRtaV9pMnNfZ2V0X2VsZCwKIAkuZ2V0X2RhaV9pZAk9IGR3X2hk
bWlfaTJzX2dldF9kYWlfaWQsCiB9OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMv
ZHctaGRtaS5jCmluZGV4IGJlZDRiYjAxN2FmZC4uOGRmNjljOWRiZmFkIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAtMjc5Nyw2ICsyNzk3LDcgQEAgX19k
d19oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCiAJCXN0cnVjdCBkd19o
ZG1pX2kyc19hdWRpb19kYXRhIGF1ZGlvOwogCiAJCWF1ZGlvLmhkbWkJPSBoZG1pOworCQlhdWRp
by5lbGQJPSBoZG1pLT5jb25uZWN0b3IuZWxkOwogCQlhdWRpby53cml0ZQk9IGhkbWlfd3JpdGVi
OwogCQlhdWRpby5yZWFkCT0gaGRtaV9yZWFkYjsKIAkJaGRtaS0+ZW5hYmxlX2F1ZGlvID0gZHdf
aGRtaV9pMnNfYXVkaW9fZW5hYmxlOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
