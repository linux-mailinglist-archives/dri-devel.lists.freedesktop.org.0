Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C1110FEA5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915BC6E526;
	Tue,  3 Dec 2019 13:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0EE6E519
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id B9AE53F5DF;
 Tue,  3 Dec 2019 14:23:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njdJjHyyqHaO; Tue,  3 Dec 2019 14:22:57 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 119E93F569;
 Tue,  3 Dec 2019 14:22:52 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 2F380362542;
 Tue,  3 Dec 2019 14:22:50 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/vmwgfx: Hook up the helpers to align buffer objects
Date: Tue,  3 Dec 2019 14:22:39 +0100
Message-Id: <20191203132239.5910-9-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191203132239.5910-1-thomas_os@shipmail.org>
References: <20191203132239.5910-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575379370; bh=e1wYTAwwWqMQYijfh6tIDDQywC9mAhqJLyo2GIA6MnU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z6lzECFTtszlfFDZPSJ4FfQU7eCI7x9zyw13y6hBfEyjWFWCTyKgMZ0VgbMHfGLzv
 pV5jRgcmDtHz5upBlXqjZFZ3z5yyMb8rmQgipBkGVIBN0J9txWDSTkf+OstmRphXtx
 u9QEJ6lUCPbfKN2hOhhGyTR9dbqCzKApCcqe7LW4=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Z6lzECFT; 
 dkim-atps=neutral
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
 pv-drivers@vmware.com, Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
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
ZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKaW5kZXggZTk2MjA0OGY2NWQyLi41NDUyY2FiYjRhMmUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCkBAIC0xMjE1LDYgKzEyMTUsMTggQEAg
c3RhdGljIHZvaWQgdm13X3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKIAlkcm1fcHV0X2Rl
dihkZXYpOwogfQogCitzdGF0aWMgdW5zaWduZWQgbG9uZwordm13X2dldF91bm1hcHBlZF9hcmVh
KHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBsb25nIHVhZGRyLAorCQkgICAgICB1bnNpZ25l
ZCBsb25nIGxlbiwgdW5zaWduZWQgbG9uZyBwZ29mZiwKKwkJICAgICAgdW5zaWduZWQgbG9uZyBm
bGFncykKK3sKKwlzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiA9IGZpbGUtPnByaXZhdGVfZGF0
YTsKKwlzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2ID0gdm13X3ByaXYoZmlsZV9wcml2LT5t
aW5vci0+ZGV2KTsKKworCXJldHVybiBkcm1fZ2V0X3VubWFwcGVkX2FyZWEoZmlsZSwgdWFkZHIs
IGxlbiwgcGdvZmYsIGZsYWdzLAorCQkJCSAgICAgJmRldl9wcml2LT52bWFfbWFuYWdlcik7Cit9
CisKIHN0YXRpYyBpbnQgdm13Z2Z4X3BtX25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAq
bmIsIHVuc2lnbmVkIGxvbmcgdmFsLAogCQkJICAgICAgdm9pZCAqcHRyKQogewpAQCAtMTM4Niw2
ICsxMzk4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgdm13Z2Z4X2Ry
aXZlcl9mb3BzID0gewogCS5jb21wYXRfaW9jdGwgPSB2bXdfY29tcGF0X2lvY3RsLAogI2VuZGlm
CiAJLmxsc2VlayA9IG5vb3BfbGxzZWVrLAorCS5nZXRfdW5tYXBwZWRfYXJlYSA9IHZtd19nZXRf
dW5tYXBwZWRfYXJlYSwKIH07CiAKIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXIgPSB7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaCBiL2RyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oCmluZGV4IDg2NTZhOTc0NDhjMy4uOWIzYTVk
OTQwMDI0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaApAQCAtOTI5LDYgKzkyOSw3
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
