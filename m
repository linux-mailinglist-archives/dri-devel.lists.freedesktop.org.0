Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D22114DDF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 10:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178D36F980;
	Fri,  6 Dec 2019 09:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEB56F977
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 09:00:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91FE1B1B0;
 Fri,  6 Dec 2019 08:59:58 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH v2 5/7] drm/udl: Move log-cpp code out of udl_damage_handler()
Date: Fri,  6 Dec 2019 09:59:52 +0100
Message-Id: <20191206085954.9697-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191206085954.9697-1-tzimmermann@suse.de>
References: <20191206085954.9697-1-tzimmermann@suse.de>
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
Z25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpSZXZp
ZXdlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KQWNrZWQt
Ynk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS91ZGwvdWRsX2ZiLmMgfCAxNyArKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMKaW5kZXggY2My
YTA5YTk5NWI4Li40ODI3ODZlZWVhNmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX2ZiLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIuYwpAQCAtNTgsNiArNTgs
MTMgQEAgc3RhdGljIHVpbnQxNl90IHJnYjE2KHVpbnQzMl90IGNvbCkKIH0KICNlbmRpZgogCitz
dGF0aWMgbG9uZyB1ZGxfbG9nX2NwcCh1bnNpZ25lZCBpbnQgY3BwKQoreworCWlmIChXQVJOX09O
KCFpc19wb3dlcl9vZl8yKGNwcCkpKQorCQlyZXR1cm4gLUVJTlZBTDsKKwlyZXR1cm4gX19mZnMo
Y3BwKTsKK30KKwogc3RhdGljIGludCB1ZGxfYWxpZ25lZF9kYW1hZ2VfY2xpcChzdHJ1Y3QgZHJt
X3JlY3QgKmNsaXAsIGludCB4LCBpbnQgeSwKIAkJCQkgICBpbnQgd2lkdGgsIGludCBoZWlnaHQp
CiB7CkBAIC05MiwxMSArOTksNiBAQCBpbnQgdWRsX2hhbmRsZV9kYW1hZ2Uoc3RydWN0IGRybV9m
cmFtZWJ1ZmZlciAqZmIsIGludCB4LCBpbnQgeSwKIAlpbnQgbG9nX2JwcDsKIAl2b2lkICp2YWRk
cjsKIAotCWlmIChXQVJOX09OKCFpc19wb3dlcl9vZl8yKGZiLT5mb3JtYXQtPmNwcFswXSkpKQot
CQlyZXR1cm4gLUVJTlZBTDsKLQotCWxvZ19icHAgPSBfX2ZmcyhmYi0+Zm9ybWF0LT5jcHBbMF0p
OwotCiAJc3Bpbl9sb2NrKCZ1ZGwtPmFjdGl2ZV9mYl8xNl9sb2NrKTsKIAlpZiAodWRsLT5hY3Rp
dmVfZmJfMTYgIT0gZmIpIHsKIAkJc3Bpbl91bmxvY2soJnVkbC0+YWN0aXZlX2ZiXzE2X2xvY2sp
OwpAQCAtMTA0LDYgKzEwNiwxMSBAQCBpbnQgdWRsX2hhbmRsZV9kYW1hZ2Uoc3RydWN0IGRybV9m
cmFtZWJ1ZmZlciAqZmIsIGludCB4LCBpbnQgeSwKIAl9CiAJc3Bpbl91bmxvY2soJnVkbC0+YWN0
aXZlX2ZiXzE2X2xvY2spOwogCisJcmV0ID0gdWRsX2xvZ19jcHAoZmItPmZvcm1hdC0+Y3BwWzBd
KTsKKwlpZiAocmV0IDwgMCkKKwkJcmV0dXJuIHJldDsKKwlsb2dfYnBwID0gcmV0OworCiAJcmV0
ID0gdWRsX2FsaWduZWRfZGFtYWdlX2NsaXAoJmNsaXAsIHgsIHksIHdpZHRoLCBoZWlnaHQpOwog
CWlmIChyZXQpCiAJCXJldHVybiByZXQ7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
