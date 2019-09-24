Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF11BCDAE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B13D6EAAC;
	Tue, 24 Sep 2019 16:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37DF6EAA4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:48:58 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B4C7E21971;
 Tue, 24 Sep 2019 16:48:57 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 06/50] drm/stm: attach gem fence to atomic state
Date: Tue, 24 Sep 2019 12:48:03 -0400
Message-Id: <20190924164847.27780-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164847.27780-1-sashal@kernel.org>
References: <20190924164847.27780-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343738;
 bh=D+5+refmVJN0BInrZBrBKnq8Z+wMu8TansF66Q6t0aY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dmMn16/+8C1Kt/mfXjFzO5ts9/8r8F9M82BELxYYFHyGaabuc1+Yy+aYOqXp7BOnl
 h9S/s6Ivhr2jFnrqbX96Y3uGeVIllMsj0A60yfS0u0lQBpIcOXmFnB7bBOJCR1wgIo
 EG5m8S0/STJ5GjVzbDRSKVlf79OrGfTlVqkhpxFk=
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
eCA4MDhkOWZiNjI3ZTk3Li40NzdkMGEyN2I5YTVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vc3RtL2x0ZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwpAQCAtMTksNiAr
MTksNyBAQAogI2luY2x1ZGUgPGRybS9kcm1fY3J0Y19oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0v
ZHJtX2ZiX2NtYV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9jbWFfaGVscGVyLmg+
CisjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+CiAjaW5jbHVkZSA8
ZHJtL2RybV9vZi5oPgogI2luY2x1ZGUgPGRybS9kcm1fYnJpZGdlLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9wbGFuZV9oZWxwZXIuaD4KQEAgLTgyNSw2ICs4MjYsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9wbGFuZV9mdW5jcyBsdGRjX3BsYW5lX2Z1bmNzID0gewogfTsKIAogc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fcGxhbmVfaGVscGVyX2Z1bmNzIGx0ZGNfcGxhbmVfaGVscGVyX2Z1bmNz
ID0geworCS5wcmVwYXJlX2ZiID0gZHJtX2dlbV9mYl9wcmVwYXJlX2ZiLAogCS5hdG9taWNfY2hl
Y2sgPSBsdGRjX3BsYW5lX2F0b21pY19jaGVjaywKIAkuYXRvbWljX3VwZGF0ZSA9IGx0ZGNfcGxh
bmVfYXRvbWljX3VwZGF0ZSwKIAkuYXRvbWljX2Rpc2FibGUgPSBsdGRjX3BsYW5lX2F0b21pY19k
aXNhYmxlLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
