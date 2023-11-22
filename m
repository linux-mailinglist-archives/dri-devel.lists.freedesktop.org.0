Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28567F5497
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 00:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F273610E14C;
	Wed, 22 Nov 2023 23:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU002.outbound.protection.outlook.com
 (mail-centralusazon11013010.outbound.protection.outlook.com [52.101.64.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D8710E031
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:31:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJMLfZYayKTr6G4KeNwP/bfwIG80ws8bT71CvMCZuGn3RJyKeHGQGGH9lfCU5Oz+IHY2YlRm+1JOIdo2Jta+KDucOpky3d0gTI5ql2FE87N6j8fP+jet4jrHZypJUw0IeM+uB9cGnsDUJa3UCObJP3zfwzoYyNS2khMej7k9g+7gcs5/8AmGgBR2YhF4ZXJ8wfBK6Wh7XCiTW06OpIxk3R5XTra+/m5QvfqUc2BM2ASVKAlQ6rk/SgtzGwOK9Sg/ZespQlLzPhfgnaAG/iNEhIfrk54OKsgLRIHysjWBgYcccDaZNSVwVTlG11dwlrkuYbV0QFdVLsDsT1tw6oaZqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYs7K700gBSzwO+6j/TEg+wWDBD31/tUc3OwiVR/muA=;
 b=MczAU5kb9PIXAeEKJREyPG/jqMAcx5gCCWsH0EkWzIfaA1fbnB66A/pEWrG5ZwX+vem55Q2oKVIXSx1ZhlVgdK+SJg+XVC0qjnuUAPhD9hbbz4bWlQlFvJzT1EH3S9yc4bqkVvzTRKuDx5B5YdRJXNyBa9LBl/QEq4pD4KUaAL4H6tY+4U1AdQtwT7BUf+L4Ol+zCRyDnxaymRK/aUNRZXkfpZxpkGJRLRl7UUp+oluJ9xCrAKeRM18pkAtmuhsbGcAHkWUOhwZfSteYrtxk/o4SV637RbPKgsciwS3iq99j88no2gHkHaes2eZZHa5K+tDHntNptFZxN4o7jQWq/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYs7K700gBSzwO+6j/TEg+wWDBD31/tUc3OwiVR/muA=;
 b=NFPP9chvVfP+nB2/OVWAWrRxgh5c8bIx0FkyTNwgHKkK2MHVzZr0ZH5LzMwkVT4bHPnYS1NOh+j1cPernQy87fP94jzy8dN/diqC7uUgJqKVIGdyFmTHhC1VraV6CGd3+BjH5IFhkaADEZjvYehFn5eGGItqpCp8bFkS0tr+ZqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by BY3PR05MB8275.namprd05.prod.outlook.com (2603:10b6:a03:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 23:31:18 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 23:31:18 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.co, bp@alien8.d,
 mingo@redhat.com, tglx@linutronix.de, zackr@vmware.com,
 timothym@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 3/6] ptp/vmware: Use vmware_hypercall API
Date: Wed, 22 Nov 2023 15:30:48 -0800
Message-Id: <20231122233058.185601-4-amakhalov@vmware.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122233058.185601-1-amakhalov@vmware.com>
References: <20231122233058.185601-1-amakhalov@vmware.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To MWHPR05MB3648.namprd05.prod.outlook.com
 (2603:10b6:301:45::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR05MB3648:EE_|BY3PR05MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b75b00-f732-4a7a-95a5-08dbebb3208e
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vS1UzhG/8f1ttObSqTeli1ZwkoHZX+gUOir4RJHPSHSta8qyRc/ndyVDvwy5rmMNv9ivScrSPW/fN0BWRblqsauzWQ1TVhaIO+phuCOQDOnfKtAySS9Ja+YWqYicQ0A8HzwQmOisyjkqliDVPcLinJi/b8yPn89h60T8sI9u3Pnl/RCJJ7WFMv7vz2bUl/h+cSb6G+M706u26VORuWFa4+VY59+iiEF/QXO26/8pmRrp+/l57PnJP6A4X+4125d/ZQAsPZRMwslWVwe8TQuQSrjG8MsL6CH2INWI4uBotitQfNBQxaLaSm5qXkjcp3aErxHRdtAAr6dvKBQItIbOoU1MtWNF5EzruAIKT7eFKQjqGBZ2D0/UwxXPSXQO1GCvhkO4kyDGjvqCAYRctyyne1+G12j8QPNcHNCMtznDdaPlUPaYfj53D73gDYDg0nmgeBoN8OlI+Ql401xa+rJmViNfTapbkkA1u4wafhzGW8Fx8MW/wCLm14ZVTfEan2E/fSwyPEuq9/TKV13yUqA8OG7I8QIb3rcNrvZQNTKxTTAwThMHtX6biFzcWnBk8wmsqf0W9VXX3wCYc4NT1B2y5cCEKaOqlHAlGfzOfTRdc3WNq0GL2YXRDXKu/A9cv9EfqvG8FLJVY0L61SxmKYE++1dFiRpJwjL0gU98CZN2BSWD/qp1y4LoMBtoDTs5D1C2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(4326008)(8676002)(8936002)(5660300002)(7416002)(2616005)(107886003)(478600001)(83380400001)(38350700005)(6666004)(2906002)(66946007)(66556008)(66476007)(38100700002)(316002)(41300700001)(6506007)(6512007)(52116002)(26005)(36756003)(86362001)(921008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e6+hzPGNOXYwl+1WB4rmrFHy2qOXsnCovcTqY37vuB+0cb6H4d8qQWohyK5i?=
 =?us-ascii?Q?JrtxWYmse1EGL761iUjgc3gD4BeL5X0clPoOpKaU2sPEGgi9/RsN3E6UVXwO?=
 =?us-ascii?Q?1Mw2jcDkZuRkjlAcwxNpViXa3amzNMvikJDHQlcSJW4MJBQCDZC2JYI4VyCd?=
 =?us-ascii?Q?kvvgAXgDiDMVxc2lY3zsduRXk4JF7zAuciQtVztFK476tGu2lYsor5lbe405?=
 =?us-ascii?Q?EZo2i6UdC3/3yLDa7MMYQJk+9Y/iX5+6jffz93SbHv/hiKQpmIiO4IKNKrF/?=
 =?us-ascii?Q?yp37TQMf6vIrRosKxg+a5JbadbCZh0eaxLhXZ4G5YMI30u82ijUiwPLKbLua?=
 =?us-ascii?Q?2qoXa9k7ubjzItyptEHrm83EMoefifA/DVloxBkSeXJMhpkD3plS0PZzHes2?=
 =?us-ascii?Q?jX9Bkgw8YwoxX2+5GFk288MvYEhTMtCu7NbQi61YeQHNjl4j+n8C0d4jFSqv?=
 =?us-ascii?Q?FaH+7cdAb3JA8UL7gOb84l2FEWyHrFFd3APHEw52DvyEXH8pbkYaVwJxejty?=
 =?us-ascii?Q?4bKEssJUhsm892X6zHdcpMyqG5Yl9Zzh8/WcGQojs8oyZ3iasqggmkm1oTTy?=
 =?us-ascii?Q?bm8K8Cy2rcpG7g9GXL/UEf8xxmwuoVFfHvAnPdYZ9J+GKZJBe40AkAeYVDRA?=
 =?us-ascii?Q?A+/x1oVXNx7r8ACqyzPFM5q4CjFMUY7QtSENPuUALHBOYwRH8pCcKWpgsf0W?=
 =?us-ascii?Q?FK6dBDjqHt0ZJ4OXGvN8g8MGBklSNrfLlGBDju5DcZORLU5dnYZTJFOrcWaV?=
 =?us-ascii?Q?W2o/b7xVWzFxK6zPM7+WoAUHXwanPFBv4sMFuXy0/AyBcifPxVsn58JkjsaI?=
 =?us-ascii?Q?OTYxlyb85n0xDvUQocvm4RosUsdBuhzOCYj+D5LoH3oxt3COqunQHCaO8xi6?=
 =?us-ascii?Q?FA5xnD4UGaakBsL16MZ9Vfq2AqLeSjyjHZ8iowISp2ZPK9hWQekuQ0fdlvJ2?=
 =?us-ascii?Q?UjbjX/mpw3a+c7bPLrEWTj8WhA2rP4Q6Hrhi9SLISQ+kIC1d+0C/TI6itlRk?=
 =?us-ascii?Q?5YCtNvZuJ68imIqdYwdCe24c0OTGk7vc9ijrJxYyb4+ukEnWmvPiCt1JT5sY?=
 =?us-ascii?Q?7PxxjtoahfgSuQ/QZL/H1Ulxv2DGa7GO3c5AKbIY9mL1nKzZs5pAloZBdivd?=
 =?us-ascii?Q?vlxJwqnRZ2aUQ+MR6m3KSoZ/wiO8Bs4WqUsGik8bea9lTXbMrEzMtNywGx1M?=
 =?us-ascii?Q?bUN99o1KsNvf1Mcagt3HEnM+MAX0jq1oRXYGCgYamSp+uW4qoNPH9lguZeKs?=
 =?us-ascii?Q?T6uByAJVI4hg8wX8b/pqW5Au21UKTz+eQ7RlTmJKc/beJub3twdyQgbxeJOd?=
 =?us-ascii?Q?T+VrK7TAOMb7gho7YhpLGlz2q3YJUFSqEMgLK08Ai8Nk6AWS0R+2zY4SOUz/?=
 =?us-ascii?Q?nRZhBe69jES0p/3DfkmBPQRogJDJVKs5tExteh6JEV/WL21nLLDTWvLfOm2d?=
 =?us-ascii?Q?Nu0d+TARpRCTemRDgzQDZPfYEhMjzs/WVzmP6hrbZpybK1XJ+FBd8DIf6H6b?=
 =?us-ascii?Q?QS2a3yf0CaAwOrrSGmjTUw7v9BGxOOXuKwCZIiOpWBCtEzzMlH9lFw6JoDMq?=
 =?us-ascii?Q?KvPreriEGvb+DM/Lt6r4ztPoWbvtYdbKXTCS6u/4?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b75b00-f732-4a7a-95a5-08dbebb3208e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 23:31:18.3896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPJWNlHafRHXCYzdfuU89IWdFuKSF27tSBMTG0LYWCbaF3C7VjKQw3O37v4tefvkb5H3lU30kU1GoKQRrkxO1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR05MB8275
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
Cc: Alexey Makhalov <amakhalov@vmware.com>, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, dmitry.torokhov@gmail.com,
 akaher@vmware.com, linux-graphics-maintainer@vmware.com, jsipek@vmware.com,
 linux-input@vger.kernel.org, namit@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code. No functional changes intended.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
---
 drivers/ptp/ptp_vmw.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/ptp/ptp_vmw.c b/drivers/ptp/ptp_vmw.c
index 27c5547aa8a9..e5bb521b9b82 100644
--- a/drivers/ptp/ptp_vmw.c
+++ b/drivers/ptp/ptp_vmw.c
@@ -14,7 +14,6 @@
 #include <asm/hypervisor.h>
 #include <asm/vmware.h>
 
-#define VMWARE_MAGIC 0x564D5868
 #define VMWARE_CMD_PCLK(nr) ((nr << 16) | 97)
 #define VMWARE_CMD_PCLK_GETTIME VMWARE_CMD_PCLK(0)
 
@@ -24,15 +23,10 @@ static struct ptp_clock *ptp_vmw_clock;
 
 static int ptp_vmw_pclk_read(u64 *ns)
 {
-	u32 ret, nsec_hi, nsec_lo, unused1, unused2, unused3;
-
-	asm volatile (VMWARE_HYPERCALL :
-		"=a"(ret), "=b"(nsec_hi), "=c"(nsec_lo), "=d"(unused1),
-		"=S"(unused2), "=D"(unused3) :
-		"a"(VMWARE_MAGIC), "b"(0),
-		"c"(VMWARE_CMD_PCLK_GETTIME), "d"(0) :
-		"memory");
+	u32 ret, nsec_hi, nsec_lo;
 
+	ret = vmware_hypercall3(VMWARE_CMD_PCLK_GETTIME, 0,
+				&nsec_hi, &nsec_lo);
 	if (ret == 0)
 		*ns = ((u64)nsec_hi << 32) | nsec_lo;
 	return ret;
-- 
2.39.0

