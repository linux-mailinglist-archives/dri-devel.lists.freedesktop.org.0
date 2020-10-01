Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E8427FA12
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 09:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A556589286;
	Thu,  1 Oct 2020 07:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE43890B6;
 Thu,  1 Oct 2020 07:19:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1KTQHwgwwWP2t8UxBjvWS49+LoMXWOrPJxzESjsOSes59S4wIT1OeFdEqKwqyRAYeuBBZEWVb702LFU2wXn7QkAXVeKDANSNc6Rjpc5CBHfzC5mu2uGVG/QjE0UJaafp7aaqNUyvwpkxO3vnll9d/G2p+zaQISUfsUQ4J8K+Jt7Ubtvmk2CWB7BEvjCECBPBgL6hpz4UMl4Wkh5lx02ej6lFQNxagW35ZKu+HOqHJEn8d2R0n3Q3kBHJMzgCGj5vMfn62ImyQcvudHX57qW5QfS+MKq2TFBAsqBPP0OVVCmtLCNUjJ9ipXh0BRKsjfpA1AJQOKH9u/GS7OuLF5umA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLZjfpOEIUpdLXeEcZOIlFo9OkdS7m49zMKLh9rFQeM=;
 b=ARvJ92sr54SkgD1jGF1zkwzSEfLuKcsoFIWvzh5zQVmEv+Um1YneSCww16r0acyyVztaS8UrJiR8+oggih+9GRHUfZ31GRqRaEP1SY6O1ARM5wnD0EbtygkNM3pLvWxzZhZVQMMQGsO7NjIGfQvTf4pyz6CllNuIWDv1wsFvUiGc/ryje1UtULQ16x4F6iWL2+R/EE7Dw3C08TJWdKjpWVPqXBJthsuXncdMAVNudRS3urRjskACsesUn4K+5auLGqs+4hFPz11KR5tpN5jcStWe+dPjBjDJGuk8MBodzKXc9f1TP13qGLhJm2RKyFCJiufGlgcKc7o1Qi7+1kSV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLZjfpOEIUpdLXeEcZOIlFo9OkdS7m49zMKLh9rFQeM=;
 b=ABD46nW3DqTvkyggCUFTF5OpdyO+TVY8d6esW4QJEBklW/2zoBBezPk9VMxex+Vo1GDvlJBwIdTdTS3TmKQkCUzhdDk9Dv1WFGjX/w3YRR4xR3RnDZadfG7wP6523jnmmiKXD2uFrmgfgDtGWDdpvAebI7sn5emD7+ebKZP9Jiw=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2385.namprd12.prod.outlook.com (2603:10b6:207:4d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 1 Oct
 2020 07:19:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 07:19:06 +0000
Subject: Re: [PATCH RFC 0/1] drm/ttm: Allocate transparent huge pages without
 clearing __GFP_COMP
To: Alex Goins <agoins@nvidia.com>
References: <20200930221821.13719-1-agoins@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4566cf03-1c9e-1626-6c92-7b5fa29d6b75@amd.com>
Date: Thu, 1 Oct 2020 09:19:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200930221821.13719-1-agoins@nvidia.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0069.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32 via Frontend Transport; Thu, 1 Oct 2020 07:19:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f30a4cc6-4039-4fba-2d0e-08d865da4865
X-MS-TrafficTypeDiagnostic: BL0PR12MB2385:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2385A591809FC56E8B61C43983300@BL0PR12MB2385.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IymMq5iI7mnOWy9xD1a1KikWq0QeE11uER5hrScmGUMuNNL3AaNiOwNMFc4ORMG9XH/kt+1qxXOM/m1dLfi3yz6dlHyBlvavrrZPSTo34RL6QKtQxPnlSmJYrG3LtS1kIpgcCU8b5w7L8qvS4zFy36LabI7XFRaQASdYLJEgZ6a2JFZgt1SctZfLtxt7woaDU67kCHCd1X3539xy4kI8NXYZsx8NsgNoGz5CynHsGOCLMKx7eEwh2h/PfynQQDHaykc3IHlkbBcv5BywF9NhtUZKitbM1bU8CEQaeKAfFP3EFoJQXBtQPZWGuWcfd01UBOrXZ+x6xsmG1Toqe3oh2CiOlC56eWYdxEtPJFFyarvHrusEW1M5yvx3JESbax1rRVKKQWlM/Bm9SYkdaNeqJGEKXAwZbcLg77FPP/45cZmhUJiqVdcC/Le3VppJIkc9yntnQnCepcToSHgvnZwIaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(2616005)(83380400001)(2906002)(6916009)(5660300002)(52116002)(31686004)(4326008)(54906003)(66556008)(66476007)(316002)(66946007)(6486002)(16526019)(478600001)(186003)(8676002)(86362001)(6666004)(36756003)(8936002)(31696002)(14583001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: jgc4WPclC38YBj4RLMaIqC5rpiUKJQjI06u63awTlck/bLHYbVqoC9lIZb/71GN+AR0bpReTSDgsoE14gjWnuJb3JAS7hle5YRoLsPDGNjJgfgtlVLsFChnjmQ5LJV5Ml4a4z+jDQ7Pei/rEiz+CkrWnINN1IIS4P1P7C8zne+8G1JKjJuXsRGHqMLSVBF5ZYBjbG5eRyRG71tV2sY/KguPRMjVv61AAXspukbA8LoJeZRGVM3l1C9XxlBnQPm4Uujd2XAMHq/sslQjWOTOLw/verBLqEbuLLSx/jEYME7w3LdowZJB+9KU44m9kei6eMI9a7c+Eq0zk1ryamIoDioOf34LJGSMeRwRveZ60/mPpn5ziRPOHC4lk29Y9B2ndznH8+RI2MGIwWKVMx7PQSKONOTcKNHuHawcyIDBM7pbZ1djO6U09Jr+EQQW/3Mmx2k+YMkWCKhDeXL4yyEBndxelaRcnCZCtFnPzehWhwp0oJW3zDDgGmrOaaNhI5/cuOUZArCMkQgFTgDqZi1cWJBKpcVRIWT9OJi2MK2R24sPtsHUH9xF9nJBsLkoos66kws/BHsn63wSKXWL3ZUbRuGA0do7vvFSbwlnm2kBCttVIsRwwuUjlR1QTVKGe58ZItsNNzK4lLb5TsHirBiDkSKefcPs6+l0Fr32+RY8HQXL1fKFZvqvaU5DQzC9AJauMtgu02Hbd9dZAFy6A66sxpw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f30a4cc6-4039-4fba-2d0e-08d865da4865
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 07:19:06.6840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3P+HTlVVXpu45cB2HZAVQ0wkkX/H7de8LEW6az9ztjCv8evLxTa+rfvp0qfuTjt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2385
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
Cc: linux-mm@kvack.org, Zi Yan <ziy@nvidia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 John Hubbard <jhubbard@nvidia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

first of all accessing the underlying page of an exported DMA-buf is 
illegal! So I'm not 100% sure what you're intentions are here, please 
explain further.

Then the reason for TTM not using compound pages is that we can't 
guarantee that they are mapped as a whole to userspace.

The result is that the kernel sometimes tried to de-compound them which 
created a bunch of problems.

So yes this is completely intentional.

Regards,
Christian.

Am 01.10.20 um 00:18 schrieb Alex Goins:
> Hi Christian,
>
> I've been looking into the DMA-BUFs exported from AMDGPU / TTM. Would
> you mind giving some input on this?
>
> I noticed that your changes implementing transparent huge page support
> in TTM are allocating them as non-compound. I understand that using
> multiorder non-compound pages is common in device drivers, but I think
> this can cause a problem when these pages are exported to other drivers.
>
> It's possible for other drivers to access the DMA-BUF's pages via
> gem_prime_import_sg_table(), but without context from TTM, it's
> impossible for the importing driver to make sense of them; they simply
> appear as individual pages, with only the first page having a non-zero
> refcount. Making TTM's THP allocations compound puts them more in line
> with the standard definition of a THP, and allows DMA-BUF-importing
> drivers to make sense of the pages within.
>
> I would like to propose making these allocations compound, but based on
> patch history, it looks like the decision to make them non-compound was
> intentional, as there were difficulties figuring out how to map them
> into CPU page tables. I did some cursory testing with compound THPs, and
> nothing seems obviously broken. I was also able to map compound THP
> DMA-BUFs into userspace without issue, and access their contents. Are
> you aware of any other potential consequences?
>
> Commit 5c42c64f7d54 ("drm/ttm: fix the fix for huge compound pages") should
> probably also be reverted if this is applied.
>
> Thanks,
> Alex
>
> Alex Goins (1):
>    drm-ttm: Allocate compound transparent huge pages
>
>   drivers/gpu/drm/ttm/ttm_page_alloc.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
