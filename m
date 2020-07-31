Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35AC234690
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78706EA92;
	Fri, 31 Jul 2020 13:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C51D6EA92
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:07:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1JTI8X/4zhV08NeoUdmfGo+BMwQo+K1sG6u/hgjTHzvA0SVGd+cNGCIUoSAPD8kpkWZ9Sa/nEFT8+50QFFmG/0zfKZ8M3SzRJQC01jqR1l4Hf/NFysFOfHf/KL7n9PoGxMBm9kzHyNNCH1PoU9npM93bC6V3ZJbEcHmnT3uJXhUxA0bwgoOhK/3AvS26Oi6g3r2J/Ym3ytcJC7lNwbq1cDWEkeBb0JfQCqkTsqdb0PJFUDsHJkMoP5K/y7l8t2wPxgqwr1uXop0m2Iv6GzooJOY7a76wKXV7vKf5R6N7QerfeSpNhQCORCF58CEXWcCIrUn4ybO9QZ2K4bFErq40Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ljk73q1m/kGjR38rEJkX7LQv0YtK6NouPLZUyMTT980=;
 b=IXRApCxm1D21uDerDT1YiN5CnFYUkTA4mI4JBYqwU5/AmwTsEUaeCZaWqw9C/x+Uin6PN6PFDp+z9B7GIGx/nyXUYTTXav/72vtdaE7hQlAab/2XmK705d2BHNo7ruTf3heLT0BLDWFJPDab+jzaE0LD5jW/VHFQGgaUHKkOHGI3nknU/BDdggpWOfc1Rp7uOUxCzalA9MrbI19ETqtmftomjOhH79ez++bECTTUJx6bofEL/Jx4nHdJaEzwuKd8KntzKmm1gYYmU87zz/wGWSj0jDv5ZDJQPfjsIitffRVnRQ4TrHn06ccA5F8bV6M+L/nIQ+gFoRKYJAKN9Rlznw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ljk73q1m/kGjR38rEJkX7LQv0YtK6NouPLZUyMTT980=;
 b=xMc7nB8dLoKT2X0s+gAprj1p6IZstKgveN8GaIFtMUQeI/NrNdb3W+tQIUZ3vt2+xUgTkW7JMnWbl6SHnxJucxLw6vtzq3OoVUdr9tpvfTu0hbX2EH+BOPaEl7EFbIX9xmPxI5PosT3DDrkdElBxgBBFHRWVA5mZZKi6vaj0c24=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.25; Fri, 31 Jul
 2020 13:07:10 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:07:09 +0000
Subject: Re: [PATCH 15/49] drm/ttm: make some inline helper functions for
 cleanup paths.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-16-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5915aff0-573b-06b6-4eba-5f60b83539d4@amd.com>
Date: Fri, 31 Jul 2020 15:07:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-16-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0118.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0118.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 13:07:08 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07f6f6e0-60f7-493b-c9d1-08d83552a1f4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4109:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4109567055F4E9484C0B3F2E834E0@MN2PR12MB4109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Gnl9/LbxOPQRTuLQul+nSmPUhGlHmk2QrCIMhd5n28O73sFz0J98LDXQ5rEbD3HK37STJ1hwF90oAKpUrdlqUgDL3T5syH58gkY0DD/QURdeGAhwTcwqvFU2Twxj1vZt6Ux3AsoyxIeq7T2V6Y4sa97E5mlqWz1s6gJLj2rFYulXbualkoX2pUNr+Lzy3XrJkj6iVjhGIFVgXBnPCIM8tQVmRhKsMd6tPlp0s1SsN9ZUmoHv3NFDxAT1r3L/SO8AEU+gfjGQYPfCb1HXvcznacrtLjp9sCAFMCiBlb7rm6l2srdfH3h/mT8HhyAsbHnJ7eu/6csRP61y3dhkiJhFX0FBLQx3UBmWC5YeV+SzQoxofO1RP7ITnjbVPNlEYJ6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(83380400001)(66476007)(66946007)(4326008)(5660300002)(2906002)(316002)(6666004)(66556008)(2616005)(52116002)(31696002)(36756003)(186003)(16526019)(31686004)(8936002)(6486002)(8676002)(86362001)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: hzQELP2Fr0X1kNVUSA/AMF2O+0SXOJS5okYQk/QpAGNxx0C7h5DxmBFSN/ev+BZylCa+oWu+QlHShbXAHxPmR4lLiX+bAC6CPN9LVz63wbczB+BVRxwF378POwXORa+/kBLzuiVyc9V3zgaUPu21n/vnrn7AcIeONqIkwHw9gkhn0y8pg3GtM6ZhJcfye0pR596u995ODO8zH5OVjAiagDdD3td+n1xSal9n3sRS2v41EZmXqKDXdlFFVcWgL+T4PlPT2XgwVnP/cBgPPuQg/36nLK5n2q1FP0EajZOwNdQCDAZT+zvO+eQaF/mpiegILDs6T8IaUc9vk+7qev+WxfCH6U551Ovq9/Akc8+TY+NnOcH1sO2dsDV1tM0ghBJYBONO619pV8+WnUAEZcmEPB4UtkKWbehmfcxIrm50p2oWNqCimdIxSDNiIClZ3/EDd2IrOAH7nFda392qN4e3RJ83pxurvxUA7qgjzuI5cSRYFqJeXHLZQCYd8GLAYUxYQQOStEDUJFVsaRob4gxedpwrP8cwu7KFDAX0xnX+FJRrSxGiLJQ9Sl7r0ouhsT1V
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f6f6e0-60f7-493b-c9d1-08d83552a1f4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:07:09.7427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pL3DfoLizSZn0wsYlOSl7HY2KYW4NSjoIo7ZeOcR38MF6HM9t0O0UJs6xum1FWiQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109
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
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c    |  6 ++----
>   include/drm/ttm/ttm_bo_driver.h | 12 ++++++++++++
>   2 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 84e399395e4f..f584e5e94383 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1462,8 +1462,7 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>   		return ret;
>   	}
>   
> -	man->use_type = false;
> -	man->has_type = false;
> +	ttm_bo_disable_mm(man);
>   
>   	ret = 0;
>   	if (mem_type > 0) {
> @@ -1476,8 +1475,7 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>   		ret = (*man->func->takedown)(man);
>   	}
>   
> -	dma_fence_put(man->move);
> -	man->move = NULL;
> +	ttm_bo_man_cleanup(man);
>   
>   	return ret;
>   }
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index d0f1a6cdfba7..92bb54cce633 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -671,6 +671,18 @@ static inline void ttm_bo_use_mm(struct ttm_mem_type_manager *man)
>   	man->use_type = true;
>   }
>   
> +static inline void ttm_bo_disable_mm(struct ttm_mem_type_manager *man)
> +{
> +	man->has_type = false;
> +	man->use_type = false;
> +}
> +
> +static inline void ttm_bo_man_cleanup(struct ttm_mem_type_manager *man)
> +{
> +	dma_fence_put(man->move);
> +	man->move = NULL;
> +}
> +

What's the value in making those inline? This is not performance 
critical at all.

Christian.

>   /*
>    * ttm_bo_util.c
>    */

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
