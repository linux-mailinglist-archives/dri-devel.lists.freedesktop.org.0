Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A97BB9F3FAE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 02:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4F810E825;
	Tue, 17 Dec 2024 01:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j0vBmWSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FD410E828
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 01:08:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fY1uaqkIhmfHmaZmTK5XwXqi6tHRlaV41GAcurLyUK2XqjmCUPGtAcdvaULiIAVzhzceyqwTkk5qpE3RY74UsSwfLqb1oe6rcSFb8iBO0adWRPSXquV2b/11Dcb2PKgNST3e7wMyoPu6z+pGx47/eQjAvGtvFcrk2HhXTt8YhhhOPWIq6wE+WLohVDNyY72W+z87m4E3e5j0Bx6mCoBqc/e3NI0c2CX/rwpeJbnqO3CR1PRpItk/bdbR4+zfGYY9TFHvN2GX+E/NCGcebGY0AKtXh5T5RCmOtgLWPQuhTEXozz0SSrbwQFWQ8TqxWBgIeDD2zKNW0fFmDDczHNnsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvlLDM4xMPkoyYRrQOC3Cag/X0rAfiT4JIPDZSxGaqQ=;
 b=VLqzTwC8VK5nn1qHIEsfHvwEfvhW/JZWJ1dNftI6MvqPJ3yQMlhaG+IlKLf+i1MI/o+JTY+149hVwbZ+6B6QaBB53EqjVOT33vpKLhCDGH37fCV5bqOQg8QJzYwNVGNGxL58h9HGzDD56PTnBxIZ83IdO3Bov6/H2Yg4pf4XJu3H33xjJgEjRJrfVGMVtIKeU36qb3kR/IrbPdr7FFCNI9q2lk5e2odzL2XQR7uYxo1A7htuPoxdQoMGrpiHXMLsxy8lU50DFwh48FBkwyXF9HeD9DJVocQCDP8IVECgBgrvt83R/u/3M+AvSIImRw3d7kj/kU+2TVIZxWz2HbsFZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvlLDM4xMPkoyYRrQOC3Cag/X0rAfiT4JIPDZSxGaqQ=;
 b=j0vBmWSa/fQVYPe1o1MvEPoGEyRWPmtGeRK9BMqjpBDNJ+M6sxTE1/BrP9kUl35Nyr+hPZYCI6M6Y79U+SB0HZKHjOPPJ21pYjcjPRvQ26DRfFWPrRzoAZ4kc0nPuO95MT4C+xcIvHAqYddWaT9/wUgLjjuPuYP1YFNKjGuQFVb4AR2lxYT0xfrJOuTCZ0DCmoL4rbqZfNpShMEn2a5uVsNI58ToMvbr35TUut9QcN6wZptyfBX07lRM5Zu5KnwbRa+QsNTe0Quy7hv6EowqP2whRAsfkhaaxuzgO/n0iABdxgtxvdpnLG4bhS7fSI1jx3wjU+cLOMAqoFwJ4I5Lbg==
Received: from DS0PR17CA0003.namprd17.prod.outlook.com (2603:10b6:8:191::17)
 by LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Tue, 17 Dec
 2024 01:08:19 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::ae) by DS0PR17CA0003.outlook.office365.com
 (2603:10b6:8:191::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Tue,
 17 Dec 2024 01:08:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Tue, 17 Dec 2024 01:08:18 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 16 Dec
 2024 17:08:07 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 16 Dec
 2024 17:08:07 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 16 Dec 2024 17:08:06 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: <krzk@kernel.org>
CC: <airlied@gmail.com>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, 
 <dri-devel@lists.freedesktop.org>, <johnliu@nvidia.com>,
 <jonathanh@nvidia.com>, <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>, 
 <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <luca.ceresoli@bootlin.com>, <maarten.lankhorst@linux.intel.com>,
 <mperttunen@nvidia.com>, <mripard@kernel.org>, <robh@kernel.org>,
 <simona@ffwll.ch>, <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
 <tzimmermann@suse.de>
Subject: Re: [PATCH v1 1/5] dt-bindings: display: tegra: Add actmon information
Date: Mon, 16 Dec 2024 17:08:05 -0800
Message-ID: <20241217010806.15703-1-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <262c8d8f-f53c-455b-9bca-3440afb7bcd6@kernel.org>
References: <262c8d8f-f53c-455b-9bca-3440afb7bcd6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|LV2PR12MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: a36f05d2-1ec5-4c4a-eb10-08dd1e374b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ys6wPC8yKHnqpc1QDxwGoJ98tc35ZSpUJcR58cFC7RwvO4vTshTMtSFo4NRl?=
 =?us-ascii?Q?sSHc2hfpFZ3DJv9pDczqXC4x9xZAiu59zGBiZCKEDlfaeZU2eHY54AUcsYVm?=
 =?us-ascii?Q?eG82O8pmva/xaNb1EzzbE8NEihEoWmvy6fh8EoVOvnCRWHv56Sy3vemTCjxw?=
 =?us-ascii?Q?Ps9lGUPMtQYHSr0jOW3p9agYmTjTJYugHhO8OS6yIxtDNWbd2I7I/xl1dsoy?=
 =?us-ascii?Q?VLstyXb6/45Iw8A2zVuU5eQBJRmLdZ6TzYFPayj1jMKZu33IJZDmAh/LiWVc?=
 =?us-ascii?Q?s0YRFpNJ9vgsmqXlYgQrFpRvo3LNRdE6dUW28xS8etfcg2uip28X/Na3GDPL?=
 =?us-ascii?Q?Qk058SM4rXbQuMQN9z1jTOroy5TLxHs/yAZseCqA7AhlFuGqn/NIYK4NmxzM?=
 =?us-ascii?Q?lDPcWJ76nVWdGe7jSq5qByWYCGk3dcVf7yf9Xr6oX9VmT8/rCXj+gRqYkq2s?=
 =?us-ascii?Q?ln8A3qjzQaioYV1Wm92WMumGBmD1/3Kz4s+Yveq+OpoOSxr29a/xOsdNWqQG?=
 =?us-ascii?Q?ATSd887liuKMjmG0aAHXFqOzAr1+hjcTyR8H+/HQoAPdW/vvZEUJHOKM5ATv?=
 =?us-ascii?Q?bf4U9Qy7/RBwvCpghELXV1kmzLmlbWygmuck52Y96EXwIxMqzzwVvcjOM0PK?=
 =?us-ascii?Q?tm6E1+RcQJ06pH59O+zchYns++KmlwyH67JUpsej+wIh5StLDokaQCZhSio/?=
 =?us-ascii?Q?oiJBQKd/vKVumcJ8cX+0K+lUCHN3lhDdNq3ipHQ48I+c8hxvuO4GfPMkL++H?=
 =?us-ascii?Q?rDkkPqJvHR+HZ16pdx5AxqZpv7/L5YPfe/AHSI/hkQ4GlnBtgUyAkWaUNkae?=
 =?us-ascii?Q?r+68lF7Wh3emi9JVJ7YHISuU5i8GC3qB1TBsc4p0f8oIeZhsA//u6H38plUO?=
 =?us-ascii?Q?iWbHbGQ+Yl9Y3zaoOaGtzWR/EmYJqxt65ZyPPseU8nX+6UF0cAs7mov5uLA/?=
 =?us-ascii?Q?qIYV+X7qmMT0FiigB1Sp9E8e5cIQ4EIsv+YfoTt9VqmJLY1Ff08RnFHpNJ/l?=
 =?us-ascii?Q?vNKts0UifsCbzjQHUd+za1e04Ei4x0RxtFkB1vNVb2FqIysg5dB7i3npq+ir?=
 =?us-ascii?Q?YZwwRjXCED3XlDq/jjwaveD4TKwve86ofb+snLwSQQxAow41MF2gngyqf54S?=
 =?us-ascii?Q?C66leNCcSD10sM6SEdUStR4ZY52h4asOUvd94eLYXA6flgQFxyOlZR3bZlrV?=
 =?us-ascii?Q?82fknniKOiG7tvV9lwxBfDD9SEHTHJuN3o/H3J8Kth8d7tPjJNGTFU6vCAoX?=
 =?us-ascii?Q?fVaHJGfqI9Sg4taidWp5DXJ9xkYw9C/HA8S60jcWVjU6z4fkxJJYy36TNyqT?=
 =?us-ascii?Q?R3aqFHSM4LkEndddXEtDWNRyFqjxBcsXb2RfnLs/iHzlzXCmRu/skNqb/14Y?=
 =?us-ascii?Q?zqMbzH3ZD8BLI66g7lq/rF5fWmQ6i4yS3a4mXf4I7WCRTjYwbDlON0dqQElw?=
 =?us-ascii?Q?iQpN9T21D0tislixf5x2yoOUZepd+8zqL9jA58Rc4xsFZArFLOJDeAwvYvYf?=
 =?us-ascii?Q?9k2SUOEbcv2OLAI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 01:08:18.5301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a36f05d2-1ec5-4c4a-eb10-08dd1e374b00
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5968
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

> On 14/12/2024 00:29, Johnny Liu wrote:
> >> On Tue, Dec 10, 2024 at 09:45:50AM -0800, Johnny Liu wrote:
> >>> An activity monitor (actmon) is used to measure the device runtime
> >>> utilization to help drive software power management policies.
> >>>
> >>> Extend the reg space to include actmon aperture for actmon configuration
> >>> through host1x.
> >>
> >> We kind of see that from the diff. Say what we do not see, e.g. ABI
> >> impact or why this is flexible/optional for existing devices.
> >
> > Since actmon is not well-supported for the previous chips (e.g. T210,
> > T186, T194, and etc) in this patch series, it's essential to make the
> > specification of regs property optional for the previous chips.
>
> Then your schema should express it.

Could you explicitly point out which part doesn't express it well?

Considering old variant T194, the schema in this patch already made the
specification of actmon related properties optional.

If users specify actmon clock handle in clocks/clock-names properties:

 host1x@13e00000 {
	 compatible = "nvidia,tegra194-host1x";
	 // ...
	 clocks = <&bpmp TEGRA194_CLK_HOST1X>,
		  <&bpmp TEGRA194_CLK_ACTMON>;
	 clock-names = "host1x", "actmon";
	 // ...
 }

Running the dtbs_check will report error WITHOUT this patch will have
the following error:

$ make O=out ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml

/out/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: host1x@13e00000: clocks: [[5, 46], [5, 1]] is too long
/out/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: host1x@13e00000: clock-names: ['host1x', 'actmon'] is too long


> >
> > Enablement/Disablement of actmon won't affect the host1x main functionality.
> > Its main job is to monitor the engines behind the host1x and serve for
> > telemetry purpose.
> >
> > I could update the commit message to include the above reason. Please
> > let me know if more information is required.
>
> And fix the schema to make it optional only for older variants.

To maintain backward compatibility, shouldn't we keep the newly added
feature optional for all the variants?


Thanks,
Johnny
