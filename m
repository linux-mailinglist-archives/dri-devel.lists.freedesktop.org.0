Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E605D2EA087
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 00:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1D189F45;
	Mon,  4 Jan 2021 23:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E862589F45
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 23:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609802056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qcr+V+ZzWmuyUiEv86hTgVkm+OX5/DeK7Xm8ydOFOHo=;
 b=JoGxBy9fIOxyusA0rjgQHgdDRCKgyTUCwJDg9pngU1iqt1dfJqH0Fza+/MQmpmQQ3sDA1F
 Cnb8vReuNKD83pH0XrDxibuxA+tUE36v4AfVgjNI9T4ziG2Rv7i5KfXRKMU/FRKOF2PTlv
 we4Pj5u5UinNRwSoc6Dvd1/aqdEnjjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-kQ7xorzTMUOHBYFG6q1E_Q-1; Mon, 04 Jan 2021 18:14:15 -0500
X-MC-Unique: kQ7xorzTMUOHBYFG6q1E_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E644F59;
 Mon,  4 Jan 2021 23:14:13 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-117-65.rdu2.redhat.com [10.10.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A4825C8AA;
 Mon,  4 Jan 2021 23:14:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Remove pinned bos from LRU in
 ttm_bo_move_to_lru_tail()
Date: Mon,  4 Jan 2021 18:13:58 -0500
Message-Id: <20210104231358.154521-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Huang Rui <ray.huang@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVjZW50bHkgYSByZWdyZXNzaW9uIHdhcyBpbnRyb2R1Y2VkIHdoaWNoIGNhdXNlZCBUVE0ncyBi
dWZmZXIgZXZpY3Rpb24gdG8KYXR0ZW1wdCB0byBldmljdCBhbHJlYWR5LXBpbm5lZCBCT3MsIGNh
dXNpbmcgaXNzdWVzIHdpdGggYnVmZmVyIGV2aWN0aW9uCnVuZGVyIG1lbW9yeSBwcmVzc3VyZSBh
bG9uZyB3aXRoIHN1c3BlbmQvcmVzdW1lOgoKICBub3V2ZWF1IDAwMDA6MWY6MDAuMDogRFJNOiBl
dmljdGluZyBidWZmZXJzLi4uCiAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IERSTTogTW92aW5nIHBp
bm5lZCBvYmplY3QgMDAwMDAwMDBjNDI4YzNmZiEKICBub3V2ZWF1IDAwMDA6MWY6MDAuMDogZmlm
bzogZmF1bHQgMDAgW1JFQURdIGF0IDAwMDAwMDAwMDAyMDAwMDAgZW5naW5lIDA0CiAgW0JBUjFd
IGNsaWVudCAwNyBbSFVCL0hPU1RfQ1BVXSByZWFzb24gMDIgW1BURV0gb24gY2hhbm5lbCAtMSBb
MDBmZmVhYTAwMAogIHVua25vd25dCiAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IGZpZm86IERST1BQ
RURfTU1VX0ZBVUxUIDAwMDAxMDAwCiAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IGZpZm86IGZhdWx0
IDAxIFtXUklURV0gYXQgMDAwMDAwMDAwMDAyMDAwMCBlbmdpbmUKICAwYyBbSE9TVDZdIGNsaWVu
dCAwNyBbSFVCL0hPU1RfQ1BVXSByZWFzb24gMDIgW1BURV0gb24gY2hhbm5lbCAxCiAgWzAwZmZi
MjgwMDAgRFJNXQogIG5vdXZlYXUgMDAwMDoxZjowMC4wOiBmaWZvOiBjaGFubmVsIDE6IGtpbGxl
ZAogIG5vdXZlYXUgMDAwMDoxZjowMC4wOiBmaWZvOiBydW5saXN0IDA6IHNjaGVkdWxlZCBmb3Ig
cmVjb3ZlcnkKICBbVFRNXSBCdWZmZXIgZXZpY3Rpb24gZmFpbGVkCiAgbm91dmVhdSAwMDAwOjFm
OjAwLjA6IERSTTogd2FpdGluZyBmb3Iga2VybmVsIGNoYW5uZWxzIHRvIGdvIGlkbGUuLi4KICBu
b3V2ZWF1IDAwMDA6MWY6MDAuMDogRFJNOiBmYWlsZWQgdG8gaWRsZSBjaGFubmVsIDEgW0RSTV0K
ICBub3V2ZWF1IDAwMDA6MWY6MDAuMDogRFJNOiByZXN1bWluZyBkaXNwbGF5Li4uCgpBZnRlciBz
b21lIGJpc2VjdGlvbiBhbmQgaW52ZXN0aWdhdGlvbiwgaXQgYXBwZWFycyB0aGlzIHJlc3VsdGVk
IGZyb20gdGhlCnJlY2VudCBjaGFuZ2VzIHRvIHR0bV9ib19tb3ZlX3RvX2xydV90YWlsKCkuIFBy
ZXZpb3VzbHkgd2hlbiBhIGJ1ZmZlciB3YXMKcGlubmVkLCB0aGUgYnVmZmVyIHdvdWxkIGJlIHJl
bW92ZWQgZnJvbSB0aGUgTFJVIG9uY2UgdHRtX2JvX3VucmVzZXJ2ZQp0byBtYWludGFpbiB0aGUg
TFJVIGxpc3Qgd2hlbiBwaW5uaW5nIG9yIHVucGlubmluZyBCT3MuIEhvd2V2ZXIsIHNpbmNlOgoK
Y29tbWl0IDNkMWE4OGUxMDUxZiAoImRybS90dG06IGNsZWFudXAgTFJVIGhhbmRsaW5nIGZ1cnRo
ZXIiKQoKV2UndmUgYmVlbiBleGl0aW5nIGZyb20gdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwoKSBh
dCB0aGUgdmVyeSBiZWdpbm5pbmcgb2YKdGhlIGZ1bmN0aW9uIGlmIHRoZSBibyB3ZSdyZSBsb29r
aW5nIGF0IGlzIHBpbm5lZCwgcmVzdWx0aW5nIGluIHRoZSBwaW5uZWQKQk8gbmV2ZXIgZ2V0dGlu
ZyByZW1vdmVkIGZyb20gdGhlIGxydSBhbmQgYXMgYSByZXN1bHQgLSBjYXVzaW5nIGlzc3VlcyB3
aGVuCml0IGV2ZW50dWFsbHkgYmVjb21lcyB0aW1lIGZvciBldmljdGlvbi4KClNvLCBsZXQncyBm
aXggdGhpcyBieSBjYWxsaW5nIHR0bV9ib19kZWxfZnJvbV9scnUoKSBmcm9tCnR0bV9ib19tb3Zl
X3RvX2xydV90YWlsKCkgaW4gdGhlIGV2ZW50IHRoYXQgd2UncmUgZGVhbGluZyB3aXRoIGEgcGlu
bmVkCmJ1ZmZlci4gQXMgd2VsbCwgYWRkIGJhY2sgdGhlIGh1bmtzIGluIHR0bV9ib19kZWxfZnJv
bV9scnUoKSB0aGF0IHdlcmUKcmVtb3ZlZCB3aGljaCBjaGVja2VkIHdoZXRoZXIgd2Ugd2FudCB0
byBjYWxsCmJkZXYtPmRyaXZlci0+ZGVsX2Zyb21fbHJ1X25vdGlmeSgpIG9yIG5vdC4gV2UgZG8g
dGhpcyBsYXN0IHBhcnQgdG8gYXZvaWQKY2FsbGluZyB0aGUgaG9vayB3aGVuIHRoZSBibyBpbiBx
dWVzdGlvbiB3YXMgYWxyZWFkeSByZW1vdmVkIGZyb20gdGhlIExSVS4KClNpZ25lZC1vZmYtYnk6
IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkZpeGVzOiAzZDFhODhlMTA1MWYgKCJkcm0v
dHRtOiBjbGVhbnVwIExSVSBoYW5kbGluZyBmdXJ0aGVyIikKQ2M6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhh
dC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDIwICsrKysrKysrKysr
KysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCAzMWU4YjNkYTU1NjMuLjBmMzczYjc4ZTdmYSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jCkBAIC0xMTMsMTEgKzExMywxOCBAQCBzdGF0aWMgc3RydWN0IGtvYmpf
dHlwZSB0dG1fYm9fZ2xvYl9rb2JqX3R5cGUgID0gewogc3RhdGljIHZvaWQgdHRtX2JvX2RlbF9m
cm9tX2xydShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQogewogCXN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2ID0gYm8tPmJkZXY7CisJYm9vbCBub3RpZnkgPSBmYWxzZTsKIAotCWxpc3Rf
ZGVsX2luaXQoJmJvLT5zd2FwKTsKLQlsaXN0X2RlbF9pbml0KCZiby0+bHJ1KTsKKwlpZiAoIWxp
c3RfZW1wdHkoJmJvLT5zd2FwKSkgeworCQlub3RpZnkgPSB0cnVlOworCQlsaXN0X2RlbF9pbml0
KCZiby0+c3dhcCk7CisJfQorCWlmICghbGlzdF9lbXB0eSgmYm8tPmxydSkpIHsKKwkJbm90aWZ5
ID0gdHJ1ZTsKKwkJbGlzdF9kZWxfaW5pdCgmYm8tPmxydSk7CisJfQogCi0JaWYgKGJkZXYtPmRy
aXZlci0+ZGVsX2Zyb21fbHJ1X25vdGlmeSkKKwlpZiAobm90aWZ5ICYmIGJkZXYtPmRyaXZlci0+
ZGVsX2Zyb21fbHJ1X25vdGlmeSkKIAkJYmRldi0+ZHJpdmVyLT5kZWxfZnJvbV9scnVfbm90aWZ5
KGJvKTsKIH0KIApAQCAtMTM4LDggKzE0NSwxMyBAQCB2b2lkIHR0bV9ib19tb3ZlX3RvX2xydV90
YWlsKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAKIAlkbWFfcmVzdl9hc3NlcnRfaGVs
ZChiby0+YmFzZS5yZXN2KTsKIAotCWlmIChiby0+cGluX2NvdW50KQorCS8qIFBpbm5lZCBib3Mg
d2lsbCBoYXZlIGJlZW4gYWRkZWQgdG8gdGhlIExSVSBiZWZvcmUgdGhleSB3ZXJlIHBpbm5lZCwg
c28gbWFrZSBzdXJlIHdlCisJICogYWx3YXlzIHJlbW92ZSB0aGVtIGhlcmUKKwkgKi8KKwlpZiAo
Ym8tPnBpbl9jb3VudCkgeworCQl0dG1fYm9fZGVsX2Zyb21fbHJ1KGJvKTsKIAkJcmV0dXJuOwor
CX0KIAogCW1hbiA9IHR0bV9tYW5hZ2VyX3R5cGUoYmRldiwgbWVtLT5tZW1fdHlwZSk7CiAJbGlz
dF9tb3ZlX3RhaWwoJmJvLT5scnUsICZtYW4tPmxydVtiby0+cHJpb3JpdHldKTsKLS0gCjIuMjku
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
