Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE34410F86
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 08:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53696E39B;
	Mon, 20 Sep 2021 06:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12136E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 06:30:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bP0lRvaRxEi4Q2BCTF4Jt3yb5NQUscJNYN8N7OlD3yDgsNJEmQzeA4HV0lQFAEiJIwhQOh3vXScv9+rOgZzru0Qcom26IbeaA70cxZXDOOK9fdb/WuVisEGkvm7CAfHJ5amIjFzvBObSQJ4wMZE4r4qW6oQ3yzgzLDDepudkXIG7b6tLyGGOqrrOWHGoxX7+jQdGEZYQQ/CXoSc7O0cMsOqq85S7RL696TRbGAdwwJGkQBcvWct5pOzkgqrybT6KoJ3GHQBI4UDO+y+o9FxDLZczFreNYVaKxEVntoQ1oflYl22Y+uv7B5EbDlPauwAJ9VI5ETw1spAML7H4R6pHxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=fjZDILWSQkCFB2VZBtbxn9W2FUwSpZj64c8LJMgdmjM=;
 b=d04/JxyJgFtdDpLT7xhZfd5pm4gdmdi4i44heUS3qqmeApDxh45mHjJ4JQbg60HnFi/pjLJZy0krsiU8BuPtS4jFKjEqmJ1dMOpSMCftnLgjTHZ1cZj8mjyAFHUAD945NeNTFJMgvWL+LSBVSJuuYzvSgt5k14fjdq/h7J+rcyG7xxJ9dM1FNPBb5TdOzUFHzK7ayQNjutxgMffeDqQayDRzjfXhb1JrusSk0FIrZHYJep1+vQFYta8ZbIk2eYYgqLLHPqCYVi1rSjdaqP2WMA0ev1KRcD6irzqhyfSJa6SFZ+phn1nQ5trindV9zzNQu1EUcUobPRSlA7UWI3vvFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjZDILWSQkCFB2VZBtbxn9W2FUwSpZj64c8LJMgdmjM=;
 b=Js5sT12S/Euh5Fb9VaZy2/Oscd2dnvINlP8+K4DSrYJzPslXEs/YhkJfSZrNMYIWHLeDFkJ7lo5lQ9uq2RKvJif1Q1ZjcAUtCItg5krQc/eevbeAZzk6Yr6KJmPEEPNkc+69eyQu/zKcbnyVR5Ph6cAeJBAbtUGJUMsr6Oe+4VU=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2419.namprd12.prod.outlook.com (2603:10b6:207:44::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 06:30:53 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 06:30:53 +0000
Subject: Re: [PATCH] drm/ttm: Don't delete the system manager before the
 delayed delete
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Cc: Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210917175328.694429-1-zackr@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e9848031-39c9-235e-b811-3735bdf89689@amd.com>
Date: Mon, 20 Sep 2021 08:30:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210917175328.694429-1-zackr@vmware.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR2PR09CA0011.eurprd09.prod.outlook.com
 (2603:10a6:101:16::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 PR2PR09CA0011.eurprd09.prod.outlook.com (2603:10a6:101:16::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 06:30:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85f24ca9-ed64-4000-8630-08d97c003201
X-MS-TrafficTypeDiagnostic: BL0PR12MB2419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2419F7E60E5D7AFBC25BC8E683A09@BL0PR12MB2419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: asTwJ3uQ+c0TMhXRRYDXvPsxgjJOdbi0pyJhgw7SFa//zARtk8wy0JL+iwggNIiCgMHEDXUJKE5MkZEgDD3qkYVEPZK9zeafWS4nv5of3/sDf4TF0MC1DeOvkYPjmlW4AtYnbu9V+MxyXcUPHpla32KhLado76F7gtxsiXwPYmnWLC53lamK1KhrW0XUhJEQ6vDOG7XIz/fvIUqne/utnXsJAW5vk2a7tx+TVbTYMeFCpFfkEBpsne6VECcfyFrIHizDEJ1/nNibMcGmw8M0yG8rdqLLZpl7Kb14H9d4KfSQqdck0TR/vUJfPaNer9uDPP74u5bHDD4q8NeNztYKUPZ0HBTPc/QDYZ52s/okjxdW18km+Ah+LSA4l8VrrP2JGioKumm8UFpTmUewQ8nUIgMFhBlnGW+3WwcjPhD7CuSnabwVIodPI4HbZuLGqOHSTqeV9NXX5fhCj+Cu7wsq260TVa5XvT2+CqHqy0nJPCwWzmr9F95nIxcb/m8NoyONLgaUTaINriJOzqDrBgv1GRWroRMA5g3ifBs0M1Eb6JyIc5DCs+h2nEFpiBNLe047dnS+W9VXbltLtkV210PUBU/PeG4vLSIlBRKWjclD7YjthwwaMRs95hSF2Cqxs8CqcaQPIN+cKEAOwXszC6sMwfSRtARIBdC8f9XMR1O9YTlbaOcpBNkVosSvkogLrjMx9eVZT7VSUULBvFsLeia1ry9Xq577H6X8EJPm0+vkyls=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(31686004)(4326008)(316002)(31696002)(956004)(36756003)(478600001)(26005)(83380400001)(8936002)(5660300002)(2616005)(54906003)(38100700002)(66946007)(66476007)(16576012)(6666004)(8676002)(66556008)(86362001)(6486002)(186003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlpUTE5vQWZkNmVIU3c4MHVDWnRJUjRNenZiU2tUcXVBdlREWmRnaDIzL1Bm?=
 =?utf-8?B?VlFYdXh6SThVd2t5RVMxOWJvUnlZUmsvYkV5bTVMZ2RxdG9ONU9sZnIwWDR3?=
 =?utf-8?B?MjNVQjBWTTZwL2FPd1UyenhhS0hsaUhIRTFuc0szMi9neXVYV0FNU1M4OEtv?=
 =?utf-8?B?dWcra0xXQXpwbjZjSkNFd1QvajZTZkJLK202RHpKa0NJeVRaQmJCNjFJSit2?=
 =?utf-8?B?c0FpSXZNa1hNOUxWaWl1dUVFTnVIR0s2TTFYQkFsTW5nZkFyU29scGJkTjJi?=
 =?utf-8?B?VnIwRWR1ZGRad2lDUUhBb0MzVkd3M3d0OWlvMlhxcmFQS3BGRWdCQWIvNVE5?=
 =?utf-8?B?ZitHajA5cHI2bitqMzRwOTZFSHdCOW1FUWtMTTBVTjhoTGV3bE04QlhVSlhW?=
 =?utf-8?B?S2VRRk9jUGRhN1VEcUpYYklHY2ozYk1tT3k2bnNEd3N0bmN5ejRwQUpMTklp?=
 =?utf-8?B?UGY2STRoQmk5T0JGcHNOM0g5Q1VSM1V3VFZRdVRKMkxJVWM0ZGJyY0JZRDZE?=
 =?utf-8?B?MGdTNk81SUZmTDhwa042anN0TUpPaDljZ1BBaDdaMEQ2WHRLcWVBVmJDWW5i?=
 =?utf-8?B?TFk3dk9XYUtVTndTMFg5aHBleGlXbFIzT1lJVCt3bmJnc0svbFF4aWdCR0lT?=
 =?utf-8?B?dWtmaTViV2JuWDNLMENGdlo4blV3MXZzWHpKMHNnWEdsZDlFSEQyTkFwUC9o?=
 =?utf-8?B?ZTF4MzlGS3JNeHpINitsQjByVXRtQ0V4em8xZ3lJa0JHdWpiZVB0cXhYZjhO?=
 =?utf-8?B?bkc0a3krdmZLNTRGSTZ2L2dnZEFjQlNBbU1QK3BuOTNsMCtpekw4NHQ0SlVu?=
 =?utf-8?B?SUZqOFF6UGl0RitYRUpyWmVJYzJvUnNpNEVKRktKcExYcVhxaGpENXJHeFBs?=
 =?utf-8?B?a0Q1N2p3Nlpudms4UVdaWGt6SlFyNmxSMStOWGJncnAxTHVZaW9yMGtqbVp4?=
 =?utf-8?B?Y2xVdGxJcU9aT3I0cXJyaGM0dkM1VXUvQk5vNmliVW9KTENTNHkvZG9HZHdm?=
 =?utf-8?B?Y203R3U5RVJRdkRuTDF4U0dSVzNZazFhMlZveGh6M0JWbFlPaVJhSlg5eUcv?=
 =?utf-8?B?YlljekdXbzhHbGpiZHkxc2dBTE9WRW0vUHIvZy8yQWE4ZXhVQlBxbzRtUk9S?=
 =?utf-8?B?SzdVNlRNMXNES05ySkUxbEp5THozcmhzekw3WVNtY1RVS1JVTlFVbjNnYXNl?=
 =?utf-8?B?ZWY5a2NieUxlQ3lqQmU3OXcyY2dROTZiRU9DN091eHA5TWg2TC9nU1lBbDg5?=
 =?utf-8?B?c0M5R3V5YUhoczRDQ3NqeXRLTS8yUzIwRHBlWjc0ZXcyQWZMUEtreFVoMSsz?=
 =?utf-8?B?UmJ2U01ONmg4SEZGamVtSGJ4bzBUeDZDd3dpaWZ1cy83ZHN1NDJvTndUSFB2?=
 =?utf-8?B?b0FNTFF1TE5ib3EvTmdxZEtRVnkvS2M4a3M0a2cxalhyd2dVVTRjRDQra3ZV?=
 =?utf-8?B?dFJsb01TWGNzeFFZalIvL3hIa1JKZit6Rm5MRzAxSmRvckF1aVA3UEwzOTV0?=
 =?utf-8?B?WjJxb213T2VEaGhBakJFNUx3OXpVY2ZQc3ZIcExGUHZxM2ltQU9tNE5BU1hN?=
 =?utf-8?B?MSsxQURueG9JcWJwYm5aUHBNajRSa3B5c2hKM3o0Mi9xbnlCRTlHWU50bnJI?=
 =?utf-8?B?SzVMSU10eFdGWVBzN01RZFBTK2hCVnNuM0FUaEpla2o5TWJYVWNHaDl5bXp2?=
 =?utf-8?B?VFNNelZLblBKampGUForTU10Vyt2UWUxRy95UEVwV2w0UXRmbjgxNGRiT3dM?=
 =?utf-8?Q?GP5cOOYfvxxvs1QVuBRr9lXcGcnFqZAumO1Y/j4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f24ca9-ed64-4000-8630-08d97c003201
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 06:30:53.2629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7t0BN+hDlxvPxsAZW2v6ZPieY76WMp8E634Bzp5+E93vg3qFpHI0yUWgcNiBdnkh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2419
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

Am 17.09.21 um 19:53 schrieb Zack Rusin:
> On some hardware, in particular in virtualized environments, the
> system memory can be shared with the "hardware". In those cases
> the BO's allocated through the ttm system manager might be
> busy during ttm_bo_put which results in them being scheduled
> for a delayed deletion.

While the patch itself is probably fine the reasoning here is a clear NAK.

Buffers in the system domain are not GPU accessible by definition, even 
in a shared environment and so *must* be idle.

Otherwise you break quite a number of assumptions in the code.

Regards,
Christian.

>
> The problem is that that the ttm system manager is disabled
> before the final delayed deletion is ran in ttm_device_fini.
> This results in crashes during freeing of the BO resources
> because they're trying to remove themselves from a no longer
> existent ttm_resource_manager (e.g. in IGT's core_hotunplug
> on vmwgfx)
>
> In general reloading any driver that could share system mem
> resources with "hardware" could hit it because nothing
> prevents the system mem resources from being scheduled
> for delayed deletion (apart from them not being busy probably
> anywhere apart from virtualized environments).
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 9eb8f54b66fc..4ef19cafc755 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -225,10 +225,6 @@ void ttm_device_fini(struct ttm_device *bdev)
>   	struct ttm_resource_manager *man;
>   	unsigned i;
>   
> -	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
> -	ttm_resource_manager_set_used(man, false);
> -	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
> -
>   	mutex_lock(&ttm_global_mutex);
>   	list_del(&bdev->device_list);
>   	mutex_unlock(&ttm_global_mutex);
> @@ -238,6 +234,10 @@ void ttm_device_fini(struct ttm_device *bdev)
>   	if (ttm_bo_delayed_delete(bdev, true))
>   		pr_debug("Delayed destroy list was clean\n");
>   
> +	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
> +	ttm_resource_manager_set_used(man, false);
> +	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
> +
>   	spin_lock(&bdev->lru_lock);
>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>   		if (list_empty(&man->lru[0]))

