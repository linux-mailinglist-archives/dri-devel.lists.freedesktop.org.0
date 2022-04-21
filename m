Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 298EC50A571
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 18:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F266910E218;
	Thu, 21 Apr 2022 16:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A814A10E10F;
 Thu, 21 Apr 2022 16:28:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsfE+TZpfxzc2YlNuDTT2eOsNPanlWrgDPkyI2DTPkbn6ejf7XOcBqkCs6kn1n95mDoK+7iD3ZLGUAL+eifZ9SHdejUQuyKkknwZnD+aP3N392itUi3mkcv3cHtSqbaOgS/pcN3Y9dEDoEEv3sGUYCFtnVc+a9wDhdJt2OmG+u2jX+XdVNswUhOByNIo2vhb6Cq5PUcnSL815LZnWPyvOW27ER+uwwJ1Ei1IC970cl4AFfVz+IZT6UYV+1FYPx4lJ6DVhQEXRy/CvhIXqqHexZvpw+5h4PtjSzVNrd1YP1mc7IWqaYA+Met0qB+5jh63hWIcSTvU4M6rCg4QsFQBKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wF3gww0KiQU0HFXbXnm+kxtuGLN8sh+uyIubI6PrMw=;
 b=l3+L5/IFr8XHrbE8EQ9yjP0hKgoIVEBt7jfH9FPEV7dHMZrhxCy5fMrjRlcthWxrUYQTZ62BQYMD3NkUNCofI4JRuavzvIbvjkdPoHkcCvPuckGyOWevdSEq7iuNyMbBI10xTQGuj6KwdNqYhDGU+0kWBE6EsOmmeJweCa3/qNzOsgNbL8HPCsEpP/Tzlj/DNWzvx3ZaS8+3svHa+pKRo2odUmenWZAQHOgEtyspar12KUiik6BOqoR29Fs3GBcqY7DLqLPPyMemnVYNFSMS4YqR+2poG/CMqlVcEyaRKlknSKAl2z4qt3yOTx1NHBJ/wLu8B+OKl9WO42ApfBqBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wF3gww0KiQU0HFXbXnm+kxtuGLN8sh+uyIubI6PrMw=;
 b=IVUcR/yXhJ0+W3MyixNoQD1760Tnceu8iAweO6AqHqPfJJvzPvdXl2f3tHNn1T1SQvIW74zg+Kt8+Hwusx25OmvI6bTQZ+09Mjw4Nm7hT3+uDPMVHORHLtBv6LKAtlrAmsens0XugSwVAqacBTQwUqh7tWYNYhSbcjDlX4ij1DDjBsgWPWvpTAVzxoouehCMA9nTHpzE38t3LHWRrWgVSDEfUf5Zr124NlH/qvcKqXTgUTXGMC5O2+G1miCovhUj5CiHx8qFh6hM6CWhyp8yaj6IzqOi34EoGAHroTjSt0w+f/npx7jt1zBm7AHIoSrrw6i3eRA8OdvUACIhBCrLTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB2907.namprd12.prod.outlook.com (2603:10b6:5:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 16:28:41 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 16:28:41 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v2 6/7] vfio: Remove dead code
Date: Thu, 21 Apr 2022 13:28:37 -0300
Message-Id: <6-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:91::30) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 577b812b-37a4-4095-aaa2-08da23b3fde9
X-MS-TrafficTypeDiagnostic: DM6PR12MB2907:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2907253B6FA4E43E8C0716E2C2F49@DM6PR12MB2907.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t716BVtp12dCyYGs1mSW+jvJTNuV+koff7YqngByYiRd+2NO3LynZlmmL1fHahBeXGRFdkty+ep53i9/F3lbGwA5SrlYWtoGxxtLc2u0ji1NC0hWRXMv056aMeePgQVp2sDLtTpVh4eGw8e9iwlg7kSSueqN6KoGyonHnsyCE92DKWAfkiav5RSeaABV5vfDWTjWeiGvBhxUxRoHDkuezKC7b9iRBYlIetz7ULzc/A8T+GoiIwuhhQLCpj5Z/erEcj3rUzX3LITL8OG6SgeMYL4k5qQ8QUr3Rti05iDXIgOfqufJ8fzxkrt8Z7nlSLbtbkTtoGu+uFrdwuI2kUXRnlM57mbi4+kbBGZsTK/JXMW+ly2TrrR/IGQY6JJynI+vvX/x4OLLgXn3dtZ9MX5neWE35xtn0diU5bD/vsbGOG2deuag2o1r812yTlLNlndeAAkNEF3ouGYk6+Fi/39LXoi++63ZW+hAb5hIkNPCfA7qZDjecJYc2bB7eTWeQH+KT1qdEAX3iQ2D4FLreKJckf3LEu2bgGEWXrUFbIgafSK9DnZ84FfPzBbIMu8K82/KYSMh98ePyOhvsTlJuzvWFVLH24TX8lRKQD76dR+T/6u/JOoThV5HJMoiddCvNX04BIhQZr5qcHzX5njtTLqUqQQ8kiaQZoE93VJW7jUXDS2yDOTCO91IDLTaTY/dFJOKlp+7cBZs3lIlLrT3Btdyemn/N6pY7oOWcp+nmSAsygs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6506007)(316002)(5660300002)(38100700002)(6512007)(54906003)(36756003)(66946007)(86362001)(186003)(921005)(110136005)(508600001)(8936002)(6666004)(2616005)(83380400001)(8676002)(7416002)(7406005)(66556008)(4326008)(26005)(2906002)(66476007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k95SbJW+8+P/u1SGib13jkKbLJXWhHstU/dgqIVqiWNdSXpoH7mEvgw1z+bJ?=
 =?us-ascii?Q?I4i2MDDql4gQO6fS256gg3BgIINSF/2jHs+jUXz4gMg7jgc6mP+rKxLQS39V?=
 =?us-ascii?Q?4X9eDvU+uGXERKEU/7sVpI4KKauDYMhL5ZS2Ryq+xgwhgB2Ck7u3s5kmBWW7?=
 =?us-ascii?Q?Qft9OZsGgnjd4aaeYvMn7AFmET5FnC873aR4oVLN4lHJquJvI2t9CCDO6T1i?=
 =?us-ascii?Q?7MrkQABj/KS5ia5xrwJ/QCskWvcrDDcKiuraaB7oMCHEdFYgVo1uV+xt+9NP?=
 =?us-ascii?Q?y0unVGbTMmi+HNyIpJTfmHx0Z1ZOjVYyIp7aYgEI1S38JzqRP9y1z3Dcg6kh?=
 =?us-ascii?Q?PGGnTvXbio9mZ1X4jbvxoDFtH/Tur6frbNLiY2VnZPl7P+OSyulluJpIdGzh?=
 =?us-ascii?Q?MFSiq6wkDyfy3ZNXJ4JWAA+AZn658Q+f4qJPfYvsr7X75jHzRGEQrnGJy2RE?=
 =?us-ascii?Q?m1D0p0SjWZDeHIPCjYZmriemn0zW3C+JByN+MCsZBPGra9H98GLIMHBOW9ge?=
 =?us-ascii?Q?ymZJ/eK+8LJriNozmeIsLgha9JcTV/j3zxesAaoN39xfMEH0aKEpNtv8SVfD?=
 =?us-ascii?Q?qAai4CCXpR26VJJa6jE77yVHSM/y402x/3dpyMSVaZr4t84H9KvBSnYn2+Xy?=
 =?us-ascii?Q?UtfHhFGYCOK6is5gLoeRXwSOoxXN6Z5yVaZRHisHARql/HPbjv6QVumBOS08?=
 =?us-ascii?Q?pIf4YZrGeSifohhkuw6HafYfWrPbFGSOEzYuBwQd0WWp3J3W1ubVP2K5j1XI?=
 =?us-ascii?Q?qfVBWao5pjPZeVd+VyHayTifKCpuu8KTHGuklmwZ6gPMDhFxpOmN+SPgCkvs?=
 =?us-ascii?Q?txOdZJmiVZ5ziEpugMLLPFwCFRcfeRwa7Ri99TTQNOM7n+AYEPLQdzzsI9jB?=
 =?us-ascii?Q?izodvVUqtQtka2hew7IhFesIEsW9/e2Iqpa0rg3gcvy0n0Cn4Ccy2+CYVXm9?=
 =?us-ascii?Q?Rxf3YciJaYDcXRkLNI5HAt0yE3pglkBgT4f3TOYy97O+UfOay5a/0OEslXrJ?=
 =?us-ascii?Q?46VyBqY8ajaVDoUgnF3a+sSDJCF0Ouy1G6LIu+jQBJzZT+hZnbAdd7JXv+8L?=
 =?us-ascii?Q?atAOJghlUoRsVnzcbQWpkYCXZf1EDcz61t1gwWg4tiVzuf26eLG3KtjI5Tjg?=
 =?us-ascii?Q?5Brmkp+beM04OK9eFZc55NpLqI2lP7QJkYTnlD3CazR7qCDv9AtG42N3DnpJ?=
 =?us-ascii?Q?AzD60HNG5JtckhDu1yZIfA+bPaTMCG2VxjRSwfvdmHPcqEXxpNe0OXcXvDQh?=
 =?us-ascii?Q?7+9xyFJYer3kYayK0J6yoK4eklUyUx8H4TJ43fJsPArVeyyhuey+IZPHmfVu?=
 =?us-ascii?Q?NY66VWMNQzJ0gJtnq38YQs1NQIT1PZUA4v0sjYfjrrxQvXaor/LmouU/EAqq?=
 =?us-ascii?Q?npDjD7w4O1Y3mimibePvGklKhN1FiyeHpB55OZk7EYp2Njoj/TyI1Tv5IS+k?=
 =?us-ascii?Q?iThtqK8VtbKn0UUzGPvs3aD/Kt9SfmhYt2lRPI++a0EqYaZk9GS9f1lOylOW?=
 =?us-ascii?Q?Xg2Y/HvUEn5V+WuzAfGevPAM3dYXmoG0cA5jIix4NxRiXuQWpkaNPoFmTgGu?=
 =?us-ascii?Q?5Wv6Q0pf1v/nJUtRXC1gPKdJBA26VvXl3WEsVco+8+ooSzhUzOdrfHO24aKc?=
 =?us-ascii?Q?tHe2Lf6j9pvzIgiTxk8MM1dQAmQ5liUbgkrmNnJireqMkEfeFwAQdVz+qIF4?=
 =?us-ascii?Q?kogPHT2BW/UTLzoHqXZUkMWwo/HB8nhbIRpwTYQsnHaqTnch0VKNRNdJcwS6?=
 =?us-ascii?Q?AgqFXNihrA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 577b812b-37a4-4095-aaa2-08da23b3fde9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 16:28:39.4132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeWxEJ6F1a3HaagyGhDjcv+QKRr6VCIKliDRyU0BwOfxhQrV+LabV/CY9kQcBwr2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2907
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Eric Farman <farman@linux.ibm.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that callers have been updated to use the vfio_device APIs the driver
facing group interface is no longer used, delete it:

- vfio_group_get_external_user_from_dev()
- vfio_group_pin_pages()
- vfio_group_unpin_pages()
- vfio_group_iommu_domain()

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio.c  | 151 -------------------------------------------
 include/linux/vfio.h |  11 ----
 2 files changed, 162 deletions(-)

vfio_group_put_external_user() is removable too when combined with the KVM series

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index d10d20d393b706..ba6fae95555ec7 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1947,44 +1947,6 @@ struct vfio_group *vfio_group_get_external_user(struct file *filep)
 }
 EXPORT_SYMBOL_GPL(vfio_group_get_external_user);
 
-/*
- * External user API, exported by symbols to be linked dynamically.
- * The external user passes in a device pointer
- * to verify that:
- *	- A VFIO group is assiciated with the device;
- *	- IOMMU is set for the group.
- * If both checks passed, vfio_group_get_external_user_from_dev()
- * increments the container user counter to prevent the VFIO group
- * from disposal before external user exits and returns the pointer
- * to the VFIO group.
- *
- * When the external user finishes using the VFIO group, it calls
- * vfio_group_put_external_user() to release the VFIO group and
- * decrement the container user counter.
- *
- * @dev [in]	: device
- * Return error PTR or pointer to VFIO group.
- */
-
-struct vfio_group *vfio_group_get_external_user_from_dev(struct device *dev)
-{
-	struct vfio_group *group;
-	int ret;
-
-	group = vfio_group_get_from_dev(dev);
-	if (!group)
-		return ERR_PTR(-ENODEV);
-
-	ret = vfio_group_add_container_user(group);
-	if (ret) {
-		vfio_group_put(group);
-		return ERR_PTR(ret);
-	}
-
-	return group;
-}
-EXPORT_SYMBOL_GPL(vfio_group_get_external_user_from_dev);
-
 void vfio_group_put_external_user(struct vfio_group *group)
 {
 	vfio_group_try_dissolve_container(group);
@@ -2218,101 +2180,6 @@ int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 }
 EXPORT_SYMBOL(vfio_unpin_pages);
 
-/*
- * Pin a set of guest IOVA PFNs and return their associated host PFNs for a
- * VFIO group.
- *
- * The caller needs to call vfio_group_get_external_user() or
- * vfio_group_get_external_user_from_dev() prior to calling this interface,
- * so as to prevent the VFIO group from disposal in the middle of the call.
- * But it can keep the reference to the VFIO group for several calls into
- * this interface.
- * After finishing using of the VFIO group, the caller needs to release the
- * VFIO group by calling vfio_group_put_external_user().
- *
- * @group [in]		: VFIO group
- * @user_iova_pfn [in]	: array of user/guest IOVA PFNs to be pinned.
- * @npage [in]		: count of elements in user_iova_pfn array.
- *			  This count should not be greater
- *			  VFIO_PIN_PAGES_MAX_ENTRIES.
- * @prot [in]		: protection flags
- * @phys_pfn [out]	: array of host PFNs
- * Return error or number of pages pinned.
- */
-int vfio_group_pin_pages(struct vfio_group *group,
-			 unsigned long *user_iova_pfn, int npage,
-			 int prot, unsigned long *phys_pfn)
-{
-	struct vfio_container *container;
-	struct vfio_iommu_driver *driver;
-	int ret;
-
-	if (!group || !user_iova_pfn || !phys_pfn || !npage)
-		return -EINVAL;
-
-	if (group->dev_counter > 1)
-		return -EINVAL;
-
-	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
-		return -E2BIG;
-
-	container = group->container;
-	driver = container->iommu_driver;
-	if (likely(driver && driver->ops->pin_pages))
-		ret = driver->ops->pin_pages(container->iommu_data,
-					     group->iommu_group, user_iova_pfn,
-					     npage, prot, phys_pfn);
-	else
-		ret = -ENOTTY;
-
-	return ret;
-}
-EXPORT_SYMBOL(vfio_group_pin_pages);
-
-/*
- * Unpin a set of guest IOVA PFNs for a VFIO group.
- *
- * The caller needs to call vfio_group_get_external_user() or
- * vfio_group_get_external_user_from_dev() prior to calling this interface,
- * so as to prevent the VFIO group from disposal in the middle of the call.
- * But it can keep the reference to the VFIO group for several calls into
- * this interface.
- * After finishing using of the VFIO group, the caller needs to release the
- * VFIO group by calling vfio_group_put_external_user().
- *
- * @group [in]		: vfio group
- * @user_iova_pfn [in]	: array of user/guest IOVA PFNs to be unpinned.
- * @npage [in]		: count of elements in user_iova_pfn array.
- *			  This count should not be greater than
- *			  VFIO_PIN_PAGES_MAX_ENTRIES.
- * Return error or number of pages unpinned.
- */
-int vfio_group_unpin_pages(struct vfio_group *group,
-			   unsigned long *user_iova_pfn, int npage)
-{
-	struct vfio_container *container;
-	struct vfio_iommu_driver *driver;
-	int ret;
-
-	if (!group || !user_iova_pfn || !npage)
-		return -EINVAL;
-
-	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
-		return -E2BIG;
-
-	container = group->container;
-	driver = container->iommu_driver;
-	if (likely(driver && driver->ops->unpin_pages))
-		ret = driver->ops->unpin_pages(container->iommu_data,
-					       user_iova_pfn, npage);
-	else
-		ret = -ENOTTY;
-
-	return ret;
-}
-EXPORT_SYMBOL(vfio_group_unpin_pages);
-
-
 /*
  * This interface allows the CPUs to perform some sort of virtual DMA on
  * behalf of the device.
@@ -2515,24 +2382,6 @@ int vfio_unregister_notifier(struct vfio_device *dev,
 }
 EXPORT_SYMBOL(vfio_unregister_notifier);
 
-struct iommu_domain *vfio_group_iommu_domain(struct vfio_group *group)
-{
-	struct vfio_container *container;
-	struct vfio_iommu_driver *driver;
-
-	if (!group)
-		return ERR_PTR(-EINVAL);
-
-	container = group->container;
-	driver = container->iommu_driver;
-	if (likely(driver && driver->ops->group_iommu_domain))
-		return driver->ops->group_iommu_domain(container->iommu_data,
-						       group->iommu_group);
-
-	return ERR_PTR(-ENOTTY);
-}
-EXPORT_SYMBOL_GPL(vfio_group_iommu_domain);
-
 /*
  * Module/class support
  */
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 91d46e532ca104..9a9981c2622896 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -140,8 +140,6 @@ int vfio_mig_get_next_state(struct vfio_device *device,
  */
 extern struct vfio_group *vfio_group_get_external_user(struct file *filep);
 extern void vfio_group_put_external_user(struct vfio_group *group);
-extern struct vfio_group *vfio_group_get_external_user_from_dev(struct device
-								*dev);
 extern bool vfio_external_group_match_file(struct vfio_group *group,
 					   struct file *filep);
 extern int vfio_external_user_iommu_id(struct vfio_group *group);
@@ -154,18 +152,9 @@ extern int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 			  int npage, int prot, unsigned long *phys_pfn);
 extern int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
 			    int npage);
-
-extern int vfio_group_pin_pages(struct vfio_group *group,
-				unsigned long *user_iova_pfn, int npage,
-				int prot, unsigned long *phys_pfn);
-extern int vfio_group_unpin_pages(struct vfio_group *group,
-				  unsigned long *user_iova_pfn, int npage);
-
 extern int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova,
 		       void *data, size_t len, bool write);
 
-extern struct iommu_domain *vfio_group_iommu_domain(struct vfio_group *group);
-
 /* each type has independent events */
 enum vfio_notify_type {
 	VFIO_IOMMU_NOTIFY = 0,
-- 
2.36.0

