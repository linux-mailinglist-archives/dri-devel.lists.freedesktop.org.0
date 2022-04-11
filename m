Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8EA4FC441
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 20:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A40D10E2C2;
	Mon, 11 Apr 2022 18:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C92E10E1FD;
 Mon, 11 Apr 2022 18:41:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYZp8+sed5Fjz62B5CS5nKugy9a91amSoSZB8npME8zex+0PkVqjL5QWK+sy6zv+uz5ypK+JCtIQME7NpJjO0sqT6K9ruq0QzYDuvcugY0F0ih6F+cS6PSfDIMNB2l2T6v6wZIUTm+3dRmJPp4mK36WETSmCn1hSjP3NYj3ZyMhPEeIFZMPAMJ/FtF/kUgmf3AC97xW40TpVyz29umsWo87U2UEfA9Vu34odu+uRPzTY1tRqlvUTQPV8xo9I0R/jDtQxbf5rXRiK2T/SJL57ROPLy4iWlN8xV5FDpNqi+UMhfJlYZbdGJOe3Pwerh5hijLp7HqFE2cAvRKTd7B7ylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrQkmR1tuAfcRtXFufLUeGoEXQcxXdgqbubCVg4IMUc=;
 b=JCK0Rl4QSBc7pbmQnRSFTB2NHTQY08fkCobKUbmod1HiMPMWxgdHjjm9I5CM4KCWmihHAzKv78uX44gc+t9k8ApKY1ubo+2hGzJF/uWhu0UjSRSpQrk6RiVf2MLksIzvG7hMORDE18Jnww40xQ2wf3ikUMdD9Hvk93Qne3akgAfRV/m3+ofOaknroUnIrPXsmtx5WS4EPyiJWq7SZM8hHal2uZ6R0ZNR76Ot8+yYt0DIpKkjWb8dmbCDqsU0NdaJPep3SYeGALXFoodn3LjWDN2g1IzwWO3mEyJLJZ7YooTTYWmdc+IBHoRzCfq4+IKIOjQmI9UkjYiKYtXLU9DE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrQkmR1tuAfcRtXFufLUeGoEXQcxXdgqbubCVg4IMUc=;
 b=ni8Htv5VaOCYO/5mg9GNRLPfvLlz7h/LURXsBUmdavfx0YP7TVJvWk34/jHN3qw4E9TsOZHs7Ib3vR+FKiBh0tUgcwDItwdQ0Fc7Yx+aFGTUR2HWvlXBbiaNFhrzE7NqLPloO4cctIj5BMqd04ADhxNg+9tWwDn76mf4c5rQS+LeGnRe5Vf1WhRfRbn+WbOWrRNpUTK+OjPfiS2DxVqiNruLOhg/vQ5lVVT3YtDKiP/7KZRVcFPUQqVBCoMKMRBSNWWUw41rB7GySmiClfpXmLpwoAd1Yc6VaEvAJ9tHodFKDKKrDH2A17Ul6uflMlgL+Grz5tGPMQbz2n6KRGvEkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB3913.namprd12.prod.outlook.com (2603:10b6:5:1cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 18:41:20 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 18:41:20 +0000
Date: Mon, 11 Apr 2022 15:41:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 27/34] drm/i915/gvt: remove kvmgt_guest_{init,exit}
Message-ID: <20220411184119.GD2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-28-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-28-hch@lst.de>
X-ClientProxiedBy: MN2PR20CA0007.namprd20.prod.outlook.com
 (2603:10b6:208:e8::20) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ccb4e33-e74d-4f34-0d73-08da1beadee9
X-MS-TrafficTypeDiagnostic: DM6PR12MB3913:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3913F72880F02C5DBC1D9AA1C2EA9@DM6PR12MB3913.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nV155tWZMkGVeBB2R1XG55pZcP7YnFxlHbwE9c0bNRdXS8QJyQWppLsxpNm1+pTxhRi/CUXru1EsW8dM9y23MP61MKfSBe4xL374abHuPY3o4Umuild7K+UJDXFRXu++An5a9j0EaNGNUHReQUTzxsqp3yVzMc7XmtP5dh4UzhFaqnpGttL/kKbbZ4LtYhXz+WpZIDSx3Wbnosy3us6WTReK9HnnK2ydumTcbgivmlRadW8UvFuisLJgLXPYUBDeZ/S4h6gGt8MltvNSA529vsYVHPJpJXAI5xlyRHlbjO1CyLlxps8OM5RWN2Pk0AL6773xkV0Zqn5ZuZUd/Hz+lCV7CA00KD25hpHlrmi8VX1mNIVRiCH1k0GzWNm6+84WXbJYeILxjvgEtaT0odJ3sMD9j9iOWCkI5gQ9bEBwkXYHlIoqqGA/9I+u4xc2hkp+iJKIdaYVLCieAC1MHajV9j8BhdA/sQmOPDQJqr8f1OC+pGa6IrxYmrHQkLBewdxlea0h58zH9+qEAjpL5YAHeykDKHq87pvOfXfi0pSTiV7F6Tm98K41bEOcYD+wDbwJzYyDJbWlzN6NS4LkDYrmwyCBgaD/5ZECEYI8K/PwrPqCpyxbwuXj0ApnrHW0QSg5nc8JcDIDAvBWd/gNhA48Gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(6486002)(7416002)(33656002)(54906003)(6916009)(66556008)(508600001)(8676002)(66946007)(4326008)(4744005)(38100700002)(66476007)(316002)(2906002)(2616005)(83380400001)(186003)(26005)(86362001)(1076003)(6512007)(6506007)(36756003)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WY+MS+2HAaxnscBoy/g2FIfPLGxJfO5oO9p6eoA+MVWlNgzxVrtVqEuVEybh?=
 =?us-ascii?Q?8ALZmQ8iRTIo1r4BXVxLyisiSDgJGHPg4RIKiJB5u+/mHTgeJlQVZkEpyj0I?=
 =?us-ascii?Q?06M4LfHXjCzkB+C0wkSu+3NX0wgkO4SlxM6mt+nnsPg7Kou5Tegy6XS6tMmP?=
 =?us-ascii?Q?duMp7jsaEUuayfRgZI6xyCpKqML0BPoCJCJvLL0kNQih9yITkW7PeM+yb/vs?=
 =?us-ascii?Q?y2+d4PObMoW9D6ZsX7H0Q449iFmLSF7aS9bEmEwwEVr8EOFrs4P/LJwE3GUn?=
 =?us-ascii?Q?bbTf1kzeQKLKxpRSrGjM6FAxLjmx7QjDpbzWrSWFgO7DSOfeFJ978v1h3EyE?=
 =?us-ascii?Q?J8fogT38uBoJ9OQ/GrgnTSAyykmDVsgNfvr9//HeekVRCPRtFrroWGcsr49I?=
 =?us-ascii?Q?EIc4RbIKpYGLvzcTKP4iU0LsIdvtxuSZ7VqFyDREtoaSjGI6IPVDnKRaibmO?=
 =?us-ascii?Q?mbBWMJ2zw9HrjK8kf4Q1r6dsr5yodVYOmqbLvlSur5e711rc/kkl7hRlonia?=
 =?us-ascii?Q?F7vwsudKouk0H+UndGG0yWOItsox3sn0h/PAQ1NOnZYOGmRnMFgcGjJpGH9Q?=
 =?us-ascii?Q?C4ehbG2ABoBzdosGBlrIScdXbOjVfsUgzv3jY3lXw51frJQh+hjoD6p72Ohc?=
 =?us-ascii?Q?+VUhFJztdPMzaoSBZyNl+C/TN+7YidtsHd4dUunrd7H44JRDf/i6opjfCScl?=
 =?us-ascii?Q?C6yCMnjEOzpMsC5PPh9Xmv79gb9vESaiCNpyUISG9jUhVnSwMnKiRMEb3k41?=
 =?us-ascii?Q?b3th5ApSFIyVKM4kwgjul0YkU1uaVQE6ZVCdRtjQXLlOZWcC2A+B/Latbk6B?=
 =?us-ascii?Q?yalwIMhOYkzLdYbE2zQMb8cLNDLKxLtN14OIASyqnzrIW0tu7PDpD3FopcIw?=
 =?us-ascii?Q?HYRsrZTLIZOvRm5yY1xo80cse4F9DVeIihSwYVRIMMZie2Yx5FLcrgI/GeQv?=
 =?us-ascii?Q?KaNAvgHTh3xNTF2DIeSmZaBy/wFwfcQdnbNzo3RMGps9rfe2MC5GdUf2uLRE?=
 =?us-ascii?Q?7iI0vmo99xEGm7OMXdL75bian+8orRzpIF9kCVlbOzBoMn07QlfCi+lPQ9wT?=
 =?us-ascii?Q?0GgZJcxZOSx/FGjx4laFi9DJkLLq1ONKZUbXIz81GkKrZssgkx+jqM99PxzH?=
 =?us-ascii?Q?JZO3+nVBfFOmo1uPUWVECpNKasFitSar8LUT2H20ov2RngLg+pvt/5mlDB07?=
 =?us-ascii?Q?ARHYP0d2SY1TMXkwk3+oHQwH/rtQLpXDyKMrsZbEH4jK2h/c8jrDdcB2/lUU?=
 =?us-ascii?Q?pSpZNB2MeofxChC5VIbVhOBwMrCHX6KpRJbF4ubBVUghB+BOU7znCyOuUes7?=
 =?us-ascii?Q?zcd8LqFgWgWE9tzerM40NEQ/IbJafkwcuIyUTtQfHa0kPIMBq3xPmneoRxBK?=
 =?us-ascii?Q?EKjiKIbdiE7eFGq47e0aP1jtuImZl0CuAEtuRwrMBjgXVjwOCsDsBt7lQDbz?=
 =?us-ascii?Q?P/gB+SJrdHn07mBloYVag6hMt864yQWlcIlbHhPkmKd0FcS66bnCE+MsPgL+?=
 =?us-ascii?Q?zPMd5jjWi+tFH/qzGSw1SsVwHBxSWfcPvrip4OdhNcxpFhdwvtvGeiLceBPI?=
 =?us-ascii?Q?RRZqN8xOPmKRJsSbpidhGHnLa/Hert5HruSm6M8EI5MuqLCOq6/1R9OpnWnL?=
 =?us-ascii?Q?qOYxEocguHNXcRiedxNr+8GAGhZkax8kSOLvspFx2s7VpcDUbGtLvY+M3sm9?=
 =?us-ascii?Q?HJ4shoohSPLILnhEHmk8jrG4RgPDsMJ4Pj7cVXNwaIxJ222OcEh/FuIZ2KmT?=
 =?us-ascii?Q?GuUZlqdXdQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ccb4e33-e74d-4f34-0d73-08da1beadee9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 18:41:20.3552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znHoo1RCVHKXvFF/3vqPrhtToRKRV0543E1G3Ip7qt9z5D6ujKCd0SfrYW9esorE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3913
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

On Mon, Apr 11, 2022 at 04:13:56PM +0200, Christoph Hellwig wrote:
> Merge these into their only callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 129 ++++++++++++++-----------------
>  1 file changed, 60 insertions(+), 69 deletions(-)

It is nice

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> @@ -847,14 +873,37 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
>  		goto undo_group;
>  	}
>  
> -	ret = kvmgt_guest_init(mdev);
> -	if (ret)
> +	ret = -EEXIST;
> +	if (vgpu->attached)
> +		goto undo_group;
> +
> +	ret = -ESRCH;
> +	if (!vgpu->kvm || vgpu->kvm->mm != current->mm) {

For instance once all the obfuscation is stripped away it is easy to
see how the vgpu->kvm access here is unlocked against the notifier and
racy.

Jason
