Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17698648EC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813376E0F7;
	Wed, 10 Jul 2019 15:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612526E0F7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:03:15 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CEE32064A;
 Wed, 10 Jul 2019 15:03:14 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 7/9] drm/imx: notify drm core before sending
 event during crtc disable
Date: Wed, 10 Jul 2019 11:02:57 -0400
Message-Id: <20190710150301.7129-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710150301.7129-1-sashal@kernel.org>
References: <20190710150301.7129-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562770995;
 bh=ePFrobjKeHYy4J+mj2GbAq/bzV6Kl0Uu5zEQW+zh/bw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I/0dGTSNiRAfxcfAqR5nqwFzI2XpsQRWqcIQktIyqtO5fh1LHSEW1G2UPeNaH/08J
 m/4w5Z5gssmjkhhRGjNhVTuBc6W14z5X9VYxTcuwJavakxia4BhaihZHjW7vpbkrF6
 O5+kquuZ4krhpHea3j5gzqAiRY6J87sLrisyCNPQ=
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iZXJ0IEJlY2tldHQgPGJvYi5iZWNrZXR0QGNvbGxhYm9yYS5jb20+CgpbIFVwc3Ry
ZWFtIGNvbW1pdCA3OGM2OGU4ZjVjZDI0YmQzMmJhNGNhMWNkZmIwYzMwY2YwNjQyNjg1IF0KCk5v
dGlmeSBkcm0gY29yZSBiZWZvcmUgc2VuZGluZyBwZW5kaW5nIGV2ZW50cyBkdXJpbmcgY3J0YyBk
aXNhYmxlLgpUaGlzIGZpeGVzIHRoZSBmaXJzdCBldmVudCBhZnRlciBkaXNhYmxlIGhhdmluZyBh
biBvbGQgc3RhbGUgdGltZXN0YW1wCmJ5IGhhdmluZyBkcm1fY3J0Y192Ymxhbmtfb2ZmIHVwZGF0
ZSB0aGUgdGltZXN0YW1wIHRvIG5vdy4KClRoaXMgd2FzIHNlZW4gd2hpbGUgZGVidWdnaW5nIHdl
c3RvbiBsb2cgbWVzc2FnZToKV2FybmluZzogY29tcHV0ZWQgcmVwYWludCBkZWxheSBpcyBpbnNh
bmU6IC04MjEyIG1zZWMKClRoaXMgb2NjdXJyZWQgZHVlIHRvOgoxLiBkcml2ZXIgc3RhcnRzIHVw
CjIuIGZiY29uIGNvbWVzIGFsb25nIGFuZCByZXN0b3JlcyBmYmRldiwgZW5hYmxpbmcgdmJsYW5r
CjMuIHZibGFua19kaXNhYmxlX2ZuIGZpcmVzIHZpYSB0aW1lciBkaXNhYmxpbmcgdmJsYW5rLCBr
ZWVwaW5nIHZibGFuawpzZXEgbnVtYmVyIGFuZCB0aW1lIHNldCBhdCBjdXJyZW50IHZhbHVlCihz
b21lIHRpbWUgbGF0ZXIpCjQuIHdlc3RvbiBzdGFydHMgYW5kIGRvZXMgYSBtb2Rlc2V0CjUuIGF0
b21pYyBjb21taXQgZGlzYWJsZXMgY3J0YyB3aGlsZSBpdCBkb2VzIHRoZSBtb2Rlc2V0CjYuIGlw
dV9jcnRjX2F0b21pY19kaXNhYmxlIHNlbmRzIHZibGFuayB3aXRoIG9sZCBzZXEgbnVtYmVyIGFu
ZCB0aW1lCgpGaXhlczogYTQ3NDQ3ODY0MmQ1ICgiZHJtL2lteDogZml4IGNydGMgdmJsYW5rIHN0
YXRlIHJlZ3Jlc3Npb24iKQoKU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEJlY2tldHQgPGJvYi5iZWNr
ZXR0QGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1
dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYz
LWNydGMuYwppbmRleCAxMWUyZGNkZDZiMTguLjFiNTg3MGU3YmFjYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2lteC9p
cHV2My1jcnRjLmMKQEAgLTk4LDE0ICs5OCwxNCBAQCBzdGF0aWMgdm9pZCBpcHVfY3J0Y19hdG9t
aWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJaXB1X2RjX2Rpc2FibGUoaXB1KTsK
IAlpcHVfcHJnX2Rpc2FibGUoaXB1KTsKIAorCWRybV9jcnRjX3ZibGFua19vZmYoY3J0Yyk7CisK
IAlzcGluX2xvY2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOwogCWlmIChjcnRjLT5zdGF0
ZS0+ZXZlbnQpIHsKIAkJZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoY3J0YywgY3J0Yy0+c3Rh
dGUtPmV2ZW50KTsKIAkJY3J0Yy0+c3RhdGUtPmV2ZW50ID0gTlVMTDsKIAl9CiAJc3Bpbl91bmxv
Y2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOwotCi0JZHJtX2NydGNfdmJsYW5rX29mZihj
cnRjKTsKIH0KIAogc3RhdGljIHZvaWQgaW14X2RybV9jcnRjX3Jlc2V0KHN0cnVjdCBkcm1fY3J0
YyAqY3J0YykKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
