Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC064912C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 22:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D096E0A2;
	Mon, 17 Jun 2019 20:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312366E0A2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 8CF103F96D;
 Mon, 17 Jun 2019 22:18:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wJgy2N-cuyPz; Mon, 17 Jun 2019 22:18:05 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 460C43F9AD;
 Mon, 17 Jun 2019 22:18:05 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id DABBF36196F;
 Mon, 17 Jun 2019 22:18:04 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?= <thomas@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 1/9] mm: Allow the [page|pfn]_mkwrite callbacks to drop the
 mmap_sem
Date: Mon, 17 Jun 2019 22:17:48 +0200
Message-Id: <20190617201756.12587-2-thomas@shipmail.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617201756.12587-1-thomas@shipmail.org>
References: <20190617201756.12587-1-thomas@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1560802684; bh=Yjmtl92sLAlEoB99F5XOnCklObajAbb4hpy0froOh7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DgKGvIHD+BQzCinbcZ00LwMWVT8XN0GXc9j1aYJM7nBZYRwIDReixcJ3mCGKHZ/Hi
 g18grOyedUJBk5IQVHCEkGOA9L462r1skv8BFNOgXYe45woAv57pFF2NjMJIuzv/1f
 Myo6q5Sz8915On8lU5DVdop7iP+FLs1b1WS0t+9I=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=DgKGvIHD; 
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
Cc: pv-drivers@vmware.com, linux-graphics-maintainer@vmware.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKRHJpdmVyIGZh
dWx0IGNhbGxiYWNrcyBhcmUgYWxsb3dlZCB0byBkcm9wIHRoZSBtbWFwX3NlbSB3aGVuIGV4cGVj
dGluZwpsb25nIGhhcmR3YXJlIHdhaXRzIHRvIGF2b2lkIGJsb2NraW5nIG90aGVyIG1tIHVzZXJz
LiBBbGxvdyB0aGUgbWt3cml0ZQpjYWxsYmFja3MgdG8gZG8gdGhlIHNhbWUgYnkgcmV0dXJuaW5n
IGVhcmx5IG9uIFZNX0ZBVUxUX1JFVFJZLgoKSW4gcGFydGljdWxhciB3ZSB3YW50IHRvIGJlIGFi
bGUgdG8gZHJvcCB0aGUgbW1hcF9zZW0gd2hlbiB3YWl0aW5nIGZvcgphIHJlc2VydmF0aW9uIG9i
amVjdCBsb2NrIG9uIGEgR1BVIGJ1ZmZlciBvYmplY3QuIFRoZXNlIGxvY2tzIG1heSBiZQpoZWxk
IHdoaWxlIHdhaXRpbmcgZm9yIHRoZSBHUFUuCgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51
eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3Jn
PgpDYzogV2lsbCBEZWFjb24gPHdpbGwuZGVhY29uQGFybS5jb20+CkNjOiBQZXRlciBaaWpsc3Ry
YSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+CkNjOiBSaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5j
b20+CkNjOiBNaW5jaGFuIEtpbSA8bWluY2hhbkBrZXJuZWwub3JnPgpDYzogTWljaGFsIEhvY2tv
IDxtaG9ja29Ac3VzZS5jb20+CkNjOiBIdWFuZyBZaW5nIDx5aW5nLmh1YW5nQGludGVsLmNvbT4K
Q2M6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgpDYzogIkrDqXLDtG1l
IEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzog
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxz
dHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgpSZXZpZXdlZC1ieTogUmFscGggQ2FtcGJlbGwg
PHJjYW1wYmVsbEBudmlkaWEuY29tPgotLS0KIG1tL21lbW9yeS5jIHwgMTAgKysrKysrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9tbS9tZW1vcnkuYyBiL21tL21lbW9yeS5jCmluZGV4IGRkZjIwYmQwYzMxNy4uMTY4ZjU0
NmFmMWFkIDEwMDY0NAotLS0gYS9tbS9tZW1vcnkuYworKysgYi9tbS9tZW1vcnkuYwpAQCAtMjIz
OCw3ICsyMjM4LDcgQEAgc3RhdGljIHZtX2ZhdWx0X3QgZG9fcGFnZV9ta3dyaXRlKHN0cnVjdCB2
bV9mYXVsdCAqdm1mKQogCXJldCA9IHZtZi0+dm1hLT52bV9vcHMtPnBhZ2VfbWt3cml0ZSh2bWYp
OwogCS8qIFJlc3RvcmUgb3JpZ2luYWwgZmxhZ3Mgc28gdGhhdCBjYWxsZXIgaXMgbm90IHN1cnBy
aXNlZCAqLwogCXZtZi0+ZmxhZ3MgPSBvbGRfZmxhZ3M7Ci0JaWYgKHVubGlrZWx5KHJldCAmIChW
TV9GQVVMVF9FUlJPUiB8IFZNX0ZBVUxUX05PUEFHRSkpKQorCWlmICh1bmxpa2VseShyZXQgJiAo
Vk1fRkFVTFRfRVJST1IgfCBWTV9GQVVMVF9OT1BBR0UgfCBWTV9GQVVMVF9SRVRSWSkpKQogCQly
ZXR1cm4gcmV0OwogCWlmICh1bmxpa2VseSghKHJldCAmIFZNX0ZBVUxUX0xPQ0tFRCkpKSB7CiAJ
CWxvY2tfcGFnZShwYWdlKTsKQEAgLTI1MTUsNyArMjUxNSw3IEBAIHN0YXRpYyB2bV9mYXVsdF90
IHdwX3Bmbl9zaGFyZWQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiAJCXB0ZV91bm1hcF91bmxvY2so
dm1mLT5wdGUsIHZtZi0+cHRsKTsKIAkJdm1mLT5mbGFncyB8PSBGQVVMVF9GTEFHX01LV1JJVEU7
CiAJCXJldCA9IHZtYS0+dm1fb3BzLT5wZm5fbWt3cml0ZSh2bWYpOwotCQlpZiAocmV0ICYgKFZN
X0ZBVUxUX0VSUk9SIHwgVk1fRkFVTFRfTk9QQUdFKSkKKwkJaWYgKHJldCAmIChWTV9GQVVMVF9F
UlJPUiB8IFZNX0ZBVUxUX05PUEFHRSB8IFZNX0ZBVUxUX1JFVFJZKSkKIAkJCXJldHVybiByZXQ7
CiAJCXJldHVybiBmaW5pc2hfbWt3cml0ZV9mYXVsdCh2bWYpOwogCX0KQEAgLTI1MzYsNyArMjUz
Niw4IEBAIHN0YXRpYyB2bV9mYXVsdF90IHdwX3BhZ2Vfc2hhcmVkKHN0cnVjdCB2bV9mYXVsdCAq
dm1mKQogCQlwdGVfdW5tYXBfdW5sb2NrKHZtZi0+cHRlLCB2bWYtPnB0bCk7CiAJCXRtcCA9IGRv
X3BhZ2VfbWt3cml0ZSh2bWYpOwogCQlpZiAodW5saWtlbHkoIXRtcCB8fCAodG1wICYKLQkJCQkg
ICAgICAoVk1fRkFVTFRfRVJST1IgfCBWTV9GQVVMVF9OT1BBR0UpKSkpIHsKKwkJCQkgICAgICAo
Vk1fRkFVTFRfRVJST1IgfCBWTV9GQVVMVF9OT1BBR0UgfAorCQkJCSAgICAgICBWTV9GQVVMVF9S
RVRSWSkpKSkgewogCQkJcHV0X3BhZ2Uodm1mLT5wYWdlKTsKIAkJCXJldHVybiB0bXA7CiAJCX0K
QEAgLTM2MDEsNyArMzYwMiw4IEBAIHN0YXRpYyB2bV9mYXVsdF90IGRvX3NoYXJlZF9mYXVsdChz
dHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIAkJdW5sb2NrX3BhZ2Uodm1mLT5wYWdlKTsKIAkJdG1wID0g
ZG9fcGFnZV9ta3dyaXRlKHZtZik7CiAJCWlmICh1bmxpa2VseSghdG1wIHx8Ci0JCQkJKHRtcCAm
IChWTV9GQVVMVF9FUlJPUiB8IFZNX0ZBVUxUX05PUEFHRSkpKSkgeworCQkJCSh0bXAgJiAoVk1f
RkFVTFRfRVJST1IgfCBWTV9GQVVMVF9OT1BBR0UgfAorCQkJCQlWTV9GQVVMVF9SRVRSWSkpKSkg
ewogCQkJcHV0X3BhZ2Uodm1mLT5wYWdlKTsKIAkJCXJldHVybiB0bXA7CiAJCX0KLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
