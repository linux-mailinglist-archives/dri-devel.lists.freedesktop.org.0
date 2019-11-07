Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18574F2931
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 09:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB8D6EEF6;
	Thu,  7 Nov 2019 08:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0386EEF1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 08:34:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6A5CAB1F9;
 Thu,  7 Nov 2019 08:34:07 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v2 4/9] drm/ast: Split ast_set_ext_reg() into color and
 threshold function
Date: Thu,  7 Nov 2019 09:33:59 +0100
Message-Id: <20191107083404.6852-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107083404.6852-1-tzimmermann@suse.de>
References: <20191107083404.6852-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gYXN0X3NldF9leHRfcmVnKCkgc2V0cyBzZXZlcmFsIGZyYW1lYnVmZmVyIG9wdGlvbnMgYW5k
IENSVCB0aHJlc2hvbGQKcGFyYW1ldGVycy4gVGhlIGZvcm1lciBpcyBtb3N0bHkgc3RhdGUgb2Yg
dGhlIHByaW1hcnkgcGxhbmU7IHRoZSBsYXR0ZXIKaXMgY29uc3RhbnQuIEhlbmNlLCBzcGxpdCB0
aGUgZnVuY3Rpb24gaW4gdHdvIGFuZCBtYWtlIGl0IHdvcmsgd2l0aAphdG9taWMgbW9kZXNldHRp
bmcuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4KQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDE1ICsrKysrKysrKystLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9k
ZS5jCmluZGV4IGIzZjgyYzJkMjc0ZC4uNWZlYjY4NzE5MWUwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9k
ZS5jCkBAIC00MTksMTEgKzQxOSwxMCBAQCBzdGF0aWMgdm9pZCBhc3Rfc2V0X2RjbGtfcmVnKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptbwogCQkJICAg
ICAgICgoY2xrX2luZm8tPnBhcmFtMyAmIDB4MykgPDwgNCkpOwogfQogCi1zdGF0aWMgdm9pZCBh
c3Rfc2V0X2V4dF9yZWcoc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSAqbW9kZSwKLQkJCSAgICAgc3RydWN0IGFzdF92Ymlvc19tb2RlX2luZm8gKnZiaW9zX21v
ZGUpCitzdGF0aWMgdm9pZCBhc3Rfc2V0X2NvbG9yX3JlZyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
CisJCQkgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYikKIHsKIAlzdHJ1Y3Qg
YXN0X3ByaXZhdGUgKmFzdCA9IGNydGMtPmRldi0+ZGV2X3ByaXZhdGU7Ci0JY29uc3Qgc3RydWN0
IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBjcnRjLT5wcmltYXJ5LT5mYjsKIAl1OCBqcmVnQTAgPSAw
LCBqcmVnQTMgPSAwLCBqcmVnQTggPSAwOwogCiAJc3dpdGNoIChmYi0+Zm9ybWF0LT5jcHBbMF0g
KiA4KSB7CkBAIC00NDgsNiArNDQ3LDExIEBAIHN0YXRpYyB2b2lkIGFzdF9zZXRfZXh0X3JlZyhz
dHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlCiAJYXN0
X3NldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19DUlRDX1BPUlQsIDB4YTAsIDB4OGYsIGpy
ZWdBMCk7CiAJYXN0X3NldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19DUlRDX1BPUlQsIDB4
YTMsIDB4ZjAsIGpyZWdBMyk7CiAJYXN0X3NldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19D
UlRDX1BPUlQsIDB4YTgsIDB4ZmQsIGpyZWdBOCk7Cit9CisKK3N0YXRpYyB2b2lkIGFzdF9zZXRf
Y3J0dGhkX3JlZyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCit7CisJc3RydWN0IGFzdF9wcml2YXRl
ICphc3QgPSBjcnRjLT5kZXYtPmRldl9wcml2YXRlOwogCiAJLyogU2V0IFRocmVzaG9sZCAqLwog
CWlmIChhc3QtPmNoaXAgPT0gQVNUMjMwMCB8fCBhc3QtPmNoaXAgPT0gQVNUMjQwMCB8fApAQCAt
NDY3LDcgKzQ3MSw3IEBAIHN0YXRpYyB2b2lkIGFzdF9zZXRfZXh0X3JlZyhzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMsIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlCiB9CiAKIHN0YXRpYyB2b2lk
IGFzdF9zZXRfc3luY19yZWcoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgKm1vZGUsCi0JCSAgICAgIHN0cnVjdCBhc3RfdmJpb3NfbW9kZV9pbmZvICp2Ymlv
c19tb2RlKQorCQkJICAgICBzdHJ1Y3QgYXN0X3ZiaW9zX21vZGVfaW5mbyAqdmJpb3NfbW9kZSkK
IHsKIAlzdHJ1Y3QgYXN0X3ByaXZhdGUgKmFzdCA9IGRldi0+ZGV2X3ByaXZhdGU7CiAJdTgganJl
ZzsKQEAgLTU5NSw3ICs1OTksOCBAQCBzdGF0aWMgaW50IGFzdF9jcnRjX21vZGVfc2V0KHN0cnVj
dCBkcm1fY3J0YyAqY3J0YywKIAlhc3Rfc2V0X2NydGNfcmVnKGNydGMsIGFkanVzdGVkX21vZGUs
ICZ2Ymlvc19tb2RlKTsKIAlhc3Rfc2V0X29mZnNldF9yZWcoY3J0Yyk7CiAJYXN0X3NldF9kY2xr
X3JlZyhkZXYsIGFkanVzdGVkX21vZGUsICZ2Ymlvc19tb2RlKTsKLQlhc3Rfc2V0X2V4dF9yZWco
Y3J0YywgYWRqdXN0ZWRfbW9kZSwgJnZiaW9zX21vZGUpOworCWFzdF9zZXRfY29sb3JfcmVnKGNy
dGMsIGZiKTsKKwlhc3Rfc2V0X2NydHRoZF9yZWcoY3J0Yyk7CiAJYXN0X3NldF9zeW5jX3JlZyhk
ZXYsIGFkanVzdGVkX21vZGUsICZ2Ymlvc19tb2RlKTsKIAlhc3Rfc2V0X2RhY19yZWcoY3J0Yywg
YWRqdXN0ZWRfbW9kZSwgJnZiaW9zX21vZGUpOwogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
