Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662E8BB0DB7
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 16:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FBF10E72A;
	Wed,  1 Oct 2025 14:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mVxlohFa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613CC10E6EF;
 Wed,  1 Oct 2025 14:54:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qN853ZQAdmWetc+M3NMZC892kg1haeNJJ5bhLBbCCpiTKT6KDwr1GrtgMNHaPxFUiX4iFp7jOcbdgO+g2kjtS/7TykQXvOV8ZstKrlAU6kwmne+xKRp/tB7TO4GV8930f6rst1OOe07C1UHhhUSJ2exe9Ja9iTazrqEFI33k6QEnL5BtmAUvhIYjeOAVGAs+3bnWMMILrG6elNt4uGyq3nlJa/G1LqTooFMs5dnaWbpjXkoxLJseGINBlgX3vvhFwgHrVyt/SBgY6/khp6PGsigfrAju4JOWHKWLyC/MCCIofHJ4zTAwRSRrYZgYgcHm1Sk98EEql8phD+1rcSArcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JV/fQ5s8vz+bYZqZ02n58yn3beGK3L4HK2kvws+y3YY=;
 b=kQQycWuVAVjjHGUnwnNlz1HVoLCN5R0dquEbUjcazfdh4MlfZp0rydk1eUu43nFS0WdQ+baAxxLp8WQH9AeKDg/My5vhcgCnhnPp6uf8CRDU0kjGqgCcKVyduPZJDu8KQakrhEYdHxFkoJQsYU3eeBv7D6UnAYpJiP6JAXQUaOXfzI5IZoC/u2ZxGsQASJnHPrAm36xtoi0eFSHZxZxKkH4txUbmiNtKiZXJo9NIH5uxqUJefHvwnxllAIOpWeGkwc2Z4At53u5UsEMxXPt0aeyVaWiEc3tmN28jxki++52TRgjwXNR0h16fviMJR7cvNPqeFedWO+U87+YjgmvAKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=suse.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JV/fQ5s8vz+bYZqZ02n58yn3beGK3L4HK2kvws+y3YY=;
 b=mVxlohFah28x7At527vKtflEK9bpifQM2Zq9igbnlTC0CRYhY5Vrr8PSnEi3HVIgUirG2FEKVvSut6QIgJxTFbS7OWZSv1ZxY2pyiGyBhWf/VjV49jrXjEDxxe+qe0L3jLbe11Oo5FqA2k8Tqs3Ufd78aNmllq6lDYr/QpBJEbimva444tcJ0YhJhbcmSD5IJy1+MmIvQMp7zMi6nED0v0fdIaNAJk2gC0BwOd+V8RMjL0eK9TE0706PGmo++LaV0dtpI8W2HJjkCgKCKpGvA9rBj3/3sJdSfvBEJ0NimxUVrrEWs/tqRFDfZ+chvpqKWTXOpQp03cDNqV9alLsNog==
Received: from BN9PR03CA0158.namprd03.prod.outlook.com (2603:10b6:408:f4::13)
 by CY1PR12MB9649.namprd12.prod.outlook.com (2603:10b6:930:106::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Wed, 1 Oct
 2025 14:54:47 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:408:f4:cafe::bc) by BN9PR03CA0158.outlook.office365.com
 (2603:10b6:408:f4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 14:54:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 14:54:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Wed, 1 Oct
 2025 07:54:33 -0700
Received: from [10.221.136.222] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Oct
 2025 07:54:29 -0700
Message-ID: <0b5b5188-b24d-486c-8c7a-015848cdb9ce@nvidia.com>
Date: Wed, 1 Oct 2025 16:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/client: Remove holds_console_lock parameter from
 suspend/resume
To: Thomas Zimmermann <tzimmermann@suse.de>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tursulin@ursulin.net>, <lyude@redhat.com>, <dakr@kernel.org>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <jfalempe@redhat.com>, <javierm@redhat.com>
CC: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20251001121610.367243-1-tzimmermann@suse.de>
 <f0cc9358-98b2-48c4-b080-c16728dcd40b@nvidia.com>
 <eecf1071-55a4-4cbe-bd8e-a00e5ef9b8ce@suse.de>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <eecf1071-55a4-4cbe-bd8e-a00e5ef9b8ce@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|CY1PR12MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: 958c7902-68d9-47ca-372f-08de00fa75b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjhvSzhtaTBmSnAza0haM3NlbXRpMmlSS1dvMVprQiswVld3ZzUzZ1NQTTYw?=
 =?utf-8?B?WmxXeFdnZXN2K0JwVlV0aG1ySHhBY1Y3VW5DMWdpeHJaekZUYjNtNE42WVVI?=
 =?utf-8?B?MzMzREpHU0xXUmxvTDZSQWV0QW1KZ255NU0zQ2tqd3FaMlFJdWNCOWUySXE1?=
 =?utf-8?B?QlI2OEM4aDNDaUVzWmFNSW5IZ1Y0ZHdkZ01YSmRKbnZmNFNiZ1hEbzZaZFp3?=
 =?utf-8?B?MUpTeGQwdXVZQ2JzREVSVVhwM0plcFBTM2FVQXZaQzY0T0tCRExJTTlZMnR3?=
 =?utf-8?B?bWp1bG1mQXBkN01hKzJQa3VVWTlWQjhsbU9ZQUxEK3pmSnlTWnQwMTVqc1c5?=
 =?utf-8?B?YTY5bHJHbTRTWmZzRHRCdzg2ZW5sbzZ5K3ZoV0RBcFJtVmZMZ0p2U2hQUTM3?=
 =?utf-8?B?djBFQUhBdkRiWE4rcHZ5aURmS2JTV0drVzZGdll4dkM2VFNpcUFPNWZPdXRm?=
 =?utf-8?B?dGk2ZGFzbHVia3NmZWZyb2ZkSWwveFhoYWVWTmU2VmF2K1hMbkd5TmxRTDJT?=
 =?utf-8?B?cFBnZ3JVeTFPWjYrSTdncjc0cW5SZGMvNUl2UjdZb1FqdmdFYk1pODFJV09k?=
 =?utf-8?B?RlNDNVpLbjdObWxZWGRPajBZaG1keSs4L29kbG1YTjZMemQvYktsSlYrbHhv?=
 =?utf-8?B?WXp5elp4N1k2cGVmY0t4czlwT3pmWWpMeTZOMllqd05DaVBSV2hzLytFVHdh?=
 =?utf-8?B?QzZYTmJoTzNXbG52VnJZKzZrS3QwaUgrRG9nSTcxcGxQcjJtY2NqdlcyaDVP?=
 =?utf-8?B?eUJkOE1Temp1SzF3NGN6UHJLTFNQNDBKN2Uxc2dzZlp3czM2R1VZclB2M3JP?=
 =?utf-8?B?WFVxektkUDY5TVpVTGpPT0xHNVRpYWlLRC8ycUZwaEhxakN3b0V0bEpNaThW?=
 =?utf-8?B?cnF1a25SMnl5WlhBcVRXU3dGWjJ2bHgwOGxYV0Q2R1NCZm04S1ozOGdIZ3hV?=
 =?utf-8?B?L1JGeFViVjdrL1JWdnlSZ2tVOTVzNkdDQ2lPWVdVcDhiRzZZVkxiRUJkUmVD?=
 =?utf-8?B?bTFLeE1oQlFwU0NIUndjbzA4MEdDYU1qdWRmNFdFeHNteXBldlc0NmdKTEE2?=
 =?utf-8?B?ZnNMNEZUODJKR2E3L1ExQ1BNaU5lUFVmRkxKUkdPWFVKbUtpN1FBSE5XOXdm?=
 =?utf-8?B?d3gxWEFvSkd4MHJTUS81UnlRN0xTWm0rUmFWVjRERWlpSVBueXhaamFWZGZk?=
 =?utf-8?B?aXR6dWJkSEVUMUI3aXlUWW4yWGRLYzBCTndKMDIxcTZaemk0LzZ2c3JVaTcv?=
 =?utf-8?B?Rjl0WEk1V3JGU0d2OUlCSUN2eXdOMXJZamtZd0NLcWJ4cGJsNTdMY0UyRzVz?=
 =?utf-8?B?N3RrOGRYbGg1cnVWU0JVM0lZRkFmZW9zUkdQTnNUMzg1ZFg4d2s4cXZoVERl?=
 =?utf-8?B?dmZwZzhCMlFPL01oMDF3Zi9RdmhndXRRWVdXcnhnY1EzcHZzdjVSdCtMVHUv?=
 =?utf-8?B?dnRuTVBncCs5UjJsVy9JdEw1UXVwdnpuenQ5bGExdjN0KzdYT3VpSXNtQXFI?=
 =?utf-8?B?cU9NOHRjRDBlMThkem1yWS9GSVdYUWtkL1JGc3BodUcvSGFyRDFwWEt1ejhp?=
 =?utf-8?B?OVhFa1dhYlpZRXhPNGpxK2kweTFHdTJiQ0lObEpYVndyMFhFOWVyUzhjRGRv?=
 =?utf-8?B?RXlaUVc2ZXpQMGVldEhFRFIvOFVEWEVjcTQ0cUw0WWxFTThNcE5pVUs0U0N1?=
 =?utf-8?B?RWpvU2dBcWdSb2lFR2JGdXZJTjBBRkNTbytOUUFEczdwV2JuTnlDbnU0VUtR?=
 =?utf-8?B?N1RtamVIZTNyV2xvWmVGUXliT1BYS0l3Vk1mUitua1JVeXRKbW1pUkJXd2Ur?=
 =?utf-8?B?Vmg1clpsMUVsZG5WR1pFVmtQeFJuYVRGb0hJYVhjV3FQYmJmTFVEdEJLeUI5?=
 =?utf-8?B?NTNWWnlNVnhDQU5ieDRFdmc1Rm0vYjhadHR6YmR2bWRzTnZZZmxnbzJlSEE3?=
 =?utf-8?B?elVVNXE4c1JmT3hjMmJmWHZCdXhLb2RWek1HbEZOOWRDQzBLUzUrdjBiZUt2?=
 =?utf-8?B?RWVyeHNDUHdFWFVhZ01PeVpka1lydjZYdHB1dGQ5ZWFDUjY4TXNvVkVrRTdN?=
 =?utf-8?B?OVF2UTRRWHkrNFRYL0h4ampJRTNYak9mZ0ptelc3Rk0xbmJWNkc1SkV0cVhK?=
 =?utf-8?Q?yjwiCdtjChxqWVeVORXavfkCj?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 14:54:44.8115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 958c7902-68d9-47ca-372f-08de00fa75b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9649
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


On 01.10.25 16:39, Thomas Zimmermann wrote:
> Hi
>
> Am 01.10.25 um 14:46 schrieb Nirmoy Das:
>>
>> On 01.10.25 14:15, Thomas Zimmermann wrote:
>>> No caller of the client resume/suspend helpers holds the console
>>> lock. The last such cases were removed from radeon in the patch
>>> series at [1]. Now remove the related parameter and the TODO items.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Link: https://patchwork.freedesktop.org/series/151624/ # [1]
>> Acked-by: Nirmoy Das <nirmoyd@nvidia.com>
>
> Thanks. I sent out an update that addresses the CI issue before seeing 
> your a-b, but it will be included when the patch lands.

No worries. I was about to resend my a-b to the v2. My a-b remains same 
for the v2 as well.


Thanks,

Nirmoy


>
> Best regards
> Thomas
>
>>> ---
>>> This patch would preferably be merged through drm-misc.
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  8 ++++----
>>>   drivers/gpu/drm/clients/drm_fbdev_client.c | 14 ++++----------
>>>   drivers/gpu/drm/clients/drm_log.c          |  4 ++--
>>>   drivers/gpu/drm/drm_client_event.c         | 16 ++++++++--------
>>>   drivers/gpu/drm/drm_modeset_helper.c       |  6 +++---
>>>   drivers/gpu/drm/i915/i915_driver.c         |  6 +++---
>>>   drivers/gpu/drm/nouveau/nouveau_display.c  |  4 ++--
>>>   drivers/gpu/drm/radeon/radeon_device.c     |  4 ++--
>>>   drivers/gpu/drm/xe/display/xe_display.c    |  6 +++---
>>>   include/drm/drm_client.h                   | 14 ++------------
>>>   include/drm/drm_client_event.h             |  4 ++--
>>>   11 files changed, 35 insertions(+), 51 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index a77000c2e0bb..f068e26d5080 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -5212,7 +5212,7 @@ int amdgpu_device_suspend(struct drm_device 
>>> *dev, bool notify_clients)
>>>           dev_warn(adev->dev, "smart shift update failed\n");
>>>         if (notify_clients)
>>> -        drm_client_dev_suspend(adev_to_drm(adev), false);
>>> +        drm_client_dev_suspend(adev_to_drm(adev));
>>> cancel_delayed_work_sync(&adev->delayed_init_work);
>>>   @@ -5346,7 +5346,7 @@ int amdgpu_device_resume(struct drm_device 
>>> *dev, bool notify_clients)
>>>       flush_delayed_work(&adev->delayed_init_work);
>>>         if (notify_clients)
>>> -        drm_client_dev_resume(adev_to_drm(adev), false);
>>> +        drm_client_dev_resume(adev_to_drm(adev));
>>>         amdgpu_ras_resume(adev);
>>>   @@ -5951,7 +5951,7 @@ int amdgpu_device_reinit_after_reset(struct 
>>> amdgpu_reset_context *reset_context)
>>>                   if (r)
>>>                       goto out;
>>>   - drm_client_dev_resume(adev_to_drm(tmp_adev), false);
>>> +                drm_client_dev_resume(adev_to_drm(tmp_adev));
>>>                     /*
>>>                    * The GPU enters bad state once faulty pages
>>> @@ -6286,7 +6286,7 @@ static void 
>>> amdgpu_device_halt_activities(struct amdgpu_device *adev,
>>>            */
>>>           amdgpu_unregister_gpu_instance(tmp_adev);
>>>   -        drm_client_dev_suspend(adev_to_drm(tmp_adev), false);
>>> +        drm_client_dev_suspend(adev_to_drm(tmp_adev));
>>>             /* disable ras on ALL IPs */
>>>           if (!need_emergency_restart && !amdgpu_reset_in_dpc(adev) &&
>>> diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c 
>>> b/drivers/gpu/drm/clients/drm_fbdev_client.c
>>> index f894ba52bdb5..ec5ab9f30547 100644
>>> --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
>>> +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
>>> @@ -62,26 +62,20 @@ static int drm_fbdev_client_hotplug(struct 
>>> drm_client_dev *client)
>>>       return ret;
>>>   }
>>>   -static int drm_fbdev_client_suspend(struct drm_client_dev 
>>> *client, bool holds_console_lock)
>>> +static int drm_fbdev_client_suspend(struct drm_client_dev *client)
>>>   {
>>>       struct drm_fb_helper *fb_helper = 
>>> drm_fb_helper_from_client(client);
>>>   -    if (holds_console_lock)
>>> -        drm_fb_helper_set_suspend(fb_helper, true);
>>> -    else
>>> -        drm_fb_helper_set_suspend_unlocked(fb_helper, true);
>>> +    drm_fb_helper_set_suspend_unlocked(fb_helper, true);
>>>         return 0;
>>>   }
>>>   -static int drm_fbdev_client_resume(struct drm_client_dev *client, 
>>> bool holds_console_lock)
>>> +static int drm_fbdev_client_resume(struct drm_client_dev *client)
>>>   {
>>>       struct drm_fb_helper *fb_helper = 
>>> drm_fb_helper_from_client(client);
>>>   -    if (holds_console_lock)
>>> -        drm_fb_helper_set_suspend(fb_helper, false);
>>> -    else
>>> -        drm_fb_helper_set_suspend_unlocked(fb_helper, false);
>>> +    drm_fb_helper_set_suspend_unlocked(fb_helper, false);
>>>         return 0;
>>>   }
>>> diff --git a/drivers/gpu/drm/clients/drm_log.c 
>>> b/drivers/gpu/drm/clients/drm_log.c
>>> index d239f1e3c456..fd8556dd58ed 100644
>>> --- a/drivers/gpu/drm/clients/drm_log.c
>>> +++ b/drivers/gpu/drm/clients/drm_log.c
>>> @@ -319,7 +319,7 @@ static int drm_log_client_hotplug(struct 
>>> drm_client_dev *client)
>>>       return 0;
>>>   }
>>>   -static int drm_log_client_suspend(struct drm_client_dev *client, 
>>> bool _console_lock)
>>> +static int drm_log_client_suspend(struct drm_client_dev *client)
>>>   {
>>>       struct drm_log *dlog = client_to_drm_log(client);
>>>   @@ -328,7 +328,7 @@ static int drm_log_client_suspend(struct 
>>> drm_client_dev *client, bool _console_l
>>>       return 0;
>>>   }
>>>   -static int drm_log_client_resume(struct drm_client_dev *client, 
>>> bool _console_lock)
>>> +static int drm_log_client_resume(struct drm_client_dev *client)
>>>   {
>>>       struct drm_log *dlog = client_to_drm_log(client);
>>>   diff --git a/drivers/gpu/drm/drm_client_event.c 
>>> b/drivers/gpu/drm/drm_client_event.c
>>> index c83196ad8b59..c3baeb4d4e6b 100644
>>> --- a/drivers/gpu/drm/drm_client_event.c
>>> +++ b/drivers/gpu/drm/drm_client_event.c
>>> @@ -122,7 +122,7 @@ void drm_client_dev_restore(struct drm_device *dev)
>>>       mutex_unlock(&dev->clientlist_mutex);
>>>   }
>>>   -static int drm_client_suspend(struct drm_client_dev *client, bool 
>>> holds_console_lock)
>>> +static int drm_client_suspend(struct drm_client_dev *client)
>>>   {
>>>       struct drm_device *dev = client->dev;
>>>       int ret = 0;
>>> @@ -131,7 +131,7 @@ static int drm_client_suspend(struct 
>>> drm_client_dev *client, bool holds_console_
>>>           return 0;
>>>         if (client->funcs && client->funcs->suspend)
>>> -        ret = client->funcs->suspend(client, holds_console_lock);
>>> +        ret = client->funcs->suspend(client);
>>>       drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
>>>         client->suspended = true;
>>> @@ -139,20 +139,20 @@ static int drm_client_suspend(struct 
>>> drm_client_dev *client, bool holds_console_
>>>       return ret;
>>>   }
>>>   -void drm_client_dev_suspend(struct drm_device *dev, bool 
>>> holds_console_lock)
>>> +void drm_client_dev_suspend(struct drm_device *dev)
>>>   {
>>>       struct drm_client_dev *client;
>>>         mutex_lock(&dev->clientlist_mutex);
>>>       list_for_each_entry(client, &dev->clientlist, list) {
>>>           if (!client->suspended)
>>> -            drm_client_suspend(client, holds_console_lock);
>>> +            drm_client_suspend(client);
>>>       }
>>>       mutex_unlock(&dev->clientlist_mutex);
>>>   }
>>>   EXPORT_SYMBOL(drm_client_dev_suspend);
>>>   -static int drm_client_resume(struct drm_client_dev *client, bool 
>>> holds_console_lock)
>>> +static int drm_client_resume(struct drm_client_dev *client)
>>>   {
>>>       struct drm_device *dev = client->dev;
>>>       int ret = 0;
>>> @@ -161,7 +161,7 @@ static int drm_client_resume(struct 
>>> drm_client_dev *client, bool holds_console_l
>>>           return 0;
>>>         if (client->funcs && client->funcs->resume)
>>> -        ret = client->funcs->resume(client, holds_console_lock);
>>> +        ret = client->funcs->resume(client);
>>>       drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
>>>         client->suspended = false;
>>> @@ -172,14 +172,14 @@ static int drm_client_resume(struct 
>>> drm_client_dev *client, bool holds_console_l
>>>       return ret;
>>>   }
>>>   -void drm_client_dev_resume(struct drm_device *dev, bool 
>>> holds_console_lock)
>>> +void drm_client_dev_resume(struct drm_device *dev)
>>>   {
>>>       struct drm_client_dev *client;
>>>         mutex_lock(&dev->clientlist_mutex);
>>>       list_for_each_entry(client, &dev->clientlist, list) {
>>>           if  (client->suspended)
>>> -            drm_client_resume(client, holds_console_lock);
>>> +            drm_client_resume(client);
>>>       }
>>>       mutex_unlock(&dev->clientlist_mutex);
>>>   }
>>> diff --git a/drivers/gpu/drm/drm_modeset_helper.c 
>>> b/drivers/gpu/drm/drm_modeset_helper.c
>>> index 988735560570..a57f6a10ada4 100644
>>> --- a/drivers/gpu/drm/drm_modeset_helper.c
>>> +++ b/drivers/gpu/drm/drm_modeset_helper.c
>>> @@ -203,10 +203,10 @@ int drm_mode_config_helper_suspend(struct 
>>> drm_device *dev)
>>>       if (dev->mode_config.poll_enabled)
>>>           drm_kms_helper_poll_disable(dev);
>>>   -    drm_client_dev_suspend(dev, false);
>>> +    drm_client_dev_suspend(dev);
>>>       state = drm_atomic_helper_suspend(dev);
>>>       if (IS_ERR(state)) {
>>> -        drm_client_dev_resume(dev, false);
>>> +        drm_client_dev_resume(dev);
>>>             /*
>>>            * Don't enable polling if it was never initialized
>>> @@ -252,7 +252,7 @@ int drm_mode_config_helper_resume(struct 
>>> drm_device *dev)
>>>           DRM_ERROR("Failed to resume (%d)\n", ret);
>>>       dev->mode_config.suspend_state = NULL;
>>>   -    drm_client_dev_resume(dev, false);
>>> +    drm_client_dev_resume(dev);
>>>         /*
>>>        * Don't enable polling if it is not initialized
>>> diff --git a/drivers/gpu/drm/i915/i915_driver.c 
>>> b/drivers/gpu/drm/i915/i915_driver.c
>>> index 95165e45de74..162e50315beb 100644
>>> --- a/drivers/gpu/drm/i915/i915_driver.c
>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>>> @@ -978,7 +978,7 @@ void i915_driver_shutdown(struct 
>>> drm_i915_private *i915)
>>>       intel_runtime_pm_disable(&i915->runtime_pm);
>>>       intel_power_domains_disable(display);
>>>   -    drm_client_dev_suspend(&i915->drm, false);
>>> +    drm_client_dev_suspend(&i915->drm);
>>>       if (intel_display_device_present(display)) {
>>>           drm_kms_helper_poll_disable(&i915->drm);
>>>           intel_display_driver_disable_user_access(display);
>>> @@ -1060,7 +1060,7 @@ static int i915_drm_suspend(struct drm_device 
>>> *dev)
>>>       /* We do a lot of poking in a lot of registers, make sure they 
>>> work
>>>        * properly. */
>>>       intel_power_domains_disable(display);
>>> -    drm_client_dev_suspend(dev, false);
>>> +    drm_client_dev_suspend(dev);
>>>       if (intel_display_device_present(display)) {
>>>           drm_kms_helper_poll_disable(dev);
>>>           intel_display_driver_disable_user_access(display);
>>> @@ -1257,7 +1257,7 @@ static int i915_drm_resume(struct drm_device 
>>> *dev)
>>>         intel_opregion_resume(display);
>>>   -    drm_client_dev_resume(dev, false);
>>> +    drm_client_dev_resume(dev);
>>>         intel_power_domains_enable(display);
>>>   diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c 
>>> b/drivers/gpu/drm/nouveau/nouveau_display.c
>>> index 54aed3656a4c..00515623a2cc 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
>>> @@ -765,7 +765,7 @@ nouveau_display_suspend(struct drm_device *dev, 
>>> bool runtime)
>>>   {
>>>       struct nouveau_display *disp = nouveau_display(dev);
>>>   -    drm_client_dev_suspend(dev, false);
>>> +    drm_client_dev_suspend(dev);
>>>         if (drm_drv_uses_atomic_modeset(dev)) {
>>>           if (!runtime) {
>>> @@ -796,7 +796,7 @@ nouveau_display_resume(struct drm_device *dev, 
>>> bool runtime)
>>>           }
>>>       }
>>>   -    drm_client_dev_resume(dev, false);
>>> +    drm_client_dev_resume(dev);
>>>   }
>>>     int
>>> diff --git a/drivers/gpu/drm/radeon/radeon_device.c 
>>> b/drivers/gpu/drm/radeon/radeon_device.c
>>> index 9e35b14e2bf0..60afaa8e56b4 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_device.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_device.c
>>> @@ -1635,7 +1635,7 @@ int radeon_suspend_kms(struct drm_device *dev, 
>>> bool suspend,
>>>       }
>>>         if (notify_clients)
>>> -        drm_client_dev_suspend(dev, false);
>>> +        drm_client_dev_suspend(dev);
>>>         return 0;
>>>   }
>>> @@ -1739,7 +1739,7 @@ int radeon_resume_kms(struct drm_device *dev, 
>>> bool resume, bool notify_clients)
>>>           radeon_pm_compute_clocks(rdev);
>>>         if (notify_clients)
>>> -        drm_client_dev_resume(dev, false);
>>> +        drm_client_dev_resume(dev);
>>>         return 0;
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c 
>>> b/drivers/gpu/drm/xe/display/xe_display.c
>>> index 19e691fccf8c..d3cc6181842c 100644
>>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>>> @@ -324,7 +324,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>>>        * properly.
>>>        */
>>>       intel_power_domains_disable(display);
>>> -    drm_client_dev_suspend(&xe->drm, false);
>>> +    drm_client_dev_suspend(&xe->drm);
>>>         if (intel_display_device_present(display)) {
>>>           drm_kms_helper_poll_disable(&xe->drm);
>>> @@ -356,7 +356,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
>>>           return;
>>>         intel_power_domains_disable(display);
>>> -    drm_client_dev_suspend(&xe->drm, false);
>>> +    drm_client_dev_suspend(&xe->drm);
>>>         if (intel_display_device_present(display)) {
>>>           drm_kms_helper_poll_disable(&xe->drm);
>>> @@ -481,7 +481,7 @@ void xe_display_pm_resume(struct xe_device *xe)
>>>         intel_opregion_resume(display);
>>>   -    drm_client_dev_resume(&xe->drm, false);
>>> +    drm_client_dev_resume(&xe->drm);
>>>         intel_power_domains_enable(display);
>>>   }
>>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>>> index bdd845e383ef..3556928d3938 100644
>>> --- a/include/drm/drm_client.h
>>> +++ b/include/drm/drm_client.h
>>> @@ -70,13 +70,8 @@ struct drm_client_funcs {
>>>        * Called when suspending the device.
>>>        *
>>>        * This callback is optional.
>>> -     *
>>> -     * FIXME: Some callers hold the console lock when invoking this
>>> -     *        function. This interferes with fbdev emulation, which
>>> -     *        also tries to acquire the lock. Push the console lock
>>> -     *        into the callback and remove 'holds_console_lock'.
>>>        */
>>> -    int (*suspend)(struct drm_client_dev *client, bool 
>>> holds_console_lock);
>>> +    int (*suspend)(struct drm_client_dev *client);
>>>         /**
>>>        * @resume:
>>> @@ -84,13 +79,8 @@ struct drm_client_funcs {
>>>        * Called when resuming the device from suspend.
>>>        *
>>>        * This callback is optional.
>>> -     *
>>> -     * FIXME: Some callers hold the console lock when invoking this
>>> -     *        function. This interferes with fbdev emulation, which
>>> -     *        also tries to acquire the lock. Push the console lock
>>> -     *        into the callback and remove 'holds_console_lock'.
>>>        */
>>> -    int (*resume)(struct drm_client_dev *client, bool 
>>> holds_console_lock);
>>> +    int (*resume)(struct drm_client_dev *client);
>>>   };
>>>     /**
>>> diff --git a/include/drm/drm_client_event.h 
>>> b/include/drm/drm_client_event.h
>>> index 1d544d3a3228..c3f318788b71 100644
>>> --- a/include/drm/drm_client_event.h
>>> +++ b/include/drm/drm_client_event.h
>>> @@ -11,8 +11,8 @@ struct drm_device;
>>>   void drm_client_dev_unregister(struct drm_device *dev);
>>>   void drm_client_dev_hotplug(struct drm_device *dev);
>>>   void drm_client_dev_restore(struct drm_device *dev);
>>> -void drm_client_dev_suspend(struct drm_device *dev, bool 
>>> holds_console_lock);
>>> -void drm_client_dev_resume(struct drm_device *dev, bool 
>>> holds_console_lock);
>>> +void drm_client_dev_suspend(struct drm_device *dev);
>>> +void drm_client_dev_resume(struct drm_device *dev);
>>>   #else
>>>   static inline void drm_client_dev_unregister(struct drm_device *dev)
>>>   { }
>
