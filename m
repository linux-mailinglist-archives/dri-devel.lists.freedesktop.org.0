Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B91743FF2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 18:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D04010E4BF;
	Fri, 30 Jun 2023 16:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261CA10E4BF;
 Fri, 30 Jun 2023 16:40:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+hWdYvDFddydJZM08VZgqcVwUvvoPBOgk4DNuR0KGArjA88DEm8g4pwl0DiJ1VGkeqFxy41WT2LB1pifuDoMh6ebsJLSNtSPyEL+xI6RWPD2vWqE8FsSr5RQp1RiDcYPHQqDXIfmob+YNQNiCzl5Jfr7/rDFZIWZS0if0VO9hH93Ybv+af3+fCfUFKejqEQyjBKG7CYhwK6yfyMUxptSTcDTObJkdGkBfFEW8Ik/UccipM7aCZc2I4prLT3/HO9sYuIerY9au9MJX6QhvRu1IuJyhNzEoZez2AZRu0FexJdn8P2UfkFE32jSYMpTWBmJt1onZoHBnNCrw/U6bArJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1tcpsqVFf8Um65tLbwVSRvLvTdwZrJOVQ05oyCayR8=;
 b=d7Ld5mT/4AMpxSOFtceqqLDDIU5dj15ET3cFjjq2Hy5P43eeR0OVfISaTplLAbXgcHah/mUR3hB+7yXzhSWCrieVV8btxfb8Fr99dVPNXCN5LD2QrduCXXDWPVHOQuqEYh7RSiHjZrhPPG5SGKA8oqh3PwKY5ZyKfivUIczWU6PbfJ1v0N5ZfwTkAyLMACYaYPr8s3I5Z1gBWkLSVQCE+EoO283DdN+q9eaQxKTy1W5wxbPh1qKnemaVn3gwgBG23M8T+h18AxgrR/uGkq33wPOocpeKk4fdAExQSKTn1+F1ZZcwY5VAymYNrRZbvQF6Rve9sPNZU335buSWGVWFNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1tcpsqVFf8Um65tLbwVSRvLvTdwZrJOVQ05oyCayR8=;
 b=0gxQDdwsn9F0EEwoWXcXqGSEGJ2s9KQURZaL4Rz/tVN97IdWa1+ccY1J0XaCZMV6s+XUDMgMhkeRwdrhdXqGVWzs4f2TT7I51CDPssUxZ+KuxPDRT0xwBkSlGsQe8rL7aubOCA4gXxMSmD+mUkPAQKo5rLL45TjBdaT9cjuzoRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6210.namprd12.prod.outlook.com (2603:10b6:208:3e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 16:40:49 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 16:40:49 +0000
Message-ID: <3e095621-d7dc-9069-45dc-498c8f3bb4f4@amd.com>
Date: Fri, 30 Jun 2023 11:40:55 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
To: Evan Quan <evan.quan@amd.com>, rafael@kernel.org, lenb@kernel.org,
 Alexander.Deucher@amd.com, Christian.Koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, johannes@sipsolutions.net,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mdaenzer@redhat.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, hdegoede@redhat.com, jingyuwang_vip@163.com,
 Lijo.Lazar@amd.com, jim.cromie@gmail.com, bellosilicio@gmail.com,
 andrealmeid@igalia.com, trix@redhat.com, jsg@jsg.id.au, arnd@arndb.de
References: <20230630103240.1557100-1-evan.quan@amd.com>
 <20230630103240.1557100-2-evan.quan@amd.com>
Content-Language: en-US
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20230630103240.1557100-2-evan.quan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6210:EE_
X-MS-Office365-Filtering-Correlation-Id: 67577bc8-14e7-408e-c04b-08db7988c292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hlTOS1jRGClQD1S7WCWrnTQ29Ha0e1/8mMEU4dxWfpNdOZL/EuqH0e/ilJwAUCmPrVdINVQBj9TVRciy25+DYDV4OHIFLOk0fMH5glU6ONIU9d9NHKs05qTQakWVunXUIxt+PLtczfiuTmc9osLLD/j/NOTJWmfo49zrWU4CMGdyICyiAXBgUe6YL25D/nJw5ajTLY7wrYxk6w6Td5riPche7ZYvNQZElphRDENdbq0KEZID/OVk0bqs1ZBhRpi7hZDzyRHWz7Zkges+Ohi9CJdeMAOcQGYEYhj2e010bet9VP667T0yTciG6RAJFLTW5G3Q/83y3+QmuGSF8BoW737duPfJQVehvlDsEB3/Xa1r6G1dZxh6dIXg64hYj+O8oh4JoHoHsNPm+tvuSBPmX8Cih6aMcJNBP19pBM+UY52E23w1gpUgVoukHZ4yx02u9JuROyJ6UC3a8BxzdJCS/+T42ebdeux7CJeL6gDBOKyw9wSJoJiQ2MYV2xCvbiKCgL6iIIFiJ4GLjP6Dnv7WWQeZEWke3g6RWXd7YGdyS2BOWWDg1SXVHVZq3ke4TgzloVM9VQ1yIM6u3/lgSCk7Ljiq6EHUr4juZ0L4z32EK5ExJsVj/DK0vdWt35eux9psg/Bml3SUlj4JM5Gl+f1t87BHvIZo+/ws1CGqxBvU0Jc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199021)(83380400001)(30864003)(2616005)(2906002)(38100700002)(921005)(36756003)(8936002)(8676002)(5660300002)(86362001)(31686004)(6512007)(41300700001)(66946007)(66556008)(66476007)(4326008)(6666004)(316002)(6486002)(478600001)(186003)(31696002)(6506007)(53546011)(7416002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG9vS0J2a2RxOExibkg5dk1uY2ZkYjhEb2ZNd2swZW9memhOYVdZUDl0VWdt?=
 =?utf-8?B?WWRkYXhjOUlRbG1rekxUNmlwWUw1MDlJODZmR0tpU21NODVraE1WWlVDMGo3?=
 =?utf-8?B?SjFyNExOeWNGRHZHYnpjampQL3B6dmZNTlB6YVA5U0UvZ0JCazVLZEt1Vzg3?=
 =?utf-8?B?SGtORnIzc3pzVzE4OEcwMU01UEFna1FHZ1Z5STBOOVFWRHZWN09ic3FWOElp?=
 =?utf-8?B?eEF6b3dxcVdzOW83MjNiM2lnaGlmVFFsWDNKblRZVzcvaVdRemIvd0ZTelJ1?=
 =?utf-8?B?VWVNaUpTeU05WGhPSmpjMjh6T2JjYmtoTGswQzRWNE5senNTemZaaVdpVXI1?=
 =?utf-8?B?bkFCdnhFYjRaaHRnUFlJbGtFQ1JnN3JPek5jSmNpRGN1UVg5Z25DMmhLaThC?=
 =?utf-8?B?QmtsTEJpeXJuY09EZEZ5SlErL2U4VExOWm1wRWxqSGIyMThUQVM3Z0VoczQx?=
 =?utf-8?B?dER2NDN1azllUzFqTE5wK3lpcFpIL3prcFFtK2hlbzZlbTBWbzd3dGc1bE9H?=
 =?utf-8?B?Qmk4ZmVzMS9kZytwellkaXZUVW8xbjJINWxTNFJvYmVkamxvMjIzN1BKLzNr?=
 =?utf-8?B?TG1KVVdQMnJzSlBobk5GRmNnWUVjQXJuQ1JnZnZBbWpJZUtCS1JPaWZPREg2?=
 =?utf-8?B?TTNWbXUrdlMzOTBlNWJISjdPN1JaVkVRKzl0bERSbU16Nkt6M1RRam9WVDU4?=
 =?utf-8?B?V1J0bnNEQUg2VUxXSFl6V1hoNFBheGV4VkNta2tKN0VIQ2RPb2hHTVdEY3hx?=
 =?utf-8?B?eTdXQmtzOUVjbGViUmFZN0kzTFFDSkZ0UmVweittaGI4SXlFZjd3Vkg2R01D?=
 =?utf-8?B?ZU5xQUZNZTJ5d0hSM0pwdXJxZEorb0ZUNzgzYllFUzF1d3hXTXZvYUNGSU9X?=
 =?utf-8?B?ci9KNjMvRFhtVlZQbVo1c0YrRndFUHJhelpoT3BQelQ2OFBjZTZRZE1yWFVJ?=
 =?utf-8?B?ZTYwbzFnQi9QamppL0hNaHRZZHYwVmZveVNLTERvcUp2Qnptc05Wd3RpOWIz?=
 =?utf-8?B?ZU9NT0VJek5sdzdDN2NVOWxHUDJEc0xFRzJPMGtaQ0NzbWw5YnZoZSt3MXov?=
 =?utf-8?B?eDRMNktSb1YxckhGMHpnbG0yWC9XdVNoVmpZRzl4RTdORmxRSitpTENTWnRp?=
 =?utf-8?B?Z0JMVTVZaE1sWXJSak5WTVRLcnFlZ0RFOU9ZenlJQ1RtUzhGdDJ0Y1F3V0la?=
 =?utf-8?B?QkNsOEJEcEFTSWM2LyttM2V2K2U2bUlIQVJIaVpGVE54WHNYNjRNNWttdGVs?=
 =?utf-8?B?MW1nblQxR20vWlE4MCtHSVZWMnNwWW4rUkJPcm1jbTcwVERyUUJGSE80bUFi?=
 =?utf-8?B?cFZIQnhqWElCNUJ0YzZqdmZiV2dnYUxDS3Z2TU05QTErVk9GcTZNZERpelNB?=
 =?utf-8?B?U2dKK2kvcFgxMDNuV0RUQmp5L2hpN3l1dFRvMnVKald1ZHRUVEtyaXdrd2NJ?=
 =?utf-8?B?NllDd2wvQnk5RDlDc04wKzRJTWkwSnF6QjYzc2hWVTJqNzdSczZ3UUhmQUVM?=
 =?utf-8?B?SEdxelVoblFjZk5ZRWl4ZEsvSml5ZVZiR0hOS1RxN0R2bDRRV3hzWVJuME1Y?=
 =?utf-8?B?M3pIUkZSQXNEZmJGQkl2dHhYaGsvWTVIWkxaMWQ2cFphTDhVcVFpQnNJS2tj?=
 =?utf-8?B?YldmSzVZMDloUEo4b0RLdzlVVE5FOWdDZzRpMGZRTzlVVmxsREJMUEJabVhk?=
 =?utf-8?B?cDlBZEhCeEJ3MEFLWlA0TVNoMFNGZEFpVE9LMVpJcmtrRTZ5Y1FmTklxZnNk?=
 =?utf-8?B?N2xDNG1rb3N6Q2hzdTBBVkp0Ui93NnBYUTRjSC9WZi8zZnA4MFBoWWZRemVH?=
 =?utf-8?B?dmsyZS95OE5DcmJzYmdMbXl0V2xyZlhJS3hCWHdHSVNhQm5ldm00OFJzdlZF?=
 =?utf-8?B?d3RLaFhCUm9URWNySHJyU1VXdVYyUW1HWXlzZWlnbTNPVkVPN0sxZTdXcXA2?=
 =?utf-8?B?QTcvcXpqa2FSdER5L0daUzd5dC9oMWhJTnFFcjVtUUxlbFcxbUtLckdnVkRS?=
 =?utf-8?B?YlowdTdkUnZ4VU9BVDVDNW9mQTBVOTNodGdMaTFoNFc2WDRBeEw5dFJhSEdQ?=
 =?utf-8?B?NU1rLzBNWEMzZ2RNR3MrL3NDT2doQ3VUanIwak4wV0pycFUwMGN0alNJZEUy?=
 =?utf-8?Q?8eWSDkhE5yKKCkT0/iR3nxX9b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67577bc8-14e7-408e-c04b-08db7988c292
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 16:40:49.1941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfGbQxnlxDPwlGiZOK+oGSIhbG84T7pWY3XmpNBtgB/Ev6nSkkBgSi2mIsVWiiEcClGIchRb7J8uSLLsjj2XFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6210
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/30/2023 05:32, Evan Quan wrote:
> Due to electrical and mechanical constraints in certain platform designs
> there may be likely interference of relatively high-powered harmonics of
> the (G-)DDR memory clocks with local radio module frequency bands used
> by Wifi 6/6e/7.
> 
> To mitigate this, AMD has introduced a mechanism that devices can use to
> notify active use of particular frequencies so that other devices can make
> relative internal adjustments as necessary to avoid this resonance.
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
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> --
> v4->v5:
>    - promote this to be a more generic solution with input argument taking
>      `struct device` and provide better scalability to support non-ACPI
>      scenarios(Andrew)
>    - update the APIs naming and some other minor fixes(Rafael)
> ---
>   drivers/base/Kconfig  |   8 ++
>   drivers/base/Makefile |   1 +
>   drivers/base/wbrf.c   | 227 ++++++++++++++++++++++++++++++++++++++++++
>   include/linux/wbrf.h  |  65 ++++++++++++
>   4 files changed, 301 insertions(+)
>   create mode 100644 drivers/base/wbrf.c
>   create mode 100644 include/linux/wbrf.h
> 
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index 2b8fd6bb7da0..5b441017b225 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -242,4 +242,12 @@ config FW_DEVLINK_SYNC_STATE_TIMEOUT
>   	  command line option on every system/board your kernel is expected to
>   	  work on.
>   
> +config WBRF
> +	bool "Wifi band RF mitigation mechanism"
> +	default n
> +	help
> +	  Wifi band RF mitigation mechanism allows multiple drivers from
> +	  different domains to notify the frequencies in use so that hardware
> +	  can be reconfigured to avoid harmonic conflicts.
> +
>   endmenu
> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> index 3079bfe53d04..c844f68a6830 100644
> --- a/drivers/base/Makefile
> +++ b/drivers/base/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_GENERIC_MSI_IRQ) += platform-msi.o
>   obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY) += arch_topology.o
>   obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
>   obj-$(CONFIG_ACPI) += physical_location.o
> +obj-$(CONFIG_WBRF) += wbrf.o
>   
>   obj-y			+= test/
>   
> diff --git a/drivers/base/wbrf.c b/drivers/base/wbrf.c
> new file mode 100644
> index 000000000000..2163a8ec8a9a
> --- /dev/null
> +++ b/drivers/base/wbrf.c
> @@ -0,0 +1,227 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Wifi Band Exclusion Interface
> + * Copyright (C) 2023 Advanced Micro Devices
> + *
> + */
> +
> +#include <linux/wbrf.h>
> +
> +static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
> +static DEFINE_MUTEX(wbrf_mutex);
> +static struct exclusion_range_pool wbrf_pool;
> +
> +static int _wbrf_add_exclusion_ranges(struct wbrf_ranges_in *in)
> +{
> +	int i, j;
> +
> +	for (i = 0; i < ARRAY_SIZE(in->band_list); i++) {
> +		if (!in->band_list[i].start &&
> +		    !in->band_list[i].end)
> +			continue;
> +
> +		for (j = 0; j < ARRAY_SIZE(wbrf_pool.band_list); j++) {
> +			if (wbrf_pool.band_list[j].start == in->band_list[i].start &&
> +			    wbrf_pool.band_list[j].end == in->band_list[i].end) {
> +				wbrf_pool.ref_counter[j]++;
> +				break;
> +			}
> +		}
> +		if (j < ARRAY_SIZE(wbrf_pool.band_list))
> +			continue;
> +
> +		for (j = 0; j < ARRAY_SIZE(wbrf_pool.band_list); j++) {
> +			if (!wbrf_pool.band_list[j].start &&
> +			    !wbrf_pool.band_list[j].end) {
> +				wbrf_pool.band_list[j].start = in->band_list[i].start;
> +				wbrf_pool.band_list[j].end = in->band_list[i].end;
> +				wbrf_pool.ref_counter[j] = 1;
> +				break;
> +			}
> +		}
> +		if (j >= ARRAY_SIZE(wbrf_pool.band_list))
> +			return -ENOSPC;
> +	}
> +
> +	return 0;
> +}
> +
> +static int _wbrf_remove_exclusion_ranges(struct wbrf_ranges_in *in)
> +{
> +	int i, j;
> +
> +	for (i = 0; i < ARRAY_SIZE(in->band_list); i++) {
> +		if (!in->band_list[i].start &&
> +		    !in->band_list[i].end)
> +			continue;
> +
> +		for (j = 0; j < ARRAY_SIZE(wbrf_pool.band_list); j++) {
> +			if (wbrf_pool.band_list[j].start == in->band_list[i].start &&
> +			    wbrf_pool.band_list[j].end == in->band_list[i].end) {
> +				wbrf_pool.ref_counter[j]--;
> +				if (!wbrf_pool.ref_counter[j]) {
> +					wbrf_pool.band_list[j].start = 0;
> +					wbrf_pool.band_list[j].end = 0;
> +				}
> +				break;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int _wbrf_retrieve_exclusion_ranges(struct wbrf_ranges_out *out)
> +{
> +	int out_idx = 0;
> +	int i;
> +
> +	memset(out, 0, sizeof(*out));
> +
> +	for (i = 0; i < ARRAY_SIZE(wbrf_pool.band_list); i++) {
> +		if (!wbrf_pool.band_list[i].start &&
> +		    !wbrf_pool.band_list[i].end)
> +			continue;
> +
> +		out->band_list[out_idx].start = wbrf_pool.band_list[i].start;
> +		out->band_list[out_idx++].end = wbrf_pool.band_list[i].end;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * wbrf_supported_producer - Determine if the device can report frequencies
> + *
> + * @dev: device pointer
> + *
> + * WBRF is used to mitigate devices that cause harmonic interference.
> + * This function will determine if this device needs to report such frequencies.
> + */
> +bool wbrf_supported_producer(struct device *dev)
> +{
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(wbrf_supported_producer);
> +
> +/**
> + * wbrf_add_exclusion - Add frequency ranges to the exclusion list
> + *
> + * @dev: device pointer
> + * @in: input structure containing the frequency ranges to be added
> + *
> + * Add frequencies into the exclusion list for supported consumers
> + * to react to.
> + */
> +int wbrf_add_exclusion(struct device *dev,
> +		       struct wbrf_ranges_in *in)
> +{
> +	int r;
> +
> +	mutex_lock(&wbrf_mutex);
> +
> +	r = _wbrf_add_exclusion_ranges(in);
> +
> +	mutex_unlock(&wbrf_mutex);
> +	if (r)
> +		return r;
> +
> +	blocking_notifier_call_chain(&wbrf_chain_head, WBRF_CHANGED, NULL);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(wbrf_add_exclusion);
> +
> +/**
> + * wbrf_remove_exclusion - Remove frequency ranges from the exclusion list
> + *
> + * @dev: device pointer
> + * @in: input structure containing the frequency ranges to be removed
> + *
> + * Remove frequencies from the exclusion list for supported consumers
> + * to react to.
> + */
> +int wbrf_remove_exclusion(struct device *dev,
> +			  struct wbrf_ranges_in *in)
> +{
> +	int r;
> +
> +	mutex_lock(&wbrf_mutex);
> +
> +	r = _wbrf_remove_exclusion_ranges(in);
> +
> +	mutex_unlock(&wbrf_mutex);
> +	if (r)
> +		return r;
> +
> +	blocking_notifier_call_chain(&wbrf_chain_head, WBRF_CHANGED, NULL);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(wbrf_remove_exclusion);
> +
> +/**
> + * wbrf_supported_consumer - Determine if the device can react to frequencies
> + *
> + * @dev: device pointer
> + *
> + * WBRF is used to mitigate devices that cause harmonic interference.
> + * This function will determine if this device needs to react to reports from
> + * other devices for such frequencies.
> + */
> +bool wbrf_supported_consumer(struct device *dev)
> +{
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(wbrf_supported_consumer);
> +
> +/**
> + * wbrf_register_notifier - Register for notifications of frequency changes
> + *
> + * @nb: driver notifier block
> + *
> + * WBRF is used to mitigate devices that cause harmonic interference.
> + * This function will allow consumers to register for frequency notifications.
> + */
> +int wbrf_register_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&wbrf_chain_head, nb);
> +}
> +EXPORT_SYMBOL_GPL(wbrf_register_notifier);
> +
> +/**
> + * wbrf_unregister_notifier - Unregister for notifications of frequency changes
> + *
> + * @nb: driver notifier block
> + *
> + * WBRF is used to mitigate devices that cause harmonic interference.
> + * This function will allow consumers to unregister for frequency notifications.
> + */
> +int wbrf_unregister_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&wbrf_chain_head, nb);
> +}
> +EXPORT_SYMBOL_GPL(wbrf_unregister_notifier);
> +
> +/**
> + * wbrf_retrieve_exclusions - Retrieve the exclusion list
> + *
> + * @dev: device pointer
> + * @out: output structure containing the frequency ranges to be excluded
> + *
> + * Retrieve the current exclusion list
> + */
> +int wbrf_retrieve_exclusions(struct device *dev,
> +			     struct wbrf_ranges_out *out)
> +{
> +	int r;
> +
> +	mutex_lock(&wbrf_mutex);
> +
> +	r = _wbrf_retrieve_exclusion_ranges(out);
> +
> +	mutex_unlock(&wbrf_mutex);
> +
> +	return r;
> +}
> +EXPORT_SYMBOL_GPL(wbrf_retrieve_exclusions);
> diff --git a/include/linux/wbrf.h b/include/linux/wbrf.h
> new file mode 100644
> index 000000000000..3ca95786cef5
> --- /dev/null
> +++ b/include/linux/wbrf.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Wifi Band Exclusion Interface
> + * Copyright (C) 2023 Advanced Micro Devices
> + */
> +
> +#ifndef _LINUX_WBRF_H
> +#define _LINUX_WBRF_H
> +
> +#include <linux/device.h>
> +
> +/* Maximum number of wbrf ranges */
> +#define MAX_NUM_OF_WBRF_RANGES		11
> +
> +struct exclusion_range {
> +	/* start and end point of the frequency range in Hz */
> +	uint64_t	start;
> +	uint64_t	end;
> +};
> +
> +struct exclusion_range_pool {
> +	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
> +	uint64_t		ref_counter[MAX_NUM_OF_WBRF_RANGES];
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
> +} __packed;
> +
> +enum wbrf_notifier_actions {
> +	WBRF_CHANGED,
> +};
> +
> +#ifdef CONFIG_WBRF
> +bool wbrf_supported_producer(struct device *dev);
> +int wbrf_add_exclusion(struct device *adev,
> +		       struct wbrf_ranges_in *in);
> +int wbrf_remove_exclusion(struct device *dev,
> +			  struct wbrf_ranges_in *in);
> +int wbrf_retrieve_exclusions(struct device *dev,
> +			     struct wbrf_ranges_out *out);
> +bool wbrf_supported_consumer(struct device *dev);
> +
> +int wbrf_register_notifier(struct notifier_block *nb);
> +int wbrf_unregister_notifier(struct notifier_block *nb);
> +#else
> +static inline bool wbrf_supported_producer(struct device *dev) { return false; }
> +static inline int wbrf_add_exclusion(struct device *adev,
> +				     struct wbrf_ranges_in *in) { return -ENODEV; }
> +static inline int wbrf_remove_exclusion(struct device *dev,
> +					struct wbrf_ranges_in *in) { return -ENODEV; }
> +static inline int wbrf_retrieve_exclusions(struct device *dev,
> +					   struct wbrf_ranges_out *out) { return -ENODEV; }
> +static inline bool wbrf_supported_consumer(struct device *dev) { return false; }
> +static inline int wbrf_register_notifier(struct notifier_block *nb) { return -ENODEV; }
> +static inline int wbrf_unregister_notifier(struct notifier_block *nb) { return -ENODEV; }
> +#endif
> +

Right now there are stubs for non CONFIG_WBRF as well as other patches 
are using #ifdef CONFIG_WBRF or having their own stubs.  Like mac80211 
patch looks for #ifdef CONFIG_WBRF.

I think we should pick one or the other.

Having other subsystems #ifdef CONFIG_WBRF will make the series easier 
to land through multiple trees; so I have a slight leaning in that 
direction.

> +#endif /* _LINUX_WBRF_H */

