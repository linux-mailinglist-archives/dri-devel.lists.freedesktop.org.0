Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70249EE8C7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:35:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868626E848;
	Mon,  4 Nov 2019 19:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8127D6E82A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 19:20:39 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc07a0d0000>; Mon, 04 Nov 2019 11:20:45 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 04 Nov 2019 11:20:39 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 04 Nov 2019 11:20:39 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 Nov
 2019 19:20:38 +0000
Subject: Re: [PATCH 09/19] drm/via: set FOLL_PIN via pin_user_pages_fast()
To: Ira Weiny <ira.weiny@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, Alex
 Williamson <alex.williamson@redhat.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn.topel@intel.com>, Christoph Hellwig <hch@infradead.org>, Dan Williams
 <dan.j.williams@intel.com>, Dave Chinner <david@fromorbit.com>, David Airlie
 <airlied@linux.ie>, "David S . Miller" <davem@davemloft.net>, Jan Kara
 <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>, 
 Jonathan Corbet <corbet@lwn.net>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Magnus Karlsson <magnus.karlsson@intel.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Mike Kravetz <mike.kravetz@oracle.com>, Paul
 Mackerras <paulus@samba.org>, Shuah Khan <shuah@kernel.org>, Vlastimil Babka
 <vbabka@suse.cz>, <bpf@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <kvm@vger.kernel.org>, <linux-block@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <netdev@vger.kernel.org>, <linux-mm@kvack.org>, LKML
 <linux-kernel@vger.kernel.org>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-10-jhubbard@nvidia.com>
 <20191031233628.GI14771@iweiny-DESK2.sc.intel.com>
 <20191104181055.GP10326@phenom.ffwll.local>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <48d22c77-c313-59ff-4847-bc9a9813b8a7@nvidia.com>
Date: Mon, 4 Nov 2019 11:20:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191104181055.GP10326@phenom.ffwll.local>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Mon, 04 Nov 2019 19:35:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572895245; bh=EB1gpI7uMEMtuW6gqSsThU4ex+aDzj2XSFqSPP65uaQ=;
 h=X-PGP-Universal:Subject:To:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=RSIwXbFsNa3f/kTT6RqCBQLIY2aWqQWAD7FlV+0bWeNT3hEciNmSZuNvV8pRpiJ60
 e0uuS+69VcqG5oSf1sUWyzF8VcAyrTkMNNj6cdJS8AAil4vorCfa5P65SfRcv9q+8W
 ozPTc/Fbb2bfj8cusatLemt7LHz5SiJ0UgONgHLAjPrqgZGNa3lTKALNJJ+BVOOS2G
 swfgIWoBY2ZTyveZdj73jKp2eTRQ1+8Juf5FFDph3sRYNFXeKwps7p0UPOflB7r3qQ
 0n1vN231W3z0bEfLz8HLukYIiIePPvBbH2GdVFu8NRMpfQ7l8VNrixKxs7UGVoyxrS
 ECmh2kltaw5mA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvNC8xOSAxMDoxMCBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBUaHUsIE9jdCAz
MSwgMjAxOSBhdCAwNDozNjoyOFBNIC0wNzAwLCBJcmEgV2Vpbnkgd3JvdGU6Cj4+IE9uIFdlZCwg
T2N0IDMwLCAyMDE5IGF0IDAzOjQ5OjIwUE0gLTA3MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKPj4+
IENvbnZlcnQgZHJtL3ZpYSB0byB1c2UgdGhlIG5ldyBwaW5fdXNlcl9wYWdlc19mYXN0KCkgY2Fs
bCwgd2hpY2ggc2V0cwo+Pj4gRk9MTF9QSU4uIFNldHRpbmcgRk9MTF9QSU4gaXMgbm93IHJlcXVp
cmVkIGZvciBjb2RlIHRoYXQgcmVxdWlyZXMKPj4+IHRyYWNraW5nIG9mIHBpbm5lZCBwYWdlcywg
YW5kIHRoZXJlZm9yZSBmb3IgYW55IGNvZGUgdGhhdCBjYWxscwo+Pj4gcHV0X3VzZXJfcGFnZSgp
Lgo+Pj4KPj4KPj4gUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4K
PiAKPiBObyBvbmUncyB0b3VjaGluZyB0aGUgdmlhIGRyaXZlciBhbnltb3JlLCBzbyBmZWVsIGZy
ZWUgdG8gbWVyZ2UgdGhpcwo+IHRocm91Z2ggd2hhdGV2ZXIgdHJlZSBzdWl0cyBiZXN0IChha2Eg
SSdsbCBkcm9wIHRoaXMgb24gdGhlIGZsb29yIGFuZAo+IGZvcmdldCBhYm91dCBpdCBub3cpLgo+
IAo+IEFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IAoK
T0ssIGdyZWF0LiBZZXMsIGluIGZhY3QsIEknbSBob3BpbmcgQW5kcmV3IGNhbiBqdXN0IHB1c2gg
dGhlIHdob2xlIHNlcmllcwppbiB0aHJvdWdoIHRoZSBtbSB0cmVlLCBiZWNhdXNlIHRoYXQgd291
bGQgYWxsb3cgaXQgdG8gYmUgZG9uZSBpbiBvbmUgCnNob3QsIGluIDUuNQoKCnRoYW5rcywKCkpv
aG4gSHViYmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
