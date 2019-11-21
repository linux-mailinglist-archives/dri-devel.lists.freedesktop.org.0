Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30563104E5A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38AB6EBD0;
	Thu, 21 Nov 2019 08:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29046EBD0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 08:51:00 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd64ff00000>; Thu, 21 Nov 2019 00:50:56 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 Nov 2019 00:51:00 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 Nov 2019 00:51:00 -0800
Received: from [10.2.169.101] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 08:50:57 +0000
Subject: Re: [PATCH v7 09/24] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Christoph Hellwig <hch@infradead.org>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-10-jhubbard@nvidia.com>
 <20191121081019.GF30991@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <daa90e74-ce6c-726f-c16c-b973390e96f7@nvidia.com>
Date: Thu, 21 Nov 2019 00:48:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191121081019.GF30991@infradead.org>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574326256; bh=UHmS3HaBGjmYSzQqUGVl3ICvWTX3pmd5BL/EguYi/Wc=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Z+x3gLJVvvSsNmbJxfvKoMQ17fDDVhYzRi55HX3hITWwCeb/BaThjwuDfHWXQ2K53
 HFWjGPFJfyLqqMrztMFqHTp5+odo6bntDk66mQpkwmHgD01l6MePY7oBu7dI5amAm6
 mWFXkb+WtDqpHKuOwqy4u+Q0ATobQoK3TAaBcowjz8gxjeZ/26gNn7iyrr8lBXskIU
 BLJxtARBqO9pllqLJ3t6UR+2fLAc7BGxsr6AdGvtx7Jig1eMZiQdgTKDRL70xPfI7p
 LawM9A5bl0tFutwK8JCa4Nii1wdq73PZcJlgKxDsflTxNmTDOzy8kVbjCi6X76PtZx
 SiFb+OtUTa48Q==
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
 linux-mm@kvack.org, Paul
 Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jason Gunthorpe <jgg@mellanox.com>,
 Vlastimil Babka <vbabka@suse.cz>,
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

T24gMTEvMjEvMTkgMTI6MTAgQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IFNob3VsZCB0
aGlzIGJlIHR3byBwYXRjaGVzLCBvbmUgZm9yIHRoIGNvcmUgaW5mcmFzdHJ1Y3R1cmUgYW5kIG9u
ZSBmb3IKPiB0aGUgdXNlcj8gIFRoZXNlIGNoYW5nZXMgYWxzbyBsb29rIGxpa2UgYW5vdGhlciBj
YW5kaWRhdGUgdG8gcHJlLWxvYWQuCgpPSywgSSdsbCBzcGxpdCB0aGVtIHVwLgoKCnRoYW5rcywK
LS0gCkpvaG4gSHViYmFyZApOVklESUEKICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
