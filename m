Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2F73A8D23
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 02:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5856A89AEB;
	Wed, 16 Jun 2021 00:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0A089AEB;
 Wed, 16 Jun 2021 00:00:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuLXcz8+npcjcbWS+GeWbSrYOY+ag9EaulGDKEu/YAL5dQ82SP71krYX8pwnH8prZawenTW/IDoLfgfG7yv4IJ/JQJQj37Sr8WfGMJO2oL+OlJ44PrDw8JnBfLeEtiLJx7qNnjTqqXxbQrwv4KbVfdMaVxpQ2njC7RVheV++EuW+7osgBCW9f/hY1OnoleDT05805TD98Vg9KQ4KdLQZHDlP9EopZMmMObC1BLus7s4NK1ZPGJFOzdomdMwMLa3oq+aVjWSwq6A7ax3C0bkkuqDb2BIpMItkiGI7ELcb8KwAft+bjwZ+P92du0DvY6yEb4FhohN9VeMNfNVjK7BHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8Z3u74twelsj7KCgRQezv/CYY+h5TU0Jo5d6XW2ZPw=;
 b=IF5U/gpXeiXBBBPlx6ar6IPFy5Fpza4OG5aEyAlX4wq37XCpElqwjCvC26ACchTkr2Aiy0/5Fp08uJZwuJSdUy1jCf0qBA5h+h5yifT73XW8mceC+zU5+XnQtDWuHshv5JfbobI+zVFq9GCa/9eTDDnLnDrkVmxE/qS15oFBCPbkMugDVEVQUuHXNu45DpLNMjIuvN9VgHlIjU3AR694Y9ajZf7Pp7fzd+UfGudxCRiJ4/EyPGT3SbZEg4maexAB6ZtJmiMTkMGXa5pzeODUZJdy2AJGHs6iAKlcM9xMrFGD9moxq81fYIIbamGFsPrvB2P608mLgH2REdzOppWMiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8Z3u74twelsj7KCgRQezv/CYY+h5TU0Jo5d6XW2ZPw=;
 b=Wm+sbPuVlpB70XrS/iQDiIeupCaRQjgK8pxUaGNMC7WJKSUZrzXiNaclSPatl2z/uXW218OvDQUMUIeYtmKaN+22bGJeCJtLzM/s+y03ZlQIdNL1hFNyPMp1OwZ3Ca8LcVDUKU2CVXwCO1KtAsGiVYYa9X/A/EhKvYHLwNrROhtpWnelOAIUMzX9qC/mop3mG+1hPgiSH8Bg9fB/RByyfXcqytIi3o5mTw/QVt4t0OAxPNnahUjgcs2mum7qgcDfefapR43JP9NoUQwhCssK+GL5Tm8l7oM00be5xv/jebXPX10HQnQePFGf8nJzm5uutBZUyDOSQCFAy52DyFqhJA==
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5521.namprd12.prod.outlook.com (2603:10b6:208:1c7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Wed, 16 Jun
 2021 00:00:43 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%8]) with mapi id 15.20.4242.016; Wed, 16 Jun 2021
 00:00:42 +0000
Date: Tue, 15 Jun 2021 21:00:40 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 07/10] vfio/mdev: Allow the mdev_parent_ops to specify
 the device driver to bind
Message-ID: <20210616000040.GE1002214@nvidia.com>
References: <20210615133519.754763-1-hch@lst.de>
 <20210615133519.754763-8-hch@lst.de> <YMi1EcrhatlaH4AX@kroah.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMi1EcrhatlaH4AX@kroah.com>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: YQBPR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::44) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YQBPR01CA0072.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:2::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 16 Jun 2021 00:00:42 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1ltIz2-007Gxs-4C; Tue, 15 Jun 2021 21:00:40 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9491a03-6a13-4cf1-160e-08d93059c889
X-MS-TrafficTypeDiagnostic: BL0PR12MB5521:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5521CD75B85C8FF5D827ACC4C20F9@BL0PR12MB5521.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cBhn/WJX3sW7KXRt+S6XGHL3mJYQVqZUxNn4li61j5DZO2C6xoJNiqY35+xpsFyANc6GW53kbibi/rR+LRlhHYmHiYIfOPHT5z6kOjggBTKwaNrZxCJ3LvGhvSp3ERX1ft+hmu1mF2BkM08okJfJypcHdbX6y8ogJgUmWktt4aM3gjV725ANF+eX5QfLKOuEf7sVY+jjgSqLaAZfHS9FfmChQcJqsGzAfDLCm7+rFr3PqRFrrfH8JNdDXg0TFkfiLsqJEL/tD77/hVLEuvdXW69U+0rKvNYg3kV3906+fJVjCLGHyGwU/FOZoP7uI45j4dxICml+KQLjf44qYurCrlhPmRZRCaYwXEozhsbdR4zEiyfftfPBaV6zdVIthrB1BWQJf8GTgfHxJrnqfWEetKNO1izc0KMwew7/DDwswQaN4cfhltl5SyGEuJrOIKP+fX02IaW6ZFxgYhH1CpYzCjqHJ30wib5FwNrFuwBFDjU3XQ0yrfrYlFU2B4grD7Y3OK7FiMc5EyASTb4YPYQHB4eEDPgzBdRR52rU6mAdL73x+gSOE81jk0Uj3dM6F3bgWhanJf8fPot5VYOsC3g8jf4vFQLJd5kKDK764rKlr64=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(478600001)(8936002)(4744005)(36756003)(7416002)(426003)(8676002)(316002)(26005)(1076003)(9746002)(33656002)(5660300002)(9786002)(186003)(54906003)(38100700002)(66476007)(2906002)(66556008)(66946007)(6916009)(2616005)(4326008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+RNwlR2enfgT0WTG7g7uv5Qe2+wKlvV7WLYjxub7YOTneB7Lgs1Qd6aAenpe?=
 =?us-ascii?Q?fbsacpR6uUPh2FcrptSjxdkE2KnAcb/mvAOuJOHP82jp00beVAJMgE/2bxNX?=
 =?us-ascii?Q?50dr4pQ6ljIRDXmVKZWWkpNvZUnkLRh5XkRms6CDbQNorPRJfP0QPdvvkRYQ?=
 =?us-ascii?Q?sAcKi+Ibqw5fBAHZv8SRKClET911kqER8dyrC3BidavcWCBWtcWku3JUM5Jr?=
 =?us-ascii?Q?7gRCjAt4kXOpoLzHtgMJX2vtR/svDy9iw3olk5pQOfQSyy+JZXUZS5RB7vj5?=
 =?us-ascii?Q?yMkgIICFcG2GsAiboSunZiK3+UY5Yxe80NUptOKe9M75/QGycewgEW63uRdp?=
 =?us-ascii?Q?MKxVVJxyW5BnsqdgYcUM3RX4SZoD0aMMv8daaT6ZX02DhxyFHqeduM+ZuAiq?=
 =?us-ascii?Q?9g1iEx0XlU/SYNWs7WfHbe9ICEaniuCzLNRmz4zYwncEe6lyygrB4rxWQcDZ?=
 =?us-ascii?Q?1dlQcE9rK7ExlvvrHf+R/Xvp9lG+fhMCxTR2Dyn8ZPFgexXYS8m8JqTu1odp?=
 =?us-ascii?Q?v97ugqvUOwW5WpV83YX64f6ptvaCiUMjxIhHtnQkOQoKwjFO24RHdPeKxpBm?=
 =?us-ascii?Q?yuXUJN3wORTcVtkp9nNypjZflQIPVg2xQ6suUNY/rtgQmhgtvIuYvGQptjdG?=
 =?us-ascii?Q?LUQPGV5SUPECSOAMbSJGbo5lQxLFM7KrBpMxfjRxs7grXmXBGRZ1LrQc5f+C?=
 =?us-ascii?Q?i7SCAyLHZ128ZpgqKXynVym15zB7BexPJwhGzK55vZWyGUD8MccCw9Cf816l?=
 =?us-ascii?Q?WAcoo89m8tYABkmLdJfH7S6hPy521LB6GwPoZ9gi2Lec9EdqR/FxxHkvQp7i?=
 =?us-ascii?Q?TjLA/RsqvHt/hnXXcKRmjGfkYNh6ywyd5qwzqRM/d0vqG4Qw8xQnlUD/64BF?=
 =?us-ascii?Q?BDzlpOqK1TRS5Prq0fB2Ysr3yv8oFiobrigTH0ShSakivIz8l4Ijkc40QM7r?=
 =?us-ascii?Q?1pbpyx17/2T8rwPE/OyDG2hpRKKJfyqgC21RZi6RFbEbGIgxQpgCf8pYq7Xa?=
 =?us-ascii?Q?nzNxOmY9JoFVP0ALGJexSSfXDoKOif4bfBwPifP/mrCw4A9/CDkDfO8l5tLw?=
 =?us-ascii?Q?XYKumuvq1sS1iOPbeV/1b9zq5nSzXt4MPRYydUNb6db3Baz7NA5vyZEMBGtj?=
 =?us-ascii?Q?NTevxlsANQXSDuL3hNEpg40k9n2H4y3tR2KNY8LRgsUrXjcRGLDx+PWsOO/L?=
 =?us-ascii?Q?PVXjtkiK3qCsN1bQmH9MdW16GUGYc6P/gKJYMmAIoMGe6Zd+YIM7vyCe7d3z?=
 =?us-ascii?Q?pGNE08ZSiKq83W76WjHJcPih+T+UjnGrLRATRd5MYWANSN2Qr+v+lKSbqzeT?=
 =?us-ascii?Q?VdCJ/UaOEWDanBwXkas0wXrg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9491a03-6a13-4cf1-160e-08d93059c889
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 00:00:42.7810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqnonkeH+7Q33MPzGaBa17vbquq7YCCLVuJ7UUnWM9B8MQTVhtkP0jbBqrPnlL14
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5521
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 04:11:29PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jun 15, 2021 at 03:35:16PM +0200, Christoph Hellwig wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > 
> > This allows a mdev driver to opt out of using vfio_mdev.c, instead the
> > driver will provide a 'struct mdev_driver' and register directly with the
> > driver core.
> > 
> > Much of mdev_parent_ops becomes unused in this mode:
> > - create()/remove() are done via the mdev_driver probe()/remove()
> > - mdev_attr_groups becomes mdev_driver driver.dev_groups
> > - Wrapper function callbacks are replaced with the same ones from
> >   struct vfio_device_ops
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Messy, but ok...

Is there something you'd like to see changed, eg in later patches?
This whole work still has another approx 30 patches to go and much of
this ends up being erased once the drivers are all converted.

Jason
