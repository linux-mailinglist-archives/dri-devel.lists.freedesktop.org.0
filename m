Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D97FF43F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F3010E72A;
	Thu, 30 Nov 2023 16:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D9A10E72A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:01:33 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AUCeVF1029829; Thu, 30 Nov 2023 16:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=4hZNetOs8eSwBOMBCT02ypcuSEAX0q/GkCf3Jofd48E=; b=sUh
 FCjRl/qoNfaWzpT+tbzfr096zWRfEmnNuKaCyInLqastmIBNG+AsOOXcaijVKiTj
 sQV1ggAQ8mymUM/W1fXEdNYCzoCnMs4qCFIyDMzwxTTH+nJ68N1N8mi+XBNOAqJO
 YRz5bv4nO9SyvTv/tKQG3rVRioUh5Hxdl/Hgzke61cahN/nOxNJQHy0OdLEpO7hL
 hliwfEYCjz/izHyO2Fg0kk6/QjLSrxdkYLAScMC/dUL+8Bbvi4fmhA+Ki4IC9ESW
 hBt+4JM345qItQJUt3hSAkmNWX3OD8gCuHyt6UV35zvJTYCS6YSUIpRAdPIhsiU+
 zXJpCN8CtUe/a6u8ndg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3upgv6rktp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Nov 2023 16:01:13 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Nov 2023 16:01:12 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 30 Nov 2023 16:01:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZ+B1nYOpX6Y54SuEs0/To3pDrsU8K9eVq4MrpZW9XKcgNlMWCR6jBY2fmA68xZqsgdKrK+vHl4WGlfnmdsaWR/edsbYjgEBWxq3WoHPakwR/psemaURCSttbFQce2/VRYht5JB1ivXbAJ1qQ5bPyyQHJTFUjTi5XjoOPb4YOZS2fBeZkUL94IzTl9iZFxFOm+/dIwc6QaBfU2dyPaYc5hd6Bvxe/wgtAi+nbrjV8bySfL13wL2O5S6VADejfsjeqttU46pmyLCb0qh0/JSQwJZffE4+Wz1eFPWpv9sCVblG8qhQD+LTEKAJcOzfnCP/+6DmUdcWbNc5CooZHoeQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hZNetOs8eSwBOMBCT02ypcuSEAX0q/GkCf3Jofd48E=;
 b=daT5SPzLDkDM2AZnVfNBl9xo+SprgnaY+gzQ4DpdB5nt52gt3At9X8OPpwwowgVbdsjaYNV1CgcnXypTM+lLzYxw+E1w3i1O8+LCNicJ5yoNo1QEbJOVFrGu4rvbF+nRK08+KYtsJAcWTWCgo2mnF440n/DbQ03FniwQM3DkzKhyo4x5JN43cD97r9754M+4s0jwNfZoNQ8ZjsYuFoTGb9Kj9DWgLGsQHHkCsBWahPo1bR23mJO9vkIDVLsdVfMbpzfIXdQ51kxpRNpRegKUOk2JthB8zggkWu830Q0f/WeTzTflJJ5FIeGpxKcrV2rqupMZZDODJaKdkNz8e+NfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hZNetOs8eSwBOMBCT02ypcuSEAX0q/GkCf3Jofd48E=;
 b=laSq1JhlgjpwkvEzZzWnG3UTTsTOwpmjjw6IMRNVw7QCeaciFPeNcdV7+dn3X+jPB1VUru9kUVnjREe/U3VQDWsajz+zKhfYT0QbZ85RCLuDG69J8mXxmmktkuLOSQEOy892B3Y5yq1W/iEb+pryFmRX7Fw9JuCBV2A4VHOZ0aA=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO3P265MB2410.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 16:01:06 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 16:01:06 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/5] drm/imagination: pvr_gpuvm_free() now static
Date: Thu, 30 Nov 2023 16:00:16 +0000
Message-Id: <20231130160017.259902-4-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231130160017.259902-1-donald.robson@imgtec.com>
References: <20231130160017.259902-1-donald.robson@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::11) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|LO3P265MB2410:EE_
X-MS-Office365-Filtering-Correlation-Id: fd67838b-bb71-42a2-b380-08dbf1bd8f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iNrKgTJ1hHoiv/8khq1Rpzz0jr0+pvlCUe3mSlyUeKwvT0/ouCpPgdQcdd7w6G0G9VfMNlnTBS9kC1Th04blrchC8GzlmRfzBuxepcJd4X2lySAHVFD0I/6SBcnYv6hbenTHasJEGSljY/XiumT2jtzuq2AS9kuVcKT2WwscQLrTjzaqTEVOnFg6oNFiM+J44DV2JBGO7yX7WU3ahqT7/ST73mQ9QLxpyMC9n4EBVYZZA0UoaljK3r0NVn5ULozsf/QrIYtr+M04/+TTi6ucCuo9CN+opp9wZCEmxjwcDky8rMRs3E4TFr4QTzE0wwMtru/41SugWAvPcsLlutb8UBKktnqR26WBn3oGjSQsGx1/0inrMvY0QD3kN+6ZpVIQn0DHjevzGX/jVrG2liD75f8vZDRKQ4LtmVx+/zSz5WAzUEj7HACXDmVLGXLirTW7DNy9X7GeFjfRd9hJrCHVDWW2lZf24dEsZa+pItM2V/YhLnC2zM/dJj1KoVjxjiUt8BygLmY/EGc6mukGf5NSA5kP6wrNL53xbdbcZ2ZLHiysgFbMIOsKUnByOf9SMjWB4nxcr/BsixpgxnV+g3fdtISZm2DsH3Xwf6ckGtXdp6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39850400004)(346002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(26005)(1076003)(2616005)(38350700005)(66946007)(316002)(66476007)(54906003)(7416002)(66556008)(2906002)(5660300002)(4326008)(44832011)(8936002)(8676002)(86362001)(478600001)(6506007)(52116002)(6512007)(36756003)(41300700001)(6486002)(966005)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1uc0d6Ei1j/RxwKbrJNydozEInn4HASyKbg6qt1Qj4UjEtzDHAdv/8ItNDDU?=
 =?us-ascii?Q?2sYOrFAgN6IWJnUS57yFBsxcYWFHimbmHxdMZ1skq/Mp0KRR4t5oHfHjFaXy?=
 =?us-ascii?Q?C24+LooRcPg3z7oL6sYarF/skmRBA9KZHdq/qt4zQ4SuqEbdPynEGhoMFbY5?=
 =?us-ascii?Q?RA5h8IsI+fc/ixC/v4ObVX0U9bVzxx9vgpyLccwV4Z9sy+0R9LpZjpxKdBiC?=
 =?us-ascii?Q?ztJXJ21yyhjVpRgmN0bIRSv1Kw8vXKp/N8JvSNAir7rs1NY1gmxM9ozie2zR?=
 =?us-ascii?Q?qr/W1rKefapp4KlcXh7tmRQGTXkwQ7mhGj3QjLoB/RoKOgQp+fmG6KIN1+En?=
 =?us-ascii?Q?Q3panlX+CsmoDCcsIrZwm3phK4qxKay/vRJlQS2iqwS6OYkYnSL+DEZmCZgz?=
 =?us-ascii?Q?rtjfXBsgADSrhwtHyn5npAaFORM5prW+pNqLub1ER83s8zD7QkWlLJMC7Iag?=
 =?us-ascii?Q?hdmv4qINBJ0ldX+HF3QvMc64DZbsnat0dgLUAB/LIpNVQYIkZ7D0cjhZA9N9?=
 =?us-ascii?Q?Rvq4BrpXz8w5+iWrwMpnXAB5nXnBTlE6rWCStR3H3TEpAOs1xW9ByRGGY/MW?=
 =?us-ascii?Q?Vtx+sf9w2azWEXLgcEsXOOmTfmi8sRQVCx+f+c+BA90poYdP4lB2ci5Y66Jg?=
 =?us-ascii?Q?o1wLbPACYqBBA9t8CtmwZ58dxBnSzFkKG2cOTZ8i0148LmPKZrnUUy/uGeOO?=
 =?us-ascii?Q?wxDIRTkvkUHK4aPH1AtNvR/NnfvHFN2CGGtnXznwdPUAyQEOLPrykjWGNuEr?=
 =?us-ascii?Q?9WtUSctjo+dfwvuV4XP+G/mbgwqBgX4TOMhK+mZkDOkdTuoxjVbJFzmRvZTg?=
 =?us-ascii?Q?QdCGyYACBddNBY/OjkDm+HbH9jGDm9i/utNec+TKSwO7LQtNHCdVzU6wAwNL?=
 =?us-ascii?Q?5lJJOCdbQoO26Dzl9/NpX8s/JKO0zW2PrPqN4WIu3V4j4gFhWbVmqYSogZHJ?=
 =?us-ascii?Q?q8ONBeV2omqB8GNqxO7tB+k2IxNkm+GkLwSoco5JIkJETrbTLzbr/yPS4QU5?=
 =?us-ascii?Q?sjfUoNW1x/BMXA8Ya2xh1P6n7L/jFz8VDPOKzowJgGexeyU2S2plEJod0tCN?=
 =?us-ascii?Q?hQ1/TkuzJ6JomExM9BpNQoxasTUh6zWJk7Ijs4cmJuVAz0HfotJpCxBF/JlR?=
 =?us-ascii?Q?hOnUsHM0kq0KCV63x3p7GHFmSJlr+gTUN/5W8nPwxeFz7i+3Jbnt/V/V48Pl?=
 =?us-ascii?Q?h+yAwO4uOl5ao8dcfSGqHCP9ZmvZPD0pxua6FFCNqhq1QQRzXtBiFGpZLcSl?=
 =?us-ascii?Q?0eVEk8lklFRBcCqxpKJCpkpMkEwXbviGWVXMYXg4wL3iAu29vtBXjzROlSiC?=
 =?us-ascii?Q?BTYMLXxjX7NZF6BoguPRRaRXoS1ty/xCL8Ix05bI0N5czXIBXImrNuhY+Vvu?=
 =?us-ascii?Q?fU4/YuE608PF8xzvz1RZJ5Y2OJp7ipBPMFojyylMHPgSwrwYaKPdn8ObFjU8?=
 =?us-ascii?Q?eynFsbOwfdGKcG9QAp6esd0NuY2jRC+3yy+ywgpRJ4Zf9SrALe2+1VL/s7i0?=
 =?us-ascii?Q?y3Vhpj6V4GhaH45y1Ie1Hrhu94jrt1mt7wXQKkd9JPpkDULTeFdCY8ygH8Xu?=
 =?us-ascii?Q?6xEr4vAPKvaGBaUqriNRlbNIPgzVSDvxWW5IEx3+N9mZ3IuHv174NTd/TJmx?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd67838b-bb71-42a2-b380-08dbf1bd8f78
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:01:06.2686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqSnXDuxuoZKpnN+7OQTpel3J/Bvenko4G5wZfUrAfzlgAeMXjK5ycCCKTc9SAMjlJ43CueFvVYuOUlMpuMTOWnv1odT7k5ELk30Gb8jUR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2410
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: J_ptqdC_YBwTErol0LwBiNr3Uc1BCP4n
X-Proofpoint-ORIG-GUID: J_ptqdC_YBwTErol0LwBiNr3Uc1BCP4n
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
Cc: Arnd Bergmann <arnd@arndb.de>, mripard@kernel.org, matt.coster@imgtec.com,
 boris.brezillon@collabora.com, donald.robson@imgtec.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function below is used only within this source file, but is not static.

drivers/gpu/drm/imagination/pvr_vm.c:542:6: error: no previous prototype for 'pvr_gpuvm_free' [-Werror=missing-prototypes]
  542 | void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)

Make it static.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311242159.hh8MWiAm-lkp@intel.com/
Fixes: 3c96dd170efe ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 04f7d0cf4188..89eb6ee1bbcf 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -528,7 +528,7 @@ pvr_device_addr_and_size_are_valid(u64 device_addr, u64 size)
 	       (device_addr + size <= PVR_PAGE_TABLE_ADDR_SPACE_SIZE);
 }
 
-void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)
+static void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)
 {
 
 }
-- 
2.25.1

