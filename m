Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A11D192202
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 08:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A186E11B;
	Wed, 25 Mar 2020 07:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B01B6E11B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 07:54:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iv32msZGOF5sI6ZECuZ7PXI+czJ5BtqfECMXgi6P6YUUf+rniglLert+NeqJ06qsgk3hrwQP9ARKNXwAQ7MaYvzLvdEPPCOqoQkqzfN3lovFuyhcuWgDzs4AEaBhA5ppbVEv1Eik4hwjQIgyLcR9ENsDlBUM4yaRTLXSCCKklIMIxh/gW0X4JR1E+j91RzF4acilBcr2tDea4GZR+E/rssrQFIfEO5t1YXG9SsH/GsyNjhrDdV5kwzpIw8z0wmz0EkpPE8dGf8vNWOCd93eZs7AI/OzgiRDAfcrEMLYMfokJRlxlVat791cf/D5tJGio61sOgE/KfAMTqnAqif2oxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwweisxBYdt6rE0s5qPxfDKZ1sC/WrLq+zTd6cyLZTI=;
 b=Gveu2RCDjAdO+SPlyuMOeDGhYTbjqH7VdvHzJnP42px1Eg09R/7ir+jgAe2ZFl6ayiZb+iZS1AAVULdbEteEp5viGvCQpU9ddlLxNPy7MclDG1hnU+qG6bJKUboJV1VwLEsl9teC8tqNoYbrAK8PiNjhvGVurPq18aNCdflafHphpqwACcWT3oPpsQ8xldtKLiNlT2CgLoCtLl8+a1DD128io6WzT1qejW4xv5Jhs8ogEN3ozvdyxgDyo0OGHC/NazIjJUhi58KkFCusnVv0wNR5+uCPatt0nTwTOJyi0IQkiBY4UFUJsaDdT4bPKM/VeLvlovnJhNHkiQnquKMZtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwweisxBYdt6rE0s5qPxfDKZ1sC/WrLq+zTd6cyLZTI=;
 b=MLskjRSaawZWEWRmq1hRs6zg50f3qW1P+ifTu+v3jwd+LsepZjEsWkUnmTy/vZ7wxnrk1qqxqEhvatbAu+PdcunRcRJRnAwBMfyQQnfFe6BsNbVpV8Bk1g/6Av0Z5D7ltvwxFY+AGi3MHofJ/4510tt+ke+iaqx0bg+Jy7qO2GM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1578.namprd12.prod.outlook.com (2603:10b6:4:e::7) by
 DM5PR12MB1228.namprd12.prod.outlook.com (2603:10b6:3:74::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.14; Wed, 25 Mar 2020 07:54:35 +0000
Received: from DM5PR12MB1578.namprd12.prod.outlook.com
 ([fe80::50f0:a148:4f52:701f]) by DM5PR12MB1578.namprd12.prod.outlook.com
 ([fe80::50f0:a148:4f52:701f%11]) with mapi id 15.20.2835.023; Wed, 25 Mar
 2020 07:54:35 +0000
Subject: Re: [PATCH v3 1/3] drm/prime: use length macro when mapping sgl
To: Shane Francis <bigbeeshane@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200325002450.5240-1-bigbeeshane@gmail.com>
 <20200325002450.5240-2-bigbeeshane@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2f675ff6-c30a-e10c-5826-be897a3bb856@amd.com>
Date: Wed, 25 Mar 2020 08:54:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200325002450.5240-2-bigbeeshane@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0011.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::21) To DM5PR12MB1578.namprd12.prod.outlook.com
 (2603:10b6:4:e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 ZR0P278CA0011.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18 via Frontend Transport; Wed, 25 Mar 2020 07:54:33 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b1c81935-e7f5-4824-7503-08d7d091c27e
X-MS-TrafficTypeDiagnostic: DM5PR12MB1228:|DM5PR12MB1228:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1228C01B3549B229C42D78AD83CE0@DM5PR12MB1228.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0353563E2B
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(316002)(86362001)(8936002)(2616005)(4326008)(31696002)(31686004)(8676002)(36756003)(6486002)(16526019)(81166006)(81156014)(186003)(478600001)(52116002)(66556008)(5660300002)(6666004)(2906002)(66946007)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1228;
 H:DM5PR12MB1578.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gDkKijUYyDi61bxIeHzWUF3ahtGLHeRZqcVsWLCqjAo5k67CMMCg93omsde6D7EnLRwUU52RSzj3hjEXlntK3bZvxLDtvMipOTAk85dFj01HbJ+MPxM0afadNvoF6IWJRIbUkypsXHpr7DcdToR390IHeuDBZKYN3Wu7Pw7aNXVdj2ZwOF2hbV7qgAISmKZN6rb/u6x9nlSFpWg0XmS00E3ZLT1D3GL7LYyH4/k+VNXwBhyuB/DeH92cg1TJs0/hei8psNKf6j5hxyH9t1otF3V+6QKjwGjzM5sULS9hESh2KOxjhh5cxomhwZZqPMJmYPciYk/f/sNomzDIr8kgBd6sta3nH8V2P40PJ+aac0/JAjxPLgWhVbDawTAqe9G3Ndg29CdnRLFhAzppW23OtR3Ak6LCe1ZsKh8nL/MJbclwvZojJXW6vnWzaSptGJvI
X-MS-Exchange-AntiSpam-MessageData: 0xlPMrUU7iByfIAzNn/bASFgPelvFUqGoK0oSwWxGzHBGbVz7l/n104Ls5H92H6mYXqJXKJJ7AzsO6r1ud5aqAJIzoQ+BmPJpeua5vAc3BOCPOmD9mlXnQz53cpqLZ/I6KnzFRmqXv0s27cp3aEaIgTJdsnIndyXUqXm1iUCCc1Sd4vC9/azMF+oM4C2ox/VaQB8OiJpyQNEjGCJgS7xlw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c81935-e7f5-4824-7503-08d7d091c27e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2020 07:54:35.3444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVWCuR0QgWC5OUOoE1F95OH9eHrifVIlBQnfqJUrsywZ3M7wXFRcdsH8iY3sXl9g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1228
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
Cc: alexander.deucher@amd.com, airlied@linux.ie
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.03.20 um 01:24 schrieb Shane Francis:
> As dma_map_sg can reorganize scatter-gather lists in a
> way that can cause some later segments to be empty we should
> always use the sg_dma_len macro to fetch the actual length.
>
> This could now be 0 and not need to be mapped to a page or
> address array
>
> Signed-off-by: Shane Francis <bigbeeshane@gmail.com>
> ---
>   drivers/gpu/drm/drm_prime.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 86d9b0e45c8c..e4eff5b84597 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -965,12 +965,14 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
>   	u32 len, index;
>   	dma_addr_t addr;
>   
> +

Unrelated newline change, apart from that the patch looks good to me.

Christian.

>   	index = 0;
>   	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
> -		len = sg->length;
> +		len = sg_dma_len(sg);
>   		page = sg_page(sg);
>   		addr = sg_dma_address(sg);
>   
> +
>   		while (len > 0) {
>   			if (WARN_ON(index >= max_entries))
>   				return -1;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
