Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D78AA4022
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B9010E5E3;
	Wed, 30 Apr 2025 01:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LwyHxvxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2784810E5D9;
 Wed, 30 Apr 2025 01:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DF+Z4ZgQeWjOMbZwH2PYNH6nVr6o8ERqPJi8f0NsdTf8GvFjUm4xZFStphnmR/cCv+XWZAWczzUI+3HWmDpXlVQp/Spk444qHyj35ao/gDS6BLDsGqkU23VbEk9MuVqVFZ8149PwluceoOxv52AncM+uyJfAD/bZTHNPyXGi9KQngPdDWeWzumXXtW8I4fq0zMtHij5zR5QBHBe2LHvjdeGcy0B7IUtHT2XrWE2fh/BlgBcYHU4pLtnH9Whs/HqsWpjJEVaaO3foDlKawLwzXQtQZvrTGvvNngyGHjlpmMz3bwNsAZHvMvBd5b569/UTSN2VZuyUHstzZC5qLhWrpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ds/6uwscQUFgph9zMTs6VSm/8XK1HPBD3ZdAVFSAVfw=;
 b=xBPcSNpvIldDgsuvS7igY4/7PwiTSpRjNvcf+yHS+mj1Q2TWAFyrseQDLj/76I+arCdGMIRNOqH0odbnV6/ewzMIsMZSf28Ztd7z8FdbmE9svtqwpRYq8RrlH6CEuC92xHMepSqh50hfCz9KkZRdz8aIDlLGVosaTXj36aiki1f26CXP5gXmjnba/5WDcHrNE8yiS3Zbw47OTbK/+7aj2dAlfwxQ+lliyug9F8XIkmul+hR8U67Jir7qfNJFkW6Uar+drGsluiWypefCL2YzAWq5Hgx9KsupyCVUf/PmBXSeLQ5j7tjVN+K9/t4cfS8Nmjpfn/qK3Mm9wg2dd4DiPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ds/6uwscQUFgph9zMTs6VSm/8XK1HPBD3ZdAVFSAVfw=;
 b=LwyHxvxxHGu35nlPuNW+nCIY01iwyUBqkuSlw0qUALXHiJHcIlVA9IQYWeLk0lqO56tM0JTdOqQMEqR5lArGcFyibBtD4gDqzAOgOFAPKwf928h2xOmwLjteLi+PjVnVYAimGodVPDLLXFLrxB1hzeZL9MSdkhwUUWfrYBHJyBE=
Received: from SJ0PR03CA0082.namprd03.prod.outlook.com (2603:10b6:a03:331::27)
 by SJ1PR12MB6241.namprd12.prod.outlook.com (2603:10b6:a03:458::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 01:12:39 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::bb) by SJ0PR03CA0082.outlook.office365.com
 (2603:10b6:a03:331::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 01:12:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:12:38 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:12:34 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 03/43] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Date: Tue, 29 Apr 2025 19:10:33 -0600
Message-ID: <20250430011115.223996-4-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|SJ1PR12MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: c53b017c-c363-44fb-8071-08dd87841965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z291bHk4NWdDYjVxSmNBR2hpVXlxYVhDWUtpVytscDVOdlppQkkvbXBxblk1?=
 =?utf-8?B?bUFPeXpSOFlHVzdaQjY0ekwyaGpTNjdLSiswd1ZGZm1ielVZcXRRRnVJRGFj?=
 =?utf-8?B?TWVTV2FWRzVPdStlS2QzZk83eVJvV2VINExOd3A1VTMzU1lNOStISFM2amlG?=
 =?utf-8?B?MnMxSE9FNWRRWFZ0QXNqbzhlN2Z6dVhudE16dGJHbGJDaFFVNG1QNzk3cFA3?=
 =?utf-8?B?QVY2Nm5JWkkxY3JXd0JaSFEwbFg4RTJVdCsvOUVUck9FQTRybS84SlFzQUo5?=
 =?utf-8?B?UlB0NVNRaTAreW5lUnpzeTM0Q01IcHdzRnVwOW5EenROM3RNRHRhVFdjckkz?=
 =?utf-8?B?cmQwRFZ4UVNsZnhRbzY5alJXbmloV0FqSmcvOUJndWQxSU1zaW00Vy9jSExP?=
 =?utf-8?B?ZUF4dTEyNDB5STJVNlFDWDVYYUpleHNJYnRqa1JCekNZbnN4dnBPM0k1R2hY?=
 =?utf-8?B?L0NPV1ZhL3lHbkoyWUtORFMydGNoWGo1b2JCUTc5R3VBTkNId2lPb3FFQS9M?=
 =?utf-8?B?b0J1bzdEMms2R3I4MmkrakhVblFpQldNTVp2YW5MSmhBL2wzOWtkdGlhVkJa?=
 =?utf-8?B?dFR0d20vclZuSDRZVFgxQm1pSXU3cGpnSTNURWVSRTV3TGdJVi8vRjR6dzBZ?=
 =?utf-8?B?V2RLOGhpK0FsS0IxNHdmbTFyWSt6NElvQm9zb2tkSWQwdTZCN2lQYlhvMkF6?=
 =?utf-8?B?Z0ppUnUya3c1cjRuSzQ1RHcxVlZYMWVSYjVyeEVTVnRBUHlXZTMxZjZvL1Zh?=
 =?utf-8?B?R1ZSMWpza0doek1SbjVwcDM4dVR6MWoxcVRSY0FiSHpzdHkxb29tNUJiUjlG?=
 =?utf-8?B?OEpHdy9TSEFkcU1HYkdsdGE4OTlpN0dCQ1RvOVBEYzRiRjEzakEwTXJncVZT?=
 =?utf-8?B?eVJ6VittVlM3S0tTb1NyNTVXU1FUOU01V2hubGEyWDBwWjM0VDZ3SERXeHJk?=
 =?utf-8?B?NXlac1plSXhQS0dZTHp6akZwaFpaNnJ1bS95bXVPaFExQ1pYalJRWGo2aVhu?=
 =?utf-8?B?MUdmREZkdHhhMjBpaW52NzdjeWNKZ1h6WDMrNHJJS3Z3ZE1KWHd2ZmF4NzBZ?=
 =?utf-8?B?K1VmZWxjY2Y3YU0yK25FdnVBcyttUWNOT0NmWlZHTXpTMkw0MmE0ZW5pLzVS?=
 =?utf-8?B?blVGeFlhYnBsZzFOenJjb1VRSjdhVnVtU3crOUt4MVJlZFRmY0FDY2dJRVJN?=
 =?utf-8?B?RGoxc1piSkQvcHJ4WTd1elEzNUE3MXJmV2pxRG1vYTBLeGN6QjFtZlFVVm9H?=
 =?utf-8?B?YXNRbUpRZ0dvby9iaC83djNzVnk1YVB6bjRNdWhrSmliaUtGV1V0cE1SYXdt?=
 =?utf-8?B?QzRDWk9Fc3RCTjBjRWgyNHlCQitNUjFzekRZdll4MnRaYkl1TXhCVWVobWpx?=
 =?utf-8?B?VTZqR3JjRWpjRFFOUi9hb3VSRE5PR1phVmFCeERXRUtQNjl1SUZEWDArVW16?=
 =?utf-8?B?VUR4TjFQdklkSE5xRnBtMVFiWnZTeTJaL2ViUmRHTFF2Q1NWQjVWSEs3eGZq?=
 =?utf-8?B?MVhLd2E0eTJRdzR3Nm4rK2dEem45QktZeDEvMGNVNGhZU0YwU2ltcWUxWHZz?=
 =?utf-8?B?ZWxNUzhyZ2YySFJzNTVVa0JUU3pIcFBLU096REY4VmM4bDRVTjZ3bFJsRVV3?=
 =?utf-8?B?TVk3M0dhRHZvOEhua1ZMZ25lZ0U4ZVBQdEw3RzhML0hvS2dOd2pTSXV0cHd3?=
 =?utf-8?B?a2M4QTErQXAzRkpCZVExSVBLUXdRZlI0a1l5MUdQbkdlZEVpbm96T0E1YXRQ?=
 =?utf-8?B?RjIrSjA0ZVVYTFBFZWxZWUVDK0MrWE5FekVQSDZJai9wMlc4ZW9lVUNmKzJQ?=
 =?utf-8?B?Y1Bka2JhbitheDZveTdGdDNNcVNhN3E1NzlnSksrbGZqV2xZcll0TDlSdVpJ?=
 =?utf-8?B?UnBGenBCUlpkYUwycjNCNWp3bXo0dzZOVW5DcDA5Zi9aMjRxMkducmxtQlJB?=
 =?utf-8?B?dnZyZHBUaThzMVpCUlVqVGp4UVVEYVRWbnZpa2FHaU9XL2ptVnB3T1IyMVBK?=
 =?utf-8?B?a1k0REQydnhwQTVZbHAxRmVjRURiRjRmT1A3OWcvOFJkMENUQk1CYVBoQlg4?=
 =?utf-8?B?ZU1zQ1FHVkZQb2F0SzhjSmx0Sms2YUpxbDlpUT09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:12:38.7200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c53b017c-c363-44fb-8071-08dd87841965
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6241
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

From: Harry Wentland <harry.wentland@amd.com>

Add documentation for color pipeline API.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V9:
 - Update documents according to new 3DLUT changes (Simon Ser)
 - Spell out the behaviours when fallback to shaders/CPU (Simon Ser)

v8:
 - Fix typo "definint" -> "defining"

v7:
 - Add a commit messages

v5:
 - Don't require BYPASS to succeed (Sebastian)
 - use DATA for 1D and 3D LUT types (Sebastian)
 - update 3DLUT ops to use 3DLUT_MODES and 3DLUT_MODE_INDEX
 - Add section on drm_colorop extensibility
 - Add color_pipeline.rst to RFC toc tree

v4:
 - Drop IOCTL docs since we dropped the IOCTLs (Pekka)
 - Clarify reading and setting of COLOR_PIPELINE prop (Pekka)
 - Add blurb about not requiring to reject a pipeline due to
   incompatible ops, as long as op can be bypassed (Pekka)
 - Dropped informational strings (such as input CSC) as they're
   not actually intended to be advertised (Pekka)

v3:
 - Describe DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE (Sebastian)
 - Ask for clear documentation of colorop behavior (Sebastian)

v2:
 - Update colorop visualizations to match reality (Sebastian, Alex Hung)
 - Updated wording (Pekka)
 - Change BYPASS wording to make it non-mandatory (Sebastian)
 - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
   section (Pekka)
 - Use PQ EOTF instead of its inverse in Pipeline Programming example (Melissa)
 - Add "Driver Implementer's Guide" section (Pekka)
 - Add "Driver Forward/Backward Compatibility" section (Sebastian, Pekka)

 Documentation/gpu/rfc/color_pipeline.rst | 378 +++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst          |   3 +
 2 files changed, 381 insertions(+)
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst

diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/gpu/rfc/color_pipeline.rst
new file mode 100644
index 000000000000..cd1cc2d0f988
--- /dev/null
+++ b/Documentation/gpu/rfc/color_pipeline.rst
@@ -0,0 +1,378 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================
+Linux Color Pipeline API
+========================
+
+What problem are we solving?
+============================
+
+We would like to support pre-, and post-blending complex color
+transformations in display controller hardware in order to allow for
+HW-supported HDR use-cases, as well as to provide support to
+color-managed applications, such as video or image editors.
+
+It is possible to support an HDR output on HW supporting the Colorspace
+and HDR Metadata drm_connector properties, but that requires the
+compositor or application to render and compose the content into one
+final buffer intended for display. Doing so is costly.
+
+Most modern display HW offers various 1D LUTs, 3D LUTs, matrices, and other
+operations to support color transformations. These operations are often
+implemented in fixed-function HW and therefore much more power efficient than
+performing similar operations via shaders or CPU.
+
+We would like to make use of this HW functionality to support complex color
+transformations with no, or minimal CPU or shader load. The switch between HW
+fixed-function blocks and shaders/CPU must be seamless with no visible
+difference when fallback to shaders/CPU is neceesary at any time.
+
+
+How are other OSes solving this problem?
+========================================
+
+The most widely supported use-cases regard HDR content, whether video or
+gaming.
+
+Most OSes will specify the source content format (color gamut, encoding transfer
+function, and other metadata, such as max and average light levels) to a driver.
+Drivers will then program their fixed-function HW accordingly to map from a
+source content buffer's space to a display's space.
+
+When fixed-function HW is not available the compositor will assemble a shader to
+ask the GPU to perform the transformation from the source content format to the
+display's format.
+
+A compositor's mapping function and a driver's mapping function are usually
+entirely separate concepts. On OSes where a HW vendor has no insight into
+closed-source compositor code such a vendor will tune their color management
+code to visually match the compositor's. On other OSes, where both mapping
+functions are open to an implementer they will ensure both mappings match.
+
+This results in mapping algorithm lock-in, meaning that no-one alone can
+experiment with or introduce new mapping algorithms and achieve
+consistent results regardless of which implementation path is taken.
+
+Why is Linux different?
+=======================
+
+Unlike other OSes, where there is one compositor for one or more drivers, on
+Linux we have a many-to-many relationship. Many compositors; many drivers.
+In addition each compositor vendor or community has their own view of how
+color management should be done. This is what makes Linux so beautiful.
+
+This means that a HW vendor can now no longer tune their driver to one
+compositor, as tuning it to one could make it look fairly different from
+another compositor's color mapping.
+
+We need a better solution.
+
+
+Descriptive API
+===============
+
+An API that describes the source and destination colorspaces is a descriptive
+API. It describes the input and output color spaces but does not describe
+how precisely they should be mapped. Such a mapping includes many minute
+design decision that can greatly affect the look of the final result.
+
+It is not feasible to describe such mapping with enough detail to ensure the
+same result from each implementation. In fact, these mappings are a very active
+research area.
+
+
+Prescriptive API
+================
+
+A prescriptive API describes not the source and destination colorspaces. It
+instead prescribes a recipe for how to manipulate pixel values to arrive at the
+desired outcome.
+
+This recipe is generally an ordered list of straight-forward operations,
+with clear mathematical definitions, such as 1D LUTs, 3D LUTs, matrices,
+or other operations that can be described in a precise manner.
+
+
+The Color Pipeline API
+======================
+
+HW color management pipelines can significantly differ between HW
+vendors in terms of availability, ordering, and capabilities of HW
+blocks. This makes a common definition of color management blocks and
+their ordering nigh impossible. Instead we are defining an API that
+allows user space to discover the HW capabilities in a generic manner,
+agnostic of specific drivers and hardware.
+
+
+drm_colorop Object
+==================
+
+To support the definition of color pipelines we define the DRM core
+object type drm_colorop. Individual drm_colorop objects will be chained
+via the NEXT property of a drm_colorop to constitute a color pipeline.
+Each drm_colorop object is unique, i.e., even if multiple color
+pipelines have the same operation they won't share the same drm_colorop
+object to describe that operation.
+
+Note that drivers are not expected to map drm_colorop objects statically
+to specific HW blocks. The mapping of drm_colorop objects is entirely a
+driver-internal detail and can be as dynamic or static as a driver needs
+it to be. See more in the Driver Implementation Guide section below.
+
+Each drm_colorop has three core properties:
+
+TYPE: An enumeration property, defining the type of transformation, such as
+* enumerated curve
+* custom (uniform) 1D LUT
+* 3x3 matrix
+* 3x4 matrix
+* 3D LUT
+* etc.
+
+Depending on the type of transformation other properties will describe
+more details.
+
+BYPASS: A boolean property that can be used to easily put a block into
+bypass mode. The BYPASS property is not mandatory for a colorop, as long
+as the entire pipeline can get bypassed by setting the COLOR_PIPELINE on
+a plane to '0'.
+
+NEXT: The ID of the next drm_colorop in a color pipeline, or 0 if this
+drm_colorop is the last in the chain.
+
+An example of a drm_colorop object might look like one of these::
+
+    /* 1D enumerated curve */
+    Color operation 42
+    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D enumerated curve
+    ├─ "BYPASS": bool {true, false}
+    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EOTF, PQ EOTF, PQ inverse EOTF, …}
+    └─ "NEXT": immutable color operation ID = 43
+
+    /* custom 4k entry 1D LUT */
+    Color operation 52
+    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D LUT
+    ├─ "BYPASS": bool {true, false}
+    ├─ "SIZE": immutable range = 4096
+    ├─ "DATA": blob
+    └─ "NEXT": immutable color operation ID = 0
+
+    /* 17^3 3D LUT */
+    Color operation 72
+    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 3D LUT
+    ├─ "BYPASS": bool {true, false}
+    ├─ "SIZE": immutable range = 17
+    ├─ "DATA": blob
+    └─ "NEXT": immutable color operation ID = 73
+
+drm_colorop extensibility
+-------------------------
+
+Unlike existing DRM core objects, like &drm_plane, drm_colorop is not
+extensible. This simplifies implementations and keeps all functionality
+for managing &drm_colorop objects in the DRM core.
+
+If there is a need one may introduce a simple &drm_colorop_funcs
+function table in the future, for example to support an IN_FORMATS
+property on a &drm_colorop.
+
+If a driver requires the ability to create a driver-specific colorop
+object they will need to add &drm_colorop func table support with
+support for the usual functions, like destroy, atomic_duplicate_state,
+and atomic_destroy_state.
+
+
+COLOR_PIPELINE Plane Property
+=============================
+
+Color Pipelines are created by a driver and advertised via a new
+COLOR_PIPELINE enum property on each plane. Values of the property
+always include object id 0, which is the default and means all color
+processing is disabled. Additional values will be the object IDs of the
+first drm_colorop in a pipeline. A driver can create and advertise none,
+one, or more possible color pipelines. A DRM client will select a color
+pipeline by setting the COLOR PIPELINE to the respective value.
+
+NOTE: Many DRM clients will set enumeration properties via the string
+value, often hard-coding it. Since this enumeration is generated based
+on the colorop object IDs it is important to perform the Color Pipeline
+Discovery, described below, instead of hard-coding color pipeline
+assignment. Drivers might generate the enum strings dynamically.
+Hard-coded strings might only work for specific drivers on a specific
+pieces of HW. Color Pipeline Discovery can work universally, as long as
+drivers implement the required color operations.
+
+The COLOR_PIPELINE property is only exposed when the
+DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set. Drivers shall ignore any
+existing pre-blend color operations when this cap is set, such as
+COLOR_RANGE and COLOR_ENCODING. If drivers want to support COLOR_RANGE
+or COLOR_ENCODING functionality when the color pipeline client cap is
+set, they are expected to expose colorops in the pipeline to allow for
+the appropriate color transformation.
+
+Setting of the COLOR_PIPELINE plane property or drm_colorop properties
+is only allowed for userspace that sets this client cap.
+
+An example of a COLOR_PIPELINE property on a plane might look like this::
+
+    Plane 10
+    ├─ "TYPE": immutable enum {Overlay, Primary, Cursor} = Primary
+    ├─ …
+    └─ "COLOR_PIPELINE": enum {0, 42, 52} = 0
+
+
+Color Pipeline Discovery
+========================
+
+A DRM client wanting color management on a drm_plane will:
+
+1. Get the COLOR_PIPELINE property of the plane
+2. iterate all COLOR_PIPELINE enum values
+3. for each enum value walk the color pipeline (via the NEXT pointers)
+   and see if the available color operations are suitable for the
+   desired color management operations
+
+If userspace encounters an unknown or unsuitable color operation during
+discovery it does not need to reject the entire color pipeline outright,
+as long as the unknown or unsuitable colorop has a "BYPASS" property.
+Drivers will ensure that a bypassed block does not have any effect.
+
+An example of chained properties to define an AMD pre-blending color
+pipeline might look like this::
+
+    Plane 10
+    ├─ "TYPE" (immutable) = Primary
+    └─ "COLOR_PIPELINE": enum {0, 44} = 0
+
+    Color operation 44
+    ├─ "TYPE" (immutable) = 1D enumerated curve
+    ├─ "BYPASS": bool
+    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
+    └─ "NEXT" (immutable) = 45
+
+    Color operation 45
+    ├─ "TYPE" (immutable) = 3x4 Matrix
+    ├─ "BYPASS": bool
+    ├─ "DATA": blob
+    └─ "NEXT" (immutable) = 46
+
+    Color operation 46
+    ├─ "TYPE" (immutable) = 1D enumerated curve
+    ├─ "BYPASS": bool
+    ├─ "CURVE_1D_TYPE": enum {sRGB Inverse EOTF, PQ Inverse EOTF} = sRGB EOTF
+    └─ "NEXT" (immutable) = 47
+
+    Color operation 47
+    ├─ "TYPE" (immutable) = 1D LUT
+    ├─ "SIZE": immutable range = 4096
+    ├─ "DATA": blob
+    └─ "NEXT" (immutable) = 48
+
+    Color operation 48
+    ├─ "TYPE" (immutable) = 3D LUT
+    ├─ "DATA": blob
+    └─ "NEXT" (immutable) = 49
+
+    Color operation 49
+    ├─ "TYPE" (immutable) = 1D enumerated curve
+    ├─ "BYPASS": bool
+    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
+    └─ "NEXT" (immutable) = 0
+
+
+Color Pipeline Programming
+==========================
+
+Once a DRM client has found a suitable pipeline it will:
+
+1. Set the COLOR_PIPELINE enum value to the one pointing at the first
+   drm_colorop object of the desired pipeline
+2. Set the properties for all drm_colorop objects in the pipeline to the
+   desired values, setting BYPASS to true for unused drm_colorop blocks,
+   and false for enabled drm_colorop blocks
+3. Perform (TEST_ONLY or not) atomic commit with all the other KMS
+   states it wishes to change
+
+To configure the pipeline for an HDR10 PQ plane and blending in linear
+space, a compositor might perform an atomic commit with the following
+property values::
+
+    Plane 10
+    └─ "COLOR_PIPELINE" = 42
+
+    Color operation 42
+    └─ "BYPASS" = true
+
+    Color operation 44
+    └─ "BYPASS" = true
+
+    Color operation 45
+    └─ "BYPASS" = true
+
+    Color operation 46
+    └─ "BYPASS" = true
+
+    Color operation 47
+    ├─ "DATA" = Gamut mapping + tone mapping + night mode
+    └─ "BYPASS" = false
+
+    Color operation 48
+    ├─ "CURVE_1D_TYPE" = PQ EOTF
+    └─ "BYPASS" = false
+
+
+Driver Implementer's Guide
+==========================
+
+What does this all mean for driver implementations? As noted above the
+colorops can map to HW directly but don't need to do so. Here are some
+suggestions on how to think about creating your color pipelines:
+
+- Try to expose pipelines that use already defined colorops, even if
+  your hardware pipeline is split differently. This allows existing
+  userspace to immediately take advantage of the hardware.
+
+- Additionally, try to expose your actual hardware blocks as colorops.
+  Define new colorop types where you believe it can offer significant
+  benefits if userspace learns to program them.
+
+- Avoid defining new colorops for compound operations with very narrow
+  scope. If you have a hardware block for a special operation that
+  cannot be split further, you can expose that as a new colorop type.
+  However, try to not define colorops for "use cases", especially if
+  they require you to combine multiple hardware blocks.
+
+- Design new colorops as prescriptive, not descriptive; by the
+  mathematical formula, not by the assumed input and output.
+
+A defined colorop type must be deterministic. The exact behavior of the
+colorop must be documented entirely, whether via a mathematical formula
+or some other description. Its operation can depend only on its
+properties and input and nothing else, allowed error tolerance
+notwithstanding.
+
+
+Driver Forward/Backward Compatibility
+=====================================
+
+As this is uAPI drivers can't regress color pipelines that have been
+introduced for a given HW generation. New HW generations are free to
+abandon color pipelines advertised for previous generations.
+Nevertheless, it can be beneficial to carry support for existing color
+pipelines forward as those will likely already have support in DRM
+clients.
+
+Introducing new colorops to a pipeline is fine, as long as they can be
+bypassed or are purely informational. DRM clients implementing support
+for the pipeline can always skip unknown properties as long as they can
+be confident that doing so will not cause unexpected results.
+
+If a new colorop doesn't fall into one of the above categories
+(bypassable or informational) the modified pipeline would be unusable
+for user space. In this case a new pipeline should be defined.
+
+
+References
+==========
+
+1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
\ No newline at end of file
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index 396e535377fb..ef19b0ba2a3e 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -35,3 +35,6 @@ host such documentation:
 .. toctree::
 
     i915_vm_bind.rst
+
+.. toctree::
+    color_pipeline.rst
\ No newline at end of file
-- 
2.43.0

