Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B24625BF74
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 12:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B07B6E976;
	Thu,  3 Sep 2020 10:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0FD6E979
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 10:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599130294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wn373w+eIWH/3uB660y0YsqFgCSZy2MxI5Vgj0Uvs6A=;
 b=IN6vKhs8/NVQ94fECVcAqQQskWrvxLqxTKkwG7Mva3P8tH3FbjqGb/1HiQOjjY0Vcw1JnX
 QGBIjrdt9R+/ByCJ2EpcpSAI6F6zDtiVmGccKMw1jcge2UViBtK/i3tn/lvympZuJr/MHj
 G8LealcTYcUq44UJbTqZ6vvnGTSmU4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-TJRHc2JtPxWUxOyBmNhOVw-1; Thu, 03 Sep 2020 06:51:31 -0400
X-MC-Unique: TJRHc2JtPxWUxOyBmNhOVw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2C8D64087;
 Thu,  3 Sep 2020 10:51:29 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAD417EEAE;
 Thu,  3 Sep 2020 10:51:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v9 03/17] pwm: lpss: Fix off by one error in base_unit math in
 pwm_lpss_prepare()
Date: Thu,  3 Sep 2020 12:51:00 +0200
Message-Id: <20200903105114.9969-4-hdegoede@redhat.com>
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

QWNjb3JkaW5nIHRvIHRoZSBkYXRhLXNoZWV0IHRoZSB3YXkgdGhlIFBXTSBjb250cm9sbGVyIHdv
cmtzIGlzIHRoYXQKZWFjaCBpbnB1dCBjbG9jay1jeWNsZSB0aGUgYmFzZV91bml0IGdldHMgYWRk
ZWQgdG8gYSBOIGJpdCBjb3VudGVyIGFuZAp0aGF0IGNvdW50ZXIgb3ZlcmZsb3dpbmcgZGV0ZXJt
aW5lcyB0aGUgUFdNIG91dHB1dCBmcmVxdWVuY3kuCgpTbyBhc3N1bWluZyBlLmcuIGEgMTYgYml0
IGNvdW50ZXIgdGhpcyBtZWFucyB0aGF0IGlmIGJhc2VfdW5pdCBpcyBzZXQgdG8gMSwKYWZ0ZXIg
NjU1MzUgaW5wdXQgY2xvY2stY3ljbGVzIHRoZSBjb3VudGVyIGhhcyBiZWVuIGluY3JlYXNlZCBm
cm9tIDAgdG8KNjU1MzUgYW5kIGl0IHdpbGwgb3ZlcmZsb3cgb24gdGhlIG5leHQgY3ljbGUsIHNv
IGl0IHdpbGwgb3ZlcmZsb3cgYWZ0ZXIKZXZlcnkgNjU1MzYgY2xvY2sgY3ljbGVzIGFuZCB0aHVz
IHRoZSBjYWxjdWxhdGlvbnMgZG9uZSBpbgpwd21fbHBzc19wcmVwYXJlKCkgc2hvdWxkIHVzZSA2
NTUzNiBhbmQgbm90IDY1NTM1LgoKVGhpcyBjb21taXQgZml4ZXMgdGhpcy4gTm90ZSB0aGlzIGFs
c28gYWxpZ25zIHRoZSBjYWxjdWxhdGlvbnMgaW4KcHdtX2xwc3NfcHJlcGFyZSgpIHdpdGggdGhv
c2UgaW4gcHdtX2xwc3NfZ2V0X3N0YXRlKCkuCgpOb3RlIHRoaXMgZWZmZWN0aXZlbHkgcmV2ZXJ0
cyBjb21taXQgNjg0MzA5ZTUwNDNlICgicHdtOiBscHNzOiBBdm9pZApwb3RlbnRpYWwgb3ZlcmZs
b3cgb2YgYmFzZV91bml0IikuIFRoZSBuZXh0IHBhdGNoIGluIHRoaXMgc2VyaWVzIHJlYWxseQpm
aXhlcyB0aGUgcG90ZW50aWFsIG92ZXJmbG93IG9mIHRoZSBiYXNlX3VuaXQgdmFsdWUuCgpGaXhl
czogNjg0MzA5ZTUwNDNlICgicHdtOiBscHNzOiBBdm9pZCBwb3RlbnRpYWwgb3ZlcmZsb3cgb2Yg
YmFzZV91bml0IikKUmV2aWV3ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVu
a29AbGludXguaW50ZWwuY29tPgpBY2tlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KQWNrZWQtYnk6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5
LnJlZGluZ0BnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRl
QHJlZGhhdC5jb20+Ci0tLQpDaGFuZ2VzIGluIHYzOgotIEFkZCBGaXhlcyB0YWcKLSBBZGQgUmV2
aWV3ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyB0YWcKLS0tCiBkcml2ZXJzL3B3bS9wd20tbHBzcy5j
IHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLWxwc3MuYyBiL2RyaXZlcnMvcHdtL3B3
bS1scHNzLmMKaW5kZXggOWQ5NjVmZmU2NmQxLi40M2IxZmM2MzRhZjEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcHdtL3B3bS1scHNzLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLWxwc3MuYwpAQCAtOTMs
NyArOTMsNyBAQCBzdGF0aWMgdm9pZCBwd21fbHBzc19wcmVwYXJlKHN0cnVjdCBwd21fbHBzc19j
aGlwICpscHdtLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCSAqIFRoZSBlcXVhdGlvbiBpczoK
IAkgKiBiYXNlX3VuaXQgPSByb3VuZChiYXNlX3VuaXRfcmFuZ2UgKiBmcmVxIC8gYykKIAkgKi8K
LQliYXNlX3VuaXRfcmFuZ2UgPSBCSVQobHB3bS0+aW5mby0+YmFzZV91bml0X2JpdHMpIC0gMTsK
KwliYXNlX3VuaXRfcmFuZ2UgPSBCSVQobHB3bS0+aW5mby0+YmFzZV91bml0X2JpdHMpOwogCWZy
ZXEgKj0gYmFzZV91bml0X3JhbmdlOwogCiAJYmFzZV91bml0ID0gRElWX1JPVU5EX0NMT1NFU1Rf
VUxMKGZyZXEsIGMpOwpAQCAtMTA0LDggKzEwNCw4IEBAIHN0YXRpYyB2b2lkIHB3bV9scHNzX3By
ZXBhcmUoc3RydWN0IHB3bV9scHNzX2NoaXAgKmxwd20sIHN0cnVjdCBwd21fZGV2aWNlICpwd20s
CiAKIAlvcmlnX2N0cmwgPSBjdHJsID0gcHdtX2xwc3NfcmVhZChwd20pOwogCWN0cmwgJj0gflBX
TV9PTl9USU1FX0RJVl9NQVNLOwotCWN0cmwgJj0gfihiYXNlX3VuaXRfcmFuZ2UgPDwgUFdNX0JB
U0VfVU5JVF9TSElGVCk7Ci0JYmFzZV91bml0ICY9IGJhc2VfdW5pdF9yYW5nZTsKKwljdHJsICY9
IH4oKGJhc2VfdW5pdF9yYW5nZSAtIDEpIDw8IFBXTV9CQVNFX1VOSVRfU0hJRlQpOworCWJhc2Vf
dW5pdCAmPSAoYmFzZV91bml0X3JhbmdlIC0gMSk7CiAJY3RybCB8PSAodTMyKSBiYXNlX3VuaXQg
PDwgUFdNX0JBU0VfVU5JVF9TSElGVDsKIAljdHJsIHw9IG9uX3RpbWVfZGl2OwogCi0tIAoyLjI4
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
