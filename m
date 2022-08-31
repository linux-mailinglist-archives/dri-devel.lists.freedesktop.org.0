Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC4C5A8970
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 01:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD2B10E537;
	Wed, 31 Aug 2022 23:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90ACF10E530
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 23:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erqQYYzMt3TIHERCbcXKVQ4+ninYJLiERNmuONTy7TEHiq4EwnrF5ISnSQE89JrOrWKC9hFxVlsJvORGu4HEtI3e+FFHyKF9KaWG8GxoQadZ5UtDRnm8C/y5F2yzWVuwLdeZr1LIFbX2w960wmoe+m41vjEBxotTPmf9FYCYVyyX8KiW36hnuahukAlJlpAjbpUnnEJYthCOwr/Gj2E9PtnUtyOAAXqBO+FJyyZr9ImAIfJvG1zoHQguOudMD2NLJn1bb63nAKN1fSfvvZUMpauy3+jD3n2DOvMspijL4TCLj/XVeEdqU/k2dCbzVA++F1Bt/XwwSCTTjV+JwoXaqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdfrhO4qtY8mBEYKYotoEifH6Kd67gbnXu9+pK1ShaE=;
 b=gKq/JcoTZLpYoRp3p0f/6t5x5gRa3bg3sf3i722Ftyrz0RkeJ2rTfhbyDIRZVaQY3xPgif+Ph+45rL/mgIniy3t3GRGiP/5iI2huVJCOXYafS3kW/+m5gkOm+ya70ywBLBZcFv1y16nF6B5IQmlQS0aQiQU8mCVSf95Z32Jyniqygxes0T6rs1mDc3/KPaRg4XjvS3YgrsZ8pk3n/xRXDVDvq62y6T3U0HAZqcQI78XkMhoV/kc0xIAi2pUOwHyP+l4yKb6uDaoWVFGHyBBzSIbtE9Cc0WHxi6+CkcgIwPDasgvvcuT4zpCf24IrC2LkUfw5stir730cL1T2SdF+aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdfrhO4qtY8mBEYKYotoEifH6Kd67gbnXu9+pK1ShaE=;
 b=I9SFCQp2uQMKVxeAltQIMV51BWHFqYWY+JwayrrVqC8p/oBcWeykShiKzXud7wvwoc3+P3Ep+ZAFmDPaL5KXe/9s3QwZ/cIlaNkgSCFJ1AqMJ1vXOVoulaB/xbW0RLKB8JOqvr2MYmZ56DQIIv6YV7UOzfc/n2lXaMyyzeNjQd1zbzhMmAu8EaaN2DzqPLGFURHn8+tigHuALbw1NFUHwr+zuUucdsYgHgBhN/MhlJz6yiCB3oOqYLWOylHxc+ROVB4dfp6bo8UeHJnYP8wJd9EA6KzGkiol6NPEm33PVVE1UC5PiJXrtwoTgST7XYpDIK/F26ScjTgYPWDQwCH6Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MW5PR12MB5650.namprd12.prod.outlook.com (2603:10b6:303:19e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 23:12:46 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 23:12:46 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v2 1/4] dma-buf: Add dma_buf_try_get()
Date: Wed, 31 Aug 2022 20:12:41 -0300
Message-Id: <1-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
In-Reply-To: <0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a80009d1-1029-43f3-576c-08da8ba65026
X-MS-TrafficTypeDiagnostic: MW5PR12MB5650:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ex6Luw8FF40gUx/EuaoAQSw+JAaPkVEkCtE23r42Y7sYkPfezcDTa93CKxsNzn3nFJcwcnj3GU5ZmbC34t3/vN54eMiAYR/VCPxsWsPw6BBOKwMJuBKb/fkX9FwRJPG1MnayMmkuWcose6wtpGPqXLuBN0czTPiktnTONDUBz1z/A1UdEAnqGLz1TWUi19nIEghg7a4owu5ztzlTjqtuRCiOBPdAkmrBzyI5Q03dBAvMwxtScEpjS7AiLmNbCsl0bJwzMv9gvN2ofc40c+XVWnkyCfhlZusvdVV2II11S736JLyvJH+fZkqAnu4aff6ZLEvqubli3tQHok3fFUrwgaXSf0s0hO2LG1oFBJyqCIn4MQxXsHGXscTY5yxcOETo3dyicG0Qe0QzMqkjDidF5Ik71cRWI5tHxVVRO6bWaJ0oXpzdhqXvfLlkEnTrrxjC4IM2dn1nwSFJj6t3Avlsmd9ZbGlUmv3QM0JjhZiC0u4JAd5u3rbxsiN8jK36eC4zNRYunaq44Y0kZ4yWYXOUssiEo+T5Po8c7VGC/KXTem/kEMeveHFLFrP1E130omZkswhe7bkIcDaKQAvpw4qx37xkB9S3fGT7L6u36ZMenKkjZVYywBCLjkabkfoPcpUCsTRUbOU1XGPh4qh+Lph/6G8I1f0aUwNxCtCe93joVHnnwtXrZzR76k5w4EdbQRYbdiESBxhtOZ0z+coIfxlv6XgTBYGxYrv1iI30ckFTJuE/Tev7hpIyHdzksr1TpIE1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(6506007)(66476007)(66556008)(8676002)(4326008)(316002)(8936002)(6512007)(26005)(6666004)(86362001)(110136005)(478600001)(6486002)(38100700002)(54906003)(41300700001)(186003)(2906002)(66946007)(7416002)(2616005)(36756003)(83380400001)(5660300002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wYc4MRT8j227NVlDFhP8DSZnbNU6/FjcNCS/zmf0JNNHJJdWIaUf2kXMVCPM?=
 =?us-ascii?Q?51ov9VPyjl+sGJAIiJlS7t46rTVGQG+VZU1mbEsQbx4VbDJWErwJrP9ukV1V?=
 =?us-ascii?Q?1GhISRyHXjBwLq6vRMSmeM6zuLYQkfIDt7TOadVyGEoR2FfPNDKCn2qBHyuj?=
 =?us-ascii?Q?TCwkdZN4t3v5iev+ZiZa5BppqDilgEVohn/GfaJXOEG9Kf3IHrhiPtbMSWBj?=
 =?us-ascii?Q?xRT6RwCEUW/ObZL5Wf9gATb9dKmId4NrMWFL1xIXMyW80AVM+fE2ozgBdP4o?=
 =?us-ascii?Q?O5wH6iU+bK9L+qz2vQaMSBlmjZMUcL9gkbAfkK8z5JBlbo4zX8HukzNTCvg8?=
 =?us-ascii?Q?xKCLkBnA45Y69nxNVbHf/phoQhsMSKpuI3ClolcnJ5S/mcylaJ190lKKgugI?=
 =?us-ascii?Q?c0zqvhCYjRhg/WKHv2VXtx0FCT3Uom6A4du0jLBFMoOVXHzS8CMutnJYwV9v?=
 =?us-ascii?Q?kBQpjqp1nv9Q4vSPIQOsIe+bAaK4XKihhoF0yeOmHiyDn1TPosol9SDCKFrj?=
 =?us-ascii?Q?q9/vlfG9X57gbdvlDIv54jWlT3yhNoAONlZz/YkTE+lUlAruevZq7ES5RXJT?=
 =?us-ascii?Q?wpEc21rKGFBuPpoKU9ZB3Se6vmCkA3O6LKDI4YII6Ofh2fYGaxNg9nMUFUYT?=
 =?us-ascii?Q?Ahqn9fp71tvVig9PpKRyCYFjC50NmvY/Veq+wiC+Kgu0nwf1iNu3bkvHeGXo?=
 =?us-ascii?Q?YR7JJDAZ3G08Etuzowo/EsKjl6DRX/hZ51kwhbIzYjYJNF2+N3PgSesolGdo?=
 =?us-ascii?Q?qPi1wYAz/o1OROov5IB/mIFkCmr/MpJJ7u/LxkBAVLDF9mAgL8OK35AZl3IU?=
 =?us-ascii?Q?i9rQuo4VSa4O6cedy33q0hvJx/gNjl5UnBvWfylD4f/Y1zZlb7k7/iYfJlOE?=
 =?us-ascii?Q?DvUWnNtW5k0ceTqzGgGG2UdYL0D0KKzDO42opGBPxMWBkzl3Gl6DYBBsnURB?=
 =?us-ascii?Q?f6aoF16i0z68IChJQ38f8/gDS5Ws96DSd80cIODGRZU1CIru4rMhZn9vbWiI?=
 =?us-ascii?Q?naSPOLCgVUVmAyA49bBjrdIFaWeGhG9Z86BdMkURXyQeup+So3v2NpLuHQ4k?=
 =?us-ascii?Q?xA0QVBuqZciUjFh60gw5zTQaF8ma9aWv3qZeIuo0vjwWfQolDuNLQymUQKsA?=
 =?us-ascii?Q?x7mFnu55RZmf/UjsN5wyQnp0XRdfib29khAu5bf6kf/nmDfmdf08avflQ+jv?=
 =?us-ascii?Q?P8Eqqh5QYm39rhO4jnGNIE0K+qkb2GDD8eUrRIqXIySg/P4i5V0/XX2Nrt5a?=
 =?us-ascii?Q?znT4qqjfPmaa8uvc8sdVLTKtNa8sPkTz5poF3DhBSvbW+uYnw7TEpyb8FIlZ?=
 =?us-ascii?Q?ajYTb9QS/UeWVzOlA7HfCSOslAHwj/gTUlyB7A8xIp2zAVbImvcWzCNi8WUM?=
 =?us-ascii?Q?C2v8cEmT5j1gxthAAHKcZJ8j3E9e+n1SPXUX/L+8/+HYxJetxoXv1v4h8SN/?=
 =?us-ascii?Q?s81ccpTwVKnVIsAJAXWVDShKkiXduwHlAWQaJ5CU15+PT5a5NGupdsLap4uc?=
 =?us-ascii?Q?0ESw4RitkqscWgwv4DsJXHyxP8J4tgEcE85uVBLdKoSADcz8vPIGhqx5+/0v?=
 =?us-ascii?Q?2glBqzddQsXukHstN3GadjmPuki4PGKhYZMFHqG1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80009d1-1029-43f3-576c-08da8ba65026
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 23:12:45.3743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAOtUMg4tXVUvq/pyenoQ9duObl1rxEo7ry2sCPg4vWpZnf6zTm6aSSupOPaLG2e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5650
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

Used to increment the refcount of the dma buf's struct file, only if the
refcount is not zero. Useful to allow the struct file's lifetime to
control the lifetime of the dmabuf while still letting the driver to keep
track of created dmabufs.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 include/linux/dma-buf.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 71731796c8c3a8..a35f1554f2fb36 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -618,6 +618,19 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags);
 struct dma_buf *dma_buf_get(int fd);
 void dma_buf_put(struct dma_buf *dmabuf);
 
+/**
+ * dma_buf_try_get - try to get a reference on a dmabuf
+ * @dmabuf - the dmabuf to get
+ *
+ * Returns true if a reference was successfully obtained. The caller must
+ * interlock with the dmabuf's release function in some way, such as RCU, to
+ * ensure that this is not called on freed memory.
+ */
+static inline bool dma_buf_try_get(struct dma_buf *dmabuf)
+{
+	return get_file_rcu(dmabuf->file);
+}
+
 struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
 					enum dma_data_direction);
 void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
-- 
2.37.2

