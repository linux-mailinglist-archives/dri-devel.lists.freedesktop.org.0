Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B0CBCD69
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8D06EA93;
	Tue, 24 Sep 2019 16:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FDA6EA91;
 Tue, 24 Sep 2019 16:46:38 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCE0121D82;
 Tue, 24 Sep 2019 16:46:37 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 22/70] drm/amd/display: fix issue where 252-255
 values are clipped
Date: Tue, 24 Sep 2019 12:45:01 -0400
Message-Id: <20190924164549.27058-22-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343598;
 bh=RXz6wrou/rLsSHwyEPfyPMYLuJ/X2bB/HTRQZPCvBoU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qZEQ+KouidK6bsaSSLrC9pbWlfkNF9+KfuVP8HjOQG0nm424Qp64+ki20neofpz8y
 Fnuy6iAuU3FLGh4aDZBEiIk6qTDSplwUdQkFkkvWKzAbxow9lDwXnFzpkTBI3Sd8y9
 l4u8PkBDiIuTvQaHy39swhbvjPIZYSH8jTHdKBks=
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
Cc: Sasha Levin <sashal@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCAxY2JjZmM5NzUxNjRmMzk3YjQ0OWVmYjE3ZjU5ZDgxYTcwMzA5MGRiIF0KCltXaHldCldoZW4g
ZW5kcG9pbnQgaXMgYXQgdGhlIGJvdW5kYXJ5IG9mIGEgcmVnaW9uLCBzdWNoIGFzIGF0IDJeMD0x
CndlIGZpbmQgdGhhdCB0aGUgbGFzdCBzZWdtZW50IGhhcyBhIHNoYXJwIHNsb3BlIGFuZCBzb21l
IHBvaW50cwphcmUgY2xpcHBlZCBhdCB0aGUgdG9wLgoKW0hvd10KSWYgZW5kIHBvaW50IGlzIDEs
IHdoaWNoIGlzIGV4YWN0bHkgYXQgdGhlIDJeMCByZWdpb24gYm91bmRhcnksIHdlCm5lZWQgdG8g
cHJvZ3JhbSBhbiBhZGRpdGlvbmFsIHJlZ2lvbiBiZXlvbmQgdGhpcyBwb2ludC4KClNpZ25lZC1v
ZmYtYnk6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQXJp
YyBDeXIgPEFyaWMuQ3lyQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2NtX2NvbW1vbi5jIHwg
MyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfY21f
Y29tbW9uLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfY21f
Y29tbW9uLmMKaW5kZXggNzQ2OTMzM2EyYzhhNS4uODE2NmZkYmFjZDczMiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2NtX2NvbW1vbi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9jbV9jb21tb24u
YwpAQCAtMzU3LDkgKzM1NywxMCBAQCBib29sIGNtX2hlbHBlcl90cmFuc2xhdGVfY3VydmVfdG9f
aHdfZm9ybWF0KAogCQlzZWdfZGlzdHJbN10gPSA0OwogCQlzZWdfZGlzdHJbOF0gPSA0OwogCQlz
ZWdfZGlzdHJbOV0gPSA0OworCQlzZWdfZGlzdHJbMTBdID0gMTsKIAogCQlyZWdpb25fc3RhcnQg
PSAtMTA7Ci0JCXJlZ2lvbl9lbmQgPSAwOworCQlyZWdpb25fZW5kID0gMTsKIAl9CiAKIAlmb3Ig
KGkgPSByZWdpb25fZW5kIC0gcmVnaW9uX3N0YXJ0OyBpIDwgTUFYX1JFR0lPTlNfTlVNQkVSIDsg
aSsrKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
