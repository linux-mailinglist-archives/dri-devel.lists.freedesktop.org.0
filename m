Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBBCC0027
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 09:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CFB6EE83;
	Fri, 27 Sep 2019 07:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 343 seconds by postgrey-1.36 at gabe;
 Thu, 26 Sep 2019 10:59:21 UTC
Received: from balrog.mythic-beasts.com (balrog.mythic-beasts.com
 [IPv6:2a00:1098:0:82:1000:0:2:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB496ECD2;
 Thu, 26 Sep 2019 10:59:21 +0000 (UTC)
Received: from [199.195.250.187] (port=35715 helo=hermes.aosc.io)
 by balrog.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.2)
 (envelope-from <icenowy@aosc.io>)
 id 1iDROy-0008GR-Mn; Thu, 26 Sep 2019 11:53:37 +0100
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 62C98407D0;
 Thu, 26 Sep 2019 10:53:28 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/lima: allow to retry when allocating memory for BO
Date: Thu, 26 Sep 2019 18:52:40 +0800
Message-Id: <20190926105240.43144-1-icenowy@aosc.io>
MIME-Version: 1.0
X-BlackCat-Spam-Score: 50
X-Spam-Status: No, score=5.0
X-Mailman-Approved-At: Fri, 27 Sep 2019 07:40:57 +0000
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
Cc: lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5LCB3aGVuIGFsbG9jYXRpbmcgdGhlIG1lbW9yeSBmb3IgQk8gYnkgTWVzYSwgdGhl
IGxpbWEga2VybmVsCmRyaXZlciBzZXQgb25seSBHRlBfRE1BMzIgZmxhZzsgYW5kIHRoaXMgYWxs
b2NhdGlvbiBtYXkgZmFpbCB3aGVuIHRoZQptZW1vcnkgaXMgcmVsYXRpdmVseSBhZGVxdWF0ZSwg
dGh1cyByZXRyeWluZyBpcyBuZWVkZWQuCgpBZGQgdGhlIEdGUCBmbGFncyBmb3IgcmV0cnlpbmcg
bWVtb3J5IGFsbG9jYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5
QGFvc2MuaW8+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9vYmplY3QuYyB8IDQgKysr
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfb2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vbGltYS9saW1hX29iamVjdC5jCmluZGV4IDg3MTIzYjFkMDgzYy4uMTM4OWFhMWI5NDhiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX29iamVjdC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9saW1hL2xpbWFfb2JqZWN0LmMKQEAgLTkxLDcgKzkxLDkgQEAgc3RydWN0IGxp
bWFfYm8gKmxpbWFfYm9fY3JlYXRlKHN0cnVjdCBsaW1hX2RldmljZSAqZGV2LCB1MzIgc2l6ZSwK
IAkJCWdvdG8gZXJyX291dDsKIAkJfQogCX0gZWxzZSB7Ci0JCW1hcHBpbmdfc2V0X2dmcF9tYXNr
KGJvLT5nZW0uZmlscC0+Zl9tYXBwaW5nLCBHRlBfRE1BMzIpOworCQltYXBwaW5nX3NldF9nZnBf
bWFzayhiby0+Z2VtLmZpbHAtPmZfbWFwcGluZywKKwkJCQkgICAgIEdGUF9ETUEzMiB8IF9fR0ZQ
X1JFVFJZX01BWUZBSUwgfAorCQkJCSAgICAgX19HRlBfTk9XQVJOKTsKIAkJYm8tPnBhZ2VzID0g
ZHJtX2dlbV9nZXRfcGFnZXMoJmJvLT5nZW0pOwogCQlpZiAoSVNfRVJSKGJvLT5wYWdlcykpIHsK
IAkJCXJldCA9IEVSUl9DQVNUKGJvLT5wYWdlcyk7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
