Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6561034C5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 08:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C986E0F0;
	Wed, 20 Nov 2019 07:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7D16E0F0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 07:03:12 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd4e52b0000>; Tue, 19 Nov 2019 23:03:07 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 23:03:11 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 19 Nov 2019 23:03:11 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Nov
 2019 07:03:10 +0000
Subject: Re: [PATCH v6 15/24] fs/io_uring: set FOLL_PIN via pin_user_pages()
To: Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>
References: <20191119081643.1866232-1-jhubbard@nvidia.com>
 <20191119081643.1866232-16-jhubbard@nvidia.com>
 <2ae65d1b-a3eb-74ed-afce-c493de5bbfd3@kernel.dk>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <42c80c0a-ad2c-fe74-babd-57680882c7e2@nvidia.com>
Date: Tue, 19 Nov 2019 23:03:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2ae65d1b-a3eb-74ed-afce-c493de5bbfd3@kernel.dk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574233388; bh=ccH+u52vDWCSpx4Mj41DBPFk4Bnr7E1/buLUhbEm50I=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=JgB1DKCfL3XJ8zWGygaD3BUGSICo+/trsKwCSHVYrMBALdO+vFpmYy6dqLGjIrPUQ
 sF8xGbyB1ACyvX2yUiKVkLwR0sQwJE97fwYv43/2HldX2Up5joY07G6jGvVqUmPQbs
 s7aCBGJCkJx2+gmT6XrOocwOkA9Y2V4feML4cKWbwQHDTj0KN68vQj8arDmTnlLpeV
 Vl2szJ5e3K6FGqS7Ak9pQCBtOltdIBEAKXl2K2K6H027fUCWGLfdlzI522BqaVGPv9
 4MOGZXHfPcXsBvyqnQSS/gMqKBesz8M6hmg3+jR2K/xr7fDjV/7ORS+2k7FT5h4Hcc
 +4RQhVotw05/w==
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
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, netdev@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTkvMTkgODoxMCBBTSwgSmVucyBBeGJvZSB3cm90ZToKPiBPbiAxMS8xOS8xOSAxOjE2
IEFNLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+IENvbnZlcnQgZnMvaW9fdXJpbmcgdG8gdXNlIHRo
ZSBuZXcgcGluX3VzZXJfcGFnZXMoKSBjYWxsLCB3aGljaCBzZXRzCj4+IEZPTExfUElOLiBTZXR0
aW5nIEZPTExfUElOIGlzIG5vdyByZXF1aXJlZCBmb3IgY29kZSB0aGF0IHJlcXVpcmVzCj4+IHRy
YWNraW5nIG9mIHBpbm5lZCBwYWdlcywgYW5kIHRoZXJlZm9yZSBmb3IgYW55IGNvZGUgdGhhdCBj
YWxscwo+PiBwdXRfdXNlcl9wYWdlKCkuCj4+Cj4+IEluIHBhcnRpYWwgYW50aWNpcGF0aW9uIG9m
IHRoaXMgd29yaywgdGhlIGlvX3VyaW5nIGNvZGUgd2FzIGFscmVhZHkKPj4gY2FsbGluZyBwdXRf
dXNlcl9wYWdlKCkgaW5zdGVhZCBvZiBwdXRfcGFnZSgpLiBUaGVyZWZvcmUsIGluIG9yZGVyIHRv
Cj4+IGNvbnZlcnQgZnJvbSB0aGUgZ2V0X3VzZXJfcGFnZXMoKS9wdXRfcGFnZSgpIG1vZGVsLCB0
byB0aGUKPj4gcGluX3VzZXJfcGFnZXMoKS9wdXRfdXNlcl9wYWdlKCkgbW9kZWwsIHRoZSBvbmx5
IGNoYW5nZSByZXF1aXJlZAo+PiBoZXJlIGlzIHRvIGNoYW5nZSBnZXRfdXNlcl9wYWdlcygpIHRv
IHBpbl91c2VyX3BhZ2VzKCkuCj4+Cj4+IFJldmlld2VkLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNl
LmN6Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+
Cj4gCj4gWW91IGRyb3BwZWQgbXkgcmV2aWV3ZWQtYnkgbm93Li4uIEdpdmVuIHRoZSBmaWxlLCB5
b3UnZCBwcm9iYWJseSB3YW50Cj4gdG8ga2VlcCB0aGF0LgoKSGkgSmVucywKClllcywgSSB3YXMg
YmVpbmcgdG9vIGNvbnNlcnZhdGl2ZSBJIGd1ZXNzLiBJIGNoYW5nZWQgdGhlIHBhdGNoIHNvbWV3
aGF0CmFuZCBkcm9wcGVkIHRoZSByZXZpZXdlZC1ieSBiZWNhdXNlIG9mIHRob3NlIGNoYW5nZXMu
Li5JJ20gYWRkaW5nIGl0CmJhY2sgZm9yIHY3IGJhc2VkIG9uIHRoaXMsIHRoYW5rcyEKCnRoYW5r
cywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKIApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
