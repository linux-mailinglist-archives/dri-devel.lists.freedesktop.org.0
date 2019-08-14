Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809AC8D290
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 13:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E658994D;
	Wed, 14 Aug 2019 11:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D5089189
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:54:57 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hxrrj-00036w-J9; Wed, 14 Aug 2019 13:54:55 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] gpu: ipu-v3: image-convert: bail on invalid tile sizes
Date: Wed, 14 Aug 2019 13:54:42 +0200
Message-Id: <20190814115444.13024-5-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814115444.13024-1-p.zabel@pengutronix.de>
References: <20190814115444.13024-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgd2UgbWFuYWdlZCB0byBjcmVhdGUgdGlsZXMgc2l6ZWQgMHgwIGJlY2F1c2Ugb2YgYSBidWcg
aW4gdGhlIHNlYW0KY2FsY3VsYXRpb24sIHJldHVybiB3aXRoIGFuIGVycm9yIG1lc3NhZ2UgaW5z
dGVhZCBvZiBsZXR0aW5nIHRoZSBkcml2ZXIKcnVuIGludG8gYSBkaXZpc2lvbiBieSB6ZXJvIGxh
dGVyLiBBbHNvIGNoZWNrIGZvciB0aWxlIHNpemVzIHRoYXQgYXJlCmxhcmdlciB0aGFuIHN1cHBv
cnRlZCBieSB0aGUgaGFyZHdhcmUuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnph
YmVsQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvZ3B1L2lwdS12My9pcHUtaW1hZ2UtY29u
dmVydC5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2lwdS12My9pcHUtaW1hZ2UtY29udmVydC5jIGIvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1pbWFn
ZS1jb252ZXJ0LmMKaW5kZXggY2NmMTFiNjU0YjU4Li5hY2U4MzFjNTRlZDcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2lwdS12My9pcHUtaW1hZ2UtY29udmVydC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2lwdS12My9pcHUtaW1hZ2UtY29udmVydC5jCkBAIC04MzQsMTMgKzgzNCwyMSBAQCBzdGF0aWMg
dm9pZCBmaW5kX3NlYW1zKHN0cnVjdCBpcHVfaW1hZ2VfY29udmVydF9jdHggKmN0eCwKIAkJaW5f
Ym90dG9tLCBmbGlwcGVkX291dF90b3AsIG91dF9ib3R0b20pOwogfQogCi1zdGF0aWMgdm9pZCBj
YWxjX3RpbGVfZGltZW5zaW9ucyhzdHJ1Y3QgaXB1X2ltYWdlX2NvbnZlcnRfY3R4ICpjdHgsCi0J
CQkJIHN0cnVjdCBpcHVfaW1hZ2VfY29udmVydF9pbWFnZSAqaW1hZ2UpCitzdGF0aWMgaW50IGNh
bGNfdGlsZV9kaW1lbnNpb25zKHN0cnVjdCBpcHVfaW1hZ2VfY29udmVydF9jdHggKmN0eCwKKwkJ
CQlzdHJ1Y3QgaXB1X2ltYWdlX2NvbnZlcnRfaW1hZ2UgKmltYWdlKQogewogCXN0cnVjdCBpcHVf
aW1hZ2VfY29udmVydF9jaGFuICpjaGFuID0gY3R4LT5jaGFuOwogCXN0cnVjdCBpcHVfaW1hZ2Vf
Y29udmVydF9wcml2ICpwcml2ID0gY2hhbi0+cHJpdjsKKwl1bnNpZ25lZCBpbnQgbWF4X3dpZHRo
ID0gMTAyNDsKKwl1bnNpZ25lZCBpbnQgbWF4X2hlaWdodCA9IDEwMjQ7CiAJdW5zaWduZWQgaW50
IGk7CiAKKwlpZiAoaW1hZ2UtPnR5cGUgPT0gSU1BR0VfQ09OVkVSVF9JTikgeworCQkvKiBVcCB0
byA0MDk2eDQwOTYgaW5wdXQgdGlsZSBzaXplICovCisJCW1heF93aWR0aCA8PD0gY3R4LT5kb3du
c2l6ZV9jb2VmZl9oOworCQltYXhfaGVpZ2h0IDw8PSBjdHgtPmRvd25zaXplX2NvZWZmX3Y7CisJ
fQorCiAJZm9yIChpID0gMDsgaSA8IGN0eC0+bnVtX3RpbGVzOyBpKyspIHsKIAkJc3RydWN0IGlw
dV9pbWFnZV90aWxlICp0aWxlOwogCQljb25zdCB1bnNpZ25lZCBpbnQgcm93ID0gaSAvIGltYWdl
LT5udW1fY29sczsKQEAgLTg3MCw3ICs4NzgsMTcgQEAgc3RhdGljIHZvaWQgY2FsY190aWxlX2Rp
bWVuc2lvbnMoc3RydWN0IGlwdV9pbWFnZV9jb252ZXJ0X2N0eCAqY3R4LAogCQkJaW1hZ2UtPnR5
cGUgPT0gSU1BR0VfQ09OVkVSVF9JTiA/ICJJbnB1dCIgOiAiT3V0cHV0IiwKIAkJCXJvdywgY29s
LAogCQkJdGlsZS0+d2lkdGgsIHRpbGUtPmhlaWdodCwgdGlsZS0+bGVmdCwgdGlsZS0+dG9wKTsK
KworCQlpZiAoIXRpbGUtPndpZHRoIHx8IHRpbGUtPndpZHRoID4gbWF4X3dpZHRoIHx8CisJCSAg
ICAhdGlsZS0+aGVpZ2h0IHx8IHRpbGUtPmhlaWdodCA+IG1heF9oZWlnaHQpIHsKKwkJCWRldl9l
cnIocHJpdi0+aXB1LT5kZXYsICJpbnZhbGlkICVzIHRpbGUgc2l6ZTogJXV4JXVcbiIsCisJCQkJ
aW1hZ2UtPnR5cGUgPT0gSU1BR0VfQ09OVkVSVF9JTiA/ICJpbnB1dCIgOgorCQkJCSJvdXRwdXQi
LCB0aWxlLT53aWR0aCwgdGlsZS0+aGVpZ2h0KTsKKwkJCXJldHVybiAtRUlOVkFMOworCQl9CiAJ
fQorCisJcmV0dXJuIDA7CiB9CiAKIC8qCkBAIC0yMDgxLDcgKzIwOTksMTAgQEAgaXB1X2ltYWdl
X2NvbnZlcnRfcHJlcGFyZShzdHJ1Y3QgaXB1X3NvYyAqaXB1LCBlbnVtIGlwdV9pY190YXNrIGlj
X3Rhc2ssCiAKIAlmaW5kX3NlYW1zKGN0eCwgc19pbWFnZSwgZF9pbWFnZSk7CiAKLQljYWxjX3Rp
bGVfZGltZW5zaW9ucyhjdHgsIHNfaW1hZ2UpOworCXJldCA9IGNhbGNfdGlsZV9kaW1lbnNpb25z
KGN0eCwgc19pbWFnZSk7CisJaWYgKHJldCkKKwkJZ290byBvdXRfZnJlZTsKKwogCXJldCA9IGNh
bGNfdGlsZV9vZmZzZXRzKGN0eCwgc19pbWFnZSk7CiAJaWYgKHJldCkKIAkJZ290byBvdXRfZnJl
ZTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
