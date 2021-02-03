Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B17C30D6BF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 10:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253B36EA22;
	Wed,  3 Feb 2021 09:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E34A6EA22
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 09:54:44 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1139nxjF010981;
 Wed, 3 Feb 2021 09:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=W0gTtf1J4ME9UXACICdrUSgWMHPzwXYbEDjcld2NgXI=;
 b=SsRRnsJRnOAWxHtFtdMKlB3yZMLQ3d/D4Ue/L3VVzbh12VY8XPqJPu7QOnB1+pjXNkul
 2mYfnZPs/9PKIsxo+cARlu77ode9YZQdhcwMDY5VYC9wwklRREjvZ2OZVNU9H7WMbU6B
 I4hi6REvK3DL6tHmF1J19gqh6aOR6vsGWKliZTlAez3sLn/zKFr1vCWRcQRaMjQKc0JP
 6AuYhcW6a05xdF08gg+ljBBRTZcQaUbaGgXZaLiJ3eB0RfLRfOI7QJhwFrtBzPICuO22
 o7eJAAVwZ+PYVpyDn7I2V8yoQgVh9Ov0Dr+GhwAadUkQ1qcV1iu8svP40ElymIn5P9bv Cg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 36cydkyjpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 09:54:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1139oaTp149099;
 Wed, 3 Feb 2021 09:54:35 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 36dhcyaaj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Feb 2021 09:54:35 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 1139sVrM020370;
 Wed, 3 Feb 2021 09:54:31 GMT
Received: from mwanda (/10.175.206.62) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 03 Feb 2021 01:54:30 -0800
Date: Wed, 3 Feb 2021 12:54:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] drm/virtio: fix an error code in virtio_gpu_init()
Message-ID: <YBpy0GS7GfmafMfe@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9883
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030061
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9883
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1011
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030061
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If devm_request_mem_region() fails this code currently returns success
but it should return -EBUSY.

Fixes: 6076a9711dc5 ("drm/virtio: implement blob resources: probe for host visible region")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index b4ec479c32cd..b375394193be 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -163,6 +163,7 @@ int virtio_gpu_init(struct drm_device *dev)
 					     vgdev->host_visible_region.len,
 					     dev_name(&vgdev->vdev->dev))) {
 			DRM_ERROR("Could not reserve host visible region\n");
+			ret = -EBUSY;
 			goto err_vqs;
 		}
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
