Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78546F9FD4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 02:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6EF6E138;
	Wed, 13 Nov 2019 01:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1875F6E138
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 01:08:09 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb577a0001>; Tue, 12 Nov 2019 17:08:11 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 17:08:08 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 17:08:08 -0800
Received: from MacBook-Pro-10.local (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 01:08:07 +0000
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca>
 <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
 <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
 <20191112234250.GA19615@ziepe.ca>
 <CAPcyv4hwFKmsQpp04rS6diCmZwGtbnriCjfY2ofWV485qT9kzg@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <28355eb0-4ee5-3418-b430-59302d15b478@nvidia.com>
Date: Tue, 12 Nov 2019 17:08:07 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hwFKmsQpp04rS6diCmZwGtbnriCjfY2ofWV485qT9kzg@mail.gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573607291; bh=wl9HqaOmiz62D7VoXo7FjyMU54D3XRSGYP3F6kh9mOM=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=BVU7rtLSKH40gEcG6jSN5CiYgtuH0Fsti8jOVN/t2cAsa7Lm+CfaOZ/cPBpKb/4pw
 t2vrd447reb2cZaNtW1CrBBDCDSmRKvz10axjxdYouKdjIwayolxMRUvbWVZvRVnkG
 svn8sgOn4uKeOQZMstm5QEuB1y1OABbj5Qg0iRg3RASWgUP54Ma2UJ/YLgr8iKpjqC
 Mji+oXkSdbgJiidbxXQS/C9y8AEU32Ewa2NYrZGcfO6vFwup2ff4CZ6OIxWxJdqYtM
 ZNX94L/R/d+iS0MKljVZcNT6wxULepfnHo9F4Q3KqGJu8/w+Vf+0hpqV8JvGKGhjvb
 RkKNrnEIsYK7Q==
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
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, linux-block@vger.kernel.org,
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

T24gMTEvMTIvMTkgNDo1OCBQTSwgRGFuIFdpbGxpYW1zIHdyb3RlOgouLi4KPj4+IEl0J3Mgbm90
IHJlZHVuZGFudCByZWxhdGl2ZSB0byB1cHN0cmVhbSB3aGljaCBkb2VzIG5vdCBkbyBhbnl0aGlu
ZyB0aGUKPj4+IEZPTExfTE9OR1RFUk0gaW4gdGhlIGd1cC1zbG93IHBhdGguLi4gYnV0IEkgaGF2
ZSBub3QgbG9va2VkIGF0IHBhdGNoZXMKPj4+IDEtNyB0byBzZWUgaWYgc29tZXRoaW5nIHRoZXJl
IG1hZGUgaXQgcmVkdW5kYW50Lgo+Pgo+PiBPaCwgdGhlIGh1bmsgSm9obiBoYWQgYmVsb3cgZm9y
IGdldF91c2VyX3BhZ2VzX3JlbW90ZSgpIGFsc28gbmVlZHMgdG8KPj4gY2FsbCBfX2d1cF9sb25n
dGVybV9sb2NrZWQoKSB3aGVuIEZPTExfTE9OR1RFUk0gaXMgc3BlY2lmaWVkLCB0aGVuCj4+IHRo
YXQgY2FsbHMgY2hlY2tfZGF4X3ZtYXMoKSB3aGljaCBkdXBsaWNhdGVzIHRoZSB2bWFfaXNfZnNk
YXgoKSBjaGVjawo+PiBhYm92ZS4KPiAKPiBPaCB0cnVlLCBnb29kIGV5ZS4gSXQgaXMgcmVkdW5k
YW50IGlmIGl0IGRvZXMgYWRkaXRpb25hbGx5IGNhbGwKPiBfX2d1cF9sb25ndGVybV9sb2NrZWQo
KSwgYW5kIGl0IG5lZWRzIHRvIGRvIHRoYXQgb3RoZXJ3aXNlcyBpdCB1bmRvZXMKPiB0aGUgQ01B
IG1pZ3JhdGlvbiBtYWdpYyB0aGF0IEFuZWVzaCBhZGRlZC4KPiAKCk9LLiBTbyBqdXN0IHRvIGJl
IGNsZWFyLCBJJ2xsIGJlIHJlbW92aW5nIHRoaXMgZnJvbSB0aGUgcGF0Y2g6CgoJLyoKCSAqIFRo
ZSBsaWZldGltZSBvZiBhIHZhZGRyX2dldF9wZm4oKSBwYWdlIHBpbiBpcwoJICogdXNlcnNwYWNl
LWNvbnRyb2xsZWQuIEluIHRoZSBmcy1kYXggY2FzZSB0aGlzIGNvdWxkCgkgKiBsZWFkIHRvIGlu
ZGVmaW5pdGUgc3RhbGxzIGluIGZpbGVzeXN0ZW0gb3BlcmF0aW9ucy4KCSAqIERpc2FsbG93IGF0
dGVtcHRzIHRvIHBpbiBmcy1kYXggcGFnZXMgdmlhIHRoaXMKCSAqIGludGVyZmFjZS4KCSAqLwoJ
aWYgKHJldCA+IDAgJiYgdm1hX2lzX2ZzZGF4KHZtYXNbMF0pKSB7CgkJcmV0ID0gLUVPUE5PVFNV
UFA7CgkJcHV0X3BhZ2UocGFnZVswXSk7CiAgCX0KCihhbmQgdGhlIGRlY2xhcmF0aW9uIG9mICJ2
bWFzIiwgYXMgd2VsbCkuCgp0aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
