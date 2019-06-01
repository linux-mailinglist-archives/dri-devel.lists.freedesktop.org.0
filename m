Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 152A731C5C
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4697A89AEA;
	Sat,  1 Jun 2019 13:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF9A89AEA;
 Sat,  1 Jun 2019 13:21:06 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A7ED272FB;
 Sat,  1 Jun 2019 13:21:06 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 032/173] drm/nouveau/kms/gv100-: fix spurious
 window immediate interlocks
Date: Sat,  1 Jun 2019 09:17:04 -0400
Message-Id: <20190601131934.25053-32-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131934.25053-1-sashal@kernel.org>
References: <20190601131934.25053-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395266;
 bh=ASVA2U74puGrj3gTWdNjad0glNORNV5tZItqufhBi1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dGkqlR510IG31PmdOytcJgTxEimAvWEZCJo8oosg26MjhcxiZHU1nZmFNuvCF3cGh
 3ojdbZyv+dyL0cwbM6TTltZbR9rpe2RhSQY5+eH5qANKhweyN4MS0Ayu1E32PWCGMe
 Mch04BZ2lYM6ETqrItEJImO37k5vMey/YVPDg+Zo=
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
ZDI0MzRlNGQ5NDJjMzJjYWRjYmRiY2QzMmM1OGYzNTA5OGYzYjYwNCBdCgpDdXJzb3IgcG9zaXRp
b24gdXBkYXRlcyB3ZXJlIGFjY2lkZW50YWxseSBjYXVzaW5nIHVzIHRvIGF0dGVtcHQgdG8gaW50
ZXJsb2NrCndpbmRvdyB3aXRoIHdpbmRvdyBpbW1lZGlhdGUsIGFuZCB3aXRob3V0IGEgbWF0Y2hp
bmcgd2luZG93IGltbWVkaWF0ZSB1cGRhdGUsCk5WRGlzcGxheSBjb3VsZCBoYW5nIGZvcmV2ZXIg
aW4gc29tZSBjaXJjdW1zdGFuY2VzLgoKRml4ZXMgc3VzcGVuZC9yZXN1bWUgb24gKGF0IGxlYXN0
KSBRdWFkcm8gUlRYNDAwMCAoVFUxMDQpLgoKUmVwb3J0ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRl
QHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNv
bT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuaCAgICAgfCAxICsKIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL3dpbW1jMzdiLmMgfCAxICsKIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL3duZHcuYyAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuaCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3Bu
djUwL2Rpc3AuaAppbmRleCAyMjE2YzU4NjIwYzJkLi43YzQxYjA1OTlkMWFjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5oCkBAIC00MSw2ICs0MSw3IEBAIHN0cnVjdCBu
djUwX2Rpc3BfaW50ZXJsb2NrIHsKIAkJTlY1MF9ESVNQX0lOVEVSTE9DS19fU0laRQogCX0gdHlw
ZTsKIAl1MzIgZGF0YTsKKwl1MzIgd2ltbTsKIH07CiAKIHZvaWQgY29yZWMzN2RfbnRmeV9pbml0
KHN0cnVjdCBub3V2ZWF1X2JvICosIHUzMik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnY1MC93aW1tYzM3Yi5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvd2ltbWMzN2IuYwppbmRleCA5MTAzYjg0OTQyNzljLi5mN2RiZDk2NWU0ZTcyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC93aW1tYzM3Yi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL3dpbW1jMzdiLmMKQEAgLTc1LDYgKzc1
LDcgQEAgd2ltbWMzN2JfaW5pdF8oY29uc3Qgc3RydWN0IG52NTBfd2ltbV9mdW5jICpmdW5jLCBz
dHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSwKIAkJcmV0dXJuIHJldDsKIAl9CiAKKwl3bmR3LT5pbnRl
cmxvY2sud2ltbSA9IHduZHctPmludGVybG9jay5kYXRhOwogCXduZHctPmltbWQgPSBmdW5jOwog
CXJldHVybiAwOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52
NTAvd25kdy5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvd25kdy5jCmluZGV4
IGJhOWVlYTJmZjE2YmIuLmJiZGI2ZDI3NGMwNDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL3duZHcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC93bmR3LmMKQEAgLTE0OSw3ICsxNDksNyBAQCBudjUwX3duZHdfZmx1c2hfc2V0KHN0
cnVjdCBudjUwX3duZHcgKnduZHcsIHUzMiAqaW50ZXJsb2NrLAogCWlmIChhc3l3LT5zZXQucG9p
bnQpIHsKIAkJaWYgKGFzeXctPnNldC5wb2ludCA9IGZhbHNlLCBhc3l3LT5zZXQubWFzaykKIAkJ
CWludGVybG9ja1t3bmR3LT5pbnRlcmxvY2sudHlwZV0gfD0gd25kdy0+aW50ZXJsb2NrLmRhdGE7
Ci0JCWludGVybG9ja1tOVjUwX0RJU1BfSU5URVJMT0NLX1dJTU1dIHw9IHduZHctPmludGVybG9j
ay5kYXRhOworCQlpbnRlcmxvY2tbTlY1MF9ESVNQX0lOVEVSTE9DS19XSU1NXSB8PSB3bmR3LT5p
bnRlcmxvY2sud2ltbTsKIAogCQl3bmR3LT5pbW1kLT5wb2ludCh3bmR3LCBhc3l3KTsKIAkJd25k
dy0+aW1tZC0+dXBkYXRlKHduZHcsIGludGVybG9jayk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
