Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFB05826F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 14:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ADE8984F;
	Thu, 27 Jun 2019 12:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61528984F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 12:23:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 09B73C04FFF1;
 Thu, 27 Jun 2019 12:23:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86BF21A8F5;
 Thu, 27 Jun 2019 12:23:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D2EA216E19; Thu, 27 Jun 2019 14:23:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/5] gem/vram: pin to vram in vmap
Date: Thu, 27 Jun 2019 14:23:44 +0200
Message-Id: <20190627122348.5833-2-kraxel@redhat.com>
In-Reply-To: <20190627122348.5833-1-kraxel@redhat.com>
References: <20190627122348.5833-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 27 Jun 2019 12:23:57 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, tzimmermann@suse.de,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtIGNsaWVudHMgbGlrZSB0aGUgZ2VuZXJpYyBmcmFtZWJ1ZmZlciBlbXVsYXRpb24ga2VlcCBh
IHBlcm1hbmVudAp2bWFwIGFjdGl2ZSwgd2hpY2ggaW4gdHVybiBoYXMgYSBwZXJtYW5lbnQgcGlu
LiAgVGhpcyBwaW4gbmVlZHMgdG8KYmUgaW4gdnJhbSwgb3RoZXJ3aXNlIHdlIGNhbid0IGRpc3Bs
YXkgdGhlIGZyYW1lYnVmZmVyLgoKU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVs
QHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCmluZGV4IDRkZTc4MmNhMjZiMi4uYzcyNDg3
NmM2ZjJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKQEAgLTU5Miw3ICs1
OTIsNyBAQCB2b2lkICpkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9wcmltZV92bWFwKHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqZ2VtKQogCWludCByZXQ7CiAJdm9pZCAqYmFzZTsKIAotCXJldCA9IGRy
bV9nZW1fdnJhbV9waW4oZ2JvLCAwKTsKKwlyZXQgPSBkcm1fZ2VtX3ZyYW1fcGluKGdibywgRFJN
X0dFTV9WUkFNX1BMX0ZMQUdfVlJBTSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIE5VTEw7CiAJYmFz
ZSA9IGRybV9nZW1fdnJhbV9rbWFwKGdibywgdHJ1ZSwgTlVMTCk7Ci0tIAoyLjE4LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
