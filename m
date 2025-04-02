Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7463FA78645
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 03:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E84F10E1AB;
	Wed,  2 Apr 2025 01:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L0qp6kM1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434D110E694
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 01:53:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y61YAHeevFe77QP/hej/eFaD0bSG+tuGyZkOUvFlDKrhTU4ILtzz0yBcqAAWDGbU8q67Jm2BZ2vm+ZDxonCDgPjwgwTktbzsqnwubqIvbIcrM2ziuJv+1IzGhk3t72ItTJcfSIbdExopcOiivvqMYLtlybC2ev2C4XToGGds7vxdmpoeb876Sqp/BEfqSqAfq5qYMtR9B0lwQi5X8ICJrGhedikPCWiMh1ghHfwCqFUhK9paJKR+J9HMNPIefFFCkcj7rt2GIP13nAj+1E/RW7dlHgi/HtVb//uWMyKAlVuCNTNfVRRIWz/uBQslY5XzWjlME6AJfNMBmCXRm8BeVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVUE9nRM++H/do52brawLEBvvjE5mfztY6bsXFel9Pk=;
 b=SLdeGHXStMzSfP1JWE2joMTg1rE8FBQOI123jRYQmxrEJiVBtYWFioaCGBmHQJFxMf70FrTWoyYkLAzt7veMv+7dVkvjHDfsDEHIJUNfXaU3s19ODnr6mH3Afe+us8aKUe3pAJp5f7T+Vs9G2xc73OsEqs0qmxQoR6SF+GZ+zlb0tWzFVWbBPluqZuonQSY9wP+GftVN6fcqp4SryWUfSttHln9k4NsUS2BoItVnziqkK8SNh09f9Bpe81F7tMLftZ39IcXbWrwt0TY4X3kKB7yBH1+OUtZSB9HsX0oS4ic5gs51ubgnpYdVGL1ibaBSZBW/z+TjtTVF2Dkhnim9Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVUE9nRM++H/do52brawLEBvvjE5mfztY6bsXFel9Pk=;
 b=L0qp6kM1jK8T3MisX5TDvHsghD3OYDTfz5xaVD/+MxKV8F3RTMjtK1HTz+Uyb5achOaYAx9volgiQrgc1MXjK6PNR3RoQQMjXZCTD47ysCoxmZM/DDoP6/+aJNEHrAJnAsM5j09TpBATNYS85j31ps+sPBsrPy8PL167xr72isI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by DM4PR12MB7669.namprd12.prod.outlook.com (2603:10b6:8:106::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Wed, 2 Apr
 2025 01:53:20 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%4]) with mapi id 15.20.8534.052; Wed, 2 Apr 2025
 01:53:20 +0000
Message-ID: <6e796751-86f3-42e5-b0a6-3a3602d3af13@amd.com>
Date: Wed, 2 Apr 2025 09:53:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/virtio: implement userptr: add interval tree
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, Demi Marie Obenour <demiobenour@gmail.com>
References: <20250321080029.1715078-1-honglei1.huang@amd.com>
 <20250321080029.1715078-8-honglei1.huang@amd.com>
 <810789ec-c034-4bdd-961a-f49c67336e45@collabora.com>
Content-Language: en-US
From: "Huang, Honglei1" <Honglei1.Huang@amd.com>
In-Reply-To: <810789ec-c034-4bdd-961a-f49c67336e45@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|DM4PR12MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: 9983a461-a0c2-480f-de18-08dd71892504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3dIUWQyOVU2SC93NDJKdHVOai9WQXJpelFKNDVLTHB4eVJlNXVRY2xKRGFu?=
 =?utf-8?B?UlhZeGdrQm1saHRKbmpneWg3ekVtU3AzM0U3Y0FZMzJjbGtJK0lFUUl4cFJh?=
 =?utf-8?B?NDZPUDdRV01mcHk2UDJ5bXFBdTNIVkVMM1Nvbzl3MGplbHFxb2RvbFhwcWdN?=
 =?utf-8?B?OVEvb3N5ZXloQzJZQjh4dkw5VXBZRldIUUlxUUJ3cG5BRiszZkdJMVhFcWlz?=
 =?utf-8?B?dEVRcGozUFhXUlpJaHV1UzJtUFB2QmJiUU9pOTBzeEI1K2tUbElMSGgxNFN1?=
 =?utf-8?B?SmNWSjJpdjdOZ0sxUkhRUFZnYzZsK3NRdTh3bHVKQ3Z2M2ZJRmVYNTl3NXJV?=
 =?utf-8?B?MkNLdHdiUXh3Sld2Y1lXYVRKM1ArY29UZFVpUW9RUWZkTmZYZHFvVU5VNHUv?=
 =?utf-8?B?akFpVFBoOUNmTkY0NVVFNGZJYnJubUNIQkp2QW4veXVFUFpZL2IrQUFVTVVh?=
 =?utf-8?B?TkxaVGZxYmtzRHhXai9Wb2pORVNNN3hwZzQvVllyNXZxZVdtVzdpVFkzdEpm?=
 =?utf-8?B?akZTQXpIVmh3MkZEZUROLzZOVko2UGpWOEw0d3hveTBrYzk1WVU1MnZtRXZL?=
 =?utf-8?B?Z0RqOGxoWDdxYno5Z2p4QlhCZWUvWjFVR0RZcFExbUJDenladkgwN0Y2REFv?=
 =?utf-8?B?NmlPZTBmWGhGak1ZaWxkQWZuNlJib1JlTDhsdnVXbExBMllJZlRvQW5oVHpW?=
 =?utf-8?B?cDhUUmRjZGlscXUwejZuRU83KzFEM0Qrd2R6b0JUV0tIeGwxT05VK1YrQVNS?=
 =?utf-8?B?SXk5OXV5N2JlQkl3RlB2dnJobDcxektaYTU3NG9IN3ZqWTBTOFpJYytkNFlV?=
 =?utf-8?B?MG8rUkRzQ3MyM1I5YWs2S2RpMHNZUldNOW1uZHdDblpoS2F3OVQvSG50d2NS?=
 =?utf-8?B?YkVzNTJEQWR2MUM3MUQwS0xOQkk0OU84QnFnMlVsRmhvblQzYXZzN3VSWVBx?=
 =?utf-8?B?bFQ1QnVqMkl1clNSYjQrNi83NzFaZXREeTREblBleThob2JjREVNU0FLZjJV?=
 =?utf-8?B?cmg4ZWZRSjBJVFRSK0QrOEtSLytNSzNxV0RWTmlUbnZHT0dDTC8rQm03S0Er?=
 =?utf-8?B?bU5PeE5ndFpWTkYrZkU1bGNOVmpmK2lycG5nNUdVRHpRcm9lYldNYjV5VFJP?=
 =?utf-8?B?NzdXZVB6bEgyV1ZNbEU5SUNHTU5NOXd3cGxXRzhnZ0gxR2dWU0t5K1oydVp0?=
 =?utf-8?B?Q3dMMDBIa1dHWkJDQkpsTUZKTXJYM25INUpCUE5pUHA0cUNRMUF3T2h4bys2?=
 =?utf-8?B?bld2SCtZZjhIK1RuY2txOFJFbDdkVUpTeW13bkdGeHpoN0N6VkhnUkhvbWZF?=
 =?utf-8?B?eDAxWklYNGEvWGY3a0cwbVZUVHVGR0MzVUU3MHdCRk84OFVXTGZDTlhTUnFB?=
 =?utf-8?B?TVpKVXA5WE9ndXdJTHBKVEdCc3lEbzRPOTE4emRNSSs2SENTMThVM3k4R0hu?=
 =?utf-8?B?YWI1NVQ1TWEyMjFLYkF2MEo4YVZXcURHdm9YVnMzL2kxbkpxZ2RjZXZEM0F0?=
 =?utf-8?B?b3J1R25GY2lVOW9SZkczWVZPelBGQmVZR3hobURMbCtmOGxQVWRMSDkrNS9Z?=
 =?utf-8?B?TjhkeCt5cTJWTTgrS0JqWmwwY0MwejlNWkE5M2l5SDVheTlObjJ2bVlNQll4?=
 =?utf-8?B?T0VOZWxDNGNLazhQM1pBd3BHQjhJZ2pIdGpYRTluaVUzS1l2cjRyNnNlRU81?=
 =?utf-8?B?d3d3ZXE5bHQ5QUtBa1JGNXRFSUFNMG1mSmhXa3NlMVg4MGZZakJIQ2xZQy80?=
 =?utf-8?B?TGxkZ3M4akc5czQyaVFjZzJ5cHRFaE1IeW1PZk0xZkRjc2Y4UzN0QmlJMjFa?=
 =?utf-8?B?S1hPNkJEWWkvTEdwc3pLTlZqbjRPWmJFcWZ6UWZZeEorWHZ0UGZmbmkxMW9j?=
 =?utf-8?B?d1EydzdMZFVVV244ZW5nYVdjemtLR25hM2tEejdIMjBSVzNzSjlqWDBSaDRk?=
 =?utf-8?Q?IoHwz56ffMw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHl2THVyNDU0dFpSWDM0MEpsbWU1d09FSWptYVdtTW9Zd3dYaG5TWjdYUWR6?=
 =?utf-8?B?clorcjNYa3M2Q2ZKOUF5UXF6dnQ4S2M3ZEZmTHcveGNhZXFWRjNKMFl4dkxu?=
 =?utf-8?B?MlBvUjM5WUJlSkRBQ2ZRRGU3WDlZR3FpeVpnZ2tCSGFqWXppRUI1Q0M0aW1y?=
 =?utf-8?B?VzBuTk4wakh0TzFCUlpPZ1BSMTFRdUorTnlLdi9OWnByQXhMVFpSb1ZjK1VU?=
 =?utf-8?B?dlQ4UkpIVWdUaFQ2dHBlK0tYQ29wMzJTdnltYTBOOStSam1kTUJET21QV1BI?=
 =?utf-8?B?U0ZMTERkTHlPa0dDOFJ6REFwcW1lNXhRYW0xNkNNb3Jqc0xsVWVWNzZ1ejR5?=
 =?utf-8?B?OFZPbzYxU3pZWnVVMEd4bW8zc1dKS0d4SVo0SExmTlpGc2lObDFmcklRdWov?=
 =?utf-8?B?YnMwTmtJaTMvZXJJVGFIWGhiZGtTK1M5czlFVlY0S3d4WEJXSU8yS0dZcnFK?=
 =?utf-8?B?LzBvNkJ0S1BSQWFNaU52eDZlOTVUelc0MkI3M3ZxK1VvS2lrL0RYQ01WMXpq?=
 =?utf-8?B?WDUyOFF4Wm5WbmtZVjVUS2FqTlI4bFFiZ3NRRExqek9RemRiVG5YWlFiYkQx?=
 =?utf-8?B?ZW5Ydk50S0IzZDhONWh5L21hMEYyb1ZqMEo5V2l6QjFUY3hFUFF3RFhreStl?=
 =?utf-8?B?WDFvamREN0lURGtvRjAyS1J0MnZxRy9idjRqOHdXaUlpUHVMM1Z6VEJuZWF0?=
 =?utf-8?B?TWJseHk5MFp6eEh1ZWhrZStLVFJjRG80WUtzT2RlTkdMWlE2UU1keUhQYlFz?=
 =?utf-8?B?QldqNHNNZk92UjVjUUVEeWx0RVh0OE1VZlc2Y3hja3lRQkYzUCtkdUErL2pk?=
 =?utf-8?B?TXM1R1BzWTM1NlJYblVTeU40ODZrcWJUWmxTWGlXdHBDU3ptSjYyKzNNcE4x?=
 =?utf-8?B?TzV4alllKytEV3ZZSEdCVVQ4cDhBN2NIZ0QvWXczcjNXT2VIS3I2cmY4bEtk?=
 =?utf-8?B?eHUwbStzUlJONmxjd3RlU0dwTytCekN1UTlVM2lLazExWmFIRVZ4TldvV2Jv?=
 =?utf-8?B?aXlmUVUvS2NvNVk3ZjBCQ0t2ME5FSkN0V3dZRGJneWNCK1JkT0hpT09iTW9m?=
 =?utf-8?B?MVlwYnlzU3pqTGQ4QlJGWnphZk9oUVhWVXBHbUV4RGRBUkljWnFiaENod1c1?=
 =?utf-8?B?MWk2TWVrM3FYTm5UOHZlYk5NVDN6V09jaktQcXE3YVF3dFFDeldpUkFDLzNH?=
 =?utf-8?B?TENVMVU5MGtJY2RaeXBZcitGSE10UkZOZFl2ZjdVWjI4bklsL2t4c0pYVkdu?=
 =?utf-8?B?c0x5NEkrQlQ4NldrR2EyWW5CV09LZW5LbzdyWmtkbWMva0p1ZVo1Tk5CV281?=
 =?utf-8?B?KzFMMnl5KzhXUVFnMG1xNnVObmo1SlV6dTZocVdqOEpxbGhLODhQY1Q0ZkJ5?=
 =?utf-8?B?VmYyQUJJWHFtdGdrTnU1T1pCOGpnVmtEdk5GMTViTDhjclc2UXkxZ3BkUEFj?=
 =?utf-8?B?Yk5HalhHdVV0SEJ1NWR0K1B3aVhCaVV3WTE2dktPQ3pOdG01V3NDdUduQVVn?=
 =?utf-8?B?TG5KZFJnY0xETmlkaFpKajkvc3psZE8xc1IxbElnWHFtWEZjS1ppejBkMnpD?=
 =?utf-8?B?SnZpR1Q1UWZabk9aZGlXbzljYWNiYnlEaGRWMXk2YkpQaDdEbjhUTGVrak4r?=
 =?utf-8?B?QTFWNjZXZW5tT2w3S2NkWWpuOE1na0JEdlVuamxNSFVmM1FuYU5MQW9VUWxB?=
 =?utf-8?B?bnNWZDY2akx2d0ZhQS8rZDBwcldGemtXaUxPamV5YVpFSm92enhpM0d5RnB6?=
 =?utf-8?B?M0VNcEh4bHdYU0lQZDRPS29sckpaYk5Zd2lFcXhDOWcxR0VteElmcXZxemtn?=
 =?utf-8?B?Q3B1TjYyUlQzNFc4SUpGbTh0TFlEQlZPTVJlcXhqZ3lCWEoxb0crdHhyczNK?=
 =?utf-8?B?OGtpdGp1NTZXZzlySVQxcXZwUWVYS0RKNk1RLy9HbTVoV1NkVDVQT3h4MTY0?=
 =?utf-8?B?WFFSS0R4bW1UdmZSZ2tIdERTdW1CRkQ5d2Qva1hVY0pKZktmRjQzVWRBZXFX?=
 =?utf-8?B?Z09aZUkxYUhaaCtKRXRkVHczeStFMkFpa2ZRczNRdThYRG13QTdhLzhXMTVk?=
 =?utf-8?B?WTNna05DRHF3T0dwNDczV2dPVlJMUkRhVU85dXQ4QXNBaVpwaVFrbHFkSGNj?=
 =?utf-8?Q?Yqv4p3zbaxunplONLBHaArfCs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9983a461-a0c2-480f-de18-08dd71892504
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 01:53:20.6051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnRso05juy5puXGAKkfO+UMPuJ87oNwFjAaRLHhJchHjocRA5VC3AN5mdjegc8unagG74pO5hloQTTBtgsqBWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7669
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



On 2025/3/30 19:57, Dmitry Osipenko wrote:
> If the purpose of this feature is to dedup usrptr BOs of a the single
> process/application, can this can be done in userspace?
> 
> On 3/21/25 11:00, Honglei Huang wrote:
>>   int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
>>   			      struct drm_file *file,
>>   			      struct virtio_gpu_object_params *params,
>> -			      struct virtio_gpu_object **bo_ptr)
>> +			      struct virtio_gpu_object **bo_ptr,
>> +			      struct drm_virtgpu_resource_create_blob *rc_blob)
>>   {
>> +	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
>>   	struct virtio_gpu_object_userptr *userptr;
>>   	int ret, si;
>>   	struct sg_table *sgt;
>> @@ -187,6 +290,20 @@ int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
>>   		       params->size))
>>   		return -EFAULT;
>>   
>> +	mutex_lock(&vfpriv->userptrs_tree_lock);
>> +
>> +	userptr = virtio_gpu_userptr_from_addr_range(
>> +		vfpriv, params->userptr, params->userptr + params->size - 1UL);
> 
> Is it possible that userptr address will be same for two different
> processes?
> 
> What if userptr->flags mismatch?

This situation need to be considered, I will add flag check, and add
handle the situation of increasing write permissions.

> 
>> +	if (userptr) {
>> +		*bo_ptr = &userptr->base;
>> +		rc_blob->res_handle = userptr->base.hw_res_handle;
>> +		rc_blob->bo_handle = userptr->bo_handle;
> 
> Doesn't BO refcount need to be bumped?

Will add Bo refcount in next version.

> 
>> +		rc_blob->offset = virtio_gpu_userptr_get_offset(
>> +			&userptr->base, rc_blob->userptr);
>> +		mutex_unlock(&vfpriv->userptrs_tree_lock);
>> +		return STATE_RES_EXISTS;
> 
> STATE_RES_EXISTS isn't a error code

Will use the system's built-in error code, really thanks for the review.

> 

