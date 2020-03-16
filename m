Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF148188744
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E9F6E19A;
	Tue, 17 Mar 2020 14:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60068.outbound.protection.outlook.com [40.107.6.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B248984D;
 Mon, 16 Mar 2020 13:05:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qb+aCbBsF3noGxMg+0AiUP5/DZBoi3+4Lej/NP+ptkC1lRooD4IZTP8n6yBbD/DtaEKZlBg2iaLzSTONiYq8ggQTwNzGGeWWfQy5gKO6HdpwFGfCDOrjhlSJqzPsSTj38bZCrNz0IrSjbzgA2Z0cbrUFAXzOxoq86g2iunDkNpukptKFiDRTxBJUNVMk5sgn5NveWAFlmeML/ggndik3MAH95OSL8mdQXGZDBp8TXfG9U7q5PQsjDVC0m1ge9diQ5psG7qFSu2csLp6k3OM4MmoKrCo0iCs6awOCu1cO0VcshFraT3bOiAHLW40wvXhSn0xp4T4cYOgFGB7nQ3F2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eYsF13PdoIRvaRNSLntSI5ZrUd2ZwRFtsoz+Z4H+Ls=;
 b=fLm9Zklr3xqsVO+sTTXESSkFmL3xQlaHt1/JOut/dwCxnMTtSr9etHgPcHcxDc17h96H3I2yVRxl6tEXqF3XEi6xqx+vlJvEXVoqFiQqW207hsOCzyBI7Zgg3k4kos1Ppbb0kij6m0Pl+JDBYeEqD4PYIBgPEDJgTmLoVzEM2USL6/FOA9T01aHvjwIlUznz/07TnM2B55AFWw30XL8adh7zF6O7ZHKKjkl5FQ6NJGcE3i4e2oIc4jx2g8nvA1arxXFRVGpW+fmJ0SneBKrNZ20nnpWPkyW0GJXAszOKCpdR8Qja+GOkGCbgarr1QhSpHNH/NgO4nQn2NXsv7h7xLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eYsF13PdoIRvaRNSLntSI5ZrUd2ZwRFtsoz+Z4H+Ls=;
 b=dujrcI1DF4tJO2qCpbHO1I7fzEhDsdmw1rpl0POZQzLRtIyfOFi/X392LoxVTDEuMHmM9HJFKTCrYcvPvlrOZQA4NnP1Je8ZPkoaDjVEyVKm8oE5xhpvJgYJzu1J67xKqO0l0OQorkoNWHSmfcNNikMYg0Rwbm0M9eZ/IBd4yFE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6749.eurprd05.prod.outlook.com (10.186.160.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.16; Mon, 16 Mar 2020 13:05:08 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 13:05:08 +0000
Date: Mon, 16 Mar 2020 10:04:58 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH  hmm 8/8] mm/hmm: add missing call to hmm_pte_need_fault
 in HMM_PFN_SPECIAL handling
Message-ID: <20200316130458.GQ13183@mellanox.com>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-9-jgg@ziepe.ca>
 <20200316091347.GH12439@lst.de>
 <20200316121053.GP13183@mellanox.com>
 <20200316124953.GC17386@lst.de>
Content-Disposition: inline
In-Reply-To: <20200316124953.GC17386@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: BN6PR22CA0046.namprd22.prod.outlook.com
 (2603:10b6:404:37::32) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 BN6PR22CA0046.namprd22.prod.outlook.com (2603:10b6:404:37::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.21 via Frontend Transport; Mon, 16 Mar 2020 13:05:08 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jDpQQ-00044P-Rc; Mon, 16 Mar 2020 10:04:58 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a6c2b34d-2cba-45ff-2dc0-08d7c9aaa744
X-MS-TrafficTypeDiagnostic: VI1PR05MB6749:
X-Microsoft-Antispam-PRVS: <VI1PR05MB674928CA7C4AD3E2A633F08ECFF90@VI1PR05MB6749.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 03449D5DD1
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(199004)(36756003)(4326008)(6916009)(2616005)(2906002)(478600001)(66556008)(66946007)(86362001)(1076003)(8936002)(66476007)(33656002)(81166006)(81156014)(8676002)(186003)(54906003)(5660300002)(9786002)(9746002)(316002)(52116002)(26005)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6749;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yq8UPucrzhblnvoJmOYMp0CAzTpo9gMYD3PQnuAP72Porltm1afWa7euErxT70s8/RMNoJDo7+InSNvZkZZUvAKJ3IHOK+jNTsv1hM4iEmZ6hqAyZOqXoCa7L8YkEGB1A1BpdSw3/K3RMh1Ax7eM34DaJAV1XLPb2phli+k38+8la0FXkM2Wgj+k9H4C3jFVzvymnh4FoWLR9HtqHAz+eW7Rnxf8hnC8IKz5Rj8LR8fnjWVx+O9hWSweLNS9HLr63kE73P88RVfwrVrao85sQp0MkmrzKKng0ClcGza9xPhXmdGKvKXHZRHyWMLzLIcxgsNjfrbeL7baFtwEjGw6/gEfSMELNvmd2pOWZUBr4ZX8CJ6qsbLD3iDq6tWwLXKgaNG8gqKTJG4mvlXPZw3Z4BciU0wEj9V263z4Yw6Md4ZHV3Bxjuf9NfZxI2Q133/BFiGXNBzCrCcKdY6okGw5lhnnF0qxdwKc9pLPvymYaaNylGR7rTyN1Pq6GWHK/9pu
X-MS-Exchange-AntiSpam-MessageData: lIkI74VLKIVeF5CDvMiXdYivb3zSAEC/EE85UtQ9BkIfenub+1J/NWhhYr9vX4JxK2oOU/a22nCWHuSKrvaPH0Am2ZyzG4l2g1d9dxfz3TIMpnwEyWORHBd8h6x3E+4ktefsMsZYGvlDHretbZE0mg==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c2b34d-2cba-45ff-2dc0-08d7c9aaa744
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2020 13:05:08.5440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFMi01na6c9sYY8KPAOqmghZp2dH4RptRXmcR8LttbXt6ZeEdI2zML4WdvVEovzub+TsBoTxH4dPCo5H7TarsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6749
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

On Mon, Mar 16, 2020 at 01:49:53PM +0100, Christoph Hellwig wrote:
> On Mon, Mar 16, 2020 at 09:10:53AM -0300, Jason Gunthorpe wrote:
> > On Mon, Mar 16, 2020 at 10:13:47AM +0100, Christoph Hellwig wrote:
> > > On Wed, Mar 11, 2020 at 03:35:06PM -0300, Jason Gunthorpe wrote:
> > > > From: Jason Gunthorpe <jgg@mellanox.com>
> > > > 
> > > > Currently if a special PTE is encountered hmm_range_fault() immediately
> > > > returns EFAULT and sets the HMM_PFN_SPECIAL error output (which nothing
> > > > uses).
> > > > 
> > > > EFAULT should only be returned after testing with hmm_pte_need_fault().
> > > > 
> > > > Also pte_devmap() and pte_special() are exclusive, and there is no need to
> > > > check IS_ENABLED, pte_special() is stubbed out to return false on
> > > > unsupported architectures.
> > > 
> > > I think the right fix is to just kill HMM_PFN_SPECIAL and treat any
> > > fault on special ptes that aren't the zero page as an error.
> >  
> > I have another series that is doing that - this change is to make the
> > next series make sense and not introduce new control logic too.
> 
> Ok.  I had some cleanups like this based of older trees, but if you are
> active in this area I think I'll let you handle it.

You once said you wanted to loose the weird pfn flags scheme, so
before putting hmm_range_fault in ODP I planned to do that.

If you have your series someplace send me a URL and I'll look on it

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
