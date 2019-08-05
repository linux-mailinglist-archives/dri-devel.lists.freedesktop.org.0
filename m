Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7C481E5F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 16:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7DE6E45D;
	Mon,  5 Aug 2019 14:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A73B6E45D;
 Mon,  5 Aug 2019 14:01:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6983CEB9CC;
 Mon,  5 Aug 2019 14:01:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA7B764024;
 Mon,  5 Aug 2019 14:01:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB34617444; Mon,  5 Aug 2019 16:01:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 01/17] drm/ttm: add gem base object
Date: Mon,  5 Aug 2019 16:01:03 +0200
Message-Id: <20190805140119.7337-2-kraxel@redhat.com>
In-Reply-To: <20190805140119.7337-1-kraxel@redhat.com>
References: <20190805140119.7337-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 05 Aug 2019 14:01:22 +0000 (UTC)
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
Cc: thomas@shipmail.org, David Airlie <airlied@linux.ie>,
 ckoenig.leichtzumerken@gmail.com, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Huang Rui <ray.huang@amd.com>,
 bskeggs@redhat.com, tzimmermann@suse.de,
 Christian Koenig <christian.koenig@amd.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRybV9nZW1fb2JqZWN0IHN0cnVjdCB0byB0dG1fYnVmZmVyX29iamVjdCwgc28gdHRtIG9i
amVjdHMgYXJlIGEgZ2RtCm9iamVjdCBzdXBlcmNsYXNzLiAgQWRkIGEgZnVuY3Rpb24gdG8gY2hl
Y2sgd2hlbmV2ZXIgYSBnaXZlbiBibyBhY3R1YWxseQp1c2VzIHRoZSBlbWJlZGRlZCBkcm1fZ2Vt
X29iamVjdC4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29t
PgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgotLS0KIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggfCAyMyArKysrKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGku
aAppbmRleCA0OWQ5Y2RmYzU4ZjIuLjA4MjU1MGNhYzkyYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9k
cm0vdHRtL3R0bV9ib19hcGkuaAorKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCkBA
IC0zMSw2ICszMSw3IEBACiAjaWZuZGVmIF9UVE1fQk9fQVBJX0hfCiAjZGVmaW5lIF9UVE1fQk9f
QVBJX0hfCiAKKyNpbmNsdWRlIDxkcm0vZHJtX2dlbS5oPgogI2luY2x1ZGUgPGRybS9kcm1faGFz
aHRhYi5oPgogI2luY2x1ZGUgPGRybS9kcm1fdm1hX21hbmFnZXIuaD4KICNpbmNsdWRlIDxsaW51
eC9rcmVmLmg+CkBAIC0xMjcsNiArMTI4LDcgQEAgc3RydWN0IHR0bV90dDsKIC8qKgogICogc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0CiAgKgorICogQGJhc2U6IGRybV9nZW1fb2JqZWN0IHN1cGVy
Y2xhc3MgZGF0YS4KICAqIEBiZGV2OiBQb2ludGVyIHRvIHRoZSBidWZmZXIgb2JqZWN0IGRldmlj
ZSBzdHJ1Y3R1cmUuCiAgKiBAdHlwZTogVGhlIGJvIHR5cGUuCiAgKiBAZGVzdHJveTogRGVzdHJ1
Y3Rpb24gZnVuY3Rpb24uIElmIE5VTEwsIGtmcmVlIGlzIHVzZWQuCkBAIC0xNjksNiArMTcxLDgg
QEAgc3RydWN0IHR0bV90dDsKICAqLwogCiBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgeworCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCBiYXNlOworCiAJLyoqCiAJICogTWVtYmVycyBjb25zdGFudCBh
dCBpbml0LgogCSAqLwpAQCAtNzY4LDQgKzc3MiwyMyBAQCBpbnQgdHRtX2JvX3N3YXBvdXQoc3Ry
dWN0IHR0bV9ib19nbG9iYWwgKmdsb2IsCiAJCQlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0
eCk7CiB2b2lkIHR0bV9ib19zd2Fwb3V0X2FsbChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldik7
CiBpbnQgdHRtX2JvX3dhaXRfdW5yZXNlcnZlZChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJv
KTsKKworLyoqCisgKiB0dG1fYm9fdXNlc19lbWJlZGRlZF9nZW1fb2JqZWN0IC0gY2hlY2sgaWYg
dGhlIGdpdmVuIGJvIHVzZXMgdGhlCisgKiBlbWJlZGRlZCBkcm1fZ2VtX29iamVjdC4KKyAqCisg
KiBNb3N0IHR0bSBkcml2ZXJzIGFyZSB1c2luZyBnZW0gdG9vLCBzbyB0aGUgZW1iZWRkZWQKKyAq
IHR0bV9idWZmZXJfb2JqZWN0LmJhc2Ugd2lsbCBiZSBpbml0aWFsaXplZCBieSB0aGUgZHJpdmVy
IChiZWZvcmUKKyAqIGNhbGxpbmcgdHRtX2JvX2luaXQpLiAgSXQgaXMgYWxzbyBwb3NzaWJsZSB0
byB1c2UgdHRtIHdpdGhvdXQgZ2VtCisgKiB0aG91Z2ggKHZtd2dmeCBkb2VzIHRoYXQpLgorICoK
KyAqIFRoaXMgaGVscGVyIHdpbGwgZmlndXJlIHdoZW5ldmVyIGEgZ2l2ZW4gdHRtIGJvIGlzIGEg
Z2VtIG9iamVjdCB0b28KKyAqIG9yIG5vdC4KKyAqCisgKiBAYm86IFRoZSBibyB0byBjaGVjay4K
KyAqLworc3RhdGljIGlubGluZSBib29sIHR0bV9ib191c2VzX2VtYmVkZGVkX2dlbV9vYmplY3Qo
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKK3sKKwlyZXR1cm4gYm8tPmJhc2UuZGV2ICE9
IE5VTEw7Cit9CiAjZW5kaWYKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
