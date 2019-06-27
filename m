Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07065576D2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 02:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6566E573;
	Thu, 27 Jun 2019 00:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A696E577
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 00:43:04 +0000 (UTC)
Received: from sasha-vm.mshome.net (unknown [107.242.116.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E8132080C;
 Thu, 27 Jun 2019 00:37:53 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 32/60] drm/vmwgfx: Honor the sg list segment size
 limitation
Date: Wed, 26 Jun 2019 20:35:47 -0400
Message-Id: <20190627003616.20767-32-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627003616.20767-1-sashal@kernel.org>
References: <20190627003616.20767-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561595875;
 bh=EgQM/TXve2elP/6ZXxEVjCqqSaywt9iJ96wu7+E1KNY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uxw2WB5WfOpjYD6SQG3CiTDNFmwz9I1vU2dsbaU5uGAlxZXpznXnlgX9CN4zUyCGp
 cJnJ1UIY45+6LGaEas1GRn9eBv+ld9ytcon4XYL6GgQn4kra25egeB8gKBDKk+2iHi
 jyO+ZmbzHX94de+4wsF1EbxVbEB9V0V473c23bIQ=
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
Cc: Sasha Levin <sashal@kernel.org>, Thomas Hellstrom <thellstrom@vmware.com>,
 Deepak Rawat <drawat@vmware.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgYmRlMTU1NTViYTYxYzdmNjY0ZjQwZmQzYzZmZGJkYjYzZjc4NGM5YiBdCgpXaGVu
IGJ1aWxkaW5nIHNnIHRhYmxlcywgaG9ub3IgdGhlIGRldmljZSBzZyBsaXN0IHNlZ21lbnQgc2l6
ZSBsaW1pdGF0aW9uLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJv
bUB2bXdhcmUuY29tPgpSZXZpZXdlZC1ieTogRGVlcGFrIFJhd2F0IDxkcmF3YXRAdm13YXJlLmNv
bT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYyB8IDEwICsrKysrLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jIGIvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jCmluZGV4IDMxNzg2YjIwMGFmYy4u
ZjM4OGFkNTFlNzJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90
dG1fYnVmZmVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZl
ci5jCkBAIC00NDgsMTEgKzQ0OCwxMSBAQCBzdGF0aWMgaW50IHZtd190dG1fbWFwX2RtYShzdHJ1
Y3Qgdm13X3R0bV90dCAqdm13X3R0KQogCQlpZiAodW5saWtlbHkocmV0ICE9IDApKQogCQkJcmV0
dXJuIHJldDsKIAotCQlyZXQgPSBzZ19hbGxvY190YWJsZV9mcm9tX3BhZ2VzKCZ2bXdfdHQtPnNn
dCwgdnNndC0+cGFnZXMsCi0JCQkJCQl2c2d0LT5udW1fcGFnZXMsIDAsCi0JCQkJCQkodW5zaWdu
ZWQgbG9uZykKLQkJCQkJCXZzZ3QtPm51bV9wYWdlcyA8PCBQQUdFX1NISUZULAotCQkJCQkJR0ZQ
X0tFUk5FTCk7CisJCXJldCA9IF9fc2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlcworCQkJKCZ2bXdf
dHQtPnNndCwgdnNndC0+cGFnZXMsIHZzZ3QtPm51bV9wYWdlcywgMCwKKwkJCSAodW5zaWduZWQg
bG9uZykgdnNndC0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsCisJCQkgZG1hX2dldF9tYXhfc2Vn
X3NpemUoZGV2X3ByaXYtPmRldi0+ZGV2KSwKKwkJCSBHRlBfS0VSTkVMKTsKIAkJaWYgKHVubGlr
ZWx5KHJldCAhPSAwKSkKIAkJCWdvdG8gb3V0X3NnX2FsbG9jX2ZhaWw7CiAKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
