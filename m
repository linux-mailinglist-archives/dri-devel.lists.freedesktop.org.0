Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C936B41F3EC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5626EF33;
	Fri,  1 Oct 2021 17:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DB86EE91;
 Fri,  1 Oct 2021 17:52:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAN3eEvmouxom6sBnP1fYmZCYrFj5CXX51Df9aV1CqiorxxAQ5poalBZ9az30DwgxQQrux6qX1vigvyExOVxHVRZNpCv8h93+iEOqkKIaodyugfJSSScFah+BfUGdD5DpZrnZWR/Sp5gdvJL/iUEMBv8e3Rcn2NzLevl6oBHEkMhhibpcIa/XnKd4ZQsF/ovrwXvmMBLBdWcNjQMr8DniaunQn9ElgeYJhrNUj2kPk9QWRRphwC2islla6I8usLRWqOgOZfVlHaWXKmKjp1yTkIp8FBZjhldSH60LGwJAa0BWz22s5g9s539L5mY7j+f8pQzLVunKpXOs91U314HkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nq9RsKauE4liZ2b8voAMWsI1xnwsEPP5+8gl3p4Fi2k=;
 b=ce/9io+9FrhonIY/PBYa88dFy4B/8dglETDsHF5dUNt7ClZ1pSoMv602YcZmJ/ls17tHycQA29L11zrQR6AnHdTol2w3BlFVYRyxP8qLTpNYBwC0TkYdupH8nyojp3Fr/GykY44qCCHv0C/ulqYoFk2uSKUEjjnglHqmHvYPpXhxgg3H6JMcSepuRgjykxd26u0OpD/RQPhVL2L2ec3i53/M2viQyLsIUh/gD+4bYGKhfI/nsmuZsPAKawAyB46KOVaoYvbzhYhM9UjHfPHgjz2BapIQLXHh407ppWvN+Xik6UPShiAakLap/j5xpjYBp7MaA/75YP2IkBgtoR+CFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nq9RsKauE4liZ2b8voAMWsI1xnwsEPP5+8gl3p4Fi2k=;
 b=Wx5v6D+BZN2BuVynu2WvBzIZm899Tfmm13TbLDh7MIJLjsbSKCazo0aMsCmXS59KbicnHe/LNpWanBe0LF7JRCiZdeH0Gx6UiX5J8d9w02nwp0ERwR8WHxKsIzIRZOtiCSm4vSZ6Tdy+1mD93EFgFxWQMH9OibEJhGTEe3e+CZeTO+j/MSOmbyI8/Y9ET3aoLWY7s5hETwgRvsup8ZQ7xksEMR7S4B89KEn/04CTtdfUOajTBPtL+Rr2odZE5Xy8H2hKtqg+G0FBlt78u99JGyL1x2mtIRLz+9imxkRWuNLFNsUcyYlCd9ukhnwKfv7nDOrIey6m/oM9BGgnQ3BY4g==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5207.namprd12.prod.outlook.com (2603:10b6:208:318::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 17:52:56 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 17:52:56 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
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
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 09/10] vfio: Export vfio_device_try_get()
Date: Fri,  1 Oct 2021 14:52:50 -0300
Message-Id: <9-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0407.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::22) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0407.namprd13.prod.outlook.com (2603:10b6:208:2c2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.7 via Frontend
 Transport; Fri, 1 Oct 2021 17:52:54 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mWMiK-00989W-9w; Fri, 01 Oct 2021 14:52:52 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcc5c726-814b-426d-5d15-08d985044b61
X-MS-TrafficTypeDiagnostic: BL1PR12MB5207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52074518C0F4748F0CDF0FA2C2AB9@BL1PR12MB5207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DipFmQ2OQz0F3RPeXrCn/+2MqLwdpTufsBpNLFcfNr3FCq6C/1XrzSQ/sGpAQp3Zu9fQt6qmPw5Xa3xPPN8/Uu40xGb63RUj0XKJxLh8lijgLKcFZxyOszLJ9cjUW91CBZ/MaBq8pWbW1k3ZtPgoOoYnFDISzfGCZMX5K54B761rjpnhPW5TYGarLGw+McQtp87oqM7eAZWIYCgGDVNLT1+1zeERT/2Wy41AxllDJUCY3Q1EMQ/bmdtnnSbAFjvrHLIdjir93Sr+GdM3Bcwg7jJKjkH+RAMpcpD4Jtu9648VXYMd7HoB1UDQyWzOyANdvpdAw9EQ3emeFav+y14U/yPPq025EgNtfwxVjSGSCCvWKYHRTlZkKfazckZqJ+JPXmJbeJqcsvakFS4AnT8Rr0R/VvYBVIqWUUdzQC5peviHlQpiwnOrtm1gOs/2G/Vs44U8ijww/95LVH8PnityBB+AnZhjHZWGQaJyvd6/yK9jHK7PmTjvF6otUqYO55VUFYS8xXIW1iR/HyOUFkcmhCK3nh4w0Bch3hBR5/XcdVCEfUb5yze6hNivahZ1wfPaSVF4V6ZM19gnHfZSOGGMHYc4lH8TcxggllTtpooLAAwk5XURJA1W52XqFtogDaEAJXv5fpqejsG8ijoezK7Q0grAhToaMovGeH0UVavtXZrCS9F4ECf6gw2Ur5Jbi8WhWSyEyZOjKiMgTxdT64YQwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(2906002)(83380400001)(66556008)(8676002)(38100700002)(66476007)(5660300002)(2616005)(508600001)(426003)(9786002)(26005)(186003)(9746002)(54906003)(36756003)(7416002)(4326008)(110136005)(86362001)(8936002)(921005)(316002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BtWWtbzNTe8bN97utlLOrGgGbStEWhzmkKz0KHVOSdfyBh5RgUFJ4Pu+2/4u?=
 =?us-ascii?Q?TRRBhXu2H3VeS4FYNq7RXkv/meTVdEgblUrNfxxfnDnOUFt99JYdfnHfqJEd?=
 =?us-ascii?Q?1kTLTPC2W2UtqVKpPBsRRUw8F4V8N0BdICAjOafAJkAfupDShxnAXF7z7zy4?=
 =?us-ascii?Q?4DJlfdqA5+Wd1htGg03JWSAjF8o3K6jkGfe69khWWsjNylf3CiMNy7Uge5xs?=
 =?us-ascii?Q?G33XNU2va+LwhelkB6LKPDEYXLz9RuNbxRt880DdrClt66Vl86ZS55rxV/Uu?=
 =?us-ascii?Q?ngNc9C3Lupuy5pYkPMTiNHKqiFqXRKPl0oXvJN/+J3NfT4hkOaMUGg4c22JK?=
 =?us-ascii?Q?LnJV3MFEL31p4Vpfwf2n6Ip5a8zUR0jfXsrL0FYtews0nPGlbXABRTTIlwZ9?=
 =?us-ascii?Q?2gR/IRQPaP7684ciabHB5b3gK1CXANQfwGqYlOnJkZ3SBNVKrHpsah1A02Aw?=
 =?us-ascii?Q?8TmPsSBBXw05R4Qf0QPJbD2f/jc5xQD4lq9zN/KLQ/l508ecEH+MdZMsWoQc?=
 =?us-ascii?Q?MPOjZqU7RoajRgBFnmbIfKQbBSWZL7WVDEK7r6aoMvtD+kl1kzZvbXLJKTG/?=
 =?us-ascii?Q?qbA/QOyTGpyiPeI8typmsVbizOIWpauXqaX5JHB3RNln5MgyyND+W8RHBast?=
 =?us-ascii?Q?4nG8c8PpAU5IQ1qHmjBXD0E+hx9zxMxI6w0Mol+6Xz8UKNn+syxAd6xu2soG?=
 =?us-ascii?Q?1VX/qFQDpahw4hSmkQzgjOn5pcqpyXbv1NUe5ETZhB0ky/eCM4Gr6KMkVW1K?=
 =?us-ascii?Q?+fCTmBpcq5dZQI6IZ1p2FN44U98dtcHVv2hvNA7QZsXsZNcXh8J5jPQAbk4y?=
 =?us-ascii?Q?JKTtyQz39hUy9bRU+iU+dJX0a27ohIOFCsbyDjXvOysqMxbn1CqA10vvFrcp?=
 =?us-ascii?Q?qarMe1hFzzCsJ6kMI20MUa16xWtjMRL0dpmD9SEWzxPgNlhEkA+SdMtqJKsb?=
 =?us-ascii?Q?zZZKCMU9NOdAuGmWuVBrcIlQzhiKWBRNQC9vcc7qJFwuDPBZPpwxwQTF/b5h?=
 =?us-ascii?Q?9f/iv6EkHBcArH70SAjWGJHMnVpUKdQ6ji1ZZMzTLzCKAkkWWdN0vA6nwAij?=
 =?us-ascii?Q?zjSI2D0x5szTHqQiwPRYbbb4o2jJr3ddZy+hUdRapPk/M2aFGtCov4sV32n1?=
 =?us-ascii?Q?HOxcqUyH7qQaWgwSPynOW0YooLZq1LmzHW1qMRiNE4p3RpkjtFXzT3LLC04+?=
 =?us-ascii?Q?ZGNPnFm8LLUxv2ULiQ4e5t5OxtqPoThryJNsXlQgKM2kOp/F0J77L8juzg/b?=
 =?us-ascii?Q?KOwu9//BqylDKCCu1teycr9r8KoLheMoysGpyjFsLpIBadle+KIVqw/8YB0I?=
 =?us-ascii?Q?U0nAalADaNOU4aE0GT3hWfnu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc5c726-814b-426d-5d15-08d985044b61
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 17:52:54.1995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8X5I49welgH7KCraYTgdgtGeIChMwPBwm/cSsdiTJkC/C9R/ylHz6HDlI4yR8H7a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5207
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

vfio_ccw will need it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio.c  | 3 ++-
 include/linux/vfio.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 08b27b64f0f935..44adf112e3b5dd 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -554,10 +554,11 @@ void vfio_device_put(struct vfio_device *device)
 }
 EXPORT_SYMBOL_GPL(vfio_device_put);
 
-static bool vfio_device_try_get(struct vfio_device *device)
+bool vfio_device_try_get(struct vfio_device *device)
 {
 	return refcount_inc_not_zero(&device->refcount);
 }
+EXPORT_SYMBOL_GPL(vfio_device_try_get);
 
 static struct vfio_device *vfio_group_get_device(struct vfio_group *group,
 						 struct device *dev)
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 76191d7abed185..f99e4b2d9b45f0 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -78,6 +78,7 @@ int vfio_register_group_dev(struct vfio_device *device);
 int vfio_register_emulated_iommu_dev(struct vfio_device *device);
 void vfio_unregister_group_dev(struct vfio_device *device);
 extern struct vfio_device *vfio_device_get_from_dev(struct device *dev);
+bool vfio_device_try_get(struct vfio_device *device);
 extern void vfio_device_put(struct vfio_device *device);
 
 int vfio_assign_device_set(struct vfio_device *device, void *set_id);
-- 
2.33.0

