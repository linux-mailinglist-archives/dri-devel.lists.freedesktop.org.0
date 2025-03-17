Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F78A65F37
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 21:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8067910E099;
	Mon, 17 Mar 2025 20:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bGTFmJoS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2049.outbound.protection.outlook.com [40.107.212.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F4A10E099;
 Mon, 17 Mar 2025 20:34:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drm02SZiiqSPaQtr35KvJnh9jcghI1URD6ck5KnzXoqY9vYo4bQneF9xHBLijJdATvUJ3xg5bVCXOpyJBvgnfnn6jlpnfliy+YoUGwoc2tsKBLSEreUUTqtn4CihZwncjAMGgK8FMyINWSchFvKYE5QIux1z9vq+Ojil0Fh8x23z+P2OvKCiCxArHXCFmj9K7zZ/onVbJlI/SkSdxn8LLnPqUJANP9sGYNnoYiYkHVcJKwy4mWvkBsyJcOltz2d7KZt3ty+U1nsOx2PO/c2DnWOorzlaJpYW6vv+bTZIeTziJv8fK4/ou3CiSIxX5ZolPLmv1EZWtfQeXWtqQT/t6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1W83Cu05/647avljaA7tTSCUno+x45Q87wkg5GqdZY=;
 b=myb+ec4Uypt4F0iCKUG6WmmS3L13EBaSMfKFRWEoy+PJA15NIwTxxJBYRT0QgFVAz6HC+N0rKJHTZ6tGQQWBdoWEqY8QuYj9qv+8JNdtRtiTYib9eLosLJt/jW68Fi3CgWC/nJS5C95KqcU7Sg+0GXdyjXcWEUwIXfGBQ4ALI6Ho4vJr9ZOvFDJb06vLk72LE55bXZbg7iHTJf1ViY84OWB9qIRxmUjr1CF87b+7VdjvOZR2Jtnnp+IMMxpDDovRogIDqh+QEdziFzDjA7QEffATZlLlqoiZbiYpdSUPCsim1eDNnRuP81HtGBDyeg2aKdBeRQiWAkHEOCFxCUqz+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1W83Cu05/647avljaA7tTSCUno+x45Q87wkg5GqdZY=;
 b=bGTFmJoSaJKMWzAx+dAYhFWEIj2glJQ3olwFVxt/nFm4e8BZsiPpPhet3PuYPMfHZdmzmim23NO6aitqQqCSSVSYcy6QK6kvHcFRi03Hj0ZBHNJWnBULFTnKd/QuOEQnNMk8o6xRKD/xZ8+IZ7/A7yKupF7NMOVHFbjFiy+k7Zg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by LV3PR12MB9186.namprd12.prod.outlook.com (2603:10b6:408:197::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 20:34:52 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 20:34:52 +0000
Message-ID: <efa255c2-efcb-4f6c-8864-3791d1969520@amd.com>
Date: Mon, 17 Mar 2025 16:34:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Higher log level for missing PCIe atomics caps
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Daisuke Matsuda <matsuda-daisuke@fujitsu.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>
References: <20250314011809.3243791-1-matsuda-daisuke@fujitsu.com>
 <BL1PR12MB51445BCE0365432BF55DD3EDF7DF2@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <BL1PR12MB51445BCE0365432BF55DD3EDF7DF2@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0167.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::23) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|LV3PR12MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ad4e82-f4f5-4d32-1d4c-08dd65932b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0YrL0ZQWG9pTENERFpVcFY1QUUyQVM5cExsMitVcHpwd05nc1VpZVFMN3NG?=
 =?utf-8?B?eEM1V3c5RGpiV2N2VEV1VkRDZGt0ZytVdWRoOENKWnNFWVNtZ20rWFh0R2h1?=
 =?utf-8?B?d29nWk9oZ3drVHEyd0xqY0hOMEloVjVRZWdvVmNQblJUaC9YcnRycnBVdEND?=
 =?utf-8?B?bHBYOElIaHZVY2hLcHM1T0wyVGpGdDJramgvVlM5TFEyOFVZYUxRNmRBS3VL?=
 =?utf-8?B?MjUvUHl0SGczYTJEek5nN3U5NEZ6WjhRNENYRVBrSHZ1d0FRWTJ3QkpUQjBV?=
 =?utf-8?B?NXNzd3ZZOCsvRWowRHFlcWM0NEMyZWFWUTRoY3ZuVVlIYUJONTJqOHE2UVhv?=
 =?utf-8?B?SGtFeGNPajZHNWFNNFFGL2pGMys3MzR5UUhIazlNR2hFUkNLOExtaXp3QS9t?=
 =?utf-8?B?YkppVGFOUk1Yb1BlRWl4ZGNicVJNczNOOUQ4ZWxvcUpkclA0K3hPbHpINGhT?=
 =?utf-8?B?U05kV0piTHF2VU42cURKT1h3c1Q0OEp6bTFyMkk5aVNOSzFrRGJvNy9OOFZY?=
 =?utf-8?B?ZUFjY085eFJWazlJRDh6b2o3eGNXWHVnZkN0akVNcnF0VExZNW85aElwcmh1?=
 =?utf-8?B?ckEzR1Y0Vk5PcER3SXRZUXFjMGxhUGp2L3NmeUlIZDZlZ1RYdTAzWDk4NFNm?=
 =?utf-8?B?dGJ4MFgva2hiNEYrOUJyWUpRSThSTE53UEFmUUdqRkNpL0IzRW5SSnFTcDhR?=
 =?utf-8?B?S0Vaem1FZHFzV1NuS1l3d1Budi83dUo2VUFsdEdJV0hWYkdxTVlEQzRFSGFP?=
 =?utf-8?B?VzMyTDY0SVJCUnNXOGZ2QVh2eTZ2dDRlRzhwWW16d1NQUWVhUXQ3bXB5NUsx?=
 =?utf-8?B?NXpZOCtwYUtvclBsN3UwVk1ETmJiUXhpQzZuS09oWmJSNXN5UGR3Q3FuZ2hv?=
 =?utf-8?B?T1l0bVpWNGw0MzlMS0JGWE1BN3FYa1ZxamJveE9LK1NMNGw0Y1NjazdMdkxk?=
 =?utf-8?B?OFJiV2NQTmNzQ2FWaVhTZzNwQUxFbFg3MmxzZ0k5TjBPWUNIWStQUkFRa1Uy?=
 =?utf-8?B?Uk1BVk9vTVYycnluditlYWM2dklEdHF3N0VEREJaZ2drLzM2WjhvbEgrSjlY?=
 =?utf-8?B?UnFSQ0FDRXl5WVkyWVYrVEtSSUxOS0dQV0RQTDhnSkpsT0FxOGcyaGNpMXFJ?=
 =?utf-8?B?M1dtU0FWd1d6VFZGNTBxWlplTHBiOFQxbDJvck5DMmpLbk4wQzRxMWkrMWNE?=
 =?utf-8?B?OTZ1Q29ZUXZqa3dtQUU0ZHVTVmhGL0dvS1BrS0hFMFRkbUpZczhqK0VtT3kr?=
 =?utf-8?B?UEJpRElFVCtXTEtUOVNCMG9ha2dFSHRsZks2M3B4cGdZbEVkUnVERWV3UUhB?=
 =?utf-8?B?OHNoa0dQaUtHKzg2SHV5ejI2ZjU2bENaSWwyMlBteEFwTVZoQ0prVmxUOGl3?=
 =?utf-8?B?Tjc0WUpnUEZSV0dHZlNhMHJsM1ozbGM3N0pQMnFyb1Z2K0RKWVphSWR2eWsw?=
 =?utf-8?B?Wnd0UUJORHhoKzlybTFuMWdUcThPRC9yU3hNbkhLNnV0cjBQZldwT0VtQ2tM?=
 =?utf-8?B?ZExlQndOQytpUGdpeERHUjJtVndQaUhsOUlleUkrNEVUYlRiaWU4b290ZGEz?=
 =?utf-8?B?WEgvQStnZzh6a0grUWJvTnNSRERPNy85cjREUlFROVFIWURyeGp3SDFKUUtN?=
 =?utf-8?B?VGRqT29PamE2NXl6a2t6bVFrbHMwQ01hcitBbWtCYnRlZjVTNW44VGI0VC9E?=
 =?utf-8?B?c1RUZHA0VHRlOW5tcm9vd2NOcmJmTmZ6Uk8yaWRHck9zUThNVk5QSWROemth?=
 =?utf-8?B?eXZza1FKbWJMV25LY0hHZjAyMHRsNnhVYXc0aUQ5YWxIbHFheEUrU1dMYlVk?=
 =?utf-8?B?Yy9GdUdlMThsYWl3MmRyZkYvUEg4V0VXOXBXdk1xdHZJa3JXeWUvRlQ5bHNx?=
 =?utf-8?Q?qH7kU6htnV2ef?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEJuUVJ5d0wxa2FkSTdRRHVqbjkrc1FEYUVmdC9tenBtUjhrQXU0Y2M0QXNB?=
 =?utf-8?B?ckdJVWk1UkNEUVo2NWNEeFpzY1p1bkJOZStXbXFqZ3lseGFIdVJhSkY2ZFla?=
 =?utf-8?B?ejdaUGZwUkVNSU16b0paR2RMN2tRNlZKZ09TL0EzYWZQcGxWekRGaTM4V1ov?=
 =?utf-8?B?aFdxTXM0OG5yRktLOXFZMHZHNjZ0azR4NzlENFVYYy9WMmFtT2dmVGp4OWk5?=
 =?utf-8?B?U3ZnbFJIdU55MU9PUEZjcG9ZcTZNNmxPTjRKQU4yY2RkbmxRNTFVY0kxTTU3?=
 =?utf-8?B?aHJ1V3Q2ZWxMVHlkU0grcnhHdkJ2YXY3TUU2MU93bHl0ZzBJM0pXUm9EcWlL?=
 =?utf-8?B?Mmp6Nm5nczRMTjg2Z0diWW5vT3dnbzRWRE5kQmc5L3V2MFpKLzNhK0lNVVk1?=
 =?utf-8?B?WlNObktQTXNwMFdpMzdFWWRic0RuVnVQbkc0M3FBOW0zc09VeEIvMXZDd25L?=
 =?utf-8?B?ajZhVGVWNzU4NFpqZjhtZnpTZTlpRXJTZ3JKUTl0QUdpejBNNGxueTJuRmZq?=
 =?utf-8?B?YWw3NjZ6YXhzTUJEekdWMEFNQUlBZFFNd1hVajZRM2tmb0IxUU8yRUdDMDFW?=
 =?utf-8?B?NnJrWWxqTUNKcm91eXE2MVdGbUtnNmFjZkNSR0s0Zyt3V2FTREFhRDcxMXd1?=
 =?utf-8?B?MWwwMUtPTnZDdVBJTmVvRThzY1Z1NVVBOGcwNzBnU3F2Z2xiR3c2TkRnUXZ5?=
 =?utf-8?B?Y25ZaHdTV2EyK2tta2F3M0VkblpaOTJxT3NwcWk3NkQ4eTdETFZ4UDB6QjhS?=
 =?utf-8?B?ME1xUFQ2cXBKT1ZEZWRUVkJoSzJhUFg2Mmo1UTJwVitua0d4bTNkK3hZZ0Ev?=
 =?utf-8?B?RDRmV0luQTl3ZjV2TklvT0RMK3NCbEw3dkxnUEl6K2dTMXozMFBPSlVSajFB?=
 =?utf-8?B?a0Q1MWo1MmFub1FIdE9heEhQT1FTa0hWOWRTSEhPWm9JNWxBV2tHQXVqekZ0?=
 =?utf-8?B?MUd1QlhRMjRFRkM5VWswSTFWUWxHTGY3TCs4amZFTExNNkVmTVR5NmNERTNB?=
 =?utf-8?B?YkM3M05tRHdYb2hCSlBnTTJ2MkxXSFpkLytBQlBWKzBYRU1DdVVMWlRnOVZr?=
 =?utf-8?B?dW4zdm5taHA5VTZ0SUxIUlNvZUxtQlU5K3A4MmhJTkdVRDJQQVVqbVgwWlVy?=
 =?utf-8?B?OFR0MjlsQSsrbG9EZU5BdEdXSUw3RnI2NmpDdFJlSjUySDQ3cFdhWm13Uysv?=
 =?utf-8?B?NldGWUhQcjlabjUrN3M5TzlVaW94L1FaaVhuaEVVV1hhWkFkdWE5OEUydS9o?=
 =?utf-8?B?WFc2SFZ5VGs1MVJRYUtJWWtvVEZGeWRKVUdlcDRzQ2pXVzIxM0krM3BQczJD?=
 =?utf-8?B?NWRqNGVmak5GYWZZbWF6UllSNldPdDhCY0tja0RUdzFqWXVsYUY4azIzKzV0?=
 =?utf-8?B?TXJ5N1Z4VUcwZm8yNVZlNFN3ak5ocXJUeHBvbUdsMDVQbThzNWhCRVA4VzlW?=
 =?utf-8?B?ZGd1a0s5b0NaN3pMeHZUcU8yaEZzUDUyVWhnNTRvMmRrbmFEdUdLVFhJRDRT?=
 =?utf-8?B?WE1idTVaem01cGszb1JWSDB1WDBzOFZOY3ZYTlVwWTFVTzdLaEJUdjFiV3Fs?=
 =?utf-8?B?SDJ4WmhOVXVWVmVvTCtXZVlaaEZjSXI0TW4vNjJTaXJDSHgzV2s0bEVwVE9q?=
 =?utf-8?B?c2pjZ1pFSG94ZmlCSGJ4aDUybHFpNDNhYlQwVkFESmxJaFQ5cm50RytQKzMr?=
 =?utf-8?B?ZytZVnRzY0dHZFhwT2V1aVdESFB6bUtFUEMyOG9MRE9uWjZPOFZiTkFVcHlH?=
 =?utf-8?B?dzJta3hnd3hmelhHNmw3MkVxWDA0VS92SUp0NTdsbXpmZ3QrUlNHc1dNcWdL?=
 =?utf-8?B?WjFPZTdid2dHVTkwUWtPZS9hRkk1RTZZaWpMeFcrZ00zbGJEalBrMEZmSkFO?=
 =?utf-8?B?dm9QTFBrdzNZdFZNN0xMbnR6RUllR3cxV01sSCsyYktRZ0JkWXU4d0RLV3Mw?=
 =?utf-8?B?Y1NFWEZrdmY2K29SSFkvL3hOOENPUmVoU2FFWEVHd05mTm92a084Y1IvZngr?=
 =?utf-8?B?MWNoZkFHbFhGU1VrdGZsVzR6b3d0dm8rZlRWYUtLYUR2QUtPU3d2ZmoxeUdL?=
 =?utf-8?B?eW1VQm9ZUnkzVG5wdGdrV3YvKzhXZjVDNk14QXFvMGJ2WkUzN1NzeVRSUjls?=
 =?utf-8?Q?rtI25nhoZqx8Rvaj5qK6MjWgL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ad4e82-f4f5-4d32-1d4c-08dd65932b8d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 20:34:52.5309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZmAdgCs9ZAPSKVg+xp8Cg7XQltt0UozvdgMQ3w7Ll1SCtRcx4pKAb8/YYM3pY/Qtp1x+BakcIuahYr9kStuEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9186
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


On 2025-03-17 15:07, Deucher, Alexander wrote:
> [Public]
>
>> -----Original Message-----
>> From: Daisuke Matsuda <matsuda-daisuke@fujitsu.com>
>> Sent: Thursday, March 13, 2025 9:18 PM
>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Deucher,
>> Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>
>> Cc: airlied@gmail.com; simona@ffwll.ch; Daisuke Matsuda <matsuda-
>> daisuke@fujitsu.com>
>> Subject: [PATCH] drm/amdgpu: Higher log level for missing PCIe atomics caps
>>
>> Currently, ROCm requires CPUs that support PCIe atomics. The message is more
>> urgent for GPGPU users, meaning basic functionalities of ROCm are not available
>> on the node.
>>
> + Felix
>
> My understanding is that PCIe atomics are not strictly required, but there are some features that are not available without them.  Warning seems a bit overkill and potentially confusing to users that have an existing system that otherwise works fine.

I could see either argument. The GPU is capable of PCIe atomics, but the system configuration (chipset, PCIe switch, etc.) is preventing them from working, which has an impact on some application-visible functionality. A naive application that depends on atomics and is not carefully written to provide fallbacks or fail gracefully in case atomics are unavailable, would fail silently or produce incorrect results. So maybe that justifies a warning message.

Regards,
  Felix


>
> Alex
>
>
>> Signed-off-by: Daisuke Matsuda <matsuda-daisuke@fujitsu.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 4 ++--
>> drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h | 2 +-
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 018dfccd771b..faeef136e272 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -4374,7 +4374,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>                       return r;
>>       }
>>
>> -     /* enable PCIE atomic ops */
>> +     /* enable PCIe atomic ops */
>>       if (amdgpu_sriov_vf(adev)) {
>>               if (adev->virt.fw_reserve.p_pf2vf)
>>                       adev->have_atomics_support = ((struct
>> amd_sriov_msg_pf2vf_info *) @@ -4395,7 +4395,7 @@ int
>> amdgpu_device_init(struct amdgpu_device *adev,
>>       }
>>
>>       if (!adev->have_atomics_support)
>> -             dev_info(adev->dev, "PCIE atomic ops is not supported\n");
>> +             dev_warn(adev->dev, "PCIe atomic ops are not supported\n");
>>
>>       /* doorbell bar mapping and doorbell index init*/
>>       amdgpu_doorbell_init(adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
>> b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
>> index b4f9c2f4e92c..c52605a07597 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
>> @@ -240,7 +240,7 @@ struct amd_sriov_msg_pf2vf_info {
>>       } mm_bw_management[AMD_SRIOV_MSG_RESERVE_VCN_INST];
>>       /* UUID info */
>>       struct amd_sriov_msg_uuid_info uuid_info;
>> -     /* PCIE atomic ops support flag */
>> +     /* PCIe atomic ops support flag */
>>       uint32_t pcie_atomic_ops_support_flags;
>>       /* Portion of GPU memory occupied by VF.  MAX value is 65535, but set to
>> uint32_t to maintain alignment with reserved size */
>>       uint32_t gpu_capacity;
>> --
>> 2.39.1
