Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588C3A0C92
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 08:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE2A89F4F;
	Wed,  9 Jun 2021 06:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68EA89F4F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 06:38:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duARo6zN9xVRNC8hiZ9XgKM5TTd4PNp+P3QcQboOwAuyTtqPiDJB33vV8R54CioIKtmzw4pqaPYtR2HHopg2j60um3f9YYd3S7JpdzhrwX2DdKglm2fuzUgcv3yVnYzqvI7FZc9HxwDSaqt3tQZplGiH0dS6jmfo1YaXf/SSo6pHrKMdeTL8Dnp8IiChZo+t4Vx7sU23FBMeWT6pZtc29Bos+1DKZQMVHwA1OXsxfRn7XWsyNmu9cIggvUYAW2qnkVbY05uYQeGhr2ar5sOSovBS5f9GR8WyFSLsfiXm4Wc9JdCPHGAQv+Gd6RgWFAcpr2B1CKs4W7rhdcnQRcZziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0ooYwS4Oly/+o0gkjOhO8lCNpvKYO5f3oznrKehp7U=;
 b=hTehlHFUuZ74/yY8vuiAmtzwZTsQ9d0dviWYZwyvKOBJBKatw0mj744oueHhj2W5bCYxmfvRr2+NHUXaZILXjIk1p/i+0+FzOxXsfpWJkewIjF03peq/caw7zbQBJltUlEghnwdUoXq4zmnKtsubvELI6ZEMNO/cVlo5Joy26/qxMKTH75WpPrTga8VKRBXbTVNvkjPeQ3lyKYIPxeQLAE8ZziBuTyblj+JG7r4Q4YKRDjfDUQkitUr9Wu17KoSPaduY0BlZTTQPoCSfZh1GfR0t71OruW5s34mE+r/7bzfUBNFcLogw/FmnX2a9otVpRVnn7u0IZaeH4bliNfuoUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0ooYwS4Oly/+o0gkjOhO8lCNpvKYO5f3oznrKehp7U=;
 b=DYjziBUmu7gmd14KtaY1HUhB4cDGMa5fxxh1BjOY/AbDGP/0f6teucuPnWmjV9hHIqHqcIzFmePeBzu+W+CnupomNYOtAFIF5Dz0nxPxOXJbJbEf924HqdOHlr84EB92shKdlgT5w+GSkIVEbX2Jsuooy4MycZ3dqVv2Vz+QimI=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB2935.namprd12.prod.outlook.com (2603:10b6:a03:131::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Wed, 9 Jun
 2021 06:38:56 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::d05:4bca:ea51:15af]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::d05:4bca:ea51:15af%6]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 06:38:56 +0000
Subject: Re: [PATCH 1/1] drm/vmwgfx: use ttm_bo_move_null() when there is
 nothing to move
To: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
References: <da5e1e94-4283-c929-6540-9522b1757648@amd.com>
 <20210608181306.90008-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <66d5b69f-7017-f1f7-ade6-b38670186b55@amd.com>
Date: Wed, 9 Jun 2021 08:38:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210608181306.90008-1-nirmoy.das@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3e79:91ff:ea38:2624]
X-ClientProxiedBy: AM9P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::25) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e79:91ff:ea38:2624]
 (2a02:908:1252:fb60:3e79:91ff:ea38:2624) by
 AM9P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 06:38:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37c6d0dc-b308-4cd6-257c-08d92b114175
X-MS-TrafficTypeDiagnostic: BYAPR12MB2935:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB2935E8DE4A71BAFD951754AE83369@BYAPR12MB2935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6sxPdN2ayMoudFLWwdqHU8sWiPvGP8epGCiaRilO4nZ2YaHRP6gyC6FCwxQ2eSa89W0R2Y/gskDkkP3O+4haFmiSz65WBaUmDOlay2YCkzYbEGhjOOvHDtoyG1PnEEm1b1+bSCoWK4z/+B8vTw0daXMYoX4KgG+B6cbBgqwhTrV3EMeDlgKeE6x6OYh+uuK1W7nf4E5sUBiE3QO//3u2/HmNFh8HhohdiK76QL+0U1fuHjgoCOnDNZk5NZv2NcZZpU9QiL6KaLkxWS0PVpOmZUz0kTjgIFZyIMSS9dRCexBYrdX/OdyhcVVK9EWDiFjDMjk/w377/EfIPvX1AdtNYKok2qTZCwK0IMaVNBG1PNKOPyTJDAfN/XKIJwq8tCLkAgHAUbALTfd3UA39ohPWEKqQAMjKniQvjF1SfdS5X8p4pyCZz4IJwY4exWNHAXTs9RsvEkYS1AB7i7ZyMfxEuv6+C/LUXeBySrxtREkISZj9On/DUKAz61i6x8ifdpnKyEJArqdJyxQQsYL317VGRZ5Iz2BqYw9Y0l7hImaTZbcxGtxq/xl0nn9mZSaLQIl5qmTKAgWWOLTCAf04p6OpnkQhX8jZRjgYFsj+WqHNosEfgaOU4FslUdvW/nvb6VydOx9pZb4xVWzXFdJSouXTk/L6doGVaw3HqR3JMJy2WFL0zE/9i2eKviDW0zQQG0XL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(5660300002)(4744005)(478600001)(4326008)(2616005)(31686004)(66556008)(66946007)(66476007)(66574015)(31696002)(36756003)(186003)(2906002)(86362001)(16526019)(8936002)(8676002)(316002)(38100700002)(83380400001)(6666004)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFN2elJXeUdoUFI1VHNJS3VBUzZUVURQTjNSOWNVNmtCeEZ0dVZhUkFXV004?=
 =?utf-8?B?TnNtR1BDTUdIeEgxVXdXNXhGOTZFRXdCN3FCQlRvQmxzNE5zTERna2Rwdk9r?=
 =?utf-8?B?NnB5ck1ZMGgyK2NKUktJZ1NtQkNFVlRwTzhwNXNINmpnZEVOZjJCbENWdG1q?=
 =?utf-8?B?b0ViWkhZY0V1ZTFxeXhmYUVpUG5yK2lPcG5kREhkQU1VeXNWcXpmL05pa1Jw?=
 =?utf-8?B?MkxUSW1xVno4d0FKN2lleVBubktidTlSeFozNnNmL2tQbE5iYUpPaFZmeVpD?=
 =?utf-8?B?bVVtc3RrazB2Zkk3aWs0MyswQ09BNzNxKzI2c00xRE95bUdNUUJSTFVsQVQz?=
 =?utf-8?B?UlhkMGVlVlFISHVtUjczcHRZc0lORXBLUmx0bFhDdXl2U2ZOQmw3L1l6RzZR?=
 =?utf-8?B?Q3hjRDd3ZDRlN1VpV1V6ZWdWdGlQcVdWRC9NRGFMSWtVZHJFTEYwSUQ4K0xv?=
 =?utf-8?B?bEpmcVo5c04ra1k1SFc2N0c3dTdsbUtMRTRja3UxMmJkQThoREpxTFQ0V3dP?=
 =?utf-8?B?U3JncDl4VittbTczV2R3MDY0MXZDbldJbEwzZFR0QWc0WWlMbFN6eVh1Q044?=
 =?utf-8?B?VVQxSm5VN3p0cHVaYWhUejRvdzJsQ3o1Zm5CK3FTVXRIRnM0N2wxUVNNV2Zp?=
 =?utf-8?B?ZXBxUnREWHVLSmdORWdkK1ZvRGthS0NSNEMxZTh5bTU4bE9jU0s2Q1ZqV003?=
 =?utf-8?B?QmlDanNGV21kSWxNS21KYnJ2UlZqTytGVEZoQjVJYzdTWG1BMnppeWo4K0Nk?=
 =?utf-8?B?TU00VG9uVXdxTXlwbjlyRnh0ZWVlZkFBVVFyZGpqZXZhdjlzdzh3Wk0zOGxp?=
 =?utf-8?B?QkVJdXd5QUZYR3lQbm0xblVaWFRpenN6TTFkM0RoY0hqS1REWjlaUGpKUEk2?=
 =?utf-8?B?UXMwYVMweEptTGVUZTNaKyt3a3lZbXNnNXFCQjlHUFFubzNNOWh3Zm9oT1lw?=
 =?utf-8?B?UmEwNldmd1ZCN2VNdDFvWi9FZThqeXhQUTRncXEwN2NyZ080Vm51M01rTWl5?=
 =?utf-8?B?YmsxT3p4Vmt5RE9sdk5JSitoWGRweFFTS1BDSFZEbUpraTk3QmdYQjIrVllj?=
 =?utf-8?B?dVJ5Rm41V3kwYm1wZlgzUFlCWVA0bTVQcUgzYnNKVG5YczB1a3ZPK1BVRldq?=
 =?utf-8?B?c0tOT213bVhLc0hEWXFTY08wQUI1REJ1K29JWGZrVk5waWhPV1I4eitoMEp0?=
 =?utf-8?B?QU43cjQ0ZVJ0Z3ovejJiYlZza1Y1N1NZLzFjU0xISTdUSWJmOGtJWHRhWFpk?=
 =?utf-8?B?dW9GU1dQVjRaM0gxVDJWbjFOWDNuUFoyNG96bytJYmtXN1E1VFVTYVNGYlV4?=
 =?utf-8?B?UjRic1dLWnUyS0prelVtUFc1MTdPRFFkT3BSYnRGaitTQTR4SGpEU2JVQWhX?=
 =?utf-8?B?d0VMb0VIcjBlK0N6RlNOWHVvcm1oZ0xRaVMyS2dxQ0NOdlRGbTlSZHpNbTg4?=
 =?utf-8?B?UTBxUTRHVjJwRlExbGo0dWVTc25ycUpqT0ptK3hMRnFVRlViUmtiOUVoT1Vk?=
 =?utf-8?B?SHJrQndEZi9YUmdyWldWK0xKYmJGYlhGM2tML0kzVTRqeHl0SHI1ejErYmwr?=
 =?utf-8?B?RVc0NjRiTkd1emVOVTdYdndyc1lyNDlpaTBBbXJzQ0hFTW9EZWhvSHRTVkZt?=
 =?utf-8?B?eFlqVEI2VXBtQ3NKMHFOcks3MDlBSWJteXI1dHg1TUQxRG9wNFVqT0Z5Q05w?=
 =?utf-8?B?emVLUlNBaFIvdHJRMmNpUkIxb3hMMkNwdUY4KzBUMERNU2RnTW9xNWxGLzJl?=
 =?utf-8?B?elNFdWdEWnVFVk14eWFRRGFyTjRwemRPU2QzN1gwYjRDZGVsc3JkcTZRY1dO?=
 =?utf-8?B?UVo3RkNreDg1VUNIL2tUTGI5allMbGE3cVV3N2tBRFRaOXNMa0t1aWUzbFJl?=
 =?utf-8?Q?ryo+iiWM0xW6M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c6d0dc-b308-4cd6-257c-08d92b114175
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 06:38:56.4669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuS4P+bKTa1wyF7xodnO66VG1vhkmC35E2y5BzhohyyUviUoR4vCB3OCZAM1hwZV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2935
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
Cc: thomas_os@shipmail.org, linux-graphics-maintainer@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.06.21 um 20:13 schrieb Nirmoy Das:
> Use ttm_bo_move_null() instead of ttm_bo_assign_mem().
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>

Looks like I've forgot to push that one. *sigh* I'm getting old.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index bfcf31bf7e37..0488042fb287 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -733,7 +733,7 @@ static int vmw_move(struct ttm_buffer_object *bo,
>   
>   	if (old_man->use_tt && new_man->use_tt) {
>   		if (bo->resource->mem_type == TTM_PL_SYSTEM) {
> -			ttm_bo_assign_mem(bo, new_mem);
> +			ttm_bo_move_null(bo, new_mem);
>   			return 0;
>   		}
>   		ret = ttm_bo_wait_ctx(bo, ctx);

