Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B72A9B1A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5CC89D9A;
	Thu,  5 Sep 2019 07:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714EA89D84
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 07:05:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 13FBB10F23E3;
 Thu,  5 Sep 2019 07:05:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68B576060D;
 Thu,  5 Sep 2019 07:05:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F3FC431F04; Thu,  5 Sep 2019 09:05:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/ttm: remove embedded vma_offset_manager
Date: Thu,  5 Sep 2019 09:05:09 +0200
Message-Id: <20190905070509.22407-9-kraxel@redhat.com>
In-Reply-To: <20190905070509.22407-1-kraxel@redhat.com>
References: <20190905070509.22407-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Thu, 05 Sep 2019 07:05:17 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gdXNlcnMgbGVmdC4gIERyaXZlcnMgZWl0aGVyIHNldHVwIHZtYV9vZmZzZXRfbWFuYWdlciB0
aGVtc2VsZgoodm13Z2Z4KSBvciBwYXNzIHRoZSBnZW0gdm1hX29mZnNldF9tYW5hZ2VyIHRvIHR0
bV9ib19kZXZpY2VfaW5pdAooYWxsIG90aGVyIGRyaXZlcnMpLgoKU2lnbmVkLW9mZi1ieTogR2Vy
ZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vdHRtL3R0bV9i
b19kcml2ZXIuaCB8IDQgKy0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICB8IDkg
KystLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCBiL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKaW5kZXggZTM2NTQzNGY5MmIzLi40ZTMwN2Y2NWY0
OTcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKKysrIGIvaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaApAQCAtNDQyLDcgKzQ0Miw2IEBAIGV4dGVybiBz
dHJ1Y3QgdHRtX2JvX2dsb2JhbCB7CiAgKiBAZHJpdmVyOiBQb2ludGVyIHRvIGEgc3RydWN0IHR0
bV9ib19kcml2ZXIgc3RydWN0IHNldHVwIGJ5IHRoZSBkcml2ZXIuCiAgKiBAbWFuOiBBbiBhcnJh
eSBvZiBtZW1fdHlwZV9tYW5hZ2Vycy4KICAqIEB2bWFfbWFuYWdlcjogQWRkcmVzcyBzcGFjZSBt
YW5hZ2VyIChwb2ludGVyKQotICogQF92bWFfbWFuYWdlcjogQWRkcmVzcyBzcGFjZSBtYW5hZ2Vy
IChlbmJlZGRlZCkKICAqIGxydV9sb2NrOiBTcGlubG9jayB0aGF0IHByb3RlY3RzIHRoZSBidWZm
ZXIrZGV2aWNlIGxydSBsaXN0cyBhbmQKICAqIGRkZXN0cm95IGxpc3RzLgogICogQGRldl9tYXBw
aW5nOiBBIHBvaW50ZXIgdG8gdGhlIHN0cnVjdCBhZGRyZXNzX3NwYWNlIHJlcHJlc2VudGluZyB0
aGUKQEAgLTQ2Niw3ICs0NjUsNiBAQCBzdHJ1Y3QgdHRtX2JvX2RldmljZSB7CiAJICogUHJvdGVj
dGVkIGJ5IGludGVybmFsIGxvY2tzLgogCSAqLwogCXN0cnVjdCBkcm1fdm1hX29mZnNldF9tYW5h
Z2VyICp2bWFfbWFuYWdlcjsKLQlzdHJ1Y3QgZHJtX3ZtYV9vZmZzZXRfbWFuYWdlciBfdm1hX21h
bmFnZXI7CiAKIAkvKgogCSAqIFByb3RlY3RlZCBieSB0aGUgZ2xvYmFsOmxydSBsb2NrLgpAQCAt
NTg3LDcgKzU4NSw3IEBAIGludCB0dG1fYm9fZGV2aWNlX3JlbGVhc2Uoc3RydWN0IHR0bV9ib19k
ZXZpY2UgKmJkZXYpOwogICogQGdsb2I6IEEgcG9pbnRlciB0byBhbiBpbml0aWFsaXplZCBzdHJ1
Y3QgdHRtX2JvX2dsb2JhbC4KICAqIEBkcml2ZXI6IEEgcG9pbnRlciB0byBhIHN0cnVjdCB0dG1f
Ym9fZHJpdmVyIHNldCB1cCBieSB0aGUgY2FsbGVyLgogICogQG1hcHBpbmc6IFRoZSBhZGRyZXNz
IHNwYWNlIHRvIHVzZSBmb3IgdGhpcyBiby4KLSAqIEB2bWFfbWFuYWdlcjogQSBwb2ludGVyIHRv
IGEgdm1hIG1hbmFnZXIgb3IgTlVMTC4KKyAqIEB2bWFfbWFuYWdlcjogQSBwb2ludGVyIHRvIGEg
dm1hIG1hbmFnZXIuCiAgKiBAZmlsZV9wYWdlX29mZnNldDogT2Zmc2V0IGludG8gdGhlIGRldmlj
ZSBhZGRyZXNzIHNwYWNlIHRoYXQgaXMgYXZhaWxhYmxlCiAgKiBmb3IgYnVmZmVyIGRhdGEuIFRo
aXMgZW5zdXJlcyBjb21wYXRpYmlsaXR5IHdpdGggb3RoZXIgdXNlcnMgb2YgdGhlCiAgKiBhZGRy
ZXNzIHNwYWNlLgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKaW5kZXggOGRjMjZiYWJjNWNiLi44ODFjZjI2ZDY5
OGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwpAQCAtMTcwNCw4ICsxNzA0LDYgQEAgaW50IHR0bV9ib19k
ZXZpY2VfcmVsZWFzZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikKIAkJCXByX2RlYnVnKCJT
d2FwIGxpc3QgJWQgd2FzIGNsZWFuXG4iLCBpKTsKIAlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xv
Y2spOwogCi0JZHJtX3ZtYV9vZmZzZXRfbWFuYWdlcl9kZXN0cm95KCZiZGV2LT5fdm1hX21hbmFn
ZXIpOwotCiAJaWYgKCFyZXQpCiAJCXR0bV9ib19nbG9iYWxfcmVsZWFzZSgpOwogCkBAIC0xNzIy
LDggKzE3MjAsOCBAQCBpbnQgdHRtX2JvX2RldmljZV9pbml0KHN0cnVjdCB0dG1fYm9fZGV2aWNl
ICpiZGV2LAogCXN0cnVjdCB0dG1fYm9fZ2xvYmFsICpnbG9iID0gJnR0bV9ib19nbG9iOwogCWlu
dCByZXQ7CiAKLQlpZiAoIXZtYV9tYW5hZ2VyKQotCQl2bWFfbWFuYWdlciA9ICZiZGV2LT5fdm1h
X21hbmFnZXI7CisJaWYgKFdBUk5fT04odm1hX21hbmFnZXIgPT0gTlVMTCkpCisJCXJldHVybiAt
RUlOVkFMOwogCiAJcmV0ID0gdHRtX2JvX2dsb2JhbF9pbml0KCk7CiAJaWYgKHJldCkKQEAgLTE3
NDIsOSArMTc0MCw2IEBAIGludCB0dG1fYm9fZGV2aWNlX2luaXQoc3RydWN0IHR0bV9ib19kZXZp
Y2UgKmJkZXYsCiAJCWdvdG8gb3V0X25vX3N5czsKIAogCWJkZXYtPnZtYV9tYW5hZ2VyID0gdm1h
X21hbmFnZXI7Ci0JZHJtX3ZtYV9vZmZzZXRfbWFuYWdlcl9pbml0KCZiZGV2LT5fdm1hX21hbmFn
ZXIsCi0JCQkJICAgIERSTV9GSUxFX1BBR0VfT0ZGU0VUX1NUQVJULAotCQkJCSAgICBEUk1fRklM
RV9QQUdFX09GRlNFVF9TSVpFKTsKIAlJTklUX0RFTEFZRURfV09SSygmYmRldi0+d3EsIHR0bV9i
b19kZWxheWVkX3dvcmtxdWV1ZSk7CiAJSU5JVF9MSVNUX0hFQUQoJmJkZXYtPmRkZXN0cm95KTsK
IAliZGV2LT5kZXZfbWFwcGluZyA9IG1hcHBpbmc7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
