Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1D287CC3D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 12:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0DA1121AA;
	Fri, 15 Mar 2024 11:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FR+bSbT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD401121AA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 11:25:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kl/SYJjigwkqzoZPosrhQSJa4bHYq2hRMvnqVb85elcvWBKC1jxoeFVUmq2GmXvPU9vQfdvlSFQFwM/EiQBPqA0Kj7EJa8346LEo+IXdnioOuHjOdP+B5I2ocoDdzNq6ztfxe31lvVUlSVbbz3JpfNiR+4+bomwDqKX+Y5ofZh4j7djz6739XvdQhczuhQoq8/DR/mA5QxR8VfIjl9feynUfT3FCw/dbgWrq3gDSvxn8obbisd7ksoxJcYmcXb58SUyY8MYNlCatKi2Dlz2gOzVc1PUMp3HyOi+g1ochlh+vqwPCFSOdLMn2b4v1arPtA1tOP7CFiHHSp0nlCII2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHY9bFhz7L1kpHqN4YTH+qneca8FncMC3rrGbxiwqsg=;
 b=S5OSSrMujeQf3EpP5QM9sMLF/xCXnT6M2pn0Wh30sZCNxhtb9iAZLVNwWA1MUXswX8wMJdRiNlXb6xbHTz82PNzxycUvXXaWT+tKX5YFH14aYSuKwIrtZKLzJN6ZAPmI+VdK74rY1zmkVQNC91voG6COETkndZJ2dKTxJUThfbXMxd2d0dMZ+wuTbuw7ImXWVNATVvGb5n7l5eUEXdF+JkcigZCZBI0atrLjZXZhXbztBh4c8O6tXl930yM9Kj/NFTIFT7NOsBI2oJDViJrqS4IlHhssyaL+m1ahvxrZbDq7pAiRe2alFXb1yA7TjbPr5v1axD54Pw4y6NbN+MuD8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHY9bFhz7L1kpHqN4YTH+qneca8FncMC3rrGbxiwqsg=;
 b=FR+bSbT/PpY0gGkMzTosJ7qlZZJ+aDYl9zud2lAQuELSxp1hXZ1jUrSwow8n2qIx1uhVVoGCnJj3OStR75YMKj2m5t0Krxc8xY+xBP7qALUJ6i8kyf+yKwVhKn+uDU/1bs6W800xSkHPk4C2TAw0kWDYmBpS7kSO69e/g9tu9frobOtRvJsmQ3mYRb3tFlkp8iXlA3NR/WznCqMNxg80Ed7AdNZTIY8RMgViQVcA8dDb6WHdsD7xM/6mhp0CdXDcKzXYLmXqEj7rtc8wXXN55deO8LZVkbrMHBr19VbfhdrYuCTRbE+GvVDemCwZ+8ytFuL1x+g/9y+ZVmLHOad3hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.22; Fri, 15 Mar 2024 11:25:47 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5159:5fc3:7933:24c0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5159:5fc3:7933:24c0%7]) with mapi id 15.20.7362.035; Fri, 15 Mar 2024
 11:25:47 +0000
Message-ID: <4ffa428a-e6cf-4716-ad7b-02c126d66772@nvidia.com>
Date: Fri, 15 Mar 2024 11:25:42 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: host1x: Do not setup DMA for virtual devices
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20240314154943.2487549-1-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20240314154943.2487549-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::8) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: 13133f20-94a4-4254-f895-08dc44e2a8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: omhBD3YkImURPXHJ85Qf6NlvcSfPtGOwa+G7b3wP5mIQ37Zx0bCIy+4VnXmOHbb/aJx5uF/UJNXtbjEx3t4tFADVy2IVVuDWaCCKrD8AJLL0+gQ6LyUC6swV96twWoNd0XXog8ku3H1NwJxRF/2iVnW2fwTqMC2Jq58NJrRX6R2d6ObVteAEUfEDVRxj8XG3vtvIsMMvgdCemq91iUy3XG2eCIf+6gXeamzo6RQ1YRV4y5wCnLUfXSWrnzz1yFcrt/qR7KPnJIAmTljOs12I7yTa9wSYDHBd/zG4v3tsEqRRZ5BC74B5GOFGPY/TWsEF2DM/PwXSiUxpuCAMZM+J5hodPDfaL8EqthlwH6XC0uYOEIkZc3vEdpU2G250PBIZIYqKlc/tiTL+nLne94mAeoUsfRhWQDNmWKoAamVKk1Kgkyq7Yg1zHgdheKn40vtewMQhaKpxlQqIfWVa5d/q9xAk4iOoewmjDEgJgMJpsuVfMYG+Qjwa1ceXEGaOEaW+YHgROhVw7XDsPujzlvmRJEMUWM02n/1XHbTHJ3eF/6+FKXkTFzoP8Y4E3EMhbnbyk2tszMu4GyQlRwPcY3y8gQ2y1SVZCwbZgSFYXcaltVhGkL6HNNmE64S3N5Yj9hfus89ePjggxhcbx1uanYKa78w65GHbZ8siMAu0IQg6eNU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjZqc2RwUjk4dENpTHNlRHI2TmFyRmd5Vmw0dGd3eGMwaXNmOGoxaEczcEdv?=
 =?utf-8?B?c0Z5ZndvdlUwQjZaVFB1UTdlS0hSZEJHc2t4M3BjZE5mMU13cWc1S1c4WC9P?=
 =?utf-8?B?OTY4Y2l3ZmwvbEJRLzFkOVNzZngxUDZUNlA1bnlkb0hZa2hWMWlpN2tzekNK?=
 =?utf-8?B?dDcrUERNTGR1WndwMVpnczhWME5OYXpPd0Q5UzZTVDB5cUtiNThITWNteklH?=
 =?utf-8?B?NGJlMldUbjR0a1pVbFJaU0hsMTRUTWs5RGlYSDdhMFhGV3haNFZvMDZ3WlFD?=
 =?utf-8?B?YXB6RE9uOCtvdHBvVFBaL3p1N1NUVXBsdDlscGNxZjMvWnFnb2QwSmpKOGlk?=
 =?utf-8?B?bm8ybkVBSVQyWFh4NkRSNGVKSXhWcXpiRXVIRGJWQ2xVSDVMTnFVYjVCdVNx?=
 =?utf-8?B?RXRzcE5qcXd5dHRKZmFKaFhweStGdkpSaWR0SlRWUGU0VUNmQmZZSXMwbjFo?=
 =?utf-8?B?OGg3bTdDVGVTejNkSzJvcFpEcWtxZTNYc0RMc0wvT3VDNkRTTzdVUkVranFq?=
 =?utf-8?B?V3JMamN4M1c5NjlpaWV5Z0t2ZUVkMVp6RkFySHFneDczeGFtdVhEUUdKTGJH?=
 =?utf-8?B?aEZvaTdKUVRRRGJIaFpPUksvTFdxeUJjNGdWTEFDWDFQeDRtcHRDYXB1clNw?=
 =?utf-8?B?REozVU91NktUeHhjZkpreGUwRDAzWE82MG5YaDhvY0xuSSt6bGNUeVlLVnRj?=
 =?utf-8?B?N0xNV0hLcWZkTXpGRElOaDJTVDZjb0ZoRmJScklibTlUNUx3dXFwVFl6cWE2?=
 =?utf-8?B?VnltNjlFQjNZZEcwY0luMzlEejgxc3Y1TTY4dWpnSjYrOHJrSFpmeXdCMHp5?=
 =?utf-8?B?WEhDem1janU2eVcveFhUa0hwbDBTL2p6aGRGZTZza1RBWGFUWHEzUm9EWjV5?=
 =?utf-8?B?YmFveTBMajBXNFNxdTJ5ZS9Mek9nRUUwK0t1OHhLOEUza1hPZFFEbTlCTDkw?=
 =?utf-8?B?Z0FKdnRXN2ZRaTc2VDFSek1rYTQ5bUp0b05nSjVlc3ozaFMyT2psQ0ZWMlZi?=
 =?utf-8?B?Q081TFpXTnYxeGtkdTlYaGtCaFY5OURnSlRPVmJzSVlRbU1TbkpLYS9tTG44?=
 =?utf-8?B?NlpkRno1Uld4VkpXNk1IUEt2Z1IxWk9MWGRjNmVmOUcvSVBnUldidmU5ZEVi?=
 =?utf-8?B?aUwwbytrR0xWNEZWNWVwTUlKZWh1ZGFyYzUvWmFtVDVpSGZSTERPS21iMFc2?=
 =?utf-8?B?cyt0VlVINzNQbTIvVzhkTEpObTBraFY3STNXUGJyTWE0Z2JpMWl5eVowbGRq?=
 =?utf-8?B?WTc3T0pnMGRQcm9GTUQrTzEzZ1VDbkZhdUlESEhTLzdhTHBraXZ4SlBYcVlB?=
 =?utf-8?B?QWJCcHZPSkptRHdwNXZkZjZiSDh0NktmL05ESitzZHF2ZG1aT0hYcEJRL0wv?=
 =?utf-8?B?MDlpQ3NRNWR5dk1IbEpLYmh0UUxjam1UbThpZnRvbWhMbDIvTWw5b1EwbHRF?=
 =?utf-8?B?aW5paWRoa3JGekxBWGZvN3ltNDFINSsySHV1cmRmOHhMWEJxSW5jVktMRlRn?=
 =?utf-8?B?UnBZQVBjVURjbGlxRVE1L3FwY2d2UDFZUnNodUwydmpYOEtraStCZSt3YlYw?=
 =?utf-8?B?MU9DdFM2MjZ3Qms1WWl6TVQwVjRoLy9YMXBkNldiRmJrV3QzdForOGZ3T1BV?=
 =?utf-8?B?YnFXZHpESWlLWnZGR09OaUVqd09YaVg1Sk5xK0ZweSs2a0s3WW1Ya3IzdTVm?=
 =?utf-8?B?SE5GYmxCTjBHY2Uyclh5WHZPdUxTeC9YV3o2MktaZ2NkRUZWalhRaDZ5Q01F?=
 =?utf-8?B?RklCN3M3ZGllaDBsV2JVMW42UmJrL3F2cmk4VUdkTnFpQnFtQjRKcDdOL2xX?=
 =?utf-8?B?Q3hHN29lR3YvaFNKUGcvNFJPVjQwNUZlOVNDNGx6V28yTXFzQ0ViekFQbjBT?=
 =?utf-8?B?ZEF6S1ZBcGlEWUROTWVVNUUrbXB6MzhOYlFjSFEwUWFrR0J5bThxNFZ6UGor?=
 =?utf-8?B?USs0TFJsdlNEeEgyODZWV05kUTRwZ0hjZGpIdHlPdDZtYzlXN3N2ajB5bkw4?=
 =?utf-8?B?T29QY2I3N2hQR0ZCWHNkdlV6ODNXYTd1RlJZUll4anl5THVrTWZIejlIRDN4?=
 =?utf-8?B?akJNQlF3VGpmK1BHUkRpN01vQ0YxR2IvQ3orU2N4Uk02TkV4Z2dINDhEVElH?=
 =?utf-8?Q?egBZ0uyMDWq6KvFulc2sswdUF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13133f20-94a4-4254-f895-08dc44e2a8f9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 11:25:47.0407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaZqdPey+0gV4zNA83TPsIuNY7Ost/S8mHRhpien2UXd5B/7mOyWgXDpDukS7x8sIC3oEQnKBkNo6aedK9K3Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091
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


On 14/03/2024 15:49, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The host1x devices are virtual compound devices and do not perform DMA
> accesses themselves, so they do not need to be set up for DMA.
> 
> Ideally we would also not need to set up DMA masks for the virtual
> devices, but we currently still need those for legacy support on old
> hardware.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/gpu/host1x/bus.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index 783975d1384f..7c52757a89db 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -351,11 +351,6 @@ static int host1x_device_uevent(const struct device *dev,
>   	return 0;
>   }
>   
> -static int host1x_dma_configure(struct device *dev)
> -{
> -	return of_dma_configure(dev, dev->of_node, true);
> -}
> -
>   static const struct dev_pm_ops host1x_device_pm_ops = {
>   	.suspend = pm_generic_suspend,
>   	.resume = pm_generic_resume,
> @@ -369,7 +364,6 @@ const struct bus_type host1x_bus_type = {
>   	.name = "host1x",
>   	.match = host1x_device_match,
>   	.uevent = host1x_device_uevent,
> -	.dma_configure = host1x_dma_configure,
>   	.pm = &host1x_device_pm_ops,
>   };
>   
> @@ -458,8 +452,6 @@ static int host1x_device_add(struct host1x *host1x,
>   	device->dev.bus = &host1x_bus_type;
>   	device->dev.parent = host1x->dev;
>   
> -	of_dma_configure(&device->dev, host1x->dev->of_node, true);
> -
>   	device->dev.dma_parms = &device->dma_parms;
>   	dma_set_max_seg_size(&device->dev, UINT_MAX);
>   


Tested-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
