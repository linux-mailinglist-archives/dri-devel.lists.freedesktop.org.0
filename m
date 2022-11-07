Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 084C561F4B4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 14:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B302610E30E;
	Mon,  7 Nov 2022 13:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AC310E19F;
 Mon,  7 Nov 2022 13:57:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTDF75lUZNeTe+uNLtwBt+mDJXP+PcYBe0G4/s/bBwukVoHDvsrpDW0hlJXuHOcxIi4xeR9+9L6u41UiKQa9SvtiDYPHG04SM+3qFQKKh019nRSoOyYfqqjxSgH8PZX8HAQAz2kn1teXT+J4PHnJHGyfQzFTwrqk2Z3DyKyTxWvEwjHLtHCKxSDb55cbxVRaKKKQUN3UZqhR+YTz99GHe9cE2lIGEcuSTTbsS36sCpHKJt14jR5Dnp25sYRbU/ZXhlI+UfsqhnbWj/FQKdfV2J5agmPPIX1m7Gsez2U0VDsPAKGsHseExRD1yOcwr+PSPQ8zMdzd5i4XdjESJkpBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tya8+SvfMvAXd9qxFtkwJC29M3FyM7z3cyGjpEOpxWw=;
 b=d2UO5ckJCImY3qbEyIPcBlcAywQJfzpcFiFaSdtJI0asZCbmICda+UEnZWCTJgHHob8CT3ww7lr54eWVPYf+xHFTiUlw21vq0jvGBlvO0A3RSS44XuyeDWcNK0yrBA0gb15xDfyt8635q3ICPbJ3DKsFlljKRXXCgiBRSsHn18oHQvGeBLe/dYobQQswGL4LW0kJvOVI2ZkYU0D3x2G4bVV9jWJf2aHANDSONh5EnF+CLZCQcqya99yiNu4zAp3SUIEj62+BcylcWwo2/dbsruaV2kKGfOAsyhvFV4BtGRQk4LBqBQoyu4cOIXp41rPQ5KbDg0vtZMdJpqHgQfiHag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tya8+SvfMvAXd9qxFtkwJC29M3FyM7z3cyGjpEOpxWw=;
 b=qukudt3NJIelbLRc1BFw2FpZUq6JkAMep2MXNOtzjWiF8HEjujuScdSmy3JnDaw7ewR9LVw885hk1YZlIbcyHQoFu8w/SdAsPjxAIAdh7/yBBkj2K1wtf0d/zo99RTnRtPkPUXDxw28agXjdt9jaYo9404MuWW+XPbjuN7V5nQtAkfZomNw9XRgBl+ViXGjUhEt661Rt1XqazEog7RVoQNygA4cZ2ADBSznZHWNEE7Cgyno3fArkFiCtSyFFAbhujXBzWXDCI+Yzk+c3UolFv8XBw+5PTPb5kaWZLMNBC19U5ZUh5nhdkEBZ18/cFoPdbcOuZQCwGfYcEWDlXjwNoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 13:57:43 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 13:57:43 +0000
Date: Mon, 7 Nov 2022 09:57:42 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 10/10] iommufd: Allow iommufd to supply /dev/vfio/vfio
Message-ID: <Y2kO1njmu6sU55S0@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <10-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026153133.44dc05c8.alex.williamson@redhat.com>
 <Y1wjFNxwPRm7S6yZ@nvidia.com>
 <20221031165311.0698e1ea.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031165311.0698e1ea.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR16CA0012.namprd16.prod.outlook.com
 (2603:10b6:208:134::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: e4253e08-5b0a-4d12-ff21-08dac0c80aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pLWpK5RTvTKtso2cPOgsl7sL6oNQgOkyo4NA83/AeOZDL/nvyv9GMJdpWU3aIVpyBGLobaB0+ScOWzOwPtW39hVOaQrQFMWrMdOUYpqRXHKZ/ipIj8Gzg6ZokMQ/3ejRlInrfk6TpIdCq+67Q8AA3OmBzBki2JeZ88k7dih2LCNYNNcG+iHhLFAOA3LFJxVV840ay8pJ4ndixIjqxqu5XOPB7AtvxdhFoL85Ulbxx+ZNp3FXx0OD+BWswlKrmRXHrvvF1DvfGid4CZlo4wvh4KNXeDAXCRuSTaNJlIG0OSG7LJbALv6IIgfRHzmjo/G3wPxx5GfAz3cVmw9jfI6LJj7qLSR1Wt2CSuQK3EpxnawtwNQrd1dd5SVQeQqDS2qD2oNMUJ4tnnc99WUEOe7F1D0Kn17iPFlHmtSpiHaJi1dDNk7nSXvj2engjISIS/sXhnFBKxMNDLx3AZkao9xKllXSsCKzAsoX8mQlvxJ2heneHzUWsL/+CWQtfMOwab/FqUHqDWAocliyexChTddKregpqD7PaO/jow+C26i6cmjEXUxfamHRsDsv8Kymf8GTnZHgSmOfTksMjMOAzyFJOSZr1KEAhR/HwAgeV/maV/S8gZpcaxkjaTkq+GUCBtSliNIKA4oyqHa4WfEYQW10Zv7OlVN+pGx0iT9LALgmOT50KJ6Pw0HXWRHYOZRV+tg+X90W0DG3Oqv8be4HzXp6QQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(451199015)(186003)(6512007)(26005)(6506007)(2616005)(38100700002)(83380400001)(7406005)(5660300002)(7416002)(2906002)(6916009)(6486002)(8936002)(41300700001)(478600001)(4326008)(316002)(66556008)(8676002)(66946007)(66476007)(54906003)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FhrspaPtonHLLLLfaJBGNlVKgf7AkSUqqyL4XFWI/z1at0LMdLjhQKv2uOFx?=
 =?us-ascii?Q?FUkoAoXN8BvafY/UzVCTSUnEh6WWlMxnuguFRd04s+OEwJB6chHJGZNAV7bA?=
 =?us-ascii?Q?vV5McKnnMX+FuSZAuxk6ToIYcaKFjaGyDrQy/ZueYC8YBfW6wWjaCkCdWt/g?=
 =?us-ascii?Q?8nUZZKVLvYniqwnHnGYTotshtKSgmlAIdXLBIWa298lI0FitrRdZc07sZ0Dv?=
 =?us-ascii?Q?EgXlVKkAWpD8PYT4bgkRrK5TGvxZ2jBHBgGZ1uvGajqAKbXM9nisFed8ZX3J?=
 =?us-ascii?Q?ac9/iQ1B8nGRzRMak0ybCg1TKvcK1wM4TpPq7mtz15lHAFLW4yW9GZjYhqjp?=
 =?us-ascii?Q?Mi+ld6RfqUnTFVGM62Ma+W0lNPDwStSSrxdQ5zbMrswg0et9S1izYAkubrkl?=
 =?us-ascii?Q?wSxwXDZVUJRIy8I/PCI0rza735+xepnavxD/r8xHqZvsbMPKbrcztCBXOqh4?=
 =?us-ascii?Q?tQNPj1/Hx1CAjEYQPQ1DlCMLWrWOhJvBSgWDWf0osHeLqGj5+ngn46AbmNMM?=
 =?us-ascii?Q?o4H6t+8NaZze1mYdqrfzlvCC2IZ6FYaDmNch3qqRvT4LMcXzIXdrYdsrp3uy?=
 =?us-ascii?Q?K4+CGTokQ3VoLFebstDXEg71HhlrkK7BP5xp7N68z9yCdP4pzmIlFOwtKS8t?=
 =?us-ascii?Q?etbPYY5o9u4+1f0dPYAAsrhUSLv71gpDxbdj0v52DHHUfwlK1Mqg7BWPQROn?=
 =?us-ascii?Q?Dmc2gtEs/KSJftNVk5Waa8VCDxXl5rwS5WkFKbAqJsiOpY6+4f57TIprSaw8?=
 =?us-ascii?Q?/kOe8CkFM4xE0j01AE2vXM3SqrJv/W6WDcsRa/CVn4WBDifyWbQ1+SaYGh/b?=
 =?us-ascii?Q?fHsBXabk2ERsU0pEB+5WMRq/t1cKpZ2yyWOl/YM6KJZotzTHxtFYOfBTdp59?=
 =?us-ascii?Q?NA4AwznCdVedHTy/ke2G8v4t0v6YAZBgSyJtLK9aeM1QHDNGuwsqwcJce3BL?=
 =?us-ascii?Q?fRBneilylG9hlP7atHccQEMKRgXp31/Pl75VQHM7zXy5EdfYfTlLVl4ayAGF?=
 =?us-ascii?Q?ElPP2zFqufxdzmGZ9s0NanIPrYsP4V1ygxX93JLhFEUZqtTjrWepJmFg2SB2?=
 =?us-ascii?Q?IWuhk0mnHXVHEkpWoBH27+EHCXwlaTfBVwHdXrk0IXmsu+uhaHme8afOmufb?=
 =?us-ascii?Q?NcDyJTaTVj5KKkGbrKWyTheJOYH/N0vTyG65nVEE95s1q5BC3ypYtdyORg6N?=
 =?us-ascii?Q?H22SAn9LTU7v3UYkb6zVITOOlkEcDBWLUHry4n9PdTa9OCbhJjpKu9GFe9ja?=
 =?us-ascii?Q?wAo9+mPb0Z0axGMzIKhfc9YctmvKPalyQEhYkBOA3PUqn/8OBQ97E58LK54L?=
 =?us-ascii?Q?7kNZdwMlFBk1DAi1nX6dOcbfO4FjsUi40g6uFZNs9Xwukv6Myy0lvr9Naj/G?=
 =?us-ascii?Q?NThle6C1MkOehG8dtcP3S766T7ZEcpgR6vuZ7WGeLvzz7tWuLRF2d88vlOxt?=
 =?us-ascii?Q?WxhKrzNo4xNpMLLxOGcY8fAUq29wx7x0TIPihqM/5ZXSX6zNREfk+4qukX2t?=
 =?us-ascii?Q?3XZOydj6slv0dyNtTfsiDlgS/3bZWxA6NfsNH0lqCMO62Ocv8AVBLok8KFs1?=
 =?us-ascii?Q?hovDRp2kGcMau3I+ewg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4253e08-5b0a-4d12-ff21-08dac0c80aca
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 13:57:43.6538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxVWrO8NCsDj9oMUJo2GGb3Mz9lEP+fbHvCvwY4l/6dANepnFB1fhfrnVjmBGPK3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042
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
Cc: kvm@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>, iommu@lists.linux.dev,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 31, 2022 at 04:53:11PM -0600, Alex Williamson wrote:
> On Fri, 28 Oct 2022 15:44:36 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Wed, Oct 26, 2022 at 03:31:33PM -0600, Alex Williamson wrote:
> > > On Tue, 25 Oct 2022 15:50:45 -0300
> > > Jason Gunthorpe <jgg@nvidia.com> wrote:
> > >   
> > > > If the VFIO container is compiled out, give a kconfig option for iommufd
> > > > to provide the miscdev node with the same name and permissions as vfio
> > > > uses.
> > > > 
> > > > The compatibility node supports the same ioctls as VFIO and automatically
> > > > enables the VFIO compatible pinned page accounting mode.  
> > > 
> > > I think I'd like to see some sort of breadcrumb when /dev/vfio/vfio is
> > > provided by something other than the vfio container code.  If we intend
> > > to include this before P2P is resolved, that breadcrumb   
> > 
> > I don't belive I can get P2P done soon enough. I plan to do it after
> > this is merged. Right now these two series are taking all my time.
> > 
> > > (dmesg I'm guessing) might also list any known limitations of the
> > > compatibility to save time with debugging.  Thanks,  
> > 
> > Yes, that makes sense.
> > 
> > Do you want a dmesg at module load time, on every open, or a sysfs
> > something? What seems like it would make it into a bug report?
> 
> I think dmesg at module load time should probably be ok, every open
> seems like harassment and sysfs would require updated support in
> various bug reporting tools.  Users are often terrible about reporting
> full dmesg in bugs, but they do often filter it for "IOMMU" or "VFIO",
> so keep that in mind when crafting the log message.  Thanks,

This seems like the right approach, the message comes out once when it
might be most useful:

@@ -176,8 +176,11 @@ static int iommufd_fops_open(struct inode *inode, struct file *filp)
         * For compatibility with VFIO when /dev/vfio/vfio is opened we default
         * to the same rlimit accounting as vfio uses.
         */
-       if (filp->private_data == &vfio_misc_dev)
+       if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER) &&
+           filp->private_data == &vfio_misc_dev) {
                ictx->account_mode = IOPT_PAGES_ACCOUNT_MM;
+               pr_info_once("IOMMUFD is providing /dev/vfio/vfio, not VFIO.\n");
+       }
 
        xa_init_flags(&ictx->objects, XA_FLAGS_ALLOC1 | XA_FLAGS_ACCOUNT);
        ictx->file = filp;

Also this is needed:

@@ -446,6 +449,7 @@ module_exit(iommufd_exit);
 
 #if IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER)
 MODULE_ALIAS_MISCDEV(VFIO_MINOR);
+MODULE_ALIAS("devname:vfio/vfio");
 #endif
 MODULE_DESCRIPTION("I/O Address Space Management for passthrough devices");
 MODULE_LICENSE("GPL");

Thanks,
Jason
