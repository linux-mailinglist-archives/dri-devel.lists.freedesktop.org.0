Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE53E576D3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 02:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F406E574;
	Thu, 27 Jun 2019 00:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0E66E56B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 00:43:04 +0000 (UTC)
Received: from sasha-vm.mshome.net (unknown [107.242.116.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15E5921726;
 Thu, 27 Jun 2019 00:33:10 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 50/95] drm/vmwgfx: Honor the sg list segment size
 limitation
Date: Wed, 26 Jun 2019 20:29:35 -0400
Message-Id: <20190627003021.19867-50-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627003021.19867-1-sashal@kernel.org>
References: <20190627003021.19867-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561595592;
 bh=73PQYF2L2BDVxfxaOYor0jforq0w+e8jO2ib5QUiBcs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GYQ2uVABktkemdvgsWoxZ+xkwDayZR1VIndR7K0JucFkr/5LoLLq+B1LFIOFNFO6m
 P58E/ylxGo8RNPRj9CxZPYuyxmXEYS1e8nB7x6kcDeuxAfWMVra1jpCtFSLT/a/Cwe
 w+rjM/9lS9j8t6vmbOBx44gei+uLgOdFuv7dMI6Y=
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
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jCmluZGV4IGEzMzU3ZmY3NTQwZC4u
OTdhZGVlMWYwNTc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90
dG1fYnVmZmVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZl
ci5jCkBAIC00NTQsMTEgKzQ1NCwxMSBAQCBzdGF0aWMgaW50IHZtd190dG1fbWFwX2RtYShzdHJ1
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
