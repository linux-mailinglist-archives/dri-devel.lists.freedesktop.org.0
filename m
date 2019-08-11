Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F97D89206
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 16:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542E86E346;
	Sun, 11 Aug 2019 14:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FAB6E346
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 14:37:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1966410F09;
 Sun, 11 Aug 2019 14:37:34 +0000 (UTC)
Received: from dhcp-44-196.space.revspace.nl (ovpn-112-19.ams2.redhat.com
 [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28D1960606;
 Sun, 11 Aug 2019 14:37:30 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: [PATCH 1/2] drm: gm12u320: Do not take a mutex from a wait_event
 condition
Date: Sun, 11 Aug 2019 16:37:24 +0200
Message-Id: <20190811143725.5951-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Sun, 11 Aug 2019 14:37:34 +0000 (UTC)
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
Cc: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBtYWRlIHRoZSBjb25kaXRpb24gb2YgdGhlIHdhaXRfZXZlbnRfdGltZW91dCBjYWxsIGluCmdt
MTJ1MzIwX2ZiX3VwZGF0ZV93b3JrIGEgaGVscGVyIHdoaWNoIHRha2VzIGEgbXV0ZXggdG8gbWFr
ZSBzdXJlCnRoYXQgYW55IHdyaXRlcyB0byBmYl91cGRhdGUucnVuIG9yIGZiX3VwZGF0ZS5mYiBm
cm9tIG90aGVyIENQVSBjb3JlcwphcmUgc2VlbiBiZWZvcmUgdGhlIGNoZWNrIGlzIGRvbmUuCgpU
aGlzIGlzIG5vdCBuZWNlc3NhcnkgYXMgdGhlIHdhaXRfZXZlbnQgaGVscGVycyBjb250YWluIHRo
ZSBuZWNlc3NhcnkKYmFycmllcnMgZm9yIHRoaXMgdGhlbXNlbHZlcy4KCk1vcmUgb3ZlciBpdCBp
cyBoYXJtZnVsbCBzaW5jZSBieSB0aGUgdGltZSB0aGUgY2hlY2sgaXMgZG9uZSB0aGUgdGFzawpp
cyBubyBsb25nZXIgaW4gdGhlIFRBU0tfUlVOTklORyBzdGF0ZSBhbmQgY2FsbGluZyBtdXRleF9s
b2NrIHdoaWxlIG5vdAppbiB0YXNrLXJ1bm5pbmcgaXMgbm90IGFsbG93ZWQsIGxlYWRpbmcgdG8g
dGhpcyB3YXJuaW5nIHdoZW4gdGhlIGtlcm5lbAppcyBidWlsZCB3aXRoIHNvbWUgZXh0cmEgbG9j
a2luZyBjaGVja3MgZW5hYmxlZDoKClsxMTk0Ny40NTAwMTFdIGRvIG5vdCBjYWxsIGJsb2NraW5n
IG9wcyB3aGVuICFUQVNLX1JVTk5JTkc7IHN0YXRlPTIgc2V0IGF0CiAgICAgICAgICAgICAgIFs8
MDAwMDAwMDBlNDMwNmRlNj5dIHByZXBhcmVfdG9fd2FpdF9ldmVudCsweDYxLzB4MTkwCgpUaGlz
IGNvbW1pdCBmaXhlcyB0aGlzIGJ5IGRyb3BwaW5nIHRoZSBoZWxwZXIgYW5kIHNpbXBseSBkaXJl
Y3RseQpjaGVja2luZyB0aGUgY29uZGl0aW9uICh3aXRob3V0IHVubmVjZXNzYXJ5IGxvY2tpbmcp
IGluIHRoZQp3YWl0X2V2ZW50X3RpbWVvdXQgY2FsbC4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUg
R29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20x
MnUzMjAuYyB8IDE0ICsrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9n
bTEydTMyMC5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20xMnUzMjAuYwppbmRleCA0YzQ3YWE0
ZGUwOWIuLjRkNjY3NjViMTEyNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20x
MnUzMjAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9nbTEydTMyMC5jCkBAIC0zNDIsMTcg
KzM0Miw2IEBAIHN0YXRpYyB2b2lkIGdtMTJ1MzIwX2NvcHlfZmJfdG9fYmxvY2tzKHN0cnVjdCBn
bTEydTMyMF9kZXZpY2UgKmdtMTJ1MzIwKQogCW11dGV4X3VubG9jaygmZ20xMnUzMjAtPmZiX3Vw
ZGF0ZS5sb2NrKTsKIH0KIAotc3RhdGljIGludCBnbTEydTMyMF9mYl91cGRhdGVfcmVhZHkoc3Ry
dWN0IGdtMTJ1MzIwX2RldmljZSAqZ20xMnUzMjApCi17Ci0JaW50IHJldDsKLQotCW11dGV4X2xv
Y2soJmdtMTJ1MzIwLT5mYl91cGRhdGUubG9jayk7Ci0JcmV0ID0gIWdtMTJ1MzIwLT5mYl91cGRh
dGUucnVuIHx8IGdtMTJ1MzIwLT5mYl91cGRhdGUuZmIgIT0gTlVMTDsKLQltdXRleF91bmxvY2so
JmdtMTJ1MzIwLT5mYl91cGRhdGUubG9jayk7Ci0KLQlyZXR1cm4gcmV0OwotfQotCiBzdGF0aWMg
dm9pZCBnbTEydTMyMF9mYl91cGRhdGVfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiB7
CiAJc3RydWN0IGdtMTJ1MzIwX2RldmljZSAqZ20xMnUzMjAgPQpAQCAtNDI2LDcgKzQxNSw4IEBA
IHN0YXRpYyB2b2lkIGdtMTJ1MzIwX2ZiX3VwZGF0ZV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAq
d29yaykKIAkJICogc3dpdGNoZXMgYmFjayB0byBzaG93aW5nIGl0cyBsb2dvLgogCQkgKi8KIAkJ
d2FpdF9ldmVudF90aW1lb3V0KGdtMTJ1MzIwLT5mYl91cGRhdGUud2FpdHEsCi0JCQkJICAgZ20x
MnUzMjBfZmJfdXBkYXRlX3JlYWR5KGdtMTJ1MzIwKSwKKwkJCQkgICAhZ20xMnUzMjAtPmZiX3Vw
ZGF0ZS5ydW4gfHwKKwkJCQkJZ20xMnUzMjAtPmZiX3VwZGF0ZS5mYiAhPSBOVUxMLAogCQkJCSAg
IElETEVfVElNRU9VVCk7CiAJfQogCXJldHVybjsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
