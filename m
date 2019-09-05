Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E125DA9B1C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9887B89DA4;
	Thu,  5 Sep 2019 07:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C29C89CE0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 07:05:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AFDCF3083362;
 Thu,  5 Sep 2019 07:05:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6628460126;
 Thu,  5 Sep 2019 07:05:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D353331F02; Thu,  5 Sep 2019 09:05:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/vmwgfx: switch to own vma manager
Date: Thu,  5 Sep 2019 09:05:08 +0200
Message-Id: <20190905070509.22407-8-kraxel@redhat.com>
In-Reply-To: <20190905070509.22407-1-kraxel@redhat.com>
References: <20190905070509.22407-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 05 Sep 2019 07:05:14 +0000 (UTC)
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN0cnVjdCBkcm1fdm1hX29mZnNldF9tYW5hZ2VyIHRvIHZtYV9wcml2YXRlLCBpbml0aWFs
aXplIGl0IGFuZApwYXNzIGl0IHRvIHR0bV9ib19kZXZpY2VfaW5pdCgpLgoKV2l0aCB0aGlzIGlu
IHBsYWNlIHRoZSBsYXN0IHVzZXIgb2YgdHRtJ3MgZW1iZWRkZWQgdm1hIG9mZnNldCBtYW5hZ2Vy
CmlzIGdvbmUgYW5kIHdlIGNhbiByZW1vdmUgaXQgKGluIGEgc2VwYXJhdGUgcGF0Y2gpLgoKU2ln
bmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggfCAxICsKIGRyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2Rydi5jIHwgNiArKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaAppbmRleCBk
YmIwNGRiY2Y0NzguLmFkYjA0MzY1MjhjNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2
LmgKQEAgLTQyMCw2ICs0MjAsNyBAQCBzdHJ1Y3Qgdm13X3ByaXZhdGUgewogCXN0cnVjdCB2bXdf
Zmlmb19zdGF0ZSBmaWZvOwogCiAJc3RydWN0IGRybV9kZXZpY2UgKmRldjsKKwlzdHJ1Y3QgZHJt
X3ZtYV9vZmZzZXRfbWFuYWdlciB2bWFfbWFuYWdlcjsKIAl1bnNpZ25lZCBsb25nIHZtd19jaGlw
c2V0OwogCXVuc2lnbmVkIGludCBpb19zdGFydDsKIAl1aW50MzJfdCB2cmFtX3N0YXJ0OwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwppbmRleCAyMGJjOTEyMTRlNzUuLjg4MmZhY2QwNTVk
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKQEAgLTgyNywxMCArODI3LDEzIEBA
IHN0YXRpYyBpbnQgdm13X2RyaXZlcl9sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2ln
bmVkIGxvbmcgY2hpcHNldCkKIAkJZ290byBvdXRfbm9fZm1hbjsKIAl9CiAKKwlkcm1fdm1hX29m
ZnNldF9tYW5hZ2VyX2luaXQoJmRldl9wcml2LT52bWFfbWFuYWdlciwKKwkJCQkgICAgRFJNX0ZJ
TEVfUEFHRV9PRkZTRVRfU1RBUlQsCisJCQkJICAgIERSTV9GSUxFX1BBR0VfT0ZGU0VUX1NJWkUp
OwogCXJldCA9IHR0bV9ib19kZXZpY2VfaW5pdCgmZGV2X3ByaXYtPmJkZXYsCiAJCQkJICZ2bXdf
Ym9fZHJpdmVyLAogCQkJCSBkZXYtPmFub25faW5vZGUtPmlfbWFwcGluZywKLQkJCQkgTlVMTCwK
KwkJCQkgJmRldl9wcml2LT52bWFfbWFuYWdlciwKIAkJCQkgZmFsc2UpOwogCWlmICh1bmxpa2Vs
eShyZXQgIT0gMCkpIHsKIAkJRFJNX0VSUk9SKCJGYWlsZWQgaW5pdGlhbGl6aW5nIFRUTSBidWZm
ZXIgb2JqZWN0IGRyaXZlci5cbiIpOwpAQCAtOTg3LDYgKzk5MCw3IEBAIHN0YXRpYyB2b2lkIHZt
d19kcml2ZXJfdW5sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJaWYgKGRldl9wcml2LT5o
YXNfbW9iKQogCQkodm9pZCkgdHRtX2JvX2NsZWFuX21tKCZkZXZfcHJpdi0+YmRldiwgVk1XX1BM
X01PQik7CiAJKHZvaWQpIHR0bV9ib19kZXZpY2VfcmVsZWFzZSgmZGV2X3ByaXYtPmJkZXYpOwor
CWRybV92bWFfb2Zmc2V0X21hbmFnZXJfZGVzdHJveSgmZGV2X3ByaXYtPnZtYV9tYW5hZ2VyKTsK
IAl2bXdfcmVsZWFzZV9kZXZpY2VfbGF0ZShkZXZfcHJpdik7CiAJdm13X2ZlbmNlX21hbmFnZXJf
dGFrZWRvd24oZGV2X3ByaXYtPmZtYW4pOwogCWlmIChkZXZfcHJpdi0+Y2FwYWJpbGl0aWVzICYg
U1ZHQV9DQVBfSVJRTUFTSykKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
