Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE46D31D1E
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F398489C56;
	Sat,  1 Jun 2019 13:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B2A89C54
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 13:27:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E2640212F5;
 Sat,  1 Jun 2019 13:27:22 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 47/56] fbdev: sm712fb: fix white screen of death
 on reboot, don't set CR3B-CR3F
Date: Sat,  1 Jun 2019 09:25:51 -0400
Message-Id: <20190601132600.27427-47-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132600.27427-1-sashal@kernel.org>
References: <20190601132600.27427-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395643;
 bh=SdmJgg9i0oL99XPrS1akKU3rtqQfDrOm2qN4nOR7m84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L0Th5bWYQvQH6AWBbdmjQ1Z3egJigRkN3umzDTQ5bYZz7jj8bB1omLREUuz2I1fXn
 gmOODybTaiGVEL+PTbtRgwvkgyt8kw2LXr8w343UYqAx/RnK+n3DTWLTiovz87r/KX
 XB98wvjBt4dCL43ro70y1mKuJfLDBDj8gxX1IADY=
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
 Teddy Wang <teddy.wang@siliconmotion.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, Yifeng Li <tomli@tomli.me>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWWlmZW5nIExpIDx0b21saUB0b21saS5tZT4KClsgVXBzdHJlYW0gY29tbWl0IDgwNjkw
NTM4ODBlMGVlM2E3NWZkNmQ3ZTBhMzAyOTMyNjVmZTNkZTQgXQoKT24gYSBUaGlua3BhZCBzMzAg
KFBlbnRpdW0gSUlJIC8gaTQ0ME1YLCBMeW54M0RNKSwgcmVib290aW5nIHdpdGgKc203MTJmYiBm
cmFtZWJ1ZmZlciBkcml2ZXIgd291bGQgY2F1c2UgYSB3aGl0ZSBzY3JlZW4gb2YgZGVhdGggb24K
dGhlIG5leHQgUE9TVCwgcHJlc3VtYWJseSB0aGUgcHJvcGVyIHRpbWluZ3MgZm9yIHRoZSBMQ0Qg
cGFuZWwgd2FzCm5vdCByZXByb2dyYW1tZWQgcHJvcGVybHkgYnkgdGhlIEJJT1MuCgpFeHBlcmlt
ZW50cyBzaG93ZWQgYSBmZXcgQ1JUQyBTY3JhdGNoIFJlZ2lzdGVycywgaW5jbHVkaW5nIENSVDNE
LApDUlQzRSBhbmQgQ1JUM0YgbWF5IGJlIHVzZWQgaW50ZXJuYWxseSBieSBCSU9TIGFzIHNvbWUg
ZmxhZ3MuIENSVDNCIGlzCmEgaGFyZHdhcmUgdGVzdGluZyByZWdpc3Rlciwgd2Ugc2hvdWxkbid0
IG1lc3Mgd2l0aCBpdC4gQ1JUM0MgaGFzCmJsYW5raW5nIHNpZ25hbCBhbmQgbGluZSBjb21wYXJl
IGNvbnRyb2wsIHdoaWNoIGlzIG5vdCBuZWVkZWQgZm9yIHRoaXMKZHJpdmVyLgoKU3RvcCB3cml0
aW5nIHRvIENSM0ItQ1IzRiAoYS5rLmEgQ1JUM0ItQ1JUM0YpIHJlZ2lzdGVycy4gRXZlbiBpZiB0
aGVzZQpyZWdpc3RlcnMgZG9uJ3QgaGF2ZSBzaWRlLWVmZmVjdCBvbiBvdGhlciBzeXN0ZW1zLCB3
cml0aW5nIHRvIHRoZW0gaXMKYWxzbyBoaWdobHkgcXVlc3Rpb25hYmxlLgoKU2lnbmVkLW9mZi1i
eTogWWlmZW5nIExpIDx0b21saUB0b21saS5tZT4KVGVzdGVkLWJ5OiBTdWRpcCBNdWtoZXJqZWUg
PHN1ZGlwbS5tdWtoZXJqZWVAZ21haWwuY29tPgpDYzogVGVkZHkgV2FuZyA8dGVkZHkud2FuZ0Bz
aWxpY29ubW90aW9uLmNvbT4KQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAgIyB2NC40KwpT
aWduZWQtb2ZmLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ft
c3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4K
LS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NtNzEyZmIuYyB8IDYgKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9mYmRldi9zbTcxMmZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NtNzEyZmIuYwpp
bmRleCAzZjU4NDBhYWExZGQwLi41MTQ4NzY1ZjAwN2NmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L3NtNzEyZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NtNzEyZmIuYwpA
QCAtMTE4Miw4ICsxMTgyLDEyIEBAIHN0YXRpYyB2b2lkIHNtN3h4X3NldF90aW1pbmcoc3RydWN0
IHNtdGNmYl9pbmZvICpzZmIpCiAJCQlzbXRjX2NydGN3KGksIHZnYW1vZGVbal0uaW5pdF9jcjAw
X2NyMThbaV0pOwogCiAJCS8qIGluaXQgQ1JUQyByZWdpc3RlciBDUjMwIC0gQ1I0RCAqLwotCQlm
b3IgKGkgPSAwOyBpIDwgU0laRV9DUjMwX0NSNEQ7IGkrKykKKwkJZm9yIChpID0gMDsgaSA8IFNJ
WkVfQ1IzMF9DUjREOyBpKyspIHsKKwkJCWlmICgoaSArIDB4MzApID49IDB4M0IgJiYgKGkgKyAw
eDMwKSA8PSAweDNGKQorCQkJCS8qIHNpZGUtZWZmZWN0LCBkb24ndCB3cml0ZSB0byBDUjNCLUNS
M0YgKi8KKwkJCQljb250aW51ZTsKIAkJCXNtdGNfY3J0Y3coaSArIDB4MzAsIHZnYW1vZGVbal0u
aW5pdF9jcjMwX2NyNGRbaV0pOworCQl9CiAKIAkJLyogaW5pdCBDUlRDIHJlZ2lzdGVyIENSOTAg
LSBDUkE3ICovCiAJCWZvciAoaSA9IDA7IGkgPCBTSVpFX0NSOTBfQ1JBNzsgaSsrKQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
