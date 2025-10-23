Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E92DC03BF6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3180910E983;
	Thu, 23 Oct 2025 23:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qUHKzGhp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012011.outbound.protection.outlook.com
 [40.93.195.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FD210E97F;
 Thu, 23 Oct 2025 23:09:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBdhnOMAMvH64M8ZKM/3ByjFJ5XXBp9mbFkqBvRsrvsjwbJHgKz65DUcmvoXrxN8K/SDhEDNncbwn9xogdok0BRRtDvBCCXGSdGR50eks3qV6h9RjEsGdKMhQxaQO+NACqSscZfJ3Em9apeSjh4GxtRD/73S8YdYmxULO2xfYsYbZw8Y0xGzntC+q0EeLllseZtcTjjNUKrn7rYXd9gTHFYeR4jyiD0hgkerMndWgwB5ZKFWSH7xuI/EGd1YCxrAEpT/0+FRebwScE89oQAAlY8Yy7on99oA/t1Jekrnxsrdc3RHsZwqUxWAlIy1yi59WwHwyNyoDExS7dYrwJcLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iViAo9wQSzlqc7SdoLa20e/ExoCb75sZ3Anxv1LflPI=;
 b=dpd8mDB0Q+DQC76cr4OqpZ0dGsddhrGrtAK9otDKWEKbuS0nplvGfY3l30skXJUe5/0tohz1ZmnNbjvSN76rJWuGfU4vy7RYqKxHku6cxy2kzlUJfBmNrwerbb1vp52S9WAhfTr+gmJHSkLjV/gIy6QhtGP4Kht5yd2ymNJuK533mXF6pfWyzAK2RmKeLMQgzMgTO+FIgB4EZhQsHGqJmx2/AIHUqCY3ZNrJSa8ar1v8GWDLhyE8xnwSBoxEl80pUsIOBkSnbeTc/638PzBewYnNf6iYaVcxdhpkTUL7MOm6HrZ2mlN7qBW3dpLG/OSbQDZovKfwYOWTtktiN0BBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iViAo9wQSzlqc7SdoLa20e/ExoCb75sZ3Anxv1LflPI=;
 b=qUHKzGhpfQTuYxjOEpE7OgysEaMppBcC7FmUvq68jj3NKwDQgEjzigCPs5fSu/F2NBtP2CGyHeGSzzPRbIxife+EBfBXeZy918MpytE666G5GPnEpISvJ3gJkRDZfrkBCCF5GhVgl10tVw8GZT3Fx2Bhh6y2aCppVqChIUbRocsxpZ18+reEeo/K9YyxvACr/Tn5iWkFRJvJg9Fj9yFr6IJK0M1ZrnNOiCh9jba1XDiwfYUFEu5Hjqa6KVZYGcVZr2MaJPgc13u70FvwUh7pPkxlTvuyrtIJlT8GJYbos/QgYoN6LCnzr/9NyRHVdI8qSpq7Wtui/0hWL/Qc2e/LEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:09:41 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:41 +0000
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
Subject: [PATCH 07/22] vfio/mdpy: Provide a get_region_info op
Date: Thu, 23 Oct 2025 20:09:21 -0300
Message-ID: <7-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0144.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::29) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d7567a0-0036-4111-a5b1-08de12893dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eWwMymNUdd0bvnE2WGYVsjLV4n2zcJijHsv9a+b5oOR0bny3Ur6JTE5JSJuV?=
 =?us-ascii?Q?9wCUgVSRB4a4LD62ic5YDy6ozo1b43Ne5gwdDJd3SqnZGjov5S2wvdYoRc2i?=
 =?us-ascii?Q?x709X31r7g4NSvX+YYfDll1K7zeomjvQG2LWPEwV7tYY0kzeNY0hIj4QY+hg?=
 =?us-ascii?Q?XWXqer+5N6I1y+F6UDWXPYZSlflIxLEkqMFbumJENGAG8Q8wNUW/NYme9yrl?=
 =?us-ascii?Q?u6EH+jzGV53yot5bDIx6Cwu/FJHhlAaUy44zkebjq9sjamvThfavjVQGDbFs?=
 =?us-ascii?Q?fLJvPvOkMfmB62gPGBOLvpKzAWxhJq19VJxYNj6MYRjPNUB0ZMwZriMs9yfS?=
 =?us-ascii?Q?rvjyF3HIbMqB/jh77xYd5HlH556R6XJkyQPSPACK6lRkViTH9nKIO1dY82gz?=
 =?us-ascii?Q?0MEcs6qWB1+TluTG5Cbr6g1LdAPEh1DBLyK0DDgGPr/HS5udxOEUrX689tAr?=
 =?us-ascii?Q?4UhkeYABiqCWu012fhw/16N2GpGtMx+rIjymglk6HHzWEW6QZ5A+AGFnkK/Y?=
 =?us-ascii?Q?MV5kDZdSgZbMvE+Eqld2/HsgbrtqxRonUy3lD1w4eH3u1IcKCuTUOP1QiJvd?=
 =?us-ascii?Q?1vaCo1bnwlL7gAXqGNMWREG6yaipHBAU9X+14MCR4Id5YtrVIqHO6hYpwiC9?=
 =?us-ascii?Q?KB7p95Mm5oZwNOPYEEzk/dUMQTUdRFqhPWZNLs1YTJlmCyaxOk4tcjQGuG2d?=
 =?us-ascii?Q?zuplTjBRkYq0KZFwX6uOuuiKCvQKgJ/l2ybn2vtVV3wMWGNeaRadYfsBBtr+?=
 =?us-ascii?Q?T/wHxp2/PGMuU2uWv8TVwcxHXuow4Wk1JoWgdHO2pkXRnyaV4f2utlslO+t1?=
 =?us-ascii?Q?XoNo6BHnL0Fbu5Wlb/uehwRMfVfLudpbDjNKweAYsp+k8Q6opnZl/CJ/VKZm?=
 =?us-ascii?Q?oGaM7eyeCREZjkvJENwKnlVpnDaTcFI9urKoRJu49FrjnKZx0wXEPTlEOnN/?=
 =?us-ascii?Q?RM+DKY23iUw2HHBPFxp3LXyXIa5ar56o0YdpfEjF+Aq+/g3dzqzg0G57FmcA?=
 =?us-ascii?Q?Mg3kjuCjPcFjImbRzo8XbNJQeSfs1lOuonGNIQ7KKdnuYh4+eGGjnqBgLF5R?=
 =?us-ascii?Q?s0tEcwptTERapYISSyHw8dDDX5B14fSw9hxldhieuQA4fuTms5ibjBezEOis?=
 =?us-ascii?Q?hMic9lxdoK6dOKAbjRxas9E3eoVY2VjGkEv3eLj8ewmf8v0r33rCM42NtkWc?=
 =?us-ascii?Q?CkTl+J8mfGhbDOzfQIUYVD3vzOFEebjeqoXphDsrTzyFLp5eSiXf81L/+ihb?=
 =?us-ascii?Q?cJqJQUGX2w+BodW2c65w6irtdbLXueBeC5y35dFsJRg8KrzaGwQDaX/DIsu4?=
 =?us-ascii?Q?sRbWvPXl3ZWyI8kZcckOwl0o1LeMjfETnb44ui5QV6kEyQfo3GkMzh9fyBCr?=
 =?us-ascii?Q?uwwEvLw0Hbf6CzqV2LCgGO/+SwF6U2k9688BTHx4txJJcmCcQ3GMTf/St5nP?=
 =?us-ascii?Q?Dbln5uQlwyA1er11hmhk84Fy89vJa07brS+2xt1XOS99zlMPqA65ZqomXLZQ?=
 =?us-ascii?Q?ywu0n03bffvwZpo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BfbbVtswwcBdtkQ98hpD85cl8/hZocDuc4ON8eMR1Ul4vEqCRD+zKQMU6sLq?=
 =?us-ascii?Q?upcmwa5ZPEjagRN+PVVP4/tcXBTvlagfcekG/Ir2/VcXG/9WfRRJMX5Ek1h4?=
 =?us-ascii?Q?Bwtb7x3O0zHYz9MEdY4kXgaaKPAg1V+gaQ7DMJoxDGjxY3cp21OrZrU1UEiP?=
 =?us-ascii?Q?9yT6PmQp9R7hoVkxvT9OEXwSO2cM1oOUCeDTGtQB8UYmkHulLZ7ZTK99vcgN?=
 =?us-ascii?Q?V+sjiW6ej2eS9Gk22l01OUipe74T56fdMpzOHeicyEmnxSJdhjdzaTNMGGx/?=
 =?us-ascii?Q?eHPovAN55GgEPgQXOe+pOdFcawJawjDfo8wGIqJTCi7gektdQ5i8PoD+KKtr?=
 =?us-ascii?Q?sqLYquiYDzXYGeB8yVm3RayHKSbYvlUu0OyMhuOH9X6HzxHWFvl7k5MZECji?=
 =?us-ascii?Q?4WLnq95UfEsq5iSFII14ZSuBrmH373AK4CT1WG/1bqter66Z9nRpxGBA36/n?=
 =?us-ascii?Q?/oOGiJojYlYMoXZKsYlUp80nRM4XmicYagQ/nXCJIitO1qZAjb57wO7pSnnw?=
 =?us-ascii?Q?8a2oEl/l9ZibDtiO9ycNTypPzbbX/klF3k4Yv6GLDZGy+9HzeXE0HFA7oO6K?=
 =?us-ascii?Q?lIIiWVW9RYhgVK6ywtS+dTWWI7so2To3Y7OKTynHWp6rEVsSNVJIT8A1fQ8I?=
 =?us-ascii?Q?qGi9I6kTw8GrWBJ9Ynos/Q72VTqxzLx5hm/8g8xq6rPibUqqH08wg9d2TQpT?=
 =?us-ascii?Q?1bBIQiK1Hq0ymXdusP6kR3JyUFQ3wRQw72Q5wWEO4ycZEvGzPjTF+hnSzlxR?=
 =?us-ascii?Q?Xc1YtmzQDaHMedeotAck3nbenOQ86YV84AgTXsW79P+gWVyUZr5R9sfsptbL?=
 =?us-ascii?Q?aTgWeMEhQhFrm8r3nJGznpPFLOjrWBmYv31g62ORUBBULtHg8O30lKvqPyOs?=
 =?us-ascii?Q?5jUgI7Y6dgjmcSSsvqlw0qAL0QPWSirZfVPF27r8rvyHbk0rb2vejQ4To60e?=
 =?us-ascii?Q?FW/SdBILnSnENb9hDrkce1nGJm8IR6wcYTVGaxNX0nZKqLMe4G4oseRsWzpL?=
 =?us-ascii?Q?QVI8M1BubtJ7QrHZmXuA1+cd6+JLfbLO6m41ucaR8NFZs3WmhGSKok9krSIL?=
 =?us-ascii?Q?PHnPGXqljlbXI+jhuf/shT30em9NQnWxbJmWScUHH+26oH5GDbseNdi2HYxY?=
 =?us-ascii?Q?NZuanfMvvRYuhu9pu26vAWorO6VxjgOrKI0Ohp8LKrEeW0s1pOJfc5UDz9x/?=
 =?us-ascii?Q?0JB+Ue8n4I/x/1HI7/pnhljBMEbOL7bDBvNwN0p53VUlI4CdwP69n7LEzsUI?=
 =?us-ascii?Q?33+xdvWDlkcZCJAJ1r4AOWXw5mpKSP6xF1zAnsmOCsIFcoXJz2TP/XRcSRvC?=
 =?us-ascii?Q?WilfW6q3idztmxqXa7x1Hp6nY/HoZZ3Iti1ogfquPMyKSUATIn2tned01Bk6?=
 =?us-ascii?Q?kCsEl5pI4dmRgFT9UtInPQXiNoJ5Q7SXx0szujtws1uy5KWmKQReqj3zD3IV?=
 =?us-ascii?Q?637PiVnjimv6s25JWyv5D1bAlyQmaLGhjAvhLHWMFf45h0YlKJ/ilkvkZ3Rm?=
 =?us-ascii?Q?HJV8PTFUWBXo7FyVh57mRboxzFSotv+oS/Rvk4mwr2oiQl8rsrYXjv94L5dP?=
 =?us-ascii?Q?TVa3k5leAWcC0NCT38So+q3Q2iwaFIT6zvTdwNfQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7567a0-0036-4111-a5b1-08de12893dfd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:40.0155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbdca/gtmBdGE2WXZHPyE66JS7hWwP8rFrE9E3d4XKH6zJg0OaYSdXYLXOfGjoQb
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

Move it out of mdpy_ioctl() and re-indent it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mdpy.c | 53 ++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 8104831ae125be..0c65ed22173862 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -512,6 +512,34 @@ static int mdpy_query_gfx_plane(struct mdev_state *mdev_state,
 	return 0;
 }
 
+static int mdpy_ioctl_get_region_info(struct vfio_device *vdev,
+				      struct vfio_region_info __user *arg)
+{
+	struct mdev_state *mdev_state =
+		container_of(vdev, struct mdev_state, vdev);
+	struct vfio_region_info info;
+	void *cap_type = NULL;
+	u16 cap_type_id = 0;
+	unsigned long minsz;
+	int ret;
+
+	minsz = offsetofend(struct vfio_region_info, offset);
+
+	if (copy_from_user(&info, arg, minsz))
+		return -EFAULT;
+
+	if (info.argsz < minsz)
+		return -EINVAL;
+
+	ret = mdpy_get_region_info(mdev_state, &info, &cap_type_id, &cap_type);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(arg, &info, minsz))
+		return -EFAULT;
+	return 0;
+}
+
 static long mdpy_ioctl(struct vfio_device *vdev, unsigned int cmd,
 		       unsigned long arg)
 {
@@ -544,30 +572,6 @@ static long mdpy_ioctl(struct vfio_device *vdev, unsigned int cmd,
 
 		return 0;
 	}
-	case VFIO_DEVICE_GET_REGION_INFO:
-	{
-		struct vfio_region_info info;
-		u16 cap_type_id = 0;
-		void *cap_type = NULL;
-
-		minsz = offsetofend(struct vfio_region_info, offset);
-
-		if (copy_from_user(&info, (void __user *)arg, minsz))
-			return -EFAULT;
-
-		if (info.argsz < minsz)
-			return -EINVAL;
-
-		ret = mdpy_get_region_info(mdev_state, &info, &cap_type_id,
-					   &cap_type);
-		if (ret)
-			return ret;
-
-		if (copy_to_user((void __user *)arg, &info, minsz))
-			return -EFAULT;
-
-		return 0;
-	}
 
 	case VFIO_DEVICE_GET_IRQ_INFO:
 	{
@@ -665,6 +669,7 @@ static const struct vfio_device_ops mdpy_dev_ops = {
 	.read = mdpy_read,
 	.write = mdpy_write,
 	.ioctl = mdpy_ioctl,
+	.get_region_info = mdpy_ioctl_get_region_info,
 	.mmap = mdpy_mmap,
 	.bind_iommufd	= vfio_iommufd_emulated_bind,
 	.unbind_iommufd	= vfio_iommufd_emulated_unbind,
-- 
2.43.0

