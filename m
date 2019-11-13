Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3D2FB579
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A606ED9E;
	Wed, 13 Nov 2019 16:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C80E6ED9E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 16:44:49 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-3UExovtpNZ6UbIRoqbwDSg-1; Wed, 13 Nov 2019 11:44:44 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4305B190AD58;
 Wed, 13 Nov 2019 16:44:43 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-143.ams2.redhat.com
 [10.36.116.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9D9910E1B43;
 Wed, 13 Nov 2019 16:44:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 04/13] drm/modes: parse_cmdline: Accept extras directly
 after mode combined with options
Date: Wed, 13 Nov 2019 17:44:25 +0100
Message-Id: <20191113164434.254159-4-hdegoede@redhat.com>
In-Reply-To: <20191113164434.254159-1-hdegoede@redhat.com>
References: <20191113164434.254159-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 3UExovtpNZ6UbIRoqbwDSg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573663488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iID3k7aimamLEWwnb58ogandZjzdVB9vX2zV/tttNTc=;
 b=hUn9W2r76vbHWQSE4B9zvgKPjm5bPkFyK2FM9hVjYzmdi8AwCV6UvmpR86iWE2J1m49yY1
 io7ZaDUAC5TH5++hSn7H7ZVfrFqgCLA60ePLx6GUZpw2C1oymiUmCbkjnf/+x6W3acz92+
 AOrh4MBorqE3C5HT5B+XmQPastfoSA8=
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Derek Basehore <dbasehore@chromium.org>,
 =?UTF-8?q?Mathieu=20Alexandre-T=C3=A9treault?= <alexandretm@amotus.ca>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVmb3JlIHRoaXMgY29tbWl0IGl0IHdhcyBpbXBvc3NpYmxlIHRvIGNvbWJpbmUgYW4gZXh0cmEg
bW9kZSBhcmd1bWVudApzcGVjaWZpZWQgZGlyZWN0bHkgYWZ0ZXIgdGhlIHJlc29sdXRpb24gd2l0
aCBhbiBvcHRpb24sIGUuZy4KdmlkZW89SERNSS0xOjcyMHg0ODBlLHJvdGF0ZT0xODAgd291bGQg
bm90IHdvcmssIGVpdGhlciB0aGUgImUiIHRvIGZvcmNlCmVuYWJsZSB3b3VsZCBuZWVkIHRvIGJl
IGRyb3BwZWQgb3IgdGhlICIscm90YXRlPTE4MCIsIG90aGVyd2lzZSB0aGUKbW9kZV9vcHRpb24g
d291bGQgbm90IGJlIGFjY2VwdGVkLgoKVGhpcyBjb21taXQgZml4ZXMgdGhpcyBieSBzZXR0aW5n
IHBhcnNlX2V4dHJhcyB0byB0cnVlIGluIHRoaXMgY2FzZSwgc28KdGhhdCBkcm1fbW9kZV9wYXJz
ZV9jbWRsaW5lX3Jlc19tb2RlKCkgcGFyc2VzIHRoZSBleHRyYSBhcmd1bWVudHMgZGlyZWN0bHkK
YWZ0ZXIgdGhlIHJlc29sdXRpb24uCgpBY2tlZC1ieTogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBr
ZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyAgICAgICAgICAgICAgICAgICB8
ICAxICsKIC4uLi9ncHUvZHJtL3NlbGZ0ZXN0cy9kcm1fY21kbGluZV9zZWxmdGVzdHMuaCB8ICAx
ICsKIC4uLi9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2NtZGxpbmVfcGFyc2VyLmMgICB8IDI0ICsr
KysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fbW9kZXMuYwppbmRleCBhOGFhNzk1NWZkNDUuLmY0OTQwMTEyNDcyNyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9k
ZXMuYwpAQCAtMTc5NCw2ICsxNzk0LDcgQEAgYm9vbCBkcm1fbW9kZV9wYXJzZV9jb21tYW5kX2xp
bmVfZm9yX2Nvbm5lY3Rvcihjb25zdCBjaGFyICptb2RlX29wdGlvbiwKIAkJbW9kZV9lbmQgPSBy
ZWZyZXNoX29mZjsKIAl9IGVsc2UgaWYgKG9wdGlvbnNfcHRyKSB7CiAJCW1vZGVfZW5kID0gb3B0
aW9uc19vZmY7CisJCXBhcnNlX2V4dHJhcyA9IHRydWU7CiAJfSBlbHNlIHsKIAkJbW9kZV9lbmQg
PSBzdHJsZW4obmFtZSk7CiAJCXBhcnNlX2V4dHJhcyA9IHRydWU7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL2RybV9jbWRsaW5lX3NlbGZ0ZXN0cy5oIGIvZHJpdmVycy9n
cHUvZHJtL3NlbGZ0ZXN0cy9kcm1fY21kbGluZV9zZWxmdGVzdHMuaAppbmRleCBjYTFmYzdhNzg5
NTMuLjAwM2UyYzNmZmMzOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy9k
cm1fY21kbGluZV9zZWxmdGVzdHMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL2Ry
bV9jbWRsaW5lX3NlbGZ0ZXN0cy5oCkBAIC02MSwzICs2MSw0IEBAIGNtZGxpbmVfdGVzdChkcm1f
Y21kbGluZV90ZXN0X21hcmdpbl9vcHRpb25zKQogY21kbGluZV90ZXN0KGRybV9jbWRsaW5lX3Rl
c3RfbXVsdGlwbGVfb3B0aW9ucykKIGNtZGxpbmVfdGVzdChkcm1fY21kbGluZV90ZXN0X2ludmFs
aWRfb3B0aW9uKQogY21kbGluZV90ZXN0KGRybV9jbWRsaW5lX3Rlc3RfYnBwX2V4dHJhX2FuZF9v
cHRpb24pCitjbWRsaW5lX3Rlc3QoZHJtX2NtZGxpbmVfdGVzdF9leHRyYV9hbmRfb3B0aW9uKQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9jbWRsaW5lX3Bh
cnNlci5jIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9jbWRsaW5lX3BhcnNl
ci5jCmluZGV4IDViOGRlYTkyMjI1Ny4uYmM0ZGIwMTdlOTkzIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2NtZGxpbmVfcGFyc2VyLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9jbWRsaW5lX3BhcnNlci5jCkBAIC0xMDE4LDYg
KzEwMTgsMzAgQEAgc3RhdGljIGludCBkcm1fY21kbGluZV90ZXN0X2JwcF9leHRyYV9hbmRfb3B0
aW9uKHZvaWQgKmlnbm9yZWQpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgZHJtX2NtZGxp
bmVfdGVzdF9leHRyYV9hbmRfb3B0aW9uKHZvaWQgKmlnbm9yZWQpCit7CisJc3RydWN0IGRybV9j
bWRsaW5lX21vZGUgbW9kZSA9IHsgfTsKKworCUZBSUxfT04oIWRybV9tb2RlX3BhcnNlX2NvbW1h
bmRfbGluZV9mb3JfY29ubmVjdG9yKCI3MjB4NDgwZSxyb3RhdGU9MTgwIiwKKwkJCQkJCQkgICAm
bm9fY29ubmVjdG9yLAorCQkJCQkJCSAgICZtb2RlKSk7CisJRkFJTF9PTighbW9kZS5zcGVjaWZp
ZWQpOworCUZBSUxfT04obW9kZS54cmVzICE9IDcyMCk7CisJRkFJTF9PTihtb2RlLnlyZXMgIT0g
NDgwKTsKKwlGQUlMX09OKG1vZGUucm90YXRpb25fcmVmbGVjdGlvbiAhPSBEUk1fTU9ERV9ST1RB
VEVfMTgwKTsKKworCUZBSUxfT04obW9kZS5yZWZyZXNoX3NwZWNpZmllZCk7CisJRkFJTF9PTiht
b2RlLmJwcF9zcGVjaWZpZWQpOworCisJRkFJTF9PTihtb2RlLnJiKTsKKwlGQUlMX09OKG1vZGUu
Y3Z0KTsKKwlGQUlMX09OKG1vZGUuaW50ZXJsYWNlKTsKKwlGQUlMX09OKG1vZGUubWFyZ2lucyk7
CisJRkFJTF9PTihtb2RlLmZvcmNlICE9IERSTV9GT1JDRV9PTik7CisKKwlyZXR1cm4gMDsKK30K
KwogI2luY2x1ZGUgImRybV9zZWxmdGVzdC5jIgogCiBzdGF0aWMgaW50IF9faW5pdCB0ZXN0X2Ry
bV9jbWRsaW5lX2luaXQodm9pZCkKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
