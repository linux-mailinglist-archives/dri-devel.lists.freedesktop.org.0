Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD4E7F873
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6486EE40;
	Fri,  2 Aug 2019 13:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B09F6EE3E;
 Fri,  2 Aug 2019 13:20:26 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 195C721849;
 Fri,  2 Aug 2019 13:20:25 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 23/76] drm/amd/display: Fix dc_create failure
 handling and 666 color depths
Date: Fri,  2 Aug 2019 09:18:57 -0400
Message-Id: <20190802131951.11600-23-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564752026;
 bh=giRhtxYzRCKHMP2+BeUpS3xr1ScaCTAL0Qv/EhoWJ+Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AYReBZ9ypar9TTmqZ6r1bskKK++EVSTODJt1njosat08sW4QkwVPPSSnBK5n40Dor
 umCWHNDs61yb24kh7z3ZQ1fjG+JJeP68bMeXHKep31fyHONgbTU2hPQnPFZzHotFyc
 qJX5+MXONVNqR0yaUqe4zDTvF0o3Dtf7ND6Ty8f8=
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene Liu <Charlene.Liu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Julian Parkin <julian.parkin@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSnVsaWFuIFBhcmtpbiA8anVsaWFuLnBhcmtpbkBhbWQuY29tPgoKWyBVcHN0cmVhbSBj
b21taXQgMDkwNWYzMjk3NzI2ODE0OWYwNmUzY2U2ZWE0YmQ2ZDM3NGRkODkxZiBdCgpbV2h5XQpJ
dCBpcyBwb3NzaWJsZSAoYnV0IHZlcnkgdW5saWtlbHkpIHRoYXQgY29uc3RydWN0aW5nIGRjIGZh
aWxzCmJlZm9yZSBjdXJyZW50X3N0YXRlIGlzIGNyZWF0ZWQuCgpXZSBzdXBwb3J0IDY2NiBjb2xv
ciBkZXB0aCBpbiBzb21lIHNjZW5hcmlvcywgYnV0IHRoaXMKaXNuJ3QgaGFuZGxlZCBpbiBnZXRf
bm9ybV9waXhfY2xrLiBJdCB1c2VzIGV4YWN0bHkgdGhlCnNhbWUgcGl4ZWwgY2xvY2sgYXMgdGhl
IDg4OCBjYXNlLgoKW0hvd10KQ2hlY2sgZm9yIG5vbiBudWxsIGN1cnJlbnRfc3RhdGUgYmVmb3Jl
IGRlc3RydWN0aW5nLgoKQWRkIGNhc2UgZm9yIDY2NiBjb2xvciBkZXB0aCB0byBnZXRfbm9ybV9w
aXhfY2xrIHRvCmF2b2lkIGFzc2VydGlvbi4KClNpZ25lZC1vZmYtYnk6IEp1bGlhbiBQYXJraW4g
PGp1bGlhbi5wYXJraW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENoYXJsZW5lIExpdSA8Q2hhcmxl
bmUuTGl1QGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyAgICAgICAgICB8IDYgKysrKy0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jIHwgMSArCiAyIGZp
bGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwppbmRleCBlZTZiNjQ2MTgwYjY2Li4wYTdhZGMy
OTI1ZTM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9k
Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKQEAgLTYw
OCw4ICs2MDgsMTAgQEAgY29uc3Qgc3RydWN0IGRjX2xpbmtfc2V0dGluZ3MgKmRjX2xpbmtfZ2V0
X2xpbmtfY2FwKAogCiBzdGF0aWMgdm9pZCBkZXN0cnVjdChzdHJ1Y3QgZGMgKmRjKQogewotCWRj
X3JlbGVhc2Vfc3RhdGUoZGMtPmN1cnJlbnRfc3RhdGUpOwotCWRjLT5jdXJyZW50X3N0YXRlID0g
TlVMTDsKKwlpZiAoZGMtPmN1cnJlbnRfc3RhdGUpIHsKKwkJZGNfcmVsZWFzZV9zdGF0ZShkYy0+
Y3VycmVudF9zdGF0ZSk7CisJCWRjLT5jdXJyZW50X3N0YXRlID0gTlVMTDsKKwl9CiAKIAlkZXN0
cm95X2xpbmtzKGRjKTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX3Jlc291cmNlLmMKaW5kZXggYWQ4MjkwNmI5OWRiOS4uYjg3ZThkODBiYjZhOCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2Uu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5j
CkBAIC0xODcyLDYgKzE4NzIsNyBAQCBzdGF0aWMgaW50IGdldF9ub3JtX3BpeF9jbGsoY29uc3Qg
c3RydWN0IGRjX2NydGNfdGltaW5nICp0aW1pbmcpCiAJCXBpeF9jbGsgLz0gMjsKIAlpZiAodGlt
aW5nLT5waXhlbF9lbmNvZGluZyAhPSBQSVhFTF9FTkNPRElOR19ZQ0JDUjQyMikgewogCQlzd2l0
Y2ggKHRpbWluZy0+ZGlzcGxheV9jb2xvcl9kZXB0aCkgeworCQljYXNlIENPTE9SX0RFUFRIXzY2
NjoKIAkJY2FzZSBDT0xPUl9ERVBUSF84ODg6CiAJCQlub3JtYWxpemVkX3BpeF9jbGsgPSBwaXhf
Y2xrOwogCQkJYnJlYWs7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
