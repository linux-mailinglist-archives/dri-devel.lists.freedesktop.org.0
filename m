Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1153E20DD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3486E8F4;
	Fri,  6 Aug 2021 01:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0FC6E907;
 Fri,  6 Aug 2021 01:19:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KP0e4ycrtIMQzvTRQ+DiRY6cM3JQaMh2w2tcHsH3s9JlBTsfVx1TELh4V8ubZGrUAobKOtV0qtCyuJjPpKhPNVoHARqhjyQcuth5eLXkzyFC73SP8sFsypnSfl2BWsnESDmrNm8bihxmoweGZzH8XnkVnWD0LNVTWbexzHVNSFejUYVu1KkDLmVLVdTjp8KoK4sYCD4K/3JpHv8ed+z/XiSRHy6gRC7ycgdT3tXUyEAet6VeuezRg9S98mHJnwEad8tVX4Vz4UdjtNOFH1Ao6gsxg7vb3IJp5r80Oehw1CmUtxmYN/N1eQyjPQZ3t2zytpuEhlhelyvUSolTwhsDKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlYQei9PjZVAxIIAS9TJlic633GMdyd6/JiBFSiKLHI=;
 b=K3I373h4IwHNkeJ3VY1kUG7oKOHMAjEg9N3wolFp2lGp++w+kFd9InD+sF8cgt8RhWWt5JOmBYt00BKGHYeBnz8rw16cSQw4xaKRID+7uXsy/eu2LxGSzrJRbQTRpyNYAg7D9cKVSqjHrrQ7h2GUoa7Jh/KH5kRk/8apjlVedFx1zxpvHOjMs+ZRbfKQ8BwjA7nw8hyyfaFIa5/ftVswf/thoCfxkymFxMtqPY1M4tJtNgiZY4L1QGYTnpHE96QYzX84s6zrHozD/6BgKwM7Phq24SafUgwFvRuQdaOAPtqGWUjtkb5HTlMCEK1zfHdAdRfZ27zQK62E2m+gzKNx9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlYQei9PjZVAxIIAS9TJlic633GMdyd6/JiBFSiKLHI=;
 b=oh1CDygZ1dCBMtxdabY60GeYqJqkC+7eJi3t7suemhvTekn48r0xCsy5X0def1kM5BrxqC/rswH0TT7wzjqb5FTGyZ9OwEtbfqSmSYAWasjK1d/OzFxQO2E3kmeQ2erMPadbuNCGD//0Fmp3XAqlF6ZhjpUfKO5Iv9iwGKYoB/lHJEGWPYnlOyt/yZ6ZUF0t+6hF2rQlmo4lvnKYr4u5+XpfM0Pihe5H73h5gzvFphv1t7rAqOf9VL1E6/n0y+rJtUknHp5HOm1qDSyJeFLR0dBxwVRwNwFa8eyTJkFWSkScfmiA4MLqleeZNYgBk4WyskNnhChkIvznmxlmhef+Ow==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5206.namprd12.prod.outlook.com (2603:10b6:208:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 01:19:14 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 01:19:14 +0000
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
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [PATCH v4 05/14] vfio/samples: Delete useless open/close
Date: Thu,  5 Aug 2021 22:19:01 -0300
Message-Id: <5-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:208:256::18) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0013.namprd13.prod.outlook.com (2603:10b6:208:256::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.12 via Frontend
 Transport; Fri, 6 Aug 2021 01:19:13 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVz-00Dt77-48; Thu, 05 Aug 2021 22:19:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fbef0a9-25ec-4a32-43b4-08d95878335e
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5206F303C1FFD694B25D75D0C2F39@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:191;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7On0xkhp+zeBh9SDIkU18BhC9aMM/03LCriEm975BSjSv1J8CyBSoSAaS+zMEQ/ViUgsVMG+gGsiFKu5vccD+i5mZuDsA+gwXFcxGLoQKhnz7GxxmURpPMhMlnT/edwiOpPBHGmUMh62kc1axrulCq9hQ2EpW+Yo/2D9Gy6mDArC18rd5VR8Z/nJqWJaZjX0JJLoP/ETMgSWNOTxTesu1PX8ELuaUOT/aJX1opGWUEB6k9wu8NLGgXHDWhRaKjwAyG0dVawqquxVW1s9QID+oANnwso4glt4TIsmIYmtB8j5jFhbi3wvvGvz4MQfgYdWKN8OQbQdy63Cb8Bu5m4QjyqaJtytLjsJ4zzes+vl5PAGU61FaUPQnYsj3xPtJcE6Uw85CPL1GmfeNSxleipIK5n6G6hUvSNKJJ1Q9kFKZb7PPeCynR84rBEVrWTrbMhjgCo0mokYeegxhXoNbQxqJdZttGH7IdKNoY/0esbWtd87+8qFB645vJN6Lw+Qilx+a6MZYfpfcscm2tdh81CY4cA/E2ikmCnKjhdM0p/MUsNDz1r2OJJGzAk/HoPpjr7s3OYAcqMs2Ua+XqEf3ZDE0AkwXOsJDMr+umDg1c1CoU2R7SsnEogIUWqWNJmJ9d1JfgDs6mJjsvk6EemtJsziKbQZaetKVBQpsYXEn8Fd4jk7Nr/nj974/+LnkjrJ7h2y9HbffMeijVkaDmGTIfPQkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(83380400001)(86362001)(9786002)(8936002)(426003)(2906002)(7416002)(38100700002)(7406005)(66946007)(921005)(8676002)(5660300002)(186003)(2616005)(26005)(36756003)(508600001)(6666004)(66476007)(316002)(4326008)(66556008)(110136005)(54906003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?liw9zX3zUp+1UErCOr4uPSQZ1XicaWIHibLdU1hV+q+zsuQFndMpDI1/RUPD?=
 =?us-ascii?Q?SlWIEg0Aauq0rDxT0lWwSRvE68g6FLOIf/IvAOO6oGwx/4PRW63OnsoFnuNE?=
 =?us-ascii?Q?KTPn6kbwwtgu2MMmjHwTW6+772ZR3WMsH5aNIv1kboCdPfxW/zeWMVSdhOzx?=
 =?us-ascii?Q?4vnGDl/nM4YPPRRPFjJUkoS24l3DhE3GBpj8JZ/Rwss6IYDZ4HLPu4nVe8AI?=
 =?us-ascii?Q?+3xMyCjtlhkO922196zX2nErLkcxkPUmKotntxEFxV7KIP/0G8fMJr6wWPa7?=
 =?us-ascii?Q?WNZXVbx+rtjvbKuPjdZfeBNVhR3whwggVOKfMLo7QEeAKAqo0r7VRrEYJ6G3?=
 =?us-ascii?Q?EMP9FbnkNo3sB/aNuT8jP1MgD/brfN355hC6eZMnPOPZpQOR9qeO/jzagdk+?=
 =?us-ascii?Q?MAio8nsusmAE2Ndk7pivSktoSCRyB1tl011A6SH7T4FA0NSdSwxgzQJ3ufMe?=
 =?us-ascii?Q?lDyudIuYU7nrXR0/gGnpQG5mZvErWeyyApAbvD2k+4uejiDTvK3u58nkCgGD?=
 =?us-ascii?Q?FtxtoYkPCoyh87FutLGKHdAwk5DxtZJ3SsuLPhQn5jJxEsuLNhhLQZXJACz9?=
 =?us-ascii?Q?+WkbTP0ZCX+BLghg6wKnklsQNCRIbfAofrjq/zpfrrMyIMpcKJV6DPbQKN1f?=
 =?us-ascii?Q?MvT0cYoPkMYcy3vyvfwIsbGVKs4wKftilXS/3viqaqzqcZqqH6YtZmO5duu3?=
 =?us-ascii?Q?l/ALmjda/WMS6jyZGN1U/GwgRlyb66x902cW9ctja22CUyHfJNClIJx9mjVx?=
 =?us-ascii?Q?kQKmNlrjzMdQYWi3syeg39/YbD6LtHpW1rrX8llvNVEppDZ9fdhLPJTw1kfR?=
 =?us-ascii?Q?v550t7gmcxCCJmKTdXOMf4qVeGBRFQm84ceawmj8rtdDeb6a0oI83UaJKvtA?=
 =?us-ascii?Q?IJpaaIZ5GvpE5o5Yws+GYffP1MZG6ihWeynh/bJlulMUK/VNVUYQql7w10f7?=
 =?us-ascii?Q?vVEm3t02eWMeLKlvtBq1ew1pe/5RGJomOMimcNuSd4OPL4SRGBc9U24rE0LO?=
 =?us-ascii?Q?+XwdLReyPadVSdJwkgZSivKCeRQhA7K8WRLzUZ5YfmCByZR+AB1p7gX6jUJK?=
 =?us-ascii?Q?VWUsmAd9D6yqdq59FE6bjwHJanaup7jzxR1ix6SlDM81CWWDTCvFq562H4S1?=
 =?us-ascii?Q?w7P3yXNMoaRiuqxHpNTmz7ANhpXZP8icf3wChom+03BJ8MrTf2Zdgy8Z+Puu?=
 =?us-ascii?Q?1dDugrWN4ounH5EjuOY9FcbYN/d9IF6Pl/Ipibb6OTnnykVT0JxLycdfujA5?=
 =?us-ascii?Q?XhEGMasCN+e/oVzgDjHDw7AKq/1t1hu+Y2XR+gsz0Sfnjv4gVcSqRzcqMwQN?=
 =?us-ascii?Q?sitXvfJa2JLmld6NgIZq0mNP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbef0a9-25ec-4a32-43b4-08d95878335e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:13.2045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rF49bRcVE9dZh5FYrtfrN31Ka1ESfuDVmsArOyc5Oo/3mPnXCvIgg1uo9pK0fE2s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5206
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

The core code no longer requires these ops to be defined, so delete these
empty functions and leave the op as NULL. mtty's functions only log a
pointless message, delete that entirely.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c |  6 ------
 samples/vfio-mdev/mdpy.c   | 11 -----------
 samples/vfio-mdev/mtty.c   | 13 -------------
 3 files changed, 30 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 0f1511849b7c3c..7b2e12fe70827c 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1278,11 +1278,6 @@ static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 	return -ENOTTY;
 }
 
-static int mbochs_open(struct vfio_device *vdev)
-{
-	return 0;
-}
-
 static void mbochs_close(struct vfio_device *vdev)
 {
 	struct mdev_state *mdev_state =
@@ -1401,7 +1396,6 @@ static struct attribute_group *mdev_type_groups[] = {
 };
 
 static const struct vfio_device_ops mbochs_dev_ops = {
-	.open = mbochs_open,
 	.release = mbochs_close,
 	.read = mbochs_read,
 	.write = mbochs_write,
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 57334034cde6dd..8d1a80a0722aa9 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -614,15 +614,6 @@ static long mdpy_ioctl(struct vfio_device *vdev, unsigned int cmd,
 	return -ENOTTY;
 }
 
-static int mdpy_open(struct vfio_device *vdev)
-{
-	return 0;
-}
-
-static void mdpy_close(struct vfio_device *vdev)
-{
-}
-
 static ssize_t
 resolution_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
@@ -717,8 +708,6 @@ static struct attribute_group *mdev_type_groups[] = {
 };
 
 static const struct vfio_device_ops mdpy_dev_ops = {
-	.open = mdpy_open,
-	.release = mdpy_close,
 	.read = mdpy_read,
 	.write = mdpy_write,
 	.ioctl = mdpy_ioctl,
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 37cc9067e1601d..5983cdb16e3d1d 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1207,17 +1207,6 @@ static long mtty_ioctl(struct vfio_device *vdev, unsigned int cmd,
 	return -ENOTTY;
 }
 
-static int mtty_open(struct vfio_device *vdev)
-{
-	pr_info("%s\n", __func__);
-	return 0;
-}
-
-static void mtty_close(struct vfio_device *mdev)
-{
-	pr_info("%s\n", __func__);
-}
-
 static ssize_t
 sample_mtty_dev_show(struct device *dev, struct device_attribute *attr,
 		     char *buf)
@@ -1325,8 +1314,6 @@ static struct attribute_group *mdev_type_groups[] = {
 
 static const struct vfio_device_ops mtty_dev_ops = {
 	.name = "vfio-mtty",
-	.open = mtty_open,
-	.release = mtty_close,
 	.read = mtty_read,
 	.write = mtty_write,
 	.ioctl = mtty_ioctl,
-- 
2.32.0

