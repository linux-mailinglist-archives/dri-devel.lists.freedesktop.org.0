Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A14EF826E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 22:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4148F6E241;
	Mon, 11 Nov 2019 21:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A036E241
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 21:46:19 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9d66d0000>; Mon, 11 Nov 2019 13:45:17 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 13:46:18 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 11 Nov 2019 13:46:18 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 Nov
 2019 21:46:18 +0000
Subject: Re: [PATCH v2 04/18] media/v4l2-core: set pages dirty upon releasing
 DMA buffers
To: Hans Verkuil <hverkuil@xs4all.nl>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-5-jhubbard@nvidia.com>
 <4b2337f6-102d-ae9d-e690-4331d77660c4@xs4all.nl>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <5846f15d-f03b-cd1a-051c-42b1519c4c48@nvidia.com>
Date: Mon, 11 Nov 2019 13:46:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4b2337f6-102d-ae9d-e690-4331d77660c4@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573508717; bh=JgFNDA0v0XtnqpGBZO9zS12edBVCSHH4nhh2s8SsfW8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=KJdHonRoY4lGZsGGXFA+s6C9dAs+F+pw/0M4pYcPJTv8UjN4AOAtOKwCMIML32E4J
 r1oa+qdIiwIStrqpxJM1Ivl0+B4WzoS3hMuEMwbOHFQnWENnyAiOG7rxglRiMPOsG2
 P1hEnkWRlMLt+KFRHY1ADSR7l9DzNOzOUd8zjn8ytb8H6XjFU3HR0TMaYulAaIN8Ej
 W15iUuEbFCS+gYNQ7bbS2hBGFlr0gEiNZEHH94kd699lxQXaw52Pbe2bTEp8/kn2Gi
 RR0P48w8xGu3BkU/HHy5EhGqoz+wSP++cOtfAjoHUddj6CK5tYXuhTndLB24+KM9Al
 oii/NsVBT+BQA==
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
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTAvMTkgMjoxMCBBTSwgSGFucyBWZXJrdWlsIHdyb3RlOgo+IE9uIDExLzMvMTkgMTA6
MTcgUE0sIEpvaG4gSHViYmFyZCB3cm90ZToKPj4gQWZ0ZXIgRE1BIGlzIGNvbXBsZXRlLCBhbmQg
dGhlIGRldmljZSBhbmQgQ1BVIGNhY2hlcyBhcmUgc3luY2hyb25pemVkLAo+PiBpdCdzIHN0aWxs
IHJlcXVpcmVkIHRvIG1hcmsgdGhlIENQVSBwYWdlcyBhcyBkaXJ0eSwgaWYgdGhlIGRhdGEgd2Fz
Cj4+IGNvbWluZyBmcm9tIHRoZSBkZXZpY2UuIEhvd2V2ZXIsIHRoaXMgZHJpdmVyIHdhcyBqdXN0
IGlzc3VpbmcgYQo+PiBiYXJlIHB1dF9wYWdlKCkgY2FsbCwgd2l0aG91dCBhbnkgc2V0X3BhZ2Vf
ZGlydHkqKCkgY2FsbC4KPj4KPj4gRml4IHRoZSBwcm9ibGVtLCBieSBjYWxsaW5nIHNldF9wYWdl
X2RpcnR5X2xvY2soKSBpZiB0aGUgQ1BVIHBhZ2VzCj4+IHdlcmUgcG90ZW50aWFsbHkgcmVjZWl2
aW5nIGRhdGEgZnJvbSB0aGUgZGV2aWNlLgo+Pgo+PiBDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFi
IDxtY2hlaGFiQGtlcm5lbC5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1
YmJhcmRAbnZpZGlhLmNvbT4KPiAKPiBBY2tlZC1ieTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1j
aXNjb0B4czRhbGwubmw+Cj4gCj4gTG9va3MgZ29vZCwgdGhhbmtzIQo+IAoKSGkgSGFucywgaXQn
cyBncmVhdCB0aGF0IHlvdSBjb3VsZCB0YWtlIGEgbG9vayBhdCB0aGlzIGFuZCB0aGUgb3RoZXIg
djRsMiAKcGF0Y2gsIG11Y2ggYXBwcmVjaWF0ZWQuCgoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJk
Ck5WSURJQQo+PiAtLS0KPj4gIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1z
Zy5jIHwgNSArKysrLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9i
dWYtZG1hLXNnLmMgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtc2cuYwo+
PiBpbmRleCA2NmE2YzZjMjM2YTcuLjI4MjYyMTkwYzNhYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLXNnLmMKPj4gKysrIGIvZHJpdmVycy9tZWRp
YS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLXNnLmMKPj4gQEAgLTM0OSw4ICszNDksMTEgQEAgaW50
IHZpZGVvYnVmX2RtYV9mcmVlKHN0cnVjdCB2aWRlb2J1Zl9kbWFidWYgKmRtYSkKPj4gIAlCVUdf
T04oZG1hLT5zZ2xlbik7Cj4+ICAKPj4gIAlpZiAoZG1hLT5wYWdlcykgewo+PiAtCQlmb3IgKGkg
PSAwOyBpIDwgZG1hLT5ucl9wYWdlczsgaSsrKQo+PiArCQlmb3IgKGkgPSAwOyBpIDwgZG1hLT5u
cl9wYWdlczsgaSsrKSB7Cj4+ICsJCQlpZiAoZG1hLT5kaXJlY3Rpb24gPT0gRE1BX0ZST01fREVW
SUNFKQo+PiArCQkJCXNldF9wYWdlX2RpcnR5X2xvY2soZG1hLT5wYWdlc1tpXSk7Cj4+ICAJCQlw
dXRfcGFnZShkbWEtPnBhZ2VzW2ldKTsKPj4gKwkJfQo+PiAgCQlrZnJlZShkbWEtPnBhZ2VzKTsK
Pj4gIAkJZG1hLT5wYWdlcyA9IE5VTEw7Cj4+ICAJfQo+Pgo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
