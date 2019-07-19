Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D01996D983
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9F36E48E;
	Fri, 19 Jul 2019 03:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8362D6E48E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 03:56:45 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F11E2082E;
 Fri, 19 Jul 2019 03:56:44 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 001/171] drm/lima: handle shared irq case for
 lima_pp_bcast_irq_handler
Date: Thu, 18 Jul 2019 23:53:52 -0400
Message-Id: <20190719035643.14300-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508605;
 bh=/bYiLhQ2bS9pcCsRPAJ+8A98ijnEbnaNzmUqu1Yf4og=;
 h=From:To:Cc:Subject:Date:From;
 b=VFme/5UjzcJLqJ50dGR1eQjs/VgmYIWJaMwCXIWWnrXP0l2u5Nv0Gf+E05Ra16G3e
 U+w02CX97sEPGDx9mc4K03siLpij+Ml2xkUrspEm4npxxgFlPvF9uqkSyxCIgYbPVN
 BtGdZO8qBMEtVUZPDXjCaT/lZpRkEZbF835KvLb0=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Peter Griffin <peter.griffin@linaro.org>, Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGV0ZXIgR3JpZmZpbiA8cGV0ZXIuZ3JpZmZpbkBsaW5hcm8ub3JnPgoKWyBVcHN0cmVh
bSBjb21taXQgNDA5YzUzZjA3YTgxZjhkYjEyMmM0NjFmMzI1NWM2ZjQzNTU4Yzg4MSBdCgpPbiBI
aWtleSBib2FyZCBhbGwgbGltYSBpcCBibG9ja3MgYXJlIHNoYXJlZCB3aXRoIG9uZSBpcnEuClRo
aXMgcGF0Y2ggYXZvaWRzIGEgTlVMTCBwdHIgZGVyZWYgY3Jhc2ggb24gdGhpcyBwbGF0Zm9ybQpv
biBzdGFydHVwLiBUZXN0ZWQgd2l0aCBXZXN0b24gYW5kIGttc2N1YmUuCgpTaWduZWQtb2ZmLWJ5
OiBQZXRlciBHcmlmZmluIDxwZXRlci5ncmlmZmluQGxpbmFyby5vcmc+CkNjOiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFFpYW5nIFl1IDx5
dXE4MjVAZ21haWwuY29tPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
cGF0Y2gvbXNnaWQvMTU1NTY2Mjc4MS0yMjU3MC03LWdpdC1zZW5kLWVtYWlsLXBldGVyLmdyaWZm
aW5AbGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5v
cmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9wcC5jIHwgOCArKysrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfcHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xp
bWFfcHAuYwppbmRleCBkMjk3MjFlMTc3YmYuLjhmZWYyMjRiOTNjOCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2xpbWEvbGltYV9wcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xp
bWFfcHAuYwpAQCAtNjQsNyArNjQsMTMgQEAgc3RhdGljIGlycXJldHVybl90IGxpbWFfcHBfYmNh
c3RfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkKIAlzdHJ1Y3QgbGltYV9pcCAqcHBf
YmNhc3QgPSBkYXRhOwogCXN0cnVjdCBsaW1hX2RldmljZSAqZGV2ID0gcHBfYmNhc3QtPmRldjsK
IAlzdHJ1Y3QgbGltYV9zY2hlZF9waXBlICpwaXBlID0gZGV2LT5waXBlICsgbGltYV9waXBlX3Bw
OwotCXN0cnVjdCBkcm1fbGltYV9tNDUwX3BwX2ZyYW1lICpmcmFtZSA9IHBpcGUtPmN1cnJlbnRf
dGFzay0+ZnJhbWU7CisJc3RydWN0IGRybV9saW1hX200NTBfcHBfZnJhbWUgKmZyYW1lOworCisJ
LyogZm9yIHNoYXJlZCBpcnEgY2FzZSAqLworCWlmICghcGlwZS0+Y3VycmVudF90YXNrKQorCQly
ZXR1cm4gSVJRX05PTkU7CisKKwlmcmFtZSA9IHBpcGUtPmN1cnJlbnRfdGFzay0+ZnJhbWU7CiAK
IAlmb3IgKGkgPSAwOyBpIDwgZnJhbWUtPm51bV9wcDsgaSsrKSB7CiAJCXN0cnVjdCBsaW1hX2lw
ICppcCA9IHBpcGUtPnByb2Nlc3NvcltpXTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
