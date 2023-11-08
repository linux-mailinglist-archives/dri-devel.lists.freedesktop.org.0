Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBC17E5B6A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3976410E7DE;
	Wed,  8 Nov 2023 16:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912E910E7CB;
 Wed,  8 Nov 2023 16:38:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lswXdZHKpj14hLQ6toKUjLHJZMUks5EOdeerHRQX81FSKO6JEoVsqJQY3H1zE+V6BqJj++nsD3MkBUbFFRRxhHwMhbbKOrP8/8VnhaY0K0kr3aVB4gBDs/BJTLiSF3Satjog2cUuJFNFhFg6Ox2FgCMq3QVZhA3IMerxyvT4Im5+d5muhT4uLFe1noYoOFxmlri/OOTUyDJ3Gcrr41md53mCm5mGoffFqG0AyYYb7ayj/RtgmYCiWdAq0Zr91CNk+bSiR074/WFbdTZDFfkoIsUfbNaHFTnU98gsactxOqUGq/nt75xDpZPYe1S3kh2o2W945AYApzg/NZVaMo0uvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5FfxTeAL0xI662M6RydaR/5ppBDeRxh/2x8A4bNdwI=;
 b=mbBNpvJkUH6KnVFsL0V2y0EamiwWwq4b7oqct/Qo0le06Cr+VEtHXtedA2Ul0WUCAv1ZrDP3WxDPK65R7Te6TAYc8u7nTdfwEn/5PkXy4s/LmiznmLY+s0lefGq/Whi+S5JCwuooLMHc97/lFaJiGd+dDrlX32Lxwp/9dAkF0L6OzUMZSZ4rANA600kKi6QsFSo6RciomrhcTCqmwsAv6edA8Hg2ZFertoOm5BXrtKs3An1uDqPgLThS46/B7mn5mlb8RsUbEyuzxOZlhUk576XBeH+32kv435kJaAQaqfyPjrZWEGt2U//VXdIEwmAK2Fg7OzAtpH59TQte2yWZmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5FfxTeAL0xI662M6RydaR/5ppBDeRxh/2x8A4bNdwI=;
 b=sBZ4bdjw16DIQtmtVuAy9lN3s2X63GUw13ZiynvnA/DH2cf2dI4qeQ7D4+HWoIXFn7akd1GSJwEIEmxhErUu5fVhWkydxTYhARhGcKH7bC5U3wHfBq5rQWcLa6WfP+dpyBd/EIjd6UAVenS5UcEvFeQfoNddk28iBhk0+b3j4t8=
Received: from CY5PR22CA0044.namprd22.prod.outlook.com (2603:10b6:930:1d::24)
 by DM4PR12MB7575.namprd12.prod.outlook.com (2603:10b6:8:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:38:02 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:1d:cafe::66) by CY5PR22CA0044.outlook.office365.com
 (2603:10b6:930:1d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:38:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:56 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:56 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 18/23] drm/colorop: Add 3x4 CTM type
Date: Wed, 8 Nov 2023 11:36:37 -0500
Message-ID: <20231108163647.106853-19-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|DM4PR12MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb36889-a850-4db7-399a-08dbe0791319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tYmE10uPHHf0R8cngbpNbNpN9kr0PnSKo3YkOisK8L/+SS+a0bnjDmDR0nEoeSFxnxtis8UkzLZ7cthskxvZXXg7fAHauaCxmafB7XmDdQ+KfWgZoATUyvgn+PwM8TrC8HKWbxaMK+7svlh4Dp/ZS39bV8HeoZ4d5Ev5BWN3r8yx4AmsVPFphNmXpCjMPqVaAs/ZmpKRnUK0t5HIikuKu1XArtF1zJx61aD4D+r5G/m/u0uhktpVhtc4SInIh/4wqnuXBMG3T9r4imvQh6ohhyIbIbKkdfseY2SM0Ydyi9aav7tdL3akCxQDqZU8uu3IA9UjrImN2h4CuUolOlFwqRq7AldOnQa0/3uceFu25XPIlmaFOLc2mpdMN6IaztvdPxT6NuyqQYyAlMkWgeL8nv3272/TyoPZB9OTF0H88XijkZTyJrDL1UqUuKSPf+iQa7rOMkqQa2QENQpJpy4Bb2Ori7dIkWlA9eUjcnq/KKxFipS+RulPG8Grr/+8rCQ/1wdeGVL/r72mGcJy2PIAycfvSejh9GhYqfbhe18dBq4Z8ZayPozFeEfFfCYH6NJ6/DT+z+ZN1BxKgYzyWwn3PL6fUsD5HY/A4JSIbKuo53O3e3Q9Cvrf0VOUELG2ovsGpEKjymF6PoZcTOrio/pbuQ2+j0oTmCPapkggqjMNtqoifXsF48k/1LhYcN06lFO6kEJH9LbGgIHfLrvRr9xiRaFrJCWqdx+JpbYTd+JV+3wiskXIc253Vzqn810t2EDV/VZv28Cs+lNx4Abat0wMQQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(186009)(64100799003)(1800799009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(47076005)(83380400001)(36860700001)(478600001)(82740400003)(6666004)(336012)(70206006)(26005)(70586007)(54906003)(2616005)(6916009)(1076003)(426003)(316002)(356005)(81166007)(5660300002)(4326008)(36756003)(86362001)(450100002)(8936002)(44832011)(8676002)(2906002)(41300700001)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:38:01.8048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb36889-a850-4db7-399a-08dbe0791319
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7575
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
Cc: wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This type is used to support a 3x4 matrix in colorops. A 3x4
matrix uses the last column as a "bias" column. Some HW exposes
support for 3x4. The calculation looks like:

 out   matrix    in
 |R|   |0  1  2  3 |   | R |
 |G| = |4  5  6  7 | x | G |
 |B|   |8  9  10 12|   | B |
                       |1.0|

This is also the first colorop where we need a blob property to
program the property. For that we'll introduce a new DATA
property that can be used by all colorop TYPEs requiring a
blob. The way a DATA blob is read depends on the TYPE of
the colorop.

We only create the DATA property for property types that
need it.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_colorop.c     | 16 ++++++++++++++++
 include/drm/drm_colorop.h         | 19 +++++++++++++++++++
 include/uapi/drm/drm_mode.h       | 19 ++++++++++++++++++-
 4 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 69c56982e2d0..564bca68f652 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -725,6 +725,31 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 	return 0;
 }
 
+static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
+		struct drm_colorop_state *state,
+		struct drm_property *property, uint64_t val)
+{
+	ssize_t elem_size = -1;
+	ssize_t size = -1;
+	bool replaced;
+
+
+	switch (colorop->type) {
+	case DRM_COLOROP_CTM_3X4:
+		size = sizeof(struct drm_color_ctm_3x4);
+		break;
+	default:
+		/* should never get here */
+		return -EINVAL;
+	}
+
+	return drm_atomic_replace_property_blob_from_id(colorop->dev,
+					&state->data,
+					val,
+					size,
+					elem_size,
+					&replaced);
+}
 
 static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state, struct drm_file *file_priv,
@@ -734,6 +759,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->data_property) {
+		return drm_atomic_color_set_data_property(colorop,
+					state, property, val);
 	} else {
 		drm_dbg_atomic(colorop->dev,
 			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
@@ -756,6 +784,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->data_property) {
+		*val = (state->data) ? state->data->base.id : 0;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index e62acf68bf9e..67e6efc90803 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -34,6 +34,7 @@
 
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
 };
 
 static const struct drm_prop_enum_list drm_colorop_curve_1d_type_enum_list[] = {
@@ -105,6 +106,20 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   colorop->curve_1d_type_property,
 				   0);
 
+	/* data */
+	if (type == DRM_COLOROP_CTM_3X4) {
+		prop = drm_property_create(dev, DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
+					   "DATA", 0);
+		if (!prop)
+			return -ENOMEM;
+
+		colorop->data_property = prop;
+		drm_object_attach_property(&colorop->base,
+					   colorop->data_property,
+					   0);
+	}
+
+	/* next */
 	prop = drm_property_create_object(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
 			"NEXT", DRM_MODE_OBJECT_COLOROP);
 	if (!prop)
@@ -219,6 +234,7 @@ EXPORT_SYMBOL(drm_colorop_reset);
 
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
 };
 
 static const char * const colorop_curve_1d_type_name[] = {
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 13acc9a6ac38..faca6eba10e1 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -59,6 +59,14 @@ struct drm_colorop_state {
 	 */
 	enum drm_colorop_curve_1d_type curve_1d_type;
 
+	/**
+	 * @data:
+	 *
+	 * Data blob for any TYPE that requires such a blob. The
+	 * interpretation of the blob is TYPE-specific.
+	 */
+	struct drm_property_blob *data;
+
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
 };
@@ -166,6 +174,17 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @data:
+	 *
+	 * blob property for any TYPE that requires a blob of data,
+	 * such as 1DLUT, CTM, 3DLUT, etc.
+	 *
+	 * The way this blob is interpreted depends on the TYPE of
+	 * this
+	 */
+	struct drm_property *data_property;
+
 	/**
 	 * @next_property
 	 *
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 0ebf0f480dc8..b5d4dd5660d9 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -847,6 +847,22 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };
 
+struct drm_color_ctm_3x4 {
+	/*
+	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 *
+	 * TODO what's the format?
+	 *
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 12|   | B |
+	 *                       |1.0|
+	 */
+	__u64 matrix[12];
+};
+
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
@@ -859,7 +875,8 @@ struct drm_color_lut {
 };
 
 enum drm_colorop_type {
-	DRM_COLOROP_1D_CURVE
+	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_CTM_3X4,
 };
 
 /**
-- 
2.42.1

