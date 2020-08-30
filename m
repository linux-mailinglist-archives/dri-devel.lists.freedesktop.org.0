Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ECE256DDD
	for <lists+dri-devel@lfdr.de>; Sun, 30 Aug 2020 14:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CEF6E32D;
	Sun, 30 Aug 2020 12:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150976E320
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598792322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pl9KVfD+7YlWJlLk8Ot+a3gHE/6VBv99WiVsPiXEvhY=;
 b=YcgIGUJPvbHdRZ6oVPjoEYvCj8gMrHxEHLWhOoy0MViwpbYLExKCamGyPfkkr4ids8m+/K
 V6iIWZGeZ9CHMBcc3omm5E5vo/3YQnRNKR0SS0Xxa2tRjQXN+v3YjKwv0I9REYr26NQMGz
 uXHZVCWlpG82O//PDBlOWAEjibzln7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-OtLgDS4ANNCChmh0PW_PGw-1; Sun, 30 Aug 2020 08:58:40 -0400
X-MC-Unique: OtLgDS4ANNCChmh0PW_PGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DD2BE75F;
 Sun, 30 Aug 2020 12:58:38 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-77.ams2.redhat.com [10.36.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AAE7171C6;
 Sun, 30 Aug 2020 12:58:35 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v8 13/17] pwm: crc: Implement get_state() method
Date: Sun, 30 Aug 2020 14:57:49 +0200
Message-Id: <20200830125753.230420-14-hdegoede@redhat.com>
In-Reply-To: <20200830125753.230420-1-hdegoede@redhat.com>
References: <20200830125753.230420-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
eTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjY6
Ci0gUmViYXNlIG9uIDUuOS1yYzEKLSBVc2UgRElWX1JPVU5EX1VQX1VMTCBiZWNhdXNlIHB3bV9z
dGF0ZS5wZXJpb2QgYW5kIC5kdXR5X2N5Y2xlIGFyZSBub3cgdTY0CgpDaGFuZ2VzIGluIHY1Ogot
IEZpeCBhbiBpbmRlbnRhdGlvbiBpc3N1ZQoKQ2hhbmdlcyBpbiB2NDoKLSBVc2UgRElWX1JPVU5E
X1VQIHdoZW4gY2FsY3VsYXRpbmcgdGhlIHBlcmlvZCBhbmQgZHV0eV9jeWNsZSBmcm9tIHRoZQog
IGNvbnRyb2xsZXIncyByZWdpc3RlciB2YWx1ZXMKCkNoYW5nZXMgaW4gdjM6Ci0gQWRkIEFuZHkn
cyBSZXZpZXdlZC1ieSB0YWcKLSBSZW1vdmUgZXh0cmEgd2hpdGVzcGFjZSB0byBhbGlnbiBzb21l
IGNvZGUgYWZ0ZXIgYXNzaWdubWVudHMgKHJlcXVlc3RlZCBieQogIFV3ZSBLbGVpbmUtS8O2bmln
KQotLS0KIGRyaXZlcnMvcHdtL3B3bS1jcmMuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wd20vcHdtLWNyYy5jIGIvZHJpdmVycy9wd20vcHdtLWNyYy5jCmluZGV4IDI3ZGMz
MDg4MjQyNC4uZWNmZGZhYzBjMmQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tY3JjLmMK
KysrIGIvZHJpdmVycy9wd20vcHdtLWNyYy5jCkBAIC0xMjEsOCArMTIxLDM5IEBAIHN0YXRpYyBp
bnQgY3JjX3B3bV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNl
ICpwd20sCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyB2b2lkIGNyY19wd21fZ2V0X3N0YXRlKHN0
cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKKwkJCSAgICAgIHN0
cnVjdCBwd21fc3RhdGUgKnN0YXRlKQoreworCXN0cnVjdCBjcnlzdGFsY292ZV9wd20gKmNyY19w
d20gPSB0b19jcmNfcHdtKGNoaXApOworCXN0cnVjdCBkZXZpY2UgKmRldiA9IGNyY19wd20tPmNo
aXAuZGV2OworCXVuc2lnbmVkIGludCBjbGtfZGl2LCBjbGtfZGl2X3JlZywgZHV0eV9jeWNsZV9y
ZWc7CisJaW50IGVycm9yOworCisJZXJyb3IgPSByZWdtYXBfcmVhZChjcmNfcHdtLT5yZWdtYXAs
IFBXTTBfQ0xLX0RJViwgJmNsa19kaXZfcmVnKTsKKwlpZiAoZXJyb3IpIHsKKwkJZGV2X2Vycihk
ZXYsICJFcnJvciByZWFkaW5nIFBXTTBfQ0xLX0RJViAlZFxuIiwgZXJyb3IpOworCQlyZXR1cm47
CisJfQorCisJZXJyb3IgPSByZWdtYXBfcmVhZChjcmNfcHdtLT5yZWdtYXAsIFBXTTBfRFVUWV9D
WUNMRSwgJmR1dHlfY3ljbGVfcmVnKTsKKwlpZiAoZXJyb3IpIHsKKwkJZGV2X2VycihkZXYsICJF
cnJvciByZWFkaW5nIFBXTTBfRFVUWV9DWUNMRSAlZFxuIiwgZXJyb3IpOworCQlyZXR1cm47CisJ
fQorCisJY2xrX2RpdiA9IChjbGtfZGl2X3JlZyAmIH5QV01fT1VUUFVUX0VOQUJMRSkgKyAxOwor
CisJc3RhdGUtPnBlcmlvZCA9CisJCURJVl9ST1VORF9VUChjbGtfZGl2ICogTlNFQ19QRVJfVVNF
QyAqIDI1NiwgUFdNX0JBU0VfQ0xLX01IWik7CisJc3RhdGUtPmR1dHlfY3ljbGUgPQorCQlESVZf
Uk9VTkRfVVBfVUxMKGR1dHlfY3ljbGVfcmVnICogc3RhdGUtPnBlcmlvZCwgUFdNX01BWF9MRVZF
TCk7CisJc3RhdGUtPnBvbGFyaXR5ID0gUFdNX1BPTEFSSVRZX05PUk1BTDsKKwlzdGF0ZS0+ZW5h
YmxlZCA9ICEhKGNsa19kaXZfcmVnICYgUFdNX09VVFBVVF9FTkFCTEUpOworfQorCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IHB3bV9vcHMgY3JjX3B3bV9vcHMgPSB7CiAJLmFwcGx5ID0gY3JjX3B3bV9h
cHBseSwKKwkuZ2V0X3N0YXRlID0gY3JjX3B3bV9nZXRfc3RhdGUsCiB9OwogCiBzdGF0aWMgaW50
IGNyeXN0YWxjb3ZlX3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQotLSAK
Mi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
