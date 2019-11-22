Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D92610687B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 10:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524206F4EB;
	Fri, 22 Nov 2019 09:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C236EF2E;
 Fri, 22 Nov 2019 01:26:58 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 520EE44FD1;
 Fri, 22 Nov 2019 01:26:57 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	robh+dt@kernel.org
Subject: [PATCH v2 2/4] drm/msm/gpu: add support for ocmem interconnect path
Date: Thu, 21 Nov 2019 20:26:43 -0500
Message-Id: <20191122012645.7430-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191122012645.7430-1-masneyb@onstation.org>
References: <20191122012645.7430-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Nov 2019 09:00:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1574386017;
 bh=CaHmDoZDSt9WG3Xh0TDc9eDdYCzbqbU5vHcj3IO1lu0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GN0IQztcelqBojl8jngElPhqaUgYYVwdNdx6rSaSfGKXvjnQIiLR5EY8GXN+B6p9x
 QElEUWKiMyJhh94Skdk7WKReEJTsODd6/jdNf3U186jNDhQbtiaRxteSUfdSj9rMLG
 9ggH34S1rwsjj+Bfx+vh82oy6yXsomeMc0Dwtc/A=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBBM3h4IGFuZCBhbGwgQTR4eCBBZHJlbm8gR1BVcyBkbyBub3QgaGF2ZSBHTUVNIGluc2lk
ZSB0aGUgR1BVIGNvcmUKYW5kIG11c3QgdXNlIHRoZSBPbiBDaGlwIE1FTW9yeSAoT0NNRU0pIGlu
IG9yZGVyIHRvIGJlIGZ1bmN0aW9uYWwuClRoZXJlJ3MgYSBzZXBhcmF0ZSBpbnRlcmNvbm5lY3Qg
cGF0aCB0aGF0IG5lZWRzIHRvIGJlIHNldHVwIHRvIE9DTUVNLgpBZGQgc3VwcG9ydCBmb3IgdGhp
cyBzZWNvbmQgcGF0aCB0byB0aGUgR1BVIGNvcmUuCgpJbiB0aGUgZG93bnN0cmVhbSBNU00gMy40
IHNvdXJjZXMsIHRoZSB0d28gaW50ZXJjb25uZWN0IHBhdGhzIGZvciB0aGUKR1BVIGFyZSBiZXR3
ZWVuOgoKICAtIE1TTV9CVVNfTUFTVEVSX0dSQVBISUNTXzNEIGFuZCBNU01fQlVTX1NMQVZFX0VC
SV9DSDAKICAtIE1TTV9CVVNfTUFTVEVSX1ZfT0NNRU1fR0ZYM0QgYW5kIE1TTV9CVVNfU0xBVkVf
T0NNRU0KClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYyB8IDE0ICsrKysr
KysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9ncHUuaCAgICAgICAgICAgfCAgNyAr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMKaW5kZXggMDc4M2U0YjU0ODZh
Li5kMjdiZGM5OTk3NzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2Fk
cmVub19ncHUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMK
QEAgLTg4NywxMCArODg3LDIxIEBAIHN0YXRpYyBpbnQgYWRyZW5vX2dldF9wd3JsZXZlbHMoc3Ry
dWN0IGRldmljZSAqZGV2LAogCURCRygiZmFzdF9yYXRlPSV1LCBzbG93X3JhdGU9MjcwMDAwMDAi
LCBncHUtPmZhc3RfcmF0ZSk7CiAKIAkvKiBDaGVjayBmb3IgYW4gaW50ZXJjb25uZWN0IHBhdGgg
Zm9yIHRoZSBidXMgKi8KLQlncHUtPmljY19wYXRoID0gb2ZfaWNjX2dldChkZXYsIE5VTEwpOwor
CWdwdS0+aWNjX3BhdGggPSBvZl9pY2NfZ2V0KGRldiwgImdmeC1tZW0iKTsKKwlpZiAoIWdwdS0+
aWNjX3BhdGgpIHsKKwkJLyoKKwkJICogS2VlcCBjb21wYXRiaWxpdHkgd2l0aCBkZXZpY2UgdHJl
ZXMgdGhhdCBkb24ndCBoYXZlIGFuCisJCSAqIGludGVyY29ubmVjdC1uYW1lcyBwcm9wZXJ0eS4K
KwkJICovCisJCWdwdS0+aWNjX3BhdGggPSBvZl9pY2NfZ2V0KGRldiwgTlVMTCk7CisJfQogCWlm
IChJU19FUlIoZ3B1LT5pY2NfcGF0aCkpCiAJCWdwdS0+aWNjX3BhdGggPSBOVUxMOwogCisJZ3B1
LT5vY21lbV9pY2NfcGF0aCA9IG9mX2ljY19nZXQoZGV2LCAib2NtZW0iKTsKKwlpZiAoSVNfRVJS
KGdwdS0+b2NtZW1faWNjX3BhdGgpKQorCQlncHUtPm9jbWVtX2ljY19wYXRoID0gTlVMTDsKKwog
CXJldHVybiAwOwogfQogCkBAIC05NzcsNiArOTg4LDcgQEAgdm9pZCBhZHJlbm9fZ3B1X2NsZWFu
dXAoc3RydWN0IGFkcmVub19ncHUgKmFkcmVub19ncHUpCiAJCXJlbGVhc2VfZmlybXdhcmUoYWRy
ZW5vX2dwdS0+ZndbaV0pOwogCiAJaWNjX3B1dChncHUtPmljY19wYXRoKTsKKwlpY2NfcHV0KGdw
dS0+b2NtZW1faWNjX3BhdGgpOwogCiAJbXNtX2dwdV9jbGVhbnVwKCZhZHJlbm9fZ3B1LT5iYXNl
KTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dwdS5oIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9tc21fZ3B1LmgKaW5kZXggYWI4ZjBmOWM5ZGM4Li5iZTViYzJlODQyNWMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dwdS5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vbXNtX2dwdS5oCkBAIC0xMTEsOCArMTExLDE1IEBAIHN0cnVjdCBtc21fZ3B1
IHsKIAlzdHJ1Y3QgY2xrICplYmkxX2NsaywgKmNvcmVfY2xrLCAqcmJibXRpbWVyX2NsazsKIAl1
aW50MzJfdCBmYXN0X3JhdGU7CiAKKwkvKiBUaGUgZ2Z4LW1lbSBpbnRlcmNvbm5lY3QgcGF0aCB0
aGF0J3MgdXNlZCBieSBhbGwgR1BVIHR5cGVzLiAqLwogCXN0cnVjdCBpY2NfcGF0aCAqaWNjX3Bh
dGg7CiAKKwkvKgorCSAqIFNlY29uZCBpbnRlcmNvbm5lY3QgcGF0aCBmb3Igc29tZSBBM3h4IGFu
ZCBhbGwgQTR4eCBHUFVzIHRvIHRoZQorCSAqIE9uIENoaXAgTUVNb3J5IChPQ01FTSkuCisJICov
CisJc3RydWN0IGljY19wYXRoICpvY21lbV9pY2NfcGF0aDsKKwogCS8qIEhhbmcgYW5kIEluYWN0
aXZpdHkgRGV0ZWN0aW9uOgogCSAqLwogI2RlZmluZSBEUk1fTVNNX0lOQUNUSVZFX1BFUklPRCAg
IDY2IC8qIGluIG1zIChyb3VnaGx5IGZvdXIgZnJhbWVzKSAqLwotLSAKMi4yMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
