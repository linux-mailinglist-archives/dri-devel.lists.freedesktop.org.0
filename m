Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E30491DE2C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 13:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BA410E3C0;
	Mon,  1 Jul 2024 11:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UOOQR+tl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3326C10E3BE
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 11:37:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIuFlWFhNqVxOtIN6LjcDCKuguHQvb7N4K4EDHfm4ztzGHg7wfVxjHQbaj7S0n+/BaiZpGWKKxV5GC8vMh6MSPnEQOZeEvftAKsK2Al1lN+dVxZEg964s12BCgHowKzC853pT+lYAB/GV7xrmdRBwZA1VL/Msu7KYJEaUmw7qZ/NFEQDwsnHITlCyylnsGiD9IiWEokgynsSsx9+uS/x63f+sJrZC/Yy5JQZheDJaSBoEmHJAlkSNLp5sss1nTAnWHwP5SCRLYXglt6fGTfvQmPtbmDgEOi5ol7vmCIWAN0TLK0Vu8tKE+I2temXtlVc7G8rHNRBhEF/PxW6a4+gNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDVx40cAr3lJJGehKRHQ8DqbgBlQ1yT/7Q9u7bbXja8=;
 b=YrcxdbOdmFBkW6mbyHBCP7tD5YdavuL+acQmyeVADAe1IaaQLxjmPNBcjF2URaE1HdAuwfOuLOod+WPAEt4Vt/TrFo2C/YDBASxD7lYpuKEN52IuZRL+KEp3P4aNqHQWnMQD3cvevGY/Edl880b+h+AtyJaXP3AiR5lCXUcgE4ucb4pdAiODqiS1TVi61PjgXYspY3f8Uet4UlzvcE4PekejRF0hK8C5Abkji9hZkkTwxKzuJ0YPIsbHlkgWvycXU1u6g5wOG4KAaqA54W5x1mJrpCv6cPe+N/RHyNRqTFIt02kxazcAQsUja2BJC5s26U71jvCv9xOwQ8HmdG9THQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDVx40cAr3lJJGehKRHQ8DqbgBlQ1yT/7Q9u7bbXja8=;
 b=UOOQR+tlKgxxY3niuQ8lcaNiUbXNqWnlft6CYUZWz7wI5Ug/JZhZQwX6KOLB6eS54IzF5+QzmoOrVPtjjan2e0dZQP2EZV+dBwlDf749gcJ6IS+uGXt2VCR4rrqwI7monCZqIl6gLf4c9NeWkrnwAYUidZTHP9vVLKI859DOmKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6306.namprd12.prod.outlook.com (2603:10b6:208:3e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 11:37:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 11:37:44 +0000
Message-ID: <2a087cc4-1c17-4c00-839a-6736bdba2b73@amd.com>
Date: Mon, 1 Jul 2024 13:37:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] drm/ttm: support device w/o coherency
To: Icenowy Zheng <uwu@icenowy.me>, Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240629052247.2653363-1-uwu@icenowy.me>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240629052247.2653363-1-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: 023a003f-bbe8-43a5-7d4d-08dc99c238e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzBwWUdhU2tuSFJFc3NHZ2RodVZvZS96Yk5VcVd4dHl5OXk5dXRud0xldmU2?=
 =?utf-8?B?RStKQllUMSs2ZDQwSHZoTXVmQ1ljZXNURVNpR1p3ZThHNVRIcHBxWEw2Rzdj?=
 =?utf-8?B?NWZIckh2dEZNZlZ3NHhuWVhlMWpMRGxRaWhPQWdWSUdpWWZEbWdIY3Y2WDdH?=
 =?utf-8?B?R2pMVWs3SmFmSDVOcG1zd0pxQlBkd083T25jTEhWY2xVa3crYVpLT21IUGNn?=
 =?utf-8?B?K3hISDVUNDdXbGs1NC9FL3J5dThYLzNXYnFiaWQ1ZmxXN1M2V0ludGlYMWNV?=
 =?utf-8?B?cjZxbm8wU2dicDFtaHpVRThpS3VqV0JBRGFkZWdLM2YvU1A4enJIUTBFdXlk?=
 =?utf-8?B?Z1NXUFduVi9mQVd1anRRc3ozNWh3ZXB5NXhjN2FHYU5FbFoxU21VR3Ixemxo?=
 =?utf-8?B?UmJ6RFJycWhzQUZNVThVOHhjZWJvQWZHTDBML3RxVlYvelV3QVd1NHRsaHN1?=
 =?utf-8?B?QXdhTk9lSDdnbzJFK0hCU0s3K0VrZVBzMHBtUkN5bFBLcFdOZHlha0tvakt0?=
 =?utf-8?B?dytGVWVRWHZLZi94Z3crVkpHSUpicGJqMEJ1elZRcWlya3U2cHc4Q0VTTDdY?=
 =?utf-8?B?emRRcXRrMythdWxLdnZOalA0VzVnZEYreHNsQXRCbFE4TmppQzhyTFdpSHMw?=
 =?utf-8?B?NWg4SjdZNms4emJGZ1dOaEtsZGlWYzlmM2c1RzNKak41QXZtQm5ZdFZCeDhr?=
 =?utf-8?B?Q3NReXBOa0JXeE9aQkdXZTRkMjR4OWdvR3ZjQlMzK1JzSkFQMmpMMTRuVUFN?=
 =?utf-8?B?VDdYbjkzblBxT1JkMHNtNUVONWR5VW04NFg4SzJibnZNMXBxZWIycE5EbWZZ?=
 =?utf-8?B?YWtKRzRqSmU2UmRsaU1ac24ySm5RNC9xa1lDd1I5NmExdEdOellFWVZDRVA5?=
 =?utf-8?B?M1BMOVBMNlBRdm8xUjZoLzV2UFpaRHY4TC9oS01UYTM3RUx0SWNTVEk1bWxB?=
 =?utf-8?B?ckZVYS95WEozUnZFalRKazBwTlNOZ0x2RDlMNUo0WnVNam1Lb1B0UFJKSEU2?=
 =?utf-8?B?MWNvbWVqdUQ1RzR4bDZYVVJMdEFYRUFnVUJFQ0llVDFDc2JUUk1Sc1NEM0xr?=
 =?utf-8?B?RXFqRXJZR0xhS0Zxc0VLaitQVk9qWk5xWmlPKzByOVlkVTBSTHRqMERnY0FI?=
 =?utf-8?B?bU9oRHltYUs4cmJjN3ZBYVBDVkZzQ1lkeU0vWEpOUGNTWFdUVWxjbWljV1dH?=
 =?utf-8?B?SDQvRlVobno5by9nQ0gyVlBZRVJ4Z0swK01jWWNEUTROZjNOVDZtbWcxZTl2?=
 =?utf-8?B?VHpXRFdWTVFkUmp1dHJpZ2F4VzRic0xZdGNkbXVNNFJPRnlGcjQyeG1LSk1w?=
 =?utf-8?B?NDV1UWJPWGhJRnZBRk5mdFFOcm83RGFpM2NWMkdjdFY3MWt3dHJnRzZkNmFs?=
 =?utf-8?B?Y0dSTlhuN3FYWEZDNXpITHVzQ3Q1UWYxTXNwRkJ5RTYraGFBRnBiR0tKK1Va?=
 =?utf-8?B?LzVHTmw2SjJzbHpZdHB0Z2xwQmg1dk1SdGlRcWlJUWtYZk5MM0Z5RE5xV2Fm?=
 =?utf-8?B?VXJLdzZ5M3hFaUtEQ21IdmNYWGJ3UjdqOU1zYXpvdTFER1RzbHdlNXI3Q1Jm?=
 =?utf-8?B?aGo0M0VzMjBqMnJLbExFTG8yOG5NNjlCMkNHSUNFV3pqTksrSW9JVkpIbmtC?=
 =?utf-8?B?bjVkZTlXcnBFTUhVYXdXSk1sVWRFTml0MjBHTWFXTkpYVGRxUWE0dmRrY2Jv?=
 =?utf-8?B?VWRpZndNMWhIVWhZU0ZidDVNUWtXYnZuOVJxMlRFVGFCSXY3akV3akJzTEdC?=
 =?utf-8?B?RURNWFNpUDRpVjMvWmlKOWdILzQ0ZmdlNEFHUHVuWEM3cnd4SExGS1h3bk1X?=
 =?utf-8?B?bkxyRWNoM2gvdDBHN0ZXQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHhYb2hlalFTRmdOSVF3aEQxZ3NqeGNZNmRJY3Q0bXA0RmowVzgyZTZmcTVV?=
 =?utf-8?B?UHo1L1N4M0FydzAzTk1mWEprWEVBZ2lUMnpqYmpXYTI4ZzBTc01DMDB1Ri9Y?=
 =?utf-8?B?eHRqd1c0ekgzbFZtOXBTYnI5UXRiaFVpK3BrOGI4a3BFOFdJNGNScEpzeFMw?=
 =?utf-8?B?RkQ1TzZoakxYUlFoVExLOVR0WlJTaVBKcDhEMUNXV0NKVTV6L1JLUVpYeG9M?=
 =?utf-8?B?SjJYWXljMksyOEczQlpZVExvMFJyeWJqVGVCWFpYWThuWUJlVXVvSmtkUExQ?=
 =?utf-8?B?dDVmeHJGNmF0YWhDOGl2SHMydlp6NmxmMmkyc2g0UWsrMU5nWGVHQUV5eGVn?=
 =?utf-8?B?STlYcFpBZVM4akFjdHRsYm5xd2NxZUZoT2pFR0NGZXpDc3RtNFVyeHpyWDEy?=
 =?utf-8?B?VFFrdnN3V1ZqdGhBNENuREl3OEk4dUtaQjIrOTVoTVIrWldxWU5NSWJqMHZy?=
 =?utf-8?B?MGkxMmZnYW1jc0xLVkhDQXBmVTNJWmwrSHdtZWsyelpzOHlNTmZvZldkemt5?=
 =?utf-8?B?QUlDTEY2bUgvd0gxa0ZSMmRHbFM0cUFXWUpsSWpXZ3hDejd5SWpLMktnS2Nr?=
 =?utf-8?B?RHJDRFpibkVNNkFQSlAvMk1uSHJpcGR6ZEJ5VzZpVXR3KzNtaVpKRU92dnhG?=
 =?utf-8?B?bVBrQjhmM2g5a01FazVsc1E3WXN1UTYzbGFMT3QyaFNUR2VYblhrN0FTT2F2?=
 =?utf-8?B?SWRNdlhBQlc2bTEyWGZ6S3UyMG9EU2JDVlhrdDgxRVJjRmRCVlEvZVJkTGdp?=
 =?utf-8?B?UXkvTXpNUWZqTEZVcy9XeG9DZUtyMSswcWM5ZFNvRm05ajdQZmhDUyt1N04v?=
 =?utf-8?B?QWo5VDJvcGV5cFRKVnMzOHFRTW1NMkJwTXFUVXFXcWZyOXJQZDFBYklzQ2I1?=
 =?utf-8?B?VjdTa0U2bm1BV0ZkeXNNdWZLbVVuQ3UvckZTbEpaaUZVTFJGbktZYXV3NG5w?=
 =?utf-8?B?cS9HT0RVK1JLSHZYWjZ2MUNaM29tVGJxVGd4RDVRVE04Szc3ZUF6aXp4b3g5?=
 =?utf-8?B?ZGlLb1BmdWlWUmFHU292YStZYjVkZHNwRG1od2Q1Qmh0MWd3aStxdVdCbUtl?=
 =?utf-8?B?VjM3dER4K2czQWVWSkczUXZ5eGExazc3ZjNiY21IdzBFOU95RHFwbFVLbUtP?=
 =?utf-8?B?dWQraDNTczg2UW15WGw5SzBTUXVHaE16UFZVQTZhU29Wa2kxdUJ6c0gxOTFB?=
 =?utf-8?B?NXlxL1VyeHYramdmdm9sbkNtc28wMXVtSEE4b01kSVAwRGQzYW0yZU1SYTFq?=
 =?utf-8?B?RXRkQmEyYWJIaG00T0dpZlVDWTBSRG5XOGpYS1hiSUtZbmJhZ0V3ZTdvV2Nm?=
 =?utf-8?B?bk1Gblc2dHRubFRHMFJVOGdqS1lnRU9iVUE1UFdPOCtMUm1pdHB5c3Q3ZUY5?=
 =?utf-8?B?Z0lJMWF2VnpxK0ovQU1wdEordk5DMjRVT0FqVzdDYjFFdzZHdlZ6ZXFCNHda?=
 =?utf-8?B?WWlXWGRGQll0K0ZlTm5JRUNTbzFFeC9ZZjdWbkV5bEdIUTE2VU5NNGV2Mloy?=
 =?utf-8?B?ZjAxUEFDSXc4bHZUSEMyQXNYa3oxaEdISCt4QXQrNy82TlQzSDNjNW1ZTzl2?=
 =?utf-8?B?b0lSeUl3NnByYnV3LzhrMnpuOXJSUWhta3h5QWlRMmlkRGQ4LzEzVlhHdTdJ?=
 =?utf-8?B?Z1VZQTRoZ3pXMUZQRGRpM3RGSS80WkNWdjA5TFM5VXpqRWdpNnJMSlBDcUVE?=
 =?utf-8?B?Ymo2djBUL2dDcWRXdVEveDk5REl3Z0dEK295WWFYdXErbXYzbGhHSU5rVHRK?=
 =?utf-8?B?djc1UG5sTUZuWHdzSWRvRXg1aDlHdzNldG5FZTYxWjJGTHJ2WVB6NkxtbUdK?=
 =?utf-8?B?OXBtVXlvNDR4YlB5UVdIakZQOU5BWFRhMUU2NFZidkNrcWhMZXhJV0ZCQW94?=
 =?utf-8?B?ZGJFNC9VTFFIZWU3YlJzV1RQNm9TSDM5cDF0M3pmckRxQ3owR3JLZnF0WXgr?=
 =?utf-8?B?OFA1NXY3MTZMOUFkK3JMVURnOTZicHhOMWlDNVB3VHpwVk10WkVYdWJKd2VU?=
 =?utf-8?B?TG42Uk9UNWtwMDdRV0lCc0VSdFNoSDlEbzJxS2YzQVZrWk1oaUpKR09pb1pv?=
 =?utf-8?B?a3pBYVVkNkF3bGorcVVnNkJmREVNVmNpaHREak1qdlBKWElobk8zSHdUQmZs?=
 =?utf-8?Q?Vx4CQAI0lHTEubtolHcS4dCEv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023a003f-bbe8-43a5-7d4d-08dc99c238e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 11:37:43.9226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxsPte6i5skp7WWCIi0MKsmMlogUg2VRc6IvTMssSfiX74A+AWPoFGLwKo3pi8uo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6306
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

Am 29.06.24 um 07:22 schrieb Icenowy Zheng:
> This patchset tries to make TTM support devices w/o full DMA coherency
> capability (usually due to part of the link between the device and the
> CPU, esp. PCIe controller, do not have full coherency).
>
> The patchset itself looks quite straightforward, however I don't know
> why this isn't included in the kernel in years, so make it a RFC.

Well that's already supported your driver just need to request uncached 
TT allocations.

Regards,
Christian.

>
> Tested on Rockchip RK3566, which has a PCIe controller w/o full
> coherency with an AMD OLAND GPU (R7 240). Mainly radeon driver is
> tested, but amdgpu driver is tried and at least OpenGL (glmark2) works.
> (The board used for testing is a Quartz64, which has a PCIe slot that
> can directly be seated with a PCIe graphics card)
>
> Icenowy Zheng (2):
>    drm/ttm: save the device's DMA coherency status in ttm_device
>    drm/ttm: downgrade cached to write_combined when snooping not
>      available
>
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 4 ++++
>   drivers/gpu/drm/ttm/ttm_device.c  | 2 ++
>   drivers/gpu/drm/ttm/ttm_tt.c      | 4 ++++
>   include/drm/ttm/ttm_caching.h     | 3 ++-
>   include/drm/ttm/ttm_device.h      | 5 +++++
>   5 files changed, 17 insertions(+), 1 deletion(-)
>

