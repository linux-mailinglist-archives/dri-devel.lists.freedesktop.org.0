Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CED87191A97
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 21:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76206E02D;
	Tue, 24 Mar 2020 20:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC36A6E02D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 20:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id B4C1040735;
 Tue, 24 Mar 2020 21:11:42 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="RVvi+5ZE";
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
 with ESMTP id eO960zhVeZGh; Tue, 24 Mar 2020 21:11:41 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 7D9FC4052C;
 Tue, 24 Mar 2020 21:11:38 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B46033602F7;
 Tue, 24 Mar 2020 21:11:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1585080698; bh=iYRGvlrMx/ASdASJ84Pl19hk1Q5OTvbQxQY5Z288KuM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RVvi+5ZEwHoQCJgicJVVWv/JFpiZgFWj9mKUQ5N20FyV1XHSwezYqEX7od+5yRIID
 /VFHjzRPj5xSifZ8hirhT3GIVDpFBPGHIW2oElDZGcAoi48hc/djrohrsjPn8VyZFy
 yMHfHEcx3PJ82Ik+y05DSmRds9J3Gsaq9vtsV49s=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/9] fs: Constify vma argument to vma_is_dax
Date: Tue, 24 Mar 2020 21:11:15 +0100
Message-Id: <20200324201123.3118-2-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200324201123.3118-1-thomas_os@shipmail.org>
References: <20200324201123.3118-1-thomas_os@shipmail.org>
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 "Thomas Hellstrom \(VMware\)" <thomas_os@shipmail.org>,
 Dan Williams <dan.j.williams@intel.com>,
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

RnJvbTogIlRob21hcyBIZWxsc3Ryb20gKFZNd2FyZSkiIDx0aG9tYXNfb3NAc2hpcG1haWwub3Jn
PgoKVGhlIGZ1bmN0aW9uIGlzIHVzZWQgYnkgdXBjb21pbmcgdm1hX2lzX3NwZWNpYWxfaHVnZSgp
IHdpdGggd2hpY2ggd2Ugd2FudAp0byB1c2UgYSBjb25zdCB2bWEgYXJndW1lbnQuIFNpbmNlIGZv
ciB2bWFfaXNfZGF4KCkgdGhlIHZtYSBhcmd1bWVudCBpcwpvbmx5IGRlcmVmZXJlbmNlZCBmb3Ig
cmVhZGluZywgY29uc3RpZnkgaXQuCgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3Vu
ZGF0aW9uLm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpDYzogIk1hdHRo
ZXcgV2lsY294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6ICJLaXJpbGwgQS4g
U2h1dGVtb3YiIDxraXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29tPgpDYzogUmFscGggQ2Ft
cGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlz
c2VAcmVkaGF0LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgpDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gKFZNd2FyZSkgPHRob21hc19vc0BzaGlwbWFpbC5v
cmc+ClJldmlld2VkLWJ5OiBSb2xhbmQgU2NoZWlkZWdnZXIgPHNyb2xhbmRAdm13YXJlLmNvbT4K
QWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0t
CiBpbmNsdWRlL2xpbnV4L2ZzLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2ZzLmggYi9pbmNs
dWRlL2xpbnV4L2ZzLmgKaW5kZXggM2NkNGZlNmI4NDVlLi4yYjM4Y2U1YjczYWQgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgvZnMuaAorKysgYi9pbmNsdWRlL2xpbnV4L2ZzLmgKQEAgLTMzOTEs
NyArMzM5MSw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpb19pc19kaXJlY3Qoc3RydWN0IGZpbGUg
KmZpbHApCiAJcmV0dXJuIChmaWxwLT5mX2ZsYWdzICYgT19ESVJFQ1QpIHx8IElTX0RBWChmaWxw
LT5mX21hcHBpbmctPmhvc3QpOwogfQogCi1zdGF0aWMgaW5saW5lIGJvb2wgdm1hX2lzX2RheChz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKK3N0YXRpYyBpbmxpbmUgYm9vbCB2bWFfaXNfZGF4
KGNvbnN0IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogewogCXJldHVybiB2bWEtPnZtX2Zp
bGUgJiYgSVNfREFYKHZtYS0+dm1fZmlsZS0+Zl9tYXBwaW5nLT5ob3N0KTsKIH0KLS0gCjIuMjEu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
