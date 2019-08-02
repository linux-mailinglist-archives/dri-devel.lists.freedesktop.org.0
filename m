Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A791F7F8D3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D9D6EE44;
	Fri,  2 Aug 2019 13:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3455A6EE42;
 Fri,  2 Aug 2019 13:23:25 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D9A120644;
 Fri,  2 Aug 2019 13:23:24 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 09/42] drm/amd/display: Fix dc_create failure
 handling and 666 color depths
Date: Fri,  2 Aug 2019 09:22:29 -0400
Message-Id: <20190802132302.13537-9-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802132302.13537-1-sashal@kernel.org>
References: <20190802132302.13537-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564752205;
 bh=+OHPHZfZOZOEfK4wBcFHFl5avew7AIiqTh9LpmExL/o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RPcLHZzvei5Xqhl6n4e2sQ2D8RtiU0SquoT98710hmrTAF6Hw5AFdG9dtz2igtY5+
 oawq5eYRZDxuK3y1Htxrps2qgUpEzJfVQWYatQVMWk5hFX1XYEr3lKCR2HF5/aoHFG
 4EJVHe2kcuI7gLGV4H/7fH9oBixdfDEjmmt5kUL4=
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
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwppbmRleCBlM2Y1ZTVkNmYwYzE4Li5mNGI4OWQx
ZWE2ZjZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9k
Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKQEAgLTQ2
Miw4ICs0NjIsMTAgQEAgdm9pZCBkY19saW5rX3NldF90ZXN0X3BhdHRlcm4oc3RydWN0IGRjX2xp
bmsgKmxpbmssCiAKIHN0YXRpYyB2b2lkIGRlc3RydWN0KHN0cnVjdCBkYyAqZGMpCiB7Ci0JZGNf
cmVsZWFzZV9zdGF0ZShkYy0+Y3VycmVudF9zdGF0ZSk7Ci0JZGMtPmN1cnJlbnRfc3RhdGUgPSBO
VUxMOworCWlmIChkYy0+Y3VycmVudF9zdGF0ZSkgeworCQlkY19yZWxlYXNlX3N0YXRlKGRjLT5j
dXJyZW50X3N0YXRlKTsKKwkJZGMtPmN1cnJlbnRfc3RhdGUgPSBOVUxMOworCX0KIAogCWRlc3Ry
b3lfbGlua3MoZGMpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGNfcmVzb3VyY2UuYwppbmRleCAwNmQ1OTg4ZGZmNzIzLi4xOWE5NTFlNTgxOGFjIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMK
QEAgLTE4NzIsNiArMTg3Miw3IEBAIHN0YXRpYyBpbnQgZ2V0X25vcm1fcGl4X2Nsayhjb25zdCBz
dHJ1Y3QgZGNfY3J0Y190aW1pbmcgKnRpbWluZykKIAkJcGl4X2NsayAvPSAyOwogCWlmICh0aW1p
bmctPnBpeGVsX2VuY29kaW5nICE9IFBJWEVMX0VOQ09ESU5HX1lDQkNSNDIyKSB7CiAJCXN3aXRj
aCAodGltaW5nLT5kaXNwbGF5X2NvbG9yX2RlcHRoKSB7CisJCWNhc2UgQ09MT1JfREVQVEhfNjY2
OgogCQljYXNlIENPTE9SX0RFUFRIXzg4ODoKIAkJCW5vcm1hbGl6ZWRfcGl4X2NsayA9IHBpeF9j
bGs7CiAJCQlicmVhazsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
