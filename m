Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49785CBEB20
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 16:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F15110E537;
	Mon, 15 Dec 2025 15:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Phz5eCU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010004.outbound.protection.outlook.com [52.101.61.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD6410E466
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 15:38:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5+v71DvQWO8Y0ilxBHqXCzITqgo7f+Zy3DbTC8hAWMmWBO42yrv8kXvMHiu1Hs/07eIRxQ27fv9Ni8c1Uc51YGqNtUbErxjYYk9pJZB1LrOmiE1QdnabfeZVepw3NX1swgsNFVDhFFyhhQz9dsv4NUedBlW2mLqSWY2vbr25XZjmP/cZBrA8J5mkrtkTaxElm4u6Gmy99p4BuaLn/Eh66G/Bfkf+ThQJ1hxPFcHA5ul5h1SOni5yNrBh1mBZqWVxVNQDJtIfPdw7b0D1wrpRj5XsA8qkuM/q7eUXIPPu76DKbEzzZP+6pMzjgFXEEKs9sMnB6Wkiqz6ow89DPzEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7j9LgfSlqtJ/iXLJ9AZP4DUtSjkry9z69Fo5T2MfvMk=;
 b=pPzYjVmDC+ngwzNJTSPPi8jGQtjFi5Ns3b8b5l9WRd8bxDvbEAReG29Z17Jynj+mT/1JloAru88O0y82iSaZj3VqetIa76faR24IF2t0VyI5FCZgzM4yOkGGhYcbCYqgNhWdEZ/5i4Vq8AUireqppgjxjaPA0fTPb5QUUgfsFu40+b5gsgoYBYiLex6Efq8EFMfyC1b4v96xS/EbCMZZoLTdsWu2CuK5/3WcLM+6qe8PpEOJgS85Um0t2ax742EYhf+WYfr8NQqfjG0zB9Rr0Qd+R86HfzbE5qF+Ya/RF3XGgZtgU28gBigWNWaE2KgoYdmHLdafnYQKvicnUeCtfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7j9LgfSlqtJ/iXLJ9AZP4DUtSjkry9z69Fo5T2MfvMk=;
 b=Phz5eCU5M5HlAbjpbp+JM373aFOmD7V13YdddcQGYkapeX9qo3pxi4wNDtFyGzxNT3aJoQ6uACD5G5c5Kvyd8sMY6qobJyV2PFZZXpuYuRYKs2PYhemuASs/53tHmA6OcFjpdB81WKP/scFapZUyCTzcB5tGkddhwCWUMrPEYOY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL1PR12MB5827.namprd12.prod.outlook.com (2603:10b6:208:396::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:38:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 15:38:49 +0000
Message-ID: <6e2e258a-0c20-4229-8301-5a217f29eea6@amd.com>
Date: Mon, 15 Dec 2025 16:38:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] drm/sched: use inline locks for the drm-sched-fence
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-10-christian.koenig@amd.com>
 <9ef8686f-820f-41e9-985e-40411b4b9bd3@ursulin.net>
 <587fb06e-cfac-4603-b074-a9b382ecea31@amd.com>
 <e19284e2-ff38-415d-a44d-0ab610032d24@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e19284e2-ff38-415d-a44d-0ab610032d24@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::26) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL1PR12MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cda7e88-9811-4638-e131-08de3bf00acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aktaTkVsbDd4UzE2NGdRMFlNTTJ2NDZkTUlwdStSTnFlLzRuNzdaWXJZUDJ4?=
 =?utf-8?B?R2dFWlZrNWhRODMydml1TnJwbWp0VStBR1lkMm82ZFRzcUlwbXBkVWdMM3R0?=
 =?utf-8?B?S2l2OWc0M3B3M1VPVFJVcklBdU84Q3ZyTnJpSjYzcnJuMEtrQldSa3RIZk1j?=
 =?utf-8?B?OXZlSHhIL3JYWG05NjQ0Skd2bzN6ZzdMWkpCOVNqL2JpYTVJTWp6SnhWcHVy?=
 =?utf-8?B?NUhxdG5MU1FNc2s2dGRRWmxzWWJUN214N25oUFVOTDdwdUtjaSt3OFNtZExn?=
 =?utf-8?B?SEQ0SWcwcndDVWkrU2YyZ2NPbGNjbXhkbTUxcTNadXQyMEM2b2FueVNJemZs?=
 =?utf-8?B?ajJDVWFHMnFQbjJiTGpZdGFxMDBGd1R2RkR0OUtUdnBLd2JyNS9uM3RGQldH?=
 =?utf-8?B?MWZBR1B6Nm85STVqVkVnSlM1SjMrRFV0VHNtbjJwTHVrMGtiQ3lZdWl1OG5t?=
 =?utf-8?B?Vk1lb1E3aHpDMUJNK2NRNlR2ekNCM29VZUxWTDBaMnpmWTFqYk9KNmEvZDJI?=
 =?utf-8?B?MjF5aVd5MGQ2U3FDamNzeUpjMmxGNXpNSHk3aGpPSzBxVllrQWFqU2F5OEYr?=
 =?utf-8?B?bHJZcUY0M05FOGJiV08vREQzRmtrbjZ3NEFLTFF0azRjQXArM1pScElDMlZr?=
 =?utf-8?B?MU1RUWRRL2tqb3VFS2R0WlB5OWxseGtBbUxmOVRxeXh0cThjMnBuRGlNSUJV?=
 =?utf-8?B?dU5SYk5TaUg1bnR1MWV3bFMzL2o3eElIdjk4TzNLSm1PMENaRGRhMUtyWStQ?=
 =?utf-8?B?b2RxU1VzZkIzQ1BFZnNobFJwOENibUxnUGFHVU5uWVdLclJnekdPekMxOVRC?=
 =?utf-8?B?eU5mZGg4T0dEY2pnUTh4THFmc3lhWUkwNVg4cXZPZHpIUTBGOFNjRnRIV0c5?=
 =?utf-8?B?S1JHWm9nREkzSTd3QkhTcktSTDhxT05mak4xQWJGMkFGQTllNTdCZkJsSmtI?=
 =?utf-8?B?VFY3U1hBeUdaN0JSNUhnMmhhTitNaWlJVWs3OVhWYzhtMHJrNGtocy9meTFG?=
 =?utf-8?B?Ny8xQWdHQk1YK1dnTGJJS2VaeWk2MXI5c21NUjNmUk43L1ZZRXFkd0U2YUFN?=
 =?utf-8?B?VGlRRXVtN0V5OXFWS2xnMWZPbmZLdmYyOVdqU3Y3d3N1Wm9zWUxTS0k1V2VX?=
 =?utf-8?B?UWI0UjF6MXlodktkSVNGT21QM0ZTbVJRdzFGdUJUVDBuWm9HYUJtZmhZUkda?=
 =?utf-8?B?VkJqbnpvaThyeDZ3RTRsMUdXRDRkVXI0ZWRmSm1udkNtRmZuVTFPblJ6N2hu?=
 =?utf-8?B?aUR4OWdyM3NnTTFxeGlVTUdSMU0zOTJheGpDbGFSTFhjVnRiK1FYNi95d2NG?=
 =?utf-8?B?eDd2ZU9xTFVzbktZaGZqZUFOUkZGQnU5dkJ3TVJFdVpOVWJnWEJ1NEt0V01w?=
 =?utf-8?B?NXJJSU5yQjRodGtGQW8ybFI3eDRJUzFMS3JsOWtGRzZIVktMV3dmRE5Eb3dm?=
 =?utf-8?B?ZDViTGFpcXJZTDdoRU5QU3kzbExDRncraStiQnlqVm1xSzcvSGlnYnI5OEFk?=
 =?utf-8?B?MXJ6RVFTa0VDZU5IWFlONFVNVkJRZEhtUm5yb25vdmVWVFpYQmlkTGo1TS8x?=
 =?utf-8?B?enRYdmQ4S1Y2aCtLNnFTa2tlZWRmVlI1Z2hZTTZqdVc1ZktwK0gwMzhpQWxD?=
 =?utf-8?B?RDU1WHdDeXRMdncvdE80TDJXVktCNjE0TExsSk5LenVaem5YaEp6RFpGY0tP?=
 =?utf-8?B?b2lBTExyTFh6MitiSk5QeGhIdXlRRmtLaE1aVkhTZGtQRU1PL2oyNnNwYktM?=
 =?utf-8?B?YnpKWWdOVjNybGlaZFByS1hnT0N6ZStSbU5CbmVlckdNbWpJZnVRa2JMK29h?=
 =?utf-8?B?bnNkQnhGdkdjcVNBcXpQMnJOTUxGVzMvenRYWFoyWm1KWHAzenErMWlHRGZO?=
 =?utf-8?B?c2lpSGNUT2c2a3JPVUErRGd1SkFQRnd0ZCt5TFBUQ3NVSjN1dHlOd0FSMGlV?=
 =?utf-8?Q?XOsv2dAu8Y2pGgWNvzNnBr9pN5XWrGg/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXZPbzNoekc1ckp2NzBMOW9FNWc1WW9HVnV5Y2xMR3huRDhmYjVZNGI3TnIz?=
 =?utf-8?B?Q3BweEQwVzRieXRwZzhucUxESkRXMEFaSHNRZ3RGcXJkNkdEVlpZeXdZR2tV?=
 =?utf-8?B?WGhpVDhUQXg3OTQrYU9UNFVCMTVGUVR2U3dxKzEyekNEczdjY1p4UXlDbkNR?=
 =?utf-8?B?cjFOZHdTbTV4THdXOHgwaDdud3ZvOFp4NnZzdVpxU3JPN2FoSStjRHp3ZUkv?=
 =?utf-8?B?NXRDQ0pJOUg2WjNMd3RVRFFNRzE4d3RlYnY4ZXBIYXRpSXF5THZIdmx1WG1G?=
 =?utf-8?B?dmhXcW9Oc1IrM1VrNmlnUHZ6RlZMbWhOZG8wM0xJVzJmMTdHOEMraEhpZ0tF?=
 =?utf-8?B?RkhkUEZvY1N0am1DMWE4NEZUZHY4S3UwVzBUVHIrUGs2UGRyS0RYRFVJMVpp?=
 =?utf-8?B?ZkluSmpRTzZ5aHVXSWJWZFQ4bmxyWmJja29waU42djhmanBYWHJkT0lsVk51?=
 =?utf-8?B?OTQ2aWV0S2RqNHNnN2dwME5qVVpPS2w4MUNTUkJmUEp1WjEwMWlWU1NRL0dp?=
 =?utf-8?B?VHRFVCt6MzVUTm5iUEtRTUd3azVEeFJIUnlTaWZtSm9jRkg5RXJhakl6L0Uw?=
 =?utf-8?B?ZCtrTDRhc1hDem5Tb3U0WWFqQ2hrZVY4dXo2S2JTQzB1RURFMXI2OUFKWFVt?=
 =?utf-8?B?ajZOZXNRWFFrYnBQNWpxemNsa2hSV2toSGJTOE5CYUx0a0xsMEl4SktrUjJP?=
 =?utf-8?B?TzhNWllhZkY4K1dVZFEvbXNZSFZVcFJ5UkM1ZDI2MHhVNWZOK2VITWZsU0RJ?=
 =?utf-8?B?YUh1Z1pjTUZuUng3d0RYaWIwZ1RwTmovR3czblNLYW1UdGMvNjdFNjVLL0p5?=
 =?utf-8?B?eDYxNmYyNlNvZXQybTdIVkZiQVp0MkJabENhWXo2VHFmSlVmMTRTZDhqcENG?=
 =?utf-8?B?L3NraURBQmMvQTI0YWJ5M1p5cXBDZTVSdE9VSFBXSnpEUUhuQTVjM0cwaGJi?=
 =?utf-8?B?cHg0RXpheXd6NWZ6bHRvMCtzTDl3bFZKVEpiSFhyQnVaTldzTG55Kzc4WHp4?=
 =?utf-8?B?RGlkQjBhbDg2UFBsalpFaEF1elRqdGJudHBoUUpHL3NwUmxzR0oxY1c0TnB4?=
 =?utf-8?B?NjdZcTFKU0prSlVDTVV1c09jcVphSkk2RktTeXljT0VXVEU1b004a1ZVSGpM?=
 =?utf-8?B?bmNkWkFpVnFhK1RwTDlYUlM0cmhzUFhkNXNldUlYaHh5MlJZdG14SDVYNER0?=
 =?utf-8?B?clY5ODNVZ05zdFU5WDF6SkN0SWRaSXNVdmZHaHdyUlg5VU15Y3o3QmV5V1dG?=
 =?utf-8?B?K0hvUmN5dTZpdEx4SmZocGtaK3F6WkZwelg2RzUwRXdVYlpRR1FGV3NhT3Jk?=
 =?utf-8?B?eXRmamd1RUY0NVBCcVl4NGFSRUJtTGowS1piUjJycHNyWDVYNThoUzdYQWo2?=
 =?utf-8?B?aVZFRkVvNmJBWk5OY2FyMnkvaGcwZ09WS1o4Q3RISzdhTGZ4RVVkR2x1Wkxk?=
 =?utf-8?B?OWRPMWV5WmFpMjFmWGZvaitEc1lOWE8xcHl0cVhmcWlPVTFGMFA3NGpmSU1E?=
 =?utf-8?B?cWVlc2JrVTZpa09iYm9JRy9lQlNmNzE0dlk3V3VjYkFvaFF4MzFseWxYbnRo?=
 =?utf-8?B?VWM2eFpDVURqNVpiSmpMTEJYNnZTdEJYUGd2ZkUycUtjQWE0MU5mU0w4ellG?=
 =?utf-8?B?dTI5SER3eUxhRzhuckVZWTBrUUZwOWJJZ3ZWdXJrMTQ1MXNKdmR2RmVmS1dQ?=
 =?utf-8?B?dEREWi9rTEJtd0xIbVR4MUpMTXZ5RWpvMVE0K20rb0lWeTcxb3R2REY5T0J2?=
 =?utf-8?B?YmZPenNDS0JKZmNOMUJBYnd5WUpXTUlOYTRCN01QalZ3MGZTb3Z6R3lzNy95?=
 =?utf-8?B?cXRyVnhXMGhMM3ZrRGlTdlp2QlFzR2dZRFNIVkRTS01HaE9sbVZnd1Z5SExt?=
 =?utf-8?B?aUVqZkNGdk1qckNwKzNBZ3J4OWQ0V0N5TG9NR1pJVVd4c2xBbTcxcTg4anF0?=
 =?utf-8?B?cjZkZkpoNTA2cXVVQnUwWmVIN25pNjdHQ2hNRTlhSG1zM2lRMzVWd3F5aHYr?=
 =?utf-8?B?SEM4MTV5VHZsUUxFUWJYOXZlYTR6cDNiV2piaVVsWWpmNlljNzloQ1E0dnRC?=
 =?utf-8?B?SHZvV2MrbSs0M1FJWWF2L0tPajc5Zlg5VmRxQmxLMVhuc0wraXhJaStiUDNB?=
 =?utf-8?Q?xmNen66oz7FF3icGv6SlpwvtX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cda7e88-9811-4638-e131-08de3bf00acb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:38:49.4319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrYGD7fRrlIxirsAmOxCaDrTjYiDkg0WX0gH/PNtuofJWLqSfPa23m9stuLocXLc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5827
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

On 12/15/25 10:20, Tvrtko Ursulin wrote:
> 
> On 12/12/2025 15:50, Christian König wrote:
>> On 12/11/25 16:13, Tvrtko Ursulin wrote:
>>>
>>> On 11/12/2025 13:16, Christian König wrote:
>>>> Using the inline lock is now the recommended way for dma_fence implementations.
>>>>
>>>> So use this approach for the scheduler fences as well just in case if
>>>> anybody uses this as blueprint for its own implementation.
>>>>
>>>> Also saves about 4 bytes for the external spinlock.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_fence.c | 7 +++----
>>>>    include/drm/gpu_scheduler.h             | 4 ----
>>>>    2 files changed, 3 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>>> index 08ccbde8b2f5..47471b9e43f9 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>> @@ -161,7 +161,7 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>>>        /* If we already have an earlier deadline, keep it: */
>>>>        if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>>>>            ktime_before(fence->deadline, deadline)) {
>>>> -        spin_unlock_irqrestore(&fence->lock, flags);
>>>> +        dma_fence_unlock_irqrestore(f, flags);
>>>
>>> Rebase error I guess. Pull into the locking helpers patch.
>>
>> No that is actually completely intentional here.
>>
>> Previously we had a separate lock which protected both the DMA-fences as well as the deadline state.
>>
>> Now we turn that upside down by dropping the separate lock and protecting the deadline state with the dma_fence lock instead.
> 
> I don't follow. The code is currently like this:
> 
> static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>                           ktime_t deadline)
> {
>     struct drm_sched_fence *fence = to_drm_sched_fence(f);
>     struct dma_fence *parent;
>     unsigned long flags;
> 
>     spin_lock_irqsave(&fence->lock, flags);
> 
>     /* If we already have an earlier deadline, keep it: */
>     if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>         ktime_before(fence->deadline, deadline)) {
>         spin_unlock_irqrestore(&fence->lock, flags);
>         return;
>     }
> 
>     fence->deadline = deadline;
>     set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
> 
>     spin_unlock_irqrestore(&fence->lock, flags);...
> 
> The diff changes one out of the three lock/unlock operations. Other two are changed in 3/19. All three should surely be changed in the same patch.

We could change those spin_lock/unlock calls in patch #3, but I don't think that this is clean.

See the code here currently uses fence->lock and patch #3 would change it to use fence->finished->lock instead. That might be the pointer at the moment, but that is just by coincident and not design.

Only this change here ontop makes it intentional that we use fence->finished->lock for everything.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>            return;
>>>>        }
>>>>    @@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>>>          fence->owner = owner;
>>>>        fence->drm_client_id = drm_client_id;
>>>> -    spin_lock_init(&fence->lock);
>>>>          return fence;
>>>>    }
>>>> @@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>>        fence->sched = entity->rq->sched;
>>>>        seq = atomic_inc_return(&entity->fence_seq);
>>>>        dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>>> -               &fence->lock, entity->fence_context, seq);
>>>> +               NULL, entity->fence_context, seq);
>>>>        dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>>> -               &fence->lock, entity->fence_context + 1, seq);
>>>> +               NULL, entity->fence_context + 1, seq);
>>>>    }
>>>>      module_init(drm_sched_fence_slab_init);
>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>> index fb88301b3c45..b77f24a783e3 100644
>>>> --- a/include/drm/gpu_scheduler.h
>>>> +++ b/include/drm/gpu_scheduler.h
>>>> @@ -297,10 +297,6 @@ struct drm_sched_fence {
>>>>             * belongs to.
>>>>             */
>>>>        struct drm_gpu_scheduler    *sched;
>>>> -        /**
>>>> -         * @lock: the lock used by the scheduled and the finished fences.
>>>> -         */
>>>> -    spinlock_t            lock;
>>>>            /**
>>>>             * @owner: job owner for debugging
>>>>             */
>>>
>>
> 

