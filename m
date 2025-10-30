Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B50BC221DF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F8C10EA15;
	Thu, 30 Oct 2025 20:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VQp3zcl5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011000.outbound.protection.outlook.com [40.107.208.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22BD10EA12;
 Thu, 30 Oct 2025 20:04:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miI4rvdsNDP61isA1Z7wiMCkYE1MPWO1+SMacYk7j9nSsQbMnmmF+ldSSn3a/4LsafFXNw2S8qkNHo5I04UkawhXACHALf4DnaRFLEJgNxheElFONBGo2T0bIyuhF/PpTlncHTrW0R3OFd/JuucOxDigRHDyxBXS1WPG1qCHYJWdSqHygzrJggVIG3D2+7u1OZJyI+UATbt/1Xpz0W5Xgdzm5Nt+YXX823t2mpRtjj+K3r5yShI0Mp8uz5MKWlDYUKXMtRZwwirlMMkPNHj9emLvJnRlAEDwM3PxPzDxTovyrZK67CEhRDUCp3Axh6zbD0MxOaoA/QDhtWgm7y4OTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIU+PPSztXreHwubvD7ITMTrZgFDS5Rt4x8vhuCRda4=;
 b=Yk0YMO+/iZk9d/xyQEsi4CZutlfNP7eMPCUvX71MOZNiw//bsjDQEKfbahdifimn9ux7amD8Sez0oxWJnl0VUskHc0Q8lTmNKdGm4tKxKbEMmSE+Jr5ZJQYZyjHoeVssc959adXWQfzb140/GSlbmAQkkT5gerCGnBK44oWfQI6pIbF3GMhsXiJyTl3sDdPHDSn0uGkKLc2AR2qudHBtUtGq13dfZ8/8Tb+Atjw8rS2dS/UBbIy2QTJRkskyEV+hMurT7JtgPLjObfavjR8FusMBzm8FvMEhoGYv9OqDDwBTiWzl6dddLOBSRalP+XW0pGqSy2jBn6mEGdYKrRxhcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIU+PPSztXreHwubvD7ITMTrZgFDS5Rt4x8vhuCRda4=;
 b=VQp3zcl5RTXy/OQftyTO2cWfSzxnti8QUhpO+9hci5YJNHaowpi+U9R2DOwlUNOsfMspEfDN/Xkl5hIU8BQoMP7mdHK3PsCYPZHoju1CHgrQY6X4HR9kkJSTCYTXNHgfUyiTSX66imZcHS0uNDvhhBrs7lq+0nwICSiyae4Nb4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DS7PR12MB8273.namprd12.prod.outlook.com (2603:10b6:8:ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 20:04:51 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 20:04:50 +0000
Message-ID: <dee83b0a-1464-464e-a2a1-0d7d958d4289@amd.com>
Date: Thu, 30 Oct 2025 16:04:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] drm/amdgpu: independence for the amdkfd_fence!
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-15-christian.koenig@amd.com>
 <13862fb3-548c-44c1-9744-6b74dcff6ccd@amd.com>
 <741496aa-2154-4939-9d3a-27ea6eff2fea@gmail.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <741496aa-2154-4939-9d3a-27ea6eff2fea@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::13) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DS7PR12MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: acc3b4b1-ec06-4333-5100-08de17ef9582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0l4bWxlci81REI2eXJPVlJNQW9YL2hmbXFHMHl4b2lsUE9LU2lobmszdEtQ?=
 =?utf-8?B?RVlneVE4YVBzMlgwVTB6ckRHWUgwdjJ6T3NLZWtsV2xYYkJIVk9iRnZ0NXBB?=
 =?utf-8?B?em45Z2NabzEwaU1WdUJoWEcvUEU0SENZeS9FakRoTWVhdTJpRS9uK2FndGZZ?=
 =?utf-8?B?WFZ0M1Q3cGZ0NUxkd3NSTHFFdGtNZXBhSzlrREwwN0kza3B5c0hHdDcvVkUw?=
 =?utf-8?B?aXpFU1lvWld4M1RYSVBmVXdRQWRvVmd5UE4yWE5DamN1TklRQitJLy9rdklm?=
 =?utf-8?B?V1U1UmJiWGs5S2xMU3BObHlMMWVwOThBOFNJMXczTm41aitkcXVMNVVaa255?=
 =?utf-8?B?WGgxaGNMZC9yT2doVmJIV25COEQ2U3lXM08zSG1ucmRhRVlRRFhBR0xMU1pq?=
 =?utf-8?B?Z0lEWXh1UTVIU0pMZ01MeXFqQ3laWm9LajRXUkkyVzBQZlc2ZFp5RENnSm1s?=
 =?utf-8?B?Q05MMkZCWlQ4SUthRUxTYVhQeU5yTTlpVzJnVmhRMVorQlFUcTY2Z3VxVnVD?=
 =?utf-8?B?QUp5UjM2cDNzWExvMnJNT2xaWDhHVStUcmxsZkZHdXVkU21FZVZjejVScEZy?=
 =?utf-8?B?NExOZ1NBTk1tUDkwVmxQSWcwUGxxajJVY21NQkRjWkVnS2pxaEpmU3RNbnZ2?=
 =?utf-8?B?ZUgrTVIvTStiNVZtYWhQLy9tMGZTcm42UkZFR0RkV2J2SUY1SFh4K0QxSEdC?=
 =?utf-8?B?ZlpUa2g5RllpVExmeEJqeTI3cHI5aWhsc1pMTEw2dkd0MmNDcCt3dzc0Y0dO?=
 =?utf-8?B?M29Md2FmSHhhVjU5VlV2L0JyUC9IcXlxc25nNy9PZjRhblhSTmJRa0kvdnZV?=
 =?utf-8?B?RkdpOFpvaUNYd1lCYlY0cmtOaEVCcHd3ZElxVU1iZmFvOGt4ZUg3SFdBUG5V?=
 =?utf-8?B?VXBCZS8yUEExZXlweVV0ZG9QRmc1bFJsdmJVN1Y1bGJWb3lieVRkYW5VWDc5?=
 =?utf-8?B?YmdCTzI5WUJBTXBsb3BldlZEV0s3bDUvbjUzNTBzU3hVRFNuUHE4UTBLUU1p?=
 =?utf-8?B?MFE2a25YaDBTTWM2bjZvTWVkbzA1dEpuUE1nUno1RS9wQUtDYStwdzc3WFJK?=
 =?utf-8?B?OVdrVjY3a3lqTkNIckxDZks5MlRWMGIyNkxzK0xNQ2xQclNjeEF5WWhodXZI?=
 =?utf-8?B?UWhJTmtUZ04yMVpzY3dZb295Z0R3QllnallKSkFnLzZQckVGbjdqZzE5SlZE?=
 =?utf-8?B?VEF4MHJEYnZoSXkzU0pCV21rbVBiZEpQM1hVamdhR0l1dTRQSklPMnEzeTQr?=
 =?utf-8?B?Wkk1SzE2eUlOOEE3YkhnZHpyYmFFQ0d2NjB6MWlveXF4UW95cERyM0ljRU5B?=
 =?utf-8?B?MjNrZHE3U2Z1QWpEWFIwcjkxL0pTd0dCMHc4blA0Njl1T3pXMHpyZWxZbWla?=
 =?utf-8?B?bFMzSjBET1A0eEhLelg3dE4yVzh1QlkyNlRycmVGWG5jQjFoZjMxZHByUDRT?=
 =?utf-8?B?NVJFSEdsZnc5ZEp3QkRjaGljWEI4cHYvTE5JNTFDWjZGM0pVL094REcwb1FJ?=
 =?utf-8?B?QnFFUm5ETjh4R3FMRGErbTk0dk52ZmZCUEY5UlhOQ0o2S25OdXVya2pscG03?=
 =?utf-8?B?TnBTWXdZa3g3YUFwNVVyT3JuK25oSi9Fd1JBSTVWajFTSlJIZ2xXakI0ckpj?=
 =?utf-8?B?M1hoc3dqUnlRWFQxM1VFZGRSR25YY0FIL0JUT2xMZnNBQmdURWxYYmhLNDRP?=
 =?utf-8?B?QU5oUitFcDgvREdaY052ZFJZME5PK0piY2ZHRGhtYXVuQ0NPTWZaOEhNV0F5?=
 =?utf-8?B?U3JhZ1dEKzJCdjBwUVlkM2ZleUowMmxPUG5Bb05LZTJVUzdsK0FRQVI5ajVE?=
 =?utf-8?B?cVY0NStNU0MwQ0FIdmZjaW8zd2ExYUFVRUJoV3EzTXRYSjlWY25lcHZsTzl1?=
 =?utf-8?B?aHpmVEROc1VFVmlxbHhYVFAxaVZsbDY3azMzUEEvMk5MYTdwMG8yTXBNaEEv?=
 =?utf-8?Q?BWd7M57Gb46WcBDA0YBzPUr3b0oCsVTE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OSt1cVpoaFBPdURtTC9raEc5ejBOOElHNWZQckM3K2Zza0wreUltdnFvZ0Zh?=
 =?utf-8?B?Wnh2dlRWRHBFZmNSN1Yyd2xnb01PcnltMWlidFRHUUdaWGtFbUdpVVhDNHd1?=
 =?utf-8?B?Vm1TbTc3Y1Urb2I5WHp2dTgzbDBLS2lzNjZRdmNuMndtc2lvdDYyVjh2VHdy?=
 =?utf-8?B?Qzd0dFI2RWpLK0RyNGV1Z1VDUDlOMElzWjJrRFFHdTFra08xNzZQRGJiQXh3?=
 =?utf-8?B?NzE3KzlOR3kzRUgzYzUwT2hlRjR6b0dQQThJM0RFTFdTSVNMVXIzUDJQbEpW?=
 =?utf-8?B?ckxkdGFZTlE3TzJkR3ZWN0lRUmdYL0UzdDRNU0ZQRjNwZXRYZllDaGFzTlZO?=
 =?utf-8?B?RXk1VmJiQVJUNUJzZjZUZVBWeC9GQ1B2RENVTjhSSllDRlBiRXYvVmxrYUpD?=
 =?utf-8?B?b1pwUFJCdnBSTWFFU2F1d0hhWWZDSzRVSzRWbEMwZ2tFRWM5aSttRHZEWGxD?=
 =?utf-8?B?Y3ZmUG8zcDVVWDBaR1YzcGo4K2xnWXFROGFHVThnaFhVU2MxZTlOSDJqSFR0?=
 =?utf-8?B?dWxBRlUwOVplV0sxOVhLNmRyaXlFVW81NWUzTTdiYlZvdUVTMTV5azRlMFpT?=
 =?utf-8?B?dmJ0azRBQUlKRWVtc3pBOEI2bi9iNUpPMWVWNjNjWjdlSWYzVUplSWtFbWJn?=
 =?utf-8?B?eXBhem5FZmxBVjgyMHkyWG9JZzlqaXYzdGtTN1BXZU1takFaWjhWZ2sxSFpr?=
 =?utf-8?B?c3dtUnZjb0tjRFVRM1FaT0UyUm9qZXI5alEwMTVZWUdLZ0RRbUs5TGwxSk12?=
 =?utf-8?B?QUJGRUVzUi9CN0svUG5sMGUvKzQyRXF0MWFPUi8vS0drZC8xTzRtZlFvV0ZJ?=
 =?utf-8?B?eml1VHV3bGdnSzMvWi9PL0VkMnNyUHpPSzNvUEhjOW5sQTExVDRyOWRZd1dx?=
 =?utf-8?B?Wi85L042aXlKSyt4bFZWekRCN21yNkMvMlAyQzhZL1JKRTVzQzdZMm9EQ3E2?=
 =?utf-8?B?ZjBpaTh1T1FSRkVoMTFYcWtJckV3TC9aZDhra1d5TWFEVzQ5a3NXeU5RckVV?=
 =?utf-8?B?dUtEQ1NDOWp5U0d5dDEzZXBPVHRTODAyV1ptQTJDZVM4NlR1YVdRWUllQ1hT?=
 =?utf-8?B?T0IxZG54eDQzcUdudzRSTGFaOGVDb3p0V3BPVjI5dDFFVlZzdWtXWXJnajZ5?=
 =?utf-8?B?aHNVM3FzcXVsMGRnWkJJOXdVc0lCZWI3MFJvZWZkYmhacnFrOWdVSHlJbCtq?=
 =?utf-8?B?YU5tb2VnT25DcHBwWFdYN3UwQVEzZjFFVnFBWURLaHB6cGRUbXBlTVo5QlFQ?=
 =?utf-8?B?VFpjN1B3WlpHVXNabGhFazJxK0NCZjcvRmg1MnZXclhsL1dVeCtMTjVINUhx?=
 =?utf-8?B?RE82ZzU4b3V1Qm8yYzBKcHlnZFZXYjI4NjNtOTJsTE1Ydm03M3hlamthd0pS?=
 =?utf-8?B?eDlJQnFzVWcrNzBydEx0dXVuRGt6WkdVUnJkNThFR3VnK2h6TGlENTgzMnBi?=
 =?utf-8?B?QjFRRldBMkFSMFVPSGJKOWIzdlA0dnBkRkJ5SzI3ZU5OaSt1WkNzSHRjWVpm?=
 =?utf-8?B?RnJKeVNWbDBWU0M3MllpaTFySXlINnN2bXdEMmxYN2U3ZWFWT2lHME44Uzhu?=
 =?utf-8?B?THIyMDlkQTdEUjR4eXVET2JBbHNOWG9vWTBGUXBQR1BnUjRudUhJYTMrYzc4?=
 =?utf-8?B?WU9JN0NiR0cxUExObXpHUUVFaUNhbW4yOXBReXBVS25QSUprYVJ3QmR0dTZG?=
 =?utf-8?B?Q2RaeEtiQW5VSnVkNTN1ODJFc2RsWXFrSVVmQnlQVHNwVzd2WmdlNWV1aW9N?=
 =?utf-8?B?UXFWMXBPcGJBQzVUOHRsb1Zva0tYTDdId0VwS3EwUFdRY3pCUmxpZjRWVTM1?=
 =?utf-8?B?emhQLzFnNXNWNDFqMjFma0pESGtMYk40YVEreFhZbGZSV1hMTUppUnNiYVlm?=
 =?utf-8?B?cnBPQWxCWk5BNGRSYy9XcE5jd3VFd2QwZGtJa2JXZlBxWmVrQW1pSExpaWZ0?=
 =?utf-8?B?T1RuTUdxd21KaVBPVDlOczgwSjlQVDBZbldxSU5aZXI4NUFNazZZd2tNcmd5?=
 =?utf-8?B?RVBGeU1aT1VFR1hNTXVHNFBKd2Y3L1dFcms2RGhTWGFSMWM1WUp5endqSTA1?=
 =?utf-8?B?MDVxbjg2bm9rSzU4bWE1dEg2RVQzcjBDUVFEcTRwNWh4MUJjKzFXMUR1Wi8r?=
 =?utf-8?Q?6I3LaoqZmadSgKaKplTwV/oi5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acc3b4b1-ec06-4333-5100-08de17ef9582
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:04:50.8345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyUw8Wt4tVkTOTmlUa2N8zMzPpTTk7IY9h7ZgqXClbjcKhu7y4Q3fjAt5FQC8t/4ePdUeub9S1UkDwGNdh8Z6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8273
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


On 2025-10-30 11:07, Christian König wrote:
> On 10/18/25 00:22, Felix Kuehling wrote:
>> On 2025-10-13 09:48, Christian König wrote:
>>> This should allow amdkfd_fences to outlive the amdgpu module.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  6 ++++
>>>    .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  | 36 +++++++------------
>>>    drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  7 ++--
>>>    drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  4 +--
>>>    4 files changed, 24 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>>> index 9e120c934cc1..35c59c784b7b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>>> @@ -196,6 +196,7 @@ int kfd_debugfs_kfd_mem_limits(struct seq_file *m, void *data);
>>>    #endif
>>>    #if IS_ENABLED(CONFIG_HSA_AMD)
>>>    bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm);
>>> +void amdkfd_fence_signal(struct dma_fence *f);
>>>    struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
>>>    void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo);
>>>    int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
>>> @@ -210,6 +211,11 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
>>>        return false;
>>>    }
>>>    +static inline
>>> +void amdkfd_fence_signal(struct dma_fence *f)
>>> +{
>>> +}
>>> +
>>>    static inline
>>>    struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
>>>    {
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>> index 09c919f72b6c..69bca4536326 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>> @@ -127,29 +127,9 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
>>>            if (!svm_range_schedule_evict_svm_bo(fence))
>>>                return true;
>>>        }
>>> -    return false;
>>> -}
>>> -
>>> -/**
>>> - * amdkfd_fence_release - callback that fence can be freed
>>> - *
>>> - * @f: dma_fence
>>> - *
>>> - * This function is called when the reference count becomes zero.
>>> - * Drops the mm_struct reference and RCU schedules freeing up the fence.
>>> - */
>>> -static void amdkfd_fence_release(struct dma_fence *f)
>>> -{
>>> -    struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
>>> -
>>> -    /* Unconditionally signal the fence. The process is getting
>>> -     * terminated.
>>> -     */
>>> -    if (WARN_ON(!fence))
>>> -        return; /* Not an amdgpu_amdkfd_fence */
>>> -
>>>        mmdrop(fence->mm);
>>> -    kfree_rcu(f, rcu);
>>> +    fence->mm = NULL;
>>> +    return false;
>>>    }
>>>      /**
>>> @@ -174,9 +154,19 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
>>>        return false;
>>>    }
>>>    +void amdkfd_fence_signal(struct dma_fence *f)
>>> +{
>>> +    struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
>>> +
>>> +    if (fence) {
>>> +        mmdrop(fence->mm);
>>> +        fence->mm = NULL;
>> Isn't fence->mm already NULL here if it was dropped in amdkfd_fence_enable_signaling?
> It looked like ther're some use cases which signals the fence without going through amdkfd_fence_enable_signaling.
>
> E.g. kfd_process_wq_release which is most likely used on process tear down.

I see. Could there be race conditions here, if enable_signaling happens 
concurrently and we end up calling mmdrop twice?

Regards,
   Felix


>
> Regards,
> Christian.
>
>> Regards,
>>    Felix
>>
>>
>>> +    }
>>> +    dma_fence_signal(f);
>>> +}
>>> +
>>>    static const struct dma_fence_ops amdkfd_fence_ops = {
>>>        .get_driver_name = amdkfd_fence_get_driver_name,
>>>        .get_timeline_name = amdkfd_fence_get_timeline_name,
>>>        .enable_signaling = amdkfd_fence_enable_signaling,
>>> -    .release = amdkfd_fence_release,
>>>    };
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>>> index ddfe30c13e9d..779d7701bac9 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>>> @@ -1177,7 +1177,7 @@ static void kfd_process_wq_release(struct work_struct *work)
>>>        synchronize_rcu();
>>>        ef = rcu_access_pointer(p->ef);
>>>        if (ef)
>>> -        dma_fence_signal(ef);
>>> +        amdkfd_fence_signal(ef);
>>>          kfd_process_remove_sysfs(p);
>>>        kfd_debugfs_remove_process(p);
>>> @@ -1986,7 +1986,6 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
>>>    static int signal_eviction_fence(struct kfd_process *p)
>>>    {
>>>        struct dma_fence *ef;
>>> -    int ret;
>>>          rcu_read_lock();
>>>        ef = dma_fence_get_rcu_safe(&p->ef);
>>> @@ -1994,10 +1993,10 @@ static int signal_eviction_fence(struct kfd_process *p)
>>>        if (!ef)
>>>            return -EINVAL;
>>>    -    ret = dma_fence_signal(ef);
>>> +    amdkfd_fence_signal(ef);
>>>        dma_fence_put(ef);
>>>    -    return ret;
>>> +    return 0;
>>>    }
>>>      static void evict_process_worker(struct work_struct *work)
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> index 91609dd5730f..01ce2d853602 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> @@ -428,7 +428,7 @@ static void svm_range_bo_release(struct kref *kref)
>>>          if (!dma_fence_is_signaled(&svm_bo->eviction_fence->base))
>>>            /* We're not in the eviction worker. Signal the fence. */
>>> -        dma_fence_signal(&svm_bo->eviction_fence->base);
>>> +        amdkfd_fence_signal(&svm_bo->eviction_fence->base);
>>>        dma_fence_put(&svm_bo->eviction_fence->base);
>>>        amdgpu_bo_unref(&svm_bo->bo);
>>>        kfree(svm_bo);
>>> @@ -3628,7 +3628,7 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
>>>        mmap_read_unlock(mm);
>>>        mmput(mm);
>>>    -    dma_fence_signal(&svm_bo->eviction_fence->base);
>>> +    amdkfd_fence_signal(&svm_bo->eviction_fence->base);
>>>          /* This is the last reference to svm_bo, after svm_range_vram_node_free
>>>         * has been called in svm_migrate_vram_to_ram
