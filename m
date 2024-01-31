Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA5A844319
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 16:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8FD10F64C;
	Wed, 31 Jan 2024 15:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7CA10F64C
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 15:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+oGrreQjPpVy9agCA6ToDWuny0cz0tzvIxIspNoZQTGVpOMnp/iOqJL+Bfmd1fdfzIM65Fcgx4xIVUkINSttte1xfJEO3WfJy2snbF7iRw2hhcvl9IZ148GMyFe4vuNtfcX7RLu46jjbocih43dz83Asvh3HEYkBVaMBfLF0led7VJkU15zprg3+2Z60H9jBTchUDfY0fx4zgc5xhqLgt8JmxqaBHsBvxN95bVePFWtKOpuMclivRf8tc1nzuMwZa1sYt0iI1r2eMtpyihKovRTzmjW5rM8wgsbuuClWnumCjhKWw1eO7E3P6ss5A4EXSJ8XLyUwL/Mm/fGXiNuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAb0iTEX8vHW0VtJxZUPGmcHkvOrwz1a56R9ABkBEyc=;
 b=SzZYUcB0aKDkEe5M3s7gTDUZwP0B4OMKfK/VSLLuaSgPU68lYCeUiPo+0EwRiXyao6dCErfPb4TSXWcLaMRI3Rvx08Rub3BBtuaaWPk8tDP6rTRQ6pcQJW+mFpPQzi9rnSHfy6+43i3R0LparuAs8zs6uSlqdA2dQp2oMzwMw9bpKeWuCBUq0cN5q8pQ/DjG+9VH0hqnjJfGAhZ+rJq7jxFwbNYZSSpZNPbH+TyL398Smvzl5B9BwOAd7uZJjwQM+o/hnPEUGEKVB2BSf2yhkjBiA7k0qtX48g3ogqk5ivURmchXSDpxWViUkeoDk48fl5Ry1n36NOJFpqNK+ZE/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAb0iTEX8vHW0VtJxZUPGmcHkvOrwz1a56R9ABkBEyc=;
 b=JZ1c9qYk70sokOcPaYfdI5hyY5vgok7kMYZUL+I4yoC2Sb4f2Dvz8YkG4FKZqwsS9PJklembPhxQNFPnbe9MB/DdDlSFpJUNfsd3qT5c/TLeJNo+H2ASR88tqHWjBaoL7y2zKPXWy1JT6UWBjzBFUvepedV32e8htFgne7Tvk8XJFnK8gBtXsRcckbcItOPxbd88nwToK/PRnCvDLocc55wseyTKDp2pSwy19NsDwqLGa2RvL5UCkBINR+hl6U9v7pvMC9xzTaKG+DHU08GR+Odxx9PkRL1NGslsCLvJ9Locdp2WoJFFqEW7Qbmfkc72VFJKmIt4WioD0q9e3zcgfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB8710.namprd12.prod.outlook.com (2603:10b6:610:173::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 15:33:12 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 15:33:12 +0000
Date: Wed, 31 Jan 2024 11:33:12 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drm/tegra: Remove of_dma_configure() from
 host1x_device_add()
Message-ID: <20240131153312.GM1455070@nvidia.com>
References: <0-v1-c76c50cd425e+15298-host1x_no_iommu_conf_jgg@nvidia.com>
 <583b9145-cbbe-4a03-8120-e2a66a6093c7@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <583b9145-cbbe-4a03-8120-e2a66a6093c7@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::7) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 009a5b4e-f7a1-4aea-d727-08dc2271efad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MNIDeC1zi/F95hCOqa9OrRtSWIBhL2EHH4nnhJi2aI1oaT2ZoL9TRKS1gpcW7a3s3867t+HqbWnhztzlvnBBhRnHfEaS4yL6t31OSkzGyvR7p/XAUOiePSMAoHk4RnqIAf70P9ah/cl4W0+U8MykqU3a7mYa/5KSnLY2ym80OKIhti8bEX9BqcJK5a5z6SGQKSsyQ551kvy7zHxTZCar/HcnYOUS4B0W72tvXAyiQXTLRaiNuwy0ihycITfk5GwY1ehr1/0UdVVbEdTQgtmf611MQX4rYiN+NMZQCqibo+6oT/q7dpAxsj+kDrBpRIwJUzy/s6AHmaGWQUl/Y7TF7dFDI2Ud/CkYr5yx8dUiv0l82vSEhBUuBPi4si4sYoD/e7f1+Eu7uYzh9gp8aULJnu/tqEc9CQfNKdBQTFX/0ShmjE6g7QvnskHox3EEecSa3neNtUc6ghdH63HcPeQaCkdFd6yCB/YNbAs54ROdJVUcDOuf2u/w0ZD+pQMxbvlN1xw6D6f10d/Dq/eaXZYhaYyi0crrthAUkt6X+XINZ6V0m30VdX6u83hXMmlvQGbKhhKxQLqGXHCN2rga6Ivcl87a/3jkD0zDMUANY00Xr3pMPEMfqgrj/632lneobsvC9pb5iYmH3o0npeDoep5DQC1y/YPneAdTFK8icH8bK6M/1yGD0TY4x12USmzkJvYNkd8ZONxQNmamsItjy9lBATNHilCxh+eWxBQqcLHXMlU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(136003)(396003)(366004)(230922051799003)(230273577357003)(230173577357003)(1800799012)(451199024)(186009)(64100799003)(66556008)(2906002)(5660300002)(966005)(86362001)(6486002)(33656002)(38100700002)(36756003)(66946007)(478600001)(6512007)(6506007)(2616005)(53546011)(83380400001)(1076003)(26005)(41300700001)(8936002)(316002)(6636002)(4326008)(6862004)(8676002)(37006003)(54906003)(66476007)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A3WBcCIkLS8O4nG56MIIhVp3Ph2XhzJl6/h4i0ESV4Qrp5glnAfKCUtGNO4v?=
 =?us-ascii?Q?wMjns2TGQ3TS/EVRDy7gZ/CgfoyuEr2qwuQ7+LXcyY5MNZBFpra3T9AOsgLY?=
 =?us-ascii?Q?C+RM/NmlgAzLgKWpd3yNGZ1svUWDkufKOk74qw5du4GwEvpBpKXSoPEZhGn6?=
 =?us-ascii?Q?iicv/WVL3vKZl1qz6ij5xYIePd19c4wP4/a/nuT972aHWYmWoLCTGnbxOtpE?=
 =?us-ascii?Q?+qhOhkikZWjCTIMxk5rUSYO2C8Snsa8dKlHUyJVzFyBBJ+c+zTU+SfXJMmEi?=
 =?us-ascii?Q?ACIq1xhDwTUYWYq54VIA6qiesVPa1bG+1az4Rn/PcY63E9Y2km2wJXNaRjcX?=
 =?us-ascii?Q?Fk8KxcmM/mefgsdL8k85a5zmCK5zf2GrYXipv5jPaD0GbNJZBXS/uPh/ZPIp?=
 =?us-ascii?Q?FhoSDChQlKRgJSRKeXSQZnB2e8ZgekzPmu9vBD/VLC0CFzNsQ7uGzt51k4hd?=
 =?us-ascii?Q?7ATWLJ0wEnMgDrtO0pCLOjtb08aNfx6XLZe6cgfPiKW7dJG2lPFn2ufgBDN8?=
 =?us-ascii?Q?V9Y3DhgEQWrdUaiC2obWqZenhIHmP6pFavBDfpkS2xceXyg3fGh8kRQRWcCa?=
 =?us-ascii?Q?nDhFV7+NjVT/5FXUJQR5aw3pbTBDzvJDcDhoUETAkhcQGGTgUpy+/IHgW1ha?=
 =?us-ascii?Q?T1ioau3zRgBHiEiPndKCwP+TksFNSIxDig2MAArVn71md7BUrgWDvisHhY1t?=
 =?us-ascii?Q?F4hkpd4DV5XqKG0OLJEwr2T5TLKojyURBHB3PzUymgZs7gCSZKUKiHuOlS1p?=
 =?us-ascii?Q?gHqrXMf9A/t16GkTpLjJ8wBDqUpy6tb1Z/Xc7FVaT6NCnW9acXsjZX9kZ/Hr?=
 =?us-ascii?Q?2LlaDzyCVcie5sxXqt/ls0ISBU7VZAXxJsuJRqdGmqZNczrv3p+WrZce/+5m?=
 =?us-ascii?Q?gjLQxaqhxr0ppwS+Gy8Ocwwxh33ZA+CnWYAWSd1EIBtzy7JhJve/bpJ4KcSf?=
 =?us-ascii?Q?yzh25tbMOk7bS/03pRXpAfyS5wAwcboqTKraTAVLTf+8fHj+uJXHkeauSjn9?=
 =?us-ascii?Q?IPE1CEY/jlQvZxzGSgYolwgJJK2ecUr1+8tay7m6Q7htXijiVDvOOr0L68+G?=
 =?us-ascii?Q?okukRr0FxhCTJs1uvV/qHhda/iZ4HGn5dUMm0MVNIsk3jgsIsI1kX4pcRspN?=
 =?us-ascii?Q?yxd0RjSG5tVw9hrFhjZT7dOF+UthXwk8Lmo65i5aVpx74Eg7WDaUol34M4ag?=
 =?us-ascii?Q?2e1XWDox4q3pjsPZTqAy1bHEt5/nnWLRSEGYfa4PMPiJCWxhUd4YUzAvPR52?=
 =?us-ascii?Q?5QrtkD9oWIDXJq5KlZYOJoGDF4AuWl+UkaoROrZJQvniaqIdjotVlJDDv8Es?=
 =?us-ascii?Q?cWlSXZUlP0iIt1CUKE+kDwSTIqOr/CMAV3NDN8Xw7c9rR9pMD9xFGy+xogOT?=
 =?us-ascii?Q?RGDcJrW8lnoiHK8YiMgCmrl8mu20tux14cNKIMMBoWR4oMRsz1/DYsDKrfgN?=
 =?us-ascii?Q?sjMcoe7UV3xNQCN87Tgu0hw3+GO/+QDUy5oQctXKU6d4x4kcMakOALR9Jk/O?=
 =?us-ascii?Q?lIGqZMwgdZS9v0k8S0bbtlNzwGcQZobt129or8wIzr4u5YRyYv9WC2A1OqEH?=
 =?us-ascii?Q?p9x3JtEgXrD8D4p+Oi28OXUzdPKv4DEXwBduuAQY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009a5b4e-f7a1-4aea-d727-08dc2271efad
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 15:33:12.8744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESwCFG1N8rnyLkFChKZCIxQotChzsdcQG742oNav2mWFr2j8YyrfC9x76AY+gCO8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8710
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
Cc: patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 09:55:18PM +0000, Jon Hunter wrote:
> 
> On 30/01/2024 16:15, Jason Gunthorpe wrote:
> > This was added in commit c95469aa5a18 ("gpu: host1x: Set DMA ops on device
> > creation") with the note:
> > 
> >      Currently host1x-instanciated devices have their dma_ops left to NULL,
> >      which makes any DMA operation (like buffer import) on ARM64 fallback
> >      to the dummy_dma_ops and fail with an error.
> > 
> > Since commit 14891af3799e ("iommu: Move the iommu driver sysfs setup into
> > iommu_init/deinit_device()") this call now fails because the struct device
> > is not fully configured enough to setup the sysfs and we now catch that
> > error.
> > 
> > This failure means the DMA ops are no longer set during this failing call.

Looking at it more it seems the arch dma ops are setup still, we
ignore the failure on multiple levels :(

> > It seems this is no longer a problem because
> > commit 07397df29e57 ("dma-mapping: move dma configuration to bus
> > infrastructure") added another call to of_dma_configure() inside the
> > bus_type->dma_configure() callback.
> > 
> > So long as a driver is probed the to the device it will have DMA properly
> > setup in the ordinary way.
> > 
> > Remove the unnecessary call which also removes the new long print:
> > 
> > [    1.200004] host1x drm: iommu configuration for device failed with -ENOENT
> > 
> > Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > Closes: https://lore.kernel.org/all/bbmhcoghrprmbdibnjum6lefix2eoquxrde7wyqeulm4xabmlm@b6jy32saugqh/
> > Reported-by: Jon Hunter <jonathanh@nvidia.com>
> > Closes: https://lore.kernel.org/all/b0334c5e-3a6c-4b58-b525-e72bed8899b3@nvidia.com/
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >   drivers/gpu/host1x/bus.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> > index 84d042796d2e66..61214d35cadc34 100644
> > --- a/drivers/gpu/host1x/bus.c
> > +++ b/drivers/gpu/host1x/bus.c
> > @@ -458,8 +458,6 @@ static int host1x_device_add(struct host1x *host1x,
> >   	device->dev.bus = &host1x_bus_type;
> >   	device->dev.parent = host1x->dev;
> > -	of_dma_configure(&device->dev, host1x->dev->of_node, true);
> > -
> >   	device->dev.dma_parms = &device->dma_parms;
> >   	dma_set_max_seg_size(&device->dev, UINT_MAX);
> 
> 
> In my case the warning is coming from the of_dma_configure_id() in
> drivers/gpu/host1x/context.c. So with the above change I am still seeing the
> warning.

You mean this sequence?

		err = device_add(&ctx->dev);
		if (err) {
			dev_err(host1x->dev, "could not add context device %d: %d\n", i, err);
			put_device(&ctx->dev);
			goto unreg_devices;
		}

		err = of_dma_configure_id(&ctx->dev, node, true, &i);
		if (err) {
			dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
				i, err);
			device_unregister(&ctx->dev);
			goto unreg_devices;
		}

I didn't seem an obvious place that this would get fixed up later?

device_add() was done before so the iommu_device_link() shouldn't be
failing? Are you hitting a duplicate link (ie remove the nowarn from
iommu_device_link())

Jason
