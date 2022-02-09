Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACA64AFE8A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 21:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE4E10E45B;
	Wed,  9 Feb 2022 20:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9955E10E430;
 Wed,  9 Feb 2022 20:34:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BF4PDlV5KjILwxB0m3XsnJ1wwhsP1JvkBOxmwxsP6c26Vc0IA1fNRSHYcJR2HpvNomTF4UmQKLDSz4biI5X9uPnDihZzQPYsbgEKRQMIdhU+msz+ASrSKKdkUeC65v0ARtDj6MDsfDzwWD+gQULsdOr6xoA7vcdoS30NpfxuCyEKqd90wH4nUEe8cnDKKV23U1QZU49uBN/6YbTodC86FAyCTc0ueOBr1xzAc7TXrA04zfiJjUuC4McHy2gcS2yv8bdFtCGlVEbdWStqZ4NSJCbO+FBHvEQ2WS9t0FmgLodc/lq73tblloLH6mxDgrFzfzXCxMeocx2EGLHg4WNwnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTKaxhzKoRQ9WD4KX5XpqQoERAOqqTUIg4t1yys07gM=;
 b=gPnq8qZ94Yb9Qe5j7Z2arD3j0mKHOfw+/zWZQVbIkcA28BheKZS5nUwJ0ht20/eSSMJEUJEZcO6dKM5ImgJqjv48QKgemCJ3sxcrZIXgfNvPf8+J2iWXCJY07GYLdjW6k76J/3K+q1RfOy4a4MjN6rRNSyRtVqXWDIIR1FI82KmdvejRJNJCt+wDsZZbgL2cKhFIUCWHTudo8B1tcS6M/vacuU2VKEv9Q8bIVZ+6JqevO4y3S7SWWVaa8KZW3dvg4xuofual5oB+5ow113DsX4DNxp2wTS+Nb+EyrOrbGvwaIglQbXASqT0HKwsxWaZ5RkcaSy9KdMtlBzfcSvITiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTKaxhzKoRQ9WD4KX5XpqQoERAOqqTUIg4t1yys07gM=;
 b=CPMUzKh9ui/t4+b5XdbDLTW+CCggJVJ1vL2yc5qR5MK8CxUisXaBMUY54BD3zPPnosTC8YZC4ilAoWbqLv3NTFLA5bEfsSKUiHdmV+t5WdoWeyA7ONXj6gWbY2pyAvHmbFERMXzxCeqVGsVRvRCKdIURw/ffMXqp4+nu5pNRhqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 by MWHPR1201MB2508.namprd12.prod.outlook.com (2603:10b6:300:df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 20:34:53 +0000
Received: from BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::f071:728c:3813:3376]) by BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::f071:728c:3813:3376%9]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 20:34:53 +0000
Message-ID: <c8ae4761-ce66-1a37-e323-0aefe23f555c@amd.com>
Date: Wed, 9 Feb 2022 15:34:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdkfd: fix freeing an unset pointer
Content-Language: en-US
To: trix@redhat.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, david.yatsin@amd.com, rajneesh.bhardwaj@amd.com
References: <20220209145254.2291158-1-trix@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220209145254.2291158-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0404.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::19) To BL1PR12MB5112.namprd12.prod.outlook.com
 (2603:10b6:208:316::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce6dcf45-e929-42bb-63d3-08d9ec0ba060
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2508:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2508C59D0253D91D090C1703922E9@MWHPR1201MB2508.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pGqDB49XTJnHc6VPrCwhmspXRlxoF+IESL8vekrIg88DyX6u6VkJxE32BcvI/4/32nc86Ju2BIyBffq97irmdrTH6lpibeSNOipWEDXVrXVDCdOrHSlvVBGVFxLrvRN/P1gmjVXZMfJgf1JgK11oQMZl/HxJZvVLz+ugY+tbSNkUT8ix4BHOWFlEDE0Y2F2r+AiIfcvAEJ5yqXNfNHT5pkHUkdrSI2wf2qHOW4uleWhl5fQyE32NI6+8eEYlZM4ZXnFriQJllPeHXy1gAGcyBotfKEDaOw/1B6JK8dkiS82AJSvbU+wTNpEbb0fk+8yYUjK3vyTkvQfEqegTdztWBL569QDBr5GHCg+/wpbhRQ1yJNMliEx9YpmdJkLs/h5TqtXoKY2hxcmD9sn4MqMZOksS3bT0eTnEOTNYheSuy9c9JsJDnGxJl9Zhb88mDXkUNGP1Dv2+GOXtwvsrBB0f+H8iRwRm1KiGiHgTWvnO6RVGopIOhlMz6Q33Rr1kFo/+Mz+6sWuEKIVKJx0Tw0TQlrXoLlRBQX8rpwKbLBObkpUqvMbc6kPjSeglh/e20JmVbCfu9Gj6vuh6suJCJ+3w7VHpu5cIdQvJWTHJXEXbcqTOfnt/cbDI8EmEPAfOrXB2o6L1bPXPt94rk0tJBW2vpMdxU+0Uyqog8U7s0OLPHec8DidjO1kAWUCV4FRU/88QVPM00m/q+Dtdk75aa5PgsdivIUfZhobJfTO4P/Bh6NuYbD2myN5OPlCWysicEB7HfyyLbXPBuHQP5pmeZiLYzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5112.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(31696002)(6506007)(2616005)(8676002)(8936002)(66556008)(66946007)(31686004)(6636002)(66476007)(316002)(921005)(26005)(186003)(6512007)(83380400001)(4326008)(6486002)(44832011)(36916002)(53546011)(5660300002)(2906002)(36756003)(86362001)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGZQODdXRkdtdUVXei9xWHZWaDdLN3JJOVFoNkFUSUJ3K0VCTE1hZmFmL1By?=
 =?utf-8?B?MTZuS0NmRmFkTVRIV0xLRDQyRmxSRy9jSWU3L3ZCcVppdUMvMzRkdThkUnNP?=
 =?utf-8?B?L3lYa0xRb3FyOU9LT3hJdWJqbVR6QUZGYkFqb2taT0dBU0RRVXBkL21uQnlP?=
 =?utf-8?B?NUhjWkpmSEV3K0NDSDJJb0Q5K3FWTkYwazR3M1VRMU1wczhsb1U5MHZ6d2Mw?=
 =?utf-8?B?dWFkUi83TDlXSnZIYmZaQXByRkhUanUyVFFBWHNkczhKL0VjYTNOc3dSKzFa?=
 =?utf-8?B?QWJoODVjaEMwUWErSlVkQ0NsL0hwTFNHNE5XRGh4OEIxcWRlTkdIUTQ0amJu?=
 =?utf-8?B?UnRaR3UweEMwaFNxSVhZcEprcWxyWUpzOTRncHN2Y2sweUpndWw2SFpvZDdC?=
 =?utf-8?B?UVA5VUFQWnh0VkRuaE92V3k0QUxCcjFGVTh1QzkwVjliNXBYWTZoQzNPRWFE?=
 =?utf-8?B?UVBDc2RSTDh5QW0yOGI0SG1sMnpGWXduemxmWHdzeWY3TnZJUFREZE9nNkxC?=
 =?utf-8?B?eHFEb1g5WFErSWJUd0pjN1E2UDVKRjdWL2dMOHdjd1VHcUlJTVNPdGZsK0V3?=
 =?utf-8?B?Z0RkK09ML1lsaFlOQ0NnblM2dTBuZHlwQlppNGpwa2UrVVlyZjRabTNjYVkx?=
 =?utf-8?B?S3RsTk9iSlBCYXBIVk1oS1lBOTV2bzF3a3c4ZG1JcC9HL1habkliUVRuTTJu?=
 =?utf-8?B?NElHRTM5RjN3bklOd0NhNThzaDNzYjBhTkRWUVc1S2EzRWdsanBleXhGMVNw?=
 =?utf-8?B?cXpmNHBMM0J5SXIrMkFHTjA5Mlo5bm5WS3RXTG5Xb2tYU082ZW9URVFqbTE0?=
 =?utf-8?B?QkNTZ094RVZidHBWN3RaWm5RSU4vaHBrK3dTTG1Wd3cwNmdpWU1LQUUzc2Vt?=
 =?utf-8?B?aEhZRm9GQmFQTGMybGU2TElScnVDb2pHeWFVUk9TcnI1VTBYYWd2dUJ6UlJ5?=
 =?utf-8?B?MS9LWkdaTnRJaXBGMnY3Vm5xNkh0U1BwbjQ3NUtWZjJ4VjJNakp6L1E4RDdL?=
 =?utf-8?B?c2VQNHYxaFZhdWFpcW1yVjQ5QjhrMVU4ckxzeHQ5RzY2ZysxYjVKTG44OHRW?=
 =?utf-8?B?VTA0RCtyTnpxeG5DaTBUTlRoYmZxZVpOQmFpZ0hndUxPVitGYzMvSndaK28z?=
 =?utf-8?B?b2FKNUxwZFZKR2hPRTJWVzlJelI4eWRueUhiLzhtTU9NSTl3WnA5ajAzUTZX?=
 =?utf-8?B?VjhKc25UcTErckxlamwyTnFYY00vNWY1dDd3aWlmSnlJUGczN2dUY2tyaGFy?=
 =?utf-8?B?U1ltM01UaldYWVp3MVA4TFk5OWlGd2h4SXlVcW9sMkNsZStFb0UybEVUdDA2?=
 =?utf-8?B?aVRBcVE1R1hTSE5Nd0gxOUp0ZzFvMm5NZWlUdXJmUHZxclQvV1BBR3Ezemxn?=
 =?utf-8?B?MldmaG50TnFjbk9JckVsNEJwS2d0L01sTFMrSktLNjhYbElhck1oUU9RZGJJ?=
 =?utf-8?B?NXFyclpVK3N5bmxGV0FRT3kzd1UvL2tyQ21wQlEyQ1U4bFl2cVJTWmNhRFdX?=
 =?utf-8?B?ZENEeDd5TG9NYVJMMTNzbTViaXcvM2dBZ0Fwd3JEYXVzNktTa1lRaEN6UGFx?=
 =?utf-8?B?S3pONUdnQzVoTEFZcGVZUzdTY0M3dWUxejZFZzE1cmZmYVl0Tm4yNlhPNUhy?=
 =?utf-8?B?ZVkxei8zR3Z3OVJiSTVkRTVueVJBcFhrc2owd3RjRzRXMVdGdWRaWWlCTm4x?=
 =?utf-8?B?K2ZFLys5eW9TQURMUU9Md1RKdUZsa0dBWXcydE5acm1Ib0tpUHY3SHltTEtG?=
 =?utf-8?B?UXdDZXRvZ01McEdpNWs1aDBSR1NEeDJUVEFiZHVXWm16aHhwa2hzdWFGYTI5?=
 =?utf-8?B?dDFFZTF2N2lPSWxCODM4T3lKTHY5dlk3RU5UNGl6NGV3dERzcEo3QU5ybWMr?=
 =?utf-8?B?STFrUkVNVTdQc3gyNjZxK252V0dqdWNlQzB2ZnM1a1Z1RmcwTFJ6bS91aWdQ?=
 =?utf-8?B?NGFpMjNmM2NkMFgzRTQxOTMvckhmaW5uNEVHQkovR3NaWG9zQ2gzcTZOZkg4?=
 =?utf-8?B?TTUvZDNUVExUbVF4ejhYdk0rOE9RVU81cGpUN3ZUYi9lR2xmYmxxd092eVhJ?=
 =?utf-8?B?b1lGSkhMNWFDcFQ4aVN5MjFDQmQxMkJrT0FpWERLN2FOMXFQWU5zMDBtYytL?=
 =?utf-8?B?S2FIaHlCNW8wNS9qbTZjUEhBVUlhc1VPOUhJTVQxVFIxR2ZVZ0pDNnE5Wlc3?=
 =?utf-8?Q?WafWk2KsDRWmTPh7wyuJ+T4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6dcf45-e929-42bb-63d3-08d9ec0ba060
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 20:34:53.0352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XulJXlNNMfjhKNcIiDBtXW2IpgzJM3PCFZG7uMrMv7x80h1twuDfBKaka6XAkwyMmuR7CnjkxSbMMmd7bx19Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2508
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-02-09 09:52, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
>
> clang static analysis reports this problem
> kfd_chardev.c:2092:2: warning: 1st function call argument
>    is an uninitialized value
>          kvfree(bo_privs);
>          ^~~~~~~~~~~~~~~~
>
> When bo_buckets alloc fails, it jumps to an error handler
> that frees the yet to be allocated bo_privs.  Because
> bo_buckets is the first error, return directly.
>
> Fixes: 5ccbb057c0a1 ("drm/amdkfd: CRIU Implement KFD checkpoint ioctl")

Thank you, Tom. I'm applying your patch to amd-staging-drm-next.

Regards,
   Felix


>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 64e3b4e3a7126..636391c61cafb 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1982,10 +1982,8 @@ static int criu_checkpoint_bos(struct kfd_process *p,
>   	void *mem;
>   
>   	bo_buckets = kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
> -	if (!bo_buckets) {
> -		ret = -ENOMEM;
> -		goto exit;
> -	}
> +	if (!bo_buckets)
> +		return -ENOMEM;
>   
>   	bo_privs = kvzalloc(num_bos * sizeof(*bo_privs), GFP_KERNEL);
>   	if (!bo_privs) {
