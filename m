Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0EBBCCB5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887276EA58;
	Tue, 24 Sep 2019 16:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456426EA59;
 Tue, 24 Sep 2019 16:42:20 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C94C20872;
 Tue, 24 Sep 2019 16:42:19 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 11/87] drm/amd/display: Clear FEC_READY shadow
 register if DPCD write fails
Date: Tue, 24 Sep 2019 12:40:27 -0400
Message-Id: <20190924164144.25591-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343340;
 bh=bnDghddhGNrXYMm7y7i94nht+NXgCpKvXxgaNq7ZRAE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zqdldz9+S4Pkp0DRASjh+0urs3aARz9VTXdxf0nD2jAToPy61XZ8L5EVzDPu9wXtJ
 cYefdpZcQxONHXFYxwTy1est8tDTEBkc4QCghPnAPnxfwh5DyMd8ZpcEyY4pWB0h6m
 VdkgVfKCnt/YNmWyRjAQ3/knHD4tbsCON8tjK0sM=
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
Cc: Sasha Levin <sashal@kernel.org>, Joshua Aberback <Joshua.Aberback@amd.com>,
 Chris Park <Chris.Park@amd.com>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKWyBVcHN0cmVhbSBj
b21taXQgZDY4YTc0NTQxNzM1ZTAzMGRlYTU2ZjcyNzQ2Y2QyNmQxOTk4NmY0MSBdCgpbd2h5XQpB
cyBhIGZhaWwtc2FmZSwgaW4gY2FzZSAnc2V0IEZFQ19SRUFEWScgRFBDRCB3cml0ZSBmYWlscywg
YSBIVyBzaGFkb3cKcmVnaXN0ZXIgc2hvdWxkIGJlIGNsZWFyZWQgYW5kIHRoZSBpbnRlcm5hbCBG
RUMgc3RhdCBzaG91bGQgYmUgc2V0IHRvCidub3QgcmVhZHknLiBUaGlzIGlzIHRvIG1ha2Ugc3Vy
ZSBIVyBzZXR0aW5ncyB3aWxsIGJlIGNvbnNpc3RlbnQgd2l0aApGRUNfUkVBRFkgc3RhdGUgb24g
dGhlIFJYLgoKU2lnbmVkLW9mZi1ieTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQu
Y29tPgpSZXZpZXdlZC1ieTogSm9zaHVhIEFiZXJiYWNrIDxKb3NodWEuQWJlcmJhY2tAYW1kLmNv
bT4KQWNrZWQtYnk6IENocmlzIFBhcmsgPENocmlzLlBhcmtAYW1kLmNvbT4KQWNrZWQtYnk6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNo
YWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9k
Y19saW5rX2RwLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCmluZGV4
IDJjN2FhZWQ5MDdiOTEuLjBiZjg1YTdhMmNkMzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKQEAgLTMwMzMsNiArMzAzMyw4IEBAIHZv
aWQgZHBfc2V0X2ZlY19yZWFkeShzdHJ1Y3QgZGNfbGluayAqbGluaywgYm9vbCByZWFkeSkKIAkJ
CQlsaW5rX2VuYy0+ZnVuY3MtPmZlY19zZXRfcmVhZHkobGlua19lbmMsIHRydWUpOwogCQkJCWxp
bmstPmZlY19zdGF0ZSA9IGRjX2xpbmtfZmVjX3JlYWR5OwogCQkJfSBlbHNlIHsKKwkJCQlsaW5r
LT5saW5rX2VuYy0+ZnVuY3MtPmZlY19zZXRfcmVhZHkobGluay0+bGlua19lbmMsIGZhbHNlKTsK
KwkJCQlsaW5rLT5mZWNfc3RhdGUgPSBkY19saW5rX2ZlY19ub3RfcmVhZHk7CiAJCQkJZG1fZXJy
b3IoImRwY2Qgd3JpdGUgZmFpbGVkIHRvIHNldCBmZWNfcmVhZHkiKTsKIAkJCX0KIAkJfSBlbHNl
IGlmIChsaW5rLT5mZWNfc3RhdGUgPT0gZGNfbGlua19mZWNfcmVhZHkgJiYgIXJlYWR5KSB7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
