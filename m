Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMVZCFQVomk0zAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 23:06:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3FA1BE759
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 23:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E575910EC48;
	Fri, 27 Feb 2026 22:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fb.com header.i=@fb.com header.b="lOEJPYrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 817 seconds by postgrey-1.36 at gabe;
 Fri, 27 Feb 2026 22:06:08 UTC
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94EF10EC48
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 22:06:08 +0000 (UTC)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RLG1FX2026789; Fri, 27 Feb 2026 13:52:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=s2048-2025-q2; bh=5tvzMNgRyjYeXUbWEgOr
 QCHGvdINQmVReqV33VO1vYg=; b=lOEJPYrFJfKPOl8EdQ0RmD6bms+WDShmruWF
 VnyoOrNZQG/H2KdhWY4lAJmoOWuqGhB1UvaPydl1MA3rW1Ey26Zhjz2gMXeJGEjh
 XTm6vLYGCuypDkWiMH4pRyCvDhlFQFjB7sQXIACKMD9yWCH64p+8wLwrVMnFWiQF
 oK5VIYWONtSXjLGoiYAHSqGVqRSdsPNOetlncfMZxQnNcb1NlbTIptP9TKIk7ymV
 IYplEsA5GHv3hXDm5vTFbHhDoGSKRqKUobAEhhNuEthR7SnXKj5Bh5Us2pblegt2
 ZZXaLosgNZ1KrvaHQS3fL7Wwt4/mxDE/4t6uECFPW7gG2EiMjQ==
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4ckfq3js3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 27 Feb 2026 13:52:20 -0800 (PST)
Received: from devgpu015.cco6.facebook.com (2620:10d:c085:108::150d) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 27 Feb 2026 21:52:19 +0000
Date: Fri, 27 Feb 2026 13:52:15 -0800
From: Alex Mastro <amastro@fb.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Matt Evans <mattev@meta.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Alex Williamson <alex@shazbot.org>, "Leon
 Romanovsky" <leon@kernel.org>, Mahmoud Adam <mngyadam@amazon.de>, "David
 Matlack" <dmatlack@google.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
 <bjorn@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian
 <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, "Pranjal
 Shrivastava" <praan@google.com>, Alistair Popple <apopple@nvidia.com>,
 "Vivek Kasireddy" <vivek.kasireddy@intel.com>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <kvm@vger.kernel.org>
Subject: Re: [RFC PATCH 3/7] vfio/pci: Support mmap() of a DMABUF
Message-ID: <aaISD4mw1XzQl1S8@devgpu015.cco6.facebook.com>
References: <20260226202211.929005-1-mattev@meta.com>
 <20260226202211.929005-4-mattev@meta.com>
 <90bd4185-1e87-4393-b9e1-1318a656a7d9@amd.com>
 <20260227125109.GH5933@nvidia.com>
 <c5a8f318-20af-4d80-a279-2393192108c3@meta.com>
 <20260227194807.GL5933@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260227194807.GL5933@nvidia.com>
X-Originating-IP: [2620:10d:c085:108::150d]
X-Proofpoint-ORIG-GUID: 9CjaaW2uuX_U6ybXFihlTHjBbB__gpks
X-Authority-Analysis: v=2.4 cv=OuJCCi/t c=1 sm=1 tr=0 ts=69a21214 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=9jRdOu3wAAAA:8 a=5gW12rAjPW6ZUhMuABQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE5NCBTYWx0ZWRfXyqdREz8O3V5t
 qlIto6yFmGf5tmYJHZjF+7puY4thZCaydDYsQ7U433LREt9hGqMLq59FcP1iNrkulf7fKNFdMnV
 d5i8vdC+Y+IJLjNm81qE+aLEo95cVryoQtPo/mWo4ojQ829BFivVpIkdr2DjIwQyH3uMyJlTtGZ
 VbeLzgzfi4Krv0i8QKNFq6up+wbHjX2MB+d/LeSG5ILKqghLDaSCQipBIxQ65Qx6IpU4IpnZjq+
 O/t0STrz7g/j7ZnyQlOEgPg4hBBVYK3JdymylpUYxjHNQKGbFL0AYiSI5LCGKPEQCv6LIyomPDH
 11vskgelQfR0TtO+Qh7At9I8sUzvpsnc6x7pegybIFwXHoH42mokfv/caUxaTeXS4sT2lkXpPBw
 kAatiNldR1FIY384IpHJa4mtnAJeat2dDsLEDI5jUgNGkbBKLVOjssIxQTSbuT4Ooxtmgn0I1Io
 kBoBqWltTCvjSUVlMFQ==
X-Proofpoint-GUID: 9CjaaW2uuX_U6ybXFihlTHjBbB__gpks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[fb.com,reject];
	R_DKIM_ALLOW(-0.20)[fb.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:mattev@meta.com,m:christian.koenig@amd.com,m:alex@shazbot.org,m:leon@kernel.org,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amastro@fb.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[fb.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[amastro@fb.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,devgpu015.cco6.facebook.com:mid,fb.com:dkim]
X-Rspamd-Queue-Id: 8A3FA1BE759
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 03:48:07PM -0400, Jason Gunthorpe wrote:
> > > I actually would like to go the other way and have VFIO always have a
> > > DMABUF under the VMA's it mmaps because that will make it easy to
> > > finish the type1 emulation which requires finding dmabufs for the
> > > VMAs.
> 
> This is a still better idea since it avoid duplicating the VMA flow
> into two parts..

I suppose this would also compose with your idea to use dma-buf for
iommufd_compat support of VFIO_IOMMU_MAP_DMA of vfio device fd-backed mmap()s
[1]? Instead of needing to materialize a new dma-buf, you could use the existing
backing one?

[1] https://lore.kernel.org/all/20260108141044.GC545276@ziepe.ca/
