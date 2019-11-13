Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1DEFBC7F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 00:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BB36EE99;
	Wed, 13 Nov 2019 23:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F696EE99
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 23:25:20 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcc90a80004>; Wed, 13 Nov 2019 15:24:24 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 15:25:20 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 15:25:20 -0800
Received: from [10.2.160.107] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 23:25:19 +0000
Subject: Re: [PATCH v4 09/23] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: Jan Kara <jack@suse.cz>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-10-jhubbard@nvidia.com>
 <20191113104308.GE6367@quack2.suse.cz>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <3850aa22-6f03-bd2b-024f-5736c4461199@nvidia.com>
Date: Wed, 13 Nov 2019 15:22:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191113104308.GE6367@quack2.suse.cz>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573687464; bh=1TmaF+0LQcsFxIIl+yPUdlXgPu3Pw2KrYq1UfrZmOD8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Sgh8xQ9PPxEDYPCTK8yOmdqruurqzstpkQQJWGvT1ZuKvcNIm+LQ3r9aXrqQ9mszQ
 Bu049858Sw2Icc5D17nHXFv2uQsdcr4xPrIX8xdiYxeSGVqbXJlpqaWLWE4t3jzM99
 VuF91a2IBcxPvt3YPz/EF6VJnVwIt20m+YRBQJGScCmijzBCG+FdMVkUIYoHIR7z6o
 jEChHIr4nyoheDQl2TBz15vaUAtG/VbXtnMxK3XkWyGpUbFva3/BqFu3QAkjswSCIq
 sTwbFrrL1y3TY1TtnjqKRKFpvyNb5gHvpkqf+On66KeiFfk826TpWgO2QQef8bajR8
 NyLLnJaaEwbcQ==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTMvMTkgMjo0MyBBTSwgSmFuIEthcmEgd3JvdGU6Ci4uLgo+IEhvdyBkb2VzIEZPTExf
UElOIHJlc3VsdCBpbiBncmFiYmluZyAoYXQgbGVhc3Qgbm9ybWFsLCBmb3Igbm93KSBwYWdlIHJl
ZmVyZW5jZT8KPiBJIGRpZG4ndCBmaW5kIHRoYXQgYW55d2hlcmUgaW4gdGhpcyBwYXRjaCBidXQg
aXQgaXMgYSBwcmVyZXF1aXNpdGUgdG8KPiBjb252ZXJ0aW5nIGFueSB1c2VyIHRvIHBpbl91c2Vy
X3BhZ2VzKCkgaW50ZXJmYWNlLCByaWdodD8KCgpvaGhoLCBJIG1lc3NlZCB1cCBvbiB0aGlzIGlu
dGVybWVkaWF0ZSBwYXRjaDogaXQgZG9lc24ndCBxdWl0ZSBzdGFuZCBhbG9uZSBhcwppdCBzaG91
bGQsIGFzIHlvdSBub3RpY2VkLiBUbyBjb3JyZWN0IHRoaXMsIEkgY2FuIGRvIG9uZSBvZiB0aGUg
Zm9sbG93aW5nOgoKYSkgbW92ZSB0aGUgbmV3IHBpbiooKSByb3V0aW5lcyBpbnRvIHRoZSBsYXRl
ciBwYXRjaCAxNiAoIm1tL2d1cDoKdHJhY2sgRk9MTF9QSU4gcGFnZXMiKSwgb3IKCmIpIGRvIGEg
dGVtcG9yYXJ5IHRoaW5nIGhlcmUsIHN1Y2ggYXMgc2V0dGluZyBGT0xMX0dFVCBhbmQgYWRkaW5n
IGEgVE9ETywKd2l0aGluIHRoZSBwaW4qKCkgaW1wbGVtZW50YXRpb25zLiBBbmQgdGhpcyBzd2l0
Y2hpbmcgaXQgb3ZlciB0byBGT0xMX1BJTgppbiBwYXRjaCAxNi4KCkknbSB0aGlua2luZyAoYSkg
aXMgbGVzcyBlcnJvci1wcm9uZSwgc28gSSdtIGdvaW5nIHdpdGggdGhhdCB1bmxlc3Mgc29tZW9u
ZQpwb2ludHMgb3V0IHRoYXQgdGhhdCBpcyBzdHVwaWQuIDopCgoKLi4uCj4gSSB3YXMgc29tZXdo
YXQgd29uZGVyaW5nIGFib3V0IHRoZSBudW1iZXIgb2YgZnVuY3Rpb25zIHlvdSBhZGQgaGVyZS4g
U28gd2UKPiBoYXZlOj4gCj4gcGluX3VzZXJfcGFnZXMoKQo+IHBpbl91c2VyX3BhZ2VzX2Zhc3Qo
KQo+IHBpbl91c2VyX3BhZ2VzX3JlbW90ZSgpCj4gCj4gYW5kIHRoZW4gbG9uZ3Rlcm0gdmFyaWFu
dHM6Cj4gCj4gcGluX2xvbmd0ZXJtX3BhZ2VzKCkKPiBwaW5fbG9uZ3Rlcm1fcGFnZXNfZmFzdCgp
Cj4gcGluX2xvbmd0ZXJtX3BhZ2VzX3JlbW90ZSgpCj4gCj4gYW5kIG9idmlvdXNseSB3ZSBoYXZl
IGd1cCBsaWtlOgo+IGdldF91c2VyX3BhZ2VzKCkKPiBnZXRfdXNlcl9wYWdlc19mYXN0KCkKPiBn
ZXRfdXNlcl9wYWdlc19yZW1vdGUoKQo+IC4uLiBhbmQgc29tZSBvdGhlciBndXAgdmFyaWFudHMg
Li4uCj4gCj4gSSB0aGluayB3ZSByZWFsbHkgc2hvdWxkIGhhdmUgcGluXyogdnMgZ2V0XyogdmFy
aWFudHMgYXMgdGhleSBhcmUgdmVyeQo+IGRpZmZlcmVudCBpbiB0ZXJtcyBvZiBndWFyYW50ZWVz
IGFuZCBhZnRlciBjb252ZXJzaW9uLCBhbnkgdXNlIG9mIGdldF8qCj4gdmFyaWFudCBpbiBub24t
bW0gY29kZSBzaG91bGQgYmUgY2xvc2VseSBzY3J1dGluaXplZC4gT1RPSCBwaW5fbG9uZ3Rlcm1f
Kgo+IGRvbid0IGxvb2sgKnRoYXQqIHVzZWZ1bCB0byBtZSBhbmQganVzdCB1c2luZyBwaW5fKiBp
bnN0ZWFkIHdpdGgKPiBGT0xMX0xPTkdURVJNIGZsYWcgd291bGQgbG9vayBPSyB0byBtZSBhbmQg
c29tZXdoYXQgcmVkdWNlIHRoZSBudW1iZXIgb2YKPiBmdW5jdGlvbnMgd2hpY2ggaXMgYWxyZWFk
eSBsYXJnZSBlbm91Z2g/IFdoYXQgZG8gcGVvcGxlIHRoaW5rPyBJIGRvbid0IGZlZWwKPiB0b28g
c3Ryb25nbHkgYWJvdXQgdGhpcyBidXQgd2FudGVkIHRvIGJyaW5nIHRoaXMgdXAuCj4gCj4gCQkJ
CQkJCQlIb256YQoKU291bmRzIGp1c3QgcmlnaHQgdG8gbWUsIGFuZCBJIHNlZSB0aGF0IERhbiBh
bmQgSXJhIGFsc28gbGlrZSBpdC4KU28gSSdsbCBwcm9jZWVkIHdpdGggdGhhdC4KCnRoYW5rcywK
LS0gCkpvaG4gSHViYmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
