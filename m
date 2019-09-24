Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9BDBCC9F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822F36EA4C;
	Tue, 24 Sep 2019 16:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7B76EA4C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:41:53 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D166021783;
 Tue, 24 Sep 2019 16:41:52 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 05/87] drm/kms: Catch mode_object lifetime errors
Date: Tue, 24 Sep 2019 12:40:21 -0400
Message-Id: <20190924164144.25591-5-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343313;
 bh=KYbWE63g/VHZHZTTkgaSsk6DWKM+oronJAj0DJlgtuU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KeQ0Sq3V5Fdxkr5Ys9NMev+1+oCe0hOlP18PZ2IPmYgJ9xZestVj/dK7iKDRvnjxr
 1OmsP4SSS/CRkuBJBVM6Z+0JzCZuLtAWosk9WwjnGVKn6EYp4ZR/XD2SpY6Hxt5DTk
 aOtBtKyJE7WBBLkT95UnW9pVBhBuuN5RoZtyELEg=
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
Cc: Sasha Levin <sashal@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KClsgVXBzdHJlYW0g
Y29tbWl0IDRmNTM2OGI1NTQxYTkwMmY2NTk2NTU4YjA1ZjVjMjFhOTc3MGRkMzIgXQoKT25seSBk
eW5hbWljIG1vZGUgb2JqZWN0cywgaS5lLiB0aG9zZSB3aGljaCBhcmUgcmVmY291bnRlZCBhbmQg
aGF2ZSBhIGZyZWUKY2FsbGJhY2ssIGNhbiBiZSBhZGRlZCB3aGlsZSB0aGUgb3ZlcmFsbCBkcm1f
ZGV2aWNlIGlzIHZpc2libGUgdG8KdXNlcnNwYWNlLiBBbGwgb3RoZXJzIG11c3QgYmUgYWRkZWQg
YmVmb3JlIGRybV9kZXZfcmVnaXN0ZXIgYW5kCnJlbW92ZWQgYWZ0ZXIgZHJtX2Rldl91bnJlZ2lz
dGVyLgoKU21hbGwgaXNzdWUgYXJvdW5kIGRyaXZlcnMgc3RpbGwgdXNpbmcgdGhlIGxvYWQvdW5s
b2FkIGNhbGxiYWNrcywgd2UKbmVlZCB0byBtYWtlIHN1cmUgd2Ugc2V0IGRldi0+cmVnaXN0ZXJl
ZCBzbyB0aGF0IGxvYWQvdW5sb2FkIGNvZGUgaW4KdGhlc2UgY2FsbGJhY2tzIGRvZXNuJ3QgdHJp
Z2dlciBmYWxzZSB3YXJuaW5ncy4gT25seSBhIHNtYWxsCmFkanVzdGVtZW50IGluIGRybV9kZXZf
cmVnaXN0ZXIgd2FzIG5lZWRlZC4KCk1vdGl2YXRlZCBieSBzb21lIGlyYyBkaXNjdXNzaW9ucyBh
Ym91dCBvYmplY3QgaWRzIG9mIGR5bmFtaWMgb2JqZWN0cwpsaWtlIGJsb2JzIGJlY29tZSBpbnZh
bGlkLCBhbmQgbWUgZ29pbmcgb24gYSBiaXQgYW4gYXVkaXQgc3ByZWUuCgpSZXZpZXdlZC1ieTog
U2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA2MTQwNjE3MjMuMTE3My0xLWRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2gKU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgICAgICAgICB8IDQgKystLQogZHJpdmVycy9n
cHUvZHJtL2RybV9tb2RlX29iamVjdC5jIHwgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwppbmRleCA5ZDAwOTQ3Y2E0NDdm
Li5lNjUyMzA1ZDhmOThhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMKQEAgLTk3OCwxNCArOTc4LDE0IEBAIGludCBk
cm1fZGV2X3JlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgZmxh
Z3MpCiAJaWYgKHJldCkKIAkJZ290byBlcnJfbWlub3JzOwogCi0JZGV2LT5yZWdpc3RlcmVkID0g
dHJ1ZTsKLQogCWlmIChkZXYtPmRyaXZlci0+bG9hZCkgewogCQlyZXQgPSBkZXYtPmRyaXZlci0+
bG9hZChkZXYsIGZsYWdzKTsKIAkJaWYgKHJldCkKIAkJCWdvdG8gZXJyX21pbm9yczsKIAl9CiAK
KwlkZXYtPnJlZ2lzdGVyZWQgPSB0cnVlOworCiAJaWYgKGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUo
ZGV2LCBEUklWRVJfTU9ERVNFVCkpCiAJCWRybV9tb2Rlc2V0X3JlZ2lzdGVyX2FsbChkZXYpOwog
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfb2JqZWN0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX21vZGVfb2JqZWN0LmMKaW5kZXggMWM2ZTUxMTM1OTYyNC4uYzM1NWJhOGU2
ZDVkZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX29iamVjdC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9vYmplY3QuYwpAQCAtNDIsNiArNDIsOCBAQCBpbnQg
X19kcm1fbW9kZV9vYmplY3RfYWRkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1f
bW9kZV9vYmplY3QgKm9iaiwKIHsKIAlpbnQgcmV0OwogCisJV0FSTl9PTihkZXYtPnJlZ2lzdGVy
ZWQgJiYgIW9ial9mcmVlX2NiKTsKKwogCW11dGV4X2xvY2soJmRldi0+bW9kZV9jb25maWcuaWRy
X211dGV4KTsKIAlyZXQgPSBpZHJfYWxsb2MoJmRldi0+bW9kZV9jb25maWcub2JqZWN0X2lkciwg
cmVnaXN0ZXJfb2JqID8gb2JqIDogTlVMTCwKIAkJCTEsIDAsIEdGUF9LRVJORUwpOwpAQCAtMTAy
LDYgKzEwNCw4IEBAIHZvaWQgZHJtX21vZGVfb2JqZWN0X3JlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsCiB2b2lkIGRybV9tb2RlX29iamVjdF91bnJlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsCiAJCQkJc3RydWN0IGRybV9tb2RlX29iamVjdCAqb2JqZWN0KQogeworCVdBUk5f
T04oZGV2LT5yZWdpc3RlcmVkICYmICFvYmplY3QtPmZyZWVfY2IpOworCiAJbXV0ZXhfbG9jaygm
ZGV2LT5tb2RlX2NvbmZpZy5pZHJfbXV0ZXgpOwogCWlmIChvYmplY3QtPmlkKSB7CiAJCWlkcl9y
ZW1vdmUoJmRldi0+bW9kZV9jb25maWcub2JqZWN0X2lkciwgb2JqZWN0LT5pZCk7Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
