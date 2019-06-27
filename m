Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DEA576D0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 02:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C86B6E56E;
	Thu, 27 Jun 2019 00:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464906E574
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 00:43:04 +0000 (UTC)
Received: from sasha-vm.mshome.net (unknown [107.242.116.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F3F321851;
 Thu, 27 Jun 2019 00:37:56 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 33/60] drm/vmwgfx: fix a warning due to missing
 dma_parms
Date: Wed, 26 Jun 2019 20:35:48 -0400
Message-Id: <20190627003616.20767-33-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627003616.20767-1-sashal@kernel.org>
References: <20190627003616.20767-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561595878;
 bh=+KAzXoiKqVwsHORXic7F0Z6Vd4ppiILYVJjYGJmp9dk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NVIuzR3GPBjkxGS+5FcVUrQ4SEOV3P3+LihAUwobzzXV+uiOffMb3DqgJUSXvEKN7
 0oaFzhJ0G4Sow0llrKzUl+QneFbg2iqcom5DHzMn31bUyp25KQiL6N7pd6OQKTrZp5
 R+wTF8w7maNClXkycDFn1H/4whVu2rIDl79X7TWU=
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
 Qian Cai <cai@lca.pw>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUWlhbiBDYWkgPGNhaUBsY2EucHc+CgpbIFVwc3RyZWFtIGNvbW1pdCAzOTkxNjg5N2Nk
ODE1YTBlZTA3YmExZjY4MjBjZjg4YTYzZTQ1OWZjIF0KCkJvb3RpbmcgdXAgd2l0aCBETUFfQVBJ
X0RFQlVHX1NHPXkgZ2VuZXJhdGVzIGEgd2FybmluZyBkdWUgdG8gdGhlIGRyaXZlcgpmb3Jnb3Qg
dG8gc2V0IGRtYV9wYXJtcyBhcHByb3ByaWF0ZWx5LiBTZXQgaXQganVzdCBhZnRlciB2bXdfZG1h
X21hc2tzKCkKaW4gdm13X2RyaXZlcl9sb2FkKCkuCgpETUEtQVBJOiB2bXdnZnggMDAwMDowMDow
Zi4wOiBtYXBwaW5nIHNnIHNlZ21lbnQgbG9uZ2VyIHRoYW4gZGV2aWNlCmNsYWltcyB0byBzdXBw
b3J0IFtsZW49MjA5NzE1Ml0gW21heD02NTUzNl0KV0FSTklORzogQ1BVOiAyIFBJRDogMjYxIGF0
IGtlcm5lbC9kbWEvZGVidWcuYzoxMjMyCmRlYnVnX2RtYV9tYXBfc2crMHgzNjAvMHg0ODAKSGFy
ZHdhcmUgbmFtZTogVk13YXJlLCBJbmMuIFZNd2FyZSBWaXJ0dWFsIFBsYXRmb3JtLzQ0MEJYIERl
c2t0b3AKUmVmZXJlbmNlIFBsYXRmb3JtLCBCSU9TIDYuMDAgMDQvMTMvMjAxOApSSVA6IDAwMTA6
ZGVidWdfZG1hX21hcF9zZysweDM2MC8weDQ4MApDYWxsIFRyYWNlOgogdm13X3R0bV9tYXBfZG1h
KzB4M2IxLzB4NWIwIFt2bXdnZnhdCiB2bXdfYm9fbWFwX2RtYSsweDI1LzB4MzAgW3Ztd2dmeF0K
IHZtd19vdGFibGVzX3NldHVwKzB4MmE4LzB4NzUwIFt2bXdnZnhdCiB2bXdfcmVxdWVzdF9kZXZp
Y2VfbGF0ZSsweDc4LzB4YzAgW3Ztd2dmeF0KIHZtd19yZXF1ZXN0X2RldmljZSsweGVlLzB4NGUw
IFt2bXdnZnhdCiB2bXdfZHJpdmVyX2xvYWQuY29sZCsweDc1Ny8weGQ4NCBbdm13Z2Z4XQogZHJt
X2Rldl9yZWdpc3RlcisweDFmZi8weDM0MCBbZHJtXQogZHJtX2dldF9wY2lfZGV2KzB4MTEwLzB4
MjkwIFtkcm1dCiB2bXdfcHJvYmUrMHgxNS8weDIwIFt2bXdnZnhdCiBsb2NhbF9wY2lfcHJvYmUr
MHg3YS8weGMwCiBwY2lfZGV2aWNlX3Byb2JlKzB4MWI5LzB4MjkwCiByZWFsbHlfcHJvYmUrMHgx
YjUvMHg2MzAKIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHhhMy8weDFhMAogZGV2aWNlX2RyaXZlcl9h
dHRhY2grMHg5NC8weGEwCiBfX2RyaXZlcl9hdHRhY2grMHhkZC8weDFjMAogYnVzX2Zvcl9lYWNo
X2RldisweGZlLzB4MTUwCiBkcml2ZXJfYXR0YWNoKzB4MmQvMHg0MAogYnVzX2FkZF9kcml2ZXIr
MHgyOTAvMHgzNTAKIGRyaXZlcl9yZWdpc3RlcisweGRjLzB4MWQwCiBfX3BjaV9yZWdpc3Rlcl9k
cml2ZXIrMHhkYS8weGYwCiB2bXdnZnhfaW5pdCsweDM0LzB4MTAwMCBbdm13Z2Z4XQogZG9fb25l
X2luaXRjYWxsKzB4ZTUvMHg0MGEKIGRvX2luaXRfbW9kdWxlKzB4MTBmLzB4M2EwCiBsb2FkX21v
ZHVsZSsweDE2YTUvMHgxYTQwCiBfX3NlX3N5c19maW5pdF9tb2R1bGUrMHgxODMvMHgxYzAKIF9f
eDY0X3N5c19maW5pdF9tb2R1bGUrMHg0My8weDUwCiBkb19zeXNjYWxsXzY0KzB4YzgvMHg2MDYK
IGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKCkZpeGVzOiBmYjFkOTcz
OGNhMDUgKCJkcm0vdm13Z2Z4OiBBZGQgRFJNIGRyaXZlciBmb3IgVk13YXJlIFZpcnR1YWwgR1BV
IikKQ28tZGV2ZWxvcGVkLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5j
b20+ClNpZ25lZC1vZmYtYnk6IFFpYW4gQ2FpIDxjYWlAbGNhLnB3PgpTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+ClNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwppbmRleCA4MmFlNjg3MTY2OTYuLjA1YTgwMDgw
N2MyNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKQEAgLTc4OSw2ICs3ODksOSBA
QCBzdGF0aWMgaW50IHZtd19kcml2ZXJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNp
Z25lZCBsb25nIGNoaXBzZXQpCiAJaWYgKHVubGlrZWx5KHJldCAhPSAwKSkKIAkJZ290byBvdXRf
ZXJyMDsKIAorCWRtYV9zZXRfbWF4X3NlZ19zaXplKGRldi0+ZGV2LCBtaW5fdCh1bnNpZ25lZCBp
bnQsIFUzMl9NQVggJiBQQUdFX01BU0ssCisJCQkJCSAgICAgU0NBVFRFUkxJU1RfTUFYX1NFR01F
TlQpKTsKKwogCWlmIChkZXZfcHJpdi0+Y2FwYWJpbGl0aWVzICYgU1ZHQV9DQVBfR01SMikgewog
CQlEUk1fSU5GTygiTWF4IEdNUiBpZHMgaXMgJXVcbiIsCiAJCQkgKHVuc2lnbmVkKWRldl9wcml2
LT5tYXhfZ21yX2lkcyk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
