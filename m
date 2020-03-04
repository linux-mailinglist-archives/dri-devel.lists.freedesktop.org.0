Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091F5178E68
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 11:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5E36EB14;
	Wed,  4 Mar 2020 10:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDEA6EB08
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 10:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id E90D0404FE;
 Wed,  4 Mar 2020 11:28:51 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Vp2NlkyK; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uOqXNY853LJq; Wed,  4 Mar 2020 11:28:50 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id A1AFC40519;
 Wed,  4 Mar 2020 11:28:50 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 0281C362DAE;
 Wed,  4 Mar 2020 11:28:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1583317729; bh=J0csJtJzFzASFDy4326l66VL08ywOKVC8Fi2u7EkHTo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vp2NlkyKSL5Wyly/KMrxFkAg4Xr52zc8y1jtjI3InujE/rjClhS07d+9PYvjJchcz
 CI9PKtsmvhOWT4ZfA32805OXT1ba+Zu1XDKia1qZGhQyF6wfydbuCwC+m8QXPjfPS4
 kTyAVIxeC55zA/weEyYIhgEOkFZ9b4TK+ZkTf1Vs=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 9/9] drm/vmwgfx: Hook up the helpers to align buffer objects
Date: Wed,  4 Mar 2020 11:28:40 +0100
Message-Id: <20200304102840.2801-10-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200304102840.2801-1-thomas_os@shipmail.org>
References: <20200304102840.2801-1-thomas_os@shipmail.org>
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
IFJvbGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPgpBY2tlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZmlsZS5jICAgICAgICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2Rydi5jICAgICAgICB8IDEzICsrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X2Rydi5oICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X3R0bV9idWZmZXIuYyB8ICAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZpbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jCmluZGV4IDc3ZTY5MTIwMmI1Mi4u
YjI5YTcyYjY4MDY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwpAQCAtOTM1LDQgKzkzNSw1IEBAIHVuc2lnbmVk
IGxvbmcgZHJtX2dldF91bm1hcHBlZF9hcmVhKHN0cnVjdCBmaWxlICpmaWxlLAogCXJldHVybiBj
dXJyZW50LT5tbS0+Z2V0X3VubWFwcGVkX2FyZWEoZmlsZSwgdWFkZHIsIGxlbiwgcGdvZmYsIGZs
YWdzKTsKIH0KICNlbmRpZiAvKiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UgKi8KK0VYUE9S
VF9TWU1CT0xfR1BMKGRybV9nZXRfdW5tYXBwZWRfYXJlYSk7CiAjZW5kaWYgLyogQ09ORklHX01N
VSAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwppbmRleCA4Mjc0NThmNDkxMTIuLjc3
ZDg1YmM1NGVmMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKQEAgLTEyMjMsNiAr
MTIyMywxOCBAQCBzdGF0aWMgdm9pZCB2bXdfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQog
CXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKIH0KIAorc3RhdGljIHVuc2lnbmVkIGxvbmcKK3Zt
d19nZXRfdW5tYXBwZWRfYXJlYShzdHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgbG9uZyB1YWRk
ciwKKwkJICAgICAgdW5zaWduZWQgbG9uZyBsZW4sIHVuc2lnbmVkIGxvbmcgcGdvZmYsCisJCSAg
ICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCit7CisJc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYg
PSBmaWxlLT5wcml2YXRlX2RhdGE7CisJc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiA9IHZt
d19wcml2KGZpbGVfcHJpdi0+bWlub3ItPmRldik7CisKKwlyZXR1cm4gZHJtX2dldF91bm1hcHBl
ZF9hcmVhKGZpbGUsIHVhZGRyLCBsZW4sIHBnb2ZmLCBmbGFncywKKwkJCQkgICAgICZkZXZfcHJp
di0+dm1hX21hbmFnZXIpOworfQorCiBzdGF0aWMgaW50IHZtd2dmeF9wbV9ub3RpZmllcihzdHJ1
Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLCB1bnNpZ25lZCBsb25nIHZhbCwKIAkJCSAgICAgIHZvaWQg
KnB0cikKIHsKQEAgLTEzOTQsNiArMTQwNiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9v
cGVyYXRpb25zIHZtd2dmeF9kcml2ZXJfZm9wcyA9IHsKIAkuY29tcGF0X2lvY3RsID0gdm13X2Nv
bXBhdF9pb2N0bCwKICNlbmRpZgogCS5sbHNlZWsgPSBub29wX2xsc2VlaywKKwkuZ2V0X3VubWFw
cGVkX2FyZWEgPSB2bXdfZ2V0X3VubWFwcGVkX2FyZWEsCiB9OwogCiBzdGF0aWMgc3RydWN0IGRy
bV9kcml2ZXIgZHJpdmVyID0gewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaAppbmRleCBm
ZTViNzI5M2I4ZDEuLjQ4NTNiZDk1YmY1NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2
LmgKQEAgLTkyOSw2ICs5MjksNyBAQCBleHRlcm4gaW50IHZtd19tbWFwKHN0cnVjdCBmaWxlICpm
aWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7CiAKIGV4dGVybiB2b2lkIHZtd192YWxp
ZGF0aW9uX21lbV9pbml0X3R0bShzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2LAogCQkJCQlz
aXplX3QgZ3Jhbik7CisKIC8qKgogICogVFRNIGJ1ZmZlciBvYmplY3QgZHJpdmVyIC0gdm13Z2Z4
X3R0bV9idWZmZXIuYwogICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF90dG1fYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVm
ZmVyLmMKaW5kZXggZDhlYTNkZDEwYWYwLi4zNGM3MjFhYjNmZjMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKQEAgLTc1NCw3ICs3NTQsNyBAQCBzdGF0aWMg
aW50IHZtd19pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJf
dCB0eXBlLAogCQlicmVhazsKIAljYXNlIFRUTV9QTF9WUkFNOgogCQkvKiAiT24tY2FyZCIgdmlk
ZW8gcmFtICovCi0JCW1hbi0+ZnVuYyA9ICZ0dG1fYm9fbWFuYWdlcl9mdW5jOworCQltYW4tPmZ1
bmMgPSAmdm13X3RocF9mdW5jOwogCQltYW4tPmdwdV9vZmZzZXQgPSAwOwogCQltYW4tPmZsYWdz
ID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRCB8IFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7CiAJ
CW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7Ci0tIAoyLjIxLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
