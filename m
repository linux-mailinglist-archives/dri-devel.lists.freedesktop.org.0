Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D530C03C78
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5655B10E9AD;
	Thu, 23 Oct 2025 23:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RkIJaT8/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E2E10E993;
 Thu, 23 Oct 2025 23:09:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUJ7YqXuHcPfQUfqRZCrodD2j63PwhHZxmncZJTgC41llsqqcBjVobcOpMXM7B65fgZELjkzhvPkiM7AVJBHvjPBUbaCkQrKN5zOC9V9mUWyFhwJePY/2VvTxweQFpJBmCtkhpZba8TarXZUzcMIGm7vGeiXRypAW82AbmpyLjzQV7GUpJPDAu0i/T/JFFcD9AauoJ3/CuMfvj7T8EZ28skNpDplYCCZuoqhIfKZ5j/hPLuEyhflhHnGihVANMTUCyx4eIDBR5yJzto37ntsGZS+zm3P72AyffjpGsD3PDoSDX0jNlgiLQxlpyoHBOeWWdqd4NMoAxSb0rXTnEJazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtU14/tm08LxomNeLKfLZ+xMMP+cO2T2iwtB89Rd7NY=;
 b=E8gChnePTJCiu1UToXdScR8iIhs9SCcHM8MFr08TJvUrTLaQjZ2IH3WaM5ic2k8wdzFJw9scGmcubT0xDgVZCAoH3vZaTviOR71MmdHhWfjYWYrYZdWiLtUOiTJDOwOxlyGvvMzRSXezhK5Ue81kAJas28jlqVehtd3lg+3kdh71F2JGjAJDaQDFfISgM3TM6fEaEkSkNCo3zZDZulkvI8Tl7luK5nInw8I3Uib340jBJY8PFkdqmep1U9R5HoUHa9C7RmSA62gqwoWq8wiLhTbiEnKePyn5UvwzytLbATm6QnFhYOEqk+UmnVGQRRS/GsEWf0VcWkAMp5PW4uB3MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtU14/tm08LxomNeLKfLZ+xMMP+cO2T2iwtB89Rd7NY=;
 b=RkIJaT8/4YmLKXI5JiaPdT6UBK6cxukFGGG9M1sB83g1P/HaBW43LoZRcd/t1gH9dAQ3gbsIrrF5ftHv/eJoacOxB1y9yL13l76yEgAyXy4akKxd4q65q1UYNlwLsm4V/pI79BZ4fDl/VAGSScyLFj8UJI2iCgjER2vtSvuWdzMRmVeOPP3BFG7C26eDaMsULMKnc3O2xwadS3C5jVmHTMvMaz2yVrvOm+MI3jctKLmZ5VERkuyTyN10q0tgkB8JKPInRIiKSJsuOjxbbCaxs5fZ9LNrqrw7grztXzW4zHldIxBgw2ofpunwPkFIF293GjkKp0cFSo62MpgOCh/IAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:09:49 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:49 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Pranjal Shrivastava <praan@google.com>,
 qat-linux@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Cc: patches@lists.linux.dev
Subject: [PATCH 15/22] vfio: Add get_region_info_caps op
Date: Thu, 23 Oct 2025 20:09:29 -0300
Message-ID: <15-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0178.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::33) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: e29e45fb-a859-44fa-5121-08de1289412f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5ulZyd5ex1I4J51vbluWPlr4CRDqRDsOFnIo+Wc/r0mbZkZoSw/LhCvkEK63?=
 =?us-ascii?Q?EuGq7CSmQPa9CRcWMpawow5bmS2p/xS/hwrdYllxLfnH0SXbC99bwWKANIS9?=
 =?us-ascii?Q?Cg5XFoesLFHDqFy+oq1sf8rNVTsP87Bpmc0sbSsxJ83Ng3vucMduBI7aYT9L?=
 =?us-ascii?Q?+IrWyZCYdz/8rcswJS9ep5a8tZnfttBGHcbobEHohfPH1nZ0BDtCy27xYk7X?=
 =?us-ascii?Q?oeOnxKzaqtaSAw405uOxlIz9cjpFFLyhfENolwxyInVGUPjdy6zrVY0nXkns?=
 =?us-ascii?Q?EawGOf2+tr3jgRVPeCBEObDtZfjufTxWm1IVE/kaWyJD3fgh4T6b1koP0e9N?=
 =?us-ascii?Q?HdvpCmstw2EX5C/HcBX3ewQ0yeNeg0d+VuFNIibBPAFDJQ2FSx47/kjt9Fdd?=
 =?us-ascii?Q?e1eBLCNUP5a4vhNdsmN3MvBGlgTGnsBfsKvlkvRXCc1z2jbIA4N66IwNMKSb?=
 =?us-ascii?Q?p5Im6pRdjUFYYR+MZfdGrKYiyjvKEUuAfvrruLIOw2OQzAh16t/ETn2bKcHZ?=
 =?us-ascii?Q?hnVw5rdyEz9DyvKeJYSMChFc6zN9fOHbYl+UWMjs5ugwzwEKhoXH4wyXFfid?=
 =?us-ascii?Q?+2cNExwVffvNzIqiEWHOnGrx7LsTNRRrkgtyLwKm4f76saHd3QvyV7nvyCSQ?=
 =?us-ascii?Q?NEpe9zmTjSGgB8z1J1Ov/nndoucyDCme3z+9cErpy/qKaQ4OY+hO2CIXCy/N?=
 =?us-ascii?Q?CdEkOyUoICoRN5tomGnmkQ0Z52KgdiWk4piYlGBybL2J20y/b6OM8qgNehIV?=
 =?us-ascii?Q?hlVFHtPyn+J4qPpHMhe2ry5gZPBUqufzMHzW5IXUCNUcJ8kUqVQtoUV4UCjF?=
 =?us-ascii?Q?gXkcd/QK13OaiZ4u5xlPzdc/H9TUInUdfYH5Y31YXXbAgYAdwewLLd6wuX8u?=
 =?us-ascii?Q?oFMdhAVt0zAzi6ldVFuAhCL1t1fi9Dcig9mJ5ej7FNXcTEVKnBCf6tMf9Dlc?=
 =?us-ascii?Q?Uniun9WSapFoNBRXiqvGTrL1sjEYbOEhWXWdQoWluCEGdko4RU7LIyB9Z8Y+?=
 =?us-ascii?Q?7h1afNKQxX7OddxwmymR4TP4yo3RS7WAqssazr7BikXFv24vm2SXtj4y7egY?=
 =?us-ascii?Q?+LltlovaGFmnBtpjE0TmldQBji0bVI6r7QDMz4bScaC0v8HVQUS+Ehr0dwWK?=
 =?us-ascii?Q?EXT9zan73/99abqfje93Lzun1Y9T3DMIV6LJ51moLLtMPZ5KyKXEW/ByhQAp?=
 =?us-ascii?Q?QnNnB1qrolYilpvx0qTOJp87v9y5jmk0aC4gavWk74Vu/Rh4890oeh3GTOaX?=
 =?us-ascii?Q?qVS95aXhK2lCSql3W6GK/QkzMDe3SrJurnyNBHZHvR7iolqtyG+5YDtPa4EU?=
 =?us-ascii?Q?KAD5xsBk+V2gLUS/CF5mh4Q5cOOtesL+uY29XsfnCMhfwfbG9JwE8Vh0/KIY?=
 =?us-ascii?Q?4iruAEdkCHYNMsk4EJqvSQ9EcteLYei+YPpKtw7iLO88N/933oOyMpQITFI3?=
 =?us-ascii?Q?iDTLYtCXnQiRsFUAJUv5GBwEoZ9QQRxaQSbSesNJ5oHoQ8AyS7Cd0jEe2nOp?=
 =?us-ascii?Q?W/cQTJhf7uJiilk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uS4sr/xe2RzIXa9tyvRKsLwvxQmxj4k3khavD2cwTARRsSZfjlbZCBx2scQi?=
 =?us-ascii?Q?xfEeb5jwYTzywsjAz+W15a54rQAVmW+iaXpGeW2iiXLokptlJlYPUgC7Bxa1?=
 =?us-ascii?Q?46tEBtoh5lECNm3dl3hrp2yd8XLS6vcVt2iFMe9gx5/B7ehSFK5Wk+ezoYWj?=
 =?us-ascii?Q?xk//T4e/Bnc4EljaFkhInCjtNWgZLe+8pIj0nU3mbJJ1vBlM3wiVbzI4Iju1?=
 =?us-ascii?Q?UkLRtmVx0cgxBsYItFIeIOXGh2LMP/loGKNeK6rWiQMvhY2FqLzgo7TqZUsd?=
 =?us-ascii?Q?JiDZJ1nBiTJD2rD3EtXF8wsvMso9Jskm17i8Ke8e/X4w4cAFmOz3WBW2YQ1z?=
 =?us-ascii?Q?7TaTnIV2XnoHxHCBDKVHmGp/+PYs+KBBivvqO22BIoNHHdYP/nE0YszrHin3?=
 =?us-ascii?Q?NBd1+z+Pxs63Wg2CLzT5jzfmYMnxXY/tWWNdwM9Rz2WghmPIAT93pLMt1/UM?=
 =?us-ascii?Q?REpfwQDNEpgxjtWFxjP1Inwa4tTo+I5QyHiO9zc0f5kDjV3n38rZbtBW8Jr9?=
 =?us-ascii?Q?aJXrkSJED2Nx6AdORu1/HFLl7QPPXI2vOzmmjKdmMoht9gSCyc3yQvInfpTx?=
 =?us-ascii?Q?6lqGk655AquGszbDRXOj+KCyHQDbXo1M6uzyggjq5nnqL1PWICFtW74zC31z?=
 =?us-ascii?Q?VVEOVLTY29AHJzly/lgHSNzrcdmEqJrPkSCFtS4MsqWksB1679CsM82RhOh/?=
 =?us-ascii?Q?Jajb5BJz1eAHXoF2fuUybaVBWuYAYGTPmOGnBEf04RgUr8S8wBKEAEbHsL+I?=
 =?us-ascii?Q?V1QnYnF4nTkK4l7eSlQJtQ90yZkzDdDIUpgeM6Tx9jIoIIvq9KLiuddbvWLi?=
 =?us-ascii?Q?VwieLW9fZ5BdRd70BPkivcE3kxJ9sHm72lCpBl9R8Go5TYb9IIc807ieo4yn?=
 =?us-ascii?Q?vaR0exnigOH5b+PEv69OEDxnXbkPWW2EwcV5vu/xHhxLXGzk4qI11wjgr6Pf?=
 =?us-ascii?Q?yAMNi4N4HnBdPtsfJgEyjRwky2FuIPS7wF/XB6XZ2nyJ916Twcse47YJKg8h?=
 =?us-ascii?Q?Pw5KIiTrtIJ0mfAFc9HVnFfoNGBDvLpP1hfH2jrY60DKVGiqe2Kt/KYdiLe9?=
 =?us-ascii?Q?P9uYPF3TmkUxoU7OWeHxfv2zwD86O9eBFcQnixUqqwcjpQB/exhW5ulX6xPv?=
 =?us-ascii?Q?g6EfwGptQ3m9R0feGBx1An019ziyBUim19gCvUANi56c1cOyvEkRXXiSywjI?=
 =?us-ascii?Q?326MSCg44mWVuP7O5gN4DjkiFQS6AHuY/2XrOa5eQ4jfZwpPuWZzjzxwc8nK?=
 =?us-ascii?Q?jjmIllgHQD8f1uMgkPOcsk4hiw3KiTe0NxG9IPfGDToOC2EPh8nqJ4uQs5u+?=
 =?us-ascii?Q?GLl1QCOUfnPJ6tse2DDZll3mJdWBHxmn1ljdZ80Yo3pAFyvKxVl0jCtHbu+p?=
 =?us-ascii?Q?BkDuSPWxA9vUaj7K3IQnINc7hosdA6o2OjV7TrVjqlYr/eW19jl/36Qxot1S?=
 =?us-ascii?Q?Tgn3ucRYr07xWiOUhcPgSVKDEN0z22rlFnYw4UW8NNCs8wZDK+fJED/Ls1My?=
 =?us-ascii?Q?uTB5zrTNW+4fKfoMXboqT0tPcfh2KTlTGTOzDY55UkhkmpwGYmtIiecugccs?=
 =?us-ascii?Q?FcGFNBW8/Uj5SM4a/0a4Vd8kBs0Whrwq1pALG2Pf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e29e45fb-a859-44fa-5121-08de1289412f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:45.0620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGzFQrnwPdIS9Vl98dLpIVSCbRxUdFHLW42SavDcvpIB+NSDj3yoBMkXb9zp8c+5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138
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

This op does the copy to/from user for the info and can return back
a cap chain through a vfio_info_cap * result.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio_main.c | 54 +++++++++++++++++++++++++++++++++++++---
 include/linux/vfio.h     |  4 +++
 2 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index f056e82ba35075..82e7d79b1f9fe2 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1259,6 +1259,55 @@ static int vfio_ioctl_device_feature(struct vfio_device *device,
 	}
 }
 
+static long vfio_get_region_info(struct vfio_device *device,
+				 struct vfio_region_info __user *arg)
+{
+	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
+	struct vfio_region_info info = {};
+	int ret;
+
+	if (copy_from_user(&info, arg, minsz))
+		return -EFAULT;
+	if (info.argsz < minsz)
+		return -EINVAL;
+
+	if (device->ops->get_region_info_caps) {
+		struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
+
+		ret = device->ops->get_region_info_caps(device, &info, &caps);
+		if (ret)
+			return ret;
+
+		if (caps.size) {
+			info.flags |= VFIO_REGION_INFO_FLAG_CAPS;
+			if (info.argsz < sizeof(info) + caps.size) {
+				info.argsz = sizeof(info) + caps.size;
+				info.cap_offset = 0;
+			} else {
+				vfio_info_cap_shift(&caps, sizeof(info));
+				if (copy_to_user(arg + 1, caps.buf,
+						 caps.size)) {
+					kfree(caps.buf);
+					return -EFAULT;
+				}
+				info.cap_offset = sizeof(info);
+			}
+			kfree(caps.buf);
+		}
+
+		if (copy_to_user(arg, &info, minsz))
+			return -EFAULT;
+	} else if (device->ops->get_region_info) {
+		ret = device->ops->get_region_info(device, arg);
+		if (ret)
+			return ret;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static long vfio_device_fops_unl_ioctl(struct file *filep,
 				       unsigned int cmd, unsigned long arg)
 {
@@ -1297,10 +1346,7 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 		break;
 
 	case VFIO_DEVICE_GET_REGION_INFO:
-		if (unlikely(!device->ops->get_region_info))
-			ret = -EINVAL;
-		else
-			ret = device->ops->get_region_info(device, uptr);
+		ret = vfio_get_region_info(device, uptr);
 		break;
 
 	default:
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index be5fcf8432e8d5..6311ddc837701d 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -21,6 +21,7 @@ struct kvm;
 struct iommufd_ctx;
 struct iommufd_device;
 struct iommufd_access;
+struct vfio_info_cap;
 
 /*
  * VFIO devices can be placed in a set, this allows all devices to share this
@@ -134,6 +135,9 @@ struct vfio_device_ops {
 			 unsigned long arg);
 	int	(*get_region_info)(struct vfio_device *vdev,
 				   struct vfio_region_info __user *arg);
+	int	(*get_region_info_caps)(struct vfio_device *vdev,
+					struct vfio_region_info *info,
+					struct vfio_info_cap *caps);
 	int	(*mmap)(struct vfio_device *vdev, struct vm_area_struct *vma);
 	void	(*request)(struct vfio_device *vdev, unsigned int count);
 	int	(*match)(struct vfio_device *vdev, char *buf);
-- 
2.43.0

