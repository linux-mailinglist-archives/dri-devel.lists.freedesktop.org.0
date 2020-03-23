Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169F6190721
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:10:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745186E44C;
	Tue, 24 Mar 2020 08:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80078.outbound.protection.outlook.com [40.107.8.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13456E3BC;
 Mon, 23 Mar 2020 20:14:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRRcR0qnyabsugG03Csq/rKbKM1vPKLCPb2rJy6i+Mh/nTxBiBGKZ4fxTFx3tlOZ4693gLKcdX3I6k899XjAGZ1V27chA1CzfgW37bqXCAlKLI7zpK6gTzZqUndzTNkMjUKLZ7gYqdgrlJA4mwIRntavyUhbfRUjzYwup9bfMg364XZFTrS05Dma4MmE9Q02C9uUWVyAPdVdjYQA4/R90govo/AZEXAFko4teJChwQFNQ+MapWK1DaT6qjA3vZsAMkBz2/dNsiXh4Z2ECZtEolfZmXg6eV0ztIC4ljeAxvK6+s5bibrRdOTwvnpI2UwqAkP0RM1hV99p93lBF8tQ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBCBKlQAC1LfGnl/5QQhWp3Zp6o5nL24pGBXMSiXA90=;
 b=ZcA+kn8hfQv8h6AGbw/bfPpCFD6O0/j7TAMeWPHIWCSxmKkAzrk+ZBTU8LIU5vd5nFiWt9nJk7NclS87X/1Z+Op1W6/piQQ7iPSLHrAENF7Tkhb4jcHE4ABmFLAXveTvr2DuSyrfa15tFJPewWrwcleaXjd+v/lzp2GhjpqvL5rpBkx+yJ7FRsL3OTrqumHD2H5yV2dcBQPU588KCGF9EifL/aBUDyChOiKpIGE6DcapQCdNUlXTDWKsYvwq9dxrgG0KMn2Nhoe122XZ7vZ9xv2/r/u6hbUzr30C18H0r8xlWddiC7f0m3Q+mcGPR3KRnig1nZfJJWMEONK4lNeVew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBCBKlQAC1LfGnl/5QQhWp3Zp6o5nL24pGBXMSiXA90=;
 b=ZFN815ahwIbCna8+z8gooD7U0RQn/8VTeng/81TR5duzGC/ZPxlvUd7EAPlYHrNZYhebxhg0X8mgUcebK46Np9KZVPf+zdpKa3xlDpr4L1tLfjBpvsviDZnMCn05aVRjOhn3YoaFMMOmIlt1YIT/CgcpRWyD4QMCsaSiz+qBE5A=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6621.eurprd05.prod.outlook.com (20.178.204.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20; Mon, 23 Mar 2020 20:14:10 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 20:14:10 +0000
Date: Mon, 23 Mar 2020 17:14:06 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH hmm 2/6] mm/hmm: return the fault type from
 hmm_pte_need_fault()
Message-ID: <20200323201406.GD13183@mellanox.com>
References: <20200320164905.21722-1-jgg@ziepe.ca>
 <20200320164905.21722-3-jgg@ziepe.ca>
 <20200321083726.GB28695@lst.de>
Content-Disposition: inline
In-Reply-To: <20200321083726.GB28695@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: BL0PR02CA0089.namprd02.prod.outlook.com
 (2603:10b6:208:51::30) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 BL0PR02CA0089.namprd02.prod.outlook.com (2603:10b6:208:51::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.21 via Frontend Transport; Mon, 23 Mar 2020 20:14:09 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jGTSY-00043s-A3; Mon, 23 Mar 2020 17:14:06 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a3355535-e944-4827-5166-08d7cf66bf35
X-MS-TrafficTypeDiagnostic: VI1PR05MB6621:
X-Microsoft-Antispam-PRVS: <VI1PR05MB6621207845ECB129FCC70A24CFF00@VI1PR05MB6621.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0351D213B3
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(199004)(8936002)(54906003)(316002)(2906002)(86362001)(4326008)(186003)(1076003)(81166006)(81156014)(52116002)(478600001)(6916009)(26005)(9786002)(9746002)(2616005)(8676002)(36756003)(66946007)(66476007)(66556008)(33656002)(5660300002)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6621;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YrMwgbQJMUbKOm2rxW7HnTzQ8vYoypN8c5JKzccddi9qim8FJa5N8TikCL4aeT5soGhwf9xP+EiTxwHw8EkbdFY0OBPhYayG1CQGhCn1YcL+icN2zaW/69Hfv37tnnSBUBq3AsNTzyft9n9kKeFGGAEdEFW2rHW7LSUHuO/buYyvVUD3Hu+k3u/v18KoE2eGiMyK8/nZ4gVd8MlFr+wAIo1pp/jGzCQkRFbeQbeFasjT41TplXlzQ2i65pHupaQHCyPI2VjKGxAu4o3+o5bsjO+vkUhP43MR24YvIIncJtgBUJFD+OMm6eEn973jainpoFyqlA7Ncr62RPyqhAkJETPTPwLbh8eOLTgmNmK+c/UBMsxDItD0izr6KJglEDt8KjeUkKOizryT8A1Sqa4cSI3akb0y6+B0btFn8iPttL3wVYZf5iz1FAYUgafFhDe7K/n87OZiwbB72PZuYgrsGWKM9NH+slTQF47kLtunRCFoTfbaZmiFQZNaZc3NfyrQ
X-MS-Exchange-AntiSpam-MessageData: eS6MGiloJTROtvr252fRa/YSjm3FJcnI18o3LBdCJc1U2wvWDLG0sDRtwyPyuJkCt0K0LJcpPnGsu6HETOLiMjawRkcaNdTFpAS1litpv7nORF5qAv9sw0vl9dOfin0hg780KpDAAo4g1VOugSYKkA==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3355535-e944-4827-5166-08d7cf66bf35
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 20:14:09.9809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVmrwTRgkjAl56bos1f87Z0rHvCFS88quMHJAECnUe5y/ETCPMVOgED9MeTuyOedPLyzdCu8rEZTXpQ+AvyEzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6621
X-Mailman-Approved-At: Tue, 24 Mar 2020 08:09:16 +0000
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

On Sat, Mar 21, 2020 at 09:37:26AM +0100, Christoph Hellwig wrote:
> On Fri, Mar 20, 2020 at 01:49:01PM -0300, Jason Gunthorpe wrote:
> > +enum {
> > +	NEED_FAULT = 1 << 0,
> > +	NEED_WRITE_FAULT = 1 << 1,
> > +};
> 
> Maybe add a HMM_ prefix?

Yes, OK, the existing names are pretty generic
 
> >  	for (i = 0; i < npages; ++i) {
> > +		required_fault |=
> > +			hmm_pte_need_fault(hmm_vma_walk, pfns[i], cpu_flags);
> > +		if (required_fault == (NEED_FAULT | NEED_WRITE_FAULT))
> > +			return required_fault;
> 
> No need for the inner braces.

Techincally yes, but gcc demands them:

mm/hmm.c:146:22: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
   if (required_fault == NEED_FAULT | NEED_WRITE_FAULT)
       ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~

Probably because | vs || is a common confusion?

Actually this whole NEED_FAULT | WRITE_FAULT thing is silly, I'm going
to define NEED_WRITE_FAULT == NEED_FAULT | (1<<1) and add a
NEED_ALL_BITS to make this clear what this test is for (early loop
exit once there is no possible change to required_fault).

> > @@ -532,17 +515,15 @@ static int hmm_vma_walk_test(unsigned long start, unsigned long end,
> >  	 */
> >  	if ((vma->vm_flags & (VM_IO | VM_PFNMAP | VM_MIXEDMAP)) ||
> >  	    !(vma->vm_flags & VM_READ)) {
> > -		bool fault, write_fault;
> > -
> 
> No that there is no need for local variables I'd invert the test and
> return early:

This is more readable, I reworked the comment too

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
