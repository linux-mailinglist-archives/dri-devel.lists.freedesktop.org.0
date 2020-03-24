Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A18192269
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84ED46E5AB;
	Wed, 25 Mar 2020 08:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130085.outbound.protection.outlook.com [40.107.13.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C010898ED;
 Tue, 24 Mar 2020 19:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYnTQUcEmBQtDvMVvdhBmwZKx/mlyfwxmLtqGC3sVmDKzTiFp0654XjeRhHVU6lWnlF9frrf5/FA8YdzO3EArElGSeNsC/nnEEftyCkCxBkzJQMJ/Le3E5jyvY6ab5mLZKZlM5R8sbRnWNLKTgSirAEKteE37x7h0/AFy81oL/A0T+lNLfVbxeyEcjKEKYp1FvB5chwPvAg0HKBfN9A47Jfe6c5jpbBmBLIYJ07yZMD32UuHKUKtQp6UqdJkRu+juKOhlIltyYhfSS6JdnC/iFjb38p0LtRqQm+ZeDHhCm+Ky2/MRHA9Ncnqy4xyDleXnDY5sGjRuzgKjtQMW/WhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjxTRH38f4oPiQSDrwwtpIlFNOEoIJpTdTunUh7AM3U=;
 b=f+o7QzLiCuugl4pqelCsxuM7pWYoNqdl5rQBajj8GMyiAVu8pEnyQSlU+IvcTLCmMPNYDYBnz0CQCOe+HVujP18fkqJt1GfCxCB6Bjb4sR++Hl3vNo0+IRBcMjEB7TkZTY1doGPXaj/Xzo7CfOQX89aVyv9fDf5ZaYUZ7PxvA8hlw1fg8Ztiwt85PKBsLTsRfTWBv/2iAm30LCUIDGaMnaG/tENcaorqTVSR0pCdA8JQyAIYPKytnINyhSBTwwNzZDr+aNZpGPaTBiBhpdmqym70Ev9btsUlAH9GW9XrygW8C3neVU+3+jpk1//22valJi485ijZkmE0NSX+qrP3Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjxTRH38f4oPiQSDrwwtpIlFNOEoIJpTdTunUh7AM3U=;
 b=lb4MFNCbHNBYKzhT8cFRO2Wkm4wXGitvbIuvNSzi9BwCpxjaObE0of3EHyloYpEjF0XgP9P3vERv7tvYxwLvfhXDJQS0LMuBgb3jgr7YR/TdzmJEyByB5C+1BONrqR89jddE34egbF679VPe0wt/nOjmdmm+rDCUqhpapdRbd7c=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6704.eurprd05.prod.outlook.com (10.141.128.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Tue, 24 Mar 2020 19:31:20 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2835.023; Tue, 24 Mar 2020
 19:31:20 +0000
Date: Tue, 24 Mar 2020 16:31:16 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 hmm 4/9] mm/hmm: remove HMM_FAULT_SNAPSHOT
Message-ID: <20200324193116.GO13183@mellanox.com>
References: <20200324011457.2817-1-jgg@ziepe.ca>
 <20200324011457.2817-5-jgg@ziepe.ca>
 <20200324073339.GC23447@lst.de>
Content-Disposition: inline
In-Reply-To: <20200324073339.GC23447@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:208:23b::15) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR11CA0010.namprd11.prod.outlook.com (2603:10b6:208:23b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend
 Transport; Tue, 24 Mar 2020 19:31:19 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jGpGe-0002mN-5U; Tue, 24 Mar 2020 16:31:16 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4066c1e0-4117-4a5b-6efa-08d7d029edb5
X-MS-TrafficTypeDiagnostic: VI1PR05MB6704:
X-Microsoft-Antispam-PRVS: <VI1PR05MB6704203B477723424174D118CFF10@VI1PR05MB6704.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(316002)(478600001)(52116002)(81156014)(81166006)(86362001)(8936002)(8676002)(186003)(9746002)(9786002)(66476007)(66946007)(6916009)(2906002)(1076003)(2616005)(26005)(36756003)(4326008)(54906003)(5660300002)(33656002)(66556008)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6704;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FHW/1yi+XsPdUxNyhbFZ5ZxclamEymUaIq3QDf9D99gBiJW4Yr7wkGIyWO15QHTh/GeOXLw+zJw/rTecSkhaheVJmbNeZKl4XwP02ER+QddtO4Ac5wwjl6xwHnHytKMlgqchXkjUK/AaUMObp1+/ApJ2FoyVvwXwR3ZP8UfXizbqkQ1ahn2w0VntABur4dyJGxhHV/bQVb9QI2k07EAeeKJpXjvhWfIXxPnzVLfR9+nCu0+eaTzJKmrFYfXww1Mx6EtCfVLmS0UhOsvdl/B7JYVyYOV0XsPSYB0C0RmOKk8DJLCOVg1tgDOeCAwZQYhZjRyRS3h7q1IPpihh4hJgqBdYNPAt5z1kmirH/pPF23znL+nBCC2Avr/TdNZmpS5EIrGQwHeyNWViWyzG/kptuIQc2uM6ngSMVdUKXPWfa6Tjty2U0+MkYSYGROK2ltLuLMhmu7GjveapkQRcNB/QBHTZYobKyJk0lC+0HiLD5h4ryioq1Dod59RrJ4nbb4Pd
X-MS-Exchange-AntiSpam-MessageData: pm4p7Kb7fnZaR3MuULItgJLOeRPtZ1q8vAwYCTq9/eIxZhL37FKy/do1/HEh0R1zV/AbLgOkCy4kGOQTsrM18s4R3P/pDP2pmjzQQ6CznSbC6IPOaMbwuNl1jcE+rq4Qtq7cXNAJt6SkX3fLk+GBQg==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4066c1e0-4117-4a5b-6efa-08d7d029edb5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 19:31:19.9460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPlW7amp178ZP1Z5K/I/GVj7oEVoikSE8RExYFDQfE5RC3MPF2v7EPqeV09GH0Uh+9ulSIiImW1QsIldXDNTgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6704
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 08:33:39AM +0100, Christoph Hellwig wrote:
> >  
> > +/*
> > + * If the valid flag is masked off, and default_flags doesn't set valid, then
> > + * hmm_pte_need_fault() always returns 0.
> > + */
> > +static bool hmm_can_fault(struct hmm_range *range)
> > +{
> > +	return ((range->flags[HMM_PFN_VALID] & range->pfn_flags_mask) |
> > +		range->default_flags) &
> > +	       range->flags[HMM_PFN_VALID];
> > +}
> 
> So my idea behind the helper was to turn this into something readable :)

Well, it does help to give the expression a name :)

> E.g.
> 
> /*
>  * We only need to fault if either the default mask requires to fault all
>  * pages, or at least the mask allows for individual pages to be faulted.
>  */
> static bool hmm_can_fault(struct hmm_range *range)
> {
> 	return ((range->default_flags | range->pfn_flags_mask) &
> 		range->flags[HMM_PFN_VALID]);
> }

Okay, I find this as understandable and it is less cluttered. I think
the comment is good enough now.

Can we concur on this then:

 static unsigned int
 hmm_range_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
 		     const uint64_t *pfns, unsigned long npages,
 		     uint64_t cpu_flags)
 {
+	struct hmm_range *range = hmm_vma_walk->range;
 	unsigned int required_fault = 0;
 	unsigned long i;
 
-	if (hmm_vma_walk->flags & HMM_FAULT_SNAPSHOT)
+	/*
+	 * If the default flags do not request to fault pages, and the mask does
+	 * not allow for individual pages to be faulted, then
+	 * hmm_pte_need_fault() will always return 0.
+	 */
+	if (!((range->default_flags | range->pfn_flags_mask) &
+	      range->flags[HMM_PFN_VALID]))
 		return 0;

I think everything else is sorted now, so if yes I'll send this as v3.

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
