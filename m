Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C98F25A727A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 02:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB59410E411;
	Wed, 31 Aug 2022 00:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2073.outbound.protection.outlook.com [40.107.96.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2514D10E411;
 Wed, 31 Aug 2022 00:34:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPwSGbC5+C0Nl1OFjvFm+iznuEzevKytxzSbXYjPFrilLhEb3fNUKY1HReoV8URyYHZmFeJovoWeTjFdIQNyGzd8Ax/ZSyppX3rkQcBo98+cKYm3uk4Z7QEd378NsYqicHteJuTfsr9bAaPy4Ovtpf/+jltptlJ9VgYS8HW1HpaS1aHt2RNDusiNiEstSd6hzwaA9vn5mAQBcvRxZe1YPHC5NB7vOa+HsD6US9MDYAKNK7aaN5tILGhoU8jrst8eEVoPH0tCfASeOeRznrumL1uXOeVV3+sc2vtwsrZ2TS0bQzDPKS4sdES2KxsX7a6DErXRUAzIcWcRONhzCimSaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZmeRXQKbrF32qEGJFMopvORf03gQ1T2bl4FJjflUGc=;
 b=gQTITlSDxv8mPKKA2086A9+rMhcN8qgAVbAvUP+GCE/wjMoyVBbgx2/HFGg7Z1SqFThtUiTzPs7KC5YOnwjrZWG48Kqyq0djDGSBD/xHp4QCRByNIuoOs9DB+jq4FkhB8U95QYQajqDPNDWxOeTczEDxPP8uaHqXlyrzs186L6McryENxujHj1KpSuayiVZo264BywjFHSx3tTFiAminAtT55eFGR3LDnjmWboStqEV3gbUue16dTio8IHuqJ/XDN5D4Yqa1N3XqPL9XUqpyNPLfV2lI14vz94CDMeGpMcjhhUpePYnPFGV3pexq0SgUvVD74uUxQuMADs21YNhPzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZmeRXQKbrF32qEGJFMopvORf03gQ1T2bl4FJjflUGc=;
 b=dlvBOHDaWwjGKG/IyQK8sb/EXADJOeXHWnmldQJWI86luYpvptsifOryZ12LajfILbT1/G8KJHJj2+YwDdxsyPosnrYRe4P/Wwo/FeI+g8JsQVbmhNZFhR2aGU9y2Tux/Y5x8PlnH+h3RhcChZCS7f4RuSExslouu3ZOgdYTZKvWq6bcsbZ/C25sQwD/nrRc6bw2FMhC8LPaLFoHwYctqw2b2hlZ51bXA83CbCvu85qkUkGXDYiXvTjopWaE9WuMcNGJtwssgKGkbTYmjrBx5JwwT9TOcFlSaPsEk3a1sszy6s5kRDoiS0HxAvDhEZZRF/3MyzwkwCEVUs1e0aebZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM4PR12MB6350.namprd12.prod.outlook.com (2603:10b6:8:a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 00:34:52 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%8]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 00:34:51 +0000
Date: Tue, 30 Aug 2022 21:34:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 00/15] Tidy up vfio_device life cycle
Message-ID: <Yw6sqidAP7puXApd@ziepe.ca>
References: <20220827171037.30297-1-kevin.tian@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220827171037.30297-1-kevin.tian@intel.com>
X-ClientProxiedBy: MN2PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:208:23a::11) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0e20cca-a551-44e0-8bf9-08da8ae89dfb
X-MS-TrafficTypeDiagnostic: DM4PR12MB6350:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ot4GUQXcrRzgCh4nmrrnBhhHDXMdTpkLZIAEI6VMCk43n1TnLq6M98F2PRamXAMHeN11XZZC/uYMR8OUUyRfFxlgMRigtCeLwSqW3tcZEuMinweFAdIzWoR5yjgKv/mCY4XxFkCf1AgpPAlZiiBCBql5JLE/JG2Kprh/0TU0scGeILcWwZuB/ns3Syw+OOj834xh3O3BqzH37G3m44qT0TJpVZHsA0ALl/EwiJiN3TXmgjw/68A5S8l9zdzRbKzpBmXry9VdF4yNS0Ge/03doKzSCBmxYyvfSYtj3iq1ODcVqE539UBtdgbxNenRiTsL2NySc7I2SxBim/pLiFdJUSeY2tRi2EbrRMlP5Bq8ik2eVZ75PCoxlFD2a28eJlZwt1QOp8w4f9GQxH58YHGKzMctGOxlLzPSiTRgqghNKCodEcqsuGbaP+POdV8R60r/iTDZ+Z8TLcBMo0V7Fo+HaSKW9erM11vpB8sJJFGPkEsNimqoTtDrgHgJgmE3iAyuzkFeIJoNH1dBFs83vmroDXdd7KjdSrO9tNIYEBF5oX1pMOwsjvhmDmHxmyE9CFFcgwm50sT8jTjxKR7W+9xf/vI9twi9TUzGL6fYgv3KB88X7Nd+q15s0X/P7xlgDC6qjtn4xyRlsJo60qwfXMxw3B/3JHBEtE59UKC+rgZD3CZOJ92JegZd+Wgwt5BIsvOH69aRynf+d3cO9UNwXDs/qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(86362001)(38100700002)(6916009)(54906003)(316002)(7416002)(7406005)(8936002)(2906002)(4326008)(66946007)(66556008)(66476007)(8676002)(5660300002)(186003)(6486002)(41300700001)(6506007)(9686003)(6512007)(26005)(478600001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xOW+CNUsNORHnvYJjz7/Fmx+ERAesPwtfyRBleLz7uzsaZ8BIIvFx/Vz+RaE?=
 =?us-ascii?Q?U/EdqIuYWzDOGdw87/twwSWpiPYVnltTvPw6aCxuZ70MNXQDfuhLzAgq994K?=
 =?us-ascii?Q?vvydCWEjPfqm1tQmLKVK9mFq1Ru+4VhQX7ngnCEpktFTr9Uq47c8vM5CmP+Q?=
 =?us-ascii?Q?pospTcAzIu4bveSNhq9z0lch24iwcLXuw2erI5wrX07CEAs4EgOzuuamUZxe?=
 =?us-ascii?Q?uf6T1fCsN4xMGDzBMirz9kJEhXl6gud0Hd/JVPDxLXY+5VB/Kvhh950p0wxT?=
 =?us-ascii?Q?8GhRhNGJtb5L5ccZ+Mtyzc/EL/9PWshLG384IfrnedMjH7zdPZx8EPl8YSr7?=
 =?us-ascii?Q?6EnYcp3DEPiiDFTICfRa0MWvir80gvXhQwSNKQyJYKaSmTfSklUYW5pedy/4?=
 =?us-ascii?Q?0j/zzOTDuEKKsHrpzJIPP/6DtBXp3QKQ++XWYgiIEmbnvLIwDl3lN/tdiGfh?=
 =?us-ascii?Q?5eZ3yyY4xggjovrWV/K7OT01AMQSjHILyU3bb7WVxHMJTMQIaA3vyxatPswy?=
 =?us-ascii?Q?nvLlUwc+bbSWJWBCkAsImnRJC6Bjzc/+qIuF7Wt7wbKRyvnNyKVYcXoy9YdQ?=
 =?us-ascii?Q?oZCxV6uDGGj73mFMTxNQt6PoV+JPX86JtWgGHGKOjlE5u8MrHN0YpfRX2eTA?=
 =?us-ascii?Q?OnBCbmtQZCkTTYiKD+BdKsrLjFedCzj3UpEhZi5v73EzNlt3Wv3QTk9OLK3u?=
 =?us-ascii?Q?X4I7WArzsIHMX2vjBux8S1G+v60ombMKinXDxRA9qJONJTSutfIpkWP0GbNm?=
 =?us-ascii?Q?8xk/nNL12InVChwJWHQVgScN/5zSXbXNF0NRt0Szx+jxpnQh9hmviUm6ZurR?=
 =?us-ascii?Q?ZVPPIENK/6ttHz1jKLikEIzwYlZ6avlBP53DdljWsAEPvMnHWWKKf2Ljzyao?=
 =?us-ascii?Q?aFtgRZ8zUw5RH08T4SI2OKTo+r+OjZRzNmSwHr8MIlIj9dqSAMqNZW/G0oVA?=
 =?us-ascii?Q?n5E8ZLHj+WfJBpU22TLT7LhrPOhFrrXvHSmky6m/+ymWrLeI1O166zZUOOUl?=
 =?us-ascii?Q?epLfU1/Ics6dPXXIQ6fAqmKdc9coBnI/c2uuerFEcK/yTVlv1gGlLCNtYWD0?=
 =?us-ascii?Q?7GvHkq1iSASJRH393HjWwbQhAipq3iK4qY18blfIdrPbH8t1s4rl+/BnE+6l?=
 =?us-ascii?Q?hJRoXqD6ole+bPk+zkIjGSA0zC80dzcoDHTB/IxJSh/9l7ZyV4jWtxFXsCN+?=
 =?us-ascii?Q?TW9FjldhzaMDyjjvPDTwSrufSXGeoLkbsn+taASdHXnf+Un9iP0gSMlae8c+?=
 =?us-ascii?Q?aOq3x1itUgFrp7yTzBZ+KNGOXEYxZhRkEw2PDf5fZx/3WqXAowTU0bmTSspW?=
 =?us-ascii?Q?V7ihFIfptgVUW3UbXRc7hjyrlWr4rUtFgxgu4DsJSkRdemPqRXtPKX4DcJVP?=
 =?us-ascii?Q?jJdCYOy0mnRNIta84i4J5ttKUPOudT3zOBgqx4Kr5KeX3Gn9v0YjrFTnsz4i?=
 =?us-ascii?Q?y2XG2+k97PugPXWvxthm9DZ8rOpqTSq4noHLaVKCZNUfaPpYUJxLXu368Fvf?=
 =?us-ascii?Q?LXRWLrO11kpT4X/BJsTXnZH1q6lD/1+COaqauSDvnn+ypA/ZAak4s0gLx/U3?=
 =?us-ascii?Q?r9o/XBaEUtcWzloM2rtwQcRIolTfu1o6kX9Jwxsr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e20cca-a551-44e0-8bf9-08da8ae89dfb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 00:34:51.8444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jAm5IIFDdzvOfnvASXGV8Z+QN4C54vTmGyu0gg7WbDYTQLK1oU+PE/mWXrFyfM+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6350
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 28, 2022 at 01:10:22AM +0800, Kevin Tian wrote:

> Kevin Tian (6):
>   vfio: Add helpers for unifying vfio_device life cycle
>   drm/i915/gvt: Use the new device life cycle helpers
>   vfio/platform: Use the new device life cycle helpers
>   vfio/amba: Use the new device life cycle helpers
>   vfio/ccw: Use the new device life cycle helpers
>   vfio: Rename vfio_device_put() and vfio_device_try_get()
> 
> Yi Liu (9):
>   vfio/pci: Use the new device life cycle helpers
>   vfio/mlx5: Use the new device life cycle helpers
>   vfio/hisi_acc: Use the new device life cycle helpers
>   vfio/mdpy: Use the new device life cycle helpers
>   vfio/mtty: Use the new device life cycle helpers
>   vfio/mbochs: Use the new device life cycle helpers
>   vfio/ap: Use the new device life cycle helpers
>   vfio/fsl-mc: Use the new device life cycle helpers
>   vfio: Add struct device to vfio_device

Other than my small remarks this all looked good to me - for every patch:

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks,
Jason
