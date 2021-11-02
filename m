Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90D44324C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD8A730A7;
	Tue,  2 Nov 2021 16:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85572730A4;
 Tue,  2 Nov 2021 16:04:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXql9n797vifJwi8EojKP2ACDDd2earWGA5JLsGrF5PBixYzWa6N3dBBnkO2DD8o0UCZynMNnX5qYO1lg7J/dlHO+cDcbBxXUA9Xwme+KYbUb3pPPpKfPMY0xqRJPDboc3NoDvlSN7uUrtTOsY0ZDp8BqQI2GPH5WnqyxU2aQw6JkrdnFEcV1gkLMtIAwwr4YTZ80bgzaSCu1BENfIBiZIyRPgCn1/85iJ+VL/Tzy4reI5PvYUvKQMyS/kUr05jlqIU0xcu4NvcdOMwDvuy3URCIyMuAyHDbglP9JAKF2F6tJljSV4Dp9KdQ5G3WQ5bzBuTeaiSHZ5Zw16bI56svYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9bB2wVocnLGA78HLrN3OpPqV9nA3BabBEH6eCJGryk=;
 b=Y/FedEdn427L6OcuumqkT9wbfd6NB5+81Mq82SmaLz5vUf+ZAgCccd+XbUiD8xGSGClas+w7KtemkWskhFnXPofUKrJv0cVPc/RN7LxFKd0Mo7K3F/cd6G4BpeQ48kuL2LYcMIzSMbvzkwSm4O60do7sDuzYp3S4AV8HjjVsuNJccZlKYsMfn/os9UpFu3PffNravLgVqTQCSTVGbLHw+WY0L1irLo+YH9Wza2gamvP4INWyGVm/cxGqVwWUwspGPxai73ieN/dn1ZdTtlLxTHVmfmAnut9OFhuFMReiK441NHREpDXL8+LLcPJX+eV5w9VL2v2M+7PN3nw/7VCA3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9bB2wVocnLGA78HLrN3OpPqV9nA3BabBEH6eCJGryk=;
 b=Z1V8o7QkoZ4zvlvlesfSmdWRQtY0lMQK6G/2wAacJ9K7p7ajmFQ4v7HZnp+YmdVK7dWsR2jXLmx7KqL4IaxB+JsQgro7hTB/oddrBGrFP+Tc8Jzzq369eYvD6rk2U3g1k+WyVVRBGBROUCBzrSsjmUIGXGmFlKt3Xcx0RkM/241z2fthgSj98xNvU0dWJEI8VceVXqpHAehKrHvnEkfkXjg1wOODJpWxAesQgs7se7gvns0qL1i708sBC36ct2hE510RKJ2oCBfR5ERaJHSFKlU5V2il0Zhh5MmdaTgRiuVOH8umEtQliUSFS/G/YeO8J7pCiaKw9u5cIoULm2iCHg==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5110.namprd12.prod.outlook.com (2603:10b6:208:312::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 16:04:41 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:04:41 +0000
Date: Tue, 2 Nov 2021 13:04:40 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/29] drm/i915/gvt: remove the unused from_virt_to_mfn op
Message-ID: <20211102160440.GO2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-10-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-10-hch@lst.de>
X-ClientProxiedBy: BL0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:91::22) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR05CA0012.namprd05.prod.outlook.com (2603:10b6:208:91::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.4 via Frontend Transport; Tue, 2 Nov 2021 16:04:41 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwHA-005AIv-Ce; Tue, 02 Nov 2021 13:04:40 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfe34fa9-c040-404b-bc70-08d99e1a7a86
X-MS-TrafficTypeDiagnostic: BL1PR12MB5110:
X-Microsoft-Antispam-PRVS: <BL1PR12MB51107A38932D47F4C874A6E0C28B9@BL1PR12MB5110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:260;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D+wpE866rAb/I7rFW4wvCxsruU84a8Y7YDFz2jF9tDXXEPUuMqYzkXFedc6bcxnxVjpmGS3ogtaMF0sWlX5VUD5iucThWhGrQ3RSFUynT46Bubt7t/rvn4cj0J7cx/rpFdbQ6UgrJCxidfTmZg4uSMS1CekxZ4wxAS4WNmxjD3nm9WY2D9PwKNzuBtlA41arrUKYFXUOjywW2c2JZwPxiC0NaUTCi2bjRM9AlMkzhlmFGTLdNGf8NM6dnoD8PxevDxDWI3ePBc2QYUzCoARXAbUGHxAbEvutjwlE7xQP/GFjjLZxtouzrNQaRMblL3fQ9erggxgeXMbGjzd9JzhYhp3JWZiK4n+w1yg4KRmj1DxeDVaP28s7B2pfGNLjRivBVj6bGdy4oujWN1oGkmeqnromFAuVLPWZVaESNQuMA4LaxOrNjs+eVBvCpveh7lpuMdvAboJapHN0eH4lbNiJhB3kkIG/p/ScP50p1qhe9ZpHXAK7b3coS8mqLB4LSdTwZS2eGO8FZfBa8R6j4HNCmZmm8OC59sq4lyiPdYCPQknHt2Ck16MvQe3mXlj8aM12y57Fi9SgindkjntNmSR+q4MBAKruiB3j5o6yhNyhLLThTxWq+mRMgWa1BXAn6TmA1Z690Dsp0DWNDerI5ECVSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(9786002)(6916009)(426003)(2906002)(38100700002)(33656002)(7416002)(66556008)(66476007)(2616005)(8936002)(66946007)(9746002)(83380400001)(54906003)(5660300002)(186003)(86362001)(36756003)(8676002)(508600001)(26005)(4744005)(316002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EA38vg4TGKziNmc5WbMaUPMqlyiEIa3Vp+H8cXYygwxMhIbVR/uphYvHwmFh?=
 =?us-ascii?Q?n7jBYYNnzZc93neLTFgKNP1ymmMec4Qrsey2AHCTeFnrABf3Eu0QjnIAfKmw?=
 =?us-ascii?Q?1J6vdQS++xbhBVoq2ZnTQwuTEGtOjDgwV9Xg1jFpgQ3Ewg690DrKBVEJzfgZ?=
 =?us-ascii?Q?e5wQXIaK3EfBUyBYGF0PDnQGjJDLzBgtnDKtNBjBpM+nJHVGVX6tepiOklG1?=
 =?us-ascii?Q?RX8n1/4tRFT3NpzeuyCWX2o2dAflK3KL2GgRrdKRRdrUkC3rcyXlhZoChTt5?=
 =?us-ascii?Q?iDmRkMEiTFSQ2UW+vV0bJUT9+Ayv4I1JCkuiZwQKUq7NEFQ5ZKxhEVOwAwIL?=
 =?us-ascii?Q?uYsDi2AgPRyoWClfMsHDck1OhFfM09isFK19dYZGwWgAJ9qCcFcKwz7wzhFN?=
 =?us-ascii?Q?416oD6s9hdBfK+KKLvH3yxqDexHYB1GpE8bSfTMrhhSlryyK61IBBgYotlx5?=
 =?us-ascii?Q?atjvRzGxTFuKJ/2GEli0SdHtxCmUvOa66uQ4DkHxk3mLOAIczQFJN2cbjP4L?=
 =?us-ascii?Q?EzZbrCebfLrX1xCHAXJWSvbCuxm4Bjsc5TlROEpNLgSWj1ljJ96Y3tQMACip?=
 =?us-ascii?Q?rCy1NL1Kh+RRtcXylJWOr07+2JlDGw39mm4/2CSortoeiw97Cfzhf1/zFFGg?=
 =?us-ascii?Q?Rd+sAFZ8+l+/yBnzocnNPyFAZe0U2tZ0TyvzfvChU+qMK9Rm70ZqY2Ejgzov?=
 =?us-ascii?Q?vns7qYPhDAzcDwZV5qhFxlLvMgRLLBo7u52DS1xaJ4I4BqQSpY0K5mQDUGtI?=
 =?us-ascii?Q?awzZtB5T3e1dmCeTjZdfIotwf9W1FEsMQXe0Qa+CAY2K596OLCxboZOowcgh?=
 =?us-ascii?Q?/7mHZUEGXgdmZDklVPxIqshgUJzLkDXuWGjo0ZgnWnLqInZlCthMakBfw70V?=
 =?us-ascii?Q?8ELhFJotT50+Zfks3cl5VzCCgMBjdzCwOUc5p3UjwkhfPaM6tJYoaZEJ8jEv?=
 =?us-ascii?Q?8jQpSkrpLykvna8pP/7g+M5b6e/QA0sYKK5NeYvYDH//SB6ZQ7BBkIKNbKn6?=
 =?us-ascii?Q?KdRD0N9XUPcRrw1nbfLSo2LehGsMIpJChPDzoz/8FYMIJeW0kvg4/+2Y0fs1?=
 =?us-ascii?Q?2hguapvUHn3Opli4BmMeVl7aL+rUdmt2PsyBRrvjYuwtPhZmTykajzUB/4J0?=
 =?us-ascii?Q?cHqgwlsLlOl43cigVlFNmb8mYOm4KLKgoDhP6XjgGLbEjfXbDrlz1jv2HrjU?=
 =?us-ascii?Q?DJHLC2SQqJ+AlcICldxjqglvQApKXo4pKlCkv0NqMir6zjDF98HeSpKvIIpo?=
 =?us-ascii?Q?GBIDzqJC5hWWsGOot/wM2oFAD0/7U7ABEZXAhmkkpgp758RkhhQMAzWHnTVe?=
 =?us-ascii?Q?Bdoal6wG8Nws1GNroFslBmskb2G18CKxKMzndz6CN0vLMHtU73rS+Tj6MsVy?=
 =?us-ascii?Q?JSRCI/0JpB6XB/U8NLg4Pl/SPKf7PJCtU8/CRg5bsnBs/+YWu3Ijt1zcx+qm?=
 =?us-ascii?Q?Poa4xZT1POjoxTDVRTK5enL+cPN/jjL1vMTKXHF9CNE55ioSMPx47zuaKNsz?=
 =?us-ascii?Q?UUpSYkxGZfz4+C3zgJ0GyNi9QuJBUSSqbE2naavs9W57oWjqHCsboYC2h1FU?=
 =?us-ascii?Q?v+Dtbk+dOtcHwwmm7oQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe34fa9-c040-404b-bc70-08d99e1a7a86
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:04:41.3665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVNi1az3DDCH+789Yyb6rwe4M7A4ARoGaTtJcqGHnUg5sQbPK0VGxFNLq/HHjAlr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5110
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 08:05:41AM +0100, Christoph Hellwig wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/hypercall.h |  1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c     |  6 ------
>  drivers/gpu/drm/i915/gvt/mpt.h       | 12 ------------
>  3 files changed, 19 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
