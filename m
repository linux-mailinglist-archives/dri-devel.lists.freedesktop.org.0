Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF47842A67
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 18:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F295B11323C;
	Tue, 30 Jan 2024 17:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EB611323C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 17:05:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMXzBk2guSrP0jAoSc6WmUIrbz/lS6w3mf/qygZjvAijgkiVK7k9irO7s/9jAwkwOCcqaDUbyiXBNgRpDtNQzt8ST2ldSmI8w0V1ddKAOWhBz/hjFFBf1EYkzGzHSLPbfCAGm/h6TOAfq2YzS16VLzp+ugK/C+YPgP2QYUbBni7QhOt7YEgBEdvMdkCJiydMOynkGzZ+MyM0xxC2LStX6vQsnK3B3OZ3VUiDL29hJURZNSFnhhNNlpGBqQwzZWYgQd5jQ0c0URz/8Y+7euC8jImxgeFBTgEVbmu6AD5sK10q03sDhUz66czzRObsCFxFAKr0g8wTa4GxWDzRYGXPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMtJrGMxaHYm5JEDt3pYGFYmWJoYQvvkAv9Sv32BgBE=;
 b=a3mu/YMtR8bNAUu4YVCHvdlZAckl2IJkClT1f3CwXosy0dJyhoUsjTcTqOTygQrtLdmUaZhZhz+59tZc6YpqtSgBvEFS7jpdkcBp69Ufmf93AhiGI6nvt1VkQWV1i+R8dA/eBxsTa9NdG6CDvfMpMdH6RgMW0sasDtPc3stIvf2aBqf98XF18e2s7k/VNvBMSiT1H411at7A0wJG1QdNpsg3GjCtURN5Wx/LOSdxv6xrHie4mq1e7LxDXMLFyT+xWqPAtLTZPCUyKcpNT00gutdlweJVPiFr7rZv7qIFeB8LrauEHlwmTkZb+Lx+iX41UNMdPgt475oH2iKTHfKRMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMtJrGMxaHYm5JEDt3pYGFYmWJoYQvvkAv9Sv32BgBE=;
 b=aaNmQeL3QmJbNV+R7xdTevlUN6WkcVINIl65Yg0v/R3LaWskalYffhngJkAXZS0gUR+FT1INu4PECebqbsAcF/atFF/pwQPzUZUA+DVGYrsUrFJBkH8mRt79ucyLh+5QZZCVckj302B8nvrC9YmwjdjGwz4uP2OQ/oq9vKQ/lY9ru88Bb15AVxSLnD9it5bPf1hGI7SODqURpLOIJhQP93AjNyLDpeptAX85xspTvIRzRD0Z8pz2+o5t6HNIfnMMO3/iSEJA0gT8KxmSMiCld8Oz63uZfakX/LpmxgYgctYx6Mzv2aUiQ3GFLLY0mAbYOivOpczFLrTr5CgxINYQEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BN9PR12MB5193.namprd12.prod.outlook.com (2603:10b6:408:11a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 16:15:45 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 16:15:45 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: Remove of_dma_configure() from host1x_device_add()
Date: Tue, 30 Jan 2024 12:15:43 -0400
Message-ID: <0-v1-c76c50cd425e+15298-host1x_no_iommu_conf_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:208:23a::10) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BN9PR12MB5193:EE_
X-MS-Office365-Filtering-Correlation-Id: a56972cf-645d-4120-3508-08dc21aeb657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E08Zrb/ngEBqWJdSJCAWcT9NoKOCZ2cBAjlvK/AlOfntny+/pJjqyEFIMY5ICj23YmTXD69jEaEwZQ84zqxgc2leew9AgiO6Lw9iaFUVSgUQ75DkpNm1enrEWcRtV34s9+kFWksA6LJ0WnGZFKdE+I3ElGC4ULsPtidnSph5Nuj1Rt2e6Lap3EpE2qn6OtDLjJYdRZqu6WvSqiJHjM6FNHTn7vqG+wy/P+OYHMX5DDse1BjP5YQauqg48XEu44IEjENpapXvOuAGgE6HbOjFD55U7oGn+UVVgRIeKDk2nTc7Qqg+ekcRo3j77D75YQdIXwqd0MtWxVeUrmsHFBiVhcVwBixbR6XaJDbtKOrVXjSgo0kS7K2eaRwoc66UdOoJSb+9gELJX+wKpnBSRYSVDW1Ru4CSaJ42bn7srFblxqLm3sWephmwIjxOnirjZlPOSvELHwDFowUtOHzOZsMbb/IAeKSi9gDIDdLekhDVSPwt/LNSaNWoGBA1X4oVClaXHC8xvPZqU++GlHtcqK/PMrBdoiI1yKg8oCG3Ml7HY8VFuUTl8TQp6E8bUk5cVIr4tOETEMvm0STXTn4K/6b9rRw7S5/7gRiU/giHTXqIGpTbbidZGxUBGknw4aeXm31ly5f+OM7z4uWq2Ff3BPkuivyesbB9+yh7yAghelpl4nz+p0Uk8OXsesWiI/iJ48OM9tiR8abEn1C944NumpIZ1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(346002)(136003)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(26005)(6506007)(966005)(86362001)(5660300002)(2906002)(66556008)(8676002)(8936002)(110136005)(4326008)(66946007)(66476007)(6512007)(2616005)(316002)(54906003)(6486002)(478600001)(36756003)(41300700001)(83380400001)(38100700002)(4216001)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vgHyd8B75eqhRu+soh+M3w4pZgfDxjnOcjEMSGo4Unehe0Gfqm8veTzu488q?=
 =?us-ascii?Q?xGg89KbLuVT71zLpeHS3b5WzsoLDMeYPbzf+ZCPeVHHu+SPzMQj+WrTdCwWI?=
 =?us-ascii?Q?Ua/vTvCf/nSzQHoUTcQb5+j6OJPYFlOXskJmgydDpbIXrzOwjBDKnGznQMqd?=
 =?us-ascii?Q?fQ7Cau2Yv1lmBOq6mEQbbonE8G28ZqQ+es6LROAf0ajJMR6kNulUUZq8BGJB?=
 =?us-ascii?Q?GMvV6NYWMvQzHcVW8MjibcPBiZ3jqiepEPus39tbbz2/jxo8mi4CD0ddi2QP?=
 =?us-ascii?Q?2jBDsVUmUG0Bko3I2/z+lD60NYXo3yiRUq3gn7wMXZHZ9BWKonrjZ6PSAQPm?=
 =?us-ascii?Q?V6bfz6QsRBBjFnFJzg8Fw3GEHCBgsHGWP5kJGWl9KFwfcmIDWI272vXf8+SF?=
 =?us-ascii?Q?kAF2rdUDjVQ3H6am36DxaOCFn6MpYZLqlul/vdrG8XVeTu9oWRGx+NT6O6ed?=
 =?us-ascii?Q?H12ff+lkMoruZ4fdMZzkOlwwn9PYxi2zSws+A3GVjxn/eRz7dZhg3e1yP5n2?=
 =?us-ascii?Q?0yREsAtjdXru7emASnkAhM7Ah8NSjkqDDfQLn77NXzZm20lQFoWvHP/YIjCx?=
 =?us-ascii?Q?6+TVvEjILsYLC8G8xGdI+qtYD7Q/u0osTbwJSX++sMiTzHqxUqOhKynzoqGc?=
 =?us-ascii?Q?wG0n63+xxhgBTVEfCgBaRqHTTUBHTQXoGrmTZRAwN6Wlt1eulK88yaxQRsxX?=
 =?us-ascii?Q?CjSbyGW8eN+SFOIdHxfbqwA3JvKUgbzoLd0s7RFd8/8S+7/ZL4cOTkRjfzos?=
 =?us-ascii?Q?mTF7r+YJPA/S7A63aotr8g5QKa0T6bR7VHtEfsVl1xCgAbwlbk80wjv5807M?=
 =?us-ascii?Q?If1JVggWm8GI5leGGn1k/wC+aKB/g/BAF+C6BS2XntniKvSGxsjkf471ju7Q?=
 =?us-ascii?Q?Bl0zrBuknHtPMnLBIrieA+eHxIDMwYqlLCHCE4shcczlTNxlCUmBb7WgTWbH?=
 =?us-ascii?Q?T46SQ5LQi7XKnXV+2u+WXsb17Rwfi968BSeBMEDeA6jJHYmJhouWhJl1kb4E?=
 =?us-ascii?Q?aPoMgq+k4WOrqeYyJFUJTVWT5wAOswcoSPbHsUdXD7idx2nUiUp7TYcRiozd?=
 =?us-ascii?Q?1GOsLKGCt3Wwwgi0nLUpt4b3Z4CS+1TH2rpvEFWOcZ26temEEGda1QM4xRTA?=
 =?us-ascii?Q?abg4FcKlAIzVPUxYdgFse93tqGJXw3KhGvino2eqbFslm2TSIEZfUFz70QM5?=
 =?us-ascii?Q?FwsoXUObSrlSn8EQkKaCSTuot3xEDSp6dv44as27WCbZFul1Mj7P0xkUOEzI?=
 =?us-ascii?Q?2lGt5ax+rkM+kaEht6yGRxLWzMOr81hriBQveFCPGxUCAVBDKBLnlEs83KNc?=
 =?us-ascii?Q?JKOMpoda6qAy5Q/fWKNbUymfT7xKV39qO9Up2rF/5iAqxs5RcZuLqOefj4Yj?=
 =?us-ascii?Q?wKngB0r3fT3QpgERqoS8GRRiDNVqGyywkd+pWMDg0WEHwlFiXnq4T1Fsax+l?=
 =?us-ascii?Q?K3kytE5wUXGtWV+uH6s/8VE6e7EkjgfswvyKK7+OTNuGjNcMD39D6PX0LSFV?=
 =?us-ascii?Q?/6fbRZqJMg3bR6Dsc0qfzhp74KzZuBsTUqem7eValVeJWeMwcuZDoc0+lkRW?=
 =?us-ascii?Q?5H/iAXDQT51mWZ0jxjx65INVKUkwnaAoEMDmV6d7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a56972cf-645d-4120-3508-08dc21aeb657
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 16:15:44.8871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSBIRncxtXAwYbBxEzAmybpwf3VH+KdGWCH+cCQCKCX/cYPGnyZb8N5cbO4wzblh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5193
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
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, patches@lists.linux.dev,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was added in commit c95469aa5a18 ("gpu: host1x: Set DMA ops on device
creation") with the note:

    Currently host1x-instanciated devices have their dma_ops left to NULL,
    which makes any DMA operation (like buffer import) on ARM64 fallback
    to the dummy_dma_ops and fail with an error.

Since commit 14891af3799e ("iommu: Move the iommu driver sysfs setup into
iommu_init/deinit_device()") this call now fails because the struct device
is not fully configured enough to setup the sysfs and we now catch that
error.

This failure means the DMA ops are no longer set during this failing call.

It seems this is no longer a problem because
commit 07397df29e57 ("dma-mapping: move dma configuration to bus
infrastructure") added another call to of_dma_configure() inside the
bus_type->dma_configure() callback.

So long as a driver is probed the to the device it will have DMA properly
setup in the ordinary way.

Remove the unnecessary call which also removes the new long print:

[    1.200004] host1x drm: iommu configuration for device failed with -ENOENT

Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Closes: https://lore.kernel.org/all/bbmhcoghrprmbdibnjum6lefix2eoquxrde7wyqeulm4xabmlm@b6jy32saugqh/
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/all/b0334c5e-3a6c-4b58-b525-e72bed8899b3@nvidia.com/
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 84d042796d2e66..61214d35cadc34 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -458,8 +458,6 @@ static int host1x_device_add(struct host1x *host1x,
 	device->dev.bus = &host1x_bus_type;
 	device->dev.parent = host1x->dev;
 
-	of_dma_configure(&device->dev, host1x->dev->of_node, true);
-
 	device->dev.dma_parms = &device->dma_parms;
 	dma_set_max_seg_size(&device->dev, UINT_MAX);
 

base-commit: 3049f92c481204f142226d3672711660025fbbb5
-- 
2.43.0

