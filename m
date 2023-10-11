Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF87A7C4858
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 05:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E3910E3E7;
	Wed, 11 Oct 2023 03:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8979010E3E7;
 Wed, 11 Oct 2023 03:17:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSVStiruGpkrppSlraqazs6mZm3OBl/M6f8/W2aAPu4ZHtZvGHrMgNNBEhwl+VvUOMo4YtUpTIULuYeC9eBd1FmQUg6DLuAZp49cCcOMUIgd+bCFc31e6w0UskmwWxoXpXrnsi8ooTzdyMcpotkxUW/jgJloKPms2EFQ3ct96I8n4x5sWaNskoIqPFnCgfadjsCZ9P+wA8wrZShEiNrAKm46nXlaYGxI1S5mqwSQZ8sTnLYvO8zyyvZjQhqHGXIA4G5P99/04bxu35hitu4CwqwXTTlveSHHrdwzvfPwfWpZX5Khrky8UApNNVnV8znG6ayC9OoQTBVtucqYnGn6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5WUQCSI/TE7QWG1AAnxR2GJaH2TYr8heqbX5r6QzDo=;
 b=B5SA62icQekHyvw03M+IRb4uIKl/9laErypllm7x+IYorigzxk44S8WLlwkgRvccTaBQ2LRvHLv8woEY78+1MnX90wGSWNa4AiVKI+UxiGA/enW6vAod49PkbLZAbLVEnMvR/nnk6qMreZd6gsWSgkvwk7vI+VzH6oElo8l8l0GsiSlXv0zU3W++T9HB7Cmbefh6CCtGNlUlSWMbyNTrtoxCxHAY6GEUn2famy15peIwoula80wLURRrhbm7IqjyS/VeRVOgywGo89l1LOh2wqjXR6/n6D216CZuyCQ1npeNOfTDPqmfGhmayPKhBD5k0XSKNgsGmjOird7mtXkLMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5WUQCSI/TE7QWG1AAnxR2GJaH2TYr8heqbX5r6QzDo=;
 b=wEygTDxvtDSVvVlpp+I3v61oMK8jgpwgv2pRh53Cefgw/Qyvj3A9ixAZTOybSaTwzLVKPSOFQmodX23uP3jnAzVkmnVphzJuWXZ6w9RRqduZq2Gwj0SRmX3+NNySp7nkYED6nNpE0wsr+NRA+/bn4Sl2TikLRkOsTfUcIDt2H1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH0PR12MB8799.namprd12.prod.outlook.com (2603:10b6:510:28e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Wed, 11 Oct
 2023 03:17:46 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 03:17:46 +0000
Message-ID: <55a1230c-e9ef-421e-930c-13f5016546b4@amd.com>
Date: Wed, 11 Oct 2023 08:47:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/16] platform/x86/amd/pmf: Add support for PMF Policy
 Binary
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
 <20231010125917.138225-5-Shyam-sundar.S-k@amd.com>
 <db29fe6f-1ac1-4e8f-9f77-f3569c503a76@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <db29fe6f-1ac1-4e8f-9f77-f3569c503a76@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::16) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH0PR12MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: 445147df-7ff7-4a87-0838-08dbca08a3d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +pI3eek2WwHxS4eVH8FE58JpvLkrMBbO27muUoCoIjn6v3MCxRhy6wCZ9ApFFy25yq5Bi867X+KnA9d0T80o1ebIe0yAGE3q9ihA4UrpvEoYche/XXMLYPqcUdno4+PQFEypCPx5+5JmSBUhNXTbcFghVEH8eETD8KgpTuuqnAVXdX7jyNWw2++AscB1pSWjcEythFhkEu54OS8jXfkmStUoE4lXQTfKZPPGWiMD4ChOQIepXOgqTEOd4OLQEO/Xj98QWk0tzXXz1wCgXBoCnqXUJhFgXRz19WXpy0kwDiRO03u2z3gx+6jn1NxEq5mPWkb/IL0n27T6XZsD5TjFAqrwHrvv3oAZddo16VIhppX+FGo7DtcUJHrViWlHFHz+1mKiI0TWA3yS/TUQQrTWk/gG4TPE/mJYDTbKEa9ZL5E/EzpwZxn8DDnaCDWLGpey8SuT//NTcobURirKyEBWW/9Y1uMyWkCbwqluiK/Eo/D1PU3QRa+do3v9aRt1rzQTu9j15EqPkddQ8xNoLjGuJJYj68iiWxiXdTwTiSjk9HleDryaKSVLn0RK47hcUka/DDbzuT1sdBxN4KSgvs18km1uMSowvFEFOIc7JK3FZD/oNfL1w2cCi8nkQuJfsrEcDVB+AeRPfojOfLpkvMZ1CoxQkgViQCtm+vhYrhiz90w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6512007)(6506007)(53546011)(2616005)(478600001)(30864003)(41300700001)(316002)(6486002)(7416002)(2906002)(8676002)(5660300002)(66556008)(4326008)(66946007)(83380400001)(8936002)(26005)(921005)(31696002)(36756003)(66476007)(38100700002)(86362001)(6666004)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVlyb0xiMmp6Sis5Z1pEbmx6dnpRd1l2YlpUYnZmWFFyNnhqKzIrY1NldlhM?=
 =?utf-8?B?WkdJWDkxaEFXdU9DbWp0Wk5SZ3hVUWJZdEFXUThDRUJQOTU2R1NnbEpFQ25J?=
 =?utf-8?B?bmhkZjRNdlVNdUNZbDNrMUpuVUNGYm51VlBPUHVWRnpVTlNCbTRDcjdnWTll?=
 =?utf-8?B?Z1l5L0liZitlWDYzeDQ1Q1o2aUpPc3FFNCtja2IzU29UUnJtYWttRzJMS3pi?=
 =?utf-8?B?RVdEUTV6cmZEVHFiQWIzV2YyQ1ZYRCtiVGYrSUhOa2xmS1dqbndycGpFRy9C?=
 =?utf-8?B?MjNZaGJMREtmWDhLSWtFZ0ZQNEl2UTFiUWwzd2xxOGZ2WnJMYXp2c3lJSGdw?=
 =?utf-8?B?UVVWQzY1VzFCUFZKNG1oNUJURmxkUTFwbVVkdXdRU010bnY4UWdVWGZNZFlH?=
 =?utf-8?B?dVU5TVkxaWZzY1A3T1U5V0U3ZVJqUUt4bGYzSUJicVpRMmM3WkJMdFNnc3JW?=
 =?utf-8?B?TUN5U3pKcXFoZ2IyZyt3eldWYUN5M1JTcXUwaHNjWVVNTUpZejV0d3R1b0tT?=
 =?utf-8?B?WVlRMGhCSEh4LzNtbWFkSzFXRTFQMTFYQk83c0p2eHJmMW80eGJIOHhpOFRz?=
 =?utf-8?B?Vm1nWUVmbjdHZVJMelZaRExaZTNHZDVDV2FRVFRPQmZ3Rm85ZWRqZ3BPbUVw?=
 =?utf-8?B?MXNJSGFCZjgrRFdtVzN2ZWFHdEhqbkJvcnJyanNwekg2TXc4SzZsY1cvUEhE?=
 =?utf-8?B?NjU5aHlVdU9xMmtsRjNPWlc2T2FzNWRKOWRPcjcvUWMrcDNNK0ZENU5vNmhp?=
 =?utf-8?B?OXBHczVpV21GOHZzam9iT1VwME5lL00rekVKbVEzZjdXYlUvbDl6MjkvQlBm?=
 =?utf-8?B?S05WMzh1a1VrZzdNMlZTM1BjQ291bmVWU1Ird0U2L2RaZmRMNTZwTEpYUEtq?=
 =?utf-8?B?S1licktyL3Uwck04MTFCdzNZbS90ZXhTek03N1A1VXhIWG0yWDhrTnpNdEFW?=
 =?utf-8?B?Q2d5ZU8zeDBXLzM5NTV1b2xMcVpicE93a3liakJ1aGJyU0dHZEZlRUpLNkpG?=
 =?utf-8?B?dnp6MTVseVBmZUEvbmUxWThjT3l4L0FwYTdRZHZnc2tRM0lEMnY1QzgwUzVZ?=
 =?utf-8?B?N2NwTTZJWGdDMEZ3R055RTd6TVNlREdYWWZOR0pVTWtxSnprTW9KZHFuQ1hE?=
 =?utf-8?B?cVhVZ2lySHM2TnBCL0RhQmpiNnhzQUZ1a3VvYnh1K3BUcnYzNU9RMXVvdzlC?=
 =?utf-8?B?UGJjQWd4RFN6dTVnRTRRWi9LOTJGM1Y5UWlGTzFOK2QwVFpBRkV1M3N1N3BX?=
 =?utf-8?B?RnZjQ1ZMR2xjTWpZUXU4OGJ2Q1RKTkhCc0dRT2lMR1YvaUN5bEllT09lSE9r?=
 =?utf-8?B?R2RZOXMzY2FmaGlTTGFlVVFrRmRZV2FTbndkMGFDdTQ3cDFGRUtDOUJOSEVa?=
 =?utf-8?B?NDFGSGZhbDE2TG51RkxPNlZkL3RTcEs5Wm94TExIUWlXTWNPQ1dlb2xEdUhT?=
 =?utf-8?B?Y0FoUjNST3NLS2ZESTZPT3FBcDFBVHRNMFVCbzI0WUFFWVA1Zy8zQ3JQaTB2?=
 =?utf-8?B?YW1uVm1FaDA5alhxTWhUdzg4WGQySWhHdUgwTzNLelhSN2xtNCtnejZkVVo5?=
 =?utf-8?B?VXBEOVoycDlPNDV0SzFFTnYvQUVKSGVGc1lrdUkydThDcmR1bDNCa250Q0pi?=
 =?utf-8?B?QjZXTDNRNWZIbllOV084MjFhZzBaMy9mSXhEdUhwUnphUCtjQThGWTFCUXpV?=
 =?utf-8?B?R0FnMmU2WThYakNvUHRaVlVvYnVmUXJaNnl2djQ2U1Q3NVh3WVR4UnlOQnVz?=
 =?utf-8?B?Tkt3UW9ET09YaU1LeTV4RC90eDRTT1licDZwZEh5aWVyV0dlZXdsM2dlTTNi?=
 =?utf-8?B?Z3RUSDFZNFhQakYwZkFrb1VMR3g0bWJHUTRucFU2SnN6UFNSWGhFRWNCSmhU?=
 =?utf-8?B?L05HZnZTdG8wWWdVektTL3p4eVVRdWxrOFlLSGFFKzZiK1c0cmhjcjRvMWIv?=
 =?utf-8?B?NGxlQUYrS0w2eDRIOENZdjZwRjc2bkkralp2ZUx0OThaRVFlb1pScjBrUmJX?=
 =?utf-8?B?ZlBCbXZBWnVmNFFLK3o5Qnd3SEcwK2lHY2FPa1RjdGJYdmoycmxwVGlxVHo0?=
 =?utf-8?B?ODNzSG1OOWVMZWhBaGVkeWVOM1pBaTY1NDdHVGdMWVpOVC81Tnl0M1IzU2th?=
 =?utf-8?Q?04IPRRabu0JDCeYEGp42P3/0c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445147df-7ff7-4a87-0838-08dbca08a3d4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 03:17:46.3423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wc3ffPTiYNFW+An8Z0XyfyuDmMQZmQ7u+mviciONk9CdWQqLzCe/D3eERfH11UoedPqMFHWzbBIWAdYdw9Z+Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8799
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
Cc: dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Patil.Reddy@amd.com,
 platform-driver-x86@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/10/2023 9:56 PM, Mario Limonciello wrote:
> On 10/10/2023 07:59, Shyam Sundar S K wrote:
>> PMF Policy binary is a encrypted and signed binary that will be part
>> of the BIOS. PMF driver via the ACPI interface checks the existence
>> of Smart PC bit. If the advertised bit is found, PMF driver walks
>> the acpi namespace to find out the policy binary size and the address
>> which has to be passed to the TA during the TA init sequence.
>>
>> The policy binary is comprised of inputs (or the events) and outputs
>> (or the actions). With the PMF ecosystem, OEMs generate the policy
>> binary (or could be multiple binaries) that contains a supported set
>> of inputs and outputs which could be specifically carved out for each
>> usage segment (or for each user also) that could influence the system
>> behavior either by enriching the user experience or/and boost/throttle
>> power limits.
>>
>> Once the TA init command succeeds, the PMF driver sends the changing
>> events in the current environment to the TA for a constant sampling
>> frequency time (the event here could be a lid close or open) and
>> if the policy binary has corresponding action built within it, the
>> TA sends the action for it in the subsequent enact command.
>>
>> If the inputs sent to the TA has no output defined in the policy
>> binary generated by OEMs, there will be no action to be performed
>> by the PMF driver.
>>
>> Example policies:
>>
>> 1) if slider is performance ; set the SPL to 40W
>> Here PMF driver registers with the platform profile interface and
>> when the slider position is changed, PMF driver lets the TA know
>> about this. TA sends back an action to update the Sustained
>> Power Limit (SPL). PMF driver updates this limit via the PMFW mailbox.
>>
>> 2) if user_away ; then lock the system
>> Here PMF driver hooks to the AMD SFH driver to know the user presence
>> and send the inputs to TA and if the condition is met, the TA sends
>> the action of locking the system. PMF driver generates a uevent and
>> based on the udev rule in the userland the system gets locked with
>> systemctl.
>>
>> The intent here is to provide the OEM's to make a policy to lock the
>> system when the user is away ; but the userland can make a choice to
>> ignore it.
>>
>> and so on.
>>
>> The OEMs will have an utility to create numerous such policies and
>> the policies shall be reviewed by AMD before signing and encrypting
>> them. Policies are shared between operating systems to have seemless
>> user
>> experience.
>>
>> Since all this action has to happen via the "amdtee" driver, currently
>> there is no caller for it in the kernel which can load the amdtee
>> driver.
>> Without amdtee driver loading onto the system the "tee" calls shall
>> fail
>> from the PMF driver. Hence an explicit "request_module" has been added
>> to address this.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/Kconfig  |   2 +-
>>   drivers/platform/x86/amd/pmf/acpi.c   |  37 +++++++
>>   drivers/platform/x86/amd/pmf/core.c   |  13 +++
>>   drivers/platform/x86/amd/pmf/pmf.h    | 136 ++++++++++++++++++++++++
>>   drivers/platform/x86/amd/pmf/tee-if.c | 146
>> +++++++++++++++++++++++++-
>>   5 files changed, 331 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig
>> b/drivers/platform/x86/amd/pmf/Kconfig
>> index 32a029e8db80..f246252bddd8 100644
>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>> @@ -9,7 +9,7 @@ config AMD_PMF
>>       depends on POWER_SUPPLY
>>       depends on AMD_NB
>>       select ACPI_PLATFORM_PROFILE
>> -    depends on TEE
>> +    depends on TEE && AMDTEE
>>       help
>>         This driver provides support for the AMD Platform Management
>> Framework.
>>         The goal is to enhance end user experience by making AMD PCs
>> smarter,
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c
>> b/drivers/platform/x86/amd/pmf/acpi.c
>> index 3fc5e4547d9f..d0512af2cd42 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -286,6 +286,43 @@ int apmf_install_handler(struct amd_pmf_dev
>> *pmf_dev)
>>       return 0;
>>   }
>>   +static acpi_status apmf_walk_resources(struct acpi_resource *res,
>> void *data)
>> +{
>> +    struct amd_pmf_dev *dev = data;
>> +
>> +    switch (res->type) {
>> +    case ACPI_RESOURCE_TYPE_ADDRESS64:
>> +        dev->policy_addr = res->data.address64.address.minimum;
>> +        dev->policy_sz = res->data.address64.address.address_length;
>> +        break;
>> +    case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
>> +        dev->policy_addr = res->data.fixed_memory32.address;
>> +        dev->policy_sz = res->data.fixed_memory32.address_length;
>> +        break;
>> +    }
>> +
>> +    if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ ||
>> dev->policy_sz == 0) {
>> +        pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
>> +        return AE_ERROR;
>> +    }
>> +
>> +    return AE_OK;
>> +}
>> +
>> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>> +{
>> +    acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>> +    acpi_status status;
>> +
>> +    status = acpi_walk_resources(ahandle, METHOD_NAME__CRS,
>> apmf_walk_resources, pmf_dev);
>> +    if (ACPI_FAILURE(status)) {
>> +        dev_err(pmf_dev->dev, "acpi_walk_resources failed\n");
>> +        return status;
> 
> You're returning acpi_status here, but the return for the function is
> int.  It "happens to work" but I think it would be better to do
> something like:
> 
> dev_err(pmf_dev->dev, "acpi_walk_resources failed: %d\n, status);
> return -EINVAL;

OK, I will change this.

> 
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>>   {
>>       acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>> diff --git a/drivers/platform/x86/amd/pmf/core.c
>> b/drivers/platform/x86/amd/pmf/core.c
>> index ffb78e9709d9..96a41e7d4e7d 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -395,6 +395,19 @@ static int amd_pmf_probe(struct platform_device
>> *pdev)
>>           return -ENOMEM;
>>         dev->dev = &pdev->dev;
>> +    err = apmf_check_smart_pc(dev);
>> +    if (!err) {
> 
> Rather than just failing to init smart PC solution builder, shouldn't
> you fail probe entirely if an err is set from probing the BIOS
> resources?  This seems fairly fatal.
> 
> For example I'd think that setting up static slider is relatively
> pointless on a system intending to use smart PC solution builder if
> smart PC solution builder isn't working.
> 

What if - the BIOS advertises the smart PC bit and forgets to add
resources (or a buggy ACPI thing)?

Atleast that way if the static slider is enabled, atleast some amount
of power saving can happen.

Note that, I have tried the fallback to static slider if the smart pc
fails and that's working with the current we have in place.


>> +        /*
>> +         * In order for Smart PC solution to work it has a hard
>> dependency
>> +         * on the amdtee driver to be loaded first even before the
>> PMF driver
>> +         * loads. PMF ASL has a _CRS method that advertises the
>> existence
>> +         * of Smart PC bit. If this information is present, use
>> this to
>> +         * explicitly probe the amdtee driver, so that "tee"
>> plumbing is done
>> +         * before the PMF Smart PC init happens.
>> +         */
>> +        if (request_module("amdtee"))
>> +            pr_err("Failed to load amdtee. PMF Smart PC not
>> enabled!\n");
> 
> Did that softdep thing Ilpo mentioned not work for modprobe? 
> Hopefully that generally works for everything except the insmod case
> so this code path is unlikely to be hit in the wild.
> 

unfortunately no. Hence that's the reason I had to retain back the
request_module() here.

>> +    }
>>         rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>>       if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>> b/drivers/platform/x86/amd/pmf/pmf.h
>> index a91c22d9b532..51c0e17f7720 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -14,6 +14,11 @@
>>   #include <linux/acpi.h>
>>   #include <linux/platform_profile.h>
>>   +#define POLICY_BUF_MAX_SZ        0x4b000
>> +#define POLICY_SIGN_COOKIE        0x31535024
>> +#define POLICY_COOKIE_OFFSET        0x10
>> +#define POLICY_COOKIE_LEN        0x14
>> +
>>   /* APMF Functions */
>>   #define APMF_FUNC_VERIFY_INTERFACE            0
>>   #define APMF_FUNC_GET_SYS_PARAMS            1
>> @@ -59,8 +64,21 @@
>>   #define ARG_NONE 0
>>   #define AVG_SAMPLE_SIZE 3
>>   +/* Policy Actions */
>> +#define PMF_POLICY_SPL                        2
>> +#define PMF_POLICY_SPPT                        3
>> +#define PMF_POLICY_FPPT                        4
>> +#define PMF_POLICY_SPPT_APU_ONLY                5
>> +#define PMF_POLICY_STT_MIN                    6
>> +#define PMF_POLICY_STT_SKINTEMP_APU                7
>> +#define PMF_POLICY_STT_SKINTEMP_HS2                8
>> +
>>   /* TA macros */
>>   #define PMF_TA_IF_VERSION_MAJOR                1
>> +#define TA_PMF_ACTION_MAX                    32
>> +#define TA_PMF_UNDO_MAX                        8
>> +#define TA_OUTPUT_RESERVED_MEM                906
>> +#define MAX_OPERATION_PARAMS                    4
>>     /* AMD PMF BIOS interfaces */
>>   struct apmf_verify_interface {
>> @@ -183,11 +201,16 @@ struct amd_pmf_dev {
>>       bool cnqf_supported;
>>       struct notifier_block pwr_src_notifier;
>>       /* Smart PC solution builder */
>> +    unsigned char *policy_buf;
>> +    u32 policy_sz;
>>       struct tee_context *tee_ctx;
>>       struct tee_shm *fw_shm_pool;
>>       u32 session_id;
>>       void *shbuf;
>>       struct delayed_work pb_work;
>> +    struct pmf_action_table *prev_data;
>> +    u64 policy_addr;
>> +    void *policy_base;
>>       bool smart_pc_enabled;
>>   };
>>   @@ -399,17 +422,129 @@ struct apmf_dyn_slider_output {
>>       struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>>   } __packed;
>>   +/* Smart PC - TA internals */
>> +enum ta_slider {
>> +    TA_BEST_BATTERY,    /* Best Battery */
>> +    TA_BETTER_BATTERY,    /* Better Battery */
>> +    TA_BETTER_PERFORMANCE,    /* Better Performance */
>> +    TA_BEST_PERFORMANCE,    /* Best Performance */
>> +    TA_MAX,
>> +};
> 
> The comments above at end of the line don't add any value.

OK.

Thanks,
Shyam

> 
>> +
>>   /* cmd ids for TA communication */
>>   enum ta_pmf_command {
>>       TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
>>       TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES,
>>   };
>>   +enum ta_pmf_error_type {
>> +    TA_PMF_TYPE_SUCCESS,
>> +    TA_PMF_ERROR_TYPE_GENERIC,
>> +    TA_PMF_ERROR_TYPE_CRYPTO,
>> +    TA_PMF_ERROR_TYPE_CRYPTO_VALIDATE,
>> +    TA_PMF_ERROR_TYPE_CRYPTO_VERIFY_OEM,
>> +    TA_PMF_ERROR_TYPE_POLICY_BUILDER,
>> +    TA_PMF_ERROR_TYPE_PB_CONVERT,
>> +    TA_PMF_ERROR_TYPE_PB_SETUP,
>> +    TA_PMF_ERROR_TYPE_PB_ENACT,
>> +    TA_PMF_ERROR_TYPE_ASD_GET_DEVICE_INFO,
>> +    TA_PMF_ERROR_TYPE_ASD_GET_DEVICE_PCIE_INFO,
>> +    TA_PMF_ERROR_TYPE_SYS_DRV_FW_VALIDATION,
>> +    TA_PMF_ERROR_TYPE_MAX,
>> +};
>> +
>> +struct pmf_action_table {
>> +    u32 spl;        /* in mW */
>> +    u32 sppt;        /* in mW */
>> +    u32 sppt_apuonly;    /* in mW */
>> +    u32 fppt;        /* in mW */
>> +    u32 stt_minlimit;    /* in mW */
>> +    u32 stt_skintemp_apu;    /* in C */
>> +    u32 stt_skintemp_hs2;    /* in C */
>> +};
>> +
>> +/* Input conditions */
>> +struct ta_pmf_condition_info {
>> +    u32 power_source;
>> +    u32 bat_percentage;
>> +    u32 power_slider;
>> +    u32 lid_state;
>> +    bool user_present;
>> +    u32 rsvd1[2];
>> +    u32 monitor_count;
>> +    u32 rsvd2[2];
>> +    u32 bat_design;
>> +    u32 full_charge_capacity;
>> +    int drain_rate;
>> +    bool user_engaged;
>> +    u32 device_state;
>> +    u32 socket_power;
>> +    u32 skin_temperature;
>> +    u32 rsvd3[5];
>> +    u32 ambient_light;
>> +    u32 length;
>> +    u32 avg_c0residency;
>> +    u32 max_c0residency;
>> +    u32 s0i3_entry;
>> +    u32 gfx_busy;
>> +    u32 rsvd4[7];
>> +    bool camera_state;
>> +    u32 workload_type;
>> +    u32 display_type;
>> +    u32 display_state;
>> +    u32 rsvd5[150];
>> +};
>> +
>> +struct ta_pmf_load_policy_table {
>> +    u32 table_size;
>> +    u8 table[POLICY_BUF_MAX_SZ];
>> +};
>> +
>> +/* TA initialization params */
>> +struct ta_pmf_init_table {
>> +    u32 frequency; /* SMU sampling frequency */
>> +    bool validate;
>> +    bool sku_check;
>> +    bool metadata_macrocheck;
>> +    struct ta_pmf_load_policy_table policies_table;
>> +};
>> +
>> +/* Everything the TA needs to Enact Policies */
>> +struct ta_pmf_enact_table {
>> +    struct ta_pmf_condition_info ev_info;
>> +    u32 name;
>> +};
>> +
>> +struct ta_pmf_action {
>> +    u32 action_index;
>> +    u32 value;
>> +};
>> +
>> +/* output actions from TA */
>> +struct ta_pmf_enact_result {
>> +    u32 actions_count;
>> +    struct ta_pmf_action actions_list[TA_PMF_ACTION_MAX];
>> +    u32 undo_count;
>> +    struct ta_pmf_action undo_list[TA_PMF_UNDO_MAX];
>> +};
>> +
>> +union ta_pmf_input {
>> +    struct ta_pmf_enact_table enact_table;
>> +    struct ta_pmf_init_table init_table;
>> +};
>> +
>> +union ta_pmf_output {
>> +    struct ta_pmf_enact_result policy_apply_table;
>> +    u32 rsvd[TA_OUTPUT_RESERVED_MEM];
>> +};
>> +
>>   struct ta_pmf_shared_memory {
>>       int command_id;
>>       int resp_id;
>>       u32 pmf_result;
>>       u32 if_version;
>> +    union ta_pmf_output pmf_output;
>> +    union ta_pmf_input pmf_input;
>>   };
>>     /* Core Layer */
>> @@ -460,4 +595,5 @@ extern const struct attribute_group
>> cnqf_feature_attribute_group;
>>   /* Smart PC builder Layer */
>>   int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
>>   void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
>> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
>>   #endif /* PMF_H */
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>> b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 4036f435f1e2..38f02676261d 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -42,9 +42,77 @@ static void amd_pmf_prepare_args(struct
>> amd_pmf_dev *dev, int cmd,
>>       param[0].u.memref.shm_offs = 0;
>>   }
>>   +static void amd_pmf_apply_policies(struct amd_pmf_dev *dev,
>> struct ta_pmf_enact_result *out)
>> +{
>> +    u32 val;
>> +    int idx;
>> +
>> +    for (idx = 0; idx < out->actions_count; idx++) {
>> +        val = out->actions_list[idx].value;
>> +        switch (out->actions_list[idx].action_index) {
>> +        case PMF_POLICY_SPL:
>> +            if (dev->prev_data->spl != val) {
>> +                amd_pmf_send_cmd(dev, SET_SPL, false, val, NULL);
>> +                dev_dbg(dev->dev, "update SPL : %u\n", val);
>> +                dev->prev_data->spl = val;
>> +            }
>> +            break;
>> +
>> +        case PMF_POLICY_SPPT:
>> +            if (dev->prev_data->sppt != val) {
>> +                amd_pmf_send_cmd(dev, SET_SPPT, false, val, NULL);
>> +                dev_dbg(dev->dev, "update SPPT : %u\n", val);
>> +                dev->prev_data->sppt = val;
>> +            }
>> +            break;
>> +
>> +        case PMF_POLICY_FPPT:
>> +            if (dev->prev_data->fppt != val) {
>> +                amd_pmf_send_cmd(dev, SET_FPPT, false, val, NULL);
>> +                dev_dbg(dev->dev, "update FPPT : %u\n", val);
>> +                dev->prev_data->fppt = val;
>> +            }
>> +            break;
>> +
>> +        case PMF_POLICY_SPPT_APU_ONLY:
>> +            if (dev->prev_data->sppt_apuonly != val) {
>> +                amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false,
>> val, NULL);
>> +                dev_dbg(dev->dev, "update SPPT_APU_ONLY : %u\n", val);
>> +                dev->prev_data->sppt_apuonly = val;
>> +            }
>> +            break;
>> +
>> +        case PMF_POLICY_STT_MIN:
>> +            if (dev->prev_data->stt_minlimit != val) {
>> +                amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
>> val, NULL);
>> +                dev_dbg(dev->dev, "update STT_MIN : %u\n", val);
>> +                dev->prev_data->stt_minlimit = val;
>> +            }
>> +            break;
>> +
>> +        case PMF_POLICY_STT_SKINTEMP_APU:
>> +            if (dev->prev_data->stt_skintemp_apu != val) {
>> +                amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
>> val, NULL);
>> +                dev_dbg(dev->dev, "update STT_SKINTEMP_APU : %u\n",
>> val);
>> +                dev->prev_data->stt_skintemp_apu = val;
>> +            }
>> +            break;
>> +
>> +        case PMF_POLICY_STT_SKINTEMP_HS2:
>> +            if (dev->prev_data->stt_skintemp_hs2 != val) {
>> +                amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
>> val, NULL);
>> +                dev_dbg(dev->dev, "update STT_SKINTEMP_HS2 : %u\n",
>> val);
>> +                dev->prev_data->stt_skintemp_hs2 = val;
>> +            }
>> +            break;
>> +        }
>> +    }
>> +}
>> +
>>   static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>>   {
>>       struct ta_pmf_shared_memory *ta_sm = NULL;
>> +    struct ta_pmf_enact_result *out = NULL;
>>       struct tee_param param[MAX_TEE_PARAM];
>>       struct tee_ioctl_invoke_arg arg;
>>       int ret = 0;
>> @@ -52,7 +120,10 @@ static int amd_pmf_invoke_cmd_enact(struct
>> amd_pmf_dev *dev)
>>       if (!dev->tee_ctx)
>>           return -ENODEV;
>>   +    memset(dev->shbuf, 0, dev->policy_sz);
>>       ta_sm = dev->shbuf;
>> +    out = &ta_sm->pmf_output.policy_apply_table;
>> +
>>       memset(ta_sm, 0, sizeof(*ta_sm));
>>       ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
>>       ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
>> @@ -65,6 +136,12 @@ static int amd_pmf_invoke_cmd_enact(struct
>> amd_pmf_dev *dev)
>>           return ret;
>>       }
>>   +    if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS &&
>> out->actions_count) {
>> +        dev_dbg(dev->dev, "action count:%u result:%x\n",
>> out->actions_count,
>> +            ta_sm->pmf_result);
>> +        amd_pmf_apply_policies(dev, out);
>> +    }
>> +
>>       return 0;
>>   }
>>   @@ -72,6 +149,7 @@ static int amd_pmf_invoke_cmd_init(struct
>> amd_pmf_dev *dev)
>>   {
>>       struct ta_pmf_shared_memory *ta_sm = NULL;
>>       struct tee_param param[MAX_TEE_PARAM];
>> +    struct ta_pmf_init_table *in = NULL;
>>       struct tee_ioctl_invoke_arg arg;
>>       int ret = 0;
>>   @@ -80,10 +158,21 @@ static int amd_pmf_invoke_cmd_init(struct
>> amd_pmf_dev *dev)
>>           return -ENODEV;
>>       }
>>   +    dev_dbg(dev->dev, "Policy Binary size: %u bytes\n",
>> dev->policy_sz);
>> +    memset(dev->shbuf, 0, dev->policy_sz);
>>       ta_sm = dev->shbuf;
>> +    in = &ta_sm->pmf_input.init_table;
>> +
>>       ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE;
>>       ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
>>   +    in->metadata_macrocheck = false;
>> +    in->sku_check = false;
>> +    in->validate = true;
>> +    in->frequency = pb_actions_ms;
>> +    in->policies_table.table_size = dev->policy_sz;
>> +
>> +    memcpy(in->policies_table.table, dev->policy_buf, dev->policy_sz);
>>       amd_pmf_prepare_args(dev,
>> TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE, &arg, param);
>>         ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
>> @@ -103,6 +192,51 @@ static void amd_pmf_invoke_cmd(struct
>> work_struct *work)
>>       schedule_delayed_work(&dev->pb_work,
>> msecs_to_jiffies(pb_actions_ms));
>>   }
>>   +static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>> +{
>> +    u32 cookie, length;
>> +    int res;
>> +
>> +    cookie = readl(dev->policy_buf + POLICY_COOKIE_OFFSET);
>> +    length = readl(dev->policy_buf + POLICY_COOKIE_LEN);
>> +
>> +    if (cookie != POLICY_SIGN_COOKIE || !length)
>> +        return -EINVAL;
>> +
>> +    /* update the actual length */
>> +    dev->policy_sz = length + 512;
>> +    res = amd_pmf_invoke_cmd_init(dev);
>> +    if (res == TA_PMF_TYPE_SUCCESS) {
>> +        /* now its safe to announce that smart pc is enabled */
>> +        dev->smart_pc_enabled = 1;
>> +        /*
>> +         * Start collecting the data from PMFW after a small delay
>> +         * or else, we might end up getting stale values.
>> +         */
>> +        schedule_delayed_work(&dev->pb_work,
>> msecs_to_jiffies(pb_actions_ms * 3));
>> +    } else {
>> +        dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>> +        return res;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>> +{
>> +    dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
>> +    if (!dev->policy_buf)
>> +        return -ENOMEM;
>> +
>> +    dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr,
>> dev->policy_sz);
>> +    if (!dev->policy_base)
>> +        return -ENOMEM;
>> +
>> +    memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
>> +
>> +    return amd_pmf_start_policy_engine(dev);
>> +}
>> +
>>   static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data
>> *ver, const void *data)
>>   {
>>       return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>> @@ -146,7 +280,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev
>> *dev)
>>           goto out_ctx;
>>       }
>>   -    size = sizeof(struct ta_pmf_shared_memory);
>> +    size = sizeof(struct ta_pmf_shared_memory) + dev->policy_sz;
>>       dev->fw_shm_pool = tee_shm_alloc_kernel_buf(dev->tee_ctx, size);
>>       if (IS_ERR(dev->fw_shm_pool)) {
>>           dev_err(dev->dev, "Failed to alloc TEE shared memory\n");
>> @@ -190,11 +324,19 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev
>> *dev)
>>           return ret;
>>         INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>> -    return 0;
>> +    amd_pmf_set_dram_addr(dev);
>> +    amd_pmf_get_bios_buffer(dev);
>> +    dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>> +    if (!dev->prev_data)
>> +        return -ENOMEM;
>> +
>> +    return dev->smart_pc_enabled;
>>   }
>>     void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>>   {
>> +    kfree(dev->prev_data);
>> +    kfree(dev->policy_buf);
>>       cancel_delayed_work_sync(&dev->pb_work);
>>       amd_pmf_tee_deinit(dev);
>>   }
> 
