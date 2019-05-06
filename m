Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4390A15341
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 20:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE2F89B70;
	Mon,  6 May 2019 18:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8367089B65;
 Mon,  6 May 2019 18:02:09 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52392
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hNhwF-0007OJ-HS; Mon, 06 May 2019 20:02:07 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 00/11] drm/fb-helper: Move modesetting code to drm_client
Date: Mon,  6 May 2019 20:01:28 +0200
Message-Id: <20190506180139.6913-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=A0AKmMYr9ncXla/MhUUTd93uNbnHNE5iTuhpCAD41N0=; 
 b=nqkLpdTiTTdwcMcvpLgnRA6cBe6qowzm0y3arf+HwyP/yTzap7l6ZUo3WkSpXH6KcoDrm16S8KkQ/q9dKZtUmaSAIu7ofXcRAOZjAB6vz72445hbPrd09iE/DjAhS8w63QG+hHKELCJP1xfx9+lrBEsk6dk3jho5PY0sQEuDqMkZV8rtq7Kpq6M/tG6l9krbzY235QUJEen4vFpPVrcExuxxlzuLWbUQ69cVzOkbLxZ+4NVrP/HD56idnhpHZ40KMXJ08q4cJbLq/I2rE8SOnzl2BcJp1HGJFQhP8819KAGtuBnCTwIMQ+3TluEbM0choVkl5DyjPHAK1VQCFfLRYg==;
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtb3ZlcyB0aGUgbW9kZXNldHRpbmcgY29kZSBmcm9tIGRybV9mYl9oZWxwZXIgdG8gZHJt
X2NsaWVudCBzbyBpdApjYW4gYmUgc2hhcmVkIGJ5IGFsbCBpbnRlcm5hbCBjbGllbnRzLgoKQ2hh
bmdlcyB0aGlzIHRpbWU6Ci0gVXNlIHJlc3RvcmVfZmJkZXZfbW9kZV9mb3JjZSgpIGluIAogIGRy
bV9mYl9oZWxwZXJfcmVzdG9yZV9mYmRldl9tb2RlX3VubG9ja2VkKCkgdG8gcGxlYXNlIGlndCB0
ZXN0cy4gSSdtIG5vdAogIGN1cnJlbnRseSBtb3RpdmF0ZWQgdG8gbGVhcm4gaWd0IHNvIEkgaGF2
ZSBhZGRlZCBhIHRvZG8gZW50cnkgZm9yIHRoaXMuCi0gUmViYXNlIG9uIGRybS1uZXh0IChkcm1f
ZmJfaGVscGVyIGFuZCBkcm1fbGVnYWN5IHBhdGNoZXMpCgpOb3JhbGYuCgpOb3JhbGYgVHLDuG5u
ZXMgKDExKToKICBkcm0vYXRvbWljOiBNb3ZlIF9fZHJtX2F0b21pY19oZWxwZXJfZGlzYWJsZV9w
bGFuZS9zZXRfY29uZmlnKCkKICBkcm0vZmItaGVscGVyOiBBdm9pZCByYWNlIHdpdGggRFJNIHVz
ZXJzcGFjZQogIGRybS9mYi1oZWxwZXI6IE5vIG5lZWQgdG8gY2FjaGUgcm90YXRpb24gYW5kIHN3
X3JvdGF0aW9ucwogIGRybS9mYi1oZWxwZXI6IFJlbW92ZSBkcm1fZmJfaGVscGVyX2NydGMtPnt4
LHksZGVzaXJlZF9tb2RlfQogIGRybS9mYi1oZWxwZXI6IFJlbW92ZSBkcm1fZmJfaGVscGVyX2Ny
dGMKICBkcm0vZmItaGVscGVyOiBQcmVwYXJlIHRvIG1vdmUgb3V0IGNvbW1pdCBjb2RlCiAgZHJt
L2ZiLWhlbHBlcjogTW92ZSBvdXQgY29tbWl0IGNvZGUKICBkcm0vZmItaGVscGVyOiBSZW1vdmUg
ZHJtX2ZiX2hlbHBlcl9jb25uZWN0b3IKICBkcm0vZmItaGVscGVyOiBQcmVwYXJlIHRvIG1vdmUg
b3V0IG1vZGVzZXQgY29uZmlnIGNvZGUKICBkcm0vZmItaGVscGVyOiBNb3ZlIG91dCBtb2Rlc2V0
IGNvbmZpZyBjb2RlCiAgZHJtL2NsaWVudDogSGFjazogQWRkIGJvb3RzcGxhc2ggZXhhbXBsZQoK
IERvY3VtZW50YXRpb24vZ3B1L2RybS1jbGllbnQucnN0ICAgICB8ICAgIDMgKwogRG9jdW1lbnRh
dGlvbi9ncHUvdG9kby5yc3QgICAgICAgICAgIHwgICAxNSArCiBkcml2ZXJzL2dwdS9kcm0vS2Nv
bmZpZyAgICAgICAgICAgICAgfCAgICA1ICsKIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAg
ICAgICAgICB8ICAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMgICAgICAgICB8
ICAxNjggKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgIHwgIDE2NCAt
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXV0aC5jICAgICAgICAgICB8ICAgMjAgKwogZHJpdmVy
cy9ncHUvZHJtL2RybV9ib290c3BsYXNoLmMgICAgIHwgIDM1OCArKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2NsaWVudC5jICAgICAgICAgfCAgIDE3ICstCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2NsaWVudF9tb2Rlc2V0LmMgfCAxMDg2ICsrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2NydGNfaW50ZXJuYWwuaCAgfCAgICA1ICsKIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZHJ2LmMgICAgICAgICAgICB8ICAgIDQgKwogZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIu
YyAgICAgIHwgMTM5MiArKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9pbnRlcm5hbC5oICAgICAgIHwgICAgMiArCiBpbmNsdWRlL2RybS9kcm1fYXRvbWljX2hl
bHBlci5oICAgICAgfCAgICA0IC0KIGluY2x1ZGUvZHJtL2RybV9jbGllbnQuaCAgICAgICAgICAg
ICB8ICAgNDkgKwogaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oICAgICAgICAgIHwgIDEwMiAr
LQogMTcgZmlsZXMgY2hhbmdlZCwgMTg3NiBpbnNlcnRpb25zKCspLCAxNTIxIGRlbGV0aW9ucygt
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fYm9vdHNwbGFzaC5jCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCgot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
