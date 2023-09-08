Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7576798970
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E808A10E8F2;
	Fri,  8 Sep 2023 15:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1DF10E8E5;
 Fri,  8 Sep 2023 15:02:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxbcnorI3gjbZNCLZK8AWFWzXmxRbd3zrQoOzV1VzKYknBkHF7DgLywQxDW00nJ6p7h8xmfiHo63H8VdNzpA68LJXXJz/Fclu+oU8k0wROdeRZMfoe+SYvspU9P0EddkYorL4BEBPIPVoTlUmmFUfV//NmhsJL0NV9fkhG0csgxXLxu+wgqh1QE4Ba0zOtu1LmppwOZ2B7GGI2FaB3gK0dD0QeFa6xO1CL2xufPRWF65PRN/K7BA3ByFHNDzitmafPxPP8IuNp4Lx7n0yUyzvRWCAaN+AXHRa1tCN941bv87q/QLfGVlYOSdvCk9hoywSQiXz6RY+h/H7de9mowMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pusTVJwF2JKmpaD4olMjutog9lQxXXm+VWjgzq2ima0=;
 b=APFTUm66DiAZJErliIUmSFmLtlCnfHeRmbJNVEV2Vzz8+FuiyO7aG5rT8bsYoi5lidC45wRzG+I05INgZIou6qqMUoDa3HQ38Q+8NzCvpyEuaV+YveraRDBZQ4aTCcj02cFoZOzqGZgcyqYWtHiu+TyEop4VvPuhaAjC1rXlM7UGCcpVLUwcM5JvBtZL7q7Qai7wSFpF1KhFupQzQc/2P7c1Ax+m6/hCF1JdO4eweCfGxX0tBhxMKEarqieMftm2hCLKr5Q8rwvklOTMViE8RtSE+gTVUlLibOObWT8rcXJ2jjV1V5YcVBDuCtPYtasdSJPrOcPDPdMNWaKpDDW5XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pusTVJwF2JKmpaD4olMjutog9lQxXXm+VWjgzq2ima0=;
 b=GVrrPTK74tgfqAyOMYNoj5KFoEILH2gRad5umd450z+qMD5EDd57HTnHPmZm8hc/JnLXKLbFBMFgPm3BLQZ+0zpM1lU4cn8C2a/kk4HIpIvaXqbI+G3Q8WABJDR5RL+P8DN3KfnDHcjqHx82EnfeXtX3OVLZzbV1BXvftymj4EM=
Received: from CH0PR13CA0047.namprd13.prod.outlook.com (2603:10b6:610:b2::22)
 by CH3PR12MB8911.namprd12.prod.outlook.com (2603:10b6:610:169::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 8 Sep
 2023 15:02:44 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::ed) by CH0PR13CA0047.outlook.office365.com
 (2603:10b6:610:b2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.10 via Frontend
 Transport; Fri, 8 Sep 2023 15:02:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Fri, 8 Sep 2023 15:02:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 10:02:43 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 8 Sep 2023 10:02:42 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Date: Fri, 8 Sep 2023 11:02:26 -0400
Message-ID: <20230908150235.75918-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230908150235.75918-1-harry.wentland@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|CH3PR12MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: 5734c205-1246-4a70-9973-08dbb07ca7d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K7T4EDSo+Ev1Bxt2pznmjBhnCTvt8iAVoRyb7fybWrlbKInqiusVnpQ5SvpwliRvZ6VF4Pq3xhsjMhD0NyY3z2DmhK+qohu9USnBsA6VQQFkG/vLNQLqBHS+jvcAe1I9jHk4MHKan5GkgL8kU1ANTviPfEsgnODHqg3VP8AS+Gw58vWUMlZV1y1Cs9Mc2lU5BkHN+D+GoMEq3h31uVjCW830rBiYutXTRHyGhUaeWXINIUUaoTb7n7kok7SkSUprbW2YdhEryJaFxwRbNwru5jPh5Rsub3DO+o/vWRg9+f4M5dgdnJQIRWaxGu7AqBp63AFr9GTVVGZPkdlMLdKWUfUQ/kV/X0JtncT9X9CdBhV9Dk/frtf1PQdQrzgwGnyHoV4Fwl/9SGZweFBopJV8b8Nvrw6dq/45uLW1Ya400nxqspxYGuj++pf/gKk4U/UZCvRyQHsd+Z3mIF2ldYJl5/SwMyzEyyFTulcZ9s/Wnhxjxd7XoQcpMx6iPMbFbs99pFlAKS3bh0e3VJ2CGCZ8Jn8XUhClfyZUfTdWrquodY48ilomdAZyAzqrlT5B46KbWC5cZSFuH4MZxxrj6dhDq2vpqT3ZdmgFfih06SclmUQGF+hYOAzw+cnY+pg1BHr21cjymGYNf7j4NMsUJfsu5tiOagn21ynwQbRmwX0ud0cTmxFDSPxVDbUJwkgV5maJuOVZeN0RnsNFhPui4OGgUnUiTGzMS127Ek10wSCqjoYa3BdAVgGdNsrN5FQojYh8PoWVwIXhHTlSrwcmGwpnNQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199024)(82310400011)(186009)(1800799009)(36840700001)(46966006)(40470700004)(82740400003)(356005)(66899024)(6666004)(7696005)(81166007)(40480700001)(40460700003)(36756003)(86362001)(36860700001)(1076003)(47076005)(26005)(70206006)(83380400001)(66574015)(2906002)(478600001)(70586007)(426003)(4326008)(2616005)(966005)(7416002)(30864003)(336012)(8936002)(41300700001)(8676002)(5660300002)(6916009)(44832011)(54906003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 15:02:44.0371 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5734c205-1246-4a70-9973-08dbb07ca7d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8911
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 wayland-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 Aleix Pol <aleixpol@kde.org>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
---
 Documentation/gpu/rfc/color_pipeline.rst | 278 +++++++++++++++++++++++
 1 file changed, 278 insertions(+)
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst

diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/gpu/rfc/color_pipeline.rst
new file mode 100644
index 000000000000..bfa4a8f12087
--- /dev/null
+++ b/Documentation/gpu/rfc/color_pipeline.rst
@@ -0,0 +1,278 @@
+========================
+Linux Color Pipeline API
+========================
+
+What problem are we solving?
+============================
+
+We would like to support pre-, and post-blending complex color transformations
+in order to allow for HW-supported HDR use-cases, as well as to provide support
+to color-managed applications, such as video or image editors.
+
+While it is possible to support an HDR output on HW supporting the Colorspace
+and HDR Metadata drm_connector properties that requires the compositor or
+application to render and compose the content into one final buffer intended for
+display. Doing so is costly.
+
+Most modern display HW offers various 1D LUTs, 3D LUTs, matrices, and other
+operations to support color transformations. These operations are often
+implemented in fixed-function HW and therefore much more power efficient than
+performing similar operations via shaders or CPU.
+
+We would like to make use of this HW functionality to support complex color
+transformations with no, or minimal CPU or shader load.
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
+compositor, as tuning it to one will almost inevitably make it look very
+different from another compositor's color mapping.
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
+This recipe is generally an order straight-forward operations, with clear
+mathematical definitions, such as 1D LUTs, 3D LUTs, matrices, or other
+operations that can be described in a precise manner.
+
+
+The Color Pipeline API
+======================
+
+HW color management pipelines can significantly differ between HW
+vendors in terms of availability, ordering, and capabilities of HW
+blocks. This makes a common definition of color management blocks and
+their ordering nigh impossible. Instead we are defining an API that
+allows user space to discover the HW capabilities.
+
+
+drm_colorop Object & IOCTLs
+===========================
+
+To support the definition of color pipelines we introduce a new DRM core
+object, a drm_colorop. Individual drm_colorop objects will be chained
+via the NEXT property of a drm_colorop to constitute a color pipeline.
+Each drm_colorop object is unique, i.e., even if multiple color
+pipelines have the same operation they won't share the same drm_colorop
+object to describe that operation.
+
+Just like other DRM objects the drm_colorop objects are discovered via
+IOCTLs:
+
+DRM_IOCTL_MODE_GETCOLOROPRESOURCES: This IOCTL is used to retrieve the
+number of all drm_colorop objects.
+
+DRM_IOCTL_MODE_GETCOLOROP: This IOCTL is used to read one drm_colorop.
+It includes the ID for the colorop object, as well as the plane_id of
+the associated plane. All other values should be registered as
+properties.
+
+Each drm_colorop has three core properties:
+
+TYPE: The type of transformation, such as
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
+bypass mode. While setting other properties might fail atomic check,
+setting the BYPASS property to true should never fail. This allows DRM
+clients to fallback to other methods of color management if an atomic
+check for KMS color operations fails.
+
+NEXT: The ID of the next drm_colorop in a color pipeline, or 0 if this
+drm_colorop is the last in the chain.
+
+An example of a drm_colorop object might look like one of these::
+
+    Color operation 42
+    ├─ "type": enum {Bypass, 1D curve} = 1D curve
+    ├─ "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, HLG, …} = LUT
+    ├─ "lut_size": immutable range = 4096
+    ├─ "lut_data": blob
+    └─ "next": immutable color operation ID = 43
+
+    Color operation 42
+    ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
+    ├─ "lut_size": immutable range = 33
+    ├─ "lut_data": blob
+    └─ "next": immutable color operation ID = 43
+
+    Color operation 42
+    ├─ "type": enum {Bypass, Matrix} = Matrix
+    ├─ "matrix_data": blob
+    └─ "next": immutable color operation ID = 43
+
+
+COLOR_PIPELINE Plane Property
+=============================
+
+Because we don't have existing KMS color properties in the pre-blending
+portion of display pipelines (i.e. on drm_planes) we are introducing
+color pipelines here first. Eventually we'll want to use the same
+concept for the post-blending portion, i.e. drm_crtcs.
+
+Color Pipelines are created by a driver and advertised via a new
+COLOR_PIPELINE enum property on each plane. Values of the property
+always include '0', which is the default and means all color processing
+is disabled. Additional values will be the object IDs of the first
+drm_colorop in a pipeline. A driver can create and advertise none, one,
+or more possible color pipelines. A DRM client will select a color
+pipeline by setting the COLOR PIPELINE to the respective value.
+
+In the case where drivers have custom support for pre-blending color
+processing those drivers shall reject atomic commits that are trying to
+set both the custom color properties, as well as the COLOR_PIPELINE
+property.
+
+An example of a COLOR_PIPELINE property on a plane might look like this::
+
+    Plane 10
+    ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
+    ├─ …
+    └─ "color_pipeline": enum {0, 42, 52} = 0
+
+
+Color Pipeline Discovery
+========================
+
+A DRM client wanting color management on a drm_plane will:
+
+1. Read all drm_colorop objects
+2. Get the COLOR_PIPELINE property of the plane
+3. iterate all COLOR_PIPELINE enum values
+4. for each enum value walk the color pipeline (via the NEXT pointers)
+   and see if the available color operations are suitable for the
+   desired color management operations
+
+An example of chained properties to define an AMD pre-blending color
+pipeline might look like this::
+
+    Plane 10
+    ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
+    └─ "color_pipeline": enum {0, 42} = 0
+    Color operation 42 (input CSC)
+    ├─ "type": enum {Bypass, Matrix} = Matrix
+    ├─ "matrix_data": blob
+    └─ "next": immutable color operation ID = 43
+    Color operation 43
+    ├─ "type": enum {Scaling} = Scaling
+    └─ "next": immutable color operation ID = 44
+    Color operation 44 (DeGamma)
+    ├─ "type": enum {Bypass, 1D curve} = 1D curve
+    ├─ "1d_curve_type": enum {sRGB, PQ, …} = sRGB
+    └─ "next": immutable color operation ID = 45
+    Color operation 45 (gamut remap)
+    ├─ "type": enum {Bypass, Matrix} = Matrix
+    ├─ "matrix_data": blob
+    └─ "next": immutable color operation ID = 46
+    Color operation 46 (shaper LUT RAM)
+    ├─ "type": enum {Bypass, 1D curve} = 1D curve
+    ├─ "1d_curve_type": enum {LUT} = LUT
+    ├─ "lut_size": immutable range = 4096
+    ├─ "lut_data": blob
+    └─ "next": immutable color operation ID = 47
+    Color operation 47 (3D LUT RAM)
+    ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
+    ├─ "lut_size": immutable range = 17
+    ├─ "lut_data": blob
+    └─ "next": immutable color operation ID = 48
+    Color operation 48 (blend gamma)
+    ├─ "type": enum {Bypass, 1D curve} = 1D curve
+    ├─ "1d_curve_type": enum {LUT, sRGB, PQ, …} = LUT
+    ├─ "lut_size": immutable range = 4096
+    ├─ "lut_data": blob
+    └─ "next": immutable color operation ID = 0
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
+3. Perform atomic_check/commit as desired
+
+To configure the pipeline for an HDR10 PQ plane and blending in linear
+space, a compositor might perform an atomic commit with the following
+property values::
+
+    Plane 10
+    └─ "color_pipeline" = 42
+    Color operation 42 (input CSC)
+    └─ "bypass" = true
+    Color operation 44 (DeGamma)
+    └─ "bypass" = true
+    Color operation 45 (gamut remap)
+    └─ "bypasse" = true
+    Color operation 46 (shaper LUT RAM)
+    └─ "bypass" = true
+    Color operation 47 (3D LUT RAM)
+    └─ "lut_data" = Gamut mapping + tone mapping + night mode
+    Color operation 48 (blend gamma)
+    └─ "1d_curve_type" = PQ inverse EOTF
+
+
+References
+==========
+
+1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
\ No newline at end of file
-- 
2.42.0

