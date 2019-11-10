Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D495DF69D1
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 16:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764166E0A5;
	Sun, 10 Nov 2019 15:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DC96E0A6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 15:41:16 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-Smr2AEAMNje--cLP4S7yEg-1; Sun, 10 Nov 2019 10:41:14 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF26A1005510;
 Sun, 10 Nov 2019 15:41:12 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-82.ams2.redhat.com
 [10.36.116.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4715E608BB;
 Sun, 10 Nov 2019 15:41:11 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 04/12] drm/modes: parse_cmdline: Accept extras directly after
 mode combined with options
Date: Sun, 10 Nov 2019 16:40:53 +0100
Message-Id: <20191110154101.26486-5-hdegoede@redhat.com>
In-Reply-To: <20191110154101.26486-1-hdegoede@redhat.com>
References: <20191110154101.26486-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Smr2AEAMNje--cLP4S7yEg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573400475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPazx4eambYwcdtPnn/ag2QQALZ8BiQd4k7CLdzKwSY=;
 b=BFIKCyE9cD3mXEUEey/vXfVrvd1G+t9sXz6jR/+i9w6lcdcVFHp3ttS7REOw7+c8fAot93
 UPGybscGCWViLfL99OXgk84HVqBUNcyhMq4Vtts52spl6fNr2QwlnrG9IB4pBF2VPQKK1L
 b9RTqG+nOtO1uRpxluU3xVrH+G0fSx0=
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
YWZ0ZXIgdGhlIHJlc29sdXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVn
b2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyAgICAgICAg
ICAgICAgICAgICB8ICAxICsKIC4uLi9ncHUvZHJtL3NlbGZ0ZXN0cy9kcm1fY21kbGluZV9zZWxm
dGVzdHMuaCB8ICAxICsKIC4uLi9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2NtZGxpbmVfcGFyc2Vy
LmMgICB8IDI0ICsrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fbW9kZXMuYwppbmRleCBhOGFhNzk1NWZkNDUuLmY0OTQwMTEyNDcyNyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbW9kZXMuYwpAQCAtMTc5NCw2ICsxNzk0LDcgQEAgYm9vbCBkcm1fbW9kZV9wYXJz
ZV9jb21tYW5kX2xpbmVfZm9yX2Nvbm5lY3Rvcihjb25zdCBjaGFyICptb2RlX29wdGlvbiwKIAkJ
bW9kZV9lbmQgPSByZWZyZXNoX29mZjsKIAl9IGVsc2UgaWYgKG9wdGlvbnNfcHRyKSB7CiAJCW1v
ZGVfZW5kID0gb3B0aW9uc19vZmY7CisJCXBhcnNlX2V4dHJhcyA9IHRydWU7CiAJfSBlbHNlIHsK
IAkJbW9kZV9lbmQgPSBzdHJsZW4obmFtZSk7CiAJCXBhcnNlX2V4dHJhcyA9IHRydWU7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL2RybV9jbWRsaW5lX3NlbGZ0ZXN0cy5o
IGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy9kcm1fY21kbGluZV9zZWxmdGVzdHMuaAppbmRl
eCBjYTFmYzdhNzg5NTMuLjAwM2UyYzNmZmMzOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3NlbGZ0ZXN0cy9kcm1fY21kbGluZV9zZWxmdGVzdHMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
c2VsZnRlc3RzL2RybV9jbWRsaW5lX3NlbGZ0ZXN0cy5oCkBAIC02MSwzICs2MSw0IEBAIGNtZGxp
bmVfdGVzdChkcm1fY21kbGluZV90ZXN0X21hcmdpbl9vcHRpb25zKQogY21kbGluZV90ZXN0KGRy
bV9jbWRsaW5lX3Rlc3RfbXVsdGlwbGVfb3B0aW9ucykKIGNtZGxpbmVfdGVzdChkcm1fY21kbGlu
ZV90ZXN0X2ludmFsaWRfb3B0aW9uKQogY21kbGluZV90ZXN0KGRybV9jbWRsaW5lX3Rlc3RfYnBw
X2V4dHJhX2FuZF9vcHRpb24pCitjbWRsaW5lX3Rlc3QoZHJtX2NtZGxpbmVfdGVzdF9leHRyYV9h
bmRfb3B0aW9uKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRy
bV9jbWRsaW5lX3BhcnNlci5jIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9j
bWRsaW5lX3BhcnNlci5jCmluZGV4IDViOGRlYTkyMjI1Ny4uYmM0ZGIwMTdlOTkzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2NtZGxpbmVfcGFyc2VyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9jbWRsaW5lX3BhcnNlci5j
CkBAIC0xMDE4LDYgKzEwMTgsMzAgQEAgc3RhdGljIGludCBkcm1fY21kbGluZV90ZXN0X2JwcF9l
eHRyYV9hbmRfb3B0aW9uKHZvaWQgKmlnbm9yZWQpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBp
bnQgZHJtX2NtZGxpbmVfdGVzdF9leHRyYV9hbmRfb3B0aW9uKHZvaWQgKmlnbm9yZWQpCit7CisJ
c3RydWN0IGRybV9jbWRsaW5lX21vZGUgbW9kZSA9IHsgfTsKKworCUZBSUxfT04oIWRybV9tb2Rl
X3BhcnNlX2NvbW1hbmRfbGluZV9mb3JfY29ubmVjdG9yKCI3MjB4NDgwZSxyb3RhdGU9MTgwIiwK
KwkJCQkJCQkgICAmbm9fY29ubmVjdG9yLAorCQkJCQkJCSAgICZtb2RlKSk7CisJRkFJTF9PTigh
bW9kZS5zcGVjaWZpZWQpOworCUZBSUxfT04obW9kZS54cmVzICE9IDcyMCk7CisJRkFJTF9PTiht
b2RlLnlyZXMgIT0gNDgwKTsKKwlGQUlMX09OKG1vZGUucm90YXRpb25fcmVmbGVjdGlvbiAhPSBE
Uk1fTU9ERV9ST1RBVEVfMTgwKTsKKworCUZBSUxfT04obW9kZS5yZWZyZXNoX3NwZWNpZmllZCk7
CisJRkFJTF9PTihtb2RlLmJwcF9zcGVjaWZpZWQpOworCisJRkFJTF9PTihtb2RlLnJiKTsKKwlG
QUlMX09OKG1vZGUuY3Z0KTsKKwlGQUlMX09OKG1vZGUuaW50ZXJsYWNlKTsKKwlGQUlMX09OKG1v
ZGUubWFyZ2lucyk7CisJRkFJTF9PTihtb2RlLmZvcmNlICE9IERSTV9GT1JDRV9PTik7CisKKwly
ZXR1cm4gMDsKK30KKwogI2luY2x1ZGUgImRybV9zZWxmdGVzdC5jIgogCiBzdGF0aWMgaW50IF9f
aW5pdCB0ZXN0X2RybV9jbWRsaW5lX2luaXQodm9pZCkKLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
