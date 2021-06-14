Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847773A76C9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 07:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8165E89F6F;
	Tue, 15 Jun 2021 05:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D93589C51;
 Mon, 14 Jun 2021 14:34:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7j6TdOViWf7USenT0y43NswKL7XPbpk8LSb2E8kaO6yF7QC/N6qId7E8TIqY6j/6YQJ1I7wtKR4isPmy/EWQ/6vRUTCzKX0zvGP9tJG6m7DTR5T7B0mIONMzIfLWHWmHIymoLvGX9YxzcvJoAHMyIIJYL9W78ieZ4lEdq66AViJ75DsMF9uOCbPSfA52tEbdGrDNxiuedzp04oRRmhCcYNhRX02zFUrgIFl99ADz0iwRiFuvAzKOItTxF5j/e6PzxcWVYNUDCKCv8wHMnURopcVw6PMffSiBN2g7S7Vmv3Brq8z9cqUgFrJI/82hiw8YklMoRfMemF1C2NS05k6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qipvQNcrOJ2BDyqNOL6e9iqH3C8pRr94SoTa8I1H1f4=;
 b=BmU+nddAs2Tvs2rwjQO4UY6SDKZ931SlCcbnMZHBSwphE1dKvYQOut54ffMbRvtG8hFGXnv50orC5rE/uWkPJoDPN9/6/91qtjuhsiorF1NMLYJJbXEx96wd5PGvXMBWZemOhackJG2L3lN99IX30RQgfoBsUJv8f/ECknsJVF5IOAl9X7YZGrFtTw2k+rNEFuY5zogph3N0WBSoPZ4WEjZD4bzNnrniptV6OzPq9Tmnf0jzokMxoTlBh2A+IsPtJ09EXCKaJTMlKkLEdV9qnV5g7YYnV79zpZLUORJfbbRnCPsCk31zKQvSq7/Uu0y8x+UzIu+w0Z7u6pwHaiNV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qipvQNcrOJ2BDyqNOL6e9iqH3C8pRr94SoTa8I1H1f4=;
 b=tiAoQL6A65CPal9PMT8YcUsiF4uBgUNA7qcA63iTkJQIcCW6mYcTEKgjOazCSGUfnQYpm1W/NwEYRSnzUsVzjVlhuklXNU7vELsfoNLq8au/h2aK8qdQXVWEK/9X2A8MKQnq+P/UUkWq7YNurS3+WKWT3WIpIigCULNWcizScCY3cIdukY1uTTWF98qUcxj53tu2vNeSXuHFpnKy/v87uovn8P4kAjqFJfieuDaaYz1cA1UJ1onN+tZ5k1iMZbN0hIHBJNgU6kudFpX2qRCx+ZOlNMp8Sn5bZVv8/rtFtZDM49HfAnUyb7oHgIRDVAd2nhPNT9Rss6GfjpO1aKZgLA==
Received: from CO1PR15CA0044.namprd15.prod.outlook.com (2603:10b6:101:1f::12)
 by MN2PR12MB4781.namprd12.prod.outlook.com (2603:10b6:208:38::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Mon, 14 Jun
 2021 14:34:31 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:1f:cafe::a2) by CO1PR15CA0044.outlook.office365.com
 (2603:10b6:101:1f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Mon, 14 Jun 2021 14:34:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 14:34:30 +0000
Received: from [10.40.101.248] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 14 Jun
 2021 14:34:24 +0000
Subject: Re: [PATCH 00/10] Allow mdev drivers to directly create the
 vfio_device
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, "Tony
 Krowiak" <akrowiak@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>, "Daniel
 Vetter" <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>, Vasily Gorbik
 <gor@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Heiko
 Carstens" <hca@linux.ibm.com>, <intel-gfx@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, <kvm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-s390@vger.kernel.org>, Halil Pasic
 <pasic@linux.ibm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <0-v1-324b2038f212+1041f1-vfio3a_jgg@nvidia.com>
From: Kirti Wankhede <kwankhede@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <e6cecaed-3257-e636-52c2-abf7af2cdffa@nvidia.com>
Date: Mon, 14 Jun 2021 20:04:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0-v1-324b2038f212+1041f1-vfio3a_jgg@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1284c7f9-9874-4f51-cf3e-08d92f41858f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4781:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4781EB8E8E7726CDFA64ABABDC319@MN2PR12MB4781.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g1njhUruoAiwn5aoZGozKWBdvFvaonJMDtiMDHQcuwBJiCMlVrmSTfz1QR2DIIVRAQrF3RCijdSc6aJkhoZ8YIWjZO0VfTZGdkKY7jQhy0SyQHH8Yy+JyRCojzkHATItsUiRG4BJQPHP5L4Sz/zMz2/852YABNG/rQwDSjRvS54IIhRO88DKV4I7M0wxWhEryLq2ci6qfwysZOc+IfpcsFAUOBzEJ02j6jI6q6xZjyzxMHqhs1fmWt2KlGRUTGtH9s5++nQIAMD3kuBl4bI28ED7aRKdwEdsKZz6yKMV+E22P8suuzfV9Zk4MGh+gjWqcCJ3o31kSskPOrxQVdDeWWtBJfg+fnOyu1/3Xn8QTd6HhqKKDmj0KWZeWB24jJcOV68EiWvEgnXyN+hqP+7GiCql91JT4tw/E0dcMygN7xFxRgdicKDD6uKwpT3cxoY9fc71chR+8B1mmOKNBVE5cpWlTKW8ntxqGy9prlpblA933WJZpuTqmO51wWsKaH3qGoc4ZqQzDY25vNU/kHEhmv70Or356BydYY6f+4XF2iVhiMVy4ZN3aBpGtonLhreOglKR5VhT7WUwXpQ1wdDyGXayjMJ88Ju9qp2xVWdL0rRBXazr/GPu9dlxS0xek+sjqFRARSQKi0FduOK6qycb2F562/H+Yjfpw8peE0QgUGMHSWVpN/lF4FoNoPfrbkyUQJXwBOwH5GppKVom+qvuB4yoIbo3YFkBUwQQcX0UPY3EssPsXjGb5cYMriY2ceisFZS+nyEO3XXDibmYco8cUNpULTtVCUhfqog/vyB8SMDoyfjNolNzr5GD1Pw+7miZiESLlY174Q7YqRoqC7snpFE1stwmLCvaqOtUQ/y8GKBlTV4DCTaqpQZqAhnMsa7gJsLoOWmqVgjCbFyuAQgVFCCCU1wp/hr2YVrJBsdW3JM=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(136003)(346002)(36840700001)(46966006)(26005)(86362001)(83380400001)(2616005)(6666004)(16526019)(5660300002)(82740400003)(7636003)(426003)(31696002)(70586007)(47076005)(356005)(8936002)(966005)(921005)(8676002)(70206006)(186003)(36756003)(316002)(110136005)(36906005)(2906002)(7416002)(478600001)(16576012)(4326008)(82310400003)(336012)(53546011)(31686004)(36860700001)(83996005)(43740500002)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 14:34:30.8800 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1284c7f9-9874-4f51-cf3e-08d92f41858f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4781
X-Mailman-Approved-At: Tue, 15 Jun 2021 05:52:29 +0000
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

Jason,

I couldn't find patch 1,2,4 and 5 of these series. Can you please keep 
kvm@vger.kernel.org cc for all patches?

Also it will be helpful if you can add version prefix, eg. 'v3' for this 
series, in subject line.

Thanks,
Kirti

On 6/8/2021 6:25 AM, Jason Gunthorpe wrote:
> This is a "v3" of the previous posted full conversion:
>    https://lore.kernel.org/r/0-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com
> 
> Without the trailing patches that are running into complications:
>   - The CCW conversion has some complicated remarks
>   - AP is waiting for some locking stuff to get worked out
>   - No feedback on GT
>   - The license change topic for removing vfio_mdev.c
> 
> Getting the baseline functionality merged will allow Intel's IDXD mdev
> driver to advance. It has already been RFC posted in the new format:
> 
> https://lore.kernel.org/kvm/162164243591.261970.3439987543338120797.stgit@djiang5-desk3.ch.intel.com/
> 
> This series includes base infrastructure and the sample conversions. The
> remaining four issues can be sorted out one by one.
> 
> The major change in v3 is to enhance the driver core support for binding
> based on the request from Christoph Hellwig and Dan Williams. Based on
> some light analysis this looks broadly useful:
> 
> https://lore.kernel.org/kvm/20210428233856.GY1370958@nvidia.com/
> 
> ====
> 
> The mdev bus's core part for managing the lifecycle of devices is mostly
> as one would expect for a driver core bus subsystem.
> 
> However instead of having a normal 'struct device_driver' and binding the
> actual mdev drivers through the standard driver core mechanisms it open
> codes this with the struct mdev_parent_ops and provides a single driver
> that shims between the VFIO core's struct vfio_device and the actual
> device driver.
> 
> Instead, allow mdev drivers implement an actual struct mdev_driver and
> directly call vfio_register_group_dev() in the probe() function for the
> mdev. Arrange to bind the created mdev_device to the mdev_driver that is
> provided by the end driver.
> 
> The actual execution flow doesn't change much, eg what was
> parent_ops->create is now device_driver->probe and it is called at almost
> the exact same time - except under the normal control of the driver core.
> 
> Ultimately converting all the drivers unlocks a fair number of additional
> VFIO simplifications and cleanups.
> 
> v3:
>   - Use device_driver_attach() from the driver core
>   - 5 new patches to make device_driver_attach() exported and usable for this
>   - Remove trailing patches for now
> v2: https://lore.kernel.org/r/0-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com
>   - Keep && m in samples kconfig
>   - Restore accidently squashed removeal of vfio_mdev.c
>   - Remove indirections to call bus_register()/bus_unregister()
>   - Reflow long doc lines
> v1: https://lore.kernel.org/r/0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com
> 
> Jason Gunthorpe (10):
>    driver core: Do not continue searching for drivers if deferred probe
>      is used
>    driver core: Pull required checks into driver_probe_device()
>    driver core: Flow the return code from ->probe() through to sysfs bind
>    driver core: Don't return EPROBE_DEFER to userspace during sysfs bind
>    driver core: Export device_driver_attach()
>    vfio/mdev: Remove CONFIG_VFIO_MDEV_DEVICE
>    vfio/mdev: Allow the mdev_parent_ops to specify the device driver to
>      bind
>    vfio/mtty: Convert to use vfio_register_group_dev()
>    vfio/mdpy: Convert to use vfio_register_group_dev()
>    vfio/mbochs: Convert to use vfio_register_group_dev()
> 
>   Documentation/s390/vfio-ap.rst   |   1 -
>   arch/s390/Kconfig                |   2 +-
>   drivers/base/base.h              |   1 -
>   drivers/base/bus.c               |   6 +-
>   drivers/base/dd.c                | 116 ++++++++++++-------
>   drivers/gpu/drm/i915/Kconfig     |   2 +-
>   drivers/vfio/mdev/Kconfig        |   7 --
>   drivers/vfio/mdev/Makefile       |   3 +-
>   drivers/vfio/mdev/mdev_core.c    |  46 ++++++--
>   drivers/vfio/mdev/mdev_driver.c  |  10 ++
>   drivers/vfio/mdev/mdev_private.h |   2 +
>   drivers/vfio/mdev/vfio_mdev.c    |  24 +---
>   include/linux/device.h           |   2 +
>   include/linux/mdev.h             |   2 +
>   samples/Kconfig                  |   6 +-
>   samples/vfio-mdev/mbochs.c       | 163 +++++++++++++++------------
>   samples/vfio-mdev/mdpy.c         | 159 ++++++++++++++------------
>   samples/vfio-mdev/mtty.c         | 185 ++++++++++++++-----------------
>   18 files changed, 397 insertions(+), 340 deletions(-)
> 
