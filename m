Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC38A112C89
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 14:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6476F4A7;
	Wed,  4 Dec 2019 13:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A9F6F46A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 13:24:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3A36EB14E;
 Wed,  4 Dec 2019 13:24:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH 5/7] drm/udl: Move log-cpp code out of udl_damage_handler()
Date: Wed,  4 Dec 2019 14:24:28 +0100
Message-Id: <20191204132430.16874-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191204132430.16874-1-tzimmermann@suse.de>
References: <20191204132430.16874-1-tzimmermann@suse.de>
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

Q29tcHV0aW5nIHRoZSBjcHAgdmFsdWUncyBsb2dhcml0aG0gaW4gYSBzZXBhcmF0ZSBoZWxwZXIg
ZnVuY3Rpb24gbWFrZXMKdGhlIGRhbWFnZS1oYW5kbGVyIGNvZGUgbW9yZSByZWFkYWJsZS4KClNp
Z25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMgfCAxNyArKysrKysrKysrKystLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRs
X2ZiLmMKaW5kZXggY2MyYTA5YTk5NWI4Li40ODI3ODZlZWVhNmMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIu
YwpAQCAtNTgsNiArNTgsMTMgQEAgc3RhdGljIHVpbnQxNl90IHJnYjE2KHVpbnQzMl90IGNvbCkK
IH0KICNlbmRpZgogCitzdGF0aWMgbG9uZyB1ZGxfbG9nX2NwcCh1bnNpZ25lZCBpbnQgY3BwKQor
eworCWlmIChXQVJOX09OKCFpc19wb3dlcl9vZl8yKGNwcCkpKQorCQlyZXR1cm4gLUVJTlZBTDsK
KwlyZXR1cm4gX19mZnMoY3BwKTsKK30KKwogc3RhdGljIGludCB1ZGxfYWxpZ25lZF9kYW1hZ2Vf
Y2xpcChzdHJ1Y3QgZHJtX3JlY3QgKmNsaXAsIGludCB4LCBpbnQgeSwKIAkJCQkgICBpbnQgd2lk
dGgsIGludCBoZWlnaHQpCiB7CkBAIC05MiwxMSArOTksNiBAQCBpbnQgdWRsX2hhbmRsZV9kYW1h
Z2Uoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsIGludCB4LCBpbnQgeSwKIAlpbnQgbG9nX2Jw
cDsKIAl2b2lkICp2YWRkcjsKIAotCWlmIChXQVJOX09OKCFpc19wb3dlcl9vZl8yKGZiLT5mb3Jt
YXQtPmNwcFswXSkpKQotCQlyZXR1cm4gLUVJTlZBTDsKLQotCWxvZ19icHAgPSBfX2ZmcyhmYi0+
Zm9ybWF0LT5jcHBbMF0pOwotCiAJc3Bpbl9sb2NrKCZ1ZGwtPmFjdGl2ZV9mYl8xNl9sb2NrKTsK
IAlpZiAodWRsLT5hY3RpdmVfZmJfMTYgIT0gZmIpIHsKIAkJc3Bpbl91bmxvY2soJnVkbC0+YWN0
aXZlX2ZiXzE2X2xvY2spOwpAQCAtMTA0LDYgKzEwNiwxMSBAQCBpbnQgdWRsX2hhbmRsZV9kYW1h
Z2Uoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsIGludCB4LCBpbnQgeSwKIAl9CiAJc3Bpbl91
bmxvY2soJnVkbC0+YWN0aXZlX2ZiXzE2X2xvY2spOwogCisJcmV0ID0gdWRsX2xvZ19jcHAoZmIt
PmZvcm1hdC0+Y3BwWzBdKTsKKwlpZiAocmV0IDwgMCkKKwkJcmV0dXJuIHJldDsKKwlsb2dfYnBw
ID0gcmV0OworCiAJcmV0ID0gdWRsX2FsaWduZWRfZGFtYWdlX2NsaXAoJmNsaXAsIHgsIHksIHdp
ZHRoLCBoZWlnaHQpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7Ci0tIAoyLjIzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
