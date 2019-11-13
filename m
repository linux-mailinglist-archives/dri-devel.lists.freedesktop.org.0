Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D18FA820
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 05:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9686EC74;
	Wed, 13 Nov 2019 04:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161996EC6D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 04:27:23 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb86240000>; Tue, 12 Nov 2019 20:27:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 20:27:16 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 20:27:16 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 04:27:12 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 13 Nov 2019 04:27:12 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dcb86200002>; Tue, 12 Nov 2019 20:27:12 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 06/23] IB/umem: use get_user_pages_fast() to pin DMA pages
Date: Tue, 12 Nov 2019 20:26:53 -0800
Message-ID: <20191113042710.3997854-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113042710.3997854-1-jhubbard@nvidia.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573619236; bh=yfY59FEzCJLU6Ev5Ha1oxCyEt547L9Ku0BnikujLehw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Oefu4QxrHoO0kNGZ6RM3kN6GOCF1uvImt6G47o7WM+tEZrfvAfzPFgyO+JXvSYG7c
 O47Pgoj7ZZPSNuerwOkv4CSkMfEhOtm6vb1dfWG6cL9iOCqc9k0rGFvgous55Is9xG
 lHyGxVr1SvtGNL7JYR1zBSibc6MgGJQ0yi84ExpbYH8R9qzAS/byqeaX3mhCZWGKMR
 ADv+j3xeoivErWC4LSEdu1YMMrstWOTL3HynPZJiU2LUHKLXQHZGg00Btsvg+2Dtp5
 rF5Nv1q7x4Mcbk/O3Rz5zJrzLF+apqHFbVvc4bBiG9D+UZaLl37QBE5OAzDWh5XcFQ
 bYZ5ljEbuLDyw==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul
 Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Jason
 Gunthorpe <jgg@mellanox.com>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kIGdldCByaWQgb2YgdGhlIG1tYXBfc2VtIGNhbGxzLCBhcyBwYXJ0IG9mIHRoYXQuIE5vdGUK
dGhhdCBnZXRfdXNlcl9wYWdlc19mYXN0KCkgd2lsbCwgaWYgbmVjZXNzYXJ5LCBmYWxsIGJhY2sg
dG8KX19ndXBfbG9uZ3Rlcm1fdW5sb2NrZWQoKSwgd2hpY2ggdGFrZXMgdGhlIG1tYXBfc2VtIGFz
IG5lZWRlZC4KClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+
ClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2luZmlu
aWJhbmQvY29yZS91bWVtLmMgfCAxNyArKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
bmZpbmliYW5kL2NvcmUvdW1lbS5jIGIvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdW1lbS5jCmlu
ZGV4IDI0MjQ0YTJmNjhjYy4uM2Q2NjRhMjUzOWViIDEwMDY0NAotLS0gYS9kcml2ZXJzL2luZmlu
aWJhbmQvY29yZS91bWVtLmMKKysrIGIvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdW1lbS5jCkBA
IC0yNzEsMTYgKzI3MSwxMyBAQCBzdHJ1Y3QgaWJfdW1lbSAqaWJfdW1lbV9nZXQoc3RydWN0IGli
X3VkYXRhICp1ZGF0YSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCXNnID0gdW1lbS0+c2dfaGVhZC5z
Z2w7CiAKIAl3aGlsZSAobnBhZ2VzKSB7Ci0JCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsKLQkJ
cmV0ID0gZ2V0X3VzZXJfcGFnZXMoY3VyX2Jhc2UsCi0JCQkJICAgICBtaW5fdCh1bnNpZ25lZCBs
b25nLCBucGFnZXMsCi0JCQkJCSAgIFBBR0VfU0laRSAvIHNpemVvZiAoc3RydWN0IHBhZ2UgKikp
LAotCQkJCSAgICAgZ3VwX2ZsYWdzIHwgRk9MTF9MT05HVEVSTSwKLQkJCQkgICAgIHBhZ2VfbGlz
dCwgTlVMTCk7Ci0JCWlmIChyZXQgPCAwKSB7Ci0JCQl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOwor
CQlyZXQgPSBnZXRfdXNlcl9wYWdlc19mYXN0KGN1cl9iYXNlLAorCQkJCQkgIG1pbl90KHVuc2ln
bmVkIGxvbmcsIG5wYWdlcywKKwkJCQkJCVBBR0VfU0laRSAvCisJCQkJCQlzaXplb2Yoc3RydWN0
IHBhZ2UgKikpLAorCQkJCQkgIGd1cF9mbGFncyB8IEZPTExfTE9OR1RFUk0sIHBhZ2VfbGlzdCk7
CisJCWlmIChyZXQgPCAwKQogCQkJZ290byB1bWVtX3JlbGVhc2U7Ci0JCX0KIAogCQljdXJfYmFz
ZSArPSByZXQgKiBQQUdFX1NJWkU7CiAJCW5wYWdlcyAgIC09IHJldDsKQEAgLTI4OCw4ICsyODUs
NiBAQCBzdHJ1Y3QgaWJfdW1lbSAqaWJfdW1lbV9nZXQoc3RydWN0IGliX3VkYXRhICp1ZGF0YSwg
dW5zaWduZWQgbG9uZyBhZGRyLAogCQlzZyA9IGliX3VtZW1fYWRkX3NnX3RhYmxlKHNnLCBwYWdl
X2xpc3QsIHJldCwKIAkJCWRtYV9nZXRfbWF4X3NlZ19zaXplKGNvbnRleHQtPmRldmljZS0+ZG1h
X2RldmljZSksCiAJCQkmdW1lbS0+c2dfbmVudHMpOwotCi0JCXVwX3JlYWQoJm1tLT5tbWFwX3Nl
bSk7CiAJfQogCiAJc2dfbWFya19lbmQoc2cpOwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
