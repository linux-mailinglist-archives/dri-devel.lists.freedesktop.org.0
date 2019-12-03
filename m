Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4A310FE9C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AB86E51B;
	Tue,  3 Dec 2019 13:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0E46E519
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id CF11F3F67A;
 Tue,  3 Dec 2019 14:22:58 +0100 (CET)
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
 with ESMTP id fTgvZ59bShiW; Tue,  3 Dec 2019 14:22:52 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 12D063F65E;
 Tue,  3 Dec 2019 14:22:52 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B722C362532;
 Tue,  3 Dec 2019 14:22:49 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/vmwgfx: Support huge page faults
Date: Tue,  3 Dec 2019 14:22:36 +0100
Message-Id: <20191203132239.5910-6-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191203132239.5910-1-thomas_os@shipmail.org>
References: <20191203132239.5910-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575379369; bh=a8XevGou6NRGoHcArPvCBWEfkQY2lbEu75A0FKNzs1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qjbONmoK7SErMiU3088Lj+fguno3k9SMcK1/DNzHgsA/n24OKpSl23zUYXCq33zQA
 7+ym5Y/Y81/YCDsJix4tQZPBymeZXwdBKnAJBH6y8CTzsyRwDGfomO0tjRGrL7+KBF
 V/uWBm9FQ2HYqlnKpU1/YiyB1WKxyBsn1f2E9P50=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=qjbONmoK; 
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

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKV2l0aCB2bXdn
ZnggZGlydHktdHJhY2tpbmcgd2UgbmVlZCBhIHNwZWNpYWxpemVkIGh1Z2VfZmF1bHQKY2FsbGJh
Y2suIEltcGxlbWVudCBhbmQgaG9vayBpdCB1cC4KCkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxp
bnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CkNj
OiAiTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQub3JnPgpDYzogIktp
cmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5jb20+CkNjOiBS
YWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+CkNjOiAiSsOpcsO0bWUgR2xpc3Nl
IiA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ry
b21Adm13YXJlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaCAg
ICAgICAgfCAgMiArCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9wYWdlX2RpcnR5LmMg
fCA2NiArKysrKysrKysrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF90dG1fZ2x1ZS5jICAgfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oCmluZGV4IGEzMWU3
MjZkNmQ3MS4uODY1NmE5NzQ0OGMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaApA
QCAtMTQyOCw2ICsxNDI4LDggQEAgdm9pZCB2bXdfYm9fZGlydHlfdW5tYXAoc3RydWN0IHZtd19i
dWZmZXJfb2JqZWN0ICp2Ym8sCiAJCQlwZ29mZl90IHN0YXJ0LCBwZ29mZl90IGVuZCk7CiB2bV9m
YXVsdF90IHZtd19ib192bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZik7CiB2bV9mYXVsdF90
IHZtd19ib192bV9ta3dyaXRlKHN0cnVjdCB2bV9mYXVsdCAqdm1mKTsKK3ZtX2ZhdWx0X3Qgdm13
X2JvX3ZtX2h1Z2VfZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCisJCQkJZW51bSBwYWdlX2Vu
dHJ5X3NpemUgcGVfc2l6ZSk7CiAKIC8qKgogICogVk1XX0RFQlVHX0tNUyAtIERlYnVnIG91dHB1
dCBmb3Iga2VybmVsIG1vZGUtc2V0dGluZwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfcGFnZV9kaXJ0eS5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
cGFnZV9kaXJ0eS5jCmluZGV4IDE3YTVkY2E3YjkyMS4uNmY3NmE5N2FkOTY5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9wYWdlX2RpcnR5LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfcGFnZV9kaXJ0eS5jCkBAIC00NzMsNyArNDczLDcgQEAg
dm1fZmF1bHRfdCB2bXdfYm9fdm1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiAJICogYSBs
b3Qgb2YgdW5uZWNlc3Nhcnkgd3JpdGUgZmF1bHRzLgogCSAqLwogCWlmICh2Ym8tPmRpcnR5ICYm
IHZiby0+ZGlydHktPm1ldGhvZCA9PSBWTVdfQk9fRElSVFlfTUtXUklURSkKLQkJcHJvdCA9IHZt
YS0+dm1fcGFnZV9wcm90OworCQlwcm90ID0gdm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdz
ICYgflZNX1NIQVJFRCk7CiAJZWxzZQogCQlwcm90ID0gdm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZt
X2ZsYWdzKTsKIApAQCAtNDg2LDMgKzQ4Niw2NyBAQCB2bV9mYXVsdF90IHZtd19ib192bV9mYXVs
dChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIAogCXJldHVybiByZXQ7CiB9CisKK3ZtX2ZhdWx0X3Qg
dm13X2JvX3ZtX2h1Z2VfZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCisJCQkJZW51bSBwYWdl
X2VudHJ5X3NpemUgcGVfc2l6ZSkKK3sKKwlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9IHZt
Zi0+dm1hOworCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSAoc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICopCisJICAgIHZtYS0+dm1fcHJpdmF0ZV9kYXRhOworCXN0cnVjdCB2bXdfYnVm
ZmVyX29iamVjdCAqdmJvID0KKwkJY29udGFpbmVyX29mKGJvLCBzdHJ1Y3Qgdm13X2J1ZmZlcl9v
YmplY3QsIGJhc2UpOworCXBncHJvdF90IHByb3Q7CisJdm1fZmF1bHRfdCByZXQ7CisJcGdvZmZf
dCBmYXVsdF9wYWdlX3NpemU7CisKKwlzd2l0Y2ggKHBlX3NpemUpIHsKKwljYXNlIFBFX1NJWkVf
UE1EOgorCQlmYXVsdF9wYWdlX3NpemUgPSBIUEFHRV9QTURfU0laRSA+PiBQQUdFX1NISUZUOwor
CQlicmVhazsKKwljYXNlIFBFX1NJWkVfUFVEOgorCQlmYXVsdF9wYWdlX3NpemUgPSBIUEFHRV9Q
VURfU0laRSA+PiBQQUdFX1NISUZUOworCQlicmVhazsKKwlkZWZhdWx0OgorCQlXQVJOX09OX09O
Q0UoMSk7CisJCXJldHVybiBWTV9GQVVMVF9GQUxMQkFDSzsKKwl9CisKKwkvKiBBbHdheXMgZG8g
d3JpdGUgZGlydHktdHJhY2tpbmcgb24gUFRFIGxldmVsLiAqLworCWlmIChSRUFEX09OQ0UodmJv
LT5kaXJ0eSkgJiYgKHZtZi0+ZmxhZ3MgJiBGQVVMVF9GTEFHX1dSSVRFKSkKKwkJcmV0dXJuIFZN
X0ZBVUxUX0ZBTExCQUNLOworCisJcmV0ID0gdHRtX2JvX3ZtX3Jlc2VydmUoYm8sIHZtZik7CisJ
aWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKworCWlmICh2Ym8tPmRpcnR5KSB7CisJCXBnb2ZmX3Qg
YWxsb3dlZF9wcmVmYXVsdDsKKwkJdW5zaWduZWQgbG9uZyBwYWdlX29mZnNldDsKKworCQlwYWdl
X29mZnNldCA9IHZtZi0+cGdvZmYgLQorCQkJZHJtX3ZtYV9ub2RlX3N0YXJ0KCZiby0+YmFzZS52
bWFfbm9kZSk7CisJCWlmIChwYWdlX29mZnNldCA+PSBiby0+bnVtX3BhZ2VzIHx8CisJCSAgICB2
bXdfcmVzb3VyY2VzX2NsZWFuKHZibywgcGFnZV9vZmZzZXQsCisJCQkJCXBhZ2Vfb2Zmc2V0ICsg
UEFHRV9TSVpFLAorCQkJCQkmYWxsb3dlZF9wcmVmYXVsdCkpIHsKKwkJCXJldCA9IFZNX0ZBVUxU
X1NJR0JVUzsKKwkJCWdvdG8gb3V0X3VubG9jazsKKwkJfQorCisJCS8qCisJCSAqIFdyaXRlIHBy
b3RlY3QsIHNvIHdlIGdldCBhIG5ldyBmYXVsdCBvbiB3cml0ZSwgYW5kIGNhbgorCQkgKiBzcGxp
dC4KKwkJICovCisJCXByb3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MgJiB+Vk1f
U0hBUkVEKTsKKwl9IGVsc2UgeworCQlwcm90ID0gdm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2Zs
YWdzKTsKKwl9CisJcmV0ID0gdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHZtZiwgcHJvdCwgMSwg
ZmF1bHRfcGFnZV9zaXplKTsKKwlpZiAocmV0ID09IFZNX0ZBVUxUX1JFVFJZICYmICEodm1mLT5m
bGFncyAmIEZBVUxUX0ZMQUdfUkVUUllfTk9XQUlUKSkKKwkJcmV0dXJuIHJldDsKKworb3V0X3Vu
bG9jazoKKwlkbWFfcmVzdl91bmxvY2soYm8tPmJhc2UucmVzdik7CisKKwlyZXR1cm4gcmV0Owor
fQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2dsdWUuYyBi
L2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9nbHVlLmMKaW5kZXggY2UyODg3NTY1
MzFiLi5kZTgzOGJhODhhOTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3R0bV9nbHVlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2ds
dWUuYwpAQCAtMzMsNiArMzMsNyBAQCBpbnQgdm13X21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCQkucGZuX21rd3JpdGUgPSB2bXdfYm9fdm1fbWt3
cml0ZSwKIAkJLnBhZ2VfbWt3cml0ZSA9IHZtd19ib192bV9ta3dyaXRlLAogCQkuZmF1bHQgPSB2
bXdfYm9fdm1fZmF1bHQsCisJCS5odWdlX2ZhdWx0ID0gdm13X2JvX3ZtX2h1Z2VfZmF1bHQsCiAJ
CS5vcGVuID0gdHRtX2JvX3ZtX29wZW4sCiAJCS5jbG9zZSA9IHR0bV9ib192bV9jbG9zZQogCX07
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
