Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2769F4952
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D465810E904;
	Tue, 17 Dec 2024 10:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.b="B7qmAEfd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 343 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2024 10:01:49 UTC
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F6A10E184
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:01:49 +0000 (UTC)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG7ulGr031870
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 01:56:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=facebook; bh=f
 0d7e7vgSwFquFJynHv37WoE8Ih8RaPc8Rz59bR6mwY=; b=B7qmAEfd6Hw1WrqBY
 rI6Id5raq5HcPYbzvpRd92TkRoruGjZCL4ESORWNJi3LIv3lFfvYpddgUUyqfK4x
 iaDkbnsI4jfNF8dS/c0qSjt5rhcsLgNOKc8NsSVWM2TfTVrN+yIelnSpQs+G2QTu
 ogBvp27b++9IdRhaGkDu2h/kh8=
Received: from maileast.thefacebook.com ([163.114.135.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 43jg8pghwv-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 01:56:05 -0800 (PST)
Received: from twshared60378.16.frc2.facebook.com (2620:10d:c0a8:1c::1b) by
 mail.thefacebook.com (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.11; Mon, 16 Dec 2024 09:56:01 +0000
Received: by devvm12370.nha0.facebook.com (Postfix, from userid 624418)
 id D5AF610A1F005; Mon, 16 Dec 2024 01:55:55 -0800 (PST)
From: Wei Lin Guay <wguay@fb.com>
To: <alex.williamson@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <kvm@vger.kernel.org>, <linux-rdma@vger.kernel.org>
CC: <jgg@nvidia.com>, <vivek.kasireddy@intel.com>, <dagmoxnes@meta.com>,
 <kbusch@kernel.org>, <nviljoen@meta.com>, Wei Lin Guay <wguay@meta.com>
Subject: [PATCH 1/4] vfio: Add vfio_device_get()
Date: Mon, 16 Dec 2024 01:54:15 -0800
Message-ID: <20241216095429.210792-2-wguay@fb.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241216095429.210792-1-wguay@fb.com>
References: <20241216095429.210792-1-wguay@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: SLwHb5fScTUkqMeX0vFPTX4We-jAS-P5
X-Proofpoint-ORIG-GUID: SLwHb5fScTUkqMeX0vFPTX4We-jAS-P5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-05_03,2024-10-04_01,2024-09-30_01
X-Mailman-Approved-At: Tue, 17 Dec 2024 10:55:20 +0000
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

From: Jason Gunthorpe <jgg@nvidia.com>

Summary:
To increment a reference the caller already holds. Export
vfio_device_put() to pair with it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Wei Lin Guay <wguay@meta.com>
Reviewed-by: Dag Moxnes <dagmoxnes@meta.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Nic Viljoen <nviljoen@meta.com>
---
 drivers/vfio/vfio_main.c | 1 +
 include/linux/vfio.h     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index a5a62d9d963f..7e318e15abd5 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -171,6 +171,7 @@ void vfio_device_put_registration(struct vfio_device =
*device)
 	if (refcount_dec_and_test(&device->refcount))
 		complete(&device->comp);
 }
+EXPORT_SYMBOL_GPL(vfio_device_put_registration);

 bool vfio_device_try_get_registration(struct vfio_device *device)
 {
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 000a6cab2d31..d7c790be4bbc 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -279,6 +279,12 @@ static inline void vfio_put_device(struct vfio_devic=
e *device)
 int vfio_register_group_dev(struct vfio_device *device);
 int vfio_register_emulated_iommu_dev(struct vfio_device *device);
 void vfio_unregister_group_dev(struct vfio_device *device);
+void vfio_device_put_registration(struct vfio_device *device);
+
+static inline void vfio_device_get(struct vfio_device *device)
+{
+	refcount_inc(&device->refcount);
+}

 int vfio_assign_device_set(struct vfio_device *device, void *set_id);
 unsigned int vfio_device_set_open_count(struct vfio_device_set *dev_set)=
;
--
2.43.5
