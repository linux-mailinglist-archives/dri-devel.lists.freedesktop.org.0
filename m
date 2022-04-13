Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DDE4FFB12
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 18:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B6A89AC0;
	Wed, 13 Apr 2022 16:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A9A10E4C6;
 Wed, 13 Apr 2022 16:18:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dw9VK1cqx6Tfgl6X3oED8eJm0LVl4IBUksYrkL1FdU/HDFJXgLwfDlLEs6bJBaX1VSNZ70qHlW9npAdKrn3Zw0J3FlDCtOnqA9z+fXIJFuGLUAWvXaxMSm9qV/ForNVhMH7+Qm4xO2EegQqRnckc+6EThcmbUbaoA/x+LgQxCc4TRQ+m5Hhcbh6y2+AJyWoXdfAl5wzRd+su7BVAAc/I9x0yqPTg92hlLc3DZ0prBnD5h2xAXrrYiHPBFHfsWCxahSKpnugCQjTnOVgxxd7rQEeR9rf0Y5ny1qh79OC/ITqsZjX7Am9aRH/HRJgfsfeHzcX4IFXzNvTpcynVG8KYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbC9E0vNIP58fA3FpHwfDm2pE8MkfVeQ7baWB1ekZbE=;
 b=JaAn4UGeYnInsOkuFxHapQL6G108Rit8PGoV3sBcRWxrmw4apZAAMknBgr956CBAN6+gi4Xp4ocipa8CgGsrl6xnLCbNa8k/OtA6qMfQ0oGvPkcTVWMzlWmLwtNilYacocpxgjX4A4dpCjBz50JbqoZUNr5rt46RH9dCc4A22IIXv0opWpo40WrRVz5HnuzKTQ24YE8Ani5CwLM5AOd3ix3o4eEfOuU3AefKG3FtC9pxzW2uH17lTDwjJuBm3KGs4NH8+2P9qfuEYW/GhY0avyEbi9XdoiBbuNz655TedqZokUW8CsAjMSW/JowM5wMCNnG/pX14g3eiacn97psGtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbC9E0vNIP58fA3FpHwfDm2pE8MkfVeQ7baWB1ekZbE=;
 b=S2OhvDRl1ASXLIK6i19I6ejGpBQs7LX+bgN7fzhK+IShdsbVaMoAzFKivwzx43QGi8z1HeffShGZ87XdyI/F9VY0QhtzShkLTtxW59JmfzExOWQ7i2ghNbzmUStLTjaSgtJNgRQxv7QbEbGDdRRQ4EIEu9vLAqlKQ8FKilO7yTNlOQCzQ/hJT+aJx8DXxNwzW7OZKNnB5ILqV+M+l5gXUvY962c203AJRVlpmIy3UzuZYPHkZLHoHAZvfB2dEkxcegjLnOprgTnz6dmQ4gT2vyeqNphp6GAf36lrvQK/S2qpp+Y8JhySYMf28L3DFxaQpXUSUz7Nif7ZogVRkJs0Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM5PR12MB1481.namprd12.prod.outlook.com (2603:10b6:4:e::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Wed, 13 Apr 2022 16:18:15 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 16:18:15 +0000
Date: Wed, 13 Apr 2022 13:18:14 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Message-ID: <20220413161814.GS2120790@nvidia.com>
References: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <20220413055524.GB32092@lst.de>
 <20220413113952.GN2120790@nvidia.com>
 <20220413160601.GA29631@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413160601.GA29631@lst.de>
X-ClientProxiedBy: BL1PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::12) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a372f3e-c6e7-45df-07c0-08da1d6936bb
X-MS-TrafficTypeDiagnostic: DM5PR12MB1481:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1481DB37223B2F5258E19201C2EC9@DM5PR12MB1481.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FU/fWYbGqbz8arVGEJqIbmCbm6kaCqHD2o3kvZpZPGVtSkkW3jG3p04qrKtQWg8kMsc3fNYJHCD3iwTvg8Yxh7lrHe1eTxEUEhgq1tDzERItg7svt3o56XYsK3BFeBkvwgbva400TtChhLnVEhqvsggZQUsCUn0yM1IxUOvhj1x6lK3rseWYqyvR+n8kHtZHNHz1WWLzcvSRU3dTt4hoIeZQjLStVEGBRhLvOQGLy0YP7Z5Ii6f3/fMQ+hthWLQSwBnneKblyz4sP7p08uQRtHktn9BPiH51GtkBsJ8bwwUHIZIl3bxD/G7XcrY6uooI2ZI3Tmkh9fQy1KYHoVBU8HeELtMx8MGwNxe1c+iAf7iOR4DvKnZlIYq8J9C0cs79ZjB1uFGNjfOnWGORUge+h7O91MSOpvk66bF0yAmx8LeXcBNhGlgEeAbTFK6bsisVJv7XGPSR3wauwkLyaxZt2uUnfYy6uThPPZQYYHxUguAiGuPsAX5a3pcdcMqgvaNkh6aYwhuD8NutUcGlA5qO5ffOOMzKBzZbZ8XrLHYBGVIBwvESTc33tW8OsbcNFSi7sdgL/65jCfH0ld2kw6j/mMN/StVRCoYzR0U69TuvuXnXCK9A24+Q8pIUEKQxAV6O7JEuikzJboymewj+Vb73Ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4744005)(1076003)(2616005)(316002)(2906002)(6512007)(26005)(186003)(6486002)(4326008)(7406005)(8676002)(38100700002)(7416002)(33656002)(508600001)(54906003)(5660300002)(66476007)(8936002)(66556008)(6916009)(86362001)(36756003)(6506007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AovyGSjkeo0dM6FJ5QXb1BVYvPNKkjAs861Vey+EBGVx8DuhO2C0+di5Sz6Q?=
 =?us-ascii?Q?pEH0QdnfqpAv3ZgGvEB0ubSQXG18xIcx226CaD7X3WZ5+rtfpmQtu04MbJa5?=
 =?us-ascii?Q?EGbIEDuS5n3v5FPmtjSwkzxUoX8KyB0SY5+8KlvK5PJ0lbK352u5P7pNymbQ?=
 =?us-ascii?Q?6IVqW1tJZIY1bIM6cAKkDQRCFl2s7ildIF4xnWeCtzh7p4sUbCoZJUskk5Gq?=
 =?us-ascii?Q?OgXXiMgmJ4nU4yLB072Finy5eYpYWCYr0o2SPjJgvLMzS2yFD1r/XAnoNbhn?=
 =?us-ascii?Q?7v+pDRIWxlgTN+l3kI+9pFOWUYTLyTHuPa6NwugRbB//0kCquPQ1T4QJTQ2a?=
 =?us-ascii?Q?lpa4Kc7XJ81xLqsPGDcynGwRlstrCKiSKFLMl88AQxtI5bMOPbkuAlFi1Zwz?=
 =?us-ascii?Q?QEupXLzdhC9DYeSS5ilPOtYWjGUFs955RUV7pbWmwxAxnp3lVg4ou0KkqxIb?=
 =?us-ascii?Q?7PTQ8TG5qNyDY3rSqe+NKfQZjalZAXHJuntzDYn8QE1j7RgbrdfmH0A+m3Qm?=
 =?us-ascii?Q?WqI/OdrA+NA+8enhZo6Ld9npQJeWsU8xKNn8Eavjw3wZD7sCEazQppDYvymk?=
 =?us-ascii?Q?vl2Ka90GiqZ7hFGigeJpiviVvUfDrYYwjg10bfzP9kgtpSfgQrwzpmZ22qRJ?=
 =?us-ascii?Q?kNcLX9B4dy9rxdHWCfnE90H4bQaPv+CRlRxUFFHOCOdQK5z4yFLBK9g/88ZZ?=
 =?us-ascii?Q?riBlFqzPs6j321xwqkgrjavE/C+yspwIm6HhMBOyIMCmOf5k2oew8+nhsFb9?=
 =?us-ascii?Q?abtQ0RYOwi4uo0t3cxHIxc0UaFZVQFG/QxltAUdsMthEiboP87hc0k2rxhkg?=
 =?us-ascii?Q?vfxNAw6AvYBzC66++kk8ih+j9rUA3RJYyWkweUA6FknVB6sFQFHqII/ujXq8?=
 =?us-ascii?Q?TZch+8XoC4Bd8cmlwVPvIDMDK+3bOuPQGVx8EMdkfZ6Qm72ylgMaCMf/4V3A?=
 =?us-ascii?Q?fisgYVamqtPoI4Pkf7HIs1M9DbHR2U0dUaKoQSaL2BoUZm3Y/zDPQEVumKwR?=
 =?us-ascii?Q?vdFAI9vsZrAG8UlhuszVUl3BEzwfHtH+iIaI8GvHgGLFKnysFOmXtAKLLz20?=
 =?us-ascii?Q?H8B+zp/yL9tzMsem7wrMAQPiRpJorqC8u4Tzz948kPUuKUJdxgqwWRfVXuP5?=
 =?us-ascii?Q?nzUyTtvhEEBXZmKKELLTtfQXgqSPSFa+9+oldkuKFUmFiv5k8oxiK1hKyrxb?=
 =?us-ascii?Q?mBgXpmpPD+D2b1yNwxLkm99FAgQNtSqU4ZY3CCiLXTK44oBOTaYE2bdyLpZ7?=
 =?us-ascii?Q?keSzE2oL6ef6y2witImW/w0P9SAp4YysV4WgF3M238dR7LTTMA0KVk96eTVA?=
 =?us-ascii?Q?aSJRp6JQdHP1aZBk2Tmrr/QMQghP8JRXfco2Vw6ROY1bJvVux1x7dJXzOlVn?=
 =?us-ascii?Q?blY5SadCTyWvE8TtpzhksVnntI4e3kvgOWGrzImXHCtreakv3AdFjPGsIJ4s?=
 =?us-ascii?Q?owIqOvb1uiBvkB0MOPZb3zJiGoxXCsvLZY7oF4PAWyBwQT8BHH7oZXMLFyF9?=
 =?us-ascii?Q?Zv5NptVEfMsxgHiAnhtfnyTQmRlOkLo74JvjG3loVxu/ufSnJ+qgVAeZBhAF?=
 =?us-ascii?Q?a/QrfxjxAdrGKOQqk3s9XfPffGkY31X9qijqfWijphOgYRIZ8DKuiSFQrfd3?=
 =?us-ascii?Q?cQKYLgHH77/jXU4oZMjAj7XkRXI7hLKzHoZCLSHsaxyPEk3qC4c1ESKJj78R?=
 =?us-ascii?Q?YzcEH1Bk5M+tP0f3WmoQRPnioJUHdb+h6iWXVjh3fhS0lblhIGkODMGAjpJO?=
 =?us-ascii?Q?fTG2jIyAxw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a372f3e-c6e7-45df-07c0-08da1d6936bb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 16:18:15.6795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMYgJb/X5IvCooesbQ0koOnKLIL3WoC0bazbqP/TgfLaiYsPGpkcQECfm+m4pll2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1481
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
 David Airlie <airlied@linux.ie>, "Tian, Kevin" <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 06:06:01PM +0200, Christoph Hellwig wrote:
> On Wed, Apr 13, 2022 at 08:39:52AM -0300, Jason Gunthorpe wrote:
> > I already looked into that for a while, it is a real mess too because
> > of how the notifiers are used by the current drivers, eg gvt assumes
> > the notifier is called during its open_device callback to setup its
> > kvm.
> 
> gvt very much expects kvm to be set before open and thus get the
> cachup notifier, yes.  And given that this is how qemu uses
> the ioctl I think we can actually simplify this further and require
> vfio_group_set_kvm to be called before open for s390/ap as well and
> do away with this whole mess.

Yeah, I was thinking about that too, but on the other hand I think it
is completely wrong that gvt requires kvm at all. A vfio_device is not
supposed to be tightly linked to KVM - the only exception possibly
being s390..

Jason
