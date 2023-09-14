Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEAA79FB5B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 07:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AF610E4F9;
	Thu, 14 Sep 2023 05:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2064.outbound.protection.outlook.com [40.107.212.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E9910E4F9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 05:53:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPd2rge23AR20gUgtNJ3Lj+UkrssIHhOy+pvl7THo3CtBdilex6SWCCzQ9aINorLBvGqdFkvnzS+7x0LS6VBmsL/4+Jw5pXHz92Jhyz1WZ2kChJZOYaFir91HrFbK4GOdb7iPJPNgPSu+ZGQQYTcQmznvaR3LAyEPXyYzpnD5OXXSc1VvgLzlMPjdh0Kz8rQ3saU8qOnlNqecJ1hfQSOCfxgQ9WsZKoc+kE96M8baPTzw8jL4v4xqN/n0HMXvLhlgYZXL2nGPdbcStR9fPEc9JR2YP+MfX2QWA5BSswzd68+UaUT3IDBWHftWmV+cY5jbqnkzTrb32zB//x5HBx+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXRYVz0wEJsAII0Co9xbYa4M9oksrvOHLeImLv+IP4g=;
 b=CLkaMkMft7Xur8vV2K/ST5wu2JDVbPARkMJF9Gu9kDELAXyqoR0NzF2tb07z9OxaAosoS9cSPDt+H5wuHSIhJxBtP1h5VRXBL7UFCPdvmeWBqfOSfTwMi6L2UJjOVK3Dg6Gk421HL168rgINGWjnRT5UAmi5SvhknEdFc/aE6vv7SjdQgJ4FdZqg/6XlpOXQNcRq0EVeXCTKtUtPK6k2vls5WJmvSst2Ns3Z983BBk4fh7h1oAL38r7ogAMdA5D0wsvf7OJ96BTWO6Z8GwZywSY9MzzHl5Ow1t3ZamYGJ1YqJd/5vgDDg42/mbRI9jhhNb9OXFlXZ+Cw1kBUAR9kAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXRYVz0wEJsAII0Co9xbYa4M9oksrvOHLeImLv+IP4g=;
 b=ADN21PnWUXcOyZLWE+uiWJpPLPHFJWjk5N4K2pCR0bACcA4aeeL5Ww6qgy1EJKiiXuWnf+7wlrpcl5euXn7fTes7CuDjqtOoxGNALxWur3shICPok6TAwn4u78XA2IQvqfAfMFv0c4jPuSzzPhoqgsW2E+/U5XbjpQCVW4/OT8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB8838.namprd12.prod.outlook.com (2603:10b6:208:483::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Thu, 14 Sep
 2023 05:53:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.019; Thu, 14 Sep 2023
 05:53:19 +0000
Message-ID: <e66fcb4f-d0bb-ff80-3dfd-6d497cd02a08@amd.com>
Date: Thu, 14 Sep 2023 07:53:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/debugfs: Fix drm_debugfs_remove_files() stub
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de
References: <20230913-fix-drm_debugfs_remove_files-stub-v1-1-6b952ac559f3@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230913-fix-drm_debugfs_remove_files-stub-v1-1-6b952ac559f3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:802:2::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: febac394-50f2-4c21-a299-08dbb4e6e5f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rk3oZeu1I02iAcwjewNibZvBGHA/08/xWQ3/tXK9kcHGCNu1XDs6qgGP2Sfr6Ievb3LvpXjWPIfuKGcLfauDbPmuJPFCSxsMqZUBs3futOdR2VxKLlK3Tk4J1CfXwctD2pklRiI6eZVQACTnpgBALpcyEeIy5BvldRRMuWYd+czrC8wuZY5+aweE66WJEu9JSNtPzGqE00O9X1xLGyKd69EfFuwv9Z4D/gnXW5Ll+cIetZpXLzj8C3hmN4t2C6+v8Tjya0cxv+6DGnIjwxpfeiYPkKU17WPf+zTZCWiwEZ3odqjK7fGVcDHiXo/bJX4URs6YYvXl6OgcUHy+eLzOkCln9cvk8ngUjp84zLQQP0dPkprNXB1i01EeRoA28x7ttMeQ4WVYN9WZ3YLH1zDAQ5J3IBHxFfFtqZ9pYuXFg2Opo16ac85xhHp8hD+p6pYeA5HVSKUbN30E5RgQTLyWgMMauowmPy8yERLLyioKLjNppPG3B4tGfKfrQsfFbfvDss/DhgExp2a+95tBHZZry7bzkFDkg01w9A/pgEroK50tytlLh6t55IxmygvhcV8hVWNxgxAV3Ht1lAJPsmFsIUSKgPKGWldm1h+us9zw382YkoNA49llQUTwLu3vI9dqIqZrUie7l3owVIinNY4SRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39860400002)(346002)(136003)(1800799009)(451199024)(186009)(6512007)(26005)(66946007)(66476007)(66556008)(2616005)(36756003)(316002)(41300700001)(478600001)(38100700002)(6486002)(6506007)(6666004)(83380400001)(2906002)(31696002)(86362001)(31686004)(8676002)(8936002)(5660300002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWNnMXExcG1qK1Y5WmNaaUxpbnlKQzhGeTZlanZSWGdIOFNibGtqbzhzNFNi?=
 =?utf-8?B?cG1kNTA4b0Y3NEdmL1gycDE3OVA3ZzdVLy9IcklHNXk1d2xYUjZidWp3YkE4?=
 =?utf-8?B?dHV0WTNyR1FIMk5QajRvSk5IMldKc1JlSG5PZFdkU0RSdjUxeHRoaXNsU090?=
 =?utf-8?B?YUpVelBJZ28weXFLanJrWCtIOE9uR0lZK0FYOGd1UGZtQ0hqbHd0ZktuYTBj?=
 =?utf-8?B?SnZDZGFNK0crTFZKMVN0UnlYZm9aWFdVUFNZQWdBbkR3THkxMGVUZ2RpU2JR?=
 =?utf-8?B?d3Z5NHMzOGhkZGE5Qll2bEpDU3ZmMHZZWU1WektJcE9qUFBZOW9OZk5ic2tM?=
 =?utf-8?B?UmtnT2x5RGFESzBXMjBxZlM4M2MrY3JaNVNSZGI2d05ZTE5wZmh3a2Y2d1Q5?=
 =?utf-8?B?RDYweS9uRW9QVlI1STNQaHhRcUt6eG5CcFV5SGh6dXkvM0NsUUh5NkhGTWxE?=
 =?utf-8?B?a0VURUlzSnppcEdaQlZzZElqYU83dTd6QnR2Y1pGdmRwdmRIUVowV09wc2RR?=
 =?utf-8?B?c1RXNUdiUXFNZGk2RHZBK0p5WER0RUxtM1RJeERVelIrbGp2QUdBYmQvWkgw?=
 =?utf-8?B?b0VJQ0dlaDN1S293dUFtNzFVdG9KTmJBcTNEVk1EKzk1NVFDWm9hVi9kVVdG?=
 =?utf-8?B?dFo1SGUrMWFjMGlhVEtKYVBwcStDdkF3dUFNQ3NWa0dHc0xUTFpsakZiMTV4?=
 =?utf-8?B?ZVh2VFhhTTgrWUZSNHNoYStjN1hBUGwvSEpIR1FOUGJoK1NMekJOVU52ODRL?=
 =?utf-8?B?RktxUmhNMyszSVJIc2VBcWpYTk41UUxwVGp5YVJNVFNYTUhyN0xmUDhYRGRj?=
 =?utf-8?B?MkJjZHZoNkNhbzFlYlk5S1ZDYzlLalhzUXoxTDBmWXFNd1FpeXdaMXFJRTdR?=
 =?utf-8?B?eURSY0Q4c28xUWRYTnB5Z3JKWTF4ejN3UGRhOTNidjFmT1dMYmsxZFhUZ1Vi?=
 =?utf-8?B?alhNMlo4NU4yYmx0dzFjVk1nNlVtWEloRHp5WHBqczZibVBYUGI3MVJvMEJG?=
 =?utf-8?B?cHlaUFFYcnJkTU5pNjdwTm5nNzkzRHZFVTZXSkxrbUs5Y2FKM2JEcm9COG9Y?=
 =?utf-8?B?dmJWdTNpVStVN0xVVlNndzFIbUZpb2V0MDIwdlBVY05ucUR5ZmQwM2xvRGt0?=
 =?utf-8?B?MWdkY2xLYVVOcEdKdy9aVUFKQ2hxUitvWUsrRSttcUpTeUxOM0tHVGRNNnN4?=
 =?utf-8?B?cC8xVFdqc0xnSFJ1NjloZnBTRjVZRVpIZWdEaFhnVlNBeDU1STdOdTlmaWMw?=
 =?utf-8?B?K1FxVjRma3dOSlROYW13MVhNRS90R0FpaFdTZmc5K2s4Mm1kZXVVaFY0c29O?=
 =?utf-8?B?MUJxR2R0Z3pybm1abldvZDJDdUpNeEVmRyt4UjAvVjhEdEJva25DRzgzR3Vt?=
 =?utf-8?B?a1BlaUFlRUdSUXRHaU1hUElWbmo2aUVHT3VGaU1zVFU5VXdVTG5kMk1saGpL?=
 =?utf-8?B?eFhEUTlJUStrSVZjeVR1eVA2N0lrZlU1VUZkK3VHdG1vL1lpM3hGeGhiQlh1?=
 =?utf-8?B?UnNTK2hMRnhBNklFcEd3THZCYVU5Y3ZFNnVMbEYwemlseUJaQkdkVGEwN2pt?=
 =?utf-8?B?MU1MVHhwM1dMVENRSWhWV0dLdzV0aXExN0dlalZTSDJYK1NKVEMvRmVJOGNR?=
 =?utf-8?B?elk0bVVIYzJqTVRwaUdxenBtZVVCWmphTHFBdTlFanh1dmhXc0lSVE1hL2FM?=
 =?utf-8?B?b1JpTU9HRW55WjlqelhXR3B4RmFzRGFVKzhKdkEvUHg5blhMdDRxUno4Nk5t?=
 =?utf-8?B?YjVycmdyVWFVY2FPYnhIdWZXZjJmV3JXNzVBc3Rpck8xZ0tyS2RNb2FuQWJw?=
 =?utf-8?B?anRSY0I2UWZVV0hZdnZoN2R2Ti9TTU5OOGpVdnVDNTdUSkJsa0M5ak9uMzVP?=
 =?utf-8?B?L01oWkMwdFBMU2NrU0pPMzI5VnVOQStuWVFvelZCK3pEb1VrcU9FczZlZ3ls?=
 =?utf-8?B?NDc2SGdDaHYzc1g4dHFMMVRjTU1uRWRtMmdySVJZRHc4ZFZvL2djTElkQ2w2?=
 =?utf-8?B?b044QXdnTTVlcit1d09aNllBcDA4R1NsVjFnK3ptZmU5SEJUNkZoblBGc3hO?=
 =?utf-8?B?ZVNVQXpXT3JxUWZ4Uk1tYW5JMXZ1VmFIUG5qaWJIL2cxdXkrRkFFNklhQ3FI?=
 =?utf-8?Q?xWR3rDBv1vbXCOyTL6P9VO1Zb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: febac394-50f2-4c21-a299-08dbb4e6e5f0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 05:53:19.7710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSxsaR8dclaI5Qluxdg2vFyTX4pkkOlSl4mu1kT6qEDGgRyKEKj6Df7kkrAYiwLt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8838
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
Cc: dri-devel@lists.freedesktop.org, andi.shyti@linux.intel.com,
 patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.09.23 um 01:30 schrieb Nathan Chancellor:
> When building without CONFIG_DEBUG_FS:
>
>    drivers/gpu/drm/tegra/dc.c:1757:59: error: too many arguments to function call, expected 3, have 4
>     1757 |         drm_debugfs_remove_files(dc->debugfs_files, count, root, minor);
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~                                 ^~~~~
>    include/drm/drm_debugfs.h:162:19: note: 'drm_debugfs_remove_files' declared here
>      162 | static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
>          |                   ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      163 |                                            int count, struct drm_minor *minor)
>          |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 error generated.
>
> Update the stub to include the root parameter.
>
> Fixes: 8e455145d8f1 ("drm/debugfs: rework drm_debugfs_create_files implementation v2")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed and pushed to drm-misc-next.

Sorry for the noise, I didn't tested the latest version of the patch 
without CONFIG_DEBUG_FS.

Regards,
Christian.

> ---
>   include/drm/drm_debugfs.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index 7213ce15e4ff..3bba169f9bae 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -160,7 +160,8 @@ static inline void drm_debugfs_create_files(const struct drm_info_list *files,
>   {}
>   
>   static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
> -					   int count, struct drm_minor *minor)
> +					   int count, struct dentry *root,
> +					   struct drm_minor *minor)
>   {
>   	return 0;
>   }
>
> ---
> base-commit: fc71f615fd08a530d24c7af0a1efa72ec6ea8e34
> change-id: 20230913-fix-drm_debugfs_remove_files-stub-bd864127c162
>
> Best regards,

