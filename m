Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3037C108252
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2019 07:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2956E069;
	Sun, 24 Nov 2019 06:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44966E069
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 06:14:59 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dda1fe40000>; Sat, 23 Nov 2019 22:15:00 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sat, 23 Nov 2019 22:14:59 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sat, 23 Nov 2019 22:14:59 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 24 Nov
 2019 06:14:58 +0000
Subject: Re: [PATCH v7 07/24] IB/umem: use get_user_pages_fast() to pin DMA
 pages
To: Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@infradead.org>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-8-jhubbard@nvidia.com>
 <20191121080746.GC30991@infradead.org> <20191121143643.GC7448@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <17835638-d584-f981-faa3-34d57e0990de@nvidia.com>
Date: Sat, 23 Nov 2019 22:14:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191121143643.GC7448@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574576101; bh=+mbCPa34GHo19rkSZ8X28MZHFxfKXj0JDCmoAoUgPhA=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=rnJRvArAFZ67Vzahr4+GNcHZkOJaRQ1bnarVeGj7SvXz/R+r3p2k4V8o4PNf6Wbcw
 3xL+TtEry7heG5wqM3NVoYyi7aDc+B2xuRbK2SnTo69SOcX60IAwSFzdofVFFFlVyT
 gyXNjxvNUpFkXIgBulcPkbFyI5jrak0YNcjGfkZMGkzxA1kwFRgiqyY01ePNnygIDa
 AceJzMANk9mc42QCdkekmILaSR/m0pf2tjKlkU3S6II3oo/R4tFTo6cjTIn85En+zg
 3C8KCrUdwWMPEyzTj3R/rK57hmQLK9Uvd/BNoQw7gfP72ow1560J847aJmTfcNvLbV
 jsABE/ntXCuCQ==
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
 Michael Ellerman <mpe@ellerman.id.au>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
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

T24gMTEvMjEvMTkgNjozNiBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFRodSwgTm92
IDIxLCAyMDE5IGF0IDEyOjA3OjQ2QU0gLTA4MDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+
PiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxMToxMzozN1BNIC0wODAwLCBKb2huIEh1YmJhcmQg
d3JvdGU6Cj4+PiBBbmQgZ2V0IHJpZCBvZiB0aGUgbW1hcF9zZW0gY2FsbHMsIGFzIHBhcnQgb2Yg
dGhhdC4gTm90ZQo+Pj4gdGhhdCBnZXRfdXNlcl9wYWdlc19mYXN0KCkgd2lsbCwgaWYgbmVjZXNz
YXJ5LCBmYWxsIGJhY2sgdG8KPj4+IF9fZ3VwX2xvbmd0ZXJtX3VubG9ja2VkKCksIHdoaWNoIHRh
a2VzIHRoZSBtbWFwX3NlbSBhcyBuZWVkZWQuCj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IEphbiBLYXJh
IDxqYWNrQHN1c2UuY3o+Cj4+PiBSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNv
bT4KPj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4K
Pj4KPj4gTG9va3MgZmluZSwKPj4KPj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgo+Pgo+PiBKYXNvbiwgY2FuIHlvdSBxdWV1ZSB0aGlzIHVwIGZvciA1LjUgdG8g
cmVkdWNlIHRoaXMgcGF0Y2ggc3RhY2sgYSBiaXQ/Cj4gCj4gWWVzLCBJIHNhaWQgSSdkIGRvIHRo
aXMgaW4gYW4gZWFybGllciByZXZpc2lvbi4gTm93IHRoYXQgaXQgaXMgY2xlYXIgdGhpcwo+IHdv
bid0IGdvIHRocm91Z2ggQW5kcmV3J3MgdHJlZSwgYXBwbGllZCB0byByZG1hIGZvci1uZXh0Cj4g
CgpHcmVhdCwgSSdsbCBwbGFuIG9uIGl0IGdvaW5nIHVwIHRocm91Z2ggdGhhdCB0cmVlLiBUbyBi
ZSBjbGVhciwgaXMgaXQgaGVhZGVkIApmb3I6CgogICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3JkbWEvcmRtYS5naXQgZm9yLW5leHQKCj8KCgp0aGFua3Ms
Ci0tIApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
