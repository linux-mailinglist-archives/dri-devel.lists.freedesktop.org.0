Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FC27501ED
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 10:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8CF10E089;
	Wed, 12 Jul 2023 08:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C01710E089;
 Wed, 12 Jul 2023 08:43:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HW/R4vvpqpDrXsdhWiF3WN+vDTs8cFqoTnNL6j2zsOaivmiSAfqPv2IvuByboC10vtuLazBRiZPMdm8HlBv0wbiG3gDNDF9lh7fD1M4WhBKcOApn4Sbs+OvSv4JnMyxebRkwbukxveKpNLHCMOWFTw/G38jmTIogyR7UoKmkPv8FtuswJ7/pUGTp3Cc6+Xl+os3+q/CpzZDjs7VegEN0clYzUQkiZYGxLMomyKrVI3Ja09Ew8czKu7rhKj/UsQQ5F9RQ3vRTUUCYa5jmg5sz0tKGYvyGeAkiBdwGvC6j8xiKDYUqNKHJbE+aS2OmAXOIWzqculBcuMnrSCJr+ZfXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKklS+zNTZvSaFZJg9lBP9URfvrCnpIY1eN92W29wGk=;
 b=hWJbk8Xl2so1oDT79g9w3l/nwym5LaWos/3xY51RS0+cikDMnOLvCEoSEhHT3RsU/PuJoTn0XDrrdZB8K/LFDZh/hFY6Eqyga7gNfdf8mIaiZYDi6tCEipUkT4lspKDXcBtH/l2qZXT0iTd+1x8bfUNfDmNkvm/mquLYXxekpOvMBVBl+7v7lOCeYwN/DY0SIl2IV1A9dYDyh1uIapl+yALAYnJtMe81JUpGE6dhh9+EkNY02vw7MCirRrbZ66ID3GIK6lZSWSWLi4SnUtIZSO1eVb10X2qsl3jUQlLI75StUL+Kz/F+8dqT13mDMwu4GEM62T8DQ3Yfti/sDt9S0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKklS+zNTZvSaFZJg9lBP9URfvrCnpIY1eN92W29wGk=;
 b=5nSYEAIJKHOF6EoRvUOTsRJ7RjUVysr5XO8qk2z1nHXltEkQtGfycewK7YBiMI4umUWyB1t4p5zpz7Yj0voZcVo5jJlrg+hqHgeEtxWD9cQwhB3SgpQtPyGJy33EInI/YLanHO3RsAIJseNyxSBP8g08CSlnuNxoIi2fdFrKSkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB8402.namprd12.prod.outlook.com (2603:10b6:610:132::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Wed, 12 Jul
 2023 08:43:27 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 08:43:26 +0000
Message-ID: <c7dab9de-9014-720a-ac11-77d87e8231c5@amd.com>
Date: Wed, 12 Jul 2023 10:43:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/6] drm/amdgpu: Mark contexts guilty for causing soft
 recoveries
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230711213501.526237-1-andrealmeid@igalia.com>
 <20230711213501.526237-3-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230711213501.526237-3-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: d603c08b-b651-49c7-5695-08db82b40f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tcUMzFh9Ehk1JxhPLoY3FE3ZRpkBAEXFbMPbzOnm/UpMbYMVATfYG4qgDwwkL4FWl06qacJ0KZvJHuYmA6+kUUDiyZVVUBJS4o2Sm0V3jGX3ox+a/xZ7BBSMlC5/Djl7RvdhnndHW31CtVvm7VrvHkSxA+ILD6BaJOXQK5zKVX1TuzYvvynm5l9377xSY48CAqUXn3nhNVqKO/BJhqBx6MMan72/ydG4/wfWMctumtZ3o7HeKLAMPX00Lh/Xr7nuFqqbrog6NE4ybff9TX5sLd042Fj9CzBrz+GpGcjSz6by22BYru9u/CWJTDk9YagFeowiWbAwPfhx4Bgqa9Ch5gNzYnGJ0aoKchgJoHN2QYx35QPSahTuwIGkKJVDmbTpH4odiZmtVCQVfaaXYWq6eKyVp/q8qvQvMU4yAPZxOp0C021NLVr9jxqxibHN3/31J9SzYbsjGKuhfgv0sDeRiPfl10SCaPW7ZU+xnokvmXdSix7JDBCjH1RLrr4nZSsV0n+QKz1v+O0VXYrTbyf4iH3plWhvVdIg8nzBSZ3JFFV8ZPrTXahaqK9F2G5w8Jz2OXvdWDnGzt1pd9WF8Xi/5iJpzDKyrnBJCrvRIh11NSR/Ch3f4Ys0wjNFlD7/ulo93mhLo2DGTSRa5M9b4i0CbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199021)(8676002)(478600001)(8936002)(316002)(66476007)(31686004)(4326008)(5660300002)(7416002)(2906002)(38100700002)(54906003)(41300700001)(6666004)(66556008)(66946007)(6486002)(86362001)(31696002)(6512007)(6506007)(186003)(36756003)(2616005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTMvWUdweTNuTWg4M05tdkZOU3dGdmptR0ZxU2tWRlprK2JrSmhZOFdxcXdr?=
 =?utf-8?B?bVloeXJIc2VUNFJ4LzAvUkVwOThJeEpuRWRIbDBqdzZrc0dQMStIY3hyS2lY?=
 =?utf-8?B?SEhGWU9zeTJKQXlyMXF2R0xIdCsrMjJUUzJCa1pPb0xoaHh3TGNzdG5XdGwr?=
 =?utf-8?B?NyswT09HVGEzRmFDMEd4UnZuR2xFZ05oWkZEZGQvMGdXUEpLRS9nMi9NRFA3?=
 =?utf-8?B?UE5GdTJVVmtnVmQ3akdUNFBmWU1TaHdQa2ltMVRnR0xTMlE2c2F1dDJJd0Iy?=
 =?utf-8?B?M0hDaVVOZlhTS0Z1Y2tJdG03a01CeEgrZmdpb2QwdUFOdTY2L3JyUlJBVThZ?=
 =?utf-8?B?dTRudEdJR2R2VzlHb05wNmROWVBvajFWZ0FLMFkvRkNVY210V3dIYStPaHNX?=
 =?utf-8?B?Wld3Ry9Db3BWWnk1U3IrZ3lDVmFkZUtvSHZ2YmN0MEJMRis2Q3YwOENlM0JG?=
 =?utf-8?B?b1BzQ0xrYlVTUzVNZ2VhUXZpaTc5bVlUdUNlS1haWm5zN3RDWEdEc3pEQUJ6?=
 =?utf-8?B?V1NXRmtBeXVWTlZyOCszS1hhYXpvbHp4WmFvREJiSWpCTHJSajNyTnNzTmYz?=
 =?utf-8?B?bFVBU0xzeHJLUEZ1OGlTWWRRbm5ZM2paY1RZWFIrSHh5dnV3ZElsb2ltL2h0?=
 =?utf-8?B?RUVHWHVZbWRSZHBqY3ozNFZwZkNIOHhVK3hMLzVjVVBtWkU1UVVOV1FuMHU4?=
 =?utf-8?B?NUdGNEpOSFdNckZQemwzcDVoQVFhR1Z4Mk0zKzVWNzNtVlExL2ptMXlNejNI?=
 =?utf-8?B?dzFDSHdxWUZIUFZ2MFFqbTNodXVtTEdDRDNpVG8xUXIranVWb0NoVFRZUjJE?=
 =?utf-8?B?amFFc1ZGcDBualQ3NWlQNUdqZlNQbHpVMGJ6YjZqcU1tTjB4YVNsS0MralNZ?=
 =?utf-8?B?UmNYSTYyTGgxMVI4MTFOS2FLSFlCOFAyREFHbGJBaUY0UUpLMjZqbTFtRXMw?=
 =?utf-8?B?TTJnK3ppMkpuQ0pxL0YraVhERElCNEJDV2w0cTllUGFDaDdrZVFvOUtQQlJs?=
 =?utf-8?B?eHdsVTRLZXRVSk9kTXllVE9JUkNoVE1mZkRXZ3liSk9jNDBpaEtiYXBEMkxm?=
 =?utf-8?B?RlNncU5JRXlCSEhLMG1JQ2EwNnAyU21lb3ptRDRWMFFNOS81ZjNwdW5vTlgv?=
 =?utf-8?B?STU4UW9oczdLY3QweGpQNlg3MEJIZ25EdXYzam5lRGJXS3BTM0FaQW8rRnVY?=
 =?utf-8?B?enl3WlVycUlVdlp0WmY3bVlqMi90ekZ1UWErOVpaNWRwcE5JOVE1QnNDVGxP?=
 =?utf-8?B?U2JVVnNoTGFYRkFkUDd3UVUzNkliWll4Z1lpODVuRUp4eGFwMWJrcTRFVHhH?=
 =?utf-8?B?N3l6MysrNXBDMnA4UENJdEhyalZ4bDJTZ21ZNVVSK2RjM1k4bTh1SURtSFRB?=
 =?utf-8?B?RW5TNS9hVFVaaDBoa3dNUU10MFlXYnB5UGdLVTJoTHZ2SnhmeXltRWd1YkVH?=
 =?utf-8?B?cnd5TGJjT3dZOVFSajB6bGNaODdKeUxkbjdybFREd1g1alR4YU9nZUtBUmdD?=
 =?utf-8?B?dlBUWkMzTitUdWI2MUdtS3ArSFdjcG5QcUpsbEhuUk5HbmdZZ3U3LzdaSDN1?=
 =?utf-8?B?SHVKRWhiaHNmcHRJbCs2WUxLQmRHRXo5dXZML1Nta2VUTm4rWlgyNEFMRmZN?=
 =?utf-8?B?Y2ZkQ1FFV2VHQlNJM200YmpOQy8vNDJFeDFuQVhPeDhVL1VDUkEyWlJaL3p2?=
 =?utf-8?B?Wm1zaC8xWkZiaVBmRncxc0I2enBQMlRJUjZkazAxZGo3bk52a2tDOHl3VDU1?=
 =?utf-8?B?TlI1d3pQRVRicElHcnY1OHpoU1EveVFYaHpmbzdpWmIxTHFGM1RqcXZPK0p0?=
 =?utf-8?B?ZC9LY3ZITXN5WXkvcmNkczdVcStVdDNOWEl3QkJ4VDVSYTdmKzBsYktLM0o5?=
 =?utf-8?B?cjE1RVRIa1BPZ00rYkxSbkdGMWFsNEh1VU5KalhNZ0lIcjVRa1VHU09ORlIy?=
 =?utf-8?B?T2x1Ri9Kb0V1Vk5rRXY5ZkJ5OTFFeEIvTUJFT3I4cUE1UkxIUGRvOXlPOEhP?=
 =?utf-8?B?c1JFNjZMSm1MbmtvMTdVVUlRVTg0TzhkM1VoOUlqQzQwWVp0S2U3WDNuc3V0?=
 =?utf-8?B?SHpsTnRWOEIvakRsdXpYZGF6TVlaNldFcjloNzFsSklpUG5JZjdObEZwUzZw?=
 =?utf-8?B?UVJTMmRtQWdESG5vNTRyU2RDcDhSQ004M3kvS2c5Y0RQclY1ZWt4N0MvKzZM?=
 =?utf-8?Q?sqT+jODTNxqO1OaYaUf3gRfUmuL2CAVflTGaXwJE+6ov?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d603c08b-b651-49c7-5695-08db82b40f3b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 08:43:26.6627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rq9dSS1HrYD4qt3zmdrJhftkh86uX12URap/PxV5ZwyXzqhOhtlGCztxj1sVakj9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8402
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 michel.daenzer@mailbox.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 11.07.23 um 23:34 schrieb André Almeida:
> If a DRM fence is set to -ENODATA, that means that this context was a
> cause of a soft reset, but is never marked as guilty. Flag it as guilty
> and log to user that this context won't accept more submissions.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index 0dc9c655c4fb..fe8e47d063da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -459,6 +459,12 @@ int amdgpu_ctx_get_entity(struct amdgpu_ctx *ctx, u32 hw_ip, u32 instance,
>   	ctx_entity = &ctx->entities[hw_ip][ring]->entity;
>   	r = drm_sched_entity_error(ctx_entity);
>   	if (r) {
> +		if (r == -ENODATA) {
> +			DRM_ERROR("%s (%d) context caused a reset,"
> +				  "marking it guilty and refusing new submissions.\n",
> +				  current->comm, current->pid);
> +			atomic_set(&ctx->guilty, 1);
> +		}

I'm going back and forth with that as well.

Michel has a very good point that it often is sufficient to cancel just 
one rough shader to keep going.

But Marek has a very good point as well that when that happens multiple 
times we probably want to block the application from making further 
submissions.

Christian.

>   		DRM_DEBUG("error entity %p\n", ctx_entity);
>   		return r;
>   	}

