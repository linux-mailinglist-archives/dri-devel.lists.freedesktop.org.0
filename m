Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 003A8223CF5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 15:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6576EDC1;
	Fri, 17 Jul 2020 13:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB976EDC1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594993130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Ib64GzsX/8qSglGMuvDRtcc6hdwRktBSJO+EDu4u2I=;
 b=YljJJpPqou0s0TYEgX7jpLM3WctX4dB9sswaebabBDIxXMBXkfexwAV7gKx+/dIRgs2cNe
 zLvvHrF/DJNB4NyWuHAegTW83i6RuKtlPwH9mvQw3dmdn5mIlBh7UIRTVT1KIf830yHkb1
 s11XHjMBuDGqsSruX08DNZAUZnrz6lw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-dKUlCn-0PHCLOgOSO83cTQ-1; Fri, 17 Jul 2020 09:38:48 -0400
X-MC-Unique: dKUlCn-0PHCLOgOSO83cTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F8C08EB998;
 Fri, 17 Jul 2020 13:38:46 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-162.ams2.redhat.com
 [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25B817BD7C;
 Fri, 17 Jul 2020 13:38:40 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v5 10/16] pwm: crc: Enable/disable PWM output on enable/disable
Date: Fri, 17 Jul 2020 15:37:47 +0200
Message-Id: <20200717133753.127282-11-hdegoede@redhat.com>
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

VGhlIHB3bS1jcmMgY29kZSBpcyB1c2luZyAyIGRpZmZlcmVudCBlbmFibGUgYml0czoKMS4gYml0
IDcgb2YgdGhlIFBXTTBfQ0xLX0RJViAoUFdNX09VVFBVVF9FTkFCTEUpCjIuIGJpdCAwIG9mIHRo
ZSBCQUNLTElHSFRfRU4gcmVnaXN0ZXIKClNvIGZhciB3ZSd2ZSBrZXB0IHRoZSBQV01fT1VUUFVU
X0VOQUJMRSBiaXQgc2V0IHdoZW4gZGlzYWJsaW5nIHRoZSBQV00sCnRoaXMgY29tbWl0IG1ha2Vz
IGNyY19wd21fZGlzYWJsZSgpIGNsZWFyIGl0IG9uIGRpc2FibGUgYW5kIG1ha2VzCmNyY19wd21f
ZW5hYmxlKCkgc2V0IGl0IGFnYWluIG9uIHJlLWVuYWJsZS4KCkFja2VkLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBI
YW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KQ2hhbmdlcyBpbiB2MzoKLSBS
ZW1vdmUgcGFyYWdyYXBoIGFib3V0IHRyaS1zdGF0aW5nIHRoZSBvdXRwdXQgZnJvbSB0aGUgY29t
bWl0IG1lc3NhZ2UsCiAgd2UgZG9uJ3QgaGF2ZSBhIGRhdGFzaGVldCBzbyB0aGlzIHdhcyBqdXN0
IGFuIHVuZm91bmRlZCBndWVzcwotLS0KIGRyaXZlcnMvcHdtL3B3bS1jcmMuYyB8IDQgKysrKwog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdt
L3B3bS1jcmMuYyBiL2RyaXZlcnMvcHdtL3B3bS1jcmMuYwppbmRleCA4MTIzMmRhMGM3NjcuLmI3
MjAwOGM5YjA3MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLWNyYy5jCisrKyBiL2RyaXZl
cnMvcHdtL3B3bS1jcmMuYwpAQCAtNTQsNyArNTQsOSBAQCBzdGF0aWMgaW50IGNyY19wd21fY2Fs
Y19jbGtfZGl2KGludCBwZXJpb2RfbnMpCiBzdGF0aWMgaW50IGNyY19wd21fZW5hYmxlKHN0cnVj
dCBwd21fY2hpcCAqYywgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKIHsKIAlzdHJ1Y3QgY3J5c3Rh
bGNvdmVfcHdtICpjcmNfcHdtID0gdG9fY3JjX3B3bShjKTsKKwlpbnQgZGl2ID0gY3JjX3B3bV9j
YWxjX2Nsa19kaXYocHdtX2dldF9wZXJpb2QocHdtKSk7CiAKKwlyZWdtYXBfd3JpdGUoY3JjX3B3
bS0+cmVnbWFwLCBQV00wX0NMS19ESVYsIGRpdiB8IFBXTV9PVVRQVVRfRU5BQkxFKTsKIAlyZWdt
YXBfd3JpdGUoY3JjX3B3bS0+cmVnbWFwLCBCQUNLTElHSFRfRU4sIDEpOwogCiAJcmV0dXJuIDA7
CkBAIC02Myw4ICs2NSwxMCBAQCBzdGF0aWMgaW50IGNyY19wd21fZW5hYmxlKHN0cnVjdCBwd21f
Y2hpcCAqYywgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKIHN0YXRpYyB2b2lkIGNyY19wd21fZGlz
YWJsZShzdHJ1Y3QgcHdtX2NoaXAgKmMsIHN0cnVjdCBwd21fZGV2aWNlICpwd20pCiB7CiAJc3Ry
dWN0IGNyeXN0YWxjb3ZlX3B3bSAqY3JjX3B3bSA9IHRvX2NyY19wd20oYyk7CisJaW50IGRpdiA9
IGNyY19wd21fY2FsY19jbGtfZGl2KHB3bV9nZXRfcGVyaW9kKHB3bSkpOwogCiAJcmVnbWFwX3dy
aXRlKGNyY19wd20tPnJlZ21hcCwgQkFDS0xJR0hUX0VOLCAwKTsKKwlyZWdtYXBfd3JpdGUoY3Jj
X3B3bS0+cmVnbWFwLCBQV00wX0NMS19ESVYsIGRpdik7CiB9CiAKIHN0YXRpYyBpbnQgY3JjX3B3
bV9jb25maWcoc3RydWN0IHB3bV9jaGlwICpjLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAotLSAK
Mi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
