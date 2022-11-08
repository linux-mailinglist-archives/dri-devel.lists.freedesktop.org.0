Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D02620563
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBEC10E39B;
	Tue,  8 Nov 2022 00:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FCF10E395;
 Tue,  8 Nov 2022 00:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsPkEvD8uiXXRcgwGVce6JPOYUIs9EPRXFwhGDbvntkVOiF+GUzOOWk6kQwKGHUfkKm8ZmZvySthJWHjEVfFF5cqYu4LwxwLXBnpbdycbNAS9bxCwTt8KtLYdNUNXrsF+rDKsU7Ra/CMfuUDg9FTwa9WHw2SfkqiHmp5CQb+ISyv2SdVIO6ARgV3oaPVB22t0CbxJpuazCk9tbVGs2uUlLvCW0B6K4tvoSMTT9iGu81ewGZx/EP1oAKTtS9vWmvXmMJGgYQUnHDNVuqE/fpOpxxYZdvaWxHqO6iM7eByIX86Gd6bT5sZTjy5b4cM1WDy3K8CoGJlmaZifcqbEjWpBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDmMv571X7LO1sc3sVU8drnguUDogGaaEPNR/l71nBM=;
 b=g+pLuFxRPNw4ne4FWbkg7ELmwAllKxtWId9Y7+DoRorRy+OB7zrNpHk9w8H7kpcbivAyaXjz/VAds1iQXVwVAueXCMzyLISRYkZg4bcu4uXMk9Rplw2ygVmXScyu+OBCExoFK2J4dSvZuA06BxhPjiACM5e+EveTnWWknZ9EcvXu5EXkOavasEbj+wtxNwszzVjL4+Pi4Hh8M4eiwrzer0eZd3MT5yzeW9b97GBYmGAQeg7qGPOQYPhpmRMluOUCO4x8BQjzmy7tNnsh+ifkdbGKfeYfR8aLxfLRomY44V1b81cpz7v/IsfzKFwAyCcyfJdyyUiNIkoTp8UlMN/v7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDmMv571X7LO1sc3sVU8drnguUDogGaaEPNR/l71nBM=;
 b=YW+olb0BJdJ7R0XoC2riL6ITtCkGECPAdNN2lLBE5f3OUNvMvI/wEr9ADrGx/zZ8IyFGLeyZyTMeAQSoYWXkuFhMdmVFdp/3EaGcKyJt4H/vP1xebmtPyjcibc+CqwtUFxH1Xw9qMwZ52zoi/2JSch+bxO7qpnYlb8o7tVkeKttn/YudheVr2+6fDsjzxGq/Y9WHR8D+Rh2WhyN32kvu6p443JwrmAowuTNtW+uArUdq+MsOnO2j23d71Q1Lr8GKbaLxrUpn83g+vjDjKWDn7Z5hIjzirHy4tnvIOHf2ADw7u45V3la5bDJWLXzmDSnffzt7j4xv48ncSIRdIHINzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6257.namprd12.prod.outlook.com (2603:10b6:208:3e7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Tue, 8 Nov
 2022 00:53:04 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 00:53:04 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Diana Craciun <diana.craciun@oss.nxp.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 iommu@lists.linux.dev, Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v2 02/11] vfio: Move vfio_device_assign_container() into
 vfio_device_first_open()
Date: Mon,  7 Nov 2022 20:52:46 -0400
Message-Id: <2-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0137.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d08ca7-5265-4c2e-80d8-08dac12393ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xleWYqi4T3j7nXqVpzmzB4wUUYLZeHpFjHOj9t0ZFDQFOn+56p0Mh0ZIO4WrK/xiuXxwtY7qDYFAHb02cL20Bq76gCE/AgK5GlyhotOV0mC4lL4U/AmgxoL8yodYhaIiwcLm52vOp2NFA0Eibrv3dAtLgzMIuR4OmeWvlSL3ghbNG/EpE0mVNScPM+r0HvnPrg3YrNBwTIRiSaz2eyHSK0fdtZxXHcJJdX2N/8w6qQtcpaj+dNg4VI8nMQqXqdtdOUtESFLMOYz+fWuZoe7YVSlWG/D/53ofjBrMDHbmLxNw2kSVuvaPiwWAjf0ZoIEgUXK4N+uHldKPfmcgGndJdSRdGaZi8zhs3tSBUUqoFS/PT/q3fx7VwJ/7jphfcEpixtk3B3EUi23bChlOTMNa9idCflEB74WinVobRkJoCSMbAyo3ciPF9qx1Ltx6Kzmv+sR6E5aC4pKlIC7r3g7VSGvYy4RP+jXb3rf+lvdLqw9UOLrM9p0w7Ar5FHEepcWfI3rV2EeOdMPyysMBl5vY+bSXv+6ysCpQ0J0+ksgeSwViJ6XbK4+5GrvUJqw1HcByEneGXFGikeJ1JbTmls9qnoRgKVXky31sbA4dIKrWWzV4wwMFdaI+VXFNNp9ZCFBCVjAerVL01GCce+SuL9J3s7qDaqojvY+IulfYwJMvNElpS5Hcmce+XoRpzljCZPSwAHcrbb/GS9k4soIyXjSbs3pAraGaHPRu2VhSCfU8BW2JYZwC5jxFPZl8UIqgcIiGOQHd7mnrAA+Cxjh+u4vIfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199015)(8936002)(36756003)(7416002)(5660300002)(41300700001)(7406005)(86362001)(6486002)(83380400001)(8676002)(6666004)(6506007)(26005)(2616005)(478600001)(38100700002)(6512007)(186003)(4326008)(921005)(66556008)(66946007)(66476007)(54906003)(316002)(110136005)(2906002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x+pQJ0SNi5ZA+ij12d4bpV9TSy9URUSStsHZmR7D33c56OG7LBDZ4WRDbH+I?=
 =?us-ascii?Q?CyClhUR+nQ9gw5m7Ug2sh1azaV4wgB4nBiLEsFqDtOFXeoQ3GqsqFWSyk378?=
 =?us-ascii?Q?AhRrNlI18lGnRi0ZrDCNusa20/MVaxdNL1MEimP8k7HSwLFnnXnjhA9MWzWA?=
 =?us-ascii?Q?HbaQ2FBHo+fn67Z6LDd8Oi2qBbu6BgCvzvuGcKWVEIahD4eJC6hG5xwevsi0?=
 =?us-ascii?Q?PpW9K9XbaggPNWnFK4m4a+W2G9isIdsGu3E0w3sq6SU9n22o6LZbGGN+e7lR?=
 =?us-ascii?Q?4JcQNhzcHc5TODxO5n4wnP4ZARE7nD9EmxmMJSRj1nj3BcH9pu9wpblYesmP?=
 =?us-ascii?Q?LTirllqaUwRq/qESHzQGo5lGyXav/FzMaz0On6FHjNWG6cj7Ayzc47yAE2kp?=
 =?us-ascii?Q?w8w3PBPEmGGLIZHGAxUyKrPey5eHQ7adcP25ymqHSMUhcwfP2oq9IoHOLPyk?=
 =?us-ascii?Q?+8yFD5bmyimDwuzr7u/XLOYNa90BtOM3oH+LMR/H/SldxeCIcoDSjYxhWhBU?=
 =?us-ascii?Q?u7/1FKmVZnKDUICMSO0XRz5brMOg2kV5lTe8UbWHrUaGzYLE0WPgIuA8oScb?=
 =?us-ascii?Q?hejx4WhG3KXUwTj7JQSkhKpdCvX+CR5sZoqE2dkuucmFnUcj137yG2IzkEs8?=
 =?us-ascii?Q?fpb6sz1sUGPsCr35jKspcgKsv9UCHMvP7fIJVZ2fTQSxQDU2i83U6NMHwxpe?=
 =?us-ascii?Q?ez5+wbMGJG99JvqTzv82QBzY8gQOsIjt2s0TzPqKSEjZs7YVD9d6szy65Fcz?=
 =?us-ascii?Q?cIIMnmMi0C1T1pNc3wQccDNGwnIWcWwXzLOtHJuNVWMdT/qBm2WyrWM9m4A9?=
 =?us-ascii?Q?ZSlbCQxmFhy46a0iGgxcXJYQ8dmxjAbEbrCP3IBAq1TE8Cs4934avIkq5stY?=
 =?us-ascii?Q?s/N23MO7i2KD4VWgRP1B3Rfh7F8LBViFK9+YWttq0fa4pc6fRS5vwYrEJczP?=
 =?us-ascii?Q?fHsh4CfufQ/OZVb/pXaWRIg3/4vUSoACRQxuFHZCfiPuJeJxo4mGmjAFFLTl?=
 =?us-ascii?Q?g5v8/XR3ucOQTbuKrt2Vn0dvxSDKH192K5ol6taDF7fWlwg/ulr7CL4zI+iL?=
 =?us-ascii?Q?IzzVZ4Pi8qdxbnlBLZhu9/VB+j7GWa0csXaiLgn3zPZ4UD/gXmRAxQl8sEyF?=
 =?us-ascii?Q?V5HaO0ih0V1y3BoTq5tS+9YbWAkv2Qw+A39epUdErRcvIUSE86F1TGadjn8u?=
 =?us-ascii?Q?c0ttTJ3cTikL59sayA4KMbLQWXN/5UUPvMk0w6GQfoImR/bJ8wPAdwu69Khe?=
 =?us-ascii?Q?kpWhFu4JnvPnze9ZbYtpIqGcqTvenr5xWaJhJuxY4eGkdF66qGbZ/b2IcwTS?=
 =?us-ascii?Q?TA9DiXA0QS82umUSEq+iYWdBRpzljyeBtHi7t5xf9/biyxu53rvzYiIUzoLt?=
 =?us-ascii?Q?s2joKuHCzaRHq3Qpb4EVkP0S7RHqS4HKaMN1vMyYmnmmglMa2/GX4aEmkyk1?=
 =?us-ascii?Q?zkBRqzoi5gX835/32OBxfniVcUWswha7R46wwaWZmz9TugzzMU9WmtMneX37?=
 =?us-ascii?Q?JlFmtA5AjxNTnnS5z3zV/8GTUaA/6byidMvl9b60hem3ZNPXWj9uiRXqsTy4?=
 =?us-ascii?Q?y8rlf+C3gTjj2d33YuE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d08ca7-5265-4c2e-80d8-08dac12393ed
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 00:52:57.7896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZAQY23kxC49Voh1qa7fUuEXoZg9OjzyQ+6D5VksPcfBOQcN4TyjK1lFxQ3EDkXh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6257
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only thing this function does is assert the group has an assigned
container and incrs refcounts.

The overall model we have is that once a container_users refcount is
incremented it cannot be de-assigned from the group -
vfio_group_ioctl_unset_container() will fail and the group FD cannot be
closed.

Thus we do not need to check this on every device FD open, just the
first. Reorganize the code so that only the first open and last close
manages the container.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Yi Liu <yi.l.liu@intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/container.c |  4 ++--
 drivers/vfio/vfio_main.c | 24 +++++++++++-------------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
index d74164abbf401d..dd79a66ec62cad 100644
--- a/drivers/vfio/container.c
+++ b/drivers/vfio/container.c
@@ -531,11 +531,11 @@ int vfio_device_assign_container(struct vfio_device *device)
 
 void vfio_device_unassign_container(struct vfio_device *device)
 {
-	mutex_lock(&device->group->group_lock);
+	lockdep_assert_held_write(&device->group->group_lock);
+
 	WARN_ON(device->group->container_users <= 1);
 	device->group->container_users--;
 	fput(device->group->opened_file);
-	mutex_unlock(&device->group->group_lock);
 }
 
 /*
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 2e8346d13c16ca..717c7f404feeea 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -749,18 +749,24 @@ static int vfio_device_first_open(struct vfio_device *device)
 	 * during close_device.
 	 */
 	mutex_lock(&device->group->group_lock);
+	ret = vfio_device_assign_container(device);
+	if (ret)
+		goto err_module_put;
+
 	device->kvm = device->group->kvm;
 	if (device->ops->open_device) {
 		ret = device->ops->open_device(device);
 		if (ret)
-			goto err_module_put;
+			goto err_container;
 	}
 	vfio_device_container_register(device);
 	mutex_unlock(&device->group->group_lock);
 	return 0;
 
-err_module_put:
+err_container:
 	device->kvm = NULL;
+	vfio_device_unassign_container(device);
+err_module_put:
 	mutex_unlock(&device->group->group_lock);
 	module_put(device->dev->driver->owner);
 	return ret;
@@ -775,6 +781,7 @@ static void vfio_device_last_close(struct vfio_device *device)
 	if (device->ops->close_device)
 		device->ops->close_device(device);
 	device->kvm = NULL;
+	vfio_device_unassign_container(device);
 	mutex_unlock(&device->group->group_lock);
 	module_put(device->dev->driver->owner);
 }
@@ -784,18 +791,12 @@ static struct file *vfio_device_open(struct vfio_device *device)
 	struct file *filep;
 	int ret;
 
-	mutex_lock(&device->group->group_lock);
-	ret = vfio_device_assign_container(device);
-	mutex_unlock(&device->group->group_lock);
-	if (ret)
-		return ERR_PTR(ret);
-
 	mutex_lock(&device->dev_set->lock);
 	device->open_count++;
 	if (device->open_count == 1) {
 		ret = vfio_device_first_open(device);
 		if (ret)
-			goto err_unassign_container;
+			goto err_unlock;
 	}
 	mutex_unlock(&device->dev_set->lock);
 
@@ -830,10 +831,9 @@ static struct file *vfio_device_open(struct vfio_device *device)
 	mutex_lock(&device->dev_set->lock);
 	if (device->open_count == 1)
 		vfio_device_last_close(device);
-err_unassign_container:
+err_unlock:
 	device->open_count--;
 	mutex_unlock(&device->dev_set->lock);
-	vfio_device_unassign_container(device);
 	return ERR_PTR(ret);
 }
 
@@ -1040,8 +1040,6 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 	device->open_count--;
 	mutex_unlock(&device->dev_set->lock);
 
-	vfio_device_unassign_container(device);
-
 	vfio_device_put_registration(device);
 
 	return 0;
-- 
2.38.1

