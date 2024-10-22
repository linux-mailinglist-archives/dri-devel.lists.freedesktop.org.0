Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CC59AA32C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 15:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2D910E083;
	Tue, 22 Oct 2024 13:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="i9Qd1lfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F9E10E083
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 13:31:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejvAtzDdfqXxl6ywBIDyE24JfS9/3qO8cD6HqIhX09QpnAzuT9ry1RCiHR/a/Iu5G5KjQ08EE4e0ucaRJuBLp7W8fboMiMYTC2yiAYvmDBdT5PDX1GBIw+O75lgD7loP0H2h/yTv8dYzQzne0ao0cRUj3BM0he3mVF7JDVtIjW9uSJ4TcIKbdHE19+aLHXQZ8afxo5RbcsGSqrO1iuQaphBpJE6K6++MeNIchWcM0d2yW1j/m5jz0tFL1lsC7JlAqw/mXn30caUBFpiFo9biUJxEYC0dO8G4/L52Wn6FC8zYbTn2ZMFTQ3+pWmKLliZ53YV3RuAUxLaiDBEdYzcxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4JhdY1mHnh7Ybdo6Hbk3RyWIyYqGzz/dnVp69U3/kM=;
 b=xvpdh5mCSKrdPtW96Nb0GRsNNMe5Yo8Yi7xROjPebBd9g1esCm5GRPoN9NMel/mY69+UYmGBX/AQa52PLnay4PUc7qMQdz8no4wZIEMzPFsBC1mTy0WBq8j1gFeb0BoEGXlE3BVwuUTAcBKkQWv921eJSK0AwLqkzM22e+yFAHwDV0UhBY9n2V7TpAdgv2uezcEadaf3epoosmmhfz2RmtwEe6ydDRRNW3uBPo0DVODwDQ4yEaMxFuxIJzuF/DZzdheBaNg7Txvd1GJ2W94GCy1H5zhkUqR8umb6BYXN5SaRt8wLPVKaMlRqlC6i2zhDpOgzx3np0i07yr2v7PeZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4JhdY1mHnh7Ybdo6Hbk3RyWIyYqGzz/dnVp69U3/kM=;
 b=i9Qd1lfM1ExuY9Qgfjpd7oUMU/VGHlqQy6I6gjLeFZ+1qDYDiHDjmjoxKh+rYu28QTzXkaw4yuIBosfMHaCyeYh//Izvp40RhmB089SbDLARcYy3lD3w+2H4MtpeHZuae8QtYJenvGC0o4AGdDLnemRxXo5HBpNjEBwD9LYH6JgiSTeYu31tpYVhFtXYLej7KMnjxeiFd5m/qjHeEXaAOSBIY7W8/9oU3rM8LiWjLZlEADgg70qD8X/gAdCTzH3wMJQ7ZNMKm7uAHUCkSOIXNDoD3DoQ0aR4BGgEaA/64eqTcbWZHzBABpL8rM99ogA8oVVGW4pGGD6p/uIcMsLung==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by LV3PR12MB9214.namprd12.prod.outlook.com (2603:10b6:408:1a4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 22 Oct
 2024 13:31:31 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 13:31:31 +0000
Message-ID: <1094c262-9d39-4a7b-bede-dc927cd1f52a@nvidia.com>
Date: Tue, 22 Oct 2024 14:31:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 42/43] drm/fbdev-generic: Convert to fbdev-ttm
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-43-tzimmermann@suse.de>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240312154834.26178-43-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0027.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::28) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|LV3PR12MB9214:EE_
X-MS-Office365-Filtering-Correlation-Id: 383b67e0-aa0f-4f40-8c15-08dcf29dd734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDU0OFZySUU4WmJ5TVJEek9LbnFlT2hrVWNDd3c3Wlh1QXMxMXM2akNEOXA5?=
 =?utf-8?B?UDVCOXltSkJuaE5SR0RndlFPVTBZa0lra2RtWmFNcGx6QmtUOTFONXNNV0U3?=
 =?utf-8?B?Q3BTZ1N5NmkwYWlIbVhRbUFwWFVQME9HN2tNOWEzRkdlWmhIN3UvQmJvTHIz?=
 =?utf-8?B?RzBYeHdPUVQ4U2lvV0dsZEhCRWVMOGtRRS9lc0ZidStTRnNOaEFFb1M2eWhY?=
 =?utf-8?B?a3dUWjErOFFvT0gxR1pSenA2Ty84MUs2LzA4dEYzTU5KL0p1bFlFWm5rQjAz?=
 =?utf-8?B?WXlpUzlwMm5oOGEyeWltcGd6eVFSUmk4dEpxNHd0LzlZREU0bEs2UjlHQ3Y0?=
 =?utf-8?B?a1pXMmZPS1p5UjZxam4vR2E3Y0FVKzIxM2QveHNwSVAyVGRaN05XUWhRc21r?=
 =?utf-8?B?TFdRNDFSUCtSRy91Nm8zSjgzNjMxNkV0SitQckJGRDl3MGdLN2VpK2lBRlZP?=
 =?utf-8?B?SzM3akNybUs0TkhmSUV1LzFBV0tpMFJyRExtNnZoUjZqU1ptZ3dZRGVESk9M?=
 =?utf-8?B?SG1QMysyV1JUTnBFdXN0VW84TlRlM3cxaitnM05vdktSUk43M283TnV0SEpM?=
 =?utf-8?B?eGtCdDFIUzVyYjBTYkdkTzNBTmUrOXIrdVBmMVBHanRBSzJLTWJZVEluQnNq?=
 =?utf-8?B?Qi9taG8xS3ZZZElicFhrWTdDakhzKzFLSUI4aU1CbTRtVEl2TWhOeXJHY0w0?=
 =?utf-8?B?L1JEeU5EbkdKRHlwRDYvamNUVUxjbXM2VE1uQ1NHTUtxSENsanVkT1psOGRp?=
 =?utf-8?B?UnVNRFVXRDVpSFlvaG80dmpvU3ZJYUF0ZTlMWjUzOWtZczNuOEhCb08wNFRV?=
 =?utf-8?B?dEhDdlloaUVGOWtVY2lGWTQvLzFXRFh4VFU0SXdNQ3BYazNTU0V0WmE3Y1BU?=
 =?utf-8?B?NzR6L2xmWlJ5bVhyQm9xZDNVRUl5TkRtUFRPVXVkSmNzMXlxYXB1MzMycVNt?=
 =?utf-8?B?TzBmT3RYbGhua21wbmY1MXkxbnJYd0hWNkRvR3ZweWhRbmRGeWhpdnVjd3hB?=
 =?utf-8?B?VEFneWJKWkxrNE9GYzd6MjN6Qm9KdlQ3WTMyemxLZzVET3JCbDRLc1Rabyti?=
 =?utf-8?B?R2NQK3pTTTZxc29MUER5dFhBaEJnL2JCSEtVcHUvODhLZ1JvWk5TcTJjR2F6?=
 =?utf-8?B?b0Nlb3czMkNTeng0OWI1ODNzWHh2c3E0SDZHUWVNVUVnQmxKT0grWFUwaTNS?=
 =?utf-8?B?NmpGbVdWNlJrTTdDY3JEa1plS0pJUjNseG5tTzEwdVpreXFaVytKbG84U25E?=
 =?utf-8?B?K0ZWSjQ3bHlNcG9pQU54aGNwdkRQKzR4a1ExcnVpMTNXelAxOHpyZ2VQUXBw?=
 =?utf-8?B?MUJ1bjBSc1B4RG9yalhCZUwxTEE0SERld2JyRDZlQy8vSExlVGc5Nys1S1Zy?=
 =?utf-8?B?SU9LUjFxQ21FREpsbW1kUGlQZ3RTY0tFZCtQL3paOWxtWU5rb0ViSk0walJQ?=
 =?utf-8?B?VVVIU21JRG9DSksyUE5CVHZkSHd2QVRQREJVS0hGa2ZPNzZjd3NhWi90dTY5?=
 =?utf-8?B?ZytKSVA5Z3BSN0tXaFVWZG4xQUxCSGd6aE1DM3A4UkRKaUZVQW81TjNYM3dJ?=
 =?utf-8?B?aWtRQ25pVlJsemFMdFdOZldyUmVJWS9HOUxUeUMvMjdFa1o3Sm9Qb2Uvam95?=
 =?utf-8?B?Nm0xMEVZMUNydEc3YTZHZ3RwSGNuUnhEVjFLdlVSVFBJM1FuUkx3eE5LS3ZS?=
 =?utf-8?B?RWdZb1FtWE44bk0wRXYxOGlJWDc0Y0VSV0lSU2J3Q3lUZDNXdFJoUVJhdzNE?=
 =?utf-8?Q?tfqX/1kFF5YiICY/hV1S7tzXr5NbjwCsUQnw0LO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8784.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnJ5aGczaE1pQVBxUHh1NFZLOFQzRmpyT2pOdStJeVFUWW8xdUFHWnpDcW9B?=
 =?utf-8?B?NlFxcTBPYU80VHAyb1ozcEhqMEE2S0d3QStWcDFremFsSk1UV2xPVkxPNm9s?=
 =?utf-8?B?SC85Tmh0N0dobGkzbk9NbWlWVDZQeFp6V1pRL0xGYm9LbHFzUUpKSXdoN0dt?=
 =?utf-8?B?YUhEanMwcFAxOTJUNVhuS3d5dERMVmdWNVFGd3VlQXhQMklJZzN0cG1WdGdI?=
 =?utf-8?B?RWt6U2ZKMGg0QlpheTVuL25HYmJtTFN4bGs2SEdROW02cUJYVDc0QVVnZjF0?=
 =?utf-8?B?Q1Z3WE1IaXI4cGtyQXB3d1FtWktBUlR4QXdrcXJvd1lOYlBPdGIxVStNeVdN?=
 =?utf-8?B?ZzA1aTZVQzlkR1hBUkdPckkxZE5Cb2o3bWppR2hadXBCcUhuMEc0anh3Q2px?=
 =?utf-8?B?aE5tYmUvRFBFcWQ4VjdhOXQ0RlMyK29BdFRWcUpQTEpvZXVWZ0kxU0c1VHMz?=
 =?utf-8?B?dnFPTytQSFgyYTlCSVRiazZ5RXlLU0FIaXBFNFoyYUxsRjc3ODZ0VVFmV3lz?=
 =?utf-8?B?VThXblNKcGhYS0RNSHM5eG4zNDhFckM5LzVzVjhmUWp0WitzTFNaa04wK0w5?=
 =?utf-8?B?QlprQnY4SC9hMnhjTjRBdmxJY2xuSGpoYWR3NE02VXNwTEp1ZUh1UHM3NnM0?=
 =?utf-8?B?bGlpcWJsc3VCendVSmpvS1ZKOUR6YXJMTE1jNW9yQXMyRXlaT0VJdFpsdkNO?=
 =?utf-8?B?OXBzNE1mWnlZdXpvMFZrWTV3Y2tJT0RHYW5hQ2o5aER6Q3RKcHZOR2hzbW1D?=
 =?utf-8?B?T1lBeVJsUVZJZmloblZIZHZmcFZ0ZzdpcWRCeW1EREZrUDlWaEU5ei9BNEUr?=
 =?utf-8?B?dlRNeWZaWXJiRTJ6UEJ5VlUrUWNaYVZyQUxXL0FMd2RSSGROK1EzTFRvRDhT?=
 =?utf-8?B?UXhQOEpzbUpKVldwUUkzTGplQnF0MFhNSjFTT21xeDBKckI3Q1hLbHRCSlBU?=
 =?utf-8?B?QW41ZnBKVUVCRXNzeGJEN05iR1pucGQ1eW1IZG5oL2R2SHAraXBkNXBXdFVm?=
 =?utf-8?B?SGNlMWNDM3FjcjZKN0MwRUZGRjc3K1hQTVRXS3FQWTVOSzNZVzcvdUpxdjBN?=
 =?utf-8?B?bUp4SklEaXNlN3A4ZmxxTEg2VzF6ODZ3VTQ5SnVjT2o1YlFOWjdhcldsL1FH?=
 =?utf-8?B?OXZXZ3FMY2xDQlV3dGdWck9YWWJJL2VUY2c1RTdGUXlhajdNUVFWbXBPZXVi?=
 =?utf-8?B?VW41cS9hMHYwQVdBVmdISVlSSC83V2lIaEpqUURvb1RZVW5EcTNkbWo1ZjRo?=
 =?utf-8?B?TW9vOXZvSXl0bVZ2ZGlpdXF4RGVyZEN2WTRuVlRBZFJrak02c0I1L25Nbnc1?=
 =?utf-8?B?STFSUDJaRjV6MUtkYk1Zd0c4dk82YytMNmlSWWl3dENuaTJIRW04RWdsc2hm?=
 =?utf-8?B?akhIbTlzcTNtZ2k5NWxEeEZwTVNpdjY5VGhpclJLMGI4SWdGTFBMN2xMelQ2?=
 =?utf-8?B?SGRUS1NpYStlSkttdUFod0lFRnVkWHl2K2F1dFlWeERscGFlQXZhVjBnTlRn?=
 =?utf-8?B?L0xVdFRacjBYVzN4dGRLTkI3Mi9aenZtZXgrR21QUUhCQWpBM2RXaUV2cGtO?=
 =?utf-8?B?SkZZaFE5UDBKK3BsTVZJQ1ltVWZ0K0IyT2t1dXFoaWV2Z1Q0TjhxbitYQzJ0?=
 =?utf-8?B?d2N6YXFVV0trNS91YTFHTFJSYVg0UXUwc0J2dVllaWxuN21uNlBDMlEyM28r?=
 =?utf-8?B?T2xqY1RXQnV4eXhZNlNWd3JXUEVmaUg4aE1DNkxVZzRNbnZxd0ltdW80U0ZP?=
 =?utf-8?B?Sm0xSkk0OTN0ZURzUmxEMmIvM0YvU1BmWjlRcVBwU0hsTjNHMFRmb1NhVElG?=
 =?utf-8?B?K1NMejVIa0tKakdCbFNCOVg2ejFpRzNYMmQzdVJISUZiNjRsV3NDVk85SkM2?=
 =?utf-8?B?ZVFPOWVxK1dTdDV6aUxNWEtIdEdWMHNHS1VmcW9TOXFvZlRkTTExaEJiOGlD?=
 =?utf-8?B?Y01QdFZESWNvMDVhazRwSVN3S0lmY1ZJcDcwUlRxbkRZajJiMTVWVVllYWcr?=
 =?utf-8?B?RTQyQS9YcnNkeGpYSVlQTGxWOHg0c1pZUS8xdEpHWlVBVDFhTXQ1SE1SV0V3?=
 =?utf-8?B?NndaRElxZHd1dXBVeFIvQ2hrc243QTBIM1RtZWU4MklLcUlXWERLSzc0cS8x?=
 =?utf-8?Q?T8hsQgIgG+Kizu8hbe2axPD0i?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383b67e0-aa0f-4f40-8c15-08dcf29dd734
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 13:31:31.5843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49CVbxWyC2zBKJVnUgoF+gwai0YRmeoCa7IXVRz+xA/NBVA0vwhJd6PQsAJHKQJX+w+sLNFWqpz7avNVwDv0cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9214
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

Hi Thomas,

On 12/03/2024 15:45, Thomas Zimmermann wrote:
> Only TTM-based drivers use fbdev-generic. Rename it to fbdev-ttm and
> change the symbol infix from _generic_ to _ttm_. Link the source file
> into TTM helpers, so that it is only build if TTM-based drivers have
> been selected. Select DRM_TTM_HELPER for loongson.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   Documentation/gpu/drm-kms-helpers.rst         |  2 +-
>   drivers/gpu/drm/Makefile                      |  5 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 +-
>   .../{drm_fbdev_generic.c => drm_fbdev_ttm.c}  | 80 +++++++++----------
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  4 +-
>   drivers/gpu/drm/loongson/Kconfig              |  1 +
>   drivers/gpu/drm/loongson/lsdc_drv.c           |  4 +-
>   drivers/gpu/drm/nouveau/nouveau_drm.c         |  6 +-
>   drivers/gpu/drm/qxl/qxl_drv.c                 |  4 +-
>   drivers/gpu/drm/tiny/bochs.c                  |  4 +-
>   drivers/gpu/drm/vboxvideo/vbox_drv.c          |  4 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 +-
>   include/drm/drm_fbdev_generic.h               | 15 ----
>   include/drm/drm_fbdev_ttm.h                   | 15 ++++
>   14 files changed, 77 insertions(+), 77 deletions(-)
>   rename drivers/gpu/drm/{drm_fbdev_generic.c => drm_fbdev_ttm.c} (76%)
>   delete mode 100644 include/drm/drm_fbdev_generic.h
>   create mode 100644 include/drm/drm_fbdev_ttm.h

...

> diff --git a/include/drm/drm_fbdev_ttm.h b/include/drm/drm_fbdev_ttm.h
> new file mode 100644
> index 0000000000000..9e6c3bdf35376
> --- /dev/null
> +++ b/include/drm/drm_fbdev_ttm.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef DRM_FBDEV_TTM_H
> +#define DRM_FBDEV_TTM_H
> +
> +struct drm_device;
> +
> +#ifdef CONFIG_DRM_FBDEV_EMULATION
> +void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp);
> +#else
> +static inline void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp)
> +{ }
> +#endif
> +
> +#endif


I recently noticed that with Linux v6.11 it is possible to enable
CONFIG_DRM_FBDEV_EMULATION without enabling CONFIG_DRM_TTM_HELPER. Now
while this does not currently cause any build issues, I believe that if
the function drm_fbdev_ttm_setup() is ever used somewhere that does not
explicitly select CONFIG_DRM_TTM_HELPER, then you could get a 'ERROR:
modpost: "drm_fbdev_ttm_setup"'.

So I was thinking that may be this should be ...

diff --git a/include/drm/drm_fbdev_ttm.h b/include/drm/drm_fbdev_ttm.h
index 9e6c3bdf3537..5b6723a37caa 100644
--- a/include/drm/drm_fbdev_ttm.h
+++ b/include/drm/drm_fbdev_ttm.h
@@ -5,7 +5,7 @@
  
  struct drm_device;
  
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#if defined(CONFIG_DRM_FBDEV_EMULATION) && defined(CONFIG_DRM_TTM_HELPER)
  void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp);
  #else
  static inline void drm_fbdev_ttm_setup(struct drm_device *dev, unsigned int preferred_bpp)


The above function has been removed now in -next, but I believe we could
have the same problem with drm_fbdev_ttm_helper_fb_probe()?

Cheers
Jon

-- 
nvpublic
