Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C85191AA6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 21:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D766E52F;
	Tue, 24 Mar 2020 20:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F9A6E529
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 20:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 739123F622;
 Tue, 24 Mar 2020 21:11:59 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Kl8o1BtF; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1yL9sC9zG1m; Tue, 24 Mar 2020 21:11:58 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 50ADC3F2C1;
 Tue, 24 Mar 2020 21:11:58 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A42093602F7;
 Tue, 24 Mar 2020 21:11:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1585080718; bh=dge3pNJVvGiKNp3sQJQFaMfk+pmcdaLcKhPFLMuRR/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kl8o1BtFZy8oqt7W50ge8DqKF/0i+NxXwf3Gt+O1+JBQgqu5ii1uE59nwHIM1tYku
 AqVqqRYQ7K1bZpASYeqwa9r7iy8wVt1YT0dMaO98pH0D6YIfg6d3ytCsGuWkdhts7l
 CB0Ww5omotebFfKJM3ARhwymLYwOkZ1Y+Ql32tyY=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 9/9] drm/vmwgfx: Hook up the helpers to align buffer objects
Date: Tue, 24 Mar 2020 21:11:23 +0100
Message-Id: <20200324201123.3118-10-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200324201123.3118-1-thomas_os@shipmail.org>
References: <20200324201123.3118-1-thomas_os@shipmail.org>
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 "Thomas Hellstrom \(VMware\)" <thomas_os@shipmail.org>,
 Dan Williams <dan.j.williams@intel.com>,
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

RnJvbTogIlRob21hcyBIZWxsc3Ryb20gKFZNd2FyZSkiIDx0aG9tYXNfb3NAc2hpcG1haWwub3Jn
PgoKU3RhcnQgdXNpbmcgdGhlIGhlbHBlcnMgdGhhdCBhbGlnbiBidWZmZXIgb2JqZWN0IHVzZXIt
c3BhY2UgYWRkcmVzc2VzIGFuZApidWZmZXIgb2JqZWN0IHZyYW0gYWRkcmVzc2VzIHRvIGh1Z2Ug
cGFnZSBib3VuZGFyaWVzLgpUaGlzIGlzIHRvIGltcHJvdmUgdGhlIGNoYW5jZXMgb2YgYWxsb3dp
bmcgaHVnZSBwYWdlLXRhYmxlIGVudHJpZXMuCgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51
eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpDYzog
Ik1hdHRoZXcgV2lsY294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6ICJLaXJp
bGwgQS4gU2h1dGVtb3YiIDxraXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29tPgpDYzogUmFs
cGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpDYzogIkrDqXLDtG1lIEdsaXNzZSIg
PGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgpDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gKFZNd2FyZSkgPHRob21hc19vc0BzaGlw
bWFpbC5vcmc+ClJldmlld2VkLWJ5OiBSb2xhbmQgU2NoZWlkZWdnZXIgPHNyb2xhbmRAdm13YXJl
LmNvbT4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyAgICAgICAgICAgICAgICAgfCAgMSAr
CiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyAgICAgICAgfCAxMyArKysrKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaCAgICAgICAgfCAgMSAr
CiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgfCAgMiArLQogNCBm
aWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUu
YwppbmRleCBkMWZjYjBjNjE2MjIuLmViMDA5ZDNhYjQ4ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9maWxlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMKQEAgLTEw
MTEsNCArMTAxMSw1IEBAIHVuc2lnbmVkIGxvbmcgZHJtX2dldF91bm1hcHBlZF9hcmVhKHN0cnVj
dCBmaWxlICpmaWxlLAogCXJldHVybiBjdXJyZW50LT5tbS0+Z2V0X3VubWFwcGVkX2FyZWEoZmls
ZSwgdWFkZHIsIGxlbiwgcGdvZmYsIGZsYWdzKTsKIH0KICNlbmRpZiAvKiBDT05GSUdfVFJBTlNQ
QVJFTlRfSFVHRVBBR0UgKi8KK0VYUE9SVF9TWU1CT0xfR1BMKGRybV9nZXRfdW5tYXBwZWRfYXJl
YSk7CiAjZW5kaWYgLyogQ09ORklHX01NVSAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYu
YwppbmRleCA0ZjU4MzY0NDIxY2UuLmYwYjdhODkxY2JhZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfZHJ2LmMKQEAgLTEyMzAsNiArMTIzMCwxOCBAQCBzdGF0aWMgdm9pZCB2bXdfcmVtb3Zl
KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQogCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKIH0KIAor
c3RhdGljIHVuc2lnbmVkIGxvbmcKK3Ztd19nZXRfdW5tYXBwZWRfYXJlYShzdHJ1Y3QgZmlsZSAq
ZmlsZSwgdW5zaWduZWQgbG9uZyB1YWRkciwKKwkJICAgICAgdW5zaWduZWQgbG9uZyBsZW4sIHVu
c2lnbmVkIGxvbmcgcGdvZmYsCisJCSAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCit7CisJc3Ry
dWN0IGRybV9maWxlICpmaWxlX3ByaXYgPSBmaWxlLT5wcml2YXRlX2RhdGE7CisJc3RydWN0IHZt
d19wcml2YXRlICpkZXZfcHJpdiA9IHZtd19wcml2KGZpbGVfcHJpdi0+bWlub3ItPmRldik7CisK
KwlyZXR1cm4gZHJtX2dldF91bm1hcHBlZF9hcmVhKGZpbGUsIHVhZGRyLCBsZW4sIHBnb2ZmLCBm
bGFncywKKwkJCQkgICAgICZkZXZfcHJpdi0+dm1hX21hbmFnZXIpOworfQorCiBzdGF0aWMgaW50
IHZtd2dmeF9wbV9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLCB1bnNpZ25lZCBs
b25nIHZhbCwKIAkJCSAgICAgIHZvaWQgKnB0cikKIHsKQEAgLTE0MDEsNiArMTQxMyw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHZtd2dmeF9kcml2ZXJfZm9wcyA9IHsK
IAkuY29tcGF0X2lvY3RsID0gdm13X2NvbXBhdF9pb2N0bCwKICNlbmRpZgogCS5sbHNlZWsgPSBu
b29wX2xsc2VlaywKKwkuZ2V0X3VubWFwcGVkX2FyZWEgPSB2bXdfZ2V0X3VubWFwcGVkX2FyZWEs
CiB9OwogCiBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgZHJpdmVyID0gewpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF9kcnYuaAppbmRleCBkMTlkMjhjMTM2NzEuLmZjOTg2MjJjYWY4NyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKQEAgLTkxNSw2ICs5MTUsNyBAQCBleHRlcm4gaW50
IHZtd19tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7
CiAKIGV4dGVybiB2b2lkIHZtd192YWxpZGF0aW9uX21lbV9pbml0X3R0bShzdHJ1Y3Qgdm13X3By
aXZhdGUgKmRldl9wcml2LAogCQkJCQlzaXplX3QgZ3Jhbik7CisKIC8qKgogICogVFRNIGJ1ZmZl
ciBvYmplY3QgZHJpdmVyIC0gdm13Z2Z4X3R0bV9idWZmZXIuYwogICovCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKaW5kZXggM2YzYjJjN2EyMDhhLi5iZjBiYzQ2
OTc5NTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZm
ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKQEAg
LTc0OSw3ICs3NDksNyBAQCBzdGF0aWMgaW50IHZtd19pbml0X21lbV90eXBlKHN0cnVjdCB0dG1f
Ym9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAogCQlicmVhazsKIAljYXNlIFRUTV9QTF9W
UkFNOgogCQkvKiAiT24tY2FyZCIgdmlkZW8gcmFtICovCi0JCW1hbi0+ZnVuYyA9ICZ0dG1fYm9f
bWFuYWdlcl9mdW5jOworCQltYW4tPmZ1bmMgPSAmdm13X3RocF9mdW5jOwogCQltYW4tPmdwdV9v
ZmZzZXQgPSAwOwogCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRCB8IFRUTV9N
RU1UWVBFX0ZMQUdfTUFQUEFCTEU7CiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExf
RkxBR19DQUNIRUQ7Ci0tIAoyLjIxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
