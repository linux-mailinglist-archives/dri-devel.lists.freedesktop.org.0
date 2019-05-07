Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E6D15940
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E9189CE1;
	Tue,  7 May 2019 05:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF7F89CE1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:35:24 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0AC3320C01;
 Tue,  7 May 2019 05:35:23 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 87/99] drm/sun4i: Unbind components before
 releasing DRM and memory
Date: Tue,  7 May 2019 01:32:21 -0400
Message-Id: <20190507053235.29900-87-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053235.29900-1-sashal@kernel.org>
References: <20190507053235.29900-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207324;
 bh=f0NDxdzF8Nmbe1Jkcm6mj+05ckxOunGYb1y/ulIrGn4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GZjohjuyLsLSlpJen/9gn05TfYwrJPFiHaDT665xtdMt+Tm4yD/nho6PPpgxS1FXo
 a+8qNQD+OBKmFpFMhtVm0AqoxOZkltalXCMg3wIUJnvzPFljtH27F0hjqy7E0MXMK4
 UKQ0naunr1hEp5U+jTlz6xYWcF2KhSMXjRDcogBw=
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sasha Levin <sashal@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgZTAyYmMyOWIyY2ZhNzgwNjgzMGQ2ZGE4YjIzMjJjZGRkNjdlOGRm
ZSBdCgpPdXIgY29tcG9uZW50cyBtYXkgc3RpbGwgYmUgdXNpbmcgdGhlIERSTSBkZXZpY2UgZHJp
dmVyIChpZiBvbmx5IHRvCmFjY2VzcyBvdXIgZHJpdmVyJ3MgcHJpdmF0ZSBkYXRhKSwgc28gbWFr
ZSBzdXJlIHRvIHVuYmluZCB0aGVtIGJlZm9yZQp0aGUgZmluYWwgZHJtX2Rldl9wdXQuCgpBbHNv
IHJlbGVhc2Ugb3VyIHJlc2VydmVkIG1lbW9yeSBhZnRlciBjb21wb25lbnQgdW5iaW5kIGluc3Rl
YWQgb2YKYmVmb3JlIHRvIG1hdGNoIHJldmVyc2UgY3JlYXRpb24gb3JkZXIuCgpGaXhlczogZjVh
OWVkODY3YzgzICgiZHJtL3N1bjRpOiBGaXggY29tcG9uZW50IHVuYmluZGluZyBhbmQgY29tcG9u
ZW50IG1hc3RlciBkZWxldGlvbiIpClNpZ25lZC1vZmYtYnk6IFBhdWwgS29jaWFsa293c2tpIDxw
YXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KUmV2aWV3ZWQtYnk6IENoZW4tWXUgVHNhaSA8
d2Vuc0Bjc2llLm9yZz4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Bh
dGNoL21zZ2lkLzIwMTkwNDI0MDkwNDEzLjY5MTgtMS1wYXVsLmtvY2lhbGtvd3NraUBib290bGlu
LmNvbQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2Rydi5jIHwgNSArKystLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vc3VuNGkvc3VuNGlfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlf
ZHJ2LmMKaW5kZXggOWE1NzEzZmEwM2IyLi5mOGJmNWJiZWMyZGYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW40aV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuNGlfZHJ2LmMKQEAgLTE0NiwxMCArMTQ2LDExIEBAIHN0YXRpYyB2b2lkIHN1bjRpX2Rydl91
bmJpbmQoc3RydWN0IGRldmljZSAqZGV2KQogCWRybV9kZXZfdW5yZWdpc3Rlcihkcm0pOwogCWRy
bV9rbXNfaGVscGVyX3BvbGxfZmluaShkcm0pOwogCWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRy
bSk7Ci0Jb2ZfcmVzZXJ2ZWRfbWVtX2RldmljZV9yZWxlYXNlKGRldik7Ci0JZHJtX2Rldl9wdXQo
ZHJtKTsKIAogCWNvbXBvbmVudF91bmJpbmRfYWxsKGRldiwgTlVMTCk7CisJb2ZfcmVzZXJ2ZWRf
bWVtX2RldmljZV9yZWxlYXNlKGRldik7CisKKwlkcm1fZGV2X3B1dChkcm0pOwogfQogCiBzdGF0
aWMgY29uc3Qgc3RydWN0IGNvbXBvbmVudF9tYXN0ZXJfb3BzIHN1bjRpX2Rydl9tYXN0ZXJfb3Bz
ID0gewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
