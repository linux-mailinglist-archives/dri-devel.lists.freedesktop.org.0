Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E64CB57B69
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EA510E47B;
	Mon, 15 Sep 2025 12:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PLGtsG18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3B710E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:43:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vl340nG2A55DbKMGwZ+/gQ41PuVBGC0Z7N9G7lZLmBimVoISgaNIm9OUKr/g/KDWHH/zSOaSEJ6gPVyQ1+DhBEIZBKPBQq+v4FBDK4vQKTWGDuoR7EmdqXDh1ekOfQal2zbk5lcgbB4DUlLQthmcieP9yFsXpM8YUyktSDysRyGRKbgmZ+QiTLCByUbPp5Q23xgRf22wI1SeP7ZhTIVDaYjp+02gpLKOs8THRbm0MSJ/h2b+eJiUaBjS95WgbJfJe3C8IUEVXcHtpt23MczUrPzWg6Z6Nm7qvo+A/ZUcDWXQmrsc+zkw7e9/Bc+YfNNNmAsNBCiOzT4NwBsXMZyACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ntfaVLBpGC9GgWrrqw2m3XkvQ+U9rpmHzwZuSbQyiI=;
 b=oZjRfnRKww+MhME5m73sD7K7gLfbOVu+o8CkJS6ec5Nue5DJPQrfVML+xpFwroyUKF/w/1gXSSpXs+rlEm7ODZWfq26WqnlVMzanpTdhUV6IEL7ckLHG5DISscDJKt12Wuqq+lOlRgLSgY/cd1AE607awe3GfDLKqL2SY1LIhz1HjtJNkn8yj9SI2YifYgT2xcY+T1zxDAoziNEeqoxOg0Lh5CER2HUEm1pQtOMQiJvF+cS0cY41FS32Xk/YKJdb0OXN18q0nOLtuawsUMaayhbgl9c9J/xHuDMokRDKRVCGcFtQ2tmDuo4FUPYTTHQsOFSmpLeNNIRr2W1BGfOl8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ntfaVLBpGC9GgWrrqw2m3XkvQ+U9rpmHzwZuSbQyiI=;
 b=PLGtsG18681EpvZrlfyH6ztKYIz56LHnQ6ehSG/s7gPxvQvKXMBAArzczNGldwMETx3PiUAanjkkDsvINrbiHTqCDbKctlUnk9EbGfSj54cvSIOvXE3uR1VJ3JG1zGg4Uiovz1ZW7Uk4CC3zo3euvbc8ZeAE5XjMlPFvm/p4laA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9080.namprd12.prod.outlook.com (2603:10b6:610:1a7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Mon, 15 Sep
 2025 12:43:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 12:43:41 +0000
Message-ID: <63c19593-36fd-43cd-a7ce-f3f7af4eab69@amd.com>
Date: Mon, 15 Sep 2025 14:43:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/ttm: Be more aggressive when allocating below
 protection limit
To: Natalie Vock <natalie.vock@gmx.de>, Maarten Lankhorst <dev@lankhorst.se>, 
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250915-dmemcg-aggressive-protect-v1-0-2f3353bfcdac@gmx.de>
 <20250915-dmemcg-aggressive-protect-v1-3-2f3353bfcdac@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250915-dmemcg-aggressive-protect-v1-3-2f3353bfcdac@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9080:EE_
X-MS-Office365-Filtering-Correlation-Id: 76aa4f3d-a9ce-4506-31c5-08ddf4557fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVA3SytzME00eDFKQmFUNE5wRnFtMllZaWtzNlZDeERpcTFoOGpTV0NXMnpJ?=
 =?utf-8?B?emtrNDhmWVVQTWJnbVk0bzlJbnFuc2xwQTd1STdjQmhXa2psRm4zdTZ2ZnhI?=
 =?utf-8?B?c1I0ZFV0eWhQc2FyTGVsODI4dnVMbzY4UGZLZmdaV0EvR2kvNFU1V1JuK3U5?=
 =?utf-8?B?WUpXN29wMU16WG1BNVppVUhBWEpMTWhwK2pkWXA5MFZhaVFJVUxVdmN2SW0v?=
 =?utf-8?B?cFlPcDNObGN1c0l1Y1N5dHNBS3lIZVN5eGFTcVVkVmFUSURMNUl4NVNVYVlE?=
 =?utf-8?B?UUcvUC8xNlppOXozMGcyb1pHbCtsTFZ2OTYzMU9ORDh1aUJBSVBmN2dwR1pq?=
 =?utf-8?B?UTczV0doTW1QT1o2dU9OYlZ6UmRBT0h3bDJwYjM0OHNETFhZaEhYUjYzV3pp?=
 =?utf-8?B?dVBZS01MWEMvUzFKYTljcU9qSWdocGFMMVgrcmYrOTZkVktQR1Y1OG5WRkhZ?=
 =?utf-8?B?bnJIM213Sk8zblhTd3NkUWxhc1lwbE0wbVQydnY0ODdGN0dyYmhKNklocFFt?=
 =?utf-8?B?ZlVFbWJIN1VDTEYyY1FYbWdyS24xdElTS0dCZUUrVzBHWEMrclVyandQTzJP?=
 =?utf-8?B?Wk4yclpvNHVjczQ1SUJubk5LZ3U4czdYcS9VcVErL3lrZ3V0eDBJdE1wLytZ?=
 =?utf-8?B?dXU5NVR5WmpGNkJJNzU0MTAxVnVPR3R2NVR4K2JyczNLYnVoV1JNSDMvWEdN?=
 =?utf-8?B?ZmxzUDdQMlVpNUN0ZHBIQkNNMWVuVVVrTkNJVWJ1YXdlbG1qdzhPYldYSS9M?=
 =?utf-8?B?Q3A5NGkyQ1dRdG95ZjVsNjF6ZHNzenR3c2RHK2hzTXRvYVUvVUdMdElZa3Fy?=
 =?utf-8?B?NGc1dGJKYmk5Y3Q3cFczdjhnVTU4YVlJY0ZPNVF2cTNTOTBvRVVyVXVYQi9a?=
 =?utf-8?B?UWVBQWtQWkk2TWJ5S1BpZ3g2L0FRTWxQVGhxbmhkemdCQy9JNFBPL0JMQzZQ?=
 =?utf-8?B?ZFRtSHMrbDdER1NkMVJ6VG8xMmhaS0JGZlRZdGZKaXlQcDhEZ1pYeHFsVkNw?=
 =?utf-8?B?UjF6eEVTTFh2YXF3QytqMVVWRDZpZXFEZDZBaU5Famd6N3JTUkpNZytYeERr?=
 =?utf-8?B?YnRDQXFzaEMyM0cyN0lFUzRla3NVaW8xN0V6aC9Hc2pxbEt4c3p1ckNvVG02?=
 =?utf-8?B?QVY1Znh1dWIwZ3FsRzAwcDRaZkpCZ3lFbzNNaFpETHRYTllOL0Z6eXpUeUl3?=
 =?utf-8?B?d280VUpqY2h0cXBuUXl3b3NLL0JjOTE2SWZhdWJNZ3BPSi9CbmttdjhtUE0x?=
 =?utf-8?B?TG1PeXdOcmFmb29OakVBeWVoc3dlczJZRHJOU2I5aGd2cytjZElOeEVvVVoz?=
 =?utf-8?B?RmpRQzNvM1V5OXJUZTJWZVd5dngxS0wzdVNQOHlHMXpiMUtDV0JubWQrMUNW?=
 =?utf-8?B?NzRWenFrRDViekZhZ2ZzU3BNZDhyenRCemkranBQcnhuOVRaQWNnL21ZVXVG?=
 =?utf-8?B?Qk1rcVRmanorTnpBei9tcDFlc1ZjL2xBUnBZSnFjRFVIK0prMVlmOUcrYzlY?=
 =?utf-8?B?Qk5KaG10NEYyaGdCZmxBbzhXMUo4ZEtLZzhKQWJGcnFuVTFKa2wrdG4vRFA3?=
 =?utf-8?B?VGlVeS96YnNRV3JzREJGTjUrWmNDOGlvYnpIWW1DR0w3ZUl6SDVlSFJYWDlG?=
 =?utf-8?B?RHR5UDJVYWpxT0czOTV5clFXWkFLdGluNExTd01qS0FoMzJhaVF1SWFVKzl6?=
 =?utf-8?B?a0YrREZNZUlySDM2ZVpIcjV0R1ZYTGIza0d6OGRTRDhySUhCZkwzMG10VHZj?=
 =?utf-8?B?SUg2RDFPYStoUGpQVHo5VDYyTW5JVHorNU1LdjFhWWxXYlBtRjNDdkRQOTFL?=
 =?utf-8?B?dU5Jb0hHcnVGdlZwT0o5c0QrQU5ubU85bW05ZE5mb0cvTVplQnBFT0UzeDBU?=
 =?utf-8?B?cXJkaVY1RFhaeHVzdWIwRUVKYUF5TThYTHM0Z0FPNXM3WHJsUzZHeDA1cHM0?=
 =?utf-8?B?d3pRa25kZUdpc3dBazI5aENCT2ZqazhEN09reEhpNkFlWmRGRXFEQ3lFWlQ2?=
 =?utf-8?B?NkxZUDFIWGxRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG13ZGErMUZ0VlpFSXVuK0tzWUk2Wk5hUWZJVWRKbG5aQW5MOWp1Q2ZPTTRu?=
 =?utf-8?B?SEVtdXV1bzAzT2tSeDB2c1FXL1BlR05oYzh2clNtL0xKTTdHMEtkK05mQWpa?=
 =?utf-8?B?VkU3TUZ3YTRVdXUzTHpDMWk0SGMvcmlmdzVNM2lkWkhLQ3gzYlJPQ1FoVVBE?=
 =?utf-8?B?S1pjcDhqcE5Nai9CSGNGWGNlNEg0dnZ1Q3ZDaXAySm42U3lzbXcydHlPOVFO?=
 =?utf-8?B?U3VFU0thcitsQjlBU3RhRXdMS2lVaVZIR0hHWkZQNzMrR3ZzOUpDeStDN0wr?=
 =?utf-8?B?M3A2dGJQSmxicC84Zy9zRU11dUhxQ3ZCY3RCN29UaVhZVG9BcHVUWjUxcUQ5?=
 =?utf-8?B?OG9OdFRSdkhId2syM20xYTVzMW16SGdXczBWQ2hCR29aZlJYNi9Eak9pWncy?=
 =?utf-8?B?WHJseXdaWFZjQTdYZjMxQkVzWlZ5bzBsa1lnWmIwYnJ4OVZOT0xJL2l0WlZN?=
 =?utf-8?B?cUwyektNc1Q0UEZsSGRFUTZ2U3BHMnZqeDN3WEJzQkN3eCtyZzZyaWFvWjFS?=
 =?utf-8?B?QmZGVVhBV3VYVGlRZUU0Mmo4eGNtWS9WK2NOSVc3SW81ZVBCOUNTMU15eFVm?=
 =?utf-8?B?Y2xTWFhHQzdMVTJueWdacUZ6V09SRFV3eWFPUk5vWmdtMXp3ZW5HTDFzeDRw?=
 =?utf-8?B?SzZJTHphU0RWOFBtVHhreVR3V1R4V2U4UjZEWFRweEd1SHhHdzZ6SGczVVFs?=
 =?utf-8?B?bmp2SlhRVm5BWWxIMGsxNXVidlFFVXMxYVJSbU9TcnJpTVZ2ZUhPcUx2QUVE?=
 =?utf-8?B?VXZtaGltL2xHeTNXQTQ2dFU5QzNMZjdnUWFXalJwYVN6bDlVQ1Q2OHk4QWpV?=
 =?utf-8?B?VEQ1RHRsaUo2RFhFVzR5SWpoSkVMRHpPUE05MHBrT24yNDYyQk53eXBJNGw3?=
 =?utf-8?B?MVN4bmlrZ04za1JwOGZzbGxkSU9VSVQ3VWk3OFAvK3RwcDZEaVNtOG5VL3la?=
 =?utf-8?B?V3M5WDZMK0NIU3JwUUw5MmsycXdwK0ZEWnkxcFkzRCt6aDFTNkVtZG1wVCt2?=
 =?utf-8?B?TDFoMkRLZVJOVE9jZVdKc3EvNmkyQTVsTE5yOWV3SmRlemF0ODU1dzBQbXgv?=
 =?utf-8?B?VTRiTFVYWVdwOXlBMk9Ha2V5Vlp5M1c0QTcxa1hPcGlyYW5uMldoYWY1OGVl?=
 =?utf-8?B?dEtwU2lsYlFKOXpTYmpuNVk2YkVMdE1tbWtVczNlZjE4L2ZiMDJLclRTeDVy?=
 =?utf-8?B?cXppOFJlYUJkNHh4VGRvcktKdlI5UGJoV3FJbkovcUpvRUk3a1BBQUc1OHVq?=
 =?utf-8?B?NTRuenlreWV3RlV0eGFwNDRpcUVTWXdqWnFtUlhJRXNqZUoxV2hHMnVib3RO?=
 =?utf-8?B?VzdwMzBiUUk5ckJWUGN1Zzl4Z3hPZDRKbmJTeXJNNnppUE12Vkg3bGZUUk8r?=
 =?utf-8?B?bFRHQ3RhdTdTN0JGMTFhdUo3UDJvMnhJVHBLRW9NWTRJcFFBY0ZpTUxJbGdV?=
 =?utf-8?B?NTdYN0pybCtmZEM0TmJEYmtxMXMwVnh0L2QxdGVSOEl4ZktMcVlmbVVCNjlX?=
 =?utf-8?B?K0MyKzJxeWhVbWhhOWprUU5laE9QNHFQdnVGVUEyQyt5YWVWb3p3d21BRWp5?=
 =?utf-8?B?d1QrR0xxR21JbkdaRDNTeHRGeFI5OEhPNUhoOXpXZ3d0amRvR3VVa0tXcjB0?=
 =?utf-8?B?MFhsWkJEeTNMZTJHNHVjN3h2c1UybXhaVGZ4NTQvdDJjYk5LRW1lTWVScWNU?=
 =?utf-8?B?N0x2amw4Sk1DcEgyVDVYWFJNb3FZSFp2UW9ZRUtmdTdaU0VEN3dKNEc2RXNT?=
 =?utf-8?B?eE5pT3B1VVQ1VjM5SW1UMXpmWVkxVm1ZRmRmbkFZRDBmOXEvdXduRkt3bUF2?=
 =?utf-8?B?SGk4cE9Obk5xbDBBMWxHMExIQktZWWlvZnBDVlk1aGVSZ0dTN1ZLTW5wQXd5?=
 =?utf-8?B?Q3JPWENmbnZTeDRNYWxZV1lsc2Vmc2ZDZXpCZ3NRYmRhTWlVdEVzTU5xWEkz?=
 =?utf-8?B?eG0ybG9HWGxXWUlOY29FUngyQU85MXVIZXBwUXFXb1E0M1Z2ck4venVEL2tt?=
 =?utf-8?B?bUxRV1ZvWmFVUUFkT0gzSllkWFZCelJxUzcvR1V4ekwraTRqMzJqQVI0azA5?=
 =?utf-8?B?aVRWR29STDlxZnFra01tbW4wSXV3aG1INlV6bklQQmQ3L1N5R1VIeEtVaXNn?=
 =?utf-8?Q?xbaZad0zH3Cbl6VDcq8V3ZAdm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76aa4f3d-a9ce-4506-31c5-08ddf4557fa6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 12:43:41.0102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8ZJw9W539h5j6bfUG8cSjT0Zdh0CmsjKj7wQZGk+WUQRLD7rM0fy+sGz5NK8lRR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9080
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

On 15.09.25 14:36, Natalie Vock wrote:
> When the cgroup's memory usage is below the low/min limit and allocation
> fails, try evicting some unprotected buffers to make space. Otherwise,
> application buffers may be forced to go into GTT even though usage is
> below the corresponding low/min limit, if other applications filled VRAM
> with their allocations first.
> 
> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c       | 57 ++++++++++++++++++++++++++++++--------
>  drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++++++++++++---------
>  include/drm/ttm/ttm_resource.h     |  6 +++-
>  3 files changed, 86 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f4d9e68b21e70cb25d0db5e79391233e1dc72221..d20ff41411c08cd97b4467f603751f483d1c7ff4 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -504,6 +504,8 @@ struct ttm_bo_evict_walk {
>  	/** @evicted: Number of successful evictions. */
>  	unsigned long evicted;
>  
> +	/** @charge_pool: The memory pool the resource is charged to */
> +	struct dmem_cgroup_pool_state *charge_pool;
>  	/** @limit_pool: Which pool limit we should test against */
>  	struct dmem_cgroup_pool_state *limit_pool;
>  	/** @try_low: Whether we should attempt to evict BO's with low watermark threshold */
> @@ -539,7 +541,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *
>  	evict_walk->evicted++;
>  	if (evict_walk->res)
>  		lret = ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
> -					  evict_walk->res, NULL);
> +					  evict_walk->res, evict_walk->charge_pool);
>  	if (lret == 0)
>  		return 1;
>  out:
> @@ -561,6 +563,8 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
>  			      struct ttm_operation_ctx *ctx,
>  			      struct ww_acquire_ctx *ticket,
>  			      struct ttm_resource **res,
> +			      bool only_evict_unprotected,
> +			      struct dmem_cgroup_pool_state *charge_pool,
>  			      struct dmem_cgroup_pool_state *limit_pool)
>  {
>  	struct ttm_bo_evict_walk evict_walk = {
> @@ -574,6 +578,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
>  		.place = place,
>  		.evictor = evictor,
>  		.res = res,
> +		.charge_pool = charge_pool,
>  		.limit_pool = limit_pool,
>  	};
>  	s64 lret;
> @@ -582,7 +587,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
>  	lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
>  
>  	/* One more attempt if we hit low limit? */
> -	if (!lret && evict_walk.hit_low) {
> +	if (!lret && evict_walk.hit_low && !only_evict_unprotected) {
>  		evict_walk.try_low = true;
>  		lret = ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
>  	}
> @@ -603,7 +608,8 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
>  	} while (!lret && evict_walk.evicted);
>  
>  	/* We hit the low limit? Try once more */
> -	if (!lret && evict_walk.hit_low && !evict_walk.try_low) {
> +	if (!lret && evict_walk.hit_low && !evict_walk.try_low &&
> +			!only_evict_unprotected) {
>  		evict_walk.try_low = true;
>  		goto retry;
>  	}
> @@ -724,9 +730,9 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  
>  	for (i = 0; i < placement->num_placement; ++i) {
>  		const struct ttm_place *place = &placement->placement[i];
> -		struct dmem_cgroup_pool_state *limit_pool = NULL;
> +		struct dmem_cgroup_pool_state *limit_pool = NULL, *charge_pool = NULL;
>  		struct ttm_resource_manager *man;
> -		bool may_evict;
> +		bool may_evict, is_protected = false;
>  
>  		man = ttm_manager_type(bdev, place->mem_type);
>  		if (!man || !ttm_resource_manager_used(man))
> @@ -737,24 +743,53 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  			continue;
>  
>  		may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
> -		ret = ttm_resource_alloc(bo, place, res, force_space ? &limit_pool : NULL);
> +		ret = ttm_resource_try_charge(bo, place, &charge_pool,
> +					      force_space ? &limit_pool : NULL);
> +		if (ret) {
> +			if (ret != -EAGAIN) {
> +				dmem_cgroup_pool_state_put(limit_pool);
> +				return ret;
> +			} else if (!may_evict) {
> +				dmem_cgroup_pool_state_put(limit_pool);
> +				continue;
> +			}
> +		} else {
> +			is_protected = dmem_cgroup_below_min(NULL, charge_pool) ||
> +				       dmem_cgroup_below_low(NULL, charge_pool);
> +			ret = ttm_resource_alloc(bo, place, res, charge_pool);
> +		}
> +
>  		if (ret) {
>  			if (ret != -ENOSPC && ret != -EAGAIN) {
>  				dmem_cgroup_pool_state_put(limit_pool);
> +				if (charge_pool) {
> +					dmem_cgroup_uncharge(charge_pool, bo->base.size);
> +					dmem_cgroup_pool_state_put(charge_pool);
> +				}
>  				return ret;
>  			}
> -			if (!may_evict) {
> +			if (!may_evict && !is_protected) {
>  				dmem_cgroup_pool_state_put(limit_pool);
> +				if (charge_pool) {
> +					dmem_cgroup_uncharge(charge_pool, bo->base.size);
> +					dmem_cgroup_pool_state_put(charge_pool);
> +				}
>  				continue;
>  			}
>  
>  			ret = ttm_bo_evict_alloc(bdev, man, place, bo, ctx,
> -						 ticket, res, limit_pool);
> +						 ticket, res, !may_evict && is_protected,
> +						 charge_pool, limit_pool);
>  			dmem_cgroup_pool_state_put(limit_pool);
> -			if (ret == -EBUSY)
> -				continue;
> -			if (ret)
> +			if (ret) {
> +				if (charge_pool) {
> +					dmem_cgroup_uncharge(charge_pool, bo->base.size);
> +					dmem_cgroup_pool_state_put(charge_pool);
> +				}
> +				if (ret == -EBUSY)
> +					continue;
>  				return ret;
> +			}

Pushing that logic into ttm_bo_alloc_resource() is pretty much a no go to start with.

Thomas and I have just removed all that stuff quite recently and moved forcing the higher level placement logic into ttm_bo_mem_space.

You should probably start there instead.

Regards,
Christian.

>  		}
>  
>  		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index e2c82ad07eb44b5e88bf5b5db1ef54dd6d27823b..fcfa8b51b033745f46a01e40a9dc83e0c69165fc 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -372,30 +372,52 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
>  }
>  EXPORT_SYMBOL(ttm_resource_fini);
>  
> +/**
> + * ttm_resource_try_charge - charge a resource manager's cgroup pool
> + * @bo: buffer for which an allocation should be charged
> + * @place: where the allocation is attempted to be placed
> + * @ret_pool: on charge success, the pool that was charged
> + * @ret_limit_pool: on charge failure, the pool responsible for the failure
> + *
> + * Should be used to charge cgroups before attempting resource allocation.
> + * When charging succeeds, the value of ret_pool should be passed to
> + * ttm_resource_alloc.
> + *
> + * Returns: 0 on charge success, negative errno on failure.
> + */
> +int ttm_resource_try_charge(struct ttm_buffer_object *bo,
> +			    const struct ttm_place *place,
> +			    struct dmem_cgroup_pool_state **ret_pool,
> +			    struct dmem_cgroup_pool_state **ret_limit_pool)
> +{
> +	struct ttm_resource_manager *man =
> +		ttm_manager_type(bo->bdev, place->mem_type);
> +
> +	if (!man->cg) {
> +		*ret_pool = NULL;
> +		if (ret_limit_pool)
> +			*ret_limit_pool = NULL;
> +		return 0;
> +	}
> +
> +	return dmem_cgroup_try_charge(man->cg, bo->base.size, ret_pool,
> +				      ret_limit_pool);
> +}
> +
>  int ttm_resource_alloc(struct ttm_buffer_object *bo,
>  		       const struct ttm_place *place,
>  		       struct ttm_resource **res_ptr,
> -		       struct dmem_cgroup_pool_state **ret_limit_pool)
> +		       struct dmem_cgroup_pool_state *charge_pool)
>  {
>  	struct ttm_resource_manager *man =
>  		ttm_manager_type(bo->bdev, place->mem_type);
> -	struct dmem_cgroup_pool_state *pool = NULL;
>  	int ret;
>  
> -	if (man->cg) {
> -		ret = dmem_cgroup_try_charge(man->cg, bo->base.size, &pool, ret_limit_pool);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	ret = man->func->alloc(man, bo, place, res_ptr);
> -	if (ret) {
> -		if (pool)
> -			dmem_cgroup_uncharge(pool, bo->base.size);
> +	if (ret)
>  		return ret;
> -	}
>  
> -	(*res_ptr)->css = pool;
> +	(*res_ptr)->css = charge_pool;
>  
>  	spin_lock(&bo->bdev->lru_lock);
>  	ttm_resource_add_bulk_move(*res_ptr, bo);
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index e52bba15012f78e352f392232ac2e89a83afd311..3aef7efdd7cfb8fd93071db85e632b975b53cf81 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -442,10 +442,14 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>  void ttm_resource_fini(struct ttm_resource_manager *man,
>  		       struct ttm_resource *res);
>  
> +int ttm_resource_try_charge(struct ttm_buffer_object *bo,
> +			    const struct ttm_place *place,
> +			    struct dmem_cgroup_pool_state **ret_pool,
> +			    struct dmem_cgroup_pool_state **ret_limit_pool);
>  int ttm_resource_alloc(struct ttm_buffer_object *bo,
>  		       const struct ttm_place *place,
>  		       struct ttm_resource **res,
> -		       struct dmem_cgroup_pool_state **ret_limit_pool);
> +		       struct dmem_cgroup_pool_state *charge_pool);
>  void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
>  bool ttm_resource_intersects(struct ttm_device *bdev,
>  			     struct ttm_resource *res,
> 

