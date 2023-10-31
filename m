Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 584D37DCFF0
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 16:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF7F10E51D;
	Tue, 31 Oct 2023 15:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC7B10E147
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 15:13:47 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39VDoqY2030766; Tue, 31 Oct 2023 15:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=WulkzPkxdTRKci3zV4iGxe048BpLPCrvgmjVz4BIPFY=; b=Isn
 JWQK1Aig246HFoD+dtQfbT0+gA/wo5QufDCAlsT8aiKIi4qaAGHaPTkMqFnDLDkW
 Z10Ec++uTTYqbdHD6t8C5MMSgCOPAIEeUgPNkAlG5xCYcMEqMDy3mt3Ml2kKn4n0
 0FAKHcqe3BuwRjvTalANI4pJsPOIcxV9/+YAjqIg16NuPIyvRpyyckJBNOH7C0vb
 dN5QsiNxiFEE/FQp56hvLDHHNlqqHwVupJp7H5IsnmRNf7oc7TlJvTLnqSzxXcFO
 6PtQW5ZNPTF+GmTJCLH/baLZ1Z2NGd8hIJMA1ERBAoHArNr1tkW3YZaxU0pAhjXB
 M07+R/kTiJ26ZHY6Wcg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3u0rjntf3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Oct 2023 15:13:14 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 15:13:14 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.50) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Tue, 31 Oct 2023 15:13:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLpUbpUNpOjVcvw6XX22/tZN7BP+Hd1E/QQhDsMxw1aZyPGru2uVCGVyCKF3pvrlJkdrvWRKRoHgI9/BfCp9Z70hb6rVs1rGB9AXkepty6W6oKypeQYst5ORxtvjTs/XGxd2OY66jYV5TUe65ZfpdXrXSveVUr2Ja2i2f6UtETve4rtWXHYLEAV4M9AH7KiHFlvm66liIh4H6rke1sgDxKO6DVgUam/7cGOtH+5BK2xGOWZhpCOvPLto6aeet6wcC5ZuiFubKWIe9rWiqP1YtbS498YAUKqGqojwlUATRhSgZc/qQlS8OJe9pZMohMQFmGo/NJptUdxKLCdrTuJxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WulkzPkxdTRKci3zV4iGxe048BpLPCrvgmjVz4BIPFY=;
 b=ldbyYmog5P4fixQK/8aWdd/uTtiAuNu1neLsI/nc7uTbt4QDWu1U2+ct2ra4O2ZolwZurLL0v/97oxBX1e6QjXRq1RvDTBqw/J4hZta5v4CfaHCF1ANgFm2s8NpKwcZbWAzry1dK7uypaPEHWcXDn9P1A6W8fReOqHqUcL7M5bGhXMWb5MthrnCFE97tAi2yYTVTQQuScFFj/AOH39zBwkefyhLcXNk+lbw6TeO4On/we5Ge16UgPds5CnEDnxcKJtZaeZbabkQmEVEMaK45RMMrjexC2K1dIMltnZgXs7ufTVdghbn8R9MSSMKUdrbtpfFqyBgqVkUpXB51uAAlaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WulkzPkxdTRKci3zV4iGxe048BpLPCrvgmjVz4BIPFY=;
 b=Ke3KKbU8SRigKelqiklk8ByqzQcSGAoMJ9z5Tz96/amScOhFpjdcstQ7giqFmOV7dsWZAoLE0RAy6p1zv86AAyl+uEtAAH3ybKP0B+qzrj1uAOPCmb1y8f4DOprAKLAJji18Xq5XJnCz216mz+fQq9o8izdSMkxwnpl+mjZJpYM=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO4P265MB6572.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 15:13:13 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086%5]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 15:13:13 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 01/20] sizes.h: Add entries between SZ_32G and SZ_64T
Date: Tue, 31 Oct 2023 15:12:38 +0000
Message-Id: <20231031151257.90350-2-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231031151257.90350-1-sarah.walker@imgtec.com>
References: <20231031151257.90350-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0301.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO4P265MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe4f789-b075-4b2d-6cf6-08dbda23e6a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qi/VQ4ru6FCjkazyQk0N4gKC0Y/ShWH/1xBO5X7nR+KceMNezT/t3/T5okg6U4VRcTdy97V7OT3/I1zNILqrSfvLRZZQ5w0ysxWJXFx0DKLaxyoeDGW4VzpFmuw+I7ltH938KwnjliLqxTJKkj7AJJ5BixF2p3Yvg27zDzf5fVi8OJq5goDVl9XIUd6GtPv9APHEh7oCxtUZpEGhfNi6Qe6CD+8XykHClCoQLe2Ak7P3Fy2fpbCEjhlWMTzV/mjZ1UX6J635R6/Nz+VojCJxRpF6ejysAnfpChrsrLurIIuQXZgMPUnpDR+kEF/dwPI9OiClNmhYwxy2Wxuektb+YTATx34dSYoRFqptuspC5ubS4fjrXLcoWjYXMJ88jc0xvX/G7bV+85Vkerlw/zxXxv2/2Xi23nd2ZP2QYJj0AdSRmv1jx6x4/TOBt2Fr0FToloz+ouxMNW3c5OQGtrsv+IioXBrhLNM/0q/HqTfpyLvsq/OLpRB1sVitnF8gjC8EAzbBQMFkRPDi30VeqRR/B3h8Uq36j0BdowECNT5VVGBqPpx+w33qkzQJVxy64jroqVzA6uQ13UWWVUCkSRNPBbZAuYIUCAWKAvRNuu/ybpf2iLWdloEJc3CHgU2g7Suy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(396003)(366004)(346002)(376002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(478600001)(6486002)(86362001)(6666004)(2616005)(1076003)(26005)(38350700005)(38100700002)(36756003)(6512007)(6506007)(52116002)(66556008)(66476007)(54906003)(41300700001)(44832011)(316002)(66946007)(6916009)(5660300002)(8676002)(8936002)(4326008)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eJGGSVuGPLuBb63y74+2ntmQiHvT8puhgC10W7kr+Rw+0y2Mr3NBA6w8/kvD?=
 =?us-ascii?Q?3whRbzhN843z1XajdpuCXsfub4XK28b1zjiP+5XSBdttGAwuXJzgKauM6Rqc?=
 =?us-ascii?Q?uHFIym3MZ3Fdou1Xd0NlLKQMcMVbrDZaAeUdJcG9CUbIC5bQ9ssjWDb06TgA?=
 =?us-ascii?Q?80YkrkrlgIBtU4qYees/h8LujcVwkkcAXDJHnHraLq7isHyxmuVZS46kB03I?=
 =?us-ascii?Q?nW3OAdV2kuGkVohpRxT1f3gBG7uxTJ0+cyxQ96h/fek4zdVIMK/K/Af1+XQI?=
 =?us-ascii?Q?GbV5Lfp61Xp9ULw1NBETfLoD8aI6d1Y1qJZ1xRnC5XdSh7MKWzsPSBrU9Yfz?=
 =?us-ascii?Q?ohWq/fk62cULY42RhQpW+akCgpVFDpHdEBwQHfth6JsTHfOwJiLPGZhKkK7H?=
 =?us-ascii?Q?R9FYhmqaAca5MAjCZxmF0DXEO5RXgddB0AdVMuNAhXohaBz4sOklQZRzmIEP?=
 =?us-ascii?Q?cMcaZJN7C/6WRn3YaSTxcXyC8aG/lHHPCM4rvd7sbjjpVqe81Gm18JQdAv1N?=
 =?us-ascii?Q?ZaoNOQ2PRxdAOdRCvdMwc+VYn6tUiyvxtofFc6kpXc69p9nYgQhQTFEiki46?=
 =?us-ascii?Q?X+vKQPPyFMdHj5K4nIlQHtRq7HU0pWxCX7s3z/Wo6supKvS672Ysmd2zljYq?=
 =?us-ascii?Q?syP5IVprzQgo/zNaGQbSxlRB0ew8u7wP4kN70Ohw/sA/kecA+5kAjl/VeRqk?=
 =?us-ascii?Q?YYcjCMsioi9XyOx8+aC+Gfi16rWRBMsgHZLkrtHK6IyAEsq5oK11ypYTWDQz?=
 =?us-ascii?Q?KimnrhSnRHkPQzZrwBHM0yrXxEf4HmKIiZrY9czx7m1rxsrfQOEGsg8L0HcV?=
 =?us-ascii?Q?18yjjAajGpmiyXLV2Nf+Y8FTGdTgxcbz71kPOPcWuVmeecvobQcsWhdqCKFH?=
 =?us-ascii?Q?BycOGvPhHF6WBN+Nzg7MIcH7mLoEmi+Xo3R+20fh6IGGjrMlDxZfcOiVYqvD?=
 =?us-ascii?Q?QKadca/O8KEohq9x1zc6W+ZAIHeHk5BXlyRHvfTdk5+qCGO5mNYrpwllZTJI?=
 =?us-ascii?Q?fJKzDwBrn74srXVxTzEeQloAYYvU7xC7iF0WRtFY1c+MG5j+4+waEtaMwFup?=
 =?us-ascii?Q?QB8mjKP7uPu0l/Tl+D48/tnRd4PUBwJe7z6kMenm+sisA4IdAeEezHG8l2D4?=
 =?us-ascii?Q?+1dQjlq0dSJ4IjN2gpGDxxQrm7XXiXeDuAlpKKegbp24Jf+pDn7Uvwo+appH?=
 =?us-ascii?Q?59rDiEhTFvH4hZp7dk3Q/GXonQXNhj7S7Bono+7IsJTfvcdsF4060AnV6BlB?=
 =?us-ascii?Q?2O3+sx+TvGr+PiswcRlDlxgFYnXT7P7puzXaQZLziEoRMyZBX6qhE6o+6cJj?=
 =?us-ascii?Q?avw5mkkzQQJKPo3Tk/3HNBaJpgOvp8Tz4IN1Ga1LD8oQqdB9Gx2N8lTMX1S/?=
 =?us-ascii?Q?qOT6DWp3xUFwzgESzXWfxrEkIee8DMqWIm2yLe6LXmH/URTygX1ore3DFHm/?=
 =?us-ascii?Q?Z5ZjTknNX9E+R/BaAKLXqr/j4eYrBKO5h4MQR89Ploh/0qaxUwhaP0MJ1FCx?=
 =?us-ascii?Q?FYjBb0m49ZQJnDk4uPXY0OathOE5eqYOGpKUHmtEOCc7gvbC6mKPMyMWInr1?=
 =?us-ascii?Q?/0lTi6xmH/58jSV5UuZtE6jxXq6JgilMeeZwcpUNLbEngmQrTVpnMSwL4nxv?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe4f789-b075-4b2d-6cf6-08dbda23e6a7
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 15:13:13.3599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTiHAAiNzST1VR5o+In19aXeDBimmHnkrqcpqF7fRMxl9KDfZ/cznMjEQFX1730GiWMh8cSZb2Vq5T19SDcBfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6572
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: P9PZnttcs57zSDbcaGT0h64nRxyk4W9z
X-Proofpoint-ORIG-GUID: P9PZnttcs57zSDbcaGT0h64nRxyk4W9z
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 Matt Coster <matt.coster@imgtec.com>, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Coster <matt.coster@imgtec.com>

sizes.h has a gap in defines between SZ_32G and SZ_64T. Add the missing
defines so they can be used in drivers.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/sizes.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/sizes.h b/include/linux/sizes.h
index 84aa448d8bb3..c3a00b967d18 100644
--- a/include/linux/sizes.h
+++ b/include/linux/sizes.h
@@ -47,8 +47,17 @@
 #define SZ_8G				_AC(0x200000000, ULL)
 #define SZ_16G				_AC(0x400000000, ULL)
 #define SZ_32G				_AC(0x800000000, ULL)
+#define SZ_64G				_AC(0x1000000000, ULL)
+#define SZ_128G				_AC(0x2000000000, ULL)
+#define SZ_256G				_AC(0x4000000000, ULL)
+#define SZ_512G				_AC(0x8000000000, ULL)
 
 #define SZ_1T				_AC(0x10000000000, ULL)
+#define SZ_2T				_AC(0x20000000000, ULL)
+#define SZ_4T				_AC(0x40000000000, ULL)
+#define SZ_8T				_AC(0x80000000000, ULL)
+#define SZ_16T				_AC(0x100000000000, ULL)
+#define SZ_32T				_AC(0x200000000000, ULL)
 #define SZ_64T				_AC(0x400000000000, ULL)
 
 #endif /* __LINUX_SIZES_H__ */
-- 
2.42.0

