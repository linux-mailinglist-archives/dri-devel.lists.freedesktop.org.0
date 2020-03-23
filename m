Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFD0190715
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005816E43F;
	Tue, 24 Mar 2020 08:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4C86E394;
 Mon, 23 Mar 2020 17:44:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLDo65F41jzRRosNB9M+tAwu945PZJN3n8StiI4R78I10wqXc94RYoDZBQ/aZc36/9al5TRoWhoJmzCdhxQjodTPwkCBrEY2gcZHJb8u2B5QnBGlu5ueiARcdV5gLpwzhC0jJWof6dwNqzP1kAELs6cDno+42+orvmMGlp2Ao5pSf3nxrJveVNUBEloqSOayG98xPl9o9/jaPcSPmq5RGHEEKkV0H85V1jgamGagBnOpIgbPF02WzjsSn5oC9R/8FJcriaatpkdnF8oMuDdHu7ZpNsq5ZXaYKEQg7g75znyCHlRqHtdp49W7+D7NRpJtbtgKUiTh8vIe8OPeLwr8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAL8vzgYjFTghvLv+4uYrXBxDxq28m64SizePBNQAW8=;
 b=e2MtvVgJy8MCyEle3CoqACO9NdvzKE1jbLbZhPwf6NRCtP3+Gm0LWbrVIQVrvXsPqLXh3wiaB7X593jGVFZptUhYKZi/6bejew51/GipHcrmqnSQ4D5eclw5FEVW5wxxNgYvLtSWlAzVY8UMrxHrvSIss+HqDz/eC4k5+u3bwrrp8SDYomRQTGVp2/DC2Pg20xXucuBg2lYLnJnrjuEp8IteCr6L2mWQsDl2Dce8IFQ5BbZ55RIyhjr7nWyG4kPTnfbWyb5tNM7ds25jmePWMLzq0YhLmdm8wxH5f6vnTBXsMdJ8wIpHdRaGF+A2WBt2UQ5mxGY+0hFe76mRnvo55Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAL8vzgYjFTghvLv+4uYrXBxDxq28m64SizePBNQAW8=;
 b=t8NTd9RM/dyANqXCgEUTHFcXyCkM1h1LWjHrEXqgwdpRZ3BOMLBPPjTjHyyPddGlu3ZejY8eVX8NpKiKzYt+QTtmEGASRtm4+Zt/otE7iQtf3Qw4Lsl1SeOOspEHOhyVFAaovfEc9TVsqq7PMHLKPPuMC2w+JKncKRMfX/GUTjQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4895.eurprd05.prod.outlook.com (20.177.51.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Mon, 23 Mar 2020 17:44:27 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 17:44:27 +0000
Date: Mon, 23 Mar 2020 14:44:23 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH hmm 6/6] mm/hmm: use device_private_entry_to_pfn()
Message-ID: <20200323174423.GC13183@mellanox.com>
References: <20200320164905.21722-1-jgg@ziepe.ca>
 <20200320164905.21722-7-jgg@ziepe.ca>
 <20200321084347.GF28695@lst.de>
Content-Disposition: inline
In-Reply-To: <20200321084347.GF28695@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:208:23d::13) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR06CA0008.namprd06.prod.outlook.com (2603:10b6:208:23d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend
 Transport; Mon, 23 Mar 2020 17:44:27 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jGR7f-0007CQ-Na; Mon, 23 Mar 2020 14:44:23 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 40317a86-7202-4755-60a2-08d7cf51d516
X-MS-TrafficTypeDiagnostic: VI1PR05MB4895:
X-Microsoft-Antispam-PRVS: <VI1PR05MB489568BD58B4E6CB3FAE39C5CFF00@VI1PR05MB4895.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0351D213B3
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(199004)(52116002)(5660300002)(8936002)(2906002)(33656002)(81166006)(81156014)(8676002)(6916009)(4326008)(54906003)(316002)(86362001)(66946007)(66556008)(66476007)(478600001)(2616005)(26005)(186003)(36756003)(9786002)(9746002)(1076003)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4895;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sh5jcsRyK+ZyYKucTE1C2t8/esc+jJ1kCXwO2yrGhFTXYiRKmqA6xJOfX13faPISDJEFfDfUFLwr9XkufTLvnaTH2PpPcrkKGSkS2HGz4lykvpyq8TAIvZZR+wcbhm7FwNDoy0cMIEl2aHk18b9eswmwswl8E1tidGZNZy5EGxM3eLJi1FPoR5NWpVgztIpPF+RDRm/mHNW62OCC7RCCG8uapb0cIn7Ix4KVaRToX3GkH/krOrAaVqWUmpOk5Cq8ebEGIyOy1rua+mrbz8R/7fSh++wedl0sODwCkBP2vEtijRJiHo94ZP3CFIhQGgHKIcPHDhJm6WEvyzeGRpbHtL3DPwGf4zMG9xcbzPVp8pYf7Eb9IpEnSa6KzkDllILEJeCCj6mU3s/lqNfEtGLYmG6/Alai2S2WwXaHJIm/sREFFgk7l5Ox6PMi2fLqKHZlrH84YOFMtIBOnCGXGyTJ/Hsg1FdM8/b31zp5xtMLElNGfqEuY93RYKXip8Oa2ltx
X-MS-Exchange-AntiSpam-MessageData: j5BfDv0oYef3dHodcP9nBaRpJKCpAwkXsX1YEH5YWYWMQG354js7NAecAuvU50oAfIATTaRUfJDTR0OUSLrnmjjlU33mF0YEgntGo69fWm96ihGtNQbXVT2Txncki/5t9001Bwm5/lFRSUznwz8y8g==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40317a86-7202-4755-60a2-08d7cf51d516
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 17:44:27.1688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcR1hhe787yDKWV+X2ZjghNtvCMY6/jyA8v/391/1DzNh7lvqTmBk3zA6G/fKkXu+23m+xUFcp9SYYB81a8SMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4895
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

On Sat, Mar 21, 2020 at 09:43:47AM +0100, Christoph Hellwig wrote:
> On Fri, Mar 20, 2020 at 01:49:05PM -0300, Jason Gunthorpe wrote:
> > From: Jason Gunthorpe <jgg@mellanox.com>
> > 
> > swp_offset() should not be called directly, the wrappers are supposed to
> > abstract away the encoding of the device_private specific information in
> > the swap entry.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> >  mm/hmm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/hmm.c b/mm/hmm.c
> > index a09b4908e9c81a..fd9ee2b5fd9989 100644
> > +++ b/mm/hmm.c
> > @@ -259,8 +259,8 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
> >  		 * the PFN even if not present.
> >  		 */
> >  		if (hmm_is_device_private_entry(range, entry)) {
> > -			*pfn = hmm_device_entry_from_pfn(range,
> > -					    swp_offset(entry));
> > +			*pfn = hmm_device_entry_from_pfn(
> > +				range, device_private_entry_to_pfn(entry));
> 
> The range parameter can stay on the first line..

Done. Makes the diff smaller.

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
