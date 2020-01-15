Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCF413C134
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 13:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584956E9A2;
	Wed, 15 Jan 2020 12:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A736E9A5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 4337A3F5B9;
 Wed, 15 Jan 2020 13:41:22 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="sP1irSv1";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTovGtqjR91B; Wed, 15 Jan 2020 13:41:19 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id F040C3F573;
 Wed, 15 Jan 2020 13:41:17 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 6A9DD36034F;
 Wed, 15 Jan 2020 13:41:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579092077; bh=NQPc7hArRXnkkg/rpqui/KurRt8CpyiG/SnSNxQvx/0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sP1irSv1VCas9e21Phz219by0e/e18VwMPlDPMeeBrj56LAyMFYA+tIM4sxbvR1Z0
 E1myErsKLxDJmompwMASYFwTFfZzQuSwv1H+a+Te3SWoirTN7dv1//or0n3a1Wrdaf
 QaaSXqpKWDWJoLKSy3N4BnLojL2j6v4OZyI5BoFs=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/2] mm, drm/ttm: Fix vm page protection handling
Date: Wed, 15 Jan 2020 13:41:07 +0100
Message-Id: <20200115124107.3845-3-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200115124107.3845-1-thomas_os@shipmail.org>
References: <20200115124107.3845-1-thomas_os@shipmail.org>
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
 Ralph Campbell <rcampbell@nvidia.com>,
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
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkFja2VkLWJ5OiBBbmRyZXcgTW9ydG9uIDxh
a3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3ZtLmMgfCAyMiArKysrKysrKysrKysrKystLS0tLS0tCiBtbS9tZW1vcnkuYyAgICAgICAgICAg
ICAgICAgICAgIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCmluZGV4IDNlOGMzZGU5MWFlNC4uNzhi
ZmFiODFjZjA0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKQEAgLTE3Myw3ICsxNzMsNiBAQCB2
bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwK
IAkJCQkgICAgcGdvZmZfdCBudW1fcHJlZmF1bHQpCiB7CiAJc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEgPSB2bWYtPnZtYTsKLQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgY3ZtYSA9ICp2bWE7CiAJ
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOwogCXN0
cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2ID0gYm8tPmJkZXY7CiAJdW5zaWduZWQgbG9uZyBwYWdl
X29mZnNldDsKQEAgLTI0NCw3ICsyNDMsNyBAQCB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9y
ZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKIAkJZ290byBvdXRfaW9fdW5sb2NrOwogCX0K
IAotCWN2bWEudm1fcGFnZV9wcm90ID0gdHRtX2lvX3Byb3QoYm8tPm1lbS5wbGFjZW1lbnQsIHBy
b3QpOworCXByb3QgPSB0dG1faW9fcHJvdChiby0+bWVtLnBsYWNlbWVudCwgcHJvdCk7CiAJaWYg
KCFiby0+bWVtLmJ1cy5pc19pb21lbSkgewogCQlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggY3R4
ID0gewogCQkJLmludGVycnVwdGlibGUgPSBmYWxzZSwKQEAgLTI2MCw3ICsyNTksNyBAQCB2bV9m
YXVsdF90IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKIAkJ
fQogCX0gZWxzZSB7CiAJCS8qIElvbWVtIHNob3VsZCBub3QgYmUgbWFya2VkIGVuY3J5cHRlZCAq
LwotCQljdm1hLnZtX3BhZ2VfcHJvdCA9IHBncHJvdF9kZWNyeXB0ZWQoY3ZtYS52bV9wYWdlX3By
b3QpOworCQlwcm90ID0gcGdwcm90X2RlY3J5cHRlZChwcm90KTsKIAl9CiAKIAkvKgpAQCAtMjgz
LDExICsyODIsMjAgQEAgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0
IHZtX2ZhdWx0ICp2bWYsCiAJCQlwZm4gPSBwYWdlX3RvX3BmbihwYWdlKTsKIAkJfQogCisJCS8q
CisJCSAqIE5vdGUgdGhhdCB0aGUgdmFsdWUgb2YgQHByb3QgYXQgdGhpcyBwb2ludCBtYXkgZGlm
ZmVyIGZyb20KKwkJICogdGhlIHZhbHVlIG9mIEB2bWEtPnZtX3BhZ2VfcHJvdCBpbiB0aGUgY2Fj
aGluZy0gYW5kCisJCSAqIGVuY3J5cHRpb24gYml0cy4gVGhpcyBpcyBiZWNhdXNlIHRoZSBleGFj
dCBsb2NhdGlvbiBvZiB0aGUKKwkJICogZGF0YSBtYXkgbm90IGJlIGtub3duIGF0IG1tYXAoKSB0
aW1lIGFuZCBtYXkgYWxzbyBjaGFuZ2UKKwkJICogYXQgYXJiaXRyYXJ5IHRpbWVzIHdoaWxlIHRo
ZSBkYXRhIGlzIG1tYXAnZWQuCisJCSAqIFNlZSB2bWZfaW5zZXJ0X21peGVkX3Byb3QoKSBmb3Ig
YSBkaXNjdXNzaW9uLgorCQkgKi8KIAkJaWYgKHZtYS0+dm1fZmxhZ3MgJiBWTV9NSVhFRE1BUCkK
LQkJCXJldCA9IHZtZl9pbnNlcnRfbWl4ZWQoJmN2bWEsIGFkZHJlc3MsCi0JCQkJCV9fcGZuX3Rv
X3Bmbl90KHBmbiwgUEZOX0RFVikpOworCQkJcmV0ID0gdm1mX2luc2VydF9taXhlZF9wcm90KHZt
YSwgYWRkcmVzcywKKwkJCQkJCSAgICBfX3Bmbl90b19wZm5fdChwZm4sIFBGTl9ERVYpLAorCQkJ
CQkJICAgIHByb3QpOwogCQllbHNlCi0JCQlyZXQgPSB2bWZfaW5zZXJ0X3BmbigmY3ZtYSwgYWRk
cmVzcywgcGZuKTsKKwkJCXJldCA9IHZtZl9pbnNlcnRfcGZuX3Byb3Qodm1hLCBhZGRyZXNzLCBw
Zm4sIHByb3QpOwogCiAJCS8qIE5ldmVyIGVycm9yIG9uIHByZWZhdWx0ZWQgUFRFcyAqLwogCQlp
ZiAodW5saWtlbHkoKHJldCAmIFZNX0ZBVUxUX0VSUk9SKSkpIHsKQEAgLTMxOSw3ICszMjcsNyBA
QCB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIAlpZiAo
cmV0KQogCQlyZXR1cm4gcmV0OwogCi0JcHJvdCA9IHZtX2dldF9wYWdlX3Byb3Qodm1hLT52bV9m
bGFncyk7CisJcHJvdCA9IHZtYS0+dm1fcGFnZV9wcm90OwogCXJldCA9IHR0bV9ib192bV9mYXVs
dF9yZXNlcnZlZCh2bWYsIHByb3QsIFRUTV9CT19WTV9OVU1fUFJFRkFVTFQpOwogCWlmIChyZXQg
PT0gVk1fRkFVTFRfUkVUUlkgJiYgISh2bWYtPmZsYWdzICYgRkFVTFRfRkxBR19SRVRSWV9OT1dB
SVQpKQogCQlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvbW0vbWVtb3J5LmMgYi9tbS9tZW1vcnku
YwppbmRleCAyNjlhOGE4NzFlODMuLjBmMjYyYWNkMTAxOCAxMDA2NDQKLS0tIGEvbW0vbWVtb3J5
LmMKKysrIGIvbW0vbWVtb3J5LmMKQEAgLTE3OTgsNiArMTc5OCw3IEBAIHZtX2ZhdWx0X3Qgdm1m
X2luc2VydF9taXhlZF9wcm90KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBs
b25nIGFkZHIsCiB7CiAJcmV0dXJuIF9fdm1faW5zZXJ0X21peGVkKHZtYSwgYWRkciwgcGZuLCBw
Z3Byb3QsIGZhbHNlKTsKIH0KK0VYUE9SVF9TWU1CT0wodm1mX2luc2VydF9taXhlZF9wcm90KTsK
IAogdm1fZmF1bHRfdCB2bWZfaW5zZXJ0X21peGVkKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
LCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJCXBmbl90IHBmbikKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
