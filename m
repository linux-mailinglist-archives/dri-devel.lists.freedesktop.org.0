Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFA310DB50
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 22:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42666E959;
	Fri, 29 Nov 2019 21:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F856E959
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 21:47:43 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5de192010000>; Fri, 29 Nov 2019 13:47:46 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 29 Nov 2019 13:47:42 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 29 Nov 2019 13:47:42 -0800
Received: from [10.2.169.205] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Nov
 2019 21:47:41 +0000
Subject: Re: [PATCH v2 17/19] powerpc: book3s64: convert to pin_user_pages()
 and put_user_page()
To: Jan Kara <jack@suse.cz>
References: <20191125231035.1539120-1-jhubbard@nvidia.com>
 <20191125231035.1539120-18-jhubbard@nvidia.com>
 <20191129112315.GB1121@quack2.suse.cz>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <cb3e2acc-0a83-4053-fbcc-6d75dc47f174@nvidia.com>
Date: Fri, 29 Nov 2019 13:44:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191129112315.GB1121@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1575064066; bh=tMvn6asqZgJ/8yczcC9lnf1pHEf7TJzCvRVZqLzUEIk=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=P515JTdy70KP3oimNK/fSAtObgW4JDQsh/LN+dj31w7qtgH6JUdGJYKS3j5J8enBM
 oN04vymJSqszX58P75QNc1cW3k/Ll0LB9zwNlmlBWaR7zw2qd7/o9t2Cy3EugW3wgY
 XBlQyEsBEMcfywkDPj201lclcvfOCs5gFzs/O+2QmSmHzciD31eTMBkNB0W6VGXEOL
 BbnrGM91l0GAwjLm+XJmL4eoGQAce5JVCz6FfueQA4/sc24hO2mmz2R1mloKHyP2Ej
 3q1StOVbP0t0OEBFEGay8puwUyC8jwyLEftGIYNcVrkaz5szmNasFETh2Ir0Xi5Q1g
 8xDwDUM/1ii9A==
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
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMjkvMTkgMzoyMyBBTSwgSmFuIEthcmEgd3JvdGU6Cj4gT24gTW9uIDI1LTExLTE5IDE1
OjEwOjMzLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+IDEuIENvbnZlcnQgZnJvbSBnZXRfdXNlcl9w
YWdlcygpIHRvIHBpbl91c2VyX3BhZ2VzKCkuCj4+Cj4+IDIuIEFzIHJlcXVpcmVkIGJ5IHBpbl91
c2VyX3BhZ2VzKCksIHJlbGVhc2UgdGhlc2UgcGFnZXMgdmlhCj4+IHB1dF91c2VyX3BhZ2UoKS4g
SW4gdGhpcyBjYXNlLCBkbyBzbyB2aWEgcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpLgo+Pgo+
PiBUaGF0IGhhcyB0aGUgc2lkZSBlZmZlY3Qgb2YgY2FsbGluZyBzZXRfcGFnZV9kaXJ0eV9sb2Nr
KCksIGluc3RlYWQKPj4gb2Ygc2V0X3BhZ2VfZGlydHkoKS4gVGhpcyBpcyBwcm9iYWJseSBtb3Jl
IGFjY3VyYXRlLgo+IAo+IE1heWJlIG1vcmUgYWNjdXJhdGUgYnV0IGl0IGRvZXNuJ3Qgd29yayBm
b3IgbW1faW9tbXVfdW5waW4oKS4gQXMgSSdtCj4gY2hlY2tpbmcgbW1faW9tbXVfdW5waW4oKSBn
ZXRzIGNhbGxlZCBmcm9tIFJDVSBjYWxsYmFjayB3aGljaCBpcyBleGVjdXRlZAo+IGludGVycnVw
dCBjb250ZXh0IGFuZCB5b3UgY2Fubm90IGxvY2sgcGFnZXMgZnJvbSBzdWNoIGNvbnRleHQuIFNv
IHlvdSBuZWVkCj4gdG8gcXVldWUgd29yayBmcm9tIHRoZSBSQ1UgY2FsbGJhY2sgYW5kIHRoZW4g
ZG8gdGhlIHJlYWwgd29yayBmcm9tIHRoZQo+IHdvcmtxdWV1ZS4uLgo+IAo+IAkJCQkJCQkJSG9u
emEKCmFoIHllcywgZml4ZWQgbG9jYWxseS4gKEluIG9yZGVyIHRvIGF2b2lkICBkaXN0cmFjdGlu
ZyBwZW9wbGUgZHVyaW5nIHRoZSBtZXJnZQp3aW5kb3csIEkgd29uJ3QgcG9zdCBhbnkgbW9yZSB2
ZXJzaW9ucyBvZiB0aGUgc2VyaWVzIHVudGlsIHRoZSBtZXJnZSB3aW5kb3cgaXMKb3ZlciwgdW5s
ZXNzIGEgbWFpbnRhaW5lciB0ZWxscyBtZSB0aGF0IGFueSBvZiB0aGVzZSBwYXRjaGVzIGFyZSBk
ZXNpcmVkIGZvcgo1LjUuKQoKV2l0aCB0aGF0LCB3ZSBhcmUgYmFjayB0byBhIG9uZS1saW5lIGRp
ZmYgZm9yIHRoaXMgcGFydDoKCkBAIC0yMTUsNyArMjE0LDcgQEAgc3RhdGljIHZvaWQgbW1faW9t
bXVfdW5waW4oc3RydWN0IG1tX2lvbW11X3RhYmxlX2dyb3VwX21lbV90ICptZW0pCiAgICAgICAg
ICAgICAgICAgaWYgKG1lbS0+aHBhc1tpXSAmIE1NX0lPTU1VX1RBQkxFX0dST1VQX1BBR0VfRElS
VFkpCiAgICAgICAgICAgICAgICAgICAgICAgICBTZXRQYWdlRGlydHkocGFnZSk7CiAgCi0gICAg
ICAgICAgICAgICBwdXRfcGFnZShwYWdlKTsKKyAgICAgICAgICAgICAgIHB1dF91c2VyX3BhZ2Uo
cGFnZSk7CiAgICAgICAgICAgICAgICAgbWVtLT5ocGFzW2ldID0gMDsKICAgICAgICAgfQogIH0K
CmJ0dywgSSdtIGFsc28gd29ya2luZyBvbiB5b3VyIGZlZWRiYWNrIGZvciBwYXRjaCAxNyAobW0v
Z3VwOiB0cmFjayBGT0xMX1BJTiBwYWdlcyBbMV0pLApmcm9tIGEgZmV3IGRheXMgZWFybGllciwg
aXQncyBub3QgYmVpbmcgaWdub3JlZCwgSSdtIGp1c3QgdHJ5aW5nIHRvIGF2b2lkIGRpc3RyYWN0
aW5nCnBlb3BsZSBkdXJpbmcgdGhlIG1lcmdlIHdpbmRvdy4KClsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMTkxMTIxMDkzOTQxLkdBMTgxOTBAcXVhY2syLnN1c2UuY3oKCnRoYW5rcywK
LS0gCkpvaG4gSHViYmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
