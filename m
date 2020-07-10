Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5569721E977
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9536E947;
	Tue, 14 Jul 2020 07:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130080.outbound.protection.outlook.com [40.107.13.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FCA6EC6A;
 Fri, 10 Jul 2020 14:23:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oh89sztPYZ+0BG8IiCrSx/Iq8Eq1nXjGauB9lnldukmNwIcGfPbMl0g7kyUx3/RjVWeB0RM79082aiB8BIR94sVisA//GlXuUjVQpugWjiowg0y83pTDETxbiWMH27hfgrdRr5YVZXW2/GbBl3/kC1U7jXa44gqTllkquySTHQIf2wG2PZ5Iiuh+R0FtZioF65hBc6RWZV57kLKVyI/LJRngrmHsAJ/WYYSYJTPUdBVlDTo6LnhXkye6yR+/cY1R69WJliN32VKkQtTUf/AIcHtDYrwYzFDTNOEhX0nQGMZ1o83S6TlYH1cMaVTQU1nSOHX3RLzBZui+0KW/5Fszcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFytuY/EUc+LqnEc77x9oWQqtc40rlGKmYy91akT1SY=;
 b=RXUrNj42ZJCGfeaPHENanBd7w1DS3gJOOq3LvGH9qSG7/RApCXPUAE3xJO6aDorpjPGp2AoITdEj1Ag0BJpZM0SIBNpguTJhJZVQUJ/TmkhLoOorxTh2aIk1yD3/LL4MGHqlqIGWm0LNGXWk5TTgpye4qt6CVevbcC/6CbQAmdQLEyx+OREtADeplyOwbLlIxf2UaHae6uURiu4WDLdTzRD9LhPOvJ4TD55elHJZwpV2LQXy/aYeHfkXg/5a5uxOe3jFBMvCRJRSdeFdBNY081WLkiIyDtbreXqVCMOIEC68fhcoCkLbIQcLeswTGeEbnQBh39sgKTyw1rKIkxWqlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFytuY/EUc+LqnEc77x9oWQqtc40rlGKmYy91akT1SY=;
 b=mA0M4MBUoBxBwLHtPVcGHxYa3oKbpbQyWnit3rpp0HRCCuQSOcNgwbtafymAFu01faQQ9VTIudxbJcZRy3ZTtt8MYpDJAUi5sMKcpeO3MUa+uJW3605hxAAWuSgL0n847kqNFzEfWBPukn0Uhwoh4V6q6MRkbP36BMAO0ZcHOHg=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=mellanox.com;
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (2603:10a6:803:44::15)
 by VI1PR05MB5583.eurprd05.prod.outlook.com (2603:10a6:803:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 10 Jul
 2020 14:23:51 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e%7]) with mapi id 15.20.3174.022; Fri, 10 Jul 2020
 14:23:51 +0000
Date: Fri, 10 Jul 2020 11:23:47 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 02/25] dma-fence: prime lockdep annotations
Message-ID: <20200710142347.GE23821@mellanox.com>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-3-daniel.vetter@ffwll.ch>
 <20200709080911.GP3278063@phenom.ffwll.local>
 <20200710124357.GB23821@mellanox.com>
 <5c163d74-4a28-1d74-be86-099b4729a2e0@amd.com>
 <20200710125453.GC23821@mellanox.com>
 <4f4a2cf7-f505-8494-1461-bd467870481e@amd.com>
 <20200710134826.GD23821@mellanox.com>
 <CAKMK7uGSUULTmL=bDXty6U4e37dzLHzu7wgUyOxo2CvR9KvXGg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAKMK7uGSUULTmL=bDXty6U4e37dzLHzu7wgUyOxo2CvR9KvXGg@mail.gmail.com>
X-ClientProxiedBy: BL1PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:208:257::35) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL1PR13CA0060.namprd13.prod.outlook.com (2603:10b6:208:257::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9 via Frontend
 Transport; Fri, 10 Jul 2020 14:23:51 +0000
Received: from jgg by mlx with local (Exim 4.93)	(envelope-from
 <jgg@mellanox.com>)	id 1jttwJ-008I6d-H5; Fri, 10 Jul 2020 11:23:47 -0300
X-Originating-IP: [156.34.48.30]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 765aa671-94f1-4fce-ce18-08d824dcde35
X-MS-TrafficTypeDiagnostic: VI1PR05MB5583:
X-Microsoft-Antispam-PRVS: <VI1PR05MB558313F48966B67B238810F0CF650@VI1PR05MB5583.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 046060344D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sJ3mBl5qubWb0h+JRWVh2IO4BddLMQv+Br478jHO0mdF+Gmj7sFN1+udP6Lb8Zqggj0yJZLqE2FGhKfGNdrRc6lbK6Vdu/Jkixz8onYhPqxxSRDD7VYlbF2Rasc2AMoZ5TcM6+LQ4MoXQ9+uKIOXBCb7chk1QBdTOSaPuajkI+FEWFE4PoaCGjogbXe2zQIdJImpdqbLzeq5QuBRpcI1DXW9Cm9DLTaz14gWccVdj3W3SanXwt8Zik5eJhxr9qKOupN3IILpho6HhWW/Wfh0VaQyqEVZeh7TYaPHu1EEJI3nhOiamGPfD+ZpiqHiwmhbJLJRLiwiRNQpyQrWpa+96Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR05MB4141.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(5660300002)(86362001)(36756003)(7416002)(26005)(6916009)(316002)(478600001)(83380400001)(2616005)(186003)(1076003)(2906002)(8936002)(426003)(4326008)(54906003)(66476007)(66946007)(66556008)(9746002)(8676002)(9786002)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: cppyrSEFdAgkQ1i7W9q/voX0DbtbyyOVjwrEIOo4B7uYYODS8hmJEImRWNNtUiiOZNbaGtDnkKXCJRabgq7Bp4V5pamVdLqGNBMZzoizlzvRIc4PSgtdlF+13VePfAl+oWKQk9qlVh9blVl6PeuQYddj/USevZucky7iGVoqrg2GZ5DN2jMpZhpOaAXMbPu2PunbQ5KcLnjeYp1oJ5ZFWvNgBeIsmktajZlGxvfjkOhMNcqpA0LNpCo5GIpwIT52tIiYKLwRLQ0phw422o6y72JoJWSAwKGLaxj+zVWRs9pmtw6lHvYZwCwaoBSM2OZQeoLsZ7j0uncXth5RBLfm+/2Bv3rmRL42O8pmdQQ2NsxdQPoCFIy/30Yb5MD2tdELN2LR1o4k3i7R1AdJsyZqLM5BvRmDpRJbdg3Nwu/FEhp378GOFB8T6hAOnKknTA8vl95ONAs2NyV2N0CubuBtYkdKjh39nFGqTwJCU9QwM2Q=
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765aa671-94f1-4fce-ce18-08d824dcde35
X-MS-Exchange-CrossTenant-AuthSource: VI1PR05MB4141.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 14:23:51.4197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwF71M+iqtNMffEf9NDildz9GQ391BR6YYfGlkhI/j0w0yOozGHG4f48p0kC5CNi1e2iLtFsRIITXUxwN0ma/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5583
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>, kernel test robot <lkp@intel.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 10, 2020 at 04:02:35PM +0200, Daniel Vetter wrote:

> > dma_fence only possibly makes some sense if you intend to expose the
> > completion outside a single driver.
> >
> > The prefered kernel design pattern for this is to connect things with
> > a function callback.
> >
> > So the actual use case of dma_fence is quite narrow and tightly linked
> > to DRM.
> >
> > I don't think we should spread this beyond DRM, I can't see a reason.
> 
> Yeah v4l has a legit reason to use dma_fence, android wants that
> there. 

'legit' in the sense the v4l is supposed to trigger stuff in DRM when
V4L DMA completes? I would still see that as part of DRM

Or is it building a parallel DRM like DMA completion graph?

> > Trying to improve performance of limited HW by using sketchy
> > techniques at the cost of general system stability should be a NAK.
>
> Well that's pretty much gpu drivers, all the horrors for a bit more speed :-)
> 
> On the text itself, should I upgrade to "must not" instead of "should
> not"? Or more needed?

Fundamentally having some unknowable graph of dependencies where parts
of the graph can be placed in critical regions like notifiers is a
complete maintenance nightmare.

I think building systems like this should be discouraged :\

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
