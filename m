Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAdkFQiErWkx3wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:13:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84492308AE
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFC410E048;
	Sun,  8 Mar 2026 14:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="lAQtG2f1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A8010E05E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 19:33:59 +0000 (UTC)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626IwWUt1880896
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 11:33:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=Fsto2bYwR+ti6PcdpnLAZ8WgpkSbDqRu1vLh7+qCvp0=; b=lAQtG2f1cYKB
 CMenZmgF1mN6BzQuvQNceqCAksQNcRbOIMYgHvJBnXCyNz/9BFVibDWgt9YqTeI4
 Rzvf15wDDn4BYjb+DwZR3LRZ3WSSgGAmsU92JQ93NEPDKcombFHYkrlPbkghDKLY
 s/MAxLfwuew2hMjapyMhU/j7my/sxMoVXIvnIw+AuGI6UqV+LPyjH1q49fNvhatr
 museB50kmxTJg8NoSg8y/xl5ZncT4grWff7iyznukaV+WzD9n7ohx00Xror+Ddva
 G6NakstPGPlhQhdqEGvPK0vUWPYPFAHWjzDT6l+XkLDHbZG6RblSS9kCNqfeYZnM
 9MkqIvK6uA==
Received: from maileast.thefacebook.com ([163.114.135.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4cqrh7fyuk-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 11:33:58 -0800 (PST)
Received: from twshared10186.03.snb1.facebook.com (2620:10d:c0a8:fe::f072) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 6 Mar 2026 19:33:55 +0000
Received: by devbig259.ftw1.facebook.com (Postfix, from userid 664516)
 id AEFC812CCCB13; Fri,  6 Mar 2026 11:27:53 -0800 (PST)
From: Zhiping Zhang <zhipingz@meta.com>
To: Keith Busch <kbusch@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Leon
 Romanovsky <leon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, <linux-rdma@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <netdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Yochai Cohen <yochai@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhiping Zhang <zhipingz@meta.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC 1/2] Vfio: add callback to get tph info for dmabuf
Date: Fri, 6 Mar 2026 11:27:49 -0800
Message-ID: <20260306192753.3245649-1-zhipingz@meta.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aaDrp7teQoutU79s@kbusch-mbp>
References: <aaDrp7teQoutU79s@kbusch-mbp>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LgtYIV_90f6w7QxKB_QsMEn9B3VYTbG_
X-Authority-Analysis: v=2.4 cv=LOlrgZW9 c=1 sm=1 tr=0 ts=69ab2c26 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=8elwO82fXORLTBIkMd32:22 a=l2nmrgH_Uvo59uWC4d4A:9
X-Proofpoint-GUID: LgtYIV_90f6w7QxKB_QsMEn9B3VYTbG_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE4NSBTYWx0ZWRfXykW5DhkeIyhk
 nqWWHcRzAosPIqMvxRCCs7npRiEABHdNuWenMOirTXSB+OTeio74qhSiwvHciAK37ltLcuLqHwG
 B5HTJacUlf5By2l7cCRRwGiOHL3sgQBs/TVqwV6BqvJMNQScUtXoJR6b8Pr8Ws+LDnnZAGTL4Io
 MSZp8xc1ZLk6SL1V8UKVwxF6zK8m1SGhl+Ub2lrKX7a0Ylm+34IN4jFyu3SXYDVt2AsCmTeZTV6
 AMlqUJ1Q5OaCwLnQs8Tl25qgLEeYLQwMBXTjvTM7QetRt+XZHbf7zd6NxgJE4R9js9ou7Sjvdfy
 TdlCkoOfDSx3nHS+MYKGoDn0S3+DvaiatNP7xkd1Vz2pYBT3wAcYVqBxLk6Vs9jYrhGd3JtNyL7
 GAogmn03zgIV+BKOQs7g5Tx+c1oPPYXc2N/8Eg12jRNp3on6ApotrF3sdus8vuFe6rpSxdsOfvQ
 xmfCvxlD6mFdsBqwFSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: D84492308AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	DATE_IN_PAST(1.00)[42];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kbusch@kernel.org,m:jgg@ziepe.ca,m:leon@kernel.org,m:bhelgaas@google.com,m:linux-rdma@vger.kernel.org,m:linux-pci@vger.kernel.org,m:netdev@vger.kernel.org,m:yochai@nvidia.com,m:yishaih@nvidia.com,m:zhipingz@meta.com,m:helgaas@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[zhipingz@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[zhipingz@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,meta.com:dkim,meta.com:mid]
X-Rspamd-Action: no action

On Thu, 26 Feb 2026 17:56:07 -0700, Keith Busch wrote:

> > diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> > index ac2329f24141..bff2f5f7e38d 100644
> > --- a/include/uapi/linux/vfio.h
> > +++ b/include/uapi/linux/vfio.h
> > @@ -1501,6 +1501,8 @@ struct vfio_region_dma_range {
> > struct vfio_device_feature_dma_buf {
> >		__u32	region_index;
> >		__u32	open_flags;
> > +		__u16   steering_tag;
> > +		__u8    ph;
> >		__u32   flags;
> >		__u32   nr_ranges;
> >		struct vfio_region_dma_range dma_ranges[] __counted_by(nr_ranges);
>
> I don't think you can add fields to a uapi struct like this since it
> breaks comptibility. Instead, I think you may be able to carve it out o=
f
> the "flags" field since it's currently reserved to be 0, so I guess it'=
s
> potentially available to define a new feature.

Sure, thanks for the suggestion, yes I can also use the 'flags' field
for this.

Zhiping


