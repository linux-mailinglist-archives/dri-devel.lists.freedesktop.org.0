Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CBA105C51
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 22:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AE06E1B4;
	Thu, 21 Nov 2019 21:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956D16E1B4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 21:52:30 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd707210000>; Thu, 21 Nov 2019 13:52:33 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 Nov 2019 13:52:30 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 Nov 2019 13:52:30 -0800
Received: from [10.2.168.213] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 21:52:28 +0000
Subject: Re: [PATCH v7 09/24] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Alex Williamson <alex.williamson@redhat.com>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-10-jhubbard@nvidia.com>
 <20191121143525.50deb72f@x1.home>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <b5ae788a-58a9-de93-f65e-e4d9c0632dc9@nvidia.com>
Date: Thu, 21 Nov 2019 13:49:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191121143525.50deb72f@x1.home>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574373153; bh=oGhbv3cXo8o4GZ8PnxP5Ux4y8AE3jGJR4EeVDVjoVEc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=KYGZRjKvtxip9P6ifb3Te8PpgvFSTRruWhwxOgXb0S114oVSZskeO+iOWdCneQvB4
 NA5CKwViDqqMCzmcEtuXOzx5kWlGm/CdhdbD7x7k9Kx6Vh5kQFWAggEn8hm5nSetjo
 GsuEs2bguAasb3kn7+569g/s+OYwxg2N/laFgRqUcYIkUaXO+dKZ1vX7QBvKE7iuhN
 xdX8E7mSGSvk8taZzTl3l1tHACe5K5QgYBxfNvJAXLPet5p3Tx/OKYiHGukBzXFPA8
 pg/kE+aDZRuWuc8KSGeIQ8zVRFi/6q/Cd2RICjjhHLzCf4ZbZMZG9XJoZELTlTOned
 7+K+fSUD3HTWw==
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jason Gunthorpe <jgg@mellanox.com>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMjEvMTkgMTozNSBQTSwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+IE9uIFdlZCwgMjAg
Tm92IDIwMTkgMjM6MTM6MzkgLTA4MDAKPiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5j
b20+IHdyb3RlOgo+IAo+PiBBcyBpdCBzYXlzIGluIHRoZSB1cGRhdGVkIGNvbW1lbnQgaW4gZ3Vw
LmM6IGN1cnJlbnQgRk9MTF9MT05HVEVSTQo+PiBiZWhhdmlvciBpcyBpbmNvbXBhdGlibGUgd2l0
aCBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZIGJlY2F1c2Ugb2YgdGhlCj4+IEZTIERBWCBjaGVjayBy
ZXF1aXJlbWVudCBvbiB2bWFzLgo+Pgo+PiBIb3dldmVyLCB0aGUgY29ycmVzcG9uZGluZyByZXN0
cmljdGlvbiBpbiBnZXRfdXNlcl9wYWdlc19yZW1vdGUoKSB3YXMKPj4gc2xpZ2h0bHkgc3RyaWN0
ZXIgdGhhbiBpcyBhY3R1YWxseSByZXF1aXJlZDogaXQgZm9yYmFkZSBhbGwKPj4gRk9MTF9MT05H
VEVSTSBjYWxsZXJzLCBidXQgd2UgY2FuIGFjdHVhbGx5IGFsbG93IEZPTExfTE9OR1RFUk0gY2Fs
bGVycwo+PiB0aGF0IGRvIG5vdCBzZXQgdGhlICJsb2NrZWQiIGFyZy4KPj4KPj4gVXBkYXRlIHRo
ZSBjb2RlIGFuZCBjb21tZW50cyBhY2NvcmRpbmdseSwgYW5kIHVwZGF0ZSB0aGUgVkZJTyBjYWxs
ZXIKPj4gdG8gdGFrZSBhZHZhbnRhZ2Ugb2YgdGhpcywgZml4aW5nIGEgYnVnIGFzIGEgcmVzdWx0
OiB0aGUgVkZJTyBjYWxsZXIKPj4gaXMgbG9naWNhbGx5IGEgRk9MTF9MT05HVEVSTSB1c2VyLgo+
Pgo+PiBBbHNvLCByZW1vdmUgYW4gdW5uZXNzYXJ5IHBhaXIgb2YgY2FsbHMgdGhhdCB3ZXJlIHJl
bGVhc2luZyBhbmQKPj4gcmVhY3F1aXJpbmcgdGhlIG1tYXBfc2VtLiBUaGVyZSBpcyBubyBuZWVk
IHRvIGF2b2lkIGhvbGRpbmcgbW1hcF9zZW0KPj4ganVzdCBpbiBvcmRlciB0byBjYWxsIHBhZ2Vf
dG9fcGZuKCkuCj4+Cj4+IEFsc28sIG1vdmUgdGhlIERBWCBjaGVjayAoImlmIGEgVk1BIGlzIERB
WCwgZG9uJ3QgYWxsb3cgbG9uZyB0ZXJtCj4+IHBpbm5pbmciKSBmcm9tIHRoZSBWRklPIGNhbGwg
c2l0ZSwgYWxsIHRoZSB3YXkgaW50byB0aGUgaW50ZXJuYWxzCj4+IG9mIGdldF91c2VyX3BhZ2Vz
X3JlbW90ZSgpIGFuZCBfX2d1cF9sb25ndGVybV9sb2NrZWQoKS4gVGhhdCBpczoKPj4gZ2V0X3Vz
ZXJfcGFnZXNfcmVtb3RlKCkgY2FsbHMgX19ndXBfbG9uZ3Rlcm1fbG9ja2VkKCksIHdoaWNoIGlu
IHR1cm4KPj4gY2FsbHMgY2hlY2tfZGF4X3ZtYXMoKS4gSXQncyBsaWdodGx5IGV4cGxhaW5lZCBp
biB0aGUgY29tbWVudHMgYXMgd2VsbC4KPj4KPj4gVGhhbmtzIHRvIEphc29uIEd1bnRob3JwZSBm
b3IgcG9pbnRpbmcgb3V0IGEgY2xlYW4gd2F5IHRvIGZpeCB0aGlzLAo+PiBhbmQgdG8gRGFuIFdp
bGxpYW1zIGZvciBoZWxwaW5nIGNsYXJpZnkgdGhlIERBWCByZWZhY3RvcmluZy4KPj4KPj4gUmV2
aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPj4gUmV2aWV3ZWQt
Ynk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KPj4gU3VnZ2VzdGVkLWJ5OiBKYXNv
biBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KPj4gQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2ls
bGlhbXNAaW50ZWwuY29tPgo+PiBDYzogSmVyb21lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29t
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4+
IC0tLQo+PiAgIGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCAzMCArKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gICBtbS9ndXAuYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgMjcgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAy
NyBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKPiAKPiBUZXN0ZWQgd2l0aCBkZXZpY2Ug
YXNzaWdubWVudCBhbmQgSW50ZWwgbWRldiB2R1BVIGFzc2lnbm1lbnQgd2l0aCBRRU1VCj4gdXNl
cnNwYWNlOgo+IAo+IFRlc3RlZC1ieTogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25A
cmVkaGF0LmNvbT4KPiBBY2tlZC1ieTogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25A
cmVkaGF0LmNvbT4KPiAKPiBGZWVsIGZyZWUgdG8gaW5jbHVkZSBmb3IgMTkvMjQgYXMgd2VsbC4g
IFRoYW5rcywKPiAKPiBBbGV4CgoKR3JlYXQhIFRoYW5rcyBmb3IgdGhlIHRlc3RpbmcgYW5kIGFj
ayBvbiB0aG9zZS4gSSdtIGFib3V0IHRvIHJlcGFja2FnZQooYW5kIHNwbGl0IHVwIGFzIENIIHJl
cXVlc3RlZCkgZm9yIDUuNSwgYW5kIHdpbGwga2VlcCB5b3Ugb24gQ0MsIG9mIGNvdXJzZS4KCnRo
YW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
