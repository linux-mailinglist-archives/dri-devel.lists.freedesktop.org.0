Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339FEFA900
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 05:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDFD6EC80;
	Wed, 13 Nov 2019 04:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAF26EC80
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 04:32:18 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb87190000>; Tue, 12 Nov 2019 20:31:22 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 20:32:17 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 20:32:17 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 04:32:17 +0000
Subject: Re: [PATCH v4 00/23] mm/gup: track dma-pinned pages: FOLL_PIN,
 FOLL_LONGTERM
To: Andrew Morton <akpm@linux-foundation.org>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <a5643f32-8042-e15c-79d4-e0bc33ac1b2a@nvidia.com>
Date: Tue, 12 Nov 2019 20:32:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191113042710.3997854-1-jhubbard@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573619482; bh=9MYVN1A24F5KMhsTpe2jh2+1l84haCmmXioa968HG3Y=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=EwP/5K+3axBrG9EQOUg4jsbXDRbQDPqrNar3/oXYxw5NAT2tOuIKfR/eL/VUzARMl
 QJrOiU2d/1m6JosvwxhX/JacNsmyZG5rUp/Qs79iYaNa9HKhPMWBWvQBG1vOriSa3h
 MDF50VmkLPo09BZBrA1YUsgNitEaGzypJkC6UBbCw145jP32bANHIqLfetZ5Icqetb
 ewLKckxEU0ktL027LZfwyssgGodt3o1mvuEHITquD4KZ9bP8YjWtRhZXeB5Wung03P
 Iw87DVEOcp/IvTeRqpg2L4nQJZ96wyFEpbFlKtfCRdODk9mvuk0cAAWNOsTw5mhiqN
 DZB1rRUH2zj3w==
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

T24gMTEvMTIvMTkgODoyNiBQTSwgSm9obiBIdWJiYXJkIHdyb3RlOgo+IE9LLCBoZXJlIHdlIGdv
LiBBbnkgVkZJTyBhbmQgSW5maW5pYmFuZCBydW50aW1lIHRlc3RpbmcgZnJvbSBhbnlvbmUsIGlz
Cj4gZXNwZWNpYWxseSB3ZWxjb21lIGhlcmUuCj4gCgpPaCwgYW5kIHRvIG1ha2UgdGhhdCBlYXNp
ZXIsIHRoZXJlIGlzIGEgZ2l0IHJlcG8gYW5kIGJyYW5jaCwgaGVyZToKCiAgICBnaXRAZ2l0aHVi
LmNvbTpqb2huaHViYmFyZC9saW51eC5naXQgcGluX3VzZXJfcGFnZXNfdHJhY2tpbmdfdjQKCgp0
aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
