Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA9D523CDF
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 20:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8807112AA8;
	Wed, 11 May 2022 18:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840EE112AA8;
 Wed, 11 May 2022 18:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A16rpWhIJbaWfx2EPe4EmWFiXlxYiYyD6yuCdYCEztCdAv/a8YClUpKDyvFO9tMeBEgRAIt36OQRl8NTRZ+4bClf/aepr1ZZwS0fgF2h34d0yMI8WkIJcaDJmxtsKHON8LV7yirDbYExcQ8Hj4MsbWH1o4fEYlMInPbAkrLn+onGd4WciHEP3pY8/yF6Q6/iMw5IJbpWoE17Wjwk+3sylpQOU3ALhu6wcVARTjCsGCySXaWDbCFS9n2KeIN8zhf1SOdMrlrzMR0kGHAvWYGDBnvgKWIUtabi42Qz8Czjsk6URE6Q1OV8ITUBPQmwUUZb+NuEwjEp5RWeYKhHERqImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1g0FPoddCsx+E8iv8Wi5XQ+yXn1cAKoxCA2KD2pkSIQ=;
 b=JPwJybf18e9EbTB0f+OXIvIwj8Ob+H3hGzfO1blKjN69LXt2Yhfvq2U/zYlrTXVSQcL0RCyfQ1Q8VrmU95QFuAeg5SP2eSG4iMd/ZQDOG8XyCt/zybyHeTSqkmgPcegyQ1OxLK7HNLnalDggULdPSZuYizMqXu3KR5fyVhA392wsuqilFDm9oSJ4euwrf6fjxGPFQQFTifRcS9guQm5T/t5sDt5T/3keo6EbhbEwilkNNxKwyi5Z8e/arzVIy69P2XmrY1Ir57pis40Nnv+9VZf5rvn1vUY1mHHsbKL9Qd7Rljv/vSAh69YJFQvza2T18MTrK544e7un1UmHnqXAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1g0FPoddCsx+E8iv8Wi5XQ+yXn1cAKoxCA2KD2pkSIQ=;
 b=Xk9jKwnGYLTbEmCCnJHVYxkzzBjB2xQTxn1+KBtUyTh6b0BBxfG2IpWb7t9hiiXT9c08b6PRbeKgaYIyKQSidB4afaz06tYoY+mSBSDOd9oKX7d+gfKfZU2SvgDf25f+ENg9gcSJe7sgLas8IWAWc7kf0RRLJCdZcpweYltGilUbVRm+W0t1dWa30MrQoeBG4mt8NdJJAY2EIBUi9WahwU95jVSqiHnMH85oKmW37Jr+Pcq96sAPjcGcmhk2yNnVzCykVYhVP/04F0zK168lhfWpNfuMRHMpYmCCpeF3xMe7TZgJSQHCSmPWVTa2Wzt2zx5IEL0za2ALiprgIBVgSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN8PR12MB3281.namprd12.prod.outlook.com (2603:10b6:408:6e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 18:50:13 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5250.013; Wed, 11 May 2022
 18:50:13 +0000
Date: Wed, 11 May 2022 15:50:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v1 13/15] mm: handling Non-LRU pages returned by
 vm_normal_pages
Message-ID: <20220511185012.GM49344@nvidia.com>
References: <20220505213438.25064-1-alex.sierra@amd.com>
 <20220505213438.25064-14-alex.sierra@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505213438.25064-14-alex.sierra@amd.com>
X-ClientProxiedBy: BL0PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:208:91::39) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 975e0cb6-1cae-42e3-6680-08da337f14f1
X-MS-TrafficTypeDiagnostic: BN8PR12MB3281:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB328109CAC779F7493772B311C2C89@BN8PR12MB3281.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RF1jQ4Bo30T1It63mDp+LGqs5FV+LetTF+lgQSRzmf2ciGGpJvOVfd1dpJNOW41/2CXuh21hnii9FC1r68z+GTUAIwSc34feYKRjbZVQsScC3G4pvSErZLEA23MeC2E7oiQlAXblJwvysdisRr3oUJSO99sqm3cxnp2WFDIVD9AxT6Fm4GqMEwFluKr37eAyD7XjU6nWQRvxuVp9AGhGw85CzGcgkKLyAV4e34zS6y/fH6Tvfbipc3EYbXlz8vGNEy9l6N0lRLwlnWEZtfTzdZx7perRCWOB2p7sY63RyzEshdqzF8+wyfmIHrRFT2jM9yxxqj1XZN/gir+EJdvdtUqXWy31QweiG+tVeFNWQXseN5PWls/5sE++MCHMTRZYsPFOUO95hX8Om0s0bBTuaGn6VvtajBw/IdcaPFWwWEW8JVkOiBsE3w1LuPn7Kcpsyd+qAl4L+bHGXBFhBK7tLUFiKGHg53oguf3CB3+zS3Am9l3hXmqHqsVKKPUQP6NHuy10iA5PJrXqojrM/cvc8A2iAjG9dkWnNKN57Ki6Xvqwphs30i39Hx8uFm/WZXyXvh9MZxYB9/8EZWwuh0P7e2BPDzomKKArqYTlQoeYw1kULeIS+1Oe9OwcUq2HxKA2mXkd0tkQdU5SzjOwpRuUcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(6916009)(66476007)(316002)(508600001)(6506007)(38100700002)(66556008)(66946007)(6512007)(26005)(4744005)(36756003)(1076003)(33656002)(2906002)(186003)(5660300002)(6486002)(86362001)(7416002)(8936002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VXeI4TGIR7OlomdUi3o61UcKGiMx/fblucIB5fmF7gqfjdgBmNp78Pa6VjuD?=
 =?us-ascii?Q?iQH9XiEoSKntOl/f5DHCwh/a3z/zH9sTSr2L3LvDDKRoILPHlW94lwBtP2SX?=
 =?us-ascii?Q?N/mzJm/H+bt5okXiynUqz966SZlu/IVy8N13F1LnAuhbzMo5N8oBTPH495+8?=
 =?us-ascii?Q?E6rxeNpW+btooTwRMocWxTgiiuUJlHHaVpt7SOmZw/OXuOWPZM9wJ1SQJlGD?=
 =?us-ascii?Q?yElu6BFv5uGkQIyaxctTQ2cFSVW7cp4/jtaj/Uk6DfzADvlvpOd6A67CSAGE?=
 =?us-ascii?Q?aIQ2r57ltUUHKCt3trm9wOWsHZdYKcSWNvYsWeP4v69c8Jao2wpE/V7wpfdZ?=
 =?us-ascii?Q?l8+6eVLGriK8A0JqDgYCK7FYm/dM1TVE9m8RS/f6LGUUuhvsShcULL9qx4tR?=
 =?us-ascii?Q?BBZ2CzKiGUhPzjtn50dNb/zL9fwJdEgVsQq9m5HmNM+AslCdjTaKS4I5zOWa?=
 =?us-ascii?Q?HuX4UFrTOV27OfIK/0AHLAcyXSFLCbN4vaC9azI9v2oOLIxigoWN0Ffa6LVV?=
 =?us-ascii?Q?8MpTcrGQzkbV6SgHhTnoILqelX+JNbPZnSBui3YfzwvSIerGvPbDAG4z2RU1?=
 =?us-ascii?Q?piLu1+n/MzfY5uqVsY3J1uHdV6Qbz/6spR2+KGXX4hDSVpNS6ftjPujqrXtS?=
 =?us-ascii?Q?v3Ef6pZJIoq0yo17hGyebeOyx673fU1lKC6y9MES/ga3+4xG2NB2wTpWzQSj?=
 =?us-ascii?Q?xtJJdB8q3Mi+g2Rk7MCtTrVK6Sk1CVemO75RDF/jXPoD98DvKiXfA86L3f8v?=
 =?us-ascii?Q?rR/i/mEeeVPl2fGderxTpv4yEiwd34Tm+vgxpXNu2PSHKOSt7KC3mqaKLDmV?=
 =?us-ascii?Q?wyT6xJQ8eyfZj+ly4gilD6lIL2pZDRfkCSiXP4HZ537r6nV66hngFsPgAXEJ?=
 =?us-ascii?Q?iLeDTLAUCHTZQlhOLJ2tvSzZKqiwOxkgZxbS6Fo44JnbBclT/wCHQ7S2zv7C?=
 =?us-ascii?Q?AcO1XUOV9SZRJzbWK2Tv0Zx9JYPjKOl6B25Ufis7n7gK8cXz3KY4DJP4dJaP?=
 =?us-ascii?Q?6C7RPReWiZMkRrk5l1aEPBN92JOWDYfrMNgKRZDsJIV14ZatVrmhvp4l9Yfo?=
 =?us-ascii?Q?2Hawu9uU3RMz1C0P+YHBeykYaUCzFwPM/YLp0plKswhCT/wykiW17qkVOQNu?=
 =?us-ascii?Q?bFLP04TvSmTMoKY5rcJPYLjqZH8Fw23Vds/w1i8MBhrSYLzBv/nOnDQaTzXb?=
 =?us-ascii?Q?XXSZ2jqfOh/bQjswRduA1XUfjPU8Gf2k8uaxBZk58BEb0hCv63yl1Ez7jpjv?=
 =?us-ascii?Q?5bw9PyFdMrUKnWxGn4lsqXKQjKmxmAFmVrZtCsnDxGWn7IstdFBIAgvPDc1k?=
 =?us-ascii?Q?KB20uSG2N9Xr3AOCd6GDYiH6TiefGBrVYs9s+Ep+pINyedUYOY0el3ndtk7e?=
 =?us-ascii?Q?p6fbuPixtsyeT1GYGOIpMyAb/l6M+MVgAaTZHEz9xPou6FQ5N4fisxGpCshM?=
 =?us-ascii?Q?fCqVWmbd6KVJjiccJLGzZeid9TKMZvAbSqhDILMSh3Phk4ZPCtajtd4QgLFt?=
 =?us-ascii?Q?utEL1JqYFSwuwb0HKRo0vJQEhG/zmMbaOY7wQMna2LNNA7+iN38WClr4TTPX?=
 =?us-ascii?Q?A27lsTopsLpVfaVMr2bJLnipGxm6SDAKbCKdgOyf6dccEuc7V/wpAEvXmauj?=
 =?us-ascii?Q?vk2aYk45pXxKkRIiPCmuNIQXCJRbCq4f4XuTCbOA90GFSw5XI5zc5+aG8CZw?=
 =?us-ascii?Q?W5hUAoMXK1XwnBAxFQ0tp3x3SK8W/NkJYktic7Dam46q3rfntgqvATw66hNu?=
 =?us-ascii?Q?IqMxZ8j9zA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 975e0cb6-1cae-42e3-6680-08da337f14f1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 18:50:13.3136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSzZ/Sju3P7QEIdvF9dnGCNImeuiNe/1R7vKVUcPHkRhwZlvo4+fTw4Q1R3SjIBP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3281
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 05, 2022 at 04:34:36PM -0500, Alex Sierra wrote:

> diff --git a/mm/memory.c b/mm/memory.c
> index 76e3af9639d9..892c4cc54dc2 100644
> +++ b/mm/memory.c
> @@ -621,6 +621,13 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
>  		if (is_zero_pfn(pfn))
>  			return NULL;
>  		if (pte_devmap(pte))
> +/*
> + * NOTE: Technically this should goto check_pfn label. However, page->_mapcount
> + * is never incremented for device pages that are mmap through DAX mechanism
> + * using pmem driver mounted into ext4 filesystem. When these pages are unmap,
> + * zap_pte_range is called and vm_normal_page return a valid page with
> + * page_mapcount() = 0, before page_remove_rmap is called.
> + */
>  			return NULL;

? Where does this series cause device coherent to be returned?

Wasn't the plan to not set pte_devmap() ?

Jason
