Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E55A3E20BE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B1D6E913;
	Fri,  6 Aug 2021 01:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2059.outbound.protection.outlook.com [40.107.95.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A426E8F4;
 Fri,  6 Aug 2021 01:19:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZINEmo98VW9FhqQivWw/3imbYQPonYYXkxVBlWj3EYcSqWz5LZkeFU4fgBuwJ++KAwcAPIrxkGoTqYGXb4YbWcjvEaMYRWY8Bn5cSOeW72D1kFu0r8wlT++3jVBZ1xH18vULuThRcOyEpjBP8vCARTmUNhpkQkhi5enUCrxifkLRVb+hFHfUNAKoLKv42gzJQmq91WD1Ki4lXbp97vBdTxqj8w45stNeMmqxv2OFtDAXNlcdP/h0IuWydMdLUITX01S06BnnH5z4jAhg/XDcxWDMaIJGuVW9yTMOzotpTx64nKbmaNk60gZF2o2Uajeq5UiWzzZ821L0bO5MBwWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89riyzg8MeqmPdu7Yfg2yDRQ09T+3y17CBTYjmDoihg=;
 b=W4kNeKAMb+0pG+s5JVxSoCU/0+rXOVzwjFB2ZQBkidy7An4HHuuJpEABYXgpdoVBTuMkiVnkN6Qyc/TR4atei4XV9UTktyvvhEdGPnzGUJCbDEsDE4Dhi0WFmIU/2gMVzNLsqN4HEpUMaceGu41qW499BW4DHDxpFssxvicgA3LhiqZ1BnSuhaRLnOymVH/ZY/afP+h0gTMnHiGHDXEJt3PWgmsCwVnNdAJNFEXg4sr6Pliwf/eyn2ygZdT43sdCcD1VYa00wtrwwKrN4nbae0ytQgdhU7bdea1DPvTrKO27uOM37WAj1zykhY5iGaILeUEBJtvjtfNHFClhp5Oqqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89riyzg8MeqmPdu7Yfg2yDRQ09T+3y17CBTYjmDoihg=;
 b=gc55FsKgTHR659DmivwKa98sqYPHYSBKxXScjGvTQpkAxJpxdQx8fjFJDbmFqiu5kA7ysEvFTSARo235ZkAbEL77YIoIKRk0Sh5+ZQSnS58Bo6W6Z4OoVlesGcyD0qvIf8mB1gU1O+bxS+Sw6rGF0yLC1FjtBko91dRqLJ5AoiHq+A0QloUfN83XmyUa+zGM2utGD1K27zUrJLm9zD38R7W1HAjf7VENEiwC6K8OssP5TF2qRWhyJqW2TNwqkIHYxJvrB+wUcyWi8JsGxxY6WF063arUrUi0S/6Jtr+zGjYFDQKkxRflHMMUvk6hBdoYKEJ8MNDMSiEhJbhHPd6i6w==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5507.namprd12.prod.outlook.com (2603:10b6:208:1c4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.18; Fri, 6 Aug
 2021 01:19:12 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 01:19:12 +0000
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
Subject: [PATCH v4 02/14] vfio/mbochs: Fix missing error unwind of
 mbochs_used_mbytes
Date: Thu,  5 Aug 2021 22:18:58 -0300
Message-Id: <2-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:208:32a::22) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BLAPR03CA0107.namprd03.prod.outlook.com (2603:10b6:208:32a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Fri, 6 Aug 2021 01:19:11 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVy-00Dt6w-Vm; Thu, 05 Aug 2021 22:19:10 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97cc0ffa-2748-4655-4fa6-08d958783298
X-MS-TrafficTypeDiagnostic: BL0PR12MB5507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB55072B12E8083A6EF9F843EAC2F39@BL0PR12MB5507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gY/OdC0Ftd9hFWV7+TA2S0KHsxfVLd1jv35T+1jnNrRCfQ3xF69AtB6JK9vgmTTEQVcf0wuEaMvHtHbU+au6vZ0y4QS1VGpUoNaxHtl5B5O5xqnCUf9+A/+stnc9PQuvBpdOxurKa0iXgIPmrqcOKWgHb1eCMmr3DHpMzmgXz/ofqwrQLrrea+C6YZK+ruUheJiFc6wy/inG8I/rFhdBzCl6rH/++pRRGoD3tQIi9mm76s/KRb7UNHHUlkEmldxmy9mD8Zpm+15vJY2ykmyejKgGFfCgkBho6c036ftd83sZCRISQT1qqkjbeQsNKdqcCEHaYDZxj+dA+b5cg7pZHMdc5WrRotdEqBE2GodTFTE2pVM7v6BUzj+CVnSscHQutf3mD6QQ6opHWrSHKsY1WOx5Rs5CjJgZDkeflu6JBd4dwY0YkzQZyFRl9v7cOGio1rliKztfM1XoYVv7GkGJKgBnWQy+VzMOHuLCsJuHNVCte3/WvYqUVXEoi7zygQ3Kn2k//odTVzE6oeOAkbzmv5pjC0Apwj0FhC5LTYCsqek2ay5Y6tV0vyLkvIHr4OKIyBFvzvItqolf0WZB4xBTuwYV43ZzbvxderbbnOwhY19wKgEfxHoPVOxoRYAqqY34331ibpAqWeoWYE2BI2FCouA/2+ny7rhhlsn/5BXLuUQn83vbyr8VSbCJHTuySOhjrIQJcRa/Ou0z2cWdubStcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(4326008)(66556008)(110136005)(2616005)(66946007)(66476007)(316002)(186003)(426003)(9786002)(54906003)(8936002)(5660300002)(9746002)(26005)(6666004)(7406005)(86362001)(7416002)(2906002)(83380400001)(921005)(478600001)(36756003)(38100700002)(8676002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eUensZMRb/Srvbxarkz2GlqlYx9t3eitsrimkxiFjbv5CiaJB/xVGHQeGubB?=
 =?us-ascii?Q?G2Bv70+Bq8+TzixjRDahNrhKYKVgxTsMd6oOrq8PMsRIsNzBDR6PkhCWbm3j?=
 =?us-ascii?Q?Kd4bzb1KwP3RPkFZ6gOO5K+Qi6IX5LBy44Q2COn5yDzbZfDFqZexTS36chbQ?=
 =?us-ascii?Q?HVHjgcds04pChTjDqRLna1tmNTjmwA4GhgTQ5lwJ5gI474wACVL+0no1wIPn?=
 =?us-ascii?Q?HO915/pqjG6IKpn4s/1DTVBIpeOkX6J3sutIXV4LG7LnV7mm0mXb5Yp2hFKr?=
 =?us-ascii?Q?y26xNz6rAcT/P+tLkOHvureSMV274qHkbkGfuM5ZbKrY/lFLi583pFjpjlz9?=
 =?us-ascii?Q?Aq50gbRrpUETcURJAYxWgOYVP42B/HtqbGfxyjtEX1VKeokrup9E/WPkN40Y?=
 =?us-ascii?Q?WFTBbm3eMmrnTE61otg/1bZcZAnbIyEne7w0jV4EecO7sYLiyIC8jISsNDqS?=
 =?us-ascii?Q?vkCbRl0dKAnY7b9Lq5b2DgOBHVFRKNk9NHLTSfQIIaSmrS0QpJueQCe7AZaV?=
 =?us-ascii?Q?/iHJH4VyTrwH8Q7YaTIMp7TxbWe9mwsP0jZs+z+q/fxxRWCx1fqfbsZc5Qt3?=
 =?us-ascii?Q?NmsBCfheh0GAo0tNP7zKur8NwwTRkTQNuJGHmiHxI3bxaUfOmfkjhc2mTp4S?=
 =?us-ascii?Q?1LXOhlaRbrA0Z79jSOGtEl9R48AClMVXnP5OshKX6p7iKDojJF6H0P06Mf0k?=
 =?us-ascii?Q?vH5/HsUlyNNfq4/Afbk799NOIah5VWmjEGocDK0r67RoMGMhI0wDB3tfQxho?=
 =?us-ascii?Q?XqTvl6raAC4MssXit64dHmZQrON5fclnJkU0fnOXT0opKrWyy/XNZX1I4Yba?=
 =?us-ascii?Q?kTHhhyDzGLmHjeM2TTPmtSpv92wsBUtmCvPiRovEZakg8MsskNmXQL04xp9C?=
 =?us-ascii?Q?WXc65lWkoaORkZsQsaDhyyC1bXsxkb9vXM+vskWoNX7Et83TAXLQZcm0cDSk?=
 =?us-ascii?Q?UQ5OrKxdkrZSccn3dAlMZyupFAcn0Bt0Sy+wYVjAU7rKDvnsOb32SRrBw61k?=
 =?us-ascii?Q?3JzalLmmWx7sow1DWhfQKvz16BPC4Xri2ygj2ICE3Su1L5qeAd7fZb2B6GDp?=
 =?us-ascii?Q?39cIHTHAl6mh2FbsCYsbc3xU+dwuGsaPwCLQBIxGvKdTOrAiOtkB3JNACTZe?=
 =?us-ascii?Q?PsGWRdFdfO18Om/Z6Lp8IN1K0pSgj6FY/MS9/0bu8VAsRbrh913AUBUEeGaG?=
 =?us-ascii?Q?q7qX+hl3oltjCLM2jI47UeS+hJ35uH/ZSupnctfgy2iqhTCBjHzAmQvsWs/J?=
 =?us-ascii?Q?OE2wgYaSmyMAj3sfACtXWyVWsW7Twrc3OigdN9Cr2q0w9vsC4EcmQaSTcXQi?=
 =?us-ascii?Q?xLaEoHdknKd1RunpcXsCC6MR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cc0ffa-2748-4655-4fa6-08d958783298
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:11.9620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGZp0kdm80+VgSz0WfDFk987MhCgSxmm2FsTlSrBDgDJw5aJmb2NKcpDL24abgMX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5507
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

Convert mbochs to use an atomic scheme for this like mtty was changed
into. The atomic fixes various race conditions with probing. Add the
missing error unwind. Also add the missing kfree of mdev_state->pages.

Fixes: 681c1615f891 ("vfio/mbochs: Convert to use vfio_register_group_dev()")
Reported-by: Cornelia Huck <cohuck@redhat.com>
Co-developed-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index e81b875b4d87b4..3e885be7d076ad 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -129,7 +129,7 @@ static dev_t		mbochs_devt;
 static struct class	*mbochs_class;
 static struct cdev	mbochs_cdev;
 static struct device	mbochs_dev;
-static int		mbochs_used_mbytes;
+static atomic_t mbochs_avail_mbytes;
 static const struct vfio_device_ops mbochs_dev_ops;
 
 struct vfio_region_info_ext {
@@ -507,18 +507,22 @@ static int mbochs_reset(struct mdev_state *mdev_state)
 
 static int mbochs_probe(struct mdev_device *mdev)
 {
+	int avail_mbytes = atomic_read(&mbochs_avail_mbytes);
 	const struct mbochs_type *type =
 		&mbochs_types[mdev_get_type_group_id(mdev)];
 	struct device *dev = mdev_dev(mdev);
 	struct mdev_state *mdev_state;
 	int ret = -ENOMEM;
 
-	if (type->mbytes + mbochs_used_mbytes > max_mbytes)
-		return -ENOMEM;
+	do {
+		if (avail_mbytes < type->mbytes)
+			return -ENOSPC;
+	} while (!atomic_try_cmpxchg(&mbochs_avail_mbytes, &avail_mbytes,
+				     avail_mbytes - type->mbytes));
 
 	mdev_state = kzalloc(sizeof(struct mdev_state), GFP_KERNEL);
 	if (mdev_state == NULL)
-		return -ENOMEM;
+		goto err_avail;
 	vfio_init_group_dev(&mdev_state->vdev, &mdev->dev, &mbochs_dev_ops);
 
 	mdev_state->vconfig = kzalloc(MBOCHS_CONFIG_SPACE_SIZE, GFP_KERNEL);
@@ -549,17 +553,17 @@ static int mbochs_probe(struct mdev_device *mdev)
 	mbochs_create_config_space(mdev_state);
 	mbochs_reset(mdev_state);
 
-	mbochs_used_mbytes += type->mbytes;
-
 	ret = vfio_register_group_dev(&mdev_state->vdev);
 	if (ret)
 		goto err_mem;
 	dev_set_drvdata(&mdev->dev, mdev_state);
 	return 0;
-
 err_mem:
+	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
 	kfree(mdev_state);
+err_avail:
+	atomic_add(type->mbytes, &mbochs_avail_mbytes);
 	return ret;
 }
 
@@ -567,8 +571,8 @@ static void mbochs_remove(struct mdev_device *mdev)
 {
 	struct mdev_state *mdev_state = dev_get_drvdata(&mdev->dev);
 
-	mbochs_used_mbytes -= mdev_state->type->mbytes;
 	vfio_unregister_group_dev(&mdev_state->vdev);
+	atomic_add(mdev_state->type->mbytes, &mbochs_avail_mbytes);
 	kfree(mdev_state->pages);
 	kfree(mdev_state->vconfig);
 	kfree(mdev_state);
@@ -1351,7 +1355,7 @@ static ssize_t available_instances_show(struct mdev_type *mtype,
 {
 	const struct mbochs_type *type =
 		&mbochs_types[mtype_get_type_group_id(mtype)];
-	int count = (max_mbytes - mbochs_used_mbytes) / type->mbytes;
+	int count = atomic_read(&mbochs_avail_mbytes) / type->mbytes;
 
 	return sprintf(buf, "%d\n", count);
 }
@@ -1433,6 +1437,8 @@ static int __init mbochs_dev_init(void)
 {
 	int ret = 0;
 
+	atomic_set(&mbochs_avail_mbytes, max_mbytes);
+
 	ret = alloc_chrdev_region(&mbochs_devt, 0, MINORMASK + 1, MBOCHS_NAME);
 	if (ret < 0) {
 		pr_err("Error: failed to register mbochs_dev, err: %d\n", ret);
-- 
2.32.0

