Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBB844329F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808CB72EAD;
	Tue,  2 Nov 2021 16:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B390A72EAB;
 Tue,  2 Nov 2021 16:20:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6JS2lMNCBJ8VFcgf1hwgCFdoIea0K+ZKqedmAKOPBlJMLyMW81SqI+2olqcAwu+Td/y7JhUaI8V1f8dm/TzeOjn5VrPckZGZXCKRSuzp2H/CP5LzjkpPvv4/HCQ7EiXFKqEqYzz9FeHNZpqNOtXaqvDyECInIcHxeh5jPTmD1oPeyDjCAjIDLyn2rjPt6l7gYeUC06JGITTJPi1xmS8epAWexf4s/QaJcsxhBH5DxKpc/zR8Fudz+ERlV/fM0ZbAJmN84bEgn2s57nfgHYxMdGyxEzcOte9QvV7iipCLszjCECS7Mi98YLY9eIGIpPv3RMxjdhRkFksF0HgVx0MMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OGUxW/K4I2LQA2qpEEXbJAN1QzOenlETbCZEXhEV/8=;
 b=SHEgupgTFpvLHj3J5BXc5Xim6kHkRRMuiHbpScnex4QT/5vwcingKT2slSV899Q009B2zEb7DQ6PTRKrB6T6+azQFT0kbQIpduxYn20ocn8oqqC1hjb8UmNpwgChsZ6oS+TQt8E7StEv7s4rzNaG9wAB4udskawVPuY05yn8pfK2Fabn7uMoiy0NdDODPY9jmHpS5idaaMnsLREja71MVZoc5VKA4d2CD00/N9uVy2vtrYZoRYht+WoRDSYfJn9VzvGmERdxi6Io6mG5SRp+1d6ryvxvTFp2BiZqvCDeJwW1vHMtLZ1QUxr0aV2R1T/GI15wF2bng+z25fFDDpfQCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OGUxW/K4I2LQA2qpEEXbJAN1QzOenlETbCZEXhEV/8=;
 b=FDsaUdJYaqq74wM1sw9P02Bykr1d6tmMuCHLSvZ8cw1hSNTqBX3tbbKO9vicTJnoUiSRcWXR+94thXauHYjFE3xpESAAAiKv+RZsiLHPzCK1cwM9CfrFGObSzOe7mgTn/RGhwT0xA0ZmDRmZVBvlzZwuPW/fR4oHsbyMfdhsf5p2tNXDpbRXofTUMoWaMP0YAZhWVONJtfQgkIY2QU2BIkij7tloJvbpkjsa+N1pY+8REeTWUurOwJYmrYEujhNstDr6VRe5yRmAAuWRjGrkOUC4+XbqLRVdrXzrQ2RgcAiMuoJw1C7z/jbnvO/HAqWv/MZNl/qRiAWq+abhG7gyKw==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5524.namprd12.prod.outlook.com (2603:10b6:208:1cd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 16:20:19 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:20:19 +0000
Date: Tue, 2 Nov 2021 13:20:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 26/29] drm/i915/gvt: pass a struct intel_vgpu to the vfio
 read/write helpers
Message-ID: <20211102162018.GF2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-27-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-27-hch@lst.de>
X-ClientProxiedBy: BLAPR03CA0068.namprd03.prod.outlook.com
 (2603:10b6:208:329::13) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BLAPR03CA0068.namprd03.prod.outlook.com (2603:10b6:208:329::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 16:20:19 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwWI-005AdS-FA; Tue, 02 Nov 2021 13:20:18 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d2799c6-577f-4747-cf57-08d99e1ca9be
X-MS-TrafficTypeDiagnostic: BL0PR12MB5524:
X-Microsoft-Antispam-PRVS: <BL0PR12MB55244599A6C014A462203014C28B9@BL0PR12MB5524.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DS/GxLeiVfTl48yblQ7kffDP2EYwtFzvpvj0LOFYP6POftEplHP9o2qCj719Dyzs6g3mtH0m8oyVoJYRAIQxsOtauNvFPJrYnVX/csYaJ/I9g+mZpVwYmHzTmGoY+gm4MCj0r004q+NA1PWjDEv3eBWeBbIgNd8VeMzfTW4awOCg4t1d2Lek2ZHqgzwVIkjNxoBT9LLVU+0XATxiOjimweftRcH1fluUqulICumNO7keXzioOHStrnHAXa625otxftsprML4tHr1dr5eBZjBNMXBm1uFTM0es1KoT+TxmrYRnmpWa8sKsNNSJafjqEURZ3aNDDwkvKHyyhNEK0zxN2NczZEMeFqkCdQyfLuNQVixBF4p0hg/G7e1axzXoDZg2PcOkb4u30N53CitVTk7I/4qjavEXTteboWjgz6dS+H1FZvMj54VVsVlBI5Pj09rPXkpyvpWc9ka6zqnlDUj+m8xr7tvjRmkYZ/HSVGNHIZ7qNdRGrPgLZf/XX0rNX3fEYxuNZ8aHe2yYNEgQXMq/2h764D6JyVoAGyvzONHXB4DkgCSkc1Z/qZ8ciMiQBCBa46fQhzSk07FM3u+NkAzgxqQZPy0V00Fzl9NKVWWuFyO5W/xFD8YdNdXQVbFYHyHd2GN125PYxAWtQBAgI13UA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(66476007)(2616005)(66556008)(66946007)(36756003)(26005)(4326008)(8676002)(54906003)(2906002)(5660300002)(4744005)(316002)(426003)(33656002)(38100700002)(186003)(9786002)(7416002)(9746002)(83380400001)(8936002)(1076003)(6916009)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c5NO6wyAG6Y5+Sbk72y8Lva7YERXNjjJxlROZlzfTU2/9aAiGitJdFBROxuv?=
 =?us-ascii?Q?tmc7oDhZO7ialJFJBbGo/dFF+yhj0bZxmB1i7MDRMvCgZAbLOixHbPiDi1Aa?=
 =?us-ascii?Q?lLR8vz9WkYr3QHPBw5J2Ee0ikN3e3fP9Lc6KwEeMk/6RYDBFOvUtJi+WGKhs?=
 =?us-ascii?Q?jGb6q8qX6SXrxkGzZU43fMKbnzz9/+Jx+L0AB9DrYrTqjmyGTxpX7B0hyhPm?=
 =?us-ascii?Q?8GTlFQnaKGHEu4YEwOqdse8MwMd1rq99eOn6U5/1c7tQBNiq8aRWI9lBEwfL?=
 =?us-ascii?Q?V4hea1Dx8+As5YNh8EfzK8bWvGhi7Q8kdMQRzpbiKP/M0r8xl8HMMjszD8cu?=
 =?us-ascii?Q?vAP5JOQyLZ8NMFlF9NPwMruwLZGMzU6BLbAxfV32mOgBGUwRyfINXVj3O6qL?=
 =?us-ascii?Q?A0yH5TjrNewiMSWG2HeDgUmMo8o5z8ylbBpWixCIdc0f0Uz9/wfyACkpDaK/?=
 =?us-ascii?Q?5y0ovqOs/x0rV4fKDdtfjNHbxlhqfwN3FNm9Bl6DfzEEuKmzx+eKAHdu69Ym?=
 =?us-ascii?Q?HIKFyR35G2Wm/zVGZYR4rP6qDiKMBkI1DRFXKQ0WX+gxH2msPnk6hn6ZVlS7?=
 =?us-ascii?Q?p8jePH25UsP9MFM/sSAPeN1aRYtf3UD/DTqJOU3bAv/AQA5ZGtzXR5s5NFUr?=
 =?us-ascii?Q?nokads1hcdJDOGtjBuNWw8ezuDN1sNYU21R7TAAk4KKq0HtixYjqCDfxuiEf?=
 =?us-ascii?Q?4FsbWgyyPnF8K1p9qs1HDnk3TuKtyxiBGa0SLwjcI1P2VmL4kna1iT6hAxpj?=
 =?us-ascii?Q?h+F8DZs6wJYNMO1SmlAJ60PNyw9EdCTOAnwWeUuSzLT3BYlpY/0/H+35NjQz?=
 =?us-ascii?Q?11TiHIfPGnlEyZ0or/FpoTvLRnzv7WF1gD6jA0nGZh91aDr8Ol5mWwfnzES+?=
 =?us-ascii?Q?rZqVPs0oFbNYotBJHJISk7Iw20ziqQdpHYFBKOBufsZdacJOOMHBnYcRDscd?=
 =?us-ascii?Q?iUrvU6i75HFJ7wDeGdgFZDs253BfLTzKjwICSyKl/XwEXOWTpEGQ4cduiLan?=
 =?us-ascii?Q?cdJQCZ6bJ/wmLJMfhe7N9ek0F9WWVn8BW8xZZfBIkHO5VVzkie1XZRM+qmel?=
 =?us-ascii?Q?J2I7gZUk00CyE45ce/kgmKPK7TAyVLmILfRi+UH1bOAVGtgcw1wTXzOD1kfp?=
 =?us-ascii?Q?AQ//BXXlQbFbDRudNeiWuc4pNhyvMOGWoAtF+/kdPiEyFyBpqotCbHRS+9/O?=
 =?us-ascii?Q?FzpGqGpc52c1pj+3Po+HE8yxhp60j6wm84y01rsrgTJZ+t5JiGdSTuRsC98j?=
 =?us-ascii?Q?9H/JbpDA0T0V2VnS03xs/CyzFkzGmnTwJ8GEzlDxRB7tU/8WP/gj/9FGtVng?=
 =?us-ascii?Q?64eeWlydidgoqdPiHFW+azoV3y+PrNuGUtm4HcdWRKPsheLSXKppPFoGfQhn?=
 =?us-ascii?Q?KvIPp5Z9sa7hj+53vZaHtOkZvLvLqXr9saDxs1cUvKI/KpZkRvS9LJN+vk/O?=
 =?us-ascii?Q?uaA1ZlctjntRjOHQ6Y7vnAAgTCykTaSgRcP5FrC8q4/nUTm+XPcd2zaVHxa5?=
 =?us-ascii?Q?Ejb0SkvpEn4QzNZavkKb/EjdrS1psDmV0QQlqN5L7LHVTG8fqCNSzogzQLmd?=
 =?us-ascii?Q?/1D/4RTxPZ0yOwCXi/I=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2799c6-577f-4747-cf57-08d99e1ca9be
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:20:19.5137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EME9OXosGA2G+RqpXkZd6YzQYjNSrbcuIESTvd4AkV0NnZhF3iBf2i6iggypGL2z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5524
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

On Tue, Nov 02, 2021 at 08:05:58AM +0100, Christoph Hellwig wrote:
> Pass the structure we actually care about instead of deriving it from
> the mdev_device in the lower level code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
