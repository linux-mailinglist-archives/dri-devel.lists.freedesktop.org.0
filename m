Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE652544FA7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 16:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BC811A43C;
	Thu,  9 Jun 2022 14:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656B711A40D;
 Thu,  9 Jun 2022 14:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZXG7IMAbMYBNtMOj4KqENcdobi/8XRnQPN9bT2e++H3gfckiq85v7dcNw+CKiO3EbYS2eRI7q/EC09VRLenR1GkjSOHWi9JeCN0H2BWcGoJbi3SWSMn72wF1h8nsHwraeZEcrtUdVP+C45OCAETd9I8Xoi+0GhpqBMC3BH3wvoTvdtIx+WCUo61T5bwaojZu2mwXafEP5lPf3A5JI3ATAzOvELxNj/35Iye+Au3XWrPsECJjcHYUIhIz+gmL2LN9vKCP6tQ3E/62FSdVvctjIDl6/IfhiEM2FqFXiO6A8ns7x2Q3cVuCaxjTgKt+Yiz+a7rsFiugGxdoJiYEShqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdVDLVRW83SzwLD7SNCnAsAU5EMD59e07qHay9VL05o=;
 b=DQpoE2rdGutPVmdsxSB892xuRibE6+cYVelwoX7FIHx6U4syXDiMHPLo/adxT+EPDa1znwtwETqZAKlALqYcauXeG98ggJpOtYnKvtzFEtV8ONU7MteODt8rf4Lx2bbT2m76Ux35pfLVYyCvEa2gs2zfniQhqAw3GDstYXCK/1IkEN+uPI+fcajZoSlHxIQJU3dBDuxjfGK2ZBJp4qf8QqTxUDwhtKV+i8LLdSrlQY+pTujnqPdlelwVgdhDjL5YXn0vEltr6dnCBd8DevpbpJa4mIcu0UyaM+Ap8s5PIYPerRqfq5BLTOVzpGfrifLDHVmC3466dWqyMRB9zeGQjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdVDLVRW83SzwLD7SNCnAsAU5EMD59e07qHay9VL05o=;
 b=FVgfZ2GVPFrXsGKuybuNCDmPoyqgz92yyKELL9Fb2HlV23L2GpwLUpOcplfPXWGT57wCQOLbnUu6h5t3CYB/L/r+kAhnzb59WZG46Zy5uga88AbQAkbXGnmLKPFtXp07upIKqRqlMZrWxHApfarsdsTH6TCSgLlUQ2kvEvEWOYfLryrKdayCmpDBp1T9DU39vTO7hhvQtxSRDESGhA8NjhexNGh2OuWc2+MLl058xME9/6gZpC2UYdSldasN5KV0B93hn6toc6vVcp6+QJLDYtcb1D3TegCI/uCv+Sr2ZKX4FNOHKTHjy1sMkXAQM/6peVXSsnAJZ1ulT5Jvo64hEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by PH7PR12MB5688.namprd12.prod.outlook.com (2603:10b6:510:13c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 9 Jun
 2022 14:44:01 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 14:44:00 +0000
Date: Thu, 9 Jun 2022 11:43:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Message-ID: <20220609144359.GB1343366@nvidia.com>
References: <1-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
 <1ae0abaaa4fc7959ba25cf59b3ef0da39bfc7f36.camel@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ae0abaaa4fc7959ba25cf59b3ef0da39bfc7f36.camel@linux.ibm.com>
X-ClientProxiedBy: BL1PR13CA0241.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::6) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63c6653e-4568-4205-af4c-08da4a267d86
X-MS-TrafficTypeDiagnostic: PH7PR12MB5688:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB5688C39E2101CD5FEC84AADFC2A79@PH7PR12MB5688.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +FcR9ZMGfmChq0p2hd0/lCSnZOe8DMcmcQDXxdiflCpQ0kOf6vsLclOhyXweT+cPyPwDr6V1uqJGsTxYm0B//CPjRUYDybAb0cg5oNk6OgJ7gmxhuZpRQasLi9Z2+nYFjcRjEqKckCj7eXkzQRRt2wMlWd/0D95WF40toT0X8LJCBiZ/uUF6grc1X2ArcFbBCkPMXWCgV1cM7TzxWZlfnYu1SYtSZw2IPZ3CqeV6NnaMcpIytlEGUf3wyo5ltaPHh9GqwUNIwZM2yNkyL1eJHsowFEygTHqepjrmty9NUK4hpbuJVgaoP+5kvNSYAv6oM5ZoDzBNjV3VeyLTeecPh8FMBnPHJ/kcMUt9qf9iAkMNBVehEiVGFp4CEPuLY77zZL+yZcn38PI0Qo3aNLK/eqzJZlemg5Ity6T//CNnlFjSMPdkVKOpy4UeXLtkIG9NXoC2ccrmvwZmypaARAKrbSUILCBusRRG0ndnI+TigSGCjJaBYgq0F+9+xxOMDw8yUX1HUI9RocjSzl8Z9r5KSyBJMSKYYYv3D6huItotpiDvTUEfPW9EomIS1qxzj1Gfg1dwKp987K3X8RKLdso1U7G/coBWCmJITWxNgoeyq5CUsbssVhDH0rT/9Vo8NwuNFFUj/enfkF3EABAobW6JYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(86362001)(8936002)(83380400001)(38100700002)(6512007)(4744005)(316002)(54906003)(508600001)(26005)(1076003)(4326008)(8676002)(33656002)(7416002)(6506007)(2616005)(66556008)(66476007)(66946007)(6916009)(2906002)(5660300002)(186003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SWjHtUXyoa+86aqacJ4hyGAa4/3ROzE+bfLoDQqS1Y1F1lptGpEzL+yG3SI0?=
 =?us-ascii?Q?4hE7gwPXcm0bOG/UQ7KbapukbI6hl5DBnS43h3r5hcE7nQNRQpxvqEZFNrxC?=
 =?us-ascii?Q?c6Xsf/qwaOS1tfECrRFuQUSjODtuh47WJbnDR7cdMIOPPov4WMPMMp3O7G9x?=
 =?us-ascii?Q?nsAGJDql9eIr/LQKz+2jvpZdQRKpHh77avP7Mo8IQs3ZE3j+XSaz2hekQBU/?=
 =?us-ascii?Q?JOjepRVJwyHn9bEpWK8G7dwSHtIrq41kivFuVEQ8o0h7NWQDAMp0BqZiJffF?=
 =?us-ascii?Q?xJXynY1wDdt5xkg9TIOrf1a0kiAetH02Kk+G3IEpFdQCjSaB2M6FNK7UqwrP?=
 =?us-ascii?Q?R7wtwMwCSV4u2G1G+1Ej+n7XcFL/TChv9bGsGXb26H3QiRD1sIxensDhXZ+h?=
 =?us-ascii?Q?PFdSRg+FfZNie023iuflGnW4ZDNpQi+joE6te1CjBKeNrUMAw2qIHm048Rz4?=
 =?us-ascii?Q?m6yWdo16sT5IkDONamGV7+EG/aRPf4hHi/J4xhNFKpWJMVrZYOJ71Za6IdWw?=
 =?us-ascii?Q?mc3ZsvWGyUPCiZrFOtsw34bNPd/kxtp3k9KqmsR7fdrF1hwYtPgzBsG00nwc?=
 =?us-ascii?Q?dFDXfYTz3VDK8Zxy7mAKVdi5b6eBqnYFjFfoTKp7P5dxNVToHonwnE9KjvL5?=
 =?us-ascii?Q?++KwvvN+lnIdbYkdAm/F7olvfv053B1zsAtpYH1/CTnJSkGgHBQj2XeTjpyX?=
 =?us-ascii?Q?vZFSqEu6Qt3OERS5diJaUUdcwbk+YTkijeSWqgb/Bc5j4MxhrHS7t7iNeQG/?=
 =?us-ascii?Q?Qzdu6HA2AvM39BOF4dIrJpkcDP6URogZr3aDTS1FpRxZ5V5yqOKlj3QrZOUN?=
 =?us-ascii?Q?2m38dxflRzj1kE6C4Qn8/1chh46thYzyFsUlrQCPBLjDQWrYRsoAa/BlQMRM?=
 =?us-ascii?Q?MVP8BGiewJL38XgYQ1j6Z/FuHDsVWUg1g0AXnRWgM+0rw6DZgWqly+qXBvl+?=
 =?us-ascii?Q?zT0sKE7mH9qQAj377Rjw0DcePbKn0zQyBmQctL8JfVGuRnsv1ZuEsTxU3MYu?=
 =?us-ascii?Q?iHymWGdtZjer1UWPffr+Gf/UWxMS4lR7ETWqSa/MwYx1LdtU/IGyiiNzxC3h?=
 =?us-ascii?Q?GWCY8p6GMvNurYx+M4XpA0cY5pcyvrqXBtUV6u5iqrhQkgfgRtxTdQtAKp2m?=
 =?us-ascii?Q?4Y7Z9pvjDq/i5XIKs6FaIkQWDlrkQgMvZmz8RqO5/QGXS2WpD01V8ff+G67i?=
 =?us-ascii?Q?bdwCVf+k4gZ+wijaX0DBnWs7Mx7XPR4C6T33k27lgIg20u7HqPPbJhXWR0OM?=
 =?us-ascii?Q?HY9Te1lDj3zk3XPkjjLiNNTEnO6FRtM0Qpt00XKYC6zP0Hmswnu6UfvPzUZ6?=
 =?us-ascii?Q?NeBxPJjKxnBwdli6PDNUmQwDOyPllqyAWDBJVKIBbghPAo+lLJOYYmjfZgh+?=
 =?us-ascii?Q?xMdqK6jPRSb4eFHcnAxuW9WcXs4x4ahB/NgIusMlkH5n7MVJNx0L4TmDUXVI?=
 =?us-ascii?Q?+ZM3L92T+dMnIBMxQ79iD9Q3RBmGwsgq9nBqXp2Y1ggh0tqAYaX2uBlaITW6?=
 =?us-ascii?Q?q4ncQw8CP3XakMzFrTBvDtBwRw4UKI8tsqOtPXAaT/uoW3XWEPNRS3ylOddF?=
 =?us-ascii?Q?OR4vjeyOi2L1LTKHl9wQtThBgGZa8shdn2uVgpNhDtdi5WXcWtoCJSmejPWb?=
 =?us-ascii?Q?QD6tyV3ID9XR4MbxDRn7u9cWoVDSQcnqCQRt7mjoL2EoICKeNp6RPtGIffUO?=
 =?us-ascii?Q?4JiEH1Y54a1DMjZFW6Ek8pVtDWhEsa9O7QYBwS4xdMglbDc6ME5OQ6sHuKEt?=
 =?us-ascii?Q?rzspeqLkew=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c6653e-4568-4205-af4c-08da4a267d86
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 14:44:00.4674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYECJoQFaIEpdNSF9eQvx9uOiVG5GEsXxEUnr9fSLY9g4hEeDZ3UOwKUzViZF8kj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5688
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 08, 2022 at 11:50:31AM -0400, Eric Farman wrote:
> > --- a/drivers/s390/cio/vfio_ccw_private.h
> > +++ b/drivers/s390/cio/vfio_ccw_private.h
> > @@ -98,7 +98,6 @@ struct vfio_ccw_private {
> >  	struct completion	*completion;
> >  	atomic_t		avail;
> >  	struct mdev_device	*mdev;
> > -	struct notifier_block	nb;
> 
> Could you also remove this from the comment block above the struct?
> Besides that, this is fine for -ccw.

Done, thanks

Jason
