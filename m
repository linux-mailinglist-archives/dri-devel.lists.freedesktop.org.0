Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6359CC23A84
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 09:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF1910EAC0;
	Fri, 31 Oct 2025 08:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fb.com header.i=@fb.com header.b="epe5O20x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 531 seconds by postgrey-1.36 at gabe;
 Thu, 30 Oct 2025 22:38:00 UTC
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F2510E0CD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 22:38:00 +0000 (UTC)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UM3pna1895091; Thu, 30 Oct 2025 15:28:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=60MefK3DxP+BN/HIANh8ofusObRmU+P87CCGRx3MEO0=; b=epe5O20xyR3j
 YqdW4KFFW/hKSzMmP6zxpSgyY+iAjdoiRJ/+1fZ+wpMdqBODgMbL3NtPVqIm9fXn
 x8KD+nhge1tAFU+UM7ib57i84EfUejMrkp4ywkavIftCYdfYPL+rg5TyuM4egAxp
 v730WeuN1y8ewqJYkdxzs+vF0OKA/mBfAZff8Mdlq8EyvuSoLvqO75SdNAY16w6j
 uZbkq8Y021f4I7CD+rct0ho/uS5M6fGUedgN4CujHW513K4iArOZm0gmlsx+gPqZ
 Qi8bw00rL9JiY8406oULQSWADhgiBvzYco4K9/0e4d4uZWV47Eh97AQSmjhfQ0Yg
 vjFgzZ4jXg==
Received: from maileast.thefacebook.com ([163.114.135.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4a4aakbt30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Oct 2025 15:28:47 -0700 (PDT)
Received: from devgpu015.cco6.facebook.com (2620:10d:c0a8:1b::8e35) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.20; Thu, 30 Oct 2025 22:28:44 +0000
Date: Thu, 30 Oct 2025 15:28:39 -0700
From: Alex Mastro <amastro@fb.com>
To: Leon Romanovsky <leon@kernel.org>
CC: David Matlack <dmatlack@google.com>, Alex Williamson
 <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <iommu@lists.linux.dev>, Jens Axboe
 <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 <kvm@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-pci@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Robin
 Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 9/9] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <aQPmlwaoqPPFeyN/@devgpu015.cco6.facebook.com>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
 <CALzav=cj_g8ndvbWdm=dukW+37cDh04k1n7ssFrDG+dN3D+cbw@mail.gmail.com>
 <20251028120207.GQ12554@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028120207.GQ12554@unreal>
X-Originating-IP: [2620:10d:c0a8:1b::8e35]
X-Proofpoint-GUID: 0ZpO7X-t6Kgi2VjTgweWDl_lcxnq2iwh
X-Authority-Analysis: v=2.4 cv=MKVtWcZl c=1 sm=1 tr=0 ts=6903e69f cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=7nlfRzPPCwOAtMVn9e4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: 0ZpO7X-t6Kgi2VjTgweWDl_lcxnq2iwh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE5MCBTYWx0ZWRfX9llSfoX60trR
 mXbkBVBl55Urqb11S4qwjm/pObJY1X+1S60diRRsEHth5MOf7IKq4Czoup72ugb8Fl7vtg6Umws
 T0wR1zGVKO57L2GHA+0qVpD49RE7de+O2DlACYm/FDEOQ+atQFmHmE8OEvSGvK9Gg4KMjnnZt8P
 9eo89vLlcLa+5jC4ltXqN6ZnruT3+bwwmAoV+36wLcYx0ULiPIRAKmAFs3n7/cl40zFJ4huLoWi
 lhzkX2aFxuaPfA92Kwt7K+H/vFc1bREnntF0tAc+FIeWaqYsNtchscW+GO7K0feCvrH6ojQzyNc
 9LmYvsWx+Z1+kjfzugACbFQ5EapodjjO8oosw2rM7ft6LeldzwV/2j0JbuFgschcLfnZT3p4l5a
 f0vHibOGQ5TJGIf/lMEHHGx/tX27mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_07,2025-10-29_03,2025-10-01_01
X-Mailman-Approved-At: Fri, 31 Oct 2025 08:05:47 +0000
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

> On Mon, Oct 27, 2025 at 04:13:05PM -0700, David Matlack wrote:
> > On Mon, Oct 13, 2025 at 8:44 AM Leon Romanovsky <leon@kernel.org> wrote:
> > This uAPI would be a good candidate for a VFIO selftest. You can test
> > that it returns an error when it's supposed to, and a valid fd when
> > it's supposed to. And once the iommufd importer side is ready, we can
> > extend the test and verify that the fd can be mapped into iommufd.
> 
> No problem, I'll add such test, but let's focus on making sure that this
> series is accepted first.

Along similar lines, perhaps adding vfio as src/vfio_memory.c dmabuf provider
to perftest [1] could be useful for low-level end-to-end validation.

https://github.com/linux-rdma/perftest
