Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7733BF905
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 13:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1716E8A4;
	Thu,  8 Jul 2021 11:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2048.outbound.protection.outlook.com [40.107.101.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5696E8A4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 11:29:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7EHZhIxfj2QPVt1WzSw0wCOgUtucmIlzqjIMq++7D4il10jLIiBK9sLBoiUeaOLrd2GFnFFmid/NQvyfRd+SFnKeAPQEGLdLreUHUL7p+fa9QhuDX3b/48zm/IByuCVdsbO4YPkcVvIviPndEdpDj5IaCnzl59eNz1xNG9wPCW4OOc7HUY/eBzPaMMfarFe66mkyuoYsq+2bG4xeXiI+ZqFvmcB2a62JwugHCxx+3sIWqZdQwhbMN0eLxGFI9swhawmmFGV2X++GzGvogje2uUrB9VxzAqmTC4cdw4xVZGaN+LNhYfDSowbTWcyZdazBD8GPZrYGQEF8csg4BFUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqh+rurIHWMzE7kmE2tWVueBoMZEJnzliE8slALY4qc=;
 b=EfTiBIcLzeSzPhvGJL//x0d5+tHqcDf/24EMoOC6kdp7JUmpd3kahYb71pZ/ot6B19i8x4Wyf2UG9YjtWgj2LBXKABQ9rHJdMHtkO7S/2H6w+ISF4Ta+q2MBwlbrdJy/vfYj6ugjVj1N3YskpI5MATkMt22h/jUfa+X3Ose6iFWtdDazYtpWDoNHvSONXfISWXgZZiySg5jlEwYL7tr7srR9nlep8H8/Q0y6BvR6R0Ytazs2dYxRSafbzEnem+CudVhS8qjnqmBdASuJm3C2JVPn8j0LJn+vJ0mw0Ut4M+MAnB0k0QZi9WL2VzYi1OiVI0H9uSSv1FHjsuZbbfMv8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqh+rurIHWMzE7kmE2tWVueBoMZEJnzliE8slALY4qc=;
 b=tLf+e/+U68dX/JhZqQV4EdMDxVxtiNcYUId9TDcERSxRWkh0UY7iGSZ6SPVJGBCM8jP8ScOm+umEv1rsa7hyKg6lotptkyyH/6VJVwmtgAsmZviFaA9ZF6LbAedjJd8uzGPAhosfTvKQaaOTjEZOiOm+VlHyv8xgSoz2v3TWc9M=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4062.namprd12.prod.outlook.com (2603:10b6:208:1d0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21; Thu, 8 Jul
 2021 11:29:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 11:29:33 +0000
Subject: Re: [PATCH v2] gpu: ttm: add missing NULL checks
To: Pavel Skripkin <paskripkin@gmail.com>, ray.huang@amd.com, airlied@linux.ie
References: <55aa8ece-1f1d-76d0-4f2f-951d39e79484@amd.com>
 <20210708112518.17271-1-paskripkin@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <65f55410-bf07-b63a-a3cc-e59213eb4ae3@amd.com>
Date: Thu, 8 Jul 2021 13:29:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708112518.17271-1-paskripkin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0088.eurprd07.prod.outlook.com
 (2603:10a6:207:6::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bc19:c1e3:6307:7e3e]
 (2a02:908:1252:fb60:bc19:c1e3:6307:7e3e) by
 AM3PR07CA0088.eurprd07.prod.outlook.com (2603:10a6:207:6::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.12 via Frontend Transport; Thu, 8 Jul 2021 11:29:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58bc5e74-0e39-4b5b-0620-08d94203a8ce
X-MS-TrafficTypeDiagnostic: MN2PR12MB4062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40629BB965C533DC741A2C1783199@MN2PR12MB4062.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eqSdXIApmduTT8O2i/2bpTG/a8VW+SGRxZQwq+cT1IqAa3QZbS4o0DBNu6UJ+dsT8CDVthuUg4CYRZP0pS+K9vITPYPzHCLzk1XJie7OHDTV5CApLwnGRqvvmtTluXN5wknMnphieLTQI3x0yBRt3Nw0NINBbAYFvYUFd1zZrwIFPBRqprJ8gVjYI3t+g5H7ME0myNpzZhZGpnyZBE1+RpFw7FmwxmXL1nphrQFNZuSkS5CLE5m0RSJ+QxVqS+roaNq4OiPCjwDTu3YBdBk6UDTJhAzh1ftGfj+uC08meD4HaN3fR9e19VnU0qIuqt7y5eQed+pTIWzFzZn2H69oupVdzEW9MDuZIk043qN1h/zDH7+MiLuP4AQoSvUMQUW9/KMqDBaVG10AcXz+s6yoI84a6jw5Ha6PGgfBSIjglI9o1H73xaPaD5+apf4c1LI18hSMKkNwHVOP2X4Lk0g6LXxooMhDxCPqm1iObRJ7VfZaMZd2Tf5T09dZV0uBKq6tXMqcXp8U3Fz/HqR1mLeEqWapnL1jQQr947K6TiQIzVQEXR3mnu7Nn8Q9cYm1ErOgg0TJxeFIu9f4bap9q/OEy50yKA6tW0EaqYF9ywjdNtiaorAwoeaqfDU4db+0KsZ4WpfJnLNfuKixdHj8XMukedaJ7KHSPRy94YSKqWT4rxuanHX0D9P7/9zYLE5neHp80lOpjTuMv6gnpXruKtNmbhGiu5DydC15lI7fylb2Jfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(6486002)(2906002)(66574015)(478600001)(66556008)(31686004)(186003)(66946007)(66476007)(4326008)(5660300002)(6666004)(38100700002)(36756003)(8676002)(316002)(83380400001)(2616005)(8936002)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZENuOHVDTTlKb1NaRG1nWUIvOUNMa0czYkdiaFRDQlFyZk1Oc1pzWEJhRXpN?=
 =?utf-8?B?YStEeUFheWN1bVFVeTR3a2pGQjlja2FDU0ZmcHFrR25XekpvcXhNNVZ6cERV?=
 =?utf-8?B?S3BYTVpMUXFYMjRsUzlxQlJockhXZkdFMVNtVkxHMjVyOXYvblVTNFdqb05C?=
 =?utf-8?B?YUxpNnZ2NWwwRm5scE9qYTZSV0hGNm1tRUhrOXV5UDlOeFZlNnFXR2l2Q2Vj?=
 =?utf-8?B?Z3BaWDhSUnYyek9aaEJGWlgzV2dTaG1jNlowZFc4V1p3VjVwQmNCWVVvbFQx?=
 =?utf-8?B?QlhycWNiVTQwQnZwOUJXWlBaaWdWUW0zbUZFWVBUWU9XQ0Y4THhaTWhSNjBl?=
 =?utf-8?B?bU4zM3c5WnNrU3pKNnE1VTA1WkVEQzlwZk9pSk1uNDZIRkdDQkRVUGl0RHhQ?=
 =?utf-8?B?OW90T3ZiUVM2YjJ2MVI3aW9mcnd1dTEyWk9mSXpEUi93MHYzL29RQjZhRzg4?=
 =?utf-8?B?OVVUSVZmZHRCZkM3dlEraTc5Um9Jb0ZmbjJENVc3amxNeEpQc0lRUHZ2QWEr?=
 =?utf-8?B?VEc5SjRPQkM1bkMvVisralNqM0JsbEFGWFpCQTZ0TFlOZzROdDBvRHVGY1oz?=
 =?utf-8?B?Vm5ZaDM1VHdZdlIvcmRsa25RbE9jUDBDTUx6UlhNRHhSZ3RXRkI2dlRQZ3Ex?=
 =?utf-8?B?WkZ5WmNDUFFSOEtBQmw2NHQ0VTdNbnZ5OHZ1RUI1NTRkZ25PdERncldia3g1?=
 =?utf-8?B?MEw3b1A3bUs5ME5kZWhmVysvQ3dGQUJEOUpxK3g4a3ZWZzhNZ1pBbHE1SUk1?=
 =?utf-8?B?Y25xdXdGS3U0UXpGM3JpZE51TmJCaUUxNldEeU4xa3pCNDI4WGRwZzd4dW5W?=
 =?utf-8?B?b0E1Y25kQ05VSTY5MzBMc2xwOVdISFR4VnBxN0tqU1FsNUhxamZmQXl6TE1Z?=
 =?utf-8?B?YTV3Q0x2TkR5YmxVaEx3d2NWb0Y2L1NYQmlKcTdLTjkwTWRpaTlpK0JRVlFa?=
 =?utf-8?B?VkFPTkUxeTRsTHBmZ3RMczFROTVoRXpqdVBsbHNLYWJSSE5ubDdSN3Zqdyt2?=
 =?utf-8?B?TDBVTUFPWk43UmYyU1VsaUd6am5LT0V1bENWMXpEaTJBT2c1TWJNUWYzWVZi?=
 =?utf-8?B?ckptMzdReEM5WlBnbVVuTWttbkF0TFArUThlbEFRaldwRkJYRVNJVEVBei9M?=
 =?utf-8?B?WitubjZlNkRBV0diSFdBMU5TRW1sNkY1eVgzUjMxbUQ5U2pLTmNPSWI5dUhi?=
 =?utf-8?B?KzFLQkZacllkdkhNVTV4N3A2cmo0R3ovVE8yZnBacG5xN3ZYRlFQdWtpbmVD?=
 =?utf-8?B?Y2FUU2lTNHRYMktpa20wdTl4QlB4WEY4Q1dhK2RWVjE5K2UzQ3VxcXB3a1FB?=
 =?utf-8?B?R3ZGR3lCTDFyRTdNM0JQVC92b3A0Zkt0VzdKSFMxRm5EZVZrd1Jqa2pqOGp3?=
 =?utf-8?B?bnhWSHYyOVlDUU1JYmxSVGhYK3BVbTAybndWTWZxZTNlMk5NWHp4Qy8vOE8x?=
 =?utf-8?B?RndzWjRLRHFEaDNJTWFlMTlPUEw3UnJWT3lBOHVoS1BUMUg0WVcyWEZsTStG?=
 =?utf-8?B?QStCSUlFRUlqWGthUkx0RkR5SkNhT0RuR2NZQkV1RUY5WVRldFBaaHFXeGRN?=
 =?utf-8?B?bjVNaUJOZzY5dlhzU3JyMWQyams1cmtORUsyZGhINXpvWUd5U1hLT0t6bnIr?=
 =?utf-8?B?RkNvT2x6Y29ienA2YWM5bytLSWpSTyt6eDQyOVVzeWU1VVE4dmRROGlZWkVu?=
 =?utf-8?B?NTVmY0ZFNFBEZEZFWHh1S0RVRDVRaXorOVNRSlpjQlhPT2hJak03dllxaWpR?=
 =?utf-8?B?Y2lCb1dZREs5cFZRVExDTjBhMlNtMTU5ZGJSNkJpMWxid2xWTHhNbnc1aXVv?=
 =?utf-8?B?c3hkSW1SZmFLL1p6MHRFTEpjMjdJM2hZMm1rcFp5SGEwb1RyT3pWVUk2TDRa?=
 =?utf-8?Q?6rLak0LDnAd2q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bc5e74-0e39-4b5b-0620-08d94203a8ce
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 11:29:33.6323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9V78xON9uSfpJKQOWlX0bsP1MjRtBXScqiCFH+9bdZIt8upoqVy02/cvKOs6Eqpc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4062
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.07.21 um 13:25 schrieb Pavel Skripkin:
> My local syzbot instance hit GPF in ttm_bo_release().
> Unfortunately, syzbot didn't produce a reproducer for this, but I
> found out possible scenario:
>
> drm_gem_vram_create()            <-- drm_gem_vram_object kzalloced
> 				     (bo embedded in this object)
>    ttm_bo_init()
>      ttm_bo_init_reserved()
>        ttm_resource_alloc()
>          man->func->alloc()       <-- allocation failure
>        ttm_bo_put()
> 	ttm_bo_release()
> 	  ttm_mem_io_free()      <-- bo->resource == NULL passed
> 				     as second argument
> 	     *GPF*
>
> Added NULL check inside ttm_mem_io_free() to prevent reported GPF and
> make this function NULL save in future.
>
> Same problem was in ttm_bo_move_to_lru_tail() as Christian reported.
> ttm_bo_move_to_lru_tail() is called in ttm_bo_release() and mem pointer
> can be NULL as well as in ttm_mem_io_free().
>
> Fail log:
>
> KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
> CPU: 1 PID: 10419 Comm: syz-executor.3 Not tainted 5.13.0-rc7-next-20210625 #7
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0-g155821a-rebuilt.opensuse.org 04/01/2014
> RIP: 0010:ttm_mem_io_free+0x28/0x170 drivers/gpu/drm/ttm/ttm_bo_util.c:66
> Code: b1 90 41 56 41 55 41 54 55 48 89 fd 53 48 89 f3 e8 cd 19 24 fd 4c 8d 6b 20 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 <80> 3c 02 00 0f 85 2a 01 00 00 4c 8b 63 20 31 ff 4c 89 e6 e8 00 1f
> RSP: 0018:ffffc900141df968 EFLAGS: 00010202
> RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffc90010da0000
> RDX: 0000000000000004 RSI: ffffffff84513ea3 RDI: ffff888041fbc010
> RBP: ffff888041fbc010 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000020 R14: ffff88806b258800 R15: ffff88806b258a38
> FS:  00007fa6e9845640(0000) GS:ffff88807ec00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fad61265e18 CR3: 000000005ad79000 CR4: 0000000000350ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   ttm_bo_release+0xd94/0x10a0 drivers/gpu/drm/ttm/ttm_bo.c:422
>   kref_put include/linux/kref.h:65 [inline]
>   ttm_bo_put drivers/gpu/drm/ttm/ttm_bo.c:470 [inline]
>   ttm_bo_init_reserved+0x7cb/0x960 drivers/gpu/drm/ttm/ttm_bo.c:1050
>   ttm_bo_init+0x105/0x270 drivers/gpu/drm/ttm/ttm_bo.c:1074
>   drm_gem_vram_create+0x332/0x4c0 drivers/gpu/drm/drm_gem_vram_helper.c:228
>
> Fixes: d3116756a710 ("drm/ttm: rename bo->mem and make it a pointer")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push this to drm-misc-next-fixes.

Thanks,
Christian.

> ---
>
> Changes in v2:
> 	1. Added NULL check in ttm_bo_move_to_lru_tail()
> 	
> 	2. Changed subject line, since NULL check added in 2 funtions
>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c      | 3 +++
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 3 +++
>   2 files changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 1b950b45cf4b..8d7fd65ccced 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -102,6 +102,9 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
>   		return;
>   	}
>   
> +	if (!mem)
> +		return;
> +
>   	man = ttm_manager_type(bdev, mem->mem_type);
>   	list_move_tail(&bo->lru, &man->lru[bo->priority]);
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 2f57f824e6db..763fa6f4e07d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -63,6 +63,9 @@ int ttm_mem_io_reserve(struct ttm_device *bdev,
>   void ttm_mem_io_free(struct ttm_device *bdev,
>   		     struct ttm_resource *mem)
>   {
> +	if (!mem)
> +		return;
> +
>   	if (!mem->bus.offset && !mem->bus.addr)
>   		return;
>   

