Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB7A7BFDB2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904B410E36E;
	Tue, 10 Oct 2023 13:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E7E10E36E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:38:35 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39ACsx8u008988; Tue, 10 Oct 2023 14:38:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=WulkzPkxdTRKci3zV4iGxe048BpLPCrvgmjVz4BIPFY=; b=LxJ
 jKztmZheL0U9Nznp4zskDNbz2jeuGN4XssPU1mSlOHrs4M0im0tgWTki50HUEvcu
 zplYoQ3RDJ7LXt76xgwLjwtQC4I+IG3Sx9YhlzQkTpS2DlwmokCuZqkY3R2+syIM
 /IY6DJlmyIrwSz9XoVTgHEArJleNxdWNMfHJ2QZ4u4iRjkL3myVwgxVvxB4zGPwA
 6kxlR4Bg4pjWIHWJOx6BC22jyJJbt4hvkYRSdMT3c7LNYDYC/Sfg01lC62lfCm7r
 /aqbdlIsBs2ocCkmAzJiApCdXSa4GXS5VFofiCEd6pEImAPSufysv/cYdEaRNEUJ
 H710Ogs1p6xJTvHm4UA==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3tjwkq2a60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Oct 2023 14:38:05 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 10 Oct 2023 14:38:05 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31 via Frontend Transport; Tue, 10 Oct 2023 14:38:05 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTBItvwOAP1H+eI2eSobNIoJFmu+xnQelVziAIVJiogaZa3XbcxIQt8+37d94zJjdOPTWFDaMmF7g6dN+wp0Z5N461NTA9U8Dws3x0jl5/RAo/rYpPQeEBvQaWAdsufPOEdlY7KvQtbmCNLb6OdWubhRo5yoKzLfpug25Op/ftnQccgsA93iDekLOhExmaa6Wg61Wo/QFJOh1cUTeTOixtCSHAjdNhkhS9yhhVXMJm0AS3nCb9dxpqROHlQc0H3XiWnxy1t453orh0IxQMzlPZNbU13HaXppim0DNezjRBibF20oX8AurNd/Q2kbjvA3zXwc2iZpK9IDsNNB9KTyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WulkzPkxdTRKci3zV4iGxe048BpLPCrvgmjVz4BIPFY=;
 b=n7do/zSlcsVjNKV3jzuVfUfWn2CQdQymt8hlBjn4IASmKMFg4XKwYugJm2OqvAb2HjMncUwUsQuEKIbh3g/qCjTUUtP577+eScvQW8ZkQP2xZPw/PmYenp2YKEbf6bYyZqpbUVCiSnARut8J2s+IhKVvGEPE0ExkGj21xY2NbNCsat04TosktdP7uWpJttye+1shP8ypnYyXaWbDYmWJO5ysHDNxYlW8o2QhCcRPhzbhBz2SgIarJOB3qrh74tPzgy9dSQxhP63Zj7T+9zquiNJssj+Fo/M46Pa/0HjVXoL/Ka8f+NljtLYYnoG4DoWRcD+TTq8WU7MRosnrn6XS3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WulkzPkxdTRKci3zV4iGxe048BpLPCrvgmjVz4BIPFY=;
 b=lBsHJpxU7NUUFgMDhefbDAIgc3CAFoVj7l7BA4P99fwAnRsbuH/msVfQHL3WrGq4PBj2Wd7Bl/ODQHMs+A0qeU9H0Pr9yD6Ad1bLDR4u2SAmNA/au4seDOYSd8ov8o0AiIQwJ6yDebotnQ6vwDkMHgROdUoG27gZdfHQe8omiQw=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LNXP265MB2442.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:38:04 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1f14:8c15:179d:7afc%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 13:38:04 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 01/20] sizes.h: Add entries between SZ_32G and SZ_64T
Date: Tue, 10 Oct 2023 14:37:19 +0100
Message-Id: <20231010133738.35274-2-sarah.walker@imgtec.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1ffc676f-8b46-4fc6-750e-08dbc99620f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXAqqtsXlOS/8pYRyatNlCtzkh/sxSYTLMrK4BXwapmg+h5fOo5aqGztcU58Pc6m4KIPdcsFwFTynjb4y7ndgHbRJ44dJT69fpB+QwOSVnGGfL/ir0lXU0b92FsIPVFm4r4uPsBMIWnqSbPii6Dk9g++i4a2GaikfBZ6RPA3EE/g/w4XU8klPHAPF0HwNHHpLZna4+TzLdsAAnlHQ92vlfn4opEKnAJsFw4xW3M0kDps/f8OlgTk4OzW+/ZEFCPMBHZRnGsVM+BLkjUsUqnlDg4YsHJS6A3qTC4wT2bJXFWWlNAmW10qnjU9YRFiEdUiYuZ0818ADmDZRK/olawVduDGWI8F8my6SbYVB91LxpHtzOJCapNLe0mfuaaw/3O4xHrbpijI9gGzJEopFAZ5IICBKv6gpo9oBinr7/GvN04rM7vuRs6iA6R5DgRSlHnD9RKtVaFVNAUuIawVGFp22tisjp2Z2nrICBxNKsPnNl5X+Cg7q9BjUj7elQtqNzziPp2a6SYBnzkme6kKWLmM/0DWrtnt/9WcctGxXpdAdIOlFS5JuXTD5HFKuk3y4kr7h8a8lpdYG69LgGaisy19IRP/ObHdcGf03A1VClTJ2R/9xSkW9GslL9VYilJGG5UJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39850400004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6512007)(52116002)(1076003)(6506007)(2616005)(478600001)(6486002)(6666004)(44832011)(26005)(7416002)(2906002)(5660300002)(66556008)(54906003)(66946007)(66476007)(8676002)(8936002)(6916009)(4326008)(41300700001)(316002)(36756003)(38350700002)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8PNz8URwODhGW+OXW2mx9Mn/8a+v6ZEmb2R8fwgBRCsYkhRdrMq2C5jvKjVf?=
 =?us-ascii?Q?43p3i8nSurOqYKPwdI7ch9I/n8DLICD9oXGPQK+7UUbgQYqf2Mr/Bdtk1pnf?=
 =?us-ascii?Q?RDG1oOnD6nHQZBztc89fF9mnkigY1p7rdXQ+s5uzJkMKKzzU+ELlQJ3zZJXZ?=
 =?us-ascii?Q?WG+ZT+4gtjjLHj9YlEUSH7bsJmpOKJA5YT/2jxHS/RfdV/cgtjt9F5HgLurW?=
 =?us-ascii?Q?iXZdEbZMgyhyBCaPj87Bi2E2hwAqCADAEOa9I6kW4V23E/hREEVi9vQmiEdH?=
 =?us-ascii?Q?0OopjQSCqQcu7WZqVIFKaBSv2EQ8GRldlbdTi0jAehqin6+E738pshVzxw8u?=
 =?us-ascii?Q?3+rSmHBu+XFyUtm68N2v4/NoVU4xpM2pc63k9+zqguWNHCtaFtWFDikGzSGf?=
 =?us-ascii?Q?WmvDroD7eyPjeYVrOD4rBZQJDTM/uU1ncBWjWx/ThXeHCrIy52G/F8FLTX5O?=
 =?us-ascii?Q?aqu7caXOFhIRmd5LAtnVmc3MrAvPbVDMdQ+fdY2DdR+sUzKKlZzXk0uaGE07?=
 =?us-ascii?Q?0NBG/4LrMfO14YDCcvZCrGCpPQxJBPP4TyfC/rW3cvaFsJ2uhPzi117ZQp40?=
 =?us-ascii?Q?I746jK97SG8mJWtWG3/G8h3tWZAgg/mTFandPCr3eXAkgXmwBkcHiXpUyUYG?=
 =?us-ascii?Q?pvndUIEWEvKOeWhxoHcdNbiDnZKJbtVyIG69bGH8Vd1lzkLELCDngs9KplUB?=
 =?us-ascii?Q?OumLELCpiOJ9yaSII5ovZrXWiVZHInAeRxhA42GIHx1rR3BpCmuKBy+ROKcq?=
 =?us-ascii?Q?HaAFCRQq1mH8vxXWnKjqHlcgoq26v1EqeZ1gBu2QTkP4Up155v7yjt/Oqrr+?=
 =?us-ascii?Q?Q2DeQ+ECAGIQgPgeti/8SjIvfjj4l4iSaxy523XkwM7Y3ZBPEqWafxhAsm+E?=
 =?us-ascii?Q?LYOTAT8ZWT4cPreyDn2sksPZzQL/pBQsfnynCN4b4hHCrazEQjOHTLX2K+Oj?=
 =?us-ascii?Q?hrVJysOsdt4btjTSf2IspHb0LxzH3Z3h4EkA4ZQNadqSiSALam3iTG+G5swy?=
 =?us-ascii?Q?jV733JOnRwFZe/g8rpuR2k+4opEXbEEjucxS1N4xboKiqg3VQO+vpl0JgH9E?=
 =?us-ascii?Q?5Eg9LQwy08dWgB6tP2a+7JhWr/LgUK8i3UhWCDfj5M1W6i3YkjYJSEFBEbRE?=
 =?us-ascii?Q?tx6pr+qJQkkM2fZJK13i2nkzYENfEZSIeJNkgqgAgJTSmApkeRNaXecC7Mq/?=
 =?us-ascii?Q?x6akJzA7CGsigyYcZks7o2RmGydXTnrglkFe0GTFm0RC9Mhplky9mHbLegnQ?=
 =?us-ascii?Q?QMmObf2NOv89PYVxxGDcRVP9g5XIwZBAisJSJBpxCiIKgyzTUWgVtI8A1IYJ?=
 =?us-ascii?Q?hABLNzrAzwbQuk9sWXE6V2voYY6syGEDKVGbxZd+pHFZgvKy41HZdfglpYZM?=
 =?us-ascii?Q?LN0xT55sT1Tcy59AUBttp9ZnbYwJsdQxzUjnNEGiP35glymNV++n0yenM7a1?=
 =?us-ascii?Q?n1UZuSs0ey9Ea8E1zRVDgbpO2z1Nn+msBo6QR2XDiC28sTNl27ESWdYFKPCc?=
 =?us-ascii?Q?HBlRAEE4mbfppOC+N2bfhDgkGArvSxciJDW1ymyE1EU68oyXgcaPGgPEwncG?=
 =?us-ascii?Q?tqLjfP9TLTh28nhl0nUOOZRJIB7j5GktqFVyc8Xa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffc676f-8b46-4fc6-750e-08dbc99620f9
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:38:03.9840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRxLTUW3XLyq/FRMoeyFflx8C6PFczCN3lo2UI4gCHA9Hft6dzLva/Mt31YT0Er1s3Pr6ao9XbPMgEz7VCgrgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2442
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 1a7fnO81f9jD0ruyVt83eRy78NFZh4Fa
X-Proofpoint-ORIG-GUID: 1a7fnO81f9jD0ruyVt83eRy78NFZh4Fa
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

