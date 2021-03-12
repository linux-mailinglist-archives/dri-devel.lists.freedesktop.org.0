Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD7E3384B9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 05:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F296F417;
	Fri, 12 Mar 2021 04:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B43D6E110;
 Fri, 12 Mar 2021 04:42:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ba9YDpVj0NoLxL1uiSod4GaSKUxgfGwxYEO7VhsAQzbVsDEZQ4eV3uUOPwU/zQE0Abg47D6PS1gKAe8sOjQeIoJVoYpkC0Br9jDckGXkUcxoDQOuSR7Ium5WuVyAwFgd5rRjgPdiAHMHSWngL2YD53Xsgm+por79SeCihLKGG9Witl0H186tzB8+3WDw713PQFBkXzuyk5GUU5Sm9eMUrq2S2uJ+H4wjGqtdWrtGd8TblyrsLlIRNmD89w6Fd1gRmJT9u/xMO0fKOdGQqBuTM6zMmaS3T+Dks4VC2OIaCkLG3sL4hKFa33mV99PdffMXWAiGcn89pICbAWfmlUOn+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTK0VPwwkhLyGgUfm/5MUrWbjzo2X8rxMBnm7Z0Pbns=;
 b=GRUnR8juX0PDp2MEUVjoXO+YNqykY9SQj7EZ30KKBcfDCkXA0ktItYJEqiyQpfbFMNtaLUyUYExYE7hVdGE6iiV0FIRx856ybbUptGe6MbpDQyUNCgNmkUtbUAZhmNMb9u+PAfO1/r89KLPyBgEf11/z03VFEoXNcYU8F2eZDXEo1hlvxGEeKKM2O1wTTwIp6jPHCVLbR24xXX0km8+AzC2N3DABCsDnbxmtQx5oYXDP86Bf04Q1Xn9lI1/Q47Sob1dH1JK9Js9oN8iSRLpOXYopnccw9BaXMSy3E8mjOSPvHJ9m7GxKix5qhu8MeXyVkwkjrBo36eM9MA8FhqOktQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTK0VPwwkhLyGgUfm/5MUrWbjzo2X8rxMBnm7Z0Pbns=;
 b=JKNqqEqntWbJrQKaF+3BthDC8FnakQrPeZc0k+EXqPVTb7BH4i7DGGDpS27iq1P6WCCyco4nnddyPsQ5MQh5M/3RPFo/Iy/KcwyZ884qNeSxbH1ZPgLG0i4nQM8UP8tnFe1mYDMCp+dN+BoIH5nOSBv+UTbwc4AIFg9TOrA3i0ydKgSBoKWrTpXM25eJWIcMadEOQ3w8Zd9STZNwKQ17P3ZRSadphgYhGZx66mO6z39d1hzXoW+1BMhPfpRGsDd2wzeLeYsYs22f30BPj4cduFblhgbijzG+QdfQCVPzNT6css9kWoZ7zz3j684RqPfbPMNUSV0IiTFTafAYktx2dA==
Received: from BN6PR13CA0011.namprd13.prod.outlook.com (2603:10b6:404:10a::21)
 by BYAPR12MB3173.namprd12.prod.outlook.com (2603:10b6:a03:13d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.30; Fri, 12 Mar
 2021 04:42:50 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:10a:cafe::28) by BN6PR13CA0011.outlook.office365.com
 (2603:10b6:404:10a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Fri, 12 Mar 2021 04:42:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 04:42:49 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Mar
 2021 04:42:46 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v5 1/8] mm: Remove special swap entry functions
Date: Fri, 12 Mar 2021 15:42:44 +1100
Message-ID: <2167899.OcvonqYCbN@nvdebian>
In-Reply-To: <20210309124949.GJ3479805@casper.infradead.org>
References: <20210309121505.23608-1-apopple@nvidia.com>
 <20210309121505.23608-2-apopple@nvidia.com>
 <20210309124949.GJ3479805@casper.infradead.org>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd51258b-0988-4bfa-b5ae-08d8e5114a7e
X-MS-TrafficTypeDiagnostic: BYAPR12MB3173:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3173C96F00D6FFFD92B56102DF6F9@BYAPR12MB3173.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WFlhR2qpeQYMK2jDBMXa3uHStYOSv/TSPUvby5N/pt+Rr07nrhSZZ3QnxyHQ8gj+sNTh4sI92wBaI8KT5om9/AfwUdNAHJnwOA92H9AAmlf65crh4EJBkIdbwCzZDZWfP+IhHNavU9F4gExlbJG8jECEQTwQxjRTwqOCEGKXK01zd95wcJLnEy/009lGRBCazaQj7B/TlV9pnc4GthnDFW7g+WjEKjxIaPHubrdlTuCSDlVuS8NJHssD4ybMHHSbPQEw5mK0egYjE95oRg5f38OwYVeBfe9gjs1aKAY1WwE3MzN7G0RyvXujAsAz4JHF9jKUGpL0vaPRP7IYO8KqXXwzRADbXNf8Ld0SnbZnAHf368UbIA2hVHZ5H1OIGu+gh7DiLBT2O0iGsyFT6OIOwd42Vh7d/0JZrm15eRKBvviWT1FbHu72VMqEh1t2Sye6mUe/UcILeIaITjz8XmKAKWRVnSmxZWMYaBegXGOG/udLmOobVMnB/sfvbVxxnnJaELIn76mZmS87lzhuFdoHo/bYRF0tAf2dj/D7YnG1tZbxXx1+yDQh3wp6VEaj76D5RHpjQHvvDJpBIUQfqc3YejcSTIi+5L0g2VkR8xCUeprcMek9zLkTuZzIZJnagszzW3Ekvoco1J4jfpcYbZsdD6XDiZuc/juUoYVoA12POo+tmqkwZm4e04mmm0XlieXq
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966006)(36840700001)(36906005)(54906003)(7416002)(426003)(82310400003)(5660300002)(316002)(356005)(36860700001)(6916009)(7636003)(83380400001)(86362001)(47076005)(82740400003)(33716001)(336012)(186003)(478600001)(34020700004)(70206006)(26005)(70586007)(8936002)(2906002)(9576002)(4326008)(9686003)(8676002)(16526019);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 04:42:49.8408 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd51258b-0988-4bfa-b5ae-08d8e5114a7e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3173
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 9 March 2021 11:49:49 PM AEDT Matthew Wilcox wrote:
> On Tue, Mar 09, 2021 at 11:14:58PM +1100, Alistair Popple wrote:
> > -static inline struct page *migration_entry_to_page(swp_entry_t entry)
> > -{
> > -	struct page *p = pfn_to_page(swp_offset(entry));
> > -	/*
> > -	 * Any use of migration entries may only occur while the
> > -	 * corresponding page is locked
> > -	 */
> > -	BUG_ON(!PageLocked(compound_head(p)));
> > -	return p;
> > -}
> 
> > +static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
> > +{
> > +	struct page *p = pfn_to_page(swp_offset(entry));
> > +
> > +	/*
> > +	 * Any use of migration entries may only occur while the
> > +	 * corresponding page is locked
> > +	 */
> > +	BUG_ON(is_migration_entry(entry) && !PageLocked(compound_head(p)));
> > +
> > +	return p;
> > +}
> 
> I appreciate you're only moving this code, but PageLocked includes an
> implicit compound_head():

I am happy to clean this up at the same time. It did seem a odd when I added 
it and I had meant to follow up on it some more.

> 1. __PAGEFLAG(Locked, locked, PF_NO_TAIL)
> 
> 2. #define __PAGEFLAG(uname, lname, policy)                                \
>         TESTPAGEFLAG(uname, lname, policy)                              \
> 
> 3. #define TESTPAGEFLAG(uname, lname, policy)                              \
> static __always_inline int Page##uname(struct page *page)               \
>         { return test_bit(PG_##lname, &policy(page, 0)->flags); }
> 
> 4. #define PF_NO_TAIL(page, enforce) ({                                    \
>                 VM_BUG_ON_PGFLAGS(enforce && PageTail(page), page);     \
>                 PF_POISONED_CHECK(compound_head(page)); })
> 
> 5. #define PF_POISONED_CHECK(page) ({                                      \
>                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);            \
>                 page; })
> 
> 
> This macrology isn't easy to understand the first time you read it (nor,
> indeed, the tenth time), so let me decode it:
> 
> Substitute 5 into 4 and remove irrelevancies:
> 
> 6. #define PF_NO_TAIL(page, enforce) compound_head(page)
> 
> Expand 1 in 2:
> 
> 7.	TESTPAGEFLAG(Locked, locked, PF_NO_TAIL)
> 
> Expand 7 in 3:
> 
> 8. static __always_inline int PageLocked(struct page *page)
> 	{ return test_bit(PG_locked, &PF_NO_TAIL(page, 0)->flags); }
> 
> Expand 6 in 8:
> 
> 9. static __always_inline int PageLocked(struct page *page)
> 	{ return test_bit(PG_locked, &compound_head(page)->flags); }

Thanks for expanding that out, makes sense and matches my reading as well. 
Will remove the redundant compound_head() call in PageLocked() for the next 
revision.

> (in case it's not clear, compound_head() is idempotent.  that is:
> 	f(f(a)) == f(a))





_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
