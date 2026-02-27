Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EF2/Mv0WomnFzAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 23:13:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C611BE926
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 23:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E8610EC49;
	Fri, 27 Feb 2026 22:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fb.com header.i=@fb.com header.b="Vt6Dfnbw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 738 seconds by postgrey-1.36 at gabe;
 Fri, 27 Feb 2026 22:13:12 UTC
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0975810EC49
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 22:13:11 +0000 (UTC)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RLFT4w330942; Fri, 27 Feb 2026 14:00:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=s2048-2025-q2; bh=HAR+YwHCQEx8FQPFwnPF
 8kbIEZCPvpG17d9RDjMoOD0=; b=Vt6Dfnbwa02wdLXXsDppEs3aB3zzTXE3fpnW
 siKptPO0oMgFOBjl8hkKLdG8P3W9E8m8w14qsnZynGnMklAliAxrBZCIQMtGB/QF
 uc5Z2zMoxF1gS7HQGHeIzF6Qw2etqxp0fT43WN1FIC0DsFGHFyzayOlzny4J/C22
 EjA3pSYTDPkANsqG2PTwCkt9HOT0MNI0NVhqVdag5xCmNx5WecdUArBntUrDCQIS
 H/iFwWtDXqjGnRbocne31okPRty8nHj8Py8iIVrykuOxHa5OIqSGTI8RoWzn4l6r
 iDFWyDFZYd8RLgE3Joy7ozAJ38+LIegSrIhML2O3IpU2WN3AiA==
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4ckfq4at00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 27 Feb 2026 14:00:45 -0800 (PST)
Received: from devgpu015.cco6.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 27 Feb 2026 22:00:43 +0000
Date: Fri, 27 Feb 2026 14:00:38 -0800
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
Message-ID: <aaIT9SmOAOF4Jjy1@devgpu015.cco6.facebook.com>
References: <20260226202211.929005-1-mattev@meta.com>
 <20260226202211.929005-4-mattev@meta.com>
 <90bd4185-1e87-4393-b9e1-1318a656a7d9@amd.com>
 <20260227125109.GH5933@nvidia.com>
 <c5a8f318-20af-4d80-a279-2393192108c3@meta.com>
 <20260227194807.GL5933@nvidia.com>
 <aaISD4mw1XzQl1S8@devgpu015.cco6.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aaISD4mw1XzQl1S8@devgpu015.cco6.facebook.com>
X-Originating-IP: [2620:10d:c085:108::4]
X-Authority-Analysis: v=2.4 cv=RYqdyltv c=1 sm=1 tr=0 ts=69a2140d cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=9jRdOu3wAAAA:8 a=V06E79E7ZWWwZtoFcR4A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-GUID: 6QWGOPFSRTQAgV1H-lPBFelJW9RsIEhM
X-Proofpoint-ORIG-GUID: 6QWGOPFSRTQAgV1H-lPBFelJW9RsIEhM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE5NSBTYWx0ZWRfX8JJtLCQXqeDW
 AUzmo75nyZ+mC2q0y1ZkuWh6Vih1BgaEYz+KoOm9UZsBQwdkvBAwKkVjJ+WDFNxFZXPO8Lxvg0o
 d8mFLjSnq1W3fVfJKwe2IGfRFTivKq0D5OH3nnl2ZwknXpqbeYtg+C691OLckIfU++wZ7vpbngr
 PcFmeti+s/zACqPyqtPM8OEwhq2JdTEWQAz8SuxbCvHI234aNnysOHkFDS7cy9uLN7eE+McmyAK
 /B/oK6ZxZ0S4mmu6zsk6KCvjuaCjkABlrduoBn3OmQRFlOhrtVG4PNjDOQtos5ztGYThO/rhyVN
 wAnxk69WbRZOzVEU2T7lPCXGIrLZ+xgVEUki31v2dnkREcGJWBFmE50t/WruwkKkc7sWwG8sgfA
 Wa5bP4bo3iwfnrz9LKMGxXImpSN+niUT3jdVabBrAZz+RVnPrTivlzIgkHXwxKuHRkBQhibkTxU
 r5qZnRjlPV+36v677YA==
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:mattev@meta.com,m:christian.koenig@amd.com,m:alex@shazbot.org,m:leon@kernel.org,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[amastro@fb.com,dri-devel-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[fb.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,devgpu015.cco6.facebook.com:mid]
X-Rspamd-Queue-Id: 29C611BE926
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 01:52:15PM -0800, Alex Mastro wrote:
> On Fri, Feb 27, 2026 at 03:48:07PM -0400, Jason Gunthorpe wrote:
> > > > I actually would like to go the other way and have VFIO always have a
> > > > DMABUF under the VMA's it mmaps because that will make it easy to
> > > > finish the type1 emulation which requires finding dmabufs for the
> > > > VMAs.
> > 
> > This is a still better idea since it avoid duplicating the VMA flow
> > into two parts..
> 
> I suppose this would also compose with your idea to use dma-buf for
> iommufd_compat support of VFIO_IOMMU_MAP_DMA of vfio device fd-backed mmap()s
> [1]? Instead of needing to materialize a new dma-buf, you could use the existing
> backing one?
> 
> [1] https://lore.kernel.org/all/20260108141044.GC545276@ziepe.ca/

Sorry, I can't read. That's literally what you said!
