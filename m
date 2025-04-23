Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A84A99BBC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 00:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA27110E702;
	Wed, 23 Apr 2025 22:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EpgvRhDv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E0110E700;
 Wed, 23 Apr 2025 22:54:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNfDIhGFNzjRex1Ut0pu3OEhckbGehId9rqixenhVuv0W0x3CWccmRjwc77Fx/s63nTty6kDc+oi6YiGmOettCK9lYHM2ZgSpJoJh4+jLrI2obNoJAvfRK3+OBxAsZqVcPjR4ZWRrPyYRHYctdTFqqMfstXCTX7WqyLsBwThCHxASZv7Seep4UGt9bUiIe84AXzexU4VdrmU9ausVgjJ/uefRpY05BbIIK0cG8ACi8aI2reYijw9IMjiWYslPEYzpOfjVK3RKTSn122izDw1kNI9RHSVW0TfzYO3XPJXmNbjOF9f4gBVvtNicNVXNVOhsP5+3Kf+0CQ1rIi1hnQKKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r++cWG9pp8ABxTb6b2QgXcZwBXN//JCueqoLtOdgkq8=;
 b=YX852MPnDU3sEWMrQAUHna4feSS6H6YJfEXqJ3DH/vMChAiTfNFUwxg/tf97JTrpY5Y8m9byufXTBAbfauDQjUX8E00ZoPmqtVfexUkIFbhwNx5KgvQzFt+PbQHUBWJVPumDaHlbjsNriOW4ehZCBQHkHuMyONw1ir/Z9G3M3Tn/RkQeAdtAKtLhMAfehuFHJlLz8nBWugxKqyJ6NANB+4EIzZfWs49x6DMHzifYZdT9q6VfBP2FseOuvYILuZxAGcCqZSLUSojf96iIGUO3k/KXDhdPwAshaM06IcPrFjfehX1Lb4szhxV9H3/RvjF9X2If1uvpqLv60vu9ZMGTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r++cWG9pp8ABxTb6b2QgXcZwBXN//JCueqoLtOdgkq8=;
 b=EpgvRhDvfEzYLipGCbmHkXoOKI/cI4XyzCAcgtK1/mQtV42yopER1oDORBXo0a2N+BInEZwAeQGO1AbGY+M6hbCVpHYy/GgRDxQas7r1eEf5Je8znz9rnlV/9p2ygHpPsGVqcVdF5BE4l8/pGeCtvR/Mz0q6AqctIhHHAumHpzaAah306gRofDt2HiX6lHA7dLWnMPeL+qLvupmfHPTYq1deCiQ6nSCqiDLt+KSEBH1FpwoH9AAausaxLeuyFuIflZVOreHY90BhQmK96c2sTBH6yUL6An9Wz6lzP1i7UoGMCPoM+pS39QVEx02RMh8EfLAtJOSiLzxMEBHE/49Ipg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Wed, 23 Apr
 2025 22:54:31 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 22:54:31 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-doc@vger.kernel.org
Subject: [PATCH 6/6] nova-core: docs: Document devinit process
Date: Wed, 23 Apr 2025 18:54:02 -0400
Message-ID: <20250423225405.139613-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423225405.139613-1-joelagnelf@nvidia.com>
References: <20250423225405.139613-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:408:ff::11) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: c64193cc-1adc-44bb-eaa3-08dd82b9ceed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/Yp0L/1hz4SNjobuLFv5Ageh5wIyD3jL+8YBXjIBXTcFzZ55n0dIc4CfgbuG?=
 =?us-ascii?Q?loccYyI3PKY2n9BcVYulp6e72yRhKOJOgQlCvdqFsuNxJOacHqcxRULJHw5A?=
 =?us-ascii?Q?DmOFW42Gz8nRP2PHWfjqMzcht0INk5M8gKtDdJv3MN2HTZJ53B0PrhGKUqbB?=
 =?us-ascii?Q?M7dLoVplZg9N7qXTzS9EsLs2Qu0OgPZogKmtddsT57NtqxseoxxkuqOKI1an?=
 =?us-ascii?Q?tRDzrwOHMR8hx5Xw2CytoLOrQsYPLNiDAMpe1QQoDVkUD2WeXcmJRar0wuII?=
 =?us-ascii?Q?Fj5E7fL/noWBbZ0/izS7uBPrecppVNk655Nur9AoTzR/4tqLDyLgLura6dvW?=
 =?us-ascii?Q?qP4zeZo5YydrzzO+45xDCw1RU0dKKnBQOhVhQHYOzJv51bCMn0sc19vOyQGl?=
 =?us-ascii?Q?NWbp9kVal/TbJW21u4D4+wHnp+1+/oDwhIv+S+brkzJEz+py5TsCkPWx9P/U?=
 =?us-ascii?Q?HdWEN5hWopovCIls5O30NbGOLctdlKdvtyg21BLQNLatNnXnWQUfquXKA753?=
 =?us-ascii?Q?O2xXTy9HpAS8Z3UWZYJIV2oMX9z4wHn5CP9u5LlDrOc5YifjXoIXmSaoP+IV?=
 =?us-ascii?Q?aqgF/EE18tvGgV/cwYfOkYmqDPrciA7jxXhtPTlS9iauC+J+mFbCPZU1QNz9?=
 =?us-ascii?Q?bFr/kHuM1H6vmjrRcj6Vve33CYZFHuwbmEWqnZ8WNAH8ZCVjpUESViLDVah5?=
 =?us-ascii?Q?isAt0z4ivxWx287Wovr6GZx7Lz743qbgr8d6y5onY+k5+upAKbmx+djwJcXA?=
 =?us-ascii?Q?1fbfFOt+rWmxB4Sm+H4xUawMH9aSO+ZeiLq7y5ktFuiPj4H9nGAybnB5Wf9m?=
 =?us-ascii?Q?0WKiuF41SAfile/7Ur2WC1yLLv5XIOorKzR7E9baPhjaN6CGzrcw0Myj7Ex7?=
 =?us-ascii?Q?Jq5UfcLnLFNZczlAmkx+vL9VyO2KM2HUUOZPa8+ST58qinU9f1btkiyntPIn?=
 =?us-ascii?Q?nP4YR2vxeKqQ02/PjVgMIcqXhNutAyvltQTWt2eLiCPI/O6zxskRTEN7de3B?=
 =?us-ascii?Q?mq4ybnhHvhHjx4Rw/uuUiGcauIQQ6w4+o82SkSgB++sSxdTZFhBGuoiCC/DY?=
 =?us-ascii?Q?di5rkq8ujQ/sQqRwncvNnVimJL/cfCZdYZXim4KwAzD+cl4gsKh+mfl1KpdS?=
 =?us-ascii?Q?P2Op0ZyRivn39duO+U0hz1y+JXq6osMfGD/Ng2oNd4AY1RSdIh+fHU+2CIx7?=
 =?us-ascii?Q?2GnMqpwQQegFZd6964y+JSmnwEe+FT2XamtIVYjzIQJsvzTwLH07Al4XcaGd?=
 =?us-ascii?Q?EQ4tzSJRAnkmYTOVIeKzRoC5DcgT/VvNQn8UsVc5rLZzoLe/Uz09ZBCb92rf?=
 =?us-ascii?Q?c8XYPdId8D7MocjOZ1r1IJ+neRhTm5BKZJo7ApZtiM94Bb4XeVqHSqvgLuOY?=
 =?us-ascii?Q?hzllr7vySx/djWFPnUaGSWDXXaiS7COquW3XQrx4d28G9wTz5hKZdv4KnKju?=
 =?us-ascii?Q?BwGk4ddd60E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fEn2NBTDR86jSl0CWM1Iuhq/gGIsrBmwYsPxk7YzdbNT+QVqY4yyDQDYPe21?=
 =?us-ascii?Q?JjWxRxrXixw/oLA0zkt0J636CW8CebiT0QL/GWokRI22K/+gyD80a7slfomc?=
 =?us-ascii?Q?0+SgsZfS7YY8Wuq4XqgTVx8nm8eWQJmbdu9rJqCpJgzfa9DO8uSRl301YGxh?=
 =?us-ascii?Q?UTO48onmvWA7Rzzf/BPKE6WAsJk3EcQ0wAXzIXxq4JV/0LFBXQtJ3wHrjHhk?=
 =?us-ascii?Q?c7VqitAbCSntHeqWfqNhjj4MrWsCcXC/c5vt8Kp6j8LulgNIp43FIm/S1Oev?=
 =?us-ascii?Q?/EdkinARyfqdK4s+rgNdKgyP3yool6XqrzQfZ11oalnFuoxFVTKdlQnPW+D1?=
 =?us-ascii?Q?ecGJSl8Ki7EtEC4l+RtTWXeYF6dBHXUDa84DEtrhYYMAZ3WUM8Ff5i6PxTkJ?=
 =?us-ascii?Q?fcdCyCYYf5HIeNAKrBmsZq+8eo3mzJPTxEp4e2ZEH6tq1Jhz1E7ZChk2bAzw?=
 =?us-ascii?Q?LVUAB54mGmCt9sGuLFJKXxFL0E8Pni1NMxwh4qxd2Eo8aS4WfPj/H40GyrQE?=
 =?us-ascii?Q?oZP2hYQRlB7KbQGx6XbQ0IQhBSUROYGnl2IIHWPY9ywCC1+SLHB4RmSLuxDe?=
 =?us-ascii?Q?0TQUtiVcA2ZC16shJ737wd1Qg5XDYefEXD2QltHNIV8OSc7JEixu0R9eMu7t?=
 =?us-ascii?Q?70xJCXs0WcqWkUsQ2y1i7CWr9En8WuPvvVlQn1RK0hWThRnmexQV0CZVHdKs?=
 =?us-ascii?Q?RgCKQjCkPQhGtugjMhkloHyhJqW48ueuTup4a7DiROZrP3Q7iRl41lH0hg7+?=
 =?us-ascii?Q?aQD+mBC3kbHvrvxhi3H5fzzz3ehWM3eGjkJCH1FcGSKCWqfa/Kb7T/cz8QUX?=
 =?us-ascii?Q?KPUzQ7uMB3m13ALt3w36dWP8OPzgztl0wW0aEve+EsX0I/qimSGuFyQKE4Da?=
 =?us-ascii?Q?HuVDRvtmgp6E8c20rTvFH30tXIIfCS8kzgc8EhZkD3OMnTM3vAmoxEMkIzdd?=
 =?us-ascii?Q?R6rmQbh7rdwWXBehHk7ZXPwwfiDEHG7WkXYeDsTSFSVxe6BpCNJj0wP3OaAW?=
 =?us-ascii?Q?Nn18/5AXiHItsC8DbhI1SSGQXhQkGt2jhCe4+7iSLjOJrxlWizecMKTu/07+?=
 =?us-ascii?Q?D9jKXUBwFti+SE+hNa4go7M8kw0w6Rwr7ljDXtXypjhb2JOrW39EeWVRtxcV?=
 =?us-ascii?Q?sUftUA8uJQSCeKm9WE8smgZEz4PV3Rdcb7LBE8udVn/ShFpcGBKASsQefRHm?=
 =?us-ascii?Q?yzBcZW7+PgAuuATP9gP+/djt7DmdN/itdGMBhmKXysAlbw6mSlXOliN2HB8y?=
 =?us-ascii?Q?/wajIhcqwq09ONUubPuRQP6MSZVPJPRP/pBvjrd2SpagG4Y5TFqoLYEKcJz4?=
 =?us-ascii?Q?67xN6ZPaa/5yhR0dkIWUwuLYyuG7JyDhJifC3JPaHiBClHA5epYU2UHu+TXK?=
 =?us-ascii?Q?xj9jwwNRw7CnLSAOw5jNSfPPRgeNORfe46Z3QAI0yXoxPDk7x0gxr3MSm3Ry?=
 =?us-ascii?Q?Ifaq0t+lt9BHwdhf829b2M7dWW/pg9aAnEKCgamdFA6klTxy096iZldC4T7p?=
 =?us-ascii?Q?YmU1QpA/sYmt2X/iVHurpIYp+x6lXnOUoaSDYc3PAGtgvlXOAX4Qb9BmU2QW?=
 =?us-ascii?Q?ZlOL+ZpgtJ6nnIIfEPEdNM80A9nD9L9cvegC6cgX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64193cc-1adc-44bb-eaa3-08dd82b9ceed
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 22:54:31.0168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDn/RfWJR3Ke7TSXsm5jlr2E8d1p/AZGjaF8YTjH+dKZT+/z7XNfUTJtCel5LOIPh1cQyCsYLrd+8ORr0ggFZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841
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

devinit is mentioned in the code. This patch explains it so it is clear
what it does. devinit is not only essential at boot-time, but also at
runtime due to suspend-resume and things like re-clocking.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/gpu/nova/core/devinit.rst | 54 +++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst        |  2 +
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/devinit.rst

diff --git a/Documentation/gpu/nova/core/devinit.rst b/Documentation/gpu/nova/core/devinit.rst
new file mode 100644
index 000000000000..e504ed3efe15
--- /dev/null
+++ b/Documentation/gpu/nova/core/devinit.rst
@@ -0,0 +1,54 @@
+.. SPDX-License-Identifier: GPL-2.0
+==================================
+Device Initialization (devinit)
+==================================
+
+Overview
+--------
+Device initialization (devinit) is a crucial sequence of register read/write operations 
+that occur after a GPU reset. The devinit sequence is essential for properly configuring 
+the GPU hardware before it can be used.
+
+The devinit is an interpreter program that typically runs on the PMU (Power Management
+Unit) microcontroller of the GPU. This interpreter executes a "script" of initialization
+commands. The devinit interpreter itself is part of the FWSEC (Firmware Security) 
+component provided by the GPU firmware in the VBIOS ROM (see fwsec.rst and vbios.rst).
+
+Key Functions of devinit
+------------------------
+devinit performs several critical tasks:
+
+1. Programming VRAM memory controller timings
+2. Power sequencing
+3. Clock and PLL (Phase-Locked Loop) configuration
+4. Thermal management
+5. VRAM memory scrubbing (ECC initialization)
+   - On some GPUs, it scrubs only part of memory and then initiates 'async scrubbing'
+
+Firmware Initialization Flow
+---------------------------
+Upon reset, several microcontrollers on the GPU (such as PMU, SEC2, GSP, etc.) run GPU 
+firmware (gfw) code to set up core parameters. Most of the GPU is considered unusable 
+until this initialization process completes.
+
+The GPU firmware components are:
+1. Located in the VBIOS ROM
+2. Executed in sequence on different microcontrollers:
+   - The devinit sequence runs on the PMU
+   - The FWSEC runs on the GSP (Graphics System Processor) in high secure mode
+
+Before the driver can proceed with further initialization, it must wait for a signal 
+indicating that core initialization is complete (known as GFW_BOOT). This signal is
+set up by the FWSEC running on the GSP in high secure mode.
+
+Runtime Considerations
+---------------------
+It's important to note that the devinit sequence also needs to run during suspend/resume 
+operations at runtime, not just during initial boot.
+
+Security and Access Control
+--------------------------
+The initialization process involves careful privilege management. For example, before 
+accessing certain completion status registers, the driver must check privilege level 
+masks. Some registers are only accessible after secure firmware (FWSEC) lowers the 
+privilege level to allow CPU (LS/low-secure) access. 
\ No newline at end of file
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index c01dcc5657e2..301435c5cf67 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -27,5 +27,7 @@ vGPU manager VFIO driver and the nova-drm driver.
    :titlesonly:
 
    core/guidelines
+   core/vbios
    core/fwsec
+   core/devinit
    core/todo
-- 
2.43.0

