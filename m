Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06AD9575F2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160C710E375;
	Mon, 19 Aug 2024 20:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="43GyZT0A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B1410E376;
 Mon, 19 Aug 2024 20:57:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJG3d2/+e/po6eL6/aqOQtlGsfine5emy4W+lHYF/EiSraIoXa5TnIQtQWnt9wIMidFPdgAEPcwfV7RrPTVwJc0AWuDGkyKYox4f83L/G4PmncdojXLJMAlbvItTCZGqBmK8jOjCGhINkxuCxdC/aJRon1wLDJFR0mCmZksgxIRdWAzI6bINo/9CuaEz6Oz3UijvNNbPNmOVsJCbLy/n+5IH6HTFKSvXp9d5Eto02ZXnGdHRN5ZyCPKv+OdSckQDRKjAO2BxdbV3Esm+Bxpx2JyqqK5GhtBptamZw60KHxbLPSQ4pbqE3GJinmClqkI76GEWnqKjkwDAPz3MaR20qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9/IqHVQkOC4MwHj5mHGMXrnFe43hYk6gaTRTltfdXM=;
 b=d1HgAcRqvPdrfNQkuEE0DETeCaQ38UIOoJMMoMDuepDvT9Kr1gvGaa+Ew8enFLXJ8n2Bdh58dsCz7R53k1fY8hHldiq7TlM5E+Hez/K6urHCkGf+xXDHN8GyyPsXtAl/+D8NhXx+uVJxB5SnFD/b4kdWczM61JwE5rdjw5nwXqRuAtPvicjbtBdVDpu5shpxoJk8QlBAXeiOr+ItgQlX4pqY2GG2cAW+sCpuAMyV3Dnrei1ZwlIYtkWG5PmI0hImd5dEKF6bKUbGORgREGgIjJBko5fpXbO8eA2pvO7msHTnxp/St9JM8g0rKHNc4/O59GbImoT8GUsyghPZjj/T8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9/IqHVQkOC4MwHj5mHGMXrnFe43hYk6gaTRTltfdXM=;
 b=43GyZT0ADi89HISJv8Lpcs57aUp1V0M+2zw+BJ2a6OGBaeqE3N46B6MupF3WXIK5WBT8eq1AOI2Q9pL5XEHonr6QdAYyuGrEwYNBGZ/Y/T0hlAt9lsq543/ZJ1Mrm4hpcsEKjk4jC4pCmx0LdUJQbqz9DriMkgwXljlcIyL7XmY=
Received: from MN2PR17CA0020.namprd17.prod.outlook.com (2603:10b6:208:15e::33)
 by DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Mon, 19 Aug
 2024 20:57:19 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::b1) by MN2PR17CA0020.outlook.office365.com
 (2603:10b6:208:15e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:18 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:16 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>, Ville Syrjala <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Simon Ser
 <contact@emersion.fr>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>, Sebastian Wick
 <sebastian.wick@redhat.com>, Shashank Sharma <shashank.sharma@amd.com>,
 Alexander Goins <agoins@nvidia.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>, Aleix Pol
 <aleixpol@kde.org>, Xaver Hugl <xaver.hugl@gmail.com>, Victoria Brekenfeld
 <victoria@system76.com>, Sima <daniel@ffwll.ch>, Uma Shankar
 <uma.shankar@intel.com>, Naseer Ahmed <quic_naseer@quicinc.com>, "Christopher
 Braga" <quic_cbraga@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Hector Martin <marcan@marcan.st>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Sasha McIntosh <sashamcintosh@google.com>, 
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH v5 00/44] Color Pipeline API w/ VKMS
Date: Mon, 19 Aug 2024 16:56:27 -0400
Message-ID: <20240819205714.316380-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|DS7PR12MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: f62b1356-74af-4db0-fdd9-08dcc09183a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTEvSUk3NURTc2xDQ1RSZGpmbkRzTWp2dHFKejhLVXpSTjdHK1haZFRXN0dZ?=
 =?utf-8?B?bUdmcS8zdmlMUkpJMWxoSkFJVWZ2ak5JNm1Ccno5dlJYMzVwL0NpSUNFdS9q?=
 =?utf-8?B?OW5tUHhiakdiaVVXL1doSmVCbjBqTlVWdTdLNWJ6dHNIdTVUZFZKZTFPMXlP?=
 =?utf-8?B?QnBQUnVybGFDY2FXQjR0d2pGWFBmWjNGd3ozTXFENWFaZFgvQTdWa1JiK1dt?=
 =?utf-8?B?Mjc0WkQxTmRKM01EbTFpdElEN0NBQ1pYbk8rWFlqNTZXVnlTRnJsRFpickdM?=
 =?utf-8?B?cGVQRVkxKzUrTDdBMGtYcnRQbFNmbSsxUTdsVzlQRXFSbzhNYldqYkZlQSsy?=
 =?utf-8?B?eUdreXRYSmkxYmwyd0Rsc2c3Q08vdHVoOUE5aGo2L1QxbUFXS2tVWmlVUHl2?=
 =?utf-8?B?bWhLSkw5b0FPY1dCanJEc051SUNiZjhnaElEN1JNa28vTjlVblB1dzlBd2sw?=
 =?utf-8?B?SG1FaGFWMDN0cFBzbFlMWDBycDhRRGJrWmx1SUpaOXhNbnVqNWJPTkRqQmxO?=
 =?utf-8?B?OUhoL09Pd0RlUzl3TEx4QlRWMkdpak80WDZIZHExRVVFNXVoczZGSzdkbDRH?=
 =?utf-8?B?dCtNTG9BaHdYZCtWbDRjVUF4YkV0anh4MVF4cXM0VGhjNWU0QkwyRzltQ1hO?=
 =?utf-8?B?VFpld3NSN2ZvWE1XRVFrY1l4cHFSeHFPT29kRENaRG1OVkwwWTVZL2xyVUNU?=
 =?utf-8?B?SkYrUUdCd0ZkYVVDcWZBQ1haazdSZFpReGgvTE5iNWVhS1VETnFLOFIxbmZ5?=
 =?utf-8?B?bHR4eTZBdlJQN0VkY282RXM1TlJBZ21aKy9NdDBaSHk3SHB3UzA2Qko3c0g0?=
 =?utf-8?B?T3FDWGVQQUhQRkRFeUlUZXBoUVpMSjVqRkthWmxFLzRGS25seDFJbU5ucnRG?=
 =?utf-8?B?bGNDRzN3TUpMSzlzYVdreGVEMndhMUNZVEQwQTl4NE5nL3dhYUNyb2JQVU1O?=
 =?utf-8?B?R3VKQUxScTF0VTVsUWJBS1I3azNSUi9zbFZWbDhJOGZrMFdpVlM5RUhjUUZU?=
 =?utf-8?B?RjBHazE4bW95dWljdys3djFpVkVZWnRuNnhsK3R0dEZVOVZmMDQ5TDBCcHc3?=
 =?utf-8?B?R2VRZkRPb1VkRVU2a3pmL1VOS0dPcVZZQ3ovNW45Q0NzQWsyK3p5NlU3MTlD?=
 =?utf-8?B?eEVGZVpBWXlWQ3gwQ2t3KytOWW85V1ZaWEwvd21uTWNUUDhjZjFZSjlVTnJS?=
 =?utf-8?B?bkFrMHBvQmlxaGpiOG5lUG8wbFBYcGQ0QUN2SHpJYXdwc1E1c0trVjgwNTFT?=
 =?utf-8?B?NGZPbjJGWHpCd2RXWDQ0bEIra0QxYzlMcHBPckhkcktZQThrVmtaUGFNUjBN?=
 =?utf-8?B?WERVY1RabDFqVk1aY3JpL2c3eElndjdsVWtlZW9sRHcvMFNrU2V3bEowck9s?=
 =?utf-8?B?cmRwd2tVVTgya2p6MFBseFg0S050NG9iRjV3YTgyN3htbW9ZZWd0Y0tFNTNF?=
 =?utf-8?B?R3dsZnBqbTdHYlArbUhpeFdQUkdQUUMvY3ZUNXB5KzA3ekRoRjJhZmVTM2JO?=
 =?utf-8?B?dDd5MTJBRmNmcWhHVlV0ZGF0d2NjR212dmhrb0hKbnJEVVdoamVWY2RKTVBD?=
 =?utf-8?B?YjdueDEvU0VJcC9Fb3k4SnliekVRQmJVVkpJTllmSzJLdWlmc0dHOXZON01G?=
 =?utf-8?B?TXJubUc3ZCtWWGlIT0V6UEpmZUF3cWNxTUpVY1lGMEZmckNTWm1CMDNzUlNt?=
 =?utf-8?B?NGF3cE9UMzF5UWtSOHhpUGZkWTdDU25TYTdrcHFDZHNCdVpTTW1SNHBDb1dD?=
 =?utf-8?B?ck81cDFVQ1J5ZSt0aTJMZHZXeEZ0QXgyQ3M2WVlTVE9ZSTFTbmxmVEYySDZR?=
 =?utf-8?B?ekZKUVpteUVsNjJHd29PdS9BVS9sNUo5S0J1TGwzME1pcWg1cTViVUFiYUlV?=
 =?utf-8?B?OVdQQURGck92QjhBSGhSelBqLzBJL0VpTmlRSG82Wm1GY1E9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:19.0889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f62b1356-74af-4db0-fdd9-08dcc09183a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6095
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

This is an RFC set for a color pipeline API, along with implementations
in VKMS and amdgpu. It is tested with a set of IGT tests that can be
found at [1]. The IGT tests run a pixel-by-pixel comparison with an
allowable delta variation as the goal for these transformations is
perceptual correctness, not complete pixel accuracy.

v5 of this patchset fleshed out documentation for colorops and the
various defines that are being introduced.

VKMS supports two named transfer function colorops and two matrix
colorops.

Amdgpu advertises the following pipeline for GPUs with DCN 3 or newer:

1. 1D Curve EOTF
2. 3x4 CTM
3. Multiplier
4. 1D Curve Inverse EOTF
5. 1D LUT
6. 3D LUT
7. 1D Curve EOTF
8. 1D LUT

The supported curves for the 1D Curve type are:
- sRGB EOTF and its inverse
- PQ EOTF, scaled to [0.0, 125.0] and its inverse
- BT.2020/BT.709 OETF and its inverse

Note that the 1st and 5th colorops take the EOTF or Inverse
OETF while the 3rd colorop takes the Inverse EOTF or OETF.

The 3D LUT is a 17^3 tetrahedrally interpolated LUT but the mechanism
exists for other drivers to describe their own 3D LUT capability.

This mirrors the color pipeline used by gamescope and presented by
Melissa Wen, with the exception of the DEGAM LUT, which is not currently
used. See [1]
https://indico.freedesktop.org/event/4/contributions/186/attachments/138/218/xdc2023-TheRainbowTreasureMap-MelissaWen.pdf

At this point we're hoping to see gamescope and kwin implementations
take shape. The existing pipeline should be enough to satisfy the
gamescope use-cases on the drm_plane.

In order to support YUV we'll need to add COLOR_ENCODING and COLOR_RANGE
support to the color pipeline. I have sketched these out already but
don't have it all hooked up yet. This should not hinder adoption of this
API for gaming use-cases.

We'll also want to advertise IN_FORMATS on a color pipeline as some
color pipelines won't be able to work for all IN_FORMATS on a plane.
Again, I have a sketch but no full implementation yet. This is not
currently required by the AMD color pipeline and could be added after
the merge of this set.

VKMS patches could still be improved in a few ways, though the
payoff might be limited and I would rather focus on other work
at the moment. The most obvious thing to improve would be to
eliminate the hard-coded LUTs for identity, and sRGB, and replace
them with fixed-point math instead.

There are plenty of things that I would like to see, but they could
be added after the merge of this patchset:
 - COLOR_ENCODING and COLOR_RANGE
 - IN_FORMATS for a color pipeline
 - Is it possible to support HW which can't bypass entire pipeline?
 - Can we do a LOAD / COMMIT model for LUTs (and other properties)?
 - read-only scaling colorop which defines scaling taps and position
 - named matrices, for things like converting YUV to RGB
 - Add custom LUT colorops to VKMS

IGT tests can be found at [1] or on the igt-dev mailing list.

A kernel branch can be found at [2].

I've also rebased Uma and Chaitanya's patches for the Intel color
pipeline on top of this to show how I envision them to mesh with
my changes. The relevant branches can be found at [3] for the kernel
and [4] for IGT. There were some rebase conflicts in i915 and I'm
not entirely sure I've resolved all of them correctly, but the branch
compiles and shows my thoughts for the new DRM concepts to support
Intel's pipeline.

[1] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/amd-color-pipeline-v5
[2] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-color-pipeline-v5
[3] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-intel-color-pipeline-v5
[4] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/amd-intel-color-pipeline-v5


v5:
 - amdgpu 3D LUT
 - Don't require BYPASS
 - update RFC docs and add to TOC tree
 - add drm_colorop and COLOR_PIPELINE kernel docs (non-RFC)
 - add amdgpu color pipeline doc
 - define SIZE property similar to drm_crtc's GAMMA_SIZE
 - various minor fixes and cleanups

v4:
 - Add amdgpu color pipeline (WIP)
 - Don't block setting of deprecated properties, instead pass client cap
   to atomic check so drivers can ignore these props
 - Drop IOCTL definitions (Pekka)
 - Use enum property for colorop TYPE (Pekka)
 - A few cleanups to the docs (Pekka)
 - Rework the TYPE enum to name relation to avoid code duplication (Pekka)
 - Add missing function declarations (Chaitanya Kumar Borah)
 - Allow setting of NEXT property to NULL in _set_ function (Chaitanya Kumar Borah)
 - Add helper for creation of pipeline drm_plane property (Pekka)
 - Always create Bypass pipeline (Pekka)
 - A bunch of changes to VKMS kunit tests (Pekka)
 - Fix index in CTM doc (Pekka)

v3:
 - Abandon IOCTLs and discover colorops as clients iterate the pipeline
 - Remove need for libdrm
 - Add color_pipeline client cap and make mutually exclusive with
   COLOR_RANGE and COLOR_ENCODING properties
 - add CTM colorop to VKMS
 - Use include way for kunit testing static functions (Arthur)
 - Make TYPE a range property
 - Move enum drm_colorop_type to uapi header
 - and a bunch of smaller bits that are highlighted in the relevant commit
   description

v2:
 - Rebased on drm-misc-next
 - Introduce a VKMS Kunit so we can test LUT functionality in vkms_composer
 - Incorporate feedback in color_pipeline.rst doc
 - Add support for sRGB inverse EOTF
 - Add 2nd enumerated TF colorop to VKMS
 - Fix LUTs and some issues with applying LUTs in VKMS

Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Sima <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Hector Martin <marcan@marcan.st>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Sasha McIntosh <sashamcintosh@google.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Alex Hung (13):
  drm/colorop: define a new macro for_each_new_colorop_in_state
  drm/amd/display: Skip color pipeline initialization for cursor plane
  drm/amd/display: Add support for sRGB EOTF in DEGAM block
  drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
  drm/amd/display: Add support for sRGB EOTF in BLND block
  drm/colorop: Add 1D Curve Custom LUT type
  drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
  drm/amd/display: add 3x4 matrix colorop
  drm/colorop: Add mutliplier type
  drm/amd/display: add multiplier colorop
  drm/amd/display: Swap matrix and multiplier
  drm/colorop: Add 3D LUT supports to color pipeline
  drm/amd/display: add 3D LUT colorop

Harry Wentland (31):
  drm: Add helper for conversion from signed-magnitude
  drm/vkms: Round fixp2int conversion in lerp_u16
  drm/vkms: Add kunit tests for VKMS LUT handling
  drm/doc/rfc: Describe why prescriptive color pipeline is needed
  drm/colorop: Introduce new drm_colorop mode object
  drm/colorop: Add TYPE property
  drm/colorop: Add 1D Curve subtype
  Documentation/gpu: document drm_colorop
  drm/colorop: Add BYPASS property
  drm/colorop: Add NEXT property
  drm/colorop: Add atomic state print for drm_colorop
  drm/plane: Add COLOR PIPELINE property
  drm/colorop: Add NEXT to colorop state print
  drm/vkms: Add enumerated 1D curve colorop
  drm/vkms: Add kunit tests for linear and sRGB LUTs
  drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
  drm/colorop: Add 3x4 CTM type
  drm/vkms: Use s32 for internal color pipeline precision
  drm/vkms: add 3x4 matrix in color pipeline
  drm/tests: Add a few tests around drm_fixed.h
  drm/vkms: Add tests for CTM handling
  drm/colorop: pass plane_color_pipeline client cap to atomic check
  drm/amd/display: Ignore deprecated props when plane_color_pipeline set
  drm/amd/display: Add bypass COLOR PIPELINE
  drm/colorop: Add PQ 125 EOTF and its inverse
  drm/amd/display: Enable support for PQ 125 EOTF and Inverse
  drm/colorop: add BT2020/BT709 OETF and Inverse OETF
  drm/amd/display: Add support for BT.709 and BT.2020 TFs
  drm/colorop: Define LUT_1D interpolation
  drm/colorop: allow non-bypass colorops
  drm/amd/display: Add AMD color pipeline doc

 Documentation/gpu/drm-kms.rst                 |  15 +
 Documentation/gpu/rfc/color_pipeline.rst      | 376 ++++++++
 Documentation/gpu/rfc/index.rst               |   3 +
 drivers/gpu/drm/Makefile                      |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 581 ++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 196 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
 drivers/gpu/drm/drm_atomic.c                  | 184 +++-
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 175 ++++
 drivers/gpu/drm/drm_colorop.c                 | 562 ++++++++++++
 drivers/gpu/drm/drm_ioctl.c                   |   7 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/drm_plane.c                   |  52 ++
 drivers/gpu/drm/tests/Makefile                |   3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c         |  69 ++
 drivers/gpu/drm/vkms/Kconfig                  |   5 +
 drivers/gpu/drm/vkms/Makefile                 |   4 +-
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 449 ++++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           | 102 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 115 ++-
 drivers/gpu/drm/vkms/vkms_drv.h               |   8 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
 include/drm/drm_atomic.h                      | 130 +++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_colorop.h                     | 427 ++++++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  18 +
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  19 +
 include/uapi/drm/amdgpu_drm.h                 |   9 -
 include/uapi/drm/drm.h                        |  16 +
 include/uapi/drm/drm_mode.h                   | 156 ++++
 40 files changed, 4595 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
 create mode 100644 drivers/gpu/drm/drm_colorop.c
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
 create mode 100644 include/drm/drm_colorop.h

--
2.46.0

