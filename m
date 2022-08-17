Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE75973D3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 18:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECD999A08;
	Wed, 17 Aug 2022 16:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994FF999AD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 16:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z76zhMgemkqWN6FZH/cngDKs1Mu/iqrZvIW0dkismymSTSli3B3wkdd1IxUpwJKEQSOFTCoA65Aqqid3N3W2kJb06pWxsY+cFcsn54EJKVHadgLRV5lcTpsKiflNNQP+SgWbb499rPP/nlaTu/xLsVFNQ/8TDltgyFA+NdKmCXABhadXtgC5/O+TCA8rReIFrTJ18WOUKjdd+P+djDh1mYATM1QtR63dpbGU9uW7J16ExOI32Ro71D+RcEwrR0T9muio5XOyX6c0414yFQbWZYZuC2GtE3WUGkphGjgsgGo0ltqfp8TaSZt9sGNLlbrF3ogqGadOZxai6WxEFc4j4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoW90LWPuwfvOOkBJA/EMKYX3uNOBwS4KYHJwbCGqbk=;
 b=cykaQG7q6QyckTBSkUjEOcFBVsAy/lwtt4oYZJ5TTvjaD0Ah0b0WkBZA9P32nQl+3cfkGGow+8iB8GVhM5Ly10clY7lqT9mGEzknqkA7IBJN1M5VqFawaBuBe6+HACZJxgNtQCsrlKqLUFEc7ISQkhvbtjn051rV6sczrgxE/dOOonKdHhR9cE2ejVyKn44ctLI/2SEeND1K8Fbr5vEahDleMQ9x05UGUKf1SL4+hsVTXD0IWztLFGY0MyZpsjLGbZ7ECfXorL2/UIfi7uc3tOWqiU8cYf7mTDsCXBbTmbVeLe/WshPAa7N/leJJtCvVlJLwkqELoGnbBDjEH1G3UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoW90LWPuwfvOOkBJA/EMKYX3uNOBwS4KYHJwbCGqbk=;
 b=j2pnhNffBMRC9DTqj9oLN2r50C9fPgGHM/Nk/7Pglw7KD8J86p105qXzDtOIq4Y9iyQcqYkFMefc+AHJ3cAW2vUuHg/6EQ8s8AAZhWcOrXKEMy97qEPOJAgIKNlktV+0NqkBk75fNmmYd428UC+7DI3UxwX40GoFS/1aF66eFTV8aDUWSHwPPtNI1/YohmwnLvFSm3KrWgp3pf3Q0/ra8z68erMxoio5FEwMcNGSGXMPnzDWELNICAPXRYhKjnJXhTuV3SU9pVMgrAYlI2UfWywIkNmGzbKIkN0wN1oW7JbIf+YEL4JWlf7MXRFxuY8BowwrNvpKvwyrtCHJob7PIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CO6PR12MB5458.namprd12.prod.outlook.com (2603:10b6:5:35b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 16:11:43 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%6]) with mapi id 15.20.5525.019; Wed, 17 Aug 2022
 16:11:43 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 2/4] vfio: Add vfio_device_get()
Date: Wed, 17 Aug 2022 13:11:40 -0300
Message-Id: <2-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
In-Reply-To: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:208:c0::49) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e25a312-2e10-4ae5-a0d3-08da806b2d3a
X-MS-TrafficTypeDiagnostic: CO6PR12MB5458:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0oobJOxrjozstFJbpTjHcHQToLGpeP5GoHiM+N/07bWzSZTdtfoDnfE2v58JLDcIocdaqncxDtzVCy/8g5ztbFWkf+DuQwTypQt4JRnD1lZnBVrB5/ZhpDsBl5NQL0tf/lL2afrD50tw650jKMDiW3ZEho+IYYuSaOqcOBI0YAZAKMiDek1r/Ut9BcaG5jFy9RahDhfOx4DbCVzoEKctzFrrCbGiTNsFAs1usm4W4LuFaAjG2LkTTjl22lrEqlBS9izmmB2q4W/WlMwh6JVqXcPkDOMC0gD2nFC11FuKE3fAk5YfDtuhk/heRK3+4ZTxcqr3ZqNVSS9zUuVef5IMJKONYkMt2d94KQUYcc8I59SvlRqz/CRV8J2hT2KC0kj6lpAuMTZ14PW51wSOniaL0wPhS0gOOqRg1dONxuGlNA0YZ0T0An7MpdNP75RfkqvERbxTnmdq7uEqTJdofjaE/E5B5DQOmeLMaPPBzmoqvceUh2dB4XXfcqNLSUnLYuY2YYPUuPH0R0BCWakEXd0GqC96RVtefEiwbrQu3SZqEF7FZJQGQg2E4mesKPJR8xilSBi3KNMUeDdeR28tLVLQ42+Cbl970+Do7TZQM+UgVtyyJ6S+F2Yw3FeWPUG0pAVffMoTHKgq3xJ+94a9Oba809VlphZR8hfF0Z9tXTw6+V3GhSOHEKl3vwcSNhVlnCNqqCV81exuxCZ1l2RpAaww3BvfezjrQDRAdOv++W/lkJHmTCbJASGy0sAbefLcr8DKedGsQZ7iEkdbzv965lL3SjC5wXO8Rk+O+1gIFPlCClA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(26005)(316002)(41300700001)(2616005)(7416002)(6512007)(2906002)(66476007)(66946007)(8676002)(4326008)(38100700002)(66556008)(186003)(5660300002)(478600001)(54906003)(83380400001)(8936002)(110136005)(86362001)(36756003)(6486002)(6506007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WDms9LsBlPr/TngxO15w/LLl5B9+q7Axj1lKeyZKziYI4MQtDMv3rWWu22Vs?=
 =?us-ascii?Q?OWK8DhuWqszNG/Hw4gtAWsaXg0ezFOmNv/xhdDf2i6nRJdr75IUd7i7eHfVH?=
 =?us-ascii?Q?m0PTumMJGB+dt83Ei6oEkSirzTylnu50SPVAcvMsz9kDrFmtAmogOFh0fqNL?=
 =?us-ascii?Q?/W9a6K7E92y3QuTAh3IQ3RxzTlKj7Q4xVo+L87fM0WMeiSCe6yXbmmsgcjcW?=
 =?us-ascii?Q?UTpvzTyLB5TPVtdkbL/on0v9hGeQdIAw7NRCZV1hbzaPla5iBfwHEZjsn5Uo?=
 =?us-ascii?Q?OsYE4wCq1BW0KM3zNjWahb6pdCfJ8JH5cGFE8JQxz+1oBj3OJ7vJMQ08G7NQ?=
 =?us-ascii?Q?pYcMCg6Wbe47ZA9HumV4WrsThD0N2XpV3I0xGn7sIPPQy2uF+pw+99KNEK7B?=
 =?us-ascii?Q?2nupR2+KeVhvihkY2ylUJKMNaroaCigfLbw/ozoHVwhPLlO9gsptD2ZplvEc?=
 =?us-ascii?Q?tnV77IXlnrtsYYBNqlymbIYnDWDDqzMBstRweRoVGEXbc1q47FksIymMsuds?=
 =?us-ascii?Q?y5kDUyHdzu5oKi2ZLZO02d/MdyvLN0iDR+nQA7ur+9rvgc/YKiXzJ/nh0hsq?=
 =?us-ascii?Q?5YH2agFG+OfnNqMTiLIL85j4sKqtpFWbIdNhQ1gWCoHADdaDj0MbxK87bA95?=
 =?us-ascii?Q?Vu7cf8HprXEYQ/DYbEB1EBbQtdM8UtdBIL/NhLpkOIvm3U5aANQ4WpuYig7O?=
 =?us-ascii?Q?OYf1dg9pejIBZeDtSpIkUzF/YxWlFyccyXY7Kgx8P9+ulJiob3eor7MXyF0r?=
 =?us-ascii?Q?Cx+7vn4G6Y3KVxSRkmZMNz6zFBqWa9idpzyYVZoxx6cciXKa+ZwLnoPbYfDN?=
 =?us-ascii?Q?gGBWMsd7iQ6C+lfpF/Q/qKpVvUoJ77vxGJB32z8fS2jlP2XE21PfzgVWjpAu?=
 =?us-ascii?Q?gbVf/X9ADrGu5F6fv3UeaYPkecGpzSEPRCzpryXrD6VyVzyu1KFaEYrrAt+0?=
 =?us-ascii?Q?uX+MEi2Ih4tsPuqpVqTxC6xFm+CGpky7gbwU3jF98Lhzywf/MdYFO4OdaLZP?=
 =?us-ascii?Q?zZ/Ppw95anIepJKKRsbrxpaRCuXdtkfM8seyVOtyh2Ztku+JbFHhifP4urt8?=
 =?us-ascii?Q?uIUCxOcX5CkmzVXYNl51u23enko79s7KqUNn0W4lpnPtZ0hkb2yImhK0nJzJ?=
 =?us-ascii?Q?LX/4wHZtmYH7ds3thbJGeTzwBfYnHTk+fSfyCUd9hvklaAblOA96OUhJC+jL?=
 =?us-ascii?Q?pvHu0T2qCz+2DHAnGdR6u1pS6VmE9jpiFWZoTF1OjJt0VoKbR7pRnI/RDg4s?=
 =?us-ascii?Q?WTS4xDYFU7/Hg3dmB/p5BXbnQl/DpTWu5hIAsYGwNw3b7fWbuMWbWtfmDVJE?=
 =?us-ascii?Q?4NtGluzYyPslYiEsYjuSI6gsseGx0Vcl7XlUvjH/3fQzQ+Q5hB16oNIUX8Xx?=
 =?us-ascii?Q?s3hnhrZxU144tkjkjySH7tTtM15oLTuGqymyV1nKbn7FVb3izNPB5L/W8h9Q?=
 =?us-ascii?Q?3TGv7tb/rzsL9PhXIwIuaNoX5X9MnbG8epAd3Atik7mnc/KCORjOdPnj3Hi5?=
 =?us-ascii?Q?BBte60tFX0q42zcQOm3ICTf+uA8+whE14n909etJ3FxcsHxMRWK6Y/fe6otA?=
 =?us-ascii?Q?dEkorGEMxWhm/L2ttgoDKTkFpcicolX6ZhCIBtv+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e25a312-2e10-4ae5-a0d3-08da806b2d3a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 16:11:43.6113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IriunbvT7X6ABd3G26KGtH6W09oLRi7hxDx5La4E+uyAcJ2aciXWhu3BoSgT5C8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5458
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To increment a reference the caller already holds. Export
vfio_device_put() to pair with it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio_main.c | 3 ++-
 include/linux/vfio.h     | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 6f96e6d07a5e98..5ad50aec7dc94c 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -451,11 +451,12 @@ static void vfio_group_get(struct vfio_group *group)
  * Device objects - create, release, get, put, search
  */
 /* Device reference always implies a group reference */
-static void vfio_device_put(struct vfio_device *device)
+void vfio_device_put(struct vfio_device *device)
 {
 	if (refcount_dec_and_test(&device->refcount))
 		complete(&device->comp);
 }
+EXPORT_SYMBOL_GPL(vfio_device_put);
 
 static bool vfio_device_try_get(struct vfio_device *device)
 {
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index e05ddc6fe6a556..25850b1e08cba9 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -143,6 +143,12 @@ void vfio_uninit_group_dev(struct vfio_device *device);
 int vfio_register_group_dev(struct vfio_device *device);
 int vfio_register_emulated_iommu_dev(struct vfio_device *device);
 void vfio_unregister_group_dev(struct vfio_device *device);
+void vfio_device_put(struct vfio_device *device);
+
+static inline void vfio_device_get(struct vfio_device *device)
+{
+	refcount_inc(&device->refcount);
+}
 
 int vfio_assign_device_set(struct vfio_device *device, void *set_id);
 
-- 
2.37.2

