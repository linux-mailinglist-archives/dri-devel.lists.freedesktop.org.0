Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2600E1012DB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 06:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA90C6E284;
	Tue, 19 Nov 2019 05:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5B56E284
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 05:17:30 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd37aeb0000>; Mon, 18 Nov 2019 21:17:32 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 18 Nov 2019 21:17:29 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 18 Nov 2019 21:17:29 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 05:17:28 +0000
Subject: Re: [PATCH v5 10/24] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: Jan Kara <jack@suse.cz>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-11-jhubbard@nvidia.com>
 <20191118101601.GF17319@quack2.suse.cz>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <aa15a76f-7054-2db2-4a47-8fbe1594295a@nvidia.com>
Date: Mon, 18 Nov 2019 21:17:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191118101601.GF17319@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574140652; bh=j4L4ESflFWPcWXUSa4QBFr0g8LzukvpI57j3tX0u+LI=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=HbjIjhLqDGlCz9fdO9WJ5XZ1MylRhdOt3hOrXOPV4rhTnQVDZpbMvOZlSwNGJc66E
 /dS/T8ygBehTtSzMJwZ3TOTHElFkCJKdPHvXGZaLpQt9mjPgsblK2PBNnMrg02Wmdh
 9Qm8oCkWiYkFORrigI0hEzL7aY7iY3cHZ1DrJYjhRQ5sx+Tmm0Tw8QlCh7Z2iKTLps
 yMslWIbYXkh6S/YZKISH7oHSmmR+hcZRdC+ZCjemhpD6kLdzSXTQ0ykjer3SCrjsmC
 1w7ai76vYnn+iNTaSLHytmXdlQYChVn5NpYDDm4H81+ayvHDf9eTllSFjtIJNz8Xoj
 cb1UR17mTvf1w==
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
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
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

T24gMTEvMTgvMTkgMjoxNiBBTSwgSmFuIEthcmEgd3JvdGU6Cj4gT24gVGh1IDE0LTExLTE5IDIx
OjUzOjI2LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+ICAvKgo+PiAtICogTk9URSBvbiBGT0xMX0xP
TkdURVJNOgo+PiArICogRk9MTF9QSU4gYW5kIEZPTExfTE9OR1RFUk0gbWF5IGJlIHVzZWQgaW4g
dmFyaW91cyBjb21iaW5hdGlvbnMgd2l0aCBlYWNoCj4+ICsgKiBvdGhlci4gSGVyZSBpcyB3aGF0
IHRoZXkgbWVhbiwgYW5kIGhvdyB0byB1c2UgdGhlbToKPj4gICAqCj4+ICAgKiBGT0xMX0xPTkdU
RVJNIGluZGljYXRlcyB0aGF0IHRoZSBwYWdlIHdpbGwgYmUgaGVsZCBmb3IgYW4gaW5kZWZpbml0
ZSB0aW1lCj4+IC0gKiBwZXJpb2QgX29mdGVuXyB1bmRlciB1c2Vyc3BhY2UgY29udHJvbC4gIFRo
aXMgaXMgY29udHJhc3RlZCB3aXRoCj4+IC0gKiBpb3ZfaXRlcl9nZXRfcGFnZXMoKSB3aGVyZSB1
c2FnZXMgd2hpY2ggYXJlIHRyYW5zaWVudC4KPj4gKyAqIHBlcmlvZCBfb2Z0ZW5fIHVuZGVyIHVz
ZXJzcGFjZSBjb250cm9sLiAgVGhpcyBpcyBpbiBjb250cmFzdCB0bwo+PiArICogaW92X2l0ZXJf
Z2V0X3BhZ2VzKCksIHdoZXJlIHVzYWdlcyB3aGljaCBhcmUgdHJhbnNpZW50Lgo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXl5eIHdoZW4geW91IHRvdWNoIHRoaXMsIHBsZWFzZSBmaXggYWxz
byB0aGUKPiBzZWNvbmQgc2VudGVuc2UuIEl0IGRvZXNuJ3QgcXVpdGUgbWFrZSBzZW5zZSB0byBt
ZS4uLiBJJ2QgcHJvYmFibHkgd3JpdGUKPiB0aGVyZSAid2hvc2UgdXNhZ2VzIGFyZSB0cmFuc2ll
bnQiIGJ1dCBtYXliZSB5b3UgY2FuIGNvbWUgdXAgd2l0aCBzb21ldGhpbmcKPiBldmVuIGJldHRl
ci4KCkZpeGVkLCB1c2luZyB5b3VyIHdvcmRpbmcsIGFzIEkgZGlkbid0IHNlZSBhbnkgb2J2aW91
cyBpbXByb3ZlbWVudHMgYmV5b25kIHRoYXQuCgoKCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApO
VklESUEKCgo+IAo+IE90aGVyd2lzZSB0aGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZSBzbyBmZWVs
IGZyZWUgdG8gYWRkOgo+IAo+IFJldmlld2VkLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6Pgo+
IAo+IAkJCQkJCQkJSG9uemEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
