Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 570A73A691E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 16:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FC689D4A;
	Mon, 14 Jun 2021 14:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2059.outbound.protection.outlook.com [40.107.101.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DBE89D4A;
 Mon, 14 Jun 2021 14:36:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbIUG9yMZp2WjnkL/hJ1oFRxJYFZFLxhYKr4hxbjxmiOBVNqm/aRsSMfcne3STVRz+ThiLzjkvfwnhG++QAQH7WdYa5TJXsJYSupbSSHgjTpG9QxCnNnkxq899YjdwjmY0jn+blyYVT55MmRDLG13mAAucaAHtIipr9/xhFjdWDIxhDFA+L/S9Fx55/yBXTLcSfgNJYjIFXuL32whKtPi/rFd74tLUJtd54lWJ+Xm9mBFXPq6QL7OjgSfz6OpO8EjzoEeTZPwoKT8qKUtuUmVgDe6CEpTAjhJDVIc+6tb7dHE74UagTbRcGOGuanHa8FGNIzJ6jdE1aB+71A/TuA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pmh/ynZcS28kerLpItdVblA/RnCZ93xnhhAw6DZbs4o=;
 b=hV8Y4S9V1QxzhlnOKz371YEuZafC+stOzhvlz+1+4l4E9DC7QlWxcgkCjjdoK7+4AmYGAO3qPIEr4fXy+oo0lZEsZzW9x+HRJImhDc5sivozRr70FepyhpOqc5ta+54S5fh6Jhj1YjrajhkjnAROJII81GEn6FQG6I75IrU9ZZO7rcrZCFSiRb2cCW0gcmCsV/8lPYhpsf1g/xDhaDoW67/RZCmkp5OCi7pQdT6NEhKqMVwiFeCpesXJSGLygPRtmMq3hty6tMtwN52R2c5oCTjChadNXP0gCoB15ifcEJ+ldzue5mBI60pRjXNc8rp+P2g/Kpqd3hcmoGlf8HyaqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pmh/ynZcS28kerLpItdVblA/RnCZ93xnhhAw6DZbs4o=;
 b=bfSKVu5wNHZINQhcWuGEq/Ve9DBxrD5KYdvvpeZSTrRx9V1PEu8nCvBO5r5wcXKw+weDckFmKvQuyLU0kJZbyW5TG1kdlY9SRJK1d58VA/brTr/oU7uben9DaWj7mYKPw1wIyg78Jj5DQg50BxvzYWxVj8ZH6xSnlVC5Q5Ic6mt1qUlIls1vsR54dlL7arJfcM2ScST9ec2LMY05Bd/dOdXqGp/Qd2ZUWonTdK9EQCTm37ON/dawtm2s/p6mwHJgM/ZB764Q+j7LlOOxJMqnptRvK/1D54tey0PH9P90Zqwzo6Fbnx61DNVzhPCjP0GYYflNO/7PUhIMFgMIki9v+w==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5352.namprd12.prod.outlook.com (2603:10b6:208:314::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 14:36:15 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%7]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 14:36:15 +0000
Date: Mon, 14 Jun 2021 11:36:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH 00/10] Allow mdev drivers to directly create the
 vfio_device
Message-ID: <20210614143613.GJ1002214@nvidia.com>
References: <0-v1-324b2038f212+1041f1-vfio3a_jgg@nvidia.com>
 <e6cecaed-3257-e636-52c2-abf7af2cdffa@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6cecaed-3257-e636-52c2-abf7af2cdffa@nvidia.com>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:208:d4::38) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR04CA0025.namprd04.prod.outlook.com (2603:10b6:208:d4::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 14:36:15 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lsnhF-006ivO-WF; Mon, 14 Jun 2021 11:36:14 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7be63fd1-ae80-4309-810d-08d92f41c3ad
X-MS-TrafficTypeDiagnostic: BL1PR12MB5352:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5352E73F20ABA8B4BE060EF4C2319@BL1PR12MB5352.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tXh+1xKz0Di3t+6AsrtfBMpz7+NQT+okG9g2pTc9vuAqIy0orsW6z85dOTQEKruDUyaDdJNLQaJJyheDZZlTtq1aqOOGes1f9xmffEEoaM+tpVsWakw1npWRUXIYUAyNW2MkFZdedWcJCz7g7DdTkEDqQ97QKpVZAEifietm1Oaf4rnmyhgd08g7GrSou7Ds98AJ/YrcHtR/U3Yla+p9avqbL7cq+GG12d28URuWGZs+alDy+/wPLAc4SsgaqjK+zGNxRohEGgkBscZZrPKEyTwm5iDkyhY/rWH8HUAn5KVjI0cD8xDxoFTYOI31XG11cYFedXot5M6L7sO3J1kTarbyfe8jxr5JPqQgyaOhKnD82jtKy5X4KG/T6U3dKCyda/Ymuu2oYsf9sqgVnK6Gf4ExHqfBel+kAjfbZ6oVG0CKutWDGgBBRvfw6BhTJseHyn8B57NZDJWdzjzP3xsedSa5q9MmRcZyR7BLFEq7iB/0G7SW8AGDSsnspM200S9ULucLtH+zg5e7qHBFv0Zp8VAWKufq4hmkenppctbaC71tybACcqY7sw7JkpPoSzrKn1fJxUL8cjnIBx6sX/qBcpk43lFW6kwClNAQPu8PfMo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(8936002)(66946007)(4326008)(1076003)(426003)(26005)(7416002)(66556008)(66476007)(6862004)(6636002)(33656002)(9746002)(9786002)(186003)(2616005)(316002)(2906002)(86362001)(5660300002)(54906003)(478600001)(8676002)(36756003)(38100700002)(4744005)(37006003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9qOlQrf9C6XyV/OwQ93c+4QHvTa8vOsbxTadM628pw1FsgD+C/Vpzu8tDCFZ?=
 =?us-ascii?Q?sSX4JkJoaW5oXzrSoYwOFcy+HWYkJoJGbiECkp9bXwPDxM0vtOfMazTVlDok?=
 =?us-ascii?Q?O2CA7aUpD9f/FKeIZgN2efZUr7FDNhza+vtkrJqDyFHPUUcpVCUkI26P2/15?=
 =?us-ascii?Q?2z2XCqB/ktbgoEbvKZELbS3U9bwQWOUCMaWVd2idr5OvZVpA9XhlawR7J/0w?=
 =?us-ascii?Q?kdlE4SCUtMC3QOu64eHwUjuDmc/1+G++UR56okwfZ2PnPFkvDabho7qwci3y?=
 =?us-ascii?Q?KBVPxIRqa8bRd9e05WjxV6uJcW1K/1oJFyQYanIUFuwIv4KYKTYeeAVIbaYm?=
 =?us-ascii?Q?eYdLUuDRKULPteukbBvy0UwlE6jIPvNoUMIaUUBwbSu18xd5QpQUjxu1CuSD?=
 =?us-ascii?Q?4pUN4uki0oe/GFgcuoQHlgORMHuMmpiDvxA0SAkxdErco+kgihwwbQuwQngX?=
 =?us-ascii?Q?FLyQ/Gu6vxBTlfqaVtqzPGEb8XPcGDr4RuqVDV9jn0Lt8AqEtJ6uTQp+OHTh?=
 =?us-ascii?Q?Fwsx5HmSFMg0A4LsDUSnJkfsRse+8keOsau0iQ5exC2A87jQsPhi/4c4wOBf?=
 =?us-ascii?Q?SXY8TOm54MIFlQScPB6pre01lcTV7pgndMJQCrM+exbauyJg4LKplFxWf9jD?=
 =?us-ascii?Q?dinUVEnd5mokC60bDy0lGvpbpCmxfkv0A2iwtxrh4phyW5h8JH7TJnBO4OVP?=
 =?us-ascii?Q?kDccNN1yd0otL1NFM09LFiQkcnACGkybWpCvlXHe9rcwffiZyycZHhK5f8yH?=
 =?us-ascii?Q?uImQia+wvXrJB93jaQYAegJcW/28dX7klcxGCfaQWBXNtB7WR5iZBsSs6jfq?=
 =?us-ascii?Q?/1C9nS2SY932Xm7emZVr+1JyMncznw6BkxtjHAJpuJR8MhAIjzew6CFPSEMN?=
 =?us-ascii?Q?vOWFXy/OJQMSOo15IY45+9JwdcvXh4/w24b/PFRy/nmfM3c1vjdPEQSyCymK?=
 =?us-ascii?Q?3D8QV66z82Rn8kxanej2i6WZp8GC4Re6b7uuquKhe3XzC5+YKW+NR48xqG8L?=
 =?us-ascii?Q?bTk4ouVQJ+BuxR/EyYMMA0oaDRK1WISM2hk9Z7GFzfGiIXIo/oePCMGDMGnC?=
 =?us-ascii?Q?YpEDkgLw8mnk+mBtjauCGAz8OFSXjfszlaT/rUGun0qgB4AnQ4zbdUqNohYZ?=
 =?us-ascii?Q?3iZMoc5H9GFNUyscvD7kCi4l5ODzR/qSfzXuFWnqkKK/zY5FwjbJFw89TdHp?=
 =?us-ascii?Q?qmsKRoca+VF7kcmp5CTvlNxHU1VUIXCEyWAKk7GyFL29BEmH0iGZXuWaaEav?=
 =?us-ascii?Q?pQr6fq3/mHKVL9/q0jJ4QXEsn8yRiI/RtWjXExsP1u6qfpFYaHfmfEO4ROBJ?=
 =?us-ascii?Q?vB/cO2CcvB5ngG9/r4+T/PkA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be63fd1-ae80-4309-810d-08d92f41c3ad
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 14:36:15.3596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwOiGo38SGRWCwcPGleZ8v1T7p7wxHHW3OjXub/PssmAf/mzpi4zBR7fKvT+Y7ad
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5352
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
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
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

On Mon, Jun 14, 2021 at 08:04:03PM +0530, Kirti Wankhede wrote:
> Jason,
> 
> I couldn't find patch 1,2,4 and 5 of these series. Can you please keep
> kvm@vger.kernel.org cc for all patches?

It is an error, sorry

> Also it will be helpful if you can add version prefix, eg. 'v3' for this
> series, in subject line.

This is not v3, it is a different but related series

Jason
