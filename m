Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE2A87CDFA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 14:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA8510E148;
	Fri, 15 Mar 2024 13:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iL4VYFvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250ED10E079;
 Fri, 15 Mar 2024 13:18:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uty/UI5SWS4UYoi4sbyg3rz6zyeZsiyNNi3it5dA3iu4+7Jc4C50goTYnHUSqvpFoH5993lb8AB/pAzMoWF/1VwO2uIvxFYLpfGQEKyg+/B9PcUvG2pm2O6ps+k5g6wLfysnLTFCwi2rsRVf1zyJ/UcGlhmDlDU4C+YOQySP/gcssO+H+ZKJTTD0OhDjJxSVUfsRmikgc3gestY6ok/4hsJl33mYg25lJqjRW+G4YDMDDCr9MkgXTbgr/mos2pbLEtjmvfDPq0BQc5Z+vx+uwNgWxDck+uZ5W3LNqS8hPZUi7mcb1XMi9N/r7CLYSJSTvzrKlb3AhsnIwjCoHsvPig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIIZHVtccFZ5Rbh/EB1ql/1iL8qa5XHtNzwz+ohefTM=;
 b=h+cA099vHvMfYO72GaZdVPtt+CocmGQ8l87C9YkAhzqc3RRBxQnYkn8gNlNrv2YnXt8OIALTHtMkjBJ1P3ZPOhnJervsxShD7HSvMbsWQ6OfIfe0uSd/IDIltN9AYf/+ShUjrjfOtHlS+I/LJAJZa6vvvEgInXfuIHShd/Afqm+M4bOOVbz7EIL7A5muqe6eF/3DFl2hABn8FjQ8/TCjSjeju6M/RV6Vo8JwLFBN7iFXYjZMtBUzKKStbwc3Nq3a8+dAFklrgio5voDQBXDV8lpUc5njGYpZxeq57S6G4ErRLYUNr7rbiNBHHi94L3BcD4z0hqFHZizA20AtgY33Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIIZHVtccFZ5Rbh/EB1ql/1iL8qa5XHtNzwz+ohefTM=;
 b=iL4VYFvkjXpfhnzHJrHt4W4KqQf/MgaoSxE4nFnoERS+YWd8RPXlukjTonVKBG4OF8DaCpWd4zcyxd9wZXOusBHS6ZSfDDQwEXSVBMOcuPjv5XrlPHCCXjmppTZFZm3a1iA7vcqyVcV9jKsSih/IOPKy1MtEG22Hg/oktJVakKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.22; Fri, 15 Mar
 2024 13:18:02 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 13:18:02 +0000
Message-ID: <3db5a50d-f695-4319-a254-5a5bccde1601@amd.com>
Date: Fri, 15 Mar 2024 18:47:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: add the hw_ip version of all IP's
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240315121315.406601-1-sunil.khatri@amd.com>
 <CADnq5_NsqSWknj5x0v22iF2_UPCEFO7gnj4BV5j22x-jitO1=g@mail.gmail.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <CADnq5_NsqSWknj5x0v22iF2_UPCEFO7gnj4BV5j22x-jitO1=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0199.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::9) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: fb33042f-9df2-4cce-d05f-08dc44f2577e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H6sgDIOkR/D/+J7mnJsb+62BHictrc7q6pr6Wx7d5rq1/TgK6O5w474uGDflJvuhzQihaSFPvVwu7/HqEcC6HCIIDHFummVTYCOQr6i09UmMqsWdD8YqZ9Jq52u1lNgwvTSdzzm/JJiljT28ggApEUNf+3jtt9wBD+4BBQvQ3vxCW6j9qmmrOnLUI34hRD0eYqQfT56rP6/XA097cfr2VRnthhdHWLfQY9WEyfbO7hWZt4t9RRsrtCqF3B4Y67H9ry+hXxfUSzWLg1ME1nz6EC4Xi0TDSjkIXj7bYgeZg0ssAiAMCrW31fZiElZZx+weW8w0CTLsQD0Jg7lfXdLXPenAeA4IJPjGGdLJ0JaHC42dLF5a/dTD79oNAm8aVyL/anbpJndbqq9yZ8Y+wnnMV2qCOZpr8xgMKXWkdtrM6TucH33LECJwZlV/yvDQIPKUvathkio+evpPUE8TrUd0DITYeSE+beSQgrXHteK+B1ghYeqYo5naLKU9covoWgtnKEa7U6/IMs82kuqXrcf7wchmVWPZmEAL6jWxYwFvleFXjFAENgzqnKwi2aZpQzYbiG7b3yZBNNgPkD9uxCj/4Gz6wGRQLTiJjKvp27N1Mz6KdVLCEVDRmuM3uP7KboNMuxKLRc1jBlqmiOWj5BZVrMgl3T29eTehjirqRt+z2js=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzVlRmN6MG9idlBLNFkwa2tzbFNWTU43OFpNQld5ZnFkVDE3VnFtaHJISmVy?=
 =?utf-8?B?QzJFRFZ6a1hnbTV5L25sU0N6S2V5bUc1OU95VUdYQ2VMM2w4QW9sSlAzYlor?=
 =?utf-8?B?VzBTZWRlUDhIWW5zQlo0WndmNkROd0F2ZWQyYmxyYUcwR2VWZzE3ZCt6b2Zm?=
 =?utf-8?B?T1B6SHg1Z1FkMS94MWt6UlhNSVJpUmpQLzJESU0wQlQ5R2hYdXQ4YXc2QnE2?=
 =?utf-8?B?ZitIWWEzS3VCdEc2cWlINEw1dTlxK1lnUldBWUZIa2c5NUZORitXc3kvdmFG?=
 =?utf-8?B?enYrckVZYTNIMUVMSVFzR2Y4UVNNSWZESWp5Z1RwTXZnek1GYkJOcTA2T20w?=
 =?utf-8?B?NElUeU9kdVRvMm9wdmVpUS8xUFc2Vkw3OEZQNDVqSGYzL1c4VUYySDYzZ1N4?=
 =?utf-8?B?cE5OMGZaV0JoU0Fud3N5dGlSM0NFdkZINFQ0eHBiVDdycUZwVERKVW9wQ3Nj?=
 =?utf-8?B?ekxXcjN2L0N2dmFhTHFSaGVUU3RCSEl2THhjaUYzbHYyMmY5QlpLSDh5dWJE?=
 =?utf-8?B?NXZxZjd2YUhQVDZ4Mmg1OEJsaDlaS2YzdHVhSktFZ1l2NUpoUEVJdDAvdVpX?=
 =?utf-8?B?OXhWc2o1WUtrN1kwSW5ldkVNa1BjRENRNnVTMmtMMXFRQzdJMnZIRmZpMUtk?=
 =?utf-8?B?NFJtcEx6ZFhFZmR0T21ZeVJnYkszVWVub1NjdjNpU014dDM5YWRBcDZaZXlY?=
 =?utf-8?B?MFJERm8xUkM5SVJOQUlWc1hZVWNpSzdDTUpSeVZZaEh4RHJXSWpzUm5uWW01?=
 =?utf-8?B?QUxROXlhNGJhNklqRXhTQ3BlTG9OMmUrZUkwbjk0anB4MFluYnRpUjlUQ1dh?=
 =?utf-8?B?dXFUa1crT1hDeEhTZDkzUEp3Q1haZk1NQURNdUxkc2cwdE1hR0dsdlpTVlcv?=
 =?utf-8?B?cUVXTG16R29tSWtPMllTT2d3aG54aU1JSzJTc3k5RW5YdnN5ckx2TGdnRS9i?=
 =?utf-8?B?UGFndUVTS1ZNWlA1Tkh2VEJ6V2R2MTJpRFRUaGZVcmlJU1c4UUtaNk9ySEpx?=
 =?utf-8?B?ZHlZZlRGSEx3bXIvK3FSZWc3M1UxR2E3UXRjT0h5ekZXVzhjRm5Rd2dwMS9K?=
 =?utf-8?B?Z29TWVR4dGFCby8yTlRjY2ppaEsvK2I4ZWlKQ3hyb0M1NytaSnlCWjg4NnZo?=
 =?utf-8?B?REVCa25HU0pMM0ltN0lQVjh5elRxL2NJM1JGQlNKTlROd1M5NGp6dmlMUng0?=
 =?utf-8?B?TjUyOUt2bzh4RFo4R0xHQzMxeHVKa0Y4OEpWK2xRRHl3b0hEN0N2VjRmNFcx?=
 =?utf-8?B?dzkzNGRuM0cwSFEzc2FpRkd0WG9IdDBQdzM1eHJkaVpWNDF6YTRDRFhTY2Fk?=
 =?utf-8?B?K213M09wRE8wdW5xTTZidUZ5a1l6RjRROVF5Ny83bUlzbkJiZmt1R0l0NFFu?=
 =?utf-8?B?YlRnVEY2K2NwR1F2Qkp6M1pZaWppcUkvQm5NT2NwTmtRaElFRXhhM2ZUMmQ3?=
 =?utf-8?B?TEp6aXdwa0JyRDZDNXJZUHdBZ1dhb0RNaERBL3FyTStHeVdqVlNkaklWYmpU?=
 =?utf-8?B?bGtvWWkrUDgycGt6NjB4SFcyaVl2bzRUcTEzYW1PdE5GWEM5Sys3OEh3YUR1?=
 =?utf-8?B?K052RzBKd2dtK2FsN3FwTngwRmkxY0wxdG9LMHhROGJ6ZEFEeWM1akRHSmRR?=
 =?utf-8?B?Tnd6R3lwMWc0em15VEtETVh4M1RJdzRlUUQ0cy9sSHhMaTY1bjg5UkdER09D?=
 =?utf-8?B?WCtHSUVSVkJMcjcyZ0lzK2FPb1VXQlpxTHBLN1NhOSt6MTdzZ2JOWUxJdEdj?=
 =?utf-8?B?MjlSM21DUDlnU3AyRitYdnRXc3VyQTFwUlpoK3VRN2gvRGtoZkRzR3ZXV09p?=
 =?utf-8?B?dVdJVExhQ2Y4SVNnaXVieisxd1J4Z0diY0M3MWRKY0FaMUk1VE5VQ3A0S0Vk?=
 =?utf-8?B?eGFncE9wTVNMZldBUjlBRGxTSTBzbUpYU3lwV2RocEttRUlMMTkzSkJtc0hX?=
 =?utf-8?B?cSt5ZEo1L2ppZjlJZjdkbW1tTzgyTy9tQmpSTWRQTWU4eXUyVlpsWnQwMUpj?=
 =?utf-8?B?TkJ6dTlQd2l5dDRNcEtyc2RQaFhlazdOVVduQ2tYNE5NS0xyTitPWFFwb0g2?=
 =?utf-8?B?NUwvQ3pKRTFPOTJTQ3B6ZlY4eDRtWkE2OUZUQjhBYU1jdXpqenJnY21CSCtz?=
 =?utf-8?Q?/8GSDIc6MH4HgmrwB9EDbpWzN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb33042f-9df2-4cce-d05f-08dc44f2577e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 13:18:02.4100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgrwKMp5lEcxQk2RJAn5uii1I12jfHFov7s72+15/QVN4rMQG7/ikOghYcw8b7ecDPHFfdnJU9QApjT4CwnTVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6634
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


On 3/15/2024 6:45 PM, Alex Deucher wrote:
> On Fri, Mar 15, 2024 at 8:13 AM Sunil Khatri <sunil.khatri@amd.com> wrote:
>> Add all the IP's version information on a SOC to the
>> devcoredump.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> This looks great.
>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Thanks Alex

>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 62 +++++++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> index a0dbccad2f53..3d4bfe0a5a7c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> @@ -29,6 +29,43 @@
>>   #include "sienna_cichlid.h"
>>   #include "smu_v13_0_10.h"
>>
>> +const char *hw_ip_names[MAX_HWIP] = {
>> +       [GC_HWIP]               = "GC",
>> +       [HDP_HWIP]              = "HDP",
>> +       [SDMA0_HWIP]            = "SDMA0",
>> +       [SDMA1_HWIP]            = "SDMA1",
>> +       [SDMA2_HWIP]            = "SDMA2",
>> +       [SDMA3_HWIP]            = "SDMA3",
>> +       [SDMA4_HWIP]            = "SDMA4",
>> +       [SDMA5_HWIP]            = "SDMA5",
>> +       [SDMA6_HWIP]            = "SDMA6",
>> +       [SDMA7_HWIP]            = "SDMA7",
>> +       [LSDMA_HWIP]            = "LSDMA",
>> +       [MMHUB_HWIP]            = "MMHUB",
>> +       [ATHUB_HWIP]            = "ATHUB",
>> +       [NBIO_HWIP]             = "NBIO",
>> +       [MP0_HWIP]              = "MP0",
>> +       [MP1_HWIP]              = "MP1",
>> +       [UVD_HWIP]              = "UVD/JPEG/VCN",
>> +       [VCN1_HWIP]             = "VCN1",
>> +       [VCE_HWIP]              = "VCE",
>> +       [VPE_HWIP]              = "VPE",
>> +       [DF_HWIP]               = "DF",
>> +       [DCE_HWIP]              = "DCE",
>> +       [OSSSYS_HWIP]           = "OSSSYS",
>> +       [SMUIO_HWIP]            = "SMUIO",
>> +       [PWR_HWIP]              = "PWR",
>> +       [NBIF_HWIP]             = "NBIF",
>> +       [THM_HWIP]              = "THM",
>> +       [CLK_HWIP]              = "CLK",
>> +       [UMC_HWIP]              = "UMC",
>> +       [RSMU_HWIP]             = "RSMU",
>> +       [XGMI_HWIP]             = "XGMI",
>> +       [DCI_HWIP]              = "DCI",
>> +       [PCIE_HWIP]             = "PCIE",
>> +};
>> +
>> +
>>   int amdgpu_reset_init(struct amdgpu_device *adev)
>>   {
>>          int ret = 0;
>> @@ -196,6 +233,31 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>>                             coredump->reset_task_info.process_name,
>>                             coredump->reset_task_info.pid);
>>
>> +       /* GPU IP's information of the SOC */
>> +       if (coredump->adev) {
>> +
>> +               drm_printf(&p, "\nIP Information\n");
>> +               drm_printf(&p, "SOC Family: %d\n", coredump->adev->family);
>> +               drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->rev_id);
>> +               drm_printf(&p, "SOC External Revision id: %d\n",
>> +                          coredump->adev->external_rev_id);
>> +
>> +               for (int i = 1; i < MAX_HWIP; i++) {
>> +                       for (int j = 0; j < HWIP_MAX_INSTANCE; j++) {
>> +                               int ver = coredump->adev->ip_versions[i][j];
>> +
>> +                               if (ver)
>> +                                       drm_printf(&p, "HWIP: %s[%d][%d]: v%d.%d.%d.%d.%d\n",
>> +                                                  hw_ip_names[i], i, j,
>> +                                                  IP_VERSION_MAJ(ver),
>> +                                                  IP_VERSION_MIN(ver),
>> +                                                  IP_VERSION_REV(ver),
>> +                                                  IP_VERSION_VARIANT(ver),
>> +                                                  IP_VERSION_SUBREV(ver));
>> +                       }
>> +               }
>> +       }
>> +
>>          if (coredump->ring) {
>>                  drm_printf(&p, "\nRing timed out details\n");
>>                  drm_printf(&p, "IP Type: %d Ring Name: %s\n",
>> --
>> 2.34.1
>>
