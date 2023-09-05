Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71596792063
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 07:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B2010E421;
	Tue,  5 Sep 2023 05:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2042.outbound.protection.outlook.com [40.107.96.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A708110E420;
 Tue,  5 Sep 2023 05:51:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4IaaJn78Ey41OngQ8vEWtjd9ZNIikUjzO306QMuzJsi8NnqR5OPq33TW2P3LZziFEVtFYf1XhA0MDYex/yBMi+VEDL7z4qpjUpSTtmJ3bXfRzz14fEAm+jGdrGF11H+yJ7fU5e/2vqSqz8QHDYhWGO1udpFkFVd5GxRDGau6tVHCcJmNoXOGejohvCdXq2VSF1cN+2ylZIpWmwVtE0IYdgt46pBD8aH6LJM72H4UEvdC4JasiO80eiA4aK6EzT53J52VNATlMf8x19FnQOuNVpetWGe2s0QyjiJMK5BHpqMq89zlenBqsTmQpLnrqop6WP5+U9rfMsm3U6IRE+z/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2E/r4GRYbjeDQn5r7HPULRbP1bylNdKcwYhFyykSno=;
 b=TKrY8kH7Uq+yNv80PA0vdF+zGpd15kyvb9gAEBvKTEQcPJb3KvkJ2J+sQE2RXC3BqVSkFxN6hDdDDdLb2JCt7EIYA8IEpBXGqYmd7gnWcwHX2UU6sYQvV3rv07BXxDsIWLHl3JXUOlOvZhjEjYhbpPAibyNfTIN/mNOadoXo36miZDh7ybnVZFDGghJynU9JchOUUZ9UJlIY39tuqiC+8SYDbw+q/tNf+jciqdrFvHPD6YKvO/MojMs2RWKfhogx7C+4BfpcBVNuqOHF5LA3buKmBlYUEwqSSYdf0jUy4mcOElBiVQnWBOnmU9ees/vX5BpF2EX7LtRNpGQ1bPqPXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2E/r4GRYbjeDQn5r7HPULRbP1bylNdKcwYhFyykSno=;
 b=jtRRmF4XmMedg4LDzTy9iaavQee+AM6ctxv53noQ1uVyUJZVlitM/xODaOitjmoMcRkFgKyffdUBpe+uEDUEwHkZ/kdefA1dEEnM5l2r0QZa4qgoJhurfrAHdKo11qvFFmG8lK5590mzlPDogA3grlkHbt042Elz/aX8HP4wA/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 05:51:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 05:51:04 +0000
Message-ID: <d3e6a9ce-1c7a-8e44-3127-413cd471a8e9@amd.com>
Date: Tue, 5 Sep 2023 07:50:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC,drm-misc-next v4 3/9] drm/radeon: Implement .be_primary()
 callback
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <20230904195724.633404-4-sui.jingfeng@linux.dev>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230904195724.633404-4-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a4ad45-09d8-44fc-8fa3-08dbadd417bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0soq8oHzqPbabgYld4nqX55qRTp8MnCXE/QmSsRe3d17vL1iVzmATl4FE5KHjd4svxYT29LUpFo9YZ72KHVdMO7/lwh5SSZxs8CyEGYTCfKIPYXayfLWOPt6pKrcyEiUPAyMeiU9xwPT/n4e7JnURbhRs45YuBWFsPkAKQKJJwAGnAQs4Kl0oLcjMetF59TkIYBzu2gbtqGUT9RjwhR06kycgB4pAaFCa5QU/r3dweSPaJ51TTu3Rp4GmzRD+Wpl9u9UImNItEogcEmxIjFCmaPSUo0XKu91pLR4M+WupO/03zw0FVqNqY6r6IjNnl9yyUuGCQvkVuDiX3hJLrFiUO7StgZgaQLgmpl5R4ayD3ik0UwwFdmIZU6bNQFVL7dG6Jy9LA6bJgkP5m9Bki9+lH9K1Nb0DD6nNoVHm7Rvb947xYOIP0zVKE2QVXwTIhVeeau7/fxWbIUOKQP/N/WsA56ocST7CZ8T8COl/hHuVhL6j8c1lRtnAaInAfncaweH2e4Co/62f/Lm7R/nWh6XD44aKRW9KEn6NCVZHBICPV7nTtBt6nOJvbH5o/AFbN5b9S4gNgY/y5UW8HwNJ2+0/7YpIY/JtKbMXEEZMmHBrexpwxoLET4LXEYKMIBC81Vnvsu1t779jSvBRjj9jJnrk0YNArVGBchdBVMkCtCsYQU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(366004)(376002)(186009)(451199024)(1800799009)(6666004)(110136005)(54906003)(66556008)(66946007)(66476007)(6486002)(6506007)(316002)(6512007)(41300700001)(478600001)(31686004)(8676002)(4326008)(2616005)(26005)(5660300002)(36756003)(38100700002)(2906002)(8936002)(86362001)(31696002)(83380400001)(142923001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGYxbDFyZEFPazZTaWt1Uysyc1pXaWxkSVJxMU43UEtVNWw5S2xJRFloTmxt?=
 =?utf-8?B?VGNQRnlwNGR1RXVhYzFCRzF2WWNCNks4TUt0SHhWRE5sNWNDUWFVOHk3cHZ1?=
 =?utf-8?B?WW1DOG9zTUhEaTFxVTMzd0IyeGQyNHk1L2xLL012dVVGdGozdWdqeEpRUGpC?=
 =?utf-8?B?WG94NXJsa3hNMnBmeUo4Z2FMSEpyODlKZHJJdVl6a2h5R0VBYXpsSGNzRGoy?=
 =?utf-8?B?cmlCSWk2TjFsNE13STdoZUNyRitGRWxMZHZaTGRkUXV5SkpxY1BqYk5jNlJJ?=
 =?utf-8?B?WnFoWkZTdks3VmJpcW5XcUR0K2xoZmhxbzVkQ1NaWDZWMFk3WnpSTUoxMHdG?=
 =?utf-8?B?ZGFTUy9aNFJseFA1SE5XK0lHNGdlUkhrNEVEQTdOMVhuQVUwc2cySng3MVB5?=
 =?utf-8?B?N3BUNkZtNThtK3hqS2VReFlaSlVxZys4M1UrU1lwYlJmWjUrMUc3b2t6Ylpr?=
 =?utf-8?B?Ni9LMWhhTldTd1cweCtzSnhtSmUvVXp0T1krL0hoc3FOQ0pPTkpnS0h6YW9I?=
 =?utf-8?B?M25Ndkk5M05NL082a2VDRUplYmdIWENyTFF3d3V0Wno3RWRDT0JYQkJxSlBK?=
 =?utf-8?B?TTVnQkNyNWg5V09zT09WakZZVTYyUVhVT25TOUhycVlWdzZIWTRnRFpiZFNz?=
 =?utf-8?B?bEdPYW90YmlBV1ZoQlNkajdaZC9Fb0ViamxCeG90dUdnVVdKZVdrVjIwcHl6?=
 =?utf-8?B?ZGVDYVg1bjMxck1LUWRRc2YzOENxZDlwRHNVL25VTjFoWEc0aDBDd0IwcnFN?=
 =?utf-8?B?ZEc3Z2x1dmJ1WTBKUnJ0RXhjbkVqbHhiSEljenZ5ZDQxZHE2MVdRMm9qeFVK?=
 =?utf-8?B?bUtLMmN6M1EyelNMbTZqR0x5Y3ZSc3IzWmR3c01sY3k1Zk11MzZBdHNQakZq?=
 =?utf-8?B?d1g1NDRCWjZtbmp5VXBEdzVrbGNGU0EvYVhONm1JZzJyQnpWZS8rR0lpTHNH?=
 =?utf-8?B?MGhCMlgxamtxSUhDc0VZc2tybVV2cWpSQk8vM0JxN0gxZkxyR05aRFBLSUdC?=
 =?utf-8?B?RjEzTWVGcnJ5TzRGeEVibFlmbVIzM01GS1FYdTdqV2pIQWtsclpOU21SSlE2?=
 =?utf-8?B?SVZnNTA0eTlIQlBFai9kMGFXZXpwLzBOU1g2ZUZBbzdUYkRoZG9wbk9vYzdZ?=
 =?utf-8?B?UmNoMlJkeGNIWG1JY2l3SU9sV3AzaGR6OUZoSTR6UkVjaHNCU3pnSzVKN3VO?=
 =?utf-8?B?Z1o3Q1JYclVrMVdMYTBiOEFzcHRWMXlNeng5akEwR1FjS0QrSWlYWGx6VlFP?=
 =?utf-8?B?VDhrbytDTXg0WUhnOTZCRVFWMFZoSGhXdUs1eUhGTWt2OS9NaExRYjE4RE9k?=
 =?utf-8?B?Q2pjejhmLy84TVJXQ2NuRXpoTlUzL0pkNW5zUDZ2a0RHczNVSGJ2anJZWDg0?=
 =?utf-8?B?bzh4Tnl6TnMvRnRFZW8yM3Q0ZFNJbWZVc1BkRkIrOEszWHhZMm5OQkI4WUQr?=
 =?utf-8?B?N0c1VFpEREh1VFVJODkxUUd2dWw2MXhoL1ZWd2U4TmtEeGZvVnhUUzlzSVY1?=
 =?utf-8?B?T0x1enc4UEM0SUlvSWVSalFkQ1BoTEtZZi84U1J4ZFNuWUJUeW1KL2JScTRV?=
 =?utf-8?B?cHIxcXoyeXloWFQyTitxUlowZEVYU3EyN2djbTdXRGtxZkd1eUtTekVTd3Aw?=
 =?utf-8?B?SXp6bUxmVzZNWlRyWVRiYitPeGJUU0gxVmN4YXY0UllFdUZFcXZKVnh3TGl6?=
 =?utf-8?B?QWIrMDBjYVNueVJPSWIwWERKVUNJMkhzV2IxNWUvZEdqcVhzVGw5TnJJVk5m?=
 =?utf-8?B?dE8ydnN0YVkwS3lhNDg4a1l1elRaRHJPaWN1dURxNkYvTzlnUERUSFBpNi90?=
 =?utf-8?B?VmVvdTZDRjRtUkVzY3JzbWhPcFFlaWhBN2hrNU1FckFuUCtyZDV4d2ZmM25r?=
 =?utf-8?B?OWY1R3VIS0VkaHBSek13RkxabERBUHFKczI4MXprTlY4ZzdOME5tOVo4ZTZv?=
 =?utf-8?B?QVZyZnA3cFk5cXErbjJWVXoyMTdPc0NzM3hBNU1YTGpZYjBNTmNqWi9Dd04x?=
 =?utf-8?B?RlltanJoa2JKalhXdTlxOXBtOXZCK2VCWVJ3Wmd1OGlISVRVMXp3aVFTNVRr?=
 =?utf-8?B?eHRUemxMazc4ZGlRNVBKOFQ0aEZQcDk1bFFTZXpDemJhdERja0dIcUFwNDBP?=
 =?utf-8?Q?5lU0k0p+X6uXQLMkRxHAufkys?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a4ad45-09d8-44fc-8fa3-08dbadd417bf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 05:51:04.8794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ha3nvYScTZ61pZVv0zNgnmZjQnm/HU6Gr017yrZjGg/nuHA2vz2hnZiRL0xBVO+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.09.23 um 21:57 schrieb Sui Jingfeng:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> On a machine with multiple GPUs, a Linux user has no control over which one
> is primary at boot time.

Question is why is that useful? Should we give users the ability to 
control that?

I don't see an use case for this.

Regards,
Christian.

>   This patch tries to solve the mentioned problem by
> implementing the .be_primary() callback. Pass radeon.modeset=10 on the
> kernel cmd line if you really want the device bound by radeon to be the
> primary video adapter, no matter what VGAARB say.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>   drivers/gpu/drm/radeon/radeon_device.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index 71f2ff39d6a1..b661cd3a8dc2 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1263,6 +1263,14 @@ static const struct vga_switcheroo_client_ops radeon_switcheroo_ops = {
>   	.can_switch = radeon_switcheroo_can_switch,
>   };
>   
> +static bool radeon_want_to_be_primary(struct pci_dev *pdev)
> +{
> +	if (radeon_modeset == 10)
> +		return true;
> +
> +	return false;
> +}
> +
>   /**
>    * radeon_device_init - initialize the driver
>    *
> @@ -1425,7 +1433,7 @@ int radeon_device_init(struct radeon_device *rdev,
>   	/* if we have > 1 VGA cards, then disable the radeon VGA resources */
>   	/* this will fail for cards that aren't VGA class devices, just
>   	 * ignore it */
> -	vga_client_register(rdev->pdev, radeon_vga_set_decode, NULL);
> +	vga_client_register(rdev->pdev, radeon_vga_set_decode, radeon_want_to_be_primary);
>   
>   	if (rdev->flags & RADEON_IS_PX)
>   		runtime = true;

