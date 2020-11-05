Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBCE2A786A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660166E9D0;
	Thu,  5 Nov 2020 08:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126306E9AD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 08:00:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzsPCTfrkoKfcmSMPX4JDQFb65VSwwlYmTn2SnkGLZ2Q/1j648Jos4oOO3bDtZmfyjNbGB60KlpQnDh1n/WPym+9788K+xP7bZRjS3jJU8UQNh4Be4sH1wkvzEbVX4VQ/NDYX6DCwoy1Bc7mAXpJhOsPFtzZQxnqrEzyqzkUDBFgSNf69FUgJWmuwymGVPR4vPg6eg3h1/uwjkAH4Wocg/822419XJ/p03hh5qhE8hIcu+KojJtb5uii9ww7aAZ2l+bDmbvSxbQsI8gCon87asFMtDYrMSF6OiIw0jIQucj67wr3z8mu5C46YfmD355Vn3B7x5XiAcIr+G/7SYhgnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNfHXwDhx3UY2j0NoHdvLp+lHhwZLJAvUNMZHRRPTVA=;
 b=hRVXbwCGgY5vPjnwTOdBlOvVjdhdvv9QahwHvodF45eFqKQAXoMRqpOuV01QAyWB/u/unLBYEhSot4LEqsgtaBA/MHzy+0Js7KUIYUPSimAaRC4Ls/uZJlImIHH+D+G9IUlBB7YPy1VXvygKmALAs6S5jG4ODJTkSjyJZ0N/Yqwo68wxuodVLLZL5dzos58jhjCF5sMk2gSWgKk5TFqgPrEmfNEyXhRfZj98Qr0948qa1yfx3abjIaS19otewzRQNA5uHPWhQfvJPrXfWSdTBEJEicGIVgUF0E9RS27B8xcmrku6FKdJtG0KS3uoh4ve3XD/dh+S53cmKxU2lkRH4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNfHXwDhx3UY2j0NoHdvLp+lHhwZLJAvUNMZHRRPTVA=;
 b=ir4865d/NBIx+EEp2/gRV4Vy4am9+nggtUXiQHDM0aWT3aueUdzOydXXLaJc1O1vW2oM2wVAljzBYroXIrumDwefNmhaf2O1z1rtgYYNG6dOv/NT2kEdouxB3negioJqiAQyBFfdtpj/voCwBsw7o0jlucLe/30g07bnpgY5hSg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3680.namprd12.prod.outlook.com (2603:10b6:208:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Thu, 5 Nov
 2020 08:00:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 08:00:05 +0000
Subject: Re: [PATCH] drm/ttm: don't set page->mapping
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201104165030.2005167-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <859e2b9c-c202-25c6-b52f-9841fe32b082@amd.com>
Date: Thu, 5 Nov 2020 08:59:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201104165030.2005167-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0082.eurprd02.prod.outlook.com
 (2603:10a6:208:154::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0082.eurprd02.prod.outlook.com (2603:10a6:208:154::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 5 Nov 2020 08:00:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90b74db6-16e8-47b0-6a8d-08d88160ce63
X-MS-TrafficTypeDiagnostic: MN2PR12MB3680:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3680715E0A506D7658C2422F83EE0@MN2PR12MB3680.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cI4Ga88X+Jb7UMWq3lwwB0wEqhvfqhsJaWPpKbFQd+Q9f7PSF0T+migBrQ5uTdYdeRLV3b7Dw+ZUqIv7nTxa7BBOD9mZe8OML/c/62DJjUDEPgTDIY8nIJNQmK1hokshQaiL6o8z+2kTKT19vCRzLLEnDnFz29ZAsQp/Ev6Lgcl6xrJpviSjWDiNlZP2G18PqRKYi2Eu3Dox4Ifo8sMq+dtpRwdgT8d6YySFJ1AwvnjllA+dsgZ0A3e28BIT9qLb1h1cF4Yj7DOJ2tq93aBadIWWLp6CWmtMKwfEQqP9GVgQsy3wVB8lideKJvHSyXjhpFKVu45vSs1V67LNoot06cqUnZPVB0Y4uF76vvZApPxVEpaiYrD57Wbt5cEUzarj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(66946007)(6486002)(478600001)(2906002)(8936002)(8676002)(5660300002)(31696002)(86362001)(4326008)(66476007)(316002)(36756003)(110136005)(54906003)(66556008)(52116002)(2616005)(83380400001)(186003)(31686004)(6666004)(16526019)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: rq1LDpFBzjtwfQM9pkJJBUAWypDawdYfucfQ2c7E4AEiVK/FwHFWJkMVL/OIqub5CgPCBKWRf/SQEVGvoxqFiB4KiFRYoO8j/lHCYlejcVH3SDF5KQgSVNWmVMs8secTUTDwaQipJLgH51BPhAQgjiHbjIVm+E0JLvqgSWiD3pkvFWHq3c8K9YI2DIgpN8ROmUyJDXN5zZ89OiwI+nZIe8XYYEkUVBmTfmje/+VChp79MK3WZM5TSgx2ZnBJ6n11ITfK0JI4O0BNLIFXb+CbW42AM9qul834P6RSZNPAM0M2TZ7KpsnkCNT2f+b9jxZKijqcWnEl7zHWR5giRCXnMbEfHXxp1fUtuq8PnDufkIkQE3B2L0Yjh6dcSyHFsCKYx4fza29jGmKgWIg9dshIXpE/GYJNMaS+6XIN4cJnKhFq+pKU1gF6MUSSovmZbhQw3R8CngIS+eexSvZfKsfcNYbb1kzfIQuxZIqfklNcxWb68Ygc0alPa6BJlsQDJf2iUUyk/WPX+6CQqMaiTZwDNNM25LaSynbNORW1AWFVT8Joi1Fu4MIyCoEcYTkXz31lYewKvjx2NqN5tXHVjbDlH3NKGGp8j1LNDVfSGQc04Gb1zlR3lMHCMOWNOSvcUJnRwUucP2c+P0VkkNNeQDDhKo0sGkzIST2Dw/1rUbeU03f4xxgKDwOzwJvn+iFzHExbqaEOetP4qPl9ybf7vT5xyw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b74db6-16e8-47b0-6a8d-08d88160ce63
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 08:00:05.4089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQ9AYf7OMDVYPSt1k9Lp5+LdBLenBD/FW2E/C1Ns/8KNU66W9FtZlYDH2I697l21
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3680
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Huang Rui <ray.huang@amd.com>,
 Brian Paul <brianp@vmware.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.11.20 um 17:50 schrieb Daniel Vetter:
> Random observation while trying to review Christian's patch series to
> stop looking at struct page for dma-buf imports.
>
> This was originally added in
>
> commit 58aa6622d32af7d2c08d45085f44c54554a16ed7
> Author: Thomas Hellstrom <thellstrom@vmware.com>
> Date:   Fri Jan 3 11:47:23 2014 +0100
>
>      drm/ttm: Correctly set page mapping and -index members
>
>      Needed for some vm operations; most notably unmap_mapping_range() with
>      even_cows = 0.
>
>      Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
>      Reviewed-by: Brian Paul <brianp@vmware.com>
>
> but we do not have a single caller of unmap_mapping_range with
> even_cows == 0. And all the gem drivers don't do this, so another
> small thing we could standardize between drm and ttm drivers.
>
> Plus I don't really see a need for unamp_mapping_range where we don't
> want to indiscriminately shoot down all ptes.

NAK, we use this to determine if a pages belongs to the driver or not in 
amdgpu for example.

Mostly used for debugging, but I would really like to keep that.

Christian.

>
> Cc: Thomas Hellstrom <thellstrom@vmware.com>
> Cc: Brian Paul <brianp@vmware.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 12 ------------
>   1 file changed, 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 8861a74ac335..438ea43fd8c1 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -291,17 +291,6 @@ int ttm_tt_swapout(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
>   	return ret;
>   }
>   
> -static void ttm_tt_add_mapping(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
> -{
> -	pgoff_t i;
> -
> -	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> -		return;
> -
> -	for (i = 0; i < ttm->num_pages; ++i)
> -		ttm->pages[i]->mapping = bdev->dev_mapping;
> -}
> -
>   int ttm_tt_populate(struct ttm_bo_device *bdev,
>   		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>   {
> @@ -320,7 +309,6 @@ int ttm_tt_populate(struct ttm_bo_device *bdev,
>   	if (ret)
>   		return ret;
>   
> -	ttm_tt_add_mapping(bdev, ttm);
>   	ttm->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
>   	if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
>   		ret = ttm_tt_swapin(ttm);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
