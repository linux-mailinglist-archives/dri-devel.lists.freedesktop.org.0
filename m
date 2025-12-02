Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DBFC9B623
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 12:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DA710E637;
	Tue,  2 Dec 2025 11:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vS01kp4a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010016.outbound.protection.outlook.com [52.101.85.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5668C10E636;
 Tue,  2 Dec 2025 11:54:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4j9nZvfqausju5GlrO2F+/tbC5psVHL449WVLyhy08HZXFRHgvHKjOPiQXWG50mUtG7WSrtc3dhSBFAOVp8yO1ZDnLNFDRICh/sD2iwGDmp2EA3FsBiD64qigtWkG7G/E6NmLKMXa9FtrHzI/mxI5L8YQrKD7j/UUymlWI96676HYObuK4L07190bzXFOYQPCnac3gr1oS4VfL8FcyBtEVje10WwtazszeMfO5MgR7yH9BbBOkNDZVlm9zkT6i8HlxZMXgngJrbOQWPgSuawZilqNJwjjQRCI9Z3e30/5LNJHjxysDKhJdUvE7Z86C5Ab/EXf2UqFRixnf8rubnyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yplZAKVY9YaDCJSrAzIwzFocobjlFF/KO5xcSrVla+U=;
 b=drsJkV4HRmVq5vpEnMgqLuo5ki505bJh2wlepKzFAEpV3c2OdndmkBElNSyb/w3wVM6b0P1GiH09gP8WjkvdXzGZVYO9kzzBqMRF4sswFAIcq7cG1k0S70f6gsaAlZ+hxuNrqG8RcJA165l6y+duQWr6hFH+Gfr1JBGevhUU0uwBUEm+mVDJVQ+C68ZH5th+37U2gNsuGqePbR6Ske2SgeQ8TyqCXgw6JxW7GIGLHcBGV7rekWSIybVMf1gHKaMgVumkMt2Ybk3861HbPguzn4fEYVTPNdtz+nglV2yO/JeQCJ0A6JvfkJStYvOZu2qdlad3Fp5wzCEw8I1nn4CVhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yplZAKVY9YaDCJSrAzIwzFocobjlFF/KO5xcSrVla+U=;
 b=vS01kp4aUxNhbFU4GyOxVA17DSpHy2CQEB6izKDNaE9D7kCqWshRXxuMRhwxnxq9R2xPnDeZUPMH+8NpVhtBBWFYIPa+hciJLs0cuHw+xpk70tQHeaLE5ifqyCLcQ+ZxsbQDBZ6MWoxNB1N+CU38dluwgcjtQKjLlCtXN7IIf3I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB9007.namprd12.prod.outlook.com (2603:10b6:a03:541::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:53:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 11:53:56 +0000
Message-ID: <c162195a-d783-4576-b8b6-19057f98bc63@amd.com>
Date: Tue, 2 Dec 2025 12:53:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] drm/amdgpu: move sched status check inside
 amdgpu_ttm_set_buffer_funcs_status
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
 <20251202094738.15614-14-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251202094738.15614-14-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0213.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::13) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d2ebe3-6768-4638-935d-08de31997903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aS95T2ZuTVhRUGhRellLamxtQ1pSeWxsMWNURVc5WjhGd2lwOVVHeGZFWUJX?=
 =?utf-8?B?MmJBNXlXUC9TTzZ6cWN5Q1NsS2JOR3UxdW1LK3ZrNm5KK0lYSklqRGJTTm9D?=
 =?utf-8?B?U3FlN2UwYVhSMFhZZkxhTFMzL0ZWeGlkb3h4UWVZMDRWUzlaQkhKY3hrTGtm?=
 =?utf-8?B?eFNmeFVBc1NueU1GMWVlMS9yTUZjTEJpc0RPZ2hsYURBakh4YlNFZDVtTTFS?=
 =?utf-8?B?NjgwbHBsN2MwRTdHVkUxWTRTc25RQThBYUdqNnJxbGsxTW9pbm1mWkt2dTlR?=
 =?utf-8?B?Z09FaW1UQUVPTGg0L0xKRkFSQnArN3drcXdsVlptTEN4dXJjMlM2UHl3elJ1?=
 =?utf-8?B?NUdaWm1DTHJsK1NQWUhFNmVkYlAvaWNLWnRnZEpDU1k5YUxWcjlCblEvTVBy?=
 =?utf-8?B?a0o4UnJGTG5WOXBWemVMQjNhNUo4V0pMMGlRNEplenZMclFxV3dqMjRVUjJH?=
 =?utf-8?B?WWY2QlgraHpsbmp3aTNKZjIzU3VsaThCbFVyd2tFZVZrcFczdlJSK1ZVMVdN?=
 =?utf-8?B?Zmc4a2NVaFYxOFFVUS8rYjFnQlFFTXJzUit0UThHNWJEd1NRU0tFQmxFOUZ5?=
 =?utf-8?B?RjFQYmVOcnhic3kxZzJwQzhadFBidyt1TjBQaWx0dDB0VmhhT0Fndi9hZHkx?=
 =?utf-8?B?dWs5U3V0djlHYVB2VmtlNUdBQjQ5bCtScHlkSXNnejFtRUNINkJ5WWpUVmxn?=
 =?utf-8?B?NXVkT054RndSYTQrTmxHRHZCSmx2aDZNYmVNbVMySnEwZmFEOVFaSHRRU2dM?=
 =?utf-8?B?V2wvclNLdjg3aWppTStJQ3o4UVFwN25HSkE3bk1tRmkvY1lkam4xdkNuQ3U3?=
 =?utf-8?B?eFpUYlE0dlVQZjdWVEtDNjAzc1ZRdjZwZHg5aFdYVldldGZNSlp6RWszMTBi?=
 =?utf-8?B?TXFWWnI5MElEY2ZEZmdta2N2ZzlDWFVJMXY0ak4rM1EvMEk5Uy8wc0thcy93?=
 =?utf-8?B?cWxaQmtGQ0trQnJHVnpkMmZyK2xZM2g2d0FUWkg3RWF2NUd6TUx5bWRSU0po?=
 =?utf-8?B?YlBKSWN6S29uU3BUUnFWMUJML3NESjBPcS8vNU13TDN2QVVzYjhaeUNnRTN4?=
 =?utf-8?B?aUsyODRzSXh0bTU4azNVVytiQUowWnBsS3NNZVZCRG9zQ0QzMlhNcDU3YXkw?=
 =?utf-8?B?aHEyYjVNWTZFd2RqdklZWnMyTURzdmJaaG9aeDF0ZlFHODQ4c3Zqc0s5R3p5?=
 =?utf-8?B?S29rMVF5SGFiSWV2a1ZpZ29IcnBNRnRFZFI5Y3hMWlVNTlBDOHpXcWt6T0tz?=
 =?utf-8?B?OUd0ZW5kVWE0RUJEU2xDOTVPOFgzVUlGb0FiQ0NsVW5xTm90ZDhpQ3JOcTd3?=
 =?utf-8?B?cWEwRWJ0Q01saGN2UXpDUHg0TWM5QllGOWZkVVMzMzdFeUhkQVBDSDBYdThi?=
 =?utf-8?B?V2l4SjlkYWNKVUs4YWxlbjFDTGVhNjc5TjlWR0xtNlZEWHVnK3BWamlabWQ5?=
 =?utf-8?B?SUpoS3ZuNHNUdk9RTTllemNKNWkzL2tWcW94VjM0UW5jYXd4TTdaMFVGZy9G?=
 =?utf-8?B?UFpJOGNqNDROeFpDeERrT2Noc09TclhTZmZqN0NnenJ4SFR6aXEvelFNUno4?=
 =?utf-8?B?ZG12cW4vc05yMnl1dHNWVTRuVC9KT0J1VlhSbTlHRWdaSXZqVWVrQzlvaTJu?=
 =?utf-8?B?d0VTd0NscG9pck1UcExQNkhzcEJodEN1RHRiU01NVVlNZitRZ3N2ZTVXTkJq?=
 =?utf-8?B?QVl2dFM3VDFSQlpTQVptdXZRckVrOE5Ud0RZVktVQjBEQ3Z6WHdtcmV5OXBR?=
 =?utf-8?B?K3BhS0Y4MGpsSEJzMmlUYmozdzZEajF3c1crVXhGVHU1WE5VenFqb1YwRHFj?=
 =?utf-8?B?bU5kUFRlbVEyYitISDN1M3RBTG5OR3JWWklMSlVHL1FuTjhXMXZsUkphSUdy?=
 =?utf-8?B?LzIxZnhkeVFvU212Q3Y5dDVPa1VHbWdCNWx5cnI5R3ZoVVBsUWIxUjJhSjFn?=
 =?utf-8?Q?ec5QDCDJxURr5DlBnSVPlWqEqzSdAPbL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTlKUG5yWVNLUmxzZU1Dc0xsN216MUNjY3VHWXVrUmRMeWxlblpTRDdvZ0Ru?=
 =?utf-8?B?KzRodnIzeUZ6cW9pVnRjKzdKUFE3MjcybDh2Z3VXR2xHcVZFY2RBeUU2NTlV?=
 =?utf-8?B?MDFvSGtvb3RPT1RBTnBIY1FCTWlQRTJSSUVBRi9Wb2Nud2lEcnlINTNEKzBm?=
 =?utf-8?B?UHptc2hJUlI5NWFoSHZjbDRLNjBweUM3bEZ2Q3U2MWtodGhxWEU3VDh3ZzNh?=
 =?utf-8?B?bCtVb1hzUGhZNjJTbit4TFVnaXRpSFNweU0yZWc1QkhUUXBrbTVaenIxeWdB?=
 =?utf-8?B?aUY0NFFxTGwrL0o0R016MHY5djdLWlNJRVVLcUlYSmN4bnZaL0lZOHIrbGN6?=
 =?utf-8?B?cUdraDZHL3gzdlFlYVYzUDIraTJKbDdOSUZLRHhwdHJxQXBFUXVDdm1xam9k?=
 =?utf-8?B?K25CS1ZHWUVaSldIRjRNRjNtMnllbW5JSDBhbjFhVXk0bVJ1bWhMZkppazkz?=
 =?utf-8?B?SGg2bVR1KzNueUZzQll2c1p1QzFKMlRTV3pBWk5wWWc1ZDBxWEh4U2d1NS82?=
 =?utf-8?B?Y1pXTnJpdjJOaDl3RDN3Mlh0MzNOQkd1MktJaEI5OEowSnV0bWEzU0Z5eVRY?=
 =?utf-8?B?SXJjd0NTTFpBOGttQUZ2RnVGOWlWWnNOeW5ERktjY1Z4eHNrT2VVNG1qK0ZT?=
 =?utf-8?B?SlZWeWVBVUVreVVLUEZKWmJ1cndQOWc3c2t5TlR6OFZTU3hLSWEvR3ZtQ3Iw?=
 =?utf-8?B?bGhjTDFhYVFIaDdTQVFLMGxTVytFQlVxeFZvVkljR0NOYXp0VFJCaGxYV0o5?=
 =?utf-8?B?V3FQOGQ2MHhoZGw5TEZBWXVidVN1eE1WejNyQU1JYU9NVDIxK09tZHNpeG9h?=
 =?utf-8?B?cWltQzNFTUdLTEFESGR5RStENEk0ck5UVXowZVc1UUJOdjRCMzluS01kNTQy?=
 =?utf-8?B?MEl0UW55ZWs3NnFweVRiLzJzMFdIMmsyMTVaam9NemprOGxBYWtOekc4N2RE?=
 =?utf-8?B?NVN2bEdCK3RRS2xZbEtmL2JaaG1ZK1FHN2FPWnRXT2Vyd0VYRXoxZE45OTJs?=
 =?utf-8?B?d3BMUkRsY3gzSVc2TWQwQWJGOXRUVGZrZDhBZ0diZll5SFp0dllJU2c2SXQx?=
 =?utf-8?B?TytxK3ZrdmRKUFRpUDBYZVprTmpCRmhZOVlqN1o2cldENWErcnFXeXF5cVFL?=
 =?utf-8?B?ZUJzdnlmMk92VG8vRGsxc25Makc5MVBWMURwN0d1bDcyN3pjMzlrTVVvN2RR?=
 =?utf-8?B?TkxSem9GSzU1TGY3dzRpZTlsL0taSFdoZm1KUFA5aVFmd1ZXOTdkek41VVRt?=
 =?utf-8?B?MEdscXZRZkNnQ3lMcWxOUE4yRHhlZko5bDI5dkRvcUt2L2puQmZlL3hWV0Iz?=
 =?utf-8?B?QjVvL1hScHljcWt1UzFiUEVNZ2dMVCtJeUZSY2hDekQ4YTM0S0NCbzRhYVVP?=
 =?utf-8?B?amtkTkJPVEFpWm1VOW10S3N6cW9OUkxoTU40Nk05bS9rUUVDTGVlRmlKM3Nx?=
 =?utf-8?B?d09aczF4ODMvRWNKQUh4VWhCaXJ4ZEdSQnZpR1l6dUNES1pUazN5RzdNeFp1?=
 =?utf-8?B?RkQ3Wmlsaks0SUFWQ0FZblpIY25EL2FhQWF6M3JETkVYcTJtZm9FdWFrTm9U?=
 =?utf-8?B?RkU1R3pPSzhhdEhlaWZJZ1JlZmxzc0ZqYjhzaHpXSGJSdGNEdmJpUFpMV2hm?=
 =?utf-8?B?SWlCTTdOK2pEZDJrZlV5TWlIS0s2Z2NzYm1CclVxVFFRWUltZXo5RGRsd0lB?=
 =?utf-8?B?Vi9XSXhEbWZ2cGV1YjBML29iLytRSllhdkV1eHZCYktyYXNWc2kyZWpnWVZB?=
 =?utf-8?B?QW9xNTYyZ1ErZ0lvNHlJM01NUEg5RGVSdU84a3JCdTkxVzNVVlhGOUkwdnp4?=
 =?utf-8?B?QXp4L1p3SEtZVHhvaVFpZ3lDNW9hRU5ZNEU5SU45UWhNVWNzYmgwRDlOOGdr?=
 =?utf-8?B?SVhTWXFYcmF6MURBM1FTMVg4UGN5TUJhZUpoYzJrR3ExVEozbDZQSEQ5bStw?=
 =?utf-8?B?M2ZveEdwZEJmazlqL3BMblVnNHplRzRjNkF4bFp6eFI1Nk9KSHhmcWhETXFX?=
 =?utf-8?B?U09mY2Nabi9pOVM3bXFUTEdVQW14cCtkcFlHL3BCOGJaL1lOUlNGUE1YMnNH?=
 =?utf-8?B?d3F0TTR5MjJDVUdKcmVPcmVaZXdaS010dS9ablRJTUljVTlYVWRxTUZwVUdj?=
 =?utf-8?Q?G1P/TV9zX3COVHmmJ3TO554FY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d2ebe3-6768-4638-935d-08de31997903
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:53:56.8208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMbxGzghDV4CJy0iwhonM8BbhKEZONJlIrvQiDbP+bpgGHNj1Y9gmNLI2s3qfMSB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9007
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



On 12/2/25 10:47, Pierre-Eric Pelloux-Prayer wrote:
> It avoids duplicated code and allows to output a warning.
> 
> ---
> v4: move check inside the existing if (enable) test
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 ++++---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  5 +++++
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 54f7c81f287b..7167db54d722 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3309,9 +3309,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>  	if (r)
>  		goto init_failed;
>  
> -	if (adev->mman.buffer_funcs_ring &&
> -	    adev->mman.buffer_funcs_ring->sched.ready)
> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>  
>  	/* Don't init kfd if whole hive need to be reset during init */
>  	if (adev->init_lvl->level != AMDGPU_INIT_LEVEL_MINIMAL_XGMI) {
> @@ -4191,8 +4189,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
>  
>  	r = amdgpu_device_ip_resume_phase2(adev);
>  
> -	if (adev->mman.buffer_funcs_ring->sched.ready)
> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>  
>  	if (r)
>  		return r;
> @@ -5321,8 +5318,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
>  	return 0;
>  
>  unwind_evict:
> -	if (adev->mman.buffer_funcs_ring->sched.ready)
> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>  	amdgpu_fence_driver_hw_init(adev);
>  
>  unwind_userq:
> @@ -6050,8 +6046,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
>  				if (r)
>  					goto out;
>  
> -				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
> -					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
> +				amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
>  
>  				r = amdgpu_device_ip_resume_phase3(tmp_adev);
>  				if (r)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index ad53789d0e2b..ef68c5f706d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2223,6 +2223,11 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  		struct amdgpu_ring *ring;
>  		struct drm_gpu_scheduler *sched;
>  
> +		if (!adev->mman.buffer_funcs_ring || !adev->mman.buffer_funcs_ring->sched.ready) {
> +			dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
> +			return 0;
> +		}
> +
>  		ring = adev->mman.buffer_funcs_ring;
>  		sched = &ring->sched;

The ring and sched are assigned to local variables here, so you could move that check just a few more lines down.

Apart from that looks good to me.

Regards,
Christian.

>  		r = drm_sched_entity_init(&adev->mman.default_entity.base,

