Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA954D3D0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 23:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6C0113375;
	Wed, 15 Jun 2022 21:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C631133A1;
 Wed, 15 Jun 2022 21:34:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTdCg6LKEZdtbPp2g4NBKSwZHVs8OIYSU449HuUDchpZWG18Rh9PXNIpFZialQRPqDRMBzjaJZ7oGwswterCgBmdXK4Gyvgfu477Tqh7VxTNbSJyHnBbdYuuS+yD0zC/DdzPM54oi6G29w7n5svYz30aruhoCHr5ZXwDOW3CUr1Bo3PEY57CmHzOgRUFBju/PZJo2zfwn67wTkLg93WbsLmqkDjvRAfnR+59mJXKqxA1mc+jLxt5QdKUhWBzajZWj1PB4SqR3w3ifnmxjK3pn/pq0zGHXJY5zYsnCX9RGXFBOd1o7U/AwkSZD86f/FBmUafiGGVqE6qQr3qYSlHQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqOPw2iIRrSUojJDpInhoHtJ2EFLirnRtwidf0kVmmI=;
 b=N5ZwJC+1mLIXQj7OYQWXNljonD7GBBs36a+Xhrw31acZ9rd408rOBcpfjSForOnenqV4DRbn9t+oUJj7Lcvro5uQ+2kUziECLS61cPms8aMuN5mH8PhlC+XgmVGeCqN+zIJRWw1VkeVCCHhihVO1YUtMwfBMUjiudJlCu0wwHsdX3WPdoFRjnHWgXR2fu9GvxasvSpS+DbwE9Hb9jnikptiJPes7rJt3iusTkGe44TkszjzIC8wqGKykuTbNFUf8h/9OzKW+HsMHpPbKSH2eRo90zE+g38K2+leCAFuzthvhZKuaLRXS9Sxsas7CD/euZ5dFsFU45W18FCdE6LarZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqOPw2iIRrSUojJDpInhoHtJ2EFLirnRtwidf0kVmmI=;
 b=hDUB3hvP6Kx3tXAahToI80KKSz6RMumY6f9TivRjdDpTLlwoX/RF7eCKDcUl7evUEw4LiRB+eWNhO1CRuBG9bdboynD5dv/FmBc6pIvRMTEr164eWcV5w4fP4UiRSJiitRalaMrDJnO42d2CkvOrNWEcKs5BW3lnCLwI1uKBsyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BN6PR12MB1604.namprd12.prod.outlook.com (2603:10b6:405:c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 15 Jun
 2022 21:34:41 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d%7]) with mapi id 15.20.5353.014; Wed, 15 Jun 2022
 21:34:41 +0000
Message-ID: <73c209f5-f50b-2777-31fc-fbdb963cf19b@amd.com>
Date: Wed, 15 Jun 2022 17:33:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/amdgpu/display: fix build when CONFIG_DEBUG_FS is not
 set
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220615210019.28943-1-alexander.deucher@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220615210019.28943-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0123.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::32) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bd4aebe-3481-4572-6360-08da4f16db13
X-MS-TrafficTypeDiagnostic: BN6PR12MB1604:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB160488159C7A6A95F6B338918CAD9@BN6PR12MB1604.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QbqVsej49oAX6nHMe5cMBbR6IteXocC1GOUFaE2zcvKTIV83KmMWokNsLdGFs5SCjW67+QZibuDLEOzor59phZm+8Llv9S99FKI+0PCERZ8DazFlfLSZSME+kJRmYQy/fW7kpxryBv9KlUkx4kbgSO+JGAjld352k3PckJl4pMhej3nCCimBymh86zoxvNDbTGYZRG57x/JFzpJEMySia6tFr/acfOyCPLGD7Sr813F3locGe6RarvjKxzT8eSNtbdmoMkmJg7X3HiGEnSd2TIwyXTwO9B+BQ1daGvaznO+6MuE2/BKDovlqnzCbY3rN5tAQkqSi6K+H4mXo6TTX9zcvRM0BW/AjgJfrdqJwm6G1ShaD3sTbi9D4H6dGzZ76uxC4u0itgPD6thu7W+gnv6EOLENX6yiW/BUCdnD2k4pXZrLFspH24TPzcQC6Khs6njB7wkU1cyievuZ33ltVirWhmrJwbfdYW0BM1pDrhMA8DzkIrS8L5YPnP06b4xCg5V/xLYlqVC+U4JrntrZ8mb+13b9EVY8Sfh3YB+XqosOuHA/yWsFEmcwqBsoFY4WmRefb1eEQkxE75Svlbo2PCfzL/A+UqhwsfgLgmv6cRplU7XfqIGqBvFYCs+kxIXGCyiniac29NGiONobVKIShi05eiIxNg1oOCFW/Z7jJSApSa4fsNg8q/vJWtd+zxwvg5DREQBK7ZmevXgUg0jYU/nVoT1hPcV+nbyWHsBVDH/vfjpODEt7fXRhkIeoN1Z4Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(26005)(53546011)(31696002)(6506007)(31686004)(66476007)(2906002)(86362001)(66946007)(54906003)(2616005)(8936002)(6666004)(4326008)(316002)(8676002)(66556008)(38100700002)(36756003)(6512007)(508600001)(44832011)(6486002)(186003)(966005)(83380400001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmFETThDTE9TL01VWlFhWlBxZW1HQTlwckhrV0Z2ZE9SM21ocGRKeWwxdEUx?=
 =?utf-8?B?SEQyTmw5NFhMczJPNE91S3BjUUN0ZjY0Q2d4bG9wZnYxMmxtN3pwQkQ1dml1?=
 =?utf-8?B?Q2thc3VwY1ZyVVNLKzlMVjhCTmF3ZlRJZEFFLzhBMHdFa1lEYTlwUWFVdUNX?=
 =?utf-8?B?Skt5ZzA0bjRmTTA2TFBWVS9hVklDUU91ZVJ6RUlEcGdtWm96TFhXRGNYYUN2?=
 =?utf-8?B?Rnl6eHlIMklJYldhYVBkRXAwSzlOOUtFMGdQQTdEa21Ua0hXcUI0VzhQNEVJ?=
 =?utf-8?B?Y2JFVkhLVVlQOHB2dlNJM25sMkR4akdueEVlMGFRTVVFU0J2WDdocVFLTEpK?=
 =?utf-8?B?VjlGL0dLbDRrQUJQMWZvR05BSnJZbE1DalptNUdFb3RWdkhIbVRlOUx4L3BL?=
 =?utf-8?B?aW9Lb09KbVV6ZkxYMWlSdW5DK0hXbVIyRDFMYW9VZ1AvK09wUG9WZk9VbEtE?=
 =?utf-8?B?cmp2ZWM2QW1tdC9uMGR5b2h4WmNCaWR1T0NkWXNjVng1U29ZNmFsanp5S01q?=
 =?utf-8?B?MWE1RW9Ud2JSVi9IQ1VjelgrdmIzcHJLTnRKemtpRzlBdHlwak10R0VHcEht?=
 =?utf-8?B?REVhV2Y1MGhSM1NaQXkrRWl1RTNVWUZPVUJQdnFUYk52anhsMEVpRXZ5czQ5?=
 =?utf-8?B?Z001Rk55MFZ3MExOQ3lCZXI5emtpSThCZ0RqYTJ1RWkxSzN6VTZIREhxMFFV?=
 =?utf-8?B?RVVRckszcVhXME9TenhpbDBhNUlHb25XRlRveDJlbzlQNjNDQU1pNW5UNG9j?=
 =?utf-8?B?YTBWSHJVK2V2V3dDT1d3RDdkRWhrQ0RQWW5XSEI5Yk02bEVSZXNINDl5Z1VT?=
 =?utf-8?B?ZmN3UEJseEtmN1FnQWRYTWsrOTVxY2hObU8zRUxyQWRUSU5jQTJUT3ZDWjlM?=
 =?utf-8?B?STZ1bk9ienRzOHhRNTYzYUZURStPWjE1Q0pvazhTdEZYQ1RPK2JQNmRNWXND?=
 =?utf-8?B?d3Fmd0JhdFc4RFpmSXUzY2EvZ1JxQzMzSlNERkI1R2lJVU5HaGh6d3NVNWZy?=
 =?utf-8?B?Z1NqakhqUm8zV0xqbUx1MW1QbXpnSDRHRTVFNUlvTUFjYmVVOHdwekphdzNJ?=
 =?utf-8?B?eFQxTCtBVHdhK2lZNENXeldsTXYzcnhQaStoRHMzZGtKWkVUU1dMMTZVWCsw?=
 =?utf-8?B?M1FLMEhiNDM4T1B2QVd6ZVVhSnBJcjlFRS9XeW44Zno1bGxxcHA5UlRjQW8w?=
 =?utf-8?B?NjBmN0IrRkZKQ1JVRlN2M1Z6b1BURUx2QjkycFV6REdUMlZwL3ZGMWhWL3h5?=
 =?utf-8?B?KytqYUlJTzFOTnJuc3NZS2Evbk5hVy9xaWZOVmpyZnBNeUw5RFVEdk43N1V5?=
 =?utf-8?B?VGg2SUY3cGU0dEFhVTBBL3UrVnl3U1RhOHp0OFQrUVJMWWtCNkNFeDFReEYr?=
 =?utf-8?B?Y21tMkhSQW5IM2dHZXkrb2VhckwwS29IR01NN0kzbHhQM0FidU1GWUdUSDZq?=
 =?utf-8?B?VnpsK2Zhb3FHZ0plQnVyNjhjQk9obE1qS3c2eWZKSzZzSWhra1pYMUtmd0Zo?=
 =?utf-8?B?Z21ETXZhZHNXT3d2eGp0MVFOOU5MaC9FdnBnZ3NkM1gvOWFvUldMVU0vR2h2?=
 =?utf-8?B?NnY3TnRsU3pFSVFzVHZPVktVdi9vOURjZ1NONklrdDZ5aENwZVBDbk1rcUhH?=
 =?utf-8?B?YUttNHgxNXlycUY1VzJORXhSbkhXTXhTT1N5VmxINE9sMjl3NmRKeTdVOGVG?=
 =?utf-8?B?US9YZ2w3MjBwRVl4QytFNm51K3B3S0hMSE9rWmNGalNJUEdVQXI4dVZrWGhh?=
 =?utf-8?B?aUtmVE9hQVFKNzNnMkVTcmtwb2VHM2NETFQzd1pFT3JNWHRXcmdXYVFLSWln?=
 =?utf-8?B?eUpQNmcxSnUyTENtV0Fwa2dFaGdVMVhrZDhVcmZxa1RxNSt1Y05aUCtWTmRN?=
 =?utf-8?B?Z2g0cXlTMmVBbTBoV0R1YVM3S3grMWJOczRKMlZsZkdTWjlPQVN6TmREdTgr?=
 =?utf-8?B?VCtmR1RzT0pWRkhUM1FyajI0ZUo3N3B3UUViL0k2UWxmR1oyVEpSOFhySm1B?=
 =?utf-8?B?cG5mZklmTEVlYmlZdU5vc0RxREdRaG9JdkVIdm9FcmFDNDZmQTlIVHVXY01V?=
 =?utf-8?B?cDZqK2VYQkxDTXNxUTJsYjVuYkFORjlYT0p2OC8wNHk5UzhFUGQyVnRvVlV3?=
 =?utf-8?B?aGhYQzg1RzVBTWM3SkVaL2RwZ3ZIUXA3eUxSRmhhQW9CK20vS1VFd0VzcVpz?=
 =?utf-8?B?L2o2cFczVDRGMkVSSVdVUlF2SHBSRFRSc1UvQ1kxQnkyYWlyQzhBVWhsSFc5?=
 =?utf-8?B?SFUrTkZBT0V5U2EvdGZDb04xcWdnZjhCMHJvZm5TN3l5bmpPSE1hazJvRDkz?=
 =?utf-8?B?RVkvZFFpNzd2bEk0NzBwdmZSRE5NZnR4U09rdm9pNHRqOFA0RFVJQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd4aebe-3481-4572-6360-08da4f16db13
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 21:34:41.1889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GcLgnSWe4sx1mB9Rh4JuATfxjDEAJubNS2iJi8qmgqe1sCXwY59jV77lvZ+dLit5LZS3wfd9dsaaYKqWt43mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1604
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
Cc: Jani Nikula <jani.nikula@intel.com>, Nathan Chancellor <nathan@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Arun R Murthy <arun.r.murthy@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-06-15 17:00, Alex Deucher wrote:
> amdgpu_dm_crtc_late_register is only used when CONFIG_DEBUG_FS
> so make it dependent on that.
> 
> Fixes: 4cd79f614b50 ("drm/amd/display: Move connector debugfs to drm")
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Tested-by: Nathan Chancellor <nathan@kernel.org> # build
> Link: https://lists.freedesktop.org/archives/dri-devel/2022-June/359496.html

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index c9004f7e700d..33cd7a3d4ecb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6594,12 +6594,14 @@ dm_crtc_duplicate_state(struct drm_crtc *crtc)
>  	return &state->base;
>  }
>  
> +#ifdef CONFIG_DEBUG_FS
>  static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
>  {
>  	crtc_debugfs_init(crtc);
>  
>  	return 0;
>  }
> +#endif
>  
>  static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
>  {
> @@ -6693,7 +6695,9 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>  	.enable_vblank = dm_enable_vblank,
>  	.disable_vblank = dm_disable_vblank,
>  	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
> +#if defined(CONFIG_DEBUG_FS)
>  	.late_register = amdgpu_dm_crtc_late_register,
> +#endif
>  };
>  
>  static enum drm_connector_status

