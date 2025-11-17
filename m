Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5417CC62EE7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 09:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91EA10E2F6;
	Mon, 17 Nov 2025 08:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k1fXMnjx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013017.outbound.protection.outlook.com
 [40.93.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75CB10E2F6;
 Mon, 17 Nov 2025 08:42:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4b8fRn1l8VwNQEPXHTawQvFSuts6yEJLZrxz8PziTjmJhLDHwV2JYu0FAij3EAj8Pzhhnu9t7q03oqPowxk5r8utAykhKSiWZY6BH5/Cm7SqIdU1FcmipZzm2aRrwVxmsNn/joKSdqYTUopQCYrEydW+Lo+LT4tXVJilJjVb+EF3aOcZjol3fOehxggsVmt5B1+6Lput6wAn/EUlu8D6QUSul4RkEQD2kT9/l3UFGWzdCNHz8DEY7+oWOj8sL84jgN51yx0aeTQlKacrm4/6fgnB7uCmGn8OgZMmNKQzkQzy0Pj746X+e38Evy5hq+zesSCwCmmcRTULrm+KCNWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1myLLszuYrx11Q0UJ9rd0Nqf3tIq0Stid+/icpBSows=;
 b=Lddu0/SL54aUoNTZPqAlTP2npicFcn4nqHT8WP6rsAB0/y5AM/7mfncBHHKLSMOlwNokW/DZqlENbMnn7svdwOR3wqBZDFWoeKJHsjvzHZhDpHMtRinx6DK/4FAsf+ifVScESeTJ36AOq4IFsbAXVi50mD+MWNOAPAw2dsAVj8JEGJ6ALPkdbf36roS95IBbQWTzWA7s1WzDSgGpkeyFoOxs2AmQDDyensTtYjMx6MVTcja4LFAfiYZ8e4BqDScF1W8uDQ2SZzW02csGvqagnheib8JnVE8l1FcCupl28H3SJKyxOEFWvzOo0f7z5y2VymiaAtAw4+wdboWXG1jJYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1myLLszuYrx11Q0UJ9rd0Nqf3tIq0Stid+/icpBSows=;
 b=k1fXMnjxyeLxxGtnWlrs3mhKdnPWb0pkVyU5qe08JalZ6eri6bWhjHcsMUfqDniiNZ9cSaWGZ2ot6YhiPf9ikg3eDqcAHJj6dGcSjBG/pUU1Rnk2RvQabg5TVBbnPze7ENC6DUIpHnK1i4RUp+ECHEtRTJ5amE3m7HqMrxYBRFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by LV8PR12MB9084.namprd12.prod.outlook.com (2603:10b6:408:18e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Mon, 17 Nov
 2025 08:41:59 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 08:41:59 +0000
Message-ID: <a626f09e-62d0-450c-96d9-534251ed3377@amd.com>
Date: Mon, 17 Nov 2025 09:41:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/20] drm/amdgpu: allocate multiple clear entities
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-8-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-8-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:408:ff::18) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|LV8PR12MB9084:EE_
X-MS-Office365-Filtering-Correlation-Id: 115467cd-557d-4a4a-2e37-08de25b52ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEdybnlGalhlY25rZXRTWnhJT2gwc04yNk8xZFV3WWFUQk5IOTN2eklSL202?=
 =?utf-8?B?UUVBRVpnM2g0YkZUdmh2cVBMVWp5QnZLZGZBUjZxM0pMcmZHVjVMMG04MFBp?=
 =?utf-8?B?dUViY09uOUdnbW4rOEo1QTZubFN5YWxkaGxOZ0NhMGNEM2F6YzYyY0wxbkNQ?=
 =?utf-8?B?cURJVnRGM21ZdUlSWGV0SzlKcitiMHdoVjNIVUpDWE84bE5tQnhBYk5VbHhl?=
 =?utf-8?B?Z0Q0d2xla3hVdGNPOTMzakhQbXFtSyt6UGcvUm94SFdrNnhQd3NxQWpldUp4?=
 =?utf-8?B?TUlOQmpqMVQrR1gwUWpKWWVUUXhQR1RmMzk0bTFUTWw1R3czbEtpbGx5Znl2?=
 =?utf-8?B?aHhtSGMvWGZseEgvQStIYUdHNE1BSWNBRWJlblJCaldCdGNpVmpPZlp0L1J4?=
 =?utf-8?B?K01YRm1xMTRWUlRNR0F4TWFRcURjd29MNnd5RXU4WWhQd1l0SlppUWJiOGtM?=
 =?utf-8?B?VUthTTNVdWNseUlCRTJnZEVoTEhROXZPNzVUZnV1NmdmdjMvZFY5SXU1YlFq?=
 =?utf-8?B?YkRTNE5SU3AvTXRTT0toVWJvN3BKeGR6V09xNldjOU9rVVZzUmZncmp0OGxh?=
 =?utf-8?B?Z2VKd2x0UXJPMFJxTjRMUGo5S3NCOVdNdjNoYllUTG9OL3k3UXUrMkxwM1NV?=
 =?utf-8?B?d2VILzhUUGpnb3Z3c1VERGRlTzNsUG5SNlFpZnprdnVCV1dMa0VVOWdIc0d1?=
 =?utf-8?B?R3VJcTJ4ZmdSekhmVzNEalJqc0ZaZDVQOERmSTZEcTUwS1dHM0l2bFlKMkww?=
 =?utf-8?B?bXM0c1ZmS0FZRnBZV0lUTVRYNm03eEhscG10YjBKODVzaGYwWTdzQzJZR2hQ?=
 =?utf-8?B?Ynh0N09EcEMyTHpwM2JiRGN6L2ZhTUErSkNOT0VSeXl4RVlRb3BqRnlveHV1?=
 =?utf-8?B?QjRMS3FGSDl2dlA1K0U5bXhuQ0R6OGsvRGlBSkVXUGY4K0F4d0FTWmN2THRy?=
 =?utf-8?B?d2MrandpbjRUc3NWNU04WjNYNm5Ud2NnaUlUcGppVGo3ZTVHRThHUGRVTzVQ?=
 =?utf-8?B?dW9CL2RKVFN5ZFNOeU1Ob3dCcWpxbW03V0phR0lyQnVEMEdkbUtUeitWK2pp?=
 =?utf-8?B?ZVZneXY0Z3MvMlhjc0JHakU2UXBXRFlKeDByb3hDaklCY3UxTExXNTduUmNZ?=
 =?utf-8?B?WUd0eTJ4MWxraHNpU2dZZzdycVJTVnpLaElzWmdTblJlQWQvNXRzL1BLZUhV?=
 =?utf-8?B?OEcxbkpMenhzcVl6aDBhL0gzR0JRQ3Z0bXRvUE5GL1Y2dWY1SnY3eWdVejMr?=
 =?utf-8?B?MVdsZThnR3hjQzBqRnhKSXA4WHNGZjRwMnJ2SmFSVlZEenhUZXlWbThVWTA0?=
 =?utf-8?B?N3RPZytZZkcyV2N5L2NLU3hETHc5cnFOV0EvdVB0V1BYZlJUMkY3eFVhcnhE?=
 =?utf-8?B?VHJRS3UzZWE1K0dkMDNsWnhRWUN5R2dZNE45STFWQTlPclVKNHlSbjJBSDQ3?=
 =?utf-8?B?Nm5IeXYyVWdNM1kzQ3grQlRLem5yVEtkVzk0TElSZTZUc3JtUzEzQVlUMEQz?=
 =?utf-8?B?Q3RTY2Exc0dkaU4wcHpSOTdpWHJvSEx2c2EwM0d3WXRmYkRvbEtnNGxqUDdv?=
 =?utf-8?B?d0tZbmdQcUlENFNRSndMc3RkeTh2YTY4UkhTYjFSK2J6T3dDbHEzbWVSVmJw?=
 =?utf-8?B?UFFxMkUzb1FlTGpzbjg3Z3MzUVpKOENzNGpuVWgzT0FHMTJMTEQxT09TSGVn?=
 =?utf-8?B?bVQrTVQxRUhkM2EwTTNodzl2bkhXZWY0RjNEUzlLeStEOWZhajdVQ1hCT1FT?=
 =?utf-8?B?bnBHRDVTaXVPb29sSkxRZ255WURSaTA5aUlwdjVCSTV2d0RPV1F2T0x4eE5i?=
 =?utf-8?B?OUcvcC9hSmFqZWtucFg2M2lRZFRqZHlPWjgrb2I4Ym1ZZytIN0JyWDY4KzRY?=
 =?utf-8?B?QVAvZEZsREFvQ0p3SjE3RUc0dnRKTndFdjZXbkM3U2pGWTNQRlNOeUpNdkFi?=
 =?utf-8?Q?rnUYhijs2WHWdHwiBODk3j/ST98VNG1t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmpSc3NJTGJBRCtFMUpyTjBXdlRzQ0dSMmlYQWpuRlFjZk1ycFFzdVl2UDFC?=
 =?utf-8?B?bVhmVHcvTjc1UHE2empheXJURVlSQmNmVjROdUlmbENHUnkvOFJRNlVNRDhZ?=
 =?utf-8?B?a0NLZ1VEMUFyeFk2WVRhTkZ0cEQ0bDdLc1lMK1pFTTRZT3hPZy9OSGZ0d093?=
 =?utf-8?B?THErV2kxeXFjUHNKQ2Q3TzB5U2NGWHpUUUEvYWdTaGVvbHlINzNEMno3Tm1Y?=
 =?utf-8?B?dVlQRDJOM09FRlZRaldKZGc0VmFBYlpaV0ppOXFZYzhwNEVkQXdPeFBZQzR6?=
 =?utf-8?B?NEMwZ1pJZS81KytjbzAyUjdOZm5iU1R3OUJsQ01MSjc5dU82Ny9QQVNudXov?=
 =?utf-8?B?dUF2RENlL2ZOS0pyMitlTHR4eFBsdVBzOWMxR1l3TU9ISTdaMW0yQjVCaGVt?=
 =?utf-8?B?bW5xVWtSRlI1cFlPQUdZWGRMYjU1Rzk3K1VHUmFiQ3NYMmRrWGVGWnJpN3p2?=
 =?utf-8?B?UFVXQWdYT1gwamR2Zm11Z09wL3d5djZGcmFOZ2JPZFZtT0VxTWZucVloY1pL?=
 =?utf-8?B?V3hjV1VVYit6ZWJrR2t1dDl2UG5wdTdPU2VaNURmekR6bEVtc3RKU05uVTJq?=
 =?utf-8?B?Yk5hUTJTRjhVL01pUllUejVLUXBlamJzbERqdFpFRUExUE43RTNtcjRvVTF6?=
 =?utf-8?B?NkpTaVNVQ1kvMHJ4ODdDR21mZlhnWW40YWJmWEF2Z21JNXVVdTVGWkhoNnVn?=
 =?utf-8?B?UXdZcHpLSzNlZVpYMlQrcnV4bjhld1pHSG9zUzdXL1FyNTBabThpVTlDWWov?=
 =?utf-8?B?OHJyMGZHdDIzZ3lZMDlJNC9mdGp1aldLWGtUcG5hTFBIYlV3MUdPU01rVGVo?=
 =?utf-8?B?RWFKY3RscWpHdk15aDg2czRwYWkzZlY0c3FpcDRyNC9mUG5XOTUwSEhMWmFS?=
 =?utf-8?B?cmxWbytqZkFpSmpIVWJ5ZG96d3VvWU9kTGJiWFlIQzRGd1dFQ0JFalRYKzRS?=
 =?utf-8?B?TlQ1bUFvU0k1SS93MlduZDloaUJzaG1sTkpHSlF5ei9qRWIwMURQVTdrREpr?=
 =?utf-8?B?NlcrK3RvV0hLVVc3c2FTaENFZlJGaXVUNUxQeSs1L1dOL1N6QWlPREdNdldW?=
 =?utf-8?B?RU44UFBtTHFNcmg3eGcxaS9EU1hIQ093VGxnNWphR1Y1dTFIU05Fd2g4MWtQ?=
 =?utf-8?B?SXNlTGZHSFgrcnpmNHA4MzcyRnRmNVBjb2NJUUwyMnM0NzVUZmpuNWdUTFNC?=
 =?utf-8?B?MnpranFvb1Fqblo0VVBOUUFmSkdmM2FValZUM1EzdkFoM0pnWjBpaEN5bWlG?=
 =?utf-8?B?WE8yQ1htUDg0SU5lSXRTNncvV3loVTYzUmtnd3IzWVhmK1ZHd2hISWozdTVF?=
 =?utf-8?B?Tm5peGhmMkpHMHZ5emdzYlhJMlExNWtqQ25oK05nSDV1WWpsS3BINTBFTVlQ?=
 =?utf-8?B?RkRyNXllZ0c0dytacUUxVWt5eXJ0bWRIQjNmRHowaE5nTHFSNm10dytKdVpR?=
 =?utf-8?B?OXdDNThVVW9QaEhLRy9GSWFkMnJFeURBZnY4KzVzNVBSWVVmWGViUWx3RC9E?=
 =?utf-8?B?ZFk3UjlzYjBXQ0NPV0R5ZTBOQllMOGNlbi9Tc1dKeUM1ZHQxMURVL2hoUWtn?=
 =?utf-8?B?K3dIYWZaZ29mVjhKdGVwdTB4N3lxOW9QcFhGYjROZjRsUFMzcXBxUFFBOGVY?=
 =?utf-8?B?QnRaaFhUNisrZlZuREszVmVCcWtzem1rdHJkMXJjUXJCQ29uOExPc0owWXEr?=
 =?utf-8?B?QVBnSDdFVWhMOEhUUEJkV3N5WHlFeXJ6NGhqWXV1Q25YRjV5THorSC9pMnp5?=
 =?utf-8?B?Sk80aWVjUEZCYnhrY0h1bm1WcG5RY1QzM0xZejhwOU41RkhaeDVTam1jNldF?=
 =?utf-8?B?V3cwZGdrcCtORENmTFVSRWpKQzllYW16L2I3cmNlRTZEUk4zZ0V1YnNQdDh5?=
 =?utf-8?B?SG0zeHZmdjVzSG9HTlQ1cFFPdGRETGpINXY4VDh6dWdJZW9NTmNZUTlQUXA1?=
 =?utf-8?B?QzlGeXI0bUpCQXV0NENWakEvdXdWa1dRUks2QmoxVVdwK0RvRUhLaittWUlr?=
 =?utf-8?B?M3ZoMld1bUxOWWF3cjA3SFByTjRwaUk4Qlo4TFNHK0ZRRXYyK3V4NjRTSnBI?=
 =?utf-8?B?M3pRZ3dEZ1dhWkxici91YUlVeHB3SVFoU2VVWDY4UVZEZGRPK1pBNWRVS3Q1?=
 =?utf-8?Q?pdEw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 115467cd-557d-4a4a-2e37-08de25b52ba7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 08:41:59.2139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqF1O7q8a7I91qZkbl2dyLmJGqnMwgxHWQKjLtEY6naP6tS4TyeaF7sGW60oQJQT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9084
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

On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
> No functional change for now, as we always use entity 0.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c     | 11 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c |  6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 76 +++++++++++++--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     | 10 +--
>  5 files changed, 66 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 2a444d02cf4b..e73dcfed5338 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -655,7 +655,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
>  	struct dma_fence *fence;
>  	struct amdgpu_job *job;
> -	int r;
> +	int r, i;
>  
>  	if (!hub->sdma_invalidation_workaround || vmid ||
>  	    !adev->mman.buffer_funcs_enabled || !adev->ib_pool_ready ||
> @@ -686,8 +686,9 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	 * translation. Avoid this by doing the invalidation from the SDMA
>  	 * itself at least for GART.
>  	 */
> -	mutex_lock(&adev->mman.clear_entity.gart_window_lock);
>  	mutex_lock(&adev->mman.move_entity.gart_window_lock);
> +	for (i = 0; i < adev->mman.num_clear_entities; i++)
> +		mutex_lock(&adev->mman.clear_entities[i].gart_window_lock);

Ok, that here makes not much sense but I already pointed that out on the other patch, so let's discuss there.

>  	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
> @@ -701,7 +702,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>  	fence = amdgpu_job_submit(job);
>  	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
> -	mutex_unlock(&adev->mman.clear_entity.gart_window_lock);
> +	for (i = 0; i < adev->mman.num_clear_entities; i++)
> +		mutex_unlock(&adev->mman.clear_entities[i].gart_window_lock);
>  
>  	dma_fence_wait(fence, false);
>  	dma_fence_put(fence);
> @@ -710,7 +712,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  
>  error_alloc:
>  	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
> -	mutex_unlock(&adev->mman.clear_entity.gart_window_lock);
> +	for (i = 0; i < adev->mman.num_clear_entities; i++)
> +		mutex_unlock(&adev->mman.clear_entities[i].gart_window_lock);
>  	dev_err(adev->dev, "Error flushing GPU TLB using the SDMA (%d)!\n", r);
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 0760e70402ec..3771e89035f5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -269,10 +269,12 @@ static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
>   *
>   * @adev: amdgpu_device pointer
>   * @gtt_size: maximum size of GTT
> + * @reserved_windows: num of already used windows
>   *
>   * Allocate and initialize the GTT manager.
>   */
> -int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
> +int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size,
> +			u32 reserved_windows)
>  {
>  	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
>  	struct ttm_resource_manager *man = &mgr->manager;
> @@ -283,7 +285,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>  
>  	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
>  
> -	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
> +	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * reserved_windows;

Probably best to separate this change out into it's own patch. E.g. something like "remove fixed AMDGPU_GTT_NUM_TRANSFER_WINDOWS"...

>  	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
>  	drm_mm_init(&mgr->mm, start, size);
>  	spin_lock_init(&mgr->lock);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index c06c132a753c..e7b2cae031b3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1321,7 +1321,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  	if (r)
>  		goto out;
>  
> -	r = amdgpu_fill_buffer(&adev->mman.clear_entity, abo, 0, &bo->base._resv,
> +	r = amdgpu_fill_buffer(&adev->mman.clear_entities[0], abo, 0, &bo->base._resv,
>  			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>  	if (WARN_ON(r))
>  		goto out;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 7193a341689d..2f305ad32080 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1891,6 +1891,7 @@ static void amdgpu_ttm_mmio_remap_bo_fini(struct amdgpu_device *adev)
>  int amdgpu_ttm_init(struct amdgpu_device *adev)
>  {
>  	uint64_t gtt_size;
> +	u32 gart_window;

Make that num_gart_windows or reserved_windows or something like that.

>  	int r;
>  
>  	dma_set_max_seg_size(adev->dev, UINT_MAX);
> @@ -1923,7 +1924,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>  	}
>  
>  	/* Change the size here instead of the init above so only lpfn is affected */
> -	amdgpu_ttm_set_buffer_funcs_status(adev, false);
> +	gart_window = amdgpu_ttm_set_buffer_funcs_status(adev, false);
>  #ifdef CONFIG_64BIT
>  #ifdef CONFIG_X86
>  	if (adev->gmc.xgmi.connected_to_cpu)
> @@ -2019,7 +2020,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>  	}
>  
>  	/* Initialize GTT memory pool */
> -	r = amdgpu_gtt_mgr_init(adev, gtt_size);
> +	r = amdgpu_gtt_mgr_init(adev, gtt_size, gart_window);
>  	if (r) {
>  		dev_err(adev->dev, "Failed initializing GTT heap.\n");
>  		return r;
> @@ -2158,16 +2159,22 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>   *
>   * Enable/disable use of buffer functions during suspend/resume. This should
>   * only be called at bootup or when userspace isn't running.
> + *
> + * Returns: the number of GART reserved window
>   */
> -void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
> +u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  {
>  	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
>  	uint64_t size;
> -	int r, i;
> +	int r, i, j;
> +	u32 num_clear_entities, windows, w;
> +
> +	num_clear_entities = adev->sdma.num_instances;
> +	windows = adev->gmc.is_app_apu ? 0 : (2 + num_clear_entities);

Hui? That doesn't make much sense.

>  
>  	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
>  	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)

This also doesn't make much sense to begin with. Why are the SDMA functions disabled when is_app_apu is true?

Regards,
Christian.

> -		return;
> +		return windows;
>  
>  	if (enable) {
>  		struct amdgpu_ring *ring;
> @@ -2180,19 +2187,9 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  					  1, NULL);
>  		if (r) {
>  			dev_err(adev->dev,
> -				"Failed setting up TTM BO move entity (%d)\n",
> +				"Failed setting up TTM BO eviction entity (%d)\n",
>  				r);
> -			return;
> -		}
> -
> -		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
> -					  DRM_SCHED_PRIORITY_NORMAL, &sched,
> -					  1, NULL);
> -		if (r) {
> -			dev_err(adev->dev,
> -				"Failed setting up TTM BO clear entity (%d)\n",
> -				r);
> -			goto error_free_entity;
> +			return 0;
>  		}
>  
>  		r = drm_sched_entity_init(&adev->mman.move_entity.base,
> @@ -2202,26 +2199,51 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  			dev_err(adev->dev,
>  				"Failed setting up TTM BO move entity (%d)\n",
>  				r);
> -			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
>  			goto error_free_entity;
>  		}
>  
> +		adev->mman.num_clear_entities = num_clear_entities;
> +		adev->mman.clear_entities = kcalloc(num_clear_entities,
> +						    sizeof(struct amdgpu_ttm_buffer_entity),
> +						    GFP_KERNEL);
> +		if (!adev->mman.clear_entities)
> +			goto error_free_entity;
> +
> +		for (i = 0; i < num_clear_entities; i++) {
> +			r = drm_sched_entity_init(&adev->mman.clear_entities[i].base,
> +						  DRM_SCHED_PRIORITY_NORMAL, &sched,
> +						  1, NULL);
> +			if (r) {
> +				for (j = 0; j < i; j++)
> +					drm_sched_entity_destroy(
> +						&adev->mman.clear_entities[j].base);
> +				kfree(adev->mman.clear_entities);
> +				goto error_free_entity;
> +			}
> +		}
> +
>  		/* Statically assign GART windows to each entity. */
> +		w = 0;
>  		mutex_init(&adev->mman.default_entity.gart_window_lock);
> -		adev->mman.move_entity.gart_window_id0 = 0;
> -		adev->mman.move_entity.gart_window_id1 = 1;
> +		adev->mman.move_entity.gart_window_id0 = w++;
> +		adev->mman.move_entity.gart_window_id1 = w++;
>  		mutex_init(&adev->mman.move_entity.gart_window_lock);
> -		/* Clearing entity doesn't use id0 */
> -		adev->mman.clear_entity.gart_window_id1 = 2;
> -		mutex_init(&adev->mman.clear_entity.gart_window_lock);
> +		for (i = 0; i < num_clear_entities; i++) {
> +			/* Clearing entities don't use id0 */
> +			adev->mman.clear_entities[i].gart_window_id1 = w++;
> +			mutex_init(&adev->mman.clear_entities[i].gart_window_lock);
> +		}
> +		WARN_ON(w != windows);
>  	} else {
>  		drm_sched_entity_destroy(&adev->mman.default_entity.base);
> -		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
>  		drm_sched_entity_destroy(&adev->mman.move_entity.base);
> +		for (i = 0; i < num_clear_entities; i++)
> +			drm_sched_entity_destroy(&adev->mman.clear_entities[i].base);
>  		for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
>  			dma_fence_put(man->eviction_fences[i]);
>  			man->eviction_fences[i] = NULL;
>  		}
> +		kfree(adev->mman.clear_entities);
>  	}
>  
>  	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
> @@ -2232,10 +2254,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	man->size = size;
>  	adev->mman.buffer_funcs_enabled = enable;
>  
> -	return;
> +	return windows;
>  
>  error_free_entity:
>  	drm_sched_entity_destroy(&adev->mman.default_entity.base);
> +	return 0;
>  }
>  
>  static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
> @@ -2388,8 +2411,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  
>  	if (!fence)
>  		return -EINVAL;
> -
> -	entity = &adev->mman.clear_entity;
> +	entity = &adev->mman.clear_entities[0];
>  	*fence = dma_fence_get_stub();
>  
>  	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index f4f762be9fdd..797f851a4578 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -39,7 +39,6 @@
>  #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
>  
>  #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
> -#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
>  
>  extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>  extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
> @@ -73,8 +72,9 @@ struct amdgpu_mman {
>  	struct mutex				gtt_window_lock;
>  
>  	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
> -	struct amdgpu_ttm_buffer_entity clear_entity;
>  	struct amdgpu_ttm_buffer_entity move_entity;
> +	struct amdgpu_ttm_buffer_entity *clear_entities;
> +	u32 num_clear_entities;
>  
>  	struct amdgpu_vram_mgr vram_mgr;
>  	struct amdgpu_gtt_mgr gtt_mgr;
> @@ -134,7 +134,7 @@ struct amdgpu_copy_mem {
>  #define AMDGPU_COPY_FLAGS_GET(value, field) \
>  	(((__u32)(value) >> AMDGPU_COPY_FLAGS_##field##_SHIFT) & AMDGPU_COPY_FLAGS_##field##_MASK)
>  
> -int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size);
> +int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size, u32 reserved_windows);
>  void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev);
>  int amdgpu_preempt_mgr_init(struct amdgpu_device *adev);
>  void amdgpu_preempt_mgr_fini(struct amdgpu_device *adev);
> @@ -168,8 +168,8 @@ bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>  
>  int amdgpu_ttm_init(struct amdgpu_device *adev);
>  void amdgpu_ttm_fini(struct amdgpu_device *adev);
> -void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
> -					bool enable);
> +u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
> +				       bool enable);
>  int amdgpu_copy_buffer(struct amdgpu_ring *ring,
>  		       struct drm_sched_entity *entity,
>  		       uint64_t src_offset,

