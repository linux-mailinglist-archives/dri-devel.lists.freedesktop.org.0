Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1101FBC93
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 00:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53026EE9A;
	Wed, 13 Nov 2019 23:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E276EE9A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 23:29:46 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcc91e90000>; Wed, 13 Nov 2019 15:29:45 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 15:29:46 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 15:29:46 -0800
Received: from [10.2.160.107] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 23:29:45 +0000
Subject: Re: [PATCH v4 23/23] mm/gup: remove support for gup(FOLL_LONGTERM)
To: Ira Weiny <ira.weiny@intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-24-jhubbard@nvidia.com>
 <20191113190935.GD12947@iweiny-DESK2.sc.intel.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <4e24c5af-bd96-e7c7-179b-0ca0f6abb852@nvidia.com>
Date: Wed, 13 Nov 2019 15:27:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191113190935.GD12947@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573687785; bh=9B/DbxbXL2Cu8EFiCYVZNw+MxNudIvhgmb1GMnaTmQ0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=rJKFgq0qWlNQhEr6LwQRM7xJTWCfLcG6jdSS31KElayO6wHx7IiwFsaXOvGhplyH1
 tCC68KrsRIXSAjoot89gKwHpedHmflDisAxv/IoMKZRuMzvzxHIp82VaySctaPBYkQ
 hZemWLx10v7w1crWSE8+tecZBKihDudRrciOwHkYvfyXR52KB/0+nCkX8xcEjYzOgD
 BdrgEwqj12gUt+52wZddvynAEOXEEJldAzotyUKT84BAusYTd8IMJOcdCe+okl1UqL
 yIUM4FRTzo2XVuGeXsCxvfWydTvgqiLWMulv4eIra/tutHomq+DAZbILc3dKig7Hd1
 UTGu99x3VirIw==
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
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
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

T24gMTEvMTMvMTkgMTE6MDkgQU0sIElyYSBXZWlueSB3cm90ZToKLi4uCj4+IGRpZmYgLS1naXQg
YS9tbS9ndXAuYyBiL21tL2d1cC5jCj4+IGluZGV4IDgyZTdlNGNlNTAyNy4uOTBmNWY5NWVlN2Fj
IDEwMDY0NAo+PiAtLS0gYS9tbS9ndXAuYwo+PiArKysgYi9tbS9ndXAuYwo+PiBAQCAtMTc1Niwx
MSArMTc1NiwxMSBAQCBsb25nIGdldF91c2VyX3BhZ2VzKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVu
c2lnbmVkIGxvbmcgbnJfcGFnZXMsCj4+ICAgCQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKip2bWFz
KQo+PiAgIHsKPj4gICAJLyoKPj4gLQkgKiBGT0xMX1BJTiBtdXN0IG9ubHkgYmUgc2V0IGludGVy
bmFsbHkgYnkgdGhlIHBpbl91c2VyX3BhZ2UqKCkgYW5kCj4+IC0JICogcGluX2xvbmd0ZXJtXyoo
KSBBUElzLCBuZXZlciBkaXJlY3RseSBieSB0aGUgY2FsbGVyLCBzbyBlbmZvcmNlIHRoYXQKPj4g
LQkgKiB3aXRoIGFuIGFzc2VydGlvbjoKPj4gKwkgKiBGT0xMX1BJTiBhbmQgRk9MTF9MT05HVEVS
TSBtdXN0IG9ubHkgYmUgc2V0IGludGVybmFsbHkgYnkgdGhlCj4+ICsJICogcGluX3VzZXJfcGFn
ZSooKSBhbmQgcGluX2xvbmd0ZXJtXyooKSBBUElzLCBuZXZlciBkaXJlY3RseSBieSB0aGUKPj4g
KwkgKiBjYWxsZXIsIHNvIGVuZm9yY2UgdGhhdCB3aXRoIGFuIGFzc2VydGlvbjoKPj4gICAJICov
Cj4+IC0JaWYgKFdBUk5fT05fT05DRShndXBfZmxhZ3MgJiBGT0xMX1BJTikpCj4+ICsJaWYgKFdB
Uk5fT05fT05DRShndXBfZmxhZ3MgJiAoRk9MTF9QSU4gfCBGT0xMX0xPTkdURVJNKSkpCj4gCj4g
RG9uJ3Qgd2Ugd2FudCB0byBibG9jayBGT0xMX0xPTkdURVJNIGluIGdldF91c2VyX3BhZ2VzX2Zh
c3QoKSBhcyB3ZWxsIGFmdGVyIGFsbAo+IHRoaXM/Cj4gCgpZZXMuIEJ1dCB3aXRoIHRoZSBsYXRl
c3QgaWRlYSB0byByZXN0b3JlIEZPTExfTE9OR1RFUk0gdG8gaXRzIG9yaWdpbmFsIGdsb3J5LAp0
aGF0IHdvbid0IGJlIGFuIGlzc3VlIGluIHRoZSBuZXh0IHZlcnNpb24uIGhlaC4KCgp0aGFua3Ms
Ci0tIApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
