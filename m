Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D461DC03C2D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68C310E997;
	Thu, 23 Oct 2025 23:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LLSjc4jC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012003.outbound.protection.outlook.com [52.101.48.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D7E10E994;
 Thu, 23 Oct 2025 23:09:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm+KaKaGc6EXaGVOxMTIVLZWrdEIg3Pw3FZ5ribbdHI1anGro9fawVPNejL/2D4eyi92BZrqFuBe0HoKvqaMSpE/gXLxaQIPNZXrMSCotrfokxg/yD3elOjmJ55XwAM6nyCDRMUUkX4AD5cDoJBMmwx9X2BCXVgoyeGXVadz7A2MbWCT1jiRwnansyvPkWH/EgZbn7o5+vTI/Rd5Rct6rVTaAAtM6g5wcHy9gMQppH6DFP+KhnOwn3SAOhNiYwlhEX5aqYA6mBgtgm7X1bn4NEx7rGT2T9jQSXDl6dIMd2UH50iJ0eJEmPhrqQqLj6QKOFxe5pmXuALJHfK2An3OiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GctNCzw0l0XgtYlJ26rey9gaAys5QyGA1pq6nebjP68=;
 b=iXSsXWZkkf5HB5KBT8kn9Rdr0AAl4HkbYPXyXzHeDH0LudbFwZj0niu3NJmRFv3WjLMc1gQoy/ghbjAjjYpLagDc7Eaxq0fIx1jSldiWF+uwLEB5XkTmnHXPROKuPNtgY+aeEFBbplC5KTtSlnrpjlO2Om7kgtkwMFGLviQhsVou5H+oovtfS4UoTdTkZUNl0Am9JlLe1pxXXn9ZpbgAtbIuGidpFHLzp/eklWIQ9x/k8pTM2qWFJIyYLkfOBPKdP7p5AQ5CcN7vXcEN5CA8cUown1QmZ/tz/ui+DfLVRHRrpG4EnuyQCZsvAyQ1/QBZiWpPZ1qCPvuZLbkncNvcPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GctNCzw0l0XgtYlJ26rey9gaAys5QyGA1pq6nebjP68=;
 b=LLSjc4jC8hZVeoFB8X6WiNwN1k9YenKVdVWK657uThWZGSQ5CUa5JkO9nRNXkbE3bvCuJSkOdb/75dSvzs/2kWlYDnJ2h0/z1pLrO4/8waadGq3xjOQGWgi9v74cV3MZS1DdaxdEXt6fwJvLqdLTx43kovL1DnDZUlPyZ7yiDfTReRYXheLa2LsUhPnzjfbWgFkZsE4hXAqCXqYG9nGpORUu8+kaIW0LLraqMC6fwuAtHsz7S1ezC3uXY5MiEVJtJh0DMEG9rJ/J9Vg7ltLjdV7C/xcx4+6HfXwPw+MKvXjnX57jgDHZ3DnPt4FMWic6n6W882S+ZliET6pZOXIs1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:09:50 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:50 +0000
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
Subject: [PATCH 18/22] vfio/ccw: Convert to get_region_info_caps
Date: Thu, 23 Oct 2025 20:09:32 -0300
Message-ID: <18-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:a03:333::27) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: c31b4956-30d1-4977-48cc-08de128942ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/0U15djygWa+NUu8hjLBb2WwepcvpFxfL93mgvqsO9+4+OEwaEMRYB1DkfHT?=
 =?us-ascii?Q?zzog7EHyzA2KYzTAzAr7VzXxkebQ8BbWSCl6jMaYd3Sk11FDGzda5IB8975S?=
 =?us-ascii?Q?ZERwEPaKQbi76Wo906uc782bHGSOoixE95mU0ED85s6Cm8Bwoq/W+t0XvG+O?=
 =?us-ascii?Q?9WFct1O0vUax1Ilik8pWSvc/Fox4+GIFGpOhGo0jc/6j7ahNhZtQy9hsg5ly?=
 =?us-ascii?Q?JWrVWitgHvT+cres7pe7Fx7I+niNTGfhLQpZzBAzlbve/rIpA85oTr48Ip38?=
 =?us-ascii?Q?8JJWYZTN8yW7mnvJkI1x+2MwEJvBeN6qT4/o4Bsz5SQev3/hcrant7zCIhid?=
 =?us-ascii?Q?gfjx7QE91aiFibyNiHKXc2RqBArfDMpt+yVmrOIuRtzTl8xyBYMNWWw4JBq2?=
 =?us-ascii?Q?z7v5VMcxgptZKoNbanGnrWNJP5ddyktR/0akgjXAvCrtQWrFvb2sNYhhNAP/?=
 =?us-ascii?Q?mGcnbJgVQDIUxXWyJ1TWiOeQt4eaLZyX27hrrFozTgOK3q2bdNybn6lPeutZ?=
 =?us-ascii?Q?Yi6U/kOTuaQmfYsGy1UnHjQNqFNTNXYtlIHa7YpQM3FsR2yP6ptJxsd36KnT?=
 =?us-ascii?Q?MVIidilF00tOWNFJni7WCj4hn7nVvVVRU3B8Uxjm94a58adHo8Y94NqLUb/a?=
 =?us-ascii?Q?oDvhfbCGk1aG0IBtAwsSqmVmGBwWTQsYvIc7VjHaz7BBKCInd7vjy+34MPzi?=
 =?us-ascii?Q?pwo76AVcfJwwTD4JcVlcHXPL8G0asrNJcyxRXXUx/DZOhMhfstxufjV0EEO0?=
 =?us-ascii?Q?vMgMa0wmeKqBAdhjw1eLBZgph8n62SkAAyzroiM8b3jDAVn9Pl3SAOFdShTl?=
 =?us-ascii?Q?CiLnMAlMP+7VGho1ACaJUZZ/OUH5k9h5VhvU61QV5QMl019YtqzzFrJT7+rM?=
 =?us-ascii?Q?k11RIrs5TTR9wmdWQcf34QbmzrXf64bfpCFs91b50gPHMKzqdgIiNFEgHe4I?=
 =?us-ascii?Q?o2bm8046aG36KsL8V+3cap5uon+Og5Ga7H9RLWJAFc2Bu8l3FezXRZohk8Rp?=
 =?us-ascii?Q?x9xmhAFSH9EwLKEL+UyPOkXINTQB8YRUBeOE1BuG8cioXeuh3FPIBiS0WvUm?=
 =?us-ascii?Q?Rg/qa69E4iaKXEV+sX1A+YF85O9v1AXRw5gooG0nVVrwsD+fWHmd8MnEQRs6?=
 =?us-ascii?Q?0ebvAF1de6KAuCm4lWtf9kNCqzIlHFEHk6jSWAZLEAyG9yJI0SSzK8P07oXe?=
 =?us-ascii?Q?pg015PUIfF4nph/qoi3s6E42tiJTaa38XVVB6EpNaxdC7F2TpiR4RQM1rwOY?=
 =?us-ascii?Q?ZhajQehCDNVWH/OZmYD5udqYd1jZ0q0Ymv8AwBVBqonnK3PmDa+DRvhUEjtu?=
 =?us-ascii?Q?U4tjtdedkwCeHfyscweN9wyuZSebaEhzOmJsp88Bso44Ntn9Mvh6VOdrwNvm?=
 =?us-ascii?Q?CCR2OIsotRih7X5juL2D3/Opc//lWGb3Ot0+F8BxbQbQhAIKD6oCZ8MBSSQ9?=
 =?us-ascii?Q?/Yzkn5pwXjxn+dHOjlimYbxkVpr/KnPGuMBcOiOk5COxO2UFOFu32EI+zR8J?=
 =?us-ascii?Q?e448gL3ITVIQogA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ciPkmZdkv/6C94LoSvJQJqBW2v6sSvgBAm19hVaepE+PaAfDq+qeqx2XWnuk?=
 =?us-ascii?Q?RO9jOl2k1vN5y5FhaDnKf45s7GP8T5Yr70M1zgy9U2Gwjnb+QCb5XbDGbPET?=
 =?us-ascii?Q?QoU8g4F99i3nADzunyPesjEmsFT6MqO52/BlE6ScC7jPKMG9xVh0hOktrcAf?=
 =?us-ascii?Q?JGn+UugXtw2VKsmMXI3DEi87+tfHus2HuSx8VSeMOXLI3IAsAsgk5DKwhkwl?=
 =?us-ascii?Q?9LZJObv0AcVkRLBfp33Cjs8RLaBZtqujolZjGThkcqur1oIseBTk1wqty+1R?=
 =?us-ascii?Q?QsspKgUMz/9E87j4XXg73ZDxicvJYyf3CZlbm43fQFG0Uk2ZTq758IFz0Nzd?=
 =?us-ascii?Q?fgEPPyJx/zbAgIvt0cEpsCx48LIBFOkBOZ86YMT+wJ5Nw6BQZiVr9kEvWTZE?=
 =?us-ascii?Q?3hI9/B2Lrh1KmN6pMRpis1Dp2+Kk70T6SP7qPJzHvnvBu484D4uiQIqXvT3S?=
 =?us-ascii?Q?HZzYUyCTosvqoHHMDmnsdGbQBWo4ORc9YiRJHgiScsUyDmWVsBcFtej6asrg?=
 =?us-ascii?Q?DzCgE0XDwkPiL/5ilL0tv/vWBn/5ruVAXP+xnfcWBUBO+TR8djjXhGunPZC8?=
 =?us-ascii?Q?JDJjb0OCJC7gx9KdalmuVhTTFuEd8gt3miwHJ1jfsvnyEyeXDgrbUJj6FCBe?=
 =?us-ascii?Q?oa/BjqprNPIMO/02UdKvjlXSeex2MTW+MmlhRL9NRA2kVtbaOqVi6heQeKIx?=
 =?us-ascii?Q?YyEH0F3m8SbXduRSMz1Z/R07MmWNmELDFygsjyY26sdQfrUDfSn4jnbe8naU?=
 =?us-ascii?Q?YtjRFhL4gp7wIw36Sc31yP+f5JwTE1SI741yvKlGKJJwAiq3wL47YwpSOdKy?=
 =?us-ascii?Q?c4YkJwupXm9C5tClMcaK9F3ISy40J6YxV23j1okIJznDbeRTCRA8vSihSApY?=
 =?us-ascii?Q?1l8kq4JzdQfhDeMlRvz6Gt1BDquQKCS+ApAlYmaT+zfASmwPjmt8ISErAbOE?=
 =?us-ascii?Q?ceKmJZNauAlEP0046hLiExa/uceYGZH9KRlyEmF3IDh+YW92vDmso+0IAjR7?=
 =?us-ascii?Q?EFybSIolsCcc5AUkcCGScDWhrwuTLgeegMrIzyAlKkSUu3ZhgEAMrlxz6nt3?=
 =?us-ascii?Q?yU7VIzS2tB7nP650REhwm/OQdTcNdYtWBSbn7uiIb7NEENaq/OFebqI7YpWt?=
 =?us-ascii?Q?pog2z8w6Y4ZRyj34iFbMjHnRE+C1Nm22LkbZ2XwS/Ns5Odzy+/NUUphHrza5?=
 =?us-ascii?Q?termMXKFEDd5ORZ/H/r8XhwT8xFqJvhNIkzElHwFG4q1NtDFyMFp6C2boT91?=
 =?us-ascii?Q?UhS4nIAjc24gnT0D9g+NQxy9q41HSCwX/ronI8tvetedmP0vm7zGojMf+Brt?=
 =?us-ascii?Q?lpBfJRAKRukCkDuCt4vLBomb/tKlzsJuPUmKNAkqXiQcMDwwaUksw2ycb8tt?=
 =?us-ascii?Q?RO+cWbGPEerQEnhc4aycV8zkWXUgz6MvN7GKi8A0at7/Hyh+RZG4fcSZ4a04?=
 =?us-ascii?Q?YTZ3bUF4p12ppBU3Ag8n3lQwK8OIvlySBTR01WjpVkw76gMtBQvIrXeG/LmL?=
 =?us-ascii?Q?NPoIQb5eiVyFt5yg1+4EBjX0NL3y6Uo77ZD07GsQKmt4nUzsQ4rfTxshg7oX?=
 =?us-ascii?Q?M5AjJ3CRvTAYmd6AVnk9wBnT5TzbsmvZO4ipIsRE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31b4956-30d1-4977-48cc-08de128942ba
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:47.5627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: refGbwUrJXrdZw3TP21WO3tHlpU7fGkoH2KegCASX5eR25xTfihAQvbD90ms5x7L
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

Remove the duplicate code and change info to a pointer.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_ops.c | 53 ++++-----------------------------
 1 file changed, 6 insertions(+), 47 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 6d46e0bc76df15..4f63ca3c99cdf0 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -313,10 +313,12 @@ static int vfio_ccw_mdev_get_device_info(struct vfio_ccw_private *private,
 	return 0;
 }
 
-static int vfio_ccw_mdev_get_region_info(struct vfio_ccw_private *private,
+static int vfio_ccw_mdev_get_region_info(struct vfio_device *vdev,
 					 struct vfio_region_info *info,
-					 unsigned long arg)
+					 struct vfio_info_cap *caps)
 {
+	struct vfio_ccw_private *private =
+		container_of(vdev, struct vfio_ccw_private, vdev);
 	int i;
 
 	switch (info->index) {
@@ -328,7 +330,6 @@ static int vfio_ccw_mdev_get_region_info(struct vfio_ccw_private *private,
 		return 0;
 	default: /* all other regions are handled via capability chain */
 	{
-		struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
 		struct vfio_region_info_cap_type cap_type = {
 			.header.id = VFIO_REGION_INFO_CAP_TYPE,
 			.header.version = 1 };
@@ -351,27 +352,10 @@ static int vfio_ccw_mdev_get_region_info(struct vfio_ccw_private *private,
 		cap_type.type = private->region[i].type;
 		cap_type.subtype = private->region[i].subtype;
 
-		ret = vfio_info_add_capability(&caps, &cap_type.header,
+		ret = vfio_info_add_capability(caps, &cap_type.header,
 					       sizeof(cap_type));
 		if (ret)
 			return ret;
-
-		info->flags |= VFIO_REGION_INFO_FLAG_CAPS;
-		if (info->argsz < sizeof(*info) + caps.size) {
-			info->argsz = sizeof(*info) + caps.size;
-			info->cap_offset = 0;
-		} else {
-			vfio_info_cap_shift(&caps, sizeof(*info));
-			if (copy_to_user((void __user *)arg + sizeof(*info),
-					 caps.buf, caps.size)) {
-				kfree(caps.buf);
-				return -EFAULT;
-			}
-			info->cap_offset = sizeof(*info);
-		}
-
-		kfree(caps.buf);
-
 	}
 	}
 	return 0;
@@ -504,31 +488,6 @@ void vfio_ccw_unregister_dev_regions(struct vfio_ccw_private *private)
 	private->region = NULL;
 }
 
-static int
-vfio_ccw_mdev_ioctl_get_region_info(struct vfio_device *vdev,
-				    struct vfio_region_info __user *arg)
-{
-	struct vfio_ccw_private *private =
-		container_of(vdev, struct vfio_ccw_private, vdev);
-	struct vfio_region_info info;
-	unsigned long minsz;
-	int ret;
-
-	minsz = offsetofend(struct vfio_region_info, offset);
-
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	if (info.argsz < minsz)
-		return -EINVAL;
-
-	ret = vfio_ccw_mdev_get_region_info(private, &info, arg);
-	if (ret)
-		return ret;
-
-	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
-}
-
 static ssize_t vfio_ccw_mdev_ioctl(struct vfio_device *vdev,
 				   unsigned int cmd,
 				   unsigned long arg)
@@ -634,7 +593,7 @@ static const struct vfio_device_ops vfio_ccw_dev_ops = {
 	.read = vfio_ccw_mdev_read,
 	.write = vfio_ccw_mdev_write,
 	.ioctl = vfio_ccw_mdev_ioctl,
-	.get_region_info = vfio_ccw_mdev_ioctl_get_region_info,
+	.get_region_info_caps = vfio_ccw_mdev_get_region_info,
 	.request = vfio_ccw_mdev_request,
 	.dma_unmap = vfio_ccw_dma_unmap,
 	.bind_iommufd = vfio_iommufd_emulated_bind,
-- 
2.43.0

