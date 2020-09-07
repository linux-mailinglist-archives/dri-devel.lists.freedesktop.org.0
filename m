Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5023D2605E3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 22:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB316E4F4;
	Mon,  7 Sep 2020 20:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06D66E4F4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 20:46:56 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-8lnu-pDZMXCbsphHgbSZew-1; Mon, 07 Sep 2020 16:46:51 -0400
X-MC-Unique: 8lnu-pDZMXCbsphHgbSZew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 189831074647;
 Mon,  7 Sep 2020 20:46:50 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-45.bne.redhat.com
 [10.64.54.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 169D860BE2;
 Mon,  7 Sep 2020 20:46:45 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/13] drm/ttm: add optional bind/unbind via driver.
Date: Tue,  8 Sep 2020 06:46:19 +1000
Message-Id: <20200907204630.1406528-3-airlied@gmail.com>
In-Reply-To: <20200907204630.1406528-1-airlied@gmail.com>
References: <20200907204630.1406528-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0.0
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
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KCkkgd2FudCB0byByZW1vdmUg
dGhlIGJhY2tlbmQgZnVuY3MKClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJl
ZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyAgICB8IDE1ICsrKysr
KysrKysrLS0tCiBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIHwgMzYgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
dHQuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKaW5kZXggNTBhODk5MTA0MDIyLi43
M2M5N2RjZmE1MTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwpAQCAtMjIyLDcgKzIyMiwxMCBAQCB2b2lk
IHR0bV90dF9kZXN0cm95KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX3R0
ICp0dG0pCiAJCWZwdXQodHRtLT5zd2FwX3N0b3JhZ2UpOwogCiAJdHRtLT5zd2FwX3N0b3JhZ2Ug
PSBOVUxMOwotCXR0bS0+ZnVuYy0+ZGVzdHJveShiZGV2LCB0dG0pOworCWlmIChiZGV2LT5kcml2
ZXItPnR0bV90dF9kZXN0cm95KQorCQliZGV2LT5kcml2ZXItPnR0bV90dF9kZXN0cm95KGJkZXYs
IHR0bSk7CisJZWxzZQorCQl0dG0tPmZ1bmMtPmRlc3Ryb3koYmRldiwgdHRtKTsKIH0KIAogc3Rh
dGljIHZvaWQgdHRtX3R0X2luaXRfZmllbGRzKHN0cnVjdCB0dG1fdHQgKnR0bSwKQEAgLTMxMCw3
ICszMTMsMTAgQEAgRVhQT1JUX1NZTUJPTCh0dG1fZG1hX3R0X2ZpbmkpOwogdm9pZCB0dG1fdHRf
dW5iaW5kKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX3R0ICp0dG0pCiB7
CiAJaWYgKHR0bS0+c3RhdGUgPT0gdHRfYm91bmQpIHsKLQkJdHRtLT5mdW5jLT51bmJpbmQoYmRl
diwgdHRtKTsKKwkJaWYgKGJkZXYtPmRyaXZlci0+dHRtX3R0X3VuYmluZCkKKwkJCWJkZXYtPmRy
aXZlci0+dHRtX3R0X3VuYmluZChiZGV2LCB0dG0pOworCQllbHNlCisJCQl0dG0tPmZ1bmMtPnVu
YmluZChiZGV2LCB0dG0pOwogCQl0dG0tPnN0YXRlID0gdHRfdW5ib3VuZDsKIAl9CiB9CkBAIC0z
MzEsNyArMzM3LDEwIEBAIGludCB0dG1fdHRfYmluZChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRl
diwKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JcmV0ID0gdHRtLT5mdW5jLT5iaW5kKGJk
ZXYsIHR0bSwgYm9fbWVtKTsKKwlpZiAoYmRldi0+ZHJpdmVyLT50dG1fdHRfYmluZCkKKwkJcmV0
ID0gYmRldi0+ZHJpdmVyLT50dG1fdHRfYmluZChiZGV2LCB0dG0sIGJvX21lbSk7CisJZWxzZQor
CQlyZXQgPSB0dG0tPmZ1bmMtPmJpbmQoYmRldiwgdHRtLCBib19tZW0pOwogCWlmICh1bmxpa2Vs
eShyZXQgIT0gMCkpCiAJCXJldHVybiByZXQ7CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0
bS90dG1fYm9fZHJpdmVyLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCmluZGV4
IGViYmEyODI2NjdiYS4uMzJjMDY1MWNjMGZkIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS90dG0v
dHRtX2JvX2RyaXZlci5oCisrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKQEAg
LTkwLDYgKzkwLDQyIEBAIHN0cnVjdCB0dG1fYm9fZHJpdmVyIHsKIAkgKi8KIAl2b2lkICgqdHRt
X3R0X3VucG9wdWxhdGUpKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX3R0
ICp0dG0pOwogCisJLyoqCisJICogdHRtX3R0X2JpbmQKKwkgKgorCSAqIEBiZGV2OiBQb2ludGVy
IHRvIGEgdHRtIGRldmljZQorCSAqIEB0dG06IFBvaW50ZXIgdG8gYSBzdHJ1Y3QgdHRtX3R0Lgor
CSAqIEBib19tZW06IFBvaW50ZXIgdG8gYSBzdHJ1Y3QgdHRtX3Jlc291cmNlIGRlc2NyaWJpbmcg
dGhlCisJICogbWVtb3J5IHR5cGUgYW5kIGxvY2F0aW9uIGZvciBiaW5kaW5nLgorCSAqCisJICog
QmluZCB0aGUgYmFja2VuZCBwYWdlcyBpbnRvIHRoZSBhcGVydHVyZSBpbiB0aGUgbG9jYXRpb24K
KwkgKiBpbmRpY2F0ZWQgYnkgQGJvX21lbS4gVGhpcyBmdW5jdGlvbiBzaG91bGQgYmUgYWJsZSB0
byBoYW5kbGUKKwkgKiBkaWZmZXJlbmNlcyBiZXR3ZWVuIGFwZXJ0dXJlIGFuZCBzeXN0ZW0gcGFn
ZSBzaXplcy4KKwkgKi8KKwlpbnQgKCp0dG1fdHRfYmluZCkoc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYsIHN0cnVjdCB0dG1fdHQgKnR0bSwgc3RydWN0IHR0bV9yZXNvdXJjZSAqYm9fbWVtKTsK
KworCS8qKgorCSAqIHR0bV90dF91bmJpbmQKKwkgKgorCSAqIEBiZGV2OiBQb2ludGVyIHRvIGEg
dHRtIGRldmljZQorCSAqIEB0dG06IFBvaW50ZXIgdG8gYSBzdHJ1Y3QgdHRtX3R0LgorCSAqCisJ
ICogVW5iaW5kIHByZXZpb3VzbHkgYm91bmQgYmFja2VuZCBwYWdlcy4gVGhpcyBmdW5jdGlvbiBz
aG91bGQgYmUKKwkgKiBhYmxlIHRvIGhhbmRsZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIGFwZXJ0dXJl
IGFuZCBzeXN0ZW0gcGFnZSBzaXplcy4KKwkgKi8KKwl2b2lkICgqdHRtX3R0X3VuYmluZCkoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fdHQgKnR0bSk7CisKKwkvKioKKwkg
KiB0dG1fdHRfZGVzdHJveQorCSAqCisJICogQGJkZXY6IFBvaW50ZXIgdG8gYSB0dG0gZGV2aWNl
CisJICogQHR0bTogUG9pbnRlciB0byBhIHN0cnVjdCB0dG1fdHQuCisJICoKKwkgKiBEZXN0cm95
IHRoZSBiYWNrZW5kLiBUaGlzIHdpbGwgYmUgY2FsbCBiYWNrIGZyb20gdHRtX3R0X2Rlc3Ryb3kg
c28KKwkgKiBkb24ndCBjYWxsIHR0bV90dF9kZXN0cm95IGZyb20gdGhlIGNhbGxiYWNrIG9yIGlu
ZmluaXRlIGxvb3AuCisJICovCisJdm9pZCAoKnR0bV90dF9kZXN0cm95KShzdHJ1Y3QgdHRtX2Jv
X2RldmljZSAqYmRldiwgc3RydWN0IHR0bV90dCAqdHRtKTsKKwogCS8qKgogCSAqIHN0cnVjdCB0
dG1fYm9fZHJpdmVyIG1lbWJlciBldmljdGlvbl92YWx1YWJsZQogCSAqCi0tIAoyLjI3LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
