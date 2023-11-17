Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1CA7EED12
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 09:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309B710E724;
	Fri, 17 Nov 2023 08:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B1810E725;
 Fri, 17 Nov 2023 08:04:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGbHCNa+uTrWTnEoMGsNYhKutpvDJ2+Pp5t7b2MNBFWpuzsSTZ4EbPyXmz6BtkoCY/gzDpek2uJ1/fRlBZT6ypW1fLwWTUtv4qxEMeK/PKSX77tts/Hk1EJXdnp0dYyWHAG+ZHCxQ88aQb/O+bY5tdM/yWeNNvtEWmLlcF/u6P54vju6yO/NresHVgcbo5Z+IMzut3UNAz40ClBKujgLXChFnUg6DTX3xFLYFkaC4C1hV9l+Y89nBdJCkkJzN2jkFfafzjKyegMNG3Xdm0u/OT+ssFi5sH6oFKfHIAx4Zu8RrwKQ7zXODNmpldd/zgfUI6eBpdYZMevRarcRoJ1HTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3DJ6nwt8FU4fRyZTTl/+QCMjJE9R4TYdakQhcavDrI=;
 b=adlYg/2JpgDCcpMEobJ+WDub7hupnMV5diiuOMJmzI3/SJK3ib1v5CjjRFHfk4qejn+t5XjLEB6fo3oWfnXvUSwEwSWOntvAHH8dRGM9aXnxVJgGYG2KluG8znpIQ6DrqBT6h2XlDLksiy5wegDg1Srr+PGxzOsI4CYMWSPUi4uz5R2L0awvDm5BId/gA3uTXfqTtvhhzCymaWZG4vlK8/6jV4hHI0gzQQz+21MRERA3xr1IFvO4ONONY9AHGeAhEnQ9WRb62QpUvvD5V1MylFwfn4BEZHQQec3EZ/rqPrwlTMx0PRs/kyKtCNfcGNfeRWD7wjsFdf08V2jlVGsL4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3DJ6nwt8FU4fRyZTTl/+QCMjJE9R4TYdakQhcavDrI=;
 b=QkyUOpeVY1wHx15zx5+rqx5S///8PKkP0DFnm8KagN8daafElAHu8XkqLPrrVeQ1HKEPyoB1mD5NRWqoo7z3zSD0ww0VMszyBLo0cbLQnxQv5oNE86zXsJkE1l5HnkyOG7oBOhGjRqx5lM3MKeYNOhnPxpv1ttmWopG5U2EJLLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB6835.namprd12.prod.outlook.com (2603:10b6:510:1b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Fri, 17 Nov
 2023 08:04:40 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649%5]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 08:04:39 +0000
Message-ID: <8e2fde3e-bc8e-4c58-af93-c406dc6ac151@amd.com>
Date: Fri, 17 Nov 2023 13:34:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
 <20231018070241.2041529-14-Shyam-sundar.S-k@amd.com>
 <9e6c4a42-fbce-c5ea-15ce-5eb22fc3767a@linux.intel.com>
 <84af64f2-42bd-4e09-a1c9-bde2a935c8f2@amd.com>
 <92bba3b3-a3f9-4fab-86c7-4d0ef4c23fcb@amd.com>
 <238f915f-b95f-4d85-ad67-66781f53e75d@amd.com>
 <e143bbe2-212c-cfc8-131f-8ec9c0bff56d@redhat.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <e143bbe2-212c-cfc8-131f-8ec9c0bff56d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::20) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a572fbd-1e1f-4b29-0b8c-08dbe743d930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WLeeGkCM4fSu3EpYwrMWSj44aRwRLopa1WeUv7gj74p5w6eP/X90ulzKXH60WGbNIRm7WzgPubZ8MWqVAeD7PIEL5P7EO/b4G7xqUSGpgOtp7EfdlqfSfv9HzxCa36oty0BiZPSuxLqPcqK4O+ZgGCAcypWY1Plo3h0Aa/33relAsWma/KAA+cWkHGKEY4m+odspvmTr2FS7pHQiPgAvwrBufUxsNwoK+p065ouZbhU1e+4lXtkK+uKYJhKnHEDpj3Wlc0ghkdnsNuxuVeHcij1HXVVcszpSO+y6vqVlgCtqn8TQK7UkUTXvNTOikqrmhr3XvdA8UD4zurSPNaJhKmWz9tp26xGzQx9cmo4/+XTxxD9gmfzYle7vBN4+Anth6ru+kaYfTqFedz/SC2dJkEB2t5yYk2VrCUmJLIs+Qsweju3Uvo6gc1vOoCAz5wbeBLwD86EQprBVmhUcO6eB50aHRX8ZL3b99MgV2fqq0hiJbk9Goux7ziOkeWtUmIrWq6QJogCPn6vXjV3HBydSF6hRLydEGJW+1yemCoU9y0uIMB+9IVW5o1aa3ZJ4wIMdNkHviTQm9I3ibE6oDuXF+HVyWO7K6945z1Q9sgl6fXpGaSujbIQkr7Dcdsz89+l1qOIz1VVxxDfE4T3gi7xMUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230922051799003)(1800799009)(451199024)(186009)(6512007)(26005)(7416002)(2616005)(66556008)(6486002)(508600001)(36756003)(8936002)(31696002)(4326008)(86362001)(2906002)(110136005)(66946007)(66476007)(8676002)(5660300002)(6506007)(6666004)(53546011)(38100700002)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VU04RlZZaG5ydE1wME1EMGE3NTVMemJXdVl3aW9wc1hQcytlQndrYWtabGFQ?=
 =?utf-8?B?ZjRhQkg0blhwUHZ6dXQ3WkVhOGdxR0hXT1dFSnJjeVNSK3VYMERPbEdYYjJo?=
 =?utf-8?B?WFEvSFNvK2d2MDBWcFdWdys1YzRmWW9UNU9HTWs2cVdXSS9LakE1c0owQU1M?=
 =?utf-8?B?MUl3ZzhLcUQ1eWkwaEJHM3BPaHBQTnc2dHpnL0lwZ01uaHp0NVN4WFA4M0hk?=
 =?utf-8?B?RnlmN2p1OUJBRWMzTm42aGZ4Wmx5Z1dlaDBLUkdjOFBxYmVqSVZvQnNCcFZX?=
 =?utf-8?B?aFBFYTh4QU5XRy8wQ1lBb1d2NXZaREt3QWRsMElTMmJjZEV1OXJlMXhESTc3?=
 =?utf-8?B?S0w5VklOcWRNNjEzbTluQ1daRm1MTTRlZHRvdjBWWHhCWkUyU09NL0ZlemZo?=
 =?utf-8?B?VmRBUUV0NzF1OEpGWmQ1NjN3VVlkMDJDRWxVVFU0eUEvNDlTKy9qcnIwS0pV?=
 =?utf-8?B?Qloya0d6TUJ0RTlOOHlTK3k0cHM3NmhabG1rTVhpb0g3c09ScEl1azRzUWph?=
 =?utf-8?B?M0FrWTQ4akRtblh2NzNWNTg3bzBlK2ZIZXV1YSsxUkQ2WjFmcU05S24reS92?=
 =?utf-8?B?UkFmYWg4Q3IzWXQ4WU5IaExJWXZSWlVTQUx1RDBKak40NTlBYUt0UVZLcjR4?=
 =?utf-8?B?Zm5zeTdqTWlrY3c5U2s2NWJJdFZWRGFPWXRwN2RLYU9yQkY3QlZxZjZnZXlZ?=
 =?utf-8?B?ejUyMWRrNzcyb1dGRWRpL01VMHphaTZEaFQ1MzJCQlBqeTJXWlZET0FWRXEw?=
 =?utf-8?B?aWFzRlJ4bzBBSk9lK0RTL2RvSEpzWnFYQUJ1d2VkVGZzTElvQXo4ZzVlOHgz?=
 =?utf-8?B?RXR0TWI1UENDV3h5bmxTK1I5SFlXZS9rOW95bDc4NDVIQkY2QXhMc01sYXRS?=
 =?utf-8?B?b0xBR3VrVk54RFFNdlR4TkJnd3k5VDZMc3RLamZjQVRRU09jNm02WWVtMFlD?=
 =?utf-8?B?cEhZb3Axb2ZTSmRQVFBPc3dyUlBIbG9Ubk93d2I4WGlVd0FBRWlWNEdMT1Bq?=
 =?utf-8?B?QnZZRmRSRzczc2FDeitjYXBUUmxrcUpEQU43TWVVcXJiV1ZFRi9HdTdZTkpN?=
 =?utf-8?B?MUVFVlJ4SmloM3Bac1pLci9yWTcxQWoyUkNuazBOUUhGUm1VM3ZuRENWYSt4?=
 =?utf-8?B?V1oxY2dYS1NURCtCci9sWittcVVFWitZTVJoaC9oRXRkVTFPN28waXNXYkZJ?=
 =?utf-8?B?RHZ4dUJPZFEvSEhUTkxpTmV4TWRSOW93TDNSQ2Vwa0c0MGF4THJobG1DdGMy?=
 =?utf-8?B?bU42Z2FaVDhXMHlKMysyMGtNL2cvWEljRHBTaDFKMkxEUU9CdllUZndaZ0cy?=
 =?utf-8?B?bHZndm1SOWpvcW95RnZZZjRKdGNtNmZaOHhnQ2VnRHdzVXB6V25OMkRrbFRJ?=
 =?utf-8?B?Sm91bmtKZmk3T1RWS3JmcUZDWjB4dWpqUFI3R3VOeDlzdFJmMUEzN2p4ZnVJ?=
 =?utf-8?B?eCttakNGcmhrS2dxZzVYcTlXbDBJN1M1d2VtajhFakpzSFlQQWJoYjQxWHZO?=
 =?utf-8?B?UlN5Z2JNOGhOamdCQnA4YU1YNzV1NGxYeTdpdTdQMkxqM0xLeHhNaFFQNk93?=
 =?utf-8?B?SkEvSDhzTXFwblRId2NHUjhvNE5SY3hxY1N3aHlHL2FHM2t5Umpxemh3YWRn?=
 =?utf-8?B?MGN2bGt6OW9xYnBlWE5aeEpPSkZDTXRneWRBVHN4bkVqYno1N1M5NW9BVHRi?=
 =?utf-8?B?MzYvd3Vqc1RNTEo5VG9PSEtJd0xPbFQyUVFLbmt2SjFtY3o0VVVUZWxsblA0?=
 =?utf-8?B?U2N5YURlVVl0K08wWTkyUDZ5ZXY5UDNuS2piZjhBWHdabWtaVWxMTHp5RUJH?=
 =?utf-8?B?RGwzcklJSk1icUZBaDFWYk14WStHTnJBWktDN3U2SFRYOXI2c0l5WkU5TVhz?=
 =?utf-8?B?N21GRk03aU02K0VGbTNUQkE2blByTkNpOEg4TGNLeHZ3TzVGMzQ0dGNhaW5y?=
 =?utf-8?B?QmhYb0x5R0VmNUxXNFRZTHpkYW84Mnd3VTlzUGM3bFliQ29UM3BwSzVzdFkz?=
 =?utf-8?B?dXRaYkVEZ25tak5PczhHekV1TUhXYXJhNlRoYWlJbnNBMzZjRlJQd09acWo4?=
 =?utf-8?B?eWphQ0NvcWlOMVA1SFBqWEZhL0RWU040UjdKR3J5R25jMEVOWmI3NzV5STNI?=
 =?utf-8?Q?Yi6bVrXQktRvkK0LB65fINZ3H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a572fbd-1e1f-4b29-0b8c-08dbe743d930
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:04:39.8620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjD1F4eyqChjzBjbORWhVrr9OfuRitkUXg0z7zAlnlAzQdA3rhifLbLIyM5n0YD0+7WF4aHqPMSIS0qO6mJC9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6835
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
 jikos@kernel.org, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, markgross@kernel.org,
 benjamin.tissoires@redhat.com, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

Apologies for the long delay.

On 10/19/2023 12:38 AM, Hans de Goede wrote:
> Hi,
> 
> I was not following this at first, so my apologies for
> jumping in in the middle of the thread:
> 
> 
> <snip>
> 
>>>>>> +static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
>>>>>> +                     unsigned long *state)
>>>>>> +{
>>>>>> +    struct backlight_device *bd;
>>>>>> +
>>>>>> +    if (!acpi_video_backlight_use_native())
>>>>>> +        return -ENODEV;
>>>>>> +
>>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>>> +    if (!bd)
>>>>>> +        return -ENODEV;
>>>>>> +
>>>>>> +    *state = backlight_get_brightness(bd);
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
>>>>>> +                     unsigned long *state)
>>>>>> +{
>>>>>> +    struct backlight_device *bd;
>>>>>> +
>>>>>> +    if (!acpi_video_backlight_use_native())
>>>>>> +        return -ENODEV;
>>>>>> +
>>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>>> +    if (!bd)
>>>>>> +        return -ENODEV;
>>>>>> +
>>>>>> +    if (backlight_is_blank(bd))
>>>>>> +        *state = 0;
>>>>>> +    else
>>>>>> +        *state = bd->props.max_brightness;
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
>>>>>> +    .get_max_state = amd_pmf_gpu_get_max_state,
>>>>>> +    .get_cur_state = amd_pmf_gpu_get_cur_state,
>>>>>> +};
> 
> So first of all, good to see that this is using the
> thermal_cooling_device APIs now, that is great thank you.
> 
> But the whole idea behind using the thermal_cooling_device APIs
> is that amdgpu exports the cooling_device itself, rather then have
> the AMD PMF code export it. Now the AMD PMF code is still poking
> at the backlight_device itself, while the idea was to delegate
> this to the GPU driver.
> 
> Actually seeing all the acpi_video_backlight_use_native()
> checks here, I wonder why only have this work with native backlight
> control. One step better would be to add thermal_cooling_device
> support to the backlight core in:
> drivers/video/backlight/backlight.c
> 
> Then it will work with any backlight control provider!
> 
> 
> 
> Last but not least this code MUST not call
> acpi_video_backlight_use_native()
> 
> No code other then native GPU drivers must ever call
> acpi_video_backlight_use_native(). This special function
> not only checks if the native backlight control is the
> one which the detection code in drivers/acpi/video_detect.c
> has selected, it also signals to video_detect.c that
> native GPU backlight control is available.
> 
> So by calling this in the AMD PMF code you are now
> telling video_detect.c that native GPU backlight control
> is available on all systems where AMD PMF runs.
> 
> As I already said I really believe the whole cooling
> device should be registered somewhere else. But if you
> do end up sticking with this then you MUST replace
> the acpi_video_backlight_use_native() calls with:
> 
> 	if (acpi_video_get_backlight_type() == acpi_backlight_native) {...}

Thank you very much for your detailed feedback. This helped.

I have moved the code from amdgpu to PMF driver which has changes for
DRM. This also has changed w.r.t thermal device change what you suggested.

I have used the checks where ever appropriate:
acpi_video_get_backlight_type() == acpi_backlight_native

Kindly take a look at v5 submission.

Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
> 
> 
