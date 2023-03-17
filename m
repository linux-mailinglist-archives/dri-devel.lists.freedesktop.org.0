Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC386BE3FF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2BC10E087;
	Fri, 17 Mar 2023 08:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2085.outbound.protection.outlook.com [40.107.101.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8755010E087
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 08:40:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gS0z08DCSTBbabB+n732/gvEZlvl9E8eZPmbTWLpVZKP9w46EgyYkpeQX+OeJMv2/r8Q5uhukMUWOlX1KJ/iNGskFH/nrg4HUr7jQTTtVrO6/+jLf5aPzv5HJhd65kXK4uelaG0fYMk+doqcs09Oxtn7PgkYzuw46hur2TfO14OBX7xJmSotB5iqnP7GSlzNrSliK4ljIaRIBRBABE+jleDPcD1X0GNol7/MFOz9jFiAVwoE80Ljq3xeywWurzIw/mAIZnzCltAiDpH5A20wquxA+QwXY51XirzD3Hpx0XYrE15AOI9cEHt4xPNBsIb/D3ppOFV9wUnfYJzixb37Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9sczkb/yl8HH2CtHvR6g5bT18OAJjP3EB479yPVeVo=;
 b=e+IuuhWBwz98UIFGtdtmEMA7FDryCnI0sJGWqBsexZJRe9dIu0h/PnipATYQSijvKUVCOx3I7+2MpBmGdgfU5QnQMmYrZR1cNQ/u26HZTGw3cAYEgTpK9WLp09qB+tlASK+Jic06cRAgzJyOBcODRxKcV2BgrwRTF2ah8yZEhGyxcsGCTJ7uLYZaJapbPZQsN8xQJkhWfUu0Zw8fUNwkI5tC+yWePeOKgvHAdX9hUEvZYnupjKcXqk0TTUoMaHV5bU/Ahg6VQhD/9wddCnhp41rVYl5qm8cS9jeE0o7v1TAQ/fbtnFd95qtT9iKmZEtzUcKEJa2UdZB7kues7luEbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9sczkb/yl8HH2CtHvR6g5bT18OAJjP3EB479yPVeVo=;
 b=P2erWaRKubVDt9Dm+7K26P0R5/6/lH6FxjWlDO3LSCyxKPqjoHzBuOYthLm0fUcyhMUgx6sIGl2Btyivf7gVpydVzk02njeMmCjVwbKMJaEVZH7bkIL4sBwZpXubyTdMqK6zF+JiGdInQRW0smT2tZjiGxEF6fnmfEHPhtyYd4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6929.namprd12.prod.outlook.com (2603:10b6:806:263::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Fri, 17 Mar
 2023 08:40:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Fri, 17 Mar 2023
 08:40:56 +0000
Message-ID: <30f75b09-fdc6-bb3c-0785-f7b0f3183192@amd.com>
Date: Fri, 17 Mar 2023 09:40:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 05/37] drm/ttm/ttm_bo: Provide a missing 'bulk'
 description and correct misnaming of 'placement'
Content-Language: en-US
To: Lee Jones <lee@kernel.org>, dri-devel@lists.freedesktop.org
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-6-lee@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230317081718.2650744-6-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a04f609-2c30-4462-8f05-08db26c3536f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yUXwD0t9fGuvVGpuVfDpEEPQr89XjJ+fWqRb6qPXIvc5UGk78jr7ktORcGleNX0s7MqFNDTEPywXu78Xo8esAiZEWMrzCNo229jW6KnzXtz9INHLG/KpW98bg5C90ZP40I+grsofdHcBx6TfVgQTT8Q3kRybi2MoAJFlDcR4QB8yif+m2cwoHbccTMfrF/ZqjmwdZrBbA9L61TMQeZazbug1M4hc/2CtrJbsUBthCxPwfWTl52bB8LwrOgYPIhrCzKRQvmqbXzQFFRM/Pb27sTvIYb1k8tFzXMlVbjjt4o2LxasunkS5FUgkojkIyFpzzQoe9XDVvv1MSDDbZ0IGg7qm1te6s77PfpiKIxVbu6G8duAgIeJUtZyBk7ro/5b0bCvgydWiKDrZk09LWUwVn/pdxDEC2TlsFRRf1WuKuM7VMDclvmPHeRDXHWbg0/NwhZhmKYodsCMsG5jPBVN/dLUPdjUEkzJ8dduPILjFyp2UZbOMMcZOFom3WbM5GX0fpZSQHcS5C5IFWPwjQs2+jzuYrl345aFbbHbaOMx+qPVDrcIisJ+UR0jmRZaGBpqn2TtcSIxpysiZhoLjJqoVc/LT+TUHPx0fD0mYN1td0cJR2J2qaobXzlKmrKkjVuIwFDLMWdIQ4ObE7qmHoAiaH67qhF2pW3M9sBXyB/BdQWW/7H/JJa9uug8/HodWX1OxWOdlceh5pJ+XUNnWBWxVhA65oOJ67nUC/aBOScxdwCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199018)(36756003)(478600001)(54906003)(316002)(86362001)(6506007)(5660300002)(6486002)(8676002)(41300700001)(66476007)(66946007)(66556008)(2906002)(6666004)(8936002)(4326008)(83380400001)(31696002)(6512007)(2616005)(38100700002)(186003)(66574015)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0crWmhOYWt0RU9CMDMzZU5yVmhiZ3IrYjFCWm1HQUlsNXFuMDRtWVNwWVZP?=
 =?utf-8?B?TTVQNGRHeG9vOUlPU3d6VE5HaDZ2TndQY2tzc2dmcnBFSjRqb0ZtOC85cUMv?=
 =?utf-8?B?L1dBeUJUdis5d1ZKVlVubkFHdTBpWE1MMllHU01aYmd0VFEzcnFmN3RpY2xZ?=
 =?utf-8?B?WEFlamdRbytNemNpd3J1czJzR0U5WnZwdFRXYnlEQ01MZjB0dk5FY3FpWFdZ?=
 =?utf-8?B?Vi9DQW9OT09tdXNFUDlnTTZyQkRKbEFsZTlvM2JRT2NRSy93VHROemhuL3ZS?=
 =?utf-8?B?YWdhMURGeURIRHB5aS9GT21FYWN3b0lPa1RwQzdXV3Y5NDZkY04vOVZsKys4?=
 =?utf-8?B?YTR3cnV1d21pME1PS0hzcVVvYzR4RCtycWRpeEVlbTZHcktHYitvTW9Ua2tu?=
 =?utf-8?B?S3RvYWlPUjk3RGprVUdTb0JpZWo4dkVnRk45TXZ2bThEa2pNZ1Z6N2dPeEtC?=
 =?utf-8?B?SkZCUS92TVBqWWJJV1NabTZiLzVVbEQzb0IybDZVUmVwRTErT0xYQzlwaW14?=
 =?utf-8?B?YmV5SGd2aURwbU00MTlNR0swTCtuVDdhdGJ0YzJlRGtRdENXeGRzUmh0T1pB?=
 =?utf-8?B?bi9vOFppMmk4MDVOVUYyUVhpd25scjI5ekEzV0k5TFlPdTN6OWRaT3JvRXBo?=
 =?utf-8?B?MFgwU01tTWZYcnpRZlZHcCsxSUFNN2ZPOUUzcUlVMUw4dEd3cmo2R01ZNjB6?=
 =?utf-8?B?TWxrdWh6TWJxRkYvWGFIZ0txZCt4dDNlRzZpSnl1dW00Tlg2TDByQ1pOc053?=
 =?utf-8?B?bnR6a2NPei9kNXdxOUZTYjlGV1BUYlVOUDNLcCt4bWsrN1pMd204aGRnRUlv?=
 =?utf-8?B?RldzWVdjTU1TWUlsSUZianF5OTliYkd1N2JIMzBiNjVpejR0VC9XbklUWFRR?=
 =?utf-8?B?aWtoWG1CZWUxOU1nT2FITGdGV2h1cnBKeFNqMGtvSW4vdk1VZ2w0QnptOU40?=
 =?utf-8?B?eFB5ckNUZ2ZHZE5MaHpDbEVMZ3p2RmwzcmJla3JvdExVMWRja3UrWVl4aGQy?=
 =?utf-8?B?Ny9KU3N6ZWQ0S3RLQ0dNUFlUNXMxeXVDcm1RMVRGR2FuZWo0MmdKSVFiRFYw?=
 =?utf-8?B?bzJMWUo2YzNyL0NPUmZxQURGVXA4aWhhUUZzSjBUWDB3a3F5QlRTc3ZDSUFq?=
 =?utf-8?B?NGVraEhmY0I4ZEhnYlVnUnBnVXJ4ak0wVWhFbmpEalB6Yy9kNFZyQ1Z4emdq?=
 =?utf-8?B?bmxuQWpONjltN3llZm5XN1JJWURXc0dyQm5xc2hIbW04N3g4THVtS2hSYy9p?=
 =?utf-8?B?OXpzRTFQcmVSdUFTZ2dqSGcwVHlDNllBZ0pGeGoyTmNrbG1rbXFmNlRtREYx?=
 =?utf-8?B?VnIzbFBOZC9CNTFHdWhoTjVrcnZaZVBVbVAzQ2k0WU8wcmNHV3hmT2kyQXB6?=
 =?utf-8?B?Y0xrcVJRUitpR0lqOUxrNjlHejhvOXJ2RDVta3Uzcy9ibjZLMW0xei9zNENz?=
 =?utf-8?B?Q1c4aEhWcWZoVnByNVl3Yi80YXduenducnJXZTNIZXR2QlF1MlQ5RkE3akFk?=
 =?utf-8?B?MXVBWDNGMko3WWpvNUJiTmdTRy8ybGdzN3ZHQnptcTZPL25YbUZkQitCQllY?=
 =?utf-8?B?VkN3RENYd212dlBWN1pzT3pzS1Z6SGlhVVdQa0tFSzdmVjJlTk4yU0NOenhZ?=
 =?utf-8?B?UkNxMk0vMkxOZDNJdEJ2S214NklJb1FvVFE1NHJBQWxYalBEdzJETlBMaFFR?=
 =?utf-8?B?R3BaUlNSbCt2S0RvRnU3bkNvNlVoOTJGVk1YL09JRVY5Vzd5dzN2TDRGOFQx?=
 =?utf-8?B?Rng4MndzdHZWWUlRM1QxOVNJZThOZ2dkYVUzZENmY2RDV0ZtM3hneUJPUE9v?=
 =?utf-8?B?Y3hURkEwbWdTTGQvNmJPVndzdlg0Vk1hbE1jMnFjaTMvMXNCNkI4LzZmWDZz?=
 =?utf-8?B?ZHhiOWZGSWZFdFUrK0hRYVptTE43TEFLakJ0clUyemJHd3ZPRVBXVE00bFIw?=
 =?utf-8?B?K2FIZ2NXbTZNTllwNis0cDdmWUNRTGU2R1hOcm9zdXZINlFiU04yanVMaWRo?=
 =?utf-8?B?enBSeFVTMTJoNUFvNzA3aGtqQ1ladXpEajYvUHE4WEtuZ0poNkIzY1dVazFC?=
 =?utf-8?B?bnJISUZnWEVFeUN0QWxrTUxCTk9zaWhRU2YybmZGOVB5UU5YejIvODREc3c2?=
 =?utf-8?B?b1pyZUNGSXc4NTNOLytYaG9qeE9vRG1HN2RTb2Q3VXJRbnZqaTRrQUNRclFW?=
 =?utf-8?Q?LEKMJ02FMEXcS2ctzxfz5/bvPHYaKBZq6ak2wnc5w1pZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a04f609-2c30-4462-8f05-08db26c3536f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 08:40:56.4136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWtrPYw5m3ptsCABbws/EeDRQuZwtBQy22ruwx1xITzUDqXuEfzpIOdrxtKT6UX8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6929
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
Cc: linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Huang Rui <ray.huang@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.03.23 um 09:16 schrieb Lee Jones:
> 'bulk' description taken from another in the same file.
>
> Fixes the following W=1 kernel build warning(s):
>
>   drivers/gpu/drm/ttm/ttm_bo.c:98: warning: Function parameter or member 'bulk' not described in 'ttm_bo_set_bulk_move'
>   drivers/gpu/drm/ttm/ttm_bo.c:768: warning: Function parameter or member 'placement' not described in 'ttm_bo_mem_space'
>   drivers/gpu/drm/ttm/ttm_bo.c:768: warning: Excess function parameter 'proposed_placement' description in 'ttm_bo_mem_space'
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to upstream that through drm-misc-next in a minute.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 459f1b4440daa..d056d28f8758a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -84,6 +84,7 @@ EXPORT_SYMBOL(ttm_bo_move_to_lru_tail);
>    * ttm_bo_set_bulk_move - update BOs bulk move object
>    *
>    * @bo: The buffer object.
> + * @bulk: bulk move structure
>    *
>    * Update the BOs bulk move object, making sure that resources are added/removed
>    * as well. A bulk move allows to move many resource on the LRU at once,
> @@ -748,7 +749,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>    *
>    * @bo: Pointer to a struct ttm_buffer_object. the data of which
>    * we want to allocate space for.
> - * @proposed_placement: Proposed new placement for the buffer object.
> + * @placement: Proposed new placement for the buffer object.
>    * @mem: A struct ttm_resource.
>    * @ctx: if and how to sleep, lock buffers and alloc memory
>    *

