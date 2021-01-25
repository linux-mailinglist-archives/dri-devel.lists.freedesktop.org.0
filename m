Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5333A302A8B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 19:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAC389D40;
	Mon, 25 Jan 2021 18:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEB589D40
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 18:43:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E463206FA;
 Mon, 25 Jan 2021 18:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611600214;
 bh=NalgFaZxeCG4MOFTWsJoR7g3pn9r0ZIB6BPUDqTqA8I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mJFktSacsAkhJ6xfrOaVYoOzA4H8vib+raC+gsUC2UQ266j40eRhLKvCMqHHL0xvW
 4cZ7JtQ6mwEZSYhuBj4k4ONHEjjc9gkRDZQrXXdDAIfuxXRq28nxYU7fjKxythUY6a
 +edD3yN4kyRgRTxi/Z8BdaYsSFB0nYTvhS1mXWI8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.4 16/86] drm/syncobj: Fix use-after-free
Date: Mon, 25 Jan 2021 19:38:58 +0100
Message-Id: <20210125183201.728770789@linuxfoundation.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210125183201.024962206@linuxfoundation.org>
References: <20210125183201.024962206@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCmNvbW1pdCBhMzdl
ZWY2M2JjOWUxNmUwNjM2MWI1MzllNTI4MDU4MTQ2YWY4MGFiIHVwc3RyZWFtLgoKV2hpbGUgcmV2
aWV3aW5nIENocmlzdGlhbidzIGFubm90YXRpb24gcGF0Y2ggSSBub3RpY2VkIHRoYXQgd2UgaGF2
ZSBhCnVzZXItYWZ0ZXItZnJlZSBmb3IgdGhlIFdBSVRfRk9SX1NVQk1JVCBjYXNlOiBXZSBkcm9w
IHRoZSBzeW5jb2JqCnJlZmVyZW5jZSBiZWZvcmUgd2UndmUgY29tcGxldGVkIHRoZSB3YWl0aW5n
LgoKT2YgY291cnNlIHVzdWFsbHkgdGhlcmUncyBub3RoaW5nIGJhZCBoYXBwZW5pbmcgaGVyZSBz
aW5jZSB1c2Vyc3BhY2UKa2VlcHMgdGhlIHJlZmVyZW5jZSwgYnV0IHdlIGNhbid0IHJlbHkgb24g
dXNlcnNwYWNlIHRvIHBsYXkgbmljZSBoZXJlIQoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkZpeGVzOiBiYzljODBmZTAxYTIgKCJkcm0vc3lu
Y29iajogdXNlIHRoZSB0aW1lbGluZSBwb2ludCBpbiBkcm1fc3luY29ial9maW5kX2ZlbmNlIHY0
IikKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IExp
b25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KQ2M6IE1hYXJ0
ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhp
bWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY1LjIrCkxpbms6IGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDIxMDExOTEzMDMx
OC42MTUxNDUtMS1kYW5pZWwudmV0dGVyQGZmd2xsLmNoClNpZ25lZC1vZmYtYnk6IEdyZWcgS3Jv
YWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fc3luY29iai5jIHwgICAgOCArKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lu
Y29iai5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCkBAIC0zMjYsMTkgKzMy
NiwxOCBAQCBpbnQgZHJtX3N5bmNvYmpfZmluZF9mZW5jZShzdHJ1Y3QgZHJtX2ZpCiAJCXJldHVy
biAtRU5PRU5UOwogCiAJKmZlbmNlID0gZHJtX3N5bmNvYmpfZmVuY2VfZ2V0KHN5bmNvYmopOwot
CWRybV9zeW5jb2JqX3B1dChzeW5jb2JqKTsKIAogCWlmICgqZmVuY2UpIHsKIAkJcmV0ID0gZG1h
X2ZlbmNlX2NoYWluX2ZpbmRfc2Vxbm8oZmVuY2UsIHBvaW50KTsKIAkJaWYgKCFyZXQpCi0JCQly
ZXR1cm4gMDsKKwkJCWdvdG8gb3V0OwogCQlkbWFfZmVuY2VfcHV0KCpmZW5jZSk7CiAJfSBlbHNl
IHsKIAkJcmV0ID0gLUVJTlZBTDsKIAl9CiAKIAlpZiAoIShmbGFncyAmIERSTV9TWU5DT0JKX1dB
SVRfRkxBR1NfV0FJVF9GT1JfU1VCTUlUKSkKLQkJcmV0dXJuIHJldDsKKwkJZ290byBvdXQ7CiAK
IAltZW1zZXQoJndhaXQsIDAsIHNpemVvZih3YWl0KSk7CiAJd2FpdC50YXNrID0gY3VycmVudDsK
QEAgLTM3MCw2ICszNjksOSBAQCBpbnQgZHJtX3N5bmNvYmpfZmluZF9mZW5jZShzdHJ1Y3QgZHJt
X2ZpCiAJaWYgKHdhaXQubm9kZS5uZXh0KQogCQlkcm1fc3luY29ial9yZW1vdmVfd2FpdChzeW5j
b2JqLCAmd2FpdCk7CiAKK291dDoKKwlkcm1fc3luY29ial9wdXQoc3luY29iaik7CisKIAlyZXR1
cm4gcmV0OwogfQogRVhQT1JUX1NZTUJPTChkcm1fc3luY29ial9maW5kX2ZlbmNlKTsKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
