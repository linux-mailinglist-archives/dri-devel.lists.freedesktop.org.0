Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C086F105EC2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 03:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D213E6F4CC;
	Fri, 22 Nov 2019 02:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5F86F4CC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 02:56:51 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd74e740000>; Thu, 21 Nov 2019 18:56:52 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 Nov 2019 18:56:51 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 Nov 2019 18:56:51 -0800
Received: from [10.2.168.213] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 Nov
 2019 02:56:50 +0000
Subject: Re: [PATCH v7 02/24] mm/gup: factor out duplicate code from four
 routines
To: Jan Kara <jack@suse.cz>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-3-jhubbard@nvidia.com> <20191121080356.GA24784@lst.de>
 <852f6c27-8b65-547b-89e0-e8f32a4d17b9@nvidia.com>
 <20191121095411.GC18190@quack2.suse.cz>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <9d0846af-2c4f-7cda-dfcb-1f642943afea@nvidia.com>
Date: Thu, 21 Nov 2019 18:54:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191121095411.GC18190@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574391412; bh=qs/HIaIDAchvyMkQnxvFfFcxB81lObthoFNUVM9HFsU=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ea5W7/2c5vGNy7OLObdGvq5o0IpGBD08qzI9LgcD4V8BzKvR7hLDcVgsFBzIPWltE
 d8PXmpt/WgSDLuhJB1bSFzEA5jjhwY4dlcU7E+jQRx3TB5rkLOwlZyYegEL3tsBCr8
 8qN6mxRQSSTP+FNbJyR7Zo1HLIMkYFYKo0hlXeg0mt5hFKo6iVEhrdf4E8SgIeOW2y
 us/ORlXUDHvqcnaCH9l42SZAxDz+ZaaZrH8tpmFx0pDTmT79WYa//P0TZxa1PMT2Ec
 60tYwrFVvqZaHos2D7eAOKA1eeY7xDL9USjPj3cYeVVtnic4Fxyow9kLNCXK7YejUg
 or0Rt6li4HM5w==
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
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMjEvMTkgMTo1NCBBTSwgSmFuIEthcmEgd3JvdGU6Cj4gT24gVGh1IDIxLTExLTE5IDAw
OjI5OjU5LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+Pgo+Pj4gT3RoZXJ3aXNlIHRoaXMgbG9va3Mg
ZmluZSBhbmQgbWlnaHQgYmUgYSB3b3J0aHdoaWxlIGNsZWFudXAgdG8gZmVlZAo+Pj4gQW5kcmV3
IGZvciA1LjUgaW5kZXBlbmRlbnQgb2YgdGhlIGd1dCBvZiB0aGUgY2hhbmdlcy4KPj4+Cj4+PiBS
ZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4+Pgo+Pgo+PiBUaGFu
a3MgZm9yIHRoZSByZXZpZXdzISBTYXksIGl0IHNvdW5kcyBsaWtlIHlvdXIgdmlldyBoZXJlIGlz
IHRoYXQgdGhpcwo+PiBzZXJpZXMgc2hvdWxkIGJlIHRhcmdldGVkIGF0IDUuNiAobm90IDUuNSks
IGlzIHRoYXQgd2hhdCB5b3UgaGF2ZSBpbiBtaW5kPwo+PiBBbmQgZ2V0IHRoZSBwcmVwYXJhdG9y
eSBwYXRjaGVzICgxLTksIGFuZCBtYXliZSBldmVuIDEwLTE2KSBpbnRvIDUuNT8KPiAKPiBPbmUg
bW9yZSBub3RlIDopIElmIHlvdSBhcmUgZ29pbmcgdG8gcHVzaCBwaW5fdXNlcl9wYWdlcygpIGlu
dGVyZmFjZXMKPiAod2hpY2ggSSdtIGZpbmUgd2l0aCksIGl0IHdvdWxkIHByb2JhYmx5IG1ha2Ug
c2Vuc2UgdG8gcHVzaCBhbHNvIHRoZQo+IHB1dF91c2VyX3BhZ2VzKCkgLT4gdW5waW5fdXNlcl9w
YWdlcygpIHJlbmFtaW5nIHNvIHRoYXQgdGhhdCBpbmNvbnNpc3RlbmN5Cj4gaW4gbmFtaW5nIGRv
ZXMgbm90IGV4aXN0IGluIHRoZSByZWxlYXNlZCB1cHN0cmVhbSBrZXJuZWwuCj4gCj4gCQkJCQkJ
CQlIb256YQoKWWVzLCB0aGF0J3Mgd2hhdCB0aGlzIHBhdGNoIHNlcmllcyBkb2VzLiBCdXQgSSdt
IG5vdCBzdXJlIGlmICJwdXNoIiBoZXJlCm1lYW5zLCAicHVzaCBvdXQ6IGRlZmVyIHRvIDUuNiIs
ICJwdXNoIChub3cpIGludG8gNS41Iiwgb3IgImFkdm9jYXRlIGZvciI/CgpJIHdpbGwgbm90ZSB0
aGF0IGl0J3Mgbm90IGdvaW5nIHRvIGJlIGVhc3kgdG8gcmVuYW1lIGluIG9uZSBzdGVwLCBub3cK
dGhhdCB0aGlzIGlzIGJlaW5nIHNwbGl0IHVwLiBCZWNhdXNlIHZhcmlvdXMgcHV0X3VzZXJfcGFn
ZXMoKS1iYXNlZCBpdGVtcwphcmUgZ29pbmcgaW50byA1LjUgdmlhIGRpZmZlcmVudCBtYWludGFp
bmVyIHRyZWVzIG5vdy4gUHJvYmFibHkgSSdkIG5lZWQKdG8gaW50cm9kdWNlIHVucGluX3VzZXJf
cGFnZSgpIGFsb25nc2lkZSBwdXRfdXNlcl9wYWdlKCkuLi50aG91Z2h0cz8KCnRoYW5rcywKLS0g
CkpvaG4gSHViYmFyZApOVklESUEKICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
