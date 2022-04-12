Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCCD4FE564
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7DA10E5D9;
	Tue, 12 Apr 2022 15:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D031210E5AB;
 Tue, 12 Apr 2022 15:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvinM1LG5DPY3k3lZmYcnnj3DgS9Losf51sTHbvYVss3/0yfC+g9iiOfd8J4+d3rw2H6pF1gfGQ2ZDDsOVVSEqQLzsHfYXOPpFPI/5YjO1D9yf34zPfis+8NMmcQbHl0tLpQySaatZPAl0aX7ag/z/Iw2Pep+Y9Q05x248Pph++wj+JEPSyxeF4L2+dO5QaA9lQHLygUiJVrOYKO+7BD6R+XHzaCq+6S3Mgen5Xobm04QE0KkDmMaYBeYMPn2kqzgbpHtpAurPBOCWHSPi94gUjpSrBY/FV5L3/ITkB3rgJ7eLckCG4rs1xOl3H4Ao2m9JJqZCpqmREFHOlYHzWuRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=165cxE3j48rjWOpL5YV2nUjVC6sTOAkTPUOysCsI6R8=;
 b=NsSOH95IX2s6dbkewSrit2iqRyYSEUoszhY7JyEFYAAD/bM9RmJLeHO2ujWEJREBRb4kTYU70G9KBPOMgjrEv1d4N8v9QBVhMn0xb31dnLbbt2OyJ8L6MgDB6PBn2elpv1XVMay4zbr8HzYyWJfT8r1/V3iQeHQijNRz8hsjRRDmhfr6rgmRXsKxkXyCZIcomzy0Rp/uHeDySL7nTBIlZUXhtWK1963KkQR6BnYMJw2xRdBXXAdcg7mxKZd8lu0ZQnIerW/y3CWKo7GKxgsGzWnts738tk62gu+9MNVbUD8yZdkUng1k8BT1Taj9ey7sK6Jx3ISPa+S8sMuxP5TsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=165cxE3j48rjWOpL5YV2nUjVC6sTOAkTPUOysCsI6R8=;
 b=ODi4drdEGkDDgUtjUQh5njO5TlU43Vhkp2888PKCgN0vrFncLWnIE5ipp8AxPRw9gTPvWoWDXhoeBh2pwu/0cSHTlz3Oee4/MMs5QKBo95fqk3hUBgM7PxPxnpiLb3oEeA6gShEQUGE+oaV8TmFjB8757tTVTEPyIN1ZkT2V0JtsevTu/zDJNcCnZNylf8jN/EK8oRwnoox0aMGNEGDycCcXLJT9A0NI/2HIanu9Oj9e3svyv5df0ZKn1tYG+xtyeQ3qgxJFcaKf2IpAyp9L3DN80YXTMhckZRFWkdzJvqp+Rbdm3/X0M+fCj0RSudavFbcMwIoQp6RgVvWF2PbK8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 15:53:40 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38%8]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 15:53:40 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Eric Farman <farman@linux.ibm.com>,
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
Subject: [PATCH 4/9] drm/i915/gvt: Change from vfio_group_(un)pin_pages to
 vfio_(un)pin_pages
Date: Tue, 12 Apr 2022 12:53:31 -0300
Message-Id: <4-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:208:32e::31) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccf611eb-eaf9-4544-684c-08da1c9c9c52
X-MS-TrafficTypeDiagnostic: DM6PR12MB4172:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4172795C04C3FEFF102870C4C2ED9@DM6PR12MB4172.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cwPgiEXpCI2EjuuK366lTRlwstJ/vtv/IFxDoUtcyn47qwqT3ySkHxw6uAlXAjAEqxuvt5PnNis1LWfvD98q+8H81eIS1df8HRWFmPcHihDHhapG/ZaR2SaU1AUFNOoi1fwiWbWNthzjofvbcR8XIRc2ek0IqIBVjcRKKHy3KWXZIVmqyeuXGzoNa0pG5RxcOlTZUfvtC4yPQUrYl1q8SI0tFGEYK0EhR8ZxJ2MlxnYxFAKCGZedaXgyEuu/BXi1tsXfgQc6sgdtGsuqXhSurKvApkdUm1pPGmO7gr8WFafNayGSOb/UW5A/pOqp7lUloOmzC/ZRIQMXgmEwI5jJEw7+zPpet5AkUDGG7+JTILGnUmVNfcEdkutezo83uQClQGTlPZcosUjBSN2E9nCVt6SwfTxTeCzFoTQ3jAvA7Sk1wffZ+rM2++1rDWUJ4qY7H9qBTAXPVk9OKraIRjfpJNlq9gseCVvO859Id0InDlHNTbJAWo8HAPzSRb2Bbjodesa+61PPAnhB9CPxAnSeO8nLc7nxPo5JpeBG/fqliiobyFwcvKWwYYudirs2jrI8b3ZTi3GL5GD2s2l0Qzod2zQShvaLadZjcQ5u5Kt9qqoKcUgYxJu59eP4awLeNQxGmXqy163o5YOIXL+uElkeKhxE36MLQomZNauYR2bKulssAtURKl61Z9C7Oe+d4M3Nnx7W2yZdWCoI0/PsulstJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6486002)(6506007)(6666004)(66946007)(66476007)(4326008)(66556008)(26005)(186003)(36756003)(83380400001)(8676002)(316002)(54906003)(86362001)(8936002)(6512007)(2616005)(921005)(110136005)(7416002)(5660300002)(38100700002)(2906002)(7406005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GMeC/x9yVw/fhXSWSEi7dA68O0qtD1oCAHr9dPn35+bADaSmIyKGcwb2m3hR?=
 =?us-ascii?Q?QZkL3pTPj9Q6TPt1D3oe64epyoDHvQV6s8Wq/K2g1St22QoKtqz7lvSUU5+k?=
 =?us-ascii?Q?ssHhsMAFyXeqHi6zqJZ6qTaqUC6yAJskFHFKAyfetlJyL7EqZ717UAxOHC2/?=
 =?us-ascii?Q?AOIKuHzJXuVHJUZu3Y5uivgGtY32NEp37V43rnnm0bqMKFlXs/beAgOCfypR?=
 =?us-ascii?Q?KR7lFOknl5AAi/sH0sMgNYmjKELMx91mjdZMgL6INB0LRyNkIaQw4EHfvuQh?=
 =?us-ascii?Q?1bGmP4C3pfexlz7+wBZZTZJU1tMCF503B82DFKJAh2xfPEomtJ1F2mAlzck7?=
 =?us-ascii?Q?pTufnC1V14plfE5mfNQVjbDVeymdq4Oub3PN6sEZa5eJANwDx82q5J70cBrA?=
 =?us-ascii?Q?WoM5RSDYjuAfxM1BETTX+qnoQf9vjz1B+3nOC6N23gybAoDWRJR4glZwHs+0?=
 =?us-ascii?Q?zeX3ys+zXTtCZpntaEWBWQFLNehv9hfqAsxjLQWnZKRf/lGytNl07/lKE3CF?=
 =?us-ascii?Q?7etdZlw+b8ziTfpxHrXwI9YWXta7xCZV9wAKX0B1KKFDMPC6th+CWKPyJ41M?=
 =?us-ascii?Q?S8ylCgQ5CwgO24I5Vw9ApILmoJKNm0V2aiZ91X9NgB6dHHkO4mTB+W4OegF2?=
 =?us-ascii?Q?srzAg5tKnNjEFaya+bbvtaZkXzf3Jntvo43GJa3POh5icpxCZKAVy8Od/UKI?=
 =?us-ascii?Q?onWUHJxaGtQah9CV6lak1Erm07B8TMHkXtNrHQc64l5TNejeMe73S3wK9QHU?=
 =?us-ascii?Q?YNJ/AS97U9fEl1Cu834gJTbvtxMU9IzQqvbNFr/+oSjKl387Grul5YwYKUCu?=
 =?us-ascii?Q?m6LQ6qG+esICw5WmstootDtcTm3x25zv2lyC7qXJdAubNUMk35Q1xYpzX+/X?=
 =?us-ascii?Q?5+XcRUr/f/qbbnU7XJUQRnW/XXNiPsC8BgXKBJNRjiULbVXfOrTQVKpW+I1J?=
 =?us-ascii?Q?4uhkllxaKYWsaK4NSINI6YldYQStTCp1CB80qCn3yctWLT4ijCSJSisyNT5t?=
 =?us-ascii?Q?+hASon6ck/NTprhuJj+WY3mxLQ8xRUGXfCU5JNPzc3kFjlxToBN9w6bysrvI?=
 =?us-ascii?Q?GLxqde/mVEd8MJDrltwPP9gckp/Ai61NLQ7zNg3Gll8sByYNLIH3KMh/xKuv?=
 =?us-ascii?Q?fKcJWkBzLENnpVGaNsml7tkAGCBcu8e/+e5owH0O3cFlzuwFz7SnM0QdrT8i?=
 =?us-ascii?Q?rkeuquQGI07vVgHc2bZOKKHUuZMX2RDGnjaVb/7gC6qu2tcPHEqhlORthCXk?=
 =?us-ascii?Q?qs9mKcRy3cNNzThxuXpZpZaHzCdLETqJMBGdAZU2CnLc9FfYo6KwqMIcuDhb?=
 =?us-ascii?Q?F4dnxmJdfRv/+SZlzhntm6MpQciI2cq80iiZ1kyO1rFHTaKTD2Qpk/urrJdc?=
 =?us-ascii?Q?rldMQAKIHo1TjRQlOEANrflZ4jDSuNEn6+C2g2wgsLp1dWAHhLEWSpc+i2yO?=
 =?us-ascii?Q?IyEW4P1kKVQSx6Ib/yJ9OdshF1L8GMUs/Sp2JApSM86RNtkipmD3r0dBdIPI?=
 =?us-ascii?Q?aQKP7O6vuUPtFskqc7LOAKVBNGA0COJDZBB2lejYN7vzoFIzwjr/yJk7oqgv?=
 =?us-ascii?Q?9+tqfaq4ogyDLZ642PPGjcxZwUhSt9fCcsl6wROqwve/3jvKu2uI1rPIH87d?=
 =?us-ascii?Q?OHhohFG3K5OHk/wLfS/mIiuq1x2s1BTiGfW1QAKHhxfvTMelYIB/SAGDYNS1?=
 =?us-ascii?Q?ye60JYIuCyJtILLa2REjp3cYeQe6SHxn4dcn81/DzM06eh6BnZZN2LV83LXp?=
 =?us-ascii?Q?2PSM8sG4mQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf611eb-eaf9-4544-684c-08da1c9c9c52
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 15:53:39.0249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wweErmvglIV8qm8HMFshGhrTT1lqh2fdXtJsPXMnvE7SdMGr8vXi0GST2n3WbDSV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4172
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the existing vfio_device versions of vfio_(un)pin_pages(). There is no
reason to use a group interface here, kvmgt has easy access to a
vfio_device.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index bb59d21cf898ab..df7d87409e3a9c 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -268,6 +268,7 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 {
 	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
 	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
+	struct vfio_device *vfio_dev = mdev_legacy_get_vfio_device(vdev->mdev);
 	int total_pages;
 	int npage;
 	int ret;
@@ -277,7 +278,7 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 	for (npage = 0; npage < total_pages; npage++) {
 		unsigned long cur_gfn = gfn + npage;
 
-		ret = vfio_group_unpin_pages(vdev->vfio_group, &cur_gfn, 1);
+		ret = vfio_unpin_pages(vfio_dev, &cur_gfn, 1);
 		drm_WARN_ON(&i915->drm, ret != 1);
 	}
 }
@@ -287,6 +288,7 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size, struct page **page)
 {
 	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
+	struct vfio_device *vfio_dev = mdev_legacy_get_vfio_device(vdev->mdev);
 	unsigned long base_pfn = 0;
 	int total_pages;
 	int npage;
@@ -301,8 +303,8 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long cur_gfn = gfn + npage;
 		unsigned long pfn;
 
-		ret = vfio_group_pin_pages(vdev->vfio_group, &cur_gfn, 1,
-					   IOMMU_READ | IOMMU_WRITE, &pfn);
+		ret = vfio_pin_pages(vfio_dev, &cur_gfn, 1,
+				     IOMMU_READ | IOMMU_WRITE, &pfn);
 		if (ret != 1) {
 			gvt_vgpu_err("vfio_pin_pages failed for gfn 0x%lx, ret %d\n",
 				     cur_gfn, ret);
-- 
2.35.1

