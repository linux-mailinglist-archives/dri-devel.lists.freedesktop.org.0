Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBB923B2EB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CD66E3A2;
	Tue,  4 Aug 2020 02:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EB26E3A6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:20 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-NNSj8g1OM2eWwHwhPiTl9Q-1; Mon, 03 Aug 2020 22:57:15 -0400
X-MC-Unique: NNSj8g1OM2eWwHwhPiTl9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8770C91270;
 Tue,  4 Aug 2020 02:57:14 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE3EA8AD1C;
 Tue,  4 Aug 2020 02:57:12 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/59] drm/ttm: provide a driver-led init path for range mm
 manager. (v2)
Date: Tue,  4 Aug 2020 12:55:47 +1000
Message-Id: <20200804025632.3868079-15-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClRoaXMgbGV0cyB0aGUgZ2Vu
ZXJpYyByYW5nZSBtbSBtYW5hZ2VyIGJlIGluaXRpYWxpc2VkIGJ5IHRoZSBkcml2ZXIuCgp2Mjog
YWRkIGRvY3MuCnJlbmFtZSBhcGkgdG8gcmFuZ2VfbWFuX2luaXQgZm9yIG5vdy4KCnYxLVJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm9fbWFuYWdlci5jIHwgMjMgKysrKysrKysrKysrKysrKysrKystLS0K
IGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggICAgICB8IDE0ICsrKysrKysrKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fbWFuYWdlci5jIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm9fbWFuYWdlci5jCmluZGV4IGZhY2QzMDQ5YzNhYS4uZWI4NmM4Njk0
ZjQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib19tYW5hZ2VyLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fbWFuYWdlci5jCkBAIC0xMDQsOCArMTA0LDgg
QEAgc3RhdGljIHZvaWQgdHRtX2JvX21hbl9wdXRfbm9kZShzdHJ1Y3QgdHRtX21lbV90eXBlX21h
bmFnZXIgKm1hbiwKIAl9CiB9CiAKLXN0YXRpYyBpbnQgdHRtX2JvX21hbl9pbml0KHN0cnVjdCB0
dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAotCQkJICAgdW5zaWduZWQgbG9uZyBwX3NpemUpCitz
dGF0aWMgaW50IHR0bV9ib19tYW5faW5pdF9wcml2YXRlKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFu
YWdlciAqbWFuLAorCQkJCSAgIHVuc2lnbmVkIGxvbmcgcF9zaXplKQogewogCXN0cnVjdCB0dG1f
cmFuZ2VfbWFuYWdlciAqcm1hbjsKIApAQCAtMTE5LDYgKzExOSwyMyBAQCBzdGF0aWMgaW50IHR0
bV9ib19tYW5faW5pdChzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKIAlyZXR1cm4g
MDsKIH0KIAoraW50IHR0bV9yYW5nZV9tYW5faW5pdChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRl
diwKKwkJICAgICAgIHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAorCQkgICAgICAg
dW5zaWduZWQgbG9uZyBwX3NpemUpCit7CisJaW50IHJldDsKKworCW1hbi0+ZnVuYyA9ICZ0dG1f
Ym9fbWFuYWdlcl9mdW5jOworCisJdHRtX21lbV90eXBlX21hbmFnZXJfaW5pdChiZGV2LCBtYW4s
IHBfc2l6ZSk7CisJcmV0ID0gdHRtX2JvX21hbl9pbml0X3ByaXZhdGUobWFuLCBwX3NpemUpOwor
CWlmIChyZXQpCisJCXJldHVybiByZXQ7CisJdHRtX21lbV90eXBlX21hbmFnZXJfc2V0X3VzZWQo
bWFuLCB0cnVlKTsKKwlyZXR1cm4gMDsKK30KK0VYUE9SVF9TWU1CT0wodHRtX3JhbmdlX21hbl9p
bml0KTsKKwogc3RhdGljIGludCB0dG1fYm9fbWFuX3Rha2Vkb3duKHN0cnVjdCB0dG1fbWVtX3R5
cGVfbWFuYWdlciAqbWFuKQogewogCXN0cnVjdCB0dG1fcmFuZ2VfbWFuYWdlciAqcm1hbiA9IChz
dHJ1Y3QgdHRtX3JhbmdlX21hbmFnZXIgKikgbWFuLT5wcml2OwpAQCAtMTQ3LDcgKzE2NCw3IEBA
IHN0YXRpYyB2b2lkIHR0bV9ib19tYW5fZGVidWcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2Vy
ICptYW4sCiB9CiAKIGNvbnN0IHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9mdW5jIHR0bV9i
b19tYW5hZ2VyX2Z1bmMgPSB7Ci0JLmluaXQgPSB0dG1fYm9fbWFuX2luaXQsCisJLmluaXQgPSB0
dG1fYm9fbWFuX2luaXRfcHJpdmF0ZSwKIAkudGFrZWRvd24gPSB0dG1fYm9fbWFuX3Rha2Vkb3du
LAogCS5nZXRfbm9kZSA9IHR0bV9ib19tYW5fZ2V0X25vZGUsCiAJLnB1dF9ub2RlID0gdHRtX2Jv
X21hbl9wdXRfbm9kZSwKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVy
LmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCmluZGV4IDZiNDljMDM1NjM0My4u
MzY3MmRlYTNlZGNhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5o
CisrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKQEAgLTgwOCw2ICs4MDgsMjAg
QEAgaW50IHR0bV9ib19waXBlbGluZV9ndXR0aW5nKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8pOwogICovCiBwZ3Byb3RfdCB0dG1faW9fcHJvdCh1aW50MzJfdCBjYWNoaW5nX2ZsYWdzLCBw
Z3Byb3RfdCB0bXApOwogCisvKioKKyAqIHR0bV9yYW5nZV9tYW5faW5pdAorICoKKyAqIEBiZGV2
OiB0dG0gZGV2aWNlCisgKiBAbWFuOiB0aGUgbWFuYWdlciB0byBpbml0aWFsaXNlIHdpdGggdGhl
IHJhbmdlIG1hbmFnZXIuCisgKiBAcF9zaXplOiBzaXplIG9mIGFyZWEgdG8gYmUgbWFuYWdlZCBp
biBwYWdlcy4KKyAqCisgKiBJbml0aWFsaXNlIGEgZ2VuZXJpYyByYW5nZSBtYW5hZ2VyIGZvciB0
aGUgc2VsZWN0ZWQgbWVtb3J5IHR5cGUuCisgKiBUaGUgcmFuZ2UgbWFuYWdlciBpcyBpbnN0YWxs
ZWQgZm9yIHRoaXMgZGV2aWNlIGluIHRoZSB0eXBlIHNsb3QuCisgKi8KK2ludCB0dG1fcmFuZ2Vf
bWFuX2luaXQoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCisJCSAgICAgICBzdHJ1Y3QgdHRt
X21lbV90eXBlX21hbmFnZXIgKm1hbiwKKwkJICAgICAgIHVuc2lnbmVkIGxvbmcgcF9zaXplKTsK
KwogZXh0ZXJuIGNvbnN0IHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9mdW5jIHR0bV9ib19t
YW5hZ2VyX2Z1bmM7CiAKIC8qKgotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
