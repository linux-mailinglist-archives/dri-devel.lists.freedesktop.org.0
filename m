Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94453931621
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 15:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D043110E3C5;
	Mon, 15 Jul 2024 13:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VM9r4AcB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0EB10E3C3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 13:53:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtePl1PIuQ+msio+4nEOld3ko8g97VI5bEwuBtUKMy6bYkD1n8kSeVqGz4O9pIbtLupvTbju9sxkZJgU9UX1GI+FcvNYlXSQoIDIYZwmgrkID/4yZUbkaxjPsKJfWcjewohXkNAh+zlkSN9U4YlZZwMWevqjUNMXe9DvvOWCqsDzM9LczXOqIZ/ovGs+HeKYyqQ2m8pNf6aqcRd/6/exiwnEXBzj/6l7KSQHl3lXO89SgBSgkXhBrM1QxAJJNb1G+mt3U3KUpG4o89fY27SSQCldn1zh0+Z9rVcnxXBJNJuhl3xKlTROSjnf7VxP2S8eIwILWqZ3x/Q8R6v6LXM2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0MJ0rwMboiI1Oos/4IkvoF1DRUwG6i4z8V423F1l/c=;
 b=fM2j6UwqAt+mgVCquYzwTc84aujSdmV1C7zaSb9+mcqIX/INQVUzNnGStkGttVnLBEoEq11mXOuJLVM3nb/m4lgDfuzrr/4NLh6EQfV0hJvEIxC+BRFPlSDKXn2kFUBmaWAkekMkJowjob7YoDWUdwdg8u/XFRE1VKMzfJQLMilJY+5gKo9RkZ6c44A33r7I6HM6zCILW0Y3hUJ1dPbCjkz8fFmjGQlcSCWb6d94+S/wWngysMHMRNAcsNugwOAWaDA+NRnOwQF106w7PB5JIVThaB+nIVZyg8H03vfvOCL3XvRBmeCnj4PupTHONj4eT7gbFqNPx5DKiqZWNXd6zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0MJ0rwMboiI1Oos/4IkvoF1DRUwG6i4z8V423F1l/c=;
 b=VM9r4AcB8t8ghWrC+yWfLz8yhw3u9kSZeDv3u871KGuNgVt2HqEek5RVJcWsgjIKIjnfAgUThMUdP0fTTv5SMjSxNHLliN5bn35tjl5ykJQFxZlkxS/8+CKr79hYvRazXBIn9/aRkwJVb1jzZ0CLoN0HXsm4yvsur3MN5vkymLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 13:53:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 13:53:37 +0000
Message-ID: <340d00f1-45bb-47c9-ac22-086391efe229@amd.com>
Date: Mon, 15 Jul 2024 15:53:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gpuvm: fix missing dependency to DRM_EXEC
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240715135158.133287-1-dakr@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240715135158.133287-1-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0264.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a790cf8-5f79-4f26-37d9-08dca4d5867c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUNMR1N1OGJNOVgyN3IwZG1hTG5SWjF1U29Nd28wNGhMZlJLRHFScktKdE96?=
 =?utf-8?B?U1VtTlorUkEwcnR3QzFZZGM5bGNITjFkY0xOTVpIM0F2Z3diVG1sNzB2VFdy?=
 =?utf-8?B?ZDFabFdYL3laVjdpemdST2NJS3RkbEpFbEJMZjVHbmRlbS96TnFKRWdsR3Ix?=
 =?utf-8?B?Tk4xaGw4MVBPWVRZZzRLOWZXMmZ0dGlBbXh0eXVINmRUcTNaNHU3UXdxNTVv?=
 =?utf-8?B?UTFkRk1vclU2MzlPV3VuOFNrcXpSVHgvTEdCMWJQVWIyMnhlUm11ZGFaR1Ba?=
 =?utf-8?B?OG1uRjFUUzQyWGM2elZQUXNmSUNYMFhQdnRUYzB4U0lDTHhOZ0t4d3dWN3dX?=
 =?utf-8?B?WWcrTm5meGZ3bTJQU1pQUUN6MWJTOVVDS0NiMkpxYWJqRWpEbG10d3g5aWpk?=
 =?utf-8?B?MWc3MlMzWS91eTBTdmJrek9TUkpraWNCd2VIUVNpZkxOdFJRbFJMWTVVT0Er?=
 =?utf-8?B?eHZ6OHdmSkltZkRvNFhNaUJIV1NZNUhNNGd6WFQ0WVpHUmdVUVhBZkp4T20v?=
 =?utf-8?B?U1hKL056MHJCeWlGWXRLdWV2c1ZtNVUxWDh5VWQzSklXTkpBS2RKTStnMVdl?=
 =?utf-8?B?VFUxYm0zQ2I3YmJuK3pjampmbDBmQkt4NUsvVG0wbFFvZ0FDUFo5d0kzUlNY?=
 =?utf-8?B?RS9HbkpYaW9DU1BSQittR0dWNHgzNDhYQWVENm1tUXQzWjJXeHQ5aFphY21m?=
 =?utf-8?B?ZDFDOE0xTnliOHVlYUZzSk9qbjJuYldKVzRjVVY3RUt4N1NVVVNZR2kyM2hX?=
 =?utf-8?B?aVc3VzUyaEJWeDViUWlVS28zeEt6K1MvQUxRZkVqKzFGQUpIeVh2cWMyUStq?=
 =?utf-8?B?MlRWdXNBZzQ3OTBxOXFrd1B4T3JiWlhQZGo5Vmc3UStTY1luZ0ZzdVJzaC9u?=
 =?utf-8?B?MjQrcTFFY1hRaUxYeUNONm5ORllzdisxS1d6dkh6NFBhUy90OGc1S3FHVVl1?=
 =?utf-8?B?cUhwUFg3TTRYc1FkNW9BK3hMdVBTbUZVTDZWWGs0cXRvREN4YzlQTVlrdjIv?=
 =?utf-8?B?d2hQbS9hUXMzemJsamlOVFdBMnlneWdFZ2FlSnFYUHFyVmhNU1dyOGZkUWRz?=
 =?utf-8?B?THdUbXo3eHRZRzFvUGFRS3dJRUpJNzZ1Y2NiOStEZnVHK045SjdVbXlsL0dq?=
 =?utf-8?B?RGNwa0h6OXF4UFlxam5vd1k1b1hZVWxPbkZKdUREUGpLanR3dHdyMStjeGVx?=
 =?utf-8?B?bzNFZXJKdDRXSjBOY1ZEckpyNHl0Q0Q3WkR5a1NpK1dHTStFMC9jZVVlVVRR?=
 =?utf-8?B?VVdaQm8yZUw1Y3VUdWNvbFVaMVorc0tnZGxyREt2SDBiM0RxS290dTUyeGh1?=
 =?utf-8?B?dzdoU21CZWpEc1VydTBPZ3IrQWpUa04xajg0Vmd3SVlmM01uang5U1BzU081?=
 =?utf-8?B?WUlTTS9USXgrNnYwdzd3NlE0NjRoWU1lbkEzRlMrM3BRRzY4VlBEaVRETUtX?=
 =?utf-8?B?TFNGTmpmYllQQWl2TGlGQTE3bGVGSklKMGVXVWI5NlFOckNObWg2UUZzYnI5?=
 =?utf-8?B?ODRmSHVPWmZ4bFJwN1dMOFFOODFxTCt2aElrOS9acGN2bE83d1Z5V0lZem9n?=
 =?utf-8?B?d1VzZkUzSFY0S3BFcndCYVpBRFJUQyt6clgvcXBxNGZwRUtLYjhJa0U3aGxC?=
 =?utf-8?B?b0J0aDJORVV3dWJCM2gxdEcrUHQzS1RRTG5rOS9SWFhsR1phR3RCYTZCZ3dF?=
 =?utf-8?B?Y2RoMjhjVjNKeWcyUEtQdDFWMDRqZFJaMm1yQUthT2N4dSt4U04vVE1wVU8z?=
 =?utf-8?B?NkxGZnJLc2gwZURicUN4Zzh5UGI3b3JrbGUwTzVoWU9pdjd6WGVVd2RTc1lp?=
 =?utf-8?B?UnRLZUJ6Y2h5czJHaS93Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2hUOFBZcXZXTHN0bzVzTWhXQUtlT2p2Q1VVMnJFRU14MU55b0RFZHJxOHZG?=
 =?utf-8?B?by9tV2pndjJmT2xUc3RXM1l3dWFPbXUyQVdpY1VxWHhWdkxJOTE2WHZVVGNj?=
 =?utf-8?B?UXA3bDUxbmF3WCtMV1VzZGl6WlFZZ3IzL1BOTE1WYzR0NnhlUVhHT0o1V2hZ?=
 =?utf-8?B?SFl5eVcvV3BwTzROc0RJbzdyNVRWT2VtelNpT1RMWHhKNEFkR3ZJYk5kVDFZ?=
 =?utf-8?B?VkpWS0hVMzczU0hvekUyMVBNNitzYUVFMVV3U2tQU0dGMmlSMSsyTkVYa3Qz?=
 =?utf-8?B?eHdwNWJMUmFpZXlqaVcwbUs4am9XdzEvVkFvNGJ3WDZZWloxT1V4U0VHOHNG?=
 =?utf-8?B?WTlzR2M3Vlp6TklzalU0NGwzVUdwUjdtWmtsLys1WmJibUFsWWswY2Vpa0ty?=
 =?utf-8?B?UUpFREs0SWVVTmtRakJzOHBIWS83bGRHdnFKNjVaS2JBay94RXdKczNCemdu?=
 =?utf-8?B?VWh0aFkvbTRQODVEYThwZStwd2kzL05xVXllR0xSOHVkMHcyaHdNanQ2WUZY?=
 =?utf-8?B?MElFTFZkcVBzeFI4U2N4SEp0VW11SlcvdFhEVEk5My8rNVhEOURPTE9yNklR?=
 =?utf-8?B?am1paUpKQnhIcG9oL2Mzd2MyNGVEaGoyQmdoSDgvQWRlMkliQUdmeW1GUlBT?=
 =?utf-8?B?TVA5MkhTbm1MOEJEV2ZjTEsxdnRvTFU4dEQybmhvL1dKU1NwVU9TUmUvRW1C?=
 =?utf-8?B?NW5VVGdqTDZCV2dicDRmdStWTk0wSVFKOVpkb1lPY1lXWGhDZGxaUlBZeUdI?=
 =?utf-8?B?Q3lBNWRMaG01bFdNL3dhM01xM3Mza3ZnS2hNN3BzNnl4UytaSWpwZ01uRGpH?=
 =?utf-8?B?ZWtHTko1bENyaTI4YXFWOXA1dTlzTTVCT29uVXJMemczeEtseUE3VHowVVBh?=
 =?utf-8?B?R205WFQ1b2FTUzJ2cUlSK1daUS9hRGlkVWJHU3F0b3dpRDdOTTQ5WXlyWkJD?=
 =?utf-8?B?SlBZWWhoWjNnWXhoYzhBeDgwb0U3Ujg3elUzNHNRQjdsQkpjU3FvcCt5UzdP?=
 =?utf-8?B?ajN4WDB3eWpLdmpnMzVIOUJkbEQ4ckVJcTdIQ1h2TmRrSW9rRzIxL1ZnQW5o?=
 =?utf-8?B?bGwyZ2FTOTdta2RYTkcvSEkrM1h5TVNSczFoNHZ0eFFkbjlWRjJhWllGb0RY?=
 =?utf-8?B?REdEbnRsMVJZZXlNVGNzN25LSVhzdzFMaUtKMlVnWERzb1hnM0pEQ2kyeVlj?=
 =?utf-8?B?aUd1K29MRDl6c0RJUllraUJJeFVVeUlmYy92WUd2cXhVczBwZEhtSEdZalJj?=
 =?utf-8?B?cEdHenowbUxneXA1SkF5aThFQmV0c0xmckRpSFZFeENneWpybkNjakRKU080?=
 =?utf-8?B?TFVvbXdxc3I1U0phQWVTL1dEQ1ZsTTFLZ0hMbTJDcE84RkZUbTlXNWQ3RUxm?=
 =?utf-8?B?ZGZESy96Zk9VWGJ3b1pyeW1uR0RVakxoK3RKdU8xZ294QmxoZ3VIOE9hOW82?=
 =?utf-8?B?VFFhTjhWOFZiRTJjWWU1TVpWMHp1QkM1cFQydFc1cnlIeWNkNkZjakZjUEJh?=
 =?utf-8?B?dllUWmFUKzZHZGp4ZG9rcTNxZmY0TXpsN1hIZ3FBUElWUGFPSFJFVWNQZDdm?=
 =?utf-8?B?YVF5NkNBbEVnSXR0bUVucnllTEpTL2ZTWUtCdlpWeFp5MVZTZ3FpbGRid0E1?=
 =?utf-8?B?cW5vSk5QZ1NsYkd0QS9zcDZxL012RDdaQWtsdWRXKzVFSmZhUENTQmhKODht?=
 =?utf-8?B?L1B3elpwUkNwR2dGQmN5bCtEL0E2YnRnN2YwdkJPZ1ViaFJMNmJ6RVlxaEVq?=
 =?utf-8?B?R0VLcnNrMkpXZFpoLzBaQUJBUVFvK2oyNXlJWmdZVHFhZ1VLWTRPUURxZVV3?=
 =?utf-8?B?clZlTHE3aFo5UlJpeTJINEVuQjJVRHI4cEQwTU5CdGRxd2cvTThJcXY0VzU5?=
 =?utf-8?B?TVNrdURBWWVpNjFtblFFNng3dXlaZXlia25qeHlkVURsbEZvRWRZZ2VJR2N5?=
 =?utf-8?B?VDUzUVhTaUxBREFlcThWRlZyTmt4SElUUnI3YnBzZlczVGNxZE52bE1reEtM?=
 =?utf-8?B?Rm51NmlibXpScnBBc3FtTk9PL0NFV3BwS1BhMmNERC9NL3Y4UmJpcVQxY0Qz?=
 =?utf-8?B?R2JLd3E3SE1Lc0twNUNsaVVMUm9zREJpVkRuMXl3aUQ1bmc4S1J5UmJ2S2xE?=
 =?utf-8?Q?P0xfRFLbgaRoq8qRJ8atvV2hN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a790cf8-5f79-4f26-37d9-08dca4d5867c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 13:53:37.3815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dv5PCAywbcEisdg/N7Z24CHRuF8iUz6MD+oRAuBSSpB/Dg8VWpmCZuFD+kp2ozpj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6526
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

Am 15.07.24 um 15:51 schrieb Danilo Krummrich:
> In commit 50c1a36f594b ("drm/gpuvm: track/lock/validate external/evicted
> objects") we started using drm_exec, but did not select DRM_EXEC in the
> Kconfig for DRM_GPUVM, fix this.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Fixes: 50c1a36f594b ("drm/gpuvm: track/lock/validate external/evicted objects")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index d0aa277fc3bf..d08d79bbb0f6 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -254,6 +254,7 @@ config DRM_EXEC
>   config DRM_GPUVM
>   	tristate
>   	depends on DRM
> +	select DRM_EXEC
>   	help
>   	  GPU-VM representation providing helpers to manage a GPUs virtual
>   	  address space
>
> base-commit: 833cd3e9ad8360785b6c23c82dd3856df00732d9

