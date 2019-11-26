Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F9410A568
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 21:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5838981B;
	Tue, 26 Nov 2019 20:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435168981B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 20:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 06A683F4D5;
 Tue, 26 Nov 2019 21:27:44 +0100 (CET)
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
 with ESMTP id 8IU7PcDgXycM; Tue, 26 Nov 2019 21:27:42 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 0E6513F405;
 Tue, 26 Nov 2019 21:27:39 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 43D3436255A;
 Tue, 26 Nov 2019 21:27:39 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-graphics-maintainer@vmware.com
Subject: [PATCH 2/2] drm/ttm: Fix vm page protection handling
Date: Tue, 26 Nov 2019 21:27:17 +0100
Message-Id: <20191126202717.30762-2-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191126202717.30762-1-thomas_os@shipmail.org>
References: <20191126202717.30762-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1574800059; bh=Bx2EU0zusKy11L8wJb7DQjvk6SeHUT9blg8g1L1Gfmg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qpJ41IGYAJvRuO3fIaMTAVxhwZ5AmjCjiqwZkg+eKDzd1zuq18UP/keVGzN4JSZTq
 bzoz64P/C0ivs0Qmn/1JFl00sux0UXaXYfV8Lh40r3+uc2xoivXjxv6NV3j3R0LJMC
 Jq5i9S1W7WkosUMhoyAyWwyQ3nKHKdAAt6mx9wQw=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=qpJ41IGY; 
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

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKV2Ugd2VyZSB1
c2luZyBhbiB1Z2x5IGhhY2sgdG8gc2V0IHRoZSBwYWdlIHByb3RlY3Rpb24gY29ycmVjdGx5LgpG
aXggdGhhdCBhbmQgaW5zdGVhZCB1c2Ugdm1mX2luc2VydF9taXhlZF9wcm90KCkgYW5kIC8gb3IK
dm1mX2luc2VydF9wZm5fcHJvdCgpLgpBbHNvIGdldCB0aGUgZGVmYXVsdCBwYWdlIHByb3RlY3Rp
b24gZnJvbQpzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Q6OnZtX3BhZ2VfcHJvdCByYXRoZXIgdGhhbiB1
c2luZyB2bV9nZXRfcGFnZV9wcm90KCkuClRoaXMgd2F5IHdlIGNhdGNoIG1vZGlmaWNhdGlvbnMg
ZG9uZSBieSB0aGUgdm0gc3lzdGVtIGZvciBkcml2ZXJzIHRoYXQKd2FudCB3cml0ZS1ub3RpZmlj
YXRpb24uCgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6
IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpDYzogIk1hdHRoZXcgV2lsY294IChPcmFj
bGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6ICJLaXJpbGwgQS4gU2h1dGVtb3YiIDxraXJp
bGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29tPgpDYzogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVs
bEBudmlkaWEuY29tPgpDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4K
Q2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
b192bS5jCmluZGV4IGU2NDk1Y2EyNjMwYi4uMjA5OGY4ZDRkZmM1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvX3ZtLmMKQEAgLTE3Myw3ICsxNzMsNiBAQCB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9y
ZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKIAkJCQkgICAgcGdvZmZfdCBudW1fcHJlZmF1
bHQpCiB7CiAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEgPSB2bWYtPnZtYTsKLQlzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgY3ZtYSA9ICp2bWE7CiAJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
byA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOwogCXN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2ID0g
Ym8tPmJkZXY7CiAJdW5zaWduZWQgbG9uZyBwYWdlX29mZnNldDsKQEAgLTI0NCw3ICsyNDMsNyBA
QCB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZt
ZiwKIAkJZ290byBvdXRfaW9fdW5sb2NrOwogCX0KIAotCWN2bWEudm1fcGFnZV9wcm90ID0gdHRt
X2lvX3Byb3QoYm8tPm1lbS5wbGFjZW1lbnQsIHByb3QpOworCXByb3QgPSB0dG1faW9fcHJvdChi
by0+bWVtLnBsYWNlbWVudCwgcHJvdCk7CiAJaWYgKCFiby0+bWVtLmJ1cy5pc19pb21lbSkgewog
CQlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggY3R4ID0gewogCQkJLmludGVycnVwdGlibGUgPSBm
YWxzZSwKQEAgLTI2MCw3ICsyNTksNyBAQCB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9yZXNl
cnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKIAkJfQogCX0gZWxzZSB7CiAJCS8qIElvbWVtIHNo
b3VsZCBub3QgYmUgbWFya2VkIGVuY3J5cHRlZCAqLwotCQljdm1hLnZtX3BhZ2VfcHJvdCA9IHBn
cHJvdF9kZWNyeXB0ZWQoY3ZtYS52bV9wYWdlX3Byb3QpOworCQlwcm90ID0gcGdwcm90X2RlY3J5
cHRlZChwcm90KTsKIAl9CiAKIAkvKgpAQCAtMjg0LDEwICsyODMsMTEgQEAgdm1fZmF1bHRfdCB0
dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCiAJCX0KIAogCQlp
ZiAodm1hLT52bV9mbGFncyAmIFZNX01JWEVETUFQKQotCQkJcmV0ID0gdm1mX2luc2VydF9taXhl
ZCgmY3ZtYSwgYWRkcmVzcywKLQkJCQkJX19wZm5fdG9fcGZuX3QocGZuLCBQRk5fREVWKSk7CisJ
CQlyZXQgPSB2bWZfaW5zZXJ0X21peGVkX3Byb3Qodm1hLCBhZGRyZXNzLAorCQkJCQkJICAgIF9f
cGZuX3RvX3Bmbl90KHBmbiwgUEZOX0RFViksCisJCQkJCQkgICAgcHJvdCk7CiAJCWVsc2UKLQkJ
CXJldCA9IHZtZl9pbnNlcnRfcGZuKCZjdm1hLCBhZGRyZXNzLCBwZm4pOworCQkJcmV0ID0gdm1m
X2luc2VydF9wZm5fcHJvdCh2bWEsIGFkZHJlc3MsIHBmbiwgcHJvdCk7CiAKIAkJLyogTmV2ZXIg
ZXJyb3Igb24gcHJlZmF1bHRlZCBQVEVzICovCiAJCWlmICh1bmxpa2VseSgocmV0ICYgVk1fRkFV
TFRfRVJST1IpKSkgewpAQCAtMzE5LDcgKzMxOSw3IEBAIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2Zh
dWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlw
cm90ID0gdm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdzKTsKKwlwcm90ID0gdm1hLT52bV9w
YWdlX3Byb3Q7CiAJcmV0ID0gdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHZtZiwgcHJvdCwgVFRN
X0JPX1ZNX05VTV9QUkVGQVVMVCk7CiAJaWYgKHJldCA9PSBWTV9GQVVMVF9SRVRSWSAmJiAhKHZt
Zi0+ZmxhZ3MgJiBGQVVMVF9GTEFHX1JFVFJZX05PV0FJVCkpCiAJCXJldHVybiByZXQ7Ci0tIAoy
LjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
