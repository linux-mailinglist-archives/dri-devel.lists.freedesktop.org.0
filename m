Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 497DD25BF89
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 12:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32036E990;
	Thu,  3 Sep 2020 10:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC916E990
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 10:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599130320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bls/UFMf0L0kdioky5wX0QpmXgpNAMyX15B1clsViAI=;
 b=Jmw3m9R3rSCyEvXXp3CVjk2fM1ymoiG8Nz/hg4WutXzFKKgLB9dSQ3lU9UcjAB9bSJtwIU
 H4TORcaGvVzg1qloTEgHO1LKWwslXPw8xz967fSM4aCwUQCBFQx3XkTuQ/iImSoOeWzzsT
 HPpzPxBD0VksdJOI7A4JFfOrv8tCrzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-l4FzkQYFP5WJ-FwLqSkjZQ-1; Thu, 03 Sep 2020 06:51:59 -0400
X-MC-Unique: l4FzkQYFP5WJ-FwLqSkjZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93556801AE6;
 Thu,  3 Sep 2020 10:51:56 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8533784A8;
 Thu,  3 Sep 2020 10:51:51 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v9 11/17] pwm: crc: Enable/disable PWM output on enable/disable
Date: Thu,  3 Sep 2020 12:51:08 +0200
Message-Id: <20200903105114.9969-12-hdegoede@redhat.com>
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

VGhlIHB3bS1jcmMgY29kZSBpcyB1c2luZyAyIGRpZmZlcmVudCBlbmFibGUgYml0czoKMS4gYml0
IDcgb2YgdGhlIFBXTTBfQ0xLX0RJViAoUFdNX09VVFBVVF9FTkFCTEUpCjIuIGJpdCAwIG9mIHRo
ZSBCQUNLTElHSFRfRU4gcmVnaXN0ZXIKClNvIGZhciB3ZSd2ZSBrZXB0IHRoZSBQV01fT1VUUFVU
X0VOQUJMRSBiaXQgc2V0IHdoZW4gZGlzYWJsaW5nIHRoZSBQV00sCnRoaXMgY29tbWl0IG1ha2Vz
IGNyY19wd21fZGlzYWJsZSgpIGNsZWFyIGl0IG9uIGRpc2FibGUgYW5kIG1ha2VzCmNyY19wd21f
ZW5hYmxlKCkgc2V0IGl0IGFnYWluIG9uIHJlLWVuYWJsZS4KCkFja2VkLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpSZXZpZXdlZC1ieTogQW5k
eSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+CkFja2VkLWJ5
OiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5
OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KQ2hhbmdlcyBpbiB2MzoK
LSBSZW1vdmUgcGFyYWdyYXBoIGFib3V0IHRyaS1zdGF0aW5nIHRoZSBvdXRwdXQgZnJvbSB0aGUg
Y29tbWl0IG1lc3NhZ2UsCiAgd2UgZG9uJ3QgaGF2ZSBhIGRhdGFzaGVldCBzbyB0aGlzIHdhcyBq
dXN0IGFuIHVuZm91bmRlZCBndWVzcwotLS0KIGRyaXZlcnMvcHdtL3B3bS1jcmMuYyB8IDQgKysr
KwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cHdtL3B3bS1jcmMuYyBiL2RyaXZlcnMvcHdtL3B3bS1jcmMuYwppbmRleCA4MTIzMmRhMGM3Njcu
LmI3MjAwOGM5YjA3MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLWNyYy5jCisrKyBiL2Ry
aXZlcnMvcHdtL3B3bS1jcmMuYwpAQCAtNTQsNyArNTQsOSBAQCBzdGF0aWMgaW50IGNyY19wd21f
Y2FsY19jbGtfZGl2KGludCBwZXJpb2RfbnMpCiBzdGF0aWMgaW50IGNyY19wd21fZW5hYmxlKHN0
cnVjdCBwd21fY2hpcCAqYywgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKIHsKIAlzdHJ1Y3QgY3J5
c3RhbGNvdmVfcHdtICpjcmNfcHdtID0gdG9fY3JjX3B3bShjKTsKKwlpbnQgZGl2ID0gY3JjX3B3
bV9jYWxjX2Nsa19kaXYocHdtX2dldF9wZXJpb2QocHdtKSk7CiAKKwlyZWdtYXBfd3JpdGUoY3Jj
X3B3bS0+cmVnbWFwLCBQV00wX0NMS19ESVYsIGRpdiB8IFBXTV9PVVRQVVRfRU5BQkxFKTsKIAly
ZWdtYXBfd3JpdGUoY3JjX3B3bS0+cmVnbWFwLCBCQUNLTElHSFRfRU4sIDEpOwogCiAJcmV0dXJu
IDA7CkBAIC02Myw4ICs2NSwxMCBAQCBzdGF0aWMgaW50IGNyY19wd21fZW5hYmxlKHN0cnVjdCBw
d21fY2hpcCAqYywgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKIHN0YXRpYyB2b2lkIGNyY19wd21f
ZGlzYWJsZShzdHJ1Y3QgcHdtX2NoaXAgKmMsIHN0cnVjdCBwd21fZGV2aWNlICpwd20pCiB7CiAJ
c3RydWN0IGNyeXN0YWxjb3ZlX3B3bSAqY3JjX3B3bSA9IHRvX2NyY19wd20oYyk7CisJaW50IGRp
diA9IGNyY19wd21fY2FsY19jbGtfZGl2KHB3bV9nZXRfcGVyaW9kKHB3bSkpOwogCiAJcmVnbWFw
X3dyaXRlKGNyY19wd20tPnJlZ21hcCwgQkFDS0xJR0hUX0VOLCAwKTsKKwlyZWdtYXBfd3JpdGUo
Y3JjX3B3bS0+cmVnbWFwLCBQV00wX0NMS19ESVYsIGRpdik7CiB9CiAKIHN0YXRpYyBpbnQgY3Jj
X3B3bV9jb25maWcoc3RydWN0IHB3bV9jaGlwICpjLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAot
LSAKMi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
