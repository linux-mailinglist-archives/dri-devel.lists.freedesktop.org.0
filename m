Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EEAF05F4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 20:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DBC6EB61;
	Tue,  5 Nov 2019 19:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE0D6EB4E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 19:00:08 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc1c6bc0000>; Tue, 05 Nov 2019 11:00:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 05 Nov 2019 11:00:07 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 05 Nov 2019 11:00:07 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Nov
 2019 19:00:07 +0000
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: Mike Rapoport <rppt@kernel.org>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-6-jhubbard@nvidia.com>
 <20191105131032.GG25005@rapoport-lnx>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <9ac948a4-59bf-2427-2007-e460aad2848a@nvidia.com>
Date: Tue, 5 Nov 2019 11:00:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191105131032.GG25005@rapoport-lnx>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Tue, 05 Nov 2019 19:26:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572980412; bh=ojXJL7Jf2vtMqYP0b7gLz2fp+ItJt4NPdkhylbujo04=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=BS0Skgz5RbNv7FRT3SjRhdwpwr0ecQ8AOgMazMsduNtoC93TjDB3sb+UV4BVm8kS1
 e2YIxx2R9GvEAZtEOkrlW3cAbcdFl/wyRSANMj//120w5PZgTkX7MC1O13jzRSXm0k
 KFRmKs+Z0OYFmlbRMapMiylU4RVjtXOt6K/rgWvnwLDQgPciqV1nCOSRX3qgMUJrsh
 MPxa2/es4pKZhwzhaTFebsG3i4fLxzYnNXRQBChEYKYp2xONV3pwMnS3x1UJtQUm9p
 dbWIIJyjFTTd1aKcwIBzPf2GKUh34tHy3QJ9j5720Clm3FqPmta2g3ZZa8fKcxJoAO
 rGK6L5pnX3YOQ==
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

T24gMTEvNS8xOSA1OjEwIEFNLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgouLi4KPj4gLS0tCj4+ICBE
b2N1bWVudGF0aW9uL3ZtL2luZGV4LnJzdCAgICAgICAgICB8ICAgMSArCj4+ICBEb2N1bWVudGF0
aW9uL3ZtL3Bpbl91c2VyX3BhZ2VzLnJzdCB8IDIxMiArKysrKysrKysrKysrKysrKysrKysrCj4g
Cj4gSSB0aGluayBpdCBiZWxvbmdzIHRvIERvY3VtZW50YXRpb24vY29yZS1hcGkuCgpEb25lOgoK
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vY29yZS1hcGkvaW5kZXgucnN0IGIvRG9jdW1lbnRh
dGlvbi9jb3JlLWFwaS9pbmRleC5yc3QKaW5kZXggYWIwZWFlMWMxNTNhLi40MTNmN2Q3Yzg2NDIg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vY29yZS1hcGkvaW5kZXgucnN0CisrKyBiL0RvY3Vt
ZW50YXRpb24vY29yZS1hcGkvaW5kZXgucnN0CkBAIC0zMSw2ICszMSw3IEBAIENvcmUgdXRpbGl0
aWVzCiAgICBnZW5lcmljLXJhZGl4LXRyZWUKICAgIG1lbW9yeS1hbGxvY2F0aW9uCiAgICBtbS1h
cGkKKyAgIHBpbl91c2VyX3BhZ2VzCiAgICBnZnBfbWFzay1mcm9tLWZzLWlvCiAgICB0aW1la2Vl
cGluZwogICAgYm9vdC10aW1lLW1tCgoKLi4uCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L3ZtL3Bpbl91c2VyX3BhZ2VzLnJzdCBiL0RvY3VtZW50YXRpb24vdm0vcGluX3VzZXJfcGFnZXMu
cnN0Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzkxMGY0
OWNhOThjCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi92bS9waW5fdXNl
cl9wYWdlcy5yc3QKPj4gQEAgLTAsMCArMSwyMTIgQEAKPj4gKy4uIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wCj4+ICsKPj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KPj4gK3Bpbl91c2VyX3BhZ2VzKCkgYW5kIHJlbGF0ZWQgY2Fs
bHMKPj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KPiAKPiBJIGtub3cgdGhpcyBpcyB0b28gbXVjaCB0byBhc2ssIGJ1dCBoYXZpbmcgcGluX3Vz
ZXJfcGFnZXMoKSBhIHBhcnQgb2YgbW9yZQo+IGdlbmVyYWwgR1VQIGRlc2NyaXB0aW9uIHdvdWxk
IGJlIHJlYWxseSBncmVhdCA6KQo+IAoKWWVzLCBkZWZpbml0ZWx5LiBCdXQgdW50aWwgSSBzYXcg
dGhlIHJlYWN0aW9uIHRvIHRoZSBwaW5fdXNlcl9wYWdlcygpIEFQSQpmYW1pbHksIEkgZGlkbid0
IHdhbnQgdG8gd3JpdGUgdG9vIG11Y2gtLWl0IGNvdWxkIGhhdmUgYWxsIGJlZW4gdG9zc2VkIG91
dAppbiBmYXZvciBvZiBhIHdob2xlIGRpZmZlcmVudCBBUEkuIEJ1dCBub3cgdGhhdCB3ZSd2ZSBo
YWQgc29tZSBpbml0aWFsCnJldmlld3MsIEknbSBtdWNoIG1vcmUgY29uZmlkZW50IGluIGJlaW5n
IGFibGUgdG8gd3JpdGUgYWJvdXQgdGhlIGxhcmdlciAKQVBJIHNldC4KClNvIHllcywgSSdsbCBw
dXQgdGhhdCBvbiBteSBwZW5kaW5nIGxpc3QuCgoKLi4uCj4+ICtUaGlzIGRvY3VtZW50IGRlc2Ny
aWJlcyB0aGUgZm9sbG93aW5nIGZ1bmN0aW9uczogOjoKPj4gKwo+PiArIHBpbl91c2VyX3BhZ2Vz
Cj4+ICsgcGluX3VzZXJfcGFnZXNfZmFzdAo+PiArIHBpbl91c2VyX3BhZ2VzX3JlbW90ZQo+PiAr
Cj4+ICsgcGluX2xvbmd0ZXJtX3BhZ2VzCj4+ICsgcGluX2xvbmd0ZXJtX3BhZ2VzX2Zhc3QKPj4g
KyBwaW5fbG9uZ3Rlcm1fcGFnZXNfcmVtb3RlCj4+ICsKPj4gK0Jhc2ljIGRlc2NyaXB0aW9uIG9m
IEZPTExfUElOCj4+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+PiArCj4+ICtBIG5l
dyBmbGFnIGZvciBnZXRfdXNlcl9wYWdlcyAoImd1cCIpIGhhcyBiZWVuIGFkZGVkOiBGT0xMX1BJ
Ti4gRk9MTF9QSU4gaGFzCj4gCj4gQ29uc2lkZXIgcmVhZGluZyB0aGlzIGFmdGVyLCBzYXksIGhh
bGYgYSB5ZWFyIDstKQo+IAoKT0ssIE9LLiBJIGtuZXcgd2hlbiBJIHdyb3RlIHRoYXQgdGhhdCBp
dCB3YXMgbm90IGdvaW5nIHRvIHN0YXkgbmV3IGZvcmV2ZXIsIGJ1dApzb21laG93IGZhaWxlZCB0
byB3cml0ZSB0aGUgcmlnaHQgdGhpbmcgYW55d2F5LiA6KSAKCkhlcmUncyBhIHJldmlzZWQgc2V0
IG9mIHBhcmFncmFwaHM6CgpCYXNpYyBkZXNjcmlwdGlvbiBvZiBGT0xMX1BJTgo9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQoKRk9MTF9QSU4gYW5kIEZPTExfTE9OR1RFUk0gYXJlIGZsYWdz
IHRoYXQgY2FuIGJlIHBhc3NlZCB0byB0aGUgZ2V0X3VzZXJfcGFnZXMqKCkKKCJndXAiKSBmYW1p
bHkgb2YgZnVuY3Rpb25zLiBGT0xMX1BJTiBoYXMgc2lnbmlmaWNhbnQgaW50ZXJhY3Rpb25zIGFu
ZAppbnRlcmRlcGVuZGVuY2llcyB3aXRoIEZPTExfTE9OR1RFUk0sIHNvIGJvdGggYXJlIGNvdmVy
ZWQgaGVyZS4KCkJvdGggRk9MTF9QSU4gYW5kIEZPTExfTE9OR1RFUk0gYXJlIGludGVybmFsIHRv
IGd1cCwgbWVhbmluZyB0aGF0IG5laXRoZXIKRk9MTF9QSU4gbm9yIEZPTExfTE9OR1RFUk0gc2hv
dWxkIG5vdCBhcHBlYXIgYXQgdGhlIGd1cCBjYWxsIHNpdGVzLiBUaGlzIGFsbG93cwp0aGUgYXNz
b2NpYXRlZCB3cmFwcGVyIGZ1bmN0aW9ucyAgKHBpbl91c2VyX3BhZ2VzKCkgYW5kIG90aGVycykg
dG8gc2V0IHRoZQpjb3JyZWN0IGNvbWJpbmF0aW9uIG9mIHRoZXNlIGZsYWdzLCBhbmQgdG8gY2hl
Y2sgZm9yIHByb2JsZW1zIGFzIHdlbGwuCgoKdGhhbmtzLAoKSm9obiBIdWJiYXJkCk5WSURJQQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
