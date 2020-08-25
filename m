Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671C92515F7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 12:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46F46E89E;
	Tue, 25 Aug 2020 10:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAFC6E89A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 10:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598349683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3rXccuABT6+C2AQXzwjNb04mRQTh+EDLI9eSXOti2cI=;
 b=fu+gUplNpu0BO0/SCV3Xe352sLI80T19hSx77EFffWy5Rc8sK3tEsn8KgDN+qAHRHTLmzg
 AQcHNBDSmovadTd5eQPjyTljAAQVUwHtZVkY84m+LXpwNTwDsf1pAHLptloBR9F41fv+59
 Yl6nRVRPJqgISweWyZmgW3IX3rSVqCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-aJdOZIctNzqx6ojHL7I_1g-1; Tue, 25 Aug 2020 06:01:21 -0400
X-MC-Unique: aJdOZIctNzqx6ojHL7I_1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CD57800050;
 Tue, 25 Aug 2020 10:01:19 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-132.ams2.redhat.com
 [10.36.114.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0355808B7;
 Tue, 25 Aug 2020 10:01:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v7 03/16] pwm: lpss: Fix off by one error in base_unit math in
 pwm_lpss_prepare()
Date: Tue, 25 Aug 2020 12:00:53 +0200
Message-Id: <20200825100106.61941-4-hdegoede@redhat.com>
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
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRl
Z29lZGVAcmVkaGF0LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gQWRkIEZpeGVzIHRhZwotIEFk
ZCBSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIHRhZwotLS0KIGRyaXZlcnMvcHdtL3B3bS1s
cHNzLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tbHBzcy5jIGIvZHJpdmVycy9w
d20vcHdtLWxwc3MuYwppbmRleCA5ZDk2NWZmZTY2ZDEuLjQzYjFmYzYzNGFmMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9wd20vcHdtLWxwc3MuYworKysgYi9kcml2ZXJzL3B3bS9wd20tbHBzcy5jCkBA
IC05Myw3ICs5Myw3IEBAIHN0YXRpYyB2b2lkIHB3bV9scHNzX3ByZXBhcmUoc3RydWN0IHB3bV9s
cHNzX2NoaXAgKmxwd20sIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiAJICogVGhlIGVxdWF0aW9u
IGlzOgogCSAqIGJhc2VfdW5pdCA9IHJvdW5kKGJhc2VfdW5pdF9yYW5nZSAqIGZyZXEgLyBjKQog
CSAqLwotCWJhc2VfdW5pdF9yYW5nZSA9IEJJVChscHdtLT5pbmZvLT5iYXNlX3VuaXRfYml0cykg
LSAxOworCWJhc2VfdW5pdF9yYW5nZSA9IEJJVChscHdtLT5pbmZvLT5iYXNlX3VuaXRfYml0cyk7
CiAJZnJlcSAqPSBiYXNlX3VuaXRfcmFuZ2U7CiAKIAliYXNlX3VuaXQgPSBESVZfUk9VTkRfQ0xP
U0VTVF9VTEwoZnJlcSwgYyk7CkBAIC0xMDQsOCArMTA0LDggQEAgc3RhdGljIHZvaWQgcHdtX2xw
c3NfcHJlcGFyZShzdHJ1Y3QgcHdtX2xwc3NfY2hpcCAqbHB3bSwgc3RydWN0IHB3bV9kZXZpY2Ug
KnB3bSwKIAogCW9yaWdfY3RybCA9IGN0cmwgPSBwd21fbHBzc19yZWFkKHB3bSk7CiAJY3RybCAm
PSB+UFdNX09OX1RJTUVfRElWX01BU0s7Ci0JY3RybCAmPSB+KGJhc2VfdW5pdF9yYW5nZSA8PCBQ
V01fQkFTRV9VTklUX1NISUZUKTsKLQliYXNlX3VuaXQgJj0gYmFzZV91bml0X3JhbmdlOworCWN0
cmwgJj0gfigoYmFzZV91bml0X3JhbmdlIC0gMSkgPDwgUFdNX0JBU0VfVU5JVF9TSElGVCk7CisJ
YmFzZV91bml0ICY9IChiYXNlX3VuaXRfcmFuZ2UgLSAxKTsKIAljdHJsIHw9ICh1MzIpIGJhc2Vf
dW5pdCA8PCBQV01fQkFTRV9VTklUX1NISUZUOwogCWN0cmwgfD0gb25fdGltZV9kaXY7CiAKLS0g
CjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
