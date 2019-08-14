Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D65DB8E700
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430DC6E91C;
	Thu, 15 Aug 2019 08:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 605 seconds by postgrey-1.36 at gabe;
 Wed, 14 Aug 2019 17:28:22 UTC
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAB56E79D;
 Wed, 14 Aug 2019 17:28:22 +0000 (UTC)
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7EGvC4f020879; Wed, 14 Aug 2019 17:18:09 GMT
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
 by mx0b-002e3701.pphosted.com with ESMTP id 2ucm0vh8y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Aug 2019 17:18:09 +0000
Received: from g4t3433.houston.hpecorp.net (g4t3433.houston.hpecorp.net
 [16.208.49.245])
 by g9t5008.houston.hpe.com (Postfix) with ESMTP id 92E2768;
 Wed, 14 Aug 2019 17:18:07 +0000 (UTC)
Received: from hpe.com (teo-eag.americas.hpqcorp.net [10.33.152.10])
 by g4t3433.houston.hpecorp.net (Postfix) with ESMTP id 4CB6F45;
 Wed, 14 Aug 2019 17:18:06 +0000 (UTC)
Date: Wed, 14 Aug 2019 12:18:06 -0500
From: Dimitri Sivanich <sivanich@hpe.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH v3 hmm 04/11] misc/sgi-gru: use mmu_notifier_get/put for
 struct gru_mm_struct
Message-ID: <20190814171806.GA14680@hpe.com>
References: <20190806231548.25242-1-jgg@ziepe.ca>
 <20190806231548.25242-5-jgg@ziepe.ca> <20190808102556.GB648@lst.de>
 <20190814155830.GO13756@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814155830.GO13756@mellanox.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=636 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140158
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Gavin Shan <shangw@linux.vnet.ibm.com>,
 Andrea Righi <andrea@betterlinux.com>, Dimitri Sivanich <sivanich@hpe.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDM6NTg6MzRQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDEyOjI1OjU2UE0gKzAyMDAsIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gTG9va3MgZ29vZCwKPiA+IAo+ID4gUmV2aWV3ZWQtYnk6
IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IAo+IERpbWl0cmksIGFyZSB5b3UgT0sg
d2l0aCB0aGlzIHBhdGNoPwo+CgpJIHRoaW5rIHRoaXMgbG9va3MgT0suCgpSZXZpZXdlZC1ieTog
RGltaXRyaSBTaXZhbmljaCA8c2l2YW5pY2hAaHBlLmNvbT4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
