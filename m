Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D19BEF05F1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 20:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BE36EB5E;
	Tue,  5 Nov 2019 19:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C4388F1E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 18:16:28 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc1bc810000>; Tue, 05 Nov 2019 10:16:33 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 05 Nov 2019 10:16:27 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 05 Nov 2019 10:16:27 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Nov
 2019 18:16:25 +0000
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
 <48d22c77-c313-59ff-4847-bc9a9813b8a7@nvidia.com>
 <20191105094936.GZ10326@phenom.ffwll.local>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <9b9637f4-34e0-a665-a9c8-8fd59ff71063@nvidia.com>
Date: Tue, 5 Nov 2019 10:16:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191105094936.GZ10326@phenom.ffwll.local>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Tue, 05 Nov 2019 19:26:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572977793; bh=R0RxaBiDFTq2JKu4s4y6dD52czu96JnYA/nMzL9A6aE=;
 h=X-PGP-Universal:Subject:To:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ZSBhPlkU00U2SId5ohXT4qfb7S3CRfF2QxUJyZ0MYASa23SxluEpDZf1THjnsB9k6
 3RTrsq64bDaJH6/fLXRNFkXaPhRm5A6gkx6RZdlDie0bGzD/RBx0po9cAdeDcz/1hI
 lKGfT57a8xEYWihKfruZKPu2iv+9HpU34riNOb6hU1aeKe+Fw0TM0CdzQuEAMyVnn3
 zPBLdfbRqsxHTlb9Dt1LPnE+4oLXwLOgCALb/FxR0bVQqL9MMuMnHnx6cwBXcGJC2q
 423PWzhyAI/MHMUhEHpOr+pguDR21zYFt0jsH+WX73ZsVIDhQ9aKqbWLguXDJ6ZEPH
 qkWctNU3sUmkw==
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

T24gMTEvNS8xOSAxOjQ5IEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIE1vbiwgTm92IDA0
LCAyMDE5IGF0IDExOjIwOjM4QU0gLTA4MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKPj4gT24gMTEv
NC8xOSAxMDoxMCBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+IE9uIFRodSwgT2N0IDMxLCAy
MDE5IGF0IDA0OjM2OjI4UE0gLTA3MDAsIElyYSBXZWlueSB3cm90ZToKPj4+PiBPbiBXZWQsIE9j
dCAzMCwgMjAxOSBhdCAwMzo0OToyMFBNIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+Pj4+
IENvbnZlcnQgZHJtL3ZpYSB0byB1c2UgdGhlIG5ldyBwaW5fdXNlcl9wYWdlc19mYXN0KCkgY2Fs
bCwgd2hpY2ggc2V0cwo+Pj4+PiBGT0xMX1BJTi4gU2V0dGluZyBGT0xMX1BJTiBpcyBub3cgcmVx
dWlyZWQgZm9yIGNvZGUgdGhhdCByZXF1aXJlcwo+Pj4+PiB0cmFja2luZyBvZiBwaW5uZWQgcGFn
ZXMsIGFuZCB0aGVyZWZvcmUgZm9yIGFueSBjb2RlIHRoYXQgY2FsbHMKPj4+Pj4gcHV0X3VzZXJf
cGFnZSgpLgo+Pj4+Pgo+Pj4+Cj4+Pj4gUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55
QGludGVsLmNvbT4KPj4+Cj4+PiBObyBvbmUncyB0b3VjaGluZyB0aGUgdmlhIGRyaXZlciBhbnlt
b3JlLCBzbyBmZWVsIGZyZWUgdG8gbWVyZ2UgdGhpcwo+Pj4gdGhyb3VnaCB3aGF0ZXZlciB0cmVl
IHN1aXRzIGJlc3QgKGFrYSBJJ2xsIGRyb3AgdGhpcyBvbiB0aGUgZmxvb3IgYW5kCj4+PiBmb3Jn
ZXQgYWJvdXQgaXQgbm93KS4KPj4+Cj4+PiBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD4KPj4+Cj4+Cj4+IE9LLCBncmVhdC4gWWVzLCBpbiBmYWN0LCBJJ20g
aG9waW5nIEFuZHJldyBjYW4ganVzdCBwdXNoIHRoZSB3aG9sZSBzZXJpZXMKPj4gaW4gdGhyb3Vn
aCB0aGUgbW0gdHJlZSwgYmVjYXVzZSB0aGF0IHdvdWxkIGFsbG93IGl0IHRvIGJlIGRvbmUgaW4g
b25lIAo+PiBzaG90LCBpbiA1LjUKPiAKPiBidHcgaXMgdGhlcmUgbW9yZT8gV2Ugc2hvdWxkIGhh
dmUgYSBidW5jaCBtb3JlIHVzZXJwdHIgc3R1ZmYgaW4gdmFyaW91cwo+IGRyaXZlcnMsIHNvIHdh
cyByZWFsbHkgc3VycHJpc2VkIHRoYXQgZHJtL3ZpYSBpcyB0aGUgb25seSB0aGluZyBpbiB5b3Vy
Cj4gc2VyaWVzLgoKClRoZXJlIGlzIG1vcmUsIGJ1dDoKCjEpIEZvcnR1bmF0ZWx5LCB0aGUgb3B0
LWluIG5hdHVyZSBvZiBGT0xMX1BJTiBhbGxvd3MgY29udmVydGluZyBhIGZldyBjYWxsCnNpdGVz
IGF0IGEgdGltZS4gQW5kIHNvIHRoaXMgcGF0Y2hzZXQgbGltaXRzIGl0c2VsZiB0byBjb252ZXJ0
aW5nIHRoZSBiYXJlCm1pbmltdW0gcmVxdWlyZWQgdG8gZ2V0IHN0YXJ0ZWQsIHdoaWNoIGlzOiAK
CiAgICBhKSBjYWxscyBzaXRlcyB0aGF0IGhhdmUgYWxyZWFkeSBiZWVuIGNvbnZlcnRlZCB0byBw
dXRfdXNlcl9wYWdlKCksIAogICAgICAgYW5kCgogICAgYikgY2FsbCBzaXRlcyB0aGF0IHNldCBG
T0xMX0xPTkdURVJNLgoKU28geWVzLCBmb2xsb3ctdXAgcGF0Y2hlcyB3aWxsIGJlIHJlcXVpcmVk
LiBUaGlzIGlzIG5vdCBldmVyeXRoaW5nLgpJbiBmYWN0LCBpZiBJIGNhbiBmaXggdGhpcyBzZXJp
ZXMgdXAgcXVpY2tseSBlbm91Z2ggdGhhdCBpdCBtYWtlcyBpdCBpbnRvCm1tb3RtIHNvb24taXNo
LCB0aGVuIHRoZXJlIG1heSBiZSB0aW1lIHRvIGdldCBzb21lIGZvbGxvdy1wYXRjaGVzIG9uIHRv
cApvZiBpdCwgaW4gdGltZSBmb3IgNS41LgoKCjIpIElmIEkgcmVjYWxsIGNvcnJlY3RseSwgSmVy
b21lIGFuZCBtYXliZSBvdGhlcnMgYXJlIHdvcmtpbmcgdG8gcmVtb3ZlCmFzIG1hbnkgZ2V0X3Vz
ZXJfcGFnZXMoKSBjYWxsZXJzIGZyb20gZHJtIGFzIHBvc3NpYmxlLCBhbmQgaW5zdGVhZCB1c2UK
YSBub24tcGlubmVkIHBhZ2UgYXBwcm9hY2gsIHdpdGggbW11IG5vdGlmaWVycyBpbnN0ZWFkLiAg
SSdtIG5vdCBzdXJlIG9mCnRoZSBleGFjdCBzdGF0dXMgb2YgdGhhdCB3b3JrLCBidXQgSSBzZWUg
dGhhdCBldG5hdml2LCBhbWRncHUsIGk5MTUsIGFuZApyYWRlb24gc3RpbGwgY2FsbCBndXAoKSBp
biBsaW51eC1uZXh0LgoKQW55d2F5LCBzb21lIG9mIHRob3NlIGNhbGwgc2l0ZXMgd2lsbCBkaXNh
cHBlYXIuIEFsdGhvdWdoIEknZCBleHBlY3QgYSAKZmV3IHRvIHJlbWFpbiwgYmVjYXVzZSBJIGRv
dWJ0IHRoZSBzaW1wbGVyIEdQVXMgY2FuIHN1cHBvcnQgcGFnZSBmYXVsdGluZy4KCgoKdGhhbmtz
LAoKSm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
