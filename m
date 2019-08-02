Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320B07F86C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8386D6EE32;
	Fri,  2 Aug 2019 13:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C0C6EE31;
 Fri,  2 Aug 2019 13:20:21 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7B822173E;
 Fri,  2 Aug 2019 13:20:19 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 21/76] drm/amd/display: put back front end
 initialization sequence
Date: Fri,  2 Aug 2019 09:18:55 -0400
Message-Id: <20190802131951.11600-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564752020;
 bh=ZTgKVv/+41uuwfvZ4owFkNllfRpb6iuJiPPKFq1ugq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c36RQZh90jt6qkcd0pFdz8mK9sux/ztKpSZdsQ2F8g8Kd4cvl5+Vi4M+eBf5c+qgp
 TCKxWFTzswjLAMHJjSvqgv7GomTs1oWBGs7eeWq04VYkCR2B6X9NeOkYClZKko3Cid
 O0e4oyuA51lrSBBDLaBMy79egx41eCI2UAywvghM=
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
Cc: Sasha Levin <sashal@kernel.org>, Eric Yang <Eric.Yang2@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCBm
ZWI3ZWI1MjJlMGE3YTIyYzFlNjBkMzg2YmQzYzNiZmExZDVlNGY3IF0KCltXaHldClNlYW1sZXNz
IGJvb3Qgb3B0aW1pemF0aW9uIHJlbW92ZWQgcHJvcGVyIGZyb250IGVuZCBwb3dlciBvZmYgc2Vx
dWVuY2UuCkluIGRyaXZlciBkaXNhYmxlIGVuYWJsZSBjYXNlLCB0aGlzIGNhdXNlcyBkcml2ZXIg
dG8gcG93ZXIgZ2F0ZSBodWJwCmFuZCBkcHAgd2hpbGUgdGhlcmUgaXMgc3RpbGwgbWVtb3J5IGZl
dGNoaW5nIGdvaW5nIG9uLCB0aGlzIGNhbiBjYXVzZQppbnZhbGlkIG1lbW9yeSByZXF1ZXN0cyB0
byBiZSBnZW5lcmF0ZWQgd2hpY2ggd2lsbCBoYW5nIGRhdGEgZmFicmljLgoKW0hvd10KUHV0IGJh
Y2sgcHJvcGVyIGZyb250IGVuZCBwb3dlciBvZmYgc2VxdWVuY2UKClNpZ25lZC1vZmYtYnk6IEVy
aWMgWWFuZyA8RXJpYy5ZYW5nMkBhbWQuY29tPgpSZXZpZXdlZC1ieTogQW50aG9ueSBLb28gPEFu
dGhvbnkuS29vQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4K
QWNrZWQtYnk6IFRvbnkgQ2hlbmcgPFRvbnkuQ2hlbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBT
YXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogLi4uL2RybS9hbWQvZGlzcGxheS9k
Yy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyB8IDE1ICstLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2Vy
LmMKaW5kZXggYzdiNGMzMDQ4YjcxZC4uNWNjNWRhYmY0ZDY1MiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIu
YwpAQCAtMTEyMCwxNiArMTEyMCw3IEBAIHN0YXRpYyB2b2lkIGRjbjEwX2luaXRfaHcoc3RydWN0
IGRjICpkYykKIAkgKiBldmVyeXRoaW5nIGRvd24uCiAJICovCiAJaWYgKGRjYi0+ZnVuY3MtPmlz
X2FjY2VsZXJhdGVkX21vZGUoZGNiKSB8fCBkYy0+Y29uZmlnLnBvd2VyX2Rvd25fZGlzcGxheV9v
bl9ib290KSB7Ci0JCWZvciAoaSA9IDA7IGkgPCBkYy0+cmVzX3Bvb2wtPnBpcGVfY291bnQ7IGkr
KykgewotCQkJc3RydWN0IGh1YnAgKmh1YnAgPSBkYy0+cmVzX3Bvb2wtPmh1YnBzW2ldOwotCQkJ
c3RydWN0IGRwcCAqZHBwID0gZGMtPnJlc19wb29sLT5kcHBzW2ldOwotCi0JCQlodWJwLT5mdW5j
cy0+aHVicF9pbml0KGh1YnApOwotCQkJZGMtPnJlc19wb29sLT5vcHBzW2ldLT5tcGNfdHJlZV9w
YXJhbXMub3BwX2lkID0gZGMtPnJlc19wb29sLT5vcHBzW2ldLT5pbnN0OwotCQkJcGxhbmVfYXRv
bWljX3Bvd2VyX2Rvd24oZGMsIGRwcCwgaHVicCk7Ci0JCX0KLQotCQlhcHBseV9ERUdWSURDTjEw
XzI1M193YShkYyk7CisJCWRjLT5od3NzLmluaXRfcGlwZXMoZGMsIGRjLT5jdXJyZW50X3N0YXRl
KTsKIAl9CiAKIAlmb3IgKGkgPSAwOyBpIDwgZGMtPnJlc19wb29sLT5hdWRpb19jb3VudDsgaSsr
KSB7CkBAIC0xMjk4LDEwICsxMjg5LDYgQEAgc3RhdGljIGJvb2wgZGNuMTBfc2V0X2lucHV0X3Ry
YW5zZmVyX2Z1bmMoc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCwKIAlyZXR1cm4gcmVzdWx0Owog
fQogCi0KLQotCi0KIHN0YXRpYyBib29sCiBkY24xMF9zZXRfb3V0cHV0X3RyYW5zZmVyX2Z1bmMo
c3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCwKIAkJCSAgICAgICBjb25zdCBzdHJ1Y3QgZGNfc3Ry
ZWFtX3N0YXRlICpzdHJlYW0pCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
