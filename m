Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0FB24FD52
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 14:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F63D6EC71;
	Mon, 24 Aug 2020 12:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B647A6EC71
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 12:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598270534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6zdMqI9djrIOSjSF+r36fsHrv2APK30XDs0lh8OJOjs=;
 b=gSjmzSbXAC4WJC08JLWM0Ex9NofA3of+h6jJ8MnyQNw5tkkTCihYhPsKCo8V0JjhQwgoNf
 qiiFXhISAloHhvwuBs1CSTIpl4is0UT5u6gF5xrToS2uj67KIe+EFxsHsizTG4ozgII9e9
 Yu8eVB1fsj7tGBgZz9fXYACET6GEfpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-H0Iy9G3ANVKbNVL80gGOwA-1; Mon, 24 Aug 2020 08:02:11 -0400
X-MC-Unique: H0Iy9G3ANVKbNVL80gGOwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CAA31005E6D;
 Mon, 24 Aug 2020 12:02:09 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-147.ams2.redhat.com
 [10.36.113.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A31F85D9DD;
 Mon, 24 Aug 2020 12:02:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v6 10/16] pwm: crc: Enable/disable PWM output on enable/disable
Date: Mon, 24 Aug 2020 14:01:20 +0200
Message-Id: <20200824120126.7116-11-hdegoede@redhat.com>
In-Reply-To: <20200824120126.7116-1-hdegoede@redhat.com>
References: <20200824120126.7116-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

VGhlIHB3bS1jcmMgY29kZSBpcyB1c2luZyAyIGRpZmZlcmVudCBlbmFibGUgYml0czoKMS4gYml0
IDcgb2YgdGhlIFBXTTBfQ0xLX0RJViAoUFdNX09VVFBVVF9FTkFCTEUpCjIuIGJpdCAwIG9mIHRo
ZSBCQUNLTElHSFRfRU4gcmVnaXN0ZXIKClNvIGZhciB3ZSd2ZSBrZXB0IHRoZSBQV01fT1VUUFVU
X0VOQUJMRSBiaXQgc2V0IHdoZW4gZGlzYWJsaW5nIHRoZSBQV00sCnRoaXMgY29tbWl0IG1ha2Vz
IGNyY19wd21fZGlzYWJsZSgpIGNsZWFyIGl0IG9uIGRpc2FibGUgYW5kIG1ha2VzCmNyY19wd21f
ZW5hYmxlKCkgc2V0IGl0IGFnYWluIG9uIHJlLWVuYWJsZS4KCkFja2VkLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpSZXZpZXdlZC1ieTogQW5k
eSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQpDaGFuZ2VzIGlu
IHYzOgotIFJlbW92ZSBwYXJhZ3JhcGggYWJvdXQgdHJpLXN0YXRpbmcgdGhlIG91dHB1dCBmcm9t
IHRoZSBjb21taXQgbWVzc2FnZSwKICB3ZSBkb24ndCBoYXZlIGEgZGF0YXNoZWV0IHNvIHRoaXMg
d2FzIGp1c3QgYW4gdW5mb3VuZGVkIGd1ZXNzCi0tLQogZHJpdmVycy9wd20vcHdtLWNyYy5jIHwg
NCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9wd20vcHdtLWNyYy5jIGIvZHJpdmVycy9wd20vcHdtLWNyYy5jCmluZGV4IDgxMjMyZGEw
Yzc2Ny4uYjcyMDA4YzliMDcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tY3JjLmMKKysr
IGIvZHJpdmVycy9wd20vcHdtLWNyYy5jCkBAIC01NCw3ICs1NCw5IEBAIHN0YXRpYyBpbnQgY3Jj
X3B3bV9jYWxjX2Nsa19kaXYoaW50IHBlcmlvZF9ucykKIHN0YXRpYyBpbnQgY3JjX3B3bV9lbmFi
bGUoc3RydWN0IHB3bV9jaGlwICpjLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtKQogewogCXN0cnVj
dCBjcnlzdGFsY292ZV9wd20gKmNyY19wd20gPSB0b19jcmNfcHdtKGMpOworCWludCBkaXYgPSBj
cmNfcHdtX2NhbGNfY2xrX2Rpdihwd21fZ2V0X3BlcmlvZChwd20pKTsKIAorCXJlZ21hcF93cml0
ZShjcmNfcHdtLT5yZWdtYXAsIFBXTTBfQ0xLX0RJViwgZGl2IHwgUFdNX09VVFBVVF9FTkFCTEUp
OwogCXJlZ21hcF93cml0ZShjcmNfcHdtLT5yZWdtYXAsIEJBQ0tMSUdIVF9FTiwgMSk7CiAKIAly
ZXR1cm4gMDsKQEAgLTYzLDggKzY1LDEwIEBAIHN0YXRpYyBpbnQgY3JjX3B3bV9lbmFibGUoc3Ry
dWN0IHB3bV9jaGlwICpjLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtKQogc3RhdGljIHZvaWQgY3Jj
X3B3bV9kaXNhYmxlKHN0cnVjdCBwd21fY2hpcCAqYywgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkK
IHsKIAlzdHJ1Y3QgY3J5c3RhbGNvdmVfcHdtICpjcmNfcHdtID0gdG9fY3JjX3B3bShjKTsKKwlp
bnQgZGl2ID0gY3JjX3B3bV9jYWxjX2Nsa19kaXYocHdtX2dldF9wZXJpb2QocHdtKSk7CiAKIAly
ZWdtYXBfd3JpdGUoY3JjX3B3bS0+cmVnbWFwLCBCQUNLTElHSFRfRU4sIDApOworCXJlZ21hcF93
cml0ZShjcmNfcHdtLT5yZWdtYXAsIFBXTTBfQ0xLX0RJViwgZGl2KTsKIH0KIAogc3RhdGljIGlu
dCBjcmNfcHdtX2NvbmZpZyhzdHJ1Y3QgcHdtX2NoaXAgKmMsIHN0cnVjdCBwd21fZGV2aWNlICpw
d20sCi0tIAoyLjI4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
