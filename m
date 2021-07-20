Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2963D0079
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D069D6E4B5;
	Tue, 20 Jul 2021 17:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DAE6E4AD;
 Tue, 20 Jul 2021 17:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmKWcVvcvNZ8X1djkvd4eVgU4j+pkIobEi390SER0sAVR7nj2jsT81SEBQhI6/wI6Xj4oO3Acmv9FXK8IDQugskaLUdKrx6UnIX+qxzr2ReNIBlZMpvB7dBE5ZIthZouZFOzLRxZWFIb0Ly6Dsv9WxpjNcyQIaUTtFT88vRtsrv6KPEPoJogvdx00EwYZvVz/L29tYekJ4ErPOcqn7rYxpdYkZHwe5pghTJA7MnOAtDhzyv6kMYdOL2OFRt7soRcFdO4wZsoNMr/TSMFGj/zS4lcAnECR+NjVw7e72waQKLycAcMaP6btXxfYPhjZeyydJZ1sxJbAQxCGVeWNNQN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Soe1koCxEVCqAD7BxIfZrOxErXa6yCaaYsp8qqxd+Mc=;
 b=YhsqOeA49fV9KwQzoDu0eokKHR2cjE7s67Z14HWjw1KlejedTYLLbUfRjFz0tI7AXQu4+hUTHssZ63jFe7zkKHAvB/zIU+ssHBbzNBNir+kn9Uj2+rybd5A4QV6XDcSK9hx+dz3ZZVeKTDsThd/dj0up6H1eo6U1fM8ukhiF3geoZ+TA/0Gb+9rpslDuK5LgVq+/qhH0cGnF6eZG5qXjCrGnWIwQxIKOmkSL2aj/GMPBlcKsvFSMsMCPKa9qBbg+WfUWl7T/3IRNtdmx1sFl+O33ZgKgOwKCgpF3efhewcUTh5L5z7owpSX5maTZEahcaQyQKJ/CVkTMm21YIMZUQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Soe1koCxEVCqAD7BxIfZrOxErXa6yCaaYsp8qqxd+Mc=;
 b=fXZGuuhMZtMsXc8BeefEykd3NlpjdXyVd+61anwXVyU7L2k6mhxBl/Web6Tex1MfwOjK7d6VBQSgwWp0waVlP6pe1es+M7CjSfp2/PcaDU/yK2FKah8nJp0MiybmmuAwVXGxD+bZD2g7Vbn3m8NZglALZhCUAlGLd/NNl7DKeMC+QorS3jQwvMmMxJkaGaMOQ9LNM/0LEyL6zw9dPSbRAOpkveqHQFW9M73EcT4iAQo5Tu0mRm36I7tHaiQZSDlagRLRr8Izy39SLrZb/w0dCI1GP1uUdHC5X4g8zqRMv4+OmBy2qDjti29q5e8Y0m6gXZ4rigfIjxP7LNkEZdotFQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 17:43:03 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:43:03 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
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
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v2 02/14] vfio/mbochs: Fix missing error unwind in
 mbochs_probe()
Date: Tue, 20 Jul 2021 14:42:48 -0300
Message-Id: <2-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR01CA0007.prod.exchangelabs.com (2603:10b6:208:71::20)
 To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR01CA0007.prod.exchangelabs.com (2603:10b6:208:71::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 17:43:02 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051Ec-3M; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b12af25a-1566-4731-abb9-08d94ba5d262
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5288370563159511620E0CD6C2E29@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: olcKR1i15x7AbkLVsk2jMXs0QIvRpi1S1tC+8HEPnjCYDJPUilKcBY9/WM5+EnEb/xHrTkYLxyikMHn6ppTyRofNNgbuqB43ugeWoKSzubFeKX9K8Bsptm4H9WTwW1z4c6iepLWjpyi3w9Iaab9h5AST04Fzugxe6aCRaXWNl8H0G5Hxd+Wq8g8o+cJpamviSicAAbcwpvt5mBMTDTxCkmgRuhvExEUw8xU6pyzp1Ny08Hv3Jwl66757hu1VpuLL/CCvvi6kS5flR6mjSlrDmHnc1g6J1q9kAcnQi8zxp3TJlpFy6nQRJwx6aeq3vqTKTwJebGOC2aAjPTWLZr9on0b8+Hovwv4A0ZfUCZbjxANLuV5V5XXnKpgNaDGLrTsswB+6vcZ1QL2chmgXmKjXI8YBDDpZKrzuZdzd8InCoDrBurMFsqejRNoRGmbxXcQS8IGLnpTf3yvzsDh6YE/YuRFBwHm9VPMh5KourdveuT0hP/2jZSHtsU0MZSt5pypJNNOdzOCKnaStVBjjiSlTtIfUqOx0Rcl+57IS9G2rH0PhvRwY3jYUCINfO3tKSwYPmFQlETm14E28ONpUGzwRUrQrI+vtfiqs2ft9nQB1cIAmtY74zcsMKqWQWdoUUD+Vsy7NNwi8IRUbJ/dEbSifwDBowT3LTLnGtLp79HPOmq0ickKqMW11Ck8pBoVUyZYnlbFSE4iyOm0RLL+CLWIAGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(6666004)(66946007)(7416002)(7406005)(86362001)(2906002)(66476007)(54906003)(38100700002)(83380400001)(8936002)(316002)(110136005)(478600001)(36756003)(66556008)(186003)(26005)(5660300002)(8676002)(921005)(9786002)(9746002)(4326008)(426003)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DnY4VjZadMC8USAKoG/JsbJOO1WccfsLYf+xersxIw1Ie6Rvbv52dfE/M2/8?=
 =?us-ascii?Q?s0haTpHS3wSNRuBbZT7JZnk7yaRHCm7L9SvyY14vObyFoNgXtUouoXS/NIAD?=
 =?us-ascii?Q?stCtB05BgvvrXhLGWnwZRtf8H0HpDTOeshUvgdvHPXUUz9hbii4Fc2uAr8Db?=
 =?us-ascii?Q?5K0RUVKDOzVqUAr3cx6Td1/5V0/c340Q7nBmsexwRUQuMb5jrtl4c4l+66P7?=
 =?us-ascii?Q?BygrVmBvQxfsNSWo1raqomNenXrISGjd+ji6t+8biC6bbgmh2KhBTl+nFCa7?=
 =?us-ascii?Q?nSbBMXtEqvTV0hUCP9o3xTGbEOvUWI+VTxJQrFLPFw3MFfiJhxIwX51S3tHb?=
 =?us-ascii?Q?VWd4cLDDGdNtkjGEE8PQy8YIZW+TgC/Do+qN+9c8RftgDysbyslu0fPMn5bF?=
 =?us-ascii?Q?8Os01iiqyZH/xIFLkz0GYYhNgQtHM9XM/bFZ1zdSf8pSPFnwjwyjvQee4uR4?=
 =?us-ascii?Q?YoNaFAuLrdhnX4M4+WSzAkoI0niQf9H68M9deFgFsR6WDq9CnSDZgr5MyWMB?=
 =?us-ascii?Q?wUXS4HIsY3ALx89IlY+tz7DQhoMwnuHFbsqIxRKL/QcmHAcY8FVOyVJMqPyM?=
 =?us-ascii?Q?Dim7KDnMcPld0nlWqUdmGb1dizrjAjy41lfm5OlJ9p354HNyFqmiKOtjdmdp?=
 =?us-ascii?Q?XkhF+fyycgYK6caoeIzARxUVF0uuXisHBrHAirsMfYJ+c+9bp7nvC9AL7khB?=
 =?us-ascii?Q?rnRFpf0Orzzbbx2xPaz/cnMM+Jl9Vjk0dMOvXIL0zG3V+7GqhE0vcPTFx7aZ?=
 =?us-ascii?Q?9orXIQglf8B6RbO2VRuw/leXlgm36SDJ9a6KY62VskQU0B1tnn1tsPNg6WE3?=
 =?us-ascii?Q?OH7qVvyAcKvUK41rhR63BTKOvsfc3C3ltYZGsvqvJJ/73393oxOT+pnYTpZV?=
 =?us-ascii?Q?o8r85jjNOZS0SCdDcIcnnefQxXiYtJ6eLRLt/zpCXbW+4/Or0H1XENHzsnF0?=
 =?us-ascii?Q?yqjHQo5s8EauMcxLAsZjSyykalV2j5tT4USQLFwDTAuyDaYKYWfUijvxluM8?=
 =?us-ascii?Q?LXg75RzNyWuh+NjhQYLw94M0xCpoTr6qrCsIInEOupK+WivWXyCdPum/Bc/S?=
 =?us-ascii?Q?HehuPqnkdNemoKXTTDVRgv3bwpoAcxSQ5UfFUTShb5SEGISq4i+ImKTEWv/r?=
 =?us-ascii?Q?XIQvpLlGjuvYT+hmf7wtG6kADWz9N+QTDkQazqxw6VvpbFlvQiYAmlJoDirD?=
 =?us-ascii?Q?XoLzPZ/1FaHhzwM+8MH3nHoN90vliD/87ndu0NN6O0jwee0r2UhLXFgB/AOW?=
 =?us-ascii?Q?g/z3Vks+kVOgPF/A4wm5Ur876tVH8uv84JCzRS8OTqRjtoricuGtyVeLLCIp?=
 =?us-ascii?Q?8GM2zCp3JQJGFchXH0SuOYJc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b12af25a-1566-4731-abb9-08d94ba5d262
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:02.3673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qhdek1nYIN4Z9bTLOrUAD5iHme5vLxAeKi1P+mbCVULEoujNcCjZ2hc20J//One7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5288
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compared to mbochs_remove() two cases are missing from the
vfio_register_group_dev() unwind. Add them in.

Fixes: 681c1615f891 ("vfio/mbochs: Convert to use vfio_register_group_dev()")
Reported-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index e81b875b4d87b4..501845b08c0974 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -553,11 +553,14 @@ static int mbochs_probe(struct mdev_device *mdev)
 
 	ret = vfio_register_group_dev(&mdev_state->vdev);
 	if (ret)
-		goto err_mem;
+		goto err_bytes;
 	dev_set_drvdata(&mdev->dev, mdev_state);
 	return 0;
 
+err_bytes:
+	mbochs_used_mbytes -= mdev_state->type->mbytes;
 err_mem:
+	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
 	kfree(mdev_state);
 	return ret;
@@ -567,8 +570,8 @@ static void mbochs_remove(struct mdev_device *mdev)
 {
 	struct mdev_state *mdev_state = dev_get_drvdata(&mdev->dev);
 
-	mbochs_used_mbytes -= mdev_state->type->mbytes;
 	vfio_unregister_group_dev(&mdev_state->vdev);
+	mbochs_used_mbytes -= mdev_state->type->mbytes;
 	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
 	kfree(mdev_state);
-- 
2.32.0

