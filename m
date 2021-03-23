Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ADF3466E0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEC36EC63;
	Tue, 23 Mar 2021 17:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A40A6EC63;
 Tue, 23 Mar 2021 17:55:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWlunjek235B2U0Gc4fc++vxKmZ+6FdUJj2ObP5b36DPhXXm1Oz+mAHimC5xRqlWK86DEgWXKEiRNGit2z9W34s0sjZjQRn+OA9H7yfzupk5rk1Gl0MtpER5bmQtSud3oShvnV7cPxy9kIpu1rBgAKwb1DoKV0YamCake5Dr+WCEPvox+iCsGHgVfUSkXmX8/UJpgGwjTau9A8MECVcuENEqY67eTb17gYyWMw66HzCCdH01aQ3wJx6fjtCNBXl7ZzMAG3qpGnyuIPlVzg9P5IulB8h2i+35Ecvr+UuxgqOFkB2CsnX6ty8Ko3pdZwQOGshhpxzbFmxLIWmv5QrzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8A7BxrPoq9ucCPHa022cU2jcTVY8lETztMgoYJweAkY=;
 b=JRGmYBiyokOkrI7KwKRQnYLX0P4eTN7h0mXlXAUcJQ0cukkCQCwzQG1ytLxK6DdkUm8dR9/5aETx1j2N410Q9G2S18ePPcSqx32iatVjYTFatjSzp+tANQ5X/fjirRXplJSsCBIfvNBikPLOR+6PrkwVjjQ0OaTK3tTugRQ+Htx3pwxdazpdJKQlal18BHEUYOOyUkq8KRJOabe3HFNFHFJurUYPCiWXlnroZ3QMPx6PzxVmD7/6+OZbE6382Z18iFBkmrRAegoR1hQw3MfbrV50FsJRFVaftwbViZzLPUlHzM6Ipen6Ae+46lDm2OdGEh0aTVqgWNeDOGHeglaZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8A7BxrPoq9ucCPHa022cU2jcTVY8lETztMgoYJweAkY=;
 b=QmW1KAMm72FpHRRGpID0AW75rZ+4WrqBPIr/dgPdoGTGJY5O+c3vm0dQDC4cyf4tlG4aIs090/o4wT1gT7qqk/T8lgyNmLaJlJVykvR05iJNaFbZ6Hwvo42Ohhfzto52kCj6lTu+FuTNv+FXHXCBpQUGVYzlv0p8n+mPfp77Vf/r80yET6GkzhAjnY7BgJhoRWUR2e71v2LQCdIpRi+EEX62HhXS2Qw5/Ewqes0d+5hjsGnfCCtdnpvasvhPJRNXLCpKDeyBpl/i/z9rAKstjujCbHoJoXI6OKnQLYO8HNjP4XuP5vELRNX9SNmCzVCBz+wn6AMX++onFG2dLRNVLw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4943.namprd12.prod.outlook.com (2603:10b6:5:1bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 17:55:43 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 17:55:43 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
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
Subject: [PATCH 18/18] vfio/mdev: Correct the function signatures for the
 mdev_type_attributes
Date: Tue, 23 Mar 2021 14:55:35 -0300
Message-Id: <18-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
In-Reply-To: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
References: 
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: MN2PR18CA0015.namprd18.prod.outlook.com
 (2603:10b6:208:23c::20) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 MN2PR18CA0015.namprd18.prod.outlook.com (2603:10b6:208:23c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Tue, 23 Mar 2021 17:55:39 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lOlFf-001chX-UB; Tue, 23 Mar 2021 14:55:35 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21d446ec-a206-4ed5-6992-08d8ee24dec4
X-MS-TrafficTypeDiagnostic: DM6PR12MB4943:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB49436C6773DA75872CF9A267C2649@DM6PR12MB4943.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tPp9VMFVOIvXCRsVkV6SWORMvw918omC61F2wHIlfSFd27o3tEnyW5HS39mQ1JHf2d/efboY75HF8uPtamaOwJ2SuJB92yTk+RKxsE2/0/8vJ3PRaEyoruNV1JFN+2Rug1GW3B6/X4h16ZWxRX8o5Xd5dvGvTQpL5m+YHjkPLVYgqFvN6szn8cEPHnWHrPUgToB3toJGUq46vCuVlWFAEffrad17uTr3cPJZuFbtJnUwg+A5LJ5CMm1AcjvHSqMoK19aAyf5AGx8EVJU9zquhFYlynyv7yswJAbLzftcGtidYDhmKgjcuQz6CW0us+hpSqySz5eCjIzFRwNhCUdhf9aMTCr5nk//85dr0iJKGaLakksaG+tuW329EnxNZf+5tIrgQL5AkUZK3c9tj0FSQYmXjxeeR04OldeTHTuYk/DwmprsdFzjYyB0c7ulTNniEe81OrdnDYedam22CnBJ16ycNi58Trdcq0A16sfBxPB7dZR2tzuniAcM6vpycKT34K9ay/EFiIVc+COG7JQ1etw0CFPwz94rV+zDZeJwZlg49PveUyKp1di8gdybxwl03D5o1nf4uyvx4k+jF4DCJ1ac36UNnFAoLwmEqCf6xYNZzNvQvriOO9GoljvX9tzZVp/1IYLrDMDF1GxLzjhVlhZEfat0Ng5L7dkvonCTCgQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(66476007)(186003)(107886003)(8936002)(110136005)(36756003)(426003)(86362001)(54906003)(83380400001)(2616005)(38100700001)(30864003)(921005)(7416002)(66946007)(5660300002)(478600001)(9746002)(66556008)(8676002)(4326008)(2906002)(26005)(316002)(9786002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?S4YkBffW/fJ36ABKRhabNaF+WMxeX4MQwG+fV+AHy2iq0tZlt5kTf6p03+23?=
 =?us-ascii?Q?qRohZR76erjRWoRlwNtmNgINGLExY7O9b0BPI+mq2wbqp0ZgAfr0QFfEx/Pd?=
 =?us-ascii?Q?o1+ZDdubLN7vLAbXFRq6YuT8vuHLy6NNWbu20Zle5GBrfYl2203bJnv9qIhe?=
 =?us-ascii?Q?I/6zRhdsYxGcXlDcjzIpZr/0qUbBW+2qsy7bozsbl7jR3kd0Zvx37WAmgnfE?=
 =?us-ascii?Q?oo15DBQwJMryY451/035NvX/eysf5TYPxzIsXslLAD/KSnUIl89+xeUfcGVF?=
 =?us-ascii?Q?g0yo5xW7rx/7xWhDaNPhBCf+jthSo9IXxHvfWbSWGPZUH++lKl3PIc7kegDR?=
 =?us-ascii?Q?24Oqz0eDlB7th2/eSaciV7x7jVT7Fs1TFqCM5hcc4ac8ub/rLiQljuJW9lkk?=
 =?us-ascii?Q?Sz6OEvkLoeUHNgu6EJMuKwWklDFDuRN9HGMzyfu0Y2o4YPadFvwpVvHtSJ+V?=
 =?us-ascii?Q?uEYcqHGnbdCWxD7H9St0lsQzpXKVZ8yFeMznQu7ydzg7TzeIAQitcGflSIvR?=
 =?us-ascii?Q?OOt5R1LuUwOVjVZLI/+S7V2ImBjjqtwTsuPuNejVzekmbV7TovAOPrZ5sCBG?=
 =?us-ascii?Q?hN7TBOQIBBeBUD4QwLznHY6n3yR8NeJIM/xdkZOUUmj9jcCcFhuikUJkE7jy?=
 =?us-ascii?Q?yw3h87DTqlGgRQBwf7xoBW+SeOF5As1n2o9uYcfGQCO4bXGWYvqLaaYHCOPi?=
 =?us-ascii?Q?UOtyJu+yZLSpvwcw+QgcV71Pp1dcYJbuBH61ekMDZDtKPu/p1+qw+2MJn9n1?=
 =?us-ascii?Q?/wykJffKYpZOYKYxkvoGIl4O/TCtVvH34QqSf/o2xmrEtS0d/MVyUI2OBweb?=
 =?us-ascii?Q?1aGu4oFO8gNvlpvFgOoKouvxxDu8qHgfJ1U2wVDXWf/NCOllYc/uNMYtZzNb?=
 =?us-ascii?Q?/lkADaUpygpnyYIwMiNGieQjcMlyN3hS5UHA6QBXpKiwoyvwHAJkeUuG2eio?=
 =?us-ascii?Q?eCC8EMxdQO88mcXcw+7Zb/ZBS/cwNTTNpQmt1sHEZmFVK40yNx8EnEFqHkDw?=
 =?us-ascii?Q?RZfMOw+pSbEqc8RrZdFEFV3OG6OmwX2T/d45n4TIw7IfUBLBMKklQxkhS+Bp?=
 =?us-ascii?Q?xsLsXFnaselKtS7V+fdg140XaS10yokAc/MRz0iYgeTbXtf9EKK+zbJB86F+?=
 =?us-ascii?Q?pD0IwXtmVNNQA9rMozGm0ViOKKK+yYzxsxBFVvB9TBfxv8Fl+4yTGxT12uG+?=
 =?us-ascii?Q?FTwHw/va1B831whJi1iOz5PXd6w/KB4m8z4RIyWGvb8V9FM8zhFThsTGQxvV?=
 =?us-ascii?Q?uoJl1R8SN4Rhk941gMHOGjtGfoX4Nc4l7jONYsijmQN0I7Hho6zKkOOw8swH?=
 =?us-ascii?Q?BFmmxVfNarkoWNuwdqKnUW+X?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d446ec-a206-4ed5-6992-08d8ee24dec4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 17:55:40.1160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LMmCK1i6W5o3+ppBugFku0FXuNHbycE3fWaJ0IKo/s9yY9F0kxhKygpwHy0+z6g
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
index 06a82ec136080c..74fe21eceb66cc 100644
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
index 6d75ed07bcd49d..cdc5edb0074690 100644
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
index 71455812cb84cf..9ef1d5bed8069f 100644
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
index 91ecccdc2f2ec6..9b0f1a8757a0df 100644
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
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
