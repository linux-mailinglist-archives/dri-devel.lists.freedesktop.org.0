Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4DF57DF2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 10:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776476E506;
	Thu, 27 Jun 2019 08:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD26B6E835
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 08:12:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6BEDF8552A;
 Thu, 27 Jun 2019 08:12:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61D9C5D707;
 Thu, 27 Jun 2019 08:12:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8AFDE16E08; Thu, 27 Jun 2019 10:12:06 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bochs: fix framebuffer setup.
Date: Thu, 27 Jun 2019 10:12:06 +0200
Message-Id: <20190627081206.23135-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 27 Jun 2019 08:12:12 +0000 (UTC)
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBkb2Vzbid0IGNvbnNpZGVyIGZyYW1lYnVmZmVyIHBpdGNoIGFuZCBvZmZzZXQs
IGxlYWRpbmcgdG8gYQp3cm9uZyBkaXNwbGF5IGluIGNhc2Ugb2Zmc2V0ICE9IDAgb3IgcGl0Y2gg
IT0gd2lkdGggKiBicHAuICBGaXggaXQuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxr
cmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaCAgICAg
fCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMgIHwgMTQgKysrKysrKysr
Ky0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYyB8ICAzICsrLQogMyBmaWxl
cyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Nocy5oIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2Jv
Y2hzLmgKaW5kZXggY2MzNWQ0OTIxNDJjLi4yYTY1NDM0NTAwZWUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9ib2Nocy9ib2Nocy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2No
cy5oCkBAIC04Niw3ICs4Niw3IEBAIHZvaWQgYm9jaHNfaHdfc2V0bW9kZShzdHJ1Y3QgYm9jaHNf
ZGV2aWNlICpib2NocywKIHZvaWQgYm9jaHNfaHdfc2V0Zm9ybWF0KHN0cnVjdCBib2Noc19kZXZp
Y2UgKmJvY2hzLAogCQkJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqZm9ybWF0KTsKIHZv
aWQgYm9jaHNfaHdfc2V0YmFzZShzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocywKLQkJICAgICAg
aW50IHgsIGludCB5LCB1NjQgYWRkcik7CisJCSAgICAgIGludCB4LCBpbnQgeSwgaW50IHN0cmlk
ZSwgdTY0IGFkZHIpOwogaW50IGJvY2hzX2h3X2xvYWRfZWRpZChzdHJ1Y3QgYm9jaHNfZGV2aWNl
ICpib2Nocyk7CiAKIC8qIGJvY2hzX21tLmMgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9ib2Nocy9ib2Noc19ody5jIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMKaW5k
ZXggNzkxYWIyZjc5OTQ3Li5lYmZlYTg3NDRmZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9ib2Nocy9ib2Noc19ody5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5j
CkBAIC0yNTUsMTYgKzI1NSwyMiBAQCB2b2lkIGJvY2hzX2h3X3NldGZvcm1hdChzdHJ1Y3QgYm9j
aHNfZGV2aWNlICpib2NocywKIH0KIAogdm9pZCBib2Noc19od19zZXRiYXNlKHN0cnVjdCBib2No
c19kZXZpY2UgKmJvY2hzLAotCQkgICAgICBpbnQgeCwgaW50IHksIHU2NCBhZGRyKQorCQkgICAg
ICBpbnQgeCwgaW50IHksIGludCBzdHJpZGUsIHU2NCBhZGRyKQogewotCXVuc2lnbmVkIGxvbmcg
b2Zmc2V0ID0gKHVuc2lnbmVkIGxvbmcpYWRkciArCisJdW5zaWduZWQgbG9uZyBvZmZzZXQ7CisJ
dW5zaWduZWQgaW50IHZ4LCB2eSwgdndpZHRoOworCisJYm9jaHMtPnN0cmlkZSA9IHN0cmlkZTsK
KwlvZmZzZXQgPSAodW5zaWduZWQgbG9uZylhZGRyICsKIAkJeSAqIGJvY2hzLT5zdHJpZGUgKwog
CQl4ICogKGJvY2hzLT5icHAgLyA4KTsKLQlpbnQgdnkgPSBvZmZzZXQgLyBib2Nocy0+c3RyaWRl
OwotCWludCB2eCA9IChvZmZzZXQgJSBib2Nocy0+c3RyaWRlKSAqIDggLyBib2Nocy0+YnBwOwor
CXZ5ID0gb2Zmc2V0IC8gYm9jaHMtPnN0cmlkZTsKKwl2eCA9IChvZmZzZXQgJSBib2Nocy0+c3Ry
aWRlKSAqIDggLyBib2Nocy0+YnBwOworCXZ3aWR0aCA9IHN0cmlkZSAqIDggLyBib2Nocy0+YnBw
OwogCiAJRFJNX0RFQlVHX0RSSVZFUigieCAlZCwgeSAlZCwgYWRkciAlbGx4IC0+IG9mZnNldCAl
bHgsIHZ4ICVkLCB2eSAlZFxuIiwKIAkJCSB4LCB5LCBhZGRyLCBvZmZzZXQsIHZ4LCB2eSk7CisJ
Ym9jaHNfZGlzcGlfd3JpdGUoYm9jaHMsIFZCRV9ESVNQSV9JTkRFWF9WSVJUX1dJRFRILCB2d2lk
dGgpOwogCWJvY2hzX2Rpc3BpX3dyaXRlKGJvY2hzLCBWQkVfRElTUElfSU5ERVhfWF9PRkZTRVQs
IHZ4KTsKIAlib2Noc19kaXNwaV93cml0ZShib2NocywgVkJFX0RJU1BJX0lOREVYX1lfT0ZGU0VU
LCB2eSk7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMKaW5kZXggNTkwNGVkZGM4M2E1Li5i
YzE5ZGJkNTMxZWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMKQEAgLTM2LDcgKzM2LDgg
QEAgc3RhdGljIHZvaWQgYm9jaHNfcGxhbmVfdXBkYXRlKHN0cnVjdCBib2Noc19kZXZpY2UgKmJv
Y2hzLAogCWJvY2hzX2h3X3NldGJhc2UoYm9jaHMsCiAJCQkgc3RhdGUtPmNydGNfeCwKIAkJCSBz
dGF0ZS0+Y3J0Y195LAotCQkJIGdiby0+Ym8ub2Zmc2V0KTsKKwkJCSBzdGF0ZS0+ZmItPnBpdGNo
ZXNbMF0sCisJCQkgc3RhdGUtPmZiLT5vZmZzZXRzWzBdICsgZ2JvLT5iby5vZmZzZXQpOwogCWJv
Y2hzX2h3X3NldGZvcm1hdChib2Nocywgc3RhdGUtPmZiLT5mb3JtYXQpOwogfQogCi0tIAoyLjE4
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
