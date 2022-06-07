Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8C853FE22
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 13:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0488A10E142;
	Tue,  7 Jun 2022 11:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EED110E142;
 Tue,  7 Jun 2022 11:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6BOK94bu0jlw7S5xtB0luy6zo5XUCFfYm4TcJe1cGxv9hZlQYaCnXQqfVajbv6SHwgnfd5m0CjI4uTbN9aQzet8prmbaoh2BpBxRJFlQsEAgvzeeby6jzxLpEUCEwXWtW+p16CxKm/0706jvtPnXBnruuA3vaO/naNxqGMqwb9u8i767uHkYzSNMwTwL28c1d3hV94Pdjnr6XaNXbXY4vGcWnV5jrBKsoLZblg42GElIoxgFlhhj6WD0ahB4oadmKqdsbF3mmlbYmGIrc22M1H/dYu6Yd7N0IxfWRehDqvmGHBdBPb7yxTeaPDIqVgvYx7Nqbm91yYsn6dG64X2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2cQAhR5ZQwqsiYj1WGRSX4+I5B6hETIAm+INThvVuM=;
 b=a+vaSBshROMpde5cgZHV3v3dyX5RfqcJHucvoJwpXe1V9njdJ5Y+7TN4Z73S7Vjoyi32IInBMSwTyLn0NnEJZEwSSbA0kNGQgFT8JGe/vUE0zvS348MofRPh86QO7QrmCGaMIb2pYpOrxRS1UGAdUp0nPLK4WtW0bLu9Q5BRmEqmzceFpsXBEMbF79gn22mJd4EkGazm294DIhykmSlqpPOgw0kmt2cK6I0GltTEhR3L2PpW37rDpfdrtELJiWT2gQwkkiPLLgAc1DhVmxRBT1by/Szb6t/WApdJAjUh7e2gHZnsqQz8l+RnvWiRaXpHiEMyjj3oOiVvSyyrwBnR9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2cQAhR5ZQwqsiYj1WGRSX4+I5B6hETIAm+INThvVuM=;
 b=HQSUHs+bonQscjgxFNZvnvqNh7zf/gvZK3+poS54KiULYSx2yyE8aVq31GWdQjq2P2bCweuIfXrYRRXKuy8bC9K9f0D5L7IcOER3FbqDDRAxnISzViSuMyhuKCFpOYl0q+kGMFsFkBtU7y5oPxnokf6RM8fR8nX6NM/n6kjFu/okE/l5R9T7BXo7ZIDuG/EY8SA0UvmUiNORsDx37Xb1SJzumZyRj/CqsTNj2xS/QbDj23IWnkGlVJXaWhag2L3aDvxmALzxTkvtxmepDLwl5eTqxCZWz7hBe0Zww9Z5+9ZJNm7hsmMR/MBjRtwByhRVPOo6C7Z2+Aost+jlUK1itQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB4403.namprd12.prod.outlook.com (2603:10b6:5:2ab::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 7 Jun
 2022 11:57:53 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 11:57:53 +0000
Date: Tue, 7 Jun 2022 08:57:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Message-ID: <20220607115752.GG1343366@nvidia.com>
References: <0-v1-896844109f36+a-vfio_unmap_notif_jgg@nvidia.com>
 <1-v1-896844109f36+a-vfio_unmap_notif_jgg@nvidia.com>
 <20220607053955.GA8508@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607053955.GA8508@lst.de>
X-ClientProxiedBy: MN2PR20CA0037.namprd20.prod.outlook.com
 (2603:10b6:208:235::6) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2bf1cd1-b5e5-40b1-ad4c-08da487cf3c8
X-MS-TrafficTypeDiagnostic: DM6PR12MB4403:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4403A989A15F06B1A0E3D77DC2A59@DM6PR12MB4403.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BPOBOUn890IgphWsVYnynSwKtqJdyqfgToRVbR5t1tzfli8fvOmvADSY73vt2xsk/rpdd7+gaIgGUCplIq0peQWfb8ncylcobsHB5sCUBjRzybxzgBXgAaGX8+AKsweoXmrXMLdgKl/cHqIf1Mg4rzetVTTHP5bmPdjrD9NbNe/Nm53b3S5T88K8PvqQdd9KFuMFbUZC756oK/YRrUi7ToKamCuQfWsCv4dJDW3mO11YptfYaknOFKR+ETLsNL9uExnQe8skB4obXAUpfPQUJNZxy1RaB+YKOT5JKTVOXjLLsmgJtEkSaZw5zagdUm+j8KDfaIkFyPB8jnyyx1CY5G1cMvdIdfklFJllbCfY25CI5A8lGAfCnCfR/Y+m0Rgs4sIOgPVlfndvlDLz4qeduovlkrFYgpuBx6UNUeG/g9dcRwf42OwaXco6DkMVmCbsnsf4sDxDnXEwRXKR8RDfhR7m4l5oCzp9HODHqxRnmC/PBcwDNPOSXF5O0CEk4UFh6WCWnvjewu1IFqiBxNwBKaSNE/mRTtaQFoVP6+zaxMNhCXBLMJjS/v+nfFM4NFQFcmh149/Tj+2Q68YGOHOJk9LCMPCj3Zfs00b9dffNBieEZbyfG/jByzlEYQZGCGi2965jSQ4NyukByA54TFUCVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(36756003)(7416002)(83380400001)(508600001)(6506007)(8936002)(66556008)(8676002)(66476007)(4326008)(66946007)(2906002)(38100700002)(5660300002)(4744005)(6512007)(6486002)(86362001)(6916009)(33656002)(54906003)(316002)(26005)(1076003)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TDmM+j2g69OoW5t7F74P/IJ+qdQ8d+wqD5W/lrHrVU/USVcfubZJsGdZNcXn?=
 =?us-ascii?Q?ueYhs8Xq5foR/CgNE+LCKfHrdBBd3xxkNtDa20Xcfg+mLuppVi7+8F9L3G1W?=
 =?us-ascii?Q?lUp5Z10ypTUtMu6HrpUhNH1LWKre52H5pxM3cUgUw2LnAYEQ49mckOBHNsSd?=
 =?us-ascii?Q?qnj1hrdtd5ewgMoQJ8tmEbUh3PdejxAEiRu3dowEC4rC8MG+7PXIU6FByYqe?=
 =?us-ascii?Q?bdXkwhZ+uXlGXnSbVG3LSi968jgWFnvAzVcws+xwQWuMt/J8R4avD7LCJsqr?=
 =?us-ascii?Q?Go+izA8xWPvV7UvZVONuQMbf7pr9/UppPv7V6/ows6AKUcNJPaf76hj7I1YG?=
 =?us-ascii?Q?4dBbIx5djzAvO+6CYXp30y9o498/KJDi6qLPh963VGiZH+V25v7pHSeSPbJ1?=
 =?us-ascii?Q?Ag/4nKu1TPnHVNMY7J9QPwMcQwJoIXCEwqGNbibLwfcrI2i3aPyiZ9T/HZBP?=
 =?us-ascii?Q?5ZTkE/k3xZpqMWXueYJ5HtidNkLaYsYnHFv4XPTUxmizCpW2lGW0uIjQmVup?=
 =?us-ascii?Q?hDouZDHVPbAehq0sBEZiUaHitlzNJT/8BD9VQMZ1NRPXW5LAj+2zgNhiJIuB?=
 =?us-ascii?Q?1P270r8MCRgondMRJijH0iv5IbvdzJkAlu3tvbTj5iIACSVrIyL5fviEV1Oc?=
 =?us-ascii?Q?CLaUwe1ZNXNY9ARAHtRuZrDPu3es59OTnb6D9uXaUTq92Pq233Bo8IPtXhOc?=
 =?us-ascii?Q?xPzbcmWPmONppAStyVM6SgyI/OGYgd0SSqJfcmO+wg+x2uYLe1JIAhBOnjMS?=
 =?us-ascii?Q?fLTltkFoN//7yFYHrPQ5l0/vZdP86uWfjYXSIy823ic1pdUTpWW+j2K8qqfB?=
 =?us-ascii?Q?j4GiuYWUjK9pBYJtN1G1rjmscYGo5bZ+BWUtivSyP526mer6pDz18zn5FoUU?=
 =?us-ascii?Q?rNBIZL/iyj8EZbf8tF+/5P4wFQsd7jB3Ve3NbWM3K6r6hlh0/FspQMtOlcJB?=
 =?us-ascii?Q?9YRpocZUXbxz2WZfciWH7KhEqyZUF2hDpEtsPktkQhJ3DvYNzkPuxjmIKO4L?=
 =?us-ascii?Q?PeXo+9Hx7zPVk6NzrgqZKpoGb7GfQgIc0SsjmOBNPoS6REAnkRvr3BgJqMjU?=
 =?us-ascii?Q?/LigsHeISdVyZvWjp0vyqzHLpGFzYXisEARPMMBczzdbfKhHo7lUgeQNaxWf?=
 =?us-ascii?Q?E49rKYM2s27ITHksRu3sx8xtQ9HNQUKL00zH+eDQy0NAYDSI9cW86/Zmd2dC?=
 =?us-ascii?Q?+PBgnBqANr6palpUOthXN9PtoRjfKtW4vTA+bDfEaHf9u7l1M6rjcrUvb0Wk?=
 =?us-ascii?Q?flAayjLT0hL5kYfcuSKfOa2JXay4yCOepeCHdWYC9iJeqR69DYi8++VNqu/Q?=
 =?us-ascii?Q?XgKtnSlWF1t7fhMzI5kCeJO59cSShV99wHgDmGDKOp2ODmBsvO+DeToqjUW1?=
 =?us-ascii?Q?y7bhkZkyUGG4fQFFeWwGjyG8b7koJwE4/wXxlWtXXC5au+7IHDHEz69Or+SX?=
 =?us-ascii?Q?UZzcdCk9d34HQKb3/4Hm6prp9P0bLlYOQ1G3GU9xuOpJ70CRxv15yJTSHLa9?=
 =?us-ascii?Q?jAIDXf6ZuVy9yQiEY1ifX1l9/AO3pvGcOL8pBzZvjLn6laxZx4ReuMMsufP+?=
 =?us-ascii?Q?uX4e54GfCyPnAbsaImi5+e5Bwmc+8s6lmpd2FoWMLjo2U77QWznkuy3y6k20?=
 =?us-ascii?Q?2DZTODtMku0jsJco8+ksfu+A6BXgnQ1AZMZUTh0LAtpxmpSW1/LSt0aZCAPO?=
 =?us-ascii?Q?N2TRALqy0lGud6crDotCAK+Y1YmXvp6knp8IvzLMvrhE+lEQ2T6PcjguoZQM?=
 =?us-ascii?Q?AD7ADe34pw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bf1cd1-b5e5-40b1-ad4c-08da487cf3c8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 11:57:53.1368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkeySzMJkycOiXPSI07/pxTWXS2mCfxcpOSB6a3t2bGc3yAHGvwgwqgTFikRiyrI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4403
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
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
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

On Tue, Jun 07, 2022 at 07:39:55AM +0200, Christoph Hellwig wrote:

> > +static int vfio_iommu_notifier(struct notifier_block *nb, unsigned long action,
> > +			       void *data)
> > +{
> > +	struct vfio_device *vfio_device =
> > +		container_of(nb, struct vfio_device, iommu_nb);
> > +	struct vfio_iommu_type1_dma_unmap *unmap = data;
> 
> Using the iommu type 1 UAPI structure in the core vfio code for a
> subset of its field is kinda weird.  But we can fix this later.

Ah, I did type this in at one point.. It was small lets include it in
this patch

Thanks,
Jason
