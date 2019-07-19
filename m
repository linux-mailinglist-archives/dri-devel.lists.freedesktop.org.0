Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037656DC08
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E85E6E564;
	Fri, 19 Jul 2019 04:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84F66E560
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 04:13:15 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B2B521872;
 Fri, 19 Jul 2019 04:13:14 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 07/45] drm/bridge: tc358767: read display_props in
 get_modes()
Date: Fri, 19 Jul 2019 00:12:26 -0400
Message-Id: <20190719041304.18849-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719041304.18849-1-sashal@kernel.org>
References: <20190719041304.18849-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509595;
 bh=zMn6S17+mdkJMuVd2nBPRzwcFgccNxk5NbIjJ5mgM+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k8xgRdAsQ6iIkZqOJWXn3qdhg/AFkxd0xHp9+cwrxZ+9xdYUWaswsQF/N9QAPlfqH
 GnkQ3Lwraib/DEW3muDLYBj6A8piBFp1J/9AudHrphQv3FU3iDoHgI3w6LZfTvfIIw
 8QDi/k8H2MJzdZfqeZhB0RYXSnvzUCWtQBpwCOl4=
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
Cc: Sasha Levin <sashal@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KClsgVXBzdHJlYW0g
Y29tbWl0IDMyMzE1NzMwNjVhZDRmNGVjYzVjOTE0N2IyNGYyOWY4NDZkYzBjMmYgXQoKV2UgbmVl
ZCB0byBrbm93IHRoZSBsaW5rIGJhbmR3aWR0aCB0byBmaWx0ZXIgb3V0IG1vZGVzIHdlIGNhbm5v
dApzdXBwb3J0LCBzbyB3ZSBuZWVkIHRvIGhhdmUgcmVhZCB0aGUgZGlzcGxheSBwcm9wcyBiZWZv
cmUgZG9pbmcgdGhlCmZpbHRlcmluZy4KClRvIGVuc3VyZSB3ZSBoYXZlIHVwIHRvIGRhdGUgZGlz
cGxheSBwcm9wcywgY2FsbCB0Y19nZXRfZGlzcGxheV9wcm9wcygpCmluIHRoZSBiZWdpbm5pbmcg
b2YgdGNfY29ubmVjdG9yX2dldF9tb2RlcygpLgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWlu
ZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEu
aGFqZGFAc2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFA
c2Ftc3VuZy5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRj
aC9tc2dpZC8yMDE5MDUyODA4Mjc0Ny4zNjMxLTIyLXRvbWkudmFsa2VpbmVuQHRpLmNvbQpTaWdu
ZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCmluZGV4IGZhM2YyZjAzOWE3
NC4uODA5OTNhODczNGUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCkBAIC0xMTUzLDYg
KzExNTMsMTMgQEAgc3RhdGljIGludCB0Y19jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IpCiAJc3RydWN0IHRjX2RhdGEgKnRjID0gY29ubmVjdG9yX3Rv
X3RjKGNvbm5lY3Rvcik7CiAJc3RydWN0IGVkaWQgKmVkaWQ7CiAJdW5zaWduZWQgaW50IGNvdW50
OworCWludCByZXQ7CisKKwlyZXQgPSB0Y19nZXRfZGlzcGxheV9wcm9wcyh0Yyk7CisJaWYgKHJl
dCA8IDApIHsKKwkJZGV2X2Vycih0Yy0+ZGV2LCAiZmFpbGVkIHRvIHJlYWQgZGlzcGxheSBwcm9w
czogJWRcbiIsIHJldCk7CisJCXJldHVybiAwOworCX0KIAogCWlmICh0Yy0+cGFuZWwgJiYgdGMt
PnBhbmVsLT5mdW5jcyAmJiB0Yy0+cGFuZWwtPmZ1bmNzLT5nZXRfbW9kZXMpIHsKIAkJY291bnQg
PSB0Yy0+cGFuZWwtPmZ1bmNzLT5nZXRfbW9kZXModGMtPnBhbmVsKTsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
