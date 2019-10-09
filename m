Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDA9D0B9F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 11:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCEB6E94F;
	Wed,  9 Oct 2019 09:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8CE426E94F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 09:45:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CA8128;
 Wed,  9 Oct 2019 02:45:02 -0700 (PDT)
Received: from e112269-lin.arm.com (unknown [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E759A3F68E;
 Wed,  9 Oct 2019 02:45:00 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2 1/2] drm/panfrost: Handle resetting on timeout better
Date: Wed,  9 Oct 2019 10:44:55 +0100
Message-Id: <20191009094456.9704-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGFuZnJvc3QgdXNlcyBtdWx0aXBsZSBzY2hlZHVsZXJzIChvbmUgZm9yIGVhY2ggc2xvdCwgc28g
MiBpbiByZWFsaXR5KSwKYW5kIG9uIGEgdGltZW91dCBoYXMgdG8gc3RvcCBhbGwgdGhlIHNjaGVk
dWxlcnMgdG8gc2FmZWx5IHBlcmZvcm0gYQpyZXNldC4gSG93ZXZlciBtb3JlIHRoYW4gb25lIHNj
aGVkdWxlciBjYW4gdHJpZ2dlciBhIHRpbWVvdXQgYXQgdGhlIHNhbWUKdGltZS4gVGhpcyByYWNl
IGNvbmRpdGlvbiByZXN1bHRzIGluIGpvYnMgYmVpbmcgZnJlZWQgd2hpbGUgdGhleSBhcmUKc3Rp
bGwgaW4gdXNlLgoKV2hlbiBzdG9wcGluZyBvdGhlciBzbG90cyB1c2UgY2FuY2VsX2RlbGF5ZWRf
d29ya19zeW5jKCkgdG8gZW5zdXJlIHRoYXQKYW55IHRpbWVvdXQgc3RhcnRlZCBmb3IgdGhhdCBz
bG90IGhhcyBjb21wbGV0ZWQuIEFsc28gdXNlCm11dGV4X3RyeWxvY2soKSB0byBvYnRhaW4gcmVz
ZXRfbG9jay4gVGhpcyBtZWFucyB0aGF0IG9ubHkgb25lIHRocmVhZAphdHRlbXB0cyB0aGUgcmVz
ZXQsIHRoZSBvdGhlciB0aHJlYWRzIHdpbGwgc2ltcGx5IGNvbXBsZXRlIHdpdGhvdXQgZG9pbmcK
YW55dGhpbmcgKHRoZSBmaXJzdCB0aHJlYWQgd2lsbCB3YWl0IGZvciB0aGlzIGluIHRoZSBjYWxs
IHRvCmNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygpKS4KCldoaWxlIHdlJ3JlIGhlcmUgYW5kIHNp
bmNlIHRoZSBmdW5jdGlvbiBpcyBhbHJlYWR5IGRlcGVuZGVudCBvbgpzY2hlZF9qb2Igbm90IGJl
aW5nIE5VTEwsIGxldCdzIHJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgY2hlY2tzLgoKRml4ZXM6IGFh
MjAyMzY3ODRhYiAoImRybS9wYW5mcm9zdDogUHJldmVudCBjb25jdXJyZW50IHJlc2V0cyIpClRl
c3RlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgpTaWduZWQt
b2ZmLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgotLS0KdjI6CiAqIEFk
ZGVkIGZpeGVzIGFuZCB0ZXN0ZWQtYnkgdGFncwogKiBNb3ZlZCBjbGVhbnVwIG9mIHBhbmZyb3N0
X2NvcmVfZHVtcCgpIGNvbW1lbnQgdG8gc2VwYXJhdGUgcGF0Y2gKCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgfCAxNiArKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3Rfam9iLmMKaW5kZXggYTU4NTUxNjY4ZDlhLi4yMWYzNGQ0NGFhYzIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKQEAgLTM4MSwxMyArMzgxLDE5
IEBAIHN0YXRpYyB2b2lkIHBhbmZyb3N0X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pv
YiAqc2NoZWRfam9iKQogCQlqb2JfcmVhZChwZmRldiwgSlNfVEFJTF9MTyhqcykpLAogCQlzY2hl
ZF9qb2IpOwogCi0JbXV0ZXhfbG9jaygmcGZkZXYtPnJlc2V0X2xvY2spOworCWlmICghbXV0ZXhf
dHJ5bG9jaygmcGZkZXYtPnJlc2V0X2xvY2spKQorCQlyZXR1cm47CiAKLQlmb3IgKGkgPSAwOyBp
IDwgTlVNX0pPQl9TTE9UUzsgaSsrKQotCQlkcm1fc2NoZWRfc3RvcCgmcGZkZXYtPmpzLT5xdWV1
ZVtpXS5zY2hlZCwgc2NoZWRfam9iKTsKKwlmb3IgKGkgPSAwOyBpIDwgTlVNX0pPQl9TTE9UUzsg
aSsrKSB7CisJCXN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQgPSAmcGZkZXYtPmpzLT5x
dWV1ZVtpXS5zY2hlZDsKKworCQlkcm1fc2NoZWRfc3RvcChzY2hlZCwgc2NoZWRfam9iKTsKKwkJ
aWYgKGpzICE9IGkpCisJCQkvKiBFbnN1cmUgYW55IHRpbWVvdXRzIG9uIG90aGVyIHNsb3RzIGhh
dmUgZmluaXNoZWQgKi8KKwkJCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmc2NoZWQtPndvcmtf
dGRyKTsKKwl9CiAKLQlpZiAoc2NoZWRfam9iKQotCQlkcm1fc2NoZWRfaW5jcmVhc2Vfa2FybWEo
c2NoZWRfam9iKTsKKwlkcm1fc2NoZWRfaW5jcmVhc2Vfa2FybWEoc2NoZWRfam9iKTsKIAogCXNw
aW5fbG9ja19pcnFzYXZlKCZwZmRldi0+anMtPmpvYl9sb2NrLCBmbGFncyk7CiAJZm9yIChpID0g
MDsgaSA8IE5VTV9KT0JfU0xPVFM7IGkrKykgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
