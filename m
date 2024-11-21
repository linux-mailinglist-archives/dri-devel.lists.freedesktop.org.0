Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CCE9D5246
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 19:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8ED10E2DC;
	Thu, 21 Nov 2024 18:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="miir7Kau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2041.outbound.protection.outlook.com [40.107.102.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AE110E2DC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 18:04:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGkomdM8GAvBvgto1cimqt4fZinhtVk/bvcOvWjhEvXHNO32Ls9ghTfdAk8DqKmZDam5VcZOZ0UkMcjaAzKF4KHUmiJdrJps5m8F+Xfz7Zx8cKQ/qWQhtWv5Q5dr2EbaG4PGDPi7E3XGiT8V4C5hyDoOJs0Bm8kKssDhoXH4dKHzm1UMKCcyhjVW1E5LajEmTgIJRbQwI+0F/xBTIKgNuWwkvgLf+KGYhgO5s+jYlYw1FYsvTCQmk+UBSJXjtN7BgCrXgKox/GiTfI0mhw13JDaW98ahe4zugXmgSsaEBo3NfClIbrE1FTaFUzcPzlKEU7udE8rK80mlTLOIg8eKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88RAwZpZe/W9EU12OQq62gzPS88u+uLalnvhzv5Sf/k=;
 b=uo76B7kKiS1lXut11oOeBRkwo5OFN6bC1nE1Inv9W8EJOu7i9eMnw/h9+hTxuLOw9+y1HwcqfDFuqZBZZFr6Ll2txPXIwvH2XaEviewHOPErIVyANhe19i8ym3DH3hm4PB1saSZs0pCOb9NKyeOo26GqB+ozeItZwOvxQ5RqJ3MUl0Trb80ib/TgnPZqoyNCznpWAGE3Ao6sRYVoHW4LNdaaFBgeYehJblEdCoR2K6rVmZGSDt3fXhdw4264AE005Yk0diB17O3QpLK9odRML0gSEtF9t0VbRLJ2IcV7lJ6+WzAY1cOBWsbKcDMud8fQCWGR6olGXOOJ/bYlMBvmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88RAwZpZe/W9EU12OQq62gzPS88u+uLalnvhzv5Sf/k=;
 b=miir7KauFOPTrNXa31e/QmUCn7GYs4/lzcXqoJPDB2Jgcm6vV0AhvrFyMvvI58+IQKsaJbY6YxYguQ06lG0Tg7zWCPn9It/MgQjWFZGAkeLLqxtx0JE126/Eu1cCadV093FNDG5x4vhxV1xYaMDaYJvZqpmeggTIDgyzLhV/lKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB4205.namprd12.prod.outlook.com (2603:10b6:208:198::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16; Thu, 21 Nov
 2024 18:04:42 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8158.019; Thu, 21 Nov 2024
 18:04:42 +0000
Message-ID: <bdad36d9-aa0f-49dc-9780-ab72c7879a0f@amd.com>
Date: Thu, 21 Nov 2024 12:04:40 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 11/13] acpi/x86: s2idle: add quirk table for modern standby
 delays
To: Antheas Kapenekakis <lkml@antheas.dev>, linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Kyle Gospodnetich <me@kylegospodneti.ch>
References: <20241121172239.119590-1-lkml@antheas.dev>
 <20241121172239.119590-12-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241121172239.119590-12-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0108.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::29) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN2PR12MB4205:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e91e3ec-11c5-425d-5a7c-08dd0a56f910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3hNcUVkdmlFV3hmcEJDV0MzVUVIVkUvbTVJWFVibG85d3RmU3VNcGtNZkJZ?=
 =?utf-8?B?aXJFTVpmakNIQXhXTXA1Vjlna2wvdmdkcDcvUFdEZjdXVWxMOUsxa1JXQmRM?=
 =?utf-8?B?RlY0NUJqMTRsRFd2MEloS0dINERUK21nSHJPaHlKZFBnT0lTTW9JdDNvZFJx?=
 =?utf-8?B?ZEhlZ1NjeE5jUHNMbXBjMVBmeHMxQ2wwUkR6dHBKUFp2YSs5QUdyZDB0SjdU?=
 =?utf-8?B?RW9JUGJSS1hZUTl4VkpabFNvYVoxbGU0VzNJTnNzZXlxTnpad3RDbUFOc2h1?=
 =?utf-8?B?NXVhV3l3VzJMSHlIcXI5dWVLK3dqbnIzNGM5OXM1SHVaTzE5M0FLLzVhZjQz?=
 =?utf-8?B?OHRuYSt0RC9PYUpUaDltVWRuc0ZNbzFpd1FXNzhuQzd0RTZ2aHA0QTUrOTBo?=
 =?utf-8?B?MTRGUnRkR2hvdWNvaUk5STg1b2lVekJnYzEyRW5zK2NHRTZ5NkhXdlBTSTBF?=
 =?utf-8?B?T2RGcldmMUdyWC96OFM1M2ZDVjhQU1lVY2MvSDlxa21QbE11UnlhU1FocGVR?=
 =?utf-8?B?NnhPZkhwMlFPZURtOExRSk1xYmcrR3BxaFRwK3pKM3ZPSlBKL2orOFdOdzVI?=
 =?utf-8?B?N0FaQzVtT0NPNEJGVklGcDVWRkJQMVFwVXZoT08zU3kvYlZVTGUyMmNqc2M2?=
 =?utf-8?B?ellrY1h1UmFDMXlwRXprb2dFZFN3ZTEzdjFablBRM3dSWGpjaTBkU3ljQ29Q?=
 =?utf-8?B?NW9rZlV0Y0V0TTBmaWpDN0lvczNUK1MrK2VLNEJVa3RadEpOWHZpekhrZ1V1?=
 =?utf-8?B?cCtCTnQyQ0JvVVdwK1lDRmlEbUp5V2dGcXJlMzQxelJiM2VXK3BGbFIxZEpZ?=
 =?utf-8?B?bzJZZVpqbkk3dGRPa0hMcjU2UEdwVmtnSlVYNlMxQnI0NlV5SDZzRnRGNWds?=
 =?utf-8?B?WG5GV2lTbXNXV0VsNEF3aEdaa3V3bUtBNE9wSmFlSVpkdHFJQjl3UFpoZTQv?=
 =?utf-8?B?Zk9uMHlSZ0F5enl2VC9DbEQyMzRIZXpYeDltUjBvMlFGR0V6d01CbkRwSThm?=
 =?utf-8?B?Z1Ywd2NHMjF0Yng3NE5sNFNpNkF3YlhkcDl4L280Q0pQZWxqbENpZXJsM0M3?=
 =?utf-8?B?aTNHY3dTMnJBTUtkejR4M0ZSb3cxNThjSElVN0sxNjhxK0JNbUJTamlsaitZ?=
 =?utf-8?B?QVI0ZnY1aHladW9URDdOaUo1REk3UFZlMm56TjRsNW82ZG91RkZwM01xMXVm?=
 =?utf-8?B?MUlucFpTWk1hNy9GbXNsdWN5aHY2UXh0Qmg1ODVHQVN0a0FTYVpENGhQYldy?=
 =?utf-8?B?N0dFRFkydUk0bWNvUko2L24xdzFKZk5lRXVSVlkwVWF5bG9TOHNjNWh6QTJj?=
 =?utf-8?B?OVpJOXVua2daam5lM3NzQXg5cnA0NUFoeW54eU1XekxXazBYTzJFQm1nNzcy?=
 =?utf-8?B?VnZ0RU1YcE5Gbk5GRnFGMDZSa1Rwek56NXZyaElXdDlWaE1ZRmc5M1ZGZkVI?=
 =?utf-8?B?OE1INUZlTnExZldnVWg0RUNTS09HRTZqTExKWEE0NXhZc0NUZWQ3cjF4ektI?=
 =?utf-8?B?RlhOSUhvV01zMHNFWVVoMzVQTjJOM0JaNlJrQSs2TWJDbndRWlFiVlBwclJO?=
 =?utf-8?B?cWl2Q2xBdTBhR3FLbEZlazhlcy90RE5TcC9JYVRtcitudjd0eDZvZ0xpQjUy?=
 =?utf-8?B?Vmsvek04d0xJRHQyZEo3cnFhMTJmNFRKaTZMVkNvVVd4aG1CdG1tSzI3WnY0?=
 =?utf-8?B?ZzkybXhiMUZIenVucjA1cDZEWHNVMXlRYklpcHBzR0hzT0dNQ0JYV1hnZnVX?=
 =?utf-8?Q?8XrBxhF+RNtrEj9fm4MrMpl0u5reaCKR6rbPjCt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEpycXdHZlZhZTV6cWx4TlVTMzlVc0hQY1hIUlVxclJEeWd5WHE0VUk1ZzVz?=
 =?utf-8?B?OFlXNG5YMjlGNitmbzVtcFFtblNPdW1EWGZpbTVRY2p3UjJoYTZsTUZBNnFW?=
 =?utf-8?B?VCtYd3djdmkzZTN2cnZvY1JFMmZidGVQVGR6bm5pYzI4L0t4TmJuYTBQWERo?=
 =?utf-8?B?YlZmcjQrWENSQ1ZialFTbVgvMk5sRnhSYktLSVdOdXZxNEg0Q0hQd2k2cGZS?=
 =?utf-8?B?anVKbWQ2bDcwV0VOd3BPUnFwNmYraU80ZkFCREJhWUo2R1dHUWpPeDRac25O?=
 =?utf-8?B?V2VPWmcrb2g2T1Y1eTRjci9BQllveFloNGFURVNndmswWFV1WFpvMmxEUDgv?=
 =?utf-8?B?TGR4SWpYZnVCQmVIZ0Rwbkt4SktzNm9yM0FtZHBveURQUS9qWWNrT0NYYU1R?=
 =?utf-8?B?VVlnYmZFU1NJSXBpM3ltUUZDWkVIUmUweGNGTGRlZmZ2MnYzNGhyRjY1VS9s?=
 =?utf-8?B?NmltUTRpWTFXNkdxWHM4c3NhMFl0QlcwRjJjRlowblFQRFQ2SHNlbVBaKzlq?=
 =?utf-8?B?WmIzamJTTm1XZG9CZzk3VFNOZXoxbnBFYkhIU0hwaTZrN29QazFiRDNwTng5?=
 =?utf-8?B?MXNlTDlHeUo4c1l2RVlGY1dpOUx4L3d0ZmNPRmtTcitUN2pnbUFaM2Rucmh6?=
 =?utf-8?B?WGd0Y2JUOXIwOGpOR2tnbWFrdXNWa255Wmp4VVE1eGtZcmJyQWx4M2pBK2Iy?=
 =?utf-8?B?RHg5cnF1YzhqUkY1Z2VwYk5aOUJReGR0c2E4UHNwaXY5RTlPZFczU0ZNcTU4?=
 =?utf-8?B?cCswMUtHVG9NU215K0t2aWZZaHpxQ0NNZEZTN040NERhTGV6R3kzK2JURGRZ?=
 =?utf-8?B?Q2d1Ym5HNVJUaWVMUHhHMVFqUGd4ZC9pT0xkMzVTUTJJRDZhU3FJTUxvZm9x?=
 =?utf-8?B?UUtXNW5uOHluU3A4QnZuMWpuc2NvbXZ5b2J6eDhnUEprUjVnOUZqaUtjMDdy?=
 =?utf-8?B?a3crQzdyRWVTUGVyeE9adE1XZkdLV0hhME80SW9hUW1PV0FQYVVZMmI5czNL?=
 =?utf-8?B?eXBoYk10N0ZORUd4eFNuYWxlNVpEek16SjQxYjFxdDFrbHB6ZjlEUTVYOHdS?=
 =?utf-8?B?OENCTFo4TVNDWmRVRmZrbUJpdTZZa3k1d3R3aFVYNHRpWE5GTUVzSVNka2Fu?=
 =?utf-8?B?YlRDeHJLZlVMMlRTeGpJRWVhc0xRWHVLc2FBV1hxeFpwcWxiV0FLVWhhM1lv?=
 =?utf-8?B?Szg2U2lxOUQ5VCs1RmlSaXZWMWpmSUtxcWIrcnNFRUtPZ3hGVGdCUjNZdE0w?=
 =?utf-8?B?emxDckdZajRaSzhlNTk2TXpiMmlQU0IxV0V6UmJwQjEwd0V2cnZSM2xwUDdQ?=
 =?utf-8?B?dWlPRE1BcE5PdytiVnNXaEFzWjYzQ1p5QkMvOVdjSWxTU3Mzcms5QjZYOGM5?=
 =?utf-8?B?NENzREZSanFhTDFWa09kVjlIMURQRnZaRlhPZ0RiSk1hUDZVZ1hvTEl4Ri9j?=
 =?utf-8?B?eVpjUEpyMW9BUm1vaWlkS0U5U3U0MzRvc2ZoMkNsZEJrUm5IRjAzNzNvWEFH?=
 =?utf-8?B?NXZPSXNYTnBaNlR3aGp6anFmTGFMaStmbURPODVEdWJQTC9qc0FVbS9RV1d4?=
 =?utf-8?B?UXYraFFZTmpXVVpQSUY5cU5WazkyeVA4VnI4WDdDZmMyenpDa09BNk1iS1Y2?=
 =?utf-8?B?S3VYdXZ3ZHVzODVLckQyQTdKcy83Y2JtQXBLZC9SYmZ1QWsvb2E1TDA3SS9V?=
 =?utf-8?B?cENrR2swaldtd0lsY2E2OGVXeGtMaFRCQVVOM08za1ozRUJucHRNaEU5c09v?=
 =?utf-8?B?ZUN0S3hyQXp0WUpRaFg1Mkh6M3VHTWt0SzJCdVBiMXpNRWJwa2FFWEZ3Vjg4?=
 =?utf-8?B?cXB5OTV1amduS2tBRFpGa0lna3lFRGJwcmptUDhNUXovaXU4Sjg4QmsyY0FX?=
 =?utf-8?B?KzZSQ0tpaVNkUDJYQm54VDFuVzJZK0h3VTVJazR4aGZEL0hnMHlvQlA0My9j?=
 =?utf-8?B?UmJjRWpyNnZCVEhqci9vWC9VRHRoZFNXQ3FZdTFLZ2dOTFJpY256QkRoaStz?=
 =?utf-8?B?bzJ1Qlo1Nmk3Q2JPRHNaeEZVSU1ZZVF3WUhOTk9raWJLUjIwN1VxVVJIK1V5?=
 =?utf-8?B?S1FjYUFub010M3Y2NllwbVBUVThhQ2tKM3lUdzFkbUNFam9OOHFVNlRlcGw2?=
 =?utf-8?Q?n2A/jMbHAa29BTBj37n1iCAGa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e91e3ec-11c5-425d-5a7c-08dd0a56f910
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 18:04:42.0230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdlKAFXmRXCA1JezOUho04uX4Ykb7rXPKpBLMSKvREzQ6eQXsMhJNXp29ju+UqCR9shcXyd2Vj2PVvWAOceWIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4205
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

On 11/21/2024 11:22, Antheas Kapenekakis wrote:
> Unfortunately, some modern standby systems, including the ROG Ally, rely
> on a delay between modern standby transitions. Add a quirk table for
> introducing delays between modern standby transitions, and quirk the
> ROG Ally on "Display Off", which needs a bit of time to turn off its
> controllers prior to suspending.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/acpi/x86/s2idle.c | 56 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/acpi/x86/s2idle.c b/drivers/acpi/x86/s2idle.c
> index d389c57d2963..504e6575d7ad 100644
> --- a/drivers/acpi/x86/s2idle.c
> +++ b/drivers/acpi/x86/s2idle.c
> @@ -18,6 +18,7 @@
>   #include <linux/acpi.h>
>   #include <linux/device.h>
>   #include <linux/dmi.h>
> +#include <linux/delay.h>
>   #include <linux/suspend.h>
>   
>   #include "../sleep.h"
> @@ -91,11 +92,50 @@ struct lpi_device_constraint_amd {
>   	int min_dstate;
>   };
>   
> +struct s2idle_delay_quirks {
> +	int delay_display_off;
> +	int delay_sleep_entry;
> +	int delay_sleep_exit;
> +	int delay_display_on;
> +};

Historically these "kinds" of quirks are kept in drivers/acpi/x86/utils.c.

Could it be moved there?  Or perhaps stored in the ASUS drivers and 
callbacks?

This feels cleaner if you used "struct acpi_s2idle_dev_ops" and 
callbacks.  More below.

> +
> +/*
> + * The ROG Ally series disconnects its controllers on Display Off and performs
> + * a fancy shutdown sequence, which requires around half a second to complete.
> + * If the power is cut earlier by entering it into D3, the original Ally unit
> + * might not disconnect its XInput MCU, causing excess battery drain, and the
> + * Ally X will make the controller restart post-suspend. In addition, the EC
> + * of the device rarely (1/20 attempts) may get stuck asserting PROCHOT after
> + * suspend (for various reasons), so split the delay between Display Off and
> + * Sleep Entry.
> + */
> +static const struct s2idle_delay_quirks rog_ally_quirks = {
> +	.delay_display_off = 350,
> +	.delay_sleep_entry = 150,
> +};

Is this delay still needed with Ally MCU 319 that has the fixes from ASUS?

I'm suspecting not, which means this quirk should be made more narrow IMO.

In the various ASUS drivers you can lookup the MCU firmware version. 
Those drivers can do acpi_register_lps0_dev() when the older firmware is 
present and use the callbacks.  If the newer firmware is there less code 
to worry about.

This also would mean less static quirk tables in the kernel tree.

> +
> +static const struct dmi_system_id s2idle_delay_quirks[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> +		},
> +		.driver_data = (void *)&rog_ally_quirks
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "RC72L"),
> +		},
> +		.driver_data = (void *)&rog_ally_quirks
> +	},
> +	{}
> +};
> +
>   static LIST_HEAD(lps0_s2idle_devops_head);
>   
>   static struct lpi_constraints *lpi_constraints_table;
>   static int lpi_constraints_table_size;
>   static int rev_id;
> +struct s2idle_delay_quirks *delay_quirks;
>   
>   #define for_each_lpi_constraint(entry)						\
>   	for (int i = 0;								\
> @@ -566,6 +606,9 @@ static int acpi_s2idle_display_off(void)
>   		acpi_sleep_run_lps0_dsm(ACPI_LPS0_DISPLAY_OFF,
>   				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
>   
> +	if (delay_quirks && delay_quirks->delay_display_off)
> +		msleep(delay_quirks->delay_display_off);
> +
>   	acpi_scan_lock_release();
>   
>   	return 0;
> @@ -587,6 +630,9 @@ static int acpi_s2idle_sleep_entry(void)
>   		acpi_sleep_run_lps0_dsm(ACPI_LPS0_SLEEP_ENTRY,
>   				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
>   
> +	if (delay_quirks && delay_quirks->delay_sleep_entry)
> +		msleep(delay_quirks->delay_sleep_entry);
> +
>   	acpi_scan_lock_release();
>   
>   	return 0;
> @@ -627,6 +673,9 @@ static int acpi_s2idle_sleep_exit(void)
>   	acpi_scan_lock_acquire();
>   
>   	/* Modern Standby Sleep Exit */
> +	if (delay_quirks && delay_quirks->delay_sleep_exit)
> +		msleep(delay_quirks->delay_sleep_exit);
> +
>   	if (lps0_dsm_func_mask_microsoft > 0)
>   		acpi_sleep_run_lps0_dsm(ACPI_LPS0_SLEEP_EXIT,
>   				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
> @@ -648,6 +697,9 @@ static int acpi_s2idle_display_on(void)
>   	acpi_scan_lock_acquire();
>   
>   	/* Display on */
> +	if (delay_quirks && delay_quirks->delay_display_on)
> +		msleep(delay_quirks->delay_display_on);
> +
>   	if (lps0_dsm_func_mask_microsoft > 0)
>   		acpi_sleep_run_lps0_dsm(ACPI_LPS0_DISPLAY_ON,
>   				lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
> @@ -760,6 +812,10 @@ int acpi_register_lps0_dev(struct acpi_s2idle_dev_ops *arg)
>   
>   	sleep_flags = lock_system_sleep();
>   	list_add(&arg->list_node, &lps0_s2idle_devops_head);
> +	const struct dmi_system_id *s2idle_sysid = dmi_first_match(
> +		s2idle_delay_quirks
> +	);
> +	delay_quirks = s2idle_sysid ? s2idle_sysid->driver_data : NULL;
>   	unlock_system_sleep(sleep_flags);
>   
>   	return 0;

