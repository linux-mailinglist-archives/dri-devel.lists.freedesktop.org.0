Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6651BAA4B24
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 14:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4254110E768;
	Wed, 30 Apr 2025 12:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LYSAvkDj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D31010E765;
 Wed, 30 Apr 2025 12:28:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcmnrHAdis8uKX5BjYrOa8YXm9HOeSZKypufPSJwCfgllLiGcS+vchfhNyXFhuWw3LT2P2rAa9KYRvkBUY9kJzhkHN8T9+CQX7A1Gkqy11YBZn0W/sjE5nnmemB7KDeJlefBspVDbKl91ThNPxocAQSkRw5UwN/F/5uhiMETCLS0as4mlVMdxNr7bk6Y2sSsh5O+7Ddj1rH7nZu0JXupgr61D1MEH1UnDua6UY/s9PzfIx5vaqZXuDd0qKqLovooAX3yoI2abaMh0OMsOlk8OC14o4HrNFyERP2LOocEI4wv6qFUGB/uaTOyu97typ3RMdto65Hj9Z2iwbif95+XTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVnAMLBSoPbEV8P0L30Pq+zbm+NuS0Tqvgy8UhZTNOw=;
 b=X+8iqPWsx7gRRaMJHVREdjQwCLWKB0pLiQOBxhMN1U0qM/AWIBu22BlYba1EDULv3KPaVWb+BDqN8O6+lOVKEvpe1/MD+cNxXrWWnDpn2vvyIGvBTAgKmXcf/9w6r1DXGqap+SVSvaUlFlufMeuycQoNQjUQdE38A2T/JbepPTJXUVgHnyGJnImM7l9YfmOFlswZXEvgOkhg9rFbOl8S2zfrP3+B8qLpwpKTvjeiickUBGX0GbuCClTvJ9jUi02YinORBY46PqiCPnCu3Xf57nedqzYCoTBcuO1IgaFcbNvfUD7ZSPd35lJEUbc4IyYH6VDs4ZflZINvnZjviwCenA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVnAMLBSoPbEV8P0L30Pq+zbm+NuS0Tqvgy8UhZTNOw=;
 b=LYSAvkDjObxvycZbncS/39pbvc7/1KEV0wH//v/nSdvn0yX6Hlckzdyyf5pAvgWXKzrfu0OdkkISTnijclyJccbjUE7ItxZClHbUl0Qhq0xqrnWrBpOYkMgIs7InLd+AM0zGXbO16x06mmTOAnxlGLnpEhx/YGEyoPzWBLc9hoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB9074.namprd12.prod.outlook.com (2603:10b6:510:2f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 12:28:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 12:28:04 +0000
Message-ID: <ff1ca949-3ccc-4cf6-9d1a-c1fc99e30fdb@amd.com>
Date: Wed, 30 Apr 2025 14:28:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <aBHZuejTTKkdnGaZ@stanley.mountain>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aBHZuejTTKkdnGaZ@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB9074:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e383c91-dda3-4ba9-03d1-08dd87e27492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OG5kTnh5SDkzOXQ4NmpoVGJqNDc0VGJPSlhWWkJLT2grS04xOGNObEFsWW5q?=
 =?utf-8?B?ZU56V2Y2d2pmVkFZK1kxUitOQ0VnM0NwQjBRcUdmUFlHcFB3NlN6MUI5ZExK?=
 =?utf-8?B?R2Ezc3RsL3NCQk1rck5xOUZ0QUpFK0tVbzJMR2dxOHVwOW9JM1NBNERWcDBs?=
 =?utf-8?B?YXNRS0x5NWpHb011bkJBYVNEWGNlVXpKUDM1MkIrVmZzbmc0bEkyRXVYaTNZ?=
 =?utf-8?B?WW5UeC9yM0RNdncyUnA4WHZuV2dkaDNXLzlyK3oxanVVSDZiMXYvNmZlZ0Nv?=
 =?utf-8?B?T29uaVFuVDZPV1ZIYm41YlpXM0ZKWW1ZeFpZZ3FVZlBUaVNCckJqUXI1S0p1?=
 =?utf-8?B?OWM1eUVOMnpqclh3R2RXWGNjamlSU3pRQWlNRS9Ga0pob1Z2UndLaklHdFdO?=
 =?utf-8?B?alFmZTZWZ0hiKzJwSEVRVlA2U0dZSEtMaWhPMjVFcUlKYnBYZWY2dDBycXQx?=
 =?utf-8?B?YzlhcUhDbTQzT010ckU2RU9EbnNzTmpSYUoxSDVHTG1IbFhkWHZBYzBldnJs?=
 =?utf-8?B?Z0hNd1VtcktxUEZuWlNNZndJM2RpMUt2OTJPdk52Y2tNSXRMMlpLQTNKL3J5?=
 =?utf-8?B?MW1GYlFmZ0w0QW1BbzVUbWIzdkltemg0REVRMllVZHU3NVVJRk4xSnhzYzRG?=
 =?utf-8?B?TUZvaU9xS1N0UGpCSzRPa3diTWJ5TU5rdWkreDNqZVkxNFowZnhsQlpvOWxq?=
 =?utf-8?B?TEFlbnFnNU5kM0NUYi9zNytMWW9tckpjdHJJS2swOTlqcDBnekxQRXJnYlpJ?=
 =?utf-8?B?akJneGZ4U1lzQWxLYzliSlZwTGw3aE5NQ1BKbjNCdW4xa3dJMEF4V0pNUFFk?=
 =?utf-8?B?cGRJQVZxWERDT1p1eWdJaGlyUWM2a0FSNTdyNTNhSVVCMVF1UWJjaHdtLzFt?=
 =?utf-8?B?R1N3RjhBZHhiVjJxRDcwNk9rckkzYnkxeWIxcktUWjE4STRCNGhOclZLL28z?=
 =?utf-8?B?TllyMGFrUW9haitxQ0ZsR3hPUTd6OU8zNEVOOHpVRjBJNUwzalZoWW9uZFpJ?=
 =?utf-8?B?VzIxa2pNUFd0SU9oRVA4VG9tTVZ2L0lTSTczT0ZyektCdkxsdCtzb0x3WWNy?=
 =?utf-8?B?NUMzdmpKR2lLdTJ5OEFiN3pzaHZ0OUx5WWlhNi9Tb0FGVFgzbmhzeW5GT2sv?=
 =?utf-8?B?clJJNnR0bGRIZjMxbzBvYmZxaWd0NW5XRytaRlc5WmZsUnZoYWVKTGl1MG4v?=
 =?utf-8?B?RTQ0b051enpLUFFwZmhuMDJKTUdLSmVObFVSUG9ZNXFKZ2JVN1ptajBSSVN1?=
 =?utf-8?B?b21XRVVaUEczbGJ2aTVUZUZvS1l2WlZrbldUTXBwdjgwN3V4d0FwK0ZRODBm?=
 =?utf-8?B?ZUNOWHZKdGdtejdHWkQ3OUY5N2VIVlZXb3NOL0NuejdTSlVEaDMrVUVRT3ky?=
 =?utf-8?B?dVg2SnNFVXVza2hzTkJrT0VOYUFFa2dETHVRTlh0MlFZQTZKOG5qYnVMWXcz?=
 =?utf-8?B?ekNrcEZPOXA2cWxrL1FTazlrcmNNSVFMTTd5cDh6TERPaE80QU10OTFGd1hr?=
 =?utf-8?B?dXdOQ0FwbVMrTHRheGxWeStPNy8xYzB1ZWpjQ1lYK0hlNGI5d1ZBZElvenRV?=
 =?utf-8?B?VjZKNlJBZFV6UmxMN20rOC9uQ25SWVJxTllObEtISHI3UCsxNy82eXFqVXRz?=
 =?utf-8?B?cGdQcFc2cHdMV1ArNGQvazdyS2I2ZjZDMUVCbjlZVDNFamIrWWhjejhxZS8z?=
 =?utf-8?B?OHV5VjBLZml3TU15d0w2d0U4TTdkOS9FUk52MzY5VUVXbWtHTVVOclBnOFJh?=
 =?utf-8?B?cGFENTI0WERnUld3Y0ptTmxnWXEydS9nNFUwcHpLOEVSK1lWZXpRL054eHo1?=
 =?utf-8?B?SzJBR0c3V2hHVGo0d0FJM0xLRmlIYlNyYU5KQk1Bd01ETlRnN0oxckluSnkx?=
 =?utf-8?B?eTVFQ0VsSXY5TGQ4L1BhMTVoZ0tucnlsek5BRlZrQm5vN01uY3gvOTV1cGhE?=
 =?utf-8?Q?KK/KmEHKiRQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3NRRXZWTkJETndZcEJ0UFRySTA5TnhQWFhhTEFtb3ZyWmRQQXRPVnhyVGtq?=
 =?utf-8?B?VGFkU0E0d0x2aEtQUC9NSkNHaG16YTBZc0R3b2V4VXY2TTNoZFFwbEFLYkRG?=
 =?utf-8?B?NUZDa1pQTC9Fc2I2cGFxNzJwU2F5OSs1QmZQdkljQ0E1UjZUb1VjVHQ4RDhl?=
 =?utf-8?B?OVZ1bUdIZTBSYWt2MXVQSXlNdW04bnowUDNpTVJNNnRpQ2h4UUFHR1BSb1VD?=
 =?utf-8?B?b2R0K0Z2S09IZTVPN3VSRDYyZlliSXJBQ3NOOVhBc3FmYUQ2OE5qcUpWaGhH?=
 =?utf-8?B?eEh5YkxUK05EVHNpaWg0RC9RcDNTZUxwdERjN2hTeXJQTHpwRXM3UEU4SGtv?=
 =?utf-8?B?QUI2ejdWbjNoSXBHekM3YUhnR1VSbTlPaHIybXVHODNkQ3k5WVd6eTlxbExE?=
 =?utf-8?B?Z1VaSHFkM3pEcng0Zkx4MDJvQVdFWE5PY2RRRUhRWmtTREN4UWZ2em0rQzY1?=
 =?utf-8?B?ajMzRkY3YUxCWE9qSjZ0RFAyN25yTHYvTjhYWjBxTjVIazlkRUppWkh1Mnhj?=
 =?utf-8?B?cGsvUExacHYxc1hpZnVBNEtpVWkvQy9IWUlRRkpyS1FkVUNNc1I4T1BReTYz?=
 =?utf-8?B?ang0K2VMdXRLaVFLQStoZm9yYTNjdUl2QWNDbVpoM3I3MGNrSTZqTE53eGlr?=
 =?utf-8?B?ZmZUWjlFU096dHhvaWZ0ZSs4RjUrOWJrbEF5NlcwNDZrUXlkek9HOGxnaldG?=
 =?utf-8?B?dHBhRmRGRURMRXpjVmRHQ0VqTmwwaFhuWFBoMlNySk9UdkRnOVNoYmlRM3VR?=
 =?utf-8?B?M2xHbUZ1R2lEdHJzMlRVTWR5MDJxVWtpRWpmZkkzZ3ZRRVFJRkZBTkNIZnh0?=
 =?utf-8?B?U1FGUEx4ZG00bk1VV045NFowaU9XclVuQ0JDSC9GdVZRZE9GdE15cGN6bnpH?=
 =?utf-8?B?OFVBL0tuV3ZWSDV1NVBYTjVQOE4yMFhzbUE2Z1gyazFHZGNLeGVqRUFKYlZG?=
 =?utf-8?B?cjRFR2h0TFBUU1ErYnd4SUlPbktXdnhFMi9ML2JaZEgwZ2dubmFMRi9SWFls?=
 =?utf-8?B?QkZldkZHdGhZQkhKR2xxZXdxc3JOR3FtK1FLSTY5R0VaL3pzU0ExdVY4ZC9o?=
 =?utf-8?B?Z2ZXNUI1M3VLZ0N1VllWSlpPY1ZlSEEyZXR0bnh1Wjk4S1hyMjhMMDJncEZB?=
 =?utf-8?B?amhLZDNQR05HZ2FLWFlneUZCTWdXY2lsK1p5SStrSHFGak9sdFdtNEV3aTBx?=
 =?utf-8?B?bE5iQ0tRRkNCeEFzUlpnVVRwQnpwTVhKc0lSOWluUWNSeTAvT0UvVGlkQ3lJ?=
 =?utf-8?B?V29EeDNQUXAvcDN5SkVKek1oeUVxMGVrUE5oai8xQldjM0FDaXMxVmM1MUpR?=
 =?utf-8?B?ZFNFdTc2QmVaOCtqSldyKzlaNW1qNHJYZEpreFBNWkgvdXUyZ0hxMlhndTBK?=
 =?utf-8?B?RlluN0hCSmZvQStXM3NqUXBza3AybHRxWi8vUG40Wk5wU3ExZkdwM0JXYVJt?=
 =?utf-8?B?R3pBMU9CNU9leVlvS1IxWGp6cGd5QXlTVnJaOHkxZzZlWTF4L2orMFNNcnJM?=
 =?utf-8?B?VktZTGwyRzZpQUo1V0ZMbmx1YklrcXNtZTZMTGVoVkpZSDZlbDBmNmY5SlhJ?=
 =?utf-8?B?SVNxOERwajFvM0FVY0s0MExleERiSXpSaWhlcWtvVlNjUXpCV3RoNEpJcnV2?=
 =?utf-8?B?RURJZzdrQ0hvOEU5djFNOEFIdHBtck1HU29lRGM1dWVnRGc4UkJrbnRJeXNC?=
 =?utf-8?B?NUZ5ZG83b0taZW1FNHNUV0pNSGpNUzZ2Vkpia0RueW9WTkhleGtWaXVNQTE1?=
 =?utf-8?B?R3ZmQ1RKelJzdTRsNUgrelpPMjVlcENNbVJDeE0vblAybHFzQmxOTGg3VGZS?=
 =?utf-8?B?aWVRVjVpb1JKLzJ4RWxmeTl5VGJqdUdTRmpHUEkydTN4RitRTmhyOU1ZN29l?=
 =?utf-8?B?ZmU4TFVtRy9GNnlqU1RaV1ZGU1ZjbE80bkxtVFRkSnQxVVl1UVdDL21MMHZ3?=
 =?utf-8?B?MENBVkdpSVhNNGhjR2NDb2YwRVV1REhHbVYrK295SHBlOUN0aDI1cVVUdm1v?=
 =?utf-8?B?UWg1ZGloOUN5akZ3OFdmbVhDUjI0WGNDZ1Y0K0dNclZZRkRCVFBGSTF5aVhT?=
 =?utf-8?B?RkIwcWQ4djltUkJmSFJPRk5VYW1uNUlsNTd0V2E0VVErTkptYU5neUtBU1dw?=
 =?utf-8?Q?o3KU2zOraVr+9H5hwPdorrAYX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e383c91-dda3-4ba9-03d1-08dd87e27492
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 12:28:04.7866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwDVWmCSR2JzfsTBKEO7Fmbv3edbJcYR3YBOwt9JXE8zNffeF7rrs6E/Mc7eIlxu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9074
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

On 4/30/25 10:05, Dan Carpenter wrote:
> The "ticket" pointer points to in the middle of the &exec struct so it
> can't be NULL.  Remove the check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>


Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> index b0e8098a3988..7505d920fb3d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -631,7 +631,7 @@ amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq_mgr)
>  			clear = false;
>  			unlock = true;
>  		/* The caller is already holding the reservation lock */
> -		} else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
> +		} else if (dma_resv_locking_ctx(resv) == ticket) {
>  			clear = false;
>  			unlock = false;
>  		/* Somebody else is using the BO right now */

