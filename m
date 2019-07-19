Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FFE6DB3C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66EC6E52F;
	Fri, 19 Jul 2019 04:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8406E52F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 04:08:11 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 64EEB2082E;
 Fri, 19 Jul 2019 04:08:10 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 017/101] drm/bridge: tc358767: read display_props
 in get_modes()
Date: Fri, 19 Jul 2019 00:06:08 -0400
Message-Id: <20190719040732.17285-17-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040732.17285-1-sashal@kernel.org>
References: <20190719040732.17285-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509291;
 bh=Sqs4mHE8kN3otiI9X3f2palwLpxIaJAwUWx6QFv8Egs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oIuFhxmGKdPfodupKyxyoC5Q/6xa8WgBYFmL4Dx7iSVaCG3JvLERTduwV7VTwmAo1
 qWFR6S0DG+h0OzWOBEmT1Tr/3OFbpevCdC5ZKI4UPpqB+PvLKmVlW0s5knzGkaUYN4
 0jFKE5RNwz2vplcGy0GEh3hUmOGi75Ks/ad1/TDg=
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
Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCmluZGV4IDM5MTU0NzM1ODc1
Ni4uYWFjYTUyNDhkYTA3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCkBAIC0xMTQ5LDYg
KzExNDksMTMgQEAgc3RhdGljIGludCB0Y19jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1f
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
