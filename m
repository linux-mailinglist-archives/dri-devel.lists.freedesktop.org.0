Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB5A21922D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 23:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538686E931;
	Wed,  8 Jul 2020 21:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2496E92A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594242935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SL1iJkgudXbiRt+5sdrta73DHy47gF0CgIrRX8IsQec=;
 b=UtG0A1lsxzztSXaV+eANrpJ26mRf1EwTHFGasY4MzWnoEu+L000Y0aLczrVqaB4CusVOr7
 0zYuOg+8pVipicc3u3cxmfBpPmuNdDuz0SH3le7uxN3d7Q9PVxds46oOuNWWnB4wFi43xI
 2F5tElkMI3FAdMriOp96nFWfvZbSKtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-Ml043AWOPZ-gl2emQgT6AA-1; Wed, 08 Jul 2020 17:15:33 -0400
X-MC-Unique: Ml043AWOPZ-gl2emQgT6AA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5D3F802780;
 Wed,  8 Jul 2020 21:15:31 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-5.ams2.redhat.com [10.36.112.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 614B9797F2;
 Wed,  8 Jul 2020 21:15:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v4 12/16] pwm: crc: Implement get_state() method
Date: Wed,  8 Jul 2020 23:14:28 +0200
Message-Id: <20200708211432.28612-13-hdegoede@redhat.com>
In-Reply-To: <20200708211432.28612-1-hdegoede@redhat.com>
References: <20200708211432.28612-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: linux-pwm@vger.kernel.org, linux-acpi@vger.kernel.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW1wbGVtZW50IHRoZSBwd21fb3BzLmdldF9zdGF0ZSgpIG1ldGhvZCB0byBjb21wbGV0ZSB0aGUg
c3VwcG9ydCBmb3IgdGhlCm5ldyBhdG9taWMgUFdNIEFQSS4KClJldmlld2VkLWJ5OiBBbmR5IFNo
ZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1i
eTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjQ6
Ci0gVXNlIERJVl9ST1VORF9VUCB3aGVuIGNhbGN1bGF0aW5nIHRoZSBwZXJpb2QgYW5kIGR1dHlf
Y3ljbGUgZnJvbSB0aGUKICBjb250cm9sbGVyJ3MgcmVnaXN0ZXIgdmFsdWVzCgpDaGFuZ2VzIGlu
IHYzOgotIEFkZCBBbmR5J3MgUmV2aWV3ZWQtYnkgdGFnCi0gUmVtb3ZlIGV4dHJhIHdoaXRlc3Bh
Y2UgdG8gYWxpZ24gc29tZSBjb2RlIGFmdGVyIGFzc2lnbm1lbnRzIChyZXF1ZXN0ZWQgYnkKICBV
d2UgS2xlaW5lLUvDtm5pZykKLS0tCiBkcml2ZXJzL3B3bS9wd20tY3JjLmMgfCAzMSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1jcmMuYyBiL2RyaXZlcnMvcHdtL3B3bS1j
cmMuYwppbmRleCA4YTdmNDcwNzI3OWMuLmU1OGIwOTc5ZDcwOCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9wd20vcHdtLWNyYy5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1jcmMuYwpAQCAtMTE5LDggKzEx
OSwzOSBAQCBzdGF0aWMgaW50IGNyY19wd21fYXBwbHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBz
dHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCXJldHVybiAwOwogfQogCitzdGF0aWMgdm9pZCBjcmNf
cHdtX2dldF9zdGF0ZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpw
d20sCisJCQkgICAgICAgc3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUpCit7CisJc3RydWN0IGNyeXN0
YWxjb3ZlX3B3bSAqY3JjX3B3bSA9IHRvX2NyY19wd20oY2hpcCk7CisJc3RydWN0IGRldmljZSAq
ZGV2ID0gY3JjX3B3bS0+Y2hpcC5kZXY7CisJdW5zaWduZWQgaW50IGNsa19kaXYsIGNsa19kaXZf
cmVnLCBkdXR5X2N5Y2xlX3JlZzsKKwlpbnQgZXJyb3I7CisKKwllcnJvciA9IHJlZ21hcF9yZWFk
KGNyY19wd20tPnJlZ21hcCwgUFdNMF9DTEtfRElWLCAmY2xrX2Rpdl9yZWcpOworCWlmIChlcnJv
cikgeworCQlkZXZfZXJyKGRldiwgIkVycm9yIHJlYWRpbmcgUFdNMF9DTEtfRElWICVkXG4iLCBl
cnJvcik7CisJCXJldHVybjsKKwl9CisKKwllcnJvciA9IHJlZ21hcF9yZWFkKGNyY19wd20tPnJl
Z21hcCwgUFdNMF9EVVRZX0NZQ0xFLCAmZHV0eV9jeWNsZV9yZWcpOworCWlmIChlcnJvcikgewor
CQlkZXZfZXJyKGRldiwgIkVycm9yIHJlYWRpbmcgUFdNMF9EVVRZX0NZQ0xFICVkXG4iLCBlcnJv
cik7CisJCXJldHVybjsKKwl9CisKKwljbGtfZGl2ID0gKGNsa19kaXZfcmVnICYgflBXTV9PVVRQ
VVRfRU5BQkxFKSArIDE7CisKKwlzdGF0ZS0+cGVyaW9kID0KKwkJRElWX1JPVU5EX1VQKGNsa19k
aXYgKiBOU0VDX1BFUl9VU0VDICogMjU2LCBQV01fQkFTRV9DTEtfTUhaKTsKKwlzdGF0ZS0+ZHV0
eV9jeWNsZSA9CisJCURJVl9ST1VORF9VUChkdXR5X2N5Y2xlX3JlZyAqIHN0YXRlLT5wZXJpb2Qs
IFBXTV9NQVhfTEVWRUwpOworCXN0YXRlLT5wb2xhcml0eSA9IFBXTV9QT0xBUklUWV9OT1JNQUw7
CisJc3RhdGUtPmVuYWJsZWQgPSAhIShjbGtfZGl2X3JlZyAmIFBXTV9PVVRQVVRfRU5BQkxFKTsK
K30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBwd21fb3BzIGNyY19wd21fb3BzID0gewogCS5hcHBs
eSA9IGNyY19wd21fYXBwbHksCisJLmdldF9zdGF0ZSA9IGNyY19wd21fZ2V0X3N0YXRlLAogfTsK
IAogc3RhdGljIGludCBjcnlzdGFsY292ZV9wd21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
