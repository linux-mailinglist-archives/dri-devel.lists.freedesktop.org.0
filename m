Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676D2405D8F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 21:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74026E919;
	Thu,  9 Sep 2021 19:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5154D6E908;
 Thu,  9 Sep 2021 19:38:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyxCWfKiIitW/EmBA2m30aEHTPzc3q7CIuZisXfpVRTzAhRA9tXJEb7lBIyNYGXFsM10GD5Tsefk9ogQPS14fXQ8VZsZ8tUwSk+BaetHDY+B5HWTqjVp9oeALjhiod1v1ft5KqUNN/xcgHQ4xHU6tevR/jniUv/vjOuKjGz3ey/1E6Yt1fOgwf1ZQJHuaF8QSPRWoRf5VnCI61W45bzatYrQ0sLfgdr1ol0Pnq8cAvlDGm0I34YH4rqwnGioY5AYvjMx8H69/f7eFh07UdihEASkMJIZOZcTLMmInigvS3B02tUPC3LHp2Fvj3wvp2KcIC29VdCB7Co8nai9N+wy1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=x24yekDwXo9V2sGcnzrLRg4lnIWhgWoKXBFEXPGaQJY=;
 b=E/4fShjAR/zt7FWOws7i3kQee3FmMwYU8Yc8/crvA6HWGMaUWWSMv/ZLvA/Y2pUulbTRdN1fdik9KXsZ/Mx1mKEXHP0eAggA8VpgkVmcsmR2RdQUuj9kfAcP4EqMs8J8v2xqMVeFBu55qwiSRG98bxjoxDvG1bp96+tpDkHKEUcED+w/y0MiTJ8HxaRPX2aZkrAu2sUNQhnW8Cw2bJCf8W3CUZP9GFjUIe7BChjizki7RfEo18NRf0IXjvdqUXein0JsbiD8jj4Rp1LOV2FAHqL/4PqJW1rINNLsHQo6rvZqKZWilv0F6VEQT3aJxm/jundHd8VqfxYl10zEKuaplg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x24yekDwXo9V2sGcnzrLRg4lnIWhgWoKXBFEXPGaQJY=;
 b=mBY+pOye0FDDxm2KA8nuOvpJeCz9zKW6hvFQcSXdmOhSoG5kpKaUSS+ArvHtwVz/LSAjdn7YOeIuppK0kZbiEs9uClB/6XdziIu/cFQBE1+Mb+o5c4oboxZj0xLtr7iyCzvsdxN9d01crv3DfP961+T8gDK47ka7/D5Y9GmKDNfJ3H+MHQfVETkUoRVPTyL8YjFP3RSNSz0g+jocmIDV004OM6IWQzJu7uspY8xhrjHumM3BM16C7JtMmwa2rp/m/RZr6dMl3/Z+xowedtOpkt64zjrwFGsb3h/eGam00VdRRsejmQ4qL5b1nAmlsLkYIWwdrpQm0AtLeRcQILzGjw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5554.namprd12.prod.outlook.com (2603:10b6:208:1cd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 19:38:54 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 19:38:54 +0000
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
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 5/9] vfio/mdev: Consolidate all the device_api sysfs into
 the core code
Date: Thu,  9 Sep 2021 16:38:45 -0300
Message-Id: <5-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0026.prod.exchangelabs.com
 (2603:10b6:207:18::39) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR0102CA0026.prod.exchangelabs.com (2603:10b6:207:18::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 19:38:52 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mOPsn-00FLF2-L2; Thu, 09 Sep 2021 16:38:49 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f20e1b45-6278-4f5d-657b-08d973c9742e
X-MS-TrafficTypeDiagnostic: BL0PR12MB5554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB555421FD76ED35AF3D5AB4A7C2D59@BL0PR12MB5554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:428;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BGr5zVi0oo08j5cJTK2I75bZBBxhPsAqkMkktZXKX6/bF3LW6A1ccq4wpcbP6NFeRKukzozm1YuiR7FRnOb4FIMoVhycoFQaV2kkBwMyTkiXBRKYqw8fKVOmrjm62NNXd5UBwiABISElXkuOynlhz0+ypJF0dIMU/N88PcynxjZif0qgBFI3c2BgqKrkKfAbHmN6hcJSIaQOCy6xAS+Rufi7pq0AtDTPMH+6XCglbZIKTUk5ZIbV/946XZsZ8aZ36jdMYfELKyufWRtisEpZyZ1jyQgwBjg6fYZ6s4nHnaQbvzn5Xeb2plncyDLKUD1lxHAKxfW90mClsC5FGGsJgfXMDzlSACAmTBjCS+lKYUN1DPurRMsmgSqi9vVfLL0K41a8S0rtGu8xdHtppkeEDIiybrXFYPBthkJ2x35tIW7i394YKlZ4Tyaz0lgnRgnURQm69QSeSEC6tr58ZrxiOdCBQ9FwOGJ++nwCuYuWqDABQ7CxjoGosgh1zwRLAtxK5zwYCCzgF+u9U7AQeW2Kb/acVlefcI8f5HlFsAyD8foEJOXU+6EtPLZfOuwJ+egt9SzlRe+Vd1+1YDsFE79MbeAFxUybuGUcUgapKyVtxmIi/vz0LsmynFUEoNCDCqoCws9EH1o6an7Mc3Ts/t+h1v21DeWpkqKuhkS84jujD7khB0CNn9Jsi11w/eWY4Xubc+JScOuizV7Y5gDQydfZoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(26005)(4326008)(2616005)(66556008)(30864003)(921005)(66476007)(426003)(66946007)(9746002)(9786002)(5660300002)(186003)(83380400001)(86362001)(508600001)(8936002)(6666004)(110136005)(38100700002)(36756003)(316002)(8676002)(2906002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: m26eoeDd5se3KpMqTH0R7g6KuX8dcrlXL8h+hN4d7ka++SRwVubtYov9/d28GlulkOFwmNSpvwMHME3vRl55Y7wAK9RjqPcE6oLERZ2CudQQK92PsZ5sfaNtRsac7t8bmOgjwLwSP4dcWSWikrM5cGXsec34AHI3E3yx/8CMT9xP6wQ3dUNjp5AebojSWicR4MKDfjjQuRr8k4BcI6s+Q9/zGTadyqJdvAXpkvrfl1cYlG9XTjuu/c21D0I5mpDc5B6Y8+nRi9bpGuSiNInZBBT3VRH7cycQCbqe8NuQ/dWPhYiqIjy7IcSAnAqk/B8NSwkMtP3TrmQrYgtvSXW9vzsxvwXuGb9SnwOwbbfy7EZ1VhE1N/PoKntj6o+TjEFl3UptCyvXlc9nSZVAnunUyYq4oCHHaGVmqrSxcWpLFHKayrBdzSPAh2ZiOD+zUvcs7yBEcUS76ckSBbyK/ttJl81gB1ugV5zO0wNA6KGKxvEUINDWKxk5AUqfEA+FQSvSawrN+f4/qKuTWRdXs0EwUq9lpRRNB/s5B5LrYy/UnF3UQHN1wFX/FIZ59S7EvIqSJFmE4Bb8O44CMwfNpy6rHmAsTJ8dj24f6XggBCg4z4FAcLCehm0JB5Gll4F4kfdSp2i3vwiJFM61DNLeQMhxBgtXgtmQjwPzukPc/CnJU4SQq+TCF7bDLHW+AUOidicDMVpIqrLWXOEGqhOcqYNS0eJboczJNMLEMHndOGb1ay8V/dcAllf7NQsmpWXPxuFD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f20e1b45-6278-4f5d-657b-08d973c9742e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 19:38:52.8576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rXnHb1bOHVAIyqbibiaDiEGkbk9Ud5tjtNYdCFpvYv8fhZEaWSHW3ZS/llZHFtM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5554
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Every driver just emits a static string, simply feed it through the ops
and provide a standard sysfs show function.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c  |  9 +--------
 drivers/s390/cio/vfio_ccw_ops.c   |  9 +--------
 drivers/s390/crypto/vfio_ap_ops.c |  9 +--------
 drivers/vfio/mdev/mdev_core.c     |  2 +-
 drivers/vfio/mdev/mdev_sysfs.c    | 27 ++++++++++++++++++++++++---
 include/linux/mdev.h              |  7 ++-----
 samples/vfio-mdev/mbochs.c        |  9 +--------
 samples/vfio-mdev/mdpy.c          |  9 +--------
 samples/vfio-mdev/mtty.c          | 10 +---------
 9 files changed, 33 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 7efa386449d104..d198cc3d132277 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -161,12 +161,6 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 	return sprintf(buf, "%u\n", num);
 }
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
-}
-
 static ssize_t description_show(struct mdev_type *mtype,
 				struct mdev_type_attribute *attr, char *buf)
 {
@@ -187,12 +181,10 @@ static ssize_t description_show(struct mdev_type *mtype,
 }
 
 static MDEV_TYPE_ATTR_RO(available_instances);
-static MDEV_TYPE_ATTR_RO(device_api);
 static MDEV_TYPE_ATTR_RO(description);
 
 static struct attribute *gvt_type_attrs[] = {
 	&mdev_type_attr_available_instances.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_description.attr,
 	NULL,
 };
@@ -1750,6 +1742,7 @@ static const struct attribute_group *intel_vgpu_groups[] = {
 
 static struct mdev_parent_ops intel_vgpu_ops = {
 	.mdev_attr_groups       = intel_vgpu_groups,
+	.device_api		= VFIO_DEVICE_API_PCI_STRING,
 	.create			= intel_vgpu_create,
 	.remove			= intel_vgpu_remove,
 
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 6e70620d5dfbc8..18a48d1f1e8fff 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -70,13 +70,6 @@ static ssize_t name_show(struct mdev_type *mtype,
 }
 static MDEV_TYPE_ATTR_RO(name);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_CCW_STRING);
-}
-static MDEV_TYPE_ATTR_RO(device_api);
-
 static ssize_t available_instances_show(struct mdev_type *mtype,
 					struct mdev_type_attribute *attr,
 					char *buf)
@@ -90,7 +83,6 @@ static MDEV_TYPE_ATTR_RO(available_instances);
 
 static struct attribute *mdev_types_attrs[] = {
 	&mdev_type_attr_name.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -640,6 +632,7 @@ struct mdev_driver vfio_ccw_mdev_driver = {
 static const struct mdev_parent_ops vfio_ccw_mdev_ops = {
 	.owner			= THIS_MODULE,
 	.device_driver		= &vfio_ccw_mdev_driver,
+	.device_api		= VFIO_DEVICE_API_CCW_STRING,
 	.supported_type_groups  = mdev_type_groups,
 };
 
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 54bb0c22e8020e..005c2a2b14af3f 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -400,17 +400,9 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_AP_STRING);
-}
-
-static MDEV_TYPE_ATTR_RO(device_api);
 
 static struct attribute *vfio_ap_mdev_type_attrs[] = {
 	&mdev_type_attr_name.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -1399,6 +1391,7 @@ static struct mdev_driver vfio_ap_matrix_driver = {
 static const struct mdev_parent_ops vfio_ap_matrix_ops = {
 	.owner			= THIS_MODULE,
 	.device_driver		= &vfio_ap_matrix_driver,
+	.device_api		= VFIO_DEVICE_API_AP_STRING,
 	.supported_type_groups	= vfio_ap_mdev_type_groups,
 };
 
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index b314101237fe22..c3018e8e6d3258 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -129,7 +129,7 @@ int mdev_register_device(struct device *dev, const struct mdev_parent_ops *ops)
 	char *envp[] = { env_string, NULL };
 
 	/* check for mandatory ops */
-	if (!ops || !ops->supported_type_groups)
+	if (!ops || !ops->supported_type_groups || !ops->device_api)
 		return -EINVAL;
 	if (!ops->device_driver && (!ops->create || !ops->remove))
 		return -EINVAL;
diff --git a/drivers/vfio/mdev/mdev_sysfs.c b/drivers/vfio/mdev/mdev_sysfs.c
index f5cf1931c54e48..d4b99440d19e9a 100644
--- a/drivers/vfio/mdev/mdev_sysfs.c
+++ b/drivers/vfio/mdev/mdev_sysfs.c
@@ -74,9 +74,30 @@ static ssize_t create_store(struct mdev_type *mtype,
 
 	return count;
 }
-
 static MDEV_TYPE_ATTR_WO(create);
 
+static ssize_t device_api_show(struct mdev_type *mtype,
+			       struct mdev_type_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s\n", mtype->parent->ops->device_api);
+}
+static MDEV_TYPE_ATTR_RO(device_api);
+
+static struct attribute *mdev_types_std_attrs[] = {
+	&mdev_type_attr_create.attr,
+	&mdev_type_attr_device_api.attr,
+	NULL,
+};
+
+static struct attribute_group mdev_type_std_group = {
+	.attrs = mdev_types_std_attrs,
+};
+
+static const struct attribute_group *mdev_type_groups[] = {
+	&mdev_type_std_group,
+	NULL,
+};
+
 static void mdev_type_release(struct kobject *kobj)
 {
 	struct mdev_type *type = to_mdev_type(kobj);
@@ -123,7 +144,7 @@ static struct mdev_type *add_mdev_supported_type(struct mdev_parent *parent,
 		return ERR_PTR(ret);
 	}
 
-	ret = sysfs_create_file(&type->kobj, &mdev_type_attr_create.attr);
+	ret = sysfs_create_groups(&type->kobj, mdev_type_groups);
 	if (ret)
 		goto attr_create_failed;
 
@@ -144,7 +165,7 @@ static struct mdev_type *add_mdev_supported_type(struct mdev_parent *parent,
 attrs_failed:
 	kobject_put(type->devices_kobj);
 attr_devices_failed:
-	sysfs_remove_file(&type->kobj, &mdev_type_attr_create.attr);
+	sysfs_remove_groups(&type->kobj, mdev_type_groups);
 attr_create_failed:
 	kobject_del(&type->kobj);
 	kobject_put(&type->kobj);
diff --git a/include/linux/mdev.h b/include/linux/mdev.h
index 68427e8fadebd6..7f1db354f45f14 100644
--- a/include/linux/mdev.h
+++ b/include/linux/mdev.h
@@ -56,6 +56,7 @@ struct device *mtype_get_parent_dev(struct mdev_type *mtype);
  *
  * @owner:		The module owner.
  * @device_driver:	Which device driver to probe() on newly created devices
+ * @device_api:		String to return for the device_api sysfs
  * @dev_attr_groups:	Attributes of the parent device.
  * @mdev_attr_groups:	Attributes of the mediated device.
  * @supported_type_groups: Attributes to define supported types. It is mandatory
@@ -100,6 +101,7 @@ struct device *mtype_get_parent_dev(struct mdev_type *mtype);
 struct mdev_parent_ops {
 	struct module   *owner;
 	struct mdev_driver *device_driver;
+	const char *device_api;
 	const struct attribute_group **dev_attr_groups;
 	const struct attribute_group **mdev_attr_groups;
 	struct attribute_group **supported_type_groups;
@@ -128,11 +130,6 @@ struct mdev_type_attribute {
 			 size_t count);
 };
 
-#define MDEV_TYPE_ATTR(_name, _mode, _show, _store)		\
-struct mdev_type_attribute mdev_type_attr_##_name =		\
-	__ATTR(_name, _mode, _show, _store)
-#define MDEV_TYPE_ATTR_RW(_name) \
-	struct mdev_type_attribute mdev_type_attr_##_name = __ATTR_RW(_name)
 #define MDEV_TYPE_ATTR_RO(_name) \
 	struct mdev_type_attribute mdev_type_attr_##_name = __ATTR_RO(_name)
 #define MDEV_TYPE_ATTR_WO(_name) \
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index c313ab4d1f4e4e..abd889bc1f9dcf 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1358,17 +1358,9 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 }
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
-}
-static MDEV_TYPE_ATTR_RO(device_api);
-
 static struct attribute *mdev_types_attrs[] = {
 	&mdev_type_attr_name.attr,
 	&mdev_type_attr_description.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -1417,6 +1409,7 @@ static struct mdev_driver mbochs_driver = {
 static const struct mdev_parent_ops mdev_fops = {
 	.owner			= THIS_MODULE,
 	.device_driver		= &mbochs_driver,
+	.device_api		= VFIO_DEVICE_API_PCI_STRING,
 	.supported_type_groups	= mdev_type_groups,
 };
 
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 8d1a80a0722aa9..b81d7848619cae 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -670,17 +670,9 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 }
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
-}
-static MDEV_TYPE_ATTR_RO(device_api);
-
 static struct attribute *mdev_types_attrs[] = {
 	&mdev_type_attr_name.attr,
 	&mdev_type_attr_description.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -728,6 +720,7 @@ static struct mdev_driver mdpy_driver = {
 static const struct mdev_parent_ops mdev_fops = {
 	.owner			= THIS_MODULE,
 	.device_driver          = &mdpy_driver,
+	.device_api		= VFIO_DEVICE_API_PCI_STRING,
 	.supported_type_groups	= mdev_type_groups,
 };
 
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 5983cdb16e3d1d..b473ecc7733f7d 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1281,17 +1281,8 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 
 static MDEV_TYPE_ATTR_RO(available_instances);
 
-static ssize_t device_api_show(struct mdev_type *mtype,
-			       struct mdev_type_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
-}
-
-static MDEV_TYPE_ATTR_RO(device_api);
-
 static struct attribute *mdev_types_attrs[] = {
 	&mdev_type_attr_name.attr,
-	&mdev_type_attr_device_api.attr,
 	&mdev_type_attr_available_instances.attr,
 	NULL,
 };
@@ -1333,6 +1324,7 @@ static struct mdev_driver mtty_driver = {
 static const struct mdev_parent_ops mdev_fops = {
 	.owner                  = THIS_MODULE,
 	.device_driver		= &mtty_driver,
+	.device_api		= VFIO_DEVICE_API_PCI_STRING,
 	.dev_attr_groups        = mtty_dev_groups,
 	.supported_type_groups  = mdev_type_groups,
 };
-- 
2.33.0

