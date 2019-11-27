Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C6910ABC5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AA86E25E;
	Wed, 27 Nov 2019 08:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5672A6E25E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 08:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 7F79F47EA1;
 Wed, 27 Nov 2019 09:32:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_IqFsCwa9rn; Wed, 27 Nov 2019 09:32:05 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 6B5A547E6D;
 Wed, 27 Nov 2019 09:32:05 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 2B8F9360613;
 Wed, 27 Nov 2019 09:32:03 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-graphics-maintainer@vmware.com
Subject: [RFC PATCH 7/7] drm/vmwgfx: Hook up the helpers to align buffer
 objects
Date: Wed, 27 Nov 2019 09:31:20 +0100
Message-Id: <20191127083120.34611-8-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191127083120.34611-1-thomas_os@shipmail.org>
References: <20191127083120.34611-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1574843523; bh=jwqCDK65X9Nr+vj6cWmXV754kCheRvIPRNrCN2QVJEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q/LGqXta7HOJSbHX/Md2zh0jsJ6qRrtj0g/2wNu8YavfwNFdcBSaGLnfG9bGlBx54
 l3vHs/z975lQhi7pZRVPM2xcSfTHe+ChIzxduIRP2Svv1dd0UyPzehiVX5v7wVijKy
 sUmId1v0OlERZKw/qG4aWNUjCBV9exIglLuPq1CM=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=q/LGqXta; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKU3RhcnQgdXNp
bmcgdGhlIGhlbHBlcnMgdGhhdCBhbGlnbiBidWZmZXIgb2JqZWN0IHVzZXItc3BhY2UgYWRkcmVz
c2VzIGFuZApidWZmZXIgb2JqZWN0IHZyYW0gYWRkcmVzc2VzIHRvIGh1Z2UgcGFnZSBib3VuZGFy
aWVzLgpUaGlzIGlzIHRvIGltcHJvdmUgdGhlIGNoYW5jZXMgb2YgYWxsb3dpbmcgaHVnZSBwYWdl
LXRhYmxlIGVudHJpZXMuCgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9u
Lm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpDYzogIk1hdHRoZXcgV2ls
Y294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6ICJLaXJpbGwgQS4gU2h1dGVt
b3YiIDxraXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29tPgpDYzogUmFscGggQ2FtcGJlbGwg
PHJjYW1wYmVsbEBudmlkaWEuY29tPgpDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVk
aGF0LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgICAgICAgIHwgMTMgKysr
KysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggICAgICAgIHwg
IDEgKwogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jIHwgIDIgKy0K
IDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKaW5kZXggODFhOTU2NTE2NDNmLi5lYmVhZWE0Yjg3ZTkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCkBAIC0xMjE2LDYgKzEyMTYsMTggQEAg
c3RhdGljIHZvaWQgdm13X3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKIAlkcm1fcHV0X2Rl
dihkZXYpOwogfQogCitzdGF0aWMgdW5zaWduZWQgbG9uZwordm13X2dldF91bm1hcHBlZF9hcmVh
KHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBsb25nIHVhZGRyLAorCQkgICAgICB1bnNpZ25l
ZCBsb25nIGxlbiwgdW5zaWduZWQgbG9uZyBwZ29mZiwKKwkJICAgICAgdW5zaWduZWQgbG9uZyBm
bGFncykKK3sKKwlzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiA9IGZpbGUtPnByaXZhdGVfZGF0
YTsKKwlzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2ID0gdm13X3ByaXYoZmlsZV9wcml2LT5t
aW5vci0+ZGV2KTsKKworCXJldHVybiBkcm1fZ2V0X3VubWFwcGVkX2FyZWEoZmlsZSwgdWFkZHIs
IGxlbiwgcGdvZmYsIGZsYWdzLAorCQkJCSAgICAgJmRldl9wcml2LT52bWFfbWFuYWdlcik7Cit9
CisKIHN0YXRpYyBpbnQgdm13Z2Z4X3BtX25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAq
bmIsIHVuc2lnbmVkIGxvbmcgdmFsLAogCQkJICAgICAgdm9pZCAqcHRyKQogewpAQCAtMTM4Nyw2
ICsxMzk5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgdm13Z2Z4X2Ry
aXZlcl9mb3BzID0gewogCS5jb21wYXRfaW9jdGwgPSB2bXdfY29tcGF0X2lvY3RsLAogI2VuZGlm
CiAJLmxsc2VlayA9IG5vb3BfbGxzZWVrLAorCS5nZXRfdW5tYXBwZWRfYXJlYSA9IHZtd19nZXRf
dW5tYXBwZWRfYXJlYSwKIH07CiAKIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXIgPSB7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaCBiL2RyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oCmluZGV4IGIxODg0MmY3MzA4MS4uNzIzMmU5
MTJkYmMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaApAQCAtOTE4LDYgKzkxOCw3
IEBAIGV4dGVybiBpbnQgdm13X21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hKTsKIAogZXh0ZXJuIHZvaWQgdm13X3ZhbGlkYXRpb25fbWVtX2luaXRfdHRt
KHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYsCiAJCQkJCXNpemVfdCBncmFuKTsKKwogLyoq
CiAgKiBUVE0gYnVmZmVyIG9iamVjdCBkcml2ZXIgLSB2bXdnZnhfdHRtX2J1ZmZlci5jCiAgKi8K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYwppbmRleCBkOGVhM2Rk
MTBhZjAuLmMzMTlmZTBjYTkxMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfdHRtX2J1ZmZlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0
bV9idWZmZXIuYwpAQCAtNzU0LDcgKzc1NCw3IEBAIHN0YXRpYyBpbnQgdm13X2luaXRfbWVtX3R5
cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCiAJCWJyZWFrOwog
CWNhc2UgVFRNX1BMX1ZSQU06CiAJCS8qICJPbi1jYXJkIiB2aWRlbyByYW0gKi8KLQkJbWFuLT5m
dW5jID0gJnR0bV9ib19tYW5hZ2VyX2Z1bmM7CisJCW1hbi0+ZnVuYyA9ICZ0dG1fYm9fbWFuYWdl
cl9odWdlX2Z1bmM7CiAJCW1hbi0+Z3B1X29mZnNldCA9IDA7CiAJCW1hbi0+ZmxhZ3MgPSBUVE1f
TUVNVFlQRV9GTEFHX0ZJWEVEIHwgVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsKIAkJbWFuLT5h
dmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
