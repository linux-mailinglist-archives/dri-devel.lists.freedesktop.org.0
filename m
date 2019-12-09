Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0001179FE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513206E5BE;
	Mon,  9 Dec 2019 22:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C826E5A9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:54:05 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5deed0780000>; Mon, 09 Dec 2019 14:53:44 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 14:54:04 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 09 Dec 2019 14:54:04 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:54:04 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 9 Dec 2019 22:54:02 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5deed0890006>; Mon, 09 Dec 2019 14:54:02 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 15/26] fs/io_uring: set FOLL_PIN via pin_user_pages()
Date: Mon, 9 Dec 2019 14:53:33 -0800
Message-ID: <20191209225344.99740-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209225344.99740-1-jhubbard@nvidia.com>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1575932024; bh=XZAOBQ7h8B5KuSGqfEguVKa+axV7H4s2lXE+fnR+eEc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=ZstvwMy5//7eRqfCaIeF7d/lBq6H9RWFaWzNtmXVockpAcP7ymJE14CHUmHA6oJeZ
 zxi42siTha5YKR1YTh4f/uEDOdM868evF01gaJbyn+YsiG2zS3kwQ58X+owbPzvJl5
 BrwkzLr4gIL5aq7kj6va0Tgfshdm72XKQMcVJPs/27eAUeWNA1e/Bwno/AJp1DOM82
 tsOnpv/+R2rJ7VOQouW1phVgR7hnMGs6sbfAhL2lp89b5X2doTf9I21eRd9mQOazmz
 KPOBixPI58rBrscv1dzyyA6InPKTOrpmpZUje4q/TU5YALAn5q4f8FB68oM6c016uT
 OKBhr7Okk1xww==
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
ZmYgLS1naXQgYS9mcy9pb191cmluZy5jIGIvZnMvaW9fdXJpbmcuYwppbmRleCA0MDViZTEwZGE3
M2QuLjk2MzllYmMyMWU4YSAxMDA2NDQKLS0tIGEvZnMvaW9fdXJpbmcuYworKysgYi9mcy9pb191
cmluZy5jCkBAIC00NTIxLDcgKzQ1MjEsNyBAQCBzdGF0aWMgaW50IGlvX3NxZV9idWZmZXJfcmVn
aXN0ZXIoc3RydWN0IGlvX3JpbmdfY3R4ICpjdHgsIHZvaWQgX191c2VyICphcmcsCiAKIAkJcmV0
ID0gMDsKIAkJZG93bl9yZWFkKCZjdXJyZW50LT5tbS0+bW1hcF9zZW0pOwotCQlwcmV0ID0gZ2V0
X3VzZXJfcGFnZXModWJ1ZiwgbnJfcGFnZXMsCisJCXByZXQgPSBwaW5fdXNlcl9wYWdlcyh1YnVm
LCBucl9wYWdlcywKIAkJCQkgICAgICBGT0xMX1dSSVRFIHwgRk9MTF9MT05HVEVSTSwKIAkJCQkg
ICAgICBwYWdlcywgdm1hcyk7CiAJCWlmIChwcmV0ID09IG5yX3BhZ2VzKSB7Ci0tIAoyLjI0LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
