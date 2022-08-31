Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A285A8960
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 01:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0345710E534;
	Wed, 31 Aug 2022 23:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736B610E530
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 23:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzUYhq8vIvBEgXQeQwxZrEJdEs/fGEFxrQId53TyUOg2JSLgkiKtLv/28fdhgmv2W0tUyRyaVlyeT+NWWvX8zj4VcSm6mvwK9zw9VnWlNxpUTJOXTVuuJL+lApblEnPHNBIFVW1i1F2P2HF4S06tlYVZ3t51lZ5NnCT9ExD6FzIpqmfIYxpH58Ht4FovnC9A/HmuNu8t1Kku3DKiZKeHO+cjd2rPKaXNzbzCG+jxgLBJ/TobI0y+rTDYD9MbNmftzxsSRRGCMCincQ8PdfwjkstzZ1lsHhOD6kw9ayEaKYmrlLA2q6eQROmSrXa1oTydq9eYHikw+Tyfg+iiBARdSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USMW3zpIpIRWv4YclcGaX6iF2O2lxUCWa1dx+H13kh8=;
 b=LtvKK9wpR4KMITAcfBxewMY0ULXFvY/+fSTYCSt3PiL/zGm8APTr1clCDABRqK1qRMAyhQS5dr7zr4/sEgIpRkw3jvJYSe78jzn0PgghAkFG3Tkuegoic4KdiIFJW3oHy5u+no+E+IXZLc9NEKYlA0bru+HuRrLyT0Rj/08RkPJvF8T5TlYw/RGvtz+cM7kygMZoZyRMTCuy7KEe+Pbugm2Fo+yY4h5hpi8nuJDmtqKkRGR65P2p8vYx2ETbFLCA0CEPDH1CCWraLcNEsaTK+gJcNB+OScMIKgIte+jVDzuWPhQzAHk4bNR+E7qYQOXXh1SBdqgdi/VpJFNWfgq++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USMW3zpIpIRWv4YclcGaX6iF2O2lxUCWa1dx+H13kh8=;
 b=tD/cO0iPAA0AkTNIJdHymYgkGHZHBxrrPEwn25Tc0sJ/4CLpgz+gb+SMwewCGNs3y+cRCcn2w9m3qrrS2AU/uj20UN+Ixi8W7Um3HZyW2db7DYqA61B5FS9pgWBSRg4EY3ZFw8m6GaznAs15jw+wwhd6qAXNcwN9eE2d+kdiVXt1NjpimZ/FK9ozr4DAld1esebFcTFVAPy15NII7eLnIx2WfxV6CZzkeTdLmVwQnc+FiKzWYg48gDm4WfYanmWNy2htppYBOcz4ox8gC5maedTWoLTABYcxUNB3CD8PMgTeXVhZsXtxeJWH/Ia5gyl1rJ0o/u1IDhMkpnSOlUgqDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DS0PR12MB6535.namprd12.prod.outlook.com (2603:10b6:8:c0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 23:12:45 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 23:12:45 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v2 2/4] vfio: Add vfio_device_get()
Date: Wed, 31 Aug 2022 20:12:42 -0300
Message-Id: <2-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
In-Reply-To: <0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0026.prod.exchangelabs.com (2603:10b6:208:10c::39)
 To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34e94355-e66d-4669-576c-08da8ba65026
X-MS-TrafficTypeDiagnostic: DS0PR12MB6535:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 27Dzj2n5v8TyZD79VhOwC8lDGX20+T3Q8qnDj7kOHM4J+Yx8gUU6jxe3Q8nyAcUd62ZtwSoz5J+lmHvMgJcbSVcuwqqsr417UaadqtOY9dpl/3wG1Tb+PX5Cs0ULbp+p2oWi3480p6eXcN/eo1eadGegaOMqsEI3jbIWwJYwhJLtA4GcyMl8pofoP3hnm3rznQVIv3xgOxUEM9DQ9qFBHb+u94LSUXMw//AADzi8yosJe0s619nXIznT4cOLaZH4H1MM5Jp5LJ07zUYgh+Sl1/kHvzYYpIpIe+npSOcFR+Mz7SPsh6PcBnyopmxy3TNAuOGMnEz4CdWRpADw9HYhoj2yi+70T4ftzoFwACDzOPdkOAatmKVUE8UKfXenEzXTjMRcap+wBJ7sJuVOrLy6vxftCSMFQGb2LRPteLsfpiwhgMAmW1tUdoSFwI3cKwqNbo98umxUHAGXWd0fYySpToUhtgAZPEobHobbVFkFAH5kcE0RtD2CncJy9dKOJ1R7OLahtoMFtBveVaRkXGmrxY5mqS+D3DFdRs7ItLsGs9CmDCkOzHEHR8m8NzUUfkYg6G15EVsym67aA41VGtFeKVzI7cr/3YeIpg5UYMSM5J/htJs3c5/u21wgrZI7mgxONgDKuQebc+cNbtyV2AVt+xTfRkhE04qHfaVtkcgCfU1zjipT+Txb9+mxvYx90bIrBjLNEHSmbzk2V1vC78grn7ajkBu7JNQVVTCq6MBOC0fRV8Jh1DQTUEZUiTZHTG6N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(186003)(2906002)(5660300002)(8936002)(7416002)(6506007)(2616005)(6666004)(6512007)(36756003)(6486002)(86362001)(41300700001)(26005)(478600001)(38100700002)(83380400001)(110136005)(4326008)(316002)(54906003)(66476007)(8676002)(66556008)(66946007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vhTbf7T9Z/06KQ8FWS8wG8b3FxfoeuT5pU7bERsp4/g0EYlPqmx1qYLXz/mB?=
 =?us-ascii?Q?Y4dY7hU7F4E3RPaGeduTkioqOlkwbeyeIY5e+1dmgJ5RMIIwR0sWPM1SP3zA?=
 =?us-ascii?Q?2xDsToRIGyRMI9ZR/ATEqg2OYXEUd9JnauZ8MnOfQLqdSPjnvj/HtRbF9zfZ?=
 =?us-ascii?Q?gjko6YDSBRM+kNvQNlMUy/Er/u1wj163g+Mpf6jz8Lzb1jyPCBOQzyG1qpv/?=
 =?us-ascii?Q?TTGsT1YuxRBpHkwFJ2juSNb97AZ3B4saXYuwcA/WFRpDmXfql0HhnsSv/E+R?=
 =?us-ascii?Q?Ia3svkrL3b2bjqyPjHK+wBzKR8SRTtJDl+PiVgs9cyil14oXMG6Pd9OO0klW?=
 =?us-ascii?Q?jQaQ2g/USPjaZHAyKzBdnTGFJUOD3uTJwoZPd6T6pYTownFHrxV9gW9x7By5?=
 =?us-ascii?Q?pv4Cxd0ZDE7NHPT6O4gQtA6BLx2pYU0yX1xbD1a6lAfF4nJOWOyPeAJV1XPB?=
 =?us-ascii?Q?hJv7i63BCueLdgvmFlkhnaI6zFDPGyVp2raoQNvLBCpv5NvhOKUJiFvjHLLL?=
 =?us-ascii?Q?l1WVrmMphIGgTkiEBXuqPJa3jYMp5vMSLhgRtatE0CxL4gHKb01V+g7ESI0r?=
 =?us-ascii?Q?OxVIlvV9NMeNVtf8v3Ur0UANGUWa9X9JKqObG6j13Pxmo97lZcgmcetC+FNz?=
 =?us-ascii?Q?fdUxBKyLRo2VAzzpZRm8NLSNk4doWZuHSfY9JxDKTMJraW/jGfizNLkEWKbJ?=
 =?us-ascii?Q?RMRIZAMPrcZT9SEnGqrotSuKgL3NHMPMfZ81PiM9Yh0V5LXrtQBVI5EGcOCP?=
 =?us-ascii?Q?Z6d4XT3BBw5Zodq8A4vYxV8Z8bqo+qLEOhQ38bCOvtrHsMyfHLXiM7sme2Eb?=
 =?us-ascii?Q?Yv9GDjjp1od/O6fKo0nOWitB9XAzP0kIxkwdiM5IpjnLf67hvDyFdKzQWP4O?=
 =?us-ascii?Q?Hup7kqG/mmK8IbWqFI/pXrJRddYSXfVB08LQ+tHv9fj/7uYanJJI0w3I56ts?=
 =?us-ascii?Q?MM63KBUo5NevJ6CoVsBxQBpy3QawXL25m1Xl+9fXXye9PCPNxRxacfyhCWCW?=
 =?us-ascii?Q?nzV9QqmE5ZBKyWzz0dz7ipcs5TS2Hou0HrwK9CXuZe2XruPAy647gdeWQJjf?=
 =?us-ascii?Q?qv4g8q50pkScW4+fUBw2ILqXgJd0sEJIoa0x6RDRWnlpLbcstJ80Xt1vju38?=
 =?us-ascii?Q?VZkvy8QXNa9BDL4F0x52m7tKFRxlczCcTfTfA/2O5ui17ZdypUQa2ZRDdqYG?=
 =?us-ascii?Q?WccN9bKMzD9Lla8VmEs5Fye/EIu69+Eq4dIAh96AHYRmb2VyTjHJU28vl5R5?=
 =?us-ascii?Q?Oqna0998nnpS29H6LucWgEGra2SKLbs1vhRM1Q7elOoNdpokfc6j4tei2icc?=
 =?us-ascii?Q?tKmnHXk6waBNuMx8ODi1vI1Dbc/FYV5Rt38E+yBCVGjjOVo+5RpkFnv7h6uY?=
 =?us-ascii?Q?GvyHR+7vHD1rnZaSOetwtpJNvnkqzuYbzOkSs4asMFCuEow/5TreCiOXPuFt?=
 =?us-ascii?Q?jZro437VreDS6TotrNBC+XChn0LAoGpG4Q+pCfzl2Najefo9XCcgH0VR/1/V?=
 =?us-ascii?Q?m5cmTNasA/39GT/qm3mnUoYIiijn51oRdaIYNEcge1MEVtngI1PpufrmYB/c?=
 =?us-ascii?Q?FyLZl5+VrLQIq8FVH7bx6qrnN3K4ex/bAZGousdt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e94355-e66d-4669-576c-08da8ba65026
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 23:12:45.3430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTji+BNbB01eTVRTCHNQ2dfQ4rOu5XQVUm/+WVSQKHrB0dpdEosbtuFPVhz9k49H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6535
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
index eb714a484662fc..dadbb5a7bb4c5b 100644
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

