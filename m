Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE1F55FD4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 05:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E916E273;
	Wed, 26 Jun 2019 03:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F486E272
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:44:00 +0000 (UTC)
Received: from sasha-vm.mshome.net (mobile-107-77-172-98.mobile.att.net
 [107.77.172.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E370216F4;
 Wed, 26 Jun 2019 03:43:59 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 12/34] drm/mediatek: call mtk_dsi_stop() after
 mtk_drm_crtc_atomic_disable()
Date: Tue, 25 Jun 2019 23:43:13 -0400
Message-Id: <20190626034335.23767-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626034335.23767-1-sashal@kernel.org>
References: <20190626034335.23767-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561520640;
 bh=aeY81NVWE7aislMsiIi332nS2n19XbOzG1G9XfUMHhc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qL7QavxX8FO6tPLe5YQ32CaGbKmJZjSh4kTnn/OS/myFoPpMJw9lsvd0QelvcBQu8
 /5DqFKvn4+DjjK9e3S5DjBj4Y8YgYOlIHg0COnyiwOTMDmeuC8RRsmJ8qQLDvKcheP
 Q6udIp7QRDAoV54LiZ9tr7dU3PH+ZcVexDW5Pdus=
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
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgoKWyBVcHN0cmVhbSBjb21t
aXQgMjQ1OGQ5ZDZkOTRiZTk4MmI5MTdlOTNjNjFhODliNDQyNmYzMmUzMSBdCgptdGtfZHNpX3N0
b3AoKSBzaG91bGQgYmUgY2FsbGVkIGFmdGVyIG10a19kcm1fY3J0Y19hdG9taWNfZGlzYWJsZSgp
LCB3aGljaApuZWVkcyBvdmwgaXJxIGZvciBkcm1fY3J0Y193YWl0X29uZV92YmxhbmsoKSwgc2lu
Y2UgYWZ0ZXIgbXRrX2RzaV9zdG9wKCkgaXMKY2FsbGVkLCBvdmwgaXJxIHdpbGwgYmUgZGlzYWJs
ZWQuIElmIGRybV9jcnRjX3dhaXRfb25lX3ZibGFuaygpIGlzIGNhbGxlZAphZnRlciBsYXN0IGly
cSwgaXQgd2lsbCB0aW1lb3V0IHdpdGggdGhpcyBtZXNzYWdlOiAidmJsYW5rIHdhaXQgdGltZWQg
b3V0Cm9uIGNydGMgMCIuIFRoaXMgaGFwcGVucyBzb21ldGltZXMgd2hlbiB0dXJuaW5nIG9mZiB0
aGUgc2NyZWVuLgoKSW4gZHJtX2F0b21pY19oZWxwZXIuYyNkaXNhYmxlX291dHB1dHMoKSwKdGhl
IGNhbGxpbmcgc2VxdWVuY2Ugd2hlbiB0dXJuaW5nIG9mZiB0aGUgc2NyZWVuIGlzOgoKMS4gbXRr
X2RzaV9lbmNvZGVyX2Rpc2FibGUoKQogICAgIC0tPiBtdGtfb3V0cHV0X2RzaV9kaXNhYmxlKCkK
ICAgICAgIC0tPiBtdGtfZHNpX3N0b3AoKTsgIC8qIHNvbWV0aW1lcyBtYWtlIHZibGFuayB0aW1l
b3V0IGluCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhdG9taWNfZGlzYWJsZSAqLwog
ICAgICAgLS0+IG10a19kc2lfcG93ZXJvZmYoKTsKMi4gbXRrX2RybV9jcnRjX2F0b21pY19kaXNh
YmxlKCkKICAgICAtLT4gZHJtX2NydGNfd2FpdF9vbmVfdmJsYW5rKCk7CiAgICAgLi4uCiAgICAg
ICAtLT4gbXRrX2RzaV9kZHBfc3RvcCgpCiAgICAgICAgIC0tPiBtdGtfZHNpX3Bvd2Vyb2ZmKCk7
CgptdGtfZHNpX3Bvd2Vyb2ZmKCkgaGFzIHJlZmVyZW5jZSBjb3VudCBkZXNpZ24sIGNoYW5nZSB0
byBtYWtlCm10a19kc2lfc3RvcCgpIGNhbGxlZCBpbiBtdGtfZHNpX3Bvd2Vyb2ZmKCkgd2hlbiBy
ZWZjb3VudCBpcyAwLgoKRml4ZXM6IDA3MDc2MzJiNWJhYyAoImRybS9tZWRpYXRlazogdXBkYXRl
IERTSSBzdWIgZHJpdmVyIGZsb3cgZm9yIHNlbmRpbmcgY29tbWFuZHMgdG8gcGFuZWwiKQpTaWdu
ZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+ClNpZ25lZC1vZmYt
Ynk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmlu
IDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jIHwgMTAgKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCmluZGV4IDg0YmI2Njg2NjYz
MS4uMGRkMzE3YWM1ZmU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKQEAgLTYzMCw2
ICs2MzAsMTUgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9wb3dlcm9mZihzdHJ1Y3QgbXRrX2RzaSAq
ZHNpKQogCWlmICgtLWRzaS0+cmVmY291bnQgIT0gMCkKIAkJcmV0dXJuOwogCisJLyoKKwkgKiBt
dGtfZHNpX3N0b3AoKSBhbmQgbXRrX2RzaV9zdGFydCgpIGlzIGFzeW1tZXRyaWMsIHNpbmNlCisJ
ICogbXRrX2RzaV9zdG9wKCkgc2hvdWxkIGJlIGNhbGxlZCBhZnRlciBtdGtfZHJtX2NydGNfYXRv
bWljX2Rpc2FibGUoKSwKKwkgKiB3aGljaCBuZWVkcyBpcnEgZm9yIHZibGFuaywgYW5kIG10a19k
c2lfc3RvcCgpIHdpbGwgZGlzYWJsZSBpcnEuCisJICogbXRrX2RzaV9zdGFydCgpIG5lZWRzIHRv
IGJlIGNhbGxlZCBpbiBtdGtfb3V0cHV0X2RzaV9lbmFibGUoKSwKKwkgKiBhZnRlciBkc2kgaXMg
ZnVsbHkgc2V0LgorCSAqLworCW10a19kc2lfc3RvcChkc2kpOworCiAJaWYgKCFtdGtfZHNpX3N3
aXRjaF90b19jbWRfbW9kZShkc2ksIFZNX0RPTkVfSU5UX0ZMQUcsIDUwMCkpIHsKIAkJaWYgKGRz
aS0+cGFuZWwpIHsKIAkJCWlmIChkcm1fcGFuZWxfdW5wcmVwYXJlKGRzaS0+cGFuZWwpKSB7CkBA
IC02OTYsNyArNzA1LDYgQEAgc3RhdGljIHZvaWQgbXRrX291dHB1dF9kc2lfZGlzYWJsZShzdHJ1
Y3QgbXRrX2RzaSAqZHNpKQogCQl9CiAJfQogCi0JbXRrX2RzaV9zdG9wKGRzaSk7CiAJbXRrX2Rz
aV9wb3dlcm9mZihkc2kpOwogCiAJZHNpLT5lbmFibGVkID0gZmFsc2U7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
