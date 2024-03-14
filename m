Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EAF87BABF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 10:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF6A10F9FF;
	Thu, 14 Mar 2024 09:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3/MbDwHq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14BD10F9FD;
 Thu, 14 Mar 2024 09:52:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mepyLxc+86xO52DCDwMCaN4TY54EhLo2wfZdW3q++NqtO5n3FFIS4sxdp0P59HnDBjKKMSqW93epSNPJKVHwqnFo3N0sBbNIldiyxJkq1e+XC3x349gvM6RSwU1yoBxNKRPgGwp+NlN4aKd36SUgs12G6Ke+Yh4LYkoDpjqLm+WuWLqplyKmyw6dEx1DDSilCP4QoWIfRnnxkS95CiryYfZsw+wUOPmvmpLQ4zeY6QO1PQOn1yUiXfcSIf8mfr13s5NUlPcHbRH9DKpG6xnoaIS09bBHjJu5xpjxJ5GAJtRUCqwkQ0JPSn6DfkE77VS2f3ceqkpPixFyBYJioF7oCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/wP5NjbYM9IRfF9aNjYsXQxHvqZc+4eFjr1TYSxBmE=;
 b=PqtDH5IkJC9TZlwjQ4gMP3XwemzkT5GRyfK8+Mv7RQ1qcbV3TsrU0w7E/7sY51GxN03ntQwU7tjjHSE+vLpXY6yxdtfXkffe7VFR/nyw26SKadhNmXh2oJWjniJRsw/i9mzE79X9YP8nEANPHHEKAeW9h6OLfG+XHYu6PUqkkuLpV2c8Ig5Jvtdp/HjON+5Lv9cw4OdHyNf87vW6tH41a5n4u0BU4me4H7DMB2K54l8+xzMsu/3TOuPAVZBgxWlCJKksWNXh6/OOB+lbher8PiW8bq5CwyaB0MnTN2kklLy7XZGAp/vFj8XHRpg+70Ep2Bfel6SawqVcao/GY+/Txw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/wP5NjbYM9IRfF9aNjYsXQxHvqZc+4eFjr1TYSxBmE=;
 b=3/MbDwHq+3xDE3iOBP3lsmNvy5TrJhkEiYRmtkx1sB+H3U8xLMxHF0/0LGBS4oRK3+VQOfxzGAZtndNBsRHifrLPOza6eEV6qeDkMOJpJUH9dwavIAnPVhQrY7qn9M2KnMs1XWkIHOx63/JQzA2KuTZxyx8xcPmkYohUqDfkYhs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by PH0PR12MB8052.namprd12.prod.outlook.com (2603:10b6:510:28b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 09:52:13 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 09:52:13 +0000
Message-ID: <32111520-7006-442a-8ff3-83fc9eb02997@amd.com>
Date: Thu, 14 Mar 2024 15:22:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm:amdgpu: add firmware information of all IP's
To: "Sharma, Shashank" <shashank.sharma@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240312124148.257067-1-sunil.khatri@amd.com>
 <20240312124148.257067-2-sunil.khatri@amd.com>
 <CADnq5_ON0NfcpmnHKjNYWgxfvfz-J3tgjX92DaaN63iKb+FOZg@mail.gmail.com>
 <498b87fb-727c-4ea2-9633-6ecbff436eba@amd.com>
 <0ee30d3b-0dbc-3eb6-a19c-abeb85cbc883@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <0ee30d3b-0dbc-3eb6-a19c-abeb85cbc883@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::14) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|PH0PR12MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: 43fc916b-c7bd-4dd9-218b-08dc440c6c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kXUptS9z2OpzKO8YBKCGYgP6qvSGqycYRNrB4p5/LOIJRHTVxPj4nK7n1dqv2rg05Zg3RyNIZYutQgxz4gDoG78UTftVZY1steFGPtAaNgBtXAmIeZJWTJsYbIsQom5+wG8uJ8w6p8srTz7NHqcj5Fnj7fJbccFzjN/xBHqQGJKBp/3ZczHzX0zaqEOHto3Ln4j6fMvpEGPssekgNJ/q2T6gsiAHyDymuFKsxeKM/D8bxCsRHdaA3aMLqhJcG7calwVfd3n03x39zkQwpzeHa1tw9EBh4khkeYH0xtsu9Syw7EWGJroegw6YsdV9XQUA2ul8At6KAXYsatUu6ndQa/b2N9BqxzylPRPCQeJLeInnD4DFu3CHH0ZM1MY542w9aq9P0SwlPdR45GH/D4p/JmI9brPicH4ch8ZCs7fosg8BmPiMQ+GnJqDIZgLn9kGDZ5UFlBVSJYFzkGzUp55BfxEw2eQ2/dvY/Y6k2evbwxXVy6/9FTa1Cdy8ZzuLcZVuwuY+4yOvznAktS8azqzT7yYLd9EXyLn6kacpcnViQCk3jpTk2nb1F+9XY9EoCd96kI4mN8BeDA0ZbzPf3+C5dMV5RKsJXjXu9pmCEZvSAuCw31w6UZyorNiH0GZPfKclUlfE69CmjQW0rVVH1l0w2GgP1CfLzaBQnJoDOaVqPNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGNoaVZSQU1EM0cxcVN4TkFmcnlNaFZUQ2V3T0tPY1ZHSjhYUVJnRjB6TDVx?=
 =?utf-8?B?QkFyc2FLRG1WeHhsWGViQ0Izcjh5bHA1dnJ5Nzc4Z2ZRM2tKTFpxa0ZlZFhm?=
 =?utf-8?B?eitBNkhjMmxLK1YycVdXc2FpSWpMNGlSVGRSYjgvZ3MzY0FmS2ZjdHptbms2?=
 =?utf-8?B?akxlVVBoWm1DM0pPYzRMNyt1djU2YUoyNElpdVk4eDdwdDl5UlZvamg4L1dw?=
 =?utf-8?B?aWxaYnljVUFrWEsrOGNLSXpleVdockhJOWJ2YzNLNkpISmpmTmNrSVFHck1M?=
 =?utf-8?B?Yk00dlpxakllUFZYRFUzOEdMUWtBbzc3K1hqYUUzamNOWGcvWlNuY1ZPSUxz?=
 =?utf-8?B?Ny9KUXFsYTNHQWlZZGJoOTJ3ZkRpSUJWT0RkWXpUSldXQyswOHhwRWUyYXR5?=
 =?utf-8?B?T0t1THhUYnhxNTVyQnVSL1hPL0krTTV2TGFBTGVEaXhkTzN3WVpDcktTNG9F?=
 =?utf-8?B?L0pienlTckNQWWhqcHZHQ09jd1R3ZlV2TWYxSXJhVjROVDM3NzMvTnd2VjF1?=
 =?utf-8?B?RDU4QWN4ckNrdytnNHpSbzNJcDBneFdrRnB4Tkc0bDFZbmszTG9YdncrcUhG?=
 =?utf-8?B?K2ZRM2wwQ2dpeW5aSHhuUUpZblN6Z1NRTGVYd0VIeEFsaFVHVkJiaXFyeC9t?=
 =?utf-8?B?ejRIN2dDTVQzWDI5ZjduN0VqeUhMT2NtU1I3Y3JLUkd0SnVxbGNaSGdBRGtu?=
 =?utf-8?B?VnlLNm5lNy9SNitEcFdhWllOY3JkVVRMdFg4Nmc3Q1R3ODJSNG9oUG0wY1k3?=
 =?utf-8?B?RDZWc1VWc1g4TUZRQTJ0TlBuQ2pHOVQ0REJSRStTbGFmaE4yVHhGblM2U3FH?=
 =?utf-8?B?TUpNc2UxQlFHSVRZejFYZ0pyUXVlM3pZNVVCWjVQcm8vTHM2bTd5eW9TZTRW?=
 =?utf-8?B?c0hyRVFmc2UxVWtEMXVjNGZSRWRDcmlhZDhYVUtqd29mU1JuTHZDVkRXUm1R?=
 =?utf-8?B?WE41dGozWlVUazU3cmR3QUd3WC9qRi9wdFdjQmM4VlFiV2IxL0FZeS9sUG1Z?=
 =?utf-8?B?WVJtYTh3a1RxZWVzWkhxbVFXYmtxZmxjVTB2eGhaSTBRamlqeXFKSkFjWEFj?=
 =?utf-8?B?RkJnSjVQQkJQbGFKTnJQSFR3dW5oV0RwSENwL3dUcnpwcnV3VDBCSUgwcU9y?=
 =?utf-8?B?WnBxQVpQQ1pZZ1YvZVVsZHYvQUoxbG92dUloNTZlMi9Pbm96aDlGajNqTVN1?=
 =?utf-8?B?TmdyRXp5cDFIM0N2TmI0bWFqaGRRR1VNYlBYam5kNWk0SVVxNEkvRnQvY3V6?=
 =?utf-8?B?bGNXSHNTUkdsem9BOFhBREpGVitxNXVIWG1ZcW9HRGNvWkdxU1dpYWZYYkxx?=
 =?utf-8?B?d25jalorZGVKdXpyMk4rM3lxMThXYkU0Y3FBck5PWFBUM3BnNThsRk41U1lm?=
 =?utf-8?B?TUJ0dWJQZmE5ejlxcGRZdGs2UGYzOXVKNVhaL2NTLzFQQ3YycEZBeFEwWS9T?=
 =?utf-8?B?bENmUmFGZ2RRdHpzWjhQU1BKdmpXc0VDbFp4akN3WG1ldktlemlWWjAzNENx?=
 =?utf-8?B?U1hPb2d3aklBa0hzODkySkRCTU5lblVYdkRTMzhpUWo0WDNXUW10dXcrbG5W?=
 =?utf-8?B?TVZWbk5PR0trMWZhbUpmaVBPT1EvMjRRSDAyUkVqM3IxWm1hVkZicEpFakVN?=
 =?utf-8?B?UDZscTA4UXhGVFVVNVdlZVdSc25iN2VYREZ4bmIxR2ZmV09EQWxJTXBoMmlF?=
 =?utf-8?B?NmZwQmZEYVkxRzZ1OXBsaWJOaFJoV2tlTEV4d2pic1E4WlM3dTlycHNoMGFR?=
 =?utf-8?B?WDVLUnVLUDZKOEVXYjJJRmY3UC9Ydy81SzA1bWtid1dpbDgvenkrMWFxN1M3?=
 =?utf-8?B?Z0VaNXo0WmlLdFdTZUdUWUNiUHhqQzRTSGNwQWNEVVovMEcySWt2K1JLdnkw?=
 =?utf-8?B?VWJMMVRHekUxcGwwelQxMkpQVmVZTmpnL0swZXZJWk9mR3pBNGF4cGFyVW5H?=
 =?utf-8?B?R0NSaDBFd29OMk0wMG9ScGJvKzRDM3UzaTZORHFTbzhuczZocmpTbTJXZldH?=
 =?utf-8?B?R004ZVFNOGxtWnNqRFZUUnJnL1I0eU1BSndzY3RLR0Q2M0FaR2R1Wms5NTMy?=
 =?utf-8?B?QmVHRW4renVJNXFjcjVPd3JHWm9zK0gvSk83anJMbXN6ekdOZit3TmMxZk1t?=
 =?utf-8?Q?7ygVYIzFJIZrZVeJm4Nl5pXki?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43fc916b-c7bd-4dd9-218b-08dc440c6c43
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 09:52:12.9902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfYmv720lUWeTkDEMEOcqljIHziJwqUxZP26Z28RefjcV9eAQZjGBc1yL5rGqpIccav77vW6aKcdgSRWHPy34g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8052
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


On 3/14/2024 11:40 AM, Sharma, Shashank wrote:
>
> On 14/03/2024 06:58, Khatri, Sunil wrote:
>>
>> On 3/14/2024 2:06 AM, Alex Deucher wrote:
>>> On Tue, Mar 12, 2024 at 8:42 AM Sunil Khatri <sunil.khatri@amd.com> 
>>> wrote:
>>>> Add firmware version information of each
>>>> IP and each instance where applicable.
>>>>
>>> Is there a way we can share some common code with devcoredump,
>>> debugfs, and the info IOCTL?  All three places need to query this
>>> information and the same logic is repeated in each case.
>>
>> Hello Alex,
>>
>> Yes you re absolutely right the same information is being retrieved 
>> again as done in debugfs. I can reorganize the code so same function 
>> could be used by debugfs and devcoredump but this is exactly what i 
>> tried to avoid here. I did try to use minimum functionality in 
>> devcoredump without shuffling a lot of code here and there.
>>
>> Also our devcoredump is implemented in amdgpu_reset.c and not all the 
>> information is available here and there we might have to include lot 
>> of header and cross functions in amdgpu_reset until we want a 
>> dedicated file for devcoredump.
>
>
> I think Alex is suggesting to have one common backend to generate all 
> the core debug info, and then different wrapper functions which can 
> pack this raw info into the packets aligned with respective infra like 
> devcore/debugfs/info IOCTL, which seems like a good idea to me.
>
> If you think you need a new file for this backend it should be fine.
My suggestion was on same lines that if we want to use the same infra to 
access information from different parts of the code then we need to 
reorganize. And at same time since there is quite some data we are 
planning to add in devcoredump so i recommend to have a dedicated .c/.h 
instead of using amdgpu_reset.c so a clean include is easy to maintain.

Once Alex confirms it i can start working on design and what all 
information we need on this.

Regards
Sunil

>
> something like:
>
> amdgpu_debug_core.c::
>
> struct amdgpu_core_debug_info {
>
> /* Superset of all the info you are collecting from HW */
>
> };
>
> - amdgpu_debug_generate_core_info
>
> {
>
> /* This function collects the core debug info from HW and saves in 
> amdgpu_core_debug_info,
>
>   we can update this periodically regardless of a request */
>
> }
>
> and then:
>
> devcore_info *amdgpu_debug_pack_for_devcore(core_debug_info)
>
> {
>
> /* convert core debug info into devcore aligned format/data */
>
> }
>
> ioctl_info *amdgpu_debug_pack_for_info_ioctl(core_debug_info)
>
> {
>
> /* convert core debug info into info IOCTL aligned format/data */
>
> }
>
> debugfs_info *amdgpu_debug_pack_for_debugfs(core_debug_info)
>
> {
>
> /* convert core debug info into debugfs aligned format/data */
>
> }
>
> - Shashank
>
>>
>>
>>
>> Info IOCTL does have a lot of information which also is in pipeline 
>> to be dumped but this if we want to reuse the functionality of IOCTL 
>> we need to reorganize a lot of code.
>>
>> If that is the need of the hour i could work on that. Please let me 
>> know.
>>
>> This is my suggestion if it makes sense:
>>
>> 1. If we want to reuse a lot of functionality then we need to 
>> modularize some of the functions further so they could be consumed 
>> directly by devcoredump.
>> 2. We should also have a dedicated file for devcoredump.c/.h so its 
>> easy to include headers of needed functionality cleanly and easy to 
>> expand devcoredump.
>> 3. based on the priority and importance of this task we can add 
>> information else some repetition is a real possibility.
>>
>>>
>>> Alex
>>>
>>>
>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 122 
>>>> ++++++++++++++++++++++
>>>>   1 file changed, 122 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>>> index 611fdb90a1fc..78ddc58aef67 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>>> @@ -168,6 +168,123 @@ void amdgpu_coredump(struct amdgpu_device 
>>>> *adev, bool vram_lost,
>>>>   {
>>>>   }
>>>>   #else
>>>> +static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev, 
>>>> struct drm_printer *p)
>>>> +{
>>>> +       uint32_t version;
>>>> +       uint32_t feature;
>>>> +       uint8_t smu_program, smu_major, smu_minor, smu_debug;
>>>> +
>>>> +       drm_printf(p, "VCE feature version: %u, fw version: 0x%08x\n",
>>>> +                  adev->vce.fb_version, adev->vce.fw_version);
>>>> +       drm_printf(p, "UVD feature version: %u, fw version: 0x%08x\n",
>>>> +                  0, adev->uvd.fw_version);
>>>> +       drm_printf(p, "GMC feature version: %u, fw version: 0x%08x\n",
>>>> +                  0, adev->gmc.fw_version);
>>>> +       drm_printf(p, "ME feature version: %u, fw version: 0x%08x\n",
>>>> +                  adev->gfx.me_feature_version, 
>>>> adev->gfx.me_fw_version);
>>>> +       drm_printf(p, "PFP feature version: %u, fw version: 0x%08x\n",
>>>> +                  adev->gfx.pfp_feature_version, 
>>>> adev->gfx.pfp_fw_version);
>>>> +       drm_printf(p, "CE feature version: %u, fw version: 0x%08x\n",
>>>> +                  adev->gfx.ce_feature_version, 
>>>> adev->gfx.ce_fw_version);
>>>> +       drm_printf(p, "RLC feature version: %u, fw version: 0x%08x\n",
>>>> +                  adev->gfx.rlc_feature_version, 
>>>> adev->gfx.rlc_fw_version);
>>>> +
>>>> +       drm_printf(p, "RLC SRLC feature version: %u, fw version: 
>>>> 0x%08x\n",
>>>> +                  adev->gfx.rlc_srlc_feature_version,
>>>> +                  adev->gfx.rlc_srlc_fw_version);
>>>> +       drm_printf(p, "RLC SRLG feature version: %u, fw version: 
>>>> 0x%08x\n",
>>>> +                  adev->gfx.rlc_srlg_feature_version,
>>>> +                  adev->gfx.rlc_srlg_fw_version);
>>>> +       drm_printf(p, "RLC SRLS feature version: %u, fw version: 
>>>> 0x%08x\n",
>>>> +                  adev->gfx.rlc_srls_feature_version,
>>>> +                  adev->gfx.rlc_srls_fw_version);
>>>> +       drm_printf(p, "RLCP feature version: %u, fw version: 
>>>> 0x%08x\n",
>>>> +                  adev->gfx.rlcp_ucode_feature_version,
>>>> +                  adev->gfx.rlcp_ucode_version);
>>>> +       drm_printf(p, "RLCV feature version: %u, fw version: 
>>>> 0x%08x\n",
>>>> +                  adev->gfx.rlcv_ucode_feature_version,
>>>> +                  adev->gfx.rlcv_ucode_version);
>>>> +       drm_printf(p, "MEC feature version: %u, fw version: 0x%08x\n",
>>>> +                  adev->gfx.mec_feature_version,
>>>> +                  adev->gfx.mec_fw_version);
>>>> +
>>>> +       if (adev->gfx.mec2_fw)
>>>> +               drm_printf(p,
>>>> +                          "MEC2 feature version: %u, fw version: 
>>>> 0x%08x\n",
>>>> + adev->gfx.mec2_feature_version,
>>>> +                          adev->gfx.mec2_fw_version);
>>>> +
>>>> +       drm_printf(p, "IMU feature version: %u, fw version: 0x%08x\n",
>>>> +                  0, adev->gfx.imu_fw_version);
>>>> +       drm_printf(p, "PSP SOS feature version: %u, fw version: 
>>>> 0x%08x\n",
>>>> +                  adev->psp.sos.feature_version,
>>>> +                  adev->psp.sos.fw_version);
>>>> +       drm_printf(p, "PSP ASD feature version: %u, fw version: 
>>>> 0x%08x\n",
>>>> + adev->psp.asd_context.bin_desc.feature_version,
>>>> + adev->psp.asd_context.bin_desc.fw_version);
>>>> +
>>>> +       drm_printf(p, "TA XGMI feature version: 0x%08x, fw version: 
>>>> 0x%08x\n",
>>>> + adev->psp.xgmi_context.context.bin_desc.feature_version,
>>>> + adev->psp.xgmi_context.context.bin_desc.fw_version);
>>>> +       drm_printf(p, "TA RAS feature version: 0x%08x, fw version: 
>>>> 0x%08x\n",
>>>> + adev->psp.ras_context.context.bin_desc.feature_version,
>>>> + adev->psp.ras_context.context.bin_desc.fw_version);
>>>> +       drm_printf(p, "TA HDCP feature version: 0x%08x, fw version: 
>>>> 0x%08x\n",
>>>> + adev->psp.hdcp_context.context.bin_desc.feature_version,
>>>> + adev->psp.hdcp_context.context.bin_desc.fw_version);
>>>> +       drm_printf(p, "TA DTM feature version: 0x%08x, fw version: 
>>>> 0x%08x\n",
>>>> + adev->psp.dtm_context.context.bin_desc.feature_version,
>>>> + adev->psp.dtm_context.context.bin_desc.fw_version);
>>>> +       drm_printf(p, "TA RAP feature version: 0x%08x, fw version: 
>>>> 0x%08x\n",
>>>> + adev->psp.rap_context.context.bin_desc.feature_version,
>>>> + adev->psp.rap_context.context.bin_desc.fw_version);
>>>> +       drm_printf(p, "TA SECURE DISPLAY feature version: 0x%08x, 
>>>> fw version: 0x%08x\n",
>>>> + adev->psp.securedisplay_context.context.bin_desc.feature_version,
>>>> + adev->psp.securedisplay_context.context.bin_desc.fw_version);
>>>> +
>>>> +       /* SMC firmware */
>>>> +       version = adev->pm.fw_version;
>>>> +
>>>> +       smu_program = (version >> 24) & 0xff;
>>>> +       smu_major = (version >> 16) & 0xff;
>>>> +       smu_minor = (version >> 8) & 0xff;
>>>> +       smu_debug = (version >> 0) & 0xff;
>>>> +       drm_printf(p, "SMC feature version: %u, program: %d, fw 
>>>> version: 0x%08x (%d.%d.%d)\n",
>>>> +                  0, smu_program, version, smu_major, smu_minor, 
>>>> smu_debug);
>>>> +
>>>> +       /* SDMA firmware */
>>>> +       for (int i = 0; i < adev->sdma.num_instances; i++) {
>>>> +               drm_printf(p, "SDMA%d feature version: %u, firmware 
>>>> version: 0x%08x\n",
>>>> +                          i, adev->sdma.instance[i].feature_version,
>>>> + adev->sdma.instance[i].fw_version);
>>>> +       }
>>>> +
>>>> +       drm_printf(p, "VCN feature version: %u, fw version: 0x%08x\n",
>>>> +                  0, adev->vcn.fw_version);
>>>> +       drm_printf(p, "DMCU feature version: %u, fw version: 
>>>> 0x%08x\n",
>>>> +                  0, adev->dm.dmcu_fw_version);
>>>> +       drm_printf(p, "DMCUB feature version: %u, fw version: 
>>>> 0x%08x\n",
>>>> +                  0, adev->dm.dmcub_fw_version);
>>>> +       drm_printf(p, "PSP TOC feature version: %u, fw version: 
>>>> 0x%08x\n",
>>>> +                  adev->psp.toc.feature_version, 
>>>> adev->psp.toc.fw_version);
>>>> +
>>>> +       version = adev->mes.kiq_version & AMDGPU_MES_VERSION_MASK;
>>>> +       feature = (adev->mes.kiq_version & 
>>>> AMDGPU_MES_FEAT_VERSION_MASK)
>>>> +                                       >> 
>>>> AMDGPU_MES_FEAT_VERSION_SHIFT;
>>>> +       drm_printf(p, "MES_KIQ feature version: %u, fw version: 
>>>> 0x%08x\n",
>>>> +                  feature, version);
>>>> +
>>>> +       version = adev->mes.sched_version & AMDGPU_MES_VERSION_MASK;
>>>> +       feature = (adev->mes.sched_version & 
>>>> AMDGPU_MES_FEAT_VERSION_MASK)
>>>> +                                       >> 
>>>> AMDGPU_MES_FEAT_VERSION_SHIFT;
>>>> +       drm_printf(p, "MES feature version: %u, fw version: 0x%08x\n",
>>>> +                  feature, version);
>>>> +
>>>> +       drm_printf(p, "VPE feature version: %u, fw version: 0x%08x\n",
>>>> +                  adev->vpe.feature_version, adev->vpe.fw_version);
>>>> +
>>>> +}
>>>> +
>>>>   static ssize_t
>>>>   amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>>>>                          void *data, size_t datalen)
>>>> @@ -215,6 +332,11 @@ amdgpu_devcoredump_read(char *buffer, loff_t 
>>>> offset, size_t count,
>>>>                  }
>>>>          }
>>>>
>>>> +       if (coredump->adev) {
>>>> +               drm_printf(&p, "IP Firmwares\n");
>>>> + amdgpu_devcoredump_fw_info(coredump->adev, &p);
>>>> +       }
>>>> +
>>>>          if (coredump->ring) {
>>>>                  drm_printf(&p, "\nRing timed out details\n");
>>>>                  drm_printf(&p, "IP Type: %d Ring Name: %s\n",
>>>> -- 
>>>> 2.34.1
>>>>
