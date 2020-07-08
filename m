Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0D1219222
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 23:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A516D6E924;
	Wed,  8 Jul 2020 21:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BABC6E924
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 21:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594242908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/dGCo/xXzz/hMUGVIpBuI4CpNY9zSoguT4eSJC9/WpQ=;
 b=bIV2K/jCYweEzDgHK48tiRMToTwtKMLq2IgrxFb0VowitEA33HF8JVdWD7gbEW9l2cTMSm
 eL5PSylIJZ2hKCmqt761KfPrLLShfyP4rV6wV6J37U5ttgDaBJBTcZjCsgx1GX2xKmcLb8
 AicL5byZv9Fun4KLwbq4VuH4lmePs5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-t1CZuCdVPDGVw2Klnw34nQ-1; Wed, 08 Jul 2020 17:14:55 -0400
X-MC-Unique: t1CZuCdVPDGVw2Klnw34nQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B46B3E918;
 Wed,  8 Jul 2020 21:14:53 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-5.ams2.redhat.com [10.36.112.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26CD179220;
 Wed,  8 Jul 2020 21:14:51 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: [PATCH v4 06/16] pwm: lpss: Correct get_state result for base_unit ==
 0
Date: Wed,  8 Jul 2020 23:14:22 +0200
Message-Id: <20200708211432.28612-7-hdegoede@redhat.com>
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

VGhlIGRhdGFzaGVldCBzcGVjaWZpZXMgdGhhdCBwcm9ncmFtbWluZyB0aGUgYmFzZV91bml0IHBh
cnQgb2YgdGhlCmN0cmwgcmVnaXN0ZXIgdG8gMCByZXN1bHRzIGluIGEgY29udGluZW91cyBsb3cg
c2lnbmFsLgoKQWRqdXN0IHRoZSBnZXRfc3RhdGUgbWV0aG9kIHRvIHJlZmxlY3QgdGhpcyBieSBz
ZXR0aW5nIHB3bV9zdGF0ZS5wZXJpb2QKdG8gMSBhbmQgZHV0eV9jeWNsZSB0byAwLgoKU3VnZ2Vz
dGVkLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRl
PgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0K
Q2hhbmdlcyBpbiB2NDoKLSBUaGlzIGlzIGEgbmV3IHBhdGNoIGluIHY0IG9mIHRoaXMgcGF0Y2hz
ZXQKLS0tCiBkcml2ZXJzL3B3bS9wd20tbHBzcy5jIHwgMTYgKysrKysrKysrLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3B3bS9wd20tbHBzcy5jIGIvZHJpdmVycy9wd20vcHdtLWxwc3MuYwppbmRleCA0
ZjNkNjBjZTk5MjkuLjRkNGRlNDVjZjk5YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLWxw
c3MuYworKysgYi9kcml2ZXJzL3B3bS9wd20tbHBzcy5jCkBAIC0xOTIsMTQgKzE5MiwxNiBAQCBz
dGF0aWMgdm9pZCBwd21fbHBzc19nZXRfc3RhdGUoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1
Y3QgcHdtX2RldmljZSAqcHdtLAogCiAJZnJlcSA9IGJhc2VfdW5pdCAqIGxwd20tPmluZm8tPmNs
a19yYXRlOwogCWRvX2RpdihmcmVxLCBiYXNlX3VuaXRfcmFuZ2UpOwotCWlmIChmcmVxID09IDAp
Ci0JCXN0YXRlLT5wZXJpb2QgPSBOU0VDX1BFUl9TRUM7Ci0JZWxzZQorCWlmIChmcmVxID09IDAp
IHsKKwkJLyogSW4gdGhpcyBjYXNlIHRoZSBQV00gb3V0cHV0cyBhIGNvbnRpbm91cyBsb3cgc2ln
bmFsICovCisJCXN0YXRlLT5wZXJpb2QgPSAxOworCQlzdGF0ZS0+ZHV0eV9jeWNsZSA9IDA7CisJ
fSBlbHNlIHsKIAkJc3RhdGUtPnBlcmlvZCA9IE5TRUNfUEVSX1NFQyAvICh1bnNpZ25lZCBsb25n
KWZyZXE7Ci0KLQlvbl90aW1lX2RpdiAqPSBzdGF0ZS0+cGVyaW9kOwotCWRvX2Rpdihvbl90aW1l
X2RpdiwgMjU1KTsKLQlzdGF0ZS0+ZHV0eV9jeWNsZSA9IG9uX3RpbWVfZGl2OworCQlvbl90aW1l
X2RpdiAqPSBzdGF0ZS0+cGVyaW9kOworCQlkb19kaXYob25fdGltZV9kaXYsIDI1NSk7CisJCXN0
YXRlLT5kdXR5X2N5Y2xlID0gb25fdGltZV9kaXY7CisJfQogCiAJc3RhdGUtPnBvbGFyaXR5ID0g
UFdNX1BPTEFSSVRZX05PUk1BTDsKIAlzdGF0ZS0+ZW5hYmxlZCA9ICEhKGN0cmwgJiBQV01fRU5B
QkxFKTsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
