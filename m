Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 204A423B2F2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EC16E3B2;
	Tue,  4 Aug 2020 02:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AA06E3B2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:37 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-3TYKwblvPsKLSFsMJWkQ0Q-1; Mon, 03 Aug 2020 22:57:34 -0400
X-MC-Unique: 3TYKwblvPsKLSFsMJWkQ0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B74008015F4;
 Tue,  4 Aug 2020 02:57:33 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 170C990E68;
 Tue,  4 Aug 2020 02:57:31 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 22/59] drm/ttm: convert system manager init to new code.
Date: Tue,  4 Aug 2020 12:55:55 +1000
Message-Id: <20200804025632.3868079-23-airlied@gmail.com>
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

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClJlbW92ZSB0aGUgZXhpdCBw
YXRoLCBzaW5jZSB0aGlzIGNhbid0IGZhaWwgbm93LgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJs
aWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
IHwgMzAgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcg
aW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKaW5kZXggMzAw
YmNjMTA2OTZhLi5jNTZjYmM2YzBiYTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwpAQCAtMTY1MCw2ICsx
NjUwLDIyIEBAIGludCB0dG1fYm9fZGV2aWNlX3JlbGVhc2Uoc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYpCiB9CiBFWFBPUlRfU1lNQk9MKHR0bV9ib19kZXZpY2VfcmVsZWFzZSk7CiAKK3N0YXRp
YyB2b2lkIHR0bV9ib19pbml0X3N5c21hbihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikKK3sK
KwlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9ICZiZGV2LT5tYW5bVFRNX1BMX1NZ
U1RFTV07CisKKwkvKgorCSAqIEluaXRpYWxpemUgdGhlIHN5c3RlbSBtZW1vcnkgYnVmZmVyIHR5
cGUuCisJICogT3RoZXIgdHlwZXMgbmVlZCB0byBiZSBkcml2ZXIgLyBJT0NUTCBpbml0aWFsaXpl
ZC4KKwkgKi8KKwltYW4tPnVzZV90dCA9IHRydWU7CisJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9
IFRUTV9QTF9NQVNLX0NBQ0hJTkc7CisJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExfRkxB
R19DQUNIRUQ7CisKKwl0dG1fbWVtX3R5cGVfbWFuYWdlcl9pbml0KGJkZXYsIG1hbiwgMCk7CisJ
dHRtX21lbV90eXBlX21hbmFnZXJfc2V0X3VzZWQobWFuLCB0cnVlKTsKK30KKwogaW50IHR0bV9i
b19kZXZpY2VfaW5pdChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAkJICAgICAgIHN0cnVj
dCB0dG1fYm9fZHJpdmVyICpkcml2ZXIsCiAJCSAgICAgICBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAq
bWFwcGluZywKQEAgLTE2NzAsMTYgKzE2ODYsNyBAQCBpbnQgdHRtX2JvX2RldmljZV9pbml0KHN0
cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAogCiAJbWVtc2V0KGJkZXYtPm1hbiwgMCwgc2l6ZW9m
KGJkZXYtPm1hbikpOwogCi0JLyoKLQkgKiBJbml0aWFsaXplIHRoZSBzeXN0ZW0gbWVtb3J5IGJ1
ZmZlciB0eXBlLgotCSAqIE90aGVyIHR5cGVzIG5lZWQgdG8gYmUgZHJpdmVyIC8gSU9DVEwgaW5p
dGlhbGl6ZWQuCi0JICovCi0JYmRldi0+bWFuW1RUTV9QTF9TWVNURU1dLnVzZV90dCA9IHRydWU7
Ci0JYmRldi0+bWFuW1RUTV9QTF9TWVNURU1dLmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX01B
U0tfQ0FDSElORzsKLQliZGV2LT5tYW5bVFRNX1BMX1NZU1RFTV0uZGVmYXVsdF9jYWNoaW5nID0g
VFRNX1BMX0ZMQUdfQ0FDSEVEOwotCXJldCA9IHR0bV9ib19pbml0X21tKGJkZXYsIFRUTV9QTF9T
WVNURU0sIDApOwotCWlmICh1bmxpa2VseShyZXQgIT0gMCkpCi0JCWdvdG8gb3V0X25vX3N5czsK
Kwl0dG1fYm9faW5pdF9zeXNtYW4oYmRldik7CiAKIAliZGV2LT52bWFfbWFuYWdlciA9IHZtYV9t
YW5hZ2VyOwogCUlOSVRfREVMQVlFRF9XT1JLKCZiZGV2LT53cSwgdHRtX2JvX2RlbGF5ZWRfd29y
a3F1ZXVlKTsKQEAgLTE2OTEsOSArMTY5OCw2IEBAIGludCB0dG1fYm9fZGV2aWNlX2luaXQoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJbXV0ZXhfdW5sb2NrKCZ0dG1fZ2xvYmFsX211dGV4
KTsKIAogCXJldHVybiAwOwotb3V0X25vX3N5czoKLQl0dG1fYm9fZ2xvYmFsX3JlbGVhc2UoKTsK
LQlyZXR1cm4gcmV0OwogfQogRVhQT1JUX1NZTUJPTCh0dG1fYm9fZGV2aWNlX2luaXQpOwogCi0t
IAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
