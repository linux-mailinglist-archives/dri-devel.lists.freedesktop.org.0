Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7D83ACCDE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 15:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9296A6EA17;
	Fri, 18 Jun 2021 13:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071326EA17;
 Fri, 18 Jun 2021 13:56:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivGgWBZf8lKB3pjTreAb+44NkbcfSEB0Po3FKXEWYKivEqlW4Ep83SSY305u+OuQPPz2eRvgH6BvSF/MJGGUhyYPI/FshNAVx9zHoMkydtzT1tl+TcMwvhvjtR2qC+9SHKm/U/4MvigjSTnmRcyDydGAjsmPF2p0weLFeU+kHxgVvX5rrkneTx9yRmIfz/udFlbw1cbw0j5CRYhwvLsoCNiaz00H3jy8dlxCoU8q4jNHqBYNDNS7IeogD3YtpFeEQ5KfUgr5ydGIZjVn0aht4cfR4t/ZP3aBcFGpK0Lb0GVm7Q5Wyvp6Z2m8OHbiCPSSF+YsI5BkgcUto21w57VaWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh2CtdjhZO3mcDuzqz+4RXt3oX5K/ODa2Tdf+RWerRs=;
 b=azZlN8Ph5Q9L7IIWfSBNV3i5+DqrsKlejmdHdhd042QW+xbXskFMLJEIVqxcJJMwoDDaXcSojsITTbPsPcuf/eqW+bf6ZBt3sLxj7X/FPqcIDnzre6LDCRQatK+ZXGPBkl/xITwQzvpTNUZyR+M+WSGS2AeUIp7BtIWbRPDgPq3UPH/rZ630anzMhVdfSupaTvZ+q7IVq8XX3LgtH1vJhjxAVvmaKT8oo/IsEhg7Twmxe/jxwoVzY0aH1m86opwT4fs4hP0yFaBRr8eGcVk6KbRWeW8Y2TRfCBFjOGD/GgSxojfFnAW2OD567fMqRGPS1rJxxOhPIrbflI/bkfS5uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh2CtdjhZO3mcDuzqz+4RXt3oX5K/ODa2Tdf+RWerRs=;
 b=qNOvt08VavgKqG60yIpNZ0/4qOpKbsuWLE7nz0Djt95x2iS6ONqyqUd8emk4GXyMV54xNKeo7ymP/CWfbMoYbclueOOrnz3Ia+Zs0JkHjWOUtUz7wogNzmIpWbHUm3aQQ1bbA1fVPxY9+CmICXY8l9PpL3KIVE5A+quEQ62LgDw=
Authentication-Results: yeah.net; dkim=none (message not signed)
 header.d=none;yeah.net; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5492.namprd12.prod.outlook.com (2603:10b6:5:35d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Fri, 18 Jun
 2021 13:56:04 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::401d:c7a2:6495:650b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::401d:c7a2:6495:650b%3]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 13:56:04 +0000
Subject: Re: [PATCH] drm/display: Fix duplicated argument
To: Wan Jiabing <wanjiabing@vivo.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Solomon Chiu <solomon.chiu@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Anson Jacob <Anson.Jacob@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210616144027.27225-1-wanjiabing@vivo.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <0c0c719e-d8fe-b548-80cd-c498642a6c3c@amd.com>
Date: Fri, 18 Jun 2021 09:55:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210616144027.27225-1-wanjiabing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQXPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::36) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQXPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:14::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Fri, 18 Jun 2021 13:56:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 653310fe-2192-45d4-6d13-08d93260cff4
X-MS-TrafficTypeDiagnostic: CO6PR12MB5492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB54926181DDA431349B4295878C0D9@CO6PR12MB5492.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N0xVmUjfILiX5kKreeS6FOLWq0oY8CBDpjvKRc/HHw2DRTvWWolLu/YNIPlJz4J7ykfTs0qzNUeT6wPz8qG8lxyhXXyebxzxkdT2fnA52dzUnX7YVE2nogMy+sfpDmXFs3lqHXXswjGUxI46RW7TF7+rHS1JcWx5lo7u4zBfQGUkBErTGcdk5cGYkKgICgS8KpCWiJrmHHwFxRK0QgrBctNaM7c6tMQ6rMWTiyR6IUYGCIZye+SB1fLHJcUgOG/Cbo18dSZlDprtK92UzCGy2XuEdEhpqXMfXKU9c9Etdo0jYHEEZ4HDA0X/3xc/vgMwEeIHZNJbegrC7wSOO5e9SYemWAjOe/rTMUbou2G25lGvML1ZOPIrgL0G8hJ+tlvbhGHgpXKIZGQ9ul9SNv9HXCXSqCpNKZJzhp5s4hGhlqe1HN2F/+dhk3cZgw/8zIA8RAuerX1La3kXBXrmp/fUFJVzAUMNcUV5+gRiHOR75UnCmWVtrT49vKyK0V8ZoyNqVBwx8gja0XVMDgTBxVctmCgmhcsO+qksiijukoVOh9ocoSwfvvnQHaKu47Pa8o929npfgWHUhVzcMy1nYtioxS94aDjkWcqYPhWicMJE/pi2jGI2bwzMLzg9Ox95bFwsAyyFWZqXO0lQky3U9c9xC4hEuDKXJCEi7gI9eFJ4jkb4lhAw8DGMy7G2ADLkhSg5bNAV94xbB2NZC34InBDzvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(2616005)(478600001)(956004)(38100700002)(31696002)(26005)(8676002)(5660300002)(921005)(36756003)(2906002)(4326008)(44832011)(66556008)(6486002)(53546011)(316002)(186003)(31686004)(86362001)(110136005)(66476007)(66946007)(83380400001)(8936002)(16576012)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGpmZlp1K1dsa2J5bGlEd3lhU3Qzb2kxL0ZDVWUvMVFpSEV6Y0FlRTlkY3Q2?=
 =?utf-8?B?QXlTVHRmWnRSd3ByaEZjdGdMc0ozZTg5VkZUeDQ3MEhubjhMREFqNGN6b1FF?=
 =?utf-8?B?T3NGUlEvTFBFZHoxWW9Ma3JMVU1aZDA4djczNU1IcFozNTQ5NHdGSENsUU1J?=
 =?utf-8?B?d2YyVVpUNk5wemExeWtWU0d6VDhDRHk0R1E3MTVpcWx5N294aWxya0NzS2lJ?=
 =?utf-8?B?dEdVK3RvQW5xaEZveURhVDIyanRLdC9nN1JhQXpSTW1ocnYzNWhUMmpzb0pZ?=
 =?utf-8?B?eG1lbE9OTG9ScUcyR09XWFpycWtQZ0hwVXhhcUVmcHJYVWEwQkdNMjcrWEtt?=
 =?utf-8?B?YmhHOG02aW5pZGllWk9yOHpEd1doRjFsNzBMaXcwUmRmTXVNbTNIYlZ4VURi?=
 =?utf-8?B?WFZ3YkE0MHBrckRXQS9DWmVrSUplK2xGWUVXTTF6NFl5K1JkcXFMTC9FQXhi?=
 =?utf-8?B?NnFRMzhDODZFbHNYcGdTdlVRblZGSzlqM0xMVE1XVW52NHR2RUJ5dU4vYnRY?=
 =?utf-8?B?VzJHdHFnSUcvWHpUYXBFNkRMWEQ0b1RTL2Iva3E3RXJ6WlZMRkRvdUhJNHJm?=
 =?utf-8?B?bzQ4bFpWZ05ra00vSFd5VmttVUZ0aG5yK2NUWisxTzJRWXJnbXNxUlJDMTFY?=
 =?utf-8?B?YXNvbWJHS0UzVXh0Yk8wV2Flb29uL1dDdE5UR0RyVzBWdjF2R3V6WDBZOVor?=
 =?utf-8?B?aFhENDFRdUR2U1VsclJWRWN6S3gyMmdoeEduMGR1THBDUkZFWVU2VDA3RVR4?=
 =?utf-8?B?UFJmQnd0em5HbG55Tmw2ZjMwVnd3V1NRU1M3ZkVvMlRHNU42d1h2Vlh0NTVz?=
 =?utf-8?B?TkVBWWt6ckN5M2JjN3E3RXJQQmllU2VVamkyalBKQjNEazVEamlCcitSQzhB?=
 =?utf-8?B?Z1NtMW96ZFIxOGZibU5EVENMNlVyR0JEaVpTOTNYZ0xNa3RCV2pEdEdYQTA0?=
 =?utf-8?B?eXpldVVJZ3Zlbm1IYzRuWTFJQTNyOHZNb25QcjlUZzJXRHFJcnVTSUNwWDBO?=
 =?utf-8?B?SkNMdnZFazBJd1ZqWDA4dm1MV1lPV3h1Sm4xWFl5OXpwR2pPOGg0N0tKaURt?=
 =?utf-8?B?SkRLbTVlV1BnMGVHdWsvellsUForU1FpT0c0UzJmK1FmN2paWS9aREsrYUxY?=
 =?utf-8?B?Ymt3dnFQL1M1MCtXR3pFWVdVdDZSaEVrNzloVjlDbEJRODF2U0k1MG1sTWRW?=
 =?utf-8?B?YWYxUmdsLzRoRzNoZkVtcUowSGlGYzNXeWl5d1RJelFrRG5OOWxyUE5XTTJB?=
 =?utf-8?B?RXVnSE9JZlhBRHZseVExc2o3MVV1Vm84MCtma1JsRVc4bTNaMXBzazFwV2hG?=
 =?utf-8?B?eTh4aERXQktpRk0rbCs3RWxRYVRSMlZvSDEyc1IzeTZ2TnFZbGtaWHp0aEdC?=
 =?utf-8?B?U0dRV1NueC9jV1g0Qk1aMzVnUUVpTGR3c2ZCdHVCWFN3TVdBZWFvVncxdWNJ?=
 =?utf-8?B?ZVpMdFFmK1h5dzh3R0tsR3BPRm1LL2NwY1NncmVBUWFoVjlwY25VMVJYakhB?=
 =?utf-8?B?aitQSC84eDMxeHdUWmNpMnpCbUpyMHVhWUpvNG5Oa1lvY3pmQ3U0TnFSaTdv?=
 =?utf-8?B?YVhwYVVib2hSSVVyWjNPRWttbWtQYVVGUFMrRy9kK2wxVytucFJxbWVWcCts?=
 =?utf-8?B?Z05pcWh2TE4xa3A2dlhyYWhmS1ZYeE52OGZSams2TzVhWjFKczVjb3RFeUk1?=
 =?utf-8?B?VmFjSmxjTmtuTTBudzlIbmljN2YrM1kyVks0U2NJVExDVXZrQ2lTTlp3SWk1?=
 =?utf-8?Q?hSyOahRCYO2mMp0wEpe2wc6OqYgq7bknmYxcRtu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653310fe-2192-45d4-6d13-08d93260cff4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 13:56:03.9117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28PtBu864mV1NS3wEBI59wSwkxQDuW23NhIxZxiFBZqrksO42LBEcAMdXTd/tvueoyEkaWcIEPS01SF0pKn8rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5492
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
Cc: kael_w@yeah.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-16 10:40 a.m., Wan Jiabing wrote:
> Fix coccicheck warning:
> 
> ./drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c:
> 55:12-42: duplicated argument to && or ||
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> index cb15525ddb49..dc8b3afef301 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> @@ -52,7 +52,7 @@ static bool CalculateBytePerPixelAnd256BBlockSizes(
>  		*BytePerPixelDETC = 0;
>  		*BytePerPixelY = 4;
>  		*BytePerPixelC = 0;
> -	} else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
> +	} else if (SourcePixelFormat == dm_444_16) {
>  		*BytePerPixelDETY = 2;
>  		*BytePerPixelDETC = 0;
>  		*BytePerPixelY = 2;
> 

