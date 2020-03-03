Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71F5177406
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 11:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154DC6EA07;
	Tue,  3 Mar 2020 10:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAA46E9C9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 10:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 5F4BB3F7F9;
 Tue,  3 Mar 2020 11:23:12 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=lak2WDHo; 
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
 with ESMTP id K17yEYphN0du; Tue,  3 Mar 2020 11:23:05 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 38C233F713;
 Tue,  3 Mar 2020 11:23:05 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id BB9DA362DAF;
 Tue,  3 Mar 2020 11:22:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1583230979; bh=JfNovRvZVo/MoTjgb0qQfzrsjcTUR9LVi9r3UAOAtQ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lak2WDHoTp1mfD3El4kLCASZNJWMsX+Gb0FJ0Y8LahtryQ+Ao6d82AOZF8tmfQDbX
 alqDNrHTS/AfDo8DajYcGFMCd0t2ODtQYfpFQk9UMPJyUAlZ5mdq40NPIhZa+PnJiK
 79IX2PKY/CwUmsezkhYxbSPcpTqeA9mu4vugzMOE=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/9] drm/vmwgfx: Support huge page faults
Date: Tue,  3 Mar 2020 11:22:44 +0100
Message-Id: <20200303102247.4635-7-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200303102247.4635-1-thomas_os@shipmail.org>
References: <20200303102247.4635-1-thomas_os@shipmail.org>
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

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKV2l0aCB2bXdn
ZnggZGlydHktdHJhY2tpbmcgd2UgbmVlZCBhIHNwZWNpYWxpemVkIGh1Z2VfZmF1bHQKY2FsbGJh
Y2suIEltcGxlbWVudCBhbmQgaG9vayBpdCB1cC4KCkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxp
bnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CkNj
OiAiTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQub3JnPgpDYzogIktp
cmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5jb20+CkNjOiBS
YWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+CkNjOiAiSsOpcsO0bWUgR2xpc3Nl
IiA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNv
bT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29t
PgpSZXZpZXdlZC1ieTogUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZtd2FyZS5jb20+CkFj
a2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggICAgICAgIHwgIDQgKysKIGRyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3BhZ2VfZGlydHkuYyB8IDc0ICsrKysrKysrKysrKysr
KysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9nbHVlLmMgICB8ICA1
ICstCiAzIGZpbGVzIGNoYW5nZWQsIDgxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggYi9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaAppbmRleCA4NmI2OTM5N2QxNjYuLmJiMjc1N2M5
OGYwYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKQEAgLTE0MzAsNiArMTQzMCwx
MCBAQCB2b2lkIHZtd19ib19kaXJ0eV91bm1hcChzdHJ1Y3Qgdm13X2J1ZmZlcl9vYmplY3QgKnZi
bywKIAkJCXBnb2ZmX3Qgc3RhcnQsIHBnb2ZmX3QgZW5kKTsKIHZtX2ZhdWx0X3Qgdm13X2JvX3Zt
X2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKTsKIHZtX2ZhdWx0X3Qgdm13X2JvX3ZtX21rd3Jp
dGUoc3RydWN0IHZtX2ZhdWx0ICp2bWYpOworI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdF
UEFHRQordm1fZmF1bHRfdCB2bXdfYm9fdm1faHVnZV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZt
ZiwKKwkJCQllbnVtIHBhZ2VfZW50cnlfc2l6ZSBwZV9zaXplKTsKKyNlbmRpZgogCiAvKioKICAq
IFZNV19ERUJVR19LTVMgLSBEZWJ1ZyBvdXRwdXQgZm9yIGtlcm5lbCBtb2RlLXNldHRpbmcKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3BhZ2VfZGlydHkuYyBiL2Ry
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3BhZ2VfZGlydHkuYwppbmRleCAxN2E1ZGNhN2I5
MjEuLmNkZTNlMDdlYmFmNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfcGFnZV9kaXJ0eS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3BhZ2Vf
ZGlydHkuYwpAQCAtNDczLDcgKzQ3Myw3IEBAIHZtX2ZhdWx0X3Qgdm13X2JvX3ZtX2ZhdWx0KHN0
cnVjdCB2bV9mYXVsdCAqdm1mKQogCSAqIGEgbG90IG9mIHVubmVjZXNzYXJ5IHdyaXRlIGZhdWx0
cy4KIAkgKi8KIAlpZiAodmJvLT5kaXJ0eSAmJiB2Ym8tPmRpcnR5LT5tZXRob2QgPT0gVk1XX0JP
X0RJUlRZX01LV1JJVEUpCi0JCXByb3QgPSB2bWEtPnZtX3BhZ2VfcHJvdDsKKwkJcHJvdCA9IHZt
X2dldF9wYWdlX3Byb3Qodm1hLT52bV9mbGFncyAmIH5WTV9TSEFSRUQpOwogCWVsc2UKIAkJcHJv
dCA9IHZtX2dldF9wYWdlX3Byb3Qodm1hLT52bV9mbGFncyk7CiAKQEAgLTQ4NiwzICs0ODYsNzUg
QEAgdm1fZmF1bHRfdCB2bXdfYm9fdm1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiAKIAly
ZXR1cm4gcmV0OwogfQorCisjaWZkZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFCit2bV9m
YXVsdF90IHZtd19ib192bV9odWdlX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mLAorCQkJCWVu
dW0gcGFnZV9lbnRyeV9zaXplIHBlX3NpemUpCit7CisJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEgPSB2bWYtPnZtYTsKKwlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqKQorCSAgICB2bWEtPnZtX3ByaXZhdGVfZGF0YTsKKwlzdHJ1Y3Qg
dm13X2J1ZmZlcl9vYmplY3QgKnZibyA9CisJCWNvbnRhaW5lcl9vZihibywgc3RydWN0IHZtd19i
dWZmZXJfb2JqZWN0LCBiYXNlKTsKKwlwZ3Byb3RfdCBwcm90OworCXZtX2ZhdWx0X3QgcmV0Owor
CXBnb2ZmX3QgZmF1bHRfcGFnZV9zaXplOworCWJvb2wgd3JpdGUgPSB2bWYtPmZsYWdzICYgRkFV
TFRfRkxBR19XUklURTsKKwlib29sIGlzX2Nvd19tYXBwaW5nID0KKwkJKHZtYS0+dm1fZmxhZ3Mg
JiAoVk1fU0hBUkVEIHwgVk1fTUFZV1JJVEUpKSA9PSBWTV9NQVlXUklURTsKKworCXN3aXRjaCAo
cGVfc2l6ZSkgeworCWNhc2UgUEVfU0laRV9QTUQ6CisJCWZhdWx0X3BhZ2Vfc2l6ZSA9IEhQQUdF
X1BNRF9TSVpFID4+IFBBR0VfU0hJRlQ7CisJCWJyZWFrOworI2lmZGVmIENPTkZJR19IQVZFX0FS
Q0hfVFJBTlNQQVJFTlRfSFVHRVBBR0VfUFVECisJY2FzZSBQRV9TSVpFX1BVRDoKKwkJZmF1bHRf
cGFnZV9zaXplID0gSFBBR0VfUFVEX1NJWkUgPj4gUEFHRV9TSElGVDsKKwkJYnJlYWs7CisjZW5k
aWYKKwlkZWZhdWx0OgorCQlXQVJOX09OX09OQ0UoMSk7CisJCXJldHVybiBWTV9GQVVMVF9GQUxM
QkFDSzsKKwl9CisKKwkvKiBBbHdheXMgZG8gd3JpdGUgZGlydHktdHJhY2tpbmcgYW5kIENPVyBv
biBQVEUgbGV2ZWwuICovCisJaWYgKHdyaXRlICYmIChSRUFEX09OQ0UodmJvLT5kaXJ0eSkgfHwg
aXNfY293X21hcHBpbmcpKQorCQlyZXR1cm4gVk1fRkFVTFRfRkFMTEJBQ0s7CisKKwlyZXQgPSB0
dG1fYm9fdm1fcmVzZXJ2ZShibywgdm1mKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJ
aWYgKHZiby0+ZGlydHkpIHsKKwkJcGdvZmZfdCBhbGxvd2VkX3ByZWZhdWx0OworCQl1bnNpZ25l
ZCBsb25nIHBhZ2Vfb2Zmc2V0OworCisJCXBhZ2Vfb2Zmc2V0ID0gdm1mLT5wZ29mZiAtCisJCQlk
cm1fdm1hX25vZGVfc3RhcnQoJmJvLT5iYXNlLnZtYV9ub2RlKTsKKwkJaWYgKHBhZ2Vfb2Zmc2V0
ID49IGJvLT5udW1fcGFnZXMgfHwKKwkJICAgIHZtd19yZXNvdXJjZXNfY2xlYW4odmJvLCBwYWdl
X29mZnNldCwKKwkJCQkJcGFnZV9vZmZzZXQgKyBQQUdFX1NJWkUsCisJCQkJCSZhbGxvd2VkX3By
ZWZhdWx0KSkgeworCQkJcmV0ID0gVk1fRkFVTFRfU0lHQlVTOworCQkJZ290byBvdXRfdW5sb2Nr
OworCQl9CisKKwkJLyoKKwkJICogV3JpdGUgcHJvdGVjdCwgc28gd2UgZ2V0IGEgbmV3IGZhdWx0
IG9uIHdyaXRlLCBhbmQgY2FuCisJCSAqIHNwbGl0LgorCQkgKi8KKwkJcHJvdCA9IHZtX2dldF9w
YWdlX3Byb3Qodm1hLT52bV9mbGFncyAmIH5WTV9TSEFSRUQpOworCX0gZWxzZSB7CisJCXByb3Qg
PSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpOworCX0KKworCXJldCA9IHR0bV9ib192
bV9mYXVsdF9yZXNlcnZlZCh2bWYsIHByb3QsIDEsIGZhdWx0X3BhZ2Vfc2l6ZSk7CisJaWYgKHJl
dCA9PSBWTV9GQVVMVF9SRVRSWSAmJiAhKHZtZi0+ZmxhZ3MgJiBGQVVMVF9GTEFHX1JFVFJZX05P
V0FJVCkpCisJCXJldHVybiByZXQ7CisKK291dF91bmxvY2s6CisJZG1hX3Jlc3ZfdW5sb2NrKGJv
LT5iYXNlLnJlc3YpOworCisJcmV0dXJuIHJldDsKK30KKyNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2dsdWUuYyBiL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X3R0bV9nbHVlLmMKaW5kZXggYWE3ZTUwZjYzYjk0Li4zYzAzYjE3NDY2NjEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9nbHVlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2dsdWUuYwpAQCAtMzQsNyArMzQs
MTAgQEAgaW50IHZtd19tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSkKIAkJLnBhZ2VfbWt3cml0ZSA9IHZtd19ib192bV9ta3dyaXRlLAogCQkuZmF1bHQg
PSB2bXdfYm9fdm1fZmF1bHQsCiAJCS5vcGVuID0gdHRtX2JvX3ZtX29wZW4sCi0JCS5jbG9zZSA9
IHR0bV9ib192bV9jbG9zZQorCQkuY2xvc2UgPSB0dG1fYm9fdm1fY2xvc2UsCisjaWZkZWYgQ09O
RklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFCisJCS5odWdlX2ZhdWx0ID0gdm13X2JvX3ZtX2h1Z2Vf
ZmF1bHQsCisjZW5kaWYKIAl9OwogCXN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2ID0gZmlscC0+
cHJpdmF0ZV9kYXRhOwogCXN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYgPSB2bXdfcHJpdihm
aWxlX3ByaXYtPm1pbm9yLT5kZXYpOwotLSAKMi4yMS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
