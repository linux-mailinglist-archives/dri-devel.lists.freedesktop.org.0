Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C99C41156
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C93E10EB3C;
	Fri,  7 Nov 2025 17:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K6yjlY03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010022.outbound.protection.outlook.com
 [52.101.193.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7051C10EB2F;
 Fri,  7 Nov 2025 17:41:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gM686bW+CAzmAt0gD2lq41KVwVd4wI2ideKnS7nTcV/aeI6RqGQ85S5KnC2YcrTZo+W50G/8hYDY8Mqlh2PUP85u9VDckqPmSQfMJ9SUTjuVUHCUhSC0E+lK4D9WMUTEfeJFsaul2al0zrI3aLjVfwKclSFaJynBu7dP5n0SwCMKFk5p7a3eFHF8RpkZ3GHXdW8JfHy1v9RizjhCvKuvxOKbFI0E5GqZR7v1/I/UhP/KwSt5NTdMK7goYsfil3i6OZurN5H0ExeAKWDXSxU8TDSalg6mreyPiCPYdZpHEq94bgcUJDJqS1rMcswZQmlrSrLXrWpcKPvsaoQWsU4FpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuBd9x0qf2PJ7BX5nS2Xcf+xL3jko7w0PezIzjQRIA0=;
 b=fgRKL4dveJ+ummIpcMkBRL5KceA1rZrP28bhVbIoHtCWPvnTO6YM6YiVWKHWHDqFVFGqYG7K3Q+epLNML8zytN4COT5W0OumJF3Nmg4tX3JHcP1IjMSAA/clMxsFKHEY1XPycWAqPk6ujo0qPNhJzhcNvWcSQmK+ziov0p5n34GVPe8384iqSAtOMB2S91N7eHKuWGot6kB2zI7XIkn4HclvvtiaNG9lE7tuHAfoqsONxt/SBqlYl0W98MugSLcOATS+0qoAVFYSg4fS0Hxyw924K9Mvt7NcPT1pqq92vLYbE/Z3ik3h2YnfvnZNvByBF2Pn4IwAYXlaGLQ/DDNf/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuBd9x0qf2PJ7BX5nS2Xcf+xL3jko7w0PezIzjQRIA0=;
 b=K6yjlY03rMSMFBNvKDkFFiDLgaa3fShCw6kS4BtMFm50yC2jgHAZTR1WmtIQOtsrgTQt5zAroStM8Ct49BXsh2DHGXjWOqNxMrh+f/ZCK7xAOMdYoG51GU/GxiNOcIGOElCbPGmRJpwdfrQnZPyV/llkboEzlftwwNEvuUElT8EM1/0KMlqKXCCW2udY9BIYkg6l5H2Ko5EB8LLLUJvY3O5i6YR6pUawPsKGjBOP4dgL3j9sd+w4eXAGgFrBmAtZ3L00AOscmhV4Peptsf4QRUz6SZnogCzBQFjbInrSKdhko0KdL0lrD+ccKpCvIjUYJ37EhuVCHfB4YAippW8++w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:41:43 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 17:41:43 +0000
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 virtualization@lists.linux.dev, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev,
 Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 22/22] vfio: Remove the get_region_info op
Date: Fri,  7 Nov 2025 13:41:38 -0400
Message-ID: <22-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0440.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::25) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d7b3d93-94a2-4ffe-bd8a-08de1e24e8fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p+8NSo3hhATCqamyc9VIn0SE1tgdxDsvvMFt0fTRtFBDiVgmLehU7+AOmDS+?=
 =?us-ascii?Q?Bmkoe4ep1P37fOq8+cCtV79HLVXVMdQKenqcZxIcVCYkz9Il4nOHKqXjd2Ug?=
 =?us-ascii?Q?njA1pzIzUeizgNdpJbhJjXFSLsQmb62HOioUrZUJbYiDLaOI5UNNsDxExF7F?=
 =?us-ascii?Q?lVsOCXU2nVgL0pa8HhPTBNv97SzkOdlyx0pdOqm4vwqoFrlO2E0FuK0ULVE0?=
 =?us-ascii?Q?JqmcFYFak+TXh1xpk9z5KKyZ+KGEjKDHcAQBKs9bqvsavJOQeTuSbKKhTXIS?=
 =?us-ascii?Q?qbBdXXISCH3zfHHiu6S7Jwya2gFB430VVnDFtVH1Y4BoFvy0sj4NYoZ4/zlg?=
 =?us-ascii?Q?KcvxcDCSdY7tmwcz9nj/H+B5m4eqFOcLjRXFAbZ/DKI6Jh4OyBcVFN2VP6sW?=
 =?us-ascii?Q?0aWlk1EJXZZaxnjkN0s8voetNEV3DI7Tk0AMvOiN1nYdWJEmDFy6zDLstk7S?=
 =?us-ascii?Q?allj10bt8iuRvGT373iKof0R/tWR8Ot92H/3ndArCG+7rwcuC+sGZSKGPX13?=
 =?us-ascii?Q?YJQckwHvOr23kqW4a2pZPKBanyrPiRy8weyBnYlse2RXapLlrZxfyIH1h9kz?=
 =?us-ascii?Q?d4ydp+EnWZcQDimvnbhpox3Kg2GcGlusNutiglO6zPKsKle9CndnuF3FZ1j8?=
 =?us-ascii?Q?p7Pqp6flA4Zg9h1kHF6WKVO4+5lhTxzq+wzvXo2R7C8nPC+rzpKmrgstbmbA?=
 =?us-ascii?Q?gKUryfG4oxnmTYkJHynVxDPXaiekvIJoeWnZd3DswHug+tq8AEGadWdRAiYl?=
 =?us-ascii?Q?AD4XMBJgdex1s9VLJmStkPwd5DhnvKPza6vnTacMM+FDqCO8/2KkA1TawECy?=
 =?us-ascii?Q?bqgjsZ8mmqHzzZqdw763oXdz2o+rvKmATLWn8xsezCOVE77ivjAHB12FPH7V?=
 =?us-ascii?Q?4NlzrfX/wkdq+klUkVlNbMjzHpgIVe9xqiQtLNdPU5XClkmmo0VIOryE6VPW?=
 =?us-ascii?Q?WkLyJRcwFKAKeblxTk+BgZkBanbzwCc0S57VmqiKFqKjMCUsqtfF1CFK4spP?=
 =?us-ascii?Q?ezBe84K6UTyz90RbwGdxUS60fhjcVm9JHZsnhMWplKRckvwsCQ2r0sTgvI2t?=
 =?us-ascii?Q?PipbBxFjrFILo/jt0rzQyAf5mc3gWRb6J09O1mZWTvqQdOX22B8XTHYOjpsz?=
 =?us-ascii?Q?VYTuPtvvzLfFsovp3XR1eJ9Tmthz2/bMLRztT4prT9p5Mu9AZpsBSqiY3d3C?=
 =?us-ascii?Q?zdBNyzKb2KoC2rV/QNRVBIArBsSWmbqUfmvPpDcV4sTYieBT7AKM8cY9aqcJ?=
 =?us-ascii?Q?Az3/wKEVl+hvwQtq6X8CwIQ6EjFC7daFkhR99Dq+3Vz2WHMW5s3pYN4S7K26?=
 =?us-ascii?Q?lkOAnyKipCd0gleudSps8R5LYGcGzbdvV89+RW08tQtwSAcisEMIu5R3YlP/?=
 =?us-ascii?Q?9kFqVdS6GpKCLKtxIKeRdxjMxR6LTcXHfeds77ruTVhh+bklZlbDqpaE3mdk?=
 =?us-ascii?Q?dinExiLyiiCYdcpplv8t9nG2m7B9CUdHm6Q6+IdOX5k+JucbIBRoNIxUaB6i?=
 =?us-ascii?Q?0efxHCp9llsrY+Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kofqtCNXbi+1VZgKMs2WF6Ogk6JkHCz5qd6FENLfQ37jmaodBILvShd7o3XA?=
 =?us-ascii?Q?wuTpfjlWFJrsEsg07VoN/0/w0d20BO3h3Mt6zxW1nwEbFjKfDPyfP3D3wwEY?=
 =?us-ascii?Q?wuY9YyJX/3EKl5sExQ8scSGQquWG3gpkygrPEFFjDv4gRUDrgT2jW6cFFmAQ?=
 =?us-ascii?Q?35LrsVkLPNpplf299KxmbTwOkHuqd81IVmmnU6mU5uaaCm8khgs3Pn4bs+nv?=
 =?us-ascii?Q?1A7RpjENayG7kk4ee2uZ9nB5mwyaR2YGJ805hubAJe2XSX4QNroE15ETpF6c?=
 =?us-ascii?Q?/9ZqB3/umitFvx7pq1b07uVZwh664Rz/FFTwhYbG5iVLifhLi45v3FSzTCln?=
 =?us-ascii?Q?N0EgVj2/SH23peXMEraIk7BQUnN0w7P0v9KiCKq+cwiPOL29nNrFqaQiqH99?=
 =?us-ascii?Q?8cLZA2LNSryMrGxCujgyNrTBORDb8OQYki+DRvEHWzpG2KKMtyb3tx60YeZU?=
 =?us-ascii?Q?ItqnVFvkcLKM/kfl4SsQQuy0Dwldtwv9nTAqfMRmg09JIMb/esokWyuXXZ8i?=
 =?us-ascii?Q?BKytv6ddAP/ZOAjCtXIZH3orDon5J2Px3WR0XBFBUi2BoFUmVsmiiYRY3z4/?=
 =?us-ascii?Q?oV6wz6ufzsac//MYdXHvpxg7RVg98GX+q0XrlaHSD32/zK/fc+M6Il3YvgdF?=
 =?us-ascii?Q?9dh/XhgXDAJywbFZW9sJKsc6tlmQUZqHVakzDoocwPAMG2idrCgyyNcfeBjW?=
 =?us-ascii?Q?lOdaMCoo3/8mwox3mL/DDeNP8GcBUAa0seDy0TOAMymSOPGPombZAxLu78y1?=
 =?us-ascii?Q?yoE0i07rd4ZlorJCsecWrLAsaCv2waNrp2qFlAKw1NHq90jn1AHNGOBzB5Hi?=
 =?us-ascii?Q?ap2M+a4A+FNhl6vS9JnXlSHZ3JZQZEtK8GOoPqmqBmC1kLegkYwtGyVivLbL?=
 =?us-ascii?Q?14GYJpPStYsP43qLKV7QcCUu65oF/ZPrmsLP1wMeT7pS/S/nZCLTojw3gJyt?=
 =?us-ascii?Q?Wc22iQzzSEyoVG8vM7aDGVWmuONXKDkYtO/xXHUdUrQLvbppePWQ5FvwBhv1?=
 =?us-ascii?Q?wm8f7ylr9JmC3R7dY/xxbBoNh6AN3LDwJG7T5wc/7gbNvCL5JCpR/t4CuPUe?=
 =?us-ascii?Q?R3RhNZ3wDzPO+dfGTl6ntYIvr4Im3uJ7ebIOv86QpQm88Qrm6zFTK3VzG6Z9?=
 =?us-ascii?Q?VzSA+/dDg/hp3qYUAm9KWlb2uJ2DFoP7PpiXdklxYPX5N9UsGcIHUlpxPJOO?=
 =?us-ascii?Q?JM2ubay0MaeHUefJjZfDT05yHAcVrNWBsY49RjQ7ql1J/jqm8h/nyG+dOw/H?=
 =?us-ascii?Q?hcpnQh+eS7PrWQrv8NqCwKS0WJvRT3uW7EChTiIDqrgVacvhkTIuPm3NSuBD?=
 =?us-ascii?Q?zmoXMN2kX94dLP69+lc8JW2JnM07SWn6SqA7hFKozC5akxhwONEgtNwKYmFu?=
 =?us-ascii?Q?X/DwsSMfxJebC6rIu5exD5r+BbCvFbX0WviUfuwbct9CfebXtGjgzYgRb2Xq?=
 =?us-ascii?Q?GEo0YeVoEiJ/H98sBkVuG3PZ7XBf7bpcYu7MNXEybPqEqtgzbsKnNlxTwkTf?=
 =?us-ascii?Q?o8UlYqevB3up9itBlTODgC2gYnCHJZslBzhikudVYmwQmsQYCJ1FEfEv2dSF?=
 =?us-ascii?Q?Noo2i+L+96ZVd7VzctU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7b3d93-94a2-4ffe-bd8a-08de1e24e8fe
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:41.1801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NB9l78k2jt89riKgXEgw8xAh0BUXIG+Ng5Pl8q1nKxxkTxdOEwN/sWi8IYNrYIOv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8826
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

No driver uses it now, all are using get_region_info_caps().

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio_main.c | 48 ++++++++++++++++++----------------------
 include/linux/vfio.h     |  2 --
 2 files changed, 21 insertions(+), 29 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 48d034aede46fc..b8fe1a75e48a0b 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1267,42 +1267,36 @@ static long vfio_get_region_info(struct vfio_device *device,
 	struct vfio_info_cap caps = {};
 	int ret;
 
+	if (unlikely(!device->ops->get_region_info_caps))
+		return -EINVAL;
+
 	if (copy_from_user(&info, arg, minsz))
 		return -EFAULT;
 	if (info.argsz < minsz)
 		return -EINVAL;
 
-	if (device->ops->get_region_info_caps) {
-		ret = device->ops->get_region_info_caps(device, &info, &caps);
-		if (ret)
-			goto out_free;
+	ret = device->ops->get_region_info_caps(device, &info, &caps);
+	if (ret)
+		goto out_free;
 
-		if (caps.size) {
-			info.flags |= VFIO_REGION_INFO_FLAG_CAPS;
-			if (info.argsz < sizeof(info) + caps.size) {
-				info.argsz = sizeof(info) + caps.size;
-				info.cap_offset = 0;
-			} else {
-				vfio_info_cap_shift(&caps, sizeof(info));
-				if (copy_to_user(arg + 1, caps.buf,
-						 caps.size)) {
-					ret = -EFAULT;
-					goto out_free;
-				}
-				info.cap_offset = sizeof(info);
+	if (caps.size) {
+		info.flags |= VFIO_REGION_INFO_FLAG_CAPS;
+		if (info.argsz < sizeof(info) + caps.size) {
+			info.argsz = sizeof(info) + caps.size;
+			info.cap_offset = 0;
+		} else {
+			vfio_info_cap_shift(&caps, sizeof(info));
+			if (copy_to_user(arg + 1, caps.buf, caps.size)) {
+				ret = -EFAULT;
+				goto out_free;
 			}
+			info.cap_offset = sizeof(info);
 		}
+	}
 
-		if (copy_to_user(arg, &info, minsz)) {
-			ret = -EFAULT;
-			goto out_free;
-		}
-	} else if (device->ops->get_region_info) {
-		ret = device->ops->get_region_info(device, arg);
-		if (ret)
-			return ret;
-	} else {
-		return -EINVAL;
+	if (copy_to_user(arg, &info, minsz)){
+		ret = -EFAULT;
+		goto out_free;
 	}
 
 out_free:
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 6311ddc837701d..8e1ddb48b9b54e 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -133,8 +133,6 @@ struct vfio_device_ops {
 			 size_t count, loff_t *size);
 	long	(*ioctl)(struct vfio_device *vdev, unsigned int cmd,
 			 unsigned long arg);
-	int	(*get_region_info)(struct vfio_device *vdev,
-				   struct vfio_region_info __user *arg);
 	int	(*get_region_info_caps)(struct vfio_device *vdev,
 					struct vfio_region_info *info,
 					struct vfio_info_cap *caps);
-- 
2.43.0

