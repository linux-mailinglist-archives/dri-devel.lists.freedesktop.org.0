Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E65282C8C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEB589BAB;
	Tue,  6 Aug 2019 07:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFAA6E459
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:41:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n9so84590124wru.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 06:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ey1PsfmA4wlAavqiJpE2shxdYitiWZIgciri4C4xXGA=;
 b=s9/7+pCvNHSJsUerlyLLFCkb3DtWZ55ElN30q9quLito+4Js5l2TGnZITltlgw/mQi
 lktkQe24n7hjH6U10tZmvt8Fygdbyn79i4weMiLqOHJZyAg5rJRxZipvpbRV1/pbrY8D
 3/rgjlcW8mzZYqilACEJem31+u7hjpnBrjqg4qQ7nS5ZWJh0KUNrBnrUnd+oa8bLesSW
 m1aHm+bktMQuq44977QLim/M42IWehqXP6msHLyFWKqu2Av2ceJLLeldV/FyWA2T1Xp3
 Ux9vfGGnzH4ores/sNGELhbldFs+2ffKNhRMEascMlr6zza2ldJ7JkG5w+DDDWjD0wHQ
 rbxA==
X-Gm-Message-State: APjAAAXsDzXkxPxkhhB5RCCzrZ7ZvhKnicHg4Rr09jp2+pfr3ck6Faot
 bUnwPqEUf0+wwHDxqcgftqMZhQ==
X-Google-Smtp-Source: APXvYqzQEmYNNKdpwB70iG2hSugrGTyqUNs6qvvdcYTcpEwkg8EPnq7u5XMWR9ACmgixbvAgeKBGug==
X-Received: by 2002:a5d:514f:: with SMTP id u15mr16161947wrt.183.1565012473623; 
 Mon, 05 Aug 2019 06:41:13 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 7/8] drm/bridge: dw-hdmi-i2s: enable only the required i2s
 lanes
Date: Mon,  5 Aug 2019 15:41:01 +0200
Message-Id: <20190805134102.24173-8-jbrunet@baylibre.com>
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
 bh=ey1PsfmA4wlAavqiJpE2shxdYitiWZIgciri4C4xXGA=;
 b=NNOrlaFbC6G9Tou31NekV1Ouhhn/xSj9Bsy90P1UEbm9ZP4Ce+OUczmhiGXI1ortyf
 2+rUNATxBIW1waSope2cT9bIGUYin4pyBuxmnAHJfu6Vjv5a2XuaMSLVfG3efjSrQMvL
 X+3Pi9ZFuqSeRI1KjrdTuTuEU7uVgp1WkeHlEjloWwne4xg3mV0ntH30tYf0c0H+kT79
 PTNP2fCK79k7vGVZ5DLBrnkGQ51nMN/pqEpOkFJAa6odkJFZey9yrmS56oooI7KhcrpO
 EgafSUEQpDbkkZkIXzJBd2wOsG/3Hwx2wFOw5DwpDWZRjOuMuA4jfAB8FFpHUaKb66L3
 Wmig==
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

RW5hYmxlIHRoZSBpMnMgbGFuZXMgZGVwZW5kaW5nIG9uIHRoZSBudW1iZXIgb2YgY2hhbm5lbCBp
biB0aGUgc3RyZWFtCgpDYzogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgpTaWduZWQt
b2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KLS0tCiAuLi4vZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyAgIHwgMTUgKysrKysrKysr
KysrKystCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaCAgICAgICAg
IHwgIDYgKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1o
ZG1pLWkycy1hdWRpby5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1p
LWkycy1hdWRpby5jCmluZGV4IDQxYmVlMDA5OTU3OC4uYjhlY2U5YzFiYTJjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCkBA
IC01NCw3ICs1NCwyMCBAQCBzdGF0aWMgaW50IGR3X2hkbWlfaTJzX2h3X3BhcmFtcyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJaGRtaV93cml0ZShhdWRpbywgKHU4KX5IRE1JX01D
X1NXUlNUWl9JMlNTV1JTVF9SRVEsIEhETUlfTUNfU1dSU1RaKTsKIAogCWlucHV0Y2xrZnMJPSBI
RE1JX0FVRF9JTlBVVENMS0ZTXzY0RlM7Ci0JY29uZjAJCT0gSERNSV9BVURfQ09ORjBfSTJTX0FM
TF9FTkFCTEU7CisJY29uZjAJCT0gKEhETUlfQVVEX0NPTkYwX0kyU19TRUxFQ1QgfCBIRE1JX0FV
RF9DT05GMF9JMlNfRU4wKTsKKworCS8qIEVuYWJsZSB0aGUgcmVxdWlyZWQgaTJzIGxhbmVzICov
CisJc3dpdGNoIChocGFybXMtPmNoYW5uZWxzKSB7CisJY2FzZSA3IC4uLiA4OgorCQljb25mMCB8
PSBIRE1JX0FVRF9DT05GMF9JMlNfRU4zOworCQkvKiBGYWxsLXRocnUgKi8KKwljYXNlIDUgLi4u
IDY6CisJCWNvbmYwIHw9IEhETUlfQVVEX0NPTkYwX0kyU19FTjI7CisJCS8qIEZhbGwtdGhydSAq
LworCWNhc2UgMyAuLi4gNDoKKwkJY29uZjAgfD0gSERNSV9BVURfQ09ORjBfSTJTX0VOMTsKKwkJ
LyogRmFsbC10aHJ1ICovCisJfQogCiAJc3dpdGNoIChocGFybXMtPnNhbXBsZV93aWR0aCkgewog
CWNhc2UgMTY6CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LWhkbWkuaCBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5oCmluZGV4
IGEyNzJmYTM5M2FlNi4uNjk4OGYxMmQ4OWQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuaApAQCAtODY1LDcgKzg2NSwxMSBAQCBlbnVtIHsKIAogLyogQVVEX0NP
TkYwIGZpZWxkIHZhbHVlcyAqLwogCUhETUlfQVVEX0NPTkYwX1NXX1JFU0VUID0gMHg4MCwKLQlI
RE1JX0FVRF9DT05GMF9JMlNfQUxMX0VOQUJMRSA9IDB4MkYsCisJSERNSV9BVURfQ09ORjBfSTJT
X1NFTEVDVCA9IDB4MjAsCisJSERNSV9BVURfQ09ORjBfSTJTX0VOMyA9IDB4MDgsCisJSERNSV9B
VURfQ09ORjBfSTJTX0VOMiA9IDB4MDQsCisJSERNSV9BVURfQ09ORjBfSTJTX0VOMSA9IDB4MDIs
CisJSERNSV9BVURfQ09ORjBfSTJTX0VOMCA9IDB4MDEsCiAKIC8qIEFVRF9DT05GMSBmaWVsZCB2
YWx1ZXMgKi8KIAlIRE1JX0FVRF9DT05GMV9NT0RFX0kyUyA9IDB4MDAsCi0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
