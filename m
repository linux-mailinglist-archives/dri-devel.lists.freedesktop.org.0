Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C24969609
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD03310E423;
	Tue,  3 Sep 2024 07:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="El/yiAA3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2071.outbound.protection.outlook.com [40.107.102.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78B510E422;
 Tue,  3 Sep 2024 07:49:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehFKHhEs5XSoZ8qDRFQLxV/Yes8v1HaHRLrPn409+vdq3WDFvxLWv/LqJF842ITJqJjrp6oPWRzh7rqoNAgKGSPiRdNcClw0gsHPrC95fgpMoSSZpJjtd/MSWE3RI7iAPZuYxhibVmGalPqAlZ/Qt7awdZirMLhkpX1F6gYSK2634IN/Mf7Hlq02UBzHbvHf1weO0VbiSiYDY1NIzNHIgT2LsuYOxN+XtHjj7yb70BMrq0QwpUjw8v+fawEblDJ4tkpzA4TcSwkKe8osS6NSRfgSAU0c9TGBTrgW8MdN+4xZkIaMAHGTEDcChqBNy5jCcFU6NluTsVn5hZ08nqK7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqRu2rRzzvzJJyI/s8ginBYd4Klqx+jpA/EaFGBdAqo=;
 b=yj2oOIfw3WQA5+ndLeZjjXP+P3C+qFqDv8FXxtNCaE9ZuV3T2I0i1Teg/Vv47TsuciHZAJQTYuShrt+lZ5oqgit6f7sSDF95/AOmCP5qeZsFEBzXIsO8mGVrlNaZ0GpGM1kVvFpn8Tb3MCwyyLXkezzIdhWdGSnFRoCuPRZMtr6X1zYx/vgZJiQY0wgFae9fGidlmKS8doV3sMPXZbni/13g/RxhRB214BEfWdD4uGzn615fQNC+NiAhy2yUVDoxMxu3f7DArd6ReIkf0GLrsfNW+BdohPA7fWzcdImi/wfm5q3dM3n29jxLBqHPyijcR04HG2sWTyDThUxRE6kjPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqRu2rRzzvzJJyI/s8ginBYd4Klqx+jpA/EaFGBdAqo=;
 b=El/yiAA3BCcK969sQIVVaCsSweyypV1kVmHkyGZZk76p+wRdBgF1ZiJ0jtlMgUBYebd7kS6BMP7d6MS1RQRmhSAmS6ScN1Zk99rMQRMiafs9e0GGr/ZI7m6fXgO5OniiXVNfvEYEroyAxpBJNW0VJ3P0UcuNOt22SA3aXhtFg+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6143.namprd12.prod.outlook.com (2603:10b6:8:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 07:49:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:49:47 +0000
Message-ID: <a06e14d8-b9e5-44bc-bac5-42cb7d7e658e@amd.com>
Date: Tue, 3 Sep 2024 09:49:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/ttm: Move swapped objects off the manager's LRU
 list
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240902154159.78871-1-thomas.hellstrom@linux.intel.com>
 <20240902154159.78871-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240902154159.78871-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0251.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6143:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b0f624-08eb-4d23-7eef-08dccbecfbdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFp0blN0dmUySkVNYmhwOWZRYVo1K0JKVWVLaThVT0hsbjFFTWtVUFpWTm9q?=
 =?utf-8?B?cys2N0hsZUlKdG1TNUhYSHF4MlI5ekZkQnNDZ3ByeEF2dWExQzRudXVpMlkw?=
 =?utf-8?B?bVlNYlh1Q3pia1VSVm1lSkRhUWNPdmYwQTNNSzFYQTRMMWkyTzJGZGExZUZZ?=
 =?utf-8?B?ZDlacE1sVHJNdlU2Ky9wSVZ1R3d2UllCanJHOHFGOURhLzF0QmRUaS81MVU5?=
 =?utf-8?B?dGVWdEJGL0d3ZkdQaDVCNVNGRkNSUkxRSC9lVmlQZUlqY1pJMHBzTkwxbjN5?=
 =?utf-8?B?cHM3MDJtdmgxTi84SmRnZ1BnVHJ3QmR1UEQ4LzlseDVmcE5LMVlBTE45ODZG?=
 =?utf-8?B?VWRtaGhLSHlJdkNGbWI2K0dTSUFyeWw5MGxTQ0pUWlJZbFVWcUFsVWkzZ28r?=
 =?utf-8?B?N2h3YlQrWVF1SThLQWIrOGE4bHFNL2pGK3B1dnlRd05zVU5OQ0YyMi9iMmJU?=
 =?utf-8?B?aGFVamExTmczVTF0WUl4TmpqUmJLV3cyKyt2bVplQXBNWTlOdEc2SnNvK3gx?=
 =?utf-8?B?TTVGYXRLc1hlYjBRQWFKWVN5NGg3cXRyemIwQWxBaFdWMC92VVJtTCtHZGZZ?=
 =?utf-8?B?YkpCbmV4czF4d2lPcDRiSU5TYWI3ZVNNZFlPK1k5QlQyanJtMUtBSWJsVjNL?=
 =?utf-8?B?NlZOd1FpajREcGk0R3g0MzVEZ2NqaWlLSTB6YjdSVStsTHgrWWx0VnV3akVj?=
 =?utf-8?B?VzNOZVRZbFN5K3RsZ1FWQnp0UklUQmVTQ1l5QkdzWVM4VzRiaTRCUE9tU2My?=
 =?utf-8?B?aXNXbkdXSzFQUmRuNnpJKzVlVmxTbUtrK014eGRML01LbUsvWis4RXNxV3E3?=
 =?utf-8?B?WnR6MVZtWG1pemZzcyt3TkNidU5xSG8zR1QwMmRIUWRKczN2UDBNelg1QzZE?=
 =?utf-8?B?bWMwam56c0MwQjlTNGRYa0dacktwYndOcnpQQ0JyTXV4ZDlnL0kxRHoxOHNo?=
 =?utf-8?B?WTBkNDVwdFZvcGVjeFhPRG5PVVh2anRNMW95S1lwdDF3eTltQ2ZhazRVM3VM?=
 =?utf-8?B?MERiV3MrUGlrbDJlMnBjT0NMWGdUZWp3Y0FWaUlSMTV4VnZ6dTZPVUxVQXp2?=
 =?utf-8?B?Vm9ia3lta00zQ0xqRDJYc3Jrai9oeVBuRm9wWjhvM2ZnQlg3b21hL2YvOW5t?=
 =?utf-8?B?SHErb2N6SS9LZ2tZeUJIelArYnpuN2NCNTFmdTZiVUZkVG1DV0hXSVk0eCtz?=
 =?utf-8?B?REQ0MmpiaFAxOTM1eERNUlZHV2JHMkpVbUNKTm1aa1M1bkVtbjhNZGV2b05R?=
 =?utf-8?B?d29tZFB4TEpsSFRnaEdPY3RXWEE2RTlqMjUyWHpZTi9Ea3gwbG9tV2lHeVVH?=
 =?utf-8?B?WVh3MjJNMG9tMlM1clRSTEFwRU1QeGJ4eUtjQ2pwZzczNUNXbitUekc0eW9V?=
 =?utf-8?B?c3hVUlpCaGlWSU5pcG5zeVJaM3dYNjROZEprelJRSlgzaWFHa0xqa3pvSXBR?=
 =?utf-8?B?Q05sRTRMT0owUFh1UzdpS3h0MWxoTUFNcWZwc0NKZXVmTHVXMG43N1pWbVRz?=
 =?utf-8?B?V2xKeTFINThYRGJhZmZnVkg3cEtzQklhd3lyK05DZ2t4UE80d1hhelZYWk4x?=
 =?utf-8?B?MC9LZExNM0FrWjlHQmt2eTM2OG1DUWxxRWUzdFdIUnF2SWlKY1lWWlRvZGJw?=
 =?utf-8?B?SCt6bTA5aTBkZVUrL013SERnbzBjWGNYZzJueGlVRGNhdEFQRkZTRzZnNnFX?=
 =?utf-8?B?YUhWZHA1WDVXU29Qcmc5OE92VDZYaTJSeEUzS29VaU5oMThPN0czUFNvWnJG?=
 =?utf-8?B?THJDYnlVVzNDZzBLSWhrQk42YmYrTW1VMW8rTUhpc203Rnp2ejNORlpYaUVB?=
 =?utf-8?B?Zyt0cUxJa3orenhFT1gzUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUxvREJUcG9kNDRtdW4zMjNhM0FGb3pDUDAxdlQzMG8vY1hMZjZybSt1a1N2?=
 =?utf-8?B?L2lZMXNhYVUrVFhmaHg4NXB6dFRtZkJkMHk1TDhZMXNOSlZwazlVNjJ6ekR4?=
 =?utf-8?B?TXVKNXJrU0JsYWNmVlZROTdUNFJURWFNa3ZGanpOTWVRWnh6THI2M0xCTW45?=
 =?utf-8?B?OVRXaDdvd2QrSGkwOTgrT3ZwR01oTjA4aUkxa2x5aHBWZmZ4cUZhYlArdHYr?=
 =?utf-8?B?bGpyZXB2NjBFRXRjRURVa2x6NmJCVVFJL0NCdnlrRDZYR3pQSVp2RWR3ZzMz?=
 =?utf-8?B?S2JmOUpWYjJVUktrb3Q2SlhNUEpzS3FYMGZoRUpTN3FndFJ5MXh1c3NLdVd4?=
 =?utf-8?B?M3hjTjdjNXc4eUkycGpCYTRhWkowa1I2Z3IrNEllcGVLdEZaV2dHeTQzcXQ5?=
 =?utf-8?B?T0pPdUduSm8xbmxJZmFUSmErQ3N3eWdKOVdCaXk4czVUSkprRGV3U3BuRHlF?=
 =?utf-8?B?OHhFUVhCNEdQZ0ZHTVY5TUlZby9WbWhnRTMzYUpwekpaSllZWjRpRGo3ZS9J?=
 =?utf-8?B?SG9hbDdsbjRPd1poTGZqT21OQWNyOWVnaGZHaDUwTFB4Tk0xTzl3SW5MaDRK?=
 =?utf-8?B?di9zS1crd2M5cG5lbVl5MXMrTUx3MndBajBOZ1pKeHpzc2NCalR4SDJud1I5?=
 =?utf-8?B?LzRkaEtWbDZDSjRocVBabm1nODMweE5ydzRpSTJiOExsWTUyVjVmakk1ekxN?=
 =?utf-8?B?WWRsUHpNM3NkQ0toR2thaHJGR0h4ZGxJNkZpZTk2aWQvTnVXU3VSUHJ1T2FZ?=
 =?utf-8?B?TmRpanpTYUZLY1R6SEJQelU5eDNLWlNWd3hnZUx6bWxuUmVJTFZ1M2RiMFZF?=
 =?utf-8?B?WG9VNHFyNUY1S2krMm9QQ242cmQyWVByL3RoUmJoTFNIU09jS2Z4Q3NwdmJ2?=
 =?utf-8?B?Y2kyZTROSGpyMHVrdlI0ZDJDdFdUZVkzcDJxNmtoMjNBNzB3TWlPR2w1eGxV?=
 =?utf-8?B?SFJhclJDb253OURTaGpRbmF6R0NCQ3ptRzJhOVQ3aXhhYVh2U3dNWFNJK1BZ?=
 =?utf-8?B?amYyZVVOWTBHcUNuSXI5STBURGpaTmJUQVlFb2FiZ0FxQUltMlExK2FDeng2?=
 =?utf-8?B?MGFSMGMvc0kwOXVGd1IybUUxRElieUNxdVd4T3d6SVZQeXg0TjdIQUZuVE81?=
 =?utf-8?B?Q2EvQlc0amhpa1dJUU02QldIdFRFTy9iVDVJdkJEb3IyR2xjbnFrakUwNEZI?=
 =?utf-8?B?UGVDK1ZNR1dRcTloNlZ4cjRlRjNXSGwySVRNTGl0Sy9MZmZWNlRDcGdjbFE4?=
 =?utf-8?B?ck5pKzdWdG95cGhRdTQySU9ueGRINVM0RCs1QVRzNHpxdXZTNitiTmQ1U3NL?=
 =?utf-8?B?ZjhRcllEWXZ2cGIwcmxLYkYyNEdINEhIL25MS1RuVlhYWVNBczdEcExHS3Js?=
 =?utf-8?B?cFRwb1MxYnJnd3diaUg5VHc3dTVWa2prMFU4N1U4T1QrQjk5VnpPM3kvR2lp?=
 =?utf-8?B?cC90RmNQemtVNmFRS0tIYXBYRldVcTJsY21UNmdXRlFNSEVIQk11VUNFUnUv?=
 =?utf-8?B?ZGVwL2JJdmxhT0g1VlNHWTgzKzRRU3JOUnVBOHNqMXRPZ1ZqNHZDRHBuTHVG?=
 =?utf-8?B?QjNORmcvSXhKL0ViVEFBU0ZpS1FBNDU0cmFWWnBTNkhzbUFaaXQ3Mnk5QXlD?=
 =?utf-8?B?ckJiY1UrZll1SUtPbk10VWFzTVFWaUorWmthS09aYmZtSnE2YkZYZmY2ZU9i?=
 =?utf-8?B?WkVpbkhaci93YkxGdGlWaUdrYWhjbDQ0Qkx4YzMxa0JnSEtBZjFsNEQ1UzM0?=
 =?utf-8?B?MFAyQzdjZ1l1MWk2ZHRqbzF5ZVlIU3VJRWVHVXlkYzYweGFMd1VsRnNlQmNH?=
 =?utf-8?B?RFpKdmlyeENDWitXY1kzaEMyNlRvTFY2ck0wMXJ5QWpYK3hKcythU1c2cGJR?=
 =?utf-8?B?elZ0dzgvWXJkYVZQd2NrR0JqK1dXNGY0NjUrbkxrYzdHd3NZajhxbitBZGxw?=
 =?utf-8?B?V0NOeVJJMTVZL3o0OC9rRjRCemMwYi93cUZWWXFWYnZrbHl0dVRYVFRnaFhr?=
 =?utf-8?B?aDJjcHJaL0VCdjRoZllPb0RPM0Jmd1Rsb29HT1cvcFFHU240OTBVaEd0Yito?=
 =?utf-8?B?RDFZZ0UxelZQL09rMURmbmdnZTRjMi9USUh6NnJVOTVsLzQ2eUtmaXRreVFL?=
 =?utf-8?Q?QDVUszbA7dUJGKvtqJj3/HibG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b0f624-08eb-4d23-7eef-08dccbecfbdc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:49:47.9018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLNg4CGLs57JLNTTmTIScCg2B/HFYkb1o8+ZZEf6ULgufysuxOBx4Nl7STszOyWF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6143
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

Am 02.09.24 um 17:41 schrieb Thomas Hellström:
> Resources of swapped objects remains on the TTM_PL_SYSTEM manager's
> LRU list, which is bad for the LRU walk efficiency.
>
> Rename the device-wide "pinned" list to "unevictable" and move
> also resources of swapped-out objects to that list.
>
> An alternative would be to create an "UNEVICTABLE" priority to
> be able to keep the pinned- and swapped objects on their
> respective manager's LRU without affecting the LRU walk efficiency.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c   |  4 +-
>   drivers/gpu/drm/ttm/ttm_bo.c                 | 55 +++++++++++++++++++-
>   drivers/gpu/drm/ttm/ttm_bo_util.c            |  6 +--
>   drivers/gpu/drm/ttm/ttm_bo_vm.c              |  2 +-
>   drivers/gpu/drm/ttm/ttm_device.c             |  4 +-
>   drivers/gpu/drm/ttm/ttm_resource.c           |  9 ++--
>   drivers/gpu/drm/ttm/ttm_tt.c                 |  1 -
>   drivers/gpu/drm/xe/xe_bo.c                   |  4 +-
>   include/drm/ttm/ttm_bo.h                     |  2 +
>   include/drm/ttm/ttm_device.h                 |  5 +-
>   include/drm/ttm/ttm_tt.h                     |  5 ++
>   13 files changed, 81 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 5c72462d1f57..7de284766f82 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -808,7 +808,7 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
>   	}
>   
>   	if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
> -		ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
> +		ret = ttm_bo_populate(bo, &ctx);
>   		if (ret)
>   			return ret;
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index 03b00a03a634..041dab543b78 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -624,7 +624,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>   
>   	/* Populate ttm with pages if needed. Typically system memory. */
>   	if (ttm && (dst_man->use_tt || (ttm->page_flags & TTM_TT_FLAG_SWAPPED))) {
> -		ret = ttm_tt_populate(bo->bdev, ttm, ctx);
> +		ret = ttm_bo_populate(bo, ctx);
>   		if (ret)
>   			return ret;
>   	}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> index ad649523d5e0..61596cecce4d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> @@ -90,7 +90,7 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
>   		goto out_no_lock;
>   
>   	backup_bo = i915_gem_to_ttm(backup);
> -	err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
> +	err = ttm_bo_populate(backup_bo, &ctx);
>   	if (err)
>   		goto out_no_populate;
>   
> @@ -189,7 +189,7 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
>   	if (!backup_bo->resource)
>   		err = ttm_bo_validate(backup_bo, i915_ttm_sys_placement(), &ctx);
>   	if (!err)
> -		err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
> +		err = ttm_bo_populate(backup_bo, &ctx);
>   	if (!err) {
>   		err = i915_gem_obj_copy_ttm(obj, backup, pm_apply->allow_gpu,
>   					    false);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 320592435252..d244566a7e48 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -139,7 +139,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>   			goto out_err;
>   
>   		if (mem->mem_type != TTM_PL_SYSTEM) {
> -			ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> +			ret = ttm_bo_populate(bo, ctx);
>   			if (ret)
>   				goto out_err;
>   		}
> @@ -1131,6 +1131,13 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
>   	if (ttm_tt_is_populated(bo->ttm))
>   		ret = ttm_tt_swapout(bo->bdev, bo->ttm, swapout_walk->gfp_flags);
>   
> +	if (ttm_tt_is_swapped(bo->ttm)) {
> +		spin_lock(&bo->bdev->lru_lock);
> +		ttm_resource_del_bulk_move(bo->resource, bo);
> +		ttm_resource_move_to_lru_tail(bo->resource);
> +		spin_unlock(&bo->bdev->lru_lock);
> +	}
> +
>   out:
>   	/* Consider -ENOMEM and -ENOSPC non-fatal. */
>   	if (ret == -ENOMEM || ret == -ENOSPC)
> @@ -1180,3 +1187,49 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>   	ttm_tt_destroy(bo->bdev, bo->ttm);
>   	bo->ttm = NULL;
>   }
> +
> +/**
> + * ttm_bo_populate() - Ensure that a buffer object has backing pages
> + * @bo: The buffer object
> + * @ctx: The ttm_operation_ctx governing the operation.
> + *
> + * For buffer objects in a memory type whose manager uses
> + * struct ttm_tt for backing pages, ensure those backing pages
> + * are present and with valid content. The bo's resource is also
> + * placed on the correct LRU list if it was previously swapped
> + * out.
> + *
> + * Return: 0 if successful, negative error code on failure.
> + * Note: May return -EINTR or -ERESTARTSYS if @ctx::interruptible
> + * is set to true.
> + */
> +int ttm_bo_populate(struct ttm_buffer_object *bo,
> +		    struct ttm_operation_ctx *ctx)
> +{
> +	struct ttm_tt *tt = bo->ttm;
> +	bool swapped;
> +	int ret;
> +
> +	dma_resv_assert_held(bo->base.resv);
> +
> +	if (!tt)
> +		return 0;
> +
> +	swapped = ttm_tt_is_swapped(tt);
> +	ret = ttm_tt_populate(bo->bdev, tt, ctx);
> +	if (ret)
> +		return ret;
> +
> +	if (swapped && !ttm_tt_is_swapped(tt) && !bo->pin_count) {
> +		if (WARN_ON_ONCE(bo->pin_count))
> +			return 0;

You have both "&& !bo->pin_count" and a WARN_ON(bo->pin_count), that 
doesn't make much sense.

> +
> +		spin_lock(&bo->bdev->lru_lock);
> +		ttm_resource_add_bulk_move(bo->resource, bo);
> +		ttm_resource_move_to_lru_tail(bo->resource);
> +		spin_unlock(&bo->bdev->lru_lock);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ttm_bo_populate);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 3c07f4712d5c..d939925efa81 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -163,7 +163,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   	src_man = ttm_manager_type(bdev, src_mem->mem_type);
>   	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
>   		    dst_man->use_tt)) {
> -		ret = ttm_tt_populate(bdev, ttm, ctx);
> +		ret = ttm_bo_populate(bo, ctx);
>   		if (ret)
>   			return ret;
>   	}
> @@ -350,7 +350,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>   
>   	BUG_ON(!ttm);
>   
> -	ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
> +	ret = ttm_bo_populate(bo, &ctx);
>   	if (ret)
>   		return ret;
>   
> @@ -507,7 +507,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>   		pgprot_t prot;
>   		void *vaddr;
>   
> -		ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
> +		ret = ttm_bo_populate(bo, &ctx);
>   		if (ret)
>   			return ret;
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 4212b8c91dd4..2c699ed1963a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -224,7 +224,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   		};
>   
>   		ttm = bo->ttm;
> -		err = ttm_tt_populate(bdev, bo->ttm, &ctx);
> +		err = ttm_bo_populate(bo, &ctx);
>   		if (err) {
>   			if (err == -EINTR || err == -ERESTARTSYS ||
>   			    err == -EAGAIN)
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index e7cc4954c1bc..02e797fd1891 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -216,7 +216,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
>   
>   	bdev->vma_manager = vma_manager;
>   	spin_lock_init(&bdev->lru_lock);
> -	INIT_LIST_HEAD(&bdev->pinned);
> +	INIT_LIST_HEAD(&bdev->unevictable);
>   	bdev->dev_mapping = mapping;
>   	mutex_lock(&ttm_global_mutex);
>   	list_add_tail(&bdev->device_list, &glob->device_list);
> @@ -283,7 +283,7 @@ void ttm_device_clear_dma_mappings(struct ttm_device *bdev)
>   	struct ttm_resource_manager *man;
>   	unsigned int i, j;
>   
> -	ttm_device_clear_lru_dma_mappings(bdev, &bdev->pinned);
> +	ttm_device_clear_lru_dma_mappings(bdev, &bdev->unevictable);
>   
>   	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
>   		man = ttm_manager_type(bdev, i);
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 6d764ba88aab..9d54c0e3e43d 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -30,6 +30,7 @@
>   #include <drm/ttm/ttm_bo.h>
>   #include <drm/ttm/ttm_placement.h>
>   #include <drm/ttm/ttm_resource.h>
> +#include <drm/ttm/ttm_tt.h>
>   
>   #include <drm/drm_util.h>
>   
> @@ -259,8 +260,8 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
>   
>   	lockdep_assert_held(&bo->bdev->lru_lock);
>   
> -	if (bo->pin_count) {
> -		list_move_tail(&res->lru.link, &bdev->pinned);
> +	if (bo->pin_count || (bo->ttm && ttm_tt_is_swapped(bo->ttm))) {
> +		list_move_tail(&res->lru.link, &bdev->unevictable);

You need to change ttm_resource_add_bulk_move() and 
ttm_resource_del_bulk_move() as well.

>   
>   	} else	if (bo->bulk_move) {
>   		struct ttm_lru_bulk_move_pos *pos =
> @@ -301,8 +302,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>   
>   	man = ttm_manager_type(bo->bdev, place->mem_type);
>   	spin_lock(&bo->bdev->lru_lock);
> -	if (bo->pin_count)
> -		list_add_tail(&res->lru.link, &bo->bdev->pinned);
> +	if (bo->pin_count || (bo->ttm && ttm_tt_is_swapped(bo->ttm)))
> +		list_add_tail(&res->lru.link, &bo->bdev->unevictable);
>   	else
>   		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
>   	man->usage += res->size;
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 4b51b9023126..d1325cf37b18 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -367,7 +367,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	}
>   	return ret;
>   }
> -EXPORT_SYMBOL(ttm_tt_populate);
>   
>   void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 9df5a16662cf..d7d0add20b77 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -903,7 +903,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>   		}
>   	}
>   
> -	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
> +	ret = ttm_bo_populate(&bo->ttm, &ctx);
>   	if (ret)
>   		goto err_res_free;
>   
> @@ -956,7 +956,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>   	if (ret)
>   		return ret;
>   
> -	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
> +	ret = ttm_bo_populate(&bo->ttm, &ctx);
>   	if (ret)
>   		goto err_res_free;
>   
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 7b56d1ca36d7..5804408815be 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -462,5 +462,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
>   pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
>   		     pgprot_t tmp);
>   void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
> +int ttm_bo_populate(struct ttm_buffer_object *bo,
> +		    struct ttm_operation_ctx *ctx);
>   
>   #endif
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index c22f30535c84..438358f72716 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -252,9 +252,10 @@ struct ttm_device {
>   	spinlock_t lru_lock;
>   
>   	/**
> -	 * @pinned: Buffer objects which are pinned and so not on any LRU list.
> +	 * @unevictable Buffer objects which are pinned or swapped and as such
> +	 * not on an LRU list.

Either "a LRU list" or "any LRU list".

Apart from that this change makes a lot of sense.

Regards,
Christian.

>   	 */
> -	struct list_head pinned;
> +	struct list_head unevictable;
>   
>   	/**
>   	 * @dev_mapping: A pointer to the struct address_space for invalidating
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 2b9d856ff388..991edafdb2dd 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -129,6 +129,11 @@ static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
>   	return tt->page_flags & TTM_TT_FLAG_PRIV_POPULATED;
>   }
>   
> +static inline bool ttm_tt_is_swapped(const struct ttm_tt *tt)
> +{
> +	return tt->page_flags & TTM_TT_FLAG_SWAPPED;
> +}
> +
>   /**
>    * ttm_tt_create
>    *

