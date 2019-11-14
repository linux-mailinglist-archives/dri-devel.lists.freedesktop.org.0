Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EB0FC009
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 07:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D806E10F;
	Thu, 14 Nov 2019 06:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F456E10F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 06:08:14 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dccef4c0000>; Wed, 13 Nov 2019 22:08:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 22:08:13 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 22:08:13 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Nov
 2019 06:08:12 +0000
Subject: Re: [PATCH v4 09/23] mm/gup: introduce pin_user_pages*() and FOLL_PIN
From: John Hubbard <jhubbard@nvidia.com>
To: Jan Kara <jack@suse.cz>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-10-jhubbard@nvidia.com>
 <20191113104308.GE6367@quack2.suse.cz>
 <3850aa22-6f03-bd2b-024f-5736c4461199@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <7c590a1a-25c6-a8e7-d471-8855ceea8606@nvidia.com>
Date: Wed, 13 Nov 2019 22:08:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3850aa22-6f03-bd2b-024f-5736c4461199@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573711692; bh=DIdS7z+upWWwriggk7xvQh6W6C7nto/Dlb+Yd8YHyyo=;
 h=X-PGP-Universal:Subject:From:To:CC:References:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=f9GCQv7TfzjvQX+YKkhiJDV/kP32g+HvR9S+vDLbLe8tqa50A8oxNI045niH9oWR6
 Q+cRQMMuOwkhrc3UyHNB5dnYTxj30KiXA71H5zxupkKbZfd2ps9XV2bsxg1JSEMDdw
 qf9Vcd6U4xnrGLaZQaGULc5hp7BtrN3TQq1+4QNeiyHZ0EANBdTplhxuReTGSebwB/
 f90gLRmPU4TtSLCTxR2K8crrcttWruVUEFFlnGiNse7TapK6yl28TNAEQQYeEakb+c
 3z6jTyDq+9/ON54Pzsd2O5eKTbjzgyBeQwB7ztFRyxIYohzwkLXX9l0JxAXtOLXL+I
 x4TC/t1hFahNQ==
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
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTMvMTkgMzoyMiBQTSwgSm9obiBIdWJiYXJkIHdyb3RlOgo+IE9uIDExLzEzLzE5IDI6
NDMgQU0sIEphbiBLYXJhIHdyb3RlOgo+IC4uLgo+PiBIb3cgZG9lcyBGT0xMX1BJTiByZXN1bHQg
aW4gZ3JhYmJpbmcgKGF0IGxlYXN0IG5vcm1hbCwgZm9yIG5vdykgcGFnZSByZWZlcmVuY2U/Cj4+
IEkgZGlkbid0IGZpbmQgdGhhdCBhbnl3aGVyZSBpbiB0aGlzIHBhdGNoIGJ1dCBpdCBpcyBhIHBy
ZXJlcXVpc2l0ZSB0bwo+PiBjb252ZXJ0aW5nIGFueSB1c2VyIHRvIHBpbl91c2VyX3BhZ2VzKCkg
aW50ZXJmYWNlLCByaWdodD8KPiAKPiAKPiBvaGhoLCBJIG1lc3NlZCB1cCBvbiB0aGlzIGludGVy
bWVkaWF0ZSBwYXRjaDogaXQgZG9lc24ndCBxdWl0ZSBzdGFuZCBhbG9uZSBhcwo+IGl0IHNob3Vs
ZCwgYXMgeW91IG5vdGljZWQuIFRvIGNvcnJlY3QgdGhpcywgSSBjYW4gZG8gb25lIG9mIHRoZSBm
b2xsb3dpbmc6Cj4gCj4gYSkgbW92ZSB0aGUgbmV3IHBpbiooKSByb3V0aW5lcyBpbnRvIHRoZSBs
YXRlciBwYXRjaCAxNiAoIm1tL2d1cDoKPiB0cmFjayBGT0xMX1BJTiBwYWdlcyIpLCBvcgo+IAo+
IGIpIGRvIGEgdGVtcG9yYXJ5IHRoaW5nIGhlcmUsIHN1Y2ggYXMgc2V0dGluZyBGT0xMX0dFVCBh
bmQgYWRkaW5nIGEgVE9ETywKPiB3aXRoaW4gdGhlIHBpbiooKSBpbXBsZW1lbnRhdGlvbnMuIEFu
ZCB0aGlzIHN3aXRjaGluZyBpdCBvdmVyIHRvIEZPTExfUElOCj4gaW4gcGF0Y2ggMTYuCj4gCj4g
SSdtIHRoaW5raW5nIChhKSBpcyBsZXNzIGVycm9yLXByb25lLCBzbyBJJ20gZ29pbmcgd2l0aCB0
aGF0IHVubGVzcyBzb21lb25lCj4gcG9pbnRzIG91dCB0aGF0IHRoYXQgaXMgc3R1cGlkLiA6KQo+
IAoKT0ssIGp1c3QgdG8gc2F2ZSBhbnlvbmUgZnJvbSB3YXN0aW5nIHRpbWUgcmVhZGluZyB0aGUg
YWJvdmU6IChhKSBpcywgaW4gZmFjdCwKc3R1cGlkLCBhZnRlciBhbGwuIGhhLiBUaGF0IGlzIGJl
Y2F1c2UgcGluX3VzZXJfcGFnZXMoKSBpcyBjYWxsZWQgaW4gdGhlIAppbnRlcnZlbmluZyBwYXRj
aGVzLgogClNvIGFueXdheSwgSSdsbCB3b3JrIG91dCBhbiBvcmRlcmluZyB0byBmaXggaXQgdXAs
IGl0J3Mgbm90IGNvbXBsaWNhdGVkLgoKCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
