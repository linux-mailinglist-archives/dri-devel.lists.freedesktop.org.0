Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E686B1AD2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 11:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832EA6EEF1;
	Fri, 13 Sep 2019 09:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB5B6EEF0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 09:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 5B3913F58A;
 Fri, 13 Sep 2019 11:32:31 +0200 (CEST)
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
 with ESMTP id SJPszWSLs_C6; Fri, 13 Sep 2019 11:32:29 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id D31EF3F4D5;
 Fri, 13 Sep 2019 11:32:27 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 880A6360221;
 Fri, 13 Sep 2019 11:32:27 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Subject: [RFC PATCH 2/7] drm/ttm: Allow the driver to provide the ttm struct
 vm_operations_struct
Date: Fri, 13 Sep 2019 11:32:08 +0200
Message-Id: <20190913093213.27254-3-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190913093213.27254-1-thomas_os@shipmail.org>
References: <20190913093213.27254-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1568367147; bh=+gqEjDMVRRxJpdrCVBfIMbPfYpR7zyotcVVYvs8w/Co=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dNNHULGcSysjEpuosNRDO9H1gcQHvEt+eLL3sXYBKyiU4HOHfzczDfmwwjoC8BJlF
 vOvdwr6Qc8HRfxQz7h5JaljSJWbwlBTpPTsYqKiufOOGcFT60Ly5YCTSSz1bSX0V1Z
 kjaliHjPRHOtdCS3Byq9Z+mP0Ci1aDeHFb3vTGtw=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=dNNHULGc; 
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
 Rik van Riel <riel@surriel.com>, pv-drivers@vmware.com,
 Minchan Kim <minchan@kernel.org>, Will Deacon <will.deacon@arm.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com, Souptick Joarder <jrdr.linux@gmail.com>,
 Huang Ying <ying.huang@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKQWRkIGEgcG9p
bnRlciB0byB0aGUgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IGluIHRoZSBib19kZXZpY2Us
IGFuZAphc3NpZ24gdGhhdCBwb2ludGVyIHRvIHRoZSBkZWZhdWx0IHZhbHVlIGN1cnJlbnRseSB1
c2VkLgoKVGhlIGRyaXZlciBjYW4gdGhlbiBvcHRpb25hbGx5IG1vZGlmeSB0aGF0IHBvaW50ZXIg
YW5kIHRoZSBuZXcgdmFsdWUKY2FuIGJlIHVzZWQgZm9yIGVhY2ggbmV3IHZtYSBjcmVhdGVkLgoK
Q2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBNYXR0aGV3
IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6IFdpbGwgRGVhY29uIDx3aWxsLmRlYWNv
bkBhcm0uY29tPgpDYzogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgpDYzog
UmlrIHZhbiBSaWVsIDxyaWVsQHN1cnJpZWwuY29tPgpDYzogTWluY2hhbiBLaW0gPG1pbmNoYW5A
a2VybmVsLm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpDYzogSHVhbmcg
WWluZyA8eWluZy5odWFuZ0BpbnRlbC5jb20+CkNjOiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxp
bnV4QGdtYWlsLmNvbT4KQ2M6ICJKw6lyw7RtZSBHbGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+
CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4KU2lnbmVkLW9mZi1ieTogVGhvbWFz
IEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMgICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgfCA2
ICsrKy0tLQogaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCB8IDYgKysrKysrCiAzIGZp
bGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvLmMKaW5kZXggMjBmZjU2ZjI3YWE0Li43ZDExYmUwYmI0OGMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
YwpAQCAtMTc1MSw2ICsxNzUxLDcgQEAgaW50IHR0bV9ib19kZXZpY2VfaW5pdChzdHJ1Y3QgdHRt
X2JvX2RldmljZSAqYmRldiwKIAltdXRleF9sb2NrKCZ0dG1fZ2xvYmFsX211dGV4KTsKIAlsaXN0
X2FkZF90YWlsKCZiZGV2LT5kZXZpY2VfbGlzdCwgJmdsb2ItPmRldmljZV9saXN0KTsKIAltdXRl
eF91bmxvY2soJnR0bV9nbG9iYWxfbXV0ZXgpOworCWJkZXYtPnZtX29wcyA9ICZ0dG1fYm9fdm1f
b3BzOwogCiAJcmV0dXJuIDA7CiBvdXRfbm9fc3lzOgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKaW5k
ZXggNzZlZWRiOTYzNjkzLi4wM2Y3MDJjMjk2Y2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwpA
QCAtMzk1LDcgKzM5NSw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX3ZtX2FjY2VzcyhzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCXJldHVybiByZXQ7CiB9CiAK
LXN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3QgdHRtX2JvX3ZtX29wcyA9
IHsKK2NvbnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVjdCB0dG1fYm9fdm1fb3BzID0gewog
CS5mYXVsdCA9IHR0bV9ib192bV9mYXVsdCwKIAkub3BlbiA9IHR0bV9ib192bV9vcGVuLAogCS5j
bG9zZSA9IHR0bV9ib192bV9jbG9zZSwKQEAgLTQ0OSw3ICs0NDksNyBAQCBpbnQgdHRtX2JvX21t
YXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCWlmICh1
bmxpa2VseShyZXQgIT0gMCkpCiAJCWdvdG8gb3V0X3VucmVmOwogCi0Jdm1hLT52bV9vcHMgPSAm
dHRtX2JvX3ZtX29wczsKKwl2bWEtPnZtX29wcyA9IGJkZXYtPnZtX29wczsKIAogCS8qCiAJICog
Tm90ZTogV2UncmUgdHJhbnNmZXJyaW5nIHRoZSBibyByZWZlcmVuY2UgdG8KQEAgLTQ4MSw3ICs0
ODEsNyBAQCBpbnQgdHRtX2ZiZGV2X21tYXAoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiAKIAl0dG1fYm9fZ2V0KGJvKTsKIAotCXZtYS0+
dm1fb3BzID0gJnR0bV9ib192bV9vcHM7CisJdm1hLT52bV9vcHMgPSBiby0+YmRldi0+dm1fb3Bz
OwogCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gYm87CiAJdm1hLT52bV9mbGFncyB8PSBWTV9NSVhF
RE1BUDsKIAl2bWEtPnZtX2ZsYWdzIHw9IFZNX0lPIHwgVk1fRE9OVEVYUEFORDsKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggYi9pbmNsdWRlL2RybS90dG0vdHRt
X2JvX2RyaXZlci5oCmluZGV4IDZmNTM2Y2FlYTM2OC4uYzFjYzBjNDA4ZTI3IDEwMDY0NAotLS0g
YS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCisrKyBiL2luY2x1ZGUvZHJtL3R0bS90
dG1fYm9fZHJpdmVyLmgKQEAgLTQ1Miw2ICs0NTIsOSBAQCBleHRlcm4gc3RydWN0IHR0bV9ib19n
bG9iYWwgewogICogQGRyaXZlcjogUG9pbnRlciB0byBhIHN0cnVjdCB0dG1fYm9fZHJpdmVyIHN0
cnVjdCBzZXR1cCBieSB0aGUgZHJpdmVyLgogICogQG1hbjogQW4gYXJyYXkgb2YgbWVtX3R5cGVf
bWFuYWdlcnMuCiAgKiBAdm1hX21hbmFnZXI6IEFkZHJlc3Mgc3BhY2UgbWFuYWdlcgorICogQHZt
X29wczogUG9pbnRlciB0byB0aGUgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHVzZWQgZm9y
IHRoaXMKKyAqIGRldmljZSdzIFZNIG9wZXJhdGlvbnMuIFRoZSBkcml2ZXIgbWF5IG92ZXJyaWRl
IHRoaXMgYmVmb3JlIHRoZSBmaXJzdAorICogbW1hcCgpIGNhbGwuCiAgKiBscnVfbG9jazogU3Bp
bmxvY2sgdGhhdCBwcm90ZWN0cyB0aGUgYnVmZmVyK2RldmljZSBscnUgbGlzdHMgYW5kCiAgKiBk
ZGVzdHJveSBsaXN0cy4KICAqIEBkZXZfbWFwcGluZzogQSBwb2ludGVyIHRvIHRoZSBzdHJ1Y3Qg
YWRkcmVzc19zcGFjZSByZXByZXNlbnRpbmcgdGhlCkBAIC00NzAsNiArNDczLDcgQEAgc3RydWN0
IHR0bV9ib19kZXZpY2UgewogCXN0cnVjdCB0dG1fYm9fZ2xvYmFsICpnbG9iOwogCXN0cnVjdCB0
dG1fYm9fZHJpdmVyICpkcml2ZXI7CiAJc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyIG1hbltU
VE1fTlVNX01FTV9UWVBFU107CisJY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0ICp2
bV9vcHM7CiAKIAkvKgogCSAqIFByb3RlY3RlZCBieSBpbnRlcm5hbCBsb2Nrcy4KQEAgLTQ5OCw2
ICs1MDIsOCBAQCBzdHJ1Y3QgdHRtX2JvX2RldmljZSB7CiAJYm9vbCBub19yZXRyeTsKIH07CiAK
K2V4dGVybiBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3QgdHRtX2JvX3ZtX29wczsK
KwogLyoqCiAgKiBzdHJ1Y3QgdHRtX2xydV9idWxrX21vdmVfcG9zCiAgKgotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
