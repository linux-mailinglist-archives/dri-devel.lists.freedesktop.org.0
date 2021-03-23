Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F953466E1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB2D6EC65;
	Tue, 23 Mar 2021 17:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1316EC63;
 Tue, 23 Mar 2021 17:55:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfayhXybrh2c62i+06dTnC200wpcy7/xoHItak3FQ/dmKMC1uACW1mPpPT1mMoQLKZ/c3MQ2SqzF154GNW7gqb6Ie4fC2dzcIhqWzcOEk22EQw6rGIlIRGf26C4mLNdc273zxUZI9pDHGaHnfHWcQrt5X29P5tZYVMcUdSqmQKJjlFzeG5Z6O85GVfsd8MQYfhh0qXokGlISL9JmBDtrCAH1pNR3WshLeHJ3WCBzN5wzPdl3ciK6fXfIjvoPpnCfq/qGnItc7CdjstQF+02Vbu7v47jFiaeZZgYRDLqzzOfD1cia0vhDSynKwHBblEObJdlFjTv/ZKtVg9SKKOvQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ps70pD2M8y/jzVH2RadgWVUs+U7+B7YumeT5Y0MXiC8=;
 b=iFADIqQ01PHQTsHy5PFQobysXQWQ/XUX+jbAgkZl0qqQlLEgVzSdc+1cxJY4gdb7nJtFuK+3WKiL5BRIi6fZbqGKa7WsCfSUdzhiGGO9QY7rc4SszC/v7tXZ3LoCqeEwBMGyD4kyc2fsf5QJJ7tPUYC8pCjdJzsl6940B7CyrVmF40Gmit5w9QFofeywj4hShLBmgY4ZJ/JuT2T1qKk+/lG9HX5jsJaM/4LsVo0qbITXW82EjsEqBz7+gVLMizc2OY09lWk1rrlKEL+4+y2Rc+f/QBskVoH5QJqNb035g5tqi4jOIZFtleskbm+h/zdEiGEYOpg/d3NPinOHyvcC3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ps70pD2M8y/jzVH2RadgWVUs+U7+B7YumeT5Y0MXiC8=;
 b=rTpUiNZTkJZIxkMftWmr5I6n1xtr2IrpGo077ZkJOc20TI+FLi1bJ9iNjwFxOkPNCcmpgXj5dDumpxvw6flKNJsjSq3IUTaCjmszw208xGoeOGIsQFJWpE/ssEys/RohkhEnrpYjZuv4GAF/ZOMsO5tbAXTnNSAhdyc1tiDMAIkTrXIfVGJR1JEeqGLO02dEp75m41H0If+QojxFI2CMHtMWMcTMy/rrlqRkOA4kVo3XFH6fSWpgw9f8oxjwhsQC4nl7sAjDXKeZ0oWisQIYyp+44M/5orRwuySHEW0048W4mJkWOmj/2RoKY2SqVKw2AoKRxNtXpL11tAxJ5chPzQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4943.namprd12.prod.outlook.com (2603:10b6:5:1bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 17:55:44 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 17:55:44 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 16/18] vfio/gvt: Use mdev_get_type_group_id()
Date: Tue, 23 Mar 2021 14:55:33 -0300
Message-Id: <16-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
In-Reply-To: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
References: 
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: BLAPR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:208:32b::11) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 BLAPR03CA0006.namprd03.prod.outlook.com (2603:10b6:208:32b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Tue, 23 Mar 2021 17:55:41 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lOlFf-001chP-RF; Tue, 23 Mar 2021 14:55:35 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bace1b77-7578-4bb7-d13f-08d8ee24dfeb
X-MS-TrafficTypeDiagnostic: DM6PR12MB4943:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB494305A307D7237B9E8DBEE8C2649@DM6PR12MB4943.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bi2dw13AUhgxLZdin76QjASeA56tOW+ydbfkGkDlqScBtfQRB9LXjTp5Ez/drE8309u9eQbMP1QOdAKAtOAPamj+/a8k6mZjXomOMj7WyKnj7suyFpigVoBRJ1w2eL+Irp2paJi/59HmPNdvMTbYPk4BjDgGVNI5lZGbszs2YXxSiLp4OQKgS4DwHUZIL8L9WPK9Fgb420noVkmiENMRvOJ4eDsCCY4OtQVGBvfUbBGW+oE9H/LXRWY4tImJlrsIROrWtVlGgIWl0BBWoN6uvWgihwtnnkPu2COrHN7gK8CkeyV8Ia4BH1sCMs+X/FR/ldpA2DBrZWqfkG+wDXzTDt/Ikhf8d2b/PXddV4CoHFV1qeSc0iDCsUcKZGMNo6HFwrvRzhqGUVtajZT5NkQeeUf5Pr+VV/fia6JWdcLiiTRNN56cSKgIPN5AjqLnkUCcNzD0WyuHCmDew2ODG2OuKyulLNBtBJH/a3UOzRonoOruJ/3I3A/9pzCwrSm9EGOgjpYQnk+xZJylMDnqLRH/QNj1EXwzFodeXgRSRo6eK58H0BheaNhPsg+J4VujLR8zfquD0UeiLkNNopwm9XN6f9bx1SBB5bigRuYXLWpl0qFj60nSOkNRYG9XVHyEw+aFD0wMw3Srt3al4Budb14mR4jiYQWWlVf0vCp95qNPHeE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(66476007)(186003)(107886003)(8936002)(110136005)(36756003)(426003)(86362001)(54906003)(83380400001)(2616005)(38100700001)(921005)(7416002)(66946007)(5660300002)(478600001)(9746002)(66556008)(8676002)(4326008)(2906002)(26005)(316002)(9786002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?x17/0stSSz04nYOwVaaF/qBr2WEIwKkov/enjzciI6xatoL/Gfa/H7RcKmxD?=
 =?us-ascii?Q?+Xy8vjMYIW/uJEjj9UIbHsMpirGHw0w/T3kC1Rk1sK61vV1xkGNrTtlmEGgl?=
 =?us-ascii?Q?l8UGcOH9w7we2NN0I+xTCL0QUpDuyEZWcfHzx0qibXJnT20APFvG9s7dhJX7?=
 =?us-ascii?Q?TpGoxYGyn31az4iSxHRKHOpfOlpZWvTJEhEdnnclXYgCpMyIiIm61YuVAxTi?=
 =?us-ascii?Q?c1vNyYxMdGgZTJ5KwP8hNGnOxmZG3VuJGyPEPwsxxvCfktY3AMwSOg4N9Qs1?=
 =?us-ascii?Q?4qoG9Fo09QmBXI6a4pZYFLFeJWYlq7JsgOh714cAOMPQziYPnqmOfOITm4Hp?=
 =?us-ascii?Q?e6PcoDLpROz6aQKZyaThw/zFohUXY9wI36+VF5/k9iemCOObEAno8hocvANU?=
 =?us-ascii?Q?3mzFFii6K4BaNp1OSMxre6VCFon8NAY+DDKCL8n5biBNcJfSInncGg/wzyqp?=
 =?us-ascii?Q?b8n10mpDHuN4WAz+x/zBdFhlBULvERh5oL2ZLpQxf4RFrNMl9/TK+mG2ab4p?=
 =?us-ascii?Q?+KryWNuGKlWFYWFk5wHEVfn2ZJ48GCHYKjYjvUXFMwWxsqaiQDxlMTswEKdN?=
 =?us-ascii?Q?s/djWnXwwUxr8bEqH8FzDtEwrtp5ZHPchT+569Yn8tZoyvpXekVJvCUhOgXf?=
 =?us-ascii?Q?5joDoqp1EB8LyFtr7sx8B0kQbwKGkmkcYXlha2gJFR4W6JQ/OJ0Cx71D3MjB?=
 =?us-ascii?Q?Le5431xCx+razdC94KxBMKCR46RnQTzwh50USw3STHFYUNygn729IIzqSWkn?=
 =?us-ascii?Q?cSfT7NEHa/2km3ogN28fhDmE6WJR605c1QB+YYtJrhPdVLxdOeVd8z28kiPD?=
 =?us-ascii?Q?jAoL2VQLHHA+8CzIIsajfPNQPUVuSiIqwXzJ7Lc+1BiJ+d565TQKMyji3i8G?=
 =?us-ascii?Q?bKvzcEq5KMFktVdL5jb9wKjfdv0Q/Qm05FC2l5tarfS4Lq8o467XgP6paM5m?=
 =?us-ascii?Q?sDPziTiisi4rE0obq6iG7Teqku0QEw0Gq4ERqgzIQHe5yTddFbLoJrreSEGm?=
 =?us-ascii?Q?NW5Pv57ncgC8E38XWCAcJ4lQzHiCj/nQdQYZ5kmZ6mxBUJGgOeuL9brWT4Md?=
 =?us-ascii?Q?9X8YesPlQ5pjZ6jeUDTWVCVTZ+hbUIt+P8GtkeSucFBmEDq27BaPZNJytUdi?=
 =?us-ascii?Q?KHms/tYVWJTb3UN67LHljRaykL8GJf5E52AvfrytRwVnVMtojr47kpsBCEJA?=
 =?us-ascii?Q?+JF27lfbO3W3bdrcgIbML2wP2Eb6crNuFLN3JVP2VWdvcJkNOdbDZbDD8er7?=
 =?us-ascii?Q?UUpJj77/2wiSdCqQIEvvrSzT7JaZb+/x47HRNnQ6LquI9/8Jlnpxo644jc1z?=
 =?us-ascii?Q?9HPTENm4RrRXS9bqDC6ewwkj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bace1b77-7578-4bb7-d13f-08d8ee24dfeb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 17:55:41.8740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqGUEX+1RZlBx+zD/sAS/XkSaJl+4/LUi7/zWbxra81iwaHlEbqlfVnj7XQFql4r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4943
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Tarun Gupta <targupta@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

intel_gvt_init_vgpu_type_groups() makes gvt->types 1:1 with the
supported_type_groups array, so the type_group_id is also the index into
gvt->types. Use it directly and remove the string matching.

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
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
