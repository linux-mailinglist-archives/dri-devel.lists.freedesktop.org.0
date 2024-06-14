Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8D2908D43
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 16:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBAE10ED66;
	Fri, 14 Jun 2024 14:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l3Yc1ei8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE3210ED63;
 Fri, 14 Jun 2024 14:21:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJcG4f/4Yv3RKUWdvAI12xp1bmip2VGXIADxXjIHShWtnUO7oYODOXH3oMeFecQJqYkq1R925vSj8vNrKd5Slq8bQfrPH2UiyqebiBjnzf6OKzRFYCW7pwLpQRvAdIFXr9UbJ8C72VYBMCAoW705684wNWDi/1GyomLxUgpaxOcEo+BhoFyP6MyDewST5pa/EKenuOHpLtbuZ3h90Nm3a1YOLYG4N3LGGaWkqCiH9Z8RIwfcs2GU0+OEQ20NUQ8ENVD1TJFVD+sFfpCN9f9ogFRQFjR1qpqypUn/GJukp86QrPlB72//cP27WuKbPUR/kwqiuy+8HjfjJJlWvjqQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAGlZa74IMgq/x4egsClzwChSG06QzHy5bUIt8zh9uQ=;
 b=FfL7trF7OUKgfYTyRe/BBEKoSGikRCjidpfGaDFdYlJI2xw6VH5kdxE29q7aY/w6sf22SKTMMFz9sx/ubT4djlCjQh4Z9+OGdRfYj+Q8LRF7vmcH336W7+nFd/U9p/WG030Rd6AN0NSOnHUpScBUSRBph1/pDCLZMpfR5QQxkdNNYTecIo2EIDXdHNvZYofpMRQKXIbUwThKkBtG4aJEvFfQMX+N1OvrmBOR5ARtJFGVr39RqiNNVwhcGs+UGB+tGTMU5IQgx6F0Uj7xyMZd8LC3RjFLLExlYndO9IdmftCQ2RNw3wy4T4XvSSJsKqppCvpm3G9H4mP0f1T8jAnfww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAGlZa74IMgq/x4egsClzwChSG06QzHy5bUIt8zh9uQ=;
 b=l3Yc1ei89glunmcFMq47uDOtsn803GPtXj4Y6aZMAjs5AsNv7BR7JZy2Owdqg+P9ME8GBxn6K6m9TsDV/JK51UuYEzau2pAv7NaB4gL6qSwYSQNgHWyi3W1xpU5C3B6CPA0IwCu3GEDoNuSR1cPBuz4HLuvqmYq8mPrp2M+UxRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 14:20:56 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 14:20:56 +0000
Message-ID: <87bd6014-953b-478e-a36e-6d493444dcd0@amd.com>
Date: Fri, 14 Jun 2024 09:20:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/fb-helper: Detect when lid is closed during
 initialization
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Chris Bainbridge <chris.bainbridge@gmail.com>
References: <20240613051700.1112-1-mario.limonciello@amd.com>
 <f5485db8-9e1d-4b95-a0ec-25ee8551795d@suse.de>
 <df7dc942-4e65-4e3a-8b10-6f4f0d1ef602@amd.com>
 <ec2b6450-2176-494c-a061-b21a08d657a2@suse.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ec2b6450-2176-494c-a061-b21a08d657a2@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eed5337-0916-4ec4-ea2e-08dc8c7d34a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|7416011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VitLaklSMDMwOVhRbDh3VkowbW41aDhpTzRLS1I2NzRxelk1bkpzSU44cXRh?=
 =?utf-8?B?aFc4czJpZExRTnFXTzBwWHpHcXg3QmNkeG82RXF0aDVPa2RUOGc5YUxTcXVX?=
 =?utf-8?B?MEtEQ3ZYTW9JSVN5eGl3TFZRNnZoM0NEc1pJZkV5NXVqQWgreTJCcktwZHkr?=
 =?utf-8?B?T2Q2NnhLUXU5MzBSZzUrM0E4TGsvNWxRck5DdzByYzIvelcyODNtcmFxVXhF?=
 =?utf-8?B?MEMwbG5uaHdUa3hJbnhDQUx6VThuUDN1RFF4a2dUcUt1ZE56SkZXaE9Ddk1v?=
 =?utf-8?B?QkxybXVKNWJJM1dBSmFQY3RFenRKWEFlNDlRWTZXTllJTWJEM01PSGJzcUpt?=
 =?utf-8?B?UHNnRDd3UmhUblZVYVREU1dsTFY5b3AwczZHVFlwUSsvOFN6MkhDTngyOVFQ?=
 =?utf-8?B?TWZjRUUyZ0EyTjM5TkRwNk83c1JhdHZkSUY4VnNwS0g3QW1LZWNoWjNsOVRV?=
 =?utf-8?B?dXR4dm1nWllGWkVLOUhpRFJIc01rRHpNd3hKMGVOY2psZFFqL1UyQ01VMkhW?=
 =?utf-8?B?eFNJUWJEMC9pOEd6T3FlaWxwVUFaeHRDcUttRFZIaGxXQmRRaDJBSlJqQU1Z?=
 =?utf-8?B?VU5UUFdrTFNUaXczeDdIRVpwRXRDVE93V3dFb2k4eHVVTDFrK3h0dmZaME1W?=
 =?utf-8?B?REtET2FZUXBLdmpWS1ZpZll2aHZSY0lGU2tpVXA1YjN4NlVHTTZEZlFlVHUr?=
 =?utf-8?B?TURVZCtLZ1VtSHE2WE5SbE4zUTY5eThmWDZQaVpVc0w1MXhzSThhM1p4UkNt?=
 =?utf-8?B?K3Z6dlNsRjRKdXl5ZEVsTDZubHd6eEZXUXA4MFVPNkhRY1FpRkp4UTJNRmVM?=
 =?utf-8?B?b0Qyc25KQ0JpamYzaTJCY0N3SjMxMzZOUER5dkNYT1BDaktTd3k5QmZ3T2lm?=
 =?utf-8?B?aEtaZjRHRDhvK0xQcG1UcDdNb0ZDWU5ScytqcEpaemZ3bzEramM5NUh2cEox?=
 =?utf-8?B?bTR3Qi92VXFsUVZKcXVkY0lNNkxEVzR6bXZ5aGZlNTdSOXFNQkpvZTZGbnJt?=
 =?utf-8?B?cmVzUGI5NWpIdjl5eWZjaUpad2c2cGlob3duT21vQzl1UXZhY0ZNcUdkU0hx?=
 =?utf-8?B?RlFXV1JMSE40N0dkaUdBaGU0Mjl3alFidFZoejhqZ3UxRExUQ2p5YWdob3lN?=
 =?utf-8?B?VGJGWlN0bTFzOWpHeWZzd0hBVytiMjIxazNPWjVtdkp2TjZxaXJWQ1BRaXBF?=
 =?utf-8?B?K1UyeUJvQWFyVWFKNDY0bHpReWJzeTFIM09zOTZmakxXTDNXSU5OYXRhUks0?=
 =?utf-8?B?Y1dmdkltRDFTWHBSNytpMkdkbHVjemJKUVhUUm9sTGRCNUVodk5UOXdpSzE1?=
 =?utf-8?B?dDUrTVB6WlNSbFJTZldncTYvcFptdmFDS2ZMbGFTMGx2d3FvVU5vVEtqRFpE?=
 =?utf-8?B?VFhkTDNjWEJ2OHIzQXNaZkFBdE16T2VORXVnQ2hPTm92NE85YzNIWEFZblVh?=
 =?utf-8?B?ZEoxTWQ1QXQ5VnNmR1VqSzE4dTVkUWtjb3MvNktpRGJVcmtHNVBQaWZnc0hG?=
 =?utf-8?B?cnN2UXpUTzg5cm1JYSt5aFdyMzR6cHBCbzFYdDB0ZllOOFRyK014RmtncHNa?=
 =?utf-8?B?SHZrZUpYaWdtaTdxdFdwc1l5V201YU1RT0t0Z21pMTY2V2UrRy8wUCt1R1BU?=
 =?utf-8?B?L2VOcXVaUzZKNFQwRXBXaEhvTE5sL0tReXczM010d0xjSUZ5S0ZUczQ0Tmxs?=
 =?utf-8?Q?L+9OYyBnA7mOwo7CqKRk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(7416011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXdYc0dFb2tCTExHMWZMendhMVNXWDIzMUw4U3lnbSszdW1KcGgzL3NvSFVl?=
 =?utf-8?B?OWJrMFM0RmVvZTBmZmlha2Z4TXp5NHc0TWhuRjU5TWxsTGhaT0FyVGZ0SHR2?=
 =?utf-8?B?MC9nT0gwMlZpU3dpdzJ6ZjlTalVSS0NjZXIyM3BPVk0wZFBTSzVST2phenBR?=
 =?utf-8?B?Ym5GV3NXVTNldzYyMkdUc1M0SEkvMVk5UGVlL2dvZUFHRzJyRTZLQ1NJUERL?=
 =?utf-8?B?SEtrUTZhOWpUZllKcGl3Y0ZQbGZqRjRWQlNNdkFRRDlxYnBFOGhIVnpGT3N4?=
 =?utf-8?B?T2tJb25VeURhZmx6V01NWkhvQTdYY2srYXFCWm13ejgvQmQ1R2d1bnpBTng5?=
 =?utf-8?B?ZUIzMW5aeGh2WWhhQXNWWnBOdlltUDdnWmZUdUdwcTMwUVp2S1hxSEM3d3hv?=
 =?utf-8?B?L2IvQnlscEZSeVEraEFrV0lBcGovTXcrVzQ3OVJIOUprMmtYaUZsVDJ2TCtK?=
 =?utf-8?B?VnhuZmtYNlhwK3hkVWdXZXJZSFpVVXBxcEZTMXM1VDVsekViSHEreitXZjN4?=
 =?utf-8?B?SytBTjd6OC9BYTAzd1A0YlV2eFA2anFqcVNTc0pYZVdIU2VNWUd1RUZON0Fw?=
 =?utf-8?B?ZHRsL2tza2Q3djVVSGNpbC8waWtxTUtDb2xKbk5pb09Jbnk2TzBzZHFleUlx?=
 =?utf-8?B?a1NxSEwwb2dBS1VxMXdsR0FGUER3N3VUZ0RHS1lScjQxRXRzeXNHdWZwRjZW?=
 =?utf-8?B?aWJNSFRtMmxzeG9TUGhvZ3VIRkdpM3V1c2x3MmhKZTZXYmRPbEpOaUc5MkdI?=
 =?utf-8?B?VlJlOWRsVDBoZXh5RmpjWDlSdGtuWU5mbDRvTVI1bkhxMU40eFpVZVh2RHVp?=
 =?utf-8?B?SHZleGdGYi9pNXdRSkN2Q0RjcHJvNHlnVzkvYXpJTGxOck1FcDBoWUx2SmNl?=
 =?utf-8?B?SUhzNzV2czNKL3hJbm1vdTNMOGRLUGQ4N251THFLR1BPQktpYU9rVyt0di80?=
 =?utf-8?B?bTdBQmVjc2JNN3ZvZ001Wkk3akNQdU1YOThPeExMbEoxSHEyOGhuZlZEMk1G?=
 =?utf-8?B?OGUwZFJvQ05seXoydEYwajV5a1lhdXlLQlNnUktSZWNHVGk1U0pmQ2hwY0Ex?=
 =?utf-8?B?K1lmWnIxNHRDVjdGRzJOdmIxaTk2SElYVG5GWGd2MHVTMm8yZVBKQnZPNmFY?=
 =?utf-8?B?WWhrZkt3RWtMT1JwcEtJanlhVjRvTzZKOUhXdmVZbFEzUWFXMnppb3NrSFpR?=
 =?utf-8?B?ZzcraXdHUW51cUpJQ1gzcnd1SXM3SHowcnhXT1FNLy9lRVM5ZEhSM1ZVZjA2?=
 =?utf-8?B?YjF1aVkxcHV3THBuWXpSdGVCRTJWaHAxTHc2MDJSa2pNQ3BRaVNsdFdPNm9o?=
 =?utf-8?B?K1BlWElLUGlqLzlIcTdYKzk4d2h0YWgzQlJVQm9nRTh0OENPNW8zb1loVkhG?=
 =?utf-8?B?dzVBSlJrL01KdkEvbmFqc093U0ZqTTVXbnBLUVRyMlZnandUMm5VME91K1VT?=
 =?utf-8?B?K0pGWk5QUmRGZ2NGM2VsYS9oNGE0K3BsTWdVektvMlJCMXgwSG0rQm5CZFV2?=
 =?utf-8?B?QmlDNllZamhDYXBpS1d5QVpEM290TnIrbjFHWWdGTDN0WlVqRnVJd1FmTHBL?=
 =?utf-8?B?ZXBCNERBdlZOMzVMaENOQXJzSHdJdC9QWkNPZCtpSHFDbkdxdngxS1orOGJJ?=
 =?utf-8?B?K3hNN2g0c2htMDNwLy9WWFBkSXRHSHVmenlwMkJIQVJyY29IVDNIa200aVNi?=
 =?utf-8?B?YVVZcEVzZGU0bkdOcjJrWVdrb2VmU0xXbmFDeVFlVEhqNUszVUZrbWFyeDg0?=
 =?utf-8?B?aDVwaTY2RFNFdjNHenBicEhtZ0ZRRDBZUHA5QnRLNGswYTJKMTIwamNTOVBF?=
 =?utf-8?B?dFpIeWhONmRYc0d0YUhVSlZhbVc3R2lkcTRhZzlKZkZ2QlU0MFhyZFhmRXRD?=
 =?utf-8?B?dEpGdHk2WUxCZXJZbWNhbDBleXBzV3R2TjRIbTNCczEzT0tCZG5LY2tsczdX?=
 =?utf-8?B?enM4SWhaTlA5WXg0UEZHZnJMa3hKZ1FobHlHc094N2dYdWs3bGx3dWIrNU9K?=
 =?utf-8?B?TTFDOHhHWG5vUGdSUmE4MXpTcUxqZDdaR3RwTmtyS3FrZk1oYjkyaGkwKzdo?=
 =?utf-8?B?bHZ5NzROd1hOWFNpOE9oRHpWbjVnQTBjTUJvRFFPczlWZ2NQR1ZqYVRCTUtZ?=
 =?utf-8?Q?o/J8ilgoXMGapD1RJhShOgLDQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eed5337-0916-4ec4-ea2e-08dc8c7d34a5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 14:20:56.3867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCU1/6HWyMogmkbDEuwVDG22sq6lvPBdug/W8szuvpxmc26Hk5ZgkLwqprCIWKzHHze4TfTTU2MjJgdHK7sEAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6668
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

On 6/14/2024 09:17, Thomas Zimmermann wrote:
> Hi
> 
> Am 14.06.24 um 15:47 schrieb Mario Limonciello:
>> On 6/14/2024 03:15, Thomas Zimmermann wrote:
>>> Hi Mario
>>>
>>> Am 13.06.24 um 07:17 schrieb Mario Limonciello:
>>>> If the lid on a laptop is closed when eDP connectors are populated
>>>> then it remains enabled when the initial framebuffer configuration
>>>> is built.
>>>>
>>>> When creating the initial framebuffer configuration detect the
>>>> lid status and if it's closed disable any eDP connectors.
>>>>
>>>> Also set up a workqueue to monitor for any future lid events.
>>>
>>> After reading through this patchset, I think fbdev emulation is not 
>>> the right place for this code, as lid state is global.
>>>
>>> You could put this into drm_client_modeset.c and track lid state per 
>>> client. drm_fb_helper_lid_work() would call the client's hotplug 
>>> callback. But preferable, lid state should be tracked per DRM device 
>>> in struct drm_mode_config and call drm_client_dev_hotplug() on each 
>>> lid-state event. Thoughts? Best regards Thomas
>>
>> This is pretty similar to what I first did when moving from ACPI over 
>> to generic input switch.
>>
>> It works for the initial configuration.  But I don't believe it makes 
>> sense for the lid switch events because not all DRM clients will 
>> "want" to respond to the lid switch events.  By leaving it up to the 
>> client for everything except fbdev emulation they can also track the 
>> lid switch and decide the policy.
> 
> 
> All our current clients do fbdev emulation, possibly others would be the 
> panic screen and a boot-up logo. A panic screen doesn't do actual mode 
> setting, but any other client would most likely want enable and disable 
> the display depending on the lid state. Having this code in the DRM 
> client helpers make perfect sense. But as it's global state, it makes no 
> sense to set this up per client. Hence the suggestion to manage this in 
> per DRM device.
> 
> It would also make sense to try to integrate this into the probe 
> helpers. When the lid state changes, the probe helpers would invoke the 
> driver's regular hotplugging code.

Got it; I'll do some experimentation with this change, thanks for the 
feedback.

> 
> 
>>
>> I also worry about what happens if the kernel does a hotplug callback 
>> on lid events as well at the client choosing to do it. Don't we end up 
>> with two modesets?  So then I would think you need a handshake of some 
>> sort to decide whether to do it for a given client where fbdev 
>> emulation would opt in and then all other clients can choose to opt in 
>> or not.
> 
> 
> What do you mean by the kernel does a hotplug event and the client does 
> one? There should really only be one place to handle all of this. If we 
> end up with two modesets, we'd get an additional flicker when the lid 
> gets opened.
> 

I'll see if my worry is founded after I move it all over.

> 
> Best regards
> Thomas
> 
>>
>>>>
>>>> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>>> Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> ---
>>>> v2->v3:
>>>>   * Use input device instead of ACPI device
>>>>   * Detect lid open/close events
>>>> ---
>>>>   drivers/gpu/drm/drm_client_modeset.c |  29 ++++++
>>>>   drivers/gpu/drm/drm_fb_helper.c      | 132 
>>>> +++++++++++++++++++++++++++
>>>>   include/drm/drm_device.h             |   6 ++
>>>>   include/drm/drm_fb_helper.h          |   2 +
>>>>   4 files changed, 169 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_client_modeset.c 
>>>> b/drivers/gpu/drm/drm_client_modeset.c
>>>> index 31af5cf37a09..b8adfe87334b 100644
>>>> --- a/drivers/gpu/drm/drm_client_modeset.c
>>>> +++ b/drivers/gpu/drm/drm_client_modeset.c
>>>> @@ -257,6 +257,34 @@ static void 
>>>> drm_client_connectors_enabled(struct drm_connector **connectors,
>>>>           enabled[i] = drm_connector_enabled(connectors[i], false);
>>>>   }
>>>> +static void drm_client_match_edp_lid(struct drm_device *dev,
>>>> +                     struct drm_connector **connectors,
>>>> +                     unsigned int connector_count,
>>>> +                     bool *enabled)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; i < connector_count; i++) {
>>>> +        struct drm_connector *connector = connectors[i];
>>>> +
>>>> +        switch (connector->connector_type) {
>>>> +        case DRM_MODE_CONNECTOR_LVDS:
>>>> +        case DRM_MODE_CONNECTOR_eDP:
>>>> +            if (!enabled[i])
>>>> +                continue;
>>>> +            break;
>>>> +        default:
>>>> +            continue;
>>>> +        }
>>>> +
>>>> +        if (dev->lid_closed) {
>>>> +            drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, 
>>>> disabling\n",
>>>> +                    connector->base.id, connector->name);
>>>> +            enabled[i] = false;
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>>   static bool drm_client_target_cloned(struct drm_device *dev,
>>>>                        struct drm_connector **connectors,
>>>>                        unsigned int connector_count,
>>>> @@ -844,6 +872,7 @@ int drm_client_modeset_probe(struct 
>>>> drm_client_dev *client, unsigned int width,
>>>>           memset(crtcs, 0, connector_count * sizeof(*crtcs));
>>>>           memset(offsets, 0, connector_count * sizeof(*offsets));
>>>> +        drm_client_match_edp_lid(dev, connectors, connector_count, 
>>>> enabled);
>>>>           if (!drm_client_target_cloned(dev, connectors, 
>>>> connector_count, modes,
>>>>                             offsets, enabled, width, height) &&
>>>>               !drm_client_target_preferred(dev, connectors, 
>>>> connector_count, modes,
>>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c 
>>>> b/drivers/gpu/drm/drm_fb_helper.c
>>>> index d612133e2cf7..41dd5887599a 100644
>>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>>> @@ -30,6 +30,8 @@
>>>>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>>>   #include <linux/console.h>
>>>> +#include <linux/input.h>
>>>> +#include <linux/mod_devicetable.h>
>>>>   #include <linux/pci.h>
>>>>   #include <linux/sysrq.h>
>>>>   #include <linux/vga_switcheroo.h>
>>>> @@ -413,6 +415,128 @@ static void drm_fb_helper_damage_work(struct 
>>>> work_struct *work)
>>>>       drm_fb_helper_fb_dirty(helper);
>>>>   }
>>>> +static void drm_fb_helper_lid_event(struct input_handle *handle, 
>>>> unsigned int type,
>>>> +                    unsigned int code, int value)
>>>> +{
>>>> +    if (type == EV_SW && code == SW_LID) {
>>>> +        struct drm_fb_helper *fb_helper = handle->handler->private;
>>>> +
>>>> +        if (value != fb_helper->dev->lid_closed) {
>>>> +            fb_helper->dev->lid_closed = value;
>>>> +            queue_work(fb_helper->input_wq, &fb_helper->lid_work);
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>> +struct drm_fb_lid {
>>>> +    struct input_handle handle;
>>>> +};
>>>> +
>>>> +static int drm_fb_helper_lid_connect(struct input_handler *handler,
>>>> +                     struct input_dev *dev,
>>>> +                     const struct input_device_id *id)
>>>> +{
>>>> +    struct drm_fb_helper *fb_helper = handler->private;
>>>> +    struct drm_fb_lid *lid;
>>>> +    char *name;
>>>> +    int error;
>>>> +
>>>> +    lid = kzalloc(sizeof(*lid), GFP_KERNEL);
>>>> +    if (!lid)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    name = kasprintf(GFP_KERNEL, "drm-fb-helper-lid-%s", 
>>>> dev_name(&dev->dev));
>>>> +    if (!name) {
>>>> +        error = -ENOMEM;
>>>> +        goto err_free_lid;
>>>> +    }
>>>> +
>>>> +    lid->handle.dev = dev;
>>>> +    lid->handle.handler = handler;
>>>> +    lid->handle.name = name;
>>>> +    lid->handle.private = lid;
>>>> +
>>>> +    error = input_register_handle(&lid->handle);
>>>> +    if (error)
>>>> +        goto err_free_name;
>>>> +
>>>> +    error = input_open_device(&lid->handle);
>>>> +    if (error)
>>>> +        goto err_unregister_handle;
>>>> +
>>>> +    fb_helper->dev->lid_closed = dev->sw[SW_LID];
>>>> +    drm_dbg_kms(fb_helper->dev, "initial lid state is set to %d\n", 
>>>> fb_helper->dev->lid_closed);
>>>> +
>>>> +    return 0;
>>>> +
>>>> +err_unregister_handle:
>>>> +    input_unregister_handle(&lid->handle);
>>>> +err_free_name:
>>>> +    kfree(name);
>>>> +err_free_lid:
>>>> +    kfree(lid);
>>>> +    return error;
>>>> +}
>>>> +
>>>> +static void drm_fb_helper_lid_disconnect(struct input_handle *handle)
>>>> +{
>>>> +    struct drm_fb_lid *lid = handle->private;
>>>> +
>>>> +    input_close_device(handle);
>>>> +    input_unregister_handle(handle);
>>>> +
>>>> +    kfree(handle->name);
>>>> +    kfree(lid);
>>>> +}
>>>> +
>>>> +static const struct input_device_id drm_fb_helper_lid_ids[] = {
>>>> +    {
>>>> +        .flags = INPUT_DEVICE_ID_MATCH_EVBIT | 
>>>> INPUT_DEVICE_ID_MATCH_SWBIT,
>>>> +        .evbit = { BIT_MASK(EV_SW) },
>>>> +        .swbit = { [BIT_WORD(SW_LID)] = BIT_MASK(SW_LID) },
>>>> +    },
>>>> +    { },
>>>> +};
>>>> +
>>>> +static struct input_handler drm_fb_helper_lid_handler = {
>>>> +    .event =    drm_fb_helper_lid_event,
>>>> +    .connect =    drm_fb_helper_lid_connect,
>>>> +    .disconnect =    drm_fb_helper_lid_disconnect,
>>>> +    .name =        "drm-fb-helper-lid",
>>>> +    .id_table =    drm_fb_helper_lid_ids,
>>>> +};
>>>> +
>>>> +static void drm_fb_helper_lid_work(struct work_struct *work)
>>>> +{
>>>> +    struct drm_fb_helper *fb_helper = container_of(work, struct 
>>>> drm_fb_helper,
>>>> +                               lid_work);
>>>> +    drm_fb_helper_hotplug_event(fb_helper);
>>>> +}
>>>> +
>>>> +static int drm_fb_helper_create_lid_handler(struct drm_fb_helper 
>>>> *fb_helper)
>>>> +{
>>>> +    int ret = 0;
>>>> +
>>>> +    if (fb_helper->deferred_setup)
>>>> +        return 0;
>>>> +
>>>> +    fb_helper->input_wq = create_singlethread_workqueue("drm-fb-lid");
>>>> +    if (fb_helper->input_wq == NULL)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    drm_fb_helper_lid_handler.private = fb_helper;
>>>> +    ret = input_register_handler(&drm_fb_helper_lid_handler);
>>>> +    if (ret)
>>>> +        goto remove_wq;
>>>> +
>>>> +    return 0;
>>>> +
>>>> +remove_wq:
>>>> +    destroy_workqueue(fb_helper->input_wq);
>>>> +    fb_helper->input_wq = NULL;
>>>> +    return ret;
>>>> +}
>>>> +
>>>>   /**
>>>>    * drm_fb_helper_prepare - setup a drm_fb_helper structure
>>>>    * @dev: DRM device
>>>> @@ -445,6 +569,7 @@ void drm_fb_helper_prepare(struct drm_device 
>>>> *dev, struct drm_fb_helper *helper,
>>>>       spin_lock_init(&helper->damage_lock);
>>>>       INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
>>>>       INIT_WORK(&helper->damage_work, drm_fb_helper_damage_work);
>>>> +    INIT_WORK(&helper->lid_work, drm_fb_helper_lid_work);
>>>>       helper->damage_clip.x1 = helper->damage_clip.y1 = ~0;
>>>>       mutex_init(&helper->lock);
>>>>       helper->funcs = funcs;
>>>> @@ -593,6 +718,9 @@ void drm_fb_helper_fini(struct drm_fb_helper 
>>>> *fb_helper)
>>>>       if (!drm_fbdev_emulation)
>>>>           return;
>>>> +    input_unregister_handler(&drm_fb_helper_lid_handler);
>>>> +    destroy_workqueue(fb_helper->input_wq);
>>>> +
>>>>       cancel_work_sync(&fb_helper->resume_work);
>>>>       cancel_work_sync(&fb_helper->damage_work);
>>>> @@ -1842,6 +1970,10 @@ 
>>>> __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper 
>>>> *fb_helper)
>>>>       width = dev->mode_config.max_width;
>>>>       height = dev->mode_config.max_height;
>>>> +    ret = drm_fb_helper_create_lid_handler(fb_helper);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>>       drm_client_modeset_probe(&fb_helper->client, width, height);
>>>>       ret = drm_fb_helper_single_fb_probe(fb_helper);
>>>>       if (ret < 0) {
>>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>>> index 63767cf24371..619af597784c 100644
>>>> --- a/include/drm/drm_device.h
>>>> +++ b/include/drm/drm_device.h
>>>> @@ -316,6 +316,12 @@ struct drm_device {
>>>>        * Root directory for debugfs files.
>>>>        */
>>>>       struct dentry *debugfs_root;
>>>> +
>>>> +    /**
>>>> +     * @lid_closed: Flag to tell the lid switch state
>>>> +     */
>>>> +    bool lid_closed;
>>>> +
>>>>   };
>>>>   #endif
>>>> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
>>>> index 375737fd6c36..7fb36c10299d 100644
>>>> --- a/include/drm/drm_fb_helper.h
>>>> +++ b/include/drm/drm_fb_helper.h
>>>> @@ -143,6 +143,8 @@ struct drm_fb_helper {
>>>>       spinlock_t damage_lock;
>>>>       struct work_struct damage_work;
>>>>       struct work_struct resume_work;
>>>> +    struct work_struct lid_work;
>>>> +    struct workqueue_struct *input_wq;
>>>>       /**
>>>>        * @lock:
>>>
>>
> 

