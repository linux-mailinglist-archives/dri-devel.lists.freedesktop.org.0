Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B13D181267
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 08:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505486E7F5;
	Wed, 11 Mar 2020 07:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02196E7F5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:52:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDO3rv4HB6fBYWbSQVNVFDM+zFz6QuDaRSfaHQCL1dH54zBpZWO+4FP2bZrO3s+DJmIB+dvqDcHqJFnUrEPQCcd0NYcLXRlJ1sGdGZIIxF3HjpqAMgo6e+OJQ68NERdcxTHJ+UUfPXbBSuWknZ4UfXz0v+v2lzv6yjgBXYPo2VIYJyS6ZuzJFng2lsTs+u51poMdGn6wxKta8lXDwGGbAFVLuT/ofTGRyeFPe/FbnRA6WtQB1sVrWZq6VyXWdeh1D56MK71o086KeN5Ngz05/LxT/9AxSuuVM4RafZLlVnapWFa+TxDxalubBilxV5FC+M3h6t3hmNhINnaevl0lHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvRzHiPg4zhr/7Iix1ApfvuHBQBapuuZeCph8XAt3ec=;
 b=EOQx0fqZrWQEnDLUnyHDOwgS1oPDv/PMrLw5NHZHme3hd95+1C3FJBYQMHZE9UXvr6eDZdm7+DRq/uZlWG14BcndQmf0yc0BtAkaftq5mseKuZq4QeBhcQxN2CjO1fg6lApCsaMcK+rn5d6NsiLzijPjPf6cyIEP28hkfEEHFVvsQ1c0oBBk1jxd1WkUMyk53q64k/qGhjPU73G9AoJAB17pGr2dDJJnq7qnDjrKy0T6Yjf/u3PZ5CW7YyBcE4+RJL2eSqBqwHDZpfzndVWk5TkjxYa6fqe9EtCxO0y98FaSiqPAsOiqNQS/MP3FcOHD5ZlQLYnpbiPXvFcbLgCogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvRzHiPg4zhr/7Iix1ApfvuHBQBapuuZeCph8XAt3ec=;
 b=yR5h2qUuhC0aAH/bgRQErrAXdSv1/n+AYO28zw9B1UdDgD8MEHkfBxqsWNCiY7Suzk33GTOm5IaKtHfhzrakRewu4K8ViSeWqUMIfZY1+WM/+fo0mpmkiOT3x1zVxM97/EBKBIh645fdzrEuJb1FxEqXV1ZGFUUO09GTO5qkMUw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (2603:10b6:208:106::29)
 by MN2PR12MB3869.namprd12.prod.outlook.com (2603:10b6:208:16f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15; Wed, 11 Mar
 2020 07:52:45 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b%5]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 07:52:45 +0000
Date: Wed, 11 Mar 2020 15:52:37 +0800
From: Huang Rui <ray.huang@amd.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] drm/ttm: Use scnprintf() for avoiding potential buffer
 overflow
Message-ID: <20200311075236.GB2835@jenkins-Celadon-RN>
References: <20200311073452.7056-1-tiwai@suse.de>
Content-Disposition: inline
In-Reply-To: <20200311073452.7056-1-tiwai@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: HK2PR02CA0155.apcprd02.prod.outlook.com
 (2603:1096:201:1f::15) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jenkins-Celadon-RN (180.167.199.189) by
 HK2PR02CA0155.apcprd02.prod.outlook.com (2603:1096:201:1f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Wed, 11 Mar 2020 07:52:43 +0000
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8591d569-5b56-46ea-2ab0-08d7c5912f34
X-MS-TrafficTypeDiagnostic: MN2PR12MB3869:|MN2PR12MB3869:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB386925074440776BD5F8C444ECFC0@MN2PR12MB3869.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(199004)(2906002)(4326008)(316002)(86362001)(81156014)(8676002)(33656002)(9686003)(52116002)(6666004)(6496006)(6916009)(26005)(66476007)(956004)(54906003)(186003)(33716001)(55016002)(81166006)(66946007)(16526019)(5660300002)(478600001)(66556008)(1076003)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3869;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cimgq42jlF9S+7+CXN+F95tnQBPG0LmDH1cXZsHemVVeYYjXDyfJfSF35Xki/gkCcnylEu21yROC8GepnexcBqR3njR6eVhsfQZe6nyQwit+uW5Y894bvCCQRfAm1GJtux5hRhGQx+05+KRxff7ovx23Mv0v6hraCUv+Yu+3AlRtWHs6ywTTOpKsK/ciUY21xHFQ4eQeGO9AD+mGmEiFX+e5XLGAUgPJrsxFPXG3ZMAOT0lTJrd9513RDINi5ru8q87u+l2CUGnXSV3//j1pjkIxdGQFkw1FBDS22sWjMjhvZBA3CtreXHeBGka/ImLWE7XkG/SxszL8gFK9paDUVMu81hB39njVlLFR5eIsoGckmTL+hkaTTr62Zto7BVZt5hQZMVTurx5BEHl1ddONSC3XU1hl461QM78X36B7Jk2NQfmYTW6nMkC8SBF32/Ru
X-MS-Exchange-AntiSpam-MessageData: c2uVOgRxKKCfbyNGMB3zYFLaLDWuB5b3F3b6nw/YITc12mkDbwBftg82BHm2ghV380pYtjnnIKIx1E6oYi7vzLAqXj+48EJML9OIwm9btPRd7aLd/JXu/q7mAbOmFEGjq9+1jLjUDISLChUZUEn92Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8591d569-5b56-46ea-2ab0-08d7c5912f34
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 07:52:45.1041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Re+3C6SrSH5k7l0zHZ3NA2BCexCBlAcGYrzf3mMv0/pK7PUrJDFUd1ec5mK0quc8yYATH1tgvDFuEHTxDIkMXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3869
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 03:34:52PM +0800, Takashi Iwai wrote:
> Since snprintf() returns the would-be-output size instead of the
> actual output size, the succeeding calls may go beyond the given
> buffer limit.  Fix it by replacing with scnprintf().
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_page_alloc_dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
> index bf876faea592..faefaaef7909 100644
> --- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
> +++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
> @@ -604,7 +604,7 @@ static struct dma_pool *ttm_dma_pool_init(struct device *dev, gfp_t flags,
>  	p = pool->name;
>  	for (i = 0; i < ARRAY_SIZE(t); i++) {
>  		if (type & t[i]) {
> -			p += snprintf(p, sizeof(pool->name) - (p - pool->name),
> +			p += scnprintf(p, sizeof(pool->name) - (p - pool->name),
>  				      "%s", n[i]);
>  		}
>  	}
> -- 
> 2.16.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
