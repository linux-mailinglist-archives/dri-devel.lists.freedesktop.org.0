Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F48E6F2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101166E918;
	Thu, 15 Aug 2019 08:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A876E501
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:07:36 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 10so11927277wmp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 05:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+7rNGhftPAm98gxQzspW2Bl38AWTm/sVwK1bJUwi+9s=;
 b=TzRxR73MrersbVWJtw8UC8J4Sv+eDztW3gMIpv6PgCDRx9sMw12FXeo4zSS80AUWkZ
 Rdog7Vk55WD0rsqHEELeBe899lzcZo5JJyQA0H8nxGB9NhS3JOjAyY6FEY3KzJqYNeAr
 dS6MkHr4/oU8EUMpicsXXWkdcFQqjFcQIn/Q2/wRw5Q7ETIYT50kmboyONDECsMikNkJ
 vyURIgkamcsLwxYFbfsU+O8V19Q/vfXv4APP1YVOX5Jm6FNSf8iwfa3oVZMjOyE82vKk
 JjuGB8vbQSCn/tgCCOAe6ITCxBAwIinIjeqm0J2Bc8BUqAiS5+fpgpDGr3Twwv9xM4Ur
 XgBQ==
X-Gm-Message-State: APjAAAWJconBybVPAOH27kPVqrlYeEQRLo9DciGm60xRKxuxd8U/A4oI
 cHlKTjELWflX2DnuaQglfbw7zQ==
X-Google-Smtp-Source: APXvYqzfPZVz7gWpdlttsi/wKeTKZdYi6SBdhAvNGLWGXbHVP91D0/y3OiVgUj4sWE1/dLgWfQri7w==
X-Received: by 2002:a1c:1f41:: with SMTP id f62mr28067454wmf.176.1565611655458; 
 Mon, 12 Aug 2019 05:07:35 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 6/8] drm/bridge: dw-hdmi-i2s: reset audio fifo before
 applying new params
Date: Mon, 12 Aug 2019 14:07:24 +0200
Message-Id: <20190812120726.1528-7-jbrunet@baylibre.com>
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
 bh=+7rNGhftPAm98gxQzspW2Bl38AWTm/sVwK1bJUwi+9s=;
 b=rDwjvizqSw6Jz6AkOORykYkiAVItW36h9yIqrSC6nXnNDmDCRZtcTAJJCA4PBosGnH
 udRGdq/OsG7HCT1oFBaXuW0dQ6f9+s4m2z+tnI96mdsZGFqBYABurZMO8EQtvQgJOsWG
 ZuPZy9FPI8wgr5HIADP9ult6InbBe4KL1ExExYGEU96fwU9dimdR6xtIHI9XAhqE3YvC
 fSlYBsOBJdwSPg5xqueM2fiMOQD/huROetdJhaDMeb5qjgGVvpTUq98oh0/ytyf5dl9C
 +i2+2g+Mu+TW0YXap8l1FGYxX7g7ietxEAmQtKO9SlSKPgGROCnAuQQKJm1wJBCUncWw
 UN9A==
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

V2hlbiBjaGFuZ2luZyB0aGUgYXVkaW8gaHcgcGFyYW1zLCByZXNldCB0aGUgYXVkaW8gZmlmbyB0
byBtYWtlIHN1cmUKYW55IG9sZCByZW1haW5pbmcgZGF0YSBpcyBmbHVzaGVkLgoKVGhlIGRhdGFi
b29rIG1lbnRpb25zIHRoYXQgc3VjaCByZXNldCBzaG91bGQgYmUgZm9sbG93ZWQgYnkgYSByZXNl
dCBvZgp0aGUgaTJzIGJsb2NrIHRvIG1ha2Ugc3VyZSB0aGUgc2FtcGxlcyBzdGF5IGFsaWduZWQK
ClJldmlld2VkLWJ5OiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+ClNpZ25lZC1vZmYt
Ynk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyB8IDYgKysrKy0tCiBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaCAgICAgICAgICAgfCAxICsKIDIg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwppbmRl
eCAwODY0ZGVlOGQxODAuLjQxYmVlMDA5OTU3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwpAQCAtNDksNiArNDksMTAgQEAg
c3RhdGljIGludCBkd19oZG1pX2kyc19od19wYXJhbXMoc3RydWN0IGRldmljZSAqZGV2LCB2b2lk
ICpkYXRhLAogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKKwkvKiBSZXNldCB0aGUgRklGT3MgYmVm
b3JlIGFwcGx5aW5nIG5ldyBwYXJhbXMgKi8KKwloZG1pX3dyaXRlKGF1ZGlvLCBIRE1JX0FVRF9D
T05GMF9TV19SRVNFVCwgSERNSV9BVURfQ09ORjApOworCWhkbWlfd3JpdGUoYXVkaW8sICh1OCl+
SERNSV9NQ19TV1JTVFpfSTJTU1dSU1RfUkVRLCBIRE1JX01DX1NXUlNUWik7CisKIAlpbnB1dGNs
a2ZzCT0gSERNSV9BVURfSU5QVVRDTEtGU182NEZTOwogCWNvbmYwCQk9IEhETUlfQVVEX0NPTkYw
X0kyU19BTExfRU5BQkxFOwogCkBAIC0xMDIsOCArMTA2LDYgQEAgc3RhdGljIHZvaWQgZHdfaGRt
aV9pMnNfYXVkaW9fc2h1dGRvd24oc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQogCXN0
cnVjdCBkd19oZG1pICpoZG1pID0gYXVkaW8tPmhkbWk7CiAKIAlkd19oZG1pX2F1ZGlvX2Rpc2Fi
bGUoaGRtaSk7Ci0KLQloZG1pX3dyaXRlKGF1ZGlvLCBIRE1JX0FVRF9DT05GMF9TV19SRVNFVCwg
SERNSV9BVURfQ09ORjApOwogfQogCiBzdGF0aWMgaW50IGR3X2hkbWlfaTJzX2dldF9kYWlfaWQo
c3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaCBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5oCmluZGV4IDA5MWQ3YzI4YWExNy4uYTI3MmZhMzkzYWU2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaApAQCAtOTQwLDYgKzk0
MCw3IEBAIGVudW0gewogCUhETUlfTUNfQ0xLRElTX1BJWEVMQ0xLX0RJU0FCTEUgPSAweDEsCiAK
IC8qIE1DX1NXUlNUWiBmaWVsZCB2YWx1ZXMgKi8KKwlIRE1JX01DX1NXUlNUWl9JMlNTV1JTVF9S
RVEgPSAweDA4LAogCUhETUlfTUNfU1dSU1RaX1RNRFNTV1JTVF9SRVEgPSAweDAyLAogCiAvKiBN
Q19GTE9XQ1RSTCBmaWVsZCB2YWx1ZXMgKi8KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
