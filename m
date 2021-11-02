Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E838A44328E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7002273184;
	Tue,  2 Nov 2021 16:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2058.outbound.protection.outlook.com [40.107.212.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C5A73182;
 Tue,  2 Nov 2021 16:17:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OObIHChM6v3ws/HZ+98zN3+cJywZMB6nn6I2+X0S7nB6U63V8cHw+bvbmdEilRmoxymr+1OGwM729Km+pwkPrfqqPQuwW4Fv3kCmachvmQ41pNerb5cTbBCUb4fuEGhWFmOyfnbpPp+6wds1U3EdgW1OAGtrNK7OOc2Ikok0hiuINOoH6P6wmwRyAClQq8ygCkxnNIFUHiF6tSLpXgN2kywwTEfGvgP6ACS9BF/ZW1q5TZMv0axFl1bbayKT7jShKyxXWksY65UC6E1nXOyFhNVWB54WNaiBwCEv4q6sY7DTgAAQNXVwQKo2bXk8m/1CZozSseG6ZmCBrT86WcGS9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQJSaEv42mbHYKu5JYyiujMF5pqdCmq7JHmvm9pPTTs=;
 b=aIoCgy/r2pFHyaYjVq7h/0xRVY4vgVEPL4DeJhBHJuCVbnstD7rkpBxRPoa2HrzeKWnO+ucu7OoPkgSY4goCGe3cRWUqEpF+guq3WSm/XhnCFoaA/bZLZ2M/z7IBWGkTSTpFOEAJERnuE8ItjMo3ZeJBDSvEd6Fiy1DKHhavBQORiP2VuT7GoiIVTI8cfjuNhoPOmvOL4u07lI//aX3FHinhoZ94P1b7NNEB3lTzkWaRs8R0t5OOKXTsEJ2g3S+By5lGr4NkXi1LqPhZD93lo9FpIItp7LnfrTQI27GnezsazyRwSgqAi1UcUEJ+mj2QgLXnt2mTtJF3DCPy7rLapA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQJSaEv42mbHYKu5JYyiujMF5pqdCmq7JHmvm9pPTTs=;
 b=pBgcNhCSkJpdvAPyo5LZbagA8Rpq9h4gNd0bHBx7M3bXzNAz2BNyiU2ynpUoUWilVjIsK/3j3tVVGDsx4HErWYEBCBxe0HzVkKP0xqppZ/H5sWY7viAoNhJAXw+qJZzNaDXn9lNrF2bX+91Q4D3sYyTGc0BeccF70dusnBbnGB41mWN0G3IeI7WuyXBPDxd/V+OSsCc/V3+YIz7DWtS/AYdJh+dvtJr+3S5p+nhMSJN/0/qJiHWFCOR3oK438GhBg+cvljgBFb7nejamE+lCyT2vApO09miskd7PJzHRozUhs+uVWjWOyIQBYhXTBBm3KBlC9yTaE/LafpW1TBQrww==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5364.namprd12.prod.outlook.com (2603:10b6:208:314::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 16:17:32 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:17:32 +0000
Date: Tue, 2 Nov 2021 13:17:31 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 21/29] drm/i915/gvt: devirtualize ->dma_{,un}map_guest_page
Message-ID: <20211102161731.GA2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-22-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-22-hch@lst.de>
X-ClientProxiedBy: MN2PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:208:d4::17) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR04CA0004.namprd04.prod.outlook.com (2603:10b6:208:d4::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 16:17:32 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwTb-005AZ8-EF; Tue, 02 Nov 2021 13:17:31 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cf5aecc-5cff-474d-a1c3-08d99e1c4635
X-MS-TrafficTypeDiagnostic: BL1PR12MB5364:
X-Microsoft-Antispam-PRVS: <BL1PR12MB53646C1A1747EFEBC327617EC28B9@BL1PR12MB5364.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:269;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z8eOZbeddG3gqbUZLlcNU4S/cJv7D+r4P2x2jOduH330YkyYUgJRFIZRxO3lPxZsK+2jzvWTo/qsCw/csH6zb+1eVL/Zuy79CUEK7wjAHpNDV/kUxO+K198rpS71eIFF3bxM0lmwIL2V03WP5ebETKi4ELTpNDKn0RjUGHPxIlqAhMnwYiYI8b9TqbFRn8//QHKw7tw4ZH2GaepS0zNiTA3ZyDTWC/8zAfFodDO3ZZ+gIqLxT7k+99d7wii9uQMGODAy38gbXfZRdN6TKUD20oXLwII4kNi+Em4NlW1IlAkZ8E1c4/Y15bQ3rJIxcyx4+27N7a0KvKay368kDuJsRmKZvglrm0RL9BL+jQSqu4ieonoo6lXpjeID6MkR577reBDHZdxMOHWMmx6PhHr49M4DTfHqi84JD5tdYAxtCShK4wOeD8BYGtoH5+OHZcwxdtvwr8nrPQeXInsgfedc4clsoMQLf1BwCG6V1i5WAeq3RIVCmcE6lN4ijnK+5Z28WuHMY9dpbWII9CTreg+LhieWVMwU1P7xZL1SX3u5jhW8sNnJvvHcYPW/Je5hahBgPvKiGnKv3hptBWO1pQPPkG6cThvMhM0LJnHH6ddUEQCm/NjR4FH1wRB254bMxvzCkwRityICcB5IgqsVNG7R+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(9786002)(5660300002)(86362001)(7416002)(316002)(6916009)(36756003)(26005)(4744005)(9746002)(8936002)(508600001)(186003)(2906002)(38100700002)(66946007)(2616005)(4326008)(1076003)(66476007)(33656002)(66556008)(8676002)(426003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QEg+3kHz4ccbNaQHBt6TQAnq+1BFIZ/QaJdTC30fJ12Ourf3huRL6d1PUZOl?=
 =?us-ascii?Q?JMUWlrZXhSbSKJjnnUO6rdFDhCWaPGj377XZl4zOOjAo/q0DwzZ+BTTrobGV?=
 =?us-ascii?Q?ai7qLlkeM+wgeSax+y70ki7lnXba3IHjvPS2HizS4lfe//mBPhd5+rUtyLba?=
 =?us-ascii?Q?MwkNw7TLWq38o4RvobLbGvWM51CJC9DQVR4YXpywBBZR9I7t6nGmOyD90FKE?=
 =?us-ascii?Q?tGEFAPdOwB8F2/wAKVr1xM/1YLRf1/l1v6/nIQ7b16w1FPJ2b0zYxKfuww7b?=
 =?us-ascii?Q?Aov2huCpR+4Q8sMZ5gij7Gunb4bAF9WyK0VYEL6pEuYYYanbxnXSSrmhkqw7?=
 =?us-ascii?Q?hGGOBniNk7qty0mIjvcvF74ani9xZHitEweRnJXRIZ2k6vSNcYYdxfIReUfx?=
 =?us-ascii?Q?PFs4uxeMs7dIhCbNvvDFvBC1JYae/i0pzp8So/tR+k4QI/Nf8+72GY4i3VXL?=
 =?us-ascii?Q?kaxP5wJoSVU4bKllTt+I70nn+wSqw8NWq4vkGMbREtc/dXIY9vn4vYTdBh55?=
 =?us-ascii?Q?Yxr71Dd0bFoDfwxEDM5pqdAN4LnRoULasrEdF5DrdKZp3yZ62Av2L3rJMpXk?=
 =?us-ascii?Q?0nSBCNX7HAzagQOpPsqbWWQb4wpYx2nr6ClXc/JwqleJJRzgowuMm8Slxh43?=
 =?us-ascii?Q?3uvKVkJsU+hkt4s1ORuEKa+knUdp52jMum1fd/TwDWmRwk1oMGsjJnUGIKyD?=
 =?us-ascii?Q?l0Vn8tDWqwUgIxuph4k/YPT+ak65iUKhaAD4eyrGy9kdkDuJ9RpXTFmyU3/E?=
 =?us-ascii?Q?wGCaOBg+bQLmRC9BczBVr/BrPEOK193agY06d8s3aMOH8gPEghOdyw7udOr/?=
 =?us-ascii?Q?hIpJFEZmyLTQQeJR80Pgynuxzy4COCIhlsrTsulJOum8yBSUlP5b1weG0rNE?=
 =?us-ascii?Q?4+XCqbv/sAz8opb2JNPa/Rprdr6XtKJLJQowEVJ2SFd5apBogzJ6JTMZLSYt?=
 =?us-ascii?Q?2HMTcJpP0dY50sRXaBLbzQN5ri8/dX6B0kaQMijVAOMLmfwdcLDpu3QfEeiy?=
 =?us-ascii?Q?Z+Sj6bHvua9rFoS7dNiHTOpt2AvJxZ/PwW23Y/z8Z8OV5LUb77sJgvOq4NIf?=
 =?us-ascii?Q?aSyGxMetj/TvUvwlxTbyVRIX5e0FE7sZG4UfPNLAJgrw9T16ikNx/qej+akg?=
 =?us-ascii?Q?5dqHKWqXjslPv0CQdBw2Jl9vn7t3CPjy8DhCvsP/eq+gtq1cCmyMaG9cRpSn?=
 =?us-ascii?Q?iDyGpuBHXAXbG3ztntp+WrQdk5WrJk4JPpCAweZEYb5k/mZvO1IX+uqU/fgv?=
 =?us-ascii?Q?Ghu3khcTmTL/0jRmsvmWjiiC59ee3T4tM3htlwjnVRW3JS9mF+q5ZcM4piNm?=
 =?us-ascii?Q?fV3zEZ1x2VUseHsmdYH5MYWol1YrNFBqCJogfGnsbSoZMxbQmSydA3BJYR74?=
 =?us-ascii?Q?jzXMRX2FYZtNZpAdg3e2Y2WL28xOU4zEEoTYPlOQBXQ9p/JubCAGwzgYqFtW?=
 =?us-ascii?Q?YLiWTb++ploUnf8OmqAxulItNkloLsJjVxvz/KVRbfXYFni08WnRYXKwZ9fJ?=
 =?us-ascii?Q?bFm1BiXnyxbtTTxbjk3xZqPgN9J25J3lzX5TkLks/nbm2Kv0XGSmzlXl20Su?=
 =?us-ascii?Q?UPccDKUn4eSkGb+JxDo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf5aecc-5cff-474d-a1c3-08d99e1c4635
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:17:32.5272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrVWYnVSzaLodaVg8clqNt9tLt0hWNKgvx7abcymnlSi9fkXeaCQ9NOwg11oK46T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5364
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

On Tue, Nov 02, 2021 at 08:05:53AM +0100, Christoph Hellwig wrote:
> Just call the functions directly.  Also remove a pointless wrapper.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c    | 10 ++--------
>  drivers/gpu/drm/i915/gvt/gtt.c       | 20 +++++++++----------
>  drivers/gpu/drm/i915/gvt/gvt.h       |  4 ++++
>  drivers/gpu/drm/i915/gvt/hypercall.h |  5 -----
>  drivers/gpu/drm/i915/gvt/kvmgt.c     |  6 ++----
>  drivers/gpu/drm/i915/gvt/mpt.h       | 29 ----------------------------
>  6 files changed, 17 insertions(+), 57 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
