Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F83842F36
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 22:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A25C10E669;
	Tue, 30 Jan 2024 21:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A0E10E669
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 21:55:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvsIhMN+U2PZYEZ1EbBrjH8d2HLrvLYQBJzyeJ1QN9d65FfsbewspmXrsZ8mUfhMqjEQUOmdxbQThXBcvd8moanyDQtmBgdSv7q6ATgLLHIPFWbN3PNwMG7wb4mYEqKt2dDgo2gm9xsdGOY3F8+XsDQVn3IuPJrN7qj/D8G+OyehoARSc9qXS3y6NeJPlcYfynyVvxV5+qspvJuxQ70L5lwZM/MqudSotmu0MEAsNWyvyLCF6asc2AACXkGuopXPWIxQ44j+k0WeDqxj74ZmSZqD7MTmWHUG8LlkF2TZqgkuxGG8WWwctUFxH2fSt5qhXmF68x2b3XF5qDgiNdbpVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmZ4RvC1snEj4y6GjgKpNNOEEhBOEctJ6pQB0mT3v+Y=;
 b=FY/hGul3VOmjZxBA/9dOc1/O9HliWHvXVK02eY6/EZKcqrrmd+fhxBRa0iBC9D/wz36momReAxSMwpf+NN+3R+kbk2Dwghx+OWYlUu2GJw9gLT/dUWT4DQnLetMEWbhc1wIbHVD8VQpbCMMosRZslrslpiGRlL37ysekpi8biqpLNLl12qs6jutTekLmDEiM9zvQuYeeZPS8X58jza4vKgaWRxutSFKU6T4K7WNMbPGXa1Ga1ZnMSn3dSz2rIpZ+VnI1UKC/Eg+8gfxGjJKdqeeT0MwBVthkMYfs4mVlx0p/CAa6bwdQkOGipFhHCQg348rBcxg2VFAz0zCsarAMfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmZ4RvC1snEj4y6GjgKpNNOEEhBOEctJ6pQB0mT3v+Y=;
 b=e9QrcMPkGkT3W32K9or1VgqGfVik20c5+d6+ml8hyya+JBv8XdrPHVv+IQnTdWCYIyHbRoWpWPRuRoCP5qMm71dpuV4nQsNiryCoLPTTa/NLXNAiA4QdyBlZm8mkro6w6sjbBpRZkbTN7jt9Kl3QMu61nTEIZGa2MGgfmi7zdKlxXiC1s4fgrwu1whPQTBLyz0aNimPmRXtMqA8GA57soPhcX4Jq5y7xPN84xBsiaFYNbBbylJrV/ojeObMaljyuZucRTiM5zkMb36tzqCNOLPXdIMemJL0LlT+wuQm5cx59a4TRzoFE+n/j/FvZF+K72xJYfE2fr+z3EP2BjFhhDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CY5PR12MB6153.namprd12.prod.outlook.com (2603:10b6:930:27::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.34; Tue, 30 Jan 2024 21:55:24 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::acb6:8bd8:e40b:2bfe]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::acb6:8bd8:e40b:2bfe%3]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 21:55:24 +0000
Message-ID: <583b9145-cbbe-4a03-8120-e2a66a6093c7@nvidia.com>
Date: Tue, 30 Jan 2024 21:55:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tegra: Remove of_dma_configure() from
 host1x_device_add()
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <0-v1-c76c50cd425e+15298-host1x_no_iommu_conf_jgg@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <0-v1-c76c50cd425e+15298-host1x_no_iommu_conf_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0670.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::16) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CY5PR12MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: 9229e9fc-612a-40f2-86bf-08dc21de292f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /cHm7hZfnIPDv1RY5bBLVEjZivP0YQUelU8IKRXE5vxmuPA1jLl9XIVVywOvpkBfd0PIy1QMU/5qVbjci/t/QxJr8yqfqzBmHzzIIZ2EuoeYmOvP/tHunPhCA4MNrj+5fleXGtos1+qmx61YsscxRPhlXXE5sNxs9dQWtdCSdn7Zrr2TmbJwtSk0lmwYXUMXoE6Kc0kbZbdJqvC/itTvTPCs/pbx1KnPlUEij4P5BgQ7aW4yLlmJCx2tvrOQiKZozlScToK4NR7ZHCKXhXTzTCNhjeGF1Ql2xNYA2hFqRqUTRJoqP1dniMRU3GdazJeLE2d4iZCdrFL4OaevPG6jsoFK22g4kZeCr1CwNJQfSEIVK52tjSLsoxBUXjIB7130at7RO0QYFklKmJI45OSKEdr7VTc0AXru8qf9YlDVBOjmPyCFcuE063TBX3ks6VUCXcQjCbEMkvQWCzlqZuJMxULPNpPM3MTlIc4M2GLKaqO2VCajPc6a+bE95rNMwk5cKmn6vM0OAd35P41sg+AU3tKhx7gFlZuLWRVFQQN3UUQORjmbMxyDeLvoIP3Nrz/697No45CO7kM6ITuyt1eqH96/b+oiVxi/Xy4ARQrN2PQImCsOPY+J4xhGu9GRCM7a2M9hN8FHjsAYLd/2osb8VUGnYXi5UWSyspZ5nSRAw7kFzP32OIb3EYUv5bbEKqM6yAJmWzusLjN1j7yHCTxPX0e8s/Xc57gR2q0YK15bIoBonEZBuGXoAdMcoEKsIIS439Rvs8i+E+YTkYb+muyggrA376dGeYlg4EReu4CSXAU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(366004)(346002)(376002)(230173577357003)(230922051799003)(230273577357003)(451199024)(186009)(1800799012)(64100799003)(31696002)(55236004)(36756003)(83380400001)(2616005)(478600001)(8676002)(66946007)(66476007)(6506007)(316002)(66556008)(53546011)(966005)(8936002)(6486002)(4326008)(26005)(2906002)(6666004)(6512007)(110136005)(86362001)(5660300002)(41300700001)(38100700002)(31686004)(45980500001)(43740500002)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjBkVWhiQTZ4YWoyOXkxSEszeFJWNXFKRFI2ZmxVR0tQdGM3OXZ5VDlRbHJa?=
 =?utf-8?B?YkhFNlpObElmNzZuMDlTY0t6Q3ZBOXMzUDRDVGdKOTdmUGVsak9KN3FDbVh6?=
 =?utf-8?B?SVRKZ2h2MGFFZDlDRTVWVHpyZUJmQysvUGhEd254RGdLanZPZkNXNGM0WVJ1?=
 =?utf-8?B?ZzFRTi9jdmpRY1JrWFdJdHEwRDB1RWZXeHdGZU9BeVIwUWVuZzRGRzRYaWRw?=
 =?utf-8?B?ZGZpeVR4dGlTMVhNeFU0bGt0NTJZdnBsZXQvdktmSmhZV0JIUU81QTRwMHJl?=
 =?utf-8?B?ZUV1ZHdndk1tTUhBVzhoUDg1dFNzS1lBdC90c1ZERXF1Y0grMTJVc0ZicUJx?=
 =?utf-8?B?SjNsMU84UDRKMHg1VExjNXFHYkxYZ0RMK3I5cHVYcmZxSERiKzNrcHQxWVZB?=
 =?utf-8?B?ejNpNnFpdXAzWHg2Ly9laEt2UndaOEcxV2RQeUVDUUhVR0FCNGRLenpLd1BG?=
 =?utf-8?B?N0pKNlIrNHV3Q0dkRnlEVFNXWTRFeWZEY244VVFLaVJWWUJadWFKOWZYbVgv?=
 =?utf-8?B?b3RxOStsdHBsalBKczBKcVlDWHdzbVJ6Q0RlRjZRdmRsVmFIMnVyRjN6Q3No?=
 =?utf-8?B?bTExRUNNQVlDbUZObzZJdG1STHhJVGJHZGpxemJFTVZkbzNiWnRLeUJBZG9o?=
 =?utf-8?B?NU1ZM2NpNnZXWm9WRk1NSWxkbC9ITkU4NXF2ZkVWTTFhbitySnZaWTYvSWtR?=
 =?utf-8?B?ckZnTzBibDhEd2dwbElyVi9yTVpJdUhHS3d5WVpNaFUvUzg1WnQvRkNFMmVy?=
 =?utf-8?B?OUdMdy9RUzl1K0tYUjJabW1WUlYrSU5kSitxd3FWWk83a2IzUzB1c1BmYjQy?=
 =?utf-8?B?L2xkZGgzSkZmSWoyTENmaU9PVUdIQUZnNVZnejFNZHlaUm0xZnJTYzRFVzI2?=
 =?utf-8?B?TVIxYU9uUGVLcHFiZGJ2WU0rUThRRjVhRHM3Q0t6S1RTamZCZmJRN2Y3akNC?=
 =?utf-8?B?STZLaE1sU1J0akE2YlB2SEJuTHhqcVc0Vm9OUEd0bTZSTkRRaUgvS1ZCODE0?=
 =?utf-8?B?TWozYnNiM2F5QVd2WVNkQXBtdkl3MmsvZ25pM1o2VFNmU0hHamQzaFdtU2x5?=
 =?utf-8?B?aGtJdG1FQ0R0SDFtSWU4c3VSWEkvYkpJUHpoam4yZzVRQjlrZDR3My83T3FG?=
 =?utf-8?B?MmcrRHJ0VFNHNVJaeHFkY2FPd1ptTURhemcwUXdNTGR2aG9TUmZ1QnpSUkJz?=
 =?utf-8?B?cW5UZ3d3UmFmckRpYTIxSlMrU1Z4T25ERVlsc0N1NkVoaU96elh1VDBaYkNj?=
 =?utf-8?B?NUp3bEhaZXM1eTVVa2Q0dVM3STNleTZNSHZLTTVLNkhMUG9PYXJFS3JLcjd2?=
 =?utf-8?B?K0dwUitrODRFMytrSGdCQVArQ3N1ZmgxNG44Umo1ZWU1MkdSSUxDTUhsbkJk?=
 =?utf-8?B?T3NXZXJvdFJTeVd3ZzM4aDRCcmJUTko0Zzl6SEpmNE00bnI2M0R5Mk10TzNK?=
 =?utf-8?B?di92c2h1akpGd0lBSDN4MWwyVHJzNWFWT0UzbGtDeWpQT0I5QzZPaVNwdlBv?=
 =?utf-8?B?MWJTYmZ4b2FHMFFFUE5TZVFjby95ME1qWVZ2VG1pemt5ay9GRDM5RFR2OXdw?=
 =?utf-8?B?aGxiT2Qxc3V5bkp4YnFqSCtHcEFqVlkwd1Y2WEVzeWZtZG5vVk9JaWgrWnpj?=
 =?utf-8?B?WFpwNGdMVERMbFNiQnlvdWRCaTBSZVFaZXY4SHZRRnpHQnM0MW94UHpLanFv?=
 =?utf-8?B?UWgydGVlNC93R2NkT0EycHJUYUI5Y0o3Z0lDdDBpRU1TU2RtWWZxRW1nWE9U?=
 =?utf-8?B?bUhLdkRtSmZZa2pWbjVqRlVVR1RNT3ZLOS9BM1dyemM1eW1sU2NzU04vSW9r?=
 =?utf-8?B?c3ZiYThsalgyVVZCVnBROTVXb0tCVkdLZE5IYXRVTHQ5UDdUVG1DV1BqTFpT?=
 =?utf-8?B?S1RzcktjMEJsK0JLMjVPN3dEeHUvWjNVYzE2cmV6aVovVFBmaWxsUEsyc29q?=
 =?utf-8?B?aDBsODlPRnpMMWFsbGdKMmg1ejEwTXA5OC9sZmdzc1Rrd3FzMlVRRE9pa01D?=
 =?utf-8?B?eG9sVFBXZ0J6cnJHOXRRdUN4bTY0UlVzOXJnVVEwSmcyTXYrTjRmQ25tNFkr?=
 =?utf-8?B?SFY1Wk1OWlJJbEVrc3NhNUllVm5JZ3RMc2Z1cFRFa3ZLbzVXbmZhellKMytJ?=
 =?utf-8?B?SWd4MFlNZ2hMY1hyeENpbVowUjRMZmlyUFdmb2EvcDhOMHZtd1JzaGFBWEJB?=
 =?utf-8?B?SUE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9229e9fc-612a-40f2-86bf-08dc21de292f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 21:55:23.9973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsKr7iVmdgN7CB7jChlohQ+lWVyTZ2pVnCiS7KNWrJPbTM8Pnnw1UuUsIl7BXOJu3HW0CsLpRCmIMERQS5Mo2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6153
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
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 30/01/2024 16:15, Jason Gunthorpe wrote:
> This was added in commit c95469aa5a18 ("gpu: host1x: Set DMA ops on device
> creation") with the note:
> 
>      Currently host1x-instanciated devices have their dma_ops left to NULL,
>      which makes any DMA operation (like buffer import) on ARM64 fallback
>      to the dummy_dma_ops and fail with an error.
> 
> Since commit 14891af3799e ("iommu: Move the iommu driver sysfs setup into
> iommu_init/deinit_device()") this call now fails because the struct device
> is not fully configured enough to setup the sysfs and we now catch that
> error.
> 
> This failure means the DMA ops are no longer set during this failing call.
> 
> It seems this is no longer a problem because
> commit 07397df29e57 ("dma-mapping: move dma configuration to bus
> infrastructure") added another call to of_dma_configure() inside the
> bus_type->dma_configure() callback.
> 
> So long as a driver is probed the to the device it will have DMA properly
> setup in the ordinary way.
> 
> Remove the unnecessary call which also removes the new long print:
> 
> [    1.200004] host1x drm: iommu configuration for device failed with -ENOENT
> 
> Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Closes: https://lore.kernel.org/all/bbmhcoghrprmbdibnjum6lefix2eoquxrde7wyqeulm4xabmlm@b6jy32saugqh/
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/all/b0334c5e-3a6c-4b58-b525-e72bed8899b3@nvidia.com/
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/gpu/host1x/bus.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index 84d042796d2e66..61214d35cadc34 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -458,8 +458,6 @@ static int host1x_device_add(struct host1x *host1x,
>   	device->dev.bus = &host1x_bus_type;
>   	device->dev.parent = host1x->dev;
>   
> -	of_dma_configure(&device->dev, host1x->dev->of_node, true);
> -
>   	device->dev.dma_parms = &device->dma_parms;
>   	dma_set_max_seg_size(&device->dev, UINT_MAX);


In my case the warning is coming from the of_dma_configure_id() in 
drivers/gpu/host1x/context.c. So with the above change I am still seeing 
the warning.

BTW, the subject prefix should be 'gpu: host1x:' for this change.

Jon

-- 
nvpublic
