Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1577FA22F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 03:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AD86EC58;
	Wed, 13 Nov 2019 02:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6288941D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 02:02:25 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCC50204EC;
 Wed, 13 Nov 2019 02:02:24 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 32/48] fbdev: sbuslib: use checked version of
 put_user()
Date: Tue, 12 Nov 2019 21:01:15 -0500
Message-Id: <20191113020131.13356-32-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113020131.13356-1-sashal@kernel.org>
References: <20191113020131.13356-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573610545;
 bh=sRrLkyUGgCKpwty94eVo3szlNVzGQWCr0iIWSeGW3dI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vt5Vy3ufTvimNav0XOMmJEvNA3X5/eAtEAH4BB3yaoxTL5F+F+SGrsK3l+chWCcPK
 61j6CR12prTjfwpbS2+6C0IS9YtIo2+4Y4R3Wt51+6QySHKdQ7PbnTw+1SIdssBp4h
 Lci3SJoRpEbtpUqmh/mk1VqVsXscNSEYFgQK1arA=
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mathieu Malaterre <malat@debian.org>, dri-devel@lists.freedesktop.org,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Peter Malone <peter.malone@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgZDhiYWQ5MTFlNWU1NWUyMjhkNTljMDYwNmZmN2U2YjgxMzFjYTdiZiBdCgpJJ20g
bm90IHN1cmUgd2h5IHRoZSBjb2RlIGFzc3VtZXMgdGhhdCBvbmx5IHRoZSBmaXJzdCBwdXRfdXNl
cigpIG5lZWRzCmFuIGFjY2Vzc19vaygpIGNoZWNrLiAgSSBoYXZlIG1hZGUgYWxsIHRoZSBwdXRf
dXNlcigpIGFuZCBnZXRfdXNlcigpCmNhbGxzIGNoZWNrZWQuCgpTaWduZWQtb2ZmLWJ5OiBEYW4g
Q2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CkNjOiBQaGlsaXBwZSBPbWJyZWRh
bm5lIDxwb21icmVkYW5uZUBuZXhiLmNvbT4KQ2M6IE1hdGhpZXUgTWFsYXRlcnJlIDxtYWxhdEBk
ZWJpYW4ub3JnPgpDYzogUGV0ZXIgTWFsb25lIDxwZXRlci5tYWxvbmVAZ21haWwuY29tPiwKU2ln
bmVkLW9mZi1ieTogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1
bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0t
LQogZHJpdmVycy92aWRlby9mYmRldi9zYnVzbGliLmMgfCAyNiArKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2J1c2xpYi5jIGIvZHJpdmVycy92
aWRlby9mYmRldi9zYnVzbGliLmMKaW5kZXggMzFjMzAxZDZiZTYyMS4uYjQyNTcxODkyNWMwMSAx
MDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9zYnVzbGliLmMKKysrIGIvZHJpdmVycy92
aWRlby9mYmRldi9zYnVzbGliLmMKQEAgLTEwNSwxMSArMTA1LDExIEBAIGludCBzYnVzZmJfaW9j
dGxfaGVscGVyKHVuc2lnbmVkIGxvbmcgY21kLCB1bnNpZ25lZCBsb25nIGFyZywKIAkJc3RydWN0
IGZidHlwZSBfX3VzZXIgKmYgPSAoc3RydWN0IGZidHlwZSBfX3VzZXIgKikgYXJnOwogCiAJCWlm
IChwdXRfdXNlcih0eXBlLCAmZi0+ZmJfdHlwZSkgfHwKLQkJICAgIF9fcHV0X3VzZXIoaW5mby0+
dmFyLnlyZXMsICZmLT5mYl9oZWlnaHQpIHx8Ci0JCSAgICBfX3B1dF91c2VyKGluZm8tPnZhci54
cmVzLCAmZi0+ZmJfd2lkdGgpIHx8Ci0JCSAgICBfX3B1dF91c2VyKGZiX2RlcHRoLCAmZi0+ZmJf
ZGVwdGgpIHx8Ci0JCSAgICBfX3B1dF91c2VyKDAsICZmLT5mYl9jbXNpemUpIHx8Ci0JCSAgICBf
X3B1dF91c2VyKGZiX3NpemUsICZmLT5mYl9jbXNpemUpKQorCQkgICAgcHV0X3VzZXIoaW5mby0+
dmFyLnlyZXMsICZmLT5mYl9oZWlnaHQpIHx8CisJCSAgICBwdXRfdXNlcihpbmZvLT52YXIueHJl
cywgJmYtPmZiX3dpZHRoKSB8fAorCQkgICAgcHV0X3VzZXIoZmJfZGVwdGgsICZmLT5mYl9kZXB0
aCkgfHwKKwkJICAgIHB1dF91c2VyKDAsICZmLT5mYl9jbXNpemUpIHx8CisJCSAgICBwdXRfdXNl
cihmYl9zaXplLCAmZi0+ZmJfY21zaXplKSkKIAkJCXJldHVybiAtRUZBVUxUOwogCQlyZXR1cm4g
MDsKIAl9CkBAIC0xMjQsMTAgKzEyNCwxMCBAQCBpbnQgc2J1c2ZiX2lvY3RsX2hlbHBlcih1bnNp
Z25lZCBsb25nIGNtZCwgdW5zaWduZWQgbG9uZyBhcmcsCiAJCXVuc2lnbmVkIGludCBpbmRleCwg
Y291bnQsIGk7CiAKIAkJaWYgKGdldF91c2VyKGluZGV4LCAmYy0+aW5kZXgpIHx8Ci0JCSAgICBf
X2dldF91c2VyKGNvdW50LCAmYy0+Y291bnQpIHx8Ci0JCSAgICBfX2dldF91c2VyKHVyZWQsICZj
LT5yZWQpIHx8Ci0JCSAgICBfX2dldF91c2VyKHVncmVlbiwgJmMtPmdyZWVuKSB8fAotCQkgICAg
X19nZXRfdXNlcih1Ymx1ZSwgJmMtPmJsdWUpKQorCQkgICAgZ2V0X3VzZXIoY291bnQsICZjLT5j
b3VudCkgfHwKKwkJICAgIGdldF91c2VyKHVyZWQsICZjLT5yZWQpIHx8CisJCSAgICBnZXRfdXNl
cih1Z3JlZW4sICZjLT5ncmVlbikgfHwKKwkJICAgIGdldF91c2VyKHVibHVlLCAmYy0+Ymx1ZSkp
CiAJCQlyZXR1cm4gLUVGQVVMVDsKIAogCQljbWFwLmxlbiA9IDE7CkBAIC0xNjQsMTAgKzE2NCwx
MCBAQCBpbnQgc2J1c2ZiX2lvY3RsX2hlbHBlcih1bnNpZ25lZCBsb25nIGNtZCwgdW5zaWduZWQg
bG9uZyBhcmcsCiAJCXU4IHJlZCwgZ3JlZW4sIGJsdWU7CiAKIAkJaWYgKGdldF91c2VyKGluZGV4
LCAmYy0+aW5kZXgpIHx8Ci0JCSAgICBfX2dldF91c2VyKGNvdW50LCAmYy0+Y291bnQpIHx8Ci0J
CSAgICBfX2dldF91c2VyKHVyZWQsICZjLT5yZWQpIHx8Ci0JCSAgICBfX2dldF91c2VyKHVncmVl
biwgJmMtPmdyZWVuKSB8fAotCQkgICAgX19nZXRfdXNlcih1Ymx1ZSwgJmMtPmJsdWUpKQorCQkg
ICAgZ2V0X3VzZXIoY291bnQsICZjLT5jb3VudCkgfHwKKwkJICAgIGdldF91c2VyKHVyZWQsICZj
LT5yZWQpIHx8CisJCSAgICBnZXRfdXNlcih1Z3JlZW4sICZjLT5ncmVlbikgfHwKKwkJICAgIGdl
dF91c2VyKHVibHVlLCAmYy0+Ymx1ZSkpCiAJCQlyZXR1cm4gLUVGQVVMVDsKIAogCQlpZiAoaW5k
ZXggKyBjb3VudCA+IGNtYXAtPmxlbikKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
