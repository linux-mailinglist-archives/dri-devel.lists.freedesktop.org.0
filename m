Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD438191AA1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 21:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E816E528;
	Tue, 24 Mar 2020 20:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD4B6E0AD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 20:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id E9BBF3FC04;
 Tue, 24 Mar 2020 21:11:51 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=fmxUs5f0; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6PXfQimYTyb; Tue, 24 Mar 2020 21:11:51 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 0CF163F5ED;
 Tue, 24 Mar 2020 21:11:51 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B1E1D360153;
 Tue, 24 Mar 2020 21:11:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1585080710; bh=m7CS9R7eZggq2b1BwFhxJZjXLvSJNnagJ5JrMFFlA0g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fmxUs5f099V6Xqq4WbjaQaRzCbLUpv7qs4yQbyL2OAxxr19fRN7yP/YGa0TAJhm/D
 wNjtXciBLFGUf27Iv4fe8eCpCZb9HfqFECpvGfWvFloZ4nM+B1R2x7Et0BZO91o64U
 jKVyiHKVB61ogYP4+qa7dJWMMQrP4v4ZbhbofRiw=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/9] drm/vmwgfx: Support huge page faults
Date: Tue, 24 Mar 2020 21:11:20 +0100
Message-Id: <20200324201123.3118-7-thomas_os@shipmail.org>
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
PgoKV2l0aCB2bXdnZnggZGlydHktdHJhY2tpbmcgd2UgbmVlZCBhIHNwZWNpYWxpemVkIGh1Z2Vf
ZmF1bHQKY2FsbGJhY2suIEltcGxlbWVudCBhbmQgaG9vayBpdCB1cC4KCkNjOiBBbmRyZXcgTW9y
dG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29A
c3VzZS5jb20+CkNjOiAiTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQu
b3JnPgpDYzogIktpcmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRl
bC5jb20+CkNjOiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+CkNjOiAiSsOp
csO0bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWci
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxp
YW1zQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSAoVk13YXJlKSA8
dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4KUmV2aWV3ZWQtYnk6IFJvbGFuZCBTY2hlaWRlZ2dlciA8
c3JvbGFuZEB2bXdhcmUuY29tPgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5o
ICAgICAgICB8ICA0ICsrCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9wYWdlX2RpcnR5
LmMgfCA3NCArKysrKysrKysrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF90dG1fZ2x1ZS5jICAgfCAgNSArLQogMyBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKaW5kZXgg
YjcwZDczMjI1NzA3Li42ZmM4ZDVjMTcxYzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Ry
di5oCkBAIC0xNDAyLDYgKzE0MDIsMTAgQEAgdm9pZCB2bXdfYm9fZGlydHlfdW5tYXAoc3RydWN0
IHZtd19idWZmZXJfb2JqZWN0ICp2Ym8sCiAJCQlwZ29mZl90IHN0YXJ0LCBwZ29mZl90IGVuZCk7
CiB2bV9mYXVsdF90IHZtd19ib192bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZik7CiB2bV9m
YXVsdF90IHZtd19ib192bV9ta3dyaXRlKHN0cnVjdCB2bV9mYXVsdCAqdm1mKTsKKyNpZmRlZiBD
T05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKK3ZtX2ZhdWx0X3Qgdm13X2JvX3ZtX2h1Z2VfZmF1
bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCisJCQkJZW51bSBwYWdlX2VudHJ5X3NpemUgcGVfc2l6
ZSk7CisjZW5kaWYKIAogLyoqCiAgKiBWTVdfREVCVUdfS01TIC0gRGVidWcgb3V0cHV0IGZvciBr
ZXJuZWwgbW9kZS1zZXR0aW5nCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9wYWdlX2RpcnR5LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9wYWdlX2Rp
cnR5LmMKaW5kZXggOGNmN2E3N2M5YjJmLi5kNGQ2NjUzMmY5YzkgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3BhZ2VfZGlydHkuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9wYWdlX2RpcnR5LmMKQEAgLTQ3Myw3ICs0NzMsNyBAQCB2bV9mYXVs
dF90IHZtd19ib192bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIAkgKiBhIGxvdCBvZiB1
bm5lY2Vzc2FyeSB3cml0ZSBmYXVsdHMuCiAJICovCiAJaWYgKHZiby0+ZGlydHkgJiYgdmJvLT5k
aXJ0eS0+bWV0aG9kID09IFZNV19CT19ESVJUWV9NS1dSSVRFKQotCQlwcm90ID0gdm1hLT52bV9w
YWdlX3Byb3Q7CisJCXByb3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MgJiB+Vk1f
U0hBUkVEKTsKIAllbHNlCiAJCXByb3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3Mp
OwogCkBAIC00ODYsMyArNDg2LDc1IEBAIHZtX2ZhdWx0X3Qgdm13X2JvX3ZtX2ZhdWx0KHN0cnVj
dCB2bV9mYXVsdCAqdm1mKQogCiAJcmV0dXJuIHJldDsKIH0KKworI2lmZGVmIENPTkZJR19UUkFO
U1BBUkVOVF9IVUdFUEFHRQordm1fZmF1bHRfdCB2bXdfYm9fdm1faHVnZV9mYXVsdChzdHJ1Y3Qg
dm1fZmF1bHQgKnZtZiwKKwkJCQllbnVtIHBhZ2VfZW50cnlfc2l6ZSBwZV9zaXplKQoreworCXN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gdm1mLT52bWE7CisJc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICpibyA9IChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKikKKwkgICAgdm1hLT52bV9w
cml2YXRlX2RhdGE7CisJc3RydWN0IHZtd19idWZmZXJfb2JqZWN0ICp2Ym8gPQorCQljb250YWlu
ZXJfb2YoYm8sIHN0cnVjdCB2bXdfYnVmZmVyX29iamVjdCwgYmFzZSk7CisJcGdwcm90X3QgcHJv
dDsKKwl2bV9mYXVsdF90IHJldDsKKwlwZ29mZl90IGZhdWx0X3BhZ2Vfc2l6ZTsKKwlib29sIHdy
aXRlID0gdm1mLT5mbGFncyAmIEZBVUxUX0ZMQUdfV1JJVEU7CisJYm9vbCBpc19jb3dfbWFwcGlu
ZyA9CisJCSh2bWEtPnZtX2ZsYWdzICYgKFZNX1NIQVJFRCB8IFZNX01BWVdSSVRFKSkgPT0gVk1f
TUFZV1JJVEU7CisKKwlzd2l0Y2ggKHBlX3NpemUpIHsKKwljYXNlIFBFX1NJWkVfUE1EOgorCQlm
YXVsdF9wYWdlX3NpemUgPSBIUEFHRV9QTURfU0laRSA+PiBQQUdFX1NISUZUOworCQlicmVhazsK
KyNpZmRlZiBDT05GSUdfSEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFX1BVRAorCWNhc2Ug
UEVfU0laRV9QVUQ6CisJCWZhdWx0X3BhZ2Vfc2l6ZSA9IEhQQUdFX1BVRF9TSVpFID4+IFBBR0Vf
U0hJRlQ7CisJCWJyZWFrOworI2VuZGlmCisJZGVmYXVsdDoKKwkJV0FSTl9PTl9PTkNFKDEpOwor
CQlyZXR1cm4gVk1fRkFVTFRfRkFMTEJBQ0s7CisJfQorCisJLyogQWx3YXlzIGRvIHdyaXRlIGRp
cnR5LXRyYWNraW5nIGFuZCBDT1cgb24gUFRFIGxldmVsLiAqLworCWlmICh3cml0ZSAmJiAoUkVB
RF9PTkNFKHZiby0+ZGlydHkpIHx8IGlzX2Nvd19tYXBwaW5nKSkKKwkJcmV0dXJuIFZNX0ZBVUxU
X0ZBTExCQUNLOworCisJcmV0ID0gdHRtX2JvX3ZtX3Jlc2VydmUoYm8sIHZtZik7CisJaWYgKHJl
dCkKKwkJcmV0dXJuIHJldDsKKworCWlmICh2Ym8tPmRpcnR5KSB7CisJCXBnb2ZmX3QgYWxsb3dl
ZF9wcmVmYXVsdDsKKwkJdW5zaWduZWQgbG9uZyBwYWdlX29mZnNldDsKKworCQlwYWdlX29mZnNl
dCA9IHZtZi0+cGdvZmYgLQorCQkJZHJtX3ZtYV9ub2RlX3N0YXJ0KCZiby0+YmFzZS52bWFfbm9k
ZSk7CisJCWlmIChwYWdlX29mZnNldCA+PSBiby0+bnVtX3BhZ2VzIHx8CisJCSAgICB2bXdfcmVz
b3VyY2VzX2NsZWFuKHZibywgcGFnZV9vZmZzZXQsCisJCQkJCXBhZ2Vfb2Zmc2V0ICsgUEFHRV9T
SVpFLAorCQkJCQkmYWxsb3dlZF9wcmVmYXVsdCkpIHsKKwkJCXJldCA9IFZNX0ZBVUxUX1NJR0JV
UzsKKwkJCWdvdG8gb3V0X3VubG9jazsKKwkJfQorCisJCS8qCisJCSAqIFdyaXRlIHByb3RlY3Qs
IHNvIHdlIGdldCBhIG5ldyBmYXVsdCBvbiB3cml0ZSwgYW5kIGNhbgorCQkgKiBzcGxpdC4KKwkJ
ICovCisJCXByb3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MgJiB+Vk1fU0hBUkVE
KTsKKwl9IGVsc2UgeworCQlwcm90ID0gdm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdzKTsK
Kwl9CisKKwlyZXQgPSB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQodm1mLCBwcm90LCAxLCBmYXVs
dF9wYWdlX3NpemUpOworCWlmIChyZXQgPT0gVk1fRkFVTFRfUkVUUlkgJiYgISh2bWYtPmZsYWdz
ICYgRkFVTFRfRkxBR19SRVRSWV9OT1dBSVQpKQorCQlyZXR1cm4gcmV0OworCitvdXRfdW5sb2Nr
OgorCWRtYV9yZXN2X3VubG9jayhiby0+YmFzZS5yZXN2KTsKKworCXJldHVybiByZXQ7Cit9Cisj
ZW5kaWYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9nbHVl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fZ2x1ZS5jCmluZGV4IGFhN2U1
MGY2M2I5NC4uM2MwM2IxNzQ2NjYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF90dG1fZ2x1ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0
bV9nbHVlLmMKQEAgLTM0LDcgKzM0LDEwIEBAIGludCB2bXdfbW1hcChzdHJ1Y3QgZmlsZSAqZmls
cCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiAJCS5wYWdlX21rd3JpdGUgPSB2bXdfYm9f
dm1fbWt3cml0ZSwKIAkJLmZhdWx0ID0gdm13X2JvX3ZtX2ZhdWx0LAogCQkub3BlbiA9IHR0bV9i
b192bV9vcGVuLAotCQkuY2xvc2UgPSB0dG1fYm9fdm1fY2xvc2UKKwkJLmNsb3NlID0gdHRtX2Jv
X3ZtX2Nsb3NlLAorI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQorCQkuaHVnZV9m
YXVsdCA9IHZtd19ib192bV9odWdlX2ZhdWx0LAorI2VuZGlmCiAJfTsKIAlzdHJ1Y3QgZHJtX2Zp
bGUgKmZpbGVfcHJpdiA9IGZpbHAtPnByaXZhdGVfZGF0YTsKIAlzdHJ1Y3Qgdm13X3ByaXZhdGUg
KmRldl9wcml2ID0gdm13X3ByaXYoZmlsZV9wcml2LT5taW5vci0+ZGV2KTsKLS0gCjIuMjEuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
