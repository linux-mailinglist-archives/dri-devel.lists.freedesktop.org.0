Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 266FB7B3F7B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854A510E1E5;
	Sat, 30 Sep 2023 08:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A24C10E1E5;
 Sat, 30 Sep 2023 08:40:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/DmNrIy6vIbWYHFOKO4lvRO3spRkNG4UzfcS0PpXEMiZDHna/zKpCj7/UhYP8pUJ6XJ6VoSrCzx7a0IJCdJVbnNSOVgMoOAhQpb1zkkd9w881c/ELjyR4YRKGi28DTRC9Jmg5JH770uPeEDfRfRWbH5fXlQQUZ7zf6SKZsBUXdhxuOSgdorrIpz+J8nnBvcDCao+NxqD3us5IZHJa1Oy0VUhEimxg+1BPh8lFEf3bxlV+xb7HaGxemVtt3L5Gyu1T/NgksBY/ftTojCiRD+8O7YLZmjRQSmRRObUcQiBgrV7xoGnY72Y/OdyMz/y59TVYncYklShFn962ePb9y2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkEK/UiUZlemokvcuEhNB1Rc0JJqGvFJmlOVfy20wHo=;
 b=jQQLZLKJa0qgAUbw7MEOQnrkxlEabogF8EqX9S32VfWxfkjzoMXVjXPwZ3mvo8dqrY1e92zFS8TRxtt9Hd7AQp2WSZ5QnUqL1hMc6i3f8Mi1BXYa5aJTA6SqqOMHZ7wq4D5UCdBe5FwN7yAoTXl2P5LyX2XssFx0nlGmQmzpbtv4sEDb1U1ZDgNydhK7AYyFb6h0VV6Md79PV38qC9FiYSEquJYCs6yWHiNWtYG/TpWzxIKsBDRmLhDHspP8KOqZpRs6rJKoT/esS47IbTZ9TfqXl2jcn+TgEUP+R4PYQ2JzEtUPESGMSwzrLJXmqOTAR5bdxuWRiOUgdTIfMr5I1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkEK/UiUZlemokvcuEhNB1Rc0JJqGvFJmlOVfy20wHo=;
 b=3uSIr4EF9XzJ1CNPTRGPv1CsFwgCFc1lTprOf1XLSuzElchcdBnQH+iOWbhXvUu30WOmR4np49RJmEDwxWKa3rhDtSpl6CRtGAUOzy/Ik/SpURGiKfYyhZrYwX6mkUvEz7VPnwFr2+xkUK7bJ6dCh/8YQtULkntyp3C5zES9cdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB7113.namprd12.prod.outlook.com (2603:10b6:510:1ec::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Sat, 30 Sep
 2023 08:40:35 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6838.029; Sat, 30 Sep 2023
 08:40:29 +0000
Message-ID: <59b3db5f-3dc8-4eca-84ce-983774b984d4@amd.com>
Date: Sat, 30 Sep 2023 14:10:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] platform/x86/amd/pmf: Add support to get inputs
 from other subsystems
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-7-Shyam-sundar.S-k@amd.com>
 <be35f637-23c7-64c2-65bf-5b1783801d16@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <be35f637-23c7-64c2-65bf-5b1783801d16@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0124.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf4dd16-1865-4368-23f0-08dbc190e6b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0l+Oub05luev1hTkEQtrMmbxAjiMOoq5DvKNdqtM0/ErJHIRginjlql3EF0KTjrTgjwO9eJqzR9dKGjb1ZpmrsxeX8IYTESfiA2gGmfHDilxzJYvAP08cr7aRBcTnnReW15mSZBTM3ztFjpxMC5KPY+e5g0mdu6ooRvG/G3W6ZjVTBmysZFhf70tl1kSS3fVoTr4Fh6uTvt4DIg9rDmF/iWQDKz7mUdBI5tdelZ1mvWxci42j5+XjwG4Tc92zsdmY4r86PN3w6exMw1EGKkSGeIEW9G29DqyWZQXWueoy+P6UAeYuFQi1x2Qk2YFWhksaksjcjcxYylPx1V02JUyZqOgAakNIIdxdxpkCIk2ySGLE+BxPg9ugVHDSEQmdHT4um9HcgqXAE7axR+zYkcZb1Bomubc3cDGWkCjFNHj7rz/VT2pnbAeXlSp/Z4e+FzN+7B04mcGu4I0mPOhQVntOii9TCE20hGdoYBWx97Uz5N06k6XJIcJWeTdd2DMJWZxVH1gJ0avfzKsou/9nccphVnIGP+0zu6y76z/Mz/XrTTSePXxHVXK1rOQikk75Pw8drcdWwVFA9M8iLtWZTewoeQgB3KuiCQpn7weBWgSsCZtGNPqTCIhlfGqGs2n1kB5FZpWY65Zg/x+mtF6QW42Gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(53546011)(6666004)(83380400001)(6512007)(66946007)(316002)(6916009)(66476007)(478600001)(6486002)(66556008)(41300700001)(31686004)(6506007)(2616005)(5660300002)(31696002)(26005)(8676002)(2906002)(38100700002)(86362001)(36756003)(8936002)(66574015)(4326008)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?citaNDlSK2hMSWg0MEVSdW1XS2R6RUQvOTNhRlZOVTl6QVVNVTZkUE5BM05p?=
 =?utf-8?B?cEpKK1FJSTYxenVwNVZtWDBjQ1lCNytMUmZ4VXhaQnNqLzdNeHdBSVR5YkNo?=
 =?utf-8?B?S1VqUUJBNWtLcU51SzlLSDFTbEdCQWdDU2h2VVVJWjB1SHhYYXEvbTR6bnND?=
 =?utf-8?B?MHY1a2svQVRSMmN6ZzZVUnYzTkNqL2hxQlZjZXhYT0VoYWEvckNuVTlLTkFG?=
 =?utf-8?B?d3dNMXZXaWtOUG1nNXB6eDlKWEFSbVhTQ1JKWTMvSGpZV3dGRzJ6SzBpci9L?=
 =?utf-8?B?eWdLU0trMzdiTXZmU2ZXZ29oRDVuMUhvOGVqWXZuS0ZMWkZyRE1jbkFGV1VC?=
 =?utf-8?B?QjJsRjdaWnpsUkxMaEc0OGQxTDA3WEFkdGgyMmIzb3NtdUFUV29RMGppZmNS?=
 =?utf-8?B?ZWdZMFlZZXpqOEZFaEsrSDUybm1hdzQ1bXlaRWh5VE10SFNLVVR1YTBPS2s3?=
 =?utf-8?B?OW4wMmpmZlArYXN2dXJBQ3huVUYyTXpueVlieHpIOVFHZTJxbytBQVFXSVN1?=
 =?utf-8?B?Wmd0REhLM3NGeExpdFFJOTd2SHhBWDgvS05wbnd3ZG4rbTh2YmtzSnBHK0l6?=
 =?utf-8?B?UVl2dmhoa0lPRnFucUNTemZTMmhqYWFQRU84bjlYanZNd2Rwa0gzRzdZVW5M?=
 =?utf-8?B?QmFpSDVtbyttNGs2VFJzY1RhSk5XMlBuY2wyQUVIQmVTRmtZL3lrTERYRDBJ?=
 =?utf-8?B?dXF3ZE5RMmNyWFVkWTkxSGd2VVMva0NLaHNUU29SaDZCVzh4M0xPYldncVdl?=
 =?utf-8?B?azhKaE9menNNWTVSWHY3d1VDTE9CS3ZuQ0E5YmdiV0JOOS9tbUt0ZTFWR2RF?=
 =?utf-8?B?b3JVb0tGVHlGdHFoTXJ3S3BIb2hVSUtOcXBnS1pDQVVNQTdGbndZMTdlVXdt?=
 =?utf-8?B?RGVKdmwxeGJFdk9OdXQvVm96K202SEFJWkRSeHE2U2ZKWnYvbUp4b0dmcHBU?=
 =?utf-8?B?MWN6UFU4bThGU0owdnVBemdvZy9WdklwMEkvcmt4RVBlSUlESkhGWFNoR0xo?=
 =?utf-8?B?VmF5UVBlWlVwOUlvbDVRSHQzVzNZVlpMdGVSNlh2MHRONElHd1NwWjBhbnRQ?=
 =?utf-8?B?ejRQSzdDaXNvdDFxLy9BK1F4aG9EbE40SkFIME0vaTBSWFROTHFKWnhRdytW?=
 =?utf-8?B?bkpFQkxMdUV2bjlPUFRheVFyVG96WW13dUU3R2VpVmx5RUt3YVl4OWRYTWdE?=
 =?utf-8?B?aUk3SVlJejVsNEQ4S0FMdlNTRnRhWkdmRGpwTUdDMEVLei8yWEo1TUc5RXpo?=
 =?utf-8?B?RUtyNEpHb28vdlNKcURISjF6R0t1WWdZMEVnRnV5eDVaSlUzVUpSaXZoS25F?=
 =?utf-8?B?NHMybDliSVB5cVl3V0VRaFZ4YWdRa2cxd2t4TWhJcUpUcXlCQU8rZkRjaFlY?=
 =?utf-8?B?ckZSKzFIcWZDdHoyT1hqSUFUclN6TWYwOXFRTk42Y0h2UnR0amNuNFFBdFJ0?=
 =?utf-8?B?c05jNXBZaW85OGJ1K3RDbjdOOFcxaTJPWmJpekl6RUVWSDlUZHl5QWNkTjdY?=
 =?utf-8?B?VGpDbWFZY0lYQmxJOG52Qko3bS9EUzUrdjlWaVZpdktiQzgrU1NacHFURklN?=
 =?utf-8?B?aTJVRDRFOEJyY1R4Q0pEcnFQUlppMW8rR1pwZFQ3c291K09HNDFrazNsQTdo?=
 =?utf-8?B?bmRKb0J5VlZDeUdwL0FMYSs4bElyQjdJSStyUnJybnJoYnIxOTBBR2JpL0Za?=
 =?utf-8?B?WC90WU43N1RWL1BxTVpIbGwyUXprNTJOL0dOQXN6a2ZFdWFvRGt4NzZuT3Zh?=
 =?utf-8?B?TzUyYTNmdS9WQTBNbUkzcm9qSG9oZkQweWxaQWxXRTM4eFFuemtINzJrOWdS?=
 =?utf-8?B?SVY5b2JQbnB0QThoMnAyYmN2WXNZdEdENUZybnY1Lzk0T2Y5WXV0NlF3R2x2?=
 =?utf-8?B?TWdoYXd3ZUtpbDhPT3l0TTUvWGlVbUhWRGN6Tjh6OVloTFVWK29oc3M5Wnhp?=
 =?utf-8?B?eklMamxMUWE5UWt1QkxlRHhHVk96OHppd2VYK0NRQ1NJeEZUdjczTGRGc1pu?=
 =?utf-8?B?enRkTzBqbkNrUXZ0ZzBsZUthaEpYa0oydEN0MmZmMUdYSE93QjI3RWtsRXZy?=
 =?utf-8?B?S2xDZ25zOE94N0dCM0RHcDYwamJmbzVVTGY3eTc2R0dEZmFHa010c1RaZU8z?=
 =?utf-8?Q?zNfpms6jmwLaeOWas49mJKvSn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf4dd16-1865-4368-23f0-08dbc190e6b6
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:40:29.7958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeH3+1E3NDzvS0d14TgeKDLPRijkvLou3nV2EJwR/Xp2UVbercThZu4P/yyy5r1bIDsFM3R/CyQJax8tWjp4Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7113
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, hdegoede@redhat.com, benjamin.tissoires@redhat.com,
 mario.limonciello@amd.com, linux-input@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/26/2023 10:38 PM, Ilpo Järvinen wrote:
> On Fri, 22 Sep 2023, Shyam Sundar S K wrote:
> 
>> PMF driver sends changing inputs from each subystem to TA for evaluating
>> the conditions in the policy binary.
>>
>> Add initial support of plumbing in the PMF driver for Smart PC to get
>> information from other subsystems in the kernel.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/Makefile |   2 +-
>>  drivers/platform/x86/amd/pmf/pmf.h    |  18 ++++
>>  drivers/platform/x86/amd/pmf/spc.c    | 118 ++++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/tee-if.c |   3 +
>>  4 files changed, 140 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/platform/x86/amd/pmf/spc.c
>>
>> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
>> index d2746ee7369f..6b26e48ce8ad 100644
>> --- a/drivers/platform/x86/amd/pmf/Makefile
>> +++ b/drivers/platform/x86/amd/pmf/Makefile
>> @@ -7,4 +7,4 @@
>>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
>>  amd-pmf-objs := core.o acpi.o sps.o \
>>  		auto-mode.o cnqf.o \
>> -		tee-if.o
>> +		tee-if.o spc.o
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 81acf2a37366..e64b4d285624 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -146,6 +146,21 @@ struct smu_pmf_metrics {
>>  	u16 infra_gfx_maxfreq; /* in MHz */
>>  	u16 skin_temp; /* in centi-Celsius */
>>  	u16 device_state;
>> +	u16 curtemp; /* in centi-Celsius */
>> +	u16 filter_alpha_value;
>> +	u16 avg_gfx_clkfrequency;
>> +	u16 avg_fclk_frequency;
>> +	u16 avg_gfx_activity;
>> +	u16 avg_socclk_frequency;
>> +	u16 avg_vclk_frequency;
>> +	u16 avg_vcn_activity;
>> +	u16 avg_dram_reads;
>> +	u16 avg_dram_writes;
>> +	u16 avg_socket_power;
>> +	u16 avg_core_power[2];
>> +	u16 avg_core_c0residency[16];
>> +	u16 spare1;
>> +	u32 metrics_counter;
>>  } __packed;
>>  
>>  enum amd_stt_skin_temp {
>> @@ -592,4 +607,7 @@ extern const struct attribute_group cnqf_feature_attribute_group;
>>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
>>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
>>  int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
>> +
>> +/* Smart PC - TA interfaces */
>> +void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>>  #endif /* PMF_H */
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> new file mode 100644
>> index 000000000000..08159cd5f853
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -0,0 +1,118 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * AMD Platform Management Framework Driver - Smart PC Capabilities
>> + *
>> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + *          Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> + */
>> +
>> +#include <acpi/button.h>
>> +#include <linux/power_supply.h>
>> +#include "pmf.h"
>> +
>> +static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>> +{
>> +	u16 max, avg = 0;
>> +	int i;
>> +
>> +	memset(dev->buf, 0, sizeof(dev->m_table));
>> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
>> +	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
>> +
>> +	in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>> +	in->ev_info.skin_temperature = dev->m_table.skin_temp;
>> +
>> +	/* get the avg C0 residency of all the cores */
>> +	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++)
>> +		avg += dev->m_table.avg_core_c0residency[i];
> 
> Is this safe from overflow?

Yes I think. Can you elaborate a bit more please if there a overflow
and I am missing it?

Thanks,
Shyam

> 
>> +
>> +	/* get the max C0 residency of all the cores */
>> +	max = dev->m_table.avg_core_c0residency[0];
>> +	for (i = 1; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
>> +		if (dev->m_table.avg_core_c0residency[i] > max)
>> +			max = dev->m_table.avg_core_c0residency[i];
>> +	}
>> +
>> +	in->ev_info.avg_c0residency = avg / ARRAY_SIZE(dev->m_table.avg_core_c0residency);
>> +	in->ev_info.max_c0residency = max;
>> +	in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
>> +}
>> +
>> +static const char * const pmf_battery_supply_name[] = {
>> +	"BATT",
>> +	"BAT0",
>> +};
>> +
>> +static int get_battery_prop(enum power_supply_property prop)
>> +{
>> +	union power_supply_propval value;
>> +	struct power_supply *psy;
>> +	int i, ret = -EINVAL;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(pmf_battery_supply_name); i++) {
>> +		psy = power_supply_get_by_name(pmf_battery_supply_name[i]);
>> +		if (!psy)
>> +			continue;
>> +
>> +		ret = power_supply_get_property(psy, prop, &value);
>> +		if (ret) {
>> +			power_supply_put(psy);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return value.intval;
>> +}
>> +
>> +static int amd_pmf_get_battery_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>> +{
>> +	int val;
>> +
>> +	val = get_battery_prop(POWER_SUPPLY_PROP_PRESENT);
>> +	if (val != 1)
>> +		return -EINVAL;
>> +
>> +	in->ev_info.bat_percentage = get_battery_prop(POWER_SUPPLY_PROP_CAPACITY);
>> +	/* all values in mWh metrics */
>> +	in->ev_info.bat_design = get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN) / 1000;
>> +	in->ev_info.full_charge_capacity = get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL) / 1000;
>> +	in->ev_info.drain_rate = get_battery_prop(POWER_SUPPLY_PROP_POWER_NOW) / 1000;
> 
> You don't need literal, use the defines provided in linux/units.h.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>> +{
>> +	int val;
>> +
>> +	switch (dev->current_profile) {
>> +	case PLATFORM_PROFILE_PERFORMANCE:
>> +		val = TA_BEST_PERFORMANCE;
>> +		break;
>> +	case PLATFORM_PROFILE_BALANCED:
>> +		val = TA_BETTER_PERFORMANCE;
>> +		break;
>> +	case PLATFORM_PROFILE_LOW_POWER:
>> +		val = TA_BEST_BATTERY;
>> +		break;
>> +	default:
>> +		dev_err(dev->dev, "Unknown Platform Profile.\n");
>> +		return -EOPNOTSUPP;
>> +	}
>> +	in->ev_info.power_slider = val;
>> +
>> +	return 0;
>> +}
>> +
>> +void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>> +{
>> +	/* TA side lid open is 1 and close is 0, hence the ! here */
>> +	in->ev_info.lid_state = !acpi_lid_open();
>> +	in->ev_info.power_source = amd_pmf_get_power_source();
>> +	amd_pmf_get_smu_info(dev, in);
>> +	amd_pmf_get_battery_info(dev, in);
>> +	amd_pmf_get_slider_info(dev, in);
>> +}
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index a8b05e746efd..eb25d5ce3a9a 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -113,6 +113,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>>  {
>>  	struct ta_pmf_shared_memory *ta_sm = NULL;
>>  	struct ta_pmf_enact_result *out = NULL;
>> +	struct ta_pmf_enact_table *in = NULL;
>>  	struct tee_param param[MAX_TEE_PARAM];
>>  	struct tee_ioctl_invoke_arg arg;
>>  	int ret = 0;
>> @@ -123,11 +124,13 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>>  	memset(dev->shbuf, 0, dev->policy_sz);
>>  	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
>>  	out = &ta_sm->pmf_output.policy_apply_table;
>> +	in = &ta_sm->pmf_input.enact_table;
>>  
>>  	memset(ta_sm, 0, sizeof(struct ta_pmf_shared_memory));
>>  	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER__ENACT_POLICIES;
>>  	ta_sm->if_version = PMF_TA_IF_VERSION__MAJOR;
>>  
>> +	amd_pmf_populate_ta_inputs(dev, in);
>>  	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER__ENACT_POLICIES, &arg, param);
>>  
>>  	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
>>
> 
