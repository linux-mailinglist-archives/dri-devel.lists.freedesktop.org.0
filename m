Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4146233F1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 20:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A76410E0BB;
	Wed,  9 Nov 2022 19:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C430C10E0BB;
 Wed,  9 Nov 2022 19:52:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbcvza39OVXfjJVCQTar6Pt7XWxyP8ekRXr+HV5PC3DuS/Mfd99eSu2ZPknmfF1WrAGLJJrgSQRl7iJvFyVWKeEQ39ScYok+PjZZRchOnisxOiRM2Y/a9J/yajYprHJ+3jfkZUEjw2yqF1yZGVYTUD4tU1mkkTmJe6Y8K+Y1mMeoWfdxKxwfX1VtzKynxuX/zktGxygxOB6ViTfkPhEM+jhQyXNFDFN08JbcXtKPsFRJSSFgpKEo8FgkXJk727XKtFNoBYFusf/5LxYPr2PvkiEpgnDOQS9OpDGo/ua/5N0W2sp78WnWoFyiMizZJm3BcajDNCujzYc3fxABRY9oRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+wj3rbazGYZ3sk5lhP0Nq551eUoE3CH0UgeW8u4eWI=;
 b=Z9R8fDi1tDDpW2SXX/wtO1NbYDnXkBN2V/mIEmDiOg443juPuW5ku/SyQUDzgDvAEBSitKbufoJxPOMz0OPKCayK8UT0Fnskel6ATu2LNTOVgWk23VUzvN96RYEUZpihEKCKwAPcDkjkBCF/YmdLZzZuRq2Gem/6gWBpX718rf588JQ3ESfhN7qBow4NmXL3ZMctKXw0Xl4caFw1SBHxU3unX3LQiQ+iIjvdrt3iZbJHVU2bVKhZMGAi6ogW1BwV3LwFzs7p0B1GdO6zWxFn6tmk0BEA3UEPx3ef04FLSyLBrapYeOjiQH8xnLZ9lsWf5N41Fu8gy37kRYSpLDlafQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+wj3rbazGYZ3sk5lhP0Nq551eUoE3CH0UgeW8u4eWI=;
 b=tnP3nS3Ffq6JDiumj9VzFNyWdIwNM0jMdd/dKKpjU+ISK+5ktD3SJvTzszR/2ja14HKKswCtPm4gKxY6ny9XNO4JOCWVZfiRaH35/QRVvdx7uzr4IAU7pkG8k/33+pr2V1f8ZncwBVjRYtk9xjUOpEUuLhQGEzCA16SwLkIubk4hT/VDXGFzVm2c3wmjNKWsDr76iTfiNyvdLdWmTAheaS69/eZqUfbHnX7jXVpIkIQB7ZdXM7Wso/glqou2fK7jqYFDK+Ck9YP9DZH29bq/TVi33ORcH5spR1i3LCsA8hbZfIsaGSQauQGRtPXd5kYOfsgAP/Ozg8WAHC6oLoT19Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5197.namprd12.prod.outlook.com (2603:10b6:5:394::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 19:52:57 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%7]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 19:52:57 +0000
Date: Wed, 9 Nov 2022 15:52:55 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 10/11] vfio: Make vfio_container optionally compiled
Message-ID: <Y2wFFy0cxIIlCeTu@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <10-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <20221108152831.1a2ed3df.alex.williamson@redhat.com>
 <Y2r6YnhuR3SxslL6@nvidia.com>
 <20221109101809.2ff08303.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109101809.2ff08303.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR14CA0026.namprd14.prod.outlook.com
 (2603:10b6:208:23e::31) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 6612d4bf-925f-415a-6b6d-08dac28bff72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rCh/AI5EYJX9wQGV3YKdx/fOaZkgHGdlGnv1zRtb5Lae9CtI7fjOvA6JBNe7sfLw5RYXFmQPATVgya4ZY52objWZcZdKfOcRW33gGnlKBQnYBQYGiXd1NUEq6FSFmDUWaLaJyXqy+OhBQIgh+ya4MgogG9375DTsofpXxgXfBkZ2BF/4ApTjbZVXgiwt7Lr4O+XrOj0l9Gsbmtlz3fvBlYEoNOc4QK2ojQ7ic8VuUWAyy15O57E3KzOCwqrmcSYxsxWNbhFXhmkAs1QA9pypvAFSmXN499S9+EJAIttdnsX1bd/m4n2PL8Exnpr+cKbEONzJnZnCWEDHQ7dwiMonFDpvXUtzEaI5L20wXClToMtZjWgo/fvu9ezFcVLxEpTTnVunQxUzyrZ8Kq0f2L2mNvzPRQ8w1KajrqruO+PfBdrCZ/jSsp0yeC4S/skZlQKHlvZOjlhlG71WecfvPtyEpOp4z5iQpS1HSyTQx5bliR/m2dlZ9CTuqFruDW2BzK/dz2cpT0IfIQCbYufa2VVbfgO//la3XaeSozgMTh1tIGIIZEaqvn4L7Wy0wn3RnjT+9m/FOMEfBmxug1e+jQ1TijIKnUDkWVE80Bey+l47h50MhjUkDbIOQggqPRsL9Y4TlcA0fQhiLxlP6/q7cTKhg9qzN3w7Lqqiogm6Dfo+392dvPLg14Fn4j5IU9QHBniGIIMlndOT+xUlm2XNBoLbcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199015)(41300700001)(478600001)(83380400001)(38100700002)(86362001)(186003)(2906002)(6916009)(54906003)(316002)(7406005)(2616005)(6486002)(5660300002)(6512007)(36756003)(26005)(6506007)(8936002)(66556008)(7416002)(66476007)(66946007)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BATkKD42by+KTMfiLZIxVr0dDcf5/RH0dVVtp/wsESFaKuC3HUrt/WHqs4ZO?=
 =?us-ascii?Q?9UkXGwKr1z/Frcb42SKFaJYnuTswDoLcyrsl2GTFSm8maC3ctnEIl9xs/zn0?=
 =?us-ascii?Q?F//TOLqJ969Tqkn8qpEqlLqaGG/qVnNA8rvIrELl3rf55uCdq8HPB45Cff+C?=
 =?us-ascii?Q?7UujIfZIxxKMYIwbeUxqigkOflo7mjhojhi/9Y6hDcgVhCrkL7p/ktlv5Ehw?=
 =?us-ascii?Q?HPNjMjxAyjqiY2cBeyuYTyl1ZwrkoJkzLLBrYCmJ2ZJz6jFKST03gV/OaSQz?=
 =?us-ascii?Q?SzZqP49W3qd74+35oCc8dT96VcJMnFVCzejijKug7tX/keoBLte69lgeUjdO?=
 =?us-ascii?Q?53MC2tImEeBoqTQ6Y/VBVSSuWz/qbgE3ZEySy631OgnTU6mj4u3UX1hnHvAd?=
 =?us-ascii?Q?IG8fx9eGkf2idTx7f9ittAu6XkLSnAYM87tl1O9EGNFWqfM9QqGI82xZAf6V?=
 =?us-ascii?Q?yZ12yh6c/LyIC6hY+T9J7IJyaxNZ31haifhrTNW9D+mb0SiOGKOk8lysCvGF?=
 =?us-ascii?Q?Stf2FvLP7SaqqkV8iBDJl2RCgt2LcoyFNo0Mtctv/NkgK9cOalGV0o9Soz4k?=
 =?us-ascii?Q?4qh03xvewpofe7w0uyF+Hzui0HVEZu91r0KKoxobC6weZ8BDvHASPPR6s+dt?=
 =?us-ascii?Q?o9CHcTo/UsQGIcPRKQ1NgUBwn6xrge2Az9+MdSry1KAwRImyM8AHGGn3DVCH?=
 =?us-ascii?Q?rbH6UojSbrS1qt147y6F5RtPKfcKWDjB8IPyUAC5nWzrE2b4uVSd9DyT8aoO?=
 =?us-ascii?Q?DVoJJk6BWp+d0hd1GzXdfBbJZwuyib/+GxY1G/rmmBJWqVlMk73t7ForYriP?=
 =?us-ascii?Q?elQxdyrczGKzqtw7BWal+Nuw26hCU8fuDv1XoOLgsT0g9fS/laz/zrKpTKwm?=
 =?us-ascii?Q?wihkVhdHzWGDqAvxZHTtdcoaNI1UZDorEjdwWByvHTUDHlwdmKPXaRiRkNlA?=
 =?us-ascii?Q?+Vhtn+6qTUtNYQcOVEBGBoJXboXORzw5tyd/P0Yr4kL5QsaXGzag/3JIBW67?=
 =?us-ascii?Q?BVdzzSLCdgGcFhYGHDf6F1O+ryM+UBw5qOuOfcFWjKDcocTSCnhyZwq60hRT?=
 =?us-ascii?Q?Q8r3qlkyHGrA+iwMlD0lf94DfFTsrtOIBsYROTlS6zKFlKV5lYWivV2LUcll?=
 =?us-ascii?Q?B6B29DOIWV8OGGQXASi1r0sN5wE4jV0ZO9Q25Ak9SRk8pn/RtwRtW5j02U8+?=
 =?us-ascii?Q?mymIVs+8Ji81pVZPQ7qsFtGBS+ulyDTPS49yxdQVps2tCpLZNwoOWE4enNGW?=
 =?us-ascii?Q?/2JXrDeDf0ByfNv3afaOx9RdA1V/rndWblRkD0jy2JElkICJN9QJ7X/q/6EN?=
 =?us-ascii?Q?LQF3klPqwmjb1sYVIDoX/+ddmiQA9bfDBffFco/6gcPjZrTl0fOxrERGTrPv?=
 =?us-ascii?Q?y/fyahz7SBEilhVrxVB9qtVUqjko/Pjts2E4fxiYnyDlidKS05QhpXJtvSit?=
 =?us-ascii?Q?/LQv5B/ro8VwouaBwuwgt8L0KFRKSnsPArAxIYcD+6Wid4+NchhgbzMWF9Hq?=
 =?us-ascii?Q?mUQlp6Pre3NFdw9wGKPMy2/HXamygOrdqUdC1rMtN4McqPAe7w0k7Lp5/4yh?=
 =?us-ascii?Q?N3EDpzWzrhqtYuqI2eI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6612d4bf-925f-415a-6b6d-08dac28bff72
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 19:52:57.0308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxSRHATUj0W9As4Mwgz0GTxpJXE0XJqo2U711mavVgNoPr/U/aXKtz6u68aRzzN3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5197
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
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
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

On Wed, Nov 09, 2022 at 10:18:09AM -0700, Alex Williamson wrote:

> DPDK supports no-iommu mode.

Er? Huh? How? I thought no-iommu was for applications that didn't do
DMA? How is DPDK getting packets in/out without DMA? I guess it snoops
in /proc/ or something to learn PFNs of mlock'd memory? <shudder>

> I agree that it's very useful for testing, I'm certainly not suggesting
> to give up, but I'm not sure where no-iommu lives when iommufd owns
> /dev/vfio/vfio.  Given the unsafe interrupts discussion, it doesn't
> seem like the type of thing that would be a priority for iommufd.

Ah, I think the bit below will do the job, I'm not sure without doing
some testing (and I don't think I have the necessary Intel NIC for
DPDK). The basic point is no-iommu literally means 'do not use iommufd
at all, do not create an iommufd_device or an iommufd_access'. VFIO
can easially do that on its own.

The only slightly messy bit is that uAPI requires the SET_CONTAINER
which we can just NOP in vfio_compat. With more checks it could have
higher fidelity of error cases, but not sure it is worth it.

When we talk about the device cdev flow then I suggest that no-iommu
simply requires -1 for the iommufd during bind - ie no iommufd is
used or accepted and that is how the userspace knows/confirms it is in
no-iommu mode.

> We're on a path where vfio accepts an iommufd as a container, and
> ultimately iommufd becomes the container provider, supplanting the
> IOMMU driver registration aspect of vfio.  I absolutely want type1 and
> spapr backends to get replaced by iommufd, but reluctance to support
> aspects of vfio "legacy" behavior doesn't give me warm fuzzies about a
> wholesale hand-off of the container to a different subsystem, for
> example vs an iommufd shim spoofing type1 support.

Well, I will agree to do everything required, just let's go through the
process to understand the security situation and ensure we are still
doing things the right way.

> Unfortunately we no longer have a CONFIG_EXPERIMENTAL option to hide
> behind for disabling VFIO_CONTAINER, so regardless of our intentions
> that a transition is some time off, it may become an issue sooner than
> we expect.

We can add kconfig text discouraging that?

diff --git a/drivers/iommu/iommufd/vfio_compat.c b/drivers/iommu/iommufd/vfio_compat.c
index dbef3274803336..81f7594cfff8e0 100644
--- a/drivers/iommu/iommufd/vfio_compat.c
+++ b/drivers/iommu/iommufd/vfio_compat.c
@@ -259,6 +259,14 @@ static int iommufd_vfio_set_iommu(struct iommufd_ctx *ictx, unsigned long type)
 	struct iommufd_ioas *ioas = NULL;
 	int rc = 0;
 
+	/*
+	 * Emulation for NOIMMU is imperfect in that VFIO blocks almost all
+	 * other ioctls. We let them keep working but they mostly fail since no
+	 * IOAS should exist.
+	 */
+	if (IS_ENABLED(CONFIG_VFIO_NOIOMMU) && type == VFIO_NOIOMMU_IOMMU)
+		return 0;
+
 	if (type != VFIO_TYPE1_IOMMU && type != VFIO_TYPE1v2_IOMMU)
 		return -EINVAL;
 
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 595c7b2146f88c..64a336ebc99b9f 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -18,6 +18,10 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 
 	lockdep_assert_held(&vdev->dev_set->lock);
 
+	if (IS_ENABLED(CONFIG_VFIO_NO_IOMMU) &&
+	    vdev->group->type == VFIO_NO_IOMMU)
+		return 0;
+
 	/*
 	 * If the driver doesn't provide this op then it means the device does
 	 * not do DMA at all. So nothing to do.
@@ -53,6 +57,10 @@ void vfio_iommufd_unbind(struct vfio_device *vdev)
 {
 	lockdep_assert_held(&vdev->dev_set->lock);
 
+	if (IS_ENABLED(CONFIG_VFIO_NO_IOMMU) &&
+	    vdev->group->type == VFIO_NO_IOMMU)
+		return;
+
 	if (vdev->ops->unbind_iommufd)
 		vdev->ops->unbind_iommufd(vdev);
 }
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index f3c48b8c45627d..08c5b05a129c2c 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -749,10 +749,13 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
 	if (!IS_ERR(iommufd)) {
 		u32 ioas_id;
 
-		ret = iommufd_vfio_compat_ioas_id(iommufd, &ioas_id);
-		if (ret) {
-			iommufd_ctx_put(group->iommufd);
-			goto out_unlock;
+		if (!IS_ENABLED(CONFIG_VFIO_NO_IOMMU) ||
+		    group->type != VFIO_NO_IOMMU) {
+			ret = iommufd_vfio_compat_ioas_id(iommufd, &ioas_id);
+			if (ret) {
+				iommufd_ctx_put(group->iommufd);
+				goto out_unlock;
+			}
 		}
 
 		group->iommufd = iommufd;
