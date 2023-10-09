Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E787BD2C9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 07:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C53510E0B4;
	Mon,  9 Oct 2023 05:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E89610E0B1;
 Mon,  9 Oct 2023 05:20:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ez1HLGb7AQMUdCT3HWabviqCizDyO55D9fqdsPgtEWPc+NFzs7JVeojq0KfnOJWL9eOQHLjLWl0Uc+IvasF33C8tvHYhpF6SIOmPHXu1Kc93IIk10AYTnPbrfdI9mONU/xNlP79Wz8oUeKerPG931Pote+NgUpQH0l1wcNlFuH79uL5tpAI6F8zkByi0BPdSn6i3UP6bjD7tDJQn4D7TPA1iWCihUyoDf9Pg/JsMTR03aOIFXliLjCBqUj8Ta3CtMm4cvouzm1FEYRChlt59D764v47aLION9yb8C7CjxSXN+d1YXPd98LbU0sdLBFX0/FGwmK1SfV1tUla/XoIurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7s0Piv5Bl1q24y4BD9A8+aNRCsmOgkculd2LwAOpjis=;
 b=b3/fDEnpCPhg54dzU4j90FR42w1x6YkOjUdxnoK/2DwiYx4DLKZilZbY0hUBGJTgu1PbZfVl1SBAu35Zb9Z7IG8wsvA1u9lMz+w41YOC+UNYXnXfqpycGK/i9M88VQynqit+QAkiblZZWk3E3Hs3G46z0AGlPDSqnd6DDEqfwYjdRqkRMld0wsisiP3p5omtnwKx8JqZ8Dw2AoY9ezZ677HaBl/u1MywZuSSzbuxa/Xa4u1x8M+VxSjPnTO9mWIokllp78gM+ZMkwUWuLsNPLzMhpNEzQYgRHrFYi0K8VN+Qr2zIkp5YcUYb0XMeVUuGCgG6dS0Y4XbL4Oca8IDVNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7s0Piv5Bl1q24y4BD9A8+aNRCsmOgkculd2LwAOpjis=;
 b=ROcgnraC0biKTx92v23PDluzUonG5MqoBYNmlCw9TyzaGiUmJ+0V0k1yGLzJ5wVvunwBSzCGHcIv0o6VzLk5JqKVV5s6kGbxGXrtbPxxeiGvuq/7yqd4P2NL/fVWdhjr9EedJFSSVdroysVVVPLIUsLTlkZqn541dJffnwBGhu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA0PR12MB8325.namprd12.prod.outlook.com (2603:10b6:208:407::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 05:20:17 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 05:20:16 +0000
Message-ID: <61840843-8cb6-4353-a92c-befc46960fad@amd.com>
Date: Mon, 9 Oct 2023 10:50:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] platform/x86/amd/pmf: Add support to get inputs
 from other subsystems
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
 <20230930083715.2050863-7-Shyam-sundar.S-k@amd.com>
 <2eb2b3e5-4849-10ec-1c1b-66d2f0ba561@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <2eb2b3e5-4849-10ec-1c1b-66d2f0ba561@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA0PR12MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c85f0d6-35e4-4583-b65c-08dbc8876c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j9cr8nZdlVpTV0MsCKB96CcM9T0oETnomrbfsbib/Bh3kaaf12QSkl43R2rOZjlFzeBWIHUzrcz+nQJutdz+mz61vzp94bF8WjJQP67J6IMSssCWGUQL9xxHPbgmgP/IBSbahVwOZl+EObwcxIN0PwA5ShkB0MHf+WMxQBFbnGIR3x5gvO+Z332NRG1uHWXStggg9FZqIhtPXTuMvsPcY4PehwPadv3k9l93KK8pKhKR4e2YdO7mVT8JO9zt7nznhXBbk03aCVKNL0OCx0P/c3JCascSx8zhvRPXD7HIn2LIbYowIoZX8g8GZ7pcwFraiEJcDeDOZcDugBlP55pyJVUXNwVS3Jb5wOC4eIOHjPANl2O60ph0OdxRubpEyeDFueIal0upTSqEBaCdLZ7dlYHSb2DWaIRVklX+4ED7mGe5REa4ZR7dXT/feXYulKFIRxadA4rVKnXIKy2EO3jhrhUl1fEDdLfTFseWym5/XgCAeUQBjlr/IfXoUb0bPCMSgPJe6lrjVvKGXhYhimQ/SxMAPnDf+DDLNl/XezVyZ3ykPdwGziDIYbD58qmiOkbYWy0GhnKBUWBG225fYfIsI72LTxcLT35zw15IiiG/GMYYz/Kag1ZFr06d4Y0fXczOnsLNoPXQD+S1XtfN30B/rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(376002)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(2616005)(26005)(66574015)(66946007)(66476007)(66556008)(316002)(6916009)(7416002)(8936002)(8676002)(4326008)(5660300002)(41300700001)(6506007)(53546011)(6666004)(6512007)(2906002)(6486002)(478600001)(36756003)(38100700002)(31696002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW9kTVB3c0Y1TG0xQ3Fnc0VKUnpyWGhpWHI2M2xQMEY5STg2R3lKRmVDdm12?=
 =?utf-8?B?b0ExcG8vbGZJYmpEdUc3MHpHNktPNEVuTEd0c2s0b3kycDNsK0k4dTVvRkYz?=
 =?utf-8?B?TFlnVThiK2J2M1VQampiVEJ5b0t1K3RwNGpDclhLWEFxQ0ZMbThNQ212T1Z6?=
 =?utf-8?B?UVRia1NoRG5QcE1jWFdZcWczUERJNmdFQkRKeXFFNC9PZnl0a2xrVHRGZStn?=
 =?utf-8?B?RXVrMitPY2VGSnN4WVNvQ29lWXR6ZjNUam93MzVycU40OGdIQXhvT2dPYkZZ?=
 =?utf-8?B?dTkzRno0T1UvL3NJamtHWCtxU1lWRzRHY1ptak5lQnR6RDdOaUVDKytVY1FM?=
 =?utf-8?B?R1NhTTczeVdIVDErYWgwMGw1QnFRZ3JiUm5Ld3owTWVIQXFNMFJWdkc4L3Ar?=
 =?utf-8?B?M0lycVBvSGJTbGRmZ2VHZFJ0RXpYOTI5Ty9kaW1TQnUxV1hyc2JRcGs4ckFM?=
 =?utf-8?B?Wm0xNW9KZTIyamhyeE9UVXNqT1JrRnJyeEV4QXlVbkpFNG9hUVR6WGpmSXF3?=
 =?utf-8?B?VjhUVkY5MlBxdS9YOFBvMHNaeG1lMXN5dXRKTk1tUzlVTEdkYjZkM1k0MEtN?=
 =?utf-8?B?bFFpU1BDZEJBaHZKUmhGb2kzc2RDMkNFZjZpWDNuRFpjMm40UjhNVkpaUWdC?=
 =?utf-8?B?ZVlIR1lja2E0Q3lSeDM0ZVpCY015TENrT2NXcFdBd1g2elBvT0JVNm9RbWtr?=
 =?utf-8?B?bXVQdXgzNzAwbWFyY3FNaW0veWtuU2s4Rmo1SGdYdFkwTFFkQXU1L25IQzRt?=
 =?utf-8?B?cVB2Y0dPM2dTaWJHOGJKVmZUQ2xOZDVXQ0dwSGNKdmw0OW5aK0c0TURiWDZ1?=
 =?utf-8?B?ckZpQW8yekVVUS9uQ094Z1YvUWFFYmN1T3ZvRkN4QlBwaGlZQXdZSWxleUhn?=
 =?utf-8?B?VVVpV0N0NEVHL0o4ODNydndnZ3UyQ1FYVDdTYXV1Q0EwQ204cVJ1RW85aFhN?=
 =?utf-8?B?M3NZaDYzcnNWZ2V6U1dFSnpJTFkvcGN3TjlwTzZrYlFEZG1WUjVDQTZjaUlv?=
 =?utf-8?B?aUMwclBzWUpIQ0tObzdZa0tQS2pabm45L0xYTnRDdGVidTlOU0NSbm1UV21l?=
 =?utf-8?B?WlVUb1c5a3NqTE1td1JTM01mRjc0YTlXTVJ6Q1kwZFk4U3pCd0ltN1JZQ0Rj?=
 =?utf-8?B?K1hHeHFXRjlxc3ptZTB6T2hUdFBnSVcrVk9DbzNoN3ozWEs4alVQZnBiWmxN?=
 =?utf-8?B?NTRpMzlnNjJpOFpoUDI5Wjg0ZkZQcTdncG9nd0lNQXNBSk5uZXdiZXlneVcx?=
 =?utf-8?B?N01qNW5GSzNDbXp4alVzWER3VGw3bzFNWWZKdHViYlFVSnEyN3NaaGVhb3JJ?=
 =?utf-8?B?WXVZVUx3a3JTQlYxRit6cVBwUmNlN1FjOGhEVTdpUklVSW1Za0lQN1N0MU5o?=
 =?utf-8?B?alVTbTFBNHNEM1NSdWhrQTFjZCtSN0w0NjlOYllsWG1kT2swRFJvT2p5ZXd0?=
 =?utf-8?B?ZkZTNDhtWGVad0Q4N0VvZ2N5aHZSZTB3RHJUOGhNZWZqTnFwaSsvak1TM1hH?=
 =?utf-8?B?UG4wZWR5dC96Tm5qSGl0YnNDMFNXVUVzRWJQUFBXNkwxNGRrdnZkSG9WdDlW?=
 =?utf-8?B?ZC83N09OcmZEaHVEOTI2OVdCaStpOU0xU2hsY0pJTFo0K3YxYU1MVXE0QWVZ?=
 =?utf-8?B?Vmh0U04yeHNSMXZjY2JsM2xuM0JOZzJJMzg5SnhxU3Z0cm8ra0Y3dzM0SHZy?=
 =?utf-8?B?NEhtdmJiT3NsWExPdnV6K3UxZTFTOHF6cXUyMDN6blFCWHBtOWhvd3JLQmh1?=
 =?utf-8?B?Um1zWTZPTWlzelU2ck5TMXJHMXgwSUljWXZBMnlOMDBmYXpiZnR3MTV2TWEy?=
 =?utf-8?B?RVNJdGVEWGFOamc4RVltQ0dpQko2UWR0c1dHdlpYSExCTmVJS1hRWUJjOFd0?=
 =?utf-8?B?VVFqQVM4cnp6TkdDUzVyeForWEFuR2NZTkJhRDd1MisvVWRWYXZIdDNuZDBD?=
 =?utf-8?B?NGxhbjA4dFNDMTNSUDBuQ2xFWk5SdkVBVTd1MkZ6cUN5aWVZaHRldFgwTm1T?=
 =?utf-8?B?LzNwSWFBQUhrM1NWa1R1bjZGUlV6bXRTQlNVeUIyTllkWjhSVkN1Q05FK2xl?=
 =?utf-8?B?VWVwM3Fpc0NsckVmb3l6WE0wclpLOHJTMDZBSXFZTmYzdEFCaHNEWjhaMjZX?=
 =?utf-8?Q?5xwBwChFs6rGBOWquBkjp+Wof?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c85f0d6-35e4-4583-b65c-08dbc8876c0a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 05:20:16.5158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Og7Z1AAvZpE93XRRLYdLA0x2So5j5TedEHcY8OmI1ZZOQJ7Wizyuny2GodS9bSZPgJIoR+jHQQwo7gz4LLa4AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8325
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
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/4/2023 5:44 PM, Ilpo Järvinen wrote:
> On Sat, 30 Sep 2023, Shyam Sundar S K wrote:
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
>>  drivers/platform/x86/amd/pmf/spc.c    | 119 ++++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/tee-if.c |   3 +
>>  4 files changed, 141 insertions(+), 1 deletion(-)
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
>> index 6f4b6f4ecee4..60b11455dadf 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -149,6 +149,21 @@ struct smu_pmf_metrics {
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
>> @@ -595,4 +610,7 @@ extern const struct attribute_group cnqf_feature_attribute_group;
>>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
>>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
>>  int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
>> +
>> +/* Smart PC - TA interfaces */
>> +void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>>  #endif /* PMF_H */
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> new file mode 100644
>> index 000000000000..3113bde051d9
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -0,0 +1,119 @@
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
>> +#include <linux/units.h>
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
>> +
>> +	/* get the max C0 residency of all the cores */
>> +	max = dev->m_table.avg_core_c0residency[0];
>> +	for (i = 1; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
>> +		if (dev->m_table.avg_core_c0residency[i] > max)
>> +			max = dev->m_table.avg_core_c0residency[i];
>> +	}
> 
> My comments weren't either answered adequately or changes made here.
> Please check the v1 comments. I hope it's not because you feel hurry to 
> get the next version out...
> 
> I'm still unsure if the u16 thing can overflow because I don't know what's 
> the max value for avg_core_c0residency[i].

the highest value for avg_core_c0residency[i] is merely a small number
and hence I retained the avg variable as u16. Not sure if there a
'real' case where it can overflow.

Sorry, I missed to merge both into a single for loop. I will address
this in v3.

Thanks,
Shyam

> 
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
>> +	in->ev_info.bat_design = get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN) / MILLI;
>> +	in->ev_info.full_charge_capacity = get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL) / MILLI;
>> +	in->ev_info.drain_rate = get_battery_prop(POWER_SUPPLY_PROP_POWER_NOW) / MILLI;
> 
> There are defines specifically for watts so you should use them rather 
> than generic MILLI.
> 
> 
