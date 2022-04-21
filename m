Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208A050A574
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 18:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787D610E0CF;
	Thu, 21 Apr 2022 16:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A8710E408;
 Thu, 21 Apr 2022 16:28:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EU8UmhFnEVsqVtDCu/fDBIrZw9qbrawFWuuj+0SA4zZIcnf23o5dITvMo2Mj2y53T5lK6LC+EDE6p2oNsE60nAb3cPW6qjBdX2cCTiT1PkQq4wnzAc7lXAqBw8bA8OPAvuGxsycK8AuRX/n11kUnyQwuuxbuT33AEnodSABtW5S2HxQ8uLEuTaUi7dfmhcSCBYNGwrL7u6NwOs6yv1yrvKr7gX5BTpCbMcUqXv3lhcA0Rc23w8EnnII8sIX2Df8e4gZldGTYw1ZqatvHVK6jZFEpyxP/A/5aQx3Fl0A/ohZjY7Qy+k2wQg6AwUu8cBmQYS7HUClJz2lpHwMqhAQgxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8kGofqV0t62Bz70D0hSCox7ZRY7BXbIYducyK9UgRk=;
 b=UhHrG56AoljyQYyEP1db5j0dzi/USPIWXuUBM/rOXS7F84w2lf1lR/ez8EBYBk+0hxtN4HWXvIEIy3yH3bRHYRY5mAqVFwoPAk1AUogejZRS/2RnPVoLJeN5cf6veYPvwUsq3G3TBzajNzUdx/Y8wprLHfqBiM19hqDtZ4dsDTCPtKrBCFOg1PioLqjfagOC4ENi3sOj7z2YNXrhcjD2qyWSnjLOMLfyGgRzcut97pS5xvZaegwqSk6t3MNvxbGjYeCyB4LsJST+TVqNor7r5T0gijD0kl22WB+J4eQY+I3dkG5Zk0+cWp5vNh7p3ydiZd3m+1lxCtwOaeUdN0GmQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8kGofqV0t62Bz70D0hSCox7ZRY7BXbIYducyK9UgRk=;
 b=YWGvChQyeZBtbIFTr9FtYWEj7GUU2FVsWNAVlOqlYNWToLGKKRf6KQpmPGUPanzydxb+QRlK+jUQlXhh2IywA0jlHMqNoeH22L1HRXLsZFYl3s47tT0QDZM7IFYrmpGgiVB98QdTqc2C8nyopt+S2hJZ26Wig3pQe6aJBvtDWpzg4N5qYbh7uwN1G+4i8SCeZZjf5BvuY1u7YJCqbV+IJmBJK72sDGJHUmQcvTCkGn5R/YfJFlu0fRiuXonkpBe86L+tGg+OEuwM34TMRy2jZvSI4n9OvxMKmB7D1smQTTnbjKq0z/wx4sW9hEKtXAsookOjorHiMuXfw6LaStBljw==
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
Subject: [PATCH v2 5/7] drm/i915/gvt: Change from vfio_group_(un)pin_pages to
 vfio_(un)pin_pages
Date: Thu, 21 Apr 2022 13:28:36 -0300
Message-Id: <5-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0132.namprd02.prod.outlook.com
 (2603:10b6:208:35::37) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de46cbdb-eb06-4bb0-b9ab-08da23b3fe1b
X-MS-TrafficTypeDiagnostic: DM6PR12MB2907:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB290727F3021A8D67D2446B77C2F49@DM6PR12MB2907.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4wSBcPmkLGRL1WDWHILrJsd7F4qMWuiODR5gcb9ax0WHuur5QyxknGcpb2eGrgdKmYAARv9oFH3TWXXVvBFK3pfMzqPIAfWJfByshAvORifkoF7bH9fSwjLQmeKy7M/Sugz1AlivCYSSv6p6hjcoWCL+TI/ZEfrbUWrwf+YB3ComoIQBOJyv6WabzWbRfGFRyFiSLAec8DCyB/jWyjuQrJhiGta6yiHrRqJelX9+CZ3Vxgutjf+6vGHZSJDuMRF76iDvirerSWKOgiXCWN6JN6o2OdLfmJ98HaxgpeaQWDXT0DOm1EqfQhnQAt/lzHec6maJU5SLJdH6I1eZNJ1aeA2nmkEwJ2wlE1XKp4lgbFNc9GzjnAvfLHRKWffBBwoVFetmGk58aW2juS7qxTvsDDKtPMEB52hJ/bCv5mdAqEU598xxTlEbZ06fiWjl3/ezx5ccfzftvDhQhJGMpsLNSc5P3h+UqNvD81M4aS/ZrxiYJC2yR4UiKnXBrObjQ00BodCMZuHuZogBmIAz0ooBIORQb9T8v57T7sDjgZQxKzT1LHZn1QVWA9xcHnyNMTHOLJMVwe8gsT6Pbhmb+8Ky5q0w3AH+NayUTtHdG3DyiKdnwgRE6dJcZ0PS3FwWBRzDlB1IT8PKdXEdu99oOXm96kpwbIGjMcEFUDZS7Y4q1MOR5vdR+scaMkDdDcmo4MvDq2aHz3zL19fJMnuklsKBqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6506007)(316002)(5660300002)(38100700002)(6512007)(54906003)(36756003)(66946007)(86362001)(186003)(921005)(110136005)(508600001)(8936002)(6666004)(2616005)(83380400001)(8676002)(7416002)(7406005)(66556008)(4326008)(26005)(2906002)(66476007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KsxK0QPfoRPfARO5/CF1Ca5qBkSl3sgRPWNB6nvxNTbF2PtBUVgpF8Lsf/+g?=
 =?us-ascii?Q?4NIQj340y/nxszR7LdgF+lTyCMcAcVu7hLgxourQujYakMFnaV0400dUYFBV?=
 =?us-ascii?Q?NWpJTHYaZ7TghYRh6zVO9cptDSPDNOphKu19f1/31XAcftiR4aQ0WAB+KXsz?=
 =?us-ascii?Q?WEZcX1H26UeynhraMGVXevbP0QcGsN2sTw/5QdtsVoQ0qV0sPgQo1pIKxttt?=
 =?us-ascii?Q?Mw2yZUyfYSjSO/PBsoPmthnlu4rC4N85ryvX3H41+bLe+Tzcxn4fONfLqDlH?=
 =?us-ascii?Q?ui2buRUQEQEKjtT4bTwh0e5wpxeS2l++0Nuqt0FRyFL0nuTBlBJTNxvIn2xo?=
 =?us-ascii?Q?5KlqTvaqwIogn7znab+Bk2qv8mrkGk/JnJxnUn3QSTqqOzO4HuRhQ5FxtTzX?=
 =?us-ascii?Q?XLiXt6KvF9C3/me+xwQi/NTP0SEUEaNrmgD3svtpN5sSR4i9WPAkhr0h87oj?=
 =?us-ascii?Q?flS63nOi4QcIEA26FmN/dWJzzqW3enCZb0USq7DIlwLHZ6lZKKfxplfr83d9?=
 =?us-ascii?Q?BoDoDzQ5NLOjIsluQZeTbZ264D30xp7l94zn2tHOvJgWKPAUy1fTY3wrU6QT?=
 =?us-ascii?Q?LFKQhTEACshRIpiigW9ha/swPnE7HA/dor3Ni8Kqqnn8eu9awnf4zLldFU5S?=
 =?us-ascii?Q?4j922vU9p5aPZECIxL/A2ZMyAuFCFkHlyRGc2eY8c24XuPSPLg0Z6wn4vgQ5?=
 =?us-ascii?Q?CZU2CNCz0Y5DgVTyoukiorHXrZ5w0Y4SangLbVp/pdLMWLUm2bjlC7yRjbj8?=
 =?us-ascii?Q?W/gH3RtiOjjU6Dvlinn462Tda+NtPzvFbLRRQRzH5qMMUNbvOdBczGABvsTV?=
 =?us-ascii?Q?+TM3hRQ99rX7OBIWii23DEgmDY0pB2sFT73Y59SuUxTdIVBJe8lGu772a6RR?=
 =?us-ascii?Q?txfdkA8vOIBNPL7jpTui4Jgj8GdKrKSpTAj2JA2kR0CTpdd+x8mclTZguki/?=
 =?us-ascii?Q?2gkDZMpn3MCB3gWAjiTtW5JK6s7JHfEuyGbdc0AE1gOxzgl+rjsqhZFL3Jlq?=
 =?us-ascii?Q?IgzrJHTUZd4yUJmbfgFiBtcput/44s07y2JIxSryg/X6s5mLI4LEpFC56Egy?=
 =?us-ascii?Q?78Qv3SOITzEO+7IxswA498nPeXx5E8SKawNKJ+EZMigBkdiQ4a1IPoF//os+?=
 =?us-ascii?Q?GkMwseq1EgQlG0HKG2oxuNGTHHJaOo7p0G2+SFBGbs6prfYRo8nrcbJQr45N?=
 =?us-ascii?Q?RMvfkgF1LxUZxJguGSQTlRoDCabT3pix6iH1Vno/yNTZb0TD1Jdo+ddmw5EB?=
 =?us-ascii?Q?Zp4xb5DisJ/1KVTDnVGG89TVEwRaDGLJH+bTWQf6rpY3w8/exQX4kUNqbg0p?=
 =?us-ascii?Q?ELdt6o2wzY1+3wQbZ1HVujlSf3Q7wHUz4zAw94sPoLOdHSBa1uTYU0fCYAZ1?=
 =?us-ascii?Q?Gc3Cn7OvQ5QtRMA86uwfQky8fNO1KAFsWNytAVHIHiaRNiYTIbWNqE247MQh?=
 =?us-ascii?Q?fUx+lNsDhIeSvdywNr97zzI/ZAJNE+c/jhybGuxoqXy0DCbnR+qazYEpJhKN?=
 =?us-ascii?Q?xeah5yGBR22DG9NBBQekmc61GjVXC2lfVatL3FMcY/a2xlSq/TtuIQ0caPMT?=
 =?us-ascii?Q?9pCB/yD0y8v0gikIqzMZkSm7N4ssRbtxOxqHmoHDP9qpA35ESJGVKClXLIl3?=
 =?us-ascii?Q?1g9FECS/IpLtwnYUDbroVXn33lnjM7bwkEkDr3LwSo+WYI1dJOQcGphVs6qR?=
 =?us-ascii?Q?F5uGCherMfPTlTRiihkwEKnCEwh9NjXBpK3+NiRoMSZOsRn5z2bfd2882Gj/?=
 =?us-ascii?Q?jA+HGbq/dw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de46cbdb-eb06-4bb0-b9ab-08da23b3fe1b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 16:28:39.6475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3J2lJAMTZ322SNRXbDONSmE/v5fMFmXh8gtKmu17dN2UiNSA8zPm3njvSxwzqYq
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

Use the existing vfio_device versions of vfio_(un)pin_pages(). There is no
reason to use a group interface here, kvmgt has easy access to a
vfio_device.

Delete kvmgt_vdev::vfio_group since these calls were the last users.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h   |  1 -
 drivers/gpu/drm/i915/gvt/kvmgt.c | 27 ++++++---------------------
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 5a28ee965b7f3e..2af4c83e733c6c 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -231,7 +231,6 @@ struct intel_vgpu {
 	struct kvm *kvm;
 	struct work_struct release_work;
 	atomic_t released;
-	struct vfio_group *vfio_group;
 
 	struct kvm_page_track_notifier_node track_node;
 #define NR_BKT (1 << 18)
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 1cec4f1fdfaced..7655ffa97d5116 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -243,7 +243,7 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	for (npage = 0; npage < total_pages; npage++) {
 		unsigned long cur_gfn = gfn + npage;
 
-		ret = vfio_group_unpin_pages(vgpu->vfio_group, &cur_gfn, 1);
+		ret = vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
 		drm_WARN_ON(&i915->drm, ret != 1);
 	}
 }
@@ -266,8 +266,8 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long cur_gfn = gfn + npage;
 		unsigned long pfn;
 
-		ret = vfio_group_pin_pages(vgpu->vfio_group, &cur_gfn, 1,
-					   IOMMU_READ | IOMMU_WRITE, &pfn);
+		ret = vfio_pin_pages(&vgpu->vfio_device, &cur_gfn, 1,
+				     IOMMU_READ | IOMMU_WRITE, &pfn);
 		if (ret != 1) {
 			gvt_vgpu_err("vfio_pin_pages failed for gfn 0x%lx, ret %d\n",
 				     cur_gfn, ret);
@@ -804,7 +804,6 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
 	unsigned long events;
 	int ret;
-	struct vfio_group *vfio_group;
 
 	vgpu->iommu_notifier.notifier_call = intel_vgpu_iommu_notifier;
 	vgpu->group_notifier.notifier_call = intel_vgpu_group_notifier;
@@ -827,28 +826,19 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 		goto undo_iommu;
 	}
 
-	vfio_group =
-		vfio_group_get_external_user_from_dev(vgpu->vfio_device.dev);
-	if (IS_ERR_OR_NULL(vfio_group)) {
-		ret = !vfio_group ? -EFAULT : PTR_ERR(vfio_group);
-		gvt_vgpu_err("vfio_group_get_external_user_from_dev failed\n");
-		goto undo_register;
-	}
-	vgpu->vfio_group = vfio_group;
-
 	ret = -EEXIST;
 	if (vgpu->attached)
-		goto undo_group;
+		goto undo_register;
 
 	ret = -ESRCH;
 	if (!vgpu->kvm || vgpu->kvm->mm != current->mm) {
 		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
-		goto undo_group;
+		goto undo_register;
 	}
 
 	ret = -EEXIST;
 	if (__kvmgt_vgpu_exist(vgpu))
-		goto undo_group;
+		goto undo_register;
 
 	vgpu->attached = true;
 	kvm_get_kvm(vgpu->kvm);
@@ -868,10 +858,6 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 	atomic_set(&vgpu->released, 0);
 	return 0;
 
-undo_group:
-	vfio_group_put_external_user(vgpu->vfio_group);
-	vgpu->vfio_group = NULL;
-
 undo_register:
 	vfio_unregister_notifier(vfio_dev, VFIO_GROUP_NOTIFY,
 				 &vgpu->group_notifier);
@@ -925,7 +911,6 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	gvt_cache_destroy(vgpu);
 
 	intel_vgpu_release_msi_eventfd_ctx(vgpu);
-	vfio_group_put_external_user(vgpu->vfio_group);
 
 	vgpu->kvm = NULL;
 	vgpu->attached = false;
-- 
2.36.0

