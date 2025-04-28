Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9126EA9E9E4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 09:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E771F10E0C6;
	Mon, 28 Apr 2025 07:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4q/c8WBx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2073.outbound.protection.outlook.com [40.107.212.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5032C10E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 07:47:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyqte1fGLoWKHjsS+S83sw2CherXHZM0QewXZ0xEPJjnUGv7a1Mtox9MWJwvNUgeOhkmC9l0pVqmdLaB0U8r6niB73Zo2n1qvF6+kz/Q+acQEbc0+YNy/NAkcuhSCdDzNJQtCBVS3HkOPehy/EymH77Pu4IQmg6RaXSG16LNkOZIaEbMjpbtSc+qyL4x1vZibV2HkEtY1t38+wXS221tOo0YmVJsCftqovcEmPLhdLJ14mYsEu3d2XjT9cyhJqQyTQNxdboY0u0jzu5+4ZkmkGktZHqBrkHA4SsFD9RE7ZNOV3R6rRuEw39yTWOxBF558V21cL9t4zXzLs/rGwqyXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yH4A9/KZ+XeayCMcDIu/1wOK5q73Svb+Tmn8n9sQb8o=;
 b=qQFH3KmOb4lXt6uV1YYKxp9SaoE9+D5ueOUSgW/1NMDX+g6TZl7oUb6YPlS3ZekvIc2MmDFtqMsY1m/MN/Q7/mnUzT/gAEE4TaflXd9MD1S9LHjN6veR53ePo9zdM8fnQ754Bzatj/f60Oxom4oL9/0M63OU+iH3Jj1fKSxkN6WCFBpDN9ut+HCd2CDhhZOB87+kYwXKcn/vTAFxnvpel0lDc1YSdMqIJe5E74tjHEZ2gBBKC2VaorQYqExOnKhwTXcvQXI4pimDNl3dhL6xNjX8yowE+G7X8YfZTdS4JaNTJtwzm1FMF6ihbzPDAUPT67EPnHhltvyif5f/RzFBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yH4A9/KZ+XeayCMcDIu/1wOK5q73Svb+Tmn8n9sQb8o=;
 b=4q/c8WBxAkaFv8Fli6F4kcbm+pQgmDO7y6Aq0IkemsKbUkuDV8Qi8EJCYpoajudwFaxysdas442oGIymXfBTkK+5z5qPhXprLFY6vja7Pchgxgu8aTlEsBOIosm9NlwMxE+C6cmbFmv7053mWAEB2a1N8FJ0MRYwC8xqo9PgDSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8019.namprd12.prod.outlook.com (2603:10b6:8:14e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 07:47:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:47:24 +0000
Message-ID: <d8d3eb50-021c-49d5-9203-ad33a469eae4@amd.com>
Date: Mon, 28 Apr 2025 09:47:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm/xe: drop unused force_alloc flag
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: matthew.brost@intel.com
References: <20250423022920.27701-1-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250423022920.27701-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: eb0af0a4-c3d0-47f0-b1e7-08dd8628e9ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RE5aMFhHN1hjYUJuMlczYjBKVVQvOVhsR0dWR3c1RjE2VFZZclZtN1dvMkUy?=
 =?utf-8?B?WkJia0hHTXk0cVVhTUxkclFXbkMraHNsWVlCRC9senRwRjhnRC9wZnhkb3hN?=
 =?utf-8?B?ZEkxK01UMHZsTUFrdVo0cjdncWx6Z1owemc4VGltbFJKTHgxcG1NZThXZFh3?=
 =?utf-8?B?ZnhyUS9ObmlQS25tUlQyZW92c2dsYkttVm9tOEZ1dU54eHhTVDJVUDQ5YWFP?=
 =?utf-8?B?THdxR0d6L3ZldjYvMWw3R09CVDdUdmxtbGJicVZtTDRnaEpqN3BoVmdUd3d3?=
 =?utf-8?B?dER4R0NUcE5Jbk1KSEIzTHJPdWZtYnZ3d3FNell1b1ZOTWd0cENTMGh3Z0kr?=
 =?utf-8?B?dThlbm9BazRKcUdLVkZQNHlPb29zVi8zOUJtSDRDOXpOVW1TVnJWQnV0SHRC?=
 =?utf-8?B?L0g4UWhIOFp3SWJ1VG8xc2JiY0NldDU0WTd1L3JubTh1RDl2dy9uTUFDelp0?=
 =?utf-8?B?WWJtaitXNTZwN2pkK0t2M3Q1NkFjd2VPUlNLRWFNVUhYckMyMG5RQ3VYRjZm?=
 =?utf-8?B?R2U5SkdQenZFMnEvSHc5eWh0ckgwMHJPRmFFcEVYSGJpRGRTN1FnREgvdS80?=
 =?utf-8?B?NGZ6eElyZzVaZHA0end0L2JhV2hHeVE4dERYbWtCRHNEN3l1WnE5MDhxK04v?=
 =?utf-8?B?SUVqUFBLVnNwWGYwVURLTlNYd2xRYURIQU5LV1NuRTlMWmk2QTJLVEorY0lX?=
 =?utf-8?B?bTJJOEc2Wng1c005ZWl4WEs0QlVSRjVyQjJvNG1STGZiYVFlanI5MUNuUTdB?=
 =?utf-8?B?a2JwQXFpRnNEeEE0UnJ1VW5xRzBTckczTENyOHJxMG9CSk9uUG1UcC92eTFo?=
 =?utf-8?B?MDA4WFM1WEpoeDErOXJYZCtMOExEdHczY3lhSjhOZ3dJWlNqdy9MdUcvL0kr?=
 =?utf-8?B?QWpEM0RhRHpsS096ZzZsY0tQRldGcGsyQmxhUmNOcGlJdm44V3NiekZQanM4?=
 =?utf-8?B?L3JqbGsxNUlRN2s4M24wbHFPYkorTWFYVDAyeCtCS3lxMFo2WHN0dkloaDNG?=
 =?utf-8?B?QzBzOUtmLzdmWnMzMjRxM0FmSklwS3lTM3BSV1NteHF1NzNoTU5XQ3g1VWxy?=
 =?utf-8?B?WUlyeGkzSUdhWlk2OTlMbDRhYkkrV0pITGlVeXhwK2puVmRqZDcxN2lQZ0Rr?=
 =?utf-8?B?Q0JaYWp1NGE3dUg0bjlhUTdaWS9jVEdyazFhd1BVLzRrdjgrVTBJZC9mTHI4?=
 =?utf-8?B?RitFcHJ5cGxCWFNuNzFWMkxlQS9Eb0VEdUlPNnIvT3JCOGNHTE8zekdCM2Vq?=
 =?utf-8?B?SFFwd0RWdEVFN1BlWStneWNOSlpGcGo0L29hN1RPcEw1TGdYRU03cFFSR0J3?=
 =?utf-8?B?T3VFTW9xdjdLcllsNTdMS0xtcFVBYlhaK0ZzeGV6R24zOGlmdGpYNElRdlow?=
 =?utf-8?B?MDBQQ1RWVXh6NUNDejA3bGEzVFBQWWZmRXBKNEc2Y2RiY0JFYUtxMjJaRFgw?=
 =?utf-8?B?Q0VaU3dqLy94VjU2bmUyYXUyOE10d29ncm5VZXljVkRpNnpkdDVudWZ5Tldq?=
 =?utf-8?B?cFV2NEdUb0p1YWVnWno2c3kwNlJ4V0hieDFQVk5mbzBndXcrbjdReU1qaWtr?=
 =?utf-8?B?bXdudVdadzcwYVN4b1FLdUZ3M3Fubm03THEvVFdjd28vTUdLaWQ3TWZEMHlJ?=
 =?utf-8?B?TU1rVVdmOTQ2SUpXSEhWazRQc2duYU1YRHQ2N1NLb1NYOFFCcjhvWUduOGZJ?=
 =?utf-8?B?RTRtSks1ZU1vSnpnMjhpSFl0SmZWZ0tZazhSVXRGVzA1NDBidmxSWWlSM1di?=
 =?utf-8?B?VnJBbm5OdkIrNkhMR1BGYXRNL2NXVi84Rnl0UHJVcWN6S1pRbXNKdXJtVlha?=
 =?utf-8?B?bzk4bnhLZzVRSTF2b1ZNa1h5eEFQNXZ5UWx5QU9xK3BnWnMzbEtnbHZBcVVv?=
 =?utf-8?B?N0oySVh0MHBVNXhXM0Z4YVNiOHFhanp2ZEdWVU9oSmVnOXpKTXkxVGNoSWdY?=
 =?utf-8?Q?ybcIQEbJsHg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFVGUFFhWjdPTUxoOEpGdFlic1NGMU5RSHpENkVpekVJQm1FcWYxemZSNnNH?=
 =?utf-8?B?L1FhTTZYdkkvRnpWUmU2WXJRblExUWVhOG1nRWZGRmJrOVppaG40Rng1RlY0?=
 =?utf-8?B?c1hRREZVSkpMSkhvZ3kyTU4yd2xjR2pXQVlPbzVNNTlTV0plcG5kamszamxn?=
 =?utf-8?B?SnI0Z0ltUEk1a0Y1bFZoM0ZObFdjNS84RzlXdFIvVzdoTDRmK0cyT3ZtVEdQ?=
 =?utf-8?B?V1J5ditiTTNqNmp0YVN1ZUxUbXVMZ0F1OFhqMXZHYW9reEtzejlxRjNGNitV?=
 =?utf-8?B?WFhKUGJTb05wUGdyb20vOTBnT0hNU2hZQUVhRGZhSEk4NG4rRCtybmJDQytZ?=
 =?utf-8?B?ZDhuMXordUxzMnNnZVA0K3JoU2pia0lwZTlraWo0cjRRNFhKM2NiMnUyTk1v?=
 =?utf-8?B?TWt5d0Jud1l2Z0k5dHZOaU5pQlNWWU5wbFBFTjVhOStVNW5pQUVweER0Rzhy?=
 =?utf-8?B?b1haN3ZqMFd5TmVQVzVkaW5ZOHBnZHJlMkE4bnBDa1hRTWVGblVHWExkektT?=
 =?utf-8?B?Ryt6TWdRMTAzcVhreWNicHMrS09LQWZkZTZZUCt1NDQ3K0Q5QzZ5WmVvME9n?=
 =?utf-8?B?SzRJV29DbjV0ekJzdUluV2FreFJIcCtUazBtcGlLVzhBRm8yLzVjNFZwZUpK?=
 =?utf-8?B?cTBLVlFzemtZTkhtTjJJQUJORTFhZ0RpNkU5emgyd2VlcE9hclB4Rm9Ha2ll?=
 =?utf-8?B?am9tdGQwcUtSMS8yWnk3cHgrWXJ0dFR3eCtXbjRBSlkzb05lcmZ3MVMwMk5I?=
 =?utf-8?B?dDE5cVN2VE1uUFdMNzZNRmgxWTRDeURSWDJxS3RDbWxiOStnOTNKbU1GMmxz?=
 =?utf-8?B?WU9PcXBGSmVnRzltSko1UG9pSGd5ZG1HUm9mRjV1azdUMW9lVXZjQkhmMEU5?=
 =?utf-8?B?dWp2c2psSWVTcjhmcnNRNzZtS3dWbzQrdDdxYUduV0FHc1ZCSHFia1dudVY2?=
 =?utf-8?B?ME5QZHRrWFowWFpIeUVXNkR0dERxdmJCZHh2ajFUWGZQYzdDMEZac2ZNRmdp?=
 =?utf-8?B?MWxWdlZ2eEVJaHJBYkFPU0kxeitMemNBNDlGNzYrNW5MTzhWYURXdDBBeGlI?=
 =?utf-8?B?UlBlYU9Cb1lMdzlMUkJQdnZhaFZQR1ladjJ3aEpTKzZCUWFlSDFLeWJqbHYx?=
 =?utf-8?B?SGN1d1JYZTF0b0tBMHB5eThYSGRSeTRRaXI5eUxwTlJNNENxNXRHVnZUWGth?=
 =?utf-8?B?NUFyMFBNNWpPV0Y1WUlXdHF2NTcyc3BGODNUSFVBZ3RvNk1DTUdQN3hpU1Iv?=
 =?utf-8?B?bmNnNldpdVBBZmtydGxmdlh4eEhLVlRlN2FBdkJQekRpM2FrOUFsL05rYTJ4?=
 =?utf-8?B?MytpTE54OE1ydkVFUHdrb0FtUDJwaEVGTTNWMlc1b3VmTFp0eEtCRFRwYjRp?=
 =?utf-8?B?QkFBL2luVElLWjRuZTIrZnhhUVVRdXJSSVR0aXVKSnduL1MyLzhvQ0hGc0o2?=
 =?utf-8?B?Z1pLSEw4Zm1iNWNHRWZKWitSNWp4Z3V1WWx6aTgxdkJKNldySjJyWTFZeklM?=
 =?utf-8?B?RTRJdUREVm5OaUZVL3VHL0wvc3dKNVd5eTlPb0cxVGR0eWJQOW1TQmtRZGNr?=
 =?utf-8?B?b21jRHVSUkRDWTJaVDI4eFBMVnU1KzcvK2tKYktjVXpGQmpxNllHSVdSL2x1?=
 =?utf-8?B?NkQ1bXpkekxEZHNacThSdkk5dTZqTDBCRW8xN0k3TjByUUUremhXZEhLQndz?=
 =?utf-8?B?M2FTM0NQbXU1UzN6b09tUXljN0JLMGVRaEozdHc3YmJIMXN1QlltSkQrcmtG?=
 =?utf-8?B?dmhhOTlFZjFHYTdpc1FYZGlpWnMxMlUyUS9uSC9sWkJib0RJMmRkUFBkQ1lM?=
 =?utf-8?B?cUhiK280UEhjU1l5NEY5dnlHZnIyTnRRZFR3ZG85U0RST0o0cmFYUERmMDlz?=
 =?utf-8?B?ZXVreC90MTBZTFArb2JIQ05Ya1lzeTVtZVY1dXBacWZ0WGt0UVo3Y0g1V0Zh?=
 =?utf-8?B?a2NseGYwdkpXc2pzU0lkRUErTXdYQnVFRkcyMHNBeUpsRjJQVXFFOVhCTXdI?=
 =?utf-8?B?a3VqWFdST1IxbGhXT1cxSFBPckxEbmVFT0VaOWp4SHhWdHo5d2Jta245ZEMy?=
 =?utf-8?B?eWFJaGdCK1dZNWpBcjVlK2Rsd1YvSmljSXE1V2N6ekFHK2d4RVpMbVRLM0lo?=
 =?utf-8?Q?73gE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0af0a4-c3d0-47f0-b1e7-08dd8628e9ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 07:47:24.0647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTbWdWHo5YPzTdwBVPM+tAaUbv+ZwhVVF24sqEOzZWzUnM3jsfXue5kH3e+S4v2c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8019
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

On 4/23/25 04:29, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This flag used to be used in the old memory tracking code, that
> code got migrated into the vmwgfx driver[1], and then got removed
> from the tree[2], but this piece got left behind.
> 
> [1] f07069da6b4c ("drm/ttm: move memory accounting into vmwgfx v4")
> [2] 8aadeb8ad874 ("drm/vmwgfx: Remove the dedicated memory accounting")
> 
> Cleanup the dead code.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c    | 1 -
>  drivers/gpu/drm/ttm/ttm_resource.c | 1 -
>  drivers/gpu/drm/xe/xe_bo.c         | 4 +---
>  drivers/gpu/drm/xe/xe_bo.h         | 2 +-
>  drivers/gpu/drm/xe/xe_dma_buf.c    | 2 +-
>  include/drm/ttm/ttm_bo.h           | 2 --
>  6 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index a194db83421d..bdfa6ecfef05 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -220,7 +220,6 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>  		struct ttm_operation_ctx ctx = {
>  			.interruptible = true,
>  			.no_wait_gpu = false,
> -			.force_alloc = true
>  		};
>  
>  		ttm = bo->ttm;
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 7e5a60c55813..769b0ca9be47 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -548,7 +548,6 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = false,
>  		.no_wait_gpu = false,
> -		.force_alloc = true
>  	};
>  	struct dma_fence *fence;
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 64f9c936eea0..32a5a6390f62 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2759,19 +2759,17 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
>  /**
>   * xe_bo_evict - Evict an object to evict placement
>   * @bo: The buffer object to migrate.
> - * @force_alloc: Set force_alloc in ttm_operation_ctx
>   *
>   * On successful completion, the object memory will be moved to evict
>   * placement. This function blocks until the object has been fully moved.
>   *
>   * Return: 0 on success. Negative error code on failure.
>   */
> -int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
> +int xe_bo_evict(struct xe_bo *bo)
>  {
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = false,
>  		.no_wait_gpu = false,
> -		.force_alloc = force_alloc,
>  		.gfp_retry_mayfail = true,
>  	};
>  	struct ttm_placement placement;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index ec3e4446d027..1a3734d9f8be 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -271,7 +271,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res);
>  bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
>  
>  int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
> -int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
> +int xe_bo_evict(struct xe_bo *bo);
>  
>  int xe_bo_evict_pinned(struct xe_bo *bo);
>  int xe_bo_restore_pinned(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index f67803e15a0e..f06961575d8a 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -236,7 +236,7 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
>  	struct drm_gem_object *obj = attach->importer_priv;
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  
> -	XE_WARN_ON(xe_bo_evict(bo, false));
> +	XE_WARN_ON(xe_bo_evict(bo));
>  }
>  
>  static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 903cd1030110..cf027558b6db 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -172,7 +172,6 @@ struct ttm_bo_kmap_obj {
>   * @gfp_retry_mayfail: Set the __GFP_RETRY_MAYFAIL when allocation pages.
>   * @allow_res_evict: Allow eviction of reserved BOs. Can be used when multiple
>   * BOs share the same reservation object.
> - * @force_alloc: Don't check the memory account during suspend or CPU page
>   * faults. Should only be used by TTM internally.
>   * @resv: Reservation object to allow reserved evictions with.
>   * @bytes_moved: Statistics on how many bytes have been moved.
> @@ -185,7 +184,6 @@ struct ttm_operation_ctx {
>  	bool no_wait_gpu;
>  	bool gfp_retry_mayfail;
>  	bool allow_res_evict;
> -	bool force_alloc;
>  	struct dma_resv *resv;
>  	uint64_t bytes_moved;
>  };

