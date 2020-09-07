Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8622605E6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 22:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630E56E54C;
	Mon,  7 Sep 2020 20:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBCB6E4F8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 20:47:01 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-gUgwstHHMjOYhNSewtIZlQ-1; Mon, 07 Sep 2020 16:46:56 -0400
X-MC-Unique: gUgwstHHMjOYhNSewtIZlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BC4C801AE1;
 Mon,  7 Sep 2020 20:46:55 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-45.bne.redhat.com
 [10.64.54.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF7E960BF3;
 Mon,  7 Sep 2020 20:46:53 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/13] drm/ttm/agp: export bind/unbind/destroy for drivers to
 use.
Date: Tue,  8 Sep 2020 06:46:21 +1000
Message-Id: <20200907204630.1406528-5-airlied@gmail.com>
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

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERh
dmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYWdwX2JhY2tlbmQuYyB8IDE1ICsrKysrKysrKy0tLS0tLQogaW5jbHVkZS9kcm0vdHRtL3R0
bV90dC5oICAgICAgICAgICAgICB8ICA2ICsrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2FncF9iYWNrZW5kLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9hZ3BfYmFja2Vu
ZC5jCmluZGV4IDkzNGE2OTQ5MTU0Ny4uZmJmOThjZDFhM2U1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9hZ3BfYmFja2VuZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2FncF9iYWNrZW5kLmMKQEAgLTQ4LDggKzQ4LDggQEAgc3RydWN0IHR0bV9hZ3BfYmFja2Vu
ZCB7CiAJc3RydWN0IGFncF9icmlkZ2VfZGF0YSAqYnJpZGdlOwogfTsKIAotc3RhdGljIGludCB0
dG1fYWdwX2JpbmQoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCi0JCQlzdHJ1Y3QgdHRtX3R0
ICp0dG0sIHN0cnVjdCB0dG1fcmVzb3VyY2UgKmJvX21lbSkKK2ludCB0dG1fYWdwX2JpbmQoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCisJCSBzdHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVjdCB0
dG1fcmVzb3VyY2UgKmJvX21lbSkKIHsKIAlzdHJ1Y3QgdHRtX2FncF9iYWNrZW5kICphZ3BfYmUg
PSBjb250YWluZXJfb2YodHRtLCBzdHJ1Y3QgdHRtX2FncF9iYWNrZW5kLCB0dG0pOwogCXN0cnVj
dCBwYWdlICpkdW1teV9yZWFkX3BhZ2UgPSB0dG1fYm9fZ2xvYi5kdW1teV9yZWFkX3BhZ2U7CkBA
IC04Miw5ICs4MiwxMCBAQCBzdGF0aWMgaW50IHR0bV9hZ3BfYmluZChzdHJ1Y3QgdHRtX2JvX2Rl
dmljZSAqYmRldiwKIAogCXJldHVybiByZXQ7CiB9CitFWFBPUlRfU1lNQk9MKHR0bV9hZ3BfYmlu
ZCk7CiAKLXN0YXRpYyB2b2lkIHR0bV9hZ3BfdW5iaW5kKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpi
ZGV2LAotCQkJICAgc3RydWN0IHR0bV90dCAqdHRtKQordm9pZCB0dG1fYWdwX3VuYmluZChzdHJ1
Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKKwkJICAgIHN0cnVjdCB0dG1fdHQgKnR0bSkKIHsKIAlz
dHJ1Y3QgdHRtX2FncF9iYWNrZW5kICphZ3BfYmUgPSBjb250YWluZXJfb2YodHRtLCBzdHJ1Y3Qg
dHRtX2FncF9iYWNrZW5kLCB0dG0pOwogCkBAIC05Nyw5ICs5OCwxMCBAQCBzdGF0aWMgdm9pZCB0
dG1fYWdwX3VuYmluZChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAkJYWdwX2JlLT5tZW0g
PSBOVUxMOwogCX0KIH0KK0VYUE9SVF9TWU1CT0wodHRtX2FncF91bmJpbmQpOwogCi1zdGF0aWMg
dm9pZCB0dG1fYWdwX2Rlc3Ryb3koc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCi0JCQkgICAg
c3RydWN0IHR0bV90dCAqdHRtKQordm9pZCB0dG1fYWdwX2Rlc3Ryb3koc3RydWN0IHR0bV9ib19k
ZXZpY2UgKmJkZXYsCisJCSAgICAgc3RydWN0IHR0bV90dCAqdHRtKQogewogCXN0cnVjdCB0dG1f
YWdwX2JhY2tlbmQgKmFncF9iZSA9IGNvbnRhaW5lcl9vZih0dG0sIHN0cnVjdCB0dG1fYWdwX2Jh
Y2tlbmQsIHR0bSk7CiAKQEAgLTEwOCw2ICsxMTAsNyBAQCBzdGF0aWMgdm9pZCB0dG1fYWdwX2Rl
c3Ryb3koc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJdHRtX3R0X2ZpbmkodHRtKTsKIAlr
ZnJlZShhZ3BfYmUpOwogfQorRVhQT1JUX1NZTUJPTCh0dG1fYWdwX2Rlc3Ryb3kpOwogCiBzdGF0
aWMgc3RydWN0IHR0bV9iYWNrZW5kX2Z1bmMgdHRtX2FncF9mdW5jID0gewogCS5iaW5kID0gdHRt
X2FncF9iaW5kLApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV90dC5oIGIvaW5jbHVk
ZS9kcm0vdHRtL3R0bV90dC5oCmluZGV4IDZiZGE4OGY4ZGE0Ni4uNWEzNGYxNjQwODY1IDEwMDY0
NAotLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX3R0LmgKKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0
bV90dC5oCkBAIC0yNjYsNiArMjY2LDEyIEBAIHN0cnVjdCB0dG1fdHQgKnR0bV9hZ3BfdHRfY3Jl
YXRlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCQkJIHVpbnQzMl90IHBhZ2VfZmxh
Z3MpOwogaW50IHR0bV9hZ3BfdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYs
IHN0cnVjdCB0dG1fdHQgKnR0bSwgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpOwogdm9p
ZCB0dG1fYWdwX3R0X3VucG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVj
dCB0dG1fdHQgKnR0bSk7CitpbnQgdHRtX2FncF9iaW5kKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpi
ZGV2LAorCQkgc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgdHRtX3Jlc291cmNlICpib19tZW0p
Owordm9pZCB0dG1fYWdwX3VuYmluZChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKKwkJICAg
IHN0cnVjdCB0dG1fdHQgKnR0bSk7Cit2b2lkIHR0bV9hZ3BfZGVzdHJveShzdHJ1Y3QgdHRtX2Jv
X2RldmljZSAqYmRldiwKKwkJICAgICBzdHJ1Y3QgdHRtX3R0ICp0dG0pOwogI2VuZGlmCiAKICNl
bmRpZgotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
