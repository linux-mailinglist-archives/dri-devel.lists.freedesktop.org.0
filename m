Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D470A105C44
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 22:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C444F6E040;
	Thu, 21 Nov 2019 21:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F29E6E040
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 21:50:36 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd706a70001>; Thu, 21 Nov 2019 13:50:32 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 Nov 2019 13:50:35 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 Nov 2019 13:50:35 -0800
Received: from [10.2.168.213] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 21:50:35 +0000
Subject: Re: [PATCH v7 02/24] mm/gup: factor out duplicate code from four
 routines
To: Jan Kara <jack@suse.cz>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-3-jhubbard@nvidia.com> <20191121080356.GA24784@lst.de>
 <852f6c27-8b65-547b-89e0-e8f32a4d17b9@nvidia.com>
 <20191121094908.GB18190@quack2.suse.cz>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <ecd0a178-3890-5fad-2313-11b3df907f9f@nvidia.com>
Date: Thu, 21 Nov 2019 13:47:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191121094908.GB18190@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574373032; bh=kU5UGk7rYta5qBqyhgDE8hfKXijiGAD2NIzjPl1Hld4=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=DnacKCm2GFnxzRow8XHHjnv9A3uMI6LI6SiIGhg9bKcp76MqPQ8kF1M27y/KaRAbw
 xxowc8Q3DyiD2kAcAm0nQ17JpX8GvIrqJ8uSjriDnOLoj/h1UR33AwThcGRh+kdiFs
 sIZ9xwXRicfai3imhi7lfxcAqYrkI8TWeVUm4/7D0SDPmiW6FMWhSFSQx92VV4EoOz
 XFN+VtOdWxZk+dXcyMd50CRCI5bozfozwO/LAtNo36xbQ2gRR/BBiAeTLEx8hKdZSK
 Fx3jsqI8EasMtw1tkRf01vJb8NeCgZkxRIPz/M0TVfxHrLLklLoxP+jEnZwmUVejAC
 k2q6xFFz7w7hA==
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

T24gMTEvMjEvMTkgMTo0OSBBTSwgSmFuIEthcmEgd3JvdGU6Cj4gT24gVGh1IDIxLTExLTE5IDAw
OjI5OjU5LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+IE9uIDExLzIxLzE5IDEyOjAzIEFNLCBDaHJp
c3RvcGggSGVsbHdpZyB3cm90ZToKPj4+IE90aGVyd2lzZSB0aGlzIGxvb2tzIGZpbmUgYW5kIG1p
Z2h0IGJlIGEgd29ydGh3aGlsZSBjbGVhbnVwIHRvIGZlZWQKPj4+IEFuZHJldyBmb3IgNS41IGlu
ZGVwZW5kZW50IG9mIHRoZSBndXQgb2YgdGhlIGNoYW5nZXMuCj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6
IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+Pj4KPj4KPj4gVGhhbmtzIGZvciB0aGUg
cmV2aWV3cyEgU2F5LCBpdCBzb3VuZHMgbGlrZSB5b3VyIHZpZXcgaGVyZSBpcyB0aGF0IHRoaXMK
Pj4gc2VyaWVzIHNob3VsZCBiZSB0YXJnZXRlZCBhdCA1LjYgKG5vdCA1LjUpLCBpcyB0aGF0IHdo
YXQgeW91IGhhdmUgaW4gbWluZD8KPj4gQW5kIGdldCB0aGUgcHJlcGFyYXRvcnkgcGF0Y2hlcyAo
MS05LCBhbmQgbWF5YmUgZXZlbiAxMC0xNikgaW50byA1LjU/Cj4gCj4gWWVhaCwgYWN0dWFsbHkg
SSBmZWVsIHRoZSBzYW1lLiBUaGUgbWVyZ2Ugd2luZG93IGlzIGdvaW5nIHRvIG9wZW4gb24gU3Vu
ZGF5Cj4gYW5kIHRoZSBzZXJpZXMgaXNuJ3Qgc3RpbGwgZnVsbHkgYmFrZWQgYW5kIGhhcHBpbHkg
c2l0dGluZyBpbiBsaW51eC1uZXh0Cj4gKGFuZCBsYXJnZXIgY2hhbmdlcyBzaG91bGQgcmVhbGx5
IHNpdCBpbiBsaW51eC1uZXh0IGZvciBhdCBsZWFzdCBhIHdlZWssCj4gcHJlZmVyYWJseSB0d28s
IGJlZm9yZSB0aGUgbWVyZ2Ugd2luZG93IG9wZW5zIHRvIGdldCBzb21lIHJlYXNvbmFibGUgdGVz
dAo+IGNvdmVyYWdlKS4gIFNvIEknZCB0YWtlIG91dCB0aGUgaW5kZXBlbmRlbnQgZWFzeSBwYXRj
aGVzIHRoYXQgYXJlIGFscmVhZHkKPiByZXZpZXdlZCwgZ2V0IHRoZW0gbWVyZ2VkIGludG8gQW5k
cmV3J3MgKG9yIHdoYXRldmVyIG90aGVyIGFwcHJvcHJpYXRlCj4gdHJlZSkgbm93IHNvIHRoYXQg
dGhleSBnZXQgYXQgbGVhc3QgYSB3ZWVrIG9mIHRlc3RpbmcgaW4gbGludXgtbmV4dCBiZWZvcmUK
PiBnb2luZyB1cHN0cmVhbS4gIEFuZCB0aGUgbW9yZSBpbnZvbHZlZCBiaXRzIHdpbGwgaGF2ZSB0
byB3YWl0IGZvciA1LjYgLQo+IHdoaWNoIG1lYW5zIGxldCdzIGp1c3QgY29udGludWUgd29ya2lu
ZyBvbiB0aGVtIGFzIHdlIGRvIG5vdyBiZWNhdXNlCj4gaWRlYWxseSBpbiA0IHdlZWtzIHdlIHNo
b3VsZCBoYXZlIHRoZW0gcmVhZHkgd2l0aCBhbGwgdGhlIHJldmlld3Mgc28gdGhhdAo+IHRoZXkg
Y2FuIGJlIHBpY2tlZCB1cCBhbmQgaW50ZWdyYXRlZCBpbnRvIGxpbnV4LW5leHQuCj4gCj4gCQkJ
CQkJCQlIb256YQoKT0ssIHRoYW5rcyBmb3Igc3BlbGxpbmcgaXQgb3V0LiBJJ2xsIHNoaWZ0IG92
ZXIgdG8gZ2V0dGluZyB0aGUgZWFzeSBwYXRjaGVzCnByZXBhcmVkIGZvciA1LjUsIGZvciBub3cu
Cgp0aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
