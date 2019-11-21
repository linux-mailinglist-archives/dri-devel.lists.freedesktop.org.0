Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21854104E8C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF116EBD1;
	Thu, 21 Nov 2019 08:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAE86EBD1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 08:57:42 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd651870000>; Thu, 21 Nov 2019 00:57:43 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 Nov 2019 00:57:42 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 Nov 2019 00:57:42 -0800
Received: from [10.2.169.101] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 08:57:41 +0000
Subject: Re: [PATCH v7 05/24] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
To: Christoph Hellwig <hch@lst.de>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-6-jhubbard@nvidia.com> <20191121080555.GC24784@lst.de>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <c5f8750f-af82-8aec-ce70-116acf24fa82@nvidia.com>
Date: Thu, 21 Nov 2019 00:54:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191121080555.GC24784@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574326663; bh=YGQbxCYiHGws7JmssYZZfu4b/BH3QCdRJ1MPzdi8DdI=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=FbrZ4378j2iyBO9hvWSMloyNdNsTUz/psuT/NCUARgzB35AW0Wq9ueJvfblZCosk7
 /+/rxtO6ichr/aFPIlD7xLBQtc9hq7EFIF6lCnNn9hnclEWNCKgA7YoyhRbt/m4Vsk
 wRmCgWdXHHISljd4LjYmGbzccrPj5+Fa1JlqaI75caluLphJJldJZkgCWUPC0xholt
 6X13AINTENnATeVUOSXXiPHblxU1cCkaaO1aE9kIv76y0chkTgEt3S0BIhZzBbKb9q
 pD1vYn6vGejSUU1Vf+Wlw9+f+WagzvL/JI66W61oW1V6Mdo52NCQD9IyiBTxjX+ttQ
 VAYphrAfRS+XQ==
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

T24gMTEvMjEvMTkgMTI6MDUgQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IFNvIHdoaWxl
IHRoaXMgbG9va3MgY29ycmVjdCBhbmQgSSBzdGlsbCByZWFsbHkgZG9uJ3Qgc2VlIHRoZSBtYWpv
cgo+IGJlbmVmaXQgb2YgdGhlIG5ldyBjb2RlIG9yZ2FuaXphdGlvbiwgZXNwZWNpYWxseSBhcyBp
dCBibG9hdHMgYWxsCj4gcHV0X3BhZ2UgY2FsbGVycy4KPiAKPiBJJ2QgbG92ZSB0byBzZWUgY29k
ZSBzaXplIGNoYW5nZSBzdGF0cyBmb3IgYW4gYWxseWVzY29uZmlnIG9uIHRoaXMKPiBjb21taXQu
Cj4gCgpSaWdodCwgSSdtIHJ1bm5pbmcgdGhhdCBub3csIHdpbGwgcG9zdCB0aGUgcmVzdWx0cy4g
KGJ0dywgaWYgdGhlcmUgaXMKYSBzY3JpcHQgYW5kL29yIHN0YW5kYXJkIGZvcm1hdCBJIHNob3Vs
ZCB1c2UsIEknbSBhbGwgZWFycy4gSSdsbCBkaWcKdGhyb3VnaCBsd24uLi4pCgoKCnRoYW5rcywK
LS0gCkpvaG4gSHViYmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
