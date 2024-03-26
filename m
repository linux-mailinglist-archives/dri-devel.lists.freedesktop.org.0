Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12C688CB0A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 18:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27EB10F17F;
	Tue, 26 Mar 2024 17:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OvmnAe+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2094.outbound.protection.outlook.com [40.107.92.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02BC10F17E;
 Tue, 26 Mar 2024 17:35:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MD/C8rU0uBgZZbmtezILU1ZT2VfK4oo5d4/lMt1XDWIwmHFXNOC2nBgpNmPP+popcXZZar5TAtmG+kMd4pLkHuStUrlpJdyd/oLvz6pUkAogut74psVmcTOy65yjHq8DO1K52ieh3pqvYS6pMw0QfoDYsk+Ej9Mg/RCu/f6F4CmUzaJKB5Ew0JfIEn6drHlar8FLF+0BtQP9uiTuGwnq6cUtoLLcASHtIIPGwDuOgHboKj4q9MFFHPafez/HfsA3DmI81lAq7ogg1ON2nnnvZDcR/x3d6eJ5NuixFkgGQ8wUoYPns8+fEIFLrDfcIGWUZSWs76pQDSwEH6zUunNFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cC+izhkvvzHKBFPPUzhF3IxB3IyPJrSM8Eqo03l/P1o=;
 b=AfMBL+aS97tb7Uv3Cg5Wa6jl2cqbDyn5jIhKq74Ewlrr/C3J6FrUq1BM5Uq1EjZ63VaqZ9G23vQ03bivb1rsZ7vSeysBX29GvGnBZe8WamcaQyjCG+EuJsenHT13hfCB7m/C11trsgy42/VFlAGNEYLWyKkisUWcF6sNyNEDIl5gj5Nzmqgukf8jymak1E+in9nSGp7bRiIp76ELxr7LThIOTkVU/fZNgryd1ugDFfgIO6C6EOsmyaS/Gb+6ypcGYEN6810WISXIOKV7Y0CcidvvbAdFs5evCWBq5eeSQ68/9O+N3V0zb8Ao5htcTd0mYmOLOpV6lEwzP3YDtJ5saQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cC+izhkvvzHKBFPPUzhF3IxB3IyPJrSM8Eqo03l/P1o=;
 b=OvmnAe+vRbTs1EWi5bJjhu7zb9NiMntp5IuQFCJvdFVsDEpF4p4fhIMTO1LkSzsrQb5QptLMjbBQT4OWrwBIi8dvK7BzYl2AZg1UMnbTstZeig4dGy1nJ4pRG8Uhp8QdkKbv1NzL/Rbvr+fGfzxszhR554F5cj/ebqCzqiyZTyM=
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by MN0PR12MB6247.namprd12.prod.outlook.com (2603:10b6:208:3c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 17:35:04 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 17:35:03 +0000
Message-ID: <0033d14d-f1ad-4e18-8b9d-42aa255391c5@amd.com>
Date: Tue, 26 Mar 2024 23:04:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: add support of bios dump in devcoredump
To: Alex Deucher <alexdeucher@gmail.com>, Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Lijo Lazar <lijo.lazar@amd.com>
References: <20240326143750.2292945-1-sunil.khatri@amd.com>
 <CADnq5_Nm6gyMf1mhGiyVDe6n69yabdf8EN5t=OmzJ7oBVZmEtQ@mail.gmail.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <CADnq5_Nm6gyMf1mhGiyVDe6n69yabdf8EN5t=OmzJ7oBVZmEtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0128.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::13) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|MN0PR12MB6247:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzBtQMw+FqB1XaTMd6OKwohdc8Wki5fJp8rYXhxxbGg+37pNGlLBq7vel+QSns4bdEAHSHo/YN1mZUw+F7vCUlt6ND/ZCkyrzEM1dCVkrs6OcvdsV/0JIKC/1NsICWUBGsjTNJnwbFrzTBkCCNsRvLO+sTRIBtpKlw8HdMwC+jLkHaiF961w19+2RlSUzeeD6IutmG7AJ912HRbBabAe6eRh4kNwWa9FvCmtfzdc727adFa/2FL3nL9e9OvkgMavDdgTK/eFia1TFSJZJvnv7JuEiv8HgwWUTTlORB8GOyu7GTb1gTHm6p4ZlSClsGn7GfxKuv84g22wUyPK4PxU8N/e4wvKI2iHsGH7958MA0Zk8D9N5ftcyXQl/pCUDZ5FQZyazE82WnvvolNe+9uv3lfLg5rY+UEO9115cHL/lA2C7QXb10lUt/vsB5yrwwgNRBNrtfCKdM3jX8QWosHwV+wh97KvqxX3xr2LZ+Lvu+bA5RCdXfd2hJO0WLSARNvdzPQzXIDTB3KEJ5D7knzsl9XQBz+1JNUKrL0YsPpkelKdJphu36MRmDsNgm41w38YwM22b0n8oSnCs0nLWn/IFE1yt5P/gqev+Aa1BEW7eNTnj8CSSSYrKxTY5TZGqFxHbFn3GL8lVXWzXvL5OlzF0BFw75SUK2w4Z00RCyltxIA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnFqUkM2eEVOblhLMGhrSkV4elR0eGdxNU1sN0dNTkJESWVObS9LUmpPOFBX?=
 =?utf-8?B?WjhKT3ZVTXpubzQ1cHFRUWRibzBXVFB4KzVmVzg4ZTNhcGpoQWtpOEdlR2FW?=
 =?utf-8?B?VUJ6OVBHMmJGblo5MlRMOUhuOFNLd0p2QmYwT25SSUJTU014SUJ6TkpnVDJu?=
 =?utf-8?B?bGNqTlo4aEJMSmpYRXA5UlR4ZHdtYWtuUUtaNlBjWDBlcCtXUm5vc0pPTnVW?=
 =?utf-8?B?WE45bEx6Q3c3WkJFZnRVRGg1RFZ1R2t5Y3B2ZlVYWUJQaXJtUVg2MDgrbUl2?=
 =?utf-8?B?eWpmQmt4MmcwOUpraFFmckc4S0RXZnVRbWRoSXBSV3FxL2Jhd28wemplVVl0?=
 =?utf-8?B?SFptY3ZheUg2eFkzdHFENlhXUVBjU2lZR1RFazUzYmFCRnpTL011VnZTZFdH?=
 =?utf-8?B?OFNKem5idUlhRTc3Q0hjSXFGZlA4aS9zOEV0K3JVN1ZzcDJVdi9wVWY0VkZr?=
 =?utf-8?B?eWgrV1I5c2FqcTkybjZTMlk1M0h1SktGU2hrK25zRFZodzBXMnU4NXNkTEJX?=
 =?utf-8?B?YUUyMXdxUFFpMHJMeEp5WkRBSDZiejFQUngrN2VwR2RvOFpVTWo1U1cyUDd1?=
 =?utf-8?B?VTd2YUU2K0xzUUNRWFF0SlBxeGNqZFhIdGVOaFNVMkIvUmdZdHU4UWZXUmRX?=
 =?utf-8?B?UzJTSjd5QVNhb3RnSjhpQndWTlVSZWM2MzlEeTNYQzVjdldlL29OWmxiR2tz?=
 =?utf-8?B?UVhFdmFPZGMzTU9rRDVhM3h3VHE5RTJYWHhPSGdtZVE2RkhLVkhrb3NCYWZY?=
 =?utf-8?B?c3dtUE1TaFA0TzEreDhVenVFUk5tZ0NrVUdqZGp2NDR0ZS9qL0E4RGZhdUk4?=
 =?utf-8?B?QlRXVXIraU5DWU1WOEZiY3F1Q3M1MHFTWWt2elJyNElsa3hJdU53enVGK0pM?=
 =?utf-8?B?TGFodWRaVFRzblhXRlk0Qm01RndXM0hUUnUydkhveG9yQ3o2VXhGRktxbDVs?=
 =?utf-8?B?UUpHaXcrbk5PTU8rR2xNaTZqWXN1V1JmZzdvb1Z1VGtGOUYreXBWUE5PODZM?=
 =?utf-8?B?REpCeHdCelRFSFZSSy91aFFjR2V6RzJicFN4NEI4WGFtR1NEU0hlZmVWMEdG?=
 =?utf-8?B?eUFVdlVIdTRaQVNTM1UrYks5OFZKcXJCOTlSNlA0SnB5dmZ2VHVnVjU4UkI4?=
 =?utf-8?B?NDdsYUtiTXQ0M1NFZytmOC9xNkFIQjdYUko5WFM1am96MlIvaUVnZm5qc240?=
 =?utf-8?B?NTB0TkJQaDJDWGVYRGJzZzFWZTVDalE5aUJZSE9LT0FmOWVSMktBMGNZZ2Fx?=
 =?utf-8?B?SU1OT0NjYURkWXRjZHJKcktLZU9IMDdIKzkvMm9ZWUcwdVFDTE9WVXpsRnJu?=
 =?utf-8?B?Y2tnYWZtVmo2YzJQa3dnWlZlWm9kTmpLV28ySXJ2SVNRTisrOCtKVWZkNmlD?=
 =?utf-8?B?SW1JdkM4L0FEMHBVbDhlTWltN3dLbEIxL051Qi9oOVFFOXBjck9oRGNlUVJj?=
 =?utf-8?B?Y2R6TGx0MW1kNVN0Uk9ZL1BFSHZDUGtnSW16Tnl6SHkyOE5lb0Y1V3dMSEN4?=
 =?utf-8?B?RUpVaXkxUi9FVDdvMWJDWHdPamg0N3E4Zjg4QlA1TVdhSjFtZ2ZzeG9EV1ND?=
 =?utf-8?B?ald4NHdXeURGcWhaUndDTEVxWVBtK0dzS1hsQUp0aDkrQUR5UUVDVWc1d1ZZ?=
 =?utf-8?B?T1U3SjVlRU5oUG1zTmsvVHpWUjdjR2hPVkVzdTdYSUtQY25VQ3VKMlNFWVZv?=
 =?utf-8?B?b1E5RmVVcm91QTM3U2dDNXRQRlZZVk1Tc2llRTY1UGphd2pyUnAxV2cvcndP?=
 =?utf-8?B?WlljRFMwNkJBZkgrQXNtS3lnbDVuSjhsRU5lODFVUGpSakszcnEzdUVRWkFk?=
 =?utf-8?B?K1RwcXA1Nll2cy93R2Vld0JNTFhNQW5ieC9RcHRHZTRIWkV3YWZ2Y0FJOGZI?=
 =?utf-8?B?eDExb2Q0WGtKU2RjVEhVdC91aXFac29XbHVUQ3BPY21ncm5sUVUvRlljUTM3?=
 =?utf-8?B?MWRJbXlGNEVYSzQzVmNOdWxTdFkrUFFiMUZ1VkU2cmpEUHZhL0h0dTV3ZG04?=
 =?utf-8?B?SXZ5V1JzMW9tcmhuaTRxUUcvSzVpVlZPdnFrS1pYQUNEanAyc1JKUWE4bXJn?=
 =?utf-8?B?bW5oMlRBWFNhaHpjZ0dRRllCTXlWZUErV3VvaGZLKzdtSDFrSmY5RDN6Q2lH?=
 =?utf-8?Q?cwG1Gjf5fwVu9V/MuOUriwvvs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8514fa-93b4-4748-7eee-08dc4dbb11f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 17:35:03.8486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qArqkOm09c4BxPpYjZzoSS21QcrwCukG71xhZPTv0aXuYid7Ct1nsaRybfimAyWE6MbWNT+BG08m62iQdKVzOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6247
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


On 3/26/2024 10:23 PM, Alex Deucher wrote:
> On Tue, Mar 26, 2024 at 10:38 AM Sunil Khatri <sunil.khatri@amd.com> wrote:
>> dump the bios binary in the devcoredump.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 20 +++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
>> index 44c5da8aa9ce..f33963d777eb 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
>> @@ -132,6 +132,26 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>>          drm_printf(&p, "Faulty page starting at address: 0x%016llx\n", fault_info->addr);
>>          drm_printf(&p, "Protection fault status register: 0x%x\n\n", fault_info->status);
>>
>> +       /* Dump BIOS */
>> +       if (coredump->adev->bios && coredump->adev->bios_size) {
>> +               int i = 0;
>> +
>> +               drm_printf(&p, "BIOS Binary dump\n");
>> +               drm_printf(&p, "Valid BIOS  Size:%d bytes type:%s\n",
>> +                          coredump->adev->bios_size,
>> +                          coredump->adev->is_atom_fw ?
>> +                          "Atom bios":"Non Atom Bios");
>> +
>> +               while (i < coredump->adev->bios_size) {
>> +                       /* Printing 15 bytes in a line */
>> +                       if (i % 15 == 0)
>> +                               drm_printf(&p, "\n");
>> +                       drm_printf(&p, "0x%x \t", coredump->adev->bios[i]);
>> +                       i++;
>> +               }
>> +               drm_printf(&p, "\n");
>> +       }
> I don't think it's too useful to dump this as text.  I was hoping it
> could be a binary.  I guess, we can just get this from debugfs if we
> need it if a binary is not possible.


Yes , this dumps in text format only and the binary is already available 
in debugfs. So discarding the patch.

>
> Alex
>
>
>> +
>>          /* Add ring buffer information */
>>          drm_printf(&p, "Ring buffer information\n");
>>          for (int i = 0; i < coredump->adev->num_rings; i++) {
>> --
>> 2.34.1
>>
