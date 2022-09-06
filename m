Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC4C5AF335
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8BE10E721;
	Tue,  6 Sep 2022 17:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2066.outbound.protection.outlook.com [40.107.212.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E40610E721
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 17:59:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KM+Wb6iJtmgNnqLzNR39iGPK4vVeMv9JId05nJ/mse3aHnEJVv4l7XJi5ftFY1HEjmy2G/quMw2GT785f9mNER26XCzpZ3lNp7ZvonsyxjcbXdDfbmf4admpokkCC3cZKkd+EJEhgHP4l9ye2QExiCDqBAiXbtOxOsK9i+L20M0oMVKsZ578vTZZkHtifjOTN1aiEIgwHGwousOFbb0Jxl1ZtKfyzeuPlwEHPwv2W2XRHd3zxrCuUfsp8wGUHrUlYfFBzvsjLVwzbb+voUznSba1zLAifau1AIM9b2iHvC9F8VdEAZlrwb64hL1ISyxS1SdVVYLPSk88WsNdVwiT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPBe0Mo7BwLdm1Cjdu2xFzCaGIcWRx50sN6KNnVhRgU=;
 b=kVNYMvPT9Fw4EIMlh9rpn5ZIv2THnmo4Nxe98/lvCMPOJAITXwzVsiJLW24jz3lajDVq0EZaEztsYfzUk17SY/++y3OG04BpBN8vu9bAaQ3oJxCK0xfI4i/voj9W7fwu5EklAAZE0a32JNuPGn2dMtz7X3SW/p9ZxEVPDr2kCA5gmijG3xIATTADemF1NQMSxOdueqMuLRGcI/+TLC86fl/TTF4fy/Af66Skh76mW3zZP5KU5lxovtQ1wfxwq+snGQZwKUoRrcEwzND6MHXneQfbcmsNPLEsN2+N2M0Xk/JJE1amTZ2Wm7uSBLZeL4Vlulya9A4YxZo+gADY30vIgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPBe0Mo7BwLdm1Cjdu2xFzCaGIcWRx50sN6KNnVhRgU=;
 b=Xh9Tjtb5DH8q3mLNrYPT3/bKPajAog6g5zi7e2TnFPPHm9DM5/0968mipC+Quv+3m4Y/Ady/n4/TMwqIWfPpuwd2uF6GAIlw3/8wJQZDpCcAso2ZRGKk1SDunOAI4yJpONbKq9+9Q2FzyhXW9NAOt+4nhI3aGsCvWCLnniQaPps94FerPATVe1Xj3NTVwoPN7jubGPlbzV2CEHYbOjMLTgoj60brHPf5WqlicXPPvGskMEr3bBLODXF9YPTtLK6MyQ24kGxjxu7s9fA9LvzMfVZJexYMjcPFYKId+aMpnbwrOh0XbF7QUOWaqLQiGEAjt2MEK8HNNYfyhnnLyl0KJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 17:59:13 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 17:59:13 +0000
Date: Tue, 6 Sep 2022 14:59:11 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH v2 4/4] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <YxeKb9qxFXodg832@nvidia.com>
References: <0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <4-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <YxcYGzPv022G2vLm@infradead.org>
 <b6b5d236-c089-7428-4cc9-a08fe4f6b4a3@amd.com>
 <YxczjNIloP7TWcf2@nvidia.com>
 <CAFCwf115rwTWzgPXcpog4u5NAvH4JO+Qis_fcx0mRrNR5AQcaQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf115rwTWzgPXcpog4u5NAvH4JO+Qis_fcx0mRrNR5AQcaQ@mail.gmail.com>
X-ClientProxiedBy: BL0PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:208:2d::23) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0db892cf-56e6-4bbd-dee7-08da903181a3
X-MS-TrafficTypeDiagnostic: LV2PR12MB5848:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Af0ELM02/HMu7GsaaA8pefbfmJDulm9/64O517lrMMe4fVhHlpcBNdtdr2cqxNjmhCciyPEq0AcOwypQwiFAIHzHt20WJm4trf02JZOGc0pbeNiLtfKHrKWKWAsBG8lvbcqMPNvokqB4c1vzqUGZMz8ZiAKhJYaRDK297HLWUMpVIO/UHNFbssTtM48vMPlPa2bcC2IA1vkOev072ecrPboOm0FdG1u9FxVAepgHrSY9N3GVkoZKJ2dFcEVA7cfXXUQvlqyqyxfQgWoSPYZOtX7eaFWl+nhnEJNPvGZjPqU2fayQHI9Tb/woH0nHwJcjxAochbEC/8GG1CE2rFHG0re5boEEkMsmUwjMOF+RAUNfBmDzm7XckkHkKk3MsEQWzPueVkeO6qMj2iQt/D5KdlFRrse2Om9/l5l1mOkH2DdkXYeORWwVsG9VPReXFrb4Pqu2sCD/sDBNJyYUbPwlxUmFy64z4f0iNw2EfRM1ajsXSwd8g35WJ6bkls7BRfFdjaqBWMf21bibtXp0QJNuTxE8OO6ltcqJHFMTEUjkysFWPfC+KZlqWKWiS8FVOkJ92jcQc9sQgQWgTG4FVnM/HMF+DfCmamyZVUa0QnFEyQBqdQGAWjjYMqLX1C8+L+i4GQ/tyKbzL8QShemm9AwSA/cHLsoXNHtbPAKqAkRUboZQ8poDCEm6tApGmmnpxzO78bAArGg+//XA5g2m7t3Zsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(66556008)(8676002)(54906003)(478600001)(6916009)(66946007)(6486002)(86362001)(66476007)(186003)(316002)(2616005)(4326008)(38100700002)(41300700001)(26005)(4744005)(6506007)(107886003)(6512007)(8936002)(7416002)(36756003)(2906002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g26Qw1K9WschwSiUnSc0ZLS0RBYM3MS/2Qa7daI4tsmOS2SyDioHB3faOuWZ?=
 =?us-ascii?Q?358ZcfLKeqL061vu+6hQSD2S+J22JLQBek+8lLFtDqrmvRPjWGW4wfLwf6d5?=
 =?us-ascii?Q?3D9Vm3QxsMsdGmNQKwQo6a4KLy4r1ONdML63KrlrBguVrYQfF6W/j7LeFYNX?=
 =?us-ascii?Q?4XUAoRegrlb9CnmBNGnwGgvCPNOH5Yuvnyzegm2uqUWnSEY8Ro3ZzURNYWMK?=
 =?us-ascii?Q?2LPAtN1ZSrm6ge6nQS8yrecazHBkMf4RpxU5dZ4YeI+MSmBWxaZCmi2TTo74?=
 =?us-ascii?Q?mYydomXTdaLsgxXlZfDKbW2sXYlZlFF11fHRQnPhHIjPH1W6uDyERztMe1i6?=
 =?us-ascii?Q?ZxV+Kc5JyhLEVTe8BBFfXVzv5P6Wh4zP6NKI/IJyQ0GydQm42RUDIv/b/knh?=
 =?us-ascii?Q?3JoHkFttF3Lmc1qR9+Wtdi1LwQ2I76sTwIpXjYw9XgeznP+ZKOARqHUjJ/Bd?=
 =?us-ascii?Q?YeTFjxD5pyZ8/fSKytnxXsjvCiyqC9mOcYdXPH+0h5gKEvZ/kuwLpbr+YvK6?=
 =?us-ascii?Q?dqQdAnfdzpOm0uiNpMAFO4Sg5Aihc7zaYnqlmyodAL6envGEApBfnS9kiicp?=
 =?us-ascii?Q?oWSYMig1c9QMdNpE3iUppWv38OcM2d/OJdtxD5DDswtALILcgVnNZ1LskeJP?=
 =?us-ascii?Q?7SiryOyXbIdMtvhdlDdVhEyJQDjxIhqvGOWt3CkJWhT38LFELvMiGDYk4FAP?=
 =?us-ascii?Q?9rGy36ppm4hWhxYjmf9tQlAETis1n9vbnwPWFWupz5BVxpd7lbuc6iy1KJUH?=
 =?us-ascii?Q?gwc8zMwrPieb4dpDSEuAlWDG3W/wyXsqGnp0kos+Tn0LXhXXMM0JWb4BLs5V?=
 =?us-ascii?Q?r5pnwL0CH7C9uKxC4UBsbPpKgp5viRKD4zcIGruF4EzyKPhRPgK4ZZH+cOJ+?=
 =?us-ascii?Q?gmJnkzkNqwHCnu3xAVrbiGvcn203WgGZLgUbxJ141qMr0JrUuLFRuXTXU6u6?=
 =?us-ascii?Q?mInOBOOL+0ykPaQQI+xy4zpSTh8+NFIqCGRZ/NTa4XVO2+KAPpYGDnMcTIP3?=
 =?us-ascii?Q?AjrVzdfAoCMeExwFd9QYBTPjqe3ztg+zpERqgJuJ8GsrBrFLHWDUBlSDjiaO?=
 =?us-ascii?Q?JeH9O/fiSMKZGXZ0vTCc13xzw0/24ML38k5wYzgJE1k7mopeejO6EkscWbTh?=
 =?us-ascii?Q?a7tmg0UqdG9UcvCCQdXDpHPzdAyU0VfIHAKWhSvTe2Ko2IcUCSQlxu6yNDgu?=
 =?us-ascii?Q?GDhRgMi7pisJA0tOFxfk9Twujt9IyVTOCsyGILUKfMpaV+b1v/jC7aSCg9aR?=
 =?us-ascii?Q?pZlbPdo22P0HJ1twU0QOegRReD9Tv9U5BPlMT8vlKuAUE3TL3pZFngyEZ4G6?=
 =?us-ascii?Q?/i9r5gFAtEAKQPjn1AXy9F+Fv+drQwniy1+dFpRVc8XjxrGPoed/15HGQX22?=
 =?us-ascii?Q?y0oJwXLJ+cQuiiSUw46o/DF0CHPwhdq/2hH6RABSMr+hiuy4qjVPWMPv5eiD?=
 =?us-ascii?Q?g1hBEf5jHnTUpKLboX3I4h9AZqU/PirKoHpK1deHLg90dHWME1bK3EK/PNha?=
 =?us-ascii?Q?MctbfQh/4Hrll17XdqWtQlwA2Nj+VRFpSIvbO/hNb8B5jIVyjjRnIxS5K5XI?=
 =?us-ascii?Q?Hd8suYLKAaFuuvSOIRtRf9Yj48czc7o8e8e/ZvKg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db892cf-56e6-4bbd-dee7-08da903181a3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 17:59:13.0550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilmAw54G+qxpqD38GpDjJzBkRdlPYI7P5IfTLI7BCQDSaLo33/lia2sDbr/oZQg4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Leon Romanovsky <leon@kernel.org>,
 KVM list <kvm@vger.kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Cornelia Huck <cohuck@redhat.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Christoph Hellwig <hch@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>, Maor Gottlieb <maorg@nvidia.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 03:34:02PM +0300, Oded Gabbay wrote:

> > > > > + /*
> > > > > +  * Since the memory being mapped is a device memory it could never be in
> > > > > +  * CPU caches.
> > > > > +  */
> > > > DMA_ATTR_SKIP_CPU_SYNC doesn't even apply to dma_map_resource, not sure
> > > > where this wisdom comes from.
> >
> > Habana driver
> I hate to throw the ball at someone else, but I actually copied the
> code from the amdgpu driver, from amdgpu_vram_mgr_alloc_sgt() iirc.
> And if you remember Jason, you asked why we use this specific define
> in the original review you did and I replied the following (to which
> you agreed and that's why we added the comment):

Yes, I remember, but Christophs remark is that DMA_ATTR_SKIP_CPU_SYNC
doesn't even do anything when passed to dma_map_resource().

The only attr that seems to be used is DMA_ATTR_PRIVILEGED from what I
can see.

Jason
