Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F6F3FFAD4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 09:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C84B6E84B;
	Fri,  3 Sep 2021 07:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2063.outbound.protection.outlook.com [40.107.101.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25406E84B;
 Fri,  3 Sep 2021 07:05:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDrL9LwvAPzPtc74/SkpJNoSSQ25LVDC0IpyYMtvP/oO/GM3IyUZL90SLb3AQjAsCSYiWekcrb0a/dDx4Hn8LfyRYCKsIwvyHqDdVQI2XyPGfIitEMkBQ8wSm5OkKJmq6XRCXu/pq1EpQHq5WJ3d5FODmS4Sa7yZe2k7CIXoDYk1r8CTLGuFjbArW4SBkMKSYOM5qYLFYn9EWXh/PJrk2mnt+NgW0m8g1D9q71utHxNT7LNNrVFGnHDaROHsrd3+Y2sa38Xa0thRwlbM3TGoIwO1xhED33BSdsbm3GYnOsUbXRz+7OsPNW8LRsZiU0BslQ4cDMm6+TxH3e6xY0ru4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=iUBwAwysjmZg4Wco/sRvQuQu4keZThwm38vcb/J1v00=;
 b=AXUHftGVVCpyHstOZqI5UQFsNxnIiV6FGK+dqLa/Qz0sFB31ud9N9g6zWUYxNxYQEFllt0VRbYdpNeS9Dv3CA6kmV30c12tEbaD0tKvn4V+VEhNT93k3f7fI/clwyl4P7ug7UeAdI/0fjWGcR0vQ4a/exMvmGO8B+UZ5Q4aolXrD6vcGz7DwcYMltJrXTlTpBqTscX/qnOd87ypcuNu1Lwti/5F9iXWpBmyAy1vkZvLkRHqQW0mURty8H0WyayzwB/vWJxK46Y3UxWhbKYhUYRouB8reYfw4n3mmYpkDsl1pVLffwsPPYJD3uCia9FNLRTHa0CH9ztRSSVlnDfhlgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUBwAwysjmZg4Wco/sRvQuQu4keZThwm38vcb/J1v00=;
 b=eX2xQhQULKrXCouweSmSNtR/XjlG5OlDLSxjFAmaIBt9Y6iVNtoTrmgQWlZNhKT7YLWTG735nrQthy5P9Ba0XIP3hPboJQRo6NfyJQT+Z3ND02JR2N9tU1nRquAgLq5US22x8+0R2c/jE3k+ML57B58rJFBc2MLYqKhuKGccc9I=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (10.255.86.19) by
 MN2PR12MB4319.namprd12.prod.outlook.com (52.135.50.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19; Fri, 3 Sep 2021 07:05:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 07:05:22 +0000
Subject: Re: [PATCH 1/2] drm/ttm: Fix a deadlock if the target BO is not idle
 during swap
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 amd-gfx <amd-gfx-bounces@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <88E16111-86C0-41BC-90F9-A0A517894B5B@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <863ec8a0-fe15-2459-b62b-9c4c4a59f4e1@amd.com>
Date: Fri, 3 Sep 2021 09:05:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <88E16111-86C0-41BC-90F9-A0A517894B5B@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0106.eurprd02.prod.outlook.com
 (2603:10a6:208:154::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR02CA0106.eurprd02.prod.outlook.com (2603:10a6:208:154::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21 via Frontend
 Transport; Fri, 3 Sep 2021 07:05:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd6930e8-e80e-4b10-4636-08d96ea9321a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4319:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4319BC496B6788EAC6FED47583CF9@MN2PR12MB4319.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TUTKzIibW+rLpKjhKqIC9zSdBwzwqQHqEbkXD2dUndpcLrqwEVsqj/C4AN+l+TBw9B+eRF/IEaE+Ml8F1zgibnVS18bLCoFKJTzt+/guHMAcd1Jahh7i5Glu+SK0lPRfjgeKtb7LLkSceEhjrjsvwFFRiVNuK2dPSMO9suOcTKiLnyTxgZq8h1DkwoZVHvGmNgAdk7vBLYUxgHPZJ0BcKRpN+QGAmoj++vWKsR0f/erq1edtCYFAxZqdeHzKUGKXyeGWGS3msKmnumBHYq4zz4wrfonHMRfjaUqs4JYxk86HSUEuBaJ5dXkYeHefLdNAlOm60LQJOCg9T9lePJgxLlVIgfEqviVCy1XCB1Ri2EcfriRaUjabcbFIp3ujbrn8L5QK6y/F2vIOyTkg00ssON5j5j5ck9YJu+F/BgrquoTIJ+GjxmYq7ecEidKcrYvvwR8wzw36nZ9p1O57jEEsl7fgqqoPfJlIGe7XN8z7q/0hZHygDbZ395CrFVx/lfIhfS89sKdcVQDpCQ5PBNd6y/Sjuxf3BcWBcj/E6YhK2ngHtNXV7xUlhdmOBMQdhiIsaA6EFRDER1WrpMbTG8tp1+/cnpA0SE9hSrdZNfFZhyqfClUYdZhbrwzL9Bhyi4NFy39XsGn/cPAhfg7ZMMa70jgtnzTAfU1epWHlwBg1+8UcqnI/NXihe0jsxtroWB3P+CX7jBOyxrGFStLM1dvKBYCvHJcigRHYB54jI9FNweg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(478600001)(54906003)(110136005)(66476007)(2616005)(66556008)(66946007)(86362001)(16576012)(186003)(316002)(26005)(8676002)(6486002)(8936002)(66574015)(6666004)(31696002)(956004)(83380400001)(4326008)(2906002)(31686004)(36756003)(38100700002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUtqejljS0t6T1FhQmloWXlKQW9rMllwZkpvdi9acEoxMHBEOHhWME91aGt5?=
 =?utf-8?B?eCtFVkRqdDF2R1g4NG9RTjhoUDhpREtnQ29zN1pHdDdRMExTdWNPNTFXWXlK?=
 =?utf-8?B?R3VhdVpHdVBVcVo4NHBkWTdZTjlTLzRGTWVxakhqb3FBU21UN2p5NU4rN3RP?=
 =?utf-8?B?M3d5a1ljZ3NtL2xaOXlNdm5qZ2YranAxUEp4TVgrV2l1LytLZVNKcWhTZzBS?=
 =?utf-8?B?Wm5wTXBSZHljRHNjeXU0R1hyWHR1eXVjNUVibWkvd084Q0tNN20vRjlVRWNq?=
 =?utf-8?B?OVFKN0wyWjVteU9wOVJtbTRQWE5ReE50TkZ5U2JZWmNQeXpsNDFBdzJDZjVW?=
 =?utf-8?B?aVUzck1rUUsxVTZuV2ZXRTE0MmFpdnBxa2NuOWNHNGkwck9lMkNoZHVveGZi?=
 =?utf-8?B?SFNSZ3N2WjlETk9yU3hHZDc2S1NZVlJ6MXJwZkx1SG5Gb21aVmIxbnBCamxC?=
 =?utf-8?B?VVl3cng5aHVPeFZBbktocW5ITkVVNnVKN0FucWxMWEs0OFAyU21wcjg1a3Bk?=
 =?utf-8?B?aDROUnloNSs3ekhKSldRZXk4Y1Z2QitkL3ozYVR3bW50MHJ3WVNyNnZwUnA2?=
 =?utf-8?B?MnBtSjJPWVNPa2RiOHRreU5EZ3l6bVlYQmJUSzBtVWhNaDFNd3UrSzlrenFP?=
 =?utf-8?B?VHFBRUhORjZpazQxL3cvZUgxTnhGeGVrZldzUUhDeWxIOTV5czJqTjlEVmJI?=
 =?utf-8?B?Z3NRTVI4bVNSOXJ2YmpSMGx6OVVYamVPZlpUV2pqMGJUTEJJRDlXUnJFamI0?=
 =?utf-8?B?bVNERXVydndHNjgxN2RuNFJreExYdmhYenJwL01Sa3lqeHpNb2RKb3E4amg1?=
 =?utf-8?B?OVJnaGpQMkZMRG8yK1dkL0NnanMwQ09Yb2poRkVmbngybDFxWXR3d0FpYVZE?=
 =?utf-8?B?cVlWL3NYUDd1eUh3aFQyWVlpdUgwMjJ5YUx2Ym01MU1LY0dHTlRhbXkxeURl?=
 =?utf-8?B?OWJJLzhZd3h3ZmU0MHN3R0swQmVJTjRPVFFKVWFjWjk1WXVtR0pWYVBoTGNM?=
 =?utf-8?B?cDJMVllmUDJtUzR5anBUb0hpajRKOTN0MlRzTVo5aU9OS1l2WnZuY0pwMytx?=
 =?utf-8?B?azc5QkE4a3h1RWtZTFFXNjFUNWk4Y2orWVB3RjRSVkZhSmVXd2pGUVJYMTEz?=
 =?utf-8?B?TFVyZE1YZ0ZVZDVhNmhyOSs5bkp6RDA5Z2FjWTJKVnlwVlNWc2N6VTExZVUz?=
 =?utf-8?B?VnRaR3NOZ1Z5K2FGUi9KaERFSHlJVURpS2x6a1Q0TmJNYWk5QzZrNWx4TTNw?=
 =?utf-8?B?RUZKamVUM1owQUx2bS9QWGRhdjI2eDNmMCtxNGJEMHlOdWlqbDMvUURvQU9o?=
 =?utf-8?B?d3JKQmdEcFRGK1NYNzlJUnM5ZlZlempZZS81K2g4MHlmYnZLazdyamZuc3da?=
 =?utf-8?B?ejdvKzBySHErNmVOMTcyTTJVT0szSmxZS1lKbllMRXBQQ3FpSWVQVkxnVGRt?=
 =?utf-8?B?aGphcC9QQTJRR2VlM2t4aFpmeTZhdU9Wa1Y4MDEveHgybmRKUWtHMVBDQm1m?=
 =?utf-8?B?cmJkTDNMTlF4NTRJQXZ0dnFtV3RiRC9SeE05MzVHbTNvMEdrY2ZzVFl0K3Z4?=
 =?utf-8?B?dkpBakxOM0NMcmtQYmdCQzBFeUp3aHF1dk1pN2dQcVdXeGZUcEhWYVlrUWlB?=
 =?utf-8?B?S1ZFYTFFTjRVVDBrN25QcmtLTlVkRkNuS3h2SEZ3eDJicjVNWjZzdStNMEll?=
 =?utf-8?B?bEFmYXczcUxEQXY2eUdJWnp6NDNJdnlES21DZVVId1N1d29PTWo2Z1RxSlZB?=
 =?utf-8?Q?mxyB8MnklmS3XE6e5q2iEQfj2S8nqrN4kKyMqeG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6930e8-e80e-4b10-4636-08d96ea9321a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 07:05:22.0725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9j/e2JtU4Ru63EDNLol9B+IqaVQQZd5ATW4F8y2ky0/r4J7CkZoMq4gyQlAfG5ED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319
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

Am 03.09.21 um 08:49 schrieb Pan, Xinhui:
> The ret value might be -EBUSY, caller will think lru lock is still
> locked but actually NOT. So return -ENOSPC instead. Otherwise we hit
> list corruption.
>
> ttm_bo_cleanup_refs might fail too if BO is not idle. If we return 0,
> caller(ttm_tt_populate -> ttm_global_swapout ->ttm_device_swapout) will
> be stuck as we actually did not free any BO memory. This usually happens
> when the fence is not signaled for a long time.
>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>

Good catch, wanted to rework this for a very long time because of 
potential bugs like those.

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 1fedd0eb67ba..f1367107925b 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1159,9 +1159,9 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   	}
>   
>   	if (bo->deleted) {
> -		ttm_bo_cleanup_refs(bo, false, false, locked);
> +		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
>   		ttm_bo_put(bo);
> -		return 0;
> +		return ret == -EBUSY ? -ENOSPC : ret;
>   	}
>   
>   	ttm_bo_move_to_pinned(bo);
> @@ -1215,7 +1215,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   	if (locked)
>   		dma_resv_unlock(bo->base.resv);
>   	ttm_bo_put(bo);
> -	return ret;
> +	return ret == -EBUSY ? -ENOSPC : ret;
>   }
>   
>   void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)

