Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9573C944AD2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 14:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104F510E5D1;
	Thu,  1 Aug 2024 12:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F8jiYAD+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF10A10E933
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 12:06:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E942DCE1939;
 Thu,  1 Aug 2024 12:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57CAC4AF0A;
 Thu,  1 Aug 2024 12:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722513959;
 bh=Vz6K0CseR2CvsnyMziB3zHBkOhk2OUVB/Qm9uhyU7F4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F8jiYAD+/8dE1YMWeRzW41azT2Hb3buByI2zt4jSSEsUYzeYaKnzbzOdoMwLYX09i
 bV9wu6XZQIvCUyvVvpms63V5cBYtisC11FpT/G+LU2psIw724ofxKru6pj44P4A4Xi
 HWLwg3w3bCW6T7ScasgQxzL2f3A3bGihpysPMt4TioDA2gT9g7lSW4wEpopUEDp93m
 lsZIzOOw04cTwVr8WJ+qkF2SWcnHL0XnfQwXDjOptvnIT3uG140de3bFQT5ll3YjPP
 vwnB7qBqneAWK6h6KjWlvKHgURnZsh76LCF4KRvAhzRFbPKAHsi0+NCswmZE5ou/jU
 Xfpc08G1A0tag==
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Yishai Hadas <yishaih@nvidia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, linux-rdma@vger.kernel.org,
 Michael Margolin <mrgolin@amazon.com>,
 Mustafa Ismail <mustafa.ismail@intel.com>, netdev@vger.kernel.org,
 Saeed Mahameed <saeedm@nvidia.com>,
 Selvin Xavier <selvin.xavier@broadcom.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Tariq Toukan <tariqt@nvidia.com>,
 Tatyana Nikolova <tatyana.e.nikolova@intel.com>
Subject: [PATCH rdma-next 8/8] RDMA/mlx5: Introduce GET_DATA_DIRECT_SYSFS_PATH
 ioctl
Date: Thu,  1 Aug 2024 15:05:17 +0300
Message-ID: <403745463e0ef52adbef681ff09aa6a29a756352.1722512548.git.leon@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722512548.git.leon@kernel.org>
References: <cover.1722512548.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Yishai Hadas <yishaih@nvidia.com>

Introduce the 'GET_DATA_DIRECT_SYSFS_PATH' ioctl to return the sysfs
path of the affiliated 'data direct' device for a given device.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/infiniband/hw/mlx5/std_types.c   | 55 +++++++++++++++++++++++-
 include/uapi/rdma/mlx5_user_ioctl_cmds.h |  5 +++
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mlx5/std_types.c b/drivers/infiniband/hw/mlx5/std_types.c
index bbfcce3bdc84..ffeb1e1a1538 100644
--- a/drivers/infiniband/hw/mlx5/std_types.c
+++ b/drivers/infiniband/hw/mlx5/std_types.c
@@ -10,6 +10,7 @@
 #include <linux/mlx5/eswitch.h>
 #include <linux/mlx5/vport.h>
 #include "mlx5_ib.h"
+#include "data_direct.h"
 
 #define UVERBS_MODULE_NAME mlx5_ib
 #include <rdma/uverbs_named_ioctl.h>
@@ -183,6 +184,50 @@ static int UVERBS_HANDLER(MLX5_IB_METHOD_QUERY_PORT)(
 					     sizeof(info));
 }
 
+static int UVERBS_HANDLER(MLX5_IB_METHOD_GET_DATA_DIRECT_SYSFS_PATH)(
+	struct uverbs_attr_bundle *attrs)
+{
+	struct mlx5_data_direct_dev *data_direct_dev;
+	struct mlx5_ib_ucontext *c;
+	struct mlx5_ib_dev *dev;
+	int out_len = uverbs_attr_get_len(attrs,
+			MLX5_IB_ATTR_GET_DATA_DIRECT_SYSFS_PATH);
+	u32 dev_path_len;
+	char *dev_path;
+	int ret;
+
+	c = to_mucontext(ib_uverbs_get_ucontext(attrs));
+	if (IS_ERR(c))
+		return PTR_ERR(c);
+	dev = to_mdev(c->ibucontext.device);
+	mutex_lock(&dev->data_direct_lock);
+	data_direct_dev = dev->data_direct_dev;
+	if (!data_direct_dev) {
+		ret = -ENODEV;
+		goto end;
+	}
+
+	dev_path = kobject_get_path(&data_direct_dev->device->kobj, GFP_KERNEL);
+	if (!dev_path) {
+		ret = -ENOMEM;
+		goto end;
+	}
+
+	dev_path_len = strlen(dev_path) + 1;
+	if (dev_path_len > out_len) {
+		ret = -ENOSPC;
+		goto end;
+	}
+
+	ret = uverbs_copy_to(attrs, MLX5_IB_ATTR_GET_DATA_DIRECT_SYSFS_PATH, dev_path,
+			     dev_path_len);
+	kfree(dev_path);
+
+end:
+	mutex_unlock(&dev->data_direct_lock);
+	return ret;
+}
+
 DECLARE_UVERBS_NAMED_METHOD(
 	MLX5_IB_METHOD_QUERY_PORT,
 	UVERBS_ATTR_PTR_IN(MLX5_IB_ATTR_QUERY_PORT_PORT_NUM,
@@ -193,9 +238,17 @@ DECLARE_UVERBS_NAMED_METHOD(
 				   reg_c0),
 		UA_MANDATORY));
 
+DECLARE_UVERBS_NAMED_METHOD(
+	MLX5_IB_METHOD_GET_DATA_DIRECT_SYSFS_PATH,
+	UVERBS_ATTR_PTR_OUT(
+		MLX5_IB_ATTR_GET_DATA_DIRECT_SYSFS_PATH,
+		UVERBS_ATTR_MIN_SIZE(0),
+		UA_MANDATORY));
+
 ADD_UVERBS_METHODS(mlx5_ib_device,
 		   UVERBS_OBJECT_DEVICE,
-		   &UVERBS_METHOD(MLX5_IB_METHOD_QUERY_PORT));
+		   &UVERBS_METHOD(MLX5_IB_METHOD_QUERY_PORT),
+		   &UVERBS_METHOD(MLX5_IB_METHOD_GET_DATA_DIRECT_SYSFS_PATH));
 
 DECLARE_UVERBS_NAMED_METHOD(
 	MLX5_IB_METHOD_PD_QUERY,
diff --git a/include/uapi/rdma/mlx5_user_ioctl_cmds.h b/include/uapi/rdma/mlx5_user_ioctl_cmds.h
index 106276a4cce7..fd2e4a3a56b3 100644
--- a/include/uapi/rdma/mlx5_user_ioctl_cmds.h
+++ b/include/uapi/rdma/mlx5_user_ioctl_cmds.h
@@ -348,6 +348,7 @@ enum mlx5_ib_pd_methods {
 
 enum mlx5_ib_device_methods {
 	MLX5_IB_METHOD_QUERY_PORT = (1U << UVERBS_ID_NS_SHIFT),
+	MLX5_IB_METHOD_GET_DATA_DIRECT_SYSFS_PATH,
 };
 
 enum mlx5_ib_query_port_attrs {
@@ -355,4 +356,8 @@ enum mlx5_ib_query_port_attrs {
 	MLX5_IB_ATTR_QUERY_PORT,
 };
 
+enum mlx5_ib_get_data_direct_sysfs_path_attrs {
+	MLX5_IB_ATTR_GET_DATA_DIRECT_SYSFS_PATH = (1U << UVERBS_ID_NS_SHIFT),
+};
+
 #endif
-- 
2.45.2

