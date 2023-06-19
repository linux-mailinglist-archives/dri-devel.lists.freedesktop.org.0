Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9327349E6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 04:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4844C10E112;
	Mon, 19 Jun 2023 02:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C008110E10C;
 Mon, 19 Jun 2023 02:04:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHyRCHwMTShhUdYV8fU2EmAfRLoxqFHX+/EcYlfwhqe2N7ZvwMCviyTPA+rbKa1Rno1gUo3JzTAm884af0QeoyKAcXUgNE/ddzGcKuPixrOYiaSAC22spUlsrXcEBvQwq0pPz9x+bs9EUjRDDR7k5SanM/2hu8s0qTUgpxtfmnhqwu1rHYytwrAhyUXnf8Ol3SSmx6hiArSVYyyIiqjohQ8qtz+ST2flvVGV4otquFNIs8wvQWhdDWe7z0UPZUjof9GdNh1GU1415via3saDsdWGz4zaJWCT1A7jvoX06uvTwPk24MBLhflztMg5AXTxgFz6Us7+nrUCH6qT3Ox3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ky7ufUKo/LTl2b4iufGgb0Qztrw9y4UB7KvbIjQFJC4=;
 b=TNwoxllto21aXUIl0dLFcXYnanUVYHpK5QmU7zVX4j4tpGS30AbuygdrAgPg/8D7uATavpb9bJmiZkF1cxZ9avN2KQUmKCgAi2gbB4YFtYOKNQVk8YJiTfd7jgye+hdn58vbozuBBFQ24k0CVOAweZfwutFlAWBYlK3EkTG6S8CWtYEvbFfYtB2C+hqaANt4O2MNCddC/cpIfM24qRCuPj3O1hE4W/QlVb6i6vB7CQsvk1llnOO7BlnE8fzYYJY2D+quHo8gJoPj3bmtOHwscyxdK/zPojwn17IGYA9SXNrNnryEB6eqEihBchmyYOiLuNdL3uGNwL1tb9GBPYtHmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ky7ufUKo/LTl2b4iufGgb0Qztrw9y4UB7KvbIjQFJC4=;
 b=n0uAKERKWPWOu6gToAsMN4VKseYBN0robE6sGfroFb27wukQHMkQ+L+LvCOpSgdN3sGVCbCDLeADW/UzwR7TDFQnIb9m3hDZu8bvchYiG7ymsvRg+o8j3iIKuW1X7Gwv1FZs3gQebk+LYH97MuJ+FWjZNwWnjHB0X/JNd+EtvL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6396.namprd12.prod.outlook.com (2603:10b6:510:1fc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 02:04:33 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 02:04:33 +0000
Message-ID: <fc055de3-3ff4-c0dc-f48a-9f30a60bfcbf@amd.com>
Date: Sun, 18 Jun 2023 21:04:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V3 1/7] drivers/acpi: Add support for Wifi band RF
 mitigations
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>
References: <20230616065757.1054422-1-evan.quan@amd.com>
 <20230616065757.1054422-2-evan.quan@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230616065757.1054422-2-evan.quan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:5:177::37) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: d2184c06-d0e6-4041-eee5-08db70698628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X2fyA9skfgutXkSu7toB60UDj0U1+YUtgvxqi+o9RQ/2a4X8NeGf9EWbLvuFZ+IfdbS+j1IbXWgialHVJ8ARwRDzITgZwAIOBbk7zAcVjS7P/Zsj8yUUBc0UXyscCz0ztpiyuorKwUucBiNpjWl4jy0pFXwtLxTPBxlNRkDipTMEepDaLQU6zwy7IvUutlQcKT/4Oh7joS2s2bsU32MlrbpCShv0glLkyoNVgdkka8sInDu5DIRIozAgJS7rKYkMAa/xjVuwrlP0K00GgE35kdwfft9guZ+1q6P/S0keptJPUwPx5h2daVdA2XNcy8PJfdCVLO0+gB97Y7W4SlUSXP+y82Gh8gr+srfJa4QYEpEYMq1IFp8QZLoIvewPxEjZoYnGzVeGnjuJj5zQuF7kgv2BywDEmwc88Qb8X73/JXLLkIgEzwNa0elftmaOtOPBzEANeKiDZXH+a1h+Bb+uN+1TkfYGOjHicr2WP9uQ47XhXnSDWd6abRZIhTCvAfUv7zkDg4dWmqxHfnYbj4Jtjd3hNoGrFHuHzYCNHZJN93Zqkkcr/HO1PNavFjWTUkVToAkB7ed6uAnd1K5QCSkxwjqTWOIVeICp1KyFs317g8dxx+W4aC9TuQFtxh781pNcI6DK/AvlQVV2jJD9+WpW8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199021)(2906002)(30864003)(41300700001)(7416002)(5660300002)(44832011)(6862004)(8676002)(8936002)(36756003)(86362001)(31696002)(53546011)(478600001)(6506007)(6512007)(37006003)(186003)(6486002)(6666004)(66946007)(66476007)(66556008)(6636002)(4326008)(316002)(38100700002)(2616005)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1VDYm1xbXFGZGNYQWhvL3NkdXBadkNTUllGUUVZUytJd0o3NjA5a1BXZ1pv?=
 =?utf-8?B?VDF2ckwvN3RucHBESnhOQm0wWGI0SEJhRnZFSjVWSlZ6dytSR21VajNhQktK?=
 =?utf-8?B?QTZDalV5VGpvaTVNUzFOcWhHbm9qRWlaTm8wcWo4bDNNUENHWGpKbmFsaFdX?=
 =?utf-8?B?WnEvK3dQYWtseHRaWnlIYzk0RktqRTMxWVk3S2NaamUvQ2o4VGlHNkNwOHFx?=
 =?utf-8?B?bmhYckNGdkpvYkhFa1RXaHhza1FvcXZxQWV2dHd3TmNhd0F3K3pzSWRHTzBh?=
 =?utf-8?B?QmZxdUN0Nm92bGljdTB4d0RxdDJQMmVjQnpjOWI5Sy84d1NrSHFhWEw2ZXhD?=
 =?utf-8?B?U0sxSTcyREE0ZEVibVArK1lSclhFazk1cC9LSDBaSXprWGMxMlhDRFF6SkZU?=
 =?utf-8?B?cElCQ0RYNlg5T2lwa0tYRXF3WS85a3B0WG5vcHMzYnBQeG5aRFIyOXN0QVBU?=
 =?utf-8?B?RVR4Q0UzSTdURTdqWnJaN2tIMHdTTmdSVVVhRk9mT21nN09PS0pib2M0NURw?=
 =?utf-8?B?NmN0LzJaUTBEMEZVaTg3K0d0TG5YOTdwZGJoQmVBcENGVW94V3BFV3ZLMlRR?=
 =?utf-8?B?S1crc01uZmpINzg1OUd3TWZ5aTQ5MVJkR3R0cGs2NTBJRkJpUGxNbmJPcTVJ?=
 =?utf-8?B?UWhDU3pRQnFxejdZS3JMN29hQnBNT01kTlFJUTZGd3h4UlJteFp6OVN2V1ZF?=
 =?utf-8?B?RHdMQ3lZbVVJNm1oOWlUL29kZnRHRFVRcDZta3htSUFhT0l3VXRhK1dKT3Jq?=
 =?utf-8?B?UUw4ZTZaSnNOVmRlZUFlNTZyUEdydWFMV0U2eXlFdEMwUE1JS1E4L1FRR0sz?=
 =?utf-8?B?bkJlWUpic0tJNHYyeGJQaUJlSHFEaFBJaHViZFplckpobWZxQnBYYlZjR3JC?=
 =?utf-8?B?bzh5VGN0ZjNaT3ZXcVkvejNqTEpWMG9SamFiOWlpYTNJeGdQVUZDS1ZDU3dy?=
 =?utf-8?B?MUNGZytpaE1Ud2JYVEdOYzBsYjByZDh0VDAxR1FnM3NjL2Q3L0J1eDZHcGhM?=
 =?utf-8?B?YTBSNTA3NDR4bEpjTEtDeDlUbWRWSHlWZ1lNK0pZUEt5L2ZuQVowSUdwUFpG?=
 =?utf-8?B?NGo1bG9CMWFVSVYvakJ6YlppMWFaQXV1RVVWdjhvUFVWZ3E1WURaY01hWjdI?=
 =?utf-8?B?c2xEdEM4RVp0dEpkVGVCOEZnZThhTUR6c3IvMHdhWnFPK2QvcEhiTU0zTzNF?=
 =?utf-8?B?Wk1Dc0FaZkZNSU5vc0pWaURkbStzd1ZUcEYwa1c4Rm4yc1RxZVRTcUZoT0Ja?=
 =?utf-8?B?OFZCclNhUDFHdmUwbkNDRHhUMjBRai82amdvYVdXY2ZQS2NZSlM1b3pNTlVo?=
 =?utf-8?B?b08zZ2dISkVDY3BzMFlPQ3kwcDJtM2J6SWwxQ3htQkVrcFBhaWhKSDJ4Y2JU?=
 =?utf-8?B?djYxaEdvUndUV3lyd080WTRUQTZDTjBkVFpNRnpEWGM1KzlpQXl5ekFGdFgz?=
 =?utf-8?B?UlZ1NDNLbDB4NHBKbHUycEszeEgray9mZDkwSFovY3hESmxqRGNkN0VlWEVP?=
 =?utf-8?B?eW9FV2FDZWtDam83TVRhYWtINlMyOUM5OGxiZksrWm1PTithRmVyWjkxR2Ft?=
 =?utf-8?B?UG5tNlRZdFphVXp2NGx3MTdQMk1FWHBDUzdzNlQzL1BmdE8yQURXbTlWWFJn?=
 =?utf-8?B?MXBGTFJZbXFUdmlyM0ZidEFNY2M1SzdiQ01LOWRPdkovdHNlNWdIOHJkMkVr?=
 =?utf-8?B?OWZabUg0VkdLZmxlRU0wVXRMY0dpcEYxNEZkYUFsemxnRnJwa29Mb3ZpZVRD?=
 =?utf-8?B?UW5qRVVPMzZ5YzdzRnRyazdCYnF0dENTRnBsdS9jTHJzaTE2VXlESEk3Q0RI?=
 =?utf-8?B?TGtDSEJ2ckJyaHNpRVFUcXdRdExzTjlBNkxFK0lwNVNxYkFUdGVDakxlbW01?=
 =?utf-8?B?MFJWSDNvK1liTmFNQUNBS1BXZllDNjZjYmExN2hKVUpEc0Q5UTZMLzM4ZGpm?=
 =?utf-8?B?WExCU1pTaW1zcDVXaVY2NTRFZ051U0pRWm1DTlhDdXlGWklaSXdrU0ZyRGw3?=
 =?utf-8?B?aXY0YVN2UEJJUWRYMFozVFVpSjhaS0NwZ0hOY3VJSWlyRDNKd1hYODFzcnVE?=
 =?utf-8?B?R1QrN0t5enNTRmxObFpQT1lkMDErSHJSOE5tdlRZek5QUFBtLzhpWEJiU3Zr?=
 =?utf-8?B?NkE4c21YbjZyYnNvMTRhZUM5ckYwQWh2R1N0b1MxWmtpZXZ1Zkk1WGUxbjdh?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2184c06-d0e6-4041-eee5-08db70698628
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 02:04:32.9197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8QI+yob7Eyk9dIhT8v/4tgL4qmOaRV4R0CJccm1hja2QA7xCtKMDrITyf3kOPe7UtMcpCE5gxgcHHjz03aubg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6396
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
Cc: ryder.lee@mediatek.com, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, lorenzo@kernel.org, kvalo@kernel.org, Xinhui.Pan@amd.com,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lijo.Lazar@amd.com,
 linux-acpi@vger.kernel.org, shayne.chen@mediatek.com, matthias.bgg@gmail.com,
 amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com, nbd@nbd.name,
 Christian.Koenig@amd.com, sean.wang@mediatek.com, lenb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/16/23 01:57, Evan Quan wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> Due to electrical and mechanical constraints in certain platform designs
> there may be likely interference of relatively high-powered harmonics of
> the (G-)DDR memory clocks with local radio module frequency bands used
> by Wifi 6/6e/7.
> 
> To mitigate this, AMD has introduced an ACPI based mechanism that
> devices can use to notify active use of particular frequencies so
> that devices can make relative internal adjustments as necessary
> to avoid this resonance.
> 
> In order for a device to support this, the expected flow for device
> driver or subsystems:
> 
> Drivers/subsystems contributing frequencies:
> 
> 1) During probe, check `wbrf_supported_producer` to see if WBRF supported
>     for the device.
> 2) If adding frequencies, then call `wbrf_add_exclusion` with the
>     start and end ranges of the frequencies.
> 3) If removing frequencies, then call `wbrf_remove_exclusion` with
>     start and end ranges of the frequencies.
> 
> Drivers/subsystems responding to frequencies:
> 
> 1) During probe, check `wbrf_supported_consumer` to see if WBRF is supported
>     for the device.
> 2) Call the `wbrf_retrieve_exclusions` to retrieve the current
>     exclusions on receiving an ACPI notification for a new frequency
>     change.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> --
> v1->v2:
>    - move those wlan specific implementations to net/mac80211(Mario)
> ---
>   drivers/acpi/Kconfig     |   7 ++
>   drivers/acpi/Makefile    |   2 +
>   drivers/acpi/acpi_wbrf.c | 215 +++++++++++++++++++++++++++++++++++++++
>   include/linux/wbrf.h     |  55 ++++++++++
>   4 files changed, 279 insertions(+)
>   create mode 100644 drivers/acpi/acpi_wbrf.c
>   create mode 100644 include/linux/wbrf.h
> 
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index ccbeab9500ec..9ee7c7dcc3e6 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -611,3 +611,10 @@ config X86_PM_TIMER
>   
>   	  You should nearly always say Y here because many modern
>   	  systems require this timer.
> +
> +config ACPI_WBRF
> +	bool "ACPI Wifi band RF mitigation mechanism"
> +	help
> +	  Wifi band RF mitigation mechanism allows multiple drivers from
> +	  different domains to notify the frequencies in use so that hardware
> +	  can be reconfigured to avoid harmonic conflicts.
> \ No newline at end of file

There should be a newline at the end of the Kconfig file.

> diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
> index feb36c0b9446..be173e76aa62 100644
> --- a/drivers/acpi/Makefile
> +++ b/drivers/acpi/Makefile
> @@ -131,3 +131,5 @@ obj-y				+= dptf/
>   obj-$(CONFIG_ARM64)		+= arm64/
>   
>   obj-$(CONFIG_ACPI_VIOT)		+= viot.o
> +
> +obj-$(CONFIG_ACPI_WBRF)		+= acpi_wbrf.o
> \ No newline at end of file
> diff --git a/drivers/acpi/acpi_wbrf.c b/drivers/acpi/acpi_wbrf.c
> new file mode 100644
> index 000000000000..8c275998ac29
> --- /dev/null
> +++ b/drivers/acpi/acpi_wbrf.c
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Wifi Band Exclusion Interface
> + * Copyright (C) 2023 Advanced Micro Devices
> + *
> + */
> +
> +#include <linux/wbrf.h>
> +
> +/* functions */
> +#define WBRF_RECORD		0x1
> +#define WBRF_RETRIEVE		0x2
> +
> +/* record actions */
> +#define WBRF_RECORD_ADD		0x0
> +#define WBRF_RECORD_REMOVE	0x1
> +
> +#define WBRF_REVISION		0x1
> +
> +static const guid_t wifi_acpi_dsm_guid =
> +	GUID_INIT(0x7b7656cf, 0xdc3d, 0x4c1c,
> +		  0x83, 0xe9, 0x66, 0xe7, 0x21, 0xde, 0x30, 0x70);
> +
> +static int wbrf_dsm(struct acpi_device *adev, u8 fn,
> +		    union acpi_object *argv4,
> +		    union acpi_object **out)
> +{
> +	union acpi_object *obj;
> +	int rc;
> +
> +	obj = acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
> +				WBRF_REVISION, fn, argv4);
> +	if (!obj)
> +		return -ENXIO;
> +
> +	switch (obj->type) {
> +	case ACPI_TYPE_BUFFER:
> +		if (!*out) {
> +			rc = -EINVAL;
> +			break;
> +		}
> +		*out = obj;
> +		return 0;
> +
> +	case ACPI_TYPE_INTEGER:
> +		rc =  obj->integer.value ? -EINVAL : 0;
> +		break;
> +	default:
> +		rc = -EOPNOTSUPP;
> +	}
> +	ACPI_FREE(obj);
> +
> +	return rc;
> +}
> +
> +static int wbrf_record(struct acpi_device *adev, uint8_t action,
> +		       struct wbrf_ranges_in *in)
> +{
> +	union acpi_object *argv4;
> +	uint32_t num_of_ranges = 0;
> +	uint32_t arg_idx = 0;
> +	uint32_t loop_idx;
> +	int ret;
> +
> +	if (!in)
> +		return -EINVAL;
> +
> +	for (loop_idx = 0; loop_idx < ARRAY_SIZE(in->band_list);
> +	     loop_idx++)
> +		if (in->band_list[loop_idx].start &&
> +		    in->band_list[loop_idx].end)
> +			num_of_ranges++;
> +
> +	argv4 = kzalloc(sizeof(*argv4) * (2 * num_of_ranges + 2 + 1), GFP_KERNEL);
> +	if (!argv4)
> +		return -ENOMEM;
> +
> +	argv4[arg_idx].package.type = ACPI_TYPE_PACKAGE;
> +	argv4[arg_idx].package.count = 2 + 2 * num_of_ranges;
> +	argv4[arg_idx++].package.elements = &argv4[1];
> +	argv4[arg_idx].integer.type = ACPI_TYPE_INTEGER;
> +	argv4[arg_idx++].integer.value = num_of_ranges;
> +	argv4[arg_idx].integer.type = ACPI_TYPE_INTEGER;
> +	argv4[arg_idx++].integer.value = action;
> +
> +	for (loop_idx = 0; loop_idx < ARRAY_SIZE(in->band_list);
> +	     loop_idx++) {
> +		if (!in->band_list[loop_idx].start ||
> +		    !in->band_list[loop_idx].end)
> +			continue;
> +
> +		argv4[arg_idx].integer.type = ACPI_TYPE_INTEGER;
> +		argv4[arg_idx++].integer.value = in->band_list[loop_idx].start;
> +		argv4[arg_idx].integer.type = ACPI_TYPE_INTEGER;
> +		argv4[arg_idx++].integer.value = in->band_list[loop_idx].end;
> +	}
> +
> +	ret = wbrf_dsm(adev, WBRF_RECORD, argv4, NULL);
> +
> +	kfree(argv4);
> +
> +	return ret;
> +}
> +
> +int wbrf_add_exclusion(struct acpi_device *adev,
> +		       struct wbrf_ranges_in *in)
> +{
> +	return wbrf_record(adev, WBRF_RECORD_ADD, in);
> +}
> +EXPORT_SYMBOL_GPL(wbrf_add_exclusion);
> +
> +int wbrf_remove_exclusion(struct acpi_device *adev,
> +			  struct wbrf_ranges_in *in)
> +{
> +	return wbrf_record(adev, WBRF_RECORD_REMOVE, in);
> +}
> +EXPORT_SYMBOL_GPL(wbrf_remove_exclusion);
> +
> +bool wbrf_supported_producer(struct acpi_device *adev)
> +{
> +	return acpi_check_dsm(adev->handle, &wifi_acpi_dsm_guid,
> +			      WBRF_REVISION,
> +			      (1ULL << WBRF_RECORD) | (1ULL << WBRF_RETRIEVE));
> +}
> +EXPORT_SYMBOL_GPL(wbrf_supported_producer);
> +
> +static union acpi_object *
> +acpi_evaluate_wbrf(acpi_handle handle, u64 rev, u64 func)
> +{
> +	acpi_status ret;
> +	struct acpi_buffer buf = {ACPI_ALLOCATE_BUFFER, NULL};
> +	union acpi_object params[4];
> +	struct acpi_object_list input = {
> +		.count = 4,
> +		.pointer = params,
> +	};
> +
> +	params[0].type = ACPI_TYPE_INTEGER;
> +	params[0].integer.value = rev;
> +	params[1].type = ACPI_TYPE_INTEGER;
> +	params[1].integer.value = func;
> +	params[2].type = ACPI_TYPE_PACKAGE;
> +	params[2].package.count = 0;
> +	params[2].package.elements = NULL;
> +	params[3].type = ACPI_TYPE_STRING;
> +	params[3].string.length = 0;
> +	params[3].string.pointer= NULL;
> +
> +	ret = acpi_evaluate_object(handle, "WBRF", &input, &buf);
> +	if (ACPI_SUCCESS(ret))
> +		return (union acpi_object *)buf.pointer;
> +
> +	if (ret != AE_NOT_FOUND)
> +		acpi_handle_warn(handle,
> +				 "failed to evaluate WBRF(0x%x)\n", ret);
> +
> +	return NULL;
> +}
> +
> +static bool check_acpi_wbrf(acpi_handle handle, u64 rev, u64 funcs)
> +{
> +	int i;
> +	u64 mask = 0;
> +	union acpi_object *obj;
> +
> +	if (funcs == 0)
> +		return false;
> +
> +	obj = acpi_evaluate_wbrf(handle, rev, 0);
> +	if (!obj)
> +		return false;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER)
> +		return false;
> +
> +	for (i = 0; i < obj->buffer.length && i < 8; i++)
> +		mask |= (((u64)obj->buffer.pointer[i]) << (i * 8));
> +	ACPI_FREE(obj);
> +
> +	/*
> +	 * Bit 0 indicates whether there's support for any functions other than
> +	 * function 0.
> +	 */
> +	if ((mask & 0x1) && (mask & funcs) == funcs)
> +		return true;
> +
> +	return false;
> +}
> +
> +bool wbrf_supported_consumer(struct acpi_device *adev)
> +{
> +	return check_acpi_wbrf(adev->handle,
> +			       WBRF_REVISION,
> +			       1ULL << WBRF_RETRIEVE);
> +}
> +EXPORT_SYMBOL_GPL(wbrf_supported_consumer);
> +
> +int wbrf_retrieve_exclusions(struct acpi_device *adev,
> +			     struct wbrf_ranges_out *exclusions_out)
> +{
> +	union acpi_object *obj;
> +
> +	obj = acpi_evaluate_wbrf(adev->handle,
> +				 WBRF_REVISION,
> +				 WBRF_RETRIEVE);
> +	if (!obj)
> +		return -EINVAL;
> +
> +	memcpy(exclusions_out, obj->buffer.pointer, obj->buffer.length);
> +
> +	ACPI_FREE(obj);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(wbrf_retrieve_exclusions);
> diff --git a/include/linux/wbrf.h b/include/linux/wbrf.h
> new file mode 100644
> index 000000000000..e4c99b69f1d2
> --- /dev/null
> +++ b/include/linux/wbrf.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * AMD Wifi Band Exclusion Interface
> + * Copyright (C) 2023 Advanced Micro Devices
> + */
> +
> +#ifndef _LINUX_WBRF_H
> +#define _LINUX_WBRF_H
> +
> +#include <linux/acpi.h>
> +
> +/* Maximum number of wbrf ranges */
> +#define MAX_NUM_OF_WBRF_RANGES		11 > +
> +struct exclusion_range {
> +	/* start and end point of the frequency range in Hz */
> +	uint64_t	start;
> +	uint64_t	end;
> +};
> +
> +struct wbrf_ranges_in {
> +	/* valid entry: `start` and `end` filled with non-zero values */
> +	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
> +};
> +
> +struct wbrf_ranges_out {
> +	uint32_t		num_of_ranges;
> +	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
> +} __attribute__((packed));
> +
> +/**
> + * APIs needed by drivers/subsystems for contributing frequencies:
> + * During probe, check `wbrf_supported_producer` to see if WBRF is supported.
> + * If adding frequencies, then call `wbrf_add_exclusion` with the
> + * start and end points specified for the frequency ranges added.
> + * If removing frequencies, then call `wbrf_remove_exclusion` with
> + * start and end points specified for the frequency ranges added.
> + */
> +bool wbrf_supported_producer(struct acpi_device *adev);
> +int wbrf_add_exclusion(struct acpi_device *adev,
> +		       struct wbrf_ranges_in *in);
> +int wbrf_remove_exclusion(struct acpi_device *adev,
> +			  struct wbrf_ranges_in *in);
> +
> +/**
> + * APIs needed by drivers/subsystems responding to frequencies:
> + * During probe, check `wbrf_supported_consumer` to see if WBRF is supported.
> + * When receiving an ACPI notification for some frequencies change, run
> + * `wbrf_retrieve_exclusions` to retrieve the latest frequencies ranges.
> + */
> +int wbrf_retrieve_exclusions(struct acpi_device *adev,
> +			     struct wbrf_ranges_out *out);
> +bool wbrf_supported_consumer(struct acpi_device *adev);
> +
> +#endif /* _LINUX_WBRF_H */

