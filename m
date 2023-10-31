Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856507DCFEF
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 16:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FC210E147;
	Tue, 31 Oct 2023 15:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5588A10E51D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 15:13:48 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39VDoqY4030766; Tue, 31 Oct 2023 15:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=hRPUL5Zhd7cSw5gol2T/qkJJQcxXiJuMQsjZxRfRUys=; b=wim
 bSwdlfdEDygaYO1bkn383zPdLEzh3oxUnUi7EQW2JKy0fqluPwqFOULrCjnPVh74
 XI3OZ8Joq55iILm+7PmtYuAAOzFEKSwsb32xtxvfX5MVojmLeU93dWwDd6hVdiCq
 ytK3QN36DBXQut4g/KGsf+sSK4/aBWW9ulJiWBPa6A9JU9zgJP5B1cQUZ7UoT81K
 h0kwFV8NO0h1tvKnsG7FF0hIkUu3SH9hZJcFrP5ptFUI9dywPI2S6mZ9FvQo+Y/9
 kz6e+vzKyslMEPtfk1VqAgpEuV9I4D453bpvZGKPuLS/i1ELMXUR/rRMJJUouRnG
 ELPMuZLXMWq4iu9ta8g==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3u0rjntf3v-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Oct 2023 15:13:16 +0000 (GMT)
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
 b=ejWMry6AQZVIDQ5AeQ0jxvohwDJqtXV4nVVC2Ru6RGw98Ej7iZ4KH6yY180elC6fKM8iJEGR/JMYxUdvka2xwHUOX66oB4pQ71M9ZmmUNcCMIJhrvGfebu0Mwh2m5BqaWJacQS64MQrKShdEARvta2Oi05VjdA7bfRTHG4FhTJwoC1nY2Yv7v1anQ2avjhpN3S9+SC+8c2Gi9Xsgs/NSJx1Rl0GKUQDP8clPFF6I8YOkXrJgnZc3InJov6I+160d6AW6qDtD0wi/a8d2THhsX25U8b+RBUorkC48NTRQugoEKdJt9qKnj+kGAH1ET5JtlkbGwsKcsXD2jxApZdR6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRPUL5Zhd7cSw5gol2T/qkJJQcxXiJuMQsjZxRfRUys=;
 b=Ds/xeTb+Lm5nOvHzcKCTB3RWTvxFdMyjdfiPBJlxNXliawJWNmbVuzpybtZv8AZMoIqFiqOKPIiXJkCblYVJQ5T/kRLZFTolQMyTOqX6M8UKkP5m7BqJUD/cd4hc1z/st5OqqSO/QPyxdsG/02+V/k+wq1HV0vmSrv1SmlFPD0HDeJPaEKbiL1Fe/arTavWy0BuMbYeKTofkXu7gAw33cpYmtK0byhAzT0wc8qD9x37ENniqCVQjz7JsMIknMjnLQKsscKEjJizcjOcVC5I/3K85cmpN7b1i7XNJc4GceZYPRHksjQzkJ4kly2ND1Kewo4GKZ9ahr4fiyrnQHQpM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRPUL5Zhd7cSw5gol2T/qkJJQcxXiJuMQsjZxRfRUys=;
 b=VoPH6rG+4D9DkQQRrRXd5kl9y0VeVSocXJE9gc91hbs4UK8w53KDZTknj8pL2QXH3gNr407c4l9jArzbgZc/XH4AO2l5xkloMgOXWNN168GL3aTrEGmqtC+2i2qykMbgbjNsYnJLF+9fizN4GaVeyPg0qtBgQMZ6eR+p+a617r0=
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
Subject: [PATCH v8 02/20] drm/gpuvm: Helper to get range of unmap from a remap
 op.
Date: Tue, 31 Oct 2023 15:12:39 +0000
Message-Id: <20231031151257.90350-3-sarah.walker@imgtec.com>
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
X-MS-Office365-Filtering-Correlation-Id: bb9d657a-e6a5-402e-07a0-08dbda23e702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5WyVkb0pFJvzoaXCg/lrwZeX7/3IivqmLY40j4Q0ud9tZHgn9VaVV1sDsZdlALKNHYoIZ7azyRDI8uGiuQxKA83FUD9AtMHnGvCnXgBI9zneDUUALsvipcnrTngctct/l7ZDDcpsmDiVjXU9ktnFPiEoBzVn3hLqH3pllgz72ydSXjP5XhJmEgb9MC7UBhLGEqNhLipLNdXWmTE/F5j17y6iWJACnhNUgHn/gDVB3UpcufVeDMBPzM6e0eqNNcCaZTjsmoZzsFrOVEnCjR/ZD283pmZre53TRxSLnGG7kAOCIEkOoBgxWW7QQ4xGpc8Q7BSijGIzYLvWap1eJQFn7NNWasKTBLFypOkkktzqyAItmrx6JmQpRUxW2aBKNujZvJYBygHL/oK/vjV7aYaBLMeqavPgTXzcQecHvwzb/nElNgqm0DOE+A2X4kP0PzJzeKEjNxX97ZsY0QHOUGGsIDJMXPgZyg6TdKnzE06K/reGDkkKZsk8Vq33tfT69/SVr7BVf5onY5EwIkGJeCaLhQTANQPRfw/jjIZhZDboo2QUQLixILwrLdUWTmqwXIlpBLaLsfs4btp3IS0yNzcerg472So4ZEO/13oc7mAaLk9rhaaHOULlsh2BEeVy8Sy4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(396003)(366004)(346002)(376002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(478600001)(6486002)(86362001)(6666004)(2616005)(1076003)(26005)(38350700005)(38100700002)(36756003)(6512007)(6506007)(52116002)(66556008)(66476007)(41300700001)(44832011)(316002)(66946007)(6916009)(5660300002)(8676002)(8936002)(4326008)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CFJeGopJ2IXOW38TQ+LKzVM7ATOWHJ6P9g8Q7pEp9rDIaU55ZGGtDmtKw9O/?=
 =?us-ascii?Q?fnsa9p5T6jP8JPWDI7cAIHMJwcxwnL9b3svt9rOsGLeM5CVpCBMqz4iYiHi5?=
 =?us-ascii?Q?thaVRKTNc7yxI2v6bm65JkBFDD6rux3x8jjIe2KHeyaoFgApI7kSw3sxtj2+?=
 =?us-ascii?Q?8L3tFNDzwe1sNd/3UliL4tEHxIhko5tu7YF4lZlzeDamwGXolDUZw8fZOaT8?=
 =?us-ascii?Q?uKoSyq+eJa4gY+omkWWcyHD0DLfUlYEWgp++KBPEC3H6CGT01hNWf8mGEhZO?=
 =?us-ascii?Q?AQ4w0b89dCmYcCDuNHdgd3Ks/DNvPaPWnxohRPtyNbDFbkUDZEsu+8ehNKZT?=
 =?us-ascii?Q?Rw9aNNpPC/zDqB0XyiLigkc9H0qweDYTciihr8czcO8voz8T9yGg+9wHmyAX?=
 =?us-ascii?Q?X8U+RaFgN5X2OZhvm2+G3XZdIqkK2MZaJ4ETsmMg01rcf41U8NveWBraPqcG?=
 =?us-ascii?Q?see1+NiKhesCwuBENmQWllYcRBHFnjqi0xHQcMUW/dwnDTbshK3tdPlzLlrJ?=
 =?us-ascii?Q?Nih3rrn815ws/0sMZv/kLVMEkSWcHRWFCrCNUblQhyjGxXmgE/LJE9CAnL2X?=
 =?us-ascii?Q?jmFR/ez9OfSpnKLANqdOT5eW8zZ3KEs6E1x1jbSJS0Oq//fnTq2UbuEXE67F?=
 =?us-ascii?Q?8UlevBnE7mQtIdH6LSw84Edgub2H5LTAZEY5oNINZhXQ9Mw6vCpZfAlJkB7g?=
 =?us-ascii?Q?L3PJ0Nrr2CVa1TRm2uXobkQPwnY5xWwQcVVGbXJpioxG0L5TrAMdjcZwwikX?=
 =?us-ascii?Q?Ai4PtHO5sd10v4U7Q0E07NNIeDMDlkwIutzOtRtiGHthO7hh2A1pwoGl8YnM?=
 =?us-ascii?Q?iUHdNm/Rr7+5VZJzg2hl9C+jvcn2TmmwWvI1lN88G+0Ml3d7U4GD8PypZ1E/?=
 =?us-ascii?Q?gOzCFqhyi3avMBxs1oPE6rIyl4Ijx0RHob9+yPwCNQlyisCzAFqVEOYHeLT4?=
 =?us-ascii?Q?zQzRtsYYjnc7Dh/h1iEaqc9zSwVBQE2zdYVdvHxKvlBb/jq7JRt6vqkUmLiH?=
 =?us-ascii?Q?RWVIzZpBPAR0GDsrXPIHwUtqq0vKsRefe1/e17UD2we4avdrPUEbaiza+faW?=
 =?us-ascii?Q?TAa+cH7CDm4DmCOS7KI0Wb43fECLbBodgG+rG5lI34lY8/FIDbK0GU+ERVa4?=
 =?us-ascii?Q?F051jwJspP1IC2MLFj1nk6oTZDsl2Xj8cffblLzQdSxdptgAvgKVQT9NyG20?=
 =?us-ascii?Q?sE71ztE/AF8lHg9T0LGhcyZyk0mwXnEoGKDf5DH/JnxpM2ucqUu7jFYMhKY4?=
 =?us-ascii?Q?2xd2Q8dNfFPBfIMvV+plfWr/UBAyNk8GBjEaiAtbyZ5PSP3EluJExx5hEynN?=
 =?us-ascii?Q?uGssLx/MdPLZtD6fpDuJV97bllen/kd2sBo8JAyW+nMysGS0OPt9o5XEzcjN?=
 =?us-ascii?Q?JZpm6srViYazPpTxydcXM5OsiOgyReHQUO/+M99hEWMWRmntsyM5PtldMjfU?=
 =?us-ascii?Q?ZyffQLrZFn2a6VhGrCa4DEQW74+5pHuKo6DDePHq7U7XS00apaU8eFCGGu7R?=
 =?us-ascii?Q?2N5SbeCggQq6+KdB4nwBZ6kF342dNm3iaxJF46bk9ljsRNCUBwKyJ9vQ3eW4?=
 =?us-ascii?Q?OdpRmk/C9nFgrnq0iFIH4lTCF4mmC4WVRQtDXyjcvytygEPmiiZEqhysrBki?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9d657a-e6a5-402e-07a0-08dbda23e702
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 15:13:13.8697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Q+qRis1JlA6Hx0n5xUaztT5M7CmdLZDnVCTz04KndIQIHBNF25CN7T/cCHlFi1FxlS5o+/ZdEjn0CibGDJC4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6572
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: yfYyzTRkdHN4eWD5wtxsufvpSC20sKxB
X-Proofpoint-ORIG-GUID: yfYyzTRkdHN4eWD5wtxsufvpSC20sKxB
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

Changes since v7:
- Renamed helper to drm_gpuva_op_remap_to_unmap_range()
- Improved documentation

Changes since v6:
- Remove use of __always_inline

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 include/drm/drm_gpuvm.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index c7ed6bf441d4..c64585dc4e8e 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -702,4 +702,32 @@ void drm_gpuva_remap(struct drm_gpuva *prev,
 
 void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
 
+/**
+ * drm_gpuva_op_remap_to_unmap_range() - Helper to get the start and range of
+ * the unmap stage of a remap op.
+ * @op: Remap op.
+ * @start_addr: Output pointer for the start of the required unmap.
+ * @range: Output pointer for the length of the required unmap.
+ *
+ * The given start address and range will be set such that they represent the
+ * range of the address space that was previously covered by the mapping being
+ * re-mapped, but is now empty.
+ */
+static inline void
+drm_gpuva_op_remap_to_unmap_range(const struct drm_gpuva_op_remap *op,
+				  u64 *start_addr, u64 *range)
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

