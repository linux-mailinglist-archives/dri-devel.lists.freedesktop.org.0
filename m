Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 971CF105CA0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 23:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA536ED21;
	Thu, 21 Nov 2019 22:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555BD6E1CE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 22:25:14 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd70ecc0001>; Thu, 21 Nov 2019 14:25:17 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 21 Nov 2019 14:25:13 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 21 Nov 2019 14:25:13 -0800
Received: from [10.2.168.213] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 22:25:13 +0000
Subject: Re: [PATCH v7 05/24] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
To: Dan Williams <dan.j.williams@intel.com>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-6-jhubbard@nvidia.com> <20191121080555.GC24784@lst.de>
 <c5f8750f-af82-8aec-ce70-116acf24fa82@nvidia.com>
 <CAPcyv4jzDfxFAnAYc6g8Zz=3DweQFEBLBQyA_tSDP2Wy-RoA4A@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <461d6611-0cfb-dd13-f827-0db1ff8a9f2d@nvidia.com>
Date: Thu, 21 Nov 2019 14:22:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPcyv4jzDfxFAnAYc6g8Zz=3DweQFEBLBQyA_tSDP2Wy-RoA4A@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574375117; bh=D/eKIo+FJi5bpXqwJfXr6PJt8uCFLnCZclyeodxgmoA=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=QiiyQjBd99PA4tfLyLMiUlQLWaGQU2+co6FamS71fAjNe7NqeNYDH8w7d2wRbOpAp
 FO2FB4fRVvM6b8p6VFBEfZcwYG6pgVEpA9JmE6+ROgRRGxXCqZY/+YxPczpJznwImd
 p6u80IPFPE4x/PJetPMB9IpPtmHNp690Ig3KD/FI3Pg1Spw0uK9yY10oBbvhOlh90u
 VDHu/ArBa3unFu4nkBBDe7Ce1Uz+1D/XrvQ7tfArBFBClI1tdcdtAK+LKBrbmv90AQ
 ydolBZYKkzfeBhYUC0ZjSrXWwqBfaUR0ElhSrvf057yQhGgjhUwUU8jj5KSdyTH5QE
 YNZVYalLmeVQg==
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
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma <linux-rdma@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMjEvMTkgODo1OSBBTSwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+IE9uIFRodSwgTm92IDIx
LCAyMDE5IGF0IDEyOjU3IEFNIEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4gd3Jv
dGU6Cj4+Cj4+IE9uIDExLzIxLzE5IDEyOjA1IEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToK
Pj4+IFNvIHdoaWxlIHRoaXMgbG9va3MgY29ycmVjdCBhbmQgSSBzdGlsbCByZWFsbHkgZG9uJ3Qg
c2VlIHRoZSBtYWpvcgo+Pj4gYmVuZWZpdCBvZiB0aGUgbmV3IGNvZGUgb3JnYW5pemF0aW9uLCBl
c3BlY2lhbGx5IGFzIGl0IGJsb2F0cyBhbGwKPj4+IHB1dF9wYWdlIGNhbGxlcnMuCj4+Pgo+Pj4g
SSdkIGxvdmUgdG8gc2VlIGNvZGUgc2l6ZSBjaGFuZ2Ugc3RhdHMgZm9yIGFuIGFsbHllc2NvbmZp
ZyBvbiB0aGlzCj4+PiBjb21taXQuCj4+Pgo+Pgo+PiBSaWdodCwgSSdtIHJ1bm5pbmcgdGhhdCBu
b3csIHdpbGwgcG9zdCB0aGUgcmVzdWx0cy4gKGJ0dywgaWYgdGhlcmUgaXMKPj4gYSBzY3JpcHQg
YW5kL29yIHN0YW5kYXJkIGZvcm1hdCBJIHNob3VsZCB1c2UsIEknbSBhbGwgZWFycy4gSSdsbCBk
aWcKPj4gdGhyb3VnaCBsd24uLi4pCj4+Cj4gCj4gSnVzdCBydW46Cj4gCj4gICAgICBzaXplIHZt
bGludXgKPiAKCkJlYXV0aWZ1bC4gSSB0aG91Z2h0IGl0IHdvdWxkIGludm9sdmUgYSBsb3QgbW9y
ZS4gSGVyZSdzIHJlc3VsdHM6CgpsaW51eC5naXQgKExpbnV4IDUuNC1yYzgrKToKPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQogICB0ZXh0CSAgIGRhdGEJICAg
IGJzcwkgICAgZGVjCSAgICBoZXgJZmlsZW5hbWUKMjI3NTc4MDMyCTIxMzI2NzkzNQk3Njg3Nzk4
NAk1MTc3MjM5NTEJMWVkYmQ3MmYJdm1saW51eAoKCldpdGggcGF0Y2hlcyA0IGFuZCA1IGFwcGxp
ZWQgdG8gbGludXguZ2l0Ogo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KICAgdGV4dAkgICBkYXRhCSAgICBic3MJICAgIGRlYwkgICAgaGV4CWZpbGVuYW1lCjIyOTY5
ODU2MAkyMTMyODgzNzkJNzY4NTM0MDgJNTE5ODQwMzQ3CTFlZmMyMjViCXZtbGludXgKCgpBbmFs
eXNpczoKPT09PT09PT09CgpUaGlzIGluY3JlYXNlZCB0aGUgc2l6ZSBvZiB0ZXh0IGJ5IDAuOTMl
LiBXaGljaCBpcyBhIG1lYXN1cmFibGUgYmxvYXQsIHNvCnRoZSBpbmxpbmluZyByZWFsbHkgaXMg
dW5kZXNpcmFibGUgaGVyZSwgeWVzLiBJJ2xsIGRvIGl0IGRpZmZlcmVudGx5LgoKdGhhbmtzLAot
LSAKSm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
