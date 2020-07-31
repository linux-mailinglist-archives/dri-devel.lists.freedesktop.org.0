Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B76423469E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887B96EA94;
	Fri, 31 Jul 2020 13:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680060.outbound.protection.outlook.com [40.107.68.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1616EA94
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:10:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnykgFHCJI5ymWMBJOmddz6W5WHxAwQXVGqqOEqYmPWwVNjBFrn/Gmrj1DvdD3JfVvsqQEsZIevc9Dp0GZ+G2mAxDoUjbiB2E2j/5yZVGN/jhmpXPHjsw7fja47Abm95jHmMW4QOq3wpDUoKrkTGAFUgEw/KvSNU+NHp9my7QeTDexbdZgaQJswM+W+cb6oD1sLSa56KKAYg5WKB2ApSgyvefYblxyUBZoR8tTMLp3nwxWypbRuOJx1v4VsBGUoJUD6S8dUsb81qTVYSCwj5H0TbyFa5dVNt9+PYYYS4wqY9hYZfR2mWpoxKDNWGATPSpY/84+VR8kVtWYSdw4Y5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9K6UGzKvfED7XDNIj9AouuZN3u37YBXD+liZ2kWdjY=;
 b=Hl/lSJKiwXX5mUSAmh7kunVZ217/7BZpp1xKBRZxEDE189Ihluk85veq/raet3SSRKG4+0vk1bbwpynLaZEkJDAvJLNt28e0eWPAbFwjyXPH+31dw6CD+KvZP8v/mFSUbXF+Mt8xJhoFpVKpGkZJ4JRaEPn9P8eJ71438MenAiUA9oATjghf30Rlvt83MEu9+qza50Nu4zVGYUhBMm0rhPlxvN5ykIWuOJzeIKa433qaMWn+gBsLMKQwm22AcVHXdYtK/4gpJrThTzvS1uI2ltpq0UhSKCncMiULBW/xpp1v29Kz13fM3CI6K/oNHllSGlFvhC8MxdpbWE3n6zOljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9K6UGzKvfED7XDNIj9AouuZN3u37YBXD+liZ2kWdjY=;
 b=qNH3hbCNeK/0AmkMa6WThQs+RuTxZazXSa6u4tYn5W/ZKyzvs/7yl2MQqWmKv+xaMKpHqG4fbm/1WtvZjnMgQjTKUSC/VVfFI6jVz9hpkurBlD1x0OGMjUQZQlQ4V0v2e6LABJiYUE1UKbrxaK2MGOYzZJel/H8fW6fsPe5pzUU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 13:10:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:10:04 +0000
Subject: Re: [PATCH 16/49] drm/ttm: start allowing drivers to use new takedown
 path
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-17-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <163112c1-cc21-f37d-fd22-72a688fb1038@amd.com>
Date: Fri, 31 Jul 2020 15:09:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-17-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0059.eurprd04.prod.outlook.com
 (2603:10a6:208:1::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:208:1::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 13:10:03 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ef71c6a6-5d2e-4d35-d37c-08d835530a17
X-MS-TrafficTypeDiagnostic: MN2PR12MB4096:
X-Microsoft-Antispam-PRVS: <MN2PR12MB40966E621A0E833DCA5C9B17834E0@MN2PR12MB4096.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ffHfOp4l261T9a3TbXYlPKnHCVTzvYX0963KQvPmEVrYInezqP2/oDgVGzvCpQokmJwRgSbc+MUh5iaRmJNaLCe1MW/J9lG89sKBS1wjhDnaX9qBg7cFhjrUUm5UDkLhhLZpKCfiqvCH4vFJeVUGzW/BdUVkgvK96E5oPwfRcFos4+pfuERcNnfrY6POiDtEy8z+7r0gg90RJG2OC7BGXbCbbCPZs9yRMM2xLlAqYpYEIAKuS8M7e77wp0x7oiIgJXig0TPqGR2SRe5EP6ShHmJPPFO+ZEpc5riRaKSopKf9k7WDtKnGjg+1mRcru4KxnGP9gmoL8AgEjQdEgDO3DHCDVtDxdW/j6vmKU8FjM0SJt9GtS6pCYxWS6yaiXeld
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(66556008)(6666004)(66946007)(4326008)(2616005)(5660300002)(478600001)(31696002)(316002)(86362001)(66476007)(8676002)(2906002)(6486002)(186003)(16526019)(36756003)(8936002)(52116002)(83380400001)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: yVhDxV07eJ9J1IqPgyupjlCu1CH9QrXJBjkrsBNFSqK0TNThuTeWIl1BGezCOh0rmyAH2QK7NC7BhAJE/7WgxstO3Y//Yh5KuuA+3PzqvQBsBirqNlHbwWzmLS8EzXh0lum4rZQXj+ogOHzvMIZXq+nnn4RMm4vFwPIH3/dw6A1B/OJnYofKIVbbcAC8EIE7Twor7qHHLrJguMZLAUBDpskrWGt3KracLczThQqW9HUP5erxcxaP0o0OsXrxEeylDICEa2UsLS/ju6/3XB6q49sTZUj3PaQ+FBiwuDwcEr+nSFkmwcoGz7RC8tegQ47MbxFfD0x+ECzws0+zmR/a7BN8H6UxQdfBRWM5bjkQx7ZE5WqcCkCW8OHJ4fa3OHup/Bj4drkU0RXkJlAryn73/y2gqXnqrWLiPkU9KfoPG3i4fpZlt0SaASi/PHD4/Kj23WjlN8iuRhDvGcgsf8P7gFVBMKTBOEZKECbhgKlaEnqbrLGjx4RYeA8yIW6dZ1wabjzwH8kzWK/3cZ9rV3snpHAKm4UNx1HAGrJxWjqlx8W8BG7smZC3KpOxgEKcrM2RLGpysSWDxqTbLUgO5iM545+5uZokR6bjFwRpOfClvHO11c60kn5/6cs88/yc3/8snwFF1jeAbqvDXTpmBonppA5AT8WNAvlY6AguNshrRMo72EKCxaetsD1E2O/sZva+Byg3UF0GbSmeT7kkQ57Qgw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef71c6a6-5d2e-4d35-d37c-08d835530a17
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:10:04.4174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joBh4wIt6Jky4Mr26A8KXqnBJpNSLOchCCB1Lu9lGugTm6qhmP3X0QbTt5BigS3J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.07.20 um 06:04 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> Allow the takedown path callback to be optional as well.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c         |  8 +++++---
>   drivers/gpu/drm/ttm/ttm_bo_manager.c | 21 +++++++++++++++++++--
>   include/drm/ttm/ttm_bo_driver.h      |  5 ++++-
>   3 files changed, 28 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f584e5e94383..f0f0f3101bd1 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1401,8 +1401,8 @@ int ttm_bo_create(struct ttm_bo_device *bdev,
>   }
>   EXPORT_SYMBOL(ttm_bo_create);
>   
> -static int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
> -				   struct ttm_mem_type_manager *man)
> +int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
> +			    struct ttm_mem_type_manager *man)
>   {
>   	struct ttm_operation_ctx ctx = {
>   		.interruptible = false,
> @@ -1444,6 +1444,7 @@ static int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL(ttm_bo_force_list_clean);
>   
>   int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>   {
> @@ -1472,7 +1473,8 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>   			return ret;
>   		}
>   
> -		ret = (*man->func->takedown)(man);
> +		if (man->func->takedown)
> +			ret = (*man->func->takedown)(man);
>   	}
>   
>   	ttm_bo_man_cleanup(man);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
> index 1877425abdf0..1127868274b3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
> @@ -129,7 +129,7 @@ int ttm_bo_man_init(struct ttm_bo_device *bdev,
>   }
>   EXPORT_SYMBOL(ttm_bo_man_init);
>   
> -static int ttm_bo_man_takedown(struct ttm_mem_type_manager *man)
> +static int ttm_bo_man_takedown_private(struct ttm_mem_type_manager *man)
>   {
>   	struct ttm_range_manager *rman = (struct ttm_range_manager *) man->priv;
>   	struct drm_mm *mm = &rman->mm;
> @@ -146,6 +146,23 @@ static int ttm_bo_man_takedown(struct ttm_mem_type_manager *man)
>   	return -EBUSY;
>   }
>   
> +int ttm_bo_man_takedown(struct ttm_bo_device *bdev,
> +			struct ttm_mem_type_manager *man)

Regarding naming I prefer init() and fini() as functions for object 
initialization and destruction in C.

Christian.

> +{
> +	int ret;
> +
> +	ttm_bo_disable_mm(man);
> +
> +	ret = ttm_bo_force_list_clean(bdev, man);
> +	if (ret)
> +		return ret;
> +
> +	ttm_bo_man_takedown_private(man);
> +	ttm_bo_man_cleanup(man);
> +	return 0;
> +}
> +EXPORT_SYMBOL(ttm_bo_man_takedown);
> +
>   static void ttm_bo_man_debug(struct ttm_mem_type_manager *man,
>   			     struct drm_printer *printer)
>   {
> @@ -157,7 +174,7 @@ static void ttm_bo_man_debug(struct ttm_mem_type_manager *man,
>   }
>   
>   static const struct ttm_mem_type_manager_func ttm_bo_manager_func = {
> -	.takedown = ttm_bo_man_takedown,
> +	.takedown = ttm_bo_man_takedown_private,
>   	.get_node = ttm_bo_man_get_node,
>   	.put_node = ttm_bo_man_put_node,
>   	.debug = ttm_bo_man_debug
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 92bb54cce633..2ef33b407167 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -683,6 +683,8 @@ static inline void ttm_bo_man_cleanup(struct ttm_mem_type_manager *man)
>   	man->move = NULL;
>   }
>   
> +int ttm_bo_force_list_clean(struct ttm_bo_device *bdev,
> +			    struct ttm_mem_type_manager *man);
>   /*
>    * ttm_bo_util.c
>    */
> @@ -801,5 +803,6 @@ pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp);
>   int ttm_bo_man_init(struct ttm_bo_device *bdev,
>   		    struct ttm_mem_type_manager *man,
>   		    unsigned long p_size);
> -
> +int ttm_bo_man_takedown(struct ttm_bo_device *bdev,
> +			struct ttm_mem_type_manager *man);
>   #endif

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
