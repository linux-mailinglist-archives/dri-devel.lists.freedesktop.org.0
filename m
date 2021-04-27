Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0E936CE8E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 00:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1126E9F0;
	Tue, 27 Apr 2021 22:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE966E9F0;
 Tue, 27 Apr 2021 22:20:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nN4GpAO/+WDz9IIRl9f8qyhprhfbyXyIvzP7HKt6KT/yt2xmO9D8jTjGPMVuZUSWWZe8zMI43v+OSvN7FP2A4tBTyB7890GwrLhBekOvi9ucL08bu3w+qiqqM8ImYhq3/QaJnh5OPxI/NcsRz/wnEn/fZflF8rkAFQiFj/8BAP706Giuf7GGWV/Z3JHQdRFsyXX6PFKhbtBSFFgKthyVvSGjmYFxqPyksvZ6X164hZuJYcI2msMqm14bm6DWBVZyj4ERrIKT0uDV/dIVfBsz6czP0o+Zzi7LS8C0VC8wiRRFvhTciZqQcbKOpa8V6WpvKP6kUHD8Cder5/pE4w/aqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48OP2nRn7hXaeJEOGXmfbKYaUK2X297w8ka95Zo6J4k=;
 b=F08Yc4BUpE1WKG9dfj9lqDe2kOurufG3Y+Mdh4ysYt0fqDjKU0KKvRzZgNeWTpsWNTAmJbzy0WzKAGy2mlssDfvTJPz5CmyXyg0oFI64NkKomiuhVaMXDx9VQQ5AaOb2PNB8ANsgDvouMkysKO35Oenlyy+3qYHBOGDG1BZ4A/fJWG+xVUDJVcokOI1Z9E5cx4aAxtC7ydpTHQqeQuy++/8GTykRm22gsv5WaA6WdZoTThLgclGZnGR7V4xfNfFIUnAKrxQMjOgchfnwY8XSiq4naUO5GwGa420y/qjPoquJOwhEdh802fa9uwwATMIUsIdEYTZ6+/1j3neYhK4lnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48OP2nRn7hXaeJEOGXmfbKYaUK2X297w8ka95Zo6J4k=;
 b=VwS8EtKcbehrhyOboazWmY0DR1TguxKTeFbujG9s/U3dMhfQFy3g7ZOOq9i4e+57iOr3tyMbsA5VBmCqibdztxBEx3bKZW7EuS+Ud/3mMGb3uqgX0kTp2ycCDrd6ueGIzZ4zxT3OX3CwTCYX+nFL8ZwJTQyS25ge/8Hv9UzQjdTSthNPUbIemRiMcyzf8ZEttzWO1HaOPOHZ+I7chG2D7jCJ5o2Y1AooD9q+JLX+wu3eUTE3Mvze5+dYvE3q53cT0s6B5kkr4hcC+1HDfVmQ9jSB/HLbTGHgUVo+GhzeBbSUafZCc2fm1PZpGNQjF3xDyV+Y4u4tUmXvzMmbh7scRQ==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR1201MB2490.namprd12.prod.outlook.com (2603:10b6:3:e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.27; Tue, 27 Apr
 2021 22:20:28 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 22:20:28 +0000
Date: Tue, 27 Apr 2021 19:20:26 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 00/13] Remove vfio_mdev.c, mdev_parent_ops and more
Message-ID: <20210427222026.GL1370958@nvidia.com>
References: <0-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com>
 <20210427153042.103e12ab@redhat.com>
Content-Disposition: inline
In-Reply-To: <20210427153042.103e12ab@redhat.com>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: YT1PR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::28) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0089.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Tue, 27 Apr 2021 22:20:28 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lbW4A-00DjY1-Hh; Tue, 27 Apr 2021 19:20:26 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29c93ac9-f131-4008-8bc9-08d909caa9a2
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2490:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2490384CA918039F9EB4A11DC2419@DM5PR1201MB2490.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGOSS0rgPk3Kqgh0HBe8f/plEObO2TsKUY+H1vm6pYGcHcftknIpD5Km9vl0FyICenNAbmqPokvEI+ZQJU5UAtxemq8xrfJxEwDLS+Bb5S/YR8DNBDdwX1U8b/8GtKVNLWrEJ/AGNFZrM0v+el68mTDvNAUZpNFmA59GRSLJIDpu4yOU8imz9DKFTpTGRCD/5Mgv8F+4t0hcjif+8mjvB+AzClHl8auL+rhKidaJ9b1LerIit0kfI0mNBZ6th+5LFyTzlr0Lu6yLVqJb12Tkqjw0eozslHsp9ZybUv5GxDjUokIeueM8PdV27kAIvsFrUhWQfqyXnPl182fltgH8i0g68ph9fX6xWtRoJd1Hf9KvPhnp6I+uvMHo+drwz1kNLMSNo2wvBYBKgNqXjO1duyUlW1DAMdAd4HCEYl+se6RtoY7XHB6uJpflvyKT0YUMA3hYqvegB0Ok4a3WnJFwas651mVvR7h5Bq7eCyP3ulKB/XQ9l3hDnxfnTdlGCFFAtYNcRjxAAlQtVnAGJuvLQQzXcZ31gNBArxNyKV0+Clunl1ay1GYzBL1bVWrOBjbo0Cv9smJ4n12/j+6uXKE07zxGanglGHGwPQPrYg8Gmyg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(9786002)(6916009)(316002)(66556008)(33656002)(86362001)(5660300002)(66946007)(54906003)(7416002)(2616005)(4326008)(4744005)(2906002)(38100700002)(478600001)(9746002)(83380400001)(36756003)(426003)(26005)(8936002)(8676002)(1076003)(66476007)(107886003)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fuFrhzRUnwy1o6Rj7/6SjyxWyLp9tn6SEfVTD8vuvrx8JnCMn/8gIUiLx7tq?=
 =?us-ascii?Q?+XR2arJ6s3/BIfw46zwuFiy0Ccs9enH6kOeYAaEIr5VJS1O2ThBxsxd1GH+F?=
 =?us-ascii?Q?/GhZCaJPi5OARTd82B9PIt8uWg3NkVCR5HaviN6VuL+4oJsRj/tAV/CITUMu?=
 =?us-ascii?Q?SUwMKeg1cDZcnXG7oNAvjxUeXhDPyNRIqtqGMWkU0PtPse8dxdHwLXN7BRvc?=
 =?us-ascii?Q?sN87A0rry/wvzzkumpXyGEUsETca3wrlZqibKfZNAqth992ir/qot3uPGdoY?=
 =?us-ascii?Q?Ty0wdQB0aHtr7kL31o3LT8zWkmeoTSRx/iegyr7AiS+mm/jhUNDhgI+Vm++h?=
 =?us-ascii?Q?1lcduBFcB6l7EAdceI2pxG0+G2F3xcE/gIywG/gotgKEV/kc9O4V5mD0YPYu?=
 =?us-ascii?Q?xRFHnU0dflr44vzB6kt4ErY+MwBfpeFfcwHubbx+zAvtdwxc/ojcoifx4wrZ?=
 =?us-ascii?Q?20YQwzCgnAxC2MbUpKGOijb0CFM50Sh8CUeTKJWd3ktCLRJilUsZc/lpY57n?=
 =?us-ascii?Q?/Vb+PGUHt+/yyZy81qmHqRGi4fEncVL3sKRBPMcPGJGRXfaCR4K9CMKpVF7f?=
 =?us-ascii?Q?6XyE+kENVEYcfJunmhlAyw9spSP8iM6esQSDvV0qHRzVr3ROT1PkK/zxqqpN?=
 =?us-ascii?Q?jw0n6NyqH0eMux02BZxzmMoErg9CqUOhxN9yOD+ARmYsH0lZaH6zEjGC+iEc?=
 =?us-ascii?Q?H1OtQ8bbGy4dFsJsqbWRQuTihM9jpayBe+gzXUuIIE4SgnDiOdwhOzBT5lXG?=
 =?us-ascii?Q?KWj4ZMQkcoygoJZzCzqKn32x8cGeu8Nsy/hT/WaaJMJdY/NjeQU+LM7opokY?=
 =?us-ascii?Q?+juGyAJfpGx/qfNIxZZF70ieor2xXMkTOlQWJx2a2pZHlmhb/VSaWfq7ZiDo?=
 =?us-ascii?Q?WErum999ulfvpuIssMkGV/E5QvqqXlUZbw0S1XWTWTChf8fgWGoPlU9fgIAH?=
 =?us-ascii?Q?qEU8AvLtqwiEVOjeNfIuisZ4f+Mk2eOEwHcV7U6Ou3Vz99+wSh70kKKzY/V9?=
 =?us-ascii?Q?Hyt/ZgFYqLgbFJzYZr/mE1wJ4XBkYohqLITV+soysrj85p4S2CQ7YlZTec9q?=
 =?us-ascii?Q?cxK/G+GCbAJ9wZP34UrEoi4h2Mfb6ryeeqIjysMdsqIS5Pyqa2TVoVRHkhhb?=
 =?us-ascii?Q?/j4nDbJYvRWE6n+7nJs6xLsLAP8YVL/p4/ivjG67kA2ZSBCIPJ5HEOHQeck1?=
 =?us-ascii?Q?L3ThkWa0UQJKkEMFDyw7FpJXQ/g4Q0YiEnV+QErdTKS6+DBREHyxML/JHw6O?=
 =?us-ascii?Q?r6YNTky71hs2UGe27kz6arg9Lrve5Bp95muU8cuJrFZOFzJcgL94+gAF6B2I?=
 =?us-ascii?Q?xij3ocprRPda7hGtAZDjXZx+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c93ac9-f131-4008-8bc9-08d909caa9a2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 22:20:28.5980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upUHsuZX7tA3OTD3nh7D2uNgV1Vw/9PxYZn9R7vLfw9UowR6Fy+vgkEMmvQKQQBI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2490
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
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Tarun Gupta <targupta@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 27, 2021 at 03:30:42PM -0600, Alex Williamson wrote:
 
> It'd be really helpful if you could consistently copy at least one
> list, preferably one monitored by patchwork, for an entire series.  The
> kvm list is missing patches 06 and 08.  I can find the latter hopping
> over to the intel-gfx or dri-devel projects as I did for the last
> series, but 06 only copied linux-s390, where I need to use lore and
> can't find a patchwork.  Thanks,

Oh wow, that is not intentional, sorry! Thanks for pointing it out

I didn't notice this was happening, basically a side effect of having
so many different people and lists to get on this series - kvm should
have been CC on them all, I fixed it up going forward.

FWIW you may be interested in b4 if you haven't seen it before, it is
a good alternative if there isn't an offical patchworks.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
