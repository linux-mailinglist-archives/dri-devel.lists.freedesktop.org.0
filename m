Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F24D3D00A3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2D36E504;
	Tue, 20 Jul 2021 17:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914806E4F1;
 Tue, 20 Jul 2021 17:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6kAswu4MUX+Wd/xorIWxrmVRNn1gpWBgjJfVdGTXjLOeFDB30Z/ZMjJqGAe5oB2zZbqz1C8VY1E8CKPPtB5Aj7gynRe2O3/mIJbAFMZfe3m5jBJdbdllllMmsbGg7eoFEm5gdGOyStZ2fzsApLWvK5/A6MTfPqn4KlmJoLem2HGWuDm+bfqJEE6SOPf027JuzunZULBlwhlEz3eNNelOAq8Tc36yRypof6ElKKEQuDr1OhOP3y0Z4nmyWL+2CwR+d1dZSllIViPKAqvn6eA1oSmBKDCRYBczGvi6MD/XVvI4lFINxSfcB4qcNDDKQaYSi4fgbvUk+gHtJ6L9X69Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqlHfJixjAwv+9i3I7/fKkhdHEPsaBue8euAImr4B6k=;
 b=hUySbq4PgunKd7A21/6YcAQ/09SJWOz0RUm+Dt6FQzJhz90cba+Y66qydwGoudVLEJBgkJE4l3UuFiEmsFm/04MNGXnDfth2ViDowvxQnzcivxAQScLduMwY4JIFB9zk2mFdHoERcWKmhxVvLA8PBcEurN/7OfzdG2rUPGd7VFSCKALgWeFdqjWdYE1DWuxIcqSAj80xpqb4yGeld05B8AU8c0cX1Pe1IZ8jfLUurlRg4yO4KLaX7w2gy1shqACP6zl+3BKnYleoIVxW6sG5fnIrsSIWMeQ8FBA8qc2m7UgcrYbKDIoSg9zVjPmXejlN+9UOnDqB9jlMBbXnTqqZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqlHfJixjAwv+9i3I7/fKkhdHEPsaBue8euAImr4B6k=;
 b=Qpn+EkM49lYjG4zqpN8RyS4SHunSaLw8LCbnLrnS80kPmaxB0o1UglIpuVCMKrUvvJ8rIOAqfLLf44GKmgp80zxcTJrUPSduDu6Kf2ipU/sRzf4yiDSEfbe/HZuMcex5qb6n6hHxCKAC1Y+wcsdz8c5vvAkvUjVzrkj/etiOYkwzR0yY9cYOkuWbZrnXaCGaf2NNg4wfaLtqdjH3o7Gm1gPxlqwPkJdKJU9XxgFN91Vxpo0AWX5HHy19hbv7Elnfqw/ImnbUKXENngn9px+S9rjzi39HUgyUNkus9R6tgk3ezjZCeqG5MdqiEmIORCseikT0yb61CSD+iD5xZQWF+Q==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 17:43:07 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:43:07 +0000
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
Subject: [PATCH v2 11/14] vfio/mbochs: Fix close when multiple device FDs are
 open
Date: Tue, 20 Jul 2021 14:42:57 -0300
Message-Id: <11-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0025.namprd22.prod.outlook.com
 (2603:10b6:208:238::30) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR22CA0025.namprd22.prod.outlook.com (2603:10b6:208:238::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 17:43:04 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051FC-NF; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fa7b960-9b36-4501-11e5-08d94ba5d38b
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5288A565477C1F875EB30E35C2E29@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xMBwSJNwIigG2nxEJr3beFLKcsrJ2dwDFR+Y/YQM9+P/jwwQMcuw3XJtJQ8KStlKbLkIDZfE46YuL5Oto68yuzoVeA8sxm3uQygXKZSmrL61DtUg9CKeG7A9TuU/6tvlCoV0lwgkaaAQ/TsvxDdxLvd8bLuihbreKWA5JWu5tcR81p2PLqhyQLvz04ANA3h6bzVedCSUvEkHV4ZVQ+LQhNN7P4w9cxrftnPj2J2AOhYSIAlOcBxhvqjZHtcS/GxYYvunfigsvrC3STcN2Imle9O4DPrbq4stTjy+AGR8TC59NSkwI5vYnRDffXXfE7DONoY3NVaDOhEoNC5TXNHQOpyelqjCVNYZb/2xMHiUZZhWFaE3w95mLNC3sMkuoZU1F/BZ3aQRllViNFJ+j4Nu4D8lcKIEFNgmYkFRggNIDgRkjkrxuBIRcbbZi5xm7vHYdkK07Ngaqq/gacuYboqWqXuXUcUlaV8j+Y+wCEA+8msZv36lGp/zHFuE2DM2+7AOaJFyfmeiWXfcZOyQ/H2GH//qyAflAQr7hiEMh2TfyUjTu5mBANAWPWDfu1/v80ue6uzkaHOtmXZ+fFALZLGbGInpW6zRqdjG15pCQPuMdtZxvnrIAz/83Ve6kC5XVrcQkzbtHMDY5KmU0CdRbkL9BReRBaHK/NfZorrOzOPfl/TZI4orvkjbu6NQQKGn1L8n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(6666004)(66946007)(7416002)(7406005)(86362001)(2906002)(66476007)(54906003)(38100700002)(83380400001)(8936002)(316002)(110136005)(478600001)(36756003)(66556008)(186003)(26005)(5660300002)(8676002)(921005)(9786002)(9746002)(4326008)(426003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WHJ/qiQBkql94CkecpfFftVx41Ks4EWRtDjXYYzelOe+EfG+DRwTsBpLzgd0?=
 =?us-ascii?Q?FS2XTqRMRUE40QLfgCyFATu9huuh+UrrS7uu4oEmHhTH8taXROc+gPAD5waw?=
 =?us-ascii?Q?+5d+E4z6cTh8WiORzlTRjD8pT4lxUyurfD4Fh/7nwRsDJg0Y1hlPd+g8mt7w?=
 =?us-ascii?Q?U6X4KV6diAyeo7foBVX/FOx53dEpXeFsMWAa0PgjN2vGwZPwXJBsmIZP0UTb?=
 =?us-ascii?Q?po4667/5HQ04wyYv1zm3w4wpfUbiTcvWoW/GsYznU4bOSj95EOSOlXk2JmUN?=
 =?us-ascii?Q?2uB4OnbUPdxo91vLeSbJAMPFdYA5JGvWyPLpx5jc46QpVfPlzkoMed+syKkO?=
 =?us-ascii?Q?YmKVC5F7k5PbMwxGfi8e0qjgYCxf7A6GBDpxiwaATeJlL7Sk6ceg4mmR5Aas?=
 =?us-ascii?Q?SjAlhbyyU0vDyQQOsRYTw8gbj5gdZCPJtNUKxF7uIpduGWG7oBhbefT+iODv?=
 =?us-ascii?Q?p7fxFuaR4eW0lr/o7on1+e3JjgOlaPu37BHHCtyGSSMofRoE/WQLi/Q5coq3?=
 =?us-ascii?Q?+VZ4PZlDjow6luIbGRF/XDipasL+rS6GVRKRQq7poCAMQb3HCn2LqndhHyQ6?=
 =?us-ascii?Q?Iq4vim5R2NIcTGf6EZtZOJ7kkSMTgQMIEkFh4r5Z4iX5Wrhe0Ue+i+n718mk?=
 =?us-ascii?Q?Dk8Z0OjSk86i3Es1LjuypnSrKVicPW9IPse3T5NMRbMO4Ya2mHmqmHiIYfM8?=
 =?us-ascii?Q?tjXI4LKoQ929YWDD+nJmxHQlmKXJSdNMJYRyCJCuo+OkOE9KF1u8oy2kdtRd?=
 =?us-ascii?Q?pYgsain8HztLpIcwb5dvTHAB/C7fwztF4R5lUurPGbUNB3NlYYSS3RMXHr1J?=
 =?us-ascii?Q?ESpy7rx5vltFr3kKGC0Z9TWFvdRj1q+IsEkIRvYt8JK2yy2TDeUqcvgB2C52?=
 =?us-ascii?Q?thPO+mi0hGE6+skptAKvkUeFpPPEXHaMhSba7lYsuB3SaKEcxN0xTfbdTHBY?=
 =?us-ascii?Q?ONbbI5ZPoet9Or9SsPqQjbeDohji1ZqIHKHr/u/rTXnyt5nZ3Eo/b0lMmals?=
 =?us-ascii?Q?CMWsy7xzqKAEEOzbz7VstYG9LpFPCO93midUu1gWg17JYU2EctPCFWKsg8Ll?=
 =?us-ascii?Q?P+3NKfsY56EWwPkDcilpuGbOXyQas1jwfFuM9BEJaccd3KOmWaEg2PNF2rqn?=
 =?us-ascii?Q?+1YWuxAPlvB4aejkY4dNM/Kf5R73u00OFq0Qv70lgJnxRJIqI1EptsF42tcy?=
 =?us-ascii?Q?5JKArZmk/9plx1C7z1yNxyn/cjnGeokgkMgxD4GBLlQ2Qt652wjikQd/zAnJ?=
 =?us-ascii?Q?fcGHlNoO4mZk8jeVfZwEjk0hDUBVoSJacGw3w1caffUMHt3UDWJ1JmGeHzlK?=
 =?us-ascii?Q?DWGb18Qm15a0uYf7bXa2nqsL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa7b960-9b36-4501-11e5-08d94ba5d38b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:04.2699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyxxAfxqkdQuPinYKu5XEpNeBOggpyTE+ZLIYMb5cGny/pGuEzqAM/lhv2K2CwF3
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

mbochs_close() iterates over global device state and frees it. Currently
this is done every time a device FD is closed, but if multiple device FDs
are open this could corrupt other still active FDs.

Change this to use close_device() so it only runs on the last close.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index fb81d11029e8a5..39002b07e692ac 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1277,7 +1277,7 @@ static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 	return -ENOTTY;
 }
 
-static void mbochs_close(struct vfio_device *vdev)
+static void mbochs_close_device(struct vfio_device *vdev)
 {
 	struct mdev_state *mdev_state =
 		container_of(vdev, struct mdev_state, vdev);
@@ -1395,7 +1395,7 @@ static struct attribute_group *mdev_type_groups[] = {
 };
 
 static const struct vfio_device_ops mbochs_dev_ops = {
-	.release = mbochs_close,
+	.close_device = mbochs_close_device,
 	.read = mbochs_read,
 	.write = mbochs_write,
 	.ioctl = mbochs_ioctl,
-- 
2.32.0

