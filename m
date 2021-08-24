Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B4E3F699C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 21:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1124989A32;
	Tue, 24 Aug 2021 19:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDEF89A32;
 Tue, 24 Aug 2021 19:12:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjBppCnJXDehO+mmEDsKd7CT6JkHHpHobdff0mUOZiKff5XRczMP/SASfufOuO/A39SyhzbatkxX3aHPCkPRAgGk5et9RDqIjzFWe7Vh7ZMuGf+99es9erP6PRLkcqCbfEDQFNlYT8Ulq1C9FLXixz9MN3oIixOZWQBFLg2KFPOkt/pp+C5ythpJiVvA8Vjj2nxVc6bGz2B6XHao5dVLPkWQlu22uiP9R7GftGy913t2jZl/Ee/pUMfLt/t13xsm0LHH5h3XQqTyU+yQYeTGETZetDCJACyEhEqFUx3n813HNtKQza517zBMKhOEd9Yunj3DvRN6pcN0e73MYIZBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abMgsTLmWuOhEWdZ71ia/I1HSWvK2+MqEjuPC/HEZu0=;
 b=kcQ7gZdTbUDMdRSynGKy4CiCzelCQPigXZK9tGFAay6ijSocDrMnBh++GhfOW4UTHtt8iLc4ZwuakKLYvyhdj3sqv+R1B7CPfYvVpF5ofpZq9QrEnEAKSR3vWkv3MdcVvEd75FOeWA01m33Twpl0qtP4Of0JTTOp+9IGx24Ch3IOi1Wtt2LOw3y4Vq76I4YqGIMC0D+O792Vatr/3WxXhbTysYgR/W19LJXIhVxmE6QUN7Mg3J06xAgBfhz8IeAvKz4RCx4EqjMJzS01wxmmkl543v68lCUs0bvwz7LPpF84XRKbxkcvVmRpLhiQ4RBn3Ky4x/FVa2N8mPktFvJgag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abMgsTLmWuOhEWdZ71ia/I1HSWvK2+MqEjuPC/HEZu0=;
 b=YSxHh7m4hsRMUcTfwcamON5pvMASmj4gMw+qi3EAuHpceDczAtO5eNV6VibojSq1Ldr1mxYQzV3sOICltYw8PaKF2YSl+GEOy1JC+pV4mFpi76Nq9m1hWOeT0BKLMkCYouqoBqWsoueB+gjKe4XGqSKyCIR797DjU5lYWXl4/18N5tHNkXM5+6OkpGTMAhcR2ZeddBA7OAbfVm0AToxzd8lT1M9eaMtrrC84LcFIG1RsRfPxGlIcJIYqMBTTznzZjUzM85CX0/Q6PGQshd/3X6D/FwJjWGgaT3OqquRIWFUOjGX5YHOgEIlQJlu/PrcOF73TEbJhj0s2uHiHuY/0UQ==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5256.namprd12.prod.outlook.com (2603:10b6:208:319::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 19:12:49 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%8]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 19:12:49 +0000
Date: Tue, 24 Aug 2021 16:12:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Maor Gottlieb <maorg@nvidia.com>
Cc: dledford@redhat.com, hch@infradead.org, leonro@nvidia.com,
 aelior@marvell.com, daniel@ffwll.ch, airlied@linux.ie,
 dennis.dalessandro@cornelisnetworks.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 mkalderon@marvell.com, mike.marciniszyn@cornelisnetworks.com,
 mustafa.ismail@intel.com, rodrigo.vivi@intel.com,
 sroland@vmware.com, shiraz.saleem@intel.com, tzimmermann@suse.de,
 linux-graphics-maintainer@vmware.com, liweihang@huawei.com,
 liangwenpeng@huawei.com, yishaih@nvidia.com, zackr@vmware.com,
 zyjzyj2000@gmail.com
Subject: Re: [PATCH rdma-next v4 2/3] lib/scatterlist: Fix wrong update of
 orig_nents
Message-ID: <20210824191248.GY1721383@nvidia.com>
References: <20210824142531.3877007-1-maorg@nvidia.com>
 <20210824142531.3877007-3-maorg@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824142531.3877007-3-maorg@nvidia.com>
X-ClientProxiedBy: MN2PR12CA0007.namprd12.prod.outlook.com
 (2603:10b6:208:a8::20) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR12CA0007.namprd12.prod.outlook.com (2603:10b6:208:a8::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 19:12:49 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mIbqq-004YzM-5S; Tue, 24 Aug 2021 16:12:48 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8326c9fc-1077-41e6-c0a4-08d9673329b1
X-MS-TrafficTypeDiagnostic: BL1PR12MB5256:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5256E8FCE571B2625EE4FADFC2C59@BL1PR12MB5256.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8BkXlmtyXuqwVLHKGpQkA34uPsBBhzL9euo//nTP6KygrTlbkhLMsDSXKkIKVbHV0ZRZrgFZNPinWI620UCArMKAzgdWjG0d37Dy2/j75lPZ9Bt4+I+xN0ZS+HtofFRCvnqXwvUWoE0Rr59VoHd8Mhbig7BImA4HGSVRWSNhXV2D0+JYd/IxzNSy6iHAQLpHhUE8m4dpvzbkkCk3aRxRom3RX49y8ECEhXdgGULK8o5+LR+M19/A47fQ7c5AanWgzEFO0W+IshKqjZr1f6AvnR8j1LBbE4zb9FJpPhYGSrEWaXu7XbFhulAHXN9IBKteEml7gjv4B1k0Q9Yfb5fA/DFO9gPqVhERECgTFDcIQhkKJHvFcwFoumYbcZ6pK6or3EP7ZA4d3VYiKid63AMJ+YZ922rIp/uq451y+jO+71NLIOpSJKANtH8i82QM67JwIYhPNW+w3HiRHzItT5I1YtCklm/rpH1RaQtUuki+Bt6zlQ4f2Nv4c+nTfRvwbRfBpLRrcywCsfJ0bDX9+au4Ko5yJjUSrEhJncRpmqjJ1znWovGiaZ7CXCW4hYX9X30gOLyVbsuacX+MrBVGXuiwbRXAsJlsye2R2kd/Vg1kdHxL0b3i8USsUri9fELcquwqbiD1h2C6M1RqlD2MB9g2kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(1076003)(66556008)(86362001)(26005)(66476007)(8676002)(4744005)(6636002)(66946007)(5660300002)(37006003)(6862004)(9786002)(316002)(7416002)(2906002)(2616005)(36756003)(9746002)(38100700002)(478600001)(33656002)(186003)(4326008)(8936002)(426003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7fNoaHNaeNLMVMjo2tPoYuoWUWSsL1x678OCpEkSdoaCDfyU1DsmOHGZsEW7?=
 =?us-ascii?Q?A2rR/Dbcn4Ma1sD8EZrotjzxxMQZ9yGBdAIFDibS4D68dL+qt3gc715+RUHv?=
 =?us-ascii?Q?uw9AJQFfGYw0PGgrkeOd/nZJCFHGxqmVops7Np6LNd4JPQoWmDUugSXVE9ZK?=
 =?us-ascii?Q?y8vDnSy48iJGlf6QFrqChCzjbeRJiBd/aJMKFITtz7Ps3MbADyap/9O5++Mq?=
 =?us-ascii?Q?dC1GjPqmcMcZjqe/2hjXpCwCeCbdpHvj1wvs0+jpzUeZjfKsyeiNeDFIgL7+?=
 =?us-ascii?Q?4eMFkSUtX2X59pYl9qN8mVbTUq7yY7KYl0ZgmtUNKd0QC2mbdI8RD8jybV/e?=
 =?us-ascii?Q?sdGxfUXipAUx7j+ebCKbJo/zsd9303ATJFbcfZ6VCYA/lJqwfY3lRP7HilwO?=
 =?us-ascii?Q?aHKpZyr7sq8ro8JJKeJ3BuVbRdEmr+dCdyBLQ0uqqBohd4nIu0Bps+tFP8sk?=
 =?us-ascii?Q?+iRWQRANrb940jLwvihdt8SsR5SnXtX9/ifVu6A7Th1tKtb6NbTmqQ5DgRMk?=
 =?us-ascii?Q?sDwzxm16IWSIKJW2pdDA8EDtXrOP0D4+pnVXiu5FBusQlYsI3Y8kTgXbssWL?=
 =?us-ascii?Q?s9sFA0Fm8xbxH8ejMPKwoSBaF59i883AYWDtlPip6TS12OaNeDn38fjt4ZH/?=
 =?us-ascii?Q?5LVtQQQR2Ptyu6y6IqzguvZ6zc06MOTx16V9zXb/F3oUbhBVTs5Nk5P09PRg?=
 =?us-ascii?Q?4km4J1pkpxFrrZz0Ft6uvIVAlenQRAW+TokOApqJr++3QABjPB+n2BFCq+T6?=
 =?us-ascii?Q?Q1J84QtdPRDm7qhv5DZlbBmhjHG/f+RfbM4DKwvI7oY11xe9P4pBk/PyQdZ9?=
 =?us-ascii?Q?EueOYGu692VRNBxSULAs7uYzx2jSIklQFq6vklMq/cBfUPf5heyRUfaC6MPJ?=
 =?us-ascii?Q?IXvzR7oaifxyh/pZAPjti5VcYO6CJtkPgRuUQMXW63pBko5VxgX1+8oIcGdt?=
 =?us-ascii?Q?zalxCK7XcGCG3MMCDmrfINANCi9BVeSOpTz9dUeSpAZGXQ01hDJs6eZRcG9j?=
 =?us-ascii?Q?7phlKW/M4TPwLY9x3XXtD3KbDkUzWNcXkozxsCdiA7FXrQPifIHBPPxyLjuJ?=
 =?us-ascii?Q?dQNhKF0D1Yf0beiG52efmpUFG9RKPVyuLTuvP9oKINhEpWGEAngVIr+9/GvY?=
 =?us-ascii?Q?8Cnvkcktmq+PJaLEoQXzaEc1WfKIyxjmSfQQdbHUEVFcgRhdpTKxYmGAjpT7?=
 =?us-ascii?Q?m89ygHdC11furwS0Lm3OZz+m5qavgKe+eRFaQhoU29bbCK1rfqCIBvSM13OQ?=
 =?us-ascii?Q?t+FNndtlOjlt4rwYq4J3mlUNBM81Zn5EatjzLFNxyv51qB6U0V3e7jTBGPd1?=
 =?us-ascii?Q?31YM3nHNmRJXkECbkvWRc+V/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8326c9fc-1077-41e6-c0a4-08d9673329b1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 19:12:49.4445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: co43WElRz25n1SyWK11WeCUaoAGSr/ltv8TzTM0e705FsSOiraHDD32VO+QrvS4Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5256
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

On Tue, Aug 24, 2021 at 05:25:30PM +0300, Maor Gottlieb wrote:
> @@ -514,11 +531,13 @@ struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
>  		offset = 0;
>  		cur_page = j;
>  	}
> -	sgt->nents += added_nents;
> +	sgt_append->sgt.nents += added_nents;
> +	sgt_append->sgt.orig_nents = sgt_append->sgt.nents;
> +	sgt_append->prv = s;

Why is nents being touched here?

Shouldn't it just be

    sgt_append->sgt.orig_nents += added_nents; 
    sgt_append->prv = s;

?

Let me know I can fix it

Jason
