Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC2056ABC5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB54912BF5E;
	Thu,  7 Jul 2022 19:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AF512BF5B;
 Thu,  7 Jul 2022 19:22:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caDrgXqMBdNW6QIh+vfEExrluHZdObkgi7dNK/5sk5WLtKLbEl1YK5dCRPBR/gkPWA3fJR8aX+IomjYpdkNX3+0XY+sFpN5VUVUZlpxWX9hbO+2Uu9rcCM6s+AUujlr3/IHkwsPgM2IfV20Oqscg0/E/lIchqH1EjIIoT8BkXUDshoDNG4uYmOALyeQk/EiNM2ZW7yHlNPYHYz+ISFFcz9OICxG7PU/9/FiO8R89RYbWpUQeh/7s9Y9BcbL6aI72WfqmVb2aJfjU3X4Ul/TlPHhYmRYpX8CVbtW8DZasOGQX1z6dPg3+2J1gDPh8kd5IoqJ4Y5xLaDkgacbNEhSFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPdstP4tpNb313LZPFs3Mep91ji8nGfY7ETX/W//cK8=;
 b=cYDbMafW1FKu8ur8DAMYI+/jvepbKAD0otalbMu/iSL7T66gQmPVXeOuCAmm40rtJg6yEhLCij4x96LD59tKok1w3mcdK3DWYbgx4AMb7dsN2sGbHmIsyzYiAzLpxUccAUtu6wEKkHQb+SIgQp9vjFknB6TrrCYTuVv6cfW8Z7Q9teMNEEaCNC1o64XvY01FZsuexXZPjnJjbZV1L8lOR5M4gWN+0ZJmQBm8WM/d1gM4tXYUWD8BhZEneN25B4X0UhMz476kKtjGuFDuwmdv4k0+6gSQeDzQxbvkWYkTsQzZ07HVdsK1d2Dsq6PLYdH3wBBcOiQxhv/fQ6RdMDugig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPdstP4tpNb313LZPFs3Mep91ji8nGfY7ETX/W//cK8=;
 b=VUAgF3zI/0f+ImcrBdTXC/TgOKUTcSRBRi2O2II5Tan04C+mmr/tJh6IWlRm7zRRNI6ODr8WTly4MEAmBINvum0U6upEG+gCXXvItvwycmMXrz25dW3CyzxhA8RJlvao90o0Z+vR+y0NCsgtirihlwRUiTx+jZbOBwyqt804QtiFuo6QloXzIGmoPeprW0gHj2gW/2v8HQDONZQ1ygn9lfFAgY2LLrqzsoXie0tJpS0ShX4Klad909Ukyi/lkAcnHYA7pSlwcAZ/ZWiMUqYHVKQt4TpSXd2jsKVdi5+x5uqKFw5GBM/Pve1UiDxMsiSQNVQYNrAhSpmnDyPExhsr+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN9PR12MB5356.namprd12.prod.outlook.com (2603:10b6:408:105::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 19:22:12 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 19:22:12 +0000
Date: Thu, 7 Jul 2022 16:22:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v2 1/9] vfio: Make vfio_unpin_pages() return void
Message-ID: <20220707192210.GC1705032@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-2-nicolinc@nvidia.com>
 <BN9PR11MB527643D01DFF0AFCED1614488C839@BN9PR11MB5276.namprd11.prod.outlook.com>
 <YscUCe+2sXdDiQWq@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YscUCe+2sXdDiQWq@Asurada-Nvidia>
X-ClientProxiedBy: BL1P221CA0021.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::17) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d77acf0-6ecb-462c-fbc2-08da604dfe1d
X-MS-TrafficTypeDiagnostic: BN9PR12MB5356:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mFJZLbax7PoeopxfrLncHFevgBW3HiW/pPJqJ3DfqzpMd61pUH9070BkofTH92OMJIi6zX0b9hQqqwlhhTlKDAYjRsXNcH7IutQZS1l2WrMMjwTz/Yi/B8m+nCuejzuPZuzbxFTkyQrzXbbjXLpVTWoL8z1BGOld83gRHZwFQV7UeutwSnOgFV0wyy7Ul067e8TDc4xcpSKqz7GcozpZoye/5kn8ITVS7khA6l4DmI00+Fv5rViVmRvhSxL0HRKfZVB8Toyk4qZsMNJrL71+kskwgQ7AWAoKNSoeHYLZEtA5u60pPWHjx2A9iQ3sQEztJFXRK1sQIGuxqM8fWPxJDlt4wW8MAhGHBbHZpwQOvbSrzcCfi4JIKZUQ+2guVyvXD8r4U2ePqxM6YJecfZs/J3ZpzqIloWk8Ywd46dJi+cUZH0rZ1rlqQpKNjiozdg1lLjWKQ8Ypi8i9mw102mTyAYbsU65QYKeHcX0q6egLOxJdxLzcn9hKnibSF5vUFH9REY8DMYc6h8k0t+hrvBFMicUHElcBFvjC+Ji86dVS/3WyQssHUTb+UF3jE2aBXQD/X3vAAhp8oUojU1+UBy/tTyKkc1POF851rBUSjkfybBFGrFhSiT/t3AvhnExyTG1lIYxYu1WivJTqlnR6kfAthMlJTrBrYaN8i7WwCyBmGKY6G8dfx+bEkpEFXgLhdkk9WMqHsiHyV2L2HO0MVCvlAPE7bV+l39l0Y7qUW+NZAQs5RqoWkF9SPBtdKsSzFzN3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(5660300002)(6862004)(8936002)(7416002)(7406005)(2906002)(478600001)(2616005)(316002)(36756003)(86362001)(66946007)(37006003)(54906003)(6486002)(4326008)(8676002)(66556008)(66476007)(38100700002)(186003)(1076003)(6512007)(6506007)(33656002)(26005)(41300700001)(6636002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jF1/8A1FHJ7j2dWlgRykwoY1bo9vIwqw07ZoGM9pv7pjLVd0zEJpSZTdtR2a?=
 =?us-ascii?Q?YyiAsnSH5FyCTO5wXHbuTNFmq7EyjaTxGSjZNx6MhS1qHndPZ9aICNQ0XyBT?=
 =?us-ascii?Q?ZpCviYEQFYN4eh/4bOc65JJz/Z+/aKc8MsmKU0AG3b7Ggc+jxUBeu6wG9wgv?=
 =?us-ascii?Q?hssBWqqEIjPvjUMNEANZVeef2rrLsLfj1IrpxR86g3HlwPyHmqc233EToZCW?=
 =?us-ascii?Q?tfmyIdSVXIgRFDQReAidAYRo9OedJxRN6V9tJkj1p89Wxo7BfdI2mbVw8lOn?=
 =?us-ascii?Q?AVe4/UBGi0nNJvk2lBEFHPkZE24UkrcZvFz50RfesW9m4TNBZBo+IpA0FVHL?=
 =?us-ascii?Q?YY/zkcN4DB7e3r6doQ1lvf9AA6mJA0u+JSjHNhCe4P5Y9I6p9leilesjERJ9?=
 =?us-ascii?Q?zbTtJ7zX4lb/S6ibH+hp79hZjzJIdGNrqS6+CgnzkewaQle8O6qF3iIlzyvk?=
 =?us-ascii?Q?WQgD0vfrbZ4PxhmRltcXeqe34IPUY3h9GlLpukLKAW7LxotJbicwj7BoK38t?=
 =?us-ascii?Q?xyiSeU6aDg2K7VM6rt2KapxYwmpkCOo95XjidRCAq4L7bS/F9XptwrR9Ujzg?=
 =?us-ascii?Q?x3rBPcKJBOoxb4MJEbubVfxfRxJD4IWN498bRTt8ibrN6hL6QbmlT7QipLfm?=
 =?us-ascii?Q?sV0dtQWe9VXxF6SZDGie2wLhZKDe2PgblyMKAJ73HpEf/IyarXP2K5YpIccA?=
 =?us-ascii?Q?Zpaeo/ku0ExA7jJPKkDT/OcxZAY9ZiW1K/upf72Y0JM6IWDEA5DM9T4/FOHV?=
 =?us-ascii?Q?n5zxFLNQOA4RdWKv2FjjoAkOuuje7395Obx9gJDt1fTGpyad+FJ/qvnDSQn8?=
 =?us-ascii?Q?HKIDR6+yDCrnl2mNzs/IlXTrZ0y60UDrhARPFbfj3UOWwvRCoQEKl2VJZaFr?=
 =?us-ascii?Q?CDpsFX5gLHEcR8KTDNn8D+PhUX7WNkG25cUnB+VWMKAEBt40TXBBAzmdleUI?=
 =?us-ascii?Q?J078dXepbV3s6UXaARCGhVBFprYYgDVly3rXqYo1hHN7ZNYf0L1yYoH225ZG?=
 =?us-ascii?Q?YYVBScHghr/zC9ltHYh7NuYrfSs1PUZ9JJ4sV7Fn8zgZ8LRMNa6iCWZVXDwC?=
 =?us-ascii?Q?N6slXKtD7/yt6IPi+vUvG+Gv5FPOmaSkoYQjD187q6+NJG/2AsMrJTLGEi0h?=
 =?us-ascii?Q?MxsUOba7YS4McjBDEzo0ncXT10Zw9UppRogmRvEL0MYiGusXyonKQbpB9Egi?=
 =?us-ascii?Q?92Y3gAq6LZIHcVgKiCXmhflHzwZ8FRkZadGU7pfSIP8Ao6RWC0v8KXJ8oXYI?=
 =?us-ascii?Q?TFfdvUuJA0S2QcmZm36MBCZB1P9ItEyq8nSN6WG9TAViJewNDkDlm/O6hU0k?=
 =?us-ascii?Q?aonLjdN+lXTcd1FZC+J1AO4gaDTfbwpbW+RlJJsnrFrTbwzfk/Otrkq/bjJl?=
 =?us-ascii?Q?vIe7tT2CtvtZn7iHc+SQbvqkjgiMewLDNgmxv72NcWSd696NnNdMN+92R6eG?=
 =?us-ascii?Q?1P9Nv5gXhyDG/z3GQsXV/2x1pbVMiuOtEk+Z9eFjHmvvQ6dLgANtBikSCiuY?=
 =?us-ascii?Q?bkQNcpB1nLMaezV9I0+bNog/6+QaNZPwDhXvE66yIMqOP/yNUrop6UBY5z/B?=
 =?us-ascii?Q?fyiwKldxcM/gjSUh2ev/4fJnDIJcwg1b83k4XRfI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d77acf0-6ecb-462c-fbc2-08da604dfe1d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 19:22:12.0659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnYLcPKap2Yo+nbneH7AtiOGTd4OnrgZgfQb+neATLKXpG5zWO/VImmS1JAviMzS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5356
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "vneethv@linux.ibm.com" <vneethv@linux.ibm.com>,
 "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "jchrist@linux.ibm.com" <jchrist@linux.ibm.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "svens@linux.ibm.com" <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 07, 2022 at 10:12:41AM -0700, Nicolin Chen wrote:
> On Thu, Jul 07, 2022 at 08:42:28AM +0000, Tian, Kevin wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > > From: Nicolin Chen <nicolinc@nvidia.com>
> > > Sent: Wednesday, July 6, 2022 2:28 PM
> > >
> > > There's only one caller that checks its return value with a WARN_ON_ONCE,
> > > while all other callers do not check return value at all. So simplify the
> > > API to return void by embedding similar WARN_ON_ONCEs.
> > 
> > While this change keeps the similar effect as before it leads to different
> > policy for same type of errors between pin and unpin paths:
> 
> I think it's because of the policy that an undo function should not
> fail. Meanwhile, indulging faulty inputs isn't good either.
> 
> > e.g.
> > 
> > vfio_unpin_pages():
> >         if (WARN_ON_ONCE(!user_pfn || !npage || !vfio_assert_device_open(device)))
> >                 return;
> > 
> > vfio_pin_pages():
> >         if (!user_pfn || !phys_pfn || !npage ||
> >             !vfio_assert_device_open(device))
> >                 return -EINVAL;
> > 
> > It sounds a bit weird when reading related code...
> 
> Any better way to handle this?

They should all be WARN_ON's, that is the standard pattern to assert
that function arguments must be correctly formed.

I would also drop the tests that obviously will oops on their on
anyone, like NULL pointer checks. This is a semi-performance path.

Jason
