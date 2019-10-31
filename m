Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0657EBF01
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE5A6F76B;
	Fri,  1 Nov 2019 08:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14796E120
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 18:43:38 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dbb2b600000>; Thu, 31 Oct 2019 11:43:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 31 Oct 2019 11:43:38 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 31 Oct 2019 11:43:38 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 31 Oct
 2019 18:43:37 +0000
Subject: Re: [PATCH 02/19] mm/gup: factor out duplicate code from four routines
To: Ira Weiny <ira.weiny@intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-3-jhubbard@nvidia.com>
 <20191031183549.GC14771@iweiny-DESK2.sc.intel.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <75b557f7-24b2-740c-2640-2f914d131600@nvidia.com>
Date: Thu, 31 Oct 2019 11:43:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191031183549.GC14771@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572547424; bh=tVTQ7w70LzXRWNozMw5pcweYnGaSw6wKS7taKOoMvgQ=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ItGdt9jPwuaxZEwBZAmOs6QRw3y1ekRCXIkAk884e9fffuoHSkMv3IXuQ7vsU8mJ+
 6sn7OAiE4sod/01pqRwiHcd242kDvH4VxxD334MsuTzmzdN+z2Tf4SkqA4hAm5RUgb
 DQz3BJUfTbN/krdQz9Fy07dfiumXVmkiVCv2liRNNsMOm+vluNn2/EZjBIhVCKbXA7
 WVHpKyr4oMIxF6v1Zhp2z85oNzL7rjapLTslb3D5k7UtqTOOxnqps/GxGVAfXIr7tc
 /ZNTHbsdctd0KY29GLOk6czDGwBpbgAriROyniZOORRqIrKjgDjOEDFf1BfnHlTH/3
 EDGo/Nn1OpOQw==
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

T24gMTAvMzEvMTkgMTE6MzUgQU0sIElyYSBXZWlueSB3cm90ZToKPiBPbiBXZWQsIE9jdCAzMCwg
MjAxOSBhdCAwMzo0OToxM1BNIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Ci4uLgo+PiArCj4+
ICtzdGF0aWMgdm9pZCBfX3JlbW92ZV9yZWZzX2Zyb21faGVhZChzdHJ1Y3QgcGFnZSAqcGFnZSwg
aW50IHJlZnMpCj4+ICt7Cj4+ICsJLyogRG8gYSBnZXRfcGFnZSgpIGZpcnN0LCBpbiBjYXNlIHJl
ZnMgPT0gcGFnZS0+X3JlZmNvdW50ICovCj4+ICsJZ2V0X3BhZ2UocGFnZSk7Cj4+ICsJcGFnZV9y
ZWZfc3ViKHBhZ2UsIHJlZnMpOwo+PiArCXB1dF9wYWdlKHBhZ2UpOwo+PiArfQo+IAo+IEkgd29u
ZGVyIGlmIHRoaXMgaXMgYmV0dGVyIGltcGxlbWVudGVkIGFzICJwdXRfY29tcG91bmRfaGVhZCgp
Ij8gIFRvIG1hdGNoIHRoZQo+IHRyeV9nZXRfY29tcG91bmRfaGVhZCgpIGNhbGwgYmVsb3c/CgpI
aSBJcmEsCgpHb29kIGlkZWEsIEknbGwgcmVuYW1lIGl0IHRvIHRoYXQuCgo+IAo+PiArCj4+ICtz
dGF0aWMgaW50IF9faHVnZV9wdF9kb25lKHN0cnVjdCBwYWdlICpoZWFkLCBpbnQgbnJfcmVjb3Jk
ZWRfcGFnZXMsIGludCAqbnIpCj4+ICt7Cj4+ICsJKm5yICs9IG5yX3JlY29yZGVkX3BhZ2VzOwo+
PiArCVNldFBhZ2VSZWZlcmVuY2VkKGhlYWQpOwo+PiArCXJldHVybiAxOwo+IAo+IFdoZW4gd2ls
bCB0aGlzIHJldHVybiBhbnl0aGluZyBidXQgMT8KPiAKCk5ldmVyLCBidXQgaXQgc2F2ZXMgYSBs
aW5lIGF0IGFsbCBmb3VyIGNhbGwgc2l0ZXMsIGJ5IGhhdmluZyBpdCByZXR1cm4gbGlrZSB0aGF0
LgoKSSBjb3VsZCBzZWUgaG93IG1heWJlIHBlb3BsZSB3b3VsZCBwcmVmZXIgdG8ganVzdCBoYXZl
IGl0IGJlIGEgdm9pZCBmdW5jdGlvbiwKYW5kIHJldHVybiAxIGRpcmVjdGx5IGF0IHRoZSBjYWxs
IHNpdGVzLiBTaW5jZSB0aGlzIHdhcyBhIGxvd2VyIGxpbmUgY291bnQgSQp0aG91Z2h0IG1heWJl
IGl0IHdvdWxkIGJlIHNsaWdodGx5IGJldHRlciwgYnV0IGl0J3MgaGFyZCB0byBzYXkgcmVhbGx5
LgoKdGhhbmtzLAoKSm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
