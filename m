Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 470B0B079F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E262A6EB65;
	Thu, 12 Sep 2019 04:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799286E0E2;
 Wed, 11 Sep 2019 22:28:49 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d7975250001>; Wed, 11 Sep 2019 15:28:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 11 Sep 2019 15:28:49 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 11 Sep 2019 15:28:49 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Sep
 2019 22:28:45 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 11 Sep 2019 22:28:45 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d79751d0000>; Wed, 11 Sep 2019 15:28:45 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>
Subject: [PATCH 2/4] mm/hmm: allow snapshot of the special zero page
Date: Wed, 11 Sep 2019 15:28:27 -0700
Message-ID: <20190911222829.28874-3-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190911222829.28874-1-rcampbell@nvidia.com>
References: <20190911222829.28874-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1568240933; bh=fLP9rLpp/B9jcH+odOuRb1hMtcNtVrRutVa3Z9zrd1w=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=A1bY8PdkcziCRUc95de9wfnPNEuSMB6Y3FKusyqS8R55ozU6HDmd3v2d9mBoXhgm5
 2bxAt+kPjvO3iSt1qlE0mn8Tlh4Q1ODHh5ZkPxIQUjAIss5dP8jeD6cgsF7Vc0rWMQ
 9GmKXF2zlU2NeOoeJHx3RTwWj+BhWak6vZppWo/AGbLbkn4eeFiDGQK89qYr3KTKS/
 2/LH0I6lWeKKXi8MhSc8/EbwuTAXcfSxq0pVvOEGTn10DdWwkRbViknH0YT0sutLm0
 6Ay8DJzD4kBdk3IO5ILhq7pSw0yq2z2/yyzGsPdazJXbNTaHqt6XCst6QK0EZOmwiM
 Kdq2asvg502PA==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3cgaG1tX3JhbmdlX2ZhdWx0KCkgdG8gcmV0dXJuIHN1Y2Nlc3MgKDApIHdoZW4gdGhlIENQ
VSBwYWdldGFibGUKZW50cnkgcG9pbnRzIHRvIHRoZSBzcGVjaWFsIHNoYXJlZCB6ZXJvIHBhZ2Uu
ClRoZSBjYWxsZXIgY2FuIHRoZW4gaGFuZGxlIHRoZSB6ZXJvIHBhZ2UgYnkgcG9zc2libHkgY2xl
YXJpbmcgZGV2aWNlCnByaXZhdGUgbWVtb3J5IGluc3RlYWQgb2YgRE1BaW5nIGEgemVybyBwYWdl
LgoKU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpD
YzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IEphc29uIEd1bnRo
b3JwZSA8amdnQG1lbGxhbm94LmNvbT4KQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
PgotLS0KIG1tL2htbS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCAwNjA0
MWQ0Mzk5ZmYuLjcyMTc5MTJiZWYxMyAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1t
LmMKQEAgLTUzMiw3ICs1MzIsNyBAQCBzdGF0aWMgaW50IGhtbV92bWFfaGFuZGxlX3B0ZShzdHJ1
Y3QgbW1fd2FsayAqd2FsaywgdW5zaWduZWQgbG9uZyBhZGRyLAogCQkJcmV0dXJuIC1FQlVTWTsK
IAl9IGVsc2UgaWYgKElTX0VOQUJMRUQoQ09ORklHX0FSQ0hfSEFTX1BURV9TUEVDSUFMKSAmJiBw
dGVfc3BlY2lhbChwdGUpKSB7CiAJCSpwZm4gPSByYW5nZS0+dmFsdWVzW0hNTV9QRk5fU1BFQ0lB
TF07Ci0JCXJldHVybiAtRUZBVUxUOworCQlyZXR1cm4gaXNfemVyb19wZm4ocHRlX3BmbihwdGUp
KSA/IDAgOiAtRUZBVUxUOwogCX0KIAogCSpwZm4gPSBobW1fZGV2aWNlX2VudHJ5X2Zyb21fcGZu
KHJhbmdlLCBwdGVfcGZuKHB0ZSkpIHwgY3B1X2ZsYWdzOwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
