Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9B1147A14
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 10:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3A66FFAF;
	Fri, 24 Jan 2020 09:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9606FFAF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 09:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id E00753FCA9;
 Fri, 24 Jan 2020 10:09:52 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=lS4nX1DV; 
 dkim-atps=neutral
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
 with ESMTP id 8PidFqMPUqvX; Fri, 24 Jan 2020 10:09:50 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 8EB0B3FAB4;
 Fri, 24 Jan 2020 10:09:50 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D2739360718;
 Fri, 24 Jan 2020 10:09:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579856988; bh=lJ6DzR2xQ47UqIvaj1aHLOq+F4rAuAOVnS8mZ8o5xDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lS4nX1DV8zotxiYGwewVyBGX1oaA1XfGYJU5/rMNd8vwJTgD/zSe1SBJy+8JhhwN8
 q0efUd5CKJEGmO8ETEIsFBQ3TH8sWFPw1AumuFymWeL9iNTr2IdFYn7oczsImoUbqE
 H56gUSKS24agiqjLnY5juzeysws0i/KuEg4wUgMI=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] drm/vmwgfx: Hook up the helpers to align buffer objects
Date: Fri, 24 Jan 2020 10:09:40 +0100
Message-Id: <20200124090940.26571-10-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200124090940.26571-1-thomas_os@shipmail.org>
References: <20200124090940.26571-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 pv-drivers@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 Dan Williams <dan.j.williams@intel.com>, Ralph Campbell <rcampbell@nvidia.com>,
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
PgpDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+ClNpZ25lZC1vZmYt
Ynk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KUmV2aWV3ZWQtYnk6
IFJvbGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZmlsZS5jICAgICAgICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2Rydi5jICAgICAgICB8IDEzICsrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYyB8ICAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZpbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jCmluZGV4IDQwZmFlMzU2ZDIw
Mi4uMWRmMmZjYTYwOGMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwpAQCAtOTMyLDMgKzkzMiw0IEBAIHVuc2ln
bmVkIGxvbmcgZHJtX2dldF91bm1hcHBlZF9hcmVhKHN0cnVjdCBmaWxlICpmaWxlLAogCXJldHVy
biBjdXJyZW50LT5tbS0+Z2V0X3VubWFwcGVkX2FyZWEoZmlsZSwgdWFkZHIsIGxlbiwgcGdvZmYs
IGZsYWdzKTsKIH0KICNlbmRpZiAvKiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UgKi8KK0VY
UE9SVF9TWU1CT0xfR1BMKGRybV9nZXRfdW5tYXBwZWRfYXJlYSk7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2Rydi5jCmluZGV4IGU5NjIwNDhmNjVkMi4uNTQ1MmNhYmI0YTJlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwpAQCAtMTIxNSw2ICsxMjE1LDE4IEBAIHN0YXRpYyB2b2lk
IHZtd19yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCiAJZHJtX3B1dF9kZXYoZGV2KTsKIH0K
IAorc3RhdGljIHVuc2lnbmVkIGxvbmcKK3Ztd19nZXRfdW5tYXBwZWRfYXJlYShzdHJ1Y3QgZmls
ZSAqZmlsZSwgdW5zaWduZWQgbG9uZyB1YWRkciwKKwkJICAgICAgdW5zaWduZWQgbG9uZyBsZW4s
IHVuc2lnbmVkIGxvbmcgcGdvZmYsCisJCSAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCit7CisJ
c3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYgPSBmaWxlLT5wcml2YXRlX2RhdGE7CisJc3RydWN0
IHZtd19wcml2YXRlICpkZXZfcHJpdiA9IHZtd19wcml2KGZpbGVfcHJpdi0+bWlub3ItPmRldik7
CisKKwlyZXR1cm4gZHJtX2dldF91bm1hcHBlZF9hcmVhKGZpbGUsIHVhZGRyLCBsZW4sIHBnb2Zm
LCBmbGFncywKKwkJCQkgICAgICZkZXZfcHJpdi0+dm1hX21hbmFnZXIpOworfQorCiBzdGF0aWMg
aW50IHZtd2dmeF9wbV9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLCB1bnNpZ25l
ZCBsb25nIHZhbCwKIAkJCSAgICAgIHZvaWQgKnB0cikKIHsKQEAgLTEzODYsNiArMTM5OCw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHZtd2dmeF9kcml2ZXJfZm9wcyA9
IHsKIAkuY29tcGF0X2lvY3RsID0gdm13X2NvbXBhdF9pb2N0bCwKICNlbmRpZgogCS5sbHNlZWsg
PSBub29wX2xsc2VlaywKKwkuZ2V0X3VubWFwcGVkX2FyZWEgPSB2bXdfZ2V0X3VubWFwcGVkX2Fy
ZWEsCiB9OwogCiBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgZHJpdmVyID0gewpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9kcnYuaAppbmRleCAwNjI2NzE4NGFhMGEuLjllYTE0NWNmZmEzZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKQEAgLTkyOSw2ICs5MjksNyBAQCBleHRlcm4g
aW50IHZtd19tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSk7CiAKIGV4dGVybiB2b2lkIHZtd192YWxpZGF0aW9uX21lbV9pbml0X3R0bShzdHJ1Y3Qgdm13
X3ByaXZhdGUgKmRldl9wcml2LAogCQkJCQlzaXplX3QgZ3Jhbik7CisKIC8qKgogICogVFRNIGJ1
ZmZlciBvYmplY3QgZHJpdmVyIC0gdm13Z2Z4X3R0bV9idWZmZXIuYwogICovCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKaW5kZXggZDhlYTNkZDEwYWYwLi4zNGM3
MjFhYjNmZjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9i
dWZmZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMK
QEAgLTc1NCw3ICs3NTQsNyBAQCBzdGF0aWMgaW50IHZtd19pbml0X21lbV90eXBlKHN0cnVjdCB0
dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAogCQlicmVhazsKIAljYXNlIFRUTV9Q
TF9WUkFNOgogCQkvKiAiT24tY2FyZCIgdmlkZW8gcmFtICovCi0JCW1hbi0+ZnVuYyA9ICZ0dG1f
Ym9fbWFuYWdlcl9mdW5jOworCQltYW4tPmZ1bmMgPSAmdm13X3RocF9mdW5jOwogCQltYW4tPmdw
dV9vZmZzZXQgPSAwOwogCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRCB8IFRU
TV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7CiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1f
UExfRkxBR19DQUNIRUQ7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
