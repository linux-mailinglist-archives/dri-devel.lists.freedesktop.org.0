Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F593A83F9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 17:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F0A6E128;
	Tue, 15 Jun 2021 15:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1D56E128;
 Tue, 15 Jun 2021 15:27:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLm8xPlGPU7P1UCl/Xip4kQ1McLNoWhcTTQNOxjGhjxx9rgvm4t/uYWS0jNIpY3r2mc+yals4L3j1Q72tQTRzGJXL/XCRKePhHsqzO6rxSWlQv1gBeoauZu+mQ1F9SbEn8xmZrMTUenevLdnjHRLTp5wAPFQGMmuE/zrI39xNySU8ocFpvU0pTYy/zyA5tzzqOU0KrSI5wdsswZgURx93AbEsuQarJZrnhGvFChePIcYjWRX/uGekuTyGciTE4O8+0D2Gl7xIpAtBy/AvHT579klPzh12zEGFcNtB6IgHbr6yN+VfSB7/rptILQa/HuaAKv77bTRsH/Jr09gSQaVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPaTbR5qOjvH9FJGuIeGCpTGt34lXHjFtnUB08uGOG8=;
 b=P77QHFoYX2Sq0NNjTfuPAKuBq3mEEp03RVFAnm7B3x7dY8hDmQ1A2JIKK2++nbgGV4J6PphBrcYmLrMB92vsfup3UeZDgC8CRmnHLW0/UiXoSNdgfODDsQkCVyxOTNhw7S27RbiZ9ltvtgMCrCeIR5ALtNqNMSD0Okh+ynodNOXg0TxOUaYbIRgDntbZQUiEWGqqmq1cftW6wtxpqjMgEoMbKilShAlTAS9HC+nNpCF7J8xofpwQO6/HeWvakExxOQs8iAfS/jn4lYPRCIDLoQjZPl975zC/UZ5y2uT7jlECVs/Arxs36URVyjpI72a8JUMJzNI4DZJeT8ujFQLIZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPaTbR5qOjvH9FJGuIeGCpTGt34lXHjFtnUB08uGOG8=;
 b=eD1W6VHhzbXSC9Zx6UOOa+uxdWYxWAmBiNopmGgsSEd47YftbTA09MW5eWmtpRJslZqR10hLwElQLUgqtaO+hEaevz/3HJpmGrOraDVa/9z3Z8nPdtx7Gb2SG22zR8rNyjh9cKjUC6HqSB7ShPp4VdgkD4EeEDvkpNfL4kz6Kx8wexXntdd7TMEWmiDMT5ETKU5l2XO1wUfgT6xiPx1xBqJhKc2fVoZH6fo20z2V203vzgFho9CW0uNglzBPq84TdwP74lECd7HdgCY7x42NdNqtQnOP9sed7XGuQohSvcWeKML6Jakca4SJCgljTgndc/qZeq/pi8iEGh/f9YhoSw==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5555.namprd12.prod.outlook.com (2603:10b6:208:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Tue, 15 Jun
 2021 15:27:46 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%8]) with mapi id 15.20.4242.016; Tue, 15 Jun 2021
 15:27:46 +0000
Date: Tue, 15 Jun 2021 12:27:44 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: Allow mdev drivers to directly create the vfio_device (v2 /
 alternative)
Message-ID: <20210615152744.GU1002214@nvidia.com>
References: <20210614150846.4111871-1-hch@lst.de> <YMg49UF8of2yHWum@kroah.com>
 <20210615055021.GB21080@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615055021.GB21080@lst.de>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL1PR13CA0260.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::25) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BL1PR13CA0260.namprd13.prod.outlook.com (2603:10b6:208:2ba::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend
 Transport; Tue, 15 Jun 2021 15:27:45 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1ltAye-007AAY-SE; Tue, 15 Jun 2021 12:27:44 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44dcfcfc-1004-4ac8-de06-08d930122049
X-MS-TrafficTypeDiagnostic: BL0PR12MB5555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5555EAF43F86D6F250FBC07CC2309@BL0PR12MB5555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hRMiPbKkpDnhHmTcxlc1V/7QFa8+GwFHMMnQoYHBPXLWlwoTMQHbEULvtJMCqEeRZC3mYJb4WoGea+d4galRWBz4bSeyZE1CQKD27DHDp6A01Yle7UcHxbQPl7e9+NT8VLCHqwL7YHdGRTb1NnBGl+osCikHaRRwC8RHtxNSHqs8aIxRz8qYytKesQcTbZHqh3DQP/Li3i5p19lsRkfkaVbRT+5jLHivOhzGyzuXr39B+NL2JGsa7PkzfhrJBkrD3fjMcTqoX/0nkJUK2maaCnU2oagoEPxXcdtk4QLu3TTYadTxsSCWrO0MCd/UbP1mcynGP58EDx2tssWe3xLVX6PA9Nqg9flyXkMUFkBFP71iBIgxYB+4V1zV5oGBC9QD7A8vQI1e0lG1wDgkrpKXTXkTZnkSHzUqQeNyDoGLXAXk0dhi2pwTfzKYtZHvh2t93ClrQQcJw7gM6F3EDo/ZCZrx58QBNVIjwHdjM+UHIXhuhO2WRIY1McvJVoV0qoeGfSmXkFKRvfrTgmCrQajodSVbWqtVMLm/tewAMr6bhGQ3GinBYNhS9EXPUKh8hhNBuutZlH9N3T4WnQUyK+tvpKhz3nTHFlEDRs9eM3X8TFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(7416002)(9746002)(9786002)(498600001)(6916009)(4744005)(2616005)(5660300002)(66946007)(38100700002)(26005)(83380400001)(426003)(8676002)(4326008)(66556008)(36756003)(33656002)(186003)(2906002)(66476007)(8936002)(1076003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?23xGDNv98FYbxKREKW0GhW1+akIZpRFkHRyyTNlNMr9ssCRBarThxcvlX2eC?=
 =?us-ascii?Q?Y2HtWK/a6CuaIDNq9pbC+CeQXdnqbMnoEhOzcB4w0MCzm0Wxi0cxXTZfBuNv?=
 =?us-ascii?Q?dC7qvCoiHWVAp1NAjqgYHB1GiVLBbI/y3bvC47OxMmsYobYp5BGoXAmUpYNk?=
 =?us-ascii?Q?QYg6SBlCvrLvVeuteK7auqQ82mgVaTwQ8B8AV+tCb0lN+KiJoZ1xVHBmCZeb?=
 =?us-ascii?Q?cRLk32OLlSDFIZ9cYFhOLT2rNrWWnCSo6y2E2Cjim8x87m93QLwdMma8oFU4?=
 =?us-ascii?Q?Vtxu7nRi6YxxWWl7GRGgkoW7yt262eg7WUOMxMeYS9Q08gR7Z1iaROVl7yM9?=
 =?us-ascii?Q?vOHBMXY2GsEeilffvjuKpxnDAfVFZ+mxXiIotrc0nAfNBpMZYKTagkl09EGQ?=
 =?us-ascii?Q?ouCH5e/jpth9fdzrFOKtvRisgRZiw9VgSQQciHdw15eNKR6NLt8zv1fYCcDM?=
 =?us-ascii?Q?t3u6vmBO35NwLmLgNrW3f5Hq0xsfwVVhNZkXaeqIBuqvf2VEflQBMlhnCZ5+?=
 =?us-ascii?Q?zdb2LKKecmJ19uTcwpOdlFml9ERJkrP9kmo/zlO7sVDbwobrs3g5RUXSEPKw?=
 =?us-ascii?Q?AJzYdx/GixkeU4tlOWJf8dsbSVHHLOpDLO1CH8iUj/BXOl7bUKpfGDGHO63R?=
 =?us-ascii?Q?llX9CUVC9qXFw3nNjqHMntZcUalN4IbAGgK2BFO9uqhGvQsPcrjFtjxTeH9h?=
 =?us-ascii?Q?VJ6v1r7qyQYF2c9JIHVoXhdSdck5IXjYcWaYSmAAWQXUX9MsK+U+D8pD54Eo?=
 =?us-ascii?Q?QWiTPKOM7fR7wlh1MXEquDppUVyiRwDbKY/xjqsP6Z1NZzu4ZpU5ERit1HTv?=
 =?us-ascii?Q?KtqJENo4AE7hca2qHwEjoS6bPRw0l3hwcoK1X111E1VreawgFvGy5TRb6JfX?=
 =?us-ascii?Q?n2E33b087rNhEVk63FoOESFoMLltLQtMEeRXM+XAKBaSAr9v3bNPVQSnTUd3?=
 =?us-ascii?Q?DQ0n2JLNFK2+Og0g9fgZ9tw1VQQ2EDqb3zm/iWTaZtk3pg8Q1FvxVYNWK7qT?=
 =?us-ascii?Q?P94NHA4wJ+iXqDnol1kgkQB/l8+Npf9i1Ivi1JWddMUKfi9N0a4Jz01kWChO?=
 =?us-ascii?Q?pH2ry0+sbn+Q3Mz3S1pQ7zAKUl1Q8Au3uagedISJ6NEhbRfS3mG5Id+PTYXU?=
 =?us-ascii?Q?4ZS2+6r5kghXZNI9/iuJzjLIYXDkymDXMhDj2gZQoNDbG3E3aLxjHwgmt/Bj?=
 =?us-ascii?Q?+6kZP6y5bGhGyu1w0OQQ71pRXqIcdTj6N8wnoLFKC787c2E3ajwt4nPW2Qzu?=
 =?us-ascii?Q?OUgWPLvYA44QQaTMnddjH73IY/5MJuDV36nOWsj5teAsbdClLTBmzHhmPXUo?=
 =?us-ascii?Q?E8fkTBe/9Yb4+FB5VZf8nJIF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44dcfcfc-1004-4ac8-de06-08d930122049
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:27:46.1470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODg9KfC3v6zrdNqnXo2EGbKfpgjjfLW8/C4ODXjg5XqTTQQdzLXQDTaeYkU0zXrW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5555
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
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 07:50:21AM +0200, Christoph Hellwig wrote:
> On Tue, Jun 15, 2021 at 07:21:57AM +0200, Greg Kroah-Hartman wrote:
> > This looks much better as far as the driver core changes go, thank you
> > for doing this.
> > 
> > I'm guessing there will be at least one more revision of this.
> 
> Yes.
> 
> > Do you
> > want this to go through my driver core tree or is there a mdev tree it
> > should go through?  Either is fine for me.
> 
> Either way is fine with me.  Alex, do you have a preference?

I would prefer to see it go to Alex's tree since there are more vfio
patches following this that might get to this merge window.

If you want the driver core part on a branch you can pull/etc I can
organize that.

Jason
