Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DA7A687E3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 10:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E001B10E4E5;
	Wed, 19 Mar 2025 09:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X4GNTC6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D451F10E36D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 09:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rz2xwjlfd5+wwU9vyIIZ756L7Lu0mmdPXnoZWbJm/lXRXuKIs8bPku0eerTvMlG4ut9H3VzO6PChJWocuQDWh0Q8Iq7gfS0pRKu3L5DrA2b1x6z8TS75NNPZTrvm/IcYVu+rCyR1qklUNtn9xmBxiMfG23mpSIlJ5cI50SLGECiBLtT0PuMH2pIs/APvnFyfIxN2oqflvTHipj/O1pMD5JpBiy0+bGTpbt7keJ8VU98ELeKjxH9+9epgnfPO5KY9iO6LNZoZtd8Ug2BmP44HltpknLNdcNXP8U/Wr/t4I4V5Znf5WkuqYsnyV+sJZWNMYoOKeVI3xszOKoVeYK8HPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UD9TA+1/iCbIEnR8+hht3QfGDIlvHCj3jik0Zs94xfs=;
 b=CD0CQp+ttL8p9hln+sj/ce/uEg19XelhVhCvCCjhYmrlJxv0atcaDEWFVbe7Pz76QkT4oCP0yqS85fqDIe71HhpXE+fFtT1gGNZBA/b+97VpGaiKrvCrThburvjjzMYLoSk/Jg71Y8Gdek47FmnQdckR7Gj5iCQCa+2Kl2k0vzBJUUQUDFIEF1cO2Hhz2VHN0EW9s57tm1rZqjViPbELRXRgt4zNjS+S9ENC/zNaYRv10UPHrnPkVNvmd9jfkPCawuS9DoSPjPuN7gvDjAMTgldXef0LYT6NrGsjbUSgVN/mRRMUJG/SH/OC1GhdP77ntUjlGhEFAjqZZ9XycK7JZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UD9TA+1/iCbIEnR8+hht3QfGDIlvHCj3jik0Zs94xfs=;
 b=X4GNTC6B8artRJj4APL7aWryAXEdD8nZBFllRF/+PBjZal+P+IXwNwZEdN/wQdz38fu8qnGyaOXhDD2gIf4x3C9gIB9alkcpWvFheOIVxDLDi5K/rVCtMtV73sxbbTtegf5BDRpY/CsNBYBUG6YLKnUqzPVIzkRWJ17AAnPDBgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM3PR12MB9350.namprd12.prod.outlook.com (2603:10b6:8:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 19 Mar
 2025 09:28:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Wed, 19 Mar 2025
 09:28:31 +0000
Message-ID: <da34ab6b-71e7-48a3-98ed-c0ccab8a9e4f@amd.com>
Date: Wed, 19 Mar 2025 10:28:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Switch to exclusively using GEM references
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
References: <20250131200321.193939-1-ian.forbes@broadcom.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250131200321.193939-1-ian.forbes@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM3PR12MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b6827a4-b583-48ce-b205-08dd66c869e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGhId3hDOE5TTGpOdnlHUytQcUVoc3l4eEhqdk5OTEFjeGJpbDdhUkU3aFZr?=
 =?utf-8?B?RWxLVXRaK3BuRTJ3d0N4bTV1UU82bE1xZHpObXdJUUdFSm9oNmtZS3JBZnF1?=
 =?utf-8?B?bGh3cFpvR2ZvRWN1K1haTjZUcVRRMmJVcGRrZXpnaW1aRmZ5cVc2QnVkK1hm?=
 =?utf-8?B?akVqQm8vUGNjSU03Z3c3NVd5cHRQMTUrNnVxNGtnaGdWK2dBZEtRVE9MbkQr?=
 =?utf-8?B?QUlTMnVZZnZlaWcwdmVjY0FKK1hCOEgrMCtuRXFMVHplbEZlVFlwM2gvT2ps?=
 =?utf-8?B?cXRUc2Yyb25rMmFIRjhVMDg2ZWhTWWhEeWgxMXYxVDBuZjIycEcxMmVSSW9n?=
 =?utf-8?B?bUJBM3Rsb3RjczR4cUZ6OFJTN3J0SFhhUFZ0S05jbDlNeGs3dXd4Y1hLQjEy?=
 =?utf-8?B?cHNydWVNSkRXd3hha2ZQalA4Tk9CcXJKZ1J0eU5jajQ3a2ZIRnFhYnhLMmRI?=
 =?utf-8?B?UXR1TFNXa3B0dCt0NlpQc095c0x0ZTJNeG5pajlMTFlQdmQzNm5VSWljRG9m?=
 =?utf-8?B?QjlwZEJ1dnVFVlRWcjZLcFNESDdwcHVnK0JQcDFycE5rdzBYNXVFaWFGRE84?=
 =?utf-8?B?TTh6RTR0T3RXRHRlVTdJSUNrclhXOENodFQxN0xFYzA4dkxUUUtSZDZIcHkx?=
 =?utf-8?B?b2FTd0o2RG05d3d3OWZsVmZ0SlZRUjVpdTZvU05ieFpiSDA3b21Xb2kyZmpT?=
 =?utf-8?B?YWs2RW8wMUtiVmMrNjZjaEZqSVJCVXFteHhnQ0JSMjh6REVqSER6OXJ1QUVm?=
 =?utf-8?B?ZkxjSDdaUUhQN2dMZ0ZLKzVkaGNXUE13VzhCMGRzb1dDYmpFSFltbjNMajNs?=
 =?utf-8?B?SzBJcmV2blp1TDlIb1c4SFJFWWVPZGFob293dDRvTUQ5cisrWDJES0ltaHNw?=
 =?utf-8?B?QW84bEZSOVNrbWNvVmVuZnZENys1Vld0QjlxRGtlUnZWb0d3cmtXSks5QlBI?=
 =?utf-8?B?RG0ybHdwdENqa09FTjhKWTBOKzQzQUVtR0dQVGtiUmZOeTNXRm1GbXlNNExa?=
 =?utf-8?B?YjhQUTVDRlFJcC9xOXlQbUdOYU5sUFJlWHpOVjQ2U1pFSTF5V0VuQzl4b1Zx?=
 =?utf-8?B?ekt2RkFqTnJTellEd0RyaXYzL0xKR2JQL2JYc2wxUUdKQXlOa1MxTmJmS2Fr?=
 =?utf-8?B?OUtCbkpscDhiVjJnNUxxTkdXc09FeFM1a1RxZnM1MVcxd2tWL082S0dVYi9U?=
 =?utf-8?B?WGZmUkZCWldyeW9UTzI1ZEM0VUVoazBCS1pWVDZ5S1Yrc2VxUjhKZHZudHJ3?=
 =?utf-8?B?UTlQWmV0Z2dLQXJhWXgwdEIraDZUcU1xMFNDajYrOEg1ME9DL3NoTnlnYlhu?=
 =?utf-8?B?QnFFbjdPOVdwaUxTOFdnalVNR2tlazdIRFlBMndVc1F5ZHhIbmRrYlQvcWps?=
 =?utf-8?B?WUpmZFozY05zSkQ0dThmUTZiUWJqM2hTS0c0ZmlKd2ZjQ3c4d3RpRUI0NzJR?=
 =?utf-8?B?Mkl3QnBlN1NPemNvWVNBN1dPNThZdC9zTG9qT3JVVHZzdDRzTThaTG9WUmtX?=
 =?utf-8?B?Y3ViUTdlZzdZdjFpWjQrb1ozWlBCSnlQQTFSOCtDZmVtSlh4cW0yTEMvT0hu?=
 =?utf-8?B?Ty9DSThwK2dpRDlMSVk0c2hIN2VSNzUxeStaTFZkbzJibllGK1NXb0NJM1Q5?=
 =?utf-8?B?SzlMYWJDbVJYTi8wUlRMRHpreXVCbWNhSFYyTXkxUStUelExM0hNd2c2azMy?=
 =?utf-8?B?Um1kZDMwVjhXQVRNRVdlbUpCZUh5WG52dVExS3JybGFuUGRtQjFvRVlqSWdj?=
 =?utf-8?B?MDlRZjNiZXlEalBjRGQwSklEWm5FNW5QMUM0bjdVWFViNjNydHJQNkZDSHpz?=
 =?utf-8?B?aTN6R2hFcXFBc3B6aXVrV3l1R3VwVUN4bHlhREx5a3RJWEM2TGg1Si9WQ2lF?=
 =?utf-8?Q?d+gywuQoTgSqi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2U1TUx0TWVGSTRtRDQ3YXlNVDdBdVJ5MThzWnBZalRNYnViVmpscVRuK0Y5?=
 =?utf-8?B?akttZm5MaXdrWnBVMUNqdEdySFphYXVGZGtaOXFscEpXRjNObVcyNjVYYXhU?=
 =?utf-8?B?a3oyR1lsTEFkek0zUVlyemxRL2JFd2FvT0JNNHMrdVVybVZ4VkRyS1Vhencv?=
 =?utf-8?B?RnFTTUNUZVBESU9DMVg3dWV0d1ZQeXk2K1FSSm5tdHNPRjFMMUU1aGdMelk2?=
 =?utf-8?B?MjhFcGlyZ3hhZkRkOG9BbW5HMXJrZnZaL09IRFJlWTFkdHIrMlFVT09rTHY3?=
 =?utf-8?B?dGhzbHRDSTJpMGRVUUNmUzN4eTZFWk12Rm9wTEVaWlJHT3Zkd1Q2cUlxZGIw?=
 =?utf-8?B?aGI0Y2tUQ2U0cGM1czBwUCtKNVZiUjBsRmgzdGJ2UzZjRjdWbDVXanovR2Zk?=
 =?utf-8?B?djZFUlZUOEFYY2lQS05BSTFXZmlUK2gwSXJaVmJUMkUwM0J0cUthUS9CQU5V?=
 =?utf-8?B?TGRyVWtFQjdKekplN0hYZU1VQnZkczU3d1R0RXRtV0ZxdDRSYnZwdUE0dzBh?=
 =?utf-8?B?T3hScXF3T2xCSldKa1BhdXl0UFVxYmRjTjNsYm0xSDZQRkFKOEwwaTlpOHFi?=
 =?utf-8?B?ZXQ2UXNvS1hzYzl3YXhlcVRzT3R0OElBOStsUWk1cUJMenVySjgydGk3NkM4?=
 =?utf-8?B?THlHU1NiQXBXWmJmZzlaUGdiVlNwdG1kbndHUVNCL3B6YkFsN0srVWtmMzhz?=
 =?utf-8?B?NFcyNzAybzlqeUs5YldVUHlUZE1ic0ozbHhOTytXczhURmRkRU8xVEJOUHJU?=
 =?utf-8?B?ODc3S2FPTng2RDlhdWdraEF1b25LVkJCczlrVFhBdkp6VGhMeThiUXp2MG51?=
 =?utf-8?B?ejdDc3BuZDlvd0VNTEw4VExreGtZWUZIaXZOSEptNzJJeWRtb3FWVXdKRm50?=
 =?utf-8?B?eHR4OWtYbHowNUxrNzhyek9qWkwyZVZyZ1NsTU5zR2pDRlk5aFEvejBzY213?=
 =?utf-8?B?WDZadjJxdm9qYjJEOE9RT2VxNG9EcG54cm16M1RnR2RuQ3MxTEd2ZEFHMVl5?=
 =?utf-8?B?WkdQaUNpN0c2UUFQUDhaRnFkRTRPWTVsUTNLbjk3aXRaTDdyNGJ2TktadmpJ?=
 =?utf-8?B?Ym9IVGhsVmF5YVc5N2RicitFdnhWYktadW15ZDJPK0FXdUNqNUliZ0Jld3dU?=
 =?utf-8?B?c0RjcGdCQ0VHeVZNcFFkUEtIcStNY2VOcFZLZ01YYVZnUFQ5VzU1NlRGZ3VU?=
 =?utf-8?B?RUxsTDdGMm9QQW8yZkN4TjJxdmNpVkF1dzVmRGVtYll5bnRqYUJodjN4MzZV?=
 =?utf-8?B?UzZlVzVJc3JuZDJvNW91ekk1dUJmZktZMXVHaWZRWnViTFNUZWgzMHZGQVk3?=
 =?utf-8?B?ZnVGOW9NUnYvb29ONEpQK1BVWWtzV3gyWktNb3RGNmZkeG1QcFlQS1pXVlNK?=
 =?utf-8?B?NHlHNmUxU00rbFBCRGp6M1F5TSs0ZTBnd2dNakt2WkF0MkpkWmFVT05KdVhV?=
 =?utf-8?B?c0tnUDN3VU1SUml6Q0ZsY0YvckFZd0NBT2pvRGRSYzRFVXExc0k4SURrYWwr?=
 =?utf-8?B?cDMramhMZHRYdEtUTjBCNWhGVFRiUThrTXM2WWY4ZEREcUkyUHM4SFJ2SnNO?=
 =?utf-8?B?TTQ2bDRnT0JSc0VmbXpkQ3Q3VlIzWjg0aDdONnkxSVhwcGZiR0FJYUR6L2dV?=
 =?utf-8?B?VU04a2RCblp1bys1dEU2emYxUXNrTnRDc3J5bzNsU0FkNytCRDM0WFVWMU1t?=
 =?utf-8?B?bE1Ec216VzNEd0pvUHZjd2xCMCt3Q3l3YW1YMlY0WjRoaEU4NkJRWVpFcVB6?=
 =?utf-8?B?RUxoalZnb2F4bmNaYjF0U2picHcrWGpxNXNMajZIVmNRcVBtU3phYWdEVnpa?=
 =?utf-8?B?N1pHR1dBWmN0dUR4d3RNV2FNL2p3V3VrR25IdHBJbm9iVm0xZDNrRjRKQXlu?=
 =?utf-8?B?RzR3VWs0NzBKSWQ1c0sxT1hyeUhWSEd4dW1RTTYvMnI0eDcvMVVoM1dEeVFV?=
 =?utf-8?B?QnJIcGVXSDAwamNnZXFiV0Nlby94dlhCWWpIaXZMYXB6UmtCcnY3WjdueEd5?=
 =?utf-8?B?TE1VQStkK1kzd0QxT0E0S3Nua2kycHFsK0czZmFnRGZQOFU1QllGSys5Z1px?=
 =?utf-8?B?cjBaelB3MExiR3R6K0txMXBKRzVIOTBwbHBYMUZlQkkvLzM1Uy9NQWg1cldR?=
 =?utf-8?Q?RFNvLHy0d1oyxfxxNEDju9Zv0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6827a4-b583-48ce-b205-08dd66c869e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 09:28:31.5513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: el7sgzH7gd9LNoBoVij/CZHZLoIMMZspfJJtYzM4x0wrBaYW/3Cq7q3xcvgwGVGY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9350
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

Am 31.01.25 um 21:03 schrieb Ian Forbes:
> Currently we use a combination of TTM and GEM reference counting which is
> cumbersome. TTM references are used for kernel internal BOs and operations
> like validation. Simply switching the ttm_bo_(get|put) calls to their
> GEM equivalents is insufficient as not all BOs are GEM BOs so we must set
> the GEM vtable for all BOs even if they are not exposed to userspace.
>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>

Oh, yes please! Sorry for not responding earlier, this mail somehow got lost in my inbox.

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com> to it.

> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h         |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c    |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  4 +---
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c        | 18 ++----------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_mob.c        |  3 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   |  8 ++++----
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    |  4 +---
>  drivers/gpu/drm/vmwgfx/vmwgfx_validation.c |  7 +++----
>  10 files changed, 18 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index 676fd84f35cc..609bf4067b07 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -36,8 +36,7 @@ static void vmw_bo_release(struct vmw_bo *vbo)
>  {
>  	struct vmw_resource *res;
>  
> -	WARN_ON(vbo->tbo.base.funcs &&
> -		kref_read(&vbo->tbo.base.refcount) != 0);
> +	WARN_ON(kref_read(&vbo->tbo.base.refcount) != 0);
>  	vmw_bo_unmap(vbo);
>  
>  	xa_destroy(&vbo->detached_resources);
> @@ -469,6 +468,7 @@ int vmw_bo_create(struct vmw_private *vmw,
>  	if (unlikely(ret != 0))
>  		goto out_error;
>  
> +	(*p_bo)->tbo.base.funcs = &vmw_gem_object_funcs;
>  	return ret;
>  out_error:
>  	*p_bo = NULL;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> index e97cae2365c8..791951fe019c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> @@ -204,12 +204,12 @@ static inline void vmw_bo_unreference(struct vmw_bo **buf)
>  
>  	*buf = NULL;
>  	if (tmp_buf)
> -		ttm_bo_put(&tmp_buf->tbo);
> +		drm_gem_object_put(&tmp_buf->tbo.base);
>  }
>  
>  static inline struct vmw_bo *vmw_bo_reference(struct vmw_bo *buf)
>  {
> -	ttm_bo_get(&buf->tbo);
> +	drm_gem_object_get(&buf->tbo.base);
>  	return buf;
>  }
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> index a7c07692262b..98331c4c0335 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> @@ -432,7 +432,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
>  	 * for the new COTable. Initially pin the buffer object to make sure
>  	 * we can use tryreserve without failure.
>  	 */
> -	ret = vmw_gem_object_create(dev_priv, &bo_params, &buf);
> +	ret = vmw_bo_create(dev_priv, &bo_params, &buf);
>  	if (ret) {
>  		DRM_ERROR("Failed initializing new cotable MOB.\n");
>  		goto out_done;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 5c1d82a73c32..81382cd58ba2 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -843,9 +843,7 @@ static inline bool vmw_resource_mob_attached(const struct vmw_resource *res)
>   * GEM related functionality - vmwgfx_gem.c
>   */
>  struct vmw_bo_params;
> -int vmw_gem_object_create(struct vmw_private *vmw,
> -			  struct vmw_bo_params *params,
> -			  struct vmw_bo **p_vbo);
> +extern const struct drm_gem_object_funcs vmw_gem_object_funcs;
>  extern int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>  					     struct drm_file *filp,
>  					     uint32_t size,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index ed5015ced392..026c9b699604 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -140,7 +140,7 @@ static const struct vm_operations_struct vmw_vm_ops = {
>  	.close = ttm_bo_vm_close,
>  };
>  
> -static const struct drm_gem_object_funcs vmw_gem_object_funcs = {
> +const struct drm_gem_object_funcs vmw_gem_object_funcs = {
>  	.free = vmw_gem_object_free,
>  	.open = vmw_gem_object_open,
>  	.close = vmw_gem_object_close,
> @@ -154,20 +154,6 @@ static const struct drm_gem_object_funcs vmw_gem_object_funcs = {
>  	.vm_ops = &vmw_vm_ops,
>  };
>  
> -int vmw_gem_object_create(struct vmw_private *vmw,
> -			  struct vmw_bo_params *params,
> -			  struct vmw_bo **p_vbo)
> -{
> -	int ret = vmw_bo_create(vmw, params, p_vbo);
> -
> -	if (ret != 0)
> -		goto out_no_bo;
> -
> -	(*p_vbo)->tbo.base.funcs = &vmw_gem_object_funcs;
> -out_no_bo:
> -	return ret;
> -}
> -
>  int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>  				      struct drm_file *filp,
>  				      uint32_t size,
> @@ -183,7 +169,7 @@ int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>  		.pin = false
>  	};
>  
> -	ret = vmw_gem_object_create(dev_priv, &params, p_vbo);
> +	ret = vmw_bo_create(dev_priv, &params, p_vbo);
>  	if (ret != 0)
>  		goto out_no_bo;
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> index 7055cbefc768..d8204d4265d3 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> @@ -282,8 +282,7 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
>  	}
>  
>  	vmw_bo_unpin_unlocked(&batch->otable_bo->tbo);
> -	ttm_bo_put(&batch->otable_bo->tbo);
> -	batch->otable_bo = NULL;
> +	vmw_bo_unreference(&batch->otable_bo);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> index c4d5fe5f330f..388011696941 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -347,7 +347,7 @@ static int vmw_resource_buf_alloc(struct vmw_resource *res,
>  		return 0;
>  	}
>  
> -	ret = vmw_gem_object_create(res->dev_priv, &bo_params, &gbo);
> +	ret = vmw_bo_create(res->dev_priv, &bo_params, &gbo);
>  	if (unlikely(ret != 0))
>  		goto out_no_bo;
>  
> @@ -531,9 +531,9 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
>  	}
>  
>  	INIT_LIST_HEAD(&val_list);
> -	ttm_bo_get(&res->guest_memory_bo->tbo);
>  	val_buf->bo = &res->guest_memory_bo->tbo;
>  	val_buf->num_shared = 0;
> +	drm_gem_object_get(&val_buf->bo->base);
>  	list_add_tail(&val_buf->head, &val_list);
>  	ret = ttm_eu_reserve_buffers(ticket, &val_list, interruptible, NULL);
>  	if (unlikely(ret != 0))
> @@ -557,7 +557,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
>  out_no_validate:
>  	ttm_eu_backoff_reservation(ticket, &val_list);
>  out_no_reserve:
> -	ttm_bo_put(val_buf->bo);
> +	drm_gem_object_put(&val_buf->bo->base);
>  	val_buf->bo = NULL;
>  	if (guest_memory_dirty)
>  		vmw_user_bo_unref(&res->guest_memory_bo);
> @@ -619,7 +619,7 @@ vmw_resource_backoff_reservation(struct ww_acquire_ctx *ticket,
>  	INIT_LIST_HEAD(&val_list);
>  	list_add_tail(&val_buf->head, &val_list);
>  	ttm_eu_backoff_reservation(ticket, &val_list);
> -	ttm_bo_put(val_buf->bo);
> +	drm_gem_object_put(&val_buf->bo->base);
>  	val_buf->bo = NULL;
>  }
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> index cee2dc70cf8c..23dc404ad623 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> @@ -445,7 +445,7 @@ vmw_sou_primary_plane_prepare_fb(struct drm_plane *plane,
>  	 * resume the overlays, this is preferred to failing to alloc.
>  	 */
>  	vmw_overlay_pause_all(dev_priv);
> -	ret = vmw_gem_object_create(dev_priv, &bo_params, &vps->uo.buffer);
> +	ret = vmw_bo_create(dev_priv, &bo_params, &vps->uo.buffer);
>  	vmw_overlay_resume_all(dev_priv);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> index 896f171f8093..bc7e522d336e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -850,9 +850,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
>  			.pin = false
>  		};
>  
> -		ret = vmw_gem_object_create(dev_priv,
> -					    &params,
> -					    &res->guest_memory_bo);
> +		ret = vmw_bo_create(dev_priv, &params, &res->guest_memory_bo);
>  		if (unlikely(ret != 0)) {
>  			vmw_resource_unreference(&res);
>  			goto out_unlock;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> index e7625b3f71e0..7ee93e7191c7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> @@ -262,9 +262,8 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
>  				bo_node->hash.key);
>  		}
>  		val_buf = &bo_node->base;
> -		val_buf->bo = ttm_bo_get_unless_zero(&vbo->tbo);
> -		if (!val_buf->bo)
> -			return -ESRCH;
> +		vmw_bo_reference(vbo);
> +		val_buf->bo = &vbo->tbo;
>  		val_buf->num_shared = 0;
>  		list_add_tail(&val_buf->head, &ctx->bo_list);
>  	}
> @@ -656,7 +655,7 @@ void vmw_validation_unref_lists(struct vmw_validation_context *ctx)
>  	struct vmw_validation_res_node *val;
>  
>  	list_for_each_entry(entry, &ctx->bo_list, base.head) {
> -		ttm_bo_put(entry->base.bo);
> +		drm_gem_object_put(&entry->base.bo->base);
>  		entry->base.bo = NULL;
>  	}
>  

