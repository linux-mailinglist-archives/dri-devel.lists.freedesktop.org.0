Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A7A87B77C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 06:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABFE10F4F7;
	Thu, 14 Mar 2024 05:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H5Dgksfa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C79F10EEE1;
 Thu, 14 Mar 2024 05:58:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhLwXl8kfVurudJ0t6H8RT6uCBKy3aPswcLo0cTY583ow77zO9N0HUb3ZKkTkYjUlWdgBHZv1lBpuzP+bODBMQt/fRBM/jtNpdtFyL+jINRdf1GxFcamKpRYqSYlBnyeWXJXKOizStHnD9O8RzdK7SMKH/GfjgDlZi2m5oxwFmswqBu4fEb+lw4MvLm8itdpKsIeE23rEkj1aSrW/pty4I8hqpGT+FfgpBURJ3mXHO5LrxqYD9VQ16/kZpVLEyN9firLxqmkqHV61kPzuqCDecZukvBtgq4HjPVm6mJzBxHiGDKh1az7N/ZH9viAGI41hLVEgmNd0p9u0VJ6F0X1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aN3uPVgfDTsdjwI1T2oBkB27lqTtGcdaEU7rkzbG4f4=;
 b=bmYKtzxM4dqd8P8qItw5b2RdWyeHs4zu23jW54jLq4m/dnnGy3lORHW3fA1NHOGoU7AWqi7GoHEbR9es6S4viXyMknn/bmJb0uXxv86Wv0YfAK7LhFUU8g/y6+HWjWdJ2+BRGvYSAwPMoOrVv2DtYWlY/0mXp3rjv/VfIqlR3mdS5YuS9hyluDM83jL2odOiQvw475c956l0YmOjWgFnMtnCMgWRXbGq7KOGyuvsR86vmnuNEi1ddx2RlRWWaGe8/ohGgALGXvdI+jFVev1e8REx+kWZ0p1zXMNlknw6puN9v1GglgsX5j8HIzaOYTXTCUOx4RffCCqgua5ZRRhGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aN3uPVgfDTsdjwI1T2oBkB27lqTtGcdaEU7rkzbG4f4=;
 b=H5Dgksfal5rh3y9suoVHC/bS8DQq5X0NgYglvU2XB4CiazoHAMcaI7Zb5zv2zmqCvARIaePDdQwPbE6gOrRIAPr33JhIaZ6u+Vj1nnbKPExIqMT7DZ/+zXGT0zLSlEBOye0258iM3LqzBmfkmYUHJVTWzkUZXePOwOX+uCAXxDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Thu, 14 Mar
 2024 05:58:19 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 05:58:19 +0000
Message-ID: <498b87fb-727c-4ea2-9633-6ecbff436eba@amd.com>
Date: Thu, 14 Mar 2024 11:28:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm:amdgpu: add firmware information of all IP's
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240312124148.257067-1-sunil.khatri@amd.com>
 <20240312124148.257067-2-sunil.khatri@amd.com>
 <CADnq5_ON0NfcpmnHKjNYWgxfvfz-J3tgjX92DaaN63iKb+FOZg@mail.gmail.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <CADnq5_ON0NfcpmnHKjNYWgxfvfz-J3tgjX92DaaN63iKb+FOZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::18) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a24c8e7-a35f-4ad2-fc7d-08dc43ebbfa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xb2d+T/F7XKniPpCsz7KFFA9DhgaT4Oy/uW1vB0ZwsaVtMrcMtQJZBF1jkruYi3gKb25y6nwS7dgrU5m966a4zCE7MldlAH/5LvMa7Ss3kd+M6BK5k6lpxhfVxASRhQeSz+xphQ4bweS6TJo2+2fvUxus+C87dfCrs8J/kR8uGwrOnLMwATyp3zW4sWPXOyzUl3aBZEMI+sHC0UVdlSRHOWsqdbaG+rlXEcTYteJIiObSMscMpDk79+6SZmWxh1YwZVyGXDsLk3qO0aOg4qq1KuCPkztdNHeJQJdp+xde57yjDeAdQdR3zwpgJzVJhpduKikAekH+OrCAhIq7f2Eo6KlT5YpS3ZD9oObvwZrUVJfvgssDG3ZxgP1e/xCl3DZ2xpKuAyryIpqOF7HJT1TAoXurF9WYT5m6Z/XA8XEuk4eZxdWvNL8QnvWxJxy9wB8qNEzB2Gv9j9NU9qho7p0zX0OMUQrDvH+MwOgzEFWzAEx0ajjGTRNGKjulBIucGR6k1JkjXPH1NDyDQzjSAdjXm1mAbMX+Z4BPdjbZGJQicugerT1jXYbUwKTTHaBsgUyKVyovi5xY8BwJh+o2inTlE1GUhTpnGbc4K2akZAjeFbx1A3ZA9lcb2+rtuOkYh2r10p6WtDbuq825qzMV2rrZEs7310dfRh5uZpsOuqBq+w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0VXUWVxcEN5ang0Y2dHTVlwc1JYRmJMQjA1UFdqVTNidjc5UHZNdEVGQXBL?=
 =?utf-8?B?c0JxMEZpUGdmSTlQOTluRzFQUHRCQm9HWFN3a0lMT2swNENxbHJvbW45dStL?=
 =?utf-8?B?QVBpWWE4UmtPeE41dnQ0VlI2Q29jWWhielR1MmZtWVFOWnNiSzRmeVFLY2x5?=
 =?utf-8?B?a3FqcFFjdWFFSk9pNWhGTFpHTDdRc3ZiR0l5S3k5U2Izdit2RUR6WjQ2a3hU?=
 =?utf-8?B?QXRzKzE3WkFYVWlCTEZhWmZEcStKTHNxSHExRCtEclJXcW9TcDFPK3hTVDl5?=
 =?utf-8?B?TEtremdnUzVLYWVVSU9ENmNFaFVQekpkK044YTlSSktzMGt3LzN1M1cyNHA1?=
 =?utf-8?B?cm9ycDFlRENEcUIzTGVwc2huaDhxT05SYXp0M3ZEeWNrUkxnbUkyR082MkVi?=
 =?utf-8?B?c1VFWnlhMGhjWjBjZHlBbjlLYkYwbk1Tai9BR21qazlVd1ZQbkU0ZUhOcFZ5?=
 =?utf-8?B?dzFGNGJadGFBM1ZJU2JKNFhGMVRveklCNU1ETU9HeCtHTnMweWNtdGZLWlln?=
 =?utf-8?B?MUgyeXc1RDR4dXdNS1J3Q2dYOHgvalhpZHlTTVc5VHFBdFFGTzVsMndEL2di?=
 =?utf-8?B?bng4ckNnZm5LMGtsY0ZzZ0JlREZJVmE2ZlhOc1dISmlmVW9XY2JRWE5LcHhX?=
 =?utf-8?B?QzRYMmVxZmFqM3dtczNVVDRzMS93cVBmRGtNTnhqaDd0UW1UN1Nsb3Aybzl2?=
 =?utf-8?B?a0hKc2NMVmZ5REJGNzRzZStvZG9TaW1zandteHQ1c29jVzQwRmZON202ZDZk?=
 =?utf-8?B?UjBUVlZMM3hlMHQ2WllaK2ozL0I4b2xIOUtsMGh6VXVaTFowQWxURE9qblVu?=
 =?utf-8?B?U0hLZEtxQ2c1a08xcjV1ZGRnQ0hVNHlyMS80YUIvOUlqUVVnYlROQWZNbW9w?=
 =?utf-8?B?dHI2TnZmSjBCOUJxcTZvcXBDNkg3MHppRXI3UzBydEtZVVlRZUcrTU5rYlRZ?=
 =?utf-8?B?ZEgwd2svajRpNmJ3L250Y1l4R2xJRUdnaFRncEJQNVJ5eXlnL2lnYzdEVkJN?=
 =?utf-8?B?TlpZNktGOTVMR1FDaUlOOFF1RkNmOWRobUM4QkI0b1VJMEc5b2Z2NDdIQUE4?=
 =?utf-8?B?dTNTb0YxMU1RKzFDRi82Wk5lRWh5UTUxaG1VOUg1eWZlM09XT1htOVo1VG45?=
 =?utf-8?B?ZXRKbm9tTUZCRWpDRFQrM1dNOGc3QlBzYnRud0RIR0g1K2lrUllZUnlIamYw?=
 =?utf-8?B?RkhHWHJTVmpnemppWmg0WHJFeU5IdUJJMjVnMzl4WmVQamt4MXBpMGRUWjEw?=
 =?utf-8?B?VEFZcDNLT0V0SFJhRi84MU5tbm1zOTczOGtLVk5MZVVxV0hEME9kWTYvbk1o?=
 =?utf-8?B?NjI2bHFLZTJ3MnpicWUvR0kwYVUxbVhkbnlWSWY4blRuYXUxYlYyWXM1S1BN?=
 =?utf-8?B?S2ZQMEtZcTlSdFJiS0YyTWduR2xKV2hPUmJIdDVrVW9kbEJJR1dXVVdkTk4y?=
 =?utf-8?B?LzAwcDFPVm5SZWRZM0RFdkFwcDUrZjliVTRFYXBXWkt3M3NjTzRGNC8vK0l0?=
 =?utf-8?B?Z0JPWVpadE5tRTBDOGkwdGFsMnhKWVAyVzRZR0lnZktUTU9kMUxmcHhpRkNE?=
 =?utf-8?B?Wk93RjRwWlJHN2tQZHROeVNlV0RzUktBbTlJdm91TTVXTG00aGhsNHlxR1g1?=
 =?utf-8?B?SU1BTFZEcVlnK3RweHBScHcxZmdXSTJlUXBxTC9tVWtod3Y0eUJBeTNmWVlY?=
 =?utf-8?B?VmlGRXFEN3B1MHZwUTBUSUxaM3NUTllkOVpYY2xtK2FOc1ZOY3QzTVNxbGpT?=
 =?utf-8?B?aFZ6Z0lOajZOSkZBVDdDdlRSTmJYQlRaUEZLcDFnYXRVS3NVc2pRZGxMOFRM?=
 =?utf-8?B?ZCtyOHZVZ2tJVjhVT09pUDIzMk5YY3RpcXhvV0YwSVBPNmVwbU5UQitUNDBQ?=
 =?utf-8?B?UEV2bnFBeHZzdXp6R0lBb01TN011QmpuMmZzdWxXcTlGd1ZhVzhKeGJ5MmRl?=
 =?utf-8?B?NTFRa0NST2Y2ZjcrcDZiN1pOUi95OVdid1RIaGlUMStjK1AvSFBKS3cxNitG?=
 =?utf-8?B?Vm4vN2dEaUhWUjAvWU43eVJDeVQ2VXhidHFKMlJ5aWptb3NjQUJEQWVVUlJo?=
 =?utf-8?B?SjNmQzllTHpoa25LREVPTnM4K2ZCZkJwdGFFL3JxYzg4V2o0VkdRR3B1bE4y?=
 =?utf-8?Q?LqjMJnXnEHUD9L9t9HRAP9bV5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a24c8e7-a35f-4ad2-fc7d-08dc43ebbfa9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 05:58:19.5004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZHo3wIQp21aXboklUC9OCWMEdql45sOavM06XfqBf9nKwZjnbKdH8+Up1vii8hKzAGYDl5pR5jb55bfZIuj8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996
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


On 3/14/2024 2:06 AM, Alex Deucher wrote:
> On Tue, Mar 12, 2024 at 8:42 AM Sunil Khatri <sunil.khatri@amd.com> wrote:
>> Add firmware version information of each
>> IP and each instance where applicable.
>>
> Is there a way we can share some common code with devcoredump,
> debugfs, and the info IOCTL?  All three places need to query this
> information and the same logic is repeated in each case.

Hello Alex,

Yes you re absolutely right the same information is being retrieved 
again as done in debugfs. I can reorganize the code so same function 
could be used by debugfs and devcoredump but this is exactly what i 
tried to avoid here. I did try to use minimum functionality in 
devcoredump without shuffling a lot of code here and there.

Also our devcoredump is implemented in amdgpu_reset.c and not all the 
information is available here and there we might have to include lot of 
header and cross functions in amdgpu_reset until we want a dedicated 
file for devcoredump.

Info IOCTL does have a lot of information which also is in pipeline to 
be dumped but this if we want to reuse the functionality of IOCTL we 
need to reorganize a lot of code.

If that is the need of the hour i could work on that. Please let me know.

This is my suggestion if it makes sense:

1. If we want to reuse a lot of functionality then we need to modularize 
some of the functions further so they could be consumed directly by 
devcoredump.
2. We should also have a dedicated file for devcoredump.c/.h so its easy 
to include headers of needed functionality cleanly and easy to expand 
devcoredump.
3. based on the priority and importance of this task we can add 
information else some repetition is a real possibility.

>
> Alex
>
>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 122 ++++++++++++++++++++++
>>   1 file changed, 122 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> index 611fdb90a1fc..78ddc58aef67 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> @@ -168,6 +168,123 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
>>   {
>>   }
>>   #else
>> +static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev, struct drm_printer *p)
>> +{
>> +       uint32_t version;
>> +       uint32_t feature;
>> +       uint8_t smu_program, smu_major, smu_minor, smu_debug;
>> +
>> +       drm_printf(p, "VCE feature version: %u, fw version: 0x%08x\n",
>> +                  adev->vce.fb_version, adev->vce.fw_version);
>> +       drm_printf(p, "UVD feature version: %u, fw version: 0x%08x\n",
>> +                  0, adev->uvd.fw_version);
>> +       drm_printf(p, "GMC feature version: %u, fw version: 0x%08x\n",
>> +                  0, adev->gmc.fw_version);
>> +       drm_printf(p, "ME feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.me_feature_version, adev->gfx.me_fw_version);
>> +       drm_printf(p, "PFP feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.pfp_feature_version, adev->gfx.pfp_fw_version);
>> +       drm_printf(p, "CE feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.ce_feature_version, adev->gfx.ce_fw_version);
>> +       drm_printf(p, "RLC feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.rlc_feature_version, adev->gfx.rlc_fw_version);
>> +
>> +       drm_printf(p, "RLC SRLC feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.rlc_srlc_feature_version,
>> +                  adev->gfx.rlc_srlc_fw_version);
>> +       drm_printf(p, "RLC SRLG feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.rlc_srlg_feature_version,
>> +                  adev->gfx.rlc_srlg_fw_version);
>> +       drm_printf(p, "RLC SRLS feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.rlc_srls_feature_version,
>> +                  adev->gfx.rlc_srls_fw_version);
>> +       drm_printf(p, "RLCP feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.rlcp_ucode_feature_version,
>> +                  adev->gfx.rlcp_ucode_version);
>> +       drm_printf(p, "RLCV feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.rlcv_ucode_feature_version,
>> +                  adev->gfx.rlcv_ucode_version);
>> +       drm_printf(p, "MEC feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.mec_feature_version,
>> +                  adev->gfx.mec_fw_version);
>> +
>> +       if (adev->gfx.mec2_fw)
>> +               drm_printf(p,
>> +                          "MEC2 feature version: %u, fw version: 0x%08x\n",
>> +                          adev->gfx.mec2_feature_version,
>> +                          adev->gfx.mec2_fw_version);
>> +
>> +       drm_printf(p, "IMU feature version: %u, fw version: 0x%08x\n",
>> +                  0, adev->gfx.imu_fw_version);
>> +       drm_printf(p, "PSP SOS feature version: %u, fw version: 0x%08x\n",
>> +                  adev->psp.sos.feature_version,
>> +                  adev->psp.sos.fw_version);
>> +       drm_printf(p, "PSP ASD feature version: %u, fw version: 0x%08x\n",
>> +                  adev->psp.asd_context.bin_desc.feature_version,
>> +                  adev->psp.asd_context.bin_desc.fw_version);
>> +
>> +       drm_printf(p, "TA XGMI feature version: 0x%08x, fw version: 0x%08x\n",
>> +                  adev->psp.xgmi_context.context.bin_desc.feature_version,
>> +                  adev->psp.xgmi_context.context.bin_desc.fw_version);
>> +       drm_printf(p, "TA RAS feature version: 0x%08x, fw version: 0x%08x\n",
>> +                  adev->psp.ras_context.context.bin_desc.feature_version,
>> +                  adev->psp.ras_context.context.bin_desc.fw_version);
>> +       drm_printf(p, "TA HDCP feature version: 0x%08x, fw version: 0x%08x\n",
>> +                  adev->psp.hdcp_context.context.bin_desc.feature_version,
>> +                  adev->psp.hdcp_context.context.bin_desc.fw_version);
>> +       drm_printf(p, "TA DTM feature version: 0x%08x, fw version: 0x%08x\n",
>> +                  adev->psp.dtm_context.context.bin_desc.feature_version,
>> +                  adev->psp.dtm_context.context.bin_desc.fw_version);
>> +       drm_printf(p, "TA RAP feature version: 0x%08x, fw version: 0x%08x\n",
>> +                  adev->psp.rap_context.context.bin_desc.feature_version,
>> +                  adev->psp.rap_context.context.bin_desc.fw_version);
>> +       drm_printf(p, "TA SECURE DISPLAY feature version: 0x%08x, fw version: 0x%08x\n",
>> +               adev->psp.securedisplay_context.context.bin_desc.feature_version,
>> +               adev->psp.securedisplay_context.context.bin_desc.fw_version);
>> +
>> +       /* SMC firmware */
>> +       version = adev->pm.fw_version;
>> +
>> +       smu_program = (version >> 24) & 0xff;
>> +       smu_major = (version >> 16) & 0xff;
>> +       smu_minor = (version >> 8) & 0xff;
>> +       smu_debug = (version >> 0) & 0xff;
>> +       drm_printf(p, "SMC feature version: %u, program: %d, fw version: 0x%08x (%d.%d.%d)\n",
>> +                  0, smu_program, version, smu_major, smu_minor, smu_debug);
>> +
>> +       /* SDMA firmware */
>> +       for (int i = 0; i < adev->sdma.num_instances; i++) {
>> +               drm_printf(p, "SDMA%d feature version: %u, firmware version: 0x%08x\n",
>> +                          i, adev->sdma.instance[i].feature_version,
>> +                          adev->sdma.instance[i].fw_version);
>> +       }
>> +
>> +       drm_printf(p, "VCN feature version: %u, fw version: 0x%08x\n",
>> +                  0, adev->vcn.fw_version);
>> +       drm_printf(p, "DMCU feature version: %u, fw version: 0x%08x\n",
>> +                  0, adev->dm.dmcu_fw_version);
>> +       drm_printf(p, "DMCUB feature version: %u, fw version: 0x%08x\n",
>> +                  0, adev->dm.dmcub_fw_version);
>> +       drm_printf(p, "PSP TOC feature version: %u, fw version: 0x%08x\n",
>> +                  adev->psp.toc.feature_version, adev->psp.toc.fw_version);
>> +
>> +       version = adev->mes.kiq_version & AMDGPU_MES_VERSION_MASK;
>> +       feature = (adev->mes.kiq_version & AMDGPU_MES_FEAT_VERSION_MASK)
>> +                                       >> AMDGPU_MES_FEAT_VERSION_SHIFT;
>> +       drm_printf(p, "MES_KIQ feature version: %u, fw version: 0x%08x\n",
>> +                  feature, version);
>> +
>> +       version = adev->mes.sched_version & AMDGPU_MES_VERSION_MASK;
>> +       feature = (adev->mes.sched_version & AMDGPU_MES_FEAT_VERSION_MASK)
>> +                                       >> AMDGPU_MES_FEAT_VERSION_SHIFT;
>> +       drm_printf(p, "MES feature version: %u, fw version: 0x%08x\n",
>> +                  feature, version);
>> +
>> +       drm_printf(p, "VPE feature version: %u, fw version: 0x%08x\n",
>> +                  adev->vpe.feature_version, adev->vpe.fw_version);
>> +
>> +}
>> +
>>   static ssize_t
>>   amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>>                          void *data, size_t datalen)
>> @@ -215,6 +332,11 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>>                  }
>>          }
>>
>> +       if (coredump->adev) {
>> +               drm_printf(&p, "IP Firmwares\n");
>> +               amdgpu_devcoredump_fw_info(coredump->adev, &p);
>> +       }
>> +
>>          if (coredump->ring) {
>>                  drm_printf(&p, "\nRing timed out details\n");
>>                  drm_printf(&p, "IP Type: %d Ring Name: %s\n",
>> --
>> 2.34.1
>>
