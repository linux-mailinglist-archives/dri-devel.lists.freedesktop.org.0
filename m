Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4345188739
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DD96E170;
	Tue, 17 Mar 2020 14:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40047.outbound.protection.outlook.com [40.107.4.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B596E40B;
 Mon, 16 Mar 2020 12:10:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgAxFjC189JT204FG4c39K0OyuAHhb/2Tviwaeh49Ssw/eP9uQ8UhdITjr3euntU74GFTvaTqJe253xgsHZDR2PTuWrMuhcC7pVQoqy1cYl9Sy7qgvygXdl7mARUFT+1rVhDEox35Vr4wv+Sxp4uafTpkW+sEM0AJTitFaJGkl4vLwm3MHiC68s1HdJWrJ3gOpS1207jxH7LSmjhHAvM+igopDTpCXjAh4XUTKkEf9SSeBPcPMNEbQU3/YF71KhYHThKabJcbnOeFb0Qvjxd9csqWi/1pBPZiqJ8E1bsM3EfUSPyuC8xWT7Xu18/NBxVRvB+3+zjAzLAU+MIBOFBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEGm9xpmWlZjTUrbcpnqPqZzNgAyx3iwzRQ8hYSfU5o=;
 b=epMzz+wUaMnO295jlGkdmJOh1dLcMmtLMHcIoUOChFdvsiiCJtOkGcbAndt6shY6DMm9mT+tC4cAEgRSA3qYYVfG1SpLUQTsF0Ky/5tFCRvQgb9bUEbR4AOmbpftM6Ljo9vUeI0l6wVo6klOx82OmelfjkzD3hfXJR82tnAB5TUx0Px6soAqdQOxSJoNMMsMvTDhO0wOL/JzCK4qg3lhNxtLX8FXHNjcm34J09yZIZj0BpmGk3JS9aJS9dFbfLKNPYDH20nVGMVqVjmBvS9eMJW9pT2fbSeoz8LHoZ+wpB3D/rm62XZii3gofGRqSXjI6RhrNYK72x00C2/6HWE91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEGm9xpmWlZjTUrbcpnqPqZzNgAyx3iwzRQ8hYSfU5o=;
 b=N7Qzf6lfGq9hUMVOLPDxtlSPg9HkdKydPoDfOZEQnUpZcRbEDjfoWzfvcb/OxlGsK8dYG+fxdQ2biKoeBVMclHeG/MN27qmLNA8K/+Z3Koocc04er+FEtwthr+RsZ+Hbbt3fad34kv6PQnj2/cqDJDQvp9gg0SQb4M8ZLi1r3d4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6832.eurprd05.prod.outlook.com (10.186.162.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.18; Mon, 16 Mar 2020 12:10:57 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 12:10:57 +0000
Date: Mon, 16 Mar 2020 09:10:53 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH  hmm 8/8] mm/hmm: add missing call to hmm_pte_need_fault
 in HMM_PFN_SPECIAL handling
Message-ID: <20200316121053.GP13183@mellanox.com>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-9-jgg@ziepe.ca>
 <20200316091347.GH12439@lst.de>
Content-Disposition: inline
In-Reply-To: <20200316091347.GH12439@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:208:23a::13) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR03CA0008.namprd03.prod.outlook.com (2603:10b6:208:23a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.18 via Frontend
 Transport; Mon, 16 Mar 2020 12:10:56 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jDoa5-0003GT-7Z; Mon, 16 Mar 2020 09:10:53 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7a64ac4e-ec7e-425c-5948-08d7c9a3150b
X-MS-TrafficTypeDiagnostic: VI1PR05MB6832:
X-Microsoft-Antispam-PRVS: <VI1PR05MB6832FDFDE71978FC40798BA0CFF90@VI1PR05MB6832.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 03449D5DD1
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(199004)(26005)(478600001)(86362001)(2906002)(1076003)(52116002)(4326008)(9746002)(9786002)(2616005)(6916009)(81166006)(81156014)(8676002)(186003)(5660300002)(36756003)(54906003)(316002)(8936002)(66556008)(66946007)(66476007)(33656002)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6832;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ty/widVq5bdhK0XNNgONW9DTCCXLLMlu4iXPRVJDP36+bYthywVvd3FCrBez/KC0eigseSXUBlMtwZ5JT0iLn3F1LMZPrFTalE+y02PwK0O1voboUWitBW/EyClpo5V3VQ+Hh2briKNyXW2vwFB8duqgIj5XHB9TKGrCS2U1Q+8PbyU/d/uYjwSsxSpU4s4Zr32xjApDIEexgzV8jhAXRcf1QvkCY8rLj2mabDTu+wntUCtiQsK/Lfp1om8zdjLhlsafNsKUP88lfXuzt8X7+csa7pc50QIBMbRkk2whYCf2qX5tcqs0AKnkqDqesVUyzj3wzvNzIuZJklcnTliK9aym8oEzHsjDHGgM4VjZtKSoSek79YthfueRiZ+7ESU4wYKEaJ27U7VBZw4qvajKk4DRlMDoM/u6M1dy8Y7Z8Y76tV7KGwVc/RFbNciSmxHDpYcBP/WdwTOK+y1XjUG9578eELP+C48iTqaHd43YE9QvGymXHPvricnRiJLltEh5
X-MS-Exchange-AntiSpam-MessageData: sPR9tINNihZBVS7xRndJEGWeye4Q9lkCUs/YKZCDk83PgD8ykAEsksk/bpfV42zpfKQ3X2KixemFJrYJd9833bNlfAx0L3FOBI0Lr5euriD9vp7v36vhJOHzcyvQ9/iOE7y13/CBtj5FpeNbie/AJg==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a64ac4e-ec7e-425c-5948-08d7c9a3150b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2020 12:10:56.9180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFPDpIoc/ejUF5ktrOgySYFV1MeFSIENdXj6Faf8FoaazpAUrBRW4qCuUahbJeRDFxZM65JANikBCvaNdu5W/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6832
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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

On Mon, Mar 16, 2020 at 10:13:47AM +0100, Christoph Hellwig wrote:
> On Wed, Mar 11, 2020 at 03:35:06PM -0300, Jason Gunthorpe wrote:
> > From: Jason Gunthorpe <jgg@mellanox.com>
> > 
> > Currently if a special PTE is encountered hmm_range_fault() immediately
> > returns EFAULT and sets the HMM_PFN_SPECIAL error output (which nothing
> > uses).
> > 
> > EFAULT should only be returned after testing with hmm_pte_need_fault().
> > 
> > Also pte_devmap() and pte_special() are exclusive, and there is no need to
> > check IS_ENABLED, pte_special() is stubbed out to return false on
> > unsupported architectures.
> 
> I think the right fix is to just kill HMM_PFN_SPECIAL and treat any
> fault on special ptes that aren't the zero page as an error.
 
I have another series that is doing that - this change is to make the
next series make sense and not introduce new control logic too.

Even when this is switched to ERROR it still needs to have the
hmm_range_fault() logic this patch introduces.

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
