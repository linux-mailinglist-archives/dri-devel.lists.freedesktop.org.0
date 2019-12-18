Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE250125C6C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 09:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937196EACA;
	Thu, 19 Dec 2019 08:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50087.outbound.protection.outlook.com [40.107.5.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D5C6E4E8;
 Wed, 18 Dec 2019 14:59:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBhz6Xt/VwnL3LaV6C4ftnUv/Lo76F8bWxzl7vVKs3iNNEhOrMiBeiZVfaJTJwVamySrSxdyOVgvgMwaTeI/tuy13chTRWq7ZuAXqIaYqY4J414NlekkA6pNsrMP1uF4DXX97t1XXUoQB4XNOCy6LzyhdXhanekjv9C1vyn5eIXORn6ODwj6p/p2/Rxc34YPw0lTKZLnxOi5fIkhawyef7hLGTCCtdUeaNZqvQfefFpoMXkrwHj2kXx56vq4xGPrNIbDnNi1pe/0683/wTsjLzDH265o4d4OeZ87KoB2J9KyiHccH1yQyivt4UumoQa1GJFp54n2ZspyOTQnIvLMcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nQM+trVujHI3Qoc/dgMx+kQgATSWF4kZScyp+AAMWU=;
 b=OHqBzZ+mrohdkVNKDkHYLn07QcauNAfXhjIyx4wTRHEI7IfNW2oZQHRrWitOF+KNy6+U3tg06F1+OvfkgLk+t/q4GJiSA4DLoso0XxpcTv4GJLkbqEm/g3R71RF7EoyNAv3JOat5CXZc8zueRvOgeIfMqsd3iO8Pl7ZYGTs6U5AJT8tsGwPNu03d49gl91B1yleVbzdtJ/wBUHXlQszoHTwcrrj4MGAGo1Psx4/pnS7zFg5VXWJtP2eaHuJFo0hevgpNemwswHAkGge6nQDtoeoFir8rZuFmy1/ejqBUUq9eNib7n1KYgx35k3bQ2QAIe7DrOUgCkq86Fj67hOEzTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nQM+trVujHI3Qoc/dgMx+kQgATSWF4kZScyp+AAMWU=;
 b=fmlMWkkh5G4KHjVttSNopPJ00jsiNUkfJin3ufl+05LQgdc07Oq0p6DXq+MWMwUirGg9oq1h+prj8WvTzIoJp17lZ31If8dc/FujCXOWmF2/A5mzvwiczj/E2vozfkUOeEBiuewOIcRYMvpIDiI+nhEWsZPaR2sNho8tc7ItOEk=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB3471.eurprd05.prod.outlook.com (10.170.239.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.19; Wed, 18 Dec 2019 14:59:16 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b%6]) with mapi id 15.20.2559.012; Wed, 18 Dec 2019
 14:59:16 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, 
 David Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>
Subject: Re: [GIT PULL] Please pull hmm changes
Thread-Topic: [GIT PULL] Please pull hmm changes
Thread-Index: AQHVo9Dog/MtwM8aJU6I/7345tJKuKekCWkAgAAFfoCAA6/3AIAEBIsAgAnhkICAAlDwAIAIKeCA
Date: Wed, 18 Dec 2019 14:59:16 +0000
Message-ID: <20191218145913.GO16762@mellanox.com>
References: <20191125204248.GA2485@ziepe.ca>
 <CAHk-=wiqguF5NakpL4L9XCmmYr4wY0wk__+6+wHVReF2sVVZhA@mail.gmail.com>
 <CAHk-=wiQtTsZfgTwLYgfV8Gr_0JJiboZOzVUTAgJ2xTdf5bMiw@mail.gmail.com>
 <20191203024206.GC5795@mellanox.com> <20191205160324.GB5819@redhat.com>
 <20191211225703.GE3434@mellanox.com>
 <20191213101916.GD624164@phenom.ffwll.local>
In-Reply-To: <20191213101916.GD624164@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::36) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1a27aaff-284f-43c2-60f4-08d783cada23
x-ms-traffictypediagnostic: VI1PR05MB3471:
x-microsoft-antispam-prvs: <VI1PR05MB34718FC1BC216A7489BA16F0CF530@VI1PR05MB3471.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(199004)(189003)(1076003)(7416002)(81166006)(186003)(5660300002)(36756003)(8936002)(26005)(6506007)(2906002)(8676002)(6486002)(52116002)(33656002)(81156014)(86362001)(64756008)(66446008)(66556008)(110136005)(66946007)(66476007)(316002)(2616005)(6512007)(71200400001)(478600001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3471;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YFsKJi3o+DFtc1adYty2n8ozGQozHR6/e2CYa3A3ET4WBHrq3ofdX2qWppElBG9I5VEWG+nM4nsk+Shtap+lkqvdOm4mlXNv9fcty5qFV4abEiuxriIoDF+HVoXWR43obPelf3GLBbigEHh4BQv9czHO9DxNT1pDiD20kLCt4k85Q9ZQGYxQ6EoHBPJ9GTXJ5aT2UBkpih5yPEat3yaVk4eLCYPtUbnHBmG3GdnCCQmoxJMm2gZRCCAJSycJB+X5HDC72ps7PcMSMYD/H6zmC9m6VeJvBUXo/Ah0O49Vrr2AGinYTA7tkLAO8I264wkz4/SoFNzNUKLsHwYINbEJAWAstBJRFUGhP0vNt2E88l2izg4il0m8rSPLt8qrST2atrUPjNifCODyXWqirHkN3T/jva8GWotiF6Bh9KSvHRp2181+CS8VGjryCDCh0FSljjCBwldRhsKUetiUYQsVN/oh0vDZeisnYWsD5tcHC680BnFmVnC6HNQdnRDqsMQi
x-ms-exchange-transport-forked: True
Content-ID: <992CF74742407543825A7104C3898395@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a27aaff-284f-43c2-60f4-08d783cada23
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 14:59:16.8325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ujlj0Eul7WyBl6CVrl1kbsMBy6FDBXGRJFsC4dqgK6rD7TyFTQWnMpVYLAq8EIdqtcVEvx8g3SbHFT5VHqXbQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3471
X-Mailman-Approved-At: Thu, 19 Dec 2019 08:11:13 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 11:19:16AM +0100, Daniel Vetter wrote:
> On Wed, Dec 11, 2019 at 10:57:13PM +0000, Jason Gunthorpe wrote:
> > On Thu, Dec 05, 2019 at 11:03:24AM -0500, Jerome Glisse wrote:
> > 
> > > > struct mmu_notifier_mm (ie the mm->mmu_notifier_mm)
> > > >    -> mmn_mm
> > > > struct mm_struct 
> > > >    -> mm
> > > > struct mmu_notifier (ie the user subscription to the mm_struct)
> > > >    -> mn
> > > > struct mmu_interval_notifier (the other kind of user subscription)
> > > >    -> mni
> > > 
> > > What about "interval" the context should already tell people
> > > it is related to mmu notifier and thus a notifier. I would
> > > just remove the notifier suffix, this would match the below
> > > range.
> > 
> > Interval could be a good replacement for mni in the mm/mmu_notififer
> > file if we don't do the wholesale rename
> > 
> > > > I think it would be overall nicer with better names for the original
> > > > structs. Perhaps:
> > > > 
> > > >  mmn_* - MMU notifier prefix
> > > >  mmn_state <- struct mmu_notifier_mm
> > > >  mmn_subscription (mmn_sub) <- struct mmu_notifier
> > > >  mmn_range_subscription (mmn_range_sub) <- struct mmu_interval_notifier
> > > >  mmn_invalidate_desc <- struct mmu_notifier_range
> > > 
> > > This looks good.
> > 
> > Well, lets just bite the bullet then and switch it. Do you like
> > 'state'? I thought that was the weakest one
> 
> Since you're asking, here's my bikeshed. I kinda agree _state looks a bit
> strange for this, what about a _link suffix in the spirit of

Do you think calling it 'mmn_subscriptions' is clear?

Ie a struct mmn_subscriptions holds the lists of struct
mmn_subscription and struct mmn_range_subscription?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
