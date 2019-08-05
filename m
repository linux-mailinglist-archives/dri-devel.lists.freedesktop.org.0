Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A3482CA0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BAE89EA9;
	Tue,  6 Aug 2019 07:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E7A6E454
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:41:14 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s3so74775922wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 06:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qVzaYwLQ0IyryucLyxiH/odxXJQTMSx5Nh4LY6yGL/I=;
 b=e3/HTs1nA/toBJzdRLgfai9fl7LEyyuPOaXbVACh/HDm5qYl1aWt+9qvptB3Wh8iaD
 lPtf7l/DQnKkDZT2blgK/SrrzCHPSlLYiAth3naQvochZ1CKAthGNPI2kWVGD0kurOtH
 l0Yr42jd/mN2Gl/5RSKA/XOfuBstRpxXpdEc0dh85devZESGXiyXU7mOOUyRc6PV0hRL
 UG+2yZn+Bi246vlqW7HYIOUm28L/hHtz0N4tLXKZuFlK+PwXBZEQbLjhjBIsgbYUcIF/
 CC4I8QfPqqcpbYVk807DQLQTpNmPpF2C96HW+QOIE/dx2dqZFwqb33B4pydkxurZb1GL
 EJdQ==
X-Gm-Message-State: APjAAAWNX9++n+aUjg0tHugw/BJAwb1iEulWK6PbJV6z54Ze2SlXP5Dn
 /bhBQ1VnFbQqFxxb93sCnfM7Zw==
X-Google-Smtp-Source: APXvYqzIdxmXDup/BxNDb6FeOvbs8087+YAEORHVdQ2WCPN0OwAzp/Wh/rJXlQk484ET/UdwuJ5/Qw==
X-Received: by 2002:a1c:a8d7:: with SMTP id r206mr19116418wme.47.1565012472683; 
 Mon, 05 Aug 2019 06:41:12 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 6/8] drm/bridge: dw-hdmi-i2s: reset audio fifo before applying
 new params
Date: Mon,  5 Aug 2019 15:41:00 +0200
Message-Id: <20190805134102.24173-7-jbrunet@baylibre.com>
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
 bh=qVzaYwLQ0IyryucLyxiH/odxXJQTMSx5Nh4LY6yGL/I=;
 b=f2kDgP143d0HrJANosipnWVMoq01I+69xpPIahSbB00o59IrM6ocWRY8N8/9bj7/r/
 7Uk7JljTqjtYeSAgptE9vL/QG3qBzfbzMUwGvWDITSnZ5bS/CFvai/L1kZl3KAgNUydc
 wfQRJzatabV0duadNUeHxb5UbJ/L+g3hbd3XvyesDOHOYBnEflfp5ZYTY2bBRxmw1d9c
 kAvctaIY0WFROtJ3UZs2ChJ1EwKa/fgxo3taxsCN4XaadvYsE1qia05ZI/KlLnLBGpjF
 AuM13Dt6JP/0YB+USV+ZRAnP+tS3fouv2TTRnf1QxrelQhADnQPvu6ut5QpSdBSV7BJa
 NHXg==
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
CkNjOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+ClNpZ25lZC1vZmYtYnk6IEplcm9t
ZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyB8IDYgKysrKy0tCiBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaCAgICAgICAgICAgfCAxICsKIDIgZmlsZXMgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwppbmRleCAwODY0ZGVl
OGQxODAuLjQxYmVlMDA5OTU3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwpAQCAtNDksNiArNDksMTAgQEAgc3RhdGljIGlu
dCBkd19oZG1pX2kyc19od19wYXJhbXMoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhLAog
CQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKKwkvKiBSZXNldCB0aGUgRklGT3MgYmVmb3JlIGFwcGx5
aW5nIG5ldyBwYXJhbXMgKi8KKwloZG1pX3dyaXRlKGF1ZGlvLCBIRE1JX0FVRF9DT05GMF9TV19S
RVNFVCwgSERNSV9BVURfQ09ORjApOworCWhkbWlfd3JpdGUoYXVkaW8sICh1OCl+SERNSV9NQ19T
V1JTVFpfSTJTU1dSU1RfUkVRLCBIRE1JX01DX1NXUlNUWik7CisKIAlpbnB1dGNsa2ZzCT0gSERN
SV9BVURfSU5QVVRDTEtGU182NEZTOwogCWNvbmYwCQk9IEhETUlfQVVEX0NPTkYwX0kyU19BTExf
RU5BQkxFOwogCkBAIC0xMDIsOCArMTA2LDYgQEAgc3RhdGljIHZvaWQgZHdfaGRtaV9pMnNfYXVk
aW9fc2h1dGRvd24oc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQogCXN0cnVjdCBkd19o
ZG1pICpoZG1pID0gYXVkaW8tPmhkbWk7CiAKIAlkd19oZG1pX2F1ZGlvX2Rpc2FibGUoaGRtaSk7
Ci0KLQloZG1pX3dyaXRlKGF1ZGlvLCBIRE1JX0FVRF9DT05GMF9TV19SRVNFVCwgSERNSV9BVURf
Q09ORjApOwogfQogCiBzdGF0aWMgaW50IGR3X2hkbWlfaTJzX2dldF9kYWlfaWQoc3RydWN0IHNu
ZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaCBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5oCmluZGV4IDA5MWQ3YzI4YWExNy4uYTI3MmZhMzkzYWU2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaApAQCAtOTQwLDYgKzk0MCw3IEBAIGVu
dW0gewogCUhETUlfTUNfQ0xLRElTX1BJWEVMQ0xLX0RJU0FCTEUgPSAweDEsCiAKIC8qIE1DX1NX
UlNUWiBmaWVsZCB2YWx1ZXMgKi8KKwlIRE1JX01DX1NXUlNUWl9JMlNTV1JTVF9SRVEgPSAweDA4
LAogCUhETUlfTUNfU1dSU1RaX1RNRFNTV1JTVF9SRVEgPSAweDAyLAogCiAvKiBNQ19GTE9XQ1RS
TCBmaWVsZCB2YWx1ZXMgKi8KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
