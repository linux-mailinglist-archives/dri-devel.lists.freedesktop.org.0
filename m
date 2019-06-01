Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923EA31D14
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809F2897D0;
	Sat,  1 Jun 2019 13:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2F5897D0
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 13:26:59 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FBB6273CD;
 Sat,  1 Jun 2019 13:26:58 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 33/56] fbdev: fix WARNING in
 __alloc_pages_nodemask bug
Date: Sat,  1 Jun 2019 09:25:37 -0400
Message-Id: <20190601132600.27427-33-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132600.27427-1-sashal@kernel.org>
References: <20190601132600.27427-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395619;
 bh=Y/+Qb5iD+NbGfigAdcJh/DDFmWZpuiR+gDcuExZeFrI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l9X3qUcBLTMWn25dwRxRtzJmpyhoAZAMV228WIIHWwBU80zmWsNYzN9JflzL2WCp8
 qz9B7Q5xvVbrMhlMyzD24umX9ZEGlMudn8cCijIRKPp61DKsuhk6JzTteTCLc3N9NK
 6NA8L1NqiPNNH+ldh9rMEZgwZd0KdeaLFfOpXBeI=
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
 Jiufei Xue <jiufei.xue@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSml1ZmVpIFh1ZSA8aml1ZmVpLnh1ZUBsaW51eC5hbGliYWJhLmNvbT4KClsgVXBzdHJl
YW0gY29tbWl0IDhjNDAyOTJiZTkxNjlhOWNiZTE5YWFkZDFhNmZjNjBjYmQxYWY4MmYgXQoKU3l6
a2FsbGVyIGhpdCAnV0FSTklORyBpbiBfX2FsbG9jX3BhZ2VzX25vZGVtYXNrJyBidWcuCgpXQVJO
SU5HOiBDUFU6IDEgUElEOiAxNDczIGF0IG1tL3BhZ2VfYWxsb2MuYzo0Mzc3Cl9fYWxsb2NfcGFn
ZXNfbm9kZW1hc2srMHg0ZGEvMHgyMTMwCktlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBwYW5p
Y19vbl93YXJuIHNldCAuLi4KCkNhbGwgVHJhY2U6CiBhbGxvY19wYWdlc19jdXJyZW50KzB4YjEv
MHgxZTAKIGttYWxsb2Nfb3JkZXIrMHgxZi8weDYwCiBrbWFsbG9jX29yZGVyX3RyYWNlKzB4MWQv
MHgxMjAKIGZiX2FsbG9jX2NtYXBfZ2ZwKzB4ODUvMHgyYjAKIGZiX3NldF91c2VyX2NtYXArMHhm
Zi8weDM3MAogZG9fZmJfaW9jdGwrMHg5NDkvMHhhMjAKIGZiX2lvY3RsKzB4ZGQvMHgxMjAKIGRv
X3Zmc19pb2N0bCsweDE4Ni8weDEwNzAKIGtzeXNfaW9jdGwrMHg4OS8weGEwCiBfX3g2NF9zeXNf
aW9jdGwrMHg3NC8weGIwCiBkb19zeXNjYWxsXzY0KzB4YzgvMHg1NTAKIGVudHJ5X1NZU0NBTExf
NjRfYWZ0ZXJfaHdmcmFtZSsweDQ5LzB4YmUKClRoaXMgaXMgYSB3YXJuaW5nIGFib3V0IG9yZGVy
ID49IE1BWF9PUkRFUiBhbmQgdGhlIG9yZGVyIGlzIGZyb20KdXNlcnNwYWNlIGlvY3RsLiBBZGQg
ZmxhZyBfX05PV0FSTiB0byBzaWxlbmNlIHRoaXMgd2FybmluZy4KClNpZ25lZC1vZmYtYnk6IEpp
dWZlaSBYdWUgPGppdWZlaS54dWVAbGludXguYWxpYmFiYS5jb20+ClNpZ25lZC1vZmYtYnk6IEJh
cnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KU2lnbmVk
LW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvY29yZS9mYmNtYXAuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjbWFwLmMgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjbWFwLmMKaW5kZXggNjhhMTEzNTk0ODA4Zi4uMjgx
MWM0YWZkZTAxYyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY21hcC5j
CisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNtYXAuYwpAQCAtOTQsNiArOTQsOCBA
QCBpbnQgZmJfYWxsb2NfY21hcF9nZnAoc3RydWN0IGZiX2NtYXAgKmNtYXAsIGludCBsZW4sIGlu
dCB0cmFuc3AsIGdmcF90IGZsYWdzKQogCWludCBzaXplID0gbGVuICogc2l6ZW9mKHUxNik7CiAJ
aW50IHJldCA9IC1FTk9NRU07CiAKKwlmbGFncyB8PSBfX0dGUF9OT1dBUk47CisKIAlpZiAoY21h
cC0+bGVuICE9IGxlbikgewogCQlmYl9kZWFsbG9jX2NtYXAoY21hcCk7CiAJCWlmICghbGVuKQot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
