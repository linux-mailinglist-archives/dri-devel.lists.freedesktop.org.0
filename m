Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69146EBEF6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA666F773;
	Fri,  1 Nov 2019 08:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDA46F69B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 23:53:40 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dbb74090000>; Thu, 31 Oct 2019 16:53:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 31 Oct 2019 16:53:40 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 31 Oct 2019 16:53:40 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 31 Oct
 2019 23:53:39 +0000
Subject: Re: [PATCH 19/19] Documentation/vm: add pin_user_pages.rst
To: Ira Weiny <ira.weiny@intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-20-jhubbard@nvidia.com>
 <20191031234922.GM14771@iweiny-DESK2.sc.intel.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <85de5845-d403-dc31-4f3b-f006c4a7b2a2@nvidia.com>
Date: Thu, 31 Oct 2019 16:53:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191031234922.GM14771@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572566026; bh=vjWEFq7fNfPLFBVwJSkbaC93kNFVP4oSS83LfHWMvq4=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=huUn94OR5NVpnI/NdJ3vTkz0Aags6KkZKFci9Fz5nHWE/pFd85Cktt11D1CQUWnOi
 UTPR4qv0QPFgv/ONDQLcPNmALzbnAKqxnplv+MLSg0Lt5g7PakxG9E1PUBNwTzA4dg
 k5IpEf3tN9qoIDtETnu//UzIRidkW3Ptv7qB5nHQktouL6xNQxT4kKgi3v8i+IvKdv
 ffAJkGbaVSplOPwrv6cDHUyGv5RC9JGCEhmv/YdTyy6OAb8LAtR2JiVi7nJzrIOI/o
 Ji4iiKunwQFUjG8sIvZShB4w9wwsMfCPKf36InyfzANf6JSqnPhJXe3qBOy7AOjUTp
 IqJ2SDnd3CyHg==
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
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
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

T24gMTAvMzEvMTkgNDo0OSBQTSwgSXJhIFdlaW55IHdyb3RlOgo+IE9uIFdlZCwgT2N0IDMwLCAy
MDE5IGF0IDAzOjQ5OjMwUE0gLTA3MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKPj4gRG9jdW1lbnQg
dGhlIG5ldyBwaW5fdXNlcl9wYWdlcygpIGFuZCByZWxhdGVkIGNhbGxzCj4+IGFuZCBiZWhhdmlv
ci4KPj4KPj4gVGhhbmtzIHRvIEphbiBLYXJhIGFuZCBWbGFzdGltaWwgQmFia2EgZm9yIGV4cGxh
aW5pbmcgdGhlIDQgY2FzZXMKPj4gaW4gdGhpcyBkb2N1bWVudGF0aW9uLiAoSSd2ZSByZXdvcmRl
ZCBpdCBhbmQgZXhwYW5kZWQgb24gaXQgc2xpZ2h0bHkuKQo+IAo+IEFzIEkgc2FpZCBiZWZvcmUg
SSB0aGluayB0aGlzIG1heSBiZSBiZXR0ZXIgaW4gYSBwcmV2aW91cyBwYXRjaCB3aGVyZSB5b3UK
PiByZWZlcmVuY2UgaXQuCgpZZXMsIEknbGwgbWVyZ2UgdGhpcyBpbiB3aXRoIHBhdGNoICM1ICgi
bW0vZ3VwOiBpbnRyb2R1Y2UgcGluX3VzZXJfcGFnZXMqKCkKYW5kIEZPTExfUElOIikuCgouLi4K
Pj4gK1RPRE86IFRoZXJlIGlzIGFsc28gYSBzcGVjaWFsIGNhc2Ugd2hlbiB0aGUgcGFnZXMgYXJl
IERBWCBwYWdlczogaW4gYWRkaXRpb24gdG8KPj4gK3RoZSBhYm92ZSBmbGFncywgdGhlIGNhbGxl
ciBuZWVkcyBzb21ldGhpbmcgbGlrZSBhIGxheW91dCBsZWFzZSBvbiB0aGUKPj4gK2Fzc29jaWF0
ZWQgZmlsZS4gVGhpcyBpcyB5ZXQgdG8gYmUgaW1wbGVtZW50ZWQuIFdoZW4gaXQgaXMgaW1wbGVt
ZW50ZWQsIGl0J3MKPj4gK2V4cGVjdGVkIHRoYXQgdGhlIGxlYXNlIHdpbGwgYmUgYSBwcmVyZXF1
aXNpdGUgdG8gc2V0dGluZyBGT0xMX0xPTkdURVJNLgo+IAo+IEZvciBub3cgd2UgcHJvYmFibHkg
d2FudCB0byBsZWF2ZSB0aGlzIG5vdGUgb3V0IHVudGlsIHdlIGZpZ3VyZSBvdXQgaG93IHRoaXMg
aXMKPiBnb2luZyB0byB3b3JrLiAgQmVzdCB0byBzYXkgc29tZXRoaW5nIGxpa2U6Cj4gCj4gU29t
ZSBwYWdlcywgc3VjaCBhcyBEQVggcGFnZXMsIGNhbid0IGJlIHBpbm5lZCB3aXRoIGxvbmd0ZXJt
IHBpbnMgYW5kIHdpbGwKPiBmYWlsLgo+IAoKT0ssIHRoYXQgaXMgYmV0dGVyLCBJJ2xsIHVzZSB0
aGF0IGluc3RlYWQgb2YgdGhlICJUT0RPIi4KCgp0aGFua3MsCgpKb2huIEh1YmJhcmQKTlZJRElB
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
