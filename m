Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99307B07435
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 13:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CF110E7A6;
	Wed, 16 Jul 2025 11:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HG6GyQya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6818110E7A8;
 Wed, 16 Jul 2025 11:01:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAhUQGVnln/ss2dSjTiQ444T0Lm7sUg2NS6ErT0m+VQ5U66bYemBDeWorBpAOt2Q9nvSK+eyIocm9fC+Buc3u7PLDrqoGGkgPnOeNJCnFLqu3EyO1wez0oPxFEiMZ7iz26Obg8KT9L8TenxmB9DnkN/hqpyUmio8WB75DJgM2/VHpleHR6OUD+eud6Tt50CO76RSQDZ8EH7ACqBvK/4/2kyuRfHDT4EN1U2FfnD/f6ogbicz3wf81jTRQsuuQOfLlA6JTE5Ez2GvnpVLo2WQY2rrOd7Y8n0KRRdiOAFrOxmx80NIT3vxjE/1aEgDyZFC+ip5NaY+1LJKsn+kXpTnZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ekf61AyPOywSC/RzCloMiQNeRcQYEZJS8xPR2Vx27Q=;
 b=LkSim4JrP9Gj9vUeBVgh7q9wQLxkOWmjgGy45GDlwTDVZ5IG51/+8nBqGsp7GuuhILBtO7i+k+x7GCCir/IJuAaQWn3VT9aGpTXy/QMksc15+lvYpic92ypb80bUi3+mElQZUAsbYIMTwVUWr0zWEdymNIvjCoRSiAJDvJycEXoC3erlneiirL8kr+5fGWqUDgtrtmbtpPJGPqMXSvOvPofvpdCgYn5vhYBkRCUoLhpx9amc7TxrCnLd1HHYqigHRLoK+tFjslCnMxYqTiaRIUYNSdRtnK2p7KHNeSHt53rKaVatf4mTbMUdIB6BXrLo61jlUyfzsBN/bj3qMJDpmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ekf61AyPOywSC/RzCloMiQNeRcQYEZJS8xPR2Vx27Q=;
 b=HG6GyQyaSroItiyapQyocLYUGCJ1Tpt/5+ekcBxcelXCqqTu6FwHLT0Nf+oOCosxD4HFqhskj6rDC/Dtij0VkcdJmtreM5j9IjiyH0d4uz5D6MJ0WipkT+N41I7spDw1Ayvq/ecUFe2H7YB1appQ29KXYhD+hjeC9F3P45NHqu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9313.namprd12.prod.outlook.com (2603:10b6:610:1ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Wed, 16 Jul
 2025 11:01:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Wed, 16 Jul 2025
 11:01:44 +0000
Message-ID: <1d5875f8-987a-4524-966f-cbb4ef72fd2a@amd.com>
Date: Wed, 16 Jul 2025 13:01:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/amdgpu: Reset the clear flag in buddy during
 resume
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, matthew.brost@intel.com, airlied@gmail.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250716075125.240637-1-Arunpravin.PaneerSelvam@amd.com>
 <20250716075125.240637-2-Arunpravin.PaneerSelvam@amd.com>
 <05a2b3f0-2166-47cd-9964-53254e4df6ba@amd.com>
 <9e9be088-fca0-4f31-bfa9-5201f46e1d12@amd.com>
Content-Language: en-US
In-Reply-To: <9e9be088-fca0-4f31-bfa9-5201f46e1d12@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0314.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eddf60e-d01d-4b47-fc1d-08ddc4582686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlRSaWNTTmkvNlJIc1Rsb3NJZzA3UVhHclF3ekQvdXRrZWs1bHhGZTR0Smtx?=
 =?utf-8?B?b1V2Ym9zeUh5SUlMdkFBbkRjekVwOTNseFlHdmljZG4yWW5yQWgybkZOYkZs?=
 =?utf-8?B?Ly9GTFFYQkNmT1lSRDRuWjI0RGVqUUlQL2I2QU9EUTV2U3NYaTgwbkJRZXJp?=
 =?utf-8?B?WWN1bW9TK0lwOGNkT1RkbWFQMXNMKysvblF3eXY1VSs4a3IyME1CSGc0aytF?=
 =?utf-8?B?czMyQ2ZjVkc4UWJQZVFWYVBTWWN2cDZCcjFTblNoeFZJblo5eGNxRnF5bWdr?=
 =?utf-8?B?WGZzaXJ5ZWpOendKd1JKNHN1cHRwb3dvaERzU2g0anE4K2QvTktQaVUyY213?=
 =?utf-8?B?MVlPalkvNkZYdnVmRHlvcUNMMFNLOGVINWUrR0F1aDNicW15YUtEVXBlcitS?=
 =?utf-8?B?OWlaL0ZzR3Q0TVJqY1E0YitCY1cwQ0psVy9tVnFnREh0RDkyQ3R5eTM1REw4?=
 =?utf-8?B?U0JZd3lHV1NDV2t1THZoKzhEV0xRQldudnNNbkRzOHNxQUROUEx6cXc1MjRK?=
 =?utf-8?B?emYwOWRFa1ZpS1F3WHRiQWlUQ2g0THRCOU1NSFJGSWFkTTRmbTIwZ2MwKzBE?=
 =?utf-8?B?YTZOK0pOSEpUQUpnL3NnUEcyTjh4SVZSSlhYYmV4SnE4dFpHSGVxcUs2RXVs?=
 =?utf-8?B?RHM0YU9qSDMyQnZxVy9vTGpjMjZtWVEwSjJ0NmJBYnNXcjZ5Z3AvMEVKZUI5?=
 =?utf-8?B?MFp5OTB2clNQWE5GemNzbWIza0FaWnFuMWMzUEh5TFBlY3Ayczhtek9aY2R6?=
 =?utf-8?B?QjVRM3B2cktJeHh2cEtUY1E4NlZlcnF4dWN4VnN6V0FFM0hKd0pYUStDN1RI?=
 =?utf-8?B?SVYrV0RDazNTM25acERvVGlBWm14VmUwNEJlZGVJaVFIak8rS0dFZzNpVE9D?=
 =?utf-8?B?WEkxZXliV0JmdFJwWkdqREgyRFg0MWo3L21kWkpiUTc5dW9nWm5obFVMRkRI?=
 =?utf-8?B?WFBYSTRFb0p3QmVML3dkeVZHZ0ZtNVo5MlRmT29EdGpzUmV6R2J4VVBpR0t5?=
 =?utf-8?B?STVYVlBjUzVEanVmQTl5NE56VnNZQVNiUEdpOTBHeEEzTDlPVFV6VTZUSVBh?=
 =?utf-8?B?TUhZWHpuMTNyWk5FbmlCVkgvL2pwS1RwL1Z3NnpvWHM0c21maytjWkRIY29M?=
 =?utf-8?B?amJvYXFGQjg0QXBTSm40ekJGOXFTZTNyeW1LK2I3TmYra01KQWJ0cFpXSDhM?=
 =?utf-8?B?K2gzRTZZNEdwZ0pZWUErcmFtMkdqM0JjQlhqTUdrb243RDlBYmJUZDZrVDZw?=
 =?utf-8?B?ejVLSlR2NG5jZG1XWjNKc0ZiZFhYVWF4OVlxTTMvdzJjdlVKR0xCZi8za2Vy?=
 =?utf-8?B?RHYxREdjMEJhelZadmN0aDQ5NWdLNkgrMVpLZUFUbWhiK1Rhc3NYUTJibHJJ?=
 =?utf-8?B?K1Mwc0YwSUptUmF4ZVcrYVdWUzRWQnVOaDh3czFjMHBpSmRQYTA5M09NdlpY?=
 =?utf-8?B?S3NXVGFkbEQ2NU1zOGRqY2p4d1dxc1VUWC9VSzVBK1VsdldCbU01ZUNuU2Qw?=
 =?utf-8?B?ZTA1b2VZOEJOYXg4RlN1NFNvdW16dDBIZHNmSkdiSVV1ZEdjNGdZbzlhRnM3?=
 =?utf-8?B?T0tJYVRlQklqSEpIbkNxeWladityK1RkR0Z1QUlpdmhVWXc1WEdEa1Iwc2hL?=
 =?utf-8?B?bDA2SjZsUVFuZzYzWlFpZFhqY0crSlhuaStmMlhuSVExczg5eGJab2JhUmdr?=
 =?utf-8?B?VEc4QTFxcG02V0dESVA5RWJGTG5QcWE0Q0dGK1p2bkU3RGs1Z3lkRDdEODZB?=
 =?utf-8?B?Ujh0TWF0c2hPc3NZdTNOZEhrRUR5UDE4eldzdXhPeVZtVTZKVjBST2llbVM2?=
 =?utf-8?Q?046n1WJv64OyamhksHzVKDHvTtBikWX1XYVGw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW9PNDZxaXdUVHV4UzU3MTZ0K0Zpck1oYUFJNnFsbGMrRldiUjQ0S3RLZ1o2?=
 =?utf-8?B?Q3c5cnYxdGcyK1pYeTV6WGxRTVFPcmpxR3Q2ZW1nVjRFamlRRnhPZUlwNVV6?=
 =?utf-8?B?MVphVDNNVXU0WUVCelF4WnNCcmdOeGhxNzgyV01IS2RaZjYvSVdIclBHQmlH?=
 =?utf-8?B?S1F5UDdjL3UrR2xocXpBeDBZR1ZGTGhra1VScnNwMDN5WlZIOVd1ZEo4aEFr?=
 =?utf-8?B?dTVJZEZaWEMrVmswMjVLL3UvLzlOTzlRVi9YTEhnblRtMnNjZ2xEVG03MmFj?=
 =?utf-8?B?WjZlUEZsc0lUNUF1Nzc1K2I0TkRRYUZCTGlLYkRFZzdoRURrR3VoUkYvb0FH?=
 =?utf-8?B?QmhsdE00YjRtOGhXMEFERlRrU1FGVllyRWhRSTU2NW9UaE01VU1JN0F5TFht?=
 =?utf-8?B?TXRISUZtcjBYZWQ0djQxcmo1TGVlSDA0RjBURTNEQkUzZUppTWFWUW5LRkY4?=
 =?utf-8?B?RXQ3bnFpbFRGVU5VMVhVaWRqOVdkNnFiVXAybllVYkVYUTFqT2ZWVmhFVW4z?=
 =?utf-8?B?OW9LejRJRjZFY2pBeDhuWThySFMyVG5Iem9NZWJ6Zm9SQnoyWnFaa05WNWVO?=
 =?utf-8?B?UnYwQ3VHUm9VNWF3dkNyUjkxSXNacEppOUFkNnIwOVZaNGdvOS9LOUR3RGgv?=
 =?utf-8?B?cmJONGoyME1hMlRodHB5N0QySDdnRkpFNzRJT3RCWFBHNzBJTWhRQ2ErSmVR?=
 =?utf-8?B?OFg0SUxtMk03Z1AzNklxT1ZWQnZNaHpMd2Zlc0RJek1PS3VYOUhVRndlRlpx?=
 =?utf-8?B?UldHaC9VNkE5di9seHRlSXZmN01jTnQ0S05wckR5WStvM3JPQ3lzRy9PcWJh?=
 =?utf-8?B?SXhqb3FtUmFFeEs1cmYxRVczQXNzdHV3d1hsVmFsbHVkcVJrM0FnQlJBRmJN?=
 =?utf-8?B?ZXpnaHBGV2luQ0UwRmg5dXh0V0MvdHV4dVgvMDNneHp2ZFRzWXJ1SVh5Qjgy?=
 =?utf-8?B?YWhmLytLOEQvcDEzc1hGeWJDWFVhRXorOExCOW83OUlQYk9aYzl2S3VsTzhQ?=
 =?utf-8?B?eWZkZ3dmNTBGdHZTbzlyZmR6QkJDWFRsdnRtOVBQS3RWMU9DcW5hSXJTNDIv?=
 =?utf-8?B?ZmJhVHFGZVZma0J2RlNZTExTYUcxQVcyTXNxQUIwV1NWSHZBdlZjZUJBRWQ2?=
 =?utf-8?B?dWFaN1FIT00xcC9jLzc2U1MzNDVJdFl4a24rVUhjaGxlVm1DMnZSMUVUdS9k?=
 =?utf-8?B?Snd5RjB1dExsb3VYTTE1ZVhTcVg3bWE4YktBL2ZaVkE2K29hdTVsVXEySWRD?=
 =?utf-8?B?aFlJTHhXZVhKQjR2QmNWMTgvZG9pVU5JS3B1ZFd0cjJKYnVwNitNTG41bDUy?=
 =?utf-8?B?eTNOdDMyamkvbDlKUXg5WmdKTTBmOHVnWDRHVnNtZmRiUmJUazdxOWxQOGZU?=
 =?utf-8?B?RXpWWnpWeEpRU2plZ0dMT0p5UW5FNFFrRThVMEl1dUNCOHRTQWkzckl3MHdZ?=
 =?utf-8?B?MkV5VUEwTjdFUWxzZXR4MEJiN3FlUWpCekM5ak8xSjdYZ29uTFlFZ2p1MHY0?=
 =?utf-8?B?K21JVDhQQ3IzWG0wVElZWDB6cjdwUVpuZ01jeVB0OE93bzdzdHliY0Judnov?=
 =?utf-8?B?TUdIdUo5ZzJCSXk1aEJFeFgvYXF6WUEzL3pHcVJvRGtzN2o2V21zdnRuNWl3?=
 =?utf-8?B?TDQ2TS9Wd0VEMjh3cFhiWFVJQnJNSDI0bUlvYXo5MHpXRHU4TnFIaW5BalRp?=
 =?utf-8?B?aER5WE5JclU3QnNFYmNCcEZlZE9rUEp0VTZVeS90R2pHNm45V0xCSC9NQUpv?=
 =?utf-8?B?Y0JHSXphYldlZm56YTM5ekNhc2xHV251WitxTzE4d3dCUlF0TXpMMXZHdDJJ?=
 =?utf-8?B?TkM5SWhPM2gvYkN1bWdpeGVaTkRyVm9WWW1pdkJLSnpmZVpqS2h4bnN4QjIr?=
 =?utf-8?B?RjlSaTlrcysyUmRPQWE4b2xzRXNubTdaTnpZK1VwL3hnR1k1Tk13dFprV0FT?=
 =?utf-8?B?M09yUXEwb1hlSWs2T2QyV1hMblE2T3NTWjFvSmVrUkNmZ25CMGFqRTdpcmdy?=
 =?utf-8?B?eG5xdjF3alI4SnZSV0lzTDNaZmdYWUs0a0k5cUhqUVJrQ0RBclRYWlZJZkdW?=
 =?utf-8?B?cVUrQ2lPYVN1Z3d3OGtkYzE5R3lJQzhHZkRpRmo0R01aNnlOUWl5NE9CQVZ1?=
 =?utf-8?Q?9cZWWhoxaOMX3dizxdXli/jYi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eddf60e-d01d-4b47-fc1d-08ddc4582686
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 11:01:44.0344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CzNb442qBIGTwP/0uaP3CbbnVefHWcfb+s5+V5LcCXy6GvPJSNrUoMggxWMMPRy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9313
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

On 16.07.25 12:47, Christian König wrote:
> On 16.07.25 12:28, Arunpravin Paneer Selvam wrote:
>> Hi Dave,
>>
>> I am trying to push this series into drm-misc-fixes, but I get the below error when dim push-branch drm-misc-fixes.
>>
>> dim:ERROR:e24c180b4300("drm/amdgpu:Reset the clear flag in buddy during resume"): Mandatory Maintainer Acked-by missing., aborting
>>
>> Looks like maintainers Acked-by is required to push the patches into drm-misc-fixes ?
> 
> Strange, it should work with my Acked-by. Let me give it a try.

I successfully pushed the patch to drm-misc-fixes.

No idea why that didn't worked for you. Maybe update your dim script Arun.

Regards,
Christian.

> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Arun.
>>
>> On 7/16/2025 1:21 PM, Arunpravin Paneer Selvam wrote:
>>> - Added a handler in DRM buddy manager to reset the cleared
>>>    flag for the blocks in the freelist.
>>>
>>> - This is necessary because, upon resuming, the VRAM becomes
>>>    cluttered with BIOS data, yet the VRAM backend manager
>>>    believes that everything has been cleared.
>>>
>>> v2:
>>>    - Add lock before accessing drm_buddy_clear_reset_blocks()(Matthew Auld)
>>>    - Force merge the two dirty blocks.(Matthew Auld)
>>>    - Add a new unit test case for this issue.(Matthew Auld)
>>>    - Having this function being able to flip the state either way would be
>>>      good. (Matthew Brost)
>>>
>>> v3(Matthew Auld):
>>>    - Do merge step first to avoid the use of extra reset flag.
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Acked-by: Christian König <christian.koenig@amd.com>
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: stable@vger.kernel.org
>>> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++
>>>   drivers/gpu/drm/drm_buddy.c                  | 43 ++++++++++++++++++++
>>>   include/drm/drm_buddy.h                      |  2 +
>>>   5 files changed, 65 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 723ab95d8c48..ac92220f9fc3 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -5327,6 +5327,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>>>           dev->dev->power.disable_depth--;
>>>   #endif
>>>       }
>>> +
>>> +    amdgpu_vram_mgr_clear_reset_blocks(adev);
>>>       adev->in_suspend = false;
>>>         if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> index 215c198e4aff..2309df3f68a9 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> @@ -155,6 +155,7 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>>>                     uint64_t start, uint64_t size);
>>>   int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>>>                         uint64_t start);
>>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev);
>>>     bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>>>                   struct ttm_resource *res);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> index abdc52b0895a..07c936e90d8e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> @@ -782,6 +782,23 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
>>>       return atomic64_read(&mgr->vis_usage);
>>>   }
>>>   +/**
>>> + * amdgpu_vram_mgr_clear_reset_blocks - reset clear blocks
>>> + *
>>> + * @adev: amdgpu device pointer
>>> + *
>>> + * Reset the cleared drm buddy blocks.
>>> + */
>>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev)
>>> +{
>>> +    struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>>> +    struct drm_buddy *mm = &mgr->mm;
>>> +
>>> +    mutex_lock(&mgr->lock);
>>> +    drm_buddy_reset_clear(mm, false);
>>> +    mutex_unlock(&mgr->lock);
>>> +}
>>> +
>>>   /**
>>>    * amdgpu_vram_mgr_intersects - test each drm buddy block for intersection
>>>    *
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index a1e652b7631d..a94061f373de 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -405,6 +405,49 @@ drm_get_buddy(struct drm_buddy_block *block)
>>>   }
>>>   EXPORT_SYMBOL(drm_get_buddy);
>>>   +/**
>>> + * drm_buddy_reset_clear - reset blocks clear state
>>> + *
>>> + * @mm: DRM buddy manager
>>> + * @is_clear: blocks clear state
>>> + *
>>> + * Reset the clear state based on @is_clear value for each block
>>> + * in the freelist.
>>> + */
>>> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>>> +{
>>> +    u64 root_size, size, start;
>>> +    unsigned int order;
>>> +    int i;
>>> +
>>> +    size = mm->size;
>>> +    for (i = 0; i < mm->n_roots; ++i) {
>>> +        order = ilog2(size) - ilog2(mm->chunk_size);
>>> +        start = drm_buddy_block_offset(mm->roots[i]);
>>> +        __force_merge(mm, start, start + size, order);
>>> +
>>> +        root_size = mm->chunk_size << order;
>>> +        size -= root_size;
>>> +    }
>>> +
>>> +    for (i = 0; i <= mm->max_order; ++i) {
>>> +        struct drm_buddy_block *block;
>>> +
>>> +        list_for_each_entry_reverse(block, &mm->free_list[i], link) {
>>> +            if (is_clear != drm_buddy_block_is_clear(block)) {
>>> +                if (is_clear) {
>>> +                    mark_cleared(block);
>>> +                    mm->clear_avail += drm_buddy_block_size(mm, block);
>>> +                } else {
>>> +                    clear_reset(block);
>>> +                    mm->clear_avail -= drm_buddy_block_size(mm, block);
>>> +                }
>>> +            }
>>> +        }
>>> +    }
>>> +}
>>> +EXPORT_SYMBOL(drm_buddy_reset_clear);
>>> +
>>>   /**
>>>    * drm_buddy_free_block - free a block
>>>    *
>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>> index 9689a7c5dd36..513837632b7d 100644
>>> --- a/include/drm/drm_buddy.h
>>> +++ b/include/drm/drm_buddy.h
>>> @@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>                u64 new_size,
>>>                struct list_head *blocks);
>>>   +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear);
>>> +
>>>   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>>>     void drm_buddy_free_list(struct drm_buddy *mm,
> 

