Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09118ACFFD1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 11:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365EE10EA20;
	Fri,  6 Jun 2025 09:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D5810EA20
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 09:53:07 +0000 (UTC)
Received: from w013.hihonor.com (unknown [10.68.26.19])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bDGm20Yh8zYm12N;
 Fri,  6 Jun 2025 17:50:58 +0800 (CST)
Received: from a015.hihonor.com (10.68.27.88) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Jun
 2025 17:52:55 +0800
Received: from a010.hihonor.com (10.68.16.52) by a015.hihonor.com
 (10.68.27.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Jun
 2025 17:52:54 +0800
Received: from a010.hihonor.com ([fe80::7127:3946:32c7:6e]) by
 a010.hihonor.com ([fe80::7127:3946:32c7:6e%14]) with mapi id 15.02.1544.011;
 Fri, 6 Jun 2025 17:52:54 +0800
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
Thread-Index: AQHb1G1ol+FT389RFkuW+lwB3adoKrPw4BKAgAADywCAAAF8AIAE6kCg
Date: Fri, 6 Jun 2025 09:52:54 +0000
Message-ID: <5d36abace6bf492aadd847f0fabc38be@honor.com>
References: <20250603095245.17478-1-tao.wangtao@honor.com>
 <aD7x_b0hVyvZDUsl@infradead.org>
 <09c8fb7c-a337-4813-9f44-3a538c4ee8b1@amd.com>
 <aD72alIxu718uri4@infradead.org>
In-Reply-To: <aD72alIxu718uri4@infradead.org>
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
> Sent: Tuesday, June 3, 2025 9:20 PM
> To: Christian K=F6nig <christian.koenig@amd.com>
> Cc: Christoph Hellwig <hch@infradead.org>; wangtao
> <tao.wangtao@honor.com>; sumit.semwal@linaro.org; kraxel@redhat.com;
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
> On Tue, Jun 03, 2025 at 03:14:20PM +0200, Christian K=F6nig wrote:
> > On 6/3/25 15:00, Christoph Hellwig wrote:
> > > This is a really weird interface.  No one has yet to explain why
> > > dmabuf is so special that we can't support direct I/O to it when we
> > > can support it to otherwise exotic mappings like PCI P2P ones.
> >
> > With udmabuf you can do direct I/O, it's just inefficient to walk the
> > page tables for it when you already have an array of all the folios.
>=20
> Does it matter compared to the I/O in this case?
>=20
> Either way there has been talk (in case of networking implementations) th=
at
> use a dmabuf as a first class container for lower level I/O.
> I'd much rather do that than adding odd side interfaces.  I.e. have a ver=
sion
> of splice that doesn't bother with the pipe, but instead just uses in-ker=
nel
> direct I/O on one side and dmabuf-provided folios on the other.
If the VFS layer recognizes dmabuf type and acquires its sg_table
and folios, zero-copy could also be achieved. I initially thought
dmabuf acts as a driver and shouldn't be handled by VFS, so I made
dmabuf implement copy_file_range callbacks to support direct I/O
zero-copy. I'm open to both approaches. What's the preference of
VFS experts?

Regards,
Wangtao.

