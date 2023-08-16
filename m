Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9FD77DC1E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E06510E292;
	Wed, 16 Aug 2023 08:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0ADD10E292
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:26:14 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G7Gh4Q019180; Wed, 16 Aug 2023 09:25:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=2JlrcO76QfHGQi9RSMwwrm3ohkOuHCDQJ90Fn2fC5do=; b=bAh
 fSnF/VPmB4+8yvMIVT5paX73Au14+BrGZsFF6dDcUKBnNZXldwQG9dDxtAFdqCLY
 NtV7EGuvyN//jP79imBwlcYb6SKhuSe/lN3osWTWMmyGcWxrk0gGmRP6/8dUiNqQ
 onVoJSY5JjKp16mqXZheMouB8sAoTLBU976u+Vn0ziC665ei71K0HYpro4M3j90X
 mTGGgEYO9qMXKP+MP9prd8rVskGcXVld0hp6PwTqL913Kyu6ewJrw5UzSSctGGhY
 Jxk+wvBKIqwrka+/sRXEA4Y+BplUTag7VfRvsX2as/n6IA8rQNlcwS4abtmtrrmS
 r6DxfTid3vneYrBfBEw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3se0brawkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Aug 2023 09:25:57 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 09:25:56 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.113)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 09:25:56 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQY/vGTd0IeCw4qQ0YVYWymprWAHIm8MUnsjXjDeqXWKEQMyizoB2mymawsuYnrXudDMGWW9GZjU5TIVSaUYUgj5+Y71grLHSF+fkQUCfHSAWLqjdRq8LbeWcS9eBAjxLyFv0MbJDRZItkwQiiTrkzUxg2xMZNJgKT6qbStu9O8xN9GDAscpQw+HVlNEShVDPVCOtES4Kw8CFIYwoGRdzbeiuo7ApjUpdgqChl8Y8DIPWaLpYA8kngT9Ixc9oVU9LLpQUsrI7QT7lsPLopJZeeqUwr6NYuah9lvkgloo1lN1V2tzQJNjrNFDcxsRyrHLSBnx3alSxBW28gfSq2zkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JlrcO76QfHGQi9RSMwwrm3ohkOuHCDQJ90Fn2fC5do=;
 b=MVDBPTmBpmOifrgWgKbgGdI0wTN9C8UHBf7kTvgTwJHKjaMmDNzAire6ypLNv59z91M0B/QkTJzqOUhFmn3ijeWDFNcwLeHtJ4/tt62ZrJJHehoutXoTuvj0WL5j91Qcz8JL23JO0xxee6kg1sln5DNhWxgwDN1jRC9O+CRNhyy0kxRA/xWBGoZMEVJU/x4UetI4kG9xSPPBVDRW5G6jsIiFs4mUgCRDpLeKP1d20XEOonJBW35WIPjF4EsXDGsl2W17DEa3K52KAQqhHk/UGX9ytdIr5zlPHj873TH+L12EORPYpMRKIwoiHrDaIxszW5WP+BRoZ/zWLNL7/KqtFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JlrcO76QfHGQi9RSMwwrm3ohkOuHCDQJ90Fn2fC5do=;
 b=hzKM3Pq8C34c+WSizEkKW3Az3KhGosZtNMFT5Fvp+WB/bFSeCs/qxY/jp0/PI9SrmWotPHdWm/fVkicNXudIolTshKHZby2x6uE3uyLA8ZfaWRaIbxjVMVGAb6nITv5sLIzko5t3PDDHVQJ+ylXqOQdi6oFyxkGNqWqaeq84XrM=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB2546.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 08:25:55 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6678.022; Wed, 16 Aug 2023
 08:25:55 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 01/17] sizes.h: Add entries between 32G and 64T
Date: Wed, 16 Aug 2023 09:25:15 +0100
Message-Id: <20230816082531.164695-2-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230816082531.164695-1-sarah.walker@imgtec.com>
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::10) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|CWLP265MB2546:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e1dcd1-a978-4d87-5d16-08db9e326953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nWiGi/9FqvEfQUcYVMcdo7bDyQik77om99wfyeD2BW2HwtfAMT2/GNco8hWrOZFkS7j6NTzEX7A1YZtSi1iDtPuxtgxMjkTDn+tSeQMfgpRrO+5eZBha5u/w7irdq5MmJY7/+gMp05QtwgWB66PalPX8iNXz2RV7ZFtSYlyrYvMV8rbmOjA6iMUS61IPLn9kZar6IlsCmz2RG1wXIEDe12zCoQvKBRMhg5hKdGCvf1YoCUiRLatAJiOJnw35VDmvVYNlX4mE7ZjNnoDrNHaZPoGDfkstfObPXDl74FffU62VbwDCty4kbKYWr0K8WzJQ4wv5xNSnRZYE8CdBzy1fXmkGcrYeHtrFW5GyVZAUpBNiorESkRUPY/TeBtHnnDxrf9eD/R6CmVavWizMp3nVe7GKylhTiXj1cb2q4IJ8Ycp2+7eX99zZ7wV2WOzsMunlaaSzSRXvrX4ueH7YV2BztrCsIOvStKvWG9bx3axVvVqf4Y1eOcBJTBH33B8aLaT/0e6q6hwYieCf4CVN7i+HTVPf7Cvzqo6OHe7vo9ortjHGC2eyQn7LbK//vSMtU5yMAPJH8SAzeICN5P3bAne9vJqFDJu4065ZfO7Si6bTvPWTBrVCdhS/WvWJUwl7Eeo0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39850400004)(346002)(136003)(1800799009)(451199024)(186009)(6666004)(54906003)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(4744005)(2906002)(478600001)(1076003)(26005)(6916009)(7416002)(5660300002)(2616005)(41300700001)(316002)(44832011)(52116002)(8936002)(4326008)(8676002)(38350700002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eBB/X8uC3KR+bWqzDVv96Z8hDj8u1PEyHQKzMj/Qc/N4lyFujmWSktjy1R/a?=
 =?us-ascii?Q?1hsjvvvp4wDDVQtsahsMfK2NtLyioQoHSdGmESvVxWoOgR8dS8HgS34BxFqh?=
 =?us-ascii?Q?IaNYBY4QHkcwyr2zLPFO9b/J0jQjt9CSylCLu4Y5CEVpojySA/wwO4W7EhH/?=
 =?us-ascii?Q?m8Xym2jSzZWnooqS4vwrWFqYkQ4yD6Ob5SCOjTP+/zgybdoqH2Yvxbs8dLiI?=
 =?us-ascii?Q?h3Bfw2xq1GNi7M1OBL7SXWA3sTYoAo8SPJO5SdwdNVRuHvpPzn2L8ct2yBCi?=
 =?us-ascii?Q?UFGp42cYaJwMb034pkoZ56Z6lWWIhj3psxUr3YUI5S57LY20mqwUCTz/9reP?=
 =?us-ascii?Q?n8d3x7HEfLE79+a6KEZrmIT65DBy8ipl1wJsWQo/dexM4rLCIE0Y/X33co9a?=
 =?us-ascii?Q?4V/GMIY3qBkyu1IkKOP6BYDTsvDZYo5XBI5i6yXHR2mSUz3NJF6KzVBjpqCL?=
 =?us-ascii?Q?ktVolboVNqfpMYc8hBE5Wm1/u3RAXKTiF/PckdQgECsBRP/hEItYd42AaT1k?=
 =?us-ascii?Q?ZAkRavoXFc/s1O9cs7n53Um9oAGixEOOju+hNHK+L2rJtI5Dwv3UMSXuZVIF?=
 =?us-ascii?Q?lRQET6WTtjs3f+BHEF3gCztnlaemWtpZpT+U5mk3sf0phMn7/pdwcFYU26dJ?=
 =?us-ascii?Q?3rO06P3XOagLvw08Qnegkv71ZgLNW7G9Nmrh5RwRWM4gs0Ma8DFDCO3fBHRL?=
 =?us-ascii?Q?tAmxEixvMOZPCKD8BRgFyJt6d+8/GX27ituLffcxRDbPZFM1sUCgCdZbKvqj?=
 =?us-ascii?Q?/vatJHSPYrHD5MyUsww7u1BJ6m02lcU2gnLka9ENdp87QL6oRCtjHcvQaWP8?=
 =?us-ascii?Q?RDmxuD50uEhqBShpuYLlF86wBN1NQbFfS4w8vJnZIufBSgFm8XD1bDTNu4bk?=
 =?us-ascii?Q?2JU/i4kLZxmKTmoFnGMM5efPJ7PZ5cIQXLhwdP5JqDeRoc1U5XklhZ5kI1b3?=
 =?us-ascii?Q?F6x7TL0FDS1SbEb4van7t0tw5JoJtPsTciFt8KJMD55W2BESwzalrRAhlIDy?=
 =?us-ascii?Q?Zqj+rjcNy5pbWtL6kciGPM0tIJyvCGKrIe1Hb0sSVkxgoP35ONJkw/GpCa9O?=
 =?us-ascii?Q?KFvHwnTIjJwA9OTBrQbwCCanu1g+2j+ppBkfd512+BjEnSR6muHuPiLf5V9m?=
 =?us-ascii?Q?XccSOIwmKLW56JgtuELAdro/anudVWazSyUoSO6/MjPkndArP5aXbmr+92On?=
 =?us-ascii?Q?MuD+jj1VMTxEfC3eKWa3Ub7XWzHGkwww9PjY1z29D83W95KibzF0RyStkDPs?=
 =?us-ascii?Q?fpmaD0WUa5MvfYKfP1sWN0fiEhYzWaqCR6DerBKAMkU2OQiY0MVOBl47pkpp?=
 =?us-ascii?Q?C9JW68QJ0EjKf/XFQd0rNmcWP2QvBC/RV/9btXk9rBzf/DxzCL10soEX5L+1?=
 =?us-ascii?Q?p/elWS1nx0piBSAxSII0CONaFIqZm6tgdjIT6amT9bLbpoBPRroeFgtBlvGU?=
 =?us-ascii?Q?/3725+cl/0R1d7QtFJUl8BFn3FGZdWQf9tP95hMEw2OHBYLJQhu+FRo2KI+G?=
 =?us-ascii?Q?RXiwYyVIapo6sCb5JsWZLJrVAJ/AW1wTVUaH2OIRTnIcr7XJHagfoFjsn7i+?=
 =?us-ascii?Q?pmTOCwbqjW6/ZntrjXs0BQt83RtVkGhNgn+B61IOgb5VMZo4KZpKrHKhwEEZ?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e1dcd1-a978-4d87-5d16-08db9e326953
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 08:25:55.6855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnPCbjwjGcMcBW+3Pmqwj1FlzoCoICW4wmthtmOGhPveg+DLgrYpZ0Wbgv/M/J0s2A/pGwNFMXzdIaphuewmDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2546
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: x4Tu9VgH-g6RVTaXIvJRZrVs3eKMANkT
X-Proofpoint-GUID: x4Tu9VgH-g6RVTaXIvJRZrVs3eKMANkT
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, mripard@kernel.org, afd@ti.com,
 Matt Coster <matt.coster@imgtec.com>, boris.brezillon@collabora.com,
 dakr@redhat.com, donald.robson@imgtec.com, hns@goldelico.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Coster <matt.coster@imgtec.com>

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
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
2.41.0

