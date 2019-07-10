Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9893F648F9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024C46E0F1;
	Wed, 10 Jul 2019 15:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32C36E0F1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:03:46 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C0DB216C8;
 Wed, 10 Jul 2019 15:03:45 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 5/7] drm/imx: notify drm core before sending event
 during crtc disable
Date: Wed, 10 Jul 2019 11:03:33 -0400
Message-Id: <20190710150337.7390-5-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710150337.7390-1-sashal@kernel.org>
References: <20190710150337.7390-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562771026;
 bh=jGB9OM116C7+htRI4ITgZZja9A7XZkPCjr6Z7ikeaKU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o8JUA7j86OI9m4HUfkw7iJ0ftZ8x9/9GsMvjKZKLQtQxyjIMWcVBkoDY63yqPEL0F
 j9sB9shanOVRP39IZ1DPfUb6sZKEpiJKglZPCfxhEVTqLj4LUX0wA0uLzpf+MWsTFn
 OT5POd8LWcNEkvD09WOnNM2hmdkc27A5JhGBdXTk=
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iZXJ0IEJlY2tldHQgPGJvYi5iZWNrZXR0QGNvbGxhYm9yYS5jb20+CgpbIFVwc3Ry
ZWFtIGNvbW1pdCA3OGM2OGU4ZjVjZDI0YmQzMmJhNGNhMWNkZmIwYzMwY2YwNjQyNjg1IF0KCk5v
dGlmeSBkcm0gY29yZSBiZWZvcmUgc2VuZGluZyBwZW5kaW5nIGV2ZW50cyBkdXJpbmcgY3J0YyBk
aXNhYmxlLgpUaGlzIGZpeGVzIHRoZSBmaXJzdCBldmVudCBhZnRlciBkaXNhYmxlIGhhdmluZyBh
biBvbGQgc3RhbGUgdGltZXN0YW1wCmJ5IGhhdmluZyBkcm1fY3J0Y192Ymxhbmtfb2ZmIHVwZGF0
ZSB0aGUgdGltZXN0YW1wIHRvIG5vdy4KClRoaXMgd2FzIHNlZW4gd2hpbGUgZGVidWdnaW5nIHdl
c3RvbiBsb2cgbWVzc2FnZToKV2FybmluZzogY29tcHV0ZWQgcmVwYWludCBkZWxheSBpcyBpbnNh
bmU6IC04MjEyIG1zZWMKClRoaXMgb2NjdXJyZWQgZHVlIHRvOgoxLiBkcml2ZXIgc3RhcnRzIHVw
CjIuIGZiY29uIGNvbWVzIGFsb25nIGFuZCByZXN0b3JlcyBmYmRldiwgZW5hYmxpbmcgdmJsYW5r
CjMuIHZibGFua19kaXNhYmxlX2ZuIGZpcmVzIHZpYSB0aW1lciBkaXNhYmxpbmcgdmJsYW5rLCBr
ZWVwaW5nIHZibGFuawpzZXEgbnVtYmVyIGFuZCB0aW1lIHNldCBhdCBjdXJyZW50IHZhbHVlCihz
b21lIHRpbWUgbGF0ZXIpCjQuIHdlc3RvbiBzdGFydHMgYW5kIGRvZXMgYSBtb2Rlc2V0CjUuIGF0
b21pYyBjb21taXQgZGlzYWJsZXMgY3J0YyB3aGlsZSBpdCBkb2VzIHRoZSBtb2Rlc2V0CjYuIGlw
dV9jcnRjX2F0b21pY19kaXNhYmxlIHNlbmRzIHZibGFuayB3aXRoIG9sZCBzZXEgbnVtYmVyIGFu
ZCB0aW1lCgpGaXhlczogYTQ3NDQ3ODY0MmQ1ICgiZHJtL2lteDogZml4IGNydGMgdmJsYW5rIHN0
YXRlIHJlZ3Jlc3Npb24iKQoKU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEJlY2tldHQgPGJvYi5iZWNr
ZXR0QGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1
dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYz
LWNydGMuYwppbmRleCA4ZGJiYTYxYTI3MDguLmEyMDIyMzdjMzE1ZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2lteC9p
cHV2My1jcnRjLmMKQEAgLTc2LDE0ICs3NiwxNCBAQCBzdGF0aWMgdm9pZCBpcHVfY3J0Y19hdG9t
aWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJZHJtX2F0b21pY19oZWxwZXJfZGlz
YWJsZV9wbGFuZXNfb25fY3J0YyhvbGRfY3J0Y19zdGF0ZSwgZmFsc2UpOwogCWlwdV9kY19kaXNh
YmxlKGlwdSk7CiAKKwlkcm1fY3J0Y192Ymxhbmtfb2ZmKGNydGMpOworCiAJc3Bpbl9sb2NrX2ly
cSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrKTsKIAlpZiAoY3J0Yy0+c3RhdGUtPmV2ZW50KSB7CiAJ
CWRybV9jcnRjX3NlbmRfdmJsYW5rX2V2ZW50KGNydGMsIGNydGMtPnN0YXRlLT5ldmVudCk7CiAJ
CWNydGMtPnN0YXRlLT5ldmVudCA9IE5VTEw7CiAJfQogCXNwaW5fdW5sb2NrX2lycSgmY3J0Yy0+
ZGV2LT5ldmVudF9sb2NrKTsKLQotCWRybV9jcnRjX3ZibGFua19vZmYoY3J0Yyk7CiB9CiAKIHN0
YXRpYyB2b2lkIGlteF9kcm1fY3J0Y19yZXNldChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
