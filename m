Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B64415986
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C16089D2F;
	Tue,  7 May 2019 05:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D16089CF8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:37:34 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 386EA20675;
 Tue,  7 May 2019 05:37:33 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 50/81] drm/sun4i: Fix component unbinding and
 component master deletion
Date: Tue,  7 May 2019 01:35:21 -0400
Message-Id: <20190507053554.30848-50-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053554.30848-1-sashal@kernel.org>
References: <20190507053554.30848-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207453;
 bh=gOlTQy3cU0afo36bvjvo/17E1PvEHAhf3sh7wya5gHU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L+Ol4hTsB0u/f7irvuTi1MGgUCW5GPTpL0PDDPxgT5nU3vr4Jz7KN9IAmAR9Dnk64
 SEA53KrHqe1m09D4GXxfIvlYWE6KvM+ZitiRsxufPhRs6Rrl+aHHAUX+STiI0vU1Lv
 10trzROAWZcMCLQNYnT+ZNMtpMrzfZgKb3g7e0ZY=
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
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgZjVhOWVkODY3YzgzODc1NTQ2YzlhYWRkNGVkOGU3ODVlOWFkY2Mz
YyBdCgpGb3Igb3VyIGNvbXBvbmVudC1iYWNrZWQgZHJpdmVyIHRvIGJlIHByb3Blcmx5IHJlbW92
ZWQsIHdlIG5lZWQgdG8KZGVsZXRlIHRoZSBjb21wb25lbnQgbWFzdGVyIGluIHN1bjRpX2Rydl9y
ZW1vdmUgYW5kIG1ha2Ugc3VyZSB0byBjYWxsCmNvbXBvbmVudF91bmJpbmRfYWxsIGluIHRoZSBt
YXN0ZXIncyB1bmJpbmQgc28gdGhhdCBhbGwgY29tcG9uZW50cyBhcmUKdW5ib3VuZCB3aGVuIHRo
ZSBtYXN0ZXIgaXMuCgpGaXhlczogOTAyNmUwZDEyMmFjICgiZHJtOiBBZGQgQWxsd2lubmVyIEEx
MCBEaXNwbGF5IEVuZ2luZSBzdXBwb3J0IikKU2lnbmVkLW9mZi1ieTogUGF1bCBLb2NpYWxrb3dz
a2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgpTaWduZWQtb2ZmLWJ5OiBNYXhpbWUg
UmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgpMaW5rOiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA0MTgxMzI3MjcuNTEyOC00LXBhdWwu
a29jaWFsa293c2tpQGJvb3RsaW4uY29tClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNo
YWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfZHJ2LmMgfCA0
ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
NGlfZHJ2LmMKaW5kZXggN2NhYzAxYzcyYzAyLi42MjcwMzYzMDA5MGEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3Vu
NGkvc3VuNGlfZHJ2LmMKQEAgLTE2MCw2ICsxNjAsOCBAQCBzdGF0aWMgdm9pZCBzdW40aV9kcnZf
dW5iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkcm0p
OwogCW9mX3Jlc2VydmVkX21lbV9kZXZpY2VfcmVsZWFzZShkZXYpOwogCWRybV9kZXZfcHV0KGRy
bSk7CisKKwljb21wb25lbnRfdW5iaW5kX2FsbChkZXYsIE5VTEwpOwogfQogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGNvbXBvbmVudF9tYXN0ZXJfb3BzIHN1bjRpX2Rydl9tYXN0ZXJfb3BzID0gewpA
QCAtNDA3LDYgKzQwOSw4IEBAIHN0YXRpYyBpbnQgc3VuNGlfZHJ2X3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIHN0YXRpYyBpbnQgc3VuNGlfZHJ2X3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogeworCWNvbXBvbmVudF9tYXN0ZXJfZGVsKCZwZGV2LT5k
ZXYsICZzdW40aV9kcnZfbWFzdGVyX29wcyk7CisKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
