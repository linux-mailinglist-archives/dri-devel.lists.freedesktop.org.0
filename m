Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E97CD7BF2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0AD6E855;
	Tue, 15 Oct 2019 16:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7713D89CB9;
 Tue, 15 Oct 2019 14:11:30 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iKNXp-0004MO-H9; Tue, 15 Oct 2019 15:11:25 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iKNXp-0000KZ-2h; Tue, 15 Oct 2019 15:11:25 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Subject: [PATCH] drm/nouveau/hwmon: fix use of integer as a pointer
Date: Tue, 15 Oct 2019 15:11:23 +0100
Message-Id: <20191015141123.1226-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHNwZWNpYWxfZ3JvdXBzW10gaW4gbm91dmVhdV9od21vbl9pbml0KCkgaXMgYW4KYXJyYXkg
b2YgcG9pbnRlcnMsIHNvIHVzZSBOVUxMIGluc3RlYWQgb2YgJzAnIGFzCnRoZSBpbml0aWFsaXNl
ci4KCkZpeGVzIHRoZSBmb2xsb3dpbmcgc3BhcnNlIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2h3bW9uLmM6NzQ0OjI5OiB3YXJuaW5nOiBVc2luZyBwbGFpbiBpbnRl
Z2VyIGFzIE5VTEwgcG9pbnRlcgoKU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NA
Y29kZXRoaW5rLmNvLnVrPgotLS0KQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4K
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IG5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9od21vbi5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9od21vbi5jIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9od21vbi5jCmluZGV4IGQ0NDVjNmYzZmVjZS4uMWMzMTA0ZDIw
NTcxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2h3bW9uLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9od21vbi5jCkBAIC03NDEsNyAr
NzQxLDcgQEAgbm91dmVhdV9od21vbl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJCQlz
cGVjaWFsX2dyb3Vwc1tpKytdID0gJnB3bV9mYW5fc2Vuc29yX2dyb3VwOwogCX0KIAotCXNwZWNp
YWxfZ3JvdXBzW2ldID0gMDsKKwlzcGVjaWFsX2dyb3Vwc1tpXSA9IE5VTEw7CiAJaHdtb25fZGV2
ID0gaHdtb25fZGV2aWNlX3JlZ2lzdGVyX3dpdGhfaW5mbyhkZXYtPmRldiwgIm5vdXZlYXUiLCBk
ZXYsCiAJCQkJCQkJJm5vdXZlYXVfY2hpcF9pbmZvLAogCQkJCQkJCXNwZWNpYWxfZ3JvdXBzKTsK
LS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
