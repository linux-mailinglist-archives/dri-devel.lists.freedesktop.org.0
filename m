Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17C2CE232
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 14:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C66489958;
	Mon,  7 Oct 2019 12:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7A93589958
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 12:50:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D38001570;
 Mon,  7 Oct 2019 05:50:24 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9840E3F706;
 Mon,  7 Oct 2019 05:50:23 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/panfrost: Handle resetting on timeout better
Date: Mon,  7 Oct 2019 13:50:14 +0100
Message-Id: <20191007125014.12595-1-steven.price@arm.com>
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
aW5nIE5VTEwsIGxldCdzIHJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgY2hlY2tzLCBhbG9uZwp3aXRo
IGEgY29tbWVudGVkIG91dCBjYWxsIHRvIHBhbmZyb3N0X2NvcmVfZHVtcCgpIHdoaWNoIGhhcyBu
ZXZlcgpleGlzdGVkIGluIG1haW5saW5lLgoKU2lnbmVkLW9mZi1ieTogU3RldmVuIFByaWNlIDxz
dGV2ZW4ucHJpY2VAYXJtLmNvbT4KLS0tClRoaXMgaXMgYSB0aWRpZWQgdXAgdmVyc2lvbiBvZiB0
aGUgcGF0Y2ggb3JnaW5hbGx5IHBvc3RlZCBoZXJlOgpodHRwOi8vbGttbC5rZXJuZWwub3JnL3Iv
MjZhZTJhNGQtOGRmMS1lOGRiLTMwNjAtNDE2MzhlZDYzZTJhJTQwYXJtLmNvbQoKIGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyB8IDE3ICsrKysrKysrKysrLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKaW5kZXggYTU4NTUxNjY4ZDlhLi5kY2M5YTc2
MDM2ODUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2Iu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMKQEAgLTM4MSwx
MyArMzgxLDE5IEBAIHN0YXRpYyB2b2lkIHBhbmZyb3N0X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJt
X3NjaGVkX2pvYiAqc2NoZWRfam9iKQogCQlqb2JfcmVhZChwZmRldiwgSlNfVEFJTF9MTyhqcykp
LAogCQlzY2hlZF9qb2IpOwogCi0JbXV0ZXhfbG9jaygmcGZkZXYtPnJlc2V0X2xvY2spOworCWlm
ICghbXV0ZXhfdHJ5bG9jaygmcGZkZXYtPnJlc2V0X2xvY2spKQorCQlyZXR1cm47CiAKLQlmb3Ig
KGkgPSAwOyBpIDwgTlVNX0pPQl9TTE9UUzsgaSsrKQotCQlkcm1fc2NoZWRfc3RvcCgmcGZkZXYt
PmpzLT5xdWV1ZVtpXS5zY2hlZCwgc2NoZWRfam9iKTsKKwlmb3IgKGkgPSAwOyBpIDwgTlVNX0pP
Ql9TTE9UUzsgaSsrKSB7CisJCXN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQgPSAmcGZk
ZXYtPmpzLT5xdWV1ZVtpXS5zY2hlZDsKKworCQlkcm1fc2NoZWRfc3RvcChzY2hlZCwgc2NoZWRf
am9iKTsKKwkJaWYgKGpzICE9IGkpCisJCQkvKiBFbnN1cmUgYW55IHRpbWVvdXRzIG9uIG90aGVy
IHNsb3RzIGhhdmUgZmluaXNoZWQgKi8KKwkJCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmc2No
ZWQtPndvcmtfdGRyKTsKKwl9CiAKLQlpZiAoc2NoZWRfam9iKQotCQlkcm1fc2NoZWRfaW5jcmVh
c2Vfa2FybWEoc2NoZWRfam9iKTsKKwlkcm1fc2NoZWRfaW5jcmVhc2Vfa2FybWEoc2NoZWRfam9i
KTsKIAogCXNwaW5fbG9ja19pcnFzYXZlKCZwZmRldi0+anMtPmpvYl9sb2NrLCBmbGFncyk7CiAJ
Zm9yIChpID0gMDsgaSA8IE5VTV9KT0JfU0xPVFM7IGkrKykgewpAQCAtMzk4LDcgKzQwNCw2IEBA
IHN0YXRpYyB2b2lkIHBhbmZyb3N0X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAq
c2NoZWRfam9iKQogCX0KIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZwZmRldi0+anMtPmpvYl9s
b2NrLCBmbGFncyk7CiAKLQkvKiBwYW5mcm9zdF9jb3JlX2R1bXAocGZkZXYpOyAqLwogCiAJcGFu
ZnJvc3RfZGV2ZnJlcV9yZWNvcmRfdHJhbnNpdGlvbihwZmRldiwganMpOwogCXBhbmZyb3N0X2Rl
dmljZV9yZXNldChwZmRldik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
