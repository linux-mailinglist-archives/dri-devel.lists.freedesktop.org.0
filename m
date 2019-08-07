Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5D3845E6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEB96E67A;
	Wed,  7 Aug 2019 07:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E84E6E589;
 Wed,  7 Aug 2019 01:49:57 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d4a2e4e0000>; Tue, 06 Aug 2019 18:50:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 06 Aug 2019 18:49:56 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 06 Aug 2019 18:49:56 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Aug
 2019 01:49:55 +0000
Subject: Re: [PATCH v3 00/39] put_user_pages(): miscellaneous call sites
To: <john.hubbard@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <912eb2bd-4102-05c1-5571-c261617ad30b@nvidia.com>
Date: Tue, 6 Aug 2019 18:49:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1565142606; bh=Dn5BKjZ7JEBRqWgfa18GnM7OhUXy8yDZwMN3JIIxlGw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Ikr1Z0QmiSe2izYZJH1uqOSC6icnToC0RNMEpxuB23chpfLBCzP3w/AieqLXvDTl5
 WiAJO8Q4P7LqaICg9w9tXQj3/iPr6N76Dc9IbqJMajQoyinrqFfwgCWwW9UnKbczaL
 GaLoALYFsFwWv8Sy+VSzQYK1xKYCINe6tMld2WSk4jzjh2UDaUm/4PS/zoETIOvAHY
 Cv7DiogcZErrjHQstqfLwjbbIS2N4ESoffKtD4ugOTExuz4uGt5TgMT8y01S0TheeO
 6qVWyeW6YYVimOARtYB9SW21zJJlrmRpt7UH+8pXV98uEPUBYTW77sxtUkB504xqpb
 D9OLrQ7tTourQ==
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC82LzE5IDY6MzIgUE0sIGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6Cj4gRnJvbTog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+IC4uLgo+IAo+IEpvaG4gSHViYmFy
ZCAoMzgpOgo+ICAgbW0vZ3VwOiBhZGQgbWFrZV9kaXJ0eSBhcmcgdG8gcHV0X3VzZXJfcGFnZXNf
ZGlydHlfbG9jaygpCi4uLgo+ICA1NCBmaWxlcyBjaGFuZ2VkLCAxOTEgaW5zZXJ0aW9ucygrKSwg
MzIzIGRlbGV0aW9ucygtKQo+IAphaGVtLCB5ZXMsIGFwcGFyZW50bHkgdGhpcyBpcyB3aGF0IGhh
cHBlbnMgaWYgSSBhZGQgYSBmZXcgcGF0Y2hlcyB3aGlsZSBlZGl0aW5nCnRoZSBjb3ZlciBsZXR0
ZXIuLi4gOikgCgpUaGUgc3ViamVjdCBsaW5lIHNob3VsZCByZWFkICIwMC80MSIsIGFuZCB0aGUg
bGlzdCBvZiBmaWxlcyBhZmZlY3RlZCBoZXJlIGlzCnRoZXJlZm9yZSB1bmRlci1yZXBvcnRlZCBp
biB0aGlzIGNvdmVyIGxldHRlci4gSG93ZXZlciwgdGhlIHBhdGNoIHNlcmllcyBpdHNlbGYgaXMg
CmludGFjdCBhbmQgcmVhZHkgZm9yIHN1Ym1pc3Npb24uCgp0aGFua3MsCi0tIApKb2huIEh1YmJh
cmQKTlZJRElBCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
