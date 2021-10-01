Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164A41F3CD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45096EE95;
	Fri,  1 Oct 2021 17:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760656EE91;
 Fri,  1 Oct 2021 17:52:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8NfjF6lZu93qHmmNgx4tRumUUwvJpDWPrlMGvyGiJ6YHppD3dzF09c9UUrqU0+XOw+VLzdD88DLJB68ua4r/P5Qp+SR5W1HckNpnMzwQJbqjP4GYfIX7kfgvlc797hjjEIVMtIUb7YloJPy/VVaZ5yB3kabHn0CojFCTAR3e1pRH4bCBLyOuhsa0QPteZi/z6KKdALHn4Fb1C57ZhEf+52EuoJQqnB6zfBuivH4k2hQh3p3xNLcpeSE32QyhM1twtRRuqPDA9fw2b51k9dq2GsiGUSFNIoXSvIHX1yUTqJQWP4MzEs3QPdNYFSGBq5AJWRHxilUp0QqboVUbvaMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3h60LbB9T2bw+FmiqhpUTI2SUnXhU19LuBMGoKf83U=;
 b=KvnoNx1lLm3mquWP13tw0xqVdj96nvGNYcDaTJkpkEfgsY9bXzeXR1rglFGEHmIuWdz6Db/mFBoLXeUFpLfufMdqckDzdVXbJgPJp3Z5zloEgRIRidx1bt/XmJ2PTStQWh7vs0WaqEViF+WvaaYHw8TQhR6QcQiEm9RUIEiUFUwpdZ3WAq5RLKRh8h48sGEccofd0RTcpFoMAp7MIROi7FLiPOD6qQQHetD4z7wuuDedPO+CnttarrApttB8RiXP8fyWy8mDeP0nC5PhJ9aLQHvW9DhvaKMiRKs4bGUwwREwVbc8NjH3ksQZR8qtMGqN6nJKeZqc4DASjqGGG18Pxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3h60LbB9T2bw+FmiqhpUTI2SUnXhU19LuBMGoKf83U=;
 b=sohRkCQsthXoAP2kdZjxKl8Pm2tm4OOn+7fzd50dHD7TD72LOGYdGBJWOzv8p3icypjwY4Pb+vYgzgn66fwKtDIP70vyPAIi7fC5+XCKSwhoSvRUa3UN1Nj0vvWqqg95wTASQpxKDjYoGXU31QE9A+iRdYzSA254DY+y+aDNt9GpVEW+Vd64nn9j3R0LWf9NqTyCBAGculskhGFw5ah9s2DP618MmoWB3AUwywQLGDonZEga0shF/RJUAoc95pzxYpHmII8ttDhGxt3EODu9XZjuVTkt2o6qN7ePh7iALLKlhTgO0FzPSjzwV1gAbreepVNCTKvJ3S+1119jly+/9Q==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 17:52:53 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 17:52:53 +0000
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
Subject: [PATCH v3 01/10] vfio/ccw: Remove unneeded GFP_DMA
Date: Fri,  1 Oct 2021 14:52:42 -0300
Message-Id: <1-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
In-Reply-To: <0-v3-57c1502c62fd+2190-ccw_mdev_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0411.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::26) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0411.namprd13.prod.outlook.com (2603:10b6:208:2c2::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.7 via Frontend
 Transport; Fri, 1 Oct 2021 17:52:52 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mWMiK-009890-0L; Fri, 01 Oct 2021 14:52:52 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4df22c1-9842-4489-11c8-08d985044aa4
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB51260E0DA447F39616397950C2AB9@BL1PR12MB5126.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1mcHjGiHJ8JmWzJgqh63htCHRwPWm4tasgW7nWj0YAFftK/iDpLDI7ei6ZM+9qO4oAHcXTSr/TNuVSo4Qbh8Vf7mnJkBvQD1gl+scBEUCpc1i3a2FKgv7oog72JEudHl+1KulPbRff/A6XYI+YRMhvGYWuXhHzOivSOa85Rs0VYxpf1terqnarMj6JjR34Qvth0ID07ISiEZ/VaWwnAcEFT+7ikseSBjQRY23+TbMP2eS2MW6HPVlRvEo0+w7oRNSGhgIH4sS30j0sQuTBr5Vz9JX5X2MiPito9U1bubJynkxNGHGtTr1e6fenBbyidOT+upRyqUSOGm7jvWl1zoFcX35bz4Ne8HWyGyx8uoQIYQn+OUs6n3/X1zZoxtZL7mfKpkDkSg/YMmffZFfwYQ0QxTlX5/1BltgrrCoYUvv+4xDo4yo+7i8N+vPTPHQU9pw56NMFaONGdUGe2CpKb9UgZPeMK3dvmX92X4/6jcJInmDQCXoBIeIyYOWjf1Kp86S2Np4rniDhuL7wGVNQv0Qg1hAYjDPFysm9eMBIu7MFRjPjEynQ22CsHYSo0aTVp8yEwjQ35IxN97PbiVow7MoVTrFTFfTy4s4rYhRNp3xH7HAGQjtbI/QsopzaauY0xZAxHTZ/aev67k1D4qNqqSYHH/eP8PqQOI6saNAZz21CdGrf9MBs1irRZ96b4FsMhIU+AMyl4w4Vq9ZohC4Qp52SDolu0q9UsWvocgaYdASTE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(921005)(2616005)(26005)(83380400001)(6666004)(186003)(426003)(9746002)(2906002)(86362001)(9786002)(38100700002)(4326008)(36756003)(8676002)(66556008)(66946007)(110136005)(54906003)(316002)(7416002)(4744005)(5660300002)(8936002)(66476007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T1mqXLARw9nCuZeMG45C1g6tYW6zAxw0Edj52oYrAvWswcGR1dTWFPm0fJ5q?=
 =?us-ascii?Q?SlI/D3aEJEhg2Ai7qvCXhurULQsF/MUp+y2SFvV4HH1bwV9w+jFNeW3mIa63?=
 =?us-ascii?Q?COsFASpVZWiieiArf+wymAYLpjuUynFbPDh119b+xWSo4vdHtusIT0Trkxn5?=
 =?us-ascii?Q?4bfkPMpHyom5T2iZ7eS6gDGv4Clt8Xd3/fZVgUrDl+oRzvOwIllMuYkUyNzX?=
 =?us-ascii?Q?sIdKnEKXqBjy2pMprEy56NO0IroZ6GB6EMb8qL3ioKXEGEFHtV126i9lEFKi?=
 =?us-ascii?Q?jyfuyQ3EdKgDBpqRS9RQRMDR+v9sVkodGaRp+HgVgq/3XH7TZcZ8XCw8Vp48?=
 =?us-ascii?Q?gMK8GP9gqC+FkEnMqQcw0JNx9QLb87I5t2M+7bXyvppZEdPs0t2a6gYe4OOX?=
 =?us-ascii?Q?zy2ldE/niyB/T3g+S//n7JTlBxPzdoInNx9UN3LwpCkwn2LL5hGsUdM/7GVw?=
 =?us-ascii?Q?5I7sIGX9Kpy6A4PNfmDptaUIvzfXQy/Vp/cOhAW2AK6e3+c8ux20wLq66oWO?=
 =?us-ascii?Q?X9O9RZEWmG5ECggHQFXmacQN20w41JR5XnBVecEpV9AoltV9d6JjZWTcR127?=
 =?us-ascii?Q?rE0oe+DPL/wEbP3RUR7JK6UQ1W7R+no+O6c7sP5stc/kElOBLE8lMfMHjokN?=
 =?us-ascii?Q?hD3TaSHTQu5jzewmTPIb1sbwV7f2wwblk+bEEOuMPGVKbDmForOTVzJWPsHd?=
 =?us-ascii?Q?MpMCOX/BhjSameRtZI6qe8bavczzXEAhGAEDS50fS1EZDa7epDTi0N+9BYA6?=
 =?us-ascii?Q?GUB0NdZOV3QRZuYFrKDgtlXLQIXDMgJ4yYT64m5aDldHCoqQHpkZf5sr7ff+?=
 =?us-ascii?Q?7oMk5cAGdmU8yfJV8Nhr3RlpDo6ibrgjk2yPw/vkoQ9yisf7TrX0wVScjJim?=
 =?us-ascii?Q?ELYFJMCw4MsovaoA3NBxk330Q0JulE0CKXmeX2GgS14XNppL5NsU+YiT88CL?=
 =?us-ascii?Q?JwTymXh1WLwDXdxL2B+C56zl7IdLb5HsxN89KK6B/zzyyKtxk9/LGAO1Tx5/?=
 =?us-ascii?Q?H+Sz9BCgzHxvVu2uInBM/1lQ5ihYlJ6z/wjdh2RRjHkbSXzX0YF3mnKvjbLs?=
 =?us-ascii?Q?i8frogJUUex2ZNFUpuS4qF+ksVOjvs9wk/egqnEYiiX8lt9p10ic4EFvRIDJ?=
 =?us-ascii?Q?p+c+quNYbvKHBjjN1IfUAofHFOxGxohmaIzjdIzFisCBrPplfi9yP/Lh/HE0?=
 =?us-ascii?Q?EfMFke40Xm46f1Tt+HH0B44d32bpVPBw1c1mSGwbZX3iq/ws0lqAe4ITj05v?=
 =?us-ascii?Q?lqVz/kgPK124pD15C5RtMLokobz6zcwmoGixt1N4BZKA35oFPflEYtzpRQQV?=
 =?us-ascii?Q?mI+8hYTkQQ47EIhU8knF7lxwD16zOUfF5wjHk08IUltkcA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4df22c1-9842-4489-11c8-08d985044aa4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 17:52:53.0296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krAd+ZCZhpxQZgULtYYczwDhfiB0wDJH1Fb4X78bnQRNpAVRQ2fXCzq9hC1P04Cn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5126
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

Since the ccw_io_region was split out of the private the allocation no
longer needs the GFP_DMA. Remove it.

Reported-by: Christoph Hellwig <hch@infradead.org>
Fixes: c98e16b2fa12 ("s390/cio: Convert ccw_io_region to pointer")
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 76099bcb765b45..371558ec92045d 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -161,7 +161,7 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 		return -ENODEV;
 	}
 
-	private = kzalloc(sizeof(*private), GFP_KERNEL | GFP_DMA);
+	private = kzalloc(sizeof(*private), GFP_KERNEL);
 	if (!private)
 		return -ENOMEM;
 
-- 
2.33.0

