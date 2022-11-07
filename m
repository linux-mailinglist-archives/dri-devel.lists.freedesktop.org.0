Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA58061F7B7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 16:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAA010E3DA;
	Mon,  7 Nov 2022 15:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0D610E3D8;
 Mon,  7 Nov 2022 15:32:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coQKOLTc0Yf7StXmaaO9pSC04a5nph9R4puD9gkA+UML8MlMo4QaacWJXPk7B2nXD5fefHTctaXI5m9utmvcVpeLPjqgFl5qgESj5D8WhA1fwTFLQF/guvw6YVeCKMmaV1NoSNdRmwKNLCKZLNikMgnNDN6sRJTzcYjEPxFFpEwXWCrxPSCY1cJE8FZ0WT7EkY8R/kNiy8HoSYN3d16DTjeG9++9ecW46IH8s1g07Pk4dPOvP5YRR/J4vOaa5QQzr/isZiRKOnmYmRLSnkd1kR11pYOKlM0YN3CsIPzik1nr01jZDxCza3n46fhd9YsSazfyy3zJHB/AwRkb28i5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiS7lagFk80ys8NIHnlOPuTVM1lEyY9faWJ/YYRSo18=;
 b=iSCUVDO57HY0t0SJ7d/pYvhv+C9vAyve7xnLfM2nHthNMZjtIYWyVnpNyrUo+MdeX9rERcEgnh/TLhCBNlv2yn47Yl/LS+NE7dovh9PFfZUmrvrM1jzO4uAkEDJroVmcNbEGJ/sxkbD1myZn5QmRZyY5yZdJ8lky4HawxOYZweG0MS62IDUDvCsXlku4HCDXp4KhtD1uZnAr9O31IUtg4mvSrylNnc308hyNrpij9nHqiyZ26LV2Xsc7iUYByQOJJBPJxBQ9OLGaTu6p7yB1jkH/WrrWPyV4TxiiaQpCQmVW8J5nSOLqUJ2A7RfCeTrH0QyCsaYEqz5TT/9kMXo0yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiS7lagFk80ys8NIHnlOPuTVM1lEyY9faWJ/YYRSo18=;
 b=KqbHgIfeZ+adJeYST6MlRzB7vk1zGaa4x7uIyffOqc3JkUA35WagN4lwSRjrPw6WxVjGgkruGRAY9qpeKic5HS1vMiH/hweE5uMg1Ym8npShVulpwSxfU3Gg1eOEgj4maZrheIdlY2u3u0vnvqAP8yeDXO6Bnk1Gm8KrmPgu492aRzG8xnd3h7Q/s7op2ydnMfq/3ZUiWJRfwqKUYJWspJqwIrDXD+ieCYLj6JKQAt9iBUnY8PKKF7bw9Gmoqja/jHZdfAs7ywDOLsyQBNljfqw4MRPlDwR999PF4Y4ZPnuRZPfFOj9ikHUEeY6OE/js4gwtf19ur6baY/MIpbin9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB7018.namprd12.prod.outlook.com (2603:10b6:510:1b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 15:32:41 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 15:32:41 +0000
Date: Mon, 7 Nov 2022 11:32:40 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Message-ID: <Y2klGAUEUwpjWHw6@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026152442.4855c5de.alex.williamson@redhat.com>
 <Y1wiCc33Jh5QY+1f@nvidia.com>
 <20221031164526.0712e456.alex.williamson@redhat.com>
 <Y2kF75zVD581UeR2@nvidia.com>
 <20221107081853.18727337.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107081853.18727337.alex.williamson@redhat.com>
X-ClientProxiedBy: BL1PR13CA0215.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::10) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB7018:EE_
X-MS-Office365-Filtering-Correlation-Id: 64bef042-26d1-4936-0f23-08dac0d54ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fzs9hnHGCuqmVvrzchPQkMHxnH6yPxPz/EQi/DC1goyCjK2vOA7X435q6zZXah1mviA0iIqVpdHXOqk6+RIYbosWCKIWZgVjE4sq96nivjGYqKiBGq6jxnLYRo9Lzr7ZcC+gjcCUibxcjxwup8KKT6MksLnS25hVO2ehXI/x/2qZG8xHq3PYE77l6zyAotGo6O1FNUsOWufO5T6YDXr9hrLCvOXt2kJeemiwsrXrK3N0/s095QyZ9AEBrha1E2POUkG54BQ/ZK/3SRyU7dG1uMjvb/DGAUItIJFMvIvN8vR3lMea8waWaZ1C7TYdcFeU3jKUBhk0zHn8lVphg0j/pyaq1m9W3ic714sx/ijjBMLbjCslZ3s6+3+kE8vYAuOh+54A3AObgcqyCWjjbsjdLy18PiWDsrlEalvuSUxqtDHPXDAgbNQNUy12qpEWbN5vpkG8h5D9EoaWwnnbMcBY1e/wXweJiCqfq1F8PpTm9OUP4rOFiONSiI4WqS4mijxSssH5o+TLX/8RMe226LEVDBItFbefb9M3JKtrg64bkWatz/YVipee0lqVmBpBkqK3RFtZdU0Ym7tlg+xhIkumrxAtl9f8t37rpB9/GqIh287TX283oXnwsk3Fuj9Dp8w6X2C+BIFNyg/WmlwdHgfQ2QMf3JBlcB2j5XbhrXotER6MmscWvS/SETraqA57puuDFh1eWdKXIKieO0Q2BartVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199015)(36756003)(86362001)(2906002)(5660300002)(7406005)(7416002)(26005)(6512007)(83380400001)(186003)(38100700002)(2616005)(6506007)(8676002)(4326008)(66946007)(66476007)(41300700001)(66556008)(316002)(8936002)(6916009)(478600001)(6486002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Huu8Ir5TtOvazMguR/HkA+tUIrRkvNcV1fMQYti6vQIwN1DIfl3mKTAnPjGB?=
 =?us-ascii?Q?S/ZXntMbtI7WwvUS4I+9zBI1xwiK2xTYjQVrgV2M6DOvWJOQ61KVznEXj3tE?=
 =?us-ascii?Q?hpUpdGE2BmcF/bAdlsy19evlhB9vLXP+Mkbt6/y4Jmb0Em2EI+8wUCChVbei?=
 =?us-ascii?Q?da9jiIIBEZZexxI4mc/Kjq/Xu3iVDpyvm2+2qq1eOsPeyZdz3iS/HVDBnHSj?=
 =?us-ascii?Q?acMlnb9E3rzIfRoRZ4TQIM2BgOv0s0vrB++Lu8uwzO05xUQUq5JuEGrtGzTF?=
 =?us-ascii?Q?kbY4eq/yEYnxt3xZa7pEjYsV+nxbpGELbQZr1kfMSq1bhnS/ZaD6IiWcnf4U?=
 =?us-ascii?Q?KV9XHUfXGwWT5nkFmsa09CW8i3QFEg12jOb1CVRRwGAQpVAOJz/j5emI8LRr?=
 =?us-ascii?Q?K9yM3vnOVEz5q2uB5y26qlovxpypj5cd8HnrHfbWtPokqU0u4sYBlRV8uFLr?=
 =?us-ascii?Q?vE1/09PdxcJT2YtxxC0JKKf9J0UlHh8o93htDZBXB7RVvy9LlFVyAoTe7lgd?=
 =?us-ascii?Q?fdraKVarsQNQntxSxIvzPBmDvXKZDH1NExcwFr6HBUoMs6OgqP9xIH8LkN8b?=
 =?us-ascii?Q?oGNu3buuOnyc4bYFCVQvfrXRBx7sgFj4ubY4TxamszSqQGvRjD2JOKNO0I37?=
 =?us-ascii?Q?DlQASMGJsDlSQnkBziX5sFlqqYObicYozkUQSAFz8AOHUWkgtngM6YgCjXJn?=
 =?us-ascii?Q?Zbz4BHY8MpTLxLL+T1NVPRn6YV6cClp2xvRoTBoUJoLYqWwL2lCeHvHH7ZrS?=
 =?us-ascii?Q?qv1cs2E4Y1V3ls6ajddzLMNfBHx+jSojbd6r0O898RnJ6Pra9Zt764fZLLra?=
 =?us-ascii?Q?CLatJASWa6nypTF3N8ryxuiapw3gQc/lRio0FX/VXC+EYpFfpbMf0UNZ3cRj?=
 =?us-ascii?Q?1AHt3mKkbJvcJXXHHecLXr3rUyN7SjKjMCHnHsoHu/h3aEyk0qEbbBQEcrBz?=
 =?us-ascii?Q?b9XK98I4Xu2KRPSEHxFJeTR33y8PwOSXutEsKQT/u3LSPKgquRDvY6r7nF/+?=
 =?us-ascii?Q?ZMk8nptxI3nQc3QPQhJe+aio8XUrJFiarCpDhlXflvX33fxylfN7qNIlYBNF?=
 =?us-ascii?Q?P5XSNrHolWcHxamonIGw6ji/UdwG83N33/GgheUhgRNZDY7+YIwPd8aCPE9P?=
 =?us-ascii?Q?FWqdqAmN5cEm9YsvQSE12eQX4gVz2I62FvB/Clfqs8HKm/jPks3HT/rfp0TU?=
 =?us-ascii?Q?qaRWTo4CUq0E5spZa6/bt/UfLm3ebYq+KMLwmbHQbqKpoFyY1iGzVuSaxl13?=
 =?us-ascii?Q?zlpElNrcin1ND6HRJl4xD/2pwHI/n7lTSLHuDWVJ2fmts/1FXgEpdIlEfMnZ?=
 =?us-ascii?Q?8gyVAg49J+HndXDrqbRqJoSYyESh1EwGbpNzAhqgI0JrHmDAr9DEFI+vEeXb?=
 =?us-ascii?Q?X9hR5Y19fORS8X0CEa6zDfTYaEEKWH6/78kNl3TU9+luqHhxCuGc1NJ5bYmy?=
 =?us-ascii?Q?HMROGe2MzsumjXrzHKSitZKSxdoCkXJph/o4vf1+mtikmSq6MLkPtdzE2qex?=
 =?us-ascii?Q?pk6QTLeDRsQEjT85PBIz7RoV/MwnZg2Pt1/IW2O7pDU1p2wFGKPOaVpqTUV6?=
 =?us-ascii?Q?bgL74zpJg/Lau12EMWI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bef042-26d1-4936-0f23-08dac0d54ede
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 15:32:41.1963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w75xJkHxs0el7Ve01QXA9al3xdCdpyoquGgOh74U723+2jo+8lcsHrmIaXEfs4Si
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7018
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 08:18:53AM -0700, Alex Williamson wrote:
> On Mon, 7 Nov 2022 09:19:43 -0400
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Mon, Oct 31, 2022 at 04:45:26PM -0600, Alex Williamson wrote:
> > 
> > > > It is one idea, it depends how literal you want to be on "module
> > > > parameters are ABI". IMHO it is a weak form of ABI and the need of
> > > > this paramter in particular is not that common in modern times, AFAIK.
> > > > 
> > > > So perhaps we just also expose it through vfio.ko and expect people to
> > > > migrate. That would give a window were both options are available.  
> > > 
> > > That might be best.  Ultimately this is an opt-out of a feature that
> > > has security implications, so I'd rather error on the side of requiring
> > > the user to re-assert that opt-out.  It seems the potential good in
> > > eliminating stale or unnecessary options outweighs any weak claims of
> > > preserving an ABI for a module that's no longer in service.  
> > 
> > Ok, lets do this
> > 
> > --- a/drivers/vfio/vfio_main.c
> > +++ b/drivers/vfio/vfio_main.c
> > @@ -55,6 +55,11 @@ static struct vfio {
> >  bool vfio_allow_unsafe_interrupts;
> >  EXPORT_SYMBOL_GPL(vfio_allow_unsafe_interrupts);
> >  
> > +module_param_named(allow_unsafe_interrupts,
> > +                  vfio_allow_unsafe_interrupts, bool, S_IRUGO | S_IWUSR);
> > +MODULE_PARM_DESC(allow_unsafe_interrupts,
> > +                "Enable VFIO IOMMU support for on platforms without interrupt remapping support.");
> > +
> >  static DEFINE_XARRAY(vfio_device_set_xa);
> >  static const struct file_operations vfio_group_fops;
> > 
> > > However, I'd question whether vfio is the right place for that new
> > > module option.  As proposed, vfio is only passing it through to
> > > iommufd, where an error related to lack of the hardware feature is
> > > masked behind an -EPERM by the time it gets back to vfio, making any
> > > sort of advisory to the user about the module option convoluted.  It
> > > seems like iommufd should own the option to opt-out universally, not
> > > just through the vfio use case.  Thanks,  
> > 
> > My thinking is this option shouldn't exist at all in other iommufd
> > users. eg I don't see value in VDPA supporting it.
> 
> I disagree, the IOMMU interface is responsible for isolating the
> device, this option doesn't make any sense to live in vfio-main, which
> is the reason it was always a type1 option.  

You just agreed to this above?

> If vdpa doesn't allow full device access such that it can guarantee
> that a device cannot generate a DMA that can spoof MSI, then it
> sounds like the flag we pass when attaching a device to iommfd
> should to reflect this difference in usage.

VDPA allows arbitary DMA just like VFIO. At most VDPA limits the MMIO
touches.

> The driver either requires full isolation, default, or can indicate a
> form of restricted DMA programming that prevents interrupt spoofing.
> The policy whether to permit unsafe configurations should exist in one
> place, iommufd.

iommufd doesn't know the level of unsafely the external driver is
creating, and IMHO we don't actually want to enable this more
widely. So I don't want to see a global kernel wide flag at this point
until we get reason to make more than just VFIO insecure.

Jason
