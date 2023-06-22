Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CD273982A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 09:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B437F10E4DA;
	Thu, 22 Jun 2023 07:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CC310E4DA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 07:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iatFcXgXC0tv6cdvm3r/9XjoDjnX8x7LgoIWQWJ2whSaKw+8WSc9PDf0u+7gjXKVK6h/diOF0U0rnaspIBlTZalRddgsN6Hig+4pxlfhZlWrhlSFHjlVefO3tY+WRG9LJSWsYDE/hgzp6hhgj09o7gi7QKSwhhq4P44o46wMVEgUT/lzLhyvgYlus7SCZwtxjF8KN4o2J89TDA+AbxpaWpZRmescxWWoDhPkGL/9AU9lv+pkzrELFgJWmL0YXCoDMBXDqwBW1kn+g2WTDyjBM7D+og72KR0kwQSPM8w8Jxjv++VmmHPCzTSDR2owyNs4gKLSoDADmlqq/IiDYGBm8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8caZ7M8mzcdE9OxwMYmnHwov1Ll4JzwVi4kaHmGRnw=;
 b=SEiYky46szC6zcZca2IjcIhULZwxs0xx4ekglMKhxx6rIjac1VDaOaAEaguqtJHvZsLB88jvcDBTuqLs191RrkSzj7ipZXjnbc+uvwcZz+suaLvH5iu9N2Zkq45olIppt9eKL8QPYslKigEwhzo8gtW162PorJ/585hAvCcD4VtTj3QTE3vUqu0C8Gi5R97UuuCevmepO37H4wTJ3oZnSninfTEHdfBHzvowIEICQcOtZlAPC/BKPsZAsubcl5Yc7bI/Cm6s5Jg0wzWZrIrkiQiRIOJgtxX2CQf//7wYNh+0AghbcQRDaQOQWOeZyJcqax7OMOwVy8+x9r7LuFXheQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8caZ7M8mzcdE9OxwMYmnHwov1Ll4JzwVi4kaHmGRnw=;
 b=A7MqCRg3WaOhA/zZdXMumZpNV6TrqIYCA8/ytaXqMptx8Xw1JHprs/oA/L6k6EByGHHK6joqMAjprZPDHAt00FYNEwTsGVlIx5NDyqgPTlWg4i5NtUwB3q51Ox8s+QpvvksiYKkgF5OIcMrFQoB2GVJLnCx3xADNTT0UMxdHZe8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6175.namprd12.prod.outlook.com (2603:10b6:208:3c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Thu, 22 Jun
 2023 07:33:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 07:33:54 +0000
Message-ID: <ba94b3d3-62c0-9ec3-b2e8-1567c38263d7@amd.com>
Date: Thu, 22 Jun 2023 09:33:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/ttm: fix bulk_move corruption when adding a entry
Content-Language: en-US
To: Yunxiang Li <Yunxiang.Li@amd.com>, dri-devel@lists.freedesktop.org,
 Alexander.Deucher@amd.com
References: <20230621154314.6976-1-Yunxiang.Li@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230621154314.6976-1-Yunxiang.Li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d413ece-a75a-4f74-95be-08db72f3082e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o0tZjCrAuX4nPNcA9dSEAk4vWyu9a1pAHueiA7bWaJzkt6vpQS3iRj6b8gsHLKubNPJMePvY0MOkbIPzDYmYOPRVHBXWc6vS/QXRmRZRajAR+7iiZWUscnBQlgBI18QIGcseOoEm34IxfanA6Ydtx21jiCTs0M3Xc89LZGMW9Hl2ixRpepi4c771jodyVGtYgSNkPADrR5FK/o4K1wV+9lhK6l+w0OcXvW/vTkboGmwDwx0jxK9EcZ02V3M309jNABWPeST+aAPuqtewP5aY6Oosowo8Ei3PPOr7MtClNxmRrgBS9VaL4pwOwDuCrvDsDcgu02DOH5esYragTz7WqTL94+7PTNHG5i7gVKfi36HvTfLKt1YMWy12Y7xUzdyNA1DcB0FtFxMLXkU/rxWR5i6w1RgSBFK7Y7Te9HcnXyIGnT4tb5hug6n7WVPnYuv0vVyzCqZS587bQhIXYY52G79G+Zk2dP8nyGos4t3jndsfbDw7kCk20yUFsvwr9TO/hW/T0gP1jlG0UiuyEJbaebPEnuOe/J4iqka1BO6lu0o486o6l/JKWbjS5UvdnA31+1SvC2z4scpiJrewUSWdmpM0GV8ZQyrBTD/N1Lst+S5YPGtXiuaI4jhpu0XRq2fa00yJVh5BGGcwTsyMyuLyFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(38100700002)(478600001)(6666004)(2906002)(6486002)(5660300002)(6636002)(66946007)(316002)(66556008)(66476007)(41300700001)(8936002)(8676002)(2616005)(83380400001)(6512007)(186003)(6506007)(31686004)(86362001)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDdmU0pzaVhjUGpGMEFLM0p2dlUvdVVLM2syM21rZHZaVnRwVWxVcEZNeU1i?=
 =?utf-8?B?VmJSOUhUQ0RmK3M1RnVlT01wUEYySm53bHA2QTI3VjZ1akhyQlJuZFFrK1hs?=
 =?utf-8?B?VktWa2tPajFBM3BqOUcyNythYVBlMEhqNnRhckFkcmVCT2hvdmIzUHZHTmM3?=
 =?utf-8?B?SzV2Mmk4alpMSGkxNjArTUxCSlh2YTlvR2pJeXpOL2haMDRPOW9sV0VHY3Uy?=
 =?utf-8?B?WGN5c1piT1JGN3g1N1BjeHF3MmlhMmJNMWx2cnFaWkhzd2RwUDRpN3UyUk42?=
 =?utf-8?B?bWZIMFdlZU1wN29tVElCbWxlNU1lSEpHWFhrWXJJOFJ0UEUxU3Y4MDBYNmUw?=
 =?utf-8?B?Sk51RkdJWjR4eXlSRElUbWxiYmp6QnpWdHpyakU2a1VtYzBIdEU3YVJ0eUs0?=
 =?utf-8?B?VUtVaHZMMjF1cndyVGUzdXJiUzRnZzdHYTNLeGhXUEkydVBkeVpCVFNVWXRJ?=
 =?utf-8?B?RVFKRkllMUJTdU1oSC9UU2IxdGtQY0V4bEpyVmFIWjkyUlpBMEFlcDVmK2Zr?=
 =?utf-8?B?blVrcjFqdVYzQ0g4bDczSVZCc3NXcTZkcGdsVVhoQTFHdDZlcW5jRVNqbW56?=
 =?utf-8?B?bG9DWE9ma1lXZlpoQ3dBUVA4OHNvUVhOQTJFNTE3cS9SVlZDb0x5N1NacWM1?=
 =?utf-8?B?YlVqYVVraEF6dlljamwwUVZpQ1FEdXdXQWJZaU9iOFVzY0lJYlZwZTBEVWZI?=
 =?utf-8?B?ZDFKa3FhY3NWc2lwcC9OTzBXR3g4U0c0bHJUamlyUGszVkVRMEV2YTZUZWpX?=
 =?utf-8?B?YzF3SFlOZGtXNTJ2WGxlVnNVcnZFNVoyMkREYnVuTGRkQ3RNTy81bjc5U3lF?=
 =?utf-8?B?VUd4R0RtMTBpVXgzNzZYMUZQZ1o4WkcrbW5pYUpZQVBJZTdXVk9ZeDhxNkNT?=
 =?utf-8?B?bks1Ti90Q2o1eng4ZU9qaTFPaWpZRUdNd2dCUXdUUlVvazk3K21sSmQvOUkz?=
 =?utf-8?B?ZG5rLzhlbzN1SVlXb0Y1QW5UdzFSbmRIRWxDMU8zb1dXUmdlZk9pMVNrRlVF?=
 =?utf-8?B?K0I5SzAzODRJWUhXSUpMZ0huY3lCNHRxOHNmUlRtcjU3MnRTWEVScE1jcjBn?=
 =?utf-8?B?Tmd6cjJ5U3FadnN5OGtXN3IycFZ5Mk9pcVordW44ZkhMVmRER1hsNGVKU01Q?=
 =?utf-8?B?RHlKOEVCeFNnbUtURFRUNFpaRHdCSlNGbXF5SjFhZVdFWXg2MStNRGtYR1Jw?=
 =?utf-8?B?d0NqU3Z0TEJrMHQ4YTEzeTc1eE9pK3lza3UwMDFlb2d2TGdVZDVWalgrMFRI?=
 =?utf-8?B?V25aZjNZem5QZ2hDZWo5OEpROFFMTnZkN2JOU0pyTjBKZlRTUXJrVmFBdUhJ?=
 =?utf-8?B?MVFOcXMzTDdZcDliam5ua0Jpc1dyRHN3R2t4Sm9DUkpOWmJsc2dIUitJTGs3?=
 =?utf-8?B?cUFPbWhDN3hrOWRvVTBqTWoxK0JLc3NFYWNqMlBwWnJuZ21HMXZiVDdsUks1?=
 =?utf-8?B?K2lTYW1oZ3NyYU5NVTdJOURHS2hYYkorcDg0WlcyRlFGT1pXRStFL1hFcGlo?=
 =?utf-8?B?ckQ4eGNGNW16ak1WTUJIZEt3L0ZBRHNndFhGLzFGenRldTZvMDIram1WazVp?=
 =?utf-8?B?cWxWQk5GMlNnZkNhWE80WkYxZWJqbkk4ckpBTDRlZUo3QzZZSGNwYWhGRkRD?=
 =?utf-8?B?eDJGNVhCVC9ielRCUzM1UzlZTyswVVVqUXZhZTdjcFRNMGVnUnVtRXgzaWhQ?=
 =?utf-8?B?Z0srdmRxRzdVK0lmcSs1SnRDa202M3pBc05raTJWSlZsR1dUZzlXYnFicGRj?=
 =?utf-8?B?MTlYaHNyalh2QnVxTlFoNHhJaVRJYzlXck1kUGhhNnZ5V0d4aTh1cGFGUEps?=
 =?utf-8?B?SVRjN2pHYm9ONU40TkFsN0NndGs3cDY4S1NzRXNjcGJSc3gyTCtpK1NsVTNR?=
 =?utf-8?B?TjJMYm1SRW0yajBhWW50aTVzUXBiYXA3L2FJeGJpTlJWSzRhd0RzZ1pRWGlP?=
 =?utf-8?B?VjR5azdFc1FsSWhzYkplVWxERnZlNjArSklINjlOQkt1Rm1BcTVyS2pBOEcw?=
 =?utf-8?B?SzFxaktjbVd6S0ZQTGJlNlNkY2ZoOUYyTnZtcjFocWk1Zm42aGcyUVBMb0FZ?=
 =?utf-8?B?OWZCWmdMaFZvdUxDZUJ3bFQ1bnBybGxXdUZaYzQ0RXN0TC9YZHEyWDVrd0ww?=
 =?utf-8?B?MzJkOGw4NEIwaFlFUENzRExQcXVIU3BRbTVneVVoeGthTGdldnJWM0d4UWxq?=
 =?utf-8?Q?4bTgBPhiGG8uh52xP7ofjJw+3od9cozhXHvyrplGNUzj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d413ece-a75a-4f74-95be-08db72f3082e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 07:33:54.7609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylkVH/Tdk/XE1NPWgwKbC+ymesfR82ndIG0cOk5wrlfVjaIsstRDF8ggoj9HMI09
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6175
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

Am 21.06.23 um 17:42 schrieb Yunxiang Li:
> When the resource is the first in the bulk_move range, adding it again
> (thus moving it to the tail) will corrupt the list since the first
> pointer is not moved. This eventually lead to null pointer deref in
> ttm_lru_bulk_move_del()

Good catch.

>
> Fixes: fee2ede15542 ("drm/ttm: rework bulk move handling v5")
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_resource.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 7333f7a87a2f..4b84cfb5f916 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -86,6 +86,9 @@ static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
>   				       struct ttm_resource *res)
>   {
>   	if (pos->last != res) {
> +		if (pos->first == res) {
> +			pos->first = list_next_entry(res, lru);
> +		}

Please drop the extra {}.

>   		list_move(&res->lru, &pos->last->lru);
>   		pos->last = res;
>   	}
> @@ -111,7 +114,9 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
>   {
>   	struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
>   
> -	if (unlikely(pos->first == res && pos->last == res)) {
> +	if (unlikely(!pos->first)) {
> +		WARN(1, "ttm_lru_bulk_move_pos is corrupt");

Rather do a WARN_ON(!pos->first || !pos->last) before the ifs and change 
the last if to check for pos->last.

Regards,
Christian.

> +	} else if (unlikely(pos->first == res && pos->last == res)) {
>   		pos->first = NULL;
>   		pos->last = NULL;
>   	} else if (pos->first == res) {

