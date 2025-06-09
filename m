Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07F6AD1A9E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 11:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF6310E081;
	Mon,  9 Jun 2025 09:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B49010E081
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 09:32:28 +0000 (UTC)
Received: from w001.hihonor.com (unknown [10.68.25.235])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4bG68R70G6zYl5Jm;
 Mon,  9 Jun 2025 17:29:59 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Jun
 2025 17:32:21 +0800
Received: from a010.hihonor.com (10.68.16.52) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Jun
 2025 17:32:20 +0800
Received: from a010.hihonor.com ([fe80::7127:3946:32c7:6e]) by
 a010.hihonor.com ([fe80::7127:3946:32c7:6e%14]) with mapi id 15.02.1544.011;
 Mon, 9 Jun 2025 17:32:20 +0800
From: wangtao <tao.wangtao@honor.com>
To: Christoph Hellwig <hch@infradead.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "vivek.kasireddy@intel.com" <vivek.kasireddy@intel.com>, 
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "brauner@kernel.org"
 <brauner@kernel.org>, "hughd@google.com" <hughd@google.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "amir73il@gmail.com"
 <amir73il@gmail.com>, "benjamin.gaignard@collabora.com"
 <benjamin.gaignard@collabora.com>, "Brian.Starkey@arm.com"
 <Brian.Starkey@arm.com>, "jstultz@google.com" <jstultz@google.com>,
 "tjmercier@google.com" <tjmercier@google.com>, "jack@suse.cz" <jack@suse.cz>, 
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "wangbintian(BintianWang)"
 <bintian.wang@honor.com>, yipengxiang <yipengxiang@honor.com>, liulu 00013167
 <liulu.liu@honor.com>, hanfeng 00012985 <feng.han@honor.com>
Subject: RE: [PATCH v4 0/4] Implement dmabuf direct I/O via copy_file_range
Thread-Topic: [PATCH v4 0/4] Implement dmabuf direct I/O via copy_file_range
Thread-Index: AQHb1G1ol+FT389RFkuW+lwB3adoKrPw4BKAgAADywCAAAF8AIAE6kCg//+rigCABEW6AIAA1IFw
Date: Mon, 9 Jun 2025 09:32:20 +0000
Message-ID: <761986ec0f404856b6f21c3feca67012@honor.com>
References: <20250603095245.17478-1-tao.wangtao@honor.com>
 <aD7x_b0hVyvZDUsl@infradead.org>
 <09c8fb7c-a337-4813-9f44-3a538c4ee8b1@amd.com>
 <aD72alIxu718uri4@infradead.org> <5d36abace6bf492aadd847f0fabc38be@honor.com>
 <a766fbf4-6cda-43a5-a1c7-61a3838f93f9@amd.com>
 <aEZkjA1L-dP_Qt3U@infradead.org>
In-Reply-To: <aEZkjA1L-dP_Qt3U@infradead.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.163.18.240]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Christoph Hellwig <hch@infradead.org>
> Sent: Monday, June 9, 2025 12:35 PM
> To: Christian K=F6nig <christian.koenig@amd.com>
> Cc: wangtao <tao.wangtao@honor.com>; Christoph Hellwig
> <hch@infradead.org>; sumit.semwal@linaro.org; kraxel@redhat.com;
> vivek.kasireddy@intel.com; viro@zeniv.linux.org.uk; brauner@kernel.org;
> hughd@google.com; akpm@linux-foundation.org; amir73il@gmail.com;
> benjamin.gaignard@collabora.com; Brian.Starkey@arm.com;
> jstultz@google.com; tjmercier@google.com; jack@suse.cz;
> baolin.wang@linux.alibaba.com; linux-media@vger.kernel.org; dri-
> devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; linux-
> kernel@vger.kernel.org; linux-fsdevel@vger.kernel.org; linux-
> mm@kvack.org; wangbintian(BintianWang) <bintian.wang@honor.com>;
> yipengxiang <yipengxiang@honor.com>; liulu 00013167
> <liulu.liu@honor.com>; hanfeng 00012985 <feng.han@honor.com>
> Subject: Re: [PATCH v4 0/4] Implement dmabuf direct I/O via
> copy_file_range
>=20
> On Fri, Jun 06, 2025 at 01:20:48PM +0200, Christian K=F6nig wrote:
> > > dmabuf acts as a driver and shouldn't be handled by VFS, so I made
> > > dmabuf implement copy_file_range callbacks to support direct I/O
> > > zero-copy. I'm open to both approaches. What's the preference of VFS
> > > experts?
> >
> > That would probably be illegal. Using the sg_table in the DMA-buf
> > implementation turned out to be a mistake.
>=20
> Two thing here that should not be directly conflated.  Using the sg_table=
 was
> a huge mistake, and we should try to move dmabuf to switch that to a pure
I'm a bit confused: don't dmabuf importers need to traverse sg_table to
access folios or dma_addr/len? Do you mean restricting sg_table access
(e.g., only via iov_iter) or proposing alternative approaches?

> dma_addr_t/len array now that the new DMA API supporting that has been
> merged.  Is there any chance the dma-buf maintainers could start to kick =
this
> off?  I'm of course happy to assist.
>=20
> But that notwithstanding, dma-buf is THE buffer sharing mechanism in the
> kernel, and we should promote it instead of reinventing it badly.
> And there is a use case for having a fully DMA mapped buffer in the block
> layer and I/O path, especially on systems with an IOMMU.
> So having an iov_iter backed by a dma-buf would be extremely helpful.
> That's mostly lib/iov_iter.c code, not VFS, though.
Are you suggesting adding an ITER_DMABUF type to iov_iter, or
implementing dmabuf-to-iov_bvec conversion within iov_iter?

>=20
> > The question Christoph raised was rather why is your CPU so slow that
> > walking the page tables has a significant overhead compared to the
> > actual I/O?
>=20
> Yes, that's really puzzling and should be addressed first.
With high CPU performance (e.g., 3GHz), GUP (get_user_pages) overhead
is relatively low (observed in 3GHz tests).
|    32x32MB Read 1024MB    |Creat-ms|Close-ms|  I/O-ms|I/O-MB/s| I/O%
|---------------------------|--------|--------|--------|--------|-----
| 1)        memfd direct R/W|      1 |    118 |    312 |   3448 | 100%
| 2)      u+memfd direct R/W|    196 |    123 |    295 |   3651 | 105%
| 3) u+memfd direct sendfile|    175 |    102 |    976 |   1100 |  31%
| 4)   u+memfd direct splice|    173 |    103 |    443 |   2428 |  70%
| 5)      udmabuf buffer R/W|    183 |    100 |    453 |   2375 |  68%
| 6)       dmabuf buffer R/W|     34 |      4 |    427 |   2519 |  73%
| 7)    udmabuf direct c_f_r|    200 |    102 |    278 |   3874 | 112%
| 8)     dmabuf direct c_f_r|     36 |      5 |    269 |   4002 | 116%

With lower CPU performance (e.g., 1GHz), GUP overhead becomes more
significant (as seen in 1GHz tests).
|    32x32MB Read 1024MB    |Creat-ms|Close-ms|  I/O-ms|I/O-MB/s| I/O%
|---------------------------|--------|--------|--------|--------|-----
| 1)        memfd direct R/W|      2 |    393 |    969 |   1109 | 100%
| 2)      u+memfd direct R/W|    592 |    424 |    570 |   1884 | 169%
| 3) u+memfd direct sendfile|    587 |    356 |   2229 |    481 |  43%
| 4)   u+memfd direct splice|    568 |    352 |    795 |   1350 | 121%
| 5)      udmabuf buffer R/W|    597 |    343 |   1238 |    867 |  78%
| 6)       dmabuf buffer R/W|     69 |     13 |   1128 |    952 |  85%
| 7)    udmabuf direct c_f_r|    595 |    345 |    372 |   2889 | 260%
| 8)     dmabuf direct c_f_r|     80 |     13 |    274 |   3929 | 354%

Regards,
Wangtao.
