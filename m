Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB59355C64
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 21:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BA86E8AB;
	Tue,  6 Apr 2021 19:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760040.outbound.protection.outlook.com [40.107.76.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC5F6E8A8;
 Tue,  6 Apr 2021 19:40:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yh0ApidhYhMFLOanb/21ETEoK/hr9tfzloDqNEKdameU4+A2XHC9ACdZj96jQLmMUHNEKM/YqH4s1t+dP9IPGEvjHYwXmC5sLH3myK5iu2VUIn/G7om3V87ds0hYacNcZIOt/zmrtWpmTGyamp55zsMNRiHBq+U5Uf5LzmSBjERmRxZlx/lUvY9JwTh46PS4SF7HlGx2NMVO05HhST8V6C+LarEhbOH2usIgc3v+y4SswjPjKzplbVGyftNiAb3F8VI8CYkz+kGTOlapurb3fWp7hkBCYhe/kw1JWy5motCPVFHuafZzWOqHKJf3NUlVHMMNzUYUOVdkOLhMoOanjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zM504avHIozvkFLs19pzXyt3yFGjrzBaMKr2YWtrQE8=;
 b=lGuXNOv9ikkVKUJZMkC7dtNLFImM2casrKqEPwdLFdhcomPND5Id3fjxlrE99gHzK4FccI4zt+uLjVHm4p8FAllnlmg01lsFemUVDDrNdfyygyXrnd8FNFs8ojYftNCjp1K08eOREEcwA5HUhOyfQEZCXZbb/kb8pBG/yPelB2MtlDaopo34PHulDz2uPmbSmkSDwLMXpzl5cPmZEeFyWn0crJLd2O7X9zoR6SlMo7RmvJB1KzR3C7bD98DyToFnbkg/SamTguUGuN9MpbGl9rLGYcVuhslAEIRwCSpwD6d/KKFFupzsPR3PA6clFZWsDOdKZCay+Ws1JRf9tYw0QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zM504avHIozvkFLs19pzXyt3yFGjrzBaMKr2YWtrQE8=;
 b=M31L4CbGus4XGcbKLPYwBT5X6ivekJWucoiWL0A94Vjgas8/pbvcd7KzseKVOzNLyHt/3TUhWcuZLVS/Ac4w1PahfaV+WQ7ieZp0i6UPHX/j2xyQu7oL4I0YnWU4B8PWGue7XKJBeKd3zPVCkguFfkSJvweoQLoYrHgNQWkM+OpDYVGGDLJNcel84LO/7n4DHUjl0bwobpBmSCcd2lCj0fWKBRKbzKtAE5xsdTnu+NwHAbEwvPFSyCeKgrLfSTJsA7LxYWrWPn7iBSnIEfZJa9Gn6mYD9QNPDsQobTqmd1C5Uutv2LX/b0Zvnult5Hg20guwrs3qMvDCrzUqH/zwZA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1546.namprd12.prod.outlook.com (2603:10b6:4:8::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16; Tue, 6 Apr 2021 19:40:52 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 19:40:52 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v2 16/18] vfio/gvt: Use mdev_get_type_group_id()
Date: Tue,  6 Apr 2021 16:40:39 -0300
Message-Id: <16-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
In-Reply-To: <0-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
References: 
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: BL0PR02CA0086.namprd02.prod.outlook.com
 (2603:10b6:208:51::27) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BL0PR02CA0086.namprd02.prod.outlook.com (2603:10b6:208:51::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.29 via Frontend Transport; Tue, 6 Apr 2021 19:40:47 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lTrZ4-001mXq-Ef; Tue, 06 Apr 2021 16:40:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 468b8762-ed5f-411f-9e30-08d8f933e02f
X-MS-TrafficTypeDiagnostic: DM5PR12MB1546:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB15469B038BAE01E23082BEC3C2769@DM5PR12MB1546.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: amKMwYWWwBZM6cA0zPuEqUAAs/YU3lhFXmhTMMV2UjaQLbXvaG972zmvL4SIh8YEvDcpG3327jd+Hw0qj75BzwkUPbH23hCNSccxYYmYwsg7y548rUmPhemnwPc5G53tKYNay9pCCFQWEbTpZDzA5I9TBrVK4u5E/CtWb1tUHQqT3hoxL/cDdqda62a+TGbZvGM/+mjuc1DvgiaS2jtVtMEiWZ5zMVPZn41/EtMpMsu9ZYpevEVBdvUd05uCVzIM/ok2l5jrrWSiw7/rsQy7CvtEXklP6UakkKI7/S+5dRI521lzqtfQy3vAcT8WAcvT6QY/7S7e9ihPhoM3MCOd5SYrP/9Tz9riu9DvgJOrD4b5gmiTu7dADEyNCtjjznRRKtw8x5k/pU4PL+6VAl61chmNhnOpdu/MH3JZ0BxkVdnbeKIuQRAkHEDy/2Nkw2wIvqSzkIo3T7hSVqOqrtrqLbdxlQ1jd9+J3UdbyTGPIA4hsbQWJQanueSATIHr2UvwSPuQawSUlYJ1RZQc2MZucoInrmvYbSzXhxzgqT6pOKHhu9d4fRgvQkhnn67XHrQPdRIFYEs+kvGJsXhY/l5zQOuA4AOfD+gwQXAEFciAG7LJPAOpwZqGX4KSsEbUttv8YD2APIy1zlFyNOIC8C8JrvfCkY4SqaVPOGE+/ij3TVHRExHMoGhaITaesspSe4Mo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(316002)(86362001)(5660300002)(8676002)(186003)(66946007)(4326008)(8936002)(66556008)(66476007)(2906002)(38100700001)(921005)(83380400001)(9786002)(478600001)(54906003)(426003)(36756003)(9746002)(2616005)(6666004)(7416002)(110136005)(107886003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?K4Ot7Ctaaqf1mVBFy/s5djrt1dBmfCpzEsWOC29HxIOmLilcTLWNl8dVQdlJ?=
 =?us-ascii?Q?UEtDUQzUlaNZ+AoRwQbK8k5azfn+yjdVCwHxViXs5nx0hNcQI6H75zd1Ya9f?=
 =?us-ascii?Q?nImCH9nPPrHWZm56VPZwr3KKH+YhTpXSdUvRhKXov+4fymVgdpfJwGUMttWh?=
 =?us-ascii?Q?cD2hGLGeYHguB9VR2XFwYoSF+8fwDjJqVlqppKftJaSfc3BWhQ2oOlauYt9+?=
 =?us-ascii?Q?EBAsBtI0XZhwYS6Pl42ItRZ5mhbebG2vdOzQtfSRHHMW/ZwI5ViIOEHBcoxm?=
 =?us-ascii?Q?jzuilZcUTEedKjYJp1UjqFM03+criQIDMJvAHkgQYZkoveGFaT2yaMnEpDuz?=
 =?us-ascii?Q?5JLcH83oyfeP+M4+1MfvrwjM2/4GecWED3yKtRtfK9+CNHTAbW7XG58zp5VC?=
 =?us-ascii?Q?jVka+Yomop4FuGH3snVaA2cGzY2LpxiWDHtiF2rLs89h5A1NmV7D2fA1+9XP?=
 =?us-ascii?Q?nZbBo24Tu8b7SHlVyXYMZlPD8KbHNTMrSbqxqV+cYuK8sF4g8M5PuHLtSRxL?=
 =?us-ascii?Q?re7s3LLF5NhtZIESMGxKYpxdODweWR9QJrQEz842wBs+1EPY+PJOktrFgpjZ?=
 =?us-ascii?Q?zmWMb2u4LZLkBX/QiGMsHRQjM6I71gjUoq0zPX0+KupKd3qGZ7VI1evzbisR?=
 =?us-ascii?Q?lCgCYE7xv1XepGmWM6ZagQZtWHkL444SOgpbin9wP6wlMKJRrE5Sr81xqQKa?=
 =?us-ascii?Q?7xCgSt+d9YoJ3t/oQ+Nncy4VQxrxnxRr+9ktyr1qOU7w1257omv4on43bnwH?=
 =?us-ascii?Q?P6Os/hDZiYqkIz11bIMz0U4L6dZNAdQnaHZQJWHX4WND5i8oe0hOEiLUq0Ma?=
 =?us-ascii?Q?ekxEm6UcMymW0cmSzPUVZZGzNXKNKmnJqLVJvwd2FZjJUBrxxQtYR1qSF0uD?=
 =?us-ascii?Q?5Qyxe6WPoVVxmMxjYGOEGs8zlsP6ERjxY5wI+p+t0uQKF0um5i0dkhE79mML?=
 =?us-ascii?Q?WYE+fm2lGwWqClgXB7xAt+UUPKKSjX3qmrSH0aC4X5WGDyKYowH4z2jAoldp?=
 =?us-ascii?Q?go5CzqAs9j0T5b3R6KxiK1LTydeT+YeeUI8CuiEtDJgBmh+z8HxBaI4OfbST?=
 =?us-ascii?Q?2rMvfDcgwh/eqC6scVI4/SyziAXDfTdniIVG2DZwhmJbGIkoWaeWM+o4rDu/?=
 =?us-ascii?Q?E8TkVU4um2ZYBsDyab13FAinCh1Utx2NWUcNXWNW8y/+iQrG7lh4e6ldLMj5?=
 =?us-ascii?Q?dh/fqLuJWy/hMhB5+cKdSi1Ee6/BFMtfJE464Psz27ebnW/XBUITttGQ4BuL?=
 =?us-ascii?Q?j/up6P4eeUQuRKW+Vr12hyevcsz47T9Lho11060o2wnV8xeFKNayS+HQHjaz?=
 =?us-ascii?Q?ZhhLBRLuDvUs41rFh59dZwPlPB6qc/i6knGAaMYhXqrgRA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 468b8762-ed5f-411f-9e30-08d8f933e02f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 19:40:47.9346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /adVRMu6mU4OA4+nsSOzhrzsnUw1odcBdxW0ADo8ilA7z9c4W3h5okL8GeVTLcny
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1546
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, Tarun Gupta <targupta@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

intel_gvt_init_vgpu_type_groups() makes gvt->types 1:1 with the
supported_type_groups array, so the type_group_id is also the index into
gvt->types. Use it directly and remove the string matching.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/gvt.c   | 24 +++++++-----------------
 drivers/gpu/drm/i915/gvt/gvt.h   |  4 ++--
 drivers/gpu/drm/i915/gvt/kvmgt.c |  5 ++---
 3 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index d1d8ee4a5f16a3..4b47a18e9dfa0f 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -46,22 +46,12 @@ static const char * const supported_hypervisors[] = {
 	[INTEL_GVT_HYPERVISOR_KVM] = "KVM",
 };
 
-static struct intel_vgpu_type *intel_gvt_find_vgpu_type(struct intel_gvt *gvt,
-		const char *name)
+static struct intel_vgpu_type *
+intel_gvt_find_vgpu_type(struct intel_gvt *gvt, unsigned int type_group_id)
 {
-	const char *driver_name =
-		dev_driver_string(&gvt->gt->i915->drm.pdev->dev);
-	int i;
-
-	name += strlen(driver_name) + 1;
-	for (i = 0; i < gvt->num_types; i++) {
-		struct intel_vgpu_type *t = &gvt->types[i];
-
-		if (!strncmp(t->name, name, sizeof(t->name)))
-			return t;
-	}
-
-	return NULL;
+	if (WARN_ON(type_group_id >= gvt->num_types))
+		return NULL;
+	return &gvt->types[type_group_id];
 }
 
 static ssize_t available_instances_show(struct kobject *kobj,
@@ -71,7 +61,7 @@ static ssize_t available_instances_show(struct kobject *kobj,
 	unsigned int num = 0;
 	void *gvt = kdev_to_i915(dev)->gvt;
 
-	type = intel_gvt_find_vgpu_type(gvt, kobject_name(kobj));
+	type = intel_gvt_find_vgpu_type(gvt, mtype_get_type_group_id(kobj));
 	if (!type)
 		num = 0;
 	else
@@ -92,7 +82,7 @@ static ssize_t description_show(struct kobject *kobj, struct device *dev,
 	struct intel_vgpu_type *type;
 	void *gvt = kdev_to_i915(dev)->gvt;
 
-	type = intel_gvt_find_vgpu_type(gvt, kobject_name(kobj));
+	type = intel_gvt_find_vgpu_type(gvt, mtype_get_type_group_id(kobj));
 	if (!type)
 		return 0;
 
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 03c993d68f105a..0cf480f42850d2 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -569,8 +569,8 @@ struct intel_gvt_ops {
 	void (*vgpu_reset)(struct intel_vgpu *);
 	void (*vgpu_activate)(struct intel_vgpu *);
 	void (*vgpu_deactivate)(struct intel_vgpu *);
-	struct intel_vgpu_type *(*gvt_find_vgpu_type)(struct intel_gvt *gvt,
-			const char *name);
+	struct intel_vgpu_type *(*gvt_find_vgpu_type)(
+		struct intel_gvt *gvt, unsigned int type_group_id);
 	bool (*get_gvt_attrs)(struct attribute_group ***intel_vgpu_type_groups);
 	int (*vgpu_query_plane)(struct intel_vgpu *vgpu, void *);
 	int (*vgpu_get_dmabuf)(struct intel_vgpu *vgpu, unsigned int);
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index b4348256ae9591..16e1e4a38aa1f6 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -700,10 +700,9 @@ static int intel_vgpu_create(struct kobject *kobj, struct mdev_device *mdev)
 	pdev = mdev_parent_dev(mdev);
 	gvt = kdev_to_i915(pdev)->gvt;
 
-	type = intel_gvt_ops->gvt_find_vgpu_type(gvt, kobject_name(kobj));
+	type = intel_gvt_ops->gvt_find_vgpu_type(gvt,
+						 mdev_get_type_group_id(mdev));
 	if (!type) {
-		gvt_vgpu_err("failed to find type %s to create\n",
-						kobject_name(kobj));
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
