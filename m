Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56EE500FE7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 16:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8C910FEA8;
	Thu, 14 Apr 2022 14:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2088.outbound.protection.outlook.com [40.107.212.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5FF10FE0E;
 Thu, 14 Apr 2022 14:22:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9HF1QSrQrAWvK1rbDFden1Lvtni6a40IHGbIBnNM72TSQr23ZhAsHKYM+gRbPI9s48N3mnVZFgirMJ4rqRkthPAdKeLg1rNGRmADfVA2LHfGz8LQrPIN6yVHY5Igq09rYznNNnNl7GZaVYUZQnLqXjPVLW3tX//McXxUR1/YNkEduLWFi6iVlvyC+/YtbMRfDd90ngANQCR1BETMMLOLjUSEqk1kuwUslWYkzqIkWehgWu2UBR1uNkTKK9cdO6mJaOU1nCSAxK3XPg4esvDmgLnjxI4UYCX/PVIZiNHEiv9mrB2QdgeoBkKJJ9XlSudLMmdD/dQug2NT5ApQBzKOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBtE58AiItvf5ISGf18XoZaN7Sl1IptLNoQwwc15Y1Q=;
 b=UaOkqtKzId+N4jO3keSpmZKrN2pHtRWvy1uXcO057OcVqgyNLZlzRXky1T5MHV+Oe4gL5PwL3anHo1OOucT2EUHltMKj5XorTjIg7+V7v9tSbUzBjfN47jsHz5+Trg8+dPRsCpG2bBDFqxyPZJcPa3oUaaLC5I/hSGaWlFTS4swGHCe0VPjLVqBDe6zh6mvOlnIw3rG373YjQXQGIezA/NLT0AVCWXFhLxoHhtHTA3uYtLyFDnD8n/JC9Avn6DJa2hH06dijkwnQBofTfIeo22/CGhs5w85rWVL/IMD3p6pKuzqk8Zz27AXGKJYzDf8L/r/kowpQioy+MqsrN8j1wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBtE58AiItvf5ISGf18XoZaN7Sl1IptLNoQwwc15Y1Q=;
 b=d1ttDyT0Drxzd1MhBKxTzbxlPc/n6zUCe9Y5/gpaCtAcGlPDKPQuU4DQYBzp0+umt2pL9LT6Vr+xHTFfj4cMfGfmweuLg6vyR+3S0ooJoYQao4PlsrNhtFH5s2UShzxln5t7uWGDlG+8xkRpyRbJZSAmWqUK/+R1yf3EBEwmgqCL8vZ9pTpMwuPTJ6V2dZJZBcs2aKX/2Fd3DypGMmneXDNZrBxdppvzCwns6prdJX18qc5EX5HwsHBwcuIoh+wRL+/OkAu+ztUoncyEC1gmxKWSwqkiFmPv34On4P0lZbVFEjsBx7ouuf4turknfLE6J0VUAKnx169AkhpZEKUVNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB3963.namprd12.prod.outlook.com (2603:10b6:5:1cd::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 14:22:12 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 14:22:11 +0000
Date: Thu, 14 Apr 2022 11:22:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH 9/9] vfio: Remove calls to vfio_group_add_container_user()
Message-ID: <20220414142210.GE2120790@nvidia.com>
References: <9-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <d6e2778a-01e4-6468-2c2b-3b718d924e65@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6e2778a-01e4-6468-2c2b-3b718d924e65@linux.ibm.com>
X-ClientProxiedBy: BL1PR13CA0299.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::34) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0e7c7ef-4c73-4f2f-1251-08da1e222a6e
X-MS-TrafficTypeDiagnostic: DM6PR12MB3963:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB39632998BA9FAC233FBBB78BC2EF9@DM6PR12MB3963.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NnSw3xtuxx8zY/pZfbCsgJ3JQylsmvmaVKrLBj8Wf1lBKiNd7S8hjR5CJXK7D7oUgrm11wb+ta4Fji0GOfjrYoc16Y1rlC5OoY1fyIugpXl+cH9V4y4Y4u3XpNJ7GYUroTYr7l7gdRt8BEUX3XVTGgrOB7jD9jlOizrSTyAfx1YPXJka+4FFDVZhakobWrY+LWf3weLpPT8eyAcVzapDdpTtAMTFpeMGNAX0QKeJNS8Y5UB7pD9FGodkEvbkgsKHpKidkOv3Aa73MFwUcNHh4jV5tMKXN1Kuzb/NeR5dP9RoIqSKbzsJoh4hb47O3l/ABo4FligPcl3vvZWU8uEA4HEiLAYaGP39wD+PZUhBjTWk8lk432P2wHduhTk+HVC9dj0noiWkFh/kVByeP+wpE0URchHbAzxqS3mUyT7cb9SFGITxjJx0PTc1PfSPZ4e8fVzihi4b5Cin6OERoB1syYo3qlZRvzd6ndQbgk4VMMQGRp965RobDQNjDyvT8baE0C8fXzgtA2BVpRJdXVC+nXQMbFpmBVA2j8Xz5PjJBUgbDqnYLVHwoxhw5gYo5PdbkFvqWxuEkD64r1lNKUy0DooXBrLSn77dLnT+l7mtNArcyLVTsO34pVTVAfzoFNk2Z814J2oNxyBxSs0j8fHXCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(1076003)(316002)(6486002)(53546011)(8936002)(7406005)(38100700002)(86362001)(36756003)(33656002)(508600001)(6916009)(54906003)(2616005)(26005)(186003)(66556008)(66476007)(66946007)(8676002)(83380400001)(6512007)(6506007)(2906002)(5660300002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cY5TA5GkdVCLfMfxCsGcU/B1frm/RvN2VD8lNlHBaYiKTVnzyeoQ6ymjgEUj?=
 =?us-ascii?Q?FfaaZ2Vg9tlceok7vOJs4nG7b1gokZusD2LL+vOxk1yfQzU/bJAmMmpA+z1K?=
 =?us-ascii?Q?Cpko/f829HeRqYAWg9DWI74+mzld9f8jzwk1hvkvTRXyb5tUVU3SnZQfZKr1?=
 =?us-ascii?Q?vJLVG4YEr1noCnYaFWiwKLZAggQynKKBq8ixUBKkOvNU/26VMjJ0lw2s7yJ5?=
 =?us-ascii?Q?PqKrrEidPyR+SmnNRr/ydrv9Djo56sHXCXY9NTHipyowSzO5n1QM6I9GQF9G?=
 =?us-ascii?Q?cWKthPV43tvApYGTX9wkpcNSQBSGrrIubkfnRGa5Q8hnpXw8dkWr7N2scYVW?=
 =?us-ascii?Q?qWbPnh91ODU4StwY5L3/a53Lz2G0HD40dwfWWxUnRVe5xXmWra1yvW3zpZoJ?=
 =?us-ascii?Q?W1zllVj7ddzXEvSdHopL+YGyPix8LQp0UrEjh8obt62m1+6L1kVrW6OYEBbc?=
 =?us-ascii?Q?pAhqad7909QrwpzpgIzIIVyCGRxMPiPV3RDWnkflwL8vpBSSNuO4eJnsD2zE?=
 =?us-ascii?Q?NDMom4nfPtEAzVEr9g6D/YdPjgIpN/6Kl2elKnqOJ4L+2Na4brTRJ/fAf5u2?=
 =?us-ascii?Q?lW4CUGjUL6ET6pO7RvyuAiRLAvkU2+m0ikEJgjT7D9n+6dbWFlMyeZ66tUnF?=
 =?us-ascii?Q?z4R3n2OeMnBYub8Wcnh6JxNjUzprTANASTNO/6Sp+M7S5jtzLWgbJ8iekuNQ?=
 =?us-ascii?Q?QnGrregbcQ+4TWALXyt/5MGY8JopN90Cnzsq+cmccwGC23y6dAGt/Xo2Lvlu?=
 =?us-ascii?Q?k+48qRfffy72C8jDngg5f2k4qUA110xIpONneFMq1EJlUr2UrW1TUHV7jJ1k?=
 =?us-ascii?Q?pNccxqLjD2eXL6Aq+KrDmsHzg2fb4iSmgaeejZzu9/GFKkjO2x8MuSPxefjt?=
 =?us-ascii?Q?WJxdqzsLV5pVb0b5ptTVqN8ksBzXUtiQJs5kXg2SuY29Vq4lKsoBThVmFv91?=
 =?us-ascii?Q?HbFPQnSz91bStZJk07mgxEaKfoRTs6gZ3kpIzEsZVH8+CqV7x+2oWahrOq8+?=
 =?us-ascii?Q?Q/djHk7rTyMmz7v5vUjI8YSjgSUstJXwfxtROm1kMP5K1qW6NEuqVtBnDr9x?=
 =?us-ascii?Q?VfRRc9CZxID0l9etJp7SW3qU2zXgW3DWgLWFbqsCef1fb2Yz9onAvWMwmCnF?=
 =?us-ascii?Q?SOw/SFy5Ci2hRqgMLuMa7mUey2j0/8sv2tPK0jUMN+rawxfpXygvcW3IYVwn?=
 =?us-ascii?Q?v9ND56/9cvXVzkmHzWTWWwrzj7njAL3ek0UHSoodWiqUyfwBxj/tm1Pvnzl4?=
 =?us-ascii?Q?K+7aNWPc5gLquxkfoibAcMHK7Bpc0mVPu7t5Ejm4px9a7OyLxAGm15IUKPGr?=
 =?us-ascii?Q?qvlR0JAxi17rrUf3D42a847uFenqYnf4Rs5r+Mc8WyU8z/sPY1+CtjfBwJhm?=
 =?us-ascii?Q?nqLfGVcNrvXLFuJXqo8cTEJb5oCRadCd94f6T/D8vVvqqUH/VA+wChIkdNXn?=
 =?us-ascii?Q?tNSAodo7U6D9tBzPihiby+ybNwAAswfsUak/LKbwn/VwZJy+1QxQpxfJyhfK?=
 =?us-ascii?Q?+8fjqZkeILBP5XE2kBFwldlQlUONZFFm/Bn7J0KSeUm2b+jBL1bQ2SmaqANc?=
 =?us-ascii?Q?uVBhhPlIzcj6C/NnyTecAATVUlc+fydV7UpAcQbMDpqUsg5Gt0n1ftqcF/0H?=
 =?us-ascii?Q?2BAvtfzwCkCBcvZytQomX7UtxQGdjg+NsLOr/u2LykvKEX+2+k7ydNpueeDM?=
 =?us-ascii?Q?KRKrKirq1eNQHUva+kCLevbTJ0f6h33fOoAGHHb3lMoF522csCmkVsagUogO?=
 =?us-ascii?Q?VFzJiqLoSg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e7c7ef-4c73-4f2f-1251-08da1e222a6e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 14:22:11.7174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNfsiYsQbosfbbxGrSgR1kP5TETWqFyozEONrarC5wk80wbixkT6z7n7qgguR4zC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3963
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "Tian, Kevin" <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Liu, Yi L" <yi.l.liu@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 09:51:49AM -0400, Matthew Rosato wrote:
> On 4/12/22 11:53 AM, Jason Gunthorpe wrote:
> > When the open_device() op is called the container_users is incremented and
> > held incremented until close_device(). Thus, so long as drivers call
> > functions within their open_device()/close_device() region they do not
> > need to worry about the container_users.
> > 
> > These functions can all only be called between
> > open_device()/close_device():
> > 
> >    vfio_pin_pages()
> >    vfio_unpin_pages()
> >    vfio_dma_rw()
> >    vfio_register_notifier()
> >    vfio_unregister_notifier()
> > 
> > So eliminate the calls to vfio_group_add_container_user() and add a simple
> > WARN_ON to detect mis-use by drivers.
> > 
> 
> vfio_device_fops_release decrements dev->open_count immediately before
> calling dev->ops->close_device, which means we could enter close_device with
> a dev_count of 0.
> 
> Maybe vfio_device_fops_release should handle the same way as
> vfio_group_get_device_fd?
> 
> 	if (device->open_count == 1 && device->ops->close_device)
> 		device->ops->close_device(device);
> 	device->open_count--;

Yes, thanks alot! I have nothing to test these flows on...

It matches the ordering in the only other place to call close_device.

I folded this into the patch:

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 0f735f9f206002..29761f0cf0a227 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1551,8 +1551,9 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
 
 	mutex_lock(&device->dev_set->lock);
 	vfio_assert_device_open(device);
-	if (!--device->open_count && device->ops->close_device)
+	if (device->open_count == 1 && device->ops->close_device)
 		device->ops->close_device(device);
+	device->open_count--;
 	mutex_unlock(&device->dev_set->lock);
 
 	module_put(device->dev->driver->owner);

Jason
