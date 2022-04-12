Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D6A4FE563
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF4210E6C3;
	Tue, 12 Apr 2022 15:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F01510E5AB;
 Tue, 12 Apr 2022 15:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mg4eDx9HY6YewhVJNyxx4DQjZXAmtkNrZPSiD0GFuvlfDrZvXMlAUnkLc7Tfg1N2ea7yjn0EAdPFksib0qejesD9u0VangWgaGzPpH1WPN6LP0MReC5wBONeiAogTHjyOdg2hFqPyCtNmwd5tJ8Lj8l72+1S13oOUGdmAYy4V32z3RXwCIVVS5MdmqYAwrps1qZ0+eoWozMFYHf1e2qm3yxXcHu3n/RQhZvIpPWvr7PLAoDhcG1RNa7Abm+8D9S23LbpHup5trkYNZmXPFzdmZHEa4ddstw9z//oQf/CfkbZTw8mlrvunaEqzRVmkhiu+evh4IA4ZFwokoHwaDwuVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81XbNUgtumQh6yJj34o05O/PNajhc+ES4mVJ0ZY78aQ=;
 b=OVYvs2CfbXcKL76YbpEMJox//ZK8YHBiUY5WTbSjrmI4dmgt/ievudTgh99WVVUB8yjRzH08RQowsQULtx9gu8gtYHDBGxQ1KyQ60EdoRd8RBoslmjDroW0TBNpWsb9t/W0RPJPco09FCYi+dGBMSB4HG5eXU5wA73L+Vof3Uhnpv6JM/0UtHG4GMSw1caHT95BFkKCUPqe2qUMX0hpAxQNNZdx7UApTPDt4b6S1fhKpJ9LhEaC9KUSyLVLsRPejnr/AiCCPOgUkaQrKzSKXKptU3RJOdY40/VCkh72m0w1+SyzKL5J7F6sWnq/yaZNElsL7sM9j3/XSeKn12u32Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81XbNUgtumQh6yJj34o05O/PNajhc+ES4mVJ0ZY78aQ=;
 b=jxX34NfrDeFU4RBJhvvvvG/n+zEUEw1kKNnRvVamcHxhrGDsuWDIJqI7C5xlcRVUyTmehS9vf+20xOZXcp81/a4Qhodc+ZgiDeKemOQ7lmgVsCI1TzaPkwXnXmge6nenKWXEEo+1EmEfeGGecFM1G28YoBbSQvFJGCWPFa86VRiXoOlw75avB7Zr9gXuEGIuZD2kxfUDwxykMS3NmPc8VsLXndR150cWSuZSBQvcPD62nXku4iq7OAVDEM/DDLgMUdk9u7ELhXk3tU5V6R/KpOJdaymH21CcrahUBoaT2POpXekSarKy6FmDBoN04cg13H7uSGDDqjq3Su8Etq3lmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 15:53:40 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::c911:71b5:78e6:3a38%8]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 15:53:40 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
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
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 6/9] drm/i915/gvt: Add missing module_put() in error unwind
Date: Tue, 12 Apr 2022 12:53:33 -0300
Message-Id: <6-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0156.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::11) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4954cd0-529f-44f9-cd70-08da1c9c9c35
X-MS-TrafficTypeDiagnostic: DM6PR12MB4172:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4172E6A9E542E7BAB0D34FEDC2ED9@DM6PR12MB4172.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zjYUw658ss6Grdjf9VqDxzXYrfg7CZBhdjF2/PJgDwBExZAxcCUaGnZ0nQht3eXRb+TOIina1yo0beEdVqNs0HMkroy4FNwgBW4H8guPGlGuRCndWu4Pgh0busVKh1buW8ow34+0CvyXrTcHHfw8LCisEANot/+PbTLU+Hm/cv7VncJwZDsmCu9cWCkm3E2gdln1sc6A37nwVyT4XTT0VGBpRtny42XlP0XPclvvhp4sRNrWbzbzbFj3vFpYKmvF92KWv9AxOf9DEhKroCXGyr3ULQpDDb/CttDPzcfj53VP3/YXeXfIH6g+XMKC96E7YTg294eO2yNRyrV0FNhqHxmRfOE1BagIbHQeqcUh0eAGVr37tfnFKdjnUnXqNycQ0AWothKEznHiXZSgDvr+Uy8mpSqAjgaBeLe30t7tqPTwEHWLpfBLGOiN7CCIdbbuxb4hVW4Vg6v0WWpdQmLS6nTDrimKzhBnZv/eFgwHQfPSLzHIp8wFdPTShudvKeXwzoSL9T8sUvzmJF0rT1zWcKxly5fnvwTeqmIDbIJ4L2vIfbQM4dXE6vVPoY45Dn/vNPW8bbbebSZ7gQQcH1jLEh4CmZnhjb1DeKILlKB7TDEhRhgOOGXUfYxLKYl7cN8QG/19CSb63jfGhFv2lP9C9AblH/ZcEiRSZiyOSl2Ii78xu9bB4aIA5nKJ1KHHI+wZCfnT7NZk15BWhlNwviv6qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6486002)(6506007)(6666004)(66946007)(66476007)(4326008)(66556008)(26005)(186003)(36756003)(83380400001)(8676002)(316002)(54906003)(86362001)(8936002)(6512007)(2616005)(921005)(110136005)(7416002)(5660300002)(38100700002)(4744005)(2906002)(7406005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j1zUVehbyTbfWu8XuvnAtqaC14Msy0Eg36tl3Ccf6Mj4jkScPvBAdpVRKucx?=
 =?us-ascii?Q?wC6m9Dz8MvnBGoH39s6rTZZheO39sSEPBspriu336tbYFCA2CVQRFdZDsLZC?=
 =?us-ascii?Q?bWa3K2LR59AS7d7OkGhdVZZc8GwL1IdLIc084h586SEmloM1ECYm+QLd/Pbh?=
 =?us-ascii?Q?pO5vVSCHYvpqE8jg8Sy1vKHnnvwqCz63zC9S4nR/bd+IAh7h0JkrPrxiCjGq?=
 =?us-ascii?Q?Bww/mn6BUChhZkhYiCRs1+3uGraX8wA05HpZFp9A4JJ2lr7+KwIpOR/16W6Z?=
 =?us-ascii?Q?Qc0Ii68Qc+ZawaWlIgL92l7/Sw4mT0RElgZFn4L6fUyg8bDtC3RV8N9LVGSJ?=
 =?us-ascii?Q?bEoSo68gaLsn+CtuZm+bPZDvjY7piXUyZrNqT3bjCVgItR08D1S6dtPgK+Pl?=
 =?us-ascii?Q?LPTU6oM6xtwZxmMDBAmp+UQqmlM/2Ij12DzKNYOMAq0K5MfYA2E5wECBjm5X?=
 =?us-ascii?Q?KGISZNR3fvaO0C+Cb7CE5f4YON1oxg6ySJKJnHXEXQjilixaXd1Dd2l6g0iE?=
 =?us-ascii?Q?/wVcwyes62sOzmnhlclYi+ZusrG2uDpswgHc9nQL9EtTSrbsQ7kSh8R0yUU2?=
 =?us-ascii?Q?VDN+I1dn9BLV0T3uVS51OVR6Y+AJIRoKCTt25Wt57XRh9f0E+umZuSoqUUSk?=
 =?us-ascii?Q?io7CJGWy8QEAlgWzR1jSFtJb4az5S0XnKCatGaWT+WjIbjaFoseZ+hNJFt/0?=
 =?us-ascii?Q?Pp4PghCRwY5yEp4XJlJrqqD8qfT3PyHzJhAm4dNnfKlSWa10DMnjBITb18pK?=
 =?us-ascii?Q?pVfeUjqJewGl51RpOCaOf2ejRwf4fDLgPBN+xCsZfqXpqpSUSWUYL++haVJN?=
 =?us-ascii?Q?HX1u9sFLuXqHNUr4orQaglNQ5YRQcsL+Tfp3C8RMSOlxqXXPuIhqwpiPrfCd?=
 =?us-ascii?Q?W06k/iAAvDqCegIzz5ZJ14B1tLeq5DHIKNxG1kF7VFgz3gOOORLfSy7/EG+9?=
 =?us-ascii?Q?Mh1GzrHV63QkGXhxaPWZvlaYbA092ma5Zzp4q+kCaNCEihft8Wl6dpDSwDaz?=
 =?us-ascii?Q?Je0dz+PgKnhpgi1KmhTCPp4YxmS0qYu94GyFcPk7bm08QCdx4nFvhZjDpVSl?=
 =?us-ascii?Q?tPMY1lPBl6fi94Ut1IcWkgOkoeH7ZHFY7rIcsoSY9Y06rF40IqNJ8H5XsifL?=
 =?us-ascii?Q?fx3cBIxl5LfBSWAoi+8gZh316YuPsqg8h6CahUkkjr4T0oHwm/kVNEctGZUw?=
 =?us-ascii?Q?B0lQEhRC4A2GRyE5qPBzSqr+bC/Wd10xqKo8Ic9Tc9Osjg1Hb5LE5A9yPnLz?=
 =?us-ascii?Q?MJhmUTtWQCWsIobUQZvG+DINn2mMwk4ICenyYAmmhNiRRpBRULIsGI/K2t/h?=
 =?us-ascii?Q?opPa6fpItqylQRwams0J9Xl5FTKI/bVSXgWyjZlBIJNCfP8Cd5KBu5MUT4Mh?=
 =?us-ascii?Q?qDJfC5Gr9Pj6c1eDM4OTkXyVMWMdz4olohnQVm5fHvCUTqx4GMWDDLSInivJ?=
 =?us-ascii?Q?YwzoDaYXI8cHMK30bQ0o82Nlz3tE2ycJO7CN+iC9Ekn3LdysjhMCOoj8jVzM?=
 =?us-ascii?Q?Ble5hx2Xp9lHXC5Aoyil0ih34mx5KG10mbDauAHI95HyQa1Dwn1ZzxWbQZqN?=
 =?us-ascii?Q?n6kWBDyKs4Rkpl9twYQLo1vGLT/V0BY72WgWA9yBV39Mgg8ToMXfxw2h3blJ?=
 =?us-ascii?Q?z9whlAnC/i1RQdiwX3HiwBeLrryPXXkecEh2ZwSkVjUBA4SP29RGhJxkyWW/?=
 =?us-ascii?Q?BQwKrRwtRF/48HM78MARpQW1ZfVEFcSMI7e9dPYG642YBr15o7berd49GP2S?=
 =?us-ascii?Q?PjVhBqh3tw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4954cd0-529f-44f9-cd70-08da1c9c9c35
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 15:53:38.9156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXRECZ8xJsY9rhSLT+ZmT5goehhIoKKnESV1tHLJ/6cJwrbI06pf5iRYDT02OuQG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4172
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

try_module_get() must be undone if kvmgt_guest_init() fails or we leak the
module reference count on the failure path since the close_device op is
never called in this case.

Fixes: 9bdb073464d6 ("drm/i915/gvt: Change KVMGT as self load module")
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 3302d5d4d92146..d7c22a2601f3ad 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -952,13 +952,16 @@ static int intel_vgpu_open_device(struct mdev_device *mdev)
 
 	ret = kvmgt_guest_init(mdev);
 	if (ret)
-		goto undo_group;
+		goto undo_module_get;
 
 	intel_gvt_ops->vgpu_activate(vgpu);
 
 	atomic_set(&vdev->released, 0);
 	return ret;
 
+undo_module_get:
+	module_put(THIS_MODULE);
+
 undo_group:
 	vfio_group_put_external_user(vdev->vfio_group);
 	vdev->vfio_group = NULL;
-- 
2.35.1

