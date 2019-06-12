Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2733541C6D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3838925C;
	Wed, 12 Jun 2019 06:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A5F8925D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 06:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 706333F771;
 Wed, 12 Jun 2019 08:43:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.1
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eN_KM0t7dhF0; Wed, 12 Jun 2019 08:42:56 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 780233F708;
 Wed, 12 Jun 2019 08:42:55 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id E0884361B6A;
 Wed, 12 Jun 2019 08:42:54 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thellstrom@vmwopensource.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/9] mm: Allow the [page|pfn]_mkwrite callbacks to drop the
 mmap_sem
Date: Wed, 12 Jun 2019 08:42:35 +0200
Message-Id: <20190612064243.55340-2-thellstrom@vmwopensource.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612064243.55340-1-thellstrom@vmwopensource.org>
References: <20190612064243.55340-1-thellstrom@vmwopensource.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=vmwopensource.org; s=mail; t=1560321775;
 bh=Yjmtl92sLAlEoB99F5XOnCklObajAbb4hpy0froOh7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eeOw22qyp5zCYVRoM/flnXFq8CVLDiTHGne8tBYD5h07U6ysR3JsuLgcA17isFPZK
 L287x8k3sc6DRFwmYDPnxXTZMr03rF/Y4LtPDq4v5PRWhisSkqsidnDs4iiubpxtZR
 NQ7I0hIgw0DO0H2J//GflKMp0Tz7Xoxsxk+S6F9Y=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=vmwopensource.org header.i=@vmwopensource.org
 header.b=eeOw22qy; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=vmwopensource.org
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>, pv-drivers@vmware.com,
 Minchan Kim <minchan@kernel.org>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com, Souptick Joarder <jrdr.linux@gmail.com>,
 Huang Ying <ying.huang@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 nadav.amit@gmail.com
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
