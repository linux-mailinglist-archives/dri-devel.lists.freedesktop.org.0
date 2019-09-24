Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1688BCDD6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826C96EABF;
	Tue, 24 Sep 2019 16:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA43B6EABD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:51:36 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EA60217D9;
 Tue, 24 Sep 2019 16:51:35 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 02/19] video: ssd1307fb: Start page range at
 page_offset
Date: Tue, 24 Sep 2019 12:51:13 -0400
Message-Id: <20190924165130.28625-2-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924165130.28625-1-sashal@kernel.org>
References: <20190924165130.28625-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343896;
 bh=W6QghoyZXk8Hl3WCgfDzrIHNelWpAuCRcKjsOjXwCMg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=v2mVfGXvOtIHjEijYyUL1aHZAr2Iq1T7SmW/eg5iRLxbMXI3Yp4RGN/V/rdvvZ7G6
 Yf3IiVHcDWQMITR4HrnsXAipNGtWpn33DPOiOTym6d7+bAv/PuSGe4qyL4EGTLlDNv
 8BfsZ629xVjec4QImqk54pdSkxH/LAzkhVnaXhXg=
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
Cc: Mark Rutland <mark.rutland@arm.com>, Sasha Levin <sashal@kernel.org>,
 linux-fbdev@vger.kernel.org,
 =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Marko Kohtala <marko.kohtala@okoko.fi>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFya28gS29odGFsYSA8bWFya28ua29odGFsYUBva29rby5maT4KClsgVXBzdHJlYW0g
Y29tbWl0IGRkOTc4MjgzNGRkOWRkZTM2MjRmZjFhY2VhODg1OWYzZDNlNzkyZDQgXQoKVGhlIHBh
Z2Vfb2Zmc2V0IHdhcyBvbmx5IGFwcGxpZWQgdG8gdGhlIGVuZCBvZiB0aGUgcGFnZSByYW5nZS4g
VGhpcyBjYXVzZWQKdGhlIGRpc3BsYXkgdXBkYXRlcyB0byBjYXVzZSBhIHNjcm9sbGluZyBlZmZl
Y3Qgb24gdGhlIGRpc3BsYXkgYmVjYXVzZSB0aGUKYW1vdW50IG9mIGRhdGEgd3JpdHRlbiB0byB0
aGUgZGlzcGxheSBkaWQgbm90IG1hdGNoIHRoZSByYW5nZSBkaXNwbGF5CmV4cGVjdGVkLgoKRml4
ZXM6IDMwMWJjMDY3NWI2NyAoInZpZGVvOiBzc2QxMzA3ZmI6IE1ha2UgdXNlIG9mIGhvcml6b250
YWwgYWRkcmVzc2luZyBtb2RlIikKU2lnbmVkLW9mZi1ieTogTWFya28gS29odGFsYSA8bWFya28u
a29odGFsYUBva29rby5maT4KQ2M6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+
CkNjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzog
TWljaGFsIFZva8OhxI0gPG1pY2hhbC52b2thY0B5c29mdC5jb20+ClNpZ25lZC1vZmYtYnk6IEJh
cnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KTGluazog
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNjE4MDc0
MTExLjkzMDktNC1tYXJrby5rb2h0YWxhQG9rb2tvLmZpClNpZ25lZC1vZmYtYnk6IFNhc2hhIExl
dmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdm
Yi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYyBiL2RyaXZlcnMv
dmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMKaW5kZXggMjkyNWQ1Y2U4ZDNlNS4uMTI2N2I5M2MwM2Jk
MCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYworKysgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdmYi5jCkBAIC00MzAsNyArNDMwLDcgQEAgc3RhdGljIGlu
dCBzc2QxMzA3ZmJfaW5pdChzdHJ1Y3Qgc3NkMTMwN2ZiX3BhciAqcGFyKQogCWlmIChyZXQgPCAw
KQogCQlyZXR1cm4gcmV0OwogCi0JcmV0ID0gc3NkMTMwN2ZiX3dyaXRlX2NtZChwYXItPmNsaWVu
dCwgMHgwKTsKKwlyZXQgPSBzc2QxMzA3ZmJfd3JpdGVfY21kKHBhci0+Y2xpZW50LCBwYXItPnBh
Z2Vfb2Zmc2V0KTsKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJuIHJldDsKIAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
