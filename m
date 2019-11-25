Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B203108729
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 05:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8A289E35;
	Mon, 25 Nov 2019 04:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C28889DEA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 04:20:15 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ddb56820001>; Sun, 24 Nov 2019 20:20:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 24 Nov 2019 20:20:14 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 24 Nov 2019 20:20:14 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Nov
 2019 04:20:14 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 25 Nov 2019 04:20:14 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ddb567e0000>; Sun, 24 Nov 2019 20:20:14 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 12/19] fs/io_uring: set FOLL_PIN via pin_user_pages()
Date: Sun, 24 Nov 2019 20:20:04 -0800
Message-ID: <20191125042011.3002372-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125042011.3002372-1-jhubbard@nvidia.com>
References: <20191125042011.3002372-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574655618; bh=xom2fEIJsdw3e0D/UCX8LciSe591DLpIBquADvh+nP4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Gj37aZFP24H3fAjnsRkEsC0AQAX2Nmf7KM6EYLgdGEsvot4M34qaDyVe2VQeyvYtO
 b3X8gI2gydQ65ooht5mEPoVmlVgm0gnamuoFlA1Xzw0sr2IBuQjPz43unt3nRX+nTl
 bDvhCcgCvDfixhn/809Ex37Q2EtZIJgrO2u/BZT1EF+tyo+tnTzqHu7FMoswHE+VRv
 ZrjsZNNGp/rzuZJo8DgCgyDt7WZA52swW8EXdLj9/dPOGv4OfVETNL81KrKZl6hoeg
 f1RlcLE3OaOOsbxZN+PbItFlueBVbbsFPkr+unz0C9s1WOIQ9qZDcGqufVcizVIkXb
 1RL6a8WmpDVOw==
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
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
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

Q29udmVydCBmcy9pb191cmluZyB0byB1c2UgdGhlIG5ldyBwaW5fdXNlcl9wYWdlcygpIGNhbGws
IHdoaWNoIHNldHMKRk9MTF9QSU4uIFNldHRpbmcgRk9MTF9QSU4gaXMgbm93IHJlcXVpcmVkIGZv
ciBjb2RlIHRoYXQgcmVxdWlyZXMKdHJhY2tpbmcgb2YgcGlubmVkIHBhZ2VzLCBhbmQgdGhlcmVm
b3JlIGZvciBhbnkgY29kZSB0aGF0IGNhbGxzCnB1dF91c2VyX3BhZ2UoKS4KCkluIHBhcnRpYWwg
YW50aWNpcGF0aW9uIG9mIHRoaXMgd29yaywgdGhlIGlvX3VyaW5nIGNvZGUgd2FzIGFscmVhZHkK
Y2FsbGluZyBwdXRfdXNlcl9wYWdlKCkgaW5zdGVhZCBvZiBwdXRfcGFnZSgpLiBUaGVyZWZvcmUs
IGluIG9yZGVyIHRvCmNvbnZlcnQgZnJvbSB0aGUgZ2V0X3VzZXJfcGFnZXMoKS9wdXRfcGFnZSgp
IG1vZGVsLCB0byB0aGUKcGluX3VzZXJfcGFnZXMoKS9wdXRfdXNlcl9wYWdlKCkgbW9kZWwsIHRo
ZSBvbmx5IGNoYW5nZSByZXF1aXJlZApoZXJlIGlzIHRvIGNoYW5nZSBnZXRfdXNlcl9wYWdlcygp
IHRvIHBpbl91c2VyX3BhZ2VzKCkuCgpSZXZpZXdlZC1ieTogSmVucyBBeGJvZSA8YXhib2VAa2Vy
bmVsLmRrPgpSZXZpZXdlZC1ieTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KU2lnbmVkLW9mZi1i
eTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGZzL2lvX3VyaW5nLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9mcy9pb191cmluZy5jIGIvZnMvaW9fdXJpbmcuYwppbmRleCAwMTAwMDNiNGI2
MGIuLjBmNzg5OGIxYzRiMCAxMDA2NDQKLS0tIGEvZnMvaW9fdXJpbmcuYworKysgYi9mcy9pb191
cmluZy5jCkBAIC00MTg1LDcgKzQxODUsNyBAQCBzdGF0aWMgaW50IGlvX3NxZV9idWZmZXJfcmVn
aXN0ZXIoc3RydWN0IGlvX3JpbmdfY3R4ICpjdHgsIHZvaWQgX191c2VyICphcmcsCiAKIAkJcmV0
ID0gMDsKIAkJZG93bl9yZWFkKCZjdXJyZW50LT5tbS0+bW1hcF9zZW0pOwotCQlwcmV0ID0gZ2V0
X3VzZXJfcGFnZXModWJ1ZiwgbnJfcGFnZXMsCisJCXByZXQgPSBwaW5fdXNlcl9wYWdlcyh1YnVm
LCBucl9wYWdlcywKIAkJCQkgICAgICBGT0xMX1dSSVRFIHwgRk9MTF9MT05HVEVSTSwKIAkJCQkg
ICAgICBwYWdlcywgdm1hcyk7CiAJCWlmIChwcmV0ID09IG5yX3BhZ2VzKSB7Ci0tIAoyLjI0LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
