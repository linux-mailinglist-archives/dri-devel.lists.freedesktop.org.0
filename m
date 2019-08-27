Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 741D99E736
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 13:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F0A899A5;
	Tue, 27 Aug 2019 11:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD92989AEE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 11:58:59 +0000 (UTC)
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 436C620828;
 Tue, 27 Aug 2019 11:58:59 +0000 (UTC)
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/4] drm/modes: Fix the command line parser to take force
 options into account
Date: Tue, 27 Aug 2019 13:58:48 +0200
Message-Id: <20190827115850.25731-2-mripard@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190827115850.25731-1-mripard@kernel.org>
References: <20190827115850.25731-1-mripard@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566907139;
 bh=YUASR9owd7rCnOfYwPnEgXHfzoDhqoeC2LjWhKKLPeY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qwX1/tkMs5q+spUzUY5jjZ5J2d0CGbPLF0MCA7bUpyvNHn0flMxmEvdw0ijr6LVsL
 zMbFfsysqoARPiWcMuohAYV7e71hIpsfTye/tR94XMfdK1+Vfn7jITT/ypgzAYBt0z
 JO079Kqj26QVlNWVNqlOr50ZCQkDfKY4ILbOosLU=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, jernej.skrabec@gmail.com,
 thomas.graichen@googlemail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KClRoZSBjb21t
YW5kIGxpbmUgcGFyc2VyIHdoZW4gaXQgaGFzIGJlZW4gcmV3cml0dGVuIGludHJvZHVjZWQgYSBy
ZWdyZXNzaW9uCndoZW4gdGhlIG9ubHkgdGhpbmcgb24gdGhlIGNvbW1hbmQgbGluZSBpcyBhbiBv
cHRpb24gdG8gZm9yY2UgdGhlIGRldGVjdGlvbgpvZiBhIGNvbm5lY3RvciAoc3VjaCBhcyB2aWRl
bz1IRE1JLUEtMTpkKSwgd2hpY2ggYXJlIGNvbXBsZXRlbHkgdmFsaWQuCgpJdCdzIGJlZW4gZnVy
dGhlciBicm9rZW4gYnkgdGhlIHN1cHBvcnQgZm9yIHRoZSBuYW1lZCBtb2RlcyB3aGljaCB0YWtl
CmFueXRoaW5nIHRoYXQgaXMgbm90IGEgcmVzb2x1dGlvbiBhcyBhIG5hbWVkIG1vZGUuCgpMZXQn
cyBmaXggdGhpcyBieSBydW5uaW5nIHRoZSBleHRyYSBjb21tYW5kIGxpbmUgb3B0aW9uIHBhcnNl
ciBvbiB0aGUgbmFtZWQKbW9kZXMgaWYgdGhleSBvbmx5IHRha2UgYSBzaW5nbGUgY2hhcmFjdGVy
LgoKRml4ZXM6IGUwOGFiNzRiZDRjNyAoImRybS9tb2RlczogUmV3cml0ZSB0aGUgY29tbWFuZCBs
aW5lIHBhcnNlciIpClJlcG9ydGVkLWJ5OiBKZXJuZWogxaBrcmFiZWMgPGplcm5lai5za3JhYmVj
QGdtYWlsLmNvbT4KUmVwb3J0ZWQtYnk6IFRob21hcyBHcmFpY2hlbiA8dGhvbWFzLmdyYWljaGVu
QGdvb2dsZW1haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyB8IDI0ICsr
KysrKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCmluZGV4IGU1OTk3ZjM1Yjc3OS4uZWE3ZTZj
OGM4MzE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCkBAIC0xNzMzLDE2ICsxNzMzLDMwIEBAIGJvb2wgZHJt
X21vZGVfcGFyc2VfY29tbWFuZF9saW5lX2Zvcl9jb25uZWN0b3IoY29uc3QgY2hhciAqbW9kZV9v
cHRpb24sCiAJICogYnVuY2ggb2YgdGhpbmdzOgogCSAqICAgLSBXZSBuZWVkIHRvIG1ha2Ugc3Vy
ZSB0aGF0IHRoZSBmaXJzdCBjaGFyYWN0ZXIgKHdoaWNoCiAJICogICAgIHdvdWxkIGJlIG91ciBy
ZXNvbHV0aW9uIGluIFgpIGlzIGEgZGlnaXQuCi0JICogICAtIEhvd2V2ZXIsIGlmIHRoZSBYIHJl
c29sdXRpb24gaXMgbWlzc2luZywgdGhlbiB3ZSBlbmQgdXAKLQkgKiAgICAgd2l0aCBzb21ldGhp
bmcgbGlrZSB4PHlyZXM+LCB3aXRoIG91ciBmaXJzdCBjaGFyYWN0ZXIKLQkgKiAgICAgYmVpbmcg
YW4gYWxwaGEtbnVtZXJpY2FsIGNoYXJhY3Rlciwgd2hpY2ggd291bGQgYmUKLQkgKiAgICAgY29u
c2lkZXJlZCBhIG5hbWVkIG1vZGUuCisJICogICAtIElmIG5vdCwgdGhlbiBpdCdzIGVpdGhlciBh
IG5hbWVkIG1vZGUgb3IgYSBmb3JjZSBvbi9vZmYuCisJICogICAgIFRvIGRpc3Rpbmd1aXNoIGJl
dHdlZW4gdGhlIHR3bywgd2UgbmVlZCB0byBydW4gdGhlCisJICogICAgIGV4dHJhIHBhcnNpbmcg
ZnVuY3Rpb24sIGFuZCBpZiBub3QsIHRoZW4gd2UgY29uc2lkZXIgaXQKKwkgKiAgICAgYSBuYW1l
ZCBtb2RlLgogCSAqCiAJICogSWYgdGhpcyBpc24ndCBlbm91Z2gsIHdlIHNob3VsZCBhZGQgbW9y
ZSBoZXVyaXN0aWNzIGhlcmUsCiAJICogYW5kIG1hdGNoaW5nIHVuaXQtdGVzdHMuCiAJICovCi0J
aWYgKCFpc2RpZ2l0KG5hbWVbMF0pICYmIG5hbWVbMF0gIT0gJ3gnKQorCWlmICghaXNkaWdpdChu
YW1lWzBdKSAmJiBuYW1lWzBdICE9ICd4JykgeworCQl1bnNpZ25lZCBpbnQgbmFtZWxlbiA9IHN0
cmxlbihuYW1lKTsKKworCQkvKgorCQkgKiBPbmx5IHRoZSBmb3JjZSBvbi9vZmYgb3B0aW9ucyBj
YW4gYmUgaW4gdGhhdCBjYXNlLAorCQkgKiBhbmQgdGhleSBhbGwgdGFrZSBhIHNpbmdsZSBjaGFy
YWN0ZXIuCisJCSAqLworCQlpZiAobmFtZWxlbiA9PSAxKSB7CisJCQlyZXQgPSBkcm1fbW9kZV9w
YXJzZV9jbWRsaW5lX2V4dHJhKG5hbWUsIG5hbWVsZW4sIHRydWUsCisJCQkJCQkJICAgY29ubmVj
dG9yLCBtb2RlKTsKKwkJCWlmICghcmV0KQorCQkJCXJldHVybiB0cnVlOworCQl9CisKIAkJbmFt
ZWRfbW9kZSA9IHRydWU7CisJfQogCiAJLyogVHJ5IHRvIGxvY2F0ZSB0aGUgYnBwIGFuZCByZWZy
ZXNoIHNwZWNpZmllcnMsIGlmIGFueSAqLwogCWJwcF9wdHIgPSBzdHJjaHIobmFtZSwgJy0nKTsK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
