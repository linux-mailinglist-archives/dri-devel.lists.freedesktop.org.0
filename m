Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8265C60169A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 20:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735B310E0A7;
	Mon, 17 Oct 2022 18:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFFE10EDFE;
 Mon, 17 Oct 2022 18:48:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIXnszuzZUejGfWBLYJbdiKxFD9SYHkLvSbO/yUTPPhy4nn4OidRS/sqXy83OsnsOJ7UAoz93OqP28XxQq9irpC+GIrgfkNkIl8TvKrGPHpLexohy/BBwjvOdexGM0VEC/oHybjGL3CMSNMwIEqV0YHmr3A9qkClCWIG8YnUwU/diQdezZLqnkPKG09gHqa74scO+a5Q3lOHip1+5Y1ffON1e7pX2XoAt6m42juI9HU7ZxA1ZDCZqrYFDDY7RqVwwONh7Ya4pQmsN+gR/1LKFlSvibmWw4kmiJjeASdazkwLB2o1liZ/Q8tp3/pgLoOdBlTfylYdTrBlg6QOY++OIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ib1IyOHf/J5F0ZwutGvwRcwbkOXUJ0vSGdoR28iJbyw=;
 b=CbE4tMcG5R9k3+Jv+1oWCR5FKi8UE+D33UqvP4z3UtFHo/RDiznM8KunUs84HefrRyjFNBN7Xn17GV8XmGSnnBB4XLFLOxOuXeZ9nk9HlBzxM/Lwj+IEHbBeaq3zs9dJ2Jc6OrkMwCpbh52/NJxZnwVlQuGk/3NwLWYlzFctsz1kAecKyNj1DnCsvoMvTewn2bv8Sh82pH1/LCFoFcWmwKTGW1Wm5iuooT/TovFOVJ65bX3X04KmHXXWDH4+FM3regZjDjjlA4xiAqq5b4BPzqmT60RdP1X75/XkrUeaYUm7kU5H2P5HLbHnRjSqlKlOWCPilKTWB8rNpHueXbfvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ib1IyOHf/J5F0ZwutGvwRcwbkOXUJ0vSGdoR28iJbyw=;
 b=Q2PQXK49XjwwSAwPLNhcMq4rf17ufuDaL5psacYzx0Hrly7E/LLjsUygzerzxcAYQesZDw0ZVIMikWHRRmlsOdzB+rQNjtMZ2vjnhWKkCSugca4n/Qplhq1Ti+0Tcrz0qMVxXqfV6QqwkVkyowSM9gAkwFYW5Myq1lwaGrPL0k0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BY5PR12MB4951.namprd12.prod.outlook.com (2603:10b6:a03:1d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 18:48:55 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 18:48:55 +0000
Message-ID: <2b472233-f432-f046-bef3-5152b18a2b79@amd.com>
Date: Mon, 17 Oct 2022 14:48:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3] drm/amd/display: add an ASSERT() to irq service
 functions
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20221017161322.95808-1-hamza.mahfooz@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221017161322.95808-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::31) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BY5PR12MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba129a4-12a6-45d2-ab64-08dab0703df2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PEBZ9l4SyGYcjmjAK8bDQT5WVOOrWpXcTcqNS4LcBkumoBWmqyaNdE8a5hWLtQG3OTNsu0uS9mXO3hZvNWqO4xQlEmVr6xW1GPnmNT6LzT3YZc3Q8Pgdq4STP0me0b3Knhp0+c3PSXeVc8m89DyE5Em2XRKRCiMGOllxBOAi8bqrjGJqZwFuChzdpgo4AA5GzW7xIN6Q99WYKtMfCPQOv79Zt8aX+rVhs62CcDsVmYTDudFhFetaxExO6Vih2Kstmyn3y4UJUMoBjKg8D0O9Z8JZ+I54osSuWwX9kbrAQ9sOVs6d0qbeAcJfAfedU1NHF70lsi7WZN/KRtxM7la+wHLRmXDHR1eSjQK6kuqAJd9hk/vNrqYwVNrVSyzTH01yd52fpvbD2fttmJuwQKpLYFTtL6o2x2S0GRz2jOSTPjJRlZ1pxEm77ttP7TDJhWRWw0a1wefhhK0+hw5EDriXHKn+F/GWcBsHt6OFNUX64NNZ+tGiBheXofO+NirDKZ+eEMyjot15vZxKxx1phGxrTyxCZNKnZg02G4hB55+LULAaGDslRUvJ+m8pSu5LIZiRCjQS82dTO0NVtq63vfIkWs6l2fgrldBqKPKNkTW3HYG5vXHqDNkSwzC9ud+GO3vGv4TRAi8YYekplMemtkMhHaYnpGaDIWMe8+fjjUElH9QQxV9G4l9dtfGUv/GP6Mi8sUScoyRvr6LvD10eKU+fMmsg8t3MHdsZRSK1qxONwQaKN94Y2Etds7phWnUGYg9nrBk7AFTmsP+lzyT4TlM5gYHDCZ+uf4ML8HgJPwT3DL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199015)(31686004)(44832011)(54906003)(5660300002)(8676002)(316002)(478600001)(6506007)(66476007)(41300700001)(53546011)(6512007)(26005)(186003)(4001150100001)(2906002)(6486002)(4326008)(66556008)(2616005)(8936002)(36756003)(83380400001)(6666004)(38100700002)(66946007)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnFCYWQyeldYVFhNdTYyQzBBTmpzVlBWS2ZPd1o1QmoxdVVDSzhVb29Wa2FE?=
 =?utf-8?B?TExOOXc2U1FOWThRN1VqenlHMytDcU5QSk8xQnRoaXl2YTROektocU94aHU5?=
 =?utf-8?B?NExiajFRWlhrRDBqNFFDZkYrbGs3ZVdXdGpUQzV0eGhISmR5UHNMYmJEYWMv?=
 =?utf-8?B?V0lxaWlBY0IwWkhVdlFDOGxUL01ldXhGZ0pPSlo0VXVVemhtc2g0dzh4SlR6?=
 =?utf-8?B?b2xydXNQSmNrTHRaeXNTeXhJMzF1R014bXhSNURoOU40RVFmaTAxWkxYY3ZL?=
 =?utf-8?B?Y2Z5clJhcUUxeDJOSnV0bDV4WUZNWko3aVgyTGtRYm8wdGRMa1U3TjZRZVNJ?=
 =?utf-8?B?UDUrM21ZOEtjOVZQUjY3QmExcHFaWDh5TVJWOGxWNVV2cTZGdGJaYWFvaXhF?=
 =?utf-8?B?T3NENUVBY2Z6ZTJlQ2hEQ1ZuZm13Vjk0Y3o2UXFicHNhU21LVThkTm1VTkNh?=
 =?utf-8?B?eTk4b0IremVyaTBQUE5rVlhLL2MvdzhacCtTSUFXVGVrYnJqMm9XdGFKSi8x?=
 =?utf-8?B?bWRBejMvYmhuOVEwZXRQVktsSGxmQlBaVy8vVklMUTI0R0hBeW40c1ZOamZa?=
 =?utf-8?B?QzA3WWhLb2lZTmZTTGdTaG5Vdkx3MEZPT0dFT25OYUNFTW1uelNOUFMybEZB?=
 =?utf-8?B?SDMvc3ZhT241V3FoelBoT2J5R0JLcWE1UWFLcnRKMmxHRlM1WDhwNHAzTUU4?=
 =?utf-8?B?V3MxVGZ2T0w2M0xjV29VMXliRjhJeFZENE1BcGthMlhOenBBcWFZdmJzeHg2?=
 =?utf-8?B?RjEvSENnRkVTRDUwczJxbU42dWxsVXEvd0dLclg3S1B1OUxQVjdZTFhyQ1Z6?=
 =?utf-8?B?MzVrS0VGWGJhbXh4OG5IOHgxTW5RQU9MSkVwbERwMG9laG1iV2oxV1B0eWNH?=
 =?utf-8?B?MzVCa2ZmMElTK0ZtQzBXb3kvV2NJYVR6STdsL2NWTk9CT2xoODJLTXR6akpK?=
 =?utf-8?B?dkdiN2tubUNOd3hPaU1tckQ0NUw1VTdTSm96a05TQVFPL2xuMWpuRkY2L1lN?=
 =?utf-8?B?ckVCRWxSQW5CRDJTa3c1RWRYeDQ4UkNHSVpPU05CMDRML2p3KzIzempJM2xJ?=
 =?utf-8?B?VC9QekozOEwybHFKQXM1U2c5Q0ZCYk5zdlFNS2tjdUZqTW1nZ05pc2xVSFZC?=
 =?utf-8?B?S3lnSWh5YUxuK3dzVllmRERQQnU4U1ZxalRsSS8wNFlXN05ic3ZXOFRWYVNn?=
 =?utf-8?B?bHhxZXowd1dMYno2VDZST2RTVVR2TGJvL0ptZUVXc0ZvYTA1ZE5BeGhBYTMz?=
 =?utf-8?B?VmVJRURXTXpxdC9kakpGWHBkNUcyRVFvWmVHSlZqRm4ySkpMM0dTUTNvZGhG?=
 =?utf-8?B?WjB2NVh1WjdtQ0VJenVVUkRQS1pZN1p5UVdHalJzZUVwQnZyZTNlUUlnZEhh?=
 =?utf-8?B?b0tOZU1qWG5Rcy9ZUjE1Smpqc2xyTVlPT1krb1FJcTBIVUhWL202T1dvWjVS?=
 =?utf-8?B?TkI4a1A3TWdEaSt0eXdWL2dtaXFveHBsSysyaGpmUE56Mk5GYUM2Nlc0N3h2?=
 =?utf-8?B?UWd1NTAwTUw4emdnOFJpa0RMREdSSGkwUGFxOFA1L3ZuMVkraE1BSE1vUWxH?=
 =?utf-8?B?dFZHRXZpVWF1ckl5ckNnMU5xZ3A1eXZRVnovZ0xldElxMmNTNzRDTmlTNHpy?=
 =?utf-8?B?bEU5TXFPNmtoR2lRcXJjdnVleUREYkRLSGVhdEZQMThHREpLdkhoYkJqNEJ2?=
 =?utf-8?B?cDVrVm1yVysxbWhTc2xFTDg3SVh6T0JFelowRjZRWVFVZys3eEVhNHJrUkJ0?=
 =?utf-8?B?bXZzY3UwRnR5U2FkVDhOUkc3YkNWMXR4ZFVCMFdMZVViUU5hTmgvMEUzczlw?=
 =?utf-8?B?N3NLSnFOcitMU0J3VTVtYithRC9FZUkyRWY4YUgxdmhqZHBXZU5EaHkySmRQ?=
 =?utf-8?B?MWo5Z2xzK29rbXdKWmwrRDZsMHhPdGpJOWFzVnp5RHQ3T09SYlFWd2tTL2N4?=
 =?utf-8?B?a1Z3SzdOSHJtT0hOdHMwZ3VGWHkxaXlmUmVSYkIxZFFaRnIxZDJJSUpDVHdi?=
 =?utf-8?B?d3BsRWtZUVRuTmFybDN2elVMNytlNENHY2VEa0s1MzVCUG5EalhkVXh2RW93?=
 =?utf-8?B?NDJlZnlpd1MvSW8vMHpUSzYrVGxwWnMvMzlSSG14OUE2S25TMXo5OVU2SDFB?=
 =?utf-8?Q?Zfgb9Qdu7c7XJxfv7kjNVUbpq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba129a4-12a6-45d2-ab64-08dab0703df2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 18:48:55.1297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/GtQlmCgsvJBFY+swiICUP1Vkj/oeDCLRvGWzVXgcKRfeUB8WyMV2woy7xytWaTq+MoaBFtPwTuEBmSzhJkFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4951
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
Cc: Stylon Wang <stylon.wang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Roman Li <roman.li@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-17 12:13, Hamza Mahfooz wrote:
> Currently, if we encounter unimplemented functions, it is difficult to
> tell what caused them just by looking at dmesg and that is compounded by
> the fact that it is often hard to reproduce said issues, for instance we
> have had reports of this condition being triggered when removing a
> secondary display that is setup in mirror mode and is connected using
> usb-c. So, to have access to more detailed debugging information, add an
> ASSERT() to dal_irq_service_ack() and dal_irq_service_set() that only
> triggers when we encounter an unimplemented function.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> v2: detail specific instance that I'm interested in and use ASSERT()
>     instead of WARN().
> 
> v3: move ASSERT()s inside the new if blocks.
> ---
>  .../gpu/drm/amd/display/dc/irq/irq_service.c    | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> index 7bad39bba86b..d100edaedbbb 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> @@ -112,8 +112,15 @@ bool dal_irq_service_set(
>  
>  	dal_irq_service_ack(irq_service, source);
>  
> -	if (info->funcs && info->funcs->set)
> +	if (info->funcs && info->funcs->set) {
> +		if (info->funcs->set == dal_irq_service_dummy_set) {
> +			DC_LOG_WARNING("%s: src: %d, st: %d\n", __func__,
> +				       source, enable);
> +			ASSERT(0);
> +		}
> +
>  		return info->funcs->set(irq_service, info, enable);
> +	}
>  
>  	dal_irq_service_set_generic(irq_service, info, enable);
>  
> @@ -146,8 +153,14 @@ bool dal_irq_service_ack(
>  		return false;
>  	}
>  
> -	if (info->funcs && info->funcs->ack)
> +	if (info->funcs && info->funcs->ack) {
> +		if (info->funcs->ack == dal_irq_service_dummy_ack) {
> +			DC_LOG_WARNING("%s: src: %d\n", __func__, source);
> +			ASSERT(0);
> +		}
> +
>  		return info->funcs->ack(irq_service, info);
> +	}
>  
>  	dal_irq_service_ack_generic(irq_service, info);
>  

