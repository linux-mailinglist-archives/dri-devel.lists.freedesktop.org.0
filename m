Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC2AB2772D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF9B10E8F3;
	Fri, 15 Aug 2025 03:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="g3EYUEwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F77010E8F3;
 Fri, 15 Aug 2025 03:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChasN1DWm0H1ocEIqnTuNTn62i6+u4b0nJBnu8TDm2Ac6sM7MOKSXEL9aMkgAGGN7k8bxrnKXOsnwLxPdNZOxF3cIiHrFhMNPUJXe2n+bWc5GaH74uDBSAS3pTuHaKCfGsXehnZzS7x6AU4BoBfPoyOtmsdo4EqEFur+6WtLQlquWGhpriZtLpbqS5YUvoHR2uwtS+CxHEEsMNK5SIQ/of/9hfadZ4Q9VV5AskMrglDhCS46b29jijO/OXLuinuENdykakk7C+Mu4MP9UpjSgFMDQEpa63UqczMyqmu7XX6hp5Rf/rBZaQfvZF6CbvbC8GVTzEtyMVDK/Zs0CiPA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1sTus2tuuLVJ6db+KZ3vmHfw1zLbvyXzTpimAV9YKo=;
 b=lu6o2L4VvvmXkDu1VvIQKxSOwo2TJ5I+tnQFwfOR5zJ7rH66q3Vw3xqCcgQ4dTxVNpKEEjUk8Ho3cA0lJF/utmLqucpxKk/gbTRLVxK/IAZ+Ej9Bwr5cttTsrKAZSQbyDw0guKYf0NhSuQsqP8NltnOXvtUEvlUf3Ge5HbjUEGwS/jqIVfUH5Y4JgtJTwYmw8Lm2zyo5ZnOoMIIxbM2xh5YGxDT4upT+IdJSxKj4CdCMqDyPnyAs422PNVLnnCtRqN6D0tT6BmwDNIU4Wr92XcMOX7jj2yLHsNzTfCJ72JglLhThJ2KffEXbpClAP594fCAF+3wTvFfdiYNGW2N/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1sTus2tuuLVJ6db+KZ3vmHfw1zLbvyXzTpimAV9YKo=;
 b=g3EYUEwf9HxBd3bXr0Fzd7RBL9jzTp8TzS3r/WVRX8l4TO/bjRh+xfoEEgDaxKdv/x82qSJct9YUL0MR6lmyTCpTqDNn3ALav6+NjjmacsV5bVSCWW00bL7QZ/4fWYDKQqJ5UDhrqFf7/q7n2SUhHnz/oDzky9JbNZL2WrL1rQM=
Received: from CY8PR02CA0017.namprd02.prod.outlook.com (2603:10b6:930:4d::17)
 by BY5PR12MB4036.namprd12.prod.outlook.com (2603:10b6:a03:210::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 03:52:22 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:4d:cafe::9a) by CY8PR02CA0017.outlook.office365.com
 (2603:10b6:930:4d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:52:22 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:52:22 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:52:18 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 03/47] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Date: Thu, 14 Aug 2025 21:49:52 -0600
Message-ID: <20250815035047.3319284-4-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|BY5PR12MB4036:EE_
X-MS-Office365-Filtering-Correlation-Id: ce1861e6-5b35-4df4-6ec4-08dddbaf23c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVY2WitkdU03bU15clJTVWtvVjFwUTJqYmplSVUxYzcwb2hZKzdtSXkvd2Va?=
 =?utf-8?B?K1hyN015YjlkYXhObVpXdkV0N1Vsdzd2eTNocS9LN3FZdUpEWXgxYnYyUDRm?=
 =?utf-8?B?d09vRU1jQXBaY3A2ZU1OYysybGVWbDMwNkE0SkxLckQvT1lvSFg0VGYwQ3NV?=
 =?utf-8?B?aGY3eHl4dU9FazB6Q2MzQmlCSEl4d05GS3l1NHBIbzVGNVlEVUhCVWJIR0NC?=
 =?utf-8?B?cUdneEErY1NYcmRmdGJQTTF1NFVGVnFhcUhVa1dHdGVCcWcya1EyZkZaemxj?=
 =?utf-8?B?UllrdlZwb0tOeTBGaVZYQ0dTQ2prNkFQUU9DaHB4STBmeFpRSU9KQkNaWDln?=
 =?utf-8?B?bWF1dXBtc0FyOWhPUnhiaVJKdU1iUDdSUlJMSHRsWCtKeTVEbnBweURrdGps?=
 =?utf-8?B?cEpHQ0ZQUlk2MUd1ekx5QUVhUU41eWt2Mjc1RmhXdkNCYW5NbEhlY2ZrdWVq?=
 =?utf-8?B?dHlEd0pOejI1bVhlWXcyay80MEQybzhIOE9Vcmo3cFZYQnZnSUVQS1d1dlpC?=
 =?utf-8?B?Ykpnc1E5YnAreURpUXhYRGF3T053Z1dBaklIWGIrbmh2OXpQRy9LOXpBKzdt?=
 =?utf-8?B?ZVAvNHhUbEoxMmtiUitVenp5bE1qYUdnM1FKUW1EOEhoei9WTHhRazVoL3ZE?=
 =?utf-8?B?cDU3OUs3a0dGM1hvOVlWQ0ttaXdsUDQ5MENFRE05eERTbVUvNGhGMDFpUitk?=
 =?utf-8?B?RG9zaTNHQTE2N0NVa1hvU2xpTjluVmc1UzZFK0wrQ0lmdFRKeEpIcytkOGlV?=
 =?utf-8?B?M2szaDdpaGFJUUpWcVNaMy9wOE5BVm9HRWZtSkh4Y1M3RXpQWUV2ZWtHbkJy?=
 =?utf-8?B?SXh6aktFbkV0SUV2dk8vdzVnNW1sbXM1QmM5RUw5cmFQblMzUkZSZnZSNXNa?=
 =?utf-8?B?THlUYjE1WXJhZnRUUnhlcEMxbzErSzJmeFkydkxRWHByUm5CTEpDbmY1U0VL?=
 =?utf-8?B?ZFlkMlBIaVAyeEVlcGZpc2hpYnVHTmN5bmU3eGdWODNlT3hoU2FnczlmN2to?=
 =?utf-8?B?cmNWMHRDZVppT3ByZWk2S21YempsL0R1RkNpemg4WEh4M0M2N2owclB0bWs1?=
 =?utf-8?B?TU9UaFBmMGxNWnNDdWN5VHZwMlRpSUJiQnVLS01mWTROVDloVUtQQ3kyekMy?=
 =?utf-8?B?aHR2T2Zzemc4eE1aaXVuLzU4Q3RqNG9ZMmpjZ2dER09HU3pqQ2J4YllIQUI2?=
 =?utf-8?B?OGtKYzV1d1dBVXZwOEpCMUV3dytBY1VwUEE5WTRVN1ZCcS84aENMYlVRaGRh?=
 =?utf-8?B?MmplajdZRnQ5MmROSlNHbnU4SlJoK3pCbG9UUFdCQXpsVlg4ZUdJSy9LbnF2?=
 =?utf-8?B?MlA2TmttQjFlOXJ3dXZqOFRzaUsvWjhKU2dKcXcvaUl5UlFvb1MrK2h5Q21n?=
 =?utf-8?B?bktyRWZMMzlvTWdrcmtGZVZWU096UnRXT1dXa3JjZ1hDYkY0cTZ4OWNQU1ZP?=
 =?utf-8?B?UGY1L0ZGTlRYTDBWMlJmaGNUbHFHRHJoQllUQ082dzBiTUxEME40QnJoT1c2?=
 =?utf-8?B?SSt1UXdSdjFxVVRGSmN5aTRsOVI1NFNIcGlNVXAvbk0vKytpN2dOM1FXaFVy?=
 =?utf-8?B?ZTRrVHUxQXNSZUNmT2xQS3ExRGxMTmowdmJZQzkvcVhSWnJHMU0wM1NnMm1I?=
 =?utf-8?B?c2pXMmJSTlZoNHR3UVBEV3ZkZmQxZXBCR0w1T1kvSWVpekNVSkcvTWt2K2xK?=
 =?utf-8?B?U1ltS3Q3T0lOUUpEZDlGS1NWUnpzeHlxSDU2enp3MkZqRmRHOUYwdzlSc08x?=
 =?utf-8?B?NklvNzZHVTBtL29rajJTbm5lb3hSS0pYODBkUEZHZ29jQ0UvWEF0QjN3THBI?=
 =?utf-8?B?by8xQklTWXpvT1hCbjRRQnVqcUFqWUozOUFBYnNscUJJYzk1ZHJ6ZmJCd1lu?=
 =?utf-8?B?ejluUTlrZEN1UDgwVkZMNGMwM0VOS0NhZ2UwSndOMDlvdXJubnB0MkFneENH?=
 =?utf-8?B?TTJnbFJyc2NkS3ljdXdNTDZ0V2tGTVhHSjEvTm9RMk40dmUvU3VkVjJFMGhi?=
 =?utf-8?B?anRYUGNkVjRCWTB5S0V2WW5iWitPVHhyd2NQOG5kUnhqYjM2eGdHandCWlBF?=
 =?utf-8?B?NW5hNzAxMyt2MHh6SlVreFh1MzlFeCtsMjkyUT09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:52:22.1626 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1861e6-5b35-4df4-6ec4-08dddbaf23c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4036
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
Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Melissa Wen <mwen@igalia.com>
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

