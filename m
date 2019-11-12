Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15B5F9DFD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 00:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3559892A0;
	Tue, 12 Nov 2019 23:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BAB6EC27
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 23:17:23 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb3d4b0000>; Tue, 12 Nov 2019 15:16:27 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 15:17:23 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 15:17:23 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 23:17:22 +0000
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Dan Williams <dan.j.williams@intel.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca>
 <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
 <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <85987617-9f6b-6bd3-fea2-9f2910d942bd@nvidia.com>
Date: Tue, 12 Nov 2019 15:17:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573600587; bh=MjC1bPxvrMSKZyR0vfIkph3DH21vc9F8lPoYeam7DCg=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=p3qYKNzVf+yoWXVxXvdWjvLLch3+eBgZBZPzM5iL19+w8RiUo7ZDiZ6gW1HFxWncA
 +kkprqimeUO8SSqHdah/r3BwJo4tDay3qaFNXlfKQCKgL2mn5vpeQtNa9DXVDSKAs9
 R4vcNKCywQ8SHP3DUh8n5njcCPN6pw3P07lAmh8mqH74Fvgl1XHO+C/rjd/05WqSfr
 CbI8v19uMzgduDq6l5KCW1YAmvvVqDA87KUBJVym8vf0Kv0kKAaenl3Op2+6yladeP
 PH6kHbkLvI9QcVfTqnjU+9eG71rPYcWHuFxhGzrL4Y4JAkS0eHU4rmGDiCKR0r+10R
 ZzG6cdcgSU6Ww==
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
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTIvMTkgMjo0NSBQTSwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+IE9uIFR1ZSwgTm92IDEy
LCAyMDE5IGF0IDI6NDMgUE0gSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPiB3cm90
ZToKPj4KPj4gT24gMTEvMTIvMTkgMTI6NDMgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4g
Li4uCj4+Pj4gLSAgICAgICAgICAgIH0KPj4+PiArICAgIHJldCA9IGdldF91c2VyX3BhZ2VzX3Jl
bW90ZShOVUxMLCBtbSwgdmFkZHIsIDEsIGZsYWdzIHwgRk9MTF9MT05HVEVSTSwKPj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlLCB2bWFzLCBOVUxMKTsKPj4+PiArICAg
IC8qCj4+Pj4gKyAgICAgKiBUaGUgbGlmZXRpbWUgb2YgYSB2YWRkcl9nZXRfcGZuKCkgcGFnZSBw
aW4gaXMKPj4+PiArICAgICAqIHVzZXJzcGFjZS1jb250cm9sbGVkLiBJbiB0aGUgZnMtZGF4IGNh
c2UgdGhpcyBjb3VsZAo+Pj4+ICsgICAgICogbGVhZCB0byBpbmRlZmluaXRlIHN0YWxscyBpbiBm
aWxlc3lzdGVtIG9wZXJhdGlvbnMuCj4+Pj4gKyAgICAgKiBEaXNhbGxvdyBhdHRlbXB0cyB0byBw
aW4gZnMtZGF4IHBhZ2VzIHZpYSB0aGlzCj4+Pj4gKyAgICAgKiBpbnRlcmZhY2UuCj4+Pj4gKyAg
ICAgKi8KPj4+PiArICAgIGlmIChyZXQgPiAwICYmIHZtYV9pc19mc2RheCh2bWFzWzBdKSkgewo+
Pj4+ICsgICAgICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsKPj4+PiArICAgICAgICAgICAgcHV0
X3BhZ2UocGFnZVswXSk7Cj4+Pj4gICAgICB9Cj4+Pgo+Pj4gQUZBSUsgdGhpcyBjaHVuayBpcyBy
ZWR1bmRhbnQgbm93IGFzIGl0IGlzIHNvbWUgaGFjayB0byBlbXVsYXRlCj4+PiBGT0xMX0xPTkdU
RVJNPyBTbyB2bWFzIGNhbiBiZSBkZWxldGVkIHRvby4KPj4KPj4gTGV0IG1lIGZpcnN0IG1ha2Ug
c3VyZSBJIHVuZGVyc3RhbmQgd2hhdCBEYW4gaGFzIGluIG1pbmQgZm9yIHRoZSB2bWEKPj4gY2hl
Y2tpbmcsIGluIHRoZSBvdGhlciB0aHJlYWQuLi4KPiAKPiBJdCdzIG5vdCByZWR1bmRhbnQgcmVs
YXRpdmUgdG8gdXBzdHJlYW0gd2hpY2ggZG9lcyBub3QgZG8gYW55dGhpbmcgdGhlCj4gRk9MTF9M
T05HVEVSTSBpbiB0aGUgZ3VwLXNsb3cgcGF0aC4uLiBidXQgSSBoYXZlIG5vdCBsb29rZWQgYXQg
cGF0Y2hlcwo+IDEtNyB0byBzZWUgaWYgc29tZXRoaW5nIHRoZXJlIG1hZGUgaXQgcmVkdW5kYW50
Lgo+IAoKVGhlcmUgaXMgbm90aGluZyBpbiBwYXRjaGVzIDEtNyB0aGF0IHdvdWxkIG1ha2UgaXQg
cmVkdW5kYW50LiAKCkFib3V0IHRoZSBvbmx5IHRoaW5nIHRoYXQgeW91IG1pZ2h0IGZpbmQgaW50
ZXJlc3RpbmcgaW4gdGhhdCBzdWJzZXQgaXMKcGF0Y2ggNCAoIm1tOiBkZXZtYXA6IHJlZmFjdG9y
IDEtYmFzZWQgcmVmY291bnRpbmcgZm9yIFpPTkVfREVWSUNFIHBhZ2VzIiksCmZvciBkZXZtYXAg
YW5kIFpPTkVfREVWSUNFIGludGVyZXN0LiBCdXQgaXQgZG9lc24ndCBhZmZlY3QgdGhpcwpkaXNj
dXNzaW9uIGRpcmVjdGx5LgoKCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
