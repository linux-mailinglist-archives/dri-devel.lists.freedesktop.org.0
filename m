Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42D16C44ED
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B33410E8A4;
	Wed, 22 Mar 2023 08:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68E310E8A5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 08:30:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHLkQyBvfHbQJPJEl49KC/l7zRgwXxAf9kpbw0DUU3PmU0nuqkFKLkNIcCOaJoxiSUyHoTkYPrvMF1jtbypfImTzYc21vLqrz/SavMnCV9+HMmd0VwOuHDifNknj6tJeLQomGp71gjRAtquxk8ve0go341Iy1khe5WeBygJrC1ew9E7qIDOH78M/Q6sLmMNbV1db4Q28VRQaP817pC0cJdXpjonocfTgGfOo39+4hCM5ie3uJekBoMV3yf70hf36/YUHVVLJ/rIJKvCXmLjFj8mmuDBDxUbXJ7LwfrbSVd0pyOeyKEvzkWyUudr16+9lUXaVmKX6IW1/ts0a0hsR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOV/Z76tg7TGky1FO6Up4xOjPk9enSkYehF1v31zCh0=;
 b=k0iTweHEUtVZZd2RnZfQlNF3ThPiI6xCGUIDf91havSKPuLDkbwzqgAeFV9El3mc6NTJsNYA1u2viTcMjNhABNFKDAgt0Q/zSTWaf4+yjxN4YHztnV+jQiJJBDDzd3Ih/Tx5dgl5pmUx7VYAej6Y6BhNDB684A2JitJJ35S1dvokRwWoDAIULK+LwspSZ0O3BlcapwMkXY0AUQHeabGlc28B9XFpym2XkBvxiUL5smrvVgzYgaqxrAd3LyvlDaZXhMlDPM/6GGKqTCe+A1mgpnlfi07h7HgkPBqMpYrNLeEijzvRx64+Dk2hvM6k6zmFQNaqKjTqBZ0qOhVLpE+kDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOV/Z76tg7TGky1FO6Up4xOjPk9enSkYehF1v31zCh0=;
 b=jCIrC8/ZrBqvrp9IxEVhINCGhsEQh1pf5Mb9fcEet7lXLRZe9DbxI9CNh8eWADApTroOgolcfWOrk4QFpCnLC+hTBmHyX9KVyz/vSKqVNo+Mfl0Wa/tYfX+AvaUl64AOmuVA464eNdm0iHY/VrYldegzXi3rzQnstZGBpUlojPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by MN2PR03MB4944.namprd03.prod.outlook.com (2603:10b6:208:1b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 08:30:44 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::96e3:3428:3a5b:5872]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::96e3:3428:3a5b:5872%8]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 08:30:44 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/2] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
Date: Wed, 22 Mar 2023 16:29:09 +0800
Message-Id: <20230322082910.115371-2-randy.li@synaptics.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322082910.115371-1-randy.li@synaptics.com>
References: <20230322082910.115371-1-randy.li@synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:a03:338::6) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|MN2PR03MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e43ef6e-b139-4f65-1641-08db2aafba79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FgrhJtAO5kNAKExIhu0dc+rc/ZgsRovt4my7im8xEVCSz0EYYvMn9gllqtUQK1+jhCZfnE8mWoEu7orKTBZgidDXO3xy+59eWqcn0h9PtJvGWhdkjelwvNyFxvoDpp85hfgOKGGUk0j+fLISsNW9+mX/wqWcMF3frTP5wqylKbGDJtEyyeQJ5kQsHZlMFNIubqv8ZUNcoT60EkNT4FMu7y7VxLuPCr/mXSstzpIskpr/9mwgXZXYWwr5XeIrKPBrCOKIXgOI3lgNIlY7CY9n+W0AnRGCFotQmG3RjvC5cWRxAs9L25MR6le9HyIm2COXtYsvHqUPQXK8C+dSOIVKHUyyzugDMd5slLu2VR3eBb0E7Y6VbeFxK/507VxVJRC0nXcLhzaSAfDSEw6qXUl4AvYxcQvWrJWuN2spuClJ2eSVyzQCNhp3DpNea7Fw9dlS0FUNsGGTDYEVHkikn3YgGfFDJubiqmBSTkNbQgyJ5Gw6inwPjjzTjprMVLhnqx6qiRMggUs/j10/hykMc1S+BVR+tXKHkXTvHmudk4Ljx1tYFas7gZjRHeS4+Gd+hmcZJFnetv5b1Wmbs8PGTFig2GeZVa/ixMVpIGP89N9PKTNCvzIj9zhbQN/MNTW1wf8wTspMN6b7o6Vd26spkLrgUoH7cRL8zEZtlsi2ed8EeLhEelZtGVO499SC4X1lTQA2+2cWD5bjUc7T6R0SDBTb7SBI3E9B3T8zvdoxPDt2F5mX9XXWiWIWEqlYkhpitHVp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199018)(2616005)(52116002)(6666004)(186003)(6486002)(4326008)(478600001)(107886003)(316002)(66556008)(6916009)(8676002)(66946007)(66476007)(6506007)(26005)(1076003)(5660300002)(6512007)(8936002)(7416002)(2906002)(41300700001)(38350700002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xSmhGIadcT3eTNU3hzGsiO9krGlsFg84oxn7zu7hIGoidXmT+RsntWiVAven?=
 =?us-ascii?Q?t48sTujNnPMBWicx1hbplbv3TiOxZCK6hJ1RuVWbJIIgT777nJFT8RiikQhb?=
 =?us-ascii?Q?BnSdH3UceOqyQsWil8GEnXePo2f/1+XiGDjk8hA1gd/a1z41NY0xf7UPYsK4?=
 =?us-ascii?Q?Zh7dCplsVoC9Yf9cR9MKe5ksghxPKX42mmEnxS0m6fNhQM1CWoUvG9aFrRK/?=
 =?us-ascii?Q?9SD6D11Y2gu0Jvv0q/npD8kAW/cNqfq5sTQCmCNmGXD9Besrh0gk5HhX7jwI?=
 =?us-ascii?Q?01g7DEirCXRvlQdF9WFIfowzDAgKIFw0jXJ30VlrkHvp3zaOiBzd9DlSuExj?=
 =?us-ascii?Q?sE7+VAL6jkFXOGseXQyoeBrXsZuCGWoSfdQRZw6WeI4ZsfUX5mdg9CUCXIGl?=
 =?us-ascii?Q?dUVWu0C6XwCIT12T1+KSrNVPMqRW2aK1smWToAfJuyzr7AH9EyYLTZuGS0FO?=
 =?us-ascii?Q?p4gJpv5chQ673gd0n4m2cE/Uva4P6NcuJ1JNPlKQjhnc8voo3Vm60HxxX7wP?=
 =?us-ascii?Q?c/nx3ol+rnqVFTlUsJG642H2pXyosQgu6qpUOltl60lAcov7aiEP/UnkO580?=
 =?us-ascii?Q?ppTEPlFRg56acIB8q069c41s1wnoo0VXyniWMz7hTsa3jXbZD+9k5L8iJ8xs?=
 =?us-ascii?Q?sFtnKVghhWgPbCyg+AGn9VW80ifOXtM5Yrcl8hrEyeh6rFPM+Aub61krXz/s?=
 =?us-ascii?Q?MAVVsg2UMaUu8lzrt421al2ojozu1qL4h2UQ6lSJ7wDKd8ZMsRojKD+TsQdZ?=
 =?us-ascii?Q?GKZJOvODPYfxVZ2SZ+R+BZEqZKguxif1FOmeQ2CUsrFoLNqfbQBUKY19SefX?=
 =?us-ascii?Q?OxHnhCMmlXXU0bitSlpaWxBZH0tdEPHpPYTLMtnDhFMw6Q7HRnJkZZzlOEbk?=
 =?us-ascii?Q?jD4zN3pc3eHC0hSc0C5uYkNu1meKrhfQaVz74PjPIenOLBlfVIlK0ZZqb5im?=
 =?us-ascii?Q?2wlQUd6oJmeE63mskdkL4A1AfFWroq+09vjHmRo1d/XW3GPlBc8ETRLt+O3H?=
 =?us-ascii?Q?AijgvnEUz8pZd+ydgTvf8xY787AeeZt4pvg+Boi64OqEFmYSnUTZiEnS3eVs?=
 =?us-ascii?Q?3/tn2hQkoXZ9tRFa6dJ+aafNERxuNoUzqIVyxLNIjNA4Vu5aiP+eszYMpKKY?=
 =?us-ascii?Q?l/jGSZlhv6WnEUF5gdXAQ7BpAhV5aPeZ6qo+CVIff3zhF5vymZVowKNseEEs?=
 =?us-ascii?Q?giuQicmmrHOcuQ9xdelROM2OJfdpzQsiiUrjaWZ1/8wdcvZZ88F39lewt+aM?=
 =?us-ascii?Q?T3E+6T9OqdXuUyE8oMn1rziewgb9m07c+EnW5nY+bRNVBeL7UkMmXWjTYk4I?=
 =?us-ascii?Q?mSomT6qFrVSzsJ5CDC9fVrXre0Xg0w2/SootPbfXqE1rp2dS1VRMGWfx6qY9?=
 =?us-ascii?Q?rDlBAMxARTydC6s/NMIkKSpqP5xygpFucnccKclCAOUVcbZ16Tebl8x2CDKJ?=
 =?us-ascii?Q?RgGcUFBuHjXeJ6JFcw4y/NBjw+659weUOSyGtfSNuRcyTBBQ2F/kRHtUfSvI?=
 =?us-ascii?Q?D+gMMAeQsz8EPznPrD5DBurAVRTHA7LQkYSYpWLXzmI0UbqpztGU/XyyUP42?=
 =?us-ascii?Q?h5jvxQ7kEwFCnbSucKSMUO8CzQOFTvYDg8T3E4QJ?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e43ef6e-b139-4f65-1641-08db2aafba79
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 08:30:44.2479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IirZHa3GicWTSSbnC+y39mBB8GwPnXck3eqmKOSlQYFr7mjlo4HisWiGs8IWu6qpFaLW/AS8QjW/lEn4Pbk8jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4944
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
Cc: tzimmermann@suse.de, ayaka@soulik.info, linux-kernel@vger.kernel.org,
 tfiga@chromium.org, "Hsia-Jun\(Randy\) Li" <randy.li@synaptics.com>,
 laurent.pinchart@ideasonboard.com, ribalda@chromium.org, nicolas@ndufresne.ca
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

Those modifiers only record the parameters would effort pixel
layout or memory layout. Whether physical memory page mapping
is used is not a part of format.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 include/uapi/drm/drm_fourcc.h | 75 +++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index de703c6be969..ee13250f06f4 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -419,6 +419,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
+#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
 
 /* add more to the end as needed */
 
@@ -1519,6 +1520,80 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_CLEAR(field) \
 	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
 
+/*
+ * Synaptics VideoSmart modifiers
+ *
+ * Tiles could be arranged in Groups of Tiles (GOTs), it is a small tile
+ * within a tile. GOT size and layout varies based on platform and
+ * performance concern. When the compression is applied, it is possible
+ * that we would have two tile type in the GOT, these parameters can't
+ * tell the secondary tile type.
+ *
+ * Besides, an 8 size 4 bytes arrary (32 bytes) would be need to store
+ * some compression parameters for a compression meta data plane.
+ *
+ *       Macro
+ * Bits  Param Description
+ * ----  ----- -----------------------------------------------------------------
+ *
+ *  7:0  f     Scan direction description.
+ *
+ *               0 = Invalid
+ *               1 = V4, the scan would always start from vertical for 4 pixel
+ *                   then move back to the start pixel of the next horizontal
+ *                   direction.
+ *               2 = Reserved for future use.
+ *
+ * 15:8  m     The times of pattern repeat in the right angle direction from
+ *             the first scan direction.
+ *
+ * 19:16 p     The padding bits after the whole scan, could be zero.
+ *
+ * 20:20 g     GOT packing flag.
+ *
+ * 23:21 -     Reserved for future use.  Must be zero.
+ *
+ * 27:24 h     log2(horizontal) of bytes, in GOTs.
+ *
+ * 31:28 v     log2(vertical) of bytes, in GOTs.
+ *
+ * 35:32 -     Reserved for future use.  Must be zero.
+ *
+ * 36:36 c     Compression flag.
+ *
+ * 55:37 -     Reserved for future use.  Must be zero.
+ *
+ */
+
+#define DRM_FORMAT_MOD_SYNA_V4_TILED		fourcc_mod_code(SYNAPTICS, 1)
+
+#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, g, h, v, c) \
+	fourcc_mod_code(SYNAPTICS, ((__u64)((f) & 0xff) | \
+				 ((__u64)((m) & 0xff) << 8) | \
+				 ((__u64)((p) & 0xf) << 16) | \
+				 ((__u64)((g) & 0x1) << 20) | \
+				 ((__u64)((h) & 0xf) << 24) | \
+				 ((__u64)((v) & 0xf) << 28) | \
+				 ((__u64)((c) & 0x1) << 36)))
+
+#define DRM_FORMAT_MOD_SYNA_V4H1 \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0, 0, 0, 0)
+
+#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0, 0, 0, 0)
+
+#define DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 6, 2, 1)
+
+#define DRM_FORMAT_MOD_SYNA_V4H3P8_64L4_COMPRESSED \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 6, 2, 1)
+
+#define DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 7, 7, 1)
+
+#define DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 7, 7, 1)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.17.1

