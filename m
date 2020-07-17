Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DE2223CFA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 15:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0645E6EDC7;
	Fri, 17 Jul 2020 13:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3DA6EDC7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 13:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594993147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1V2c/64RZn70JrVNqYPs5uTiS7MghLouOUSREBgE3zw=;
 b=AjvxO0QEgsz+5psuXVh4njmwBy8RaOI2tGfVF7O//eakRgMNRHEnFEVnTKRWmFSGm0Nybg
 dI3ZDxpUZq/n9b17z9thCTvFLV2FondIfsd89jIs9KI4HawC/I2R3ObXACr45GcvfZrzMl
 yI54vTnmPk6b7+HeyA3/EP7ONmUbOSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-NlhfjF17PvqhAKI_cKxcvA-1; Fri, 17 Jul 2020 09:39:02 -0400
X-MC-Unique: NlhfjF17PvqhAKI_cKxcvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B892D14A49;
 Fri, 17 Jul 2020 13:38:53 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-162.ams2.redhat.com
 [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA2CE8FA27;
 Fri, 17 Jul 2020 13:38:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v5 12/16] pwm: crc: Implement get_state() method
Date: Fri, 17 Jul 2020 15:37:49 +0200
Message-Id: <20200717133753.127282-13-hdegoede@redhat.com>
In-Reply-To: <20200717133753.127282-1-hdegoede@redhat.com>
References: <20200717133753.127282-1-hdegoede@redhat.com>
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
eTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjU6
Ci0gRml4IGFuIGluZGVudGF0aW9uIGlzc3VlCgpDaGFuZ2VzIGluIHY0OgotIFVzZSBESVZfUk9V
TkRfVVAgd2hlbiBjYWxjdWxhdGluZyB0aGUgcGVyaW9kIGFuZCBkdXR5X2N5Y2xlIGZyb20gdGhl
CiAgY29udHJvbGxlcidzIHJlZ2lzdGVyIHZhbHVlcwoKQ2hhbmdlcyBpbiB2MzoKLSBBZGQgQW5k
eSdzIFJldmlld2VkLWJ5IHRhZwotIFJlbW92ZSBleHRyYSB3aGl0ZXNwYWNlIHRvIGFsaWduIHNv
bWUgY29kZSBhZnRlciBhc3NpZ25tZW50cyAocmVxdWVzdGVkIGJ5CiAgVXdlIEtsZWluZS1Lw7Zu
aWcpCi0tLQogZHJpdmVycy9wd20vcHdtLWNyYy5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3B3bS9wd20tY3JjLmMgYi9kcml2ZXJzL3B3bS9wd20tY3JjLmMKaW5kZXggOGE3
ZjQ3MDcyNzljLi4zNzBhYjgyNmEyMGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1jcmMu
YworKysgYi9kcml2ZXJzL3B3bS9wd20tY3JjLmMKQEAgLTExOSw4ICsxMTksMzkgQEAgc3RhdGlj
IGludCBjcmNfcHdtX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZp
Y2UgKnB3bSwKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIHZvaWQgY3JjX3B3bV9nZXRfc3RhdGUo
c3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAorCQkJICAgICAg
c3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUpCit7CisJc3RydWN0IGNyeXN0YWxjb3ZlX3B3bSAqY3Jj
X3B3bSA9IHRvX2NyY19wd20oY2hpcCk7CisJc3RydWN0IGRldmljZSAqZGV2ID0gY3JjX3B3bS0+
Y2hpcC5kZXY7CisJdW5zaWduZWQgaW50IGNsa19kaXYsIGNsa19kaXZfcmVnLCBkdXR5X2N5Y2xl
X3JlZzsKKwlpbnQgZXJyb3I7CisKKwllcnJvciA9IHJlZ21hcF9yZWFkKGNyY19wd20tPnJlZ21h
cCwgUFdNMF9DTEtfRElWLCAmY2xrX2Rpdl9yZWcpOworCWlmIChlcnJvcikgeworCQlkZXZfZXJy
KGRldiwgIkVycm9yIHJlYWRpbmcgUFdNMF9DTEtfRElWICVkXG4iLCBlcnJvcik7CisJCXJldHVy
bjsKKwl9CisKKwllcnJvciA9IHJlZ21hcF9yZWFkKGNyY19wd20tPnJlZ21hcCwgUFdNMF9EVVRZ
X0NZQ0xFLCAmZHV0eV9jeWNsZV9yZWcpOworCWlmIChlcnJvcikgeworCQlkZXZfZXJyKGRldiwg
IkVycm9yIHJlYWRpbmcgUFdNMF9EVVRZX0NZQ0xFICVkXG4iLCBlcnJvcik7CisJCXJldHVybjsK
Kwl9CisKKwljbGtfZGl2ID0gKGNsa19kaXZfcmVnICYgflBXTV9PVVRQVVRfRU5BQkxFKSArIDE7
CisKKwlzdGF0ZS0+cGVyaW9kID0KKwkJRElWX1JPVU5EX1VQKGNsa19kaXYgKiBOU0VDX1BFUl9V
U0VDICogMjU2LCBQV01fQkFTRV9DTEtfTUhaKTsKKwlzdGF0ZS0+ZHV0eV9jeWNsZSA9CisJCURJ
Vl9ST1VORF9VUChkdXR5X2N5Y2xlX3JlZyAqIHN0YXRlLT5wZXJpb2QsIFBXTV9NQVhfTEVWRUwp
OworCXN0YXRlLT5wb2xhcml0eSA9IFBXTV9QT0xBUklUWV9OT1JNQUw7CisJc3RhdGUtPmVuYWJs
ZWQgPSAhIShjbGtfZGl2X3JlZyAmIFBXTV9PVVRQVVRfRU5BQkxFKTsKK30KKwogc3RhdGljIGNv
bnN0IHN0cnVjdCBwd21fb3BzIGNyY19wd21fb3BzID0gewogCS5hcHBseSA9IGNyY19wd21fYXBw
bHksCisJLmdldF9zdGF0ZSA9IGNyY19wd21fZ2V0X3N0YXRlLAogfTsKIAogc3RhdGljIGludCBj
cnlzdGFsY292ZV9wd21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKLS0gCjIu
MjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
