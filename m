Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80E697A30D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E224C10E352;
	Mon, 16 Sep 2024 13:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CAtcF2is";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F321010E352
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 13:44:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsWMli3zM/jBOavGW/MU3BhzuI8GOyJhRGhp5vHT816JYFXB4eeqXuaeFmlI1soprjahfdgfhoniL8GbVP11WU/SoSUkBeFE9aA2zVM0nPJde+k1rYIljvZYkmDOyoMMlpZjXJfHENqRPqbqA3Ucu+j2F704QRtSXwENfr6ngij3f2o00O4Vg5JhGfJqrdYjegCkUFCaaZykXYtKNbBRppkORc4qWmw7Uu2tL7UG7FU67sGr/YDy8z+eJAnILcTxv2TcEJAn4w2LdbLwifxUlZQd652oT7wVEkzl+w2T/3IMyllZGNN71Wo4vDFtPLbxz0K7+plHngXjSUh9BGnTAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHxapipKf7QNKC10wh3QPfzriLSiBe1eB9LQF2KVV0Q=;
 b=zNIZss0MUnxS2PIutMyzT0PM1PBI2LEfQyM1GRBP/Sq75eB+Ww1PbDi6drzlf4NgsantUTyMGW0ITO0RJyoiD39zFyZmk/iQn/Xx8qmJeGcd8doma04H5uPQPXLVlti8sxU3tvNPZYjuHUXZ7ehaaRJX0GcumxC3kHCKX9/5uY9xuyEUwpL3z/ALj9gkGcTLytu4kBGQuozanpruuggem0NzvLRKQ1JHPkcbl8KY+TOcOcBmlKrixc+MGIeeuvXZJsXmhs3X2TB6qs8OTu6dX3krF088z/OkZ2qre3t4EfxeRa7ptTJ1jtnGDVhS8zKxoLuGEc2NCAfnvjejijs9cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHxapipKf7QNKC10wh3QPfzriLSiBe1eB9LQF2KVV0Q=;
 b=CAtcF2isB3yewy2cJEkwvhQaitjHnnKxWjfcSMH/7khkNkjsxvAFvmyYotkzkdaaZ4m7bHVP3if91OnA+LzwUTj4eAHod+iJ0SDt0lqv0xCNAAI5gTx1phMEdry5JPTT05BfoFJ+sWNPOXXK7ThH5bIu/diwgNx/z4vak/UxwEw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7514.namprd12.prod.outlook.com (2603:10b6:930:92::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 13:44:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 13:44:32 +0000
Message-ID: <54089ee2-0501-41db-a48f-024dc1f4dd43@amd.com>
Date: Mon, 16 Sep 2024 15:44:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm: add DRM_SET_NAME ioctl
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, tursulin@igalia.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com
References: <20240916133223.1023773-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240916133223.1023773-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: ebfcb1bf-2508-499f-fcb8-08dcd655b18d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3N3d1k3Ym4xZ05jNzhQUVovWUVKQmY0L1hseXJPdzdWcmk1RWQwMW9XbGlG?=
 =?utf-8?B?c2ZPMmJmYUt3K2hmU3NQdzRpY3FvREF6eVk3S2g3NThiQ3FacG15RlVnODB3?=
 =?utf-8?B?QTM5Z0NFcURvYm5GWW1NZWFOY3dQeW1aUDhCbDJZRUVhTmY4cWlDTjB3WDJH?=
 =?utf-8?B?MWdXT2twc3Y0L05BSjl0RjR4Ujg4OFc2NTkwWC9IdjR2K2k1MmFZVWhyanhC?=
 =?utf-8?B?Vld6MjV0R2lsMmhreEZhVXhZSWhkVFE2enpEcGlvS0RJU1h6TVMvTWwzZ05u?=
 =?utf-8?B?Rkp2RkF5WUZGeUZpK1cvZHRZNFJHd3p4UzI5ODEvRTRTUGtkNk1YdWt0Mk1o?=
 =?utf-8?B?RlBzRG53ZE04SWplT0oxVlJFZmJQTEJOTWpxVHNtMVdTOEVseXlpNElJMHdv?=
 =?utf-8?B?eWorRFQzbUQzT0pMbzRKRVlZRVVOVDZhbXpXQUcxcGxGWCs3MWY1ZWorR1U1?=
 =?utf-8?B?cGwrNHlWbjBWZnQyemYxNWpkWjV4MmtZM0lLTjlTRmtqM0RKaVJCV2lYUWRr?=
 =?utf-8?B?djhtdGpUUmpmZ0oyclBvY3JDV0E2ODRaSm9hODUxemQwaWdzSFU5VXF5ZW5y?=
 =?utf-8?B?WWRVSVoyY2QweFhCa3pyOGoyeUlseTQzeXp1d3UwMlFyc0ZWbU9tY2UvSkNE?=
 =?utf-8?B?eDNYeFlzWGtHL3M2RGp6T2dXWnd6Z2ZVNFJzcSs3Q0RydDdZa0hhQUxYZk9T?=
 =?utf-8?B?Qzl2M0NOaERZQnROM0IzTnY4V29nK0UwaElJTjBEdUZyUUI1UzhNaFpwTlBK?=
 =?utf-8?B?czlXekdaOERNWDhHQ2R4UlBWeWhNUGJXWXFzUzA0cmJlbEwrYTB0RkFhVmRI?=
 =?utf-8?B?blFDMm5JM3dIMDJPWlFrdFpSMXlKYjVJbkI1NEU2QVU1emNkbnlnS3Z3WDQy?=
 =?utf-8?B?Y3VyZnJZYUJYS1NlaGxyK29OUWxiQmQ4c2xTMDJDUTNaalV6MFkrZHo5Wi9K?=
 =?utf-8?B?WGo3eVhweXJuQ1BxOERLbE1mZzRNSEpqWDVDOTZFT21ETTlVTmw0MG16d0Vk?=
 =?utf-8?B?a0orU0JTRUdIeFI5MXliOWtlcFk4eXVYQTlrS0JXSnF1MnVXRWJHT0VRc3Zm?=
 =?utf-8?B?RE1zMGh4UTd6SDg0NHFzWkVKZC9RU2hUVlM3cm44SGJCbXZ5cFg4UGZ4cEJG?=
 =?utf-8?B?MkliVldnQ2FiV0ZGTERQY0IzS3hVVWJQWU5mbHJNRGZLRHBneWFURmRxZnM4?=
 =?utf-8?B?YlQxZmM2R1JCUGJBM2tkbnZ1NUY2Y3FTeitGd0xjTU0yWFRSVVF5bkRYdGx5?=
 =?utf-8?B?YmNwMVZCaUNnR3UrY2FTUWlqbU9oKy9PYVNTNG5QaXVmZ3M3d0h3Q1FxbkNm?=
 =?utf-8?B?MTlmaXI2S3V0RVl3VjFXTGZDbHk0bFpWS1lPOW9EUUZ6QkdLVXRWVGc1TGli?=
 =?utf-8?B?ZVZTcGZabDRmbTFQeVJKcGo5S3c1ZlFJSGhwSnE5QWFNaEk0Z1VXc1piVFBE?=
 =?utf-8?B?K0hkQ293OGErTTRJcE5oR0xhWHh3bGJvd2VVd0tQRVR0QzU2Z05ENkhSWWQx?=
 =?utf-8?B?OXdmQnQxNm5YRjdJNy9GYWxFaFA2RjJIRndud3YwNk16c3hzd2pVenU2UDBZ?=
 =?utf-8?B?QkdHL0pPRjJCNkZxZS9CeFRHK2h6V3l2RVE5OHRaVnJFUjNoTkdXUi9ERE00?=
 =?utf-8?B?RzZTWExKamM1V0xiMlVIV1N3VnJ6NFRFaW9maXNxTnlveFp1N3lIbHRjVG8w?=
 =?utf-8?B?LzFvZFZEbGZ2aVJsSm41Zy96VmZaRzVZcm1rQzNPMkx0MWRVaEJwS3F3VDFP?=
 =?utf-8?Q?SSi/5h9Jq4ABMX/CUY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDJLTW01T1N1cFVQQkUwS2FJYjIrZnh1aWVFckJraG1zbnFSc1FsbGhEYnBD?=
 =?utf-8?B?bnduZlNMVDloMnEwd3k1STIxTnhVTk9jNk9STFh5V3N0aW01aFl6eWh1YjVt?=
 =?utf-8?B?WW1xSVJvaEJJS3ZGWXhmeHJuc0tJd0R5WTdDU25BVXZ3TTBxY1NtQVlGMnJz?=
 =?utf-8?B?elhyVXY2NE93RmVSdTlINHBleGlzYXMxZXI4NGNxUENnY3BBM0NuUk5HOHNz?=
 =?utf-8?B?ZG1xZzllYnBVM2RKWmcvNjExeVRhZEtOMm5QRmhFL0MzTXNoOUJhdWxKeXB2?=
 =?utf-8?B?bzhIV2JKUHdSdTJIMk9UaWpyQk9PTVhTbmY0N1h3eW1QWk0xT2tTRkk3M0Fl?=
 =?utf-8?B?TCtEdlZUNlhxZzdXVkZRdE4yWlZrRlVUZGwvUFJpM054N0g3SlhiOVNMalJU?=
 =?utf-8?B?NlJxRGpEc0N6NWJqbWt4TzdxNkZwQURqRW84WTN5M1hEV0YzeDNzOVFWd0kw?=
 =?utf-8?B?dWxYd2lLTlRrZ0F1bU96SGlNRmVubEYvZExCNEhRZWF0L0d6OGl1Yi9ERHNO?=
 =?utf-8?B?dHRZOFJ1QWgxT2VFNnI2bmVCMml4SVprNFpFcWhyWmwwenlQOXhXQkRZcUFx?=
 =?utf-8?B?V00vZmFLL1FvNWZwZDVhKzV0d3A1TTVRTDQ5ZzMvbHVGblh2aWV5VCsxNGJm?=
 =?utf-8?B?cDFSM3JBeWVkRkZwVGJlY29jMUpWQi9xQ2lkNEVhSEhxbzJTQWFFY1FNaEhs?=
 =?utf-8?B?WVVXL092cWF3YXhQWUVNMW1xN25Dc3RQaUJZVWZiZ0VmdVU1Smc1Z2FtbkZY?=
 =?utf-8?B?bkVQUHFQZmFaaVc0Y0FYcGxxR0w4eHhmVEQyTktxTzhKcmN5b3ZhOGN6NjZN?=
 =?utf-8?B?OTVXcjFyUGtpSDUwcDBMS1RJa2tVNXVSOFVZNnpYUFdRNzRjMXE5a2xKMndM?=
 =?utf-8?B?TTFNT2JsYnFtcTYwbGY5YW5yU05qcXBVbHphK0hKU1RpcHdTUTRmWkN5SE9P?=
 =?utf-8?B?ZE5MdGs4QzE2NVZEMC8waUVrOFZSeGVuYVg2WUxEUFpxRlk2TEplMjRiZFlr?=
 =?utf-8?B?czZ3UlVwbkhSOFdYd3lYTGgvbWZYMEFxTkIxNHhYdG5iV1dVdHpMajJnWHpz?=
 =?utf-8?B?c1IxRzkyUHYzWDQ1S051WlBTenBqcXdiRWNTQVdsR1J1dE5lNE5raG5oTkpG?=
 =?utf-8?B?WnhLQzg0eFdEZENQMVlOZlY1L1pnQmlnWWxkV05Hd3pJU0I2cGtPSlg0dDly?=
 =?utf-8?B?Nk9FVXdwZUJOeHZhS3hNZkJvSnZ5UjJBRFp1SjFZcVNBOUxLL1RndWNJelAz?=
 =?utf-8?B?UE4vNmVXTW5EYkY1WFJ3Uzc1V3NZUlhNTy9yMWNFN1MrYTNmbDlDNlhNbHRT?=
 =?utf-8?B?b0lnWjhMdWxCSHVTbGJoSjU0b3hHL29oNklXVkJOYmNheTFZUnNZTTJwMmtV?=
 =?utf-8?B?WWpTd3FVVitybVBlSk56OHRHMHluZ2dmbjdmeGZiM09CMGdjS3RnSUNvaFNK?=
 =?utf-8?B?c2w1UklFcG1lc3hwMGVVd0VCU01IYTlaek1NbWlpNnVWaERoeGFlRnhOMXht?=
 =?utf-8?B?dEsrL1czbjFtcjZCZDB4NUlQWFp5OWVXS2JrUk12NFZ0UHdnSmtzWEVTUk93?=
 =?utf-8?B?alJnbzEzaENobDk4eUhvVTI5ZWFseU5YNTV0K0pLNkNVZEFKcE5PUXAvWHNw?=
 =?utf-8?B?b1RGeWo0NkVNdnRVYWcyWU0xL0szSmpLQTRDNUdvRWhkTHhBMzE4SFFTVW52?=
 =?utf-8?B?U1haVzQvUEcvZCtDc0I3WWxtc1RHdVpvT01Db0VRWmVUZE1TcWNFbzZlK0Qv?=
 =?utf-8?B?RitVYXRydU5WSmMwZ3RaZktrRVFNT1BZQWU5TmEwbERHRGlWb1NXVS9oNFBx?=
 =?utf-8?B?ZEZtQitDaW5Za0pMQVNiMkV3QzdFVmk3eWZVVE5CUGE2dS9TSGJVRSs3MlhT?=
 =?utf-8?B?amVoVjNrRzc5czJwVkZid0NadWIrUEk0emN1RDFVRmo3a2t6Qkp3NTVoL3g1?=
 =?utf-8?B?SW12bkFPdGNlRUxiUkdZY2tITXFKRWROc0RPeFJpOGJjT0cxWUwrZjljeHYr?=
 =?utf-8?B?aDRqWkoxMEZWMG8yRUdUTmZOU1lQVHVoZ0s0TkdyOENmMWpZdU1PSm14SXg5?=
 =?utf-8?B?bGpVU0UzVGd3Ky9lcXN4WlZaWmxOOFBFYnFjWUQwa0FLQiswa3RuZVdRRVZU?=
 =?utf-8?Q?FdjI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfcb1bf-2508-499f-fcb8-08dcd655b18d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 13:44:32.1319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzVE4DFW3w47DoMT1Gih34yqQ2t2P+ip883v+3vYrcChZsSXk8EzphMq0eFYBuq/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7514
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

Am 16.09.24 um 15:32 schrieb Pierre-Eric Pelloux-Prayer:
> Giving the opportunity to userspace to associate a free-form
> name with a drm_file struct is helpful for tracking and debugging.
>
> This is similar to the existing DMA_BUF_SET_NAME ioctl.
>
> Access to name is protected by a mutex, and the 'clients' debugfs
> file has been updated to print it.
>
> Userspace MR to use this ioctl:
>     https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1428
>
> The string passed by userspace is filtered a bit, to avoid messing
> output when it's going to be printed (in dmesg, fdinfo, etc):
>    * all chars failing isgraph() are replaced by '-'
>    * if a 0-length string is passed the name is cleared
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/drm_debugfs.c | 12 ++++++----
>   drivers/gpu/drm/drm_file.c    |  5 +++++
>   drivers/gpu/drm/drm_ioctl.c   | 42 +++++++++++++++++++++++++++++++++++
>   include/drm/drm_file.h        |  9 ++++++++
>   include/uapi/drm/drm.h        | 14 ++++++++++++
>   5 files changed, 78 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 6b239a24f1df..b7492225ae88 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -78,12 +78,13 @@ static int drm_clients_info(struct seq_file *m, void *data)
>   	kuid_t uid;
>   
>   	seq_printf(m,
> -		   "%20s %5s %3s master a %5s %10s\n",
> +		   "%20s %5s %3s master a %5s %10s %20s\n",
>   		   "command",
>   		   "tgid",
>   		   "dev",
>   		   "uid",
> -		   "magic");
> +		   "magic",
> +		   "name");
>   
>   	/* dev->filelist is sorted youngest first, but we want to present
>   	 * oldest first (i.e. kernel, servers, clients), so walk backwardss.
> @@ -94,19 +95,22 @@ static int drm_clients_info(struct seq_file *m, void *data)
>   		struct task_struct *task;
>   		struct pid *pid;
>   
> +		mutex_lock(&priv->name_lock);
>   		rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
>   		pid = rcu_dereference(priv->pid);
>   		task = pid_task(pid, PIDTYPE_TGID);
>   		uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
> -		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
> +		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %20s\n",
>   			   task ? task->comm : "<unknown>",
>   			   pid_vnr(pid),
>   			   priv->minor->index,
>   			   is_current_master ? 'y' : 'n',
>   			   priv->authenticated ? 'y' : 'n',
>   			   from_kuid_munged(seq_user_ns(m), uid),
> -			   priv->magic);
> +			   priv->magic,
> +			   priv->name ? priv->name : "");

BTW that can also be written as: priv->name ?: ""

And I think that is now the preferred kernel coding style, but not 100% 
sure.

Apart from that feel free to add Reviewed-by: Christian König 
<christian.koenig@amd.com>

Regards,
Christian.

>   		rcu_read_unlock();
> +		mutex_unlock(&priv->name_lock);
>   	}
>   	mutex_unlock(&dev->filelist_mutex);
>   	return 0;
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 01fde94fe2a9..e9dd0e90a1f9 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -158,6 +158,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>   
>   	spin_lock_init(&file->master_lookup_lock);
>   	mutex_init(&file->event_read_lock);
> +	mutex_init(&file->name_lock);
>   
>   	if (drm_core_check_feature(dev, DRIVER_GEM))
>   		drm_gem_open(dev, file);
> @@ -259,6 +260,10 @@ void drm_file_free(struct drm_file *file)
>   	WARN_ON(!list_empty(&file->event_list));
>   
>   	put_pid(rcu_access_pointer(file->pid));
> +
> +	mutex_destroy(&file->name_lock);
> +	kfree(file->name);
> +
>   	kfree(file);
>   }
>   
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 51f39912866f..b7d7bede0ab3 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -540,6 +540,46 @@ int drm_version(struct drm_device *dev, void *data,
>   	return err;
>   }
>   
> +static int drm_set_name(struct drm_device *dev, void *data,
> +			struct drm_file *file_priv)
> +{
> +	struct drm_set_name *name = data;
> +	void *user_ptr;
> +	char *new_name;
> +	size_t i, len;
> +
> +	if (name->name_len >= NAME_MAX)
> +		return -EINVAL;
> +
> +	user_ptr = u64_to_user_ptr(name->name);
> +
> +	new_name = memdup_user_nul(user_ptr, name->name_len);
> +
> +	if (IS_ERR(new_name))
> +		return PTR_ERR(new_name);
> +
> +	/* Filter out control char / spaces / new lines etc in the name
> +	 * since it's going to be used in dmesg or fdinfo's output.
> +	 */
> +	len = strlen(new_name);
> +	for (i = 0; i < len; i++) {
> +		if (!isgraph(new_name[i]))
> +			new_name[i] = '-';
> +	}
> +
> +	mutex_lock(&file_priv->name_lock);
> +	kfree(file_priv->name);
> +	if (len > 0) {
> +		file_priv->name = new_name;
> +	} else {
> +		kfree(new_name);
> +		file_priv->name = NULL;
> +	}
> +	mutex_unlock(&file_priv->name_lock);
> +
> +	return 0;
> +}
> +
>   static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
>   {
>   	/* ROOT_ONLY is only for CAP_SYS_ADMIN */
> @@ -610,6 +650,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>   	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_HANDLE_TO_FD, drm_prime_handle_to_fd_ioctl, DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF(DRM_IOCTL_PRIME_FD_TO_HANDLE, drm_prime_fd_to_handle_ioctl, DRM_RENDER_ALLOW),
>   
> +	DRM_IOCTL_DEF(DRM_IOCTL_SET_NAME, drm_set_name, DRM_RENDER_ALLOW),
> +
>   	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETPLANERESOURCES, drm_mode_getplane_res, 0),
>   	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETCRTC, drm_mode_getcrtc, 0),
>   	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETCRTC, drm_mode_setcrtc, DRM_MASTER),
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 8c0030c77308..df26eee8f79c 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -388,6 +388,15 @@ struct drm_file {
>   	 * Per-file buffer caches used by the PRIME buffer sharing code.
>   	 */
>   	struct drm_prime_file_private prime;
> +
> +	/**
> +	 * @name:
> +	 *
> +	 * Userspace-provided name; useful for accounting and debugging.
> +	 */
> +	const char *name;
> +	/** @name_lock: Protects @name. */
> +	struct mutex name_lock;
>   };
>   
>   /**
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 16122819edfe..fc62bb21f79e 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1024,6 +1024,12 @@ struct drm_crtc_queue_sequence {
>   	__u64 user_data;	/* user data passed to event */
>   };
>   
> +struct drm_set_name {
> +	__u64 name_len;
> +	__u64 name;
> +};
> +
> +
>   #if defined(__cplusplus)
>   }
>   #endif
> @@ -1288,6 +1294,14 @@ extern "C" {
>    */
>   #define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xD0, struct drm_mode_closefb)
>   
> +/**
> + * DRM_IOCTL_SET_NAME - Attach a name to a drm_file
> + *
> + * This ioctl is similar to DMA_BUF_SET_NAME - it allows for easier tracking
> + * and debugging.
> + */
> +#define DRM_IOCTL_SET_NAME		DRM_IOWR(0xD1, struct drm_set_name)
> +
>   /*
>    * Device specific ioctls should only be in their respective headers
>    * The device specific ioctl range is from 0x40 to 0x9f.

