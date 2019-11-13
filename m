Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11574FB9D7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 21:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8726E06D;
	Wed, 13 Nov 2019 20:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3937D6E06D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 20:30:49 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcc67fb0000>; Wed, 13 Nov 2019 12:30:51 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 12:30:48 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 12:30:48 -0800
Received: from [10.2.160.107] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 20:30:47 +0000
Subject: Re: [PATCH v3 00/23] mm/gup: track dma-pinned pages: FOLL_PIN,
 FOLL_LONGTERM
To: Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton
 <akpm@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, Alex
 Williamson <alex.williamson@redhat.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn.topel@intel.com>, Christoph Hellwig <hch@infradead.org>, Dan Williams
 <dan.j.williams@intel.com>, Dave Chinner <david@fromorbit.com>, David Airlie
 <airlied@linux.ie>, "David S . Miller" <davem@davemloft.net>, Ira Weiny
 <ira.weiny@intel.com>, Jens Axboe <axboe@kernel.dk>, Jonathan Corbet
 <corbet@lwn.net>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko
 <mhocko@suse.com>, Mike Kravetz <mike.kravetz@oracle.com>, Paul Mackerras
 <paulus@samba.org>, Shuah Khan <shuah@kernel.org>, Vlastimil Babka
 <vbabka@suse.cz>, bpf <bpf@vger.kernel.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, <kvm@vger.kernel.org>,
 <linux-block@vger.kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>, "open
 list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, "open
 list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 netdev <netdev@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, LKML
 <linux-kernel@vger.kernel.org>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112203802.GD5584@ziepe.ca>
 <02fa935c-3469-b766-b691-5660084b60b9@nvidia.com>
 <CAKMK7uHvk+ti00mCCF2006U003w1dofFg9nSfmZ4bS2Z2pEDNQ@mail.gmail.com>
 <7b671bf9-4d94-f2cc-8453-863acd5a1115@nvidia.com>
 <20191113101210.GD6367@quack2.suse.cz>
 <20191113114311.GP23790@phenom.ffwll.local>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <283b121d-f526-f43f-de45-dc2f8318d860@nvidia.com>
Date: Wed, 13 Nov 2019 12:28:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191113114311.GP23790@phenom.ffwll.local>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573677051; bh=w2mV+XepuxnOtihiYgL/XuqwUYU2QI7jYfF/MppVAWE=;
 h=X-PGP-Universal:Subject:To:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=K3ELKy0LEaE4Frm6QQ4jLw8cJF3zobatTYiyQ/Vg2jO630IkqTksnY4sEeXMrgt5a
 b46qAh7TsgPVJKCPcTPIoUnjxNn6h2xUdpivOkXuz3queuSeoxqaSFBxc3yHdAdKf1
 weqLMTvKu8Vs4tf6la1SbXQc5ZvBvuc6pK240FvHmEYJ0o2WePNqZANag+FSCa5U1i
 2iyzSKadjF0T/uRVrR4KM4Ey20Bg7sJaaQBcaSS9Pr1q7odGMaBmeJ4hRBriIHKA4P
 1LTpfohPn7iHAuSCtXbApQkiiVLKyUBXMKbsJDCLOd3JNZEji1iUk1dM5atghZtAzC
 EJVJspvV4f3sw==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTMvMTkgMzo0MyBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKLi4uCj4+Pj4gQ2FuJ3Qg
d2UgY2FsbCB0aGlzIHVucGluX3VzZXJfcGFnZSB0aGVuLCBmb3Igc29tZSBzeW1tZXRyeT8gT3Ig
aXMgdGhhdAo+Pj4+IGV2ZW4gbW9yZSBjaHVybj8KPj4+Pgo+Pj4+IExvb2tpbmcgZnJvbSBhZmFy
IHRoZSBuYW1pbmcgaGVyZSBzZWVtcyByZWFsbHkgY29uZnVzaW5nLgo+Pj4KPj4+Cj4+PiBUaGF0
IGxvb2sgZnJvbSBhZmFyIGlzIHZhbHVhYmxlLCBiZWNhdXNlIEknbSB0b28gY2xvc2UgdG8gdGhl
IHByb2JsZW0gdG8gc2VlCj4+PiBob3cgdGhlIG5hbWluZyBsb29rcy4gOikKPj4+Cj4+PiB1bnBp
bl91c2VyX3BhZ2UoKSBzb3VuZHMgc3ltbWV0cmljYWwuIEl0J3MgdHJ1ZSB0aGF0IGl0IHdvdWxk
IGNhdXNlIG1vcmUKPj4+IGNodXJuICh3aGljaCBpcyB3aHkgSSBzdGFydGVkIG9mZiB3aXRoIGEg
cHJvcG9zYWwgdGhhdCBhdm9pZHMgY2hhbmdpbmcgdGhlCj4+PiBuYW1lcyBvZiBwdXRfdXNlcl9w
YWdlKigpIEFQSXMpLiBCdXQgT1RPSCwgdGhlIGFtb3VudCBvZiBjaHVybiBpcyBwcm9wb3J0aW9u
YWwKPj4+IHRvIHRoZSBjaGFuZ2UgaW4gZGlyZWN0aW9uIGhlcmUsIGFuZCBpdCdzIHJlYWxseSBv
bmx5IDEwIG9yIDIwIGxpbmVzIGNoYW5nZWQsCj4+PiBpbiB0aGUgZW5kLgo+Pj4KPj4+IFNvIEkn
bSBvcGVuIHRvIGNoYW5naW5nIHRvIHRoYXQgbmFtaW5nLiBJdCB3b3VsZCBiZSBuaWNlIHRvIGhl
YXIgd2hhdCBvdGhlcnMKPj4+IHByZWZlciwgdG9vLi4uCj4+Cj4+IEZXSVcgSSdkIGZpbmQgdW5w
aW5fdXNlcl9wYWdlKCkgYWxzbyBiZXR0ZXIgdGhhbiBwdXRfdXNlcl9wYWdlKCkgYXMgYQo+PiBj
b3VudGVycGFydCB0byBwaW5fdXNlcl9wYWdlcygpLgo+IAo+IE9uZSBtb3JlIHBvaW50IGZyb20g
YWZhciBvbiBwaW4vdW5waW46IFdlIHVzZSB0aGF0IGEgbG90IGluIGdyYXBoaWNzIGZvcgo+IHBl
cm1hbmVudGx5IHBpbm5lZCBncmFwaGljcyBidWZmZXIgb2JqZWN0cy4gV2hpY2ggcmVhbGx5IG9u
bHkgc2hvdWxkIGJlCj4gdXNlZCBmb3Igc2Nhbm91dC4gU28gYXQgbGVhc3QgZ3JhcGhpY3MgZm9s
a3Mgc2hvdWxkIGhhdmUgYW4gYXBwcm9wcmlhdGUKPiBtaW5kc2V0IGFuZCB0cnkgdG8gbWFrZSBz
dXJlIHdlIGRvbid0IG92ZXJ1c2UgdGhpcyBzdHVmZi4KPiAtRGFuaWVsCj4gCgpPSywgSXJhIGFs
c28gbGlrZXMgInVucGluIiwgYW5kIHNvIGZhciBubyBvbmUgaGFzIHNhaWQgKmFueXRoaW5nKiBp
biBmYXZvcgpvZiB0aGUgInB1dF91c2VyX3BhZ2UiIG5hbWVzLCBzbyBJIHRoaW5rIHdlIGhhdmUg
YSB3aW5uZXIhIEknbGwgY2hhbmdlIHRoZQpuYW1lcyB0byB1bnBpbl91c2VyX3BhZ2UqKCkuCgoK
dGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
