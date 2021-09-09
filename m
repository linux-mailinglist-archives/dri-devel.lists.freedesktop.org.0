Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56982405D8E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 21:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18A76E91A;
	Thu,  9 Sep 2021 19:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F656E90D;
 Thu,  9 Sep 2021 19:38:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROLO7gnZJYrdd1VNFm1iFTVf9wsmb6k3fMiGRFCD24JRGpypN9YTXuG08jzF9ul4k/MzuckZW0IrF7pooOZWcmWnyp3EiUdZIfanrEfTiOkZSx+BXgqSUwKHKdXmgu+UpzbfOxkVgzMApPKnA/AHZl6O782wie+gRbeB4PcRxUulEzoe3+gPvjWLQ/C3ZBTwYo0Mq1TlhEKeLEcs75+n7+5sFrgUks5wN7YOnK2kLSnzssk+TGgVPTIADQJo80ZQ4pPJkbiOIwTxeNUsbnA3QJzadgLmL+b3AZRI3uIs515q0z1SKdARUzXBJ6BWcJuJ9gV2A86WSjRwRTXAygL53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Yul/KtpqYFKamySxO1NsBA5ij/VLaZ6SLSt8ofa1xgw=;
 b=nCvs6nMlu1XaXTNWGUEDfOAxcda3hm8qyIuhlhlDTjjCPhdTlgC61w4XLqUl4Zsi2zS2ejYRorVJpUwxKUenOxO6WaEz4WK7nIyfREa8tuPIyRk6YxyZL+oF0QZjpcFkVfJj7gBG75Xy0KwI7ZH2ATp4oM5JENosNoIKVjjjpc8z31enJAGLxiysUVr8jMePugukHosROsd1jBHaUn8VcJ6CCSeREBI+f18t1k1SkmewDrdoiWQateg766/6jmMeHFHCYPQIGyqJiU9Cy+YCoO+AhksKA1pZmfKE8S9xLNQySaYz44f92N4LEkmcUjwJDWHCBQBk3ZN5Yee8ZI370A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yul/KtpqYFKamySxO1NsBA5ij/VLaZ6SLSt8ofa1xgw=;
 b=OwX1KrMudH27pKzW4KromJVVFYN59bCFnnN4j0zSQLVkbUQ+kp7ZdKxgg3geIpquMPLzjvvoRhB69Zm1JIu/2bPIQkJwgjyVsdHEH6AWRCB8ZR23rGNSdkslnG17q+Si9c4eNtaKapKpv09nBjUCFz1cank/hjfROkRygjM4HTKm9LBLJ9JA8QADC/prpqsuEj3L3XGebfkkrcg851gdnW9W9gcXhqUoaomRunfSO6ekfMVm7m6mujeGy9x3fqtO/qh3zrc2z92oIUFuQy6tv8Y8/aYgn78eiO8VaUxwOqagEH3CfiwmhxIzPO4JEpmsb3e4LUYD9VMjpraUbwiRIA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5554.namprd12.prod.outlook.com (2603:10b6:208:1cd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 19:38:54 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 19:38:54 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 8/9] vfio: Export vfio_device_try_get()
Date: Thu,  9 Sep 2021 16:38:48 -0300
Message-Id: <8-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0016.namprd18.prod.outlook.com
 (2603:10b6:208:23c::21) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR18CA0016.namprd18.prod.outlook.com (2603:10b6:208:23c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 9 Sep 2021 19:38:52 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mOPsn-00FLFF-PU; Thu, 09 Sep 2021 16:38:49 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fd5a0ce-7a36-4306-5998-08d973c9744a
X-MS-TrafficTypeDiagnostic: BL0PR12MB5554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5554B0670468719C2D7B891EC2D59@BL0PR12MB5554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lbdGpiejsfCQCgFsWhi4P9nAaTvnZkr5C2ruVNibtWUShMiyTABr0QwoVBUEWi0513zK4jpTitAliIK40Khl87BX++nasoZ2IuW2JVNVltnlcXVlq4IuD934SlDEC/N1Za9fEFqHqBox0nP61ZvlawJ7N4JOi7JDuYdF6TMceZmr2SQZ/QmM3hdpjSFRmeBDZp2NRjNLYsFBsqdQJifTGIekpP6u+LP+VXYIUQs31u8pMPrJhP/4ncIjyFfwOMs5MZPQpIu0XQ8EfdSP5AVpC1kdM7khrJl+mSSOq7whJ2gAH3r9KZINjbgrmt8HflWq8f/FQrIUq/6O5x/X9H3rce7AiEbdJdIPQ4H7a47bvJb8M12M8ZNP8lrCzVAtVuQfYiO/ozMZ+DcHIH0nBFaReMOLZazv7MA+hVas9zO4mCGsRnp5ZSouLzGYcgji3Os6Zvw7ZSE3ioQMJqJp3BdlPW0+CXAnWKIc+cBJe7Fn/EiiJviJ5CoCpdMj2cLWeAELk3MQ25TmQfnwjvx4oQADk7V+s/tjRHeVeoiGz00i/WSQGemJAmCJr9EhR2+il1UsV+LxqCz0QdOaanA/6BN7zLu46hlmzWBprMNm3CE9lBz1zi6N+ZYn9NwAXI+M2BMjo7qqWsAml/Hv/i4USnfi8KZcoiewB6kx/abGdRWa4+8T81oal3QyJlVPSwzRMdV/yaAI10cY53KYQXIKveHJ2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(26005)(4326008)(2616005)(66556008)(921005)(66476007)(426003)(66946007)(9746002)(9786002)(5660300002)(186003)(83380400001)(86362001)(508600001)(8936002)(110136005)(38100700002)(36756003)(316002)(8676002)(2906002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VlHgMe1+Sfy5kVcgiXTH50k4Z3y6WmCVPxJytzD09eALWxty+SA8tsC7Mq9dfvgBI3RCZk/RtZO9Ew1MgbGoF4aSbtmWougFiSqt22mUaO7i9rtiNHFOr6wsF6eJayfGQvKTfq7marHnmDvueiUj5QJOMc4trhSzvYQ9/5TtEVpHF+ijIKz16Gl5ByrgHOTA66BTGyfS8R02JXoTM8XMN20J0Man0VRqyDoGq8918DENGOBmM8ZluiaAPTk3NhSYMVrdHzUzjL6qNdMD3znHxLYY259VOGjlLiQ9KgtnGOH3jbAy+UKlU1UwR4mvJD6q6TT6E/ylKV8KQ/rRvxayZy6RDt/wczT0Ka1w6kjJmtmCwG0C2HgsgcoqOzguDJbbLMqVegZu7sYEN4BZWLlAiPOhuhDX3wAbVSMhCThDXjfmjRjUugzlZgJJz/wDNtPSHBmr/8qz6ddsyz72ynA42btziUtv0wco7pVf9e8ybRZLC4fEJh5OMD09vpzRRKzE7Mdme+QZuDQyxfDbJdeonUKXbuuoivA6sKC6/hB/3/wXeRUyILl7/4YrnhgWFU4yxgn/NgfXrfRN5ix6b8sA1RG9zIkzlWtFkyAZsT2clAWoz99V/hAsJJqxKgG42B6hnWcpyifyfvluFFdi6BgRqdg8OWqmntICAy6H8jKBLGo+hJHapHtTRXZpThPgnwUU2hbUl1hcy6ZvJOnM8UsXycBYRFmuTWsNw74r92Djdaw9wXhOevoH0OR4lmZ1NuRQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd5a0ce-7a36-4306-5998-08d973c9744a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 19:38:53.0746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9fmpd6qqpHKoLq7x0Sy6G/hML2FesEdVapCV0I6iMTKluAcUWiFNx7t189hW2Sy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5554
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
index c3ca33e513c8e9..e78278a0b98a96 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -603,10 +603,11 @@ void vfio_device_put(struct vfio_device *device)
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
index e65137a708f185..69df8bcc49aaf4 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -80,6 +80,7 @@ void vfio_uninit_group_dev(struct vfio_device *device);
 int vfio_register_group_dev(struct vfio_device *device);
 void vfio_unregister_group_dev(struct vfio_device *device);
 extern struct vfio_device *vfio_device_get_from_dev(struct device *dev);
+bool vfio_device_try_get(struct vfio_device *device);
 extern void vfio_device_put(struct vfio_device *device);
 
 int vfio_assign_device_set(struct vfio_device *device, void *set_id);
-- 
2.33.0

