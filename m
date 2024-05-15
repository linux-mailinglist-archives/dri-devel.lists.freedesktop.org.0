Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA4D8C613A
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 09:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD4A10E48C;
	Wed, 15 May 2024 07:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q27hP4LP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEE310E46C;
 Wed, 15 May 2024 07:14:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEFvHexLUfrpbHOB6ykVOr9Deu7lXYGlGDNEI3jHJmnBT+QgGZfw9S7IxriRw8BcxnNvhZrNfZW7+AoGesivcVMoM2U0BqrPoDIYF7cvo+iT1Ic/IHYFPObxqtCzsA8uhnZvjUguYdayQEbS4iyVtCd072CQ0/8vNSnECHn/m1DBk/c43ma5z3a1/g99XXXIaOOXkvEv/875pVPKk4lRmKzeUT9pLnxHRmiHremmwQwVs+chTh5LCViK+lYDluq9DTYcOBq+iRISUqSuQb6pG6yPGweUcCqRLijxtyXV/b3UKWz1lKB21tBzAHslhWVhPBogCeqsZdvdyhDNJq/vYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5OGhS8gjwAEmyRSXlaElkGg0jKiz3A0cx3WGldFIGo=;
 b=kuzBETkEbj5Dl1wzG9EoQ1GyT1kzk3/WJUoHO3tlHXWZefgWHg9aNZOTc3BCQpwS+LDrXUxmuCO9nCFhU3ENtA7jp9q47WTFTeLtN43kqLtoj4PySkchwJoLPWx/QVMk/7kT8PxYidh45ZqTmxOO9mp94NI0r+7FXqBLpoe6t6ncYsL63gv+WyxjiZRobyd19s+kwvRQLK30/rCrCmS7EP3TT/oUAbFBRTm2Ak/aPhfG5o8MgwXMZH0ChXcze/76RcdnUvJak6nay+hzMrJ0pBHjaieM5lYfdWIl17vf8rSWrPEtySJqZeKVmHviRdUPCO9u/gR1b1vGQmQzfStNIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5OGhS8gjwAEmyRSXlaElkGg0jKiz3A0cx3WGldFIGo=;
 b=Q27hP4LPuBCYbElf6VW6Dddcv7odtHtCoDbeiUZ/zsxiAhcp8prEWaY54+ncBBDBrtdfZEfZd6RUSHPcNjMpjFwMpk7lYUK29yZNXX5HVOJTwgoNbiCX6v8QP3SMBdEZDRbOavWVam8Z6OW75ATho1ksxZAugOYR3NWDT7UnlUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5593.namprd12.prod.outlook.com (2603:10b6:510:133::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 07:14:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.025; Wed, 15 May 2024
 07:14:49 +0000
Message-ID: <67c227c1-2c00-49fd-a454-ab60de7a5b96@amd.com>
Date: Wed, 15 May 2024 09:14:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/5] drm/amdgpu: Fix migration rate limiting accounting
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
References: <20240508180946.96863-1-tursulin@igalia.com>
 <20240508180946.96863-2-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240508180946.96863-2-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5593:EE_
X-MS-Office365-Filtering-Correlation-Id: f688a60c-a205-4343-b513-08dc74aeb51c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVFqTmlDa0lvdnRHbU52QU9PRExWWE5meGNFTWUxRTV2Q1ZoTlNOZjg5Mnl5?=
 =?utf-8?B?aTFMWk5tM2lQbU1HTW1NaDE4VGJOOEtld3NmekEvMnduOG1zRDJpd0tRTzBv?=
 =?utf-8?B?N2ljR2xFcWhvTEJpVXBiaUxLM3dBVmNONlhLbkpwSG00MWx1c0RCV3VBQlRl?=
 =?utf-8?B?RXpvS1hXcEx5amQ1QXUyWmpEN3lKOGp3Tzd3R0Z1TEpSTzVIZG02bHl6NmIy?=
 =?utf-8?B?RGx1ek1UOEtidG9NcjhtTmZGRHEydXlOQWNoTmNLejdQT2hVUStFVVYwOS9Q?=
 =?utf-8?B?R1l4Z1BWYlFtayt0S3Iwa0JRU2F2aHZ2Zk5EUW9QWnZyandjS2hHQ3Bqc0pR?=
 =?utf-8?B?QURFVjZwMUFYMDk5RkFFaCt3bzVNK1dtZitYNXFNblFRdWw3RUowUWxqNUpn?=
 =?utf-8?B?U1NIRk1JVFZ2ZGtWeEl3YjFia0dzTWY1VnhyUlB0c3JSWm8vRVcwbDJ4SXp6?=
 =?utf-8?B?MFp2c3MrSG0vdW0vblJIOUxRd0ZTVXgyZnlObkhvTGdsSVpVY3BNQTBNSWVa?=
 =?utf-8?B?dVZrSUNqaFlXeGpQeUdxQ3c3Rk5OaGgxdzRaL1NqUHNldUFXSGJIcTQ1WVNF?=
 =?utf-8?B?N0lreVN5TU5jZHgxMUpNTkR3a2d4M0lLVHJvR1dEUzBrdFRuZStMenp3SHp2?=
 =?utf-8?B?WUhIdGIySXEzL2dQemd6OFpJU053dWRQMTFGSWh4OGVrV2l6QzN5K3VTWEdl?=
 =?utf-8?B?QXlaRWlKeVpjWmVLWktwYXlnTnBSS1lITWtHUWtsNUJoclRhVk1BeEkwcURJ?=
 =?utf-8?B?WUFWeG5VdWdGMkJnenFvQ051VDdPbURsQVd6d2VTeHFhMGNpL0pVUzhmam9l?=
 =?utf-8?B?QzV3Zm9FWi9RczJlVzc0aXJZRy8wdy9saTBNYjZDY1lZOW5taUxJbVRra3Aw?=
 =?utf-8?B?cXppcmRiK2dQcXcwYkZMbmlzQWZJV2dEQ0NZcEFMVlhRL1ZzMTFlZmpsOUM3?=
 =?utf-8?B?QjhjWE5PL3BaUERwVG42ZjVDSzhjVEtoNXJtSlFJOHFFaDhscmdTWk9YdTRM?=
 =?utf-8?B?UTQ2NytCQkhaUFE0MDNRUjZMbDRlQnhwZFp6TlNPeks2Zy9Yc3NYSHQvb1lZ?=
 =?utf-8?B?ZDExRG9HUXV4ajVzZlJCSHlGZTVBY1dacFYvNGNsN2VNbm51WFlwZ2VoNi9C?=
 =?utf-8?B?ZzBjbzBTYXlEMjVLaHo1ZkhnTlc0c3l4YlRRcm9SdEdnYTFpOFVUdXk2eVpO?=
 =?utf-8?B?a1NFanZQOHZmV0dUR3B3OUhzNVlmdFAxNG42TDUwU1BtTytRdzJTb0JvRFM1?=
 =?utf-8?B?Z2p5YTNXbTVNNlZlb1dERW5lZUJWOXcyWVU5b3BSbjR4UE1adXl5T3pCbk1a?=
 =?utf-8?B?RjU1dXFOQ3k1bnhtcWpBUzBZYkdHTUdIbVBuR3VxU0g2d2xvM3pJdTkyVXc2?=
 =?utf-8?B?WlBYT0F1Q3IrWHg4cmZFSkdZRVRxTld5bmdLYWVHRVBVQUdiZVJLUXVDSHZp?=
 =?utf-8?B?NitsRE9OK1k1RkZDY2pPcEZ2Tk5aQVUzNVJIYzhyay9DRGlNckd3QWFQUXRy?=
 =?utf-8?B?UWVzRUNlY3dvS3J0N0FZSTNQY2dNQVFtV09NNFdDYnJYdngyZXZXbTIvbVZy?=
 =?utf-8?B?Mk56ZmNLRm9xbEg0SnY3ODlnZmxjZ0J0bWJIWFpHVkhsaXowZ3paSWhkYW5V?=
 =?utf-8?B?MU83bU0yeGdLd0VEQklsWmpuVTVSRUhmYm5jY2VlaCtVb2o4Y1NjWHRucGV2?=
 =?utf-8?B?UnlHbWUwaDFPck9TQ3BJcXIwaU5ZV2pBT0FvaElVUUV3Um9zTlZ2Z0d3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHRaVG9FUmlrYW9qR2RCVlQrVGw3b3VrbERSdThYWjBUQSs5MjZCbmFSYlN4?=
 =?utf-8?B?K0dEeEZuRkdUakVCVlkzRjBGenJaRkNoRnFzdTdYWHRpN0tSeWgxQ2RpSjZB?=
 =?utf-8?B?ajNzWVNMT1A0V3ZaZkxhMUZBWjdnSERBN2NoR0pVTHAzUHdoMS95dE5MOXBw?=
 =?utf-8?B?MW5yQW5LMnFGSllRZGJZNnJseDA3VUNWbXBQTkNkZzRLZHlkbjZBNmlTSCta?=
 =?utf-8?B?c2h1QnJ3eXdGaE5rNi9VamNyb1BUSEt5VWpuaFJKaGRlY1p1cGhDZzRaTDg4?=
 =?utf-8?B?alpDbFY3TkxMRzF0NmtTZFBZN0trVnYva01DcldROXc0eWxkMWVLSjlhR3RH?=
 =?utf-8?B?VXg2UzhBVDRMK0prYVdaenVqa25kWjZ2RC80VTJGMmhkMTQ3YkdhemVldHhr?=
 =?utf-8?B?MlZlSnM1OU1ScnZCTmY1eFlEQUI1YXEvVGV1cTVDOE83WHpwaCtJbUFOTm42?=
 =?utf-8?B?bmJRQzRaTEkyQk1nL3gyWXJJSGpCR21BK0F3RXhWSERBT3lNcGN1anpjN2la?=
 =?utf-8?B?ckpudjdnMmVGYXZicDNjNElPclg5QVpwWHA2OW9KS1dHRWRYUnpLZEZyeXBB?=
 =?utf-8?B?Y3V6ZHZaL250aVBvbzY3OGgxV0N1bVRubXJ6czByTkUvQmlGRnZuYWQ5VTlS?=
 =?utf-8?B?amQ3dUlERkI1YklkZTl3RkFQd2F5T3RvZDlOM1VQRWsydkJPQWVzaU14UjRj?=
 =?utf-8?B?enlER0crcDJJOElYOGQxd3pJMEJIY0kwMm1KOWxIL1FyNm1XdVpuN3F5Vysv?=
 =?utf-8?B?WVVyQ3NnaWNIWDlUNDNLa0ZPMjlKQjFhMzFjSGxEME1DZzZYQjhiTi96ZVM4?=
 =?utf-8?B?Y1lpellxWmhSaXVQYXdEVmE0dFpzWGxpWnB0eGt1eENHaEhTS213dUpsdWJs?=
 =?utf-8?B?bWJBQXFCUGFBWFpRWDluT00xUkFJeFUrcThZNU1mTVBhZ0FLNmxMYURkRXVs?=
 =?utf-8?B?VmhlTCtTZ1BpZ3hLcjBxL0FmTUVkS2hEczRkTUVWY2p2c1RyYnJUNlZVZHpt?=
 =?utf-8?B?alhSV3hmY2U4Rys2a21aTWRnVXpValR2L0VZU0V0NFE3c3A2VkluRTkwSXBw?=
 =?utf-8?B?ZWRxSEU3Y0dsOEVYd3VIQ1p5STZHRUhXeGJQNW1PSVczUG1jYk5VU1Z1NmpN?=
 =?utf-8?B?OTRwcVZUNHMxZzJNWTZ2WitrWU5zK01pSGpUa1NVdnFtaHlaYmwyZUc0Y1Q0?=
 =?utf-8?B?NVBYalpxdUdvdUdYVmg2bzVvMGpEMGhTK25uR05yY2RXVXRwYjNDbStSL2tp?=
 =?utf-8?B?aWo4aUVaa1c5Tk40dDlhdHRHcXJUZzk1cUlWSlZ4MDFlUG1FdnZlSjNYM0dy?=
 =?utf-8?B?cHp1eWhGQnc3MGMraFh1b1dzWTdWSXBDdG1kM1lQbFFzSng0THFvR2tNczNE?=
 =?utf-8?B?KzBXVXR0UW9ubVBiT2FwempOcklETjhFZys5YmJjSzRXVzNBVWtKaGFnZExi?=
 =?utf-8?B?Z1lFUkxxdDIvdjYvQUNOVXJwb25RZkpJaEJNcFFJL3QyZHRvVmUyU29aanZJ?=
 =?utf-8?B?a2NxZXRWRlpQSExHMjhqbUYyMEVFVGRIK0ZlampnSk9MaWI1emZxQmZXdis4?=
 =?utf-8?B?cFJHUUtaS3FzVldQTDdjY1YyalpsM0VEMTBLdkZjMkwyZkpzSCtlSmduWXVE?=
 =?utf-8?B?a1FSVSsxV3I4aVNQWTVDdlllOVltaUhVWko5ZUszb3lZQUFuZmRlME14VFRv?=
 =?utf-8?B?TStQVnNyeEx4cVpWN0lTMnFnQnE0ZktwU1dONzN1QTRNK3RFcHJCMWU5RzRx?=
 =?utf-8?B?ZGtOT3AwT2tmRllQbWZDWTJlVFZ1a3Z2VWVNbU5WVUtFaWJLb0pMS0xVTm5m?=
 =?utf-8?B?SFVMR1Q2V3lmeWZuVExqdWlLNEhUa3dOR3dwMk5MVTQ3RnlLeldJNy9nZzFU?=
 =?utf-8?B?VEtETmI4TzhrSGZLclRpRGVHSTlOanJkeTdNMWNRempKY3llMDFhbTRpWVhu?=
 =?utf-8?B?cmNhVW16QThJL1ZFT3FxdjVOTEM0NG1YdklyblBzRXRkR3htQ3h3SjI3a1pX?=
 =?utf-8?B?UUcvYnVMZ1RHSlpxQmFOd3VNZGdkTXRHbDNuUHpxbVhjYndHZWF3d0NnQlkr?=
 =?utf-8?B?UjBzM0U5bm4zd0hNMVlnd3BpWEpPdjNWdTFWM1V3VlZsZmRtWkkwalR5NG1y?=
 =?utf-8?Q?AE1c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f688a60c-a205-4343-b513-08dc74aeb51c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 07:14:49.4248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pA30JMePr3iKzzgRJUVR5ZgeBlclybQe7d3/++z19EYTanBII4XCoWRDKMD+lYUG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5593
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

Am 08.05.24 um 20:09 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> The logic assumed any migration attempt worked and therefore would over-
> account the amount of data migrated during buffer re-validation. As a
> consequence client can be unfairly penalised by incorrectly considering
> its migration budget spent.
>
> Fix it by looking at the before and after buffer object backing store and
> only account if there was a change.
>
> FIXME:
> I think this needs a better solution to account for migrations between
> VRAM visible and non-visible portions.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 26 +++++++++++++++++++++-----
>   1 file changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index ec888fc6ead8..22708954ae68 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -784,12 +784,15 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
>   		.no_wait_gpu = false,
>   		.resv = bo->tbo.base.resv
>   	};
> +	struct ttm_resource *old_res;
>   	uint32_t domain;
>   	int r;
>   
>   	if (bo->tbo.pin_count)
>   		return 0;
>   
> +	old_res = bo->tbo.resource;
> +
>   	/* Don't move this buffer if we have depleted our allowance
>   	 * to move it. Don't move anything if the threshold is zero.
>   	 */
> @@ -817,16 +820,29 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
>   	amdgpu_bo_placement_from_domain(bo, domain);
>   	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>   
> -	p->bytes_moved += ctx.bytes_moved;
> -	if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
> -	    amdgpu_res_cpu_visible(adev, bo->tbo.resource))
> -		p->bytes_moved_vis += ctx.bytes_moved;
> -
>   	if (unlikely(r == -ENOMEM) && domain != bo->allowed_domains) {
>   		domain = bo->allowed_domains;
>   		goto retry;
>   	}
>   
> +	if (!r) {
> +		struct ttm_resource *new_res = bo->tbo.resource;
> +		bool moved = true;
> +
> +		if (old_res == new_res)
> +			moved = false;
> +		else if (old_res && new_res &&
> +			 old_res->mem_type == new_res->mem_type)
> +			moved = false;

The old resource might already be destroyed after you return from 
validation. So this here won't work.

Apart from that even when a migration attempt fails the moved bytes 
should be accounted.

When the validation attempt doesn't caused any moves then the bytecount 
here would be zero.

So as far as I can see that is as fair as you can get.

Regards,
Christian.

PS: Looks like our mail servers are once more not very reliable.

If you get mails from me multiple times please just ignore it.

> +
> +		if (moved) {
> +			p->bytes_moved += ctx.bytes_moved;
> +			if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
> +			    amdgpu_res_cpu_visible(adev, bo->tbo.resource))
> +				p->bytes_moved_vis += ctx.bytes_moved;
> +		}
> +	}
> +
>   	return r;
>   }
>   

