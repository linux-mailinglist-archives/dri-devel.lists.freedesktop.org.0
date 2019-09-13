Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D2B27EB
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 00:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26E26F479;
	Fri, 13 Sep 2019 22:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D77C6F476;
 Fri, 13 Sep 2019 22:05:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A715210C0925;
 Fri, 13 Sep 2019 22:05:25 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A46D7600C6;
 Fri, 13 Sep 2019 22:05:24 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 4/4] drm/nouveau: dispnv50: Report possible_crtcs incorrectly
 on mstos, for now
Date: Fri, 13 Sep 2019 18:03:53 -0400
Message-Id: <20190913220355.6883-4-lyude@redhat.com>
In-Reply-To: <20190913220355.6883-1-lyude@redhat.com>
References: <20190913220355.6883-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Fri, 13 Sep 2019 22:05:25 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjb21taXQgaXMgc2VwZXJhdGUgZnJvbSB0aGUgcHJldmlvdXMgb25lIHRvIG1ha2UgaXQg
ZWFzaWVyIHRvCnJldmVydCBpbiB0aGUgZnV0dXJlLiBCYXNpY2FsbHksIHdoaWxlIHdvcmtpbmcg
b24gbWFraW5nIE1TVE9zIHBlci1oZWFkCmFzIG9wcG9zZWQgdG8gcGVyLWhlYWQtcGVyLWNvbm5l
Y3RvciBJIGRpc2NvdmVyZWQgdGhlc2UgbG92ZWx5IGlzc3VlczoKCmh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy94b3JnL3hzZXJ2ZXIvbWVyZ2VfcmVxdWVzdHMvMjc3Cmh0dHBzOi8vZ2l0
bGFiLmdub21lLm9yZy9HTk9NRS9tdXR0ZXIvaXNzdWVzLzc1OQoKTm90ZSBhcyB3ZWxsIHRoYXQg
SW50ZWwgYWxyZWFkeSBoYXMgYSB0ZW1wb3Jhcnkgd29ya2Fyb3VuZCBmb3IgdGhpcyBpbgp0aGVp
ciBrZXJuZWwgZHJpdmVyLiBTbywgdW5mb3J0dW5hdGVseSB3ZSBuZWVkIHRvIGZvbGxvdyBzdWl0
IHRvIGF2b2lkCmNhdXNpbmcgYSByZWdyZXNzaW9uIGluIHVzZXJzcGFjZS4gT25jZSB0aGVzZSBp
c3N1ZXMgZ2V0IGZpeGVkLCB0aGlzCmNvbW1pdCBzaG91bGQgYmUgcmV2ZXJ0ZWQuCgpTaWduZWQt
b2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDYzogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvZGlzcC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCmlu
ZGV4IGQyM2FjMTM3NjNiNS4uZjVhZDIwYWYwZGQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
ZGlzcG52NTAvZGlzcC5jCkBAIC0yMzY2LDYgKzIzNjYsMTggQEAgbnY1MF9kaXNwbGF5X2NyZWF0
ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCQkJCWhlYWQtPm1zdG8gPSBOVUxMOwogCQkJCWdv
dG8gb3V0OwogCQkJfQorCisJCQkvKgorCQkJICogRklYTUU6IFRoaXMgaXMgYSBoYWNrIHRvIHdv
cmthcm91bmQgdGhlIGZvbGxvd2luZworCQkJICogaXNzdWVzOgorCQkJICoKKwkJCSAqIGh0dHBz
Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9tdXR0ZXIvaXNzdWVzLzc1OQorCQkJICogaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcveHNlcnZlci9tZXJnZV9yZXF1ZXN0cy8yNzcK
KwkJCSAqCisJCQkgKiBPbmNlIHRoZXNlIGlzc3VlcyBhcmUgY2xvc2VkLCB0aGlzIHNob3VsZCBi
ZQorCQkJICogcmVtb3ZlZAorCQkJICovCisJCQloZWFkLT5tc3RvLT5lbmNvZGVyLnBvc3NpYmxl
X2NydGNzID0gY3J0Y3M7CiAJCX0KIAl9CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
