Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3536B387E4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 18:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985B410E15F;
	Wed, 27 Aug 2025 16:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tWIdsCE1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD0E10E15F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 16:41:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkwtbMBhtF+xN2F79f2BoCDoWhd1CfN76MrGA6SpB2lOl1/LyJwqva2JCiR7kcJFjlF57y9wZFgfpTyuII3spaioc6t3hhlwXyAzhaNkJ5NWigpRrspZDrWWso+AW0Z6FM2/IAYf7viMSCX5Gj4g5PS1DV48FeLDVj7e1JUHlXW85cXsSVmxFra73s47kzsD5CW8yE/SVCUA6G1sLmPQAxORjD35gjI8mnBckcskzYH5SoUJ91K/ybRCKx9bheT4mJC/wOQmNcv2P2jzxkJbU7kSEfMqxu9NLbdV9HEYtPQz9gGis5n9Xespca6a/K2mHh/QHyB+NaOeRHRadSnBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeaaiM4dTMay5/1o9dmGebiKV+yrCqqruUamX3tVL0w=;
 b=PGpYBwlZ6XE/vyf4+yiywrJUoqd8xl5+ys9+AhKGVk1/fFnDjXP5KBDIjdilU7LLcI6WC6o/EHDQQoHWY+MPJPNXzbbg26geEO6uvI7xDor6TourMeNJPpBhoPEQGFwCAwPjctrEyA/RpV7YBk528+J3hAKNsL5t+p2/11eAeb7IO2xZ0JybY1jDoSw/BVZD19yJtL/0zp9/PyNqf4zR01mjNV2ED+ngqRawzMTvBvXzfHHqZlvX3jptIddLHWdSfJ0q51Luqm2bTFwP1WZeybTOWPr5nio+ayKXZ0P+IvjI9ol3uB5QFqDH3Jc4Lgf1QHXzWeqmdi2dSBTd1Z+JJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeaaiM4dTMay5/1o9dmGebiKV+yrCqqruUamX3tVL0w=;
 b=tWIdsCE1vZ8Z2b9pbpQ0iU5ICFF+UoeY0kcBHGjXOUWYC6SkToDWXcFsVnnJHKysMYljcz4OPDalwMj2u2k/nrIJIW4nrubHJt3Xo+YsZVh3Ue3LoaDvBf0lmP4bvXDqZqL/q4Z3kUnBVLUTfgMEig5AoFxTgAe9PsAE7xJfZDY=
Received: from BY5PR13CA0009.namprd13.prod.outlook.com (2603:10b6:a03:180::22)
 by MW6PR12MB8833.namprd12.prod.outlook.com (2603:10b6:303:23f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 16:41:28 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::bd) by BY5PR13CA0009.outlook.office365.com
 (2603:10b6:a03:180::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.5 via Frontend Transport; Wed,
 27 Aug 2025 16:41:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 16:41:28 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 11:41:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 09:41:27 -0700
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 11:41:27 -0500
Message-ID: <492b465b-03d5-e80e-a31a-79ce4b1f83f7@amd.com>
Date: Wed, 27 Aug 2025 09:41:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20250822172319.377848-1-lizhi.hou@amd.com>
 <2bec1429-4f8c-472c-99a1-420a33a3d316@amd.com>
 <d6a02baa-3b05-73e6-9c2a-66c257efecc3@amd.com>
 <a9814644-96e3-456f-90b7-8705a102c938@amd.com>
 <2a21100b-2078-a166-0b47-9db6b4446b5a@amd.com>
 <b758a72f-e30e-42f9-a6aa-6f6297b8cce3@amd.com>
 <b3874221-5b4f-9625-de8a-4e54dc6884a2@amd.com>
 <c048645d-480d-4b7f-8dde-efb095b2c2fa@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <c048645d-480d-4b7f-8dde-efb095b2c2fa@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|MW6PR12MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 57dec3fe-07d5-4775-152d-08dde5889227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tm9tTGRlYkVXdndPVDhGUTlBV3MvR0pHTXlCUTlFRHRzeUFqUDRFSmRORnM5?=
 =?utf-8?B?MzR4TjREMDM3bnJNdURXeXRRSysyd1IyN0hLam1IbUt4OWFOMHIxU0E3cXdS?=
 =?utf-8?B?WWVoczQyd01MMmdvd0lXVE9LWkNONW16UkVWTGwvM3QwemFrYitHMVBkbnN5?=
 =?utf-8?B?V3hsWWZwNjNOQzVrUjg3UXRFWDVOTjY0bVZIbGpMM29YZ1JCU2U4NGtKWVVU?=
 =?utf-8?B?ZGlJWWg4T1ZKajhQbmswbkVKR2MxNWdCd2xnLzVqZHVQdkpvRUVzKzFQZS9W?=
 =?utf-8?B?NERLbWRUR2VNN053SzQ1SnBubjEzbUIvTVNKSkVpeGNxWUVwWlFFMEEyM1Np?=
 =?utf-8?B?TGs5RHY5ZlhCL3czRGhKdnl5VDdYeXB6bW5CZHExMnJwalZ0cmg2OC9zZmtX?=
 =?utf-8?B?WlJBSk5jcmdRazUwYmVyME12Q2h2cGFSdjFKZ0M3cnRCYTROWUtiaGZrMytl?=
 =?utf-8?B?Vy9kOFoybmtVVFIzb3JJU3FaNVFUakRuWEJNU0JVbVUzbUhPT1owd1F6VkVk?=
 =?utf-8?B?YUhFRkIyVW9TQmFlWnFYM2pSV0ZoMjhXSWZsVmxNNk0yaEVwVjJQV3JCTVJt?=
 =?utf-8?B?RWRQWFN6bjUrWDVpTnpXNHhsbVNwYmJ1S3Fhb0V2MTJ3UUcyYWhnNHNDR0hP?=
 =?utf-8?B?ekJMSEtaSzFTYTNkMUorSm9rTnptREpTQ04yc2txS1ArUklZaEozN0tLQ1Aw?=
 =?utf-8?B?eUF6Q3ptcEJsZjIrMXgwMUphRzliNGdRVU01bTlqS1Bzb2tZSkkzN1pNakNK?=
 =?utf-8?B?NWFCdm5IQ0ZOR1JOblhnMGpzcU9Hd1Z6TkdFREZxL0xqTUZWSGJ5VWR0MlRp?=
 =?utf-8?B?R2ttMnRTaENjSTZSSHUwWVZsbWdVQ2NPaTBhK0pKLzgyczUwU0YzNGp0L1Qv?=
 =?utf-8?B?ajhja2V2TTRhQVNMejJHUEJhOGNwekJZeVVqbVNUWHpkWWxSeVRmSUt6RCt5?=
 =?utf-8?B?ajU0OG05S09tdWliRlhqQy9BV2xkaFhpY1kzNVJRKzJlN2VDMXh6bEtJekxt?=
 =?utf-8?B?elpoQ2VIUThSVDJNNmJXVGkrK05lanBUWitvbCt6THRDWG01aTM5MkIySmV4?=
 =?utf-8?B?a0JRbEkydUNmUDd5Tzd4L3puVHJEOFNENTlnc3RyMG81NU5kcXdpWlVDVkMr?=
 =?utf-8?B?bytobzQ3aFlEQTZMOWl6RzZaUWQ1RytUSVFCT1h5cENhTDV1UzEyeGxyRHZX?=
 =?utf-8?B?QmVvNFJOMTZ4QjBDenFZTTVZRlA5VVpHYm9adVFrdDN4NjJzZDZGelQvYk9o?=
 =?utf-8?B?Z0dGZElDZmdRcWo5a0xmNndPdHJ3Qk44bFpDczhVblQ0ZHBwK2h0ZjljTTU1?=
 =?utf-8?B?MXo5aGhtTXBVeVVITG5NVGk2a1RlL1h3N21JMW1NbUdRUnY3WVNaV0NqOERj?=
 =?utf-8?B?YkJSdllCbVVzaHQ5eXFjWGNWeVE0UjFFK014UmgwYWNFZHZoenJRSjdmSXE1?=
 =?utf-8?B?bGw0Y1RwTDVKNzRaRElQSnk5bjM3bTFua1hPZHdDYi9mWWcrOW1pWnU4VG9a?=
 =?utf-8?B?dm1iM25Zb2xTWmFabkV3NVBIRFFueHR6NzRub1lHUm5xM2oyVnVXOHg0YWNZ?=
 =?utf-8?B?NUlGKzhaRkNJWjlLUVVyK3R2SmovT2RjM0JpRkdOS09RUEZuRjBhR2JDeVlF?=
 =?utf-8?B?K2hhVUE3bXF3endBU0VsdkFBVU5rYVNxZ08zRlp0NURHbUhhWGl2cXFFd29F?=
 =?utf-8?B?OSt3akNUbXlzanJickhGeDRGemZYRDVEbERBaGV4RURocHpKc0s5R2tYa0I1?=
 =?utf-8?B?UTJkWG41Z29DWkNNbjhNZHNQNlVXTzlnL0hVbVJQSU1EbVFweFhtQkhyeHJq?=
 =?utf-8?B?VVBRcStqYTR4UXVoK1dpemM2eUtvUC8vZ3dPWlNJWFlYd2VSb3VTOHNUSC9D?=
 =?utf-8?B?eDlFb1hvcDRLdGFwWXk0RTVCa1FaK3Q2WEhTcTNrNjRNMUJZZHdvU3dqTEJ1?=
 =?utf-8?B?a0FTV3ZyRm1ld3Bicm1vSXR6eDM1QmpCcU1pOVdNU2tzeFk0NUN0cUxkMGts?=
 =?utf-8?B?Vnp6SXJ5WlZFMkN1RS9xQjZOdEV2WE9jZDdZYVh5cWtZdDhXRXhTTFF4RFN1?=
 =?utf-8?Q?y6tPWQ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 16:41:28.5470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dec3fe-07d5-4775-152d-08dde5889227
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8833
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


On 8/26/25 17:31, Mario Limonciello wrote:
> On 8/26/2025 1:10 PM, Lizhi Hou wrote:
>>
>> On 8/26/25 10:58, Mario Limonciello wrote:
>>> On 8/26/2025 12:55 PM, Lizhi Hou wrote:
>>>>
>>>> On 8/26/25 10:18, Mario Limonciello wrote:
>>>>> On 8/25/2025 11:48 PM, Lizhi Hou wrote:
>>>>>>
>>>>>> On 8/25/25 14:28, Mario Limonciello wrote:
>>>>>>> On 8/22/2025 12:23 PM, Lizhi Hou wrote:
>>>>>>>> Add interface for applications to get information array. The 
>>>>>>>> application
>>>>>>>> provides a buffer pointer along with information type, maximum 
>>>>>>>> number of
>>>>>>>> entries and maximum size of each entry. The buffer may also 
>>>>>>>> contain match
>>>>>>>> conditions based on the information type. After the ioctl 
>>>>>>>> completes, the
>>>>>>>> actual number of entries and entry size are returned.
>>>>>>>>
>>>>>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>>>>>
>>>>>>> How does userspace discover whether or not the new IOCTL call is 
>>>>>>> supported?  Just a test call?
>>>>>> The kernel header version will be used to determine whether the 
>>>>>> application which uses new IOCTL will be compiled or not.
>>>>>>
>>>>>
>>>>> But it's not actually an application compile time decision, it's a 
>>>>> runtime decision.  IE I can compile an application with the 
>>>>> headers on kernel 6.18 that has this, but if I try to run it on 
>>>>> 6.15 it's going to barf.
>>>>>
>>>>> To some extent that comes with the territory, but I'm wondering if 
>>>>> a better solution going forward would be for there to be a 
>>>>> dedicated version command that you bump.
>>>>
>>>> For in-tree driver, I did not aware a common way for this other 
>>>> than checking the kernel version.
>>>>
>>>> And here is qaic patch of adding a new IOCTL.
>>>>
>>>> https://github.com/torvalds/linux/ 
>>>> commit/217b812364d360e1933d8485f063400e5dda7d66
>>>>
>>>>
>>>> I know there is major, minor, patchlevel in struct drm_driver. And 
>>>> I think that is not required for in-tree driver.
>>>>
>>>> Please let me know if I missed anything.
>>>>
>>>> Thanks,
>>>
>>> Right; so bump up one of those so that userspace can check it. Maybe 
>>> "minor"?
>>
>> I meant for in-tree driver, is it good enough for userspace to just 
>> check kernel version?  E.g. The drm driver versions are not used by 
>> ivpu or qaic.
>>
>
> Just because they don't doesn't mean you shouldn't.
Ok. :) It does not sound amdxdna specific. Just wondering how the other 
driver/application under accel subsystem handle this.
>
> Take a look at what amdgpu does for user queues earlier this year for 
> example: 100b6010d7540e
>
> This means that a userspace application can look for that minor bump 
> or newer to know the ioctl supports user queues.

As in-tree driver is part of kernel, the userspace application can check 
kernel version to determine whether a feature is supported or not. Could 
you share the idea why would user application to check drm driver 
version for this?

And amdxdna driver is new added driver which never bumped drm 
major/minor before. Thus there is not any application use drm versions. 
Maybe using kernel version directly is good enough in this case?

I am fine to bump minor if it provides better support to user applications.


Thanks,

Lizhi

