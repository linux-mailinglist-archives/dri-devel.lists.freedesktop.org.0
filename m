Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627921F9250
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 10:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7824989CBA;
	Mon, 15 Jun 2020 08:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4FD89CB5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 08:55:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0teWHyDYueGlf0t0mFdTjuzHoGJ81lJo8ham9LGEd4lrhG/WhsIWl/BNokeTkqS+HdEvoiDTkCfUYlhu4js14E0AjN/flKXcGZ93vGI2YQ+/EqWNZq2HX58xcG+dDM/VgpPCDFv5IIo1ILUrsIle3hWjeaTvlAyz5EAJFKKCv5j76fAg6dljALG2HCifapT1Y0rjE8bE+2Y7HE7Styabvj/b338GKPM0UuI7cyIDAjBhOtddfk8KAUZleWOd+t9qzEIHrGM0Tdi44nm2i3XUzxZ7noXR2J4LAGkyxy0fRrxVyaj6sBiAVOB2a+hzAFj0N52Sgn0ThuWmGeT/nBQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caso4/0QK0RPuLPY5+h88j14LzivqNpQK+t8n+09m0M=;
 b=hSVyUyCzJazkYwWOGfNtcZl4lYGsqUUPmcp310vJhDNFlqd9zFwbkpDn8NA/WWEOAOifUtjY8Hbp0g/15noDVwXhIAZHPQrVCcIgiEk69siSsTu/ebYgLMQOH8/9x4nFlznW0qw8JG73IjUlyN3ky2agZ2kkhbYq1r6bzHT1WW/UvfkywVCd/VKQtScPVAW5oOcGQ19n0xH5oOXb+LMNFkhWuPj6EXP+nyldDOxVBWdzKluNHYzcW2A6Dk3t1QaPag767wTgaeG1VFk9lZwKdEZBC8QPZiLiMpEAXDcpIWHfkFx0EZhp/ymC6U5B8ivUDKzKj+x79gzvkRahkefq6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caso4/0QK0RPuLPY5+h88j14LzivqNpQK+t8n+09m0M=;
 b=PWTUPyRS2AMrkUdYzFVuPCP3BsiPCcsMALJ1hLTd2Dr12EZ3lzLhHvMyrMXXOknoWdEpVDhHMmt93kfYu0eifosIGuTLXM9WpzcK0PZ1xX9ZcitTj39i0lGV+debw89bz+mvym2c6EYkZZJ6x+6vDDMzqvcyfHcwXjuXGX5ZxWg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3785.namprd12.prod.outlook.com (2603:10b6:5:1cd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Mon, 15 Jun
 2020 08:55:33 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3088.029; Mon, 15 Jun 2020
 08:55:33 +0000
Subject: Re: [PATCH] drm/ttm: Fix dma_fence refcnt leak when adding move fence
To: Xiyu Yang <xiyuyang19@fudan.edu.cn>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <1592051425-94019-1-git-send-email-xiyuyang19@fudan.edu.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a494dbe2-7f6e-20d2-cd3c-1ef247349053@amd.com>
Date: Mon, 15 Jun 2020 10:55:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <1592051425-94019-1-git-send-email-xiyuyang19@fudan.edu.cn>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0701CA0013.eurprd07.prod.outlook.com
 (2603:10a6:200:42::23) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0701CA0013.eurprd07.prod.outlook.com (2603:10a6:200:42::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.10 via Frontend
 Transport; Mon, 15 Jun 2020 08:55:30 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 324310e7-c417-4957-6984-08d81109dcc7
X-MS-TrafficTypeDiagnostic: DM6PR12MB3785:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3785E9B358D312B2486F47F6839C0@DM6PR12MB3785.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 04359FAD81
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: einueZtfa2o2jawHASqsHuWa2SPlE8Q5HYxJ3e0BtS0E6gkP4Yy/R4V0d9jFVXSzrqARCDb7W0zeTXzj9OKOCx/dLZ88mehukY7KMgM0NmxeoHSLSSoT0oZzupaP+A0i6yFyw6Ai8H3bE/6lR5W/HhARvX/hRtswd8lmHsIQZO2Ty+nMgrkTqIkTdBOOOP5ViYGaqBR7X6G3TB6yh2bvsly1yRstZD+tCXe9DwQo6etd2HzsSmPBnHTcabLPntHg4xv6onkPVVEEZCtFqcoHsR6mKL68lI2Mt7jkoVmSd97TF+Q8+w730CyquceL4iwlFZX0CoA/IreJZA08xL5u4MuSDHPZWYLRc66q7fv06Cin/0dafoOUvBCPXwLmfykJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(8676002)(83380400001)(7416002)(5660300002)(6666004)(110136005)(478600001)(8936002)(4326008)(186003)(16526019)(2906002)(316002)(36756003)(66946007)(66476007)(66556008)(86362001)(31686004)(52116002)(31696002)(2616005)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Kuk2JihSJPFEuigJ9nEnVm/GXtuSxJLzxLiY/Cl3fMYiwb8Dy8ZgfT1sAd43V9cF1r0ld5X3rDv9j2tyjm3t2kELn7lx2iAM75ScsSMNy3wSsbdF0vYseA1hxJhOc9kSniqq4y4XD4ECVguMWBURJWyq1jJNIRdTYp6BQm7pwmcGsLO9fCnmJ1PhAQ9O66t8nAgLxm5m79EKW+ejaF8AG916JFgF08ImdD+YLjyn6a/DElrsCkWlbaFObjCGwW0fsUcZpwYWv3B42oXGIowny6iI4pfCRHvul+fIOSTXfFnDdnIAB8qEwoGnkqTjF2yT9GHaj5SilEk2rJpxocRY8Lr6dfC83J00iHGVuMFxgousq6XWXWum/063t58QjPypKKWAywSOQq8kIa2TEnsJww/6NRqL846Xh4mhwXAVTk7JiHEy4JWi3eMTa83zMdSuNxaO9ZqDOLhzk7kJjdmxRYgEON4TJ8v5QQvF3qabbjHIteNjEIYQNIdUV4Fmu7O1D/FAP7R5X60yHUTNR6DDlxgx1EPdAjGpKWvrlSCTSoGuMuaPbIxbuuWIq0oOmEi/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324310e7-c417-4957-6984-08d81109dcc7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2020 08:55:33.1828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bC/pRgeG32uym8YMMNDiDyexG8BJy5UTETC8bZXuIgTcYekST6FGxqH4uYcGDqq1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3785
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn, kjlu@umn.edu
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.06.20 um 14:30 schrieb Xiyu Yang:
> ttm_bo_add_move_fence() invokes dma_fence_get(), which returns a
> reference of the specified dma_fence object to "fence" with increased
> refcnt.
>
> When ttm_bo_add_move_fence() returns, local variable "fence" becomes
> invalid, so the refcount should be decreased to keep refcount balanced.
>
> The reference counting issue happens in one exception handling path of
> ttm_bo_add_move_fence(). When no_wait_gpu flag is equals to true, the
> function forgets to decrease the refcnt increased by dma_fence_get(),
> causing a refcnt leak.
>
> Fix this issue by calling dma_fence_put() when no_wait_gpu flag is
> equals to true.
>
> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>

Reviewed and pushed this one as well as the other ttm fix to drm-misc-fixes.

That should show up in Linus tree rather soon.

Thanks for the help,
Christian.

PS: Are you working on some new automated scripts to catch that stuff or 
how did you stumbled over it?

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f73b81c2576e..0f20e14a4cfd 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -883,8 +883,10 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>   	if (!fence)
>   		return 0;
>   
> -	if (no_wait_gpu)
> +	if (no_wait_gpu) {
> +		dma_fence_put(fence);
>   		return -EBUSY;
> +	}
>   
>   	dma_resv_add_shared_fence(bo->base.resv, fence);
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
