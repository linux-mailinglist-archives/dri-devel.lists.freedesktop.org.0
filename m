Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCED8B250
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 03:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806BB8926F;
	Sat, 27 Apr 2019 01:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5978926F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2019 01:40:02 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BAAA208CB;
 Sat, 27 Apr 2019 01:40:01 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 54/79] drm/mediatek: fix possible object reference
 leak
Date: Fri, 26 Apr 2019 21:38:13 -0400
Message-Id: <20190427013838.6596-54-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190427013838.6596-1-sashal@kernel.org>
References: <20190427013838.6596-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556329202;
 bh=UFLB5YQ4Ea19I7/ltBTlkhya7x1oupHQFnMKqp3lDsY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i08w9Q+O+PC7XmQnOZSD+flAW3Bz8Y24cyvWSbqPRwt+YyH3SHi/9jMDgGPTKmyjp
 5u8y4pbhfF4Mdg+BvHOFlmF7gqVg/qld1QvBjB64Meo8L/2NrpnudfjWXJWoO2F5yl
 NaOdrYW/3z9YW77+YgZZOGjLw2LFriHR6Wp23H04=
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
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Wen Yang <wen.yang99@zte.com.cn>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogV2VuIFlhbmcgPHdlbi55YW5nOTlAenRlLmNvbS5jbj4KClsgVXBzdHJlYW0gY29tbWl0
IDJhZTJjMzMxNmZiNzdkY2Y2NDI3NWQwMTE1OTZiNjAxMDRjNDU0MjYgXQoKVGhlIGNhbGwgdG8g
b2ZfcGFyc2VfcGhhbmRsZSByZXR1cm5zIGEgbm9kZSBwb2ludGVyIHdpdGggcmVmY291bnQKaW5j
cmVtZW50ZWQgdGh1cyBpdCBtdXN0IGJlIGV4cGxpY2l0bHkgZGVjcmVtZW50ZWQgYWZ0ZXIgdGhl
IGxhc3QKdXNhZ2UuCgpEZXRlY3RlZCBieSBjb2NjaW5lbGxlIHdpdGggdGhlIGZvbGxvd2luZyB3
YXJuaW5nczoKZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmM6MTUyMToyLTg6IEVS
Uk9SOiBtaXNzaW5nIG9mX25vZGVfcHV0OyBhY3F1aXJlZCBhIG5vZGUgcG9pbnRlciB3aXRoIHJl
ZmNvdW50IGluY3JlbWVudGVkIG9uIGxpbmUgMTUwOSwgYnV0IHdpdGhvdXQgYSBjb3JyZXNwb25k
aW5nIG9iamVjdCByZWxlYXNlIHdpdGhpbiB0aGlzIGZ1bmN0aW9uLgpkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWkuYzoxNTI0OjEtNzogRVJST1I6IG1pc3Npbmcgb2Zfbm9kZV9wdXQ7
IGFjcXVpcmVkIGEgbm9kZSBwb2ludGVyIHdpdGggcmVmY291bnQgaW5jcmVtZW50ZWQgb24gbGlu
ZSAxNTA5LCBidXQgd2l0aG91dCBhIGNvcnJlc3BvbmRpbmcgb2JqZWN0IHJlbGVhc2Ugd2l0aGlu
IHRoaXMgZnVuY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBXZW4gWWFuZyA8d2VuLnlhbmc5OUB6dGUu
Y29tLmNuPgpDYzogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KQ2M6IFBoaWxpcHAgWmFiZWwg
PHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBNYXR0aGlhcyBCcnVn
Z2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnClNpZ25lZC1vZmYtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+ClNpZ25lZC1v
ZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwppbmRleCBjOTEwODUwZDIwNzcuLmE2
ODdmZTNlMWQ2YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKQEAgLTE1MTQsNiAr
MTUxNCw3IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfZHRfcGFyc2VfcGRhdGEoc3RydWN0IG10a19o
ZG1pICpoZG1pLAogCW9mX25vZGVfcHV0KHJlbW90ZSk7CiAKIAloZG1pLT5kZGNfYWRwdCA9IG9m
X2ZpbmRfaTJjX2FkYXB0ZXJfYnlfbm9kZShpMmNfbnApOworCW9mX25vZGVfcHV0KGkyY19ucCk7
CiAJaWYgKCFoZG1pLT5kZGNfYWRwdCkgewogCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQg
ZGRjIGkyYyBhZGFwdGVyIGJ5IG5vZGVcbiIpOwogCQlyZXR1cm4gLUVJTlZBTDsKLS0gCjIuMTku
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
