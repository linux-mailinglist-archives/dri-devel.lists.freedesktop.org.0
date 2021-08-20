Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 376013F303D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 17:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EA26EABF;
	Fri, 20 Aug 2021 15:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AE06EABA;
 Fri, 20 Aug 2021 15:54:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UszMLnV2zAVZRAu0uJZfbyDaXpdsS4nM/WEJtCUaXgJxLehGEXEWdqxbJr+zUdskhFdgxWRdGjpSxVMwr/SowLXX+7eTIjlHXuTSgIeK1DOljEhz2gMmTF4SEkfk4FnTzITer3O296dW2B3FGTB2mrg2WbDUSwB24CwzHGGWbDaF1eJT6tZBYOkPOA5nskNFwIY+vq4VSjW6jU7yke6hU0aAq+onTVkkSt0JKA+M7AmrSzNkVa3dc12OgQUgvkfWRDXVAzLlVY0RxvOuHv7unZNHB+AqCzTcmW8r63zgak6O4GreFCoLb4z1rCtDmt7KXd+apVIppipkiKPW0iC63A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GvcbIIW59Hby27PXUyauwvjo5NactKFJBtGjRJiFXk=;
 b=NDg0K8PAW7IVcebpRI4A/kxgBDUW0kw4VN+z9FP8368nMoG92CMxf8Z6Qp/JIfsqzShQL+jutfkjwGq+FTF5Bn+JuRCnRRuCATCUrqcpq33go8wghrEEFmIVvns8zeYU5/JdupC3/LliD5YAkB2YTgn5/JNE8O4FM8BE+Qfw8vBtPRKy4WlXg05Q5he30DWQ6hTg7CGGd1lPwiBEFcfMzA58DuvKSMXaLRZgVe62cTlXkot+ns1YvDcCDeDjItgCjAI8NkVUFjMCuGIrG3hbcDYJqUQGzWr29IN5pwoDOxG7cSVd74ekHyOwJatM2bcZnJ+j5TEBxVTxAqaD6w0zhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GvcbIIW59Hby27PXUyauwvjo5NactKFJBtGjRJiFXk=;
 b=H07M3nlqdRw4eb0UJZRUVZCnPiHxLnC69LqJMlqhMlni1evf02a8aNs1oXGU5IShX4xU/W5ByQOvz0fkqnn/XUgSDtrUmwHuMCOBT1fZ/Zbczx1Ni6P1oVe+bbiCfW4xOtCQhiv1gAdIqfWAhd4hYX+DY2xmK4dZHcVnyBZIJZ442/ummjTICeSNmEaX4dxM7PtlsDzqX+syQdPPRhmp3IhvzaEDsig22i5GtBurJhTvAYi2m7WgB4TlGsSBIJfYbyRVnv8/5BRfInqeuM8pT4/5UmucA//6fr5IiG4CYHLt4DRosL8ZcK6rAFvkz9MFTdzm2fJ7B4XDz5ecbx6ILg==
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5125.namprd12.prod.outlook.com (2603:10b6:208:309::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 20 Aug
 2021 15:54:26 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%8]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 15:54:26 +0000
Date: Fri, 20 Aug 2021 12:54:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Doug Ledford <dledford@redhat.com>, Christoph Hellwig <hch@infradead.org>,
 Maor Gottlieb <maorg@nvidia.com>, Ariel Elior <aelior@marvell.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michal Kalderon <mkalderon@marvell.com>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Mustafa Ismail <mustafa.ismail@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Weihang Li <liweihang@huawei.com>, Wenpeng Liang <liangwenpeng@huawei.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zack Rusin <zackr@vmware.com>,
 Zhu Yanjun <zyjzyj2000@gmail.com>
Subject: Re: [PATCH rdma-next v3 2/3] lib/scatterlist: Fix wrong update of
 orig_nents
Message-ID: <20210820155425.GA530861@nvidia.com>
References: <cover.1627551226.git.leonro@nvidia.com>
 <460ae18dd1bbd6c1175e75f5d4e51ddb449acf8d.1627551226.git.leonro@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <460ae18dd1bbd6c1175e75f5d4e51ddb449acf8d.1627551226.git.leonro@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0289.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::24) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0289.namprd13.prod.outlook.com (2603:10b6:208:2bc::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.5 via Frontend
 Transport; Fri, 20 Aug 2021 15:54:26 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mH6qf-002E7T-8L; Fri, 20 Aug 2021 12:54:25 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3757c276-b496-4618-d15a-08d963f2c951
X-MS-TrafficTypeDiagnostic: BL1PR12MB5125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5125F488AB523766B7810F6DC2C19@BL1PR12MB5125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZhTY295V4PWMRJlekY6KAHXYMFLQoH15RzPXRQD2Xv5V8ZAGP86n/KrOrrr5vhO0TRB/+RmFecsB19/ovAhc1su+e4S49Si4g82AX7T903TgQO5+lr9eZt01QaX2jibtxNTEOJRlr5o+9KIqga7T8Hnh7CyasSdpBkRb+YyDKmwm3EkMl0BodbpuA85uwfBUSIPAvLCD3lNMqTMXO6GN205s8StOnFmp/FmPZhUL3+37tvlIlywLXd8Z5i1uKPMd6HrXCaq7UyFc8pKpzKSfHxzohr0sQ74WP6k5Gg02wCRvZZdtn8b1QubGj44ID73TfkgLFpfjrjWInRnsfkgGsCXdTGugKFoKu8jIvhovfvhObbq+Itz67SzyDWz6oA2vjDuYc2o5pXDyIMAnv5vV4E6Me9WvSAX69RULDz3SxXPsOWcZy5ZZDhFykgG7/cCd1oBZo4ZxmMjgvUG1IKcziM3qxihZ6v6mEysIUuUrrMyQPQ0PY/buldNFObQ/mS8Zz0jwdRBbaGJ2j6DfF2y2PnAvLIrhA1pClHWG66nyWtAJgTqeRkTsAnjXjVKdojeH18Fmu3OgOjwOIfPCDy2s0tl8eRzB6CUYcrSqkkcFV4GgE9jHt/lxyeewU777/0NipJdptpXvN6wvS1s8D2Ioelfwp2AQ+oI0nV7u37jK4NajgHYNy2hUeLZeD5HDVeMx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(8676002)(6916009)(66556008)(9746002)(9786002)(8936002)(7416002)(5660300002)(4326008)(186003)(66946007)(316002)(66476007)(1076003)(2906002)(54906003)(36756003)(33656002)(26005)(86362001)(478600001)(426003)(38100700002)(2616005)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?InPjQYC2kiaZz1urE0G77dEjXrmLH2jjK8k3Z+cmsNFbKuxChj6nZbgrvbEx?=
 =?us-ascii?Q?GakPaHZjfQHeOqgvJ1iyUCbJmxJF/I2OTB1ycz5E22sJIK9xyrb1JTbljVsq?=
 =?us-ascii?Q?XozfNnyMepz4EvifXFXwElAeObuz610TblDVK0Yd9CioDOrms+izgg3eQxIh?=
 =?us-ascii?Q?Bd144OxLNiddwYuNZvguEzvOe1YIw8th0n36cDxnbuKSuj03og04osBkayrC?=
 =?us-ascii?Q?jwoYfauaqvC/XpzTH/NaqL+qNDLdQYoqL9sGAJsYOROcDQEhJzNsePOv4wBB?=
 =?us-ascii?Q?6zNxhu5T01qPB9rLTeq5z0P0Ii8jasWnCIr6ciJT/mKU5isXqe4jfD8AE0Se?=
 =?us-ascii?Q?9ugIvdFT0MQ8tAq/XqQ/N292A4vkTu6QjV+39DD6niDoV210p482X2Jb/5Xf?=
 =?us-ascii?Q?RIKSAJO51FD4yT4+anrd0gILZJ4Jyx1jDjCUpr/XRfmR6FhDGcdeZyRW8jEh?=
 =?us-ascii?Q?rwpNXo7qYYmMWhigpqK8xXSCWPiqv2t+7zdKDpwxc/vefcZcYvYEzZ/0pDi8?=
 =?us-ascii?Q?jbZojxL0F9rQ55v2xVWZBZLDanl6s0BE6RRnHzGPPp3ID3SZVFQq5qmtNPdG?=
 =?us-ascii?Q?2uLY8G5cVUN4VIrcwc5cZrkiarKRiEolfpO1V1yRAkSMEqGufiM7fSWqlqjZ?=
 =?us-ascii?Q?UomRK5PXlA707KX6G5gAViGn8c4QePraZkJKAxXsYMgWJsMIv32EWCAJNQcM?=
 =?us-ascii?Q?VhZFH1fVymMS0qIZOJbXi6E9uvFyYiGtBmHZegxrifRbV22/Wv4nm9iHGfGS?=
 =?us-ascii?Q?ko4igUazwC7UUvbK1f9gbUqyxZz8trvcN4qGFC4O3K9JL/N/KGWZZLQeTtd3?=
 =?us-ascii?Q?BXIAp8sIuU2aB9wpKwr7kpoRHkzpsxMnqZ2xdbB9sxzG0OpN2FNrb8MTcHHD?=
 =?us-ascii?Q?FMjtgnYE0t9hbcyBtJkEKt0CMMbMVwLInSF7FinGsVyxHdHX1PriKpfZzcdB?=
 =?us-ascii?Q?MxepJF4CFCCBru32ztcrboVt56XZec0x+z2ohWtuRMybLjcbup6WXJiaW4p7?=
 =?us-ascii?Q?qegobR1GqrcwCHgE/z+baF8MYLi2Tj42YXRYV6oRJly2m2Ezme2POa8Gn9RH?=
 =?us-ascii?Q?7RDNTgDiuwGXIsjfsg6ujNjRvToCsE1xTtzLX36L2NBsPrzsY0+GzdmaYOVh?=
 =?us-ascii?Q?uylr4Mwj5dSo6gLlglVgeJ5HnJMyLpXRHeuPEpuADd9qGmdCaPLf9HzZueiQ?=
 =?us-ascii?Q?iZxnXE+pGxA+10pZlBbn7L8uHUJANReex4v1K6Ex/rwS2DnVZ2kQJt52JVOa?=
 =?us-ascii?Q?KSXqvwrG2vFxf7sdmiuAKml7eEES0RAJJHt8LwYXdzqdgVBQkhUPLMOMj03g?=
 =?us-ascii?Q?jrrFhWN6PjJ52iizBDt61Yzw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3757c276-b496-4618-d15a-08d963f2c951
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 15:54:26.3022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3u6PkxRmmtOPMBKh9IxCb3ZjsMKrU0X2FoWTmtlNPVIXRrhtqXVY/wubNLi/ZlQQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5125
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

On Thu, Jul 29, 2021 at 12:39:12PM +0300, Leon Romanovsky wrote:

> +/**
> + * __sg_free_table - Free a previously mapped sg table
> + * @table:	The sg table header to use
> + * @max_ents:	The maximum number of entries per single scatterlist
> + * @total_ents:	The total number of entries in the table
> + * @nents_first_chunk: Number of entries int the (preallocated) first
> + *                     scatterlist chunk, 0 means no such preallocated
> + *                     first chunk
> + * @free_fn:	Free function
> + *
> + *  Description:
> + *    Free an sg table previously allocated and setup with
> + *    __sg_alloc_table().  The @max_ents value must be identical to
> + *    that previously used with __sg_alloc_table().
> + *
> + **/
> +void __sg_free_table(struct sg_table *table, unsigned int max_ents,
> +		     unsigned int nents_first_chunk, sg_free_fn *free_fn)
> +{
> +	sg_free_table_entries(table, max_ents, nents_first_chunk, free_fn,
> +			      table->orig_nents);
> +}
>  EXPORT_SYMBOL(__sg_free_table);

This is getting a bit indirect, there is only one caller of
__sg_free_table() in sg_pool.c, so may as well just export
sg_free_table_entries have have it use that directly.

Jason
