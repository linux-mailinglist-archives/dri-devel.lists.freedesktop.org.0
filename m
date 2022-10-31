Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAB5613967
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 15:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D8510E228;
	Mon, 31 Oct 2022 14:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01olkn2018.outbound.protection.outlook.com [40.92.99.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A693D10E1E2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 14:53:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRCRH0ikiqwBcLX2ii96XgqRKXA8VZVanMMTjFzv2hPS0YdZyoGUozbZhmZXbDr/PmFNCqfE1mFFWTYoTO4UFNMLGxQLBPXtFSeJ4z7lYK0iyF/yAHs7vkZZvexF2zBfIK0KZC1rbfInCkjODZ3S/s5wIRdB0Y+7T1nxQMg7VSo1XXcgoIRFZ14+mu1/ivoGADVsCpEZhCTiHJnNNs/uyQ4B9c05dVUvPbAXcCWzWFfI7ntap3RfrhgfvZP0TrgrhemKXzVQIPhXxKaGEzWnhz6iyYsaOO+NbgIrOcgOHIPXdOguTGGdam/HnkIWx/hj5R1nJy8PS8gaqWsk4Rr9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9dEn6D7Co1PX/Iiiw8zL1X+12AdwI+Oj3zBGlqIa08=;
 b=XVgdo4dI8ESVqcf/QdKf3an6AF5j+NnjJDbwB0Nbsp9J88UbYkfeAzqtLRV7w66dHt0z5/uC/8juE1OFqapJKbRAkaAFbHeCBDKdxCxqiknfwgrK/9fj5CdAEUhdY0hDQKoWHKIiBpvyLJRZCcxZszGpCLGSnh6fRl7Dyuq3uEAEDtP97Mzg2OGUJNezol6bS3qE9V34U3+360qh1R/5y8mVmFISVWocE09EkawNod90vqmfYQ48UCxpcEHJ0/V2wNPsguOr7ZsNkIqLGSjMP50FQzwlBeO2C8bUWJ7er79QgkKmem/9eP3OGS+hA02Y6WZ0GEFIsFZWLdvAX7xDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9dEn6D7Co1PX/Iiiw8zL1X+12AdwI+Oj3zBGlqIa08=;
 b=Q+so7jGBX47BTlZPClQLG/7XkqAY7eOGSdKf+heeoOZo7MLk+VhN9iO/bKuBHZYGl+CBH1FYztRWUIBz4bC0e5MKvu6Kjf/q2AjMdAcRMId+xOX0/AqJ6BocAYvs8Ed6pDlSOXci++/JJqToCW8j9J5EfMPTBI0jMXoRsFmbsRhuBJKLp11eQODZFow4tYI2Sld2ayrGGYYYw1fT7xevx85K526KBcv+dVpsxJLhuVolBvWH4BqeYupxNTzko95Dco6lT2si2i6DPIO0rEkAZ3wQtF+LRGrTIatHBpseu1NOtyXGwSv2MBO68Iy8NsvaRoB/2YeZBgm3wiMPKQPXRQ==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by OS3P286MB1807.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 14:53:01 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c90e:cbf3:c23d:43a5]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c90e:cbf3:c23d:43a5%7]) with mapi id 15.20.5769.018; Mon, 31 Oct 2022
 14:53:01 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Subject: [PATCH v2] dma-buf: fix racing conflict of dma_heap_add()
Date: Mon, 31 Oct 2022 22:52:35 +0800
Message-ID: <TYCP286MB23235BB803E3A778C85B50F7CA379@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [4vwNSavDv/oZ9jpJB5pxJFgROf8JOzPGBz5aMq7ezAI=]
X-ClientProxiedBy: SG3P274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::23)
 To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID: <20221031145235.17912-1-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|OS3P286MB1807:EE_
X-MS-Office365-Filtering-Correlation-Id: 98353f0b-a22a-4e6a-36f7-08dabb4f9b68
X-MS-Exchange-SLBlob-MailProps: hmxDvsT8QC8CUGNFSCVMrtHXTb9OmFgxOTK9PsKAKWYSFYC5ELcZV84/h9sQbzeTAdkYq9jJsGl9bNGYtY4yq8idvNNYr+tprmxd6B0HLdEkh1C95F9vW3O0xPlzI3QR+dQfQv6z5VchBXhJtEvQNlbNzuEVB47vwByv3YQxyF5zaXEyy2fxTXtZ0qKXJjkzZLCyCVoRUBRQRT+f5b5c/yX0vBkOd1FUxPqLZMcI0jZ7WhiVssKFIDtZJEw4tq0QOCckYxU5eP8ykQprX2Fi2xsO4ssl72pCCA9VcczyJgaoCA38uIenFg1JOYErC5Ib+rw6GJuzoSyZkVRxFaJ9+Lk7MtuE3swNAiKRwSC/PpoVmFmwSEGDNYiuaRtuFQJr8bVprht53bb97pTNehAZbbodynfHYCQBKA+vNJNa02qsFxC/A+wzv+ZCrgBOaIrcPELWQrq1ABknlfynUurCbg9y+aSnLCA9+6qz7JN4nxuv8mdNF5xTY7mVjllctt0m/gjn9/WVKcDSUgtVTiB9g2vdcd5njYpSfR+U4btLZ6z6EWrTDsTpPtJYjH7D2u5lw3v2uwEZ6FdWcAY+zOrPEBcU9vrCYEnXcqXan64zhvBzI6CZJ9HzlvMX4iXgh6R//d/TJpNzZspQp92dApbhrJVS+AeX5h/OhmuV4hkE+yoYMwPRd5st+AEZxDa85QZCBNX2/GOTfobwJEn8Lcz8NYhl3VGpCvAgM6YIaxBJYqvlz9944z0I/o2Cu0IviEBZT6Oz+ygfpufwoBXjBZzn+2g4eG3EeOXwyJTFq4NG9R391E3X4sbPXg==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fUgpmEXBWTsCDjXnDMldaxaV4GxOkTGJqWZgl3Zj+03mrryeoLAvu1gIapVgzmNfVzqHhNvL4twuX84kdPzqYKCY2zEGvGyIbpHZGgkaT1uNPe0GpOD2+l7Eq1fCDDAzFicAPjl628Owz1vJjL6eJsoaqj6EYVCsnVf1fkVtw+XUkFEuZU2ScnI3k1K5/BqkT5g7l3AxtKSSzVn2UdY8rSb1ac17R7x4UTBQNuMWMlrFtq8AmxUMmpU4NNPzwHu11uS4o3NJnE+jxybinF2vVnnqt90th25t0Aooq7A9hBou2eVTqU3qizo7NyeUCrGVo20BtiI+tjfM7n1orj6BfLrjcwWSVRx3kaz9YK72dsRaElQILV4AUX7n9+aQpKhPy8K7Y/dI3Coml8RdwzNUrs2+SFYUg1RNA2oBlw4RvbVs7rRbh+4eAwC5a6S5Y6jMxAJOqnNk+aBo5g7XSzhYhqRp2vaRdh3TTO0Vm3MdxPj0vqt/CqGdJ0TMsfOkuIB18vz4qRdW1iGdQmhJmqtdZqXWkzdDE7p7vA+SCvn1MbRsCzriavOhcHoVxnIo1jr42pLh94O+EP+3sJp3RU2xctvdcDdyhoxXgIZY5b3vlayFjJYiFWu9CI1Bkmo/OWzgldGnbYTx11OofL7u9DsgKN2laW2XXo+227yQAmzpn1jOvEC0jtA7b9foar8Y0cWy
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AB/o4Wi+TH4UvrUJPES/tiRtb5UED7EZXHKXyCjE30NSP9zIu1+1uwlht9CX?=
 =?us-ascii?Q?MO+qaSPTb8UDopu8YJv3SOaMQNmPxGfgwZW8xn8+ATJMdE1npaply8+p+Avu?=
 =?us-ascii?Q?klJAWgRklTAYNWPJRlrps9k1Wwwto/85ZrO0j05Q4RL+bE5X9gr7MD5Omxvf?=
 =?us-ascii?Q?S8csXW06XSk7mihSZRuHXds3/ndBkjSppCTT+QhfXlGyfSLQ+3fUzNx85TLN?=
 =?us-ascii?Q?e2quo1hZD2Scjmlk8cWcaxKjY/j96ndKD54Kayv2FSDHPj46+qF2Rsbhz5ZS?=
 =?us-ascii?Q?N/mIb34ApVDiFDC4+vLnNri5ED+HKPn4eDwenW5bbTQW1xqVyI4ySerZG4ck?=
 =?us-ascii?Q?aK5DDQP9fWj+PFCtkmrTo3WM5nPBvN7ya+TfooFPtFwzHiWCubQTW3x++fnt?=
 =?us-ascii?Q?LVekVatbu3bEqJnHjeAGcv8e4WPft1cTXwlkn7CWF3vA6VaV/PDmm9xUCGNW?=
 =?us-ascii?Q?Q9DOl+SENWRHHUkDrUSoy7NDvEPk0UCet/Rftx0e6mDmU/5MWIfGPwqmjb/1?=
 =?us-ascii?Q?4ezeHIPyv16uPOKN+Y+iil5TYhezXtZjSmg2QrdmuP7nGS+FP6qP8dgh0GC6?=
 =?us-ascii?Q?L8PddsoC5Hp5k3JQfz5r4he+QiS3E8BR5NEvwr4w9yj+rsp/7dW4/83svbdt?=
 =?us-ascii?Q?rS6zHuoHoYXFEYCB+VEBdl/32tBcEC3KyPUjdL/LRdo/JNgM1v9QW5i3MTwY?=
 =?us-ascii?Q?x7uamF7rnYZzUnw6sObH3nKaONXEuoQiqKfZtPh4zzqY0jxLYPHaIoWrs6Xd?=
 =?us-ascii?Q?LnXkg4wXWdTq9F1aQlTiAmx3Yqvje1ECGWth+1Wt0/iPGTigaWN6knSUAEL0?=
 =?us-ascii?Q?moAS71ybZ1huJPpuB3D7rtzhCyClJltPpqDHZDnREi07niW59626742NN+uG?=
 =?us-ascii?Q?ltIIpTQc/dIUpYvQqERqtDmDndGbNNuh1WL0rKvGzWNijQhJHO+h3IlBq1jI?=
 =?us-ascii?Q?jAH7RibRIYfDDpu/6KUnEty26vyNdZ2UAomvXC2vWa6gIVf4klyrsFnVI6Ss?=
 =?us-ascii?Q?Pa+Fi+9NjfBJN3pGqKS2hL3YWS4svWd6vlp+/HpUjcPVnRQyq7pIqpfLa4af?=
 =?us-ascii?Q?NlH3LWksqoCqY8P/ZkOF3bYTzIbD0HqZxRfYU0QszHMER2/Fm6F1SnvRQ2Xq?=
 =?us-ascii?Q?rHU+BIOgALbDJGg7sMCe+MY3l7xMeVxxIIE1Xn2Jff45a5gpgSZVgvajSKZN?=
 =?us-ascii?Q?7hHQ4pkeRbJhPMKRHdoQIYkVjqmQ7qcvVDwOthCXs2V0RHEQqonmEsC3ml9v?=
 =?us-ascii?Q?zIbZI0V6N+PFx7abUvYqhLsKpr1O71r+Iog/Vtb84A=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98353f0b-a22a-4e6a-36f7-08dabb4f9b68
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 14:53:01.3110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1807
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
Cc: benjamin.gaignard@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 jstultz@google.com, afd@ti.com, Dawei Li <set_pte_at@outlook.com>,
 labbott@redhat.com, sspatil@android.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Racing conflict could be:
task A                 task B
list_for_each_entry
strcmp(h->name))
                       list_for_each_entry
                       strcmp(h->name)
kzalloc                kzalloc
......                 .....
device_create          device_create
list_add
                       list_add

The root cause is that task B has no idea about the fact someone
else(A) has inserted heap with same name when it calls list_add,
so a potential collision occurs.

v1: https://lore.kernel.org/all/TYCP286MB2323950197F60FC3473123B7CA349@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/

v1->v2: Narrow down locking scope, check the existence of heap before
insertion, as suggested by Andrew Davis.

Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")

base-commit: 447fb14bf07905b880c9ed1ea92c53d6dd0649d7

Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
 drivers/dma-buf/dma-heap.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 8f5848aa144f..1c787a147e3a 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -216,9 +216,21 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 	return heap->name;
 }
 
+static inline bool dma_heap_exist(const char *name)
+{
+	struct dma_heap *h;
+
+	list_for_each_entry(h, &heap_list, list) {
+		if (!strcmp(h->name, name))
+			return true;
+	}
+
+	return false;
+}
+
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
-	struct dma_heap *heap, *h, *err_ret;
+	struct dma_heap *heap, *err_ret;
 	struct device *dev_ret;
 	unsigned int minor;
 	int ret;
@@ -235,13 +247,11 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 
 	/* check the name is unique */
 	mutex_lock(&heap_list_lock);
-	list_for_each_entry(h, &heap_list, list) {
-		if (!strcmp(h->name, exp_info->name)) {
-			mutex_unlock(&heap_list_lock);
-			pr_err("dma_heap: Already registered heap named %s\n",
-			       exp_info->name);
-			return ERR_PTR(-EINVAL);
-		}
+	if (dma_heap_exist(exp_info->name)) {
+		mutex_unlock(&heap_list_lock);
+		pr_err("dma_heap: Already registered heap named %s\n",
+		       exp_info->name);
+		return ERR_PTR(-EINVAL);
 	}
 	mutex_unlock(&heap_list_lock);
 
@@ -283,13 +293,22 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 		err_ret = ERR_CAST(dev_ret);
 		goto err2;
 	}
+
 	/* Add heap to the list */
 	mutex_lock(&heap_list_lock);
+	if (unlikely(dma_heap_exist(exp_info->name))) {
+		mutex_unlock(&heap_list_lock);
+		pr_err("dma_heap: Already registered heap named %s\n",
+		       exp_info->name);
+		err_ret = ERR_PTR(-EINVAL);
+		goto err3;
+	}
 	list_add(&heap->list, &heap_list);
 	mutex_unlock(&heap_list_lock);
 
 	return heap;
-
+err3:
+	device_destroy(dma_heap_class, heap->heap_devt);
 err2:
 	cdev_del(&heap->heap_cdev);
 err1:
-- 
2.25.1

