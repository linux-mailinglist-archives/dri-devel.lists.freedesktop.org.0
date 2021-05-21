Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5950338D08E
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 00:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A0E6E157;
	Fri, 21 May 2021 22:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF25E6E157;
 Fri, 21 May 2021 22:09:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFnDHP060Z9YKIfb4M/9ayI2vlp7FDtzIfHKNBI8Fyj0Qm0cjnNWt39pE9DnLbOXIewBGD84rSNVg5188WugqD5+hCdD0dioKeRRgEZy2KYjNmL2uq54d7nEESy1/2U0xbm/URX341OcocWRyELhArgj1lsXf4P29B8T9N+QjqRnnWrK7BRJ+o94tnxxj+jYcBKFG6rwN5noyXOCmohn/k6K0JYho5gdXqJUXeOdQKwB+PtAJGafD9z5ElfvvWzm/VmN6Z9njsCnTNR7m/nJGBxh2L5X0rh8H1pqTrd6SwzGn+GwXhfBal1+2R3uKih2wNUvMWBWqiLR5ihgys2mmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oj7EwLzv8zmJQ6OpJYURBUiltqTI2KH3cx4gqFCawNM=;
 b=NX3VeZl7F7sN9zqYEnlps3vMfb40jI6sU4ECszT1R3BmLjUi1PWYd+Q3AjfYuKMthmnh46W4wJ7MpCmebYqWkBss8uXkU/kWWPxcwzRpItHdeCAWglkgM83dq6rgrZ3PxH6ILlfJhRwhkKw9I+jESgg4fyWxtzsguTAdsFgXXXX2S9MshA8Lw5LT2EDlH5GKfx4vZlEpvXl5387bG+2gYF+ISXLdpBBPE/arP6ORH/UapyxHcowukM5pfm1mktIYdkXnlPU1R1va9ibrOwFguBRk/R0PA12WcuxryrCma6bjCQXYcz9malKAmnHtIxyUPa25dihIfPL9JGw77Qz43Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oj7EwLzv8zmJQ6OpJYURBUiltqTI2KH3cx4gqFCawNM=;
 b=ptmWzyGHMmxkjnFEftfPBw+FYrt21ZcaEg9BpDggMl/hrFSZLAob2jMn60IqaNLjtIE85hZMWZ8EY611SwYctCMgjmnM/b9SgMgjbeEeBJRWZfC/I55mbNKaIcvWzPUaN7cWwRp48M6s47y0hQYC4QzSmfyDTDA3WlIPTG9MH8E=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5163.namprd12.prod.outlook.com (2603:10b6:408:11c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 22:09:01 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 22:09:01 +0000
Subject: Re: [PATCH] drm/amd/amdkfd: Drop unnecessary NULL check after
 container_of
To: Guenter Roeck <linux@roeck-us.net>
References: <20210521150212.2076151-1-linux@roeck-us.net>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <ac17a916-f205-96b0-d49d-d45c06c01205@amd.com>
Date: Fri, 21 May 2021 18:08:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210521150212.2076151-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [142.186.56.206]
X-ClientProxiedBy: YTXPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::40) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.56.206) by
 YTXPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.31 via Frontend
 Transport; Fri, 21 May 2021 22:09:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8eb4c450-5667-43e2-e3f2-08d91ca50a1a
X-MS-TrafficTypeDiagnostic: BN9PR12MB5163:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB51631F0927AB794EF6BED25192299@BN9PR12MB5163.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LPPG8Z4H3sQpDShlh9IkCfcSTEPe5AF9bigha6+hVPj7Ftn9kT3vaNVvdQq5o6ettt8XeSmvklrtIpZ8l2mBKwEEElXcGqxbvGoddr8nxWQfs2wiElYYSapR9JMg9JrSQqmauHCQjcYGg76mJRgK/Waq6OtI1MVg+KrtnZpiHFUhiKuIufazDKtt0V8t17NDOm/Rio79io0ba4tLfbfm8rk61tKAiduT1Lxv9ndGfFs14/hM+/DOgsGbqu0GXQN7VAvQPyMp39DgXzlpW2GCfwMH6I/GcMsJSfqyI+Sr7zcB773Sd8iOuGzMI5ZCGdtAtU698wDRGh13vAllnQtlLecs/AuprBJ8JDbYvHH/fdqGc7tihz11+nSfqmZTRTTnhVuM/ztK3RaXwKi+xe38csHmOMVle+XTfYqcc+dchWnYqLajtrKCPuBy1IdNmfAEMgoLx1uvtFSDAhRnKfrXVvE9fwrPccA7CpaAB9IUIXDy5mi4AWmekZ2YNQi7+EV4Pbzq1JZxYsHMHw2MhsWYgRq8SymTFyPyp0XAjz4nu4lom76yaEqT7/BeE1lvnu5LvXrUhvw36/K55f9pUKl9dObXxkqstyvJF2Qli3SHc23dOfwQvV1od1NprtDv48k/zWvhOQs3+fWzwH3fmjsK9chu0DUe6ZRM6W3+YkC9EoE8pU4aK+vpD2K0U6/MFo7V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(478600001)(66946007)(8676002)(956004)(2906002)(8936002)(2616005)(66476007)(5660300002)(54906003)(31686004)(16526019)(186003)(66556008)(26005)(31696002)(16576012)(6916009)(44832011)(6486002)(316002)(36756003)(83380400001)(4326008)(86362001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cVhtcHpTOVhIZTcyaE8rNzA1Q24xWEl1a2pUb0N2TU9ScjNXcUtYNnNiSldO?=
 =?utf-8?B?djdmWWx4K3BvZHVyNEg4SlJsR3dieWFkMXlzdmdSd3dxeUxXTW1BRmRvUjNy?=
 =?utf-8?B?eEN2K2I3ajFGbEpXbStsaXR5ZlhFeGxKMkQ3LzcrNjl1NHlDazNCWVFzUlQ4?=
 =?utf-8?B?MnRvS2hnMmM1Z1pmc0I3RXNZaHdvZWdpSFFuMDFYQ0NsQVJqd2xOOEVqeDQ5?=
 =?utf-8?B?TDJHQWZNYWdOdm5scEJzUElEUlNENEorODRGTkNGcUM5T3k1cEcxNWt0b0tF?=
 =?utf-8?B?OFB1RThCQVlEa1VUREdGcklraEVLUFhndEdUY3lpaE5VZFNQbmpuT2l4T2k5?=
 =?utf-8?B?Vzg1ZG1GNno3cFpHQUdyYzFKUk9qcktmOWtaQlpVcEVlWGo4UkNDaVVyMHhE?=
 =?utf-8?B?NmFHODBpZWUrZlVvejJ1Z0xBQU1WSFVUZ3E3WVFZaHhYYjVLOUhLTWdINm5G?=
 =?utf-8?B?TU5DUmt3c0pMNlFTdzFYQnZGWWV2T3ZFNXE4T01EMUIrMGJsZnJ1MTkvOEFi?=
 =?utf-8?B?ZFRob05qZUlnRnhiNnBVRk1YUjFidW03ZTJ6UlpGWkkvbmpiR1NUbmxqUXFx?=
 =?utf-8?B?SEp1QUpXeWxFeVhTWFJoamRtQUVyL3c1Z0I3VllITmxjZ2RMUnplOFhYZ1A0?=
 =?utf-8?B?TVNPK3ZQRkJtRHNaM2p6NWVKODl1YlZEKzFjbVB2RVY0RWFKVHlLU1o1YjRP?=
 =?utf-8?B?ZUxEMHl6V2Z3MGY3ZzNTbXgrNnROUXh1ajNZZm5RQmVGM2YvSlZRbWxpWGwz?=
 =?utf-8?B?YXY0ZEN6U3o0eFhZVFB4elZTditlWVJEQit1LzZ6RkNGVGd1QUM1b2pWQWZ5?=
 =?utf-8?B?V1owSGg2ZTM4cXBUVSs1YlBaRk12MStnQkpuV0N1WXl5NTVreTBlelh6VW5z?=
 =?utf-8?B?RCtXaTIzZ2VTakpIQkxUS28yd3psejgxWXM2SDNjaTBwSm8yK0VVb25sZjVk?=
 =?utf-8?B?d0Zta2lKK3c0ckl6NVN0ZjFYcTdzbG1JOHhzbk11YjF6LzZrditCV0VyZm9Z?=
 =?utf-8?B?NFZmbEFzaHhBRXRIbEQxbEV4UENaMllaQkppOUZUUnNsSUJWRzVLMmxHNzNr?=
 =?utf-8?B?amFQcnozYllqczh4citMbTZESThWTGhFcTlTZmtVMStFWjRsVHBNdmI1Y015?=
 =?utf-8?B?TmJUUEgvNzFCSkxNa3dna0xwWXJtVVA3M3JmdmNnQU9zOXFROEt0L1htYU1t?=
 =?utf-8?B?S2VDS0NseDBLdW9nd29NTlREb0JiY0p5cDJRRnpYemhESW9KdkNYbGwrR2g2?=
 =?utf-8?B?MUtjRzNremd3Nk1ncE1hM0ZpQkZuaEhvalZyb2hrVUxoMnhOb2JvZTdNdEJ4?=
 =?utf-8?B?UlZhOElFNnNCYzdJc0ZxU0g2U3ZoWEtCN3dHVUpabHBYK0dQV3pOQWFhN2RH?=
 =?utf-8?B?SjZlNGtTc3VrRUIvNDJDeXV4dlN0MGYweUZyVkpRZVdadUJYQkJoTmZaRG9X?=
 =?utf-8?B?NTVnMFgwbDhYdSt5djZsMGg0UHpneGd3QW9wdjNWVkFjUTc1ZmJMT051blh3?=
 =?utf-8?B?d3ZaZGlveVordG0xSFF5VGFCd29HZzhwNmNNOVpYaXpPVkpKOWw4dHVsUnlB?=
 =?utf-8?B?dGlzMFpkY3JZM25jRHhVT213T25MR3BXRE81V1NwMUJCS0NKbC81clpPUXc0?=
 =?utf-8?B?eitpMXV0dFlKK0Z5cUIwQmg3Q1lsUlRiQVZ1MnVxbnJSYjhXL3lscHNURDlP?=
 =?utf-8?B?VVhYR0s3aVNET3J0MEhJNUlSbWw3cVdGcXlCYmV6YmtCRWRGOGU0WUR0RExW?=
 =?utf-8?Q?dPPpNYosRixoQlciD5sJatF/ywF5DxfoCc2Rs1e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb4c450-5667-43e2-e3f2-08d91ca50a1a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 22:09:01.5447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: er0Wobt5rVQj+uzzYZgwZEg/FBAAECQssmkL8uUsVQT4GhE1S10keMrQh6FKwrVEl43HQTVXFwFUGMZMtnC4mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5163
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-05-21 um 11:02 a.m. schrieb Guenter Roeck:
> The first parameter passed to container_of() is the pointer to the work
> structure passed to the worker and never NULL. The NULL check on the
> result of container_of() is therefore unnecessary and misleading.
> Remove it.
>
> This change was made automatically with the following Coccinelle script.
>
> @@
> type t;
> identifier v;
> statement s;
> @@
>
> <+...
> (
>   t v = container_of(...);
> |
>   v = container_of(...);
> )
>   ...
>   when != v
> - if (\( !v \| v == NULL \) ) s
> ...+>
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Thank you. The patch looks good to me. I caught a few such pointless
checks in code review but must have missed this one. I'll apply your
patch to amd-staging-drm-next. The patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index 5b6c5669c03d..2f8d352e0069 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -110,8 +110,6 @@ static void kfd_sdma_activity_worker(struct work_struct *work)
>  
>  	workarea = container_of(work, struct kfd_sdma_activity_handler_workarea,
>  				sdma_activity_work);
> -	if (!workarea)
> -		return;
>  
>  	pdd = workarea->pdd;
>  	if (!pdd)
