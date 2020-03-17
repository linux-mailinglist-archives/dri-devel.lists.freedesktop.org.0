Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91741188741
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1276E5A5;
	Tue, 17 Mar 2020 14:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1726E125;
 Tue, 17 Mar 2020 13:25:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUC6xoMM1ndxvGbGN8z63fsj7li9Y8OjDdGEm7Emjntnymy0bCZRghgYKFuQTLv4V5VqN7YWvepvyhrUdd29GnVzqKYvQkYwIFitGiM6b9sqYB+8xKSNounKCsYQMP2+67SUtDT1VCqVqB4XCRQJ84DbTbT2/CQ5nzOj0oU7mEgVIjrN52tTPter3SLXYCHGOpm4DJgzLb5BIWF9ZsogvPlF8yGLNwW6Hm6CGtBvUjZ0XdZcEqHn2R3cFmLMwf73+Z1V0S28nn5ydh1AU168fadBzgajiDorg5AkvF/xQWtsiwZ85z+SGVO1to7HSgHijBcMrd1ik13xLmY0Wdg70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgAK07UbKfkl5GvA3E15Zn429WNYrSc4RKC3xsLWHl0=;
 b=fAuq3uRHfWKNacDpseDJDBpmJqjThukQbbLd04GF105fuCTi1bavlx3oQgCdfzrlvJFaS2w1udejsYs/UW3BaeBvI8lFW9h7MOp1C+cpHEL6nazws4QeWT2qf4XQVKMemeP/9GXel8HOf3bjm6Gkcvh0TwOAlcM9JNYr8tukM0TiJNdJkm5muMaMPnTvgc8OpkOptzs1m7zcSgTaytda6xYdnxh2OZn5jA9/8dSxjoGe0dbRm3aiiinp++1d/ElR8PIsgk7dXD2dswP5ly0E7XpCBMyWBOTxu1vIFBVzpK9suiNYnvb9XyDCGcRL55zMhj0z2QygcNnSw/2eDn8OKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgAK07UbKfkl5GvA3E15Zn429WNYrSc4RKC3xsLWHl0=;
 b=YOUTBxrUTtBSWVOMYb3s1PmfAQBl4BJORgcaXQuZDfDW57Fb6a5gJOOJa5wpJJqYuRAyHo7egvCIaFrzm2gdwMMsZzw3hs/1jUYNXH0yFMCsV5MuisniAJ5owpRLVqIA62FU1gfTOvlDsOKKT5w3jAt6rVMhksahmPAu4GA1ZQQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4878.eurprd05.prod.outlook.com (20.177.50.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.23; Tue, 17 Mar 2020 13:25:04 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 13:25:04 +0000
Date: Tue, 17 Mar 2020 10:25:00 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH  hmm 8/8] mm/hmm: add missing call to hmm_pte_need_fault
 in HMM_PFN_SPECIAL handling
Message-ID: <20200317132500.GU13183@mellanox.com>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-9-jgg@ziepe.ca>
 <20200316091347.GH12439@lst.de>
 <20200316121053.GP13183@mellanox.com>
 <20200316124953.GC17386@lst.de>
 <20200316130458.GQ13183@mellanox.com>
 <20200316131201.GA17955@lst.de> <20200317123210.GA12058@lst.de>
 <20200317125317.GT13183@mellanox.com>
 <20200317130608.GA13030@lst.de>
Content-Disposition: inline
In-Reply-To: <20200317130608.GA13030@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR19CA0067.namprd19.prod.outlook.com
 (2603:10b6:208:19b::44) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR19CA0067.namprd19.prod.outlook.com (2603:10b6:208:19b::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.18 via Frontend
 Transport; Tue, 17 Mar 2020 13:25:03 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jECDM-00027D-GL; Tue, 17 Mar 2020 10:25:00 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a25e1b18-2f1f-4693-c5a2-08d7ca769a40
X-MS-TrafficTypeDiagnostic: VI1PR05MB4878:
X-Microsoft-Antispam-PRVS: <VI1PR05MB48789AD2C48B99AC31033DA9CFF60@VI1PR05MB4878.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0345CFD558
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(199004)(186003)(2906002)(26005)(2616005)(6916009)(33656002)(478600001)(52116002)(316002)(81166006)(81156014)(54906003)(8936002)(1076003)(4326008)(8676002)(9786002)(86362001)(66946007)(5660300002)(36756003)(66476007)(66556008)(9746002)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4878;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +rX2EJYIUIhli5G/9qwsu6GEsqrlC68EGHg1n1hJhGkLjp3U4XA9KtPKHEYdooaHJ1DpLbJl0PbxMAEpjmJX830Zv6qAZuMkljhSfDBJYc2uUY13pA10w6jlOiSKEcbjfqKX7Uiv4Sxnvb/+n46MGAA8iQHBqZOMnHCRlvZEemV6OoKNVSE8hfCkvFQacp5D/MXNGCf2QVPrujsIYT0+QVLqRlpYOeCqnl0/toYeN5InEcfh+7whU4QSkPquUbz6c/G/awBcaO/1zgWncSNAEeNCkLhzImXjNurSjSqUhZ6XMfxat8p7H6b6Cy92R0uFspx8bWHpjToctewM1aJZv7/sCeMbkH/UfqQ745I2EG+P8KjpaeOzsh6keG6qHJxD2rPalCcTtMNi2C7RaY1u2447M3kGlUjtAukaoekdpZ5gQFjtWADm2IKAyXLKfu/2KSMTg1LyRCwPERN39DbkT0pRkrpXBIcKdOJzblueZjmNeR+LhC6+ra/KRprckStA
X-MS-Exchange-AntiSpam-MessageData: v9ugFotL8knCGwSJeRJiI1w+sDAUbrfLl88VU449HR5++HQUO7KaACAZGkemTVCItmNtq0RLz9ENLoN3zd2tW7T508xuG+5q6WRHQ4QwrwffcULNY01+p7mCpNoA+4N07GDPyNCmkjjEFdyn451xAw==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a25e1b18-2f1f-4693-c5a2-08d7ca769a40
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 13:25:04.1241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTqtbVGox4Qxt260w57PNba8PTcajDjTY0zLGAxfUNPAez+PDJOemuxN5W2HzG4g/G60paTRskuW+ASL9jHq9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4878
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

On Tue, Mar 17, 2020 at 02:06:08PM +0100, Christoph Hellwig wrote:
> On Tue, Mar 17, 2020 at 09:53:17AM -0300, Jason Gunthorpe wrote:
> > > Thinking out loud a bit more:
> > > 
> > >  - do we really need HMM_PFN_ERROR, or is just a return value from
> > >    hmm_range_fault enough?
> > 
> > I'm not totally clear on this. The only use for ERROR is to signal to a
> > non-faulting hmm_range_fault (ie shapshot) that the page should generate a 
> > device fault (ie device SIGSEGV).
> > 
> > We can also handle ERROR by having the device take the fault to CPU,
> > then fail during a faulting hmm_range_fault and then dropping the
> > ERROR indication toward the device.
> > 
> > If we already know the page cannot be faulted when we read it it feels
> > natural to return that too.
> 
> True.  Of course we could just stick an ERR_PTR into the page array
> in this case.

If we make the output here struct page *[] then there is also no
reason for hmm_range_fault to exist, get_user_pages already works like
that.

I see nearly the entire point of hmm_range_fault as being able to
return the flags..

> > >  - because if it is we don't need output flags at all, and the output
> > >    array could be struct pages, which would make for a much easier
> > >    to use API
> > 
> > valid and write is required for the non-faulting case, I don't
> > think flags can go away.
> 
> Do we have any cases where these aren't simply kept from the input array?
> I couldn't find any, but I've not understood some of the subtle details
> before.

Not today, I think

All this stuff becomes interesting when we have a non-faulting caller
of hmm_range_fault(). Then the input request flags will all be 0 and
the output flags will indicate the current state of the page table.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
