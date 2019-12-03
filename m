Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C0110FC06
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 11:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95B46E05C;
	Tue,  3 Dec 2019 10:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1376E05C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id BE682413DF;
 Tue,  3 Dec 2019 11:49:10 +0100 (CET)
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
 with ESMTP id O1Phm5sjhJf1; Tue,  3 Dec 2019 11:49:08 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 0BB2B413CC;
 Tue,  3 Dec 2019 11:49:05 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 6C4F136159C;
 Tue,  3 Dec 2019 11:49:05 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/ttm: Fix vm page protection handling
Date: Tue,  3 Dec 2019 11:48:53 +0100
Message-Id: <20191203104853.4378-3-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191203104853.4378-1-thomas_os@shipmail.org>
References: <20191203104853.4378-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575370145; bh=uTN4ic4eeS1L6Fw/mV08DD+v/r8WpmY+v3FL99RylaM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q+D96kC0olg7qmojQqZo2RGwOSWcx8AsT4UxE81PKkdLpaLjaBHAcJp4Mx5jV9NF4
 /KFH3xD+dczwrU6flDs7w/BSB7o7ktd64OEbSc+JqQbdLjlHurYE7387HrPED+aT48
 7uGPLTapP4EAWR2jSMqoWo4EjWYhW/Hn18aPu6lU=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=q+D96kC0; 
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

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVFRNIGdyYXBo
aWNzIGJ1ZmZlciBvYmplY3RzIG1heSwgdHJhbnNwYXJlbnRseSB0byB1c2VyLXNwYWNlLCAgbW92
ZQpiZXR3ZWVuIElPIGFuZCBzeXN0ZW0gbWVtb3J5LiBXaGVuIHRoYXQgaGFwcGVucywgYWxsIFBU
RXMgcG9pbnRpbmcgdG8gdGhlCm9sZCBsb2NhdGlvbiBhcmUgemFwcGVkIGJlZm9yZSB0aGUgbW92
ZSBhbmQgdGhlbiBmYXVsdGVkIGluIGFnYWluIGlmCm5lZWRlZC4gV2hlbiB0aGF0IGhhcHBlbnMs
IHRoZSBwYWdlIHByb3RlY3Rpb24gY2FjaGluZyBtb2RlLSBhbmQKZW5jcnlwdGlvbiBiaXRzIG1h
eSBjaGFuZ2UgYW5kIGJlIGRpZmZlcmVudCBmcm9tIHRob3NlIG9mCnN0cnVjdCB2bV9hcmVhX3N0
cnVjdDo6dm1fcGFnZV9wcm90LgoKV2Ugd2VyZSB1c2luZyBhbiB1Z2x5IGhhY2sgdG8gc2V0IHRo
ZSBwYWdlIHByb3RlY3Rpb24gY29ycmVjdGx5LgpGaXggdGhhdCBhbmQgaW5zdGVhZCB1c2Ugdm1m
X2luc2VydF9taXhlZF9wcm90KCkgYW5kIC8gb3IKdm1mX2luc2VydF9wZm5fcHJvdCgpLgpBbHNv
IGdldCB0aGUgZGVmYXVsdCBwYWdlIHByb3RlY3Rpb24gZnJvbQpzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3Q6OnZtX3BhZ2VfcHJvdCByYXRoZXIgdGhhbiB1c2luZyB2bV9nZXRfcGFnZV9wcm90KCkuClRo
aXMgd2F5IHdlIGNhdGNoIG1vZGlmaWNhdGlvbnMgZG9uZSBieSB0aGUgdm0gc3lzdGVtIGZvciBk
cml2ZXJzIHRoYXQKd2FudCB3cml0ZS1ub3RpZmljYXRpb24uCgpDYzogQW5kcmV3IE1vcnRvbiA8
YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2Uu
Y29tPgpDYzogIk1hdHRoZXcgV2lsY294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4K
Q2M6ICJLaXJpbGwgQS4gU2h1dGVtb3YiIDxraXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29t
PgpDYzogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpDYzogIkrDqXLDtG1l
IEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0
aGVsbHN0cm9tQHZtd2FyZS5jb20+ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0u
YyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3Zt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCmluZGV4IGU2NDk1Y2EyNjMwYi4u
MjA5OGY4ZDRkZmM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKQEAgLTE3Myw3ICsxNzMsNiBA
QCB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZt
ZiwKIAkJCQkgICAgcGdvZmZfdCBudW1fcHJlZmF1bHQpCiB7CiAJc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEgPSB2bWYtPnZtYTsKLQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgY3ZtYSA9ICp2bWE7
CiAJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOwog
CXN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2ID0gYm8tPmJkZXY7CiAJdW5zaWduZWQgbG9uZyBw
YWdlX29mZnNldDsKQEAgLTI0NCw3ICsyNDMsNyBAQCB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVs
dF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKIAkJZ290byBvdXRfaW9fdW5sb2NrOwog
CX0KIAotCWN2bWEudm1fcGFnZV9wcm90ID0gdHRtX2lvX3Byb3QoYm8tPm1lbS5wbGFjZW1lbnQs
IHByb3QpOworCXByb3QgPSB0dG1faW9fcHJvdChiby0+bWVtLnBsYWNlbWVudCwgcHJvdCk7CiAJ
aWYgKCFiby0+bWVtLmJ1cy5pc19pb21lbSkgewogCQlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHgg
Y3R4ID0gewogCQkJLmludGVycnVwdGlibGUgPSBmYWxzZSwKQEAgLTI2MCw3ICsyNTksNyBAQCB2
bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwK
IAkJfQogCX0gZWxzZSB7CiAJCS8qIElvbWVtIHNob3VsZCBub3QgYmUgbWFya2VkIGVuY3J5cHRl
ZCAqLwotCQljdm1hLnZtX3BhZ2VfcHJvdCA9IHBncHJvdF9kZWNyeXB0ZWQoY3ZtYS52bV9wYWdl
X3Byb3QpOworCQlwcm90ID0gcGdwcm90X2RlY3J5cHRlZChwcm90KTsKIAl9CiAKIAkvKgpAQCAt
Mjg0LDEwICsyODMsMTEgQEAgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3Ry
dWN0IHZtX2ZhdWx0ICp2bWYsCiAJCX0KIAogCQlpZiAodm1hLT52bV9mbGFncyAmIFZNX01JWEVE
TUFQKQotCQkJcmV0ID0gdm1mX2luc2VydF9taXhlZCgmY3ZtYSwgYWRkcmVzcywKLQkJCQkJX19w
Zm5fdG9fcGZuX3QocGZuLCBQRk5fREVWKSk7CisJCQlyZXQgPSB2bWZfaW5zZXJ0X21peGVkX3By
b3Qodm1hLCBhZGRyZXNzLAorCQkJCQkJICAgIF9fcGZuX3RvX3Bmbl90KHBmbiwgUEZOX0RFViks
CisJCQkJCQkgICAgcHJvdCk7CiAJCWVsc2UKLQkJCXJldCA9IHZtZl9pbnNlcnRfcGZuKCZjdm1h
LCBhZGRyZXNzLCBwZm4pOworCQkJcmV0ID0gdm1mX2luc2VydF9wZm5fcHJvdCh2bWEsIGFkZHJl
c3MsIHBmbiwgcHJvdCk7CiAKIAkJLyogTmV2ZXIgZXJyb3Igb24gcHJlZmF1bHRlZCBQVEVzICov
CiAJCWlmICh1bmxpa2VseSgocmV0ICYgVk1fRkFVTFRfRVJST1IpKSkgewpAQCAtMzE5LDcgKzMx
OSw3IEBAIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQog
CWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlwcm90ID0gdm1fZ2V0X3BhZ2VfcHJvdCh2bWEt
PnZtX2ZsYWdzKTsKKwlwcm90ID0gdm1hLT52bV9wYWdlX3Byb3Q7CiAJcmV0ID0gdHRtX2JvX3Zt
X2ZhdWx0X3Jlc2VydmVkKHZtZiwgcHJvdCwgVFRNX0JPX1ZNX05VTV9QUkVGQVVMVCk7CiAJaWYg
KHJldCA9PSBWTV9GQVVMVF9SRVRSWSAmJiAhKHZtZi0+ZmxhZ3MgJiBGQVVMVF9GTEFHX1JFVFJZ
X05PV0FJVCkpCiAJCXJldHVybiByZXQ7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
