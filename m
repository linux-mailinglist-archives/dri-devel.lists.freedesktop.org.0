Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF83FD4C0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 06:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58466E21B;
	Fri, 15 Nov 2019 05:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186AE6E061
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 05:53:46 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dce3d690002>; Thu, 14 Nov 2019 21:53:45 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 14 Nov 2019 21:53:45 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 14 Nov 2019 21:53:45 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 05:53:45 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 15 Nov 2019 05:53:45 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dce3d680009>; Thu, 14 Nov 2019 21:53:44 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 16/24] net/xdp: set FOLL_PIN via pin_user_pages()
Date: Thu, 14 Nov 2019 21:53:32 -0800
Message-ID: <20191115055340.1825745-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115055340.1825745-1-jhubbard@nvidia.com>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573797225; bh=JiuMSIu1KROGnYN0FUrQmmZholMbEQnfhCSo9iAG4Tw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=Lr98RhG1tdsqYwnbXMSzbUdWbL674VZdXLsVAgHvVfrs4Hk6lBTc3JKG4tmaUMzLY
 kKWmn4CVywlkea7GLWF9HCnCy7Gso6hbPQdfdShqQR98JvMhWr14DCr28YVtKSVlyp
 mlrhJHBEKkELIhKp0qvI07yd+HzJVN465g8cV1i24T75NYzIiLnddO57oL0PJf6Euu
 UgY7fTW+AmvxU2v6ggU/PG38PrfXJEOPKksOfyIK8rtfga23etn94AgtGUIjiFFemY
 YTEr1+qk02/Z9sYgvFOmjbA67wdpIEaTZNwTfDa7KHdoB3wMLyk7xhocHeBYEGu8nk
 igvLkkjfoocbw==
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

Q29udmVydCBuZXQveGRwIHRvIHVzZSB0aGUgbmV3IHBpbl9sb25ndGVybV9wYWdlcygpIGNhbGws
IHdoaWNoIHNldHMKRk9MTF9QSU4uIFNldHRpbmcgRk9MTF9QSU4gaXMgbm93IHJlcXVpcmVkIGZv
ciBjb2RlIHRoYXQgcmVxdWlyZXMKdHJhY2tpbmcgb2YgcGlubmVkIHBhZ2VzLgoKSW4gcGFydGlh
bCBhbnRpY2lwYXRpb24gb2YgdGhpcyB3b3JrLCB0aGUgbmV0L3hkcCBjb2RlIHdhcyBhbHJlYWR5
CmNhbGxpbmcgcHV0X3VzZXJfcGFnZSgpIGluc3RlYWQgb2YgcHV0X3BhZ2UoKS4gVGhlcmVmb3Jl
LCBpbiBvcmRlciB0bwpjb252ZXJ0IGZyb20gdGhlIGdldF91c2VyX3BhZ2VzKCkvcHV0X3BhZ2Uo
KSBtb2RlbCwgdG8gdGhlCnBpbl91c2VyX3BhZ2VzKCkvcHV0X3VzZXJfcGFnZSgpIG1vZGVsLCB0
aGUgb25seSBjaGFuZ2UgcmVxdWlyZWQKaGVyZSBpcyB0byBjaGFuZ2UgZ2V0X3VzZXJfcGFnZXMo
KSB0byBwaW5fdXNlcl9wYWdlcygpLgoKQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRv
cGVsQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlk
aWEuY29tPgotLS0KIG5ldC94ZHAveGRwX3VtZW0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL25ldC94ZHAveGRwX3Vt
ZW0uYyBiL25ldC94ZHAveGRwX3VtZW0uYwppbmRleCAzMDQ5YWYyNjlmYmYuLmQwNzEwMDNiNWU3
NiAxMDA2NDQKLS0tIGEvbmV0L3hkcC94ZHBfdW1lbS5jCisrKyBiL25ldC94ZHAveGRwX3VtZW0u
YwpAQCAtMjkxLDcgKzI5MSw3IEBAIHN0YXRpYyBpbnQgeGRwX3VtZW1fcGluX3BhZ2VzKHN0cnVj
dCB4ZHBfdW1lbSAqdW1lbSkKIAkJcmV0dXJuIC1FTk9NRU07CiAKIAlkb3duX3JlYWQoJmN1cnJl
bnQtPm1tLT5tbWFwX3NlbSk7Ci0JbnBncyA9IGdldF91c2VyX3BhZ2VzKHVtZW0tPmFkZHJlc3Ms
IHVtZW0tPm5wZ3MsCisJbnBncyA9IHBpbl91c2VyX3BhZ2VzKHVtZW0tPmFkZHJlc3MsIHVtZW0t
Pm5wZ3MsCiAJCQkgICAgICBndXBfZmxhZ3MgfCBGT0xMX0xPTkdURVJNLCAmdW1lbS0+cGdzWzBd
LCBOVUxMKTsKIAl1cF9yZWFkKCZjdXJyZW50LT5tbS0+bW1hcF9zZW0pOwogCi0tIAoyLjI0LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
