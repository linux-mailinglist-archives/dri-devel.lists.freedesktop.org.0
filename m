Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A24BCD4E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF21A6EA8F;
	Tue, 24 Sep 2019 16:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BC36EA87
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:46:12 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1DB86217D9;
 Tue, 24 Sep 2019 16:46:11 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 10/70] drm/stm: attach gem fence to atomic state
Date: Tue, 24 Sep 2019 12:44:49 -0400
Message-Id: <20190924164549.27058-10-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343572;
 bh=71Teq/z3em+Gqxx4C3IM9Ovs6Uia6I4586LFWmnZh5g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BtUk10vi9CZwYYELaIeSChEUTJUrzE8zN/H9CkunJkYndFZ8LAsJGR2D3qKt6cQAH
 C8OwREUq1xiodPmNEYS1cM9tMNFUUm0JiJOWCy2F5y6UyRjKDAmcz+OqjcdaXusDhD
 buc+eS1LJuKZS9Yhm0mkvOtSIdsm/i9T+Q4qM1Ws=
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
Cc: Sasha Levin <sashal@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWhtYWQgRmF0b3VtIDxhLmZhdG91bUBwZW5ndXRyb25peC5kZT4KClsgVXBzdHJlYW0g
Y29tbWl0IDhmYWJjOWMzMTA5YTcxYjM1Nzc5NTlhMDU0MDgxNTNhZTY5Y2NkOGQgXQoKVG8gcHJv
cGVybHkgc3luY2hyb25pemUgd2l0aCBvdGhlciBkZXZpY2VzIHRoZSBmZW5jZSBmcm9tIHRoZSBH
RU0Kb2JqZWN0IGJhY2tpbmcgdGhlIGZyYW1lYnVmZmVyIG5lZWRzIHRvIGJlIGF0dGFjaGVkIHRv
IHRoZSBhdG9taWMKc3RhdGUsIHNvIHRoZSBjb21taXQgd29yayBjYW4gd2FpdCBvbiBmZW5jZSBz
aWduYWxpbmcuCgpTaWduZWQtb2ZmLWJ5OiBBaG1hZCBGYXRvdW0gPGEuZmF0b3VtQHBlbmd1dHJv
bml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5k
ZT4KQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+ClRlc3Rl
ZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4KU2lnbmVkLW9mZi1i
eTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Ckxpbms6
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDcxMjA4
NDIyOC44MzM4LTEtbC5zdGFjaEBwZW5ndXRyb25peC5kZQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMg
fCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwppbmRl
eCAzMmZkNmEzYjM3ZmIxLi42ZjFmZWY3NjY3MWM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vc3RtL2x0ZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwpAQCAtMjUsNiAr
MjUsNyBAQAogI2luY2x1ZGUgPGRybS9kcm1fZmJfY21hX2hlbHBlci5oPgogI2luY2x1ZGUgPGRy
bS9kcm1fZm91cmNjLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fY21hX2hlbHBlci5oPgorI2lu
Y2x1ZGUgPGRybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9k
cm1fb2YuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3BsYW5lX2hlbHBlci5oPgogI2luY2x1ZGUgPGRy
bS9kcm1fcHJvYmVfaGVscGVyLmg+CkBAIC04NzUsNiArODc2LDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fcGxhbmVfZnVuY3MgbHRkY19wbGFuZV9mdW5jcyA9IHsKIH07CiAKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2hlbHBlcl9mdW5jcyBsdGRjX3BsYW5lX2hlbHBlcl9mdW5j
cyA9IHsKKwkucHJlcGFyZV9mYiA9IGRybV9nZW1fZmJfcHJlcGFyZV9mYiwKIAkuYXRvbWljX2No
ZWNrID0gbHRkY19wbGFuZV9hdG9taWNfY2hlY2ssCiAJLmF0b21pY191cGRhdGUgPSBsdGRjX3Bs
YW5lX2F0b21pY191cGRhdGUsCiAJLmF0b21pY19kaXNhYmxlID0gbHRkY19wbGFuZV9hdG9taWNf
ZGlzYWJsZSwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
