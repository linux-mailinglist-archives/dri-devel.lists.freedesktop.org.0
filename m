Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE43A11C86E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0B86ECB8;
	Thu, 12 Dec 2019 08:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE53C6ECB8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 08:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id E48483F713;
 Thu, 12 Dec 2019 09:47:55 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=n/b6KwNU; 
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
 with ESMTP id iF4Jam6OeP9h; Thu, 12 Dec 2019 09:47:54 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 7AB5E3F63C;
 Thu, 12 Dec 2019 09:47:51 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A13D23621B6;
 Thu, 12 Dec 2019 09:47:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1576140471; bh=jyqb+AEeV9/9Moj7O3xJDnnz7Mo2A9TsCql6OrJmNDc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n/b6KwNUp4OqN916NV9ZD0laqfxmAFJ6KCr3bBrebdnzCNkrA2htlk7KYuo1KSknO
 ccDPhEDnYX5YNtwBAHC6k0ytCa+2I8PNDSYKGWlsuvno1pTdZGjuWXSrg6LiptpAWc
 G19GjykWiI3PiOdOL/ig1runt3MtbZRE8jG9gQIQ=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/2] mm, drm/ttm: Fix vm page protection handling
Date: Thu, 12 Dec 2019 09:47:41 +0100
Message-Id: <20191212084741.9251-3-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191212084741.9251-1-thomas_os@shipmail.org>
References: <20191212084741.9251-1-thomas_os@shipmail.org>
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

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVFRNIGdyYXBo
aWNzIGJ1ZmZlciBvYmplY3RzIG1heSwgdHJhbnNwYXJlbnRseSB0byB1c2VyLXNwYWNlLCAgbW92
ZQpiZXR3ZWVuIElPIGFuZCBzeXN0ZW0gbWVtb3J5LiBXaGVuIHRoYXQgaGFwcGVucywgYWxsIFBU
RXMgcG9pbnRpbmcgdG8gdGhlCm9sZCBsb2NhdGlvbiBhcmUgemFwcGVkIGJlZm9yZSB0aGUgbW92
ZSBhbmQgdGhlbiBmYXVsdGVkIGluIGFnYWluIGlmCm5lZWRlZC4gV2hlbiB0aGF0IGhhcHBlbnMs
IHRoZSBwYWdlIHByb3RlY3Rpb24gY2FjaGluZyBtb2RlLSBhbmQKZW5jcnlwdGlvbiBiaXRzIG1h
eSBjaGFuZ2UgYW5kIGJlIGRpZmZlcmVudCBmcm9tIHRob3NlIG9mCnN0cnVjdCB2bV9hcmVhX3N0
cnVjdDo6dm1fcGFnZV9wcm90LgoKV2Ugd2VyZSB1c2luZyBhbiB1Z2x5IGhhY2sgdG8gc2V0IHRo
ZSBwYWdlIHByb3RlY3Rpb24gY29ycmVjdGx5LgpGaXggdGhhdCBhbmQgaW5zdGVhZCBleHBvcnQg
YW5kIHVzZSB2bWZfaW5zZXJ0X21peGVkX3Byb3QoKSBvciB1c2UKdm1mX2luc2VydF9wZm5fcHJv
dCgpLgpBbHNvIGdldCB0aGUgZGVmYXVsdCBwYWdlIHByb3RlY3Rpb24gZnJvbQpzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3Q6OnZtX3BhZ2VfcHJvdCByYXRoZXIgdGhhbiB1c2luZyB2bV9nZXRfcGFnZV9w
cm90KCkuClRoaXMgd2F5IHdlIGNhdGNoIG1vZGlmaWNhdGlvbnMgZG9uZSBieSB0aGUgdm0gc3lz
dGVtIGZvciBkcml2ZXJzIHRoYXQKd2FudCB3cml0ZS1ub3RpZmljYXRpb24uCgpDYzogQW5kcmV3
IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhv
Y2tvQHN1c2UuY29tPgpDYzogIk1hdHRoZXcgV2lsY294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFk
ZWFkLm9yZz4KQ2M6ICJLaXJpbGwgQS4gU2h1dGVtb3YiIDxraXJpbGwuc2h1dGVtb3ZAbGludXgu
aW50ZWwuY29tPgpDYzogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpDYzog
IkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVs
bHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm9fdm0uYyB8IDIyICsrKysrKysrKysrKysrKy0tLS0tLS0KIG1tL21lbW9yeS5jICAgICAg
ICAgICAgICAgICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKaW5kZXggM2U4YzNkZTkxYWU0
Li43OGJmYWI4MWNmMDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3Zt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwpAQCAtMTczLDcgKzE3Myw2
IEBAIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9mYXVsdCAq
dm1mLAogCQkJCSAgICBwZ29mZl90IG51bV9wcmVmYXVsdCkKIHsKIAlzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSA9IHZtZi0+dm1hOwotCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCBjdm1hID0gKnZt
YTsKIAlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gdm1hLT52bV9wcml2YXRlX2RhdGE7
CiAJc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYgPSBiby0+YmRldjsKIAl1bnNpZ25lZCBsb25n
IHBhZ2Vfb2Zmc2V0OwpAQCAtMjQ0LDcgKzI0Myw3IEBAIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2Zh
dWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9mYXVsdCAqdm1mLAogCQlnb3RvIG91dF9pb191bmxvY2s7
CiAJfQogCi0JY3ZtYS52bV9wYWdlX3Byb3QgPSB0dG1faW9fcHJvdChiby0+bWVtLnBsYWNlbWVu
dCwgcHJvdCk7CisJcHJvdCA9IHR0bV9pb19wcm90KGJvLT5tZW0ucGxhY2VtZW50LCBwcm90KTsK
IAlpZiAoIWJvLT5tZW0uYnVzLmlzX2lvbWVtKSB7CiAJCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0
eCBjdHggPSB7CiAJCQkuaW50ZXJydXB0aWJsZSA9IGZhbHNlLApAQCAtMjYwLDcgKzI1OSw3IEBA
IHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9mYXVsdCAqdm1m
LAogCQl9CiAJfSBlbHNlIHsKIAkJLyogSW9tZW0gc2hvdWxkIG5vdCBiZSBtYXJrZWQgZW5jcnlw
dGVkICovCi0JCWN2bWEudm1fcGFnZV9wcm90ID0gcGdwcm90X2RlY3J5cHRlZChjdm1hLnZtX3Bh
Z2VfcHJvdCk7CisJCXByb3QgPSBwZ3Byb3RfZGVjcnlwdGVkKHByb3QpOwogCX0KIAogCS8qCkBA
IC0yODMsMTEgKzI4MiwyMCBAQCB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZChz
dHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKIAkJCXBmbiA9IHBhZ2VfdG9fcGZuKHBhZ2UpOwogCQl9CiAK
KwkJLyoKKwkJICogTm90ZSB0aGF0IHRoZSB2YWx1ZSBvZiBAcHJvdCBhdCB0aGlzIHBvaW50IG1h
eSBkaWZmZXIgZnJvbQorCQkgKiB0aGUgdmFsdWUgb2YgQHZtYS0+dm1fcGFnZV9wcm90IGluIHRo
ZSBjYWNoaW5nLSBhbmQKKwkJICogZW5jcnlwdGlvbiBiaXRzLiBUaGlzIGlzIGJlY2F1c2UgdGhl
IGV4YWN0IGxvY2F0aW9uIG9mIHRoZQorCQkgKiBkYXRhIG1heSBub3QgYmUga25vd24gYXQgbW1h
cCgpIHRpbWUgYW5kIG1heSBhbHNvIGNoYW5nZQorCQkgKiBhdCBhcmJpdHJhcnkgdGltZXMgd2hp
bGUgdGhlIGRhdGEgaXMgbW1hcCdlZC4KKwkJICogU2VlIHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCgp
IGZvciBhIGRpc2N1c3Npb24uCisJCSAqLwogCQlpZiAodm1hLT52bV9mbGFncyAmIFZNX01JWEVE
TUFQKQotCQkJcmV0ID0gdm1mX2luc2VydF9taXhlZCgmY3ZtYSwgYWRkcmVzcywKLQkJCQkJX19w
Zm5fdG9fcGZuX3QocGZuLCBQRk5fREVWKSk7CisJCQlyZXQgPSB2bWZfaW5zZXJ0X21peGVkX3By
b3Qodm1hLCBhZGRyZXNzLAorCQkJCQkJICAgIF9fcGZuX3RvX3Bmbl90KHBmbiwgUEZOX0RFViks
CisJCQkJCQkgICAgcHJvdCk7CiAJCWVsc2UKLQkJCXJldCA9IHZtZl9pbnNlcnRfcGZuKCZjdm1h
LCBhZGRyZXNzLCBwZm4pOworCQkJcmV0ID0gdm1mX2luc2VydF9wZm5fcHJvdCh2bWEsIGFkZHJl
c3MsIHBmbiwgcHJvdCk7CiAKIAkJLyogTmV2ZXIgZXJyb3Igb24gcHJlZmF1bHRlZCBQVEVzICov
CiAJCWlmICh1bmxpa2VseSgocmV0ICYgVk1fRkFVTFRfRVJST1IpKSkgewpAQCAtMzE5LDcgKzMy
Nyw3IEBAIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQog
CWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlwcm90ID0gdm1fZ2V0X3BhZ2VfcHJvdCh2bWEt
PnZtX2ZsYWdzKTsKKwlwcm90ID0gdm1hLT52bV9wYWdlX3Byb3Q7CiAJcmV0ID0gdHRtX2JvX3Zt
X2ZhdWx0X3Jlc2VydmVkKHZtZiwgcHJvdCwgVFRNX0JPX1ZNX05VTV9QUkVGQVVMVCk7CiAJaWYg
KHJldCA9PSBWTV9GQVVMVF9SRVRSWSAmJiAhKHZtZi0+ZmxhZ3MgJiBGQVVMVF9GTEFHX1JFVFJZ
X05PV0FJVCkpCiAJCXJldHVybiByZXQ7CmRpZmYgLS1naXQgYS9tbS9tZW1vcnkuYyBiL21tL21l
bW9yeS5jCmluZGV4IDI2OWE4YTg3MWU4My4uMGYyNjJhY2QxMDE4IDEwMDY0NAotLS0gYS9tbS9t
ZW1vcnkuYworKysgYi9tbS9tZW1vcnkuYwpAQCAtMTc5OCw2ICsxNzk4LDcgQEAgdm1fZmF1bHRf
dCB2bWZfaW5zZXJ0X21peGVkX3Byb3Qoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2ln
bmVkIGxvbmcgYWRkciwKIHsKIAlyZXR1cm4gX192bV9pbnNlcnRfbWl4ZWQodm1hLCBhZGRyLCBw
Zm4sIHBncHJvdCwgZmFsc2UpOwogfQorRVhQT1JUX1NZTUJPTCh2bWZfaW5zZXJ0X21peGVkX3By
b3QpOwogCiB2bV9mYXVsdF90IHZtZl9pbnNlcnRfbWl4ZWQoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAkJcGZuX3QgcGZuKQotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
