Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC01B8E68E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580876E8E2;
	Thu, 15 Aug 2019 08:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B526E504
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:07:37 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v19so11537597wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 05:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nyk3iRwUiWOF3HR8AgEI8oTD0AAO9L4Qd9ulSVgUQuc=;
 b=fWXy+lKT0tJnTdnsGgWipNjfdDDxbnmcfkvv3vIsNxFpYXJPnF2nnFiKLeZ09YtG1h
 ZTDO6n26IKtYnDjVw9N0AvPSBLdSvCy6pVQGiwvLIFB6tAyf5LXILaluUtwkMuCEQd+Z
 aV3LhQ4/8IwrCbCV3a8JGTF8p30GKnm0hb+AlLREIuvUboTl4DqmNfI5+zEcm+T8b57D
 toh7mfb5nCMGaPckalUWUHPoXE5zkSXRHwznh4boDn3T1Ic798zk0GoHPlZz9pPL4xKs
 Xz9SGAtWp9o6B0127yqgrpTLXQ+TIk5T7LdqWfwyRTQUpUXRQWdTTHBefwofNk+AvGze
 LpyQ==
X-Gm-Message-State: APjAAAWRYqf5KT9Ofep+rtBR8CD7zk/Ok6DnqYDhFaFo0joV9hpT0NYm
 d5jW7Rr0RaUOii1czJaO2KBcdQ==
X-Google-Smtp-Source: APXvYqwZVxC6uqEmw1OcoTKuej0fydwIHFvl7lI/fxWxv8zWW97aQe6c/fxAXhNOvT0IR2pM7GDSRA==
X-Received: by 2002:a1c:6641:: with SMTP id a62mr26440820wmc.175.1565611656356; 
 Mon, 12 Aug 2019 05:07:36 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 7/8] drm/bridge: dw-hdmi-i2s: enable only the required i2s
 lanes
Date: Mon, 12 Aug 2019 14:07:25 +0200
Message-Id: <20190812120726.1528-8-jbrunet@baylibre.com>
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
 bh=nyk3iRwUiWOF3HR8AgEI8oTD0AAO9L4Qd9ulSVgUQuc=;
 b=daHHObEVwiPB5m8eB3TinS4M9hhoYOX7OGD3cCnIcEdu8mEBbC2sxvbHgwNQgNQaGl
 e+ADZVLpFJLcl5mKHLragQdiafg85cuqpCUuGO05kZO+gqWvdMosoWdf76Lir6wDtR+G
 wnM/evLYE5mIEGNMDuMjreFZbxAt2EM/BzD4bWna14viPvYztIKdPE8Jjk2RtbvecAiH
 +vTiUF5wWddKT/m+Wal8DQpROpSVRSZ7RWDQLYKJ0cneQ7GBQEZGV/d/J3AAidyIBRzk
 kxtw4nWL8qMqRra9ftu6k3t/ezDcKlv0PBbJUX4418BaYieMPY6X3fasAC7Y3ddZnMCg
 N1ig==
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
biB0aGUgc3RyZWFtCgpSZXZpZXdlZC1ieTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNl
PgpTaWduZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KLS0t
CiAuLi4vZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyAgIHwgMTUg
KysrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
aCAgICAgICAgIHwgIDYgKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLWkycy1hdWRpby5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLWkycy1hdWRpby5jCmluZGV4IDQxYmVlMDA5OTU3OC4uYjhlY2U5YzFiYTJjIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1
ZGlvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1h
dWRpby5jCkBAIC01NCw3ICs1NCwyMCBAQCBzdGF0aWMgaW50IGR3X2hkbWlfaTJzX2h3X3BhcmFt
cyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJaGRtaV93cml0ZShhdWRpbywgKHU4
KX5IRE1JX01DX1NXUlNUWl9JMlNTV1JTVF9SRVEsIEhETUlfTUNfU1dSU1RaKTsKIAogCWlucHV0
Y2xrZnMJPSBIRE1JX0FVRF9JTlBVVENMS0ZTXzY0RlM7Ci0JY29uZjAJCT0gSERNSV9BVURfQ09O
RjBfSTJTX0FMTF9FTkFCTEU7CisJY29uZjAJCT0gKEhETUlfQVVEX0NPTkYwX0kyU19TRUxFQ1Qg
fCBIRE1JX0FVRF9DT05GMF9JMlNfRU4wKTsKKworCS8qIEVuYWJsZSB0aGUgcmVxdWlyZWQgaTJz
IGxhbmVzICovCisJc3dpdGNoIChocGFybXMtPmNoYW5uZWxzKSB7CisJY2FzZSA3IC4uLiA4Ogor
CQljb25mMCB8PSBIRE1JX0FVRF9DT05GMF9JMlNfRU4zOworCQkvKiBGYWxsLXRocnUgKi8KKwlj
YXNlIDUgLi4uIDY6CisJCWNvbmYwIHw9IEhETUlfQVVEX0NPTkYwX0kyU19FTjI7CisJCS8qIEZh
bGwtdGhydSAqLworCWNhc2UgMyAuLi4gNDoKKwkJY29uZjAgfD0gSERNSV9BVURfQ09ORjBfSTJT
X0VOMTsKKwkJLyogRmFsbC10aHJ1ICovCisJfQogCiAJc3dpdGNoIChocGFybXMtPnNhbXBsZV93
aWR0aCkgewogCWNhc2UgMTY6CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuaCBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5oCmluZGV4IGEyNzJmYTM5M2FlNi4uNjk4OGYxMmQ4OWQ5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaApAQCAtODY1LDcgKzg2NSwxMSBAQCBlbnVtIHsKIAog
LyogQVVEX0NPTkYwIGZpZWxkIHZhbHVlcyAqLwogCUhETUlfQVVEX0NPTkYwX1NXX1JFU0VUID0g
MHg4MCwKLQlIRE1JX0FVRF9DT05GMF9JMlNfQUxMX0VOQUJMRSA9IDB4MkYsCisJSERNSV9BVURf
Q09ORjBfSTJTX1NFTEVDVCA9IDB4MjAsCisJSERNSV9BVURfQ09ORjBfSTJTX0VOMyA9IDB4MDgs
CisJSERNSV9BVURfQ09ORjBfSTJTX0VOMiA9IDB4MDQsCisJSERNSV9BVURfQ09ORjBfSTJTX0VO
MSA9IDB4MDIsCisJSERNSV9BVURfQ09ORjBfSTJTX0VOMCA9IDB4MDEsCiAKIC8qIEFVRF9DT05G
MSBmaWVsZCB2YWx1ZXMgKi8KIAlIRE1JX0FVRF9DT05GMV9NT0RFX0kyUyA9IDB4MDAsCi0tIAoy
LjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
