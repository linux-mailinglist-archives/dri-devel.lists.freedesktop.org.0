Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340BF596BC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 11:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D9A6E8A1;
	Fri, 28 Jun 2019 09:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E136E89A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 09:03:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 449A583F3C;
 Fri, 28 Jun 2019 09:03:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4676E1001B12;
 Fri, 28 Jun 2019 09:03:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7CD4C17472; Fri, 28 Jun 2019 11:03:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/18] drm/ttm: add gem base object
Date: Fri, 28 Jun 2019 11:02:46 +0200
Message-Id: <20190628090303.29467-2-kraxel@redhat.com>
In-Reply-To: <20190628090303.29467-1-kraxel@redhat.com>
References: <20190628090303.29467-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 28 Jun 2019 09:03:11 +0000 (UTC)
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
Cc: thomas@shipmail.org, tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 ckoenig.leichtzumerken@gmail.com, open list <linux-kernel@vger.kernel.org>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>, bskeggs@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRybV9nZW1fb2JqZWN0IHN0cnVjdCB0byB0dG1fYnVmZmVyX29iamVjdCwgc28gdHRtIG9i
amVjdHMgYXJlIGEgZ2RtCm9iamVjdCBzdXBlcmNsYXNzLiAgQWRkIGEgZnVuY3Rpb24gdG8gY2hl
Y2sgd2hlbmV2ZXIgYSBnaXZlbiBibyBhY3R1YWxseQp1c2VzIHRoZSBlbWJlZGRlZCBkcm1fZ2Vt
X29iamVjdCwgZm9yIHRoZSB0cmFuc2l0aW9uIHBlcmlvZC4KClNpZ25lZC1vZmYtYnk6IEdlcmQg
SG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9f
YXBpLmggfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oIGIv
aW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAppbmRleCA0OWQ5Y2RmYzU4ZjIuLjA4MjU1MGNh
YzkyYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAorKysgYi9pbmNs
dWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCkBAIC0zMSw2ICszMSw3IEBACiAjaWZuZGVmIF9UVE1f
Qk9fQVBJX0hfCiAjZGVmaW5lIF9UVE1fQk9fQVBJX0hfCiAKKyNpbmNsdWRlIDxkcm0vZHJtX2dl
bS5oPgogI2luY2x1ZGUgPGRybS9kcm1faGFzaHRhYi5oPgogI2luY2x1ZGUgPGRybS9kcm1fdm1h
X21hbmFnZXIuaD4KICNpbmNsdWRlIDxsaW51eC9rcmVmLmg+CkBAIC0xMjcsNiArMTI4LDcgQEAg
c3RydWN0IHR0bV90dDsKIC8qKgogICogc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0CiAgKgorICog
QGJhc2U6IGRybV9nZW1fb2JqZWN0IHN1cGVyY2xhc3MgZGF0YS4KICAqIEBiZGV2OiBQb2ludGVy
IHRvIHRoZSBidWZmZXIgb2JqZWN0IGRldmljZSBzdHJ1Y3R1cmUuCiAgKiBAdHlwZTogVGhlIGJv
IHR5cGUuCiAgKiBAZGVzdHJveTogRGVzdHJ1Y3Rpb24gZnVuY3Rpb24uIElmIE5VTEwsIGtmcmVl
IGlzIHVzZWQuCkBAIC0xNjksNiArMTcxLDggQEAgc3RydWN0IHR0bV90dDsKICAqLwogCiBzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgeworCXN0cnVjdCBkcm1fZ2VtX29iamVjdCBiYXNlOworCiAJ
LyoqCiAJICogTWVtYmVycyBjb25zdGFudCBhdCBpbml0LgogCSAqLwpAQCAtNzY4LDQgKzc3Miwy
MyBAQCBpbnQgdHRtX2JvX3N3YXBvdXQoc3RydWN0IHR0bV9ib19nbG9iYWwgKmdsb2IsCiAJCQlz
dHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCk7CiB2b2lkIHR0bV9ib19zd2Fwb3V0X2FsbChz
dHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldik7CiBpbnQgdHRtX2JvX3dhaXRfdW5yZXNlcnZlZChz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKTsKKworLyoqCisgKiB0dG1fYm9fdXNlc19lbWJl
ZGRlZF9nZW1fb2JqZWN0IC0gY2hlY2sgaWYgdGhlIGdpdmVuIGJvIHVzZXMgdGhlCisgKiBlbWJl
ZGRlZCBkcm1fZ2VtX29iamVjdC4KKyAqCisgKiBNb3N0IHR0bSBkcml2ZXJzIGFyZSB1c2luZyBn
ZW0gdG9vLCBzbyB0aGUgZW1iZWRkZWQKKyAqIHR0bV9idWZmZXJfb2JqZWN0LmJhc2Ugd2lsbCBi
ZSBpbml0aWFsaXplZCBieSB0aGUgZHJpdmVyIChiZWZvcmUKKyAqIGNhbGxpbmcgdHRtX2JvX2lu
aXQpLiAgSXQgaXMgYWxzbyBwb3NzaWJsZSB0byB1c2UgdHRtIHdpdGhvdXQgZ2VtCisgKiB0aG91
Z2ggKHZtd2dmeCBkb2VzIHRoYXQpLgorICoKKyAqIFRoaXMgaGVscGVyIHdpbGwgZmlndXJlIHdo
ZW5ldmVyIGEgZ2l2ZW4gdHRtIGJvIGlzIGEgZ2VtIG9iamVjdCB0b28KKyAqIG9yIG5vdC4KKyAq
CisgKiBAYm86IFRoZSBibyB0byBjaGVjay4KKyAqLworc3RhdGljIGlubGluZSBib29sIHR0bV9i
b191c2VzX2VtYmVkZGVkX2dlbV9vYmplY3Qoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykK
K3sKKwlyZXR1cm4gYm8tPmJhc2UuZGV2ICE9IE5VTEw7Cit9CiAjZW5kaWYKLS0gCjIuMTguMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
