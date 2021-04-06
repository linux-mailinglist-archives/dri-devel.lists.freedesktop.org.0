Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C523355C63
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 21:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68A86E8AA;
	Tue,  6 Apr 2021 19:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05716E8A4;
 Tue,  6 Apr 2021 19:40:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQ/WC9ASzH2rvyk15sNfrhPLzKP6Ry+iuBXoRfbPMCadEeiunu74DAlXJprlkFi12FP8N7vPWBa+c+xm4tobFi6tmy//tgUdFZ2+RMweodRqATN6bhLx13YaLgHOVpLuJC0wbJRTIreay3sryDPK5URHCRdxqkz5v4KI5wyJuoNz+xH7teQkF+mzJ/+wgKSMGhW0xWnWdFO/Cu85vN6pPuVfQs4mCtrJWwYhk5ltznbGhZLYFnHq0NtHJCOqAGSdpJWaMyyPA1pYkkMPeKdQPz2vn+SLFvWZ+BIsQ0EM+Dz17Yf+hk5fSpzrsBzaGTOkRl1SdzRe6JjywecxFWJ5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoTSSo2mx2JDguO98N5mVfmZp8fU/kZU2AK7qmfO63E=;
 b=dds+terChKSrBajzIDVFnmTivcNktrdETj32zv4iHRow+gbkuScSFA8cD6CDJCvX6E2gVj+0qnieuE8V0zjgdsiuVTwJN1Z+djkklrc8w8cFpnCTZXMbL7No3LZauyowUkuTDT6e0KW8YrLqh/bbxj031VhhqgCTgox/2B98v0y4soCN+wSENbZMrrpWB3LDo8W7YmxyUYIiEXDHTTgbUmljWJkgmJsauSCAVC1wfjdGwgfX8KTKvaLZr/hvgufKsPGW4wbx2tvaKyiqqfJsU+fgTkfzid7rJ5FKpk3hpRtYwaenMEd9OYtw46Jr/olIaoUCfNmdp7JBT1cCQSeGzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoTSSo2mx2JDguO98N5mVfmZp8fU/kZU2AK7qmfO63E=;
 b=MqMRCrqej1HWwxLNr6MXMttUblKZtaal19fgRpmTwdvqbTvsEO4JFXSgjJdI76uw49BWWqd1BHFc7eccIobzPlI1OXO8bX7l1Q4krE5NMa4xGPMhtZR7B2uW5g8+zDE5hL3BD4VctMopW6KeuK0G8ai/CrZ+FowmlsrSQnt65QLlrZndvTkbwUWmRR7C9RqCL2yPjGeex2k/sEGIgGYaDGcLLfk2pQ94zrU8EBmHh/8aBtha1NUIt1tQGh4laIprAteEJ7iIhEsU1EiLlxfllv1FMEFmCwGuaIgthqT815Vb6DVYstSN0Dsp3l36Hi8JGUEkzckVd7xLOF3HJVJPCg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3515.namprd12.prod.outlook.com (2603:10b6:5:15f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Tue, 6 Apr
 2021 19:40:46 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 19:40:45 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v2 18/18] vfio/mdev: Correct the function signatures for the
 mdev_type_attributes
Date: Tue,  6 Apr 2021 16:40:41 -0300
Message-Id: <18-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
In-Reply-To: <0-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
References: 
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: MN2PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:208:134::15) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 MN2PR16CA0002.namprd16.prod.outlook.com (2603:10b6:208:134::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Tue, 6 Apr 2021 19:40:43 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lTrZ4-001mXy-HM; Tue, 06 Apr 2021 16:40:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e38573e-dc31-42d5-0ca4-08d8f933de16
X-MS-TrafficTypeDiagnostic: DM6PR12MB3515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3515E2DC938A6BD72B6AB8FDC2769@DM6PR12MB3515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Db7K+JErXl0Kd4wEDxsxs7uM9L5m7KtAfaHh0FA5p0hwodW3oLmI1a/CD40sf/XF9Yy54kPG8ELybolAO0QaVCrOKTUxhakYZl8kuBBt8bFKkhsSRWJSQV0l3X+SQioPHl+f+8PPud7+vhey6t1d7VN4YBxv99ps8NkpvOR97HklqWJW9nuGV99P9Mff5AE+jfHEzxgBO3m94x+q7a3Bj4YvRtPKXNI4l/rsI6gKQf+x6IgiYhDXYbLIDYImPN6C8Zq+QSFGOXTyt8u6cpv5JDvqdUClmVprN2LxeZzmnBv54rMZSds8qW6yM56xo3KkW4OpAiXS46idDy3YhWH0JklhrewjenP3wtdTq7DJoJDgPrHqRV6EvwveTjrnvavA/1nnw91uHIyA/MqZEmbJJEqu1uhfr71kiqk9IM7DNi3bVEy3DWBAtI9LL2BMaUFCTOyTXw2TmLPV/MxVlCGizWrKE4kwry16apiPK8BMN3X8wlfN3ksTnewbWhLxbPn+2YQSAC7LF5U/f6RM23UYzdta68hKaO/hyfsctTpLKCQ1dTlyPPIlaR1W1bvWYnaxOiSJq2TlvE2NMbkFYR4S+/BHSBCwmHtX1v3tcGC2t1a/HCDp78Idi97Oxx3EqqNhwvpYDZVrZDULIgCa2kE9U8Cw1NTGYmQFBl2+xI+a6OI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(9786002)(54906003)(316002)(110136005)(83380400001)(86362001)(8676002)(26005)(426003)(186003)(66476007)(66946007)(2616005)(7416002)(38100700001)(66556008)(107886003)(5660300002)(4326008)(9746002)(2906002)(478600001)(30864003)(8936002)(36756003)(921005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?E+QjFWxhWfvCanJy9MoQjJucRJHPZ88I/xPBVLcZXEp6dXgvlNrL6ToJ1NaS?=
 =?us-ascii?Q?3qrkOMlam9CDyLwj4lrxxVSlJPZNfaFPM9pPh600gRVztsHiGN3wQSDsLrV1?=
 =?us-ascii?Q?Eep4VTCS1KaydIrd4YqbEnBrpMYS4mEmVQh+AvJMrC4sDvQDf3S6UtTEWaq0?=
 =?us-ascii?Q?jEL8GchJBePPQUrhPbapy1JI1R9g3T0mDBy+AakA0qp6m4A4GxQkIYk3UiL6?=
 =?us-ascii?Q?L8B1iKPD6yLIihOU5guO8QELt0TmV/wAk0sRmToJK67gaxT+KGVl4mm6ksUF?=
 =?us-ascii?Q?EgPcEG3Iz6UKb8g8gcNocypVN3zjpL55SCHWC7h48tnyMdjHn1Msje8nb2pI?=
 =?us-ascii?Q?LwyIc7Ma9ATIwF+yXrirI2rC2X0QbwqcW39hLm6YGNsQcFuHElcaIXbNL+KX?=
 =?us-ascii?Q?bg7aXVct/l5y5JcnTEpRDK8SbLCicOA9w+tFiGARxRIruAPwBn4nV5731GiD?=
 =?us-ascii?Q?B2hHlMi/NEFHfA3TKbLDHR4rJNg9jd+KYQHJ1Jr+n+mCge2NoPYWPLZy0Slg?=
 =?us-ascii?Q?49rKs/r1pdIBf5tFHyJ9jkqzPDpBEncL7qZma6u+CgYqguxyDR6i5fUQFN+R?=
 =?us-ascii?Q?XoGHgSICFawWRndIGi4rvjDO/B96zu9WIxE8eug1+pN/lMJT81540RZkQ5/2?=
 =?us-ascii?Q?+XDV1VNVfh1XgoN3/Ghhc4hkkSr2tWp4r8PPDmpFImQyTyz1nd45FHjc/dki?=
 =?us-ascii?Q?vo9+rsNm4SlVV3fT7n//67fjuWAin/RlI6tLLFY6SBfVeb8kBpGY8XX3Gn9j?=
 =?us-ascii?Q?yrDP2mE9Jm9VpU6WaxcL/q0JjMiiyUMUR1FJPWbyKXwayp6g93M7ecSxoPQX?=
 =?us-ascii?Q?RbKnfIgHU3MSCTLxXz2lnCb2pz93hvOF9qYeOQIz1/YATVg2Fq4GrwEIXQMd?=
 =?us-ascii?Q?PNNjtSNY6qsDMjtGRcsbcwok//gZ48PTysScf36h2mfu8otOd4rDTskSLpZm?=
 =?us-ascii?Q?C63jC8CKe/+ZvXVQF0UL8aHpUtO4F/CMsD4bkP5NplVhd72FhM/mqOrkEfhD?=
 =?us-ascii?Q?Hvjm/1JoPJPm9Mt6vWtUJqv+deS1n/9m/QKVSgAFm8/cjXIaIMh4lnljZB32?=
 =?us-ascii?Q?9UNIDHiYVsjxcWEsNlE+b3v9/TB2PaY2RtDoF5m36D6X6BMj6jIGoeb/uT8/?=
 =?us-ascii?Q?yYIU12NXmq2iGCXipiDgLvoRLoTUBIxzHeyY0ZMUmeKHtKBfDmkkzOR8hijj?=
 =?us-ascii?Q?EwiZ6YJdH8D2lyjVn1TciPg5uslm31zCM4YTXXOwhh7H1dd57xbEyElXfpG6?=
 =?us-ascii?Q?qYmWeF+bl+QUzzMgB1DJKM2HUHHJu3mXxUoVLeZ4tZvwnizvX1jKWChF6Gmj?=
 =?us-ascii?Q?N+maJi3fEDeoLandg+OkG7VSUpvCJaXAU+gxtaLrgel+fA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e38573e-dc31-42d5-0ca4-08d8f933de16
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 19:40:44.1298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIOfr0N9BGi1+nxRDUA3BjnHate2SY6qiGnA1PWFlNr4sDiBLcf8l5MCojQfex05
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3515
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
 "Raj, Ashok" <ashok.raj@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 Tarun Gupta <targupta@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver core standard is to pass in the properly typed object, the
properly typed attribute and the buffer data. It stems from the root
kobject method:

  ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,..)

Each subclass of kobject should provide their own function with the same
signature but more specific types, eg struct device uses:

  ssize_t (*show)(struct device *dev, struct device_attribute *attr,..)

In this case the existing signature is:

  ssize_t (*show)(struct kobject *kobj, struct device *dev,..)

Where kobj is a 'struct mdev_type *' and dev is 'mdev_type->parent->dev'.

Change the mdev_type related sysfs attribute functions to:

  ssize_t (*show)(struct mdev_type *mtype, struct mdev_type_attribute *attr,..)

In order to restore type safety and match the driver core standard

There are no current users of 'attr', but if it is ever needed it would be
hard to add in retroactively, so do it now.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/gvt.c    | 21 +++++++++++----------
 drivers/s390/cio/vfio_ccw_ops.c   | 15 +++++++++------
 drivers/s390/crypto/vfio_ap_ops.c | 12 +++++++-----
 drivers/vfio/mdev/mdev_core.c     | 14 ++++++++++++--
 drivers/vfio/mdev/mdev_sysfs.c    | 11 ++++++-----
 include/linux/mdev.h              | 11 +++++++----
 samples/vfio-mdev/mbochs.c        | 26 +++++++++++++++-----------
 samples/vfio-mdev/mdpy.c          | 24 ++++++++++++++----------
 samples/vfio-mdev/mtty.c          | 18 +++++++++---------
 9 files changed, 90 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index 4b47a18e9dfa0f..3703814a669b46 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -54,14 +54,15 @@ intel_gvt_find_vgpu_type(struct intel_gvt *gvt, unsigned int type_group_id)
 	return &gvt->types[type_group_id];
 }
 
-static ssize_t available_instances_show(struct kobject *kobj,
-					struct device *dev, char *buf)
+static ssize_t available_instances_show(struct mdev_type *mtype,
+					struct mdev_type_attribute *attr,
+					char *buf)
 {
 	struct intel_vgpu_type *type;
 	unsigned int num = 0;
-	void *gvt = kdev_to_i915(dev)->gvt;
+	void *gvt = kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;
 
-	type = intel_gvt_find_vgpu_type(gvt, mtype_get_type_group_id(kobj));
+	type = intel_gvt_find_vgpu_type(gvt, mtype_get_type_group_id(mtype));
 	if (!type)
 		num = 0;
 	else
@@ -70,19 +71,19 @@ static ssize_t available_instances_show(struct kobject *kobj,
 	return sprintf(buf, "%u\n", num);
 }
 
-static ssize_t device_api_show(struct kobject *kobj, struct device *dev,
-		char *buf)
+static ssize_t device_api_show(struct mdev_type *mtype,
+			       struct mdev_type_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
 }
 
-static ssize_t description_show(struct kobject *kobj, struct device *dev,
-		char *buf)
+static ssize_t description_show(struct mdev_type *mtype,
+				struct mdev_type_attribute *attr, char *buf)
 {
 	struct intel_vgpu_type *type;
-	void *gvt = kdev_to_i915(dev)->gvt;
+	void *gvt = kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;
 
-	type = intel_gvt_find_vgpu_type(gvt, mtype_get_type_group_id(kobj));
+	type = intel_gvt_find_vgpu_type(gvt, mtype_get_type_group_id(mtype));
 	if (!type)
 		return 0;
 
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 10407cf67583c6..491a64c61fff1a 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -71,23 +71,26 @@ static int vfio_ccw_mdev_notifier(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
-static ssize_t name_show(struct kobject *kobj, struct device *dev, char *buf)
+static ssize_t name_show(struct mdev_type *mtype,
+			 struct mdev_type_attribute *attr, char *buf)
 {
 	return sprintf(buf, "I/O subchannel (Non-QDIO)\n");
 }
 static MDEV_TYPE_ATTR_RO(name);
 
-static ssize_t device_api_show(struct kobject *kobj, struct device *dev,
-			       char *buf)
+static ssize_t device_api_show(struct mdev_type *mtype,
+			       struct mdev_type_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%s\n", VFIO_DEVICE_API_CCW_STRING);
 }
 static MDEV_TYPE_ATTR_RO(device_api);
 
-static ssize_t available_instances_show(struct kobject *kobj,
-					struct device *dev, char *buf)
+static ssize_t available_instances_show(struct mdev_type *mtype,
+					struct mdev_type_attribute *attr,
+					char *buf)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(dev);
+	struct vfio_ccw_private *private =
+		dev_get_drvdata(mtype_get_parent_dev(mtype));
 
 	return sprintf(buf, "%d\n", atomic_read(&private->avail));
 }
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index d319152dd484a2..0ce00c9311d378 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -366,15 +366,17 @@ static int vfio_ap_mdev_remove(struct mdev_device *mdev)
 	return 0;
 }
 
-static ssize_t name_show(struct kobject *kobj, struct device *dev, char *buf)
+static ssize_t name_show(struct mdev_type *mtype,
+			 struct mdev_type_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%s\n", VFIO_AP_MDEV_NAME_HWVIRT);
 }
 
 static MDEV_TYPE_ATTR_RO(name);
 
-static ssize_t available_instances_show(struct kobject *kobj,
-					struct device *dev, char *buf)
+static ssize_t available_instances_show(struct mdev_type *mtype,
+					struct mdev_type_attribute *attr,
+					char *buf)
 {
 	return sprintf(buf, "%d\n",
 		       atomic_read(&matrix_dev->available_instances));
@@ -382,8 +384,8 @@ static ssize_t available_instances_show(struct kobject *kobj,
 
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct kobject *kobj, struct device *dev,
-			       char *buf)
+static ssize_t device_api_show(struct mdev_type *mtype,
+			       struct mdev_type_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%s\n", VFIO_DEVICE_API_AP_STRING);
 }
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index 10eff33ce1f263..2a85d6fcb7ddd0 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -47,12 +47,22 @@ EXPORT_SYMBOL(mdev_get_type_group_id);
  * Used in mdev_type_attribute sysfs functions to return the index in the
  * supported_type_groups that the sysfs is called from.
  */
-unsigned int mtype_get_type_group_id(struct kobject *mtype_kobj)
+unsigned int mtype_get_type_group_id(struct mdev_type *mtype)
 {
-	return container_of(mtype_kobj, struct mdev_type, kobj)->type_group_id;
+	return mtype->type_group_id;
 }
 EXPORT_SYMBOL(mtype_get_type_group_id);
 
+/*
+ * Used in mdev_type_attribute sysfs functions to return the parent struct
+ * device
+ */
+struct device *mtype_get_parent_dev(struct mdev_type *mtype)
+{
+	return mtype->parent->dev;
+}
+EXPORT_SYMBOL(mtype_get_parent_dev);
+
 /* Should be called holding parent_list_lock */
 static struct mdev_parent *__find_parent_device(struct device *dev)
 {
diff --git a/drivers/vfio/mdev/mdev_sysfs.c b/drivers/vfio/mdev/mdev_sysfs.c
index 712fbc78b12e2d..f5cf1931c54e48 100644
--- a/drivers/vfio/mdev/mdev_sysfs.c
+++ b/drivers/vfio/mdev/mdev_sysfs.c
@@ -26,7 +26,7 @@ static ssize_t mdev_type_attr_show(struct kobject *kobj,
 	ssize_t ret = -EIO;
 
 	if (attr->show)
-		ret = attr->show(kobj, type->parent->dev, buf);
+		ret = attr->show(type, attr, buf);
 	return ret;
 }
 
@@ -39,7 +39,7 @@ static ssize_t mdev_type_attr_store(struct kobject *kobj,
 	ssize_t ret = -EIO;
 
 	if (attr->store)
-		ret = attr->store(&type->kobj, type->parent->dev, buf, count);
+		ret = attr->store(type, attr, buf, count);
 	return ret;
 }
 
@@ -48,8 +48,9 @@ static const struct sysfs_ops mdev_type_sysfs_ops = {
 	.store = mdev_type_attr_store,
 };
 
-static ssize_t create_store(struct kobject *kobj, struct device *dev,
-			    const char *buf, size_t count)
+static ssize_t create_store(struct mdev_type *mtype,
+			    struct mdev_type_attribute *attr, const char *buf,
+			    size_t count)
 {
 	char *str;
 	guid_t uuid;
@@ -67,7 +68,7 @@ static ssize_t create_store(struct kobject *kobj, struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = mdev_device_create(to_mdev_type(kobj), &uuid);
+	ret = mdev_device_create(mtype, &uuid);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index c3a800051d6146..1fb34ea394ad46 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -47,7 +47,8 @@ static inline struct device *mdev_get_iommu_device(struct mdev_device *mdev)
 }
 
 unsigned int mdev_get_type_group_id(struct mdev_device *mdev);
-unsigned int mtype_get_type_group_id(struct kobject *mtype_kobj);
+unsigned int mtype_get_type_group_id(struct mdev_type *mtype);
+struct device *mtype_get_parent_dev(struct mdev_type *mtype);
 
 /**
  * struct mdev_parent_ops - Structure to be registered for each parent device to
@@ -123,9 +124,11 @@ struct mdev_parent_ops {
 /* interface for exporting mdev supported type attributes */
 struct mdev_type_attribute {
 	struct attribute attr;
-	ssize_t (*show)(struct kobject *kobj, struct device *dev, char *buf);
-	ssize_t (*store)(struct kobject *kobj, struct device *dev,
-			 const char *buf, size_t count);
+	ssize_t (*show)(struct mdev_type *mtype,
+			struct mdev_type_attribute *attr, char *buf);
+	ssize_t (*store)(struct mdev_type *mtype,
+			 struct mdev_type_attribute *attr, const char *buf,
+			 size_t count);
 };
 
 #define MDEV_TYPE_ATTR(_name, _mode, _show, _store)		\
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index ac4d0dc2490705..861c76914e7639 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1330,37 +1330,41 @@ static const struct attribute_group *mdev_dev_groups[] = {
 	NULL,
 };
 
-static ssize_t
-name_show(struct kobject *kobj, struct device *dev, char *buf)
+static ssize_t name_show(struct mdev_type *mtype,
+			 struct mdev_type_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%s\n", kobj->name);
+	const struct mbochs_type *type =
+		&mbochs_types[mtype_get_type_group_id(mtype)];
+
+	return sprintf(buf, "%s\n", type->name);
 }
 static MDEV_TYPE_ATTR_RO(name);
 
-static ssize_t
-description_show(struct kobject *kobj, struct device *dev, char *buf)
+static ssize_t description_show(struct mdev_type *mtype,
+				struct mdev_type_attribute *attr, char *buf)
 {
 	const struct mbochs_type *type =
-		&mbochs_types[mtype_get_type_group_id(kobj)];
+		&mbochs_types[mtype_get_type_group_id(mtype)];
 
 	return sprintf(buf, "virtual display, %d MB video memory\n",
 		       type ? type->mbytes  : 0);
 }
 static MDEV_TYPE_ATTR_RO(description);
 
-static ssize_t
-available_instances_show(struct kobject *kobj, struct device *dev, char *buf)
+static ssize_t available_instances_show(struct mdev_type *mtype,
+					struct mdev_type_attribute *attr,
+					char *buf)
 {
 	const struct mbochs_type *type =
-		&mbochs_types[mtype_get_type_group_id(kobj)];
+		&mbochs_types[mtype_get_type_group_id(mtype)];
 	int count = (max_mbytes - mbochs_used_mbytes) / type->mbytes;
 
 	return sprintf(buf, "%d\n", count);
 }
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct kobject *kobj, struct device *dev,
-			       char *buf)
+static ssize_t device_api_show(struct mdev_type *mtype,
+			       struct mdev_type_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
 }
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index da88fd7dd42329..885b88ea20e234 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -652,18 +652,21 @@ static const struct attribute_group *mdev_dev_groups[] = {
 	NULL,
 };
 
-static ssize_t
-name_show(struct kobject *kobj, struct device *dev, char *buf)
+static ssize_t name_show(struct mdev_type *mtype,
+			 struct mdev_type_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%s\n", kobj->name);
+	const struct mdpy_type *type =
+		&mdpy_types[mtype_get_type_group_id(mtype)];
+
+	return sprintf(buf, "%s\n", type->name);
 }
 static MDEV_TYPE_ATTR_RO(name);
 
-static ssize_t
-description_show(struct kobject *kobj, struct device *dev, char *buf)
+static ssize_t description_show(struct mdev_type *mtype,
+				struct mdev_type_attribute *attr, char *buf)
 {
 	const struct mdpy_type *type =
-		&mdpy_types[mtype_get_type_group_id(kobj)];
+		&mdpy_types[mtype_get_type_group_id(mtype)];
 
 	return sprintf(buf, "virtual display, %dx%d framebuffer\n",
 		       type ? type->width  : 0,
@@ -671,15 +674,16 @@ description_show(struct kobject *kobj, struct device *dev, char *buf)
 }
 static MDEV_TYPE_ATTR_RO(description);
 
-static ssize_t
-available_instances_show(struct kobject *kobj, struct device *dev, char *buf)
+static ssize_t available_instances_show(struct mdev_type *mtype,
+					struct mdev_type_attribute *attr,
+					char *buf)
 {
 	return sprintf(buf, "%d\n", max_devices - mdpy_count);
 }
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct kobject *kobj, struct device *dev,
-			       char *buf)
+static ssize_t device_api_show(struct mdev_type *mtype,
+			       struct mdev_type_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
 }
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index f2e36c06ac6aa2..b9b24be4abdab7 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1292,23 +1292,24 @@ static const struct attribute_group *mdev_dev_groups[] = {
 	NULL,
 };
 
-static ssize_t
-name_show(struct kobject *kobj, struct device *dev, char *buf)
+static ssize_t name_show(struct mdev_type *mtype,
+			 struct mdev_type_attribute *attr, char *buf)
 {
 	static const char *name_str[2] = { "Single port serial",
 					   "Dual port serial" };
 
 	return sysfs_emit(buf, "%s\n",
-			  name_str[mtype_get_type_group_id(kobj)]);
+			  name_str[mtype_get_type_group_id(mtype)]);
 }
 
 static MDEV_TYPE_ATTR_RO(name);
 
-static ssize_t
-available_instances_show(struct kobject *kobj, struct device *dev, char *buf)
+static ssize_t available_instances_show(struct mdev_type *mtype,
+					struct mdev_type_attribute *attr,
+					char *buf)
 {
 	struct mdev_state *mds;
-	unsigned int ports = mtype_get_type_group_id(kobj) + 1;
+	unsigned int ports = mtype_get_type_group_id(mtype) + 1;
 	int used = 0;
 
 	list_for_each_entry(mds, &mdev_devices_list, next)
@@ -1319,9 +1320,8 @@ available_instances_show(struct kobject *kobj, struct device *dev, char *buf)
 
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-
-static ssize_t device_api_show(struct kobject *kobj, struct device *dev,
-			       char *buf)
+static ssize_t device_api_show(struct mdev_type *mtype,
+			       struct mdev_type_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
 }
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
