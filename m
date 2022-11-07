Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CD161F42A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 14:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8E010E30C;
	Mon,  7 Nov 2022 13:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BB810E30C;
 Mon,  7 Nov 2022 13:19:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTfnkAMzELzwVXLsYm9Xz2BYWDu7NCLHu1rhWx/gdytFcH2ny5aCD02ESX6Dfg+hF0qWfovNGYPLHt+I4ASDCJySdxpSCu0Bcw+MAgUda5qGy8DXT6VoYi2s8BA3cVv9pyPlwVmhc5A5/EaqHkq4EsYy1KDPhrL9e0U94m0EKWXGEqn85dzdN8rd8CElAEjNcYW78iabjAn94/ROZqlbkn+r3tISbpzPjYqeAvmFlhl/9EEZ9vixUfkFa4gFMYfiS2CkUJj0gBhAB8ucA1JUjygfiOmbBhzf5rsXQwhwHuzNG3O8rAneBhXmeIY1HB2EHBturZGz9ZlYbs9qp7AbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4X5dG8QlSTh4dgjV3bEZBAoi/qJnVqmgFamMmqSL5G8=;
 b=UcUyO1Rp21mamHpsd/Lp8FcRbDyMQ4zc3BVN5b5k2RHmrXM3EKMTqFgETqLPJt5bX40sRYMa/FlW/+H6sFAez8l5dMU/8AkndFRU/2NZNU0QBlE8mtWWVWAxx+Yl+nfDlfLLVjwj3w4MB5OBlqHtkBxRKuAYArNl0+n4H+hs4InVdYwKiZswcvL5Vx2dSMhx7yXdtlfv87iYQA03utchlJs+/1UDuGqDpXryj9wLHrOg8ugH2tNR0rq3+mmiDJZDfVlXgluTslN+BB5YTTgAy/2i5Gd78ErGpAfxdNH74N73EUKPwS1K8RYLkFZdRmasfHQLu/JrcrXlvmHfmTAAeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4X5dG8QlSTh4dgjV3bEZBAoi/qJnVqmgFamMmqSL5G8=;
 b=uemGWwacjLcTycDfZKyuSAW/nN3SW/HE5qu0tCWlkV8o/bAuAF43JVyeAIZPhbhpxXYdh5lPfZ6lg5m+Qb8lLYwNRN5aJBctrlcvmLJofzVBqJZCo+tU2Awn0LeWAhCNT0a8flRKlAePIxGrlN1MbzEbrLSYEIyahoq4whlEDghyZ5h/nyfoiV/KuMD6N86PoQ+O0pq1Au8/d4jf9eRmWjb3guqKX20CbAylZbmxripKjh880UZJ7/SEKvY521KT7u8D/vKRQNt5ASMeeevHVQDhi34/TISV23XJGIwI1ejCHYMVvq4VWi8sKfy8kCO3zJKma9sZw2i1HuPxioYp9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB5864.namprd12.prod.outlook.com (2603:10b6:8:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 13:19:44 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 13:19:44 +0000
Date: Mon, 7 Nov 2022 09:19:43 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Message-ID: <Y2kF75zVD581UeR2@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026152442.4855c5de.alex.williamson@redhat.com>
 <Y1wiCc33Jh5QY+1f@nvidia.com>
 <20221031164526.0712e456.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031164526.0712e456.alex.williamson@redhat.com>
X-ClientProxiedBy: BL0PR1501CA0012.namprd15.prod.outlook.com
 (2603:10b6:207:17::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b3bbaa-d521-4298-a7dd-08dac0c2bc79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H6TZ3XjPKagGwPPhvwmWSWUXl6G4xGdbn+N1blCXYpTEOOBJe1u5gXPXwX877Em71HHUAVOwUyChOIMyL4HoxvOouw6XU/wviKYyooISg1u58/0QeGbQKsZnVNMzQ/5AqKBqQsNNODGn2uKo4A1oGOfNRrS1dDZQa4mbFouufD48xYZcgNvTnHaJLPa/Rygn97RcK8mrl39vIgI0O8npeA2VdduTKmgKH9mwFumhm333Ji2DzggemYAE8KYRaZ+bDYN8osQbWpBtwsDWHiOmWyWH+G4scgHvF5x2U6GiJeGb+hQL2TA9aSXOV35ScGWBJhnpgTBeN5jQg0mW7nF5xVCouki9WyhwG/gt7LmerMta5uolXhf5K/X+rOc5dIv2st6rbc8qooadQZiWqqzjbvJAMol2raHdGMAP+bta/f03V19TkpMd3keVz1nN7OmekgU5cGoVi77NA/20IGZnFwgk7O91R+4revLvud5DAAUkU8CqS/yl2RDLJ1W2A3R5gMPJM58gEqs4fPtoTv43ZUgd3wsK3Ys9t6jXMg730Cew7p9WcLoZWZQKECNjeRMFSBOwE+Au7pZH3lGIyrdxtnRY3WN8nyYSTgeNEV9jdoE2/+5uY3u0tddQ0IblQcePM22MhvxMvelUHZvetTeTSoMueHJXhuQVLO6m/b5Y7zN3RKpDc15jv6zZEGvhsoBm6n8S6cmlQ/4y+QS/1GghZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199015)(478600001)(6486002)(38100700002)(86362001)(54906003)(6916009)(83380400001)(36756003)(8936002)(316002)(6506007)(6512007)(26005)(41300700001)(66946007)(66556008)(8676002)(66476007)(4326008)(186003)(2616005)(2906002)(7416002)(7406005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3ycE2YlZfTG/oQoQNuNstdHGXUSS2MOxztYYF2Au9GQuT1CZdvQgX0GPg5H4?=
 =?us-ascii?Q?+m73EF2k8+kgNsc76r9LXWETx3XzR0IyWxYFQmkgTqKsK9FpKlv8fWgHbAae?=
 =?us-ascii?Q?qCW958njIzZ4sBDIjQeo36kRwp+IJoWdjyJYoe19g5RZ160DyxyIorcJWd56?=
 =?us-ascii?Q?gYgzOwHCYHrI7EUpwOARfT5s42zbAvYaqzxzIMe5CG4azCij2nSJi9ddCc4D?=
 =?us-ascii?Q?/McXeQkSsPEPK6VqaiycLAJ2b/bD+YhJS6acS3jbYKnkWaqXzsOxLQGE5V4p?=
 =?us-ascii?Q?Hje0KxoKrGLWkJjjlllrQShfWax+VQNxU8lbPIfwgogCxANMTpXqqc97906z?=
 =?us-ascii?Q?rrap+Ldg76EcpkTRL6+Ih1ZIAvEc8VSLDRMYWndJJb1ktNph6pC5/Mj1OOYB?=
 =?us-ascii?Q?p2fi1moCAG1rJD+QPR4DkFzzv+ECQNuTbxlxsWG1tqM3JsIdc0YeacM2WqTA?=
 =?us-ascii?Q?LB401VOkHDj0VWmImhkyCrYOtapuaMJeQvslhP1JG4lO03GgMqskdxC+cSt/?=
 =?us-ascii?Q?AGVd9YunblzfL4buRvn7+KR42rFq69W4JxZtX6qjTKjrFa1EkmTqLdse08IN?=
 =?us-ascii?Q?w3gxGBU7dovADzuvrp4ZofDmDvfI/6XiJzm1uj2hOOBSTcBc/A0tyFr4L07q?=
 =?us-ascii?Q?nHQ8EvEvL2bEvHkxNNhxEiHN34PjOCnhAlFaWtxIhMoAb2Du1rTgUJw0JIMy?=
 =?us-ascii?Q?vvNxNGt0x1bNfFwKAOwZn5XBaE2OUgGaLranlKdKY1YRDoG64Yl1YMEx2or6?=
 =?us-ascii?Q?TuI0lh/xp9wq6e+1YRn28QgJeo24iFlq42zhWPlcWPO09xy8flkeFFCUhW6+?=
 =?us-ascii?Q?0/mXaoIlCqYiKBJLvaIgOVVaHhDA8QDwXrk5tjTYP8H42P9on0XIi4G74uFK?=
 =?us-ascii?Q?3eiSfxDVvbtU3xr8CBjxsttPngrXylFlxup1kdcRDO1cYJcvH63sGh1gWPay?=
 =?us-ascii?Q?ua2D4wlzdPTPaK2gWQ6Nkcw5+sQG7pUV78GEqAOy6JJH+1wl2YxjG1IiVeBo?=
 =?us-ascii?Q?3aLkSe82aVz6TZzq9PXGr4+uWkBv/leHwHB0Vi2wKfKMw6MVbOKCIuTiovEZ?=
 =?us-ascii?Q?49fRzXh982yEX7VkzX5lTidMBoh+cQrk9N9MSfngDZSdjaspt5NNtwFQqmSu?=
 =?us-ascii?Q?ro1nQAzxRD0Rz8+/YP4lY8IHWZAJI+iqIJq+vHd9Bn/fCc4nEKzYqwkTlYio?=
 =?us-ascii?Q?rfxS4enyRHOKFGiBwOkiY5AGXh89wavb6nHtmIcO0wxrow2xROn6AkX0KvUN?=
 =?us-ascii?Q?m7qCosnRtBJ3AwFvRZjmDqUCJ3ZswfAqTPpjuk2nVGXvKVpuXuRQVFiW5ZRb?=
 =?us-ascii?Q?rlmOzg+0BVDN4OhNCp3gs+yFnaoy0B4yFNAZI12IrE2BCbF0YLqwJHTOYboJ?=
 =?us-ascii?Q?bhfmnbA1QZcxE7Rgv4x0i+nWkL+1+4tdwT/mXoZ9DoIaJKiEsnY0o6/8wxal?=
 =?us-ascii?Q?XHPrYFx+2efVGBvW8/RoIynU44pb0Olk++w7iaCbJnH/EpOvUdkDR+rj9S/C?=
 =?us-ascii?Q?rCNu2im1dmsdYW5o2iYBKCWjTll3t+kRu4SeDVvcsN4zxCvNHbIvzkGTYkBW?=
 =?us-ascii?Q?LAtIyrUYQKUCYj9aNAU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b3bbaa-d521-4298-a7dd-08dac0c2bc79
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 13:19:44.8998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MaisCtaZQ0vNJvx1NRF5hFN4IFlcFxcuV9hWzeWntYolr4QaV4CtsYEGio3yoHUt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5864
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

On Mon, Oct 31, 2022 at 04:45:26PM -0600, Alex Williamson wrote:

> > It is one idea, it depends how literal you want to be on "module
> > parameters are ABI". IMHO it is a weak form of ABI and the need of
> > this paramter in particular is not that common in modern times, AFAIK.
> > 
> > So perhaps we just also expose it through vfio.ko and expect people to
> > migrate. That would give a window were both options are available.
> 
> That might be best.  Ultimately this is an opt-out of a feature that
> has security implications, so I'd rather error on the side of requiring
> the user to re-assert that opt-out.  It seems the potential good in
> eliminating stale or unnecessary options outweighs any weak claims of
> preserving an ABI for a module that's no longer in service.

Ok, lets do this

--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -55,6 +55,11 @@ static struct vfio {
 bool vfio_allow_unsafe_interrupts;
 EXPORT_SYMBOL_GPL(vfio_allow_unsafe_interrupts);
 
+module_param_named(allow_unsafe_interrupts,
+                  vfio_allow_unsafe_interrupts, bool, S_IRUGO | S_IWUSR);
+MODULE_PARM_DESC(allow_unsafe_interrupts,
+                "Enable VFIO IOMMU support for on platforms without interrupt remapping support.");
+
 static DEFINE_XARRAY(vfio_device_set_xa);
 static const struct file_operations vfio_group_fops;

> However, I'd question whether vfio is the right place for that new
> module option.  As proposed, vfio is only passing it through to
> iommufd, where an error related to lack of the hardware feature is
> masked behind an -EPERM by the time it gets back to vfio, making any
> sort of advisory to the user about the module option convoluted.  It
> seems like iommufd should own the option to opt-out universally, not
> just through the vfio use case.  Thanks,

My thinking is this option shouldn't exist at all in other iommufd
users. eg I don't see value in VDPA supporting it.

So, let's wait and see if a need arises first. I'm reluctant to add
options to disable kernel security without really good reasons.

Jason
