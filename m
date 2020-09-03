Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4177E25BF8F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 12:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE016E991;
	Thu,  3 Sep 2020 10:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2A76E991
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 10:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599130326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BihA1BpHNAPbZmr7utm+7lcBoH9ReI2g/yHAfDzPOZk=;
 b=TwXRoi9btuztSlsQqx4U1FrNRAxhZ1rZy12nbMT0zGL2pxDB5tXnX8y64+WBMHy/CiqXD+
 +lT+LgZj8UcEDqDyLgM2rf/BSs+XlclCbf1PwtDkL2pHWCqEsDhiFRwgNiJSsh++ZUfH5L
 Z2y1AAX/Yd8hnVL6ab9A8Vuy3mjseJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-IZqbn1yrO82AbD6yYu0cCA-1; Thu, 03 Sep 2020 06:52:04 -0400
X-MC-Unique: IZqbn1yrO82AbD6yYu0cCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7124E107464A;
 Thu,  3 Sep 2020 10:52:02 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3DC4784A8;
 Thu,  3 Sep 2020 10:51:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v9 13/17] pwm: crc: Implement get_state() method
Date: Thu,  3 Sep 2020 12:51:10 +0200
Message-Id: <20200903105114.9969-14-hdegoede@redhat.com>
In-Reply-To: <20200903105114.9969-1-hdegoede@redhat.com>
References: <20200903105114.9969-1-hdegoede@redhat.com>
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
ZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KQWNrZWQtYnk6IFRo
aWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEhh
bnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQpDaGFuZ2VzIGluIHY2OgotIFJl
YmFzZSBvbiA1LjktcmMxCi0gVXNlIERJVl9ST1VORF9VUF9VTEwgYmVjYXVzZSBwd21fc3RhdGUu
cGVyaW9kIGFuZCAuZHV0eV9jeWNsZSBhcmUgbm93IHU2NAoKQ2hhbmdlcyBpbiB2NToKLSBGaXgg
YW4gaW5kZW50YXRpb24gaXNzdWUKCkNoYW5nZXMgaW4gdjQ6Ci0gVXNlIERJVl9ST1VORF9VUCB3
aGVuIGNhbGN1bGF0aW5nIHRoZSBwZXJpb2QgYW5kIGR1dHlfY3ljbGUgZnJvbSB0aGUKICBjb250
cm9sbGVyJ3MgcmVnaXN0ZXIgdmFsdWVzCgpDaGFuZ2VzIGluIHYzOgotIEFkZCBBbmR5J3MgUmV2
aWV3ZWQtYnkgdGFnCi0gUmVtb3ZlIGV4dHJhIHdoaXRlc3BhY2UgdG8gYWxpZ24gc29tZSBjb2Rl
IGFmdGVyIGFzc2lnbm1lbnRzIChyZXF1ZXN0ZWQgYnkKICBVd2UgS2xlaW5lLUvDtm5pZykKLS0t
CiBkcml2ZXJzL3B3bS9wd20tY3JjLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcHdtL3B3bS1jcmMuYyBiL2RyaXZlcnMvcHdtL3B3bS1jcmMuYwppbmRleCAyN2RjMzA4ODI0
MjQuLmVjZmRmYWMwYzJkOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLWNyYy5jCisrKyBi
L2RyaXZlcnMvcHdtL3B3bS1jcmMuYwpAQCAtMTIxLDggKzEyMSwzOSBAQCBzdGF0aWMgaW50IGNy
Y19wd21fYXBwbHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdt
LAogCXJldHVybiAwOwogfQogCitzdGF0aWMgdm9pZCBjcmNfcHdtX2dldF9zdGF0ZShzdHJ1Y3Qg
cHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCisJCQkgICAgICBzdHJ1Y3Qg
cHdtX3N0YXRlICpzdGF0ZSkKK3sKKwlzdHJ1Y3QgY3J5c3RhbGNvdmVfcHdtICpjcmNfcHdtID0g
dG9fY3JjX3B3bShjaGlwKTsKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBjcmNfcHdtLT5jaGlwLmRl
djsKKwl1bnNpZ25lZCBpbnQgY2xrX2RpdiwgY2xrX2Rpdl9yZWcsIGR1dHlfY3ljbGVfcmVnOwor
CWludCBlcnJvcjsKKworCWVycm9yID0gcmVnbWFwX3JlYWQoY3JjX3B3bS0+cmVnbWFwLCBQV00w
X0NMS19ESVYsICZjbGtfZGl2X3JlZyk7CisJaWYgKGVycm9yKSB7CisJCWRldl9lcnIoZGV2LCAi
RXJyb3IgcmVhZGluZyBQV00wX0NMS19ESVYgJWRcbiIsIGVycm9yKTsKKwkJcmV0dXJuOworCX0K
KworCWVycm9yID0gcmVnbWFwX3JlYWQoY3JjX3B3bS0+cmVnbWFwLCBQV00wX0RVVFlfQ1lDTEUs
ICZkdXR5X2N5Y2xlX3JlZyk7CisJaWYgKGVycm9yKSB7CisJCWRldl9lcnIoZGV2LCAiRXJyb3Ig
cmVhZGluZyBQV00wX0RVVFlfQ1lDTEUgJWRcbiIsIGVycm9yKTsKKwkJcmV0dXJuOworCX0KKwor
CWNsa19kaXYgPSAoY2xrX2Rpdl9yZWcgJiB+UFdNX09VVFBVVF9FTkFCTEUpICsgMTsKKworCXN0
YXRlLT5wZXJpb2QgPQorCQlESVZfUk9VTkRfVVAoY2xrX2RpdiAqIE5TRUNfUEVSX1VTRUMgKiAy
NTYsIFBXTV9CQVNFX0NMS19NSFopOworCXN0YXRlLT5kdXR5X2N5Y2xlID0KKwkJRElWX1JPVU5E
X1VQX1VMTChkdXR5X2N5Y2xlX3JlZyAqIHN0YXRlLT5wZXJpb2QsIFBXTV9NQVhfTEVWRUwpOwor
CXN0YXRlLT5wb2xhcml0eSA9IFBXTV9QT0xBUklUWV9OT1JNQUw7CisJc3RhdGUtPmVuYWJsZWQg
PSAhIShjbGtfZGl2X3JlZyAmIFBXTV9PVVRQVVRfRU5BQkxFKTsKK30KKwogc3RhdGljIGNvbnN0
IHN0cnVjdCBwd21fb3BzIGNyY19wd21fb3BzID0gewogCS5hcHBseSA9IGNyY19wd21fYXBwbHks
CisJLmdldF9zdGF0ZSA9IGNyY19wd21fZ2V0X3N0YXRlLAogfTsKIAogc3RhdGljIGludCBjcnlz
dGFsY292ZV9wd21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKLS0gCjIuMjgu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
