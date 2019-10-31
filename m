Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D77EBF05
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E494F6F77E;
	Fri,  1 Nov 2019 08:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28636F666
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 22:01:08 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dbb59aa0000>; Thu, 31 Oct 2019 15:01:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 31 Oct 2019 15:01:08 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 31 Oct 2019 15:01:08 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 31 Oct
 2019 22:01:07 +0000
Subject: Re: [PATCH 02/19] mm/gup: factor out duplicate code from four routines
To: Ira Weiny <ira.weiny@intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-3-jhubbard@nvidia.com>
 <20191031183549.GC14771@iweiny-DESK2.sc.intel.com>
 <75b557f7-24b2-740c-2640-2f914d131600@nvidia.com>
 <20191031210954.GE14771@iweiny-DESK2.sc.intel.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <5cb84804-be12-82e8-11d8-7e593fd05619@nvidia.com>
Date: Thu, 31 Oct 2019 15:01:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191031210954.GE14771@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572559274; bh=St3Rf/REgq/1do28NhYtGJF/+ie61nX3HJRKUe+Kv+8=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ikqeCXUqsTwoQB5CbB+62UgGOxuiKLZDrBsuVMEaD9IjjDxXb09OkVp8xOPRF5wct
 ee5DhXFx3ncNZEuTcZeSOQivxIJokuWUNeY+2vtv3ZOkk1HWJjkj1h2EH0AXlwb+WX
 k+12VWYeIpYnIAMc/9Jx/3qdPSGK+huRjsgTXXwezXTbb/FzDozYDlQdAsy+QX8f3z
 guPaB2LcynNr/sr3xHEr7wV68E214NkgY5BRukBI2Kt+YqGU/HP5jxWqLsbWsS/eGt
 xEDw4hf53LcGHOIM9YJEHjAqS/wG8o7OePI2ydIId+OliMRlMyINElUiwkTZonGlbb
 If9KlbJQJnB+Q==
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
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 "Aneesh Kumar
 K . V" <aneesh.kumar@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMzEvMTkgMjowOSBQTSwgSXJhIFdlaW55IHdyb3RlOgo+IE9uIFRodSwgT2N0IDMxLCAy
MDE5IGF0IDExOjQzOjM3QU0gLTA3MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKPj4gT24gMTAvMzEv
MTkgMTE6MzUgQU0sIElyYSBXZWlueSB3cm90ZToKPj4+IE9uIFdlZCwgT2N0IDMwLCAyMDE5IGF0
IDAzOjQ5OjEzUE0gLTA3MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKPj4gLi4uCj4+Pj4gKwo+Pj4+
ICtzdGF0aWMgaW50IF9faHVnZV9wdF9kb25lKHN0cnVjdCBwYWdlICpoZWFkLCBpbnQgbnJfcmVj
b3JkZWRfcGFnZXMsIGludCAqbnIpCj4+Pj4gK3sKPj4+PiArCSpuciArPSBucl9yZWNvcmRlZF9w
YWdlczsKPj4+PiArCVNldFBhZ2VSZWZlcmVuY2VkKGhlYWQpOwo+Pj4+ICsJcmV0dXJuIDE7Cj4+
Pgo+Pj4gV2hlbiB3aWxsIHRoaXMgcmV0dXJuIGFueXRoaW5nIGJ1dCAxPwo+Pj4KPj4KPj4gTmV2
ZXIsIGJ1dCBpdCBzYXZlcyBhIGxpbmUgYXQgYWxsIGZvdXIgY2FsbCBzaXRlcywgYnkgaGF2aW5n
IGl0IHJldHVybiBsaWtlIHRoYXQuCj4+Cj4+IEkgY291bGQgc2VlIGhvdyBtYXliZSBwZW9wbGUg
d291bGQgcHJlZmVyIHRvIGp1c3QgaGF2ZSBpdCBiZSBhIHZvaWQgZnVuY3Rpb24sCj4+IGFuZCBy
ZXR1cm4gMSBkaXJlY3RseSBhdCB0aGUgY2FsbCBzaXRlcy4gU2luY2UgdGhpcyB3YXMgYSBsb3dl
ciBsaW5lIGNvdW50IEkKPj4gdGhvdWdodCBtYXliZSBpdCB3b3VsZCBiZSBzbGlnaHRseSBiZXR0
ZXIsIGJ1dCBpdCdzIGhhcmQgdG8gc2F5IHJlYWxseS4KPiAKPiBJdCBpcyBhIE5JVCBwZXJoYXBz
IGJ1dCBJIGZlZWwgbGlrZSB0aGUgc2lnbmF0dXJlIG9mIGEgZnVuY3Rpb24gc2hvdWxkIHN0YW5k
IG9uCj4gaXQncyBvd24uICBXaGF0IHRoaXMgZG9lcyBpcyBtaXggdGhlIG1lYW5pbmcgb2YgdGhp
cyBmdW5jdGlvbiB3aXRoIHRob3NlCj4gY2FsbGluZyBpdC4gIFdoaWNoIElNTyBpcyBub3QgZ29v
ZCBzdHlsZS4KPiAKPiBXZSBjYW4gc2VlIHdoYXQgb3RoZXJzIHNheS4KPiAKClN1cmUuIEknbGwg
cGxhbiBvbiBjaGFuZ2luZyBpdCB0byBhIHZvaWQgcmV0dXJuIHR5cGUsIHRoZW4sIHVubGVzcyBz
b21lb25lIGVsc2UKcGlwZXMgdXAuCgoKdGhhbmtzLAoKSm9obiBIdWJiYXJkCk5WSURJQQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
