Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98713443244
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CF073083;
	Tue,  2 Nov 2021 16:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2068.outbound.protection.outlook.com [40.107.100.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7E973081;
 Tue,  2 Nov 2021 16:03:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J776ULIhcTHJEaJd1res/bK4KAxuJGuQiuy5tRd7RZRrc5hkpHOMZWbFurwcA01zv5ZSeGxiD16bexbS+vo+bzsV7nHi2KUtEsxgKoRl/GOhoh2LWlmK5yEOrgfVPhsxYs6F2yi9VwA/YcLMyL2D3qVX3kzcG5JX73ROMcFxFnQrtKe9e/3WZ7MrZVPrxEv4OE5t23ScxiKn9XfHZkPrxF6pYbC3yb/o2D9bvxpTiPlvOwZ+Xu290LwIKBGe3aY+ho0iDj7mubi4ulwAU9z7t7BkSsX4jbyg/wZSSgxK7z2M4YM+jBHb++POVYQ9nQJckBOx09jYHCTj/W6+CI8YMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKBcSR21St5n8aVvBly4ob0c7zM6xvt4QZn/LEdGmiA=;
 b=KoxtN2lm9/xbfrAqaoNsCvHfYM2QQkZLtKVChxV60+/j/YYr0//pVm9aUjLewodhazSnRyOfGHbeu1wno3770UMKgdb/9EDzQYO2LjVnZR4KdTZO6Xu+2NljqGQX30OLmNZjbzFzlUHmxvPp+NyixQwM75mPAGWQIXA3/KCIIeJEWc6O0l59aLFjBJL2EsTChIdXze16x50LBIIqlrXfCvvFFdgFSYa3DYFN9CCoagSrecJCpAvgiDVxDx0iTXWQJyNB/T96a3fjeX1e/Y3vFmiM8Uj7i4cRZwAUkYlmikq1G7kFacUY7mxW1LFbPx7UfwCQulD/RPYBUBvireKk4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKBcSR21St5n8aVvBly4ob0c7zM6xvt4QZn/LEdGmiA=;
 b=nUTTAJ88xSjGNIfRzW5EfKyzuA2AAf/Wv8eLPFXxa2JxZoXsSbcIpRL+VBQ0rxftbIIZ0p0E3OMVsuK7UyLdP5i+N6Un1d5qaIPXzfnkAPw/+/dOIAnzZJsI6FjvYHGuDd9z707yVXPJUgZREb2zjggafh29feFcjTLe2PZiwjTkfp/z/OMbTeBkLHAyC/nA+j5HelKMCAh+qIb8MUo8u3rBMu4unfv+bvvNteqzmmyNc63mddSU7pLa9RthZ5AsxcRJ1bGKzJwUGL3bjIsG1nXYHIQ51Tk2sruqiPQbBhrWstOdNXnlo5zfhMC1SGCMCJxBaTstFtbb6zmEzGGKiw==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Tue, 2 Nov
 2021 16:03:15 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:03:15 +0000
Date: Tue, 2 Nov 2021 13:03:14 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/29] drm/i915/gvt: remove intel_gvt_ops
Message-ID: <20211102160314.GM2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-8-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-8-hch@lst.de>
X-ClientProxiedBy: MN2PR01CA0063.prod.exchangelabs.com (2603:10b6:208:23f::32)
 To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR01CA0063.prod.exchangelabs.com (2603:10b6:208:23f::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.18 via Frontend Transport; Tue, 2 Nov 2021 16:03:15 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwFm-005AGZ-I9; Tue, 02 Nov 2021 13:03:14 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c4798f1-f32f-47c7-151d-08d99e1a4782
X-MS-TrafficTypeDiagnostic: BL0PR12MB5506:
X-Microsoft-Antispam-PRVS: <BL0PR12MB550688E82F6694320900708BC28B9@BL0PR12MB5506.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LCYE9S03sgIRK1lyXKebvzUBy+atc0Ot+i5wlEN4DRnpBdec1zL+gNE1j1B2/7tmHsoJ2DrN/wbO4GyTzZLlSJWHcvbFwZROu0qlCP4drRLFkC0jFAMdyngFlBNW09sqOKb9a3FZgC45KSeRrVUtg0VBJd+nK3LohKjcDvaCo4XQPD8w17Cm+u98tRA6WdKs586qTS+zuwfNkbskQSSmC6rBoBb2zUQ/cizvyu8xaZnfGkYpv0EvDPcw56L5XefR9P3n5gNPdPmT55WFzY0E7/cWuBmaHn19iCoA//kl0p8mfKhtKxixWv4UdabO3hjuA1pNDGVR3KDE6vicRbwQKiIi5yB9fO1EiKXXVlldMIkDp8e0JB/TyztHFqg0ZMj//TSCKc+LT8D1Do1FLKyB6+Iz3NCS/BOmFx4WuPwfYX/f3WqiY/1ZsVhMpTheOzctqB4Qzmstlj5B6AiFdEuGfybHNLUlSPtDwupUiaJ++1PV+DAagsP4v2ZQwponWxJbQjh14MMAIojnotJZ9BMyuhscSUipWink+A9k/whUOAmjGNrZ86SaB+RlO1BJcOzfNWuYYOU5Y/guAyvDzfR/6JAJodifNW9lM8+P7NTAaCKpzcF89g2+mTPvUxQ1lYAqjtjU3JiOeksPGKD1ITrI6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(2906002)(26005)(2616005)(33656002)(36756003)(86362001)(6916009)(54906003)(426003)(7416002)(9786002)(1076003)(9746002)(8676002)(316002)(8936002)(66556008)(38100700002)(5660300002)(508600001)(66476007)(4744005)(4326008)(186003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NuKYfrplT7S8rMwraax7k3456II8tDcxXAukekUPduUrj3sppb60mabG0BYr?=
 =?us-ascii?Q?ytWmZg1GFiQKCL50O4PCabLw6b4qLBWYJszY0wgOE3zelcuSiMN8A2z+WRx2?=
 =?us-ascii?Q?0N7TKAC7VDF16+HBI8F0DEv/eZUJLv8lG5I80dPRNI0UvK30zyzcBBmLv+kz?=
 =?us-ascii?Q?yHZm+HypqsV/iRtlXRH2JAIGzZ3cB29qjtcr9fjBSE0aVf3AiZLAJhYfksEf?=
 =?us-ascii?Q?ILaCHK6Rq2yUJO85si5uic3sGJ+14JWt8flNZklScrmWE2V9pysam0V1D62x?=
 =?us-ascii?Q?SvLh5Fs/upmkrYzyi5IOo7m6qtDQ8AfFO+YtFWAbfmjZ/zYcf9024pxP0a58?=
 =?us-ascii?Q?A+OPSeyyeeY2iY1tE4GI2bbbWk2ilAYaugFMMtGOkdTvLbG5ag1hI4UpLHd8?=
 =?us-ascii?Q?Fg00COcCK2eGnW0sm26zj3E55XthlyENu0bIo2Du/wrnCYTNjAQXng+UrEGP?=
 =?us-ascii?Q?cQ2SBXy5fPJBwV7Dgms8dZVWpXKRjWyuUObXRr9kziAal4t7L3ZVSUgYnBzY?=
 =?us-ascii?Q?CrwIs7gRJbTjD/HfU9cl7VAOZOEuF+fZUvOM45NSYN6q1k/Lt9foP7e9yxH0?=
 =?us-ascii?Q?ZDpyyRy1Hbr6fYYy333QUt7Ko687/ppcPNZuGjwYyyzS0gmmmylgtb1ubamu?=
 =?us-ascii?Q?GcDh2WYtcquAjDw1ljGrKXatoJ4cE53o2ltwyx/ItEB0TqH9BM56/Pa2b640?=
 =?us-ascii?Q?ECGj7kZYLexjFmEoU6snHDewF5aL/K43GXYQ6vuY7fYMOaXEzp1TGC0RYtOL?=
 =?us-ascii?Q?FV0qXiDI+whaUnaunyTq/mEf3zizhkAwBBdKB0Boy0B0+5cg+wnSs15o78na?=
 =?us-ascii?Q?9TQsPLTbknzkftfNnA1lIkjeN1noFDzN76Dix1JcNlmgGjfykZV0v3MAImA7?=
 =?us-ascii?Q?0nPCb4/tDASMB42PLQC0TdCpsLhzhq1NtMK/CbheOb33slj4X6iWHnXOhfsK?=
 =?us-ascii?Q?dsqxiQ2OXh/PLt2hq9zRXSEGAa6mfEFIZvDQv4SvYKDmCbZrGG3nZQz8ZyMX?=
 =?us-ascii?Q?xfkpoXXrF3Cn6Xe4nuebPMSytc84g3yS//I9Hs5PIRsw63zcn04b1Jr8xwpy?=
 =?us-ascii?Q?r/yb+24esBDMeQywKEw0yGsE1Ps3EtHm6hiFl7fronmYWF70g2VdGcXU4bHz?=
 =?us-ascii?Q?7dEuF8lpywGHJzBMlAdwvSneQKkxod2/+py8Wzs7jIv0jjRdd7Eq3slCpnSu?=
 =?us-ascii?Q?4nvDLPStrDeZNvSn1B6lBzlh5SjnAkNpyj6UUpmB5DO8+cZ6LCwWSlbKnjt3?=
 =?us-ascii?Q?KSem0ECHlW1uAO3YCf6gvxzvx2dL+qfYI16EEjGUyXp5GHTpeKE+lrgNJOmP?=
 =?us-ascii?Q?JmYPl87Us4Fc7BA4FkbyDNtHwcxgmDc1Mwu9lBeeJvGc0WsvVXCf1wZvdLR9?=
 =?us-ascii?Q?n5w+Kn3va2cW6B2L5+HUhkww70Idtok3j0LB0S4k7q/K4JFn00hn2ULQjwvQ?=
 =?us-ascii?Q?+Mv/oLfwcAuAf0W45U1SyMRk6kSwI/+mc9l/yFKmphjm7D8iutEl0T4m7+Ey?=
 =?us-ascii?Q?a21yPVO3K42K4G/cf+MfruTSlYSS9Ll+GfmUoUUkLsbzXrd0xuDjOv7cz2wB?=
 =?us-ascii?Q?AKnZNba7V+O4PIAbSBE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4798f1-f32f-47c7-151d-08d99e1a4782
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:03:15.7085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xFlFqp/meHdobks7zoZSWhp93Ml0RLwa4kyCNGoNY95VpmnFgtCF7AzkfDXzjzT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5506
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

On Tue, Nov 02, 2021 at 08:05:39AM +0100, Christoph Hellwig wrote:
> Remove these pointless indirect alls by just calling the only instance
> of each method directly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.c       | 20 +--------------
>  drivers/gpu/drm/i915/gvt/gvt.h       | 24 ------------------
>  drivers/gpu/drm/i915/gvt/hypercall.h |  2 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 37 +++++++++++-----------------
>  drivers/gpu/drm/i915/gvt/mpt.h       |  5 ++--
>  5 files changed, 19 insertions(+), 69 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
