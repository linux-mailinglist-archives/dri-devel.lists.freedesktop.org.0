Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144063D0072
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A016E4AA;
	Tue, 20 Jul 2021 17:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2D86E4AA;
 Tue, 20 Jul 2021 17:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cog5D0aX1dmEK59zHL73FhKpXF1baIaPstF6rQTAk3U3PVZ+arQYOIGdTKeE6T0sGShCPmKl9cRARMzI4uhqij7Swr5sdsuT8vWLGErSGuQLCrQtpy4iD1y/VqnkH1l6S5W4U4vXmLYQ6dSKouvkrqrx/LUankqCcfT2xUo5Q2UltjLuQYqra6ppUjJJleTmv3oR3bEz99NfjpVtAyLahFx/bhZWnlWtDzJ4uH7/ugQSIFt3boE5mrakPWhZjKRPI6fLSImlMwFxrqS99QhY549wTQ80SeVhu/QP/nJaQAPKqxmxu59wwc/A1P+s1OKxzQyXF1pMhy08rXbZSYITYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+CqPWbRYNbM3kON0iD8CCcWDFjIjT7SkcujZ9stK/M=;
 b=jeRAHCzys6gy+zDT4eokhn8zS80JwlDJfGK3cs1A/jRsbo8DoOn/x069eNEydI7d+SQquyvnrMkpcRxm7nI4AHCCebGUva2t6nzI8lYqnT6cu/lnF0MoRJ/pVawT76WhMhseOGBA8bqVrajBgov5KzOr4js9TmO0HEZmTbzUKK/sOzUj+hAd/v1HGfpbrLVp1T5AqK+pyIiu2NLGLyNTSQ87z5vbZ01/NN3Xse9ird/l6qL0xW2l41BF002qHYcFZskESSqYU+fPoaZhMI/ifojDIgbJY956BVZat+ZhSOa3ZupR8iiqRkJCi11MpAFMk0E3XAS12XzTzL6N4FB+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+CqPWbRYNbM3kON0iD8CCcWDFjIjT7SkcujZ9stK/M=;
 b=DPHSlkn22cH5IbSknDVzyNKw/AkYuthN2jqN+JMFXO5BidUNTtJSDBwIdDZnqB//keTY+X0+Yh2MpGLNMje228KFcL7Kb8URS5LfJ46OAHcVHNee1ZgZ2hUgMT7nrBCRA7hVT8f9i7A640nlYVA7k077BKISWGnoLYx4KACiv5wGVgRTioknE2U4Cy89Jt8Cjn18+wMW0kX8xQv0bKNPiZFErEHwQKO24gZjxUmuB3+BXy3LQlrGEkHH6Lc/EdPdqvQMDCnKnfUMjQ2DC0j4Gb/b7zvR6T830TS/MMFqa/+soc8/u6S57hUaAim4ZCHvtpGCW0G5qNUsB1fd2keACQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 17:43:02 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:43:02 +0000
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
Subject: [PATCH v2 01/14] vfio/samples: Remove module get/put
Date: Tue, 20 Jul 2021 14:42:47 -0300
Message-Id: <1-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:208:fc::39) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR02CA0026.namprd02.prod.outlook.com (2603:10b6:208:fc::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 17:43:02 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051EY-29; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f86fb051-5233-4dfb-ffeb-08d94ba5d260
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB528815BA4F20864BAAC3DC74C2E29@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e+1yBJ8wwcHelEz2s6GH38h+Gh6hYnIAt9EpYA/PWXmHP4sUR3P4O6fuE/hrcNCzjoGZgoB9q2EmH3f8J98yybzukmQZW1eVgsRjATjK0nlufXYbjEQinCKJF7IAQrFOxUx1kNl6uZ7Jy8Miai2W9NaPQW+CVKVJTbO2r+X+rzfQrGtLkEvz5zu++Wr4gLQXKll96FQ44v7bjVgK9xiXu4BSlc66C+kP1vwge0PQ9OW5Hu4XUS9/TTSUlVlS0enwcs1C+ZwR36Ppy6RwBCNnSf4e64Ceo9wGnjU3iEL8Lt5FrRr6ULbnJ5gKmWpIKrRpIDp5KL06qev5sEywysK0MGhLO0NTH+CID+ByJSS2LoY83pMg2TvxPJcap0CR+8SxGoJOsIYP7k+M8G56ocSspoJ6k+Q3LifCMAvmBvrV54iLxFWNu9OduUevS4sc0OYXKGYU2j9iUyxiZo3M43WfNZD1MsPxtufJPSNXKo/0A0eb9U/+3li01WYZI/DfD2NSXS3Xkku24fVsvImkdrerm80+ZwBSYGV7nkE0CqjIK9u2V1eMbKMQyI4kZ+j6NvAj+z7RgdNh3dkEEl6dY7aEVAj3V59MpKpQa747iyUevvTSSwm/Bhus14u4gYOvBw4efDKJzg8HCPeMWohTsscddcnoj2EttO4jEqhtzrrdG7fWleqVySZidMXDIIzQ7Y7HzFFvU8OkwbVzdubOutSmYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(6666004)(66946007)(7416002)(7406005)(86362001)(2906002)(66476007)(54906003)(38100700002)(83380400001)(8936002)(316002)(110136005)(478600001)(36756003)(66556008)(186003)(26005)(5660300002)(8676002)(921005)(9786002)(9746002)(4326008)(426003)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hPDeo/17EFWnDXIJe0BsEJwx2v1L2N13jTpjzxsKA1zBaxIRo+JVt7O8ZsS0?=
 =?us-ascii?Q?FAVMXwJFvhXZJp3B2K/je871XvMzsMTjETJKmgnbTdQXBOLBbSFRdInEubju?=
 =?us-ascii?Q?13JUkl9rJ70FElFjaodlLBMLNWmLuZv9MjZ5VZY5asmf0s+/7wlGvcJA0FWJ?=
 =?us-ascii?Q?QLaC5jRVY1F+gNXEIANe6CwWqE+piH9N3pF7VsO6eCtXYpYdkCYmCoV5oaAm?=
 =?us-ascii?Q?zKH6gcx/pwn41Jc6OUC2P/VkMrqCY+6Lt8qUMU1mwHTtp70zLRFTjN/th3wD?=
 =?us-ascii?Q?MRaGSrIK4Uiq6dnr5evv3jEIiVAR/wzcTk35VRD+x8radRlAYRxhtzSCSx7H?=
 =?us-ascii?Q?jFLe3Z0OmL0HICOuT8uMj3hbfp9dAU+v0478bIGI7Cv5wOLsMUWhLkBuLoXJ?=
 =?us-ascii?Q?jk/QGfAc2BJPx+uGZoeR0YVyNNFIBxWW+OJ9DDWUJPqg5y03vrh3j7/OPNDN?=
 =?us-ascii?Q?YsKYlRU5gNnjYg972yB0McixKlGuqHxeLBzZa4+120qIfUY26UHIRjonEh9c?=
 =?us-ascii?Q?TkvR4oi713KpYA0RzXu6aEMLBMsA1HLX5ZD8aZUhJ3tJ490FZREbK0pBu/Fk?=
 =?us-ascii?Q?xDrHgsELGwQ+tpNzG1zCZODff80EmDPl/IFJ2NXpxsw5PQTLr1Lu+/o43vZu?=
 =?us-ascii?Q?Tw4zhybfNRyJFdi4cWs+igbQBAK7Vte24XS+DxoxIf3rka9aBUoZ0HdGvGNZ?=
 =?us-ascii?Q?DdwBBtLKQcz6iPVr2NwgLNdndzMYpeKspXjPQabQk6bHNGGVsk1EEpHg3YGs?=
 =?us-ascii?Q?MLAgs79jdOk6zhmlvfzcK/JzweZJHFz2pCo6LyC1Pvi9eivCF+Pnqoftnhxc?=
 =?us-ascii?Q?4b78QWDupcAU5tX5b7W42HaMTOWZ3bq2Dvz26+BHGHcjsHdl7k8k0LKMc6wf?=
 =?us-ascii?Q?JJOztYso+JhVjcE7TTOufn5cwH/UChBQlxgGOF2VLG7OSvrk05wVTOaik0o+?=
 =?us-ascii?Q?Yw2Z8dCuJJuBVrbNzAVUMsBmoFsxuLrBFee6i/9SAQEEyIoMhrlLf0XocHTv?=
 =?us-ascii?Q?HLyzP/i5ZXGqHulcL93gD2xuxOh8gihxWLZV7hm8pHKZQws6DLIHgIsP/2X1?=
 =?us-ascii?Q?AtX/bjXksPzirva9VXWxzG6QaiIIgfa6zfNso1votv6Or6pcPhA4nN27Epmd?=
 =?us-ascii?Q?Sgar8HMLGl9OIjcZ9dQCOD9U7S8ab751z4lXy7ItkiGY82ODiVwLbJiCzOtW?=
 =?us-ascii?Q?uj+goF8libqZe3gqDCnot9MSQLT88icv1atB21NY0IjG8F98u8V9ycrSImoD?=
 =?us-ascii?Q?TRYG2JTcsq/N/V0Va0RSZh7zTuj7gG1Zxp2XyKkuZLIOr1vcZCO4tfwQ5gVI?=
 =?us-ascii?Q?//9kdQsDVt+E7IsL0qyDmIWq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86fb051-5233-4dfb-ffeb-08d94ba5d260
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:02.3254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X03RHXVdT9jQ3yyMa+0zkpM1MtM6pR7S5rjO9wPldPsn8A1SZHkk/ImCRYRVkp68
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

The patch to move the get/put to core and the patch to convert the samples
to use vfio_device crossed in a way that this was missed. When both
patches are together the samples do not need their own get/put.

Fixes: 437e41368c01 ("vfio/mdpy: Convert to use vfio_register_group_dev()")
Fixes: 681c1615f891 ("vfio/mbochs: Convert to use vfio_register_group_dev()")
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c | 4 ----
 samples/vfio-mdev/mdpy.c   | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 6c0f229db36a1a..e81b875b4d87b4 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1274,9 +1274,6 @@ static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 
 static int mbochs_open(struct vfio_device *vdev)
 {
-	if (!try_module_get(THIS_MODULE))
-		return -ENODEV;
-
 	return 0;
 }
 
@@ -1300,7 +1297,6 @@ static void mbochs_close(struct vfio_device *vdev)
 	mbochs_put_pages(mdev_state);
 
 	mutex_unlock(&mdev_state->ops_lock);
-	module_put(THIS_MODULE);
 }
 
 static ssize_t
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 393c9df6f6a010..a7d4ed28d66411 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -611,15 +611,11 @@ static long mdpy_ioctl(struct vfio_device *vdev, unsigned int cmd,
 
 static int mdpy_open(struct vfio_device *vdev)
 {
-	if (!try_module_get(THIS_MODULE))
-		return -ENODEV;
-
 	return 0;
 }
 
 static void mdpy_close(struct vfio_device *vdev)
 {
-	module_put(THIS_MODULE);
 }
 
 static ssize_t
-- 
2.32.0

