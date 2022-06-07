Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0966F53F2FF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 02:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3051124E7;
	Tue,  7 Jun 2022 00:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2052.outbound.protection.outlook.com [40.107.96.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D50510F732;
 Tue,  7 Jun 2022 00:34:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+Z54o0zdRsJZjATTuZKvBShyA+3ruwhK5nyCC9oGrk+/2gZjpcWmL8bvHWKiIBKfkMcEcmVCXIosB59c0eiieJkwg6QP3rg+2TgcnzZM/VMV6iT0G+x0NbZrIrFdK8Vejs6nLKeEofeceh+2WnRoM15bubcsKgyydDUmkDCTTMrmoNzIW3CK+bcF0uPF8c9CneN+/+cyBM9Sg8RZtpEz8pQ7qgni2/Vwgx4NEJgT4SUwLMNEgjHqEEf+kwgoNjuW+nAW4/HiESsvXsxrNo2APEFjbJO0dYoDdsVVbVt/692xAPhBbOgnrIVHXTMrTkzF83GqaZKQNDxBU+uAv6gzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQqEc6nM5xp+6xCi2Xyhw/OjF2OVsdqPbxK5t1gmAnU=;
 b=buyDZVY3jNSb7x2SOFHrRqOlNQqiDvKfOKyucPXw1u+AqRv0tPWKowlT5qwTd8OXqxe/2lx/HxMCZNp7aFxxij3olGRaCfgUVWktL/YcGhKdUqjAeTdJX5rmpMdQGpgu47mtCPfATdHT4LEwgycKytJtLn+w53plVD0HJFnWBSlYyBqqJiVcZdBMJYecPkYgoYBPmjqQd5bPJMLC6KXZTzLnKkP+LXSSaWQOEhiVKFf7JxMkZHcr/oNxFao+iGxDoQbgSoMa23FMEwIxzQonJU+lTnIsbli11TNRtW/RAL6CnWsGWvaQ0/NltWVcEXVvwaW4lO7Qt7HuoTOH8gAs2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQqEc6nM5xp+6xCi2Xyhw/OjF2OVsdqPbxK5t1gmAnU=;
 b=dM6Iod4EqXMaBs/WNm7SawKMzlprDb77D/bt2bM+bsbkp1/5FxzM1rLJnzM4MKUiilabtH47fLZytjSSFdiHy4Wjlw07E2E9GIPwIBU47Y5+xFW1fUXylCyIregDU2vK2S4eDKi5TykrdiEgNmIJ8CDoDchXE8AyAjI4EQ1R6X19a1K4y+pMxRBI3hU9sNDdJ7noKXoEgTkaabGwaM8klRz3GRvG6LzfLTWG5AgVLWuzTvipATDzC7YrN+jFAs0heudWmZsdr5//p696Md8thVWWxBJXQQzGBlnscuxE6y/OEqd803NjD6u0j8niqefWcd5YgIey6nAFHrTBOZ+Ofg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB3758.namprd12.prod.outlook.com (2603:10b6:208:169::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 00:34:37 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 00:34:37 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 0/2] Remove the VFIO_IOMMU_NOTIFY_DMA_UNMAP notifier
Date: Mon,  6 Jun 2022 21:34:34 -0300
Message-Id: <0-v1-896844109f36+a-vfio_unmap_notif_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR12CA0023.namprd12.prod.outlook.com
 (2603:10b6:208:a8::36) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21dc3d71-e826-4aef-4d65-08da481d8080
X-MS-TrafficTypeDiagnostic: MN2PR12MB3758:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3758A40D3EE2C58503A6EA8CC2A59@MN2PR12MB3758.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gP+Le57U62IRvKajsMbpU1palgqLlNTgJ2iebM8JGoQe/0MfvDBAUGALRjpqwHQkwzuJpDZu07juRZOVWBUO0qeatJ9xIt1GVwKNFIfdqrSPEvOGbUpu6OuauFI5OIbcGQcznfjACNYD8DgWnEGSyt2B/pWyybVsi7vThnwUaMtjvvvMWnUd+yJd6ow0nc5vg9BNu6KcdxKhZJlgw/YPpnAXr1f2yVoz5Ixn/UAFWGwlzgWH4kENJ0CJqlQiaqRZKzovINCDztqjUCYam8TBgLkDx71Rq2sJSVCs06PDQZOA0gVfp++4mG3PbkPg1j1qt+R94Z/a8x0Y6/4geeXuSFAsLTviMhAqcyjGhVFI87g8lfpUn5en1BSMyIaggPDdMonHa5dOt9nJqQKybw9Dl3LYWbx5U7v9IkfwOiFKEjQiWemTQWu9OpCRb2Q+xKWV6zsAFGyIHkfTn2v/JpzLJF4znvwQN1oNfS5GYSwIw/vvxYqH1H5SlFO5vW+LChLoVp/xutVS9HmrK5y3owsR8i5bxElvN847UfszSSCOIxGRc51yjVCgRwJirQIZ5JeE14xQJMpK5EWGXI9U25TI5fnSufxNBl+HSqE36uZOI5fZ49kNpMF9hgylOFu2L8hOW5IDlap/UwiuWgATFSjzwdRfB5im+Ob/8gc3uGkUJtUpqPi+eqTu7svDzChuWkwO9W0QJAHOAGfOoDmLmQK8fQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(66476007)(38100700002)(66946007)(86362001)(6666004)(6486002)(4326008)(4744005)(8676002)(7416002)(2616005)(186003)(8936002)(36756003)(2906002)(5660300002)(66556008)(508600001)(83380400001)(6512007)(110136005)(316002)(26005)(921005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q18sCw3AGsm9bbawIyaS7crP1H8ZecjVPc+/8kzSE4eX+rl9ID9aChTZpgRo?=
 =?us-ascii?Q?2Fo40I67mAytGRHVJkZ7dbHBAp2EbbXinADaSbpag+znl5e/ZC8eNriGkcfT?=
 =?us-ascii?Q?/xr26JGMz75Nt1IYzJ6GfaFuATdEGDPJsgxd6/rnuKoqGEJza6JdhxCd4aCJ?=
 =?us-ascii?Q?5N9glJ+GVnir4DkUnxC4xDhYt5xTa2Cfwm0gF71l2rN8j4B/kmXWueN8F9J1?=
 =?us-ascii?Q?j9U6sOfkst55wk5kpiUnDF24ecfDuM2RzdhA/sXCd2VDrcjWz8V1KgOIBBJW?=
 =?us-ascii?Q?u+yYKMjgrW3tfaQ7Oo2uce9py+AwVLWapD7b5M9vapHF9ERksefYLXCLsHrI?=
 =?us-ascii?Q?5YcV4m/LtbInA+cbZWPYPFRxaX/Ea+EDIs/BUStODj5Z/G5+v0FJneoqH+TO?=
 =?us-ascii?Q?M7KmPKKuGLdWphDRMYdNOedp1ON9hJogAlSmhScQi2pcUzxne93FAGgZbP4q?=
 =?us-ascii?Q?P1bCyZsNwjom3uWrql3NVmg4wRWxMYECqYS1ulDrOUNN0vEjgZ0DsY3CZQQE?=
 =?us-ascii?Q?poaw/tEa9+OrTqaO2PhthNjDBZpmzCufrZvYMOlZj7UrxItbWe+7lXLLkRyy?=
 =?us-ascii?Q?ss1xnN5QwzxZrcU9+2LZpnDeu81I6YjlSd9/7PlEznzX5aCSJb8DUdrwQ34n?=
 =?us-ascii?Q?xhJCJ/YgUIMxUo7J05cLtKOXxj9yvKObEmtl3HPDxkpRMi2SnoSa9QfrQT4N?=
 =?us-ascii?Q?/dmZtzuKcjiPkZ77WpwdCvqPQZAhnVKMgQjU9lpjgB8AbV/XQmhbQgKU+tEK?=
 =?us-ascii?Q?myjNGoW2g++I8f9X5yedUF9fWJhpBEbTzP7cd4BXqKm2kz8ghJhBLoTuNmGX?=
 =?us-ascii?Q?Psz6g82tIHmKXNyjdRUqV/bQ+3hx9ALXQTHIolIoFqbDgGkHC9Xz31Y1Sgs8?=
 =?us-ascii?Q?HpGYoNzgelBzNYB/UEF0D5iMTjfOJ1Q4Z2Ptmj8BaIxz8a2Km0OrSDLV4lwz?=
 =?us-ascii?Q?qVIYyC2y4Z3YsAqUUxAO82FitywkcjW7zfRzsT/czWwAQudeTEwjYqWmofSN?=
 =?us-ascii?Q?TRBw/B3HSjerbujOlPCrpSXwy1SFymq9Lyyk1BD4RVLOlpX0aCB/J02mAU6z?=
 =?us-ascii?Q?a6KXsS158x3mn2wf/DRxKe6PPpCgzHK3vorMgdE26ujCeOwQaiyWgI9eIi6h?=
 =?us-ascii?Q?IEJSUQa9RD4ennwc7vVqsvwX4D9IPLoNW+l/YXtCMxj2OT21nQ+D9tjXlCfm?=
 =?us-ascii?Q?k2VIWMkeP6cgPvClAyPdp/RMLlpBi1DGQmj+kuXEv5XT4E0I9tFYT1ahJ4CP?=
 =?us-ascii?Q?h9mgZd2wD470jSwVWGqLrvCXqeDKXHw5DIu9lR8NYZoknbW5NwVx7zs7KP12?=
 =?us-ascii?Q?9i/JqnW3cYgiAU+2sHXiwsUTuTif48SbAiRC9pBaFb0f9WRXQvxE76pjNIe3?=
 =?us-ascii?Q?oLJLJMuHk/2aavyxwSwdVLO5/vX5yozG341hLWMyVGGtfGWA/ByR48SoZu5t?=
 =?us-ascii?Q?c4DVvIxGrk3GyiWWbIJyO2M8rh55rlQA4CuaR/OOffA6c5hdEdsYd7iYlKz8?=
 =?us-ascii?Q?Yg6XeuWRNiQlH2SMWEOrBR4yeuXkqpZzCxRvjKZ8OJZIinZLthvy8AaK4Odt?=
 =?us-ascii?Q?VTUwNSg7eBPES4vjuzx5iFgwwdV6w06aM3j7QkoS7idvboHjdpM+zsP5Gewg?=
 =?us-ascii?Q?meQXR8RsEsAGQ81s2ukcZ4y9HKcebKs8Cr7423M6dMEi5fvILg108WcxvPns?=
 =?us-ascii?Q?ZStzejBFGoegLtUPbH/4RFFJR76hb9dDZ93lz+5ARs9KoO+sLoaKjVRanGbh?=
 =?us-ascii?Q?GNQOmI1c/w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21dc3d71-e826-4aef-4d65-08da481d8080
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 00:34:37.5664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xinQoV0f/caouJ4hoZgw7/MEBpnfrrVsnbuqBIGYmxUCzLVTGPXEmRIrXWQrOfop
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3758
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
Cc: Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the last notifier toward the drivers, replace it with a simple op
callback in the vfio_device_ops.

Jason Gunthorpe (2):
  vfio: Replace the DMA unmapping notifier with a callback
  vfio: Replace the iommu notifier with a device list

 drivers/gpu/drm/i915/gvt/gvt.h        |   1 -
 drivers/gpu/drm/i915/gvt/kvmgt.c      |  75 +++++-------------
 drivers/s390/cio/vfio_ccw_ops.c       |  41 +++-------
 drivers/s390/cio/vfio_ccw_private.h   |   1 -
 drivers/s390/crypto/vfio_ap_ops.c     |  54 +++----------
 drivers/s390/crypto/vfio_ap_private.h |   3 -
 drivers/vfio/vfio.c                   | 105 +++++---------------------
 drivers/vfio/vfio.h                   |   9 +--
 drivers/vfio/vfio_iommu_type1.c       |  74 ++++++++++--------
 include/linux/vfio.h                  |  21 +-----
 10 files changed, 114 insertions(+), 270 deletions(-)


base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

