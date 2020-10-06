Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF28284328
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 02:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3786E1BC;
	Tue,  6 Oct 2020 00:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F186E1BB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 00:06:58 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-HDU4bPbSNfeFAvbtlH8gZg-1; Mon, 05 Oct 2020 20:06:55 -0400
X-MC-Unique: HDU4bPbSNfeFAvbtlH8gZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90D481DDF8;
 Tue,  6 Oct 2020 00:06:54 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A8E37AEC4;
 Tue,  6 Oct 2020 00:06:53 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/vram_helper: implement a ttm move callback.
Date: Tue,  6 Oct 2020 10:06:43 +1000
Message-Id: <20201006000644.1005758-5-airlied@gmail.com>
In-Reply-To: <20201006000644.1005758-1-airlied@gmail.com>
References: <20201006000644.1005758-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: christian.koenig@amd.com, rscheidegger.oss@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClRoaXMgd2lsbCBhbHdheXMg
ZG8gbWVtY3B5IG1vdmVzLgoKQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgMjEgKysr
KysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCmluZGV4IDNmZTRiMzI2ZTE4ZS4uMzIxMzQy
OWY4NDQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKQEAgLTU4OCw2ICs1
ODgsMTQgQEAgc3RhdGljIHZvaWQgZHJtX2dlbV92cmFtX2JvX2RyaXZlcl9tb3ZlX25vdGlmeShz
dHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCAqZ2JvLAogCWttYXAtPnZpcnR1YWwgPSBOVUxMOwog
fQogCitzdGF0aWMgaW50IGRybV9nZW1fdnJhbV9ib19kcml2ZXJfbW92ZShzdHJ1Y3QgZHJtX2dl
bV92cmFtX29iamVjdCAqZ2JvLAorCQkJCSAgICAgICBib29sIGV2aWN0LAorCQkJCSAgICAgICBz
dHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCwKKwkJCQkgICAgICAgc3RydWN0IHR0bV9yZXNv
dXJjZSAqbmV3X21lbSkKK3sKKwlyZXR1cm4gdHRtX2JvX21vdmVfbWVtY3B5KCZnYm8tPmJvLCBj
dHgsIG5ld19tZW0pOworfQorCiAvKgogICogSGVscGVycyBmb3Igc3RydWN0IGRybV9nZW1fb2Jq
ZWN0X2Z1bmNzCiAgKi8KQEAgLTk1MCw2ICs5NTgsMTggQEAgc3RhdGljIHZvaWQgYm9fZHJpdmVy
X21vdmVfbm90aWZ5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJZHJtX2dlbV92cmFt
X2JvX2RyaXZlcl9tb3ZlX25vdGlmeShnYm8sIGV2aWN0LCBuZXdfbWVtKTsKIH0KIAorc3RhdGlj
IGludCBib19kcml2ZXJfbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAorCQkJICBi
b29sIGV2aWN0LAorCQkJICBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCwKKwkJCSAgc3Ry
dWN0IHR0bV9yZXNvdXJjZSAqbmV3X21lbSkKK3sKKwlzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVj
dCAqZ2JvOworCisJZ2JvID0gZHJtX2dlbV92cmFtX29mX2JvKGJvKTsKKworCXJldHVybiBkcm1f
Z2VtX3ZyYW1fYm9fZHJpdmVyX21vdmUoZ2JvLCBldmljdCwgY3R4LCBuZXdfbWVtKTsKK30KKwog
c3RhdGljIGludCBib19kcml2ZXJfaW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYsCiAJCQkJICAgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKm1lbSkKIHsKQEAgLTk3NCw2ICs5
OTQsNyBAQCBzdGF0aWMgc3RydWN0IHR0bV9ib19kcml2ZXIgYm9fZHJpdmVyID0gewogCS50dG1f
dHRfZGVzdHJveSA9IGJvX2RyaXZlcl90dG1fdHRfZGVzdHJveSwKIAkuZXZpY3Rpb25fdmFsdWFi
bGUgPSB0dG1fYm9fZXZpY3Rpb25fdmFsdWFibGUsCiAJLmV2aWN0X2ZsYWdzID0gYm9fZHJpdmVy
X2V2aWN0X2ZsYWdzLAorCS5tb3ZlID0gYm9fZHJpdmVyX21vdmUsCiAJLm1vdmVfbm90aWZ5ID0g
Ym9fZHJpdmVyX21vdmVfbm90aWZ5LAogCS5pb19tZW1fcmVzZXJ2ZSA9IGJvX2RyaXZlcl9pb19t
ZW1fcmVzZXJ2ZSwKIH07Ci0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
