Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6DA6C4F24
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 16:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D532210E395;
	Wed, 22 Mar 2023 15:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2077.outbound.protection.outlook.com [40.107.101.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5D010E38B;
 Wed, 22 Mar 2023 15:14:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeN2CN2XLAAUf7MuX8HzU22cCAQpw4tpsUADB2XDZBegMuFPVEYyD4D+9VaGEUaNmTcdTdK937NLWNtNfDQQfHanrbioDV+wz6P8zvu5e/01jQiKZq+SrnTtKGoQOxVXBlAIEqSk0FXBMHXQIyBHkqAVVdulV5c8k1389BK6bIJw6HjYou7PvGJeWtPsYZv08AkkX9n2Uv7h4ZcqfRgwF9dEA74pDYcwfFg1/H57yo3U5+gLE12h0YqFiwK3PRUn5fal6FZVREFGcshqXniJgWAzM2J0rv5E7DMPsBT4XEiQF495XiGbJ1Ao+q4v2VZeQlgOTqJrxXIMT1RJ3UIr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZXsEuX0cCOW5oVUDIvRe16T0Z/s1mj1ALP5wCx7aas=;
 b=U+wrVPsiyxPitT0BVr9tPJZvFRkmxC7n1aTJYZSOUcw0uyUx48xTyO+T9MORmYjbbaqTAALCM5H++7lu/OfrGH8Ph8fpgUIfykFwlvCW77Vp8+FmCo12FJsxirTyHMcqmIBITXWQP4kY0T8NtVb0ct+D6Rlk3jPsuwznko6vhKLMkm5SmxdUOlF5wzH9FhjGtHs3smpDRvgtrr1osUXdZLeZOjbUszEwWwNnEqu/AZBcA9oVvnm3xzima3yRWzkRF+0qWbdlo9sca0FCnZDkAY6RNIcpNZfxJpxCxL8Biv1yeMPj4dE3cRa0hoTTEtqVWYXtpHlE4gTfyzBA6yDF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZXsEuX0cCOW5oVUDIvRe16T0Z/s1mj1ALP5wCx7aas=;
 b=sBwr481xHYb39Gxy/uzhdoRcWsrsCPf54uAosLYWv2NLjazqc0mkjKdFIuIXL1KRKxk5Rw1qAfmOmkK7W3VHFvwnwnoblAWTXLBZLD8AggpjsntRtUuadCglwdb5VCkl1UClyYytgh85ThMT576i2A8ddrRiO4/NNzsngnI3KbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM4PR12MB7646.namprd12.prod.outlook.com (2603:10b6:8:106::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Wed, 22 Mar 2023 15:14:31 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 15:14:31 +0000
Message-ID: <a7e45c16-cfc7-691c-8bf9-c187f85b7679@amd.com>
Date: Wed, 22 Mar 2023 11:15:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/amd/display: Slightly optimize
 dm_dmub_outbox1_low_irq()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, aurabindo.pillai@amd.com,
 roman.li@amd.com, hersenxs.wu@amd.com, stylon.wang@amd.com
References: <b7cff2c1976308c64951d466fd627989ef6e46fb.1679421347.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <b7cff2c1976308c64951d466fd627989ef6e46fb.1679421347.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::33) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM4PR12MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ef6c1c-bcae-4fe8-9368-08db2ae822a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +zSzXiuIxMxxQzqL7LELXvIRBRw5WWrW+VlrOcw471DeyQ9yZq5iC+KTdIgOum+BDYkK+JL0YRvYcqZXLQT1ITM5EnGrNztRsg0eqPl80BxKyS16NxApE4Wqj3tpf0J1zIQ48X5WddOu6PV8AIefzGZJCnmQsFWn3E6S46XhIXiGtlVN1XxvP/lT0sDmkh9lhGxdEW+2a3+XrKBU/LnjzvPoeTo5gcKr3DSPIQIILtGcPlflkgtppspslgkp99FbvZ2D+2KYZGyuooT5D3/rxuv2kyJQiD+MTDL3dQhsqHjLH0Vr6yH+1D4CA+rYRNpjy3Em5Ppl+d4/pYpSj9CZ9J3A4E5wRHu42SK3TqimAxNeoxfx30dUoKx5I3a/2TAksUdBaV7Mzm4xD6jhdqdKvtdArfFy3s9v2UO3wQhEG+jiwRBxW/Uow96L1sMPL8hbrYGpyc/2cy/5m3ig6nSOKdR9g3SCfljtL/14/ecukhL84M+Ony9be9YPS0Hj+3V/aca76kQ2ibfqyqfFel4NbvjNXIxyEbdX80WTC6gQYHUNhl/TUU2zw+mPGqEP8kPLMkkFq5eB9zUIUxYzDtt6kDJeePM7odylmLP1+n+BqXlnjNuzoWE1+xLbmWY0cuGRD9x0AOwC5d0UeNGPnvN52rz6RDueI76R892AhbbS/Vn0VH/NmPsaSMgyuXYFGysQCtVNvC4SOWC744MFaqIfolooSLkO+KOvw0dt8bAwrA5GxwPGk0SCr1zJppn+/B5k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199018)(86362001)(31696002)(36756003)(83380400001)(66556008)(316002)(4326008)(478600001)(8676002)(6636002)(66476007)(66946007)(6512007)(186003)(26005)(2616005)(53546011)(31686004)(6506007)(6666004)(921005)(6486002)(38100700002)(5660300002)(8936002)(41300700001)(44832011)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1NERUgxUGpRcXJ4U016N1M3NXRHeW1iN0ZiSm9PSzdEUjEzZGZlTkoxR3R6?=
 =?utf-8?B?WUdDK0dvNEo1a3R1VExkQjlNZDdGUlFYOUJLcWVDN3pIUWh3WldBaUhCeHc1?=
 =?utf-8?B?ZEFpUlphNWprSmVCczMzc0ozUnNDK1l3L3pEQmM5REYycXhrai9RbGdOVzky?=
 =?utf-8?B?ZmhhZlliYjUzTkZCaWtIdUlxOTI3TDZCVEJHYlZIbHp6azcrNnBINlYrU1dN?=
 =?utf-8?B?bllYZE1aVkRzU3pLSFhIYUg5WTEyYVYwc1Fmakc2V2x0ZlpuZTBvZ0Z6aHkv?=
 =?utf-8?B?MGp5ampnUi9LendLclJ3djNXcklWU0FBTGpTZ2VYKzQ4K0V1Mm8wY2NDR3BL?=
 =?utf-8?B?c1R4MGhBTWgreXVaWWV3OEJLZDVyeHltMTFTa2lBSDhGWHlPZndKN0hRMFdO?=
 =?utf-8?B?ZWZ4Tk1pdG5lWkVuVzF0WFcwUTlqbjAyZ0wyTG1vcm5sRHZpbURJbm9naSs4?=
 =?utf-8?B?dWFzejlvdWltSW12QU50MllxZlZKdHBreGltOXdRQWVFK0diRm1FMTRaa0xQ?=
 =?utf-8?B?ZW5DQVp6Q3lFeTFXZ3A2dDlEcTBCV2MxdHFJaEk1SFpTaUtFNy9xWVp2blBT?=
 =?utf-8?B?L1ZqUi96OW1NYlJRSFlicytFaGNJb3NWUktTcG5DVDZiSlZteE05bG1Vc3RD?=
 =?utf-8?B?YmJaVUd4Qy9GRzBCa00rQ053TlZaV0llRm8zd3Y0WWxNaXp1bUFaa1EvYmVC?=
 =?utf-8?B?OVJXTTNXKzRWMzZ3blhYWnJhTnJYdHRJVnFpeEhBNTJYeDBjb1FKdEtnM3BZ?=
 =?utf-8?B?QUU0Skx0WEJOeDNwZ1JNMmhBUGVsS0VDcFVzWGY0Sm1YRmhhUXBkVDVvRnZ3?=
 =?utf-8?B?a1VZK0RLakh5ZytkcUdHYVUvVWdTTFZsSy93UzhUYUU4Q3J5MEpiaE0rNFZu?=
 =?utf-8?B?ZEtLK2tucnBqcS92ckowMFJxbnBiR1A0MDdqT2JDY1h3MDZFZE1sQXVWdkJq?=
 =?utf-8?B?M3lWcHF4ekZnTlFCZGpCSm5kSXRYUURkZDk2ZFdJOXhYU3FkRk5JSllEb29z?=
 =?utf-8?B?MTBQZzh6a2dxTGo4OGwzTWhKUW5laC9YN0R4Sng3UmY0cnY2eFpDbC9YYkhr?=
 =?utf-8?B?bFppSTlwNUl1RFJUWWRCajVCQXNIbHptY01hZi83T0FOUVNTSlNvV2VDeFJj?=
 =?utf-8?B?MU9YL1BwNDgwSjZzdm1lcnRtU0JTeDRnNy9Ham1lUlVMNjd1MnNJZFkvckVT?=
 =?utf-8?B?OGNiN2hhbjZLN3FsWTRLNk9jTUEwUVBud08yRmdZQVBwQ29ySHo2SG9tVzhz?=
 =?utf-8?B?cldrRHpvM3lwcys2eklZd1dXa3hRSWt0eXN5LzBDSE5vbUFnZ0VRNjJoZCtj?=
 =?utf-8?B?OVluekNZSTdtbHl0dVpuKy9EZzRHUW9idzVjcEIwMnEvT1NmMXR1aUNMcWVj?=
 =?utf-8?B?bExzOENMWTdvNThsUjdmZEhla3ljSHIvNkJJVkNmMEVrMzlicjJNWUVwdCtu?=
 =?utf-8?B?MUJTRTgvL3pWU09iTlVISWZMUGlSNml0cTZlNGpyTDh1L1RLeXh3Y1A2aEZD?=
 =?utf-8?B?bHZsWGNvWU0wbS8xVW8vK2lKQjJUeHRVeHFqQVdBd0JoMlNWeldRazhGOVpC?=
 =?utf-8?B?M2JzWjZrUHA0N2xqRFBaanM4VEV3NFQxNXN3WGdrdXRrZWtOT2tlb1BVSnN1?=
 =?utf-8?B?S0JWWG1GTGZQbHpnZXJSRlpDVmljckpiVU53SThGSGNzSjRzNnR0N0QxTXpy?=
 =?utf-8?B?SUx1VzQzL3BndytiRmtQaWpJTUtPQ3FuRFBIQzlzcWRSYzJGRDB3Nk9zcWVj?=
 =?utf-8?B?YjltLzNMRHNGdytCVWRLNGlkSzcxTk9wWGsyWFNPcTgzNHdXL1FEb0xtWGNF?=
 =?utf-8?B?MmFOSG53ZVlBVCtqVGN6MjJwT0FUdURnV0x5UFM4dWQrUlF0SE5GS0dRVWZX?=
 =?utf-8?B?WjIveWY2VjhRTUZMV045WGh2SEZhZ21naXVSRGQ2L3NaaWc0ZC9jVWlPYkRk?=
 =?utf-8?B?ZzRaRlJFcktrR3VURGpNTHphd1dNNksrWVQ0dW9DWGowQ1U0QTNyTUVEa21s?=
 =?utf-8?B?bmh4NXFmY2YzUjB2Z3FicTJEOUdNS3VjWUJmSUhPYjAwL3ZQMm9ESU9PM1ph?=
 =?utf-8?B?L2g0eUhFL3E1RkJvcEtEd3VYeUM4TEVMZk9DRnJ3NFVnbW9sNFBoYWR4Ti9x?=
 =?utf-8?Q?2uSB96BCK+Zxr6+LaWGZUQYYN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ef6c1c-bcae-4fe8-9368-08db2ae822a9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 15:14:30.8044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fm1AsHV5ckNOmcEVHQtDouN35Tybi8t3WGdVl3eKMcImVjYrdXja0Elw26H2OUCJYms5ZWw4kRSMfSx1jJ28Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7646
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
Cc: kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/21/23 13:58, Christophe JAILLET wrote:
> A kzalloc()+memcpy() can be optimized in a single kmemdup().
> This saves a few cycles because some memory doesn't need to be zeroed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5bac5781a06b..57a5fbdab890 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -820,15 +820,14 @@ static void dm_dmub_outbox1_low_irq(void *interrupt_params)
>   					DRM_ERROR("Failed to allocate dmub_hpd_wrk");
>   					return;
>   				}
> -				dmub_hpd_wrk->dmub_notify = kzalloc(sizeof(struct dmub_notification), GFP_ATOMIC);
> +				dmub_hpd_wrk->dmub_notify = kmemdup(&notify, sizeof(struct dmub_notification),
> +								    GFP_ATOMIC);
>   				if (!dmub_hpd_wrk->dmub_notify) {
>   					kfree(dmub_hpd_wrk);
>   					DRM_ERROR("Failed to allocate dmub_hpd_wrk->dmub_notify");
>   					return;
>   				}
>   				INIT_WORK(&dmub_hpd_wrk->handle_hpd_work, dm_handle_hpd_work);
> -				if (dmub_hpd_wrk->dmub_notify)
> -					memcpy(dmub_hpd_wrk->dmub_notify, &notify, sizeof(struct dmub_notification));
>   				dmub_hpd_wrk->adev = adev;
>   				if (notify.type == DMUB_NOTIFICATION_HPD) {
>   					plink = adev->dm.dc->links[notify.link_index];

-- 
Hamza

