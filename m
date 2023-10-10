Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1BF7BFDAE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5505410E36C;
	Tue, 10 Oct 2023 13:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2189A10E36C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:38:35 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39A7CDVK029031; Tue, 10 Oct 2023 14:38:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=SHiZnjkgWLqlT2BmqY5TBFFb9ZzzHJDA3XGFjQBwX+8=; b=VFT
 cPbv1XAll20wDwpKZBXyrUbQ5slB405/4aBNgiX+uoKhuTX/j9FYqOnE7OuH0nkm
 a5HOKTlQpSh6thnWd59RpX2qaRjzX2n1nAX8ZB9E7Ay3anb1wfprildmSLtpswWN
 MJ+XLCdI3ZoT8DC/YTiwt/RtaShH7/Zu000l9ggrBnL8rzIXKde6T+EurqDBoiBR
 aMY7rmwwSxwvRbA7FrUpu8mHHlLCZD77a3fYxumU44ekXtCd5wL6QOiYZN6Zs51w
 jCH/agY0ot9sFIS758c+wYet7Uck5SxfnhYkfem/zgyk7Gsrb+muusDt7QtZI5l1
 2idKCVkS7jCDsHgkzVg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3tjwkq2a63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Oct 2023 14:38:07 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 10 Oct 2023 14:38:06 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31 via Frontend Transport; Tue, 10 Oct 2023 14:38:06 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edKQxxB9RHzOJ9w5WwGyau8qp/xvBsm9A8u3s01s3ifm3UOQrDL1OeRZNbQ9qjI23N5D6Eq3/ruf2+Myctk9YURreMEKBsTr/IkT0aTROiWl4NW2JF5r3SjLbKlyI9qYOwyKodirOERS9tj1KiNUMy3/A6s/F9aGxfSXEzqpATPrOFICiWukUbeI31RWY7tfdZGLg5PprEMjvRa27Su3A7Ew7r1/RpXzN9SgCOmCRLZ7AyUSsC8EfixdQqpJ3jI0cUmmU3lq4EN3MaZ78kDO/lHpECZ1f/mdfOqDKsAsk2ADxt75IJrhjMwgKKCIJAG7bT5Cp0zOWSlEgc7Q13r8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHiZnjkgWLqlT2BmqY5TBFFb9ZzzHJDA3XGFjQBwX+8=;
 b=KqEYf8mpxPkTuvAzA7BB36nmP1jE16d2yhVjG4G/WtM+xuA693ZG6O3GKgB2tB1JKAd8EibgtI2tbEJ1d/F8EKmFYJH5znIXWtL3T4y80YEmk1I12jCbOC4UxLArXMalyXcTcDHM+6vGzV5TuJ7YaVGHS72gv+JKCxOH/RTvqb9h1OfPA6fIp6DTMoH6b1JhUTOMuCu+LUo9lZv74qyBq5CrMhC2xIJQ45hZh14LzWZBqN9V0sOg5tikyNMYvqM2pzszBp3EPkI1e5uSytAg6oAp9kqocoL8w433/haF0aiOhCGYjYJSKHgqMoVYDKkV89NDaH5exgGzsqcubVgegw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHiZnjkgWLqlT2BmqY5TBFFb9ZzzHJDA3XGFjQBwX+8=;
 b=YakOpe6/sIEuO1RaXU090jFlL5GQXgh5zstBt3dk4uZHYfu5MKOfTwhpPrcxHzk11zV1L0xMCJIpj9u4StPtyBKkH6hlBSyhyIsanhvfuvTZ3GAvjKJ/3QR7G6ppg1DCfKAgLS875dsC+0cDhH+AUZxigdLq/RDlITV+imoAYQs=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LNXP265MB2442.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:38:05 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 13:38:05 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 02/20] drm/gpuvm: Helper to get range of unmap from a remap
 op.
Date: Tue, 10 Oct 2023 14:37:20 +0100
Message-Id: <20231010133738.35274-3-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010133738.35274-1-sarah.walker@imgtec.com>
References: <20231010133738.35274-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0183.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::8) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LNXP265MB2442:EE_
X-MS-Office365-Filtering-Correlation-Id: 63cf1a5a-759a-4c87-e7e1-08dbc99621db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C+LI2pXkPwGcRlnTylUrHixv/1JqhFBvlC5opuHMJGbBrpyuZ8T06/lT7MxnEtoscTaSs/4uibo+zXYoCksCpgl81rFeTP8lfr8PnBH3lcEjbHe8JbHOv74IsW1oy1xCp49JWDUDO4hJ0pont8foPoj+NtImaEpaF3hccnnHHJMwsX+WJ76DSaVgdBY9JFwMG7giUctDSjq3pUPu8ickWdwyzD+VogNoeM3n+nIq3eeqpW3cBZ18Bv1B3bqnZswwL0LOALgTRk7rfVbrsXQdTThx20byO4JU/n6ico9wx1AC23cPNR/jvKXjJxPHhRd7V9YDpF/zjAlL3W6XyLFJ4IisMPBgvZRWVTRhbLGwlf/lVD/1bc3fN9Ng3s/Bu32tyAdAFd95erwJXCxWAIVRzUmRnerGC6ByfU8SaHmZgmNnce2Dtv2wg0xf712lYBLavkXRS/VC6Jn98omr80PX4SZesrGm7rZByuLssmDdDaHQFE8fQsAEFV/8DBPYnBEyVZz3AXFKa6Fj4o6Gpb+TUI+dzuKxgL3F8tA3BALD9NepEKUVPbNUQbTaNOAtz9g+PKvgaJ9fg0CiVUTwyXmCkIwnxSJOaTjFiu+9nGIAW+pe9EysgM+3DWpd4mGbAhti
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39850400004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6512007)(52116002)(1076003)(6506007)(2616005)(478600001)(6486002)(6666004)(44832011)(26005)(7416002)(2906002)(5660300002)(66556008)(66946007)(66476007)(8676002)(8936002)(6916009)(4326008)(41300700001)(316002)(36756003)(38350700002)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?omNgTiKqZLfGI8HnXrLQtE7PetGw/bt8zYVl8UYqJLugULpyAVARbqUReKCj?=
 =?us-ascii?Q?1CUeOFR22/KgkTTlHW9VQkKEQobzZnsHByCtNj+ZGMVta00vU0AT2u3DTCt2?=
 =?us-ascii?Q?IKt/6APHlyHrf2BfSB4Bf8nqn8XDoiXENSCgTpyL7IpGCfi0mtzm2XI/LfZC?=
 =?us-ascii?Q?lCjXHhqdVov2xJCj3+U3pr5wJk76Dl033Vup1HZld5u2+Oa24T1AD+q/Af+I?=
 =?us-ascii?Q?zFHYJ+Hd0pRno5LZq3yjPsYeJHgr9ypSII6ROz7+DNsjQO3NqLXGGlOFKgOV?=
 =?us-ascii?Q?MTUKMlQk5X3w2pEAiyG69l558PeSbrXVdFabwsO33xstR6j14dbgsO6XvBaX?=
 =?us-ascii?Q?nWJH2O8lTa0m8FOWCk6xjnBVNUifFrZmlZM2HaUIm8UEJJ2BYqBaZ5JmHAeW?=
 =?us-ascii?Q?06NoMBCjK4UF7TsYYF2f79LmG0fh9m/Qx2LmX55+Ln05H7fse17TwAxw/MK7?=
 =?us-ascii?Q?4n9HGhtV16SIaQUcJWAlSOiK5mWj3tUWwl8NfKqOCmBLRLsAUnOJ+X0hVbiB?=
 =?us-ascii?Q?AP6ElO2OXQnSkwLVwXAhtvTbY1z5eozudOfls+Lk1QXHMvRWN/KUiWDjlzSG?=
 =?us-ascii?Q?7K1q0uVfN+ADImt56UmIf90x715muRv6YfRBIe+n4sxZ7C/ZqWDcqjrc2X4r?=
 =?us-ascii?Q?SjyyZPzH6+rOoCvQBTjutpxWsKEne4UZmB+GLIcRHrc8YZgPH26fjd0SIPsB?=
 =?us-ascii?Q?k66jK1V+vq69ZkHqqxfOpqGvw1g6zOY5tBJnkpv5Le/rejfz9DG/Pnq/UO89?=
 =?us-ascii?Q?Kd8G8f44B5AU8z8DcfRW2qx2bXXnwHdH9KIIcUyhUIAzVNpedzXuoewHyLTK?=
 =?us-ascii?Q?GWuTQW4Rw5opv4nxx3Ts4J2ku7duecgsbuZPlMXr3AvGuUKDPhpmdzuaZL7/?=
 =?us-ascii?Q?+eC6DP3R0Xs8Jln8qu0/R6ZN6jhWtvXoROmlTbGOvJsiuGU9nPBcn8RlcgvK?=
 =?us-ascii?Q?Mo/XQ5U3Of4WsnIi24++3pnyAhTOx8X/eKfNUi1vK+VHKHQemVaRDtCMHnfg?=
 =?us-ascii?Q?3QeTq6ZgYt/RQpJSwDsyEJ3OnSs1ISsDb+PxUtSDoEzO1fH8hkowFUh6TzHr?=
 =?us-ascii?Q?CpBDKLpX2+neWxCou4iZ/DqJsl2E12tqHxTkUU1vVgZNcNjDmJhtAAEqx98W?=
 =?us-ascii?Q?wNbH8xsiSKjI+s8+4RmxOWTnarg4/UjS14GwqANoKBIarF06LfPL6cyXkzDf?=
 =?us-ascii?Q?9l5z87fW0A2p71f/hPRyq4vdjBGM+Zx9V2PUTrrzNTlfwIikcihFMdaGx6Fi?=
 =?us-ascii?Q?NylgjiYQZrLNcle5BIFVONIiRmF+1OapfL1GEIiIXjujU8Luiy9Ezy/NbNXU?=
 =?us-ascii?Q?lwj+olF2Kbkzkc3nNK1wtgEy8GJX0tJULc+8xmjoreJ/vG3pTKMkrBpACgpQ?=
 =?us-ascii?Q?KTxvOGwSoTuO0BiAEcXUjoGjchF6nB9nyUdoLc0OVj55fEyfv6hiGO023/kw?=
 =?us-ascii?Q?BRK3JD5UW+z9Yowa0pVDezQrMffAmdm6vp/VxSPAXGKXkHtb7owAlrbeL5+O?=
 =?us-ascii?Q?WrE15rYB4f9H4Z6MQevNBc8gj6aIXQOjXMEoBF7e3ToO3IdqmArE9s2vxn2B?=
 =?us-ascii?Q?MMOcRAwqm57K8Ldc21ovnwe/7YWhtXU591lofyX7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cf1a5a-759a-4c87-e7e1-08dbc99621db
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:38:05.4309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YalbOrTvGen1AXvxBtWiwDWJDywbUlqa1106FSt3B+j73ggt9oIE4so3R2AfAetAkmrysZtgXXcbhe0KHVerdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2442
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: SW_KtSOQyTTBryrqvwdw32fiaU3iZDpy
X-Proofpoint-ORIG-GUID: SW_KtSOQyTTBryrqvwdw32fiaU3iZDpy
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
 robh+dt@kernel.org, faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org,
 afd@ti.com, boris.brezillon@collabora.com, tzimmermann@suse.de,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Donald Robson <donald.robson@imgtec.com>

Determining the start and range of the unmap stage of a remap op is a
common piece of code currently implemented by multiple drivers. Add a
helper for this.

Changes since v6:
- Remove use of __always_inline

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 include/drm/drm_gpuvm.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index c7ed6bf441d4..932e942da921 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -702,4 +702,31 @@ void drm_gpuva_remap(struct drm_gpuva *prev,
 
 void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
 
+/**
+ * drm_gpuva_op_remap_get_unmap_range() - Helper to get the start and range of
+ * the unmap stage of a remap op.
+ * @op: Remap op.
+ * @start_addr: Output pointer for the start of the required unmap.
+ * @range: Output pointer for the length of the required unmap.
+ *
+ * These parameters can then be used by the caller to unmap memory pages that
+ * are no longer required.
+ */
+static inline void
+drm_gpuva_op_remap_get_unmap_range(const struct drm_gpuva_op_remap *op,
+				   u64 *start_addr, u64 *range)
+{
+	const u64 va_start = op->prev ?
+			     op->prev->va.addr + op->prev->va.range :
+			     op->unmap->va->va.addr;
+	const u64 va_end = op->next ?
+			   op->next->va.addr :
+			   op->unmap->va->va.addr + op->unmap->va->va.range;
+
+	if (start_addr)
+		*start_addr = va_start;
+	if (range)
+		*range = va_end - va_start;
+}
+
 #endif /* __DRM_GPUVM_H__ */
-- 
2.42.0

