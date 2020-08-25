Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2D5251616
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 12:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13276E8B1;
	Tue, 25 Aug 2020 10:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CE46E8A8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 10:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598349719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6zdMqI9djrIOSjSF+r36fsHrv2APK30XDs0lh8OJOjs=;
 b=UP3DvTvPbOJkPNLc5mLQhgnohDeU4U9PwY4Lx0oFTSTXTBIpbt61htGRZC3km3h7mNv+iq
 4UCDs0g/pJsP0PNa6XDRHoBaPGT+sq+dX1CjJT076RvCy+bOMtR2RpIlSqjTd5pQOI6XcL
 VhL08/RHzQms54giY5oLNXkM5BqthhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-xjG_Qx4tMeaFq39R2Kn10A-1; Tue, 25 Aug 2020 06:01:54 -0400
X-MC-Unique: xjG_Qx4tMeaFq39R2Kn10A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A29B81008567;
 Tue, 25 Aug 2020 10:01:52 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-132.ams2.redhat.com
 [10.36.114.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA1EB80926;
 Tue, 25 Aug 2020 10:01:46 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v7 10/16] pwm: crc: Enable/disable PWM output on enable/disable
Date: Tue, 25 Aug 2020 12:01:00 +0200
Message-Id: <20200825100106.61941-11-hdegoede@redhat.com>
In-Reply-To: <20200825100106.61941-1-hdegoede@redhat.com>
References: <20200825100106.61941-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
