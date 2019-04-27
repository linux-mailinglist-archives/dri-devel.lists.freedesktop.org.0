Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C363B256
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 03:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91658928D;
	Sat, 27 Apr 2019 01:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767B989274
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2019 01:40:07 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94EEB214C6;
 Sat, 27 Apr 2019 01:40:06 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 58/79] drm/mediatek: using new factor for tvdpll
 for MT2701 hdmi phy
Date: Fri, 26 Apr 2019 21:38:17 -0400
Message-Id: <20190427013838.6596-58-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190427013838.6596-1-sashal@kernel.org>
References: <20190427013838.6596-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556329207;
 bh=TkamJ2+/GEnDvFQn4XsLlBqL/ROlQDSbkq5gepWy8y8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kn74ZwQeLyf5Gi3BffI3Ufwuxg1LPKxSEEO9jJLAG4rAwHYyGL/Cn9yJ3P8Y2dhZg
 c1HuYKBKf4A7kwP+mgRtBgpzeRSOSj2YU4EmCB5RR/8a2+AUS0Qhz3O1cFQoOx3YQ0
 aTpN43ejtK3YBcZGwEfVyGK0A3BAMmy88hu6DzTc=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Wangyan Wang <wangyan.wang@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogV2FuZ3lhbiBXYW5nIDx3YW5neWFuLndhbmdAbWVkaWF0ZWsuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgOGVlYjM5NDZmZWViMDA0ODZhYzA5MDllMjMwOWRhODdkYjg5ODhhNSBdCgpUaGlz
IGlzIHRoZSBzZWNvbmQgc3RlcCB0byBtYWtlIE1UMjcwMSBIRE1JIHN0YWJsZS4KVGhlIGZhY3Rv
ciBkZXBlbmRzIG9uIHRoZSBkaXZpZGVyIG9mIERQSSBpbiBNVDI3MDEsIHRoZXJlZm9yZSwKd2Ug
c2hvdWxkIGZpeCB0aGlzIGZhY3RvciB0byB0aGUgcmlnaHQgYW5kIG5ldyBvbmUuClRlc3Q6IHNl
YXJjaCBvawoKU2lnbmVkLW9mZi1ieTogV2FuZ3lhbiBXYW5nIDx3YW5neWFuLndhbmdAbWVkaWF0
ZWsuY29tPgpTaWduZWQtb2ZmLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgpTaWduZWQt
b2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcGkuYyB8IDggKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMK
aW5kZXggNjJhOWQ0N2RmOTQ4Li45MTYwYzU1NzY5ZjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYwpAQCAtNjYyLDEzICs2NjIsMTEgQEAgc3RhdGljIHVuc2lnbmVkIGludCBtdDgxNzNf
Y2FsY3VsYXRlX2ZhY3RvcihpbnQgY2xvY2spCiBzdGF0aWMgdW5zaWduZWQgaW50IG10MjcwMV9j
YWxjdWxhdGVfZmFjdG9yKGludCBjbG9jaykKIHsKIAlpZiAoY2xvY2sgPD0gNjQwMDApCi0JCXJl
dHVybiAxNjsKLQllbHNlIGlmIChjbG9jayA8PSAxMjgwMDApCi0JCXJldHVybiA4OwotCWVsc2Ug
aWYgKGNsb2NrIDw9IDI1NjAwMCkKIAkJcmV0dXJuIDQ7Ci0JZWxzZQorCWVsc2UgaWYgKGNsb2Nr
IDw9IDEyODAwMCkKIAkJcmV0dXJuIDI7CisJZWxzZQorCQlyZXR1cm4gMTsKIH0KIAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTczX2NvbmYgPSB7Ci0tIAoyLjE5LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
