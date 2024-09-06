Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9911D96EB67
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6DA10E818;
	Fri,  6 Sep 2024 07:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="GneD+Ajc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2044.outbound.protection.outlook.com [40.107.215.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB67C10E817;
 Fri,  6 Sep 2024 07:01:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtEjBuCsL1iJMq3wRdMv+mLCQxNLP5wL1GazWQxEFcXppUD2uHHUTqqVbKCbVqWEUgYGg8rFd/8iEnXzLoK/YbCCb1MtZkFXr7I/BuNuGfToRQE7sRJvJFrqoXHWP00h57eqqAU79c6AuDaovu5O0tE/dKV+wOZVxdq69B+zxH5FJOVswhgcGGtrDdpWCQkkUyUNWQEacu/dodDFdZbBK+f2PEouvEYTiaHlGTTp+DQW+q58t4FNJPdcNMWb5BB0FWycv3KbdDXKat3vw3C0Jkw1LHzwRl0VHT8X8tCgnMGmZ9iXXSnXE4mYfXXjefuDn37NSsKi2TN0jtC0d97cjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dC0TEeUoyustIppKT2Tw9OUZkdPI23A1ykjPmPaqmk=;
 b=E4RISpC6aecKbbYWj2cRM2RrEOL7dZnb8Vi2V/fLwm0FUsEoaTNaI1nzBc8gVRfEsyPtKLazwofX2OKsQa0gWi2o77+v3/0U0MKLH1cfRy0LljcQQpNqZ/8DTP8oYJB0GwmYcxCfBigOZZSmQjkTJKSLBrXqzsz0WxJdBLTvZMMynU1eN2TdGrKpDjCn1E+9+3fAlhbEOvaTsGtwwrCdgQYPHF6h8lHAYd4DV2LQb42ZmvaRZM5EktSUH96d0ZgZZSKAGOh2so49tAVrcC3ptwonats81iDD2V3m6LudLitezcJ3hJEpejNkWmjV3M+PcbcpDGn9EJMyDD1QdLXZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dC0TEeUoyustIppKT2Tw9OUZkdPI23A1ykjPmPaqmk=;
 b=GneD+AjcCr4sJUJ2+aEaSIZgJU4/CHq26fgOoKLMLD8ILFFoMVvhNFv5Z62D6U3MRAp8LvXbJn+5r5tmBHGMvJIT/WEouGoV0RhF9GYueefDf5ZlW9d9V25GbDF66IxiPBnt71Mg8PErpjcDEMTlNiNJtEyu+t0TBkP0NVQglJ6TasieAvfNwGLsU8gmNcPX8GAsHx5aud8vd1rkHX94/sIHbxd2n+FzOVIn3H9HmKXOdVH1DmXLS/1o9btTTZ2df3e4pR9GLNDF5+CfrP4Tk2znjFoFR1PgkqA6GAZvqvEC6OkWz55bWxPT1b9qw6CnRH4VXihLLk4/BaDmh+m69g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TY0PR06MB5494.apcprd06.prod.outlook.com (2603:1096:400:265::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 07:01:32 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 07:01:32 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] drm/xe: Use ERR_CAST to return an error-valued pointer
Date: Fri,  6 Sep 2024 15:01:09 +0800
Message-Id: <20240906070109.1852860-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|TY0PR06MB5494:EE_
X-MS-Office365-Filtering-Correlation-Id: ebac8c18-4a99-4f2d-bfdf-08dcce41bd3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|52116014|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WS1qz1ft1A4zblpoMKMVFG/HCjNTOxdsGDVR/ikHzA2OvNhIWUvLhMRlwFl1?=
 =?us-ascii?Q?fv3qpO1+sgrtCIA40mYbTsMDUY8h6+CBhV4tHRdJbMUKkDijtF1Nt0La0sKS?=
 =?us-ascii?Q?WByeqjeToqTT0p4FYzzPnAU0KcM2nWWqG2ZcD8rkrJ9KsRIE7EvympSTO+ck?=
 =?us-ascii?Q?lOJh+Khc+yo3FjUyDCl9H0gAycdplJ1iRl/sIeB/+TFi49HiDzVsWSfIdoeB?=
 =?us-ascii?Q?VNwERPzdDaRP8Nywh+ONy4hNctOocudnzDAUx1X7aEsVvKt3nQeuzfIN8sne?=
 =?us-ascii?Q?hT3692DaUplWW9s4lGFuenlPeTljVmqW/zj/lff8mKyj2e0rMFPM2QEScih6?=
 =?us-ascii?Q?n3Y7Dp8rEd/RjqgQXM//HJIrj7NXBlDpADcBj5TBlqE6NipI9NlTPpJfE/Ge?=
 =?us-ascii?Q?m+WwJhIXIZ3loWf90CU0D6czEwRT8prmw/KA7ERGaZLinLm69o2Y4YigMgKO?=
 =?us-ascii?Q?4lt2ipSErB/kwizmN/l9zxL0G4g8pXPukCE51jgMXescLl21ntoxdA+Kmigk?=
 =?us-ascii?Q?rLJlTMOBKVknr3DRA2Upk5bcBiRI3w/giMl0GYGUtr93emvaHfrk3V/O2S9J?=
 =?us-ascii?Q?WPPC76wWi9drg1RzwJIQsWJxUAKnQ2Ia5SMtKuAGvuUoCsQpFv2SQ0TiUC0x?=
 =?us-ascii?Q?lS+3IMWSRBRdy/aG9tia1Nb44YeMblwpdn/O5da08JVzzHPt5avHBGIK/qv2?=
 =?us-ascii?Q?tCkUFCSMiP8wrEYltxM2fTU1CkkIP7uDNWML2DSlSRMFHEe2sgtU5D2oYiry?=
 =?us-ascii?Q?DtpDGDudTfwBGidO12H8yCvyBRxBAdRmZYvrqYf1PMl7n1p7dtiMOjRUAGSK?=
 =?us-ascii?Q?vo96Rh6191W9mgnZ+LhjY2cBYcRXzoHjJSffZMLDAjpkfmIz2E3jLFBzgXla?=
 =?us-ascii?Q?5MdhsH/EgqrplCHNTpNTb+YfdWrm8zq99+mm7URNpM+U9Zg42wxy0eF0If6p?=
 =?us-ascii?Q?tDZDqYOaeRtPdsmJP2IODf0rbjygt0qwn1FsOHwIOBZ0koVWt9nAJp09Bz9I?=
 =?us-ascii?Q?k+y0q7g6/qQe9dkWI/EfH2v+YTFS09audZpbFUvhIeTt2GbkGFT1ZdV8YtrJ?=
 =?us-ascii?Q?Uaf6v53tUS6XiYzwrdsAy92OxdNB7VK9/fBSl8SMfxGYoQglZ6qYx7Xmi1dl?=
 =?us-ascii?Q?qmGFPZ3WAw++AxDsZ0gXoe76Y5l1irl08FOx7rBDFok8neRZ7ReA86PBrB3P?=
 =?us-ascii?Q?Q9vBHP2IKMFAawIVLUUCkbe7uHDEQCf/ZF34bplVZnb8++KTorAPlLYcK8w8?=
 =?us-ascii?Q?/RQAVOdfp7S/vGwurBB9CT1m/bErmdQJ18fEzNlVT59JMKcK9UZioB/wZvZd?=
 =?us-ascii?Q?hy4YFt7s764OU97ohBbcaaQxNbwhgH4996OMlwrC2bxCZ9++osojwvgLhoYm?=
 =?us-ascii?Q?HjTSYaexWCiFEVOsHK7ovk4gPlGDtIs2SEPse1ciL8w4Y/GWAyPpN3mvA5yd?=
 =?us-ascii?Q?gy5Hv2/qZd0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(52116014)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u//cb1X+nK6ZUzD2HVoDNmfdjvjOUjtbSgsLrG2a7kHkUUnmKxGcMkPnGHQa?=
 =?us-ascii?Q?WrAVqM88Pf23nhpBs5CKX7OLmp9esb3xcMD2+hvnB3guFMGxWJtojvn52HjX?=
 =?us-ascii?Q?yitpILAxmgPTEm+AKnjHvb1+2D1LIf7w2W0tpgLYCh1C+OYGWPDJdlnbW4rH?=
 =?us-ascii?Q?cxSUVpumSdZ4u+uevRjnSZaeJ+u0Zi177Amti76/XA1uXlsKsHNOmqOY9zbJ?=
 =?us-ascii?Q?x3/XvrmYRag+5hIECix9AbBtnnr+f7KsCQ+kbhgzWQKpNmHZDY3AzrY/go/x?=
 =?us-ascii?Q?kn3TrG+oD1lDGuKBXXv0jhgiWpzA69SQ8To93Fz4oEt299zJj+RQPNeWfhVi?=
 =?us-ascii?Q?KM+nPjThL2c8BHnaT75Bn7GwaTQ2I0A56xzxnUjQTAe4i8kIEVd8sRCSXWtF?=
 =?us-ascii?Q?oacupB5w1uJSSjXq9piUClCMwlgSfCyHcDou/SbwGrynQoohEOh13KkOT2KS?=
 =?us-ascii?Q?4cMWMMQ/CR7rNrbIMhAD4ZCOlX+4ZSJT/UldduHmAoyOoOgl2l8v0l8+YMQs?=
 =?us-ascii?Q?fPTILWgNQWXRupk+sR8BrxGVzU1RltOHzmhiIH79pe0VpgDyDE1VYUEcaVNS?=
 =?us-ascii?Q?ZNE011H1sBdv79raACNQfr6/t6lyIG9Cgho/+WGYirhF1Gp/CZbIaaQ2szv5?=
 =?us-ascii?Q?J8XY4puSxYoTLidO6js34E3zcmyjvCIq5CYF6U4BQcvyaVwzwyVEfYq2aacW?=
 =?us-ascii?Q?tXJ2jlMgjvmCWlZfciZCBlOJH7U1Jf5qms5Obset1v2HPr5HMM7lQzvURpjq?=
 =?us-ascii?Q?xmjd/iQtOPHgoU6kVmyAGJR9AuBBs6c5Y3z6S4qGx6KIZ6Rxkph8cEqGkc7u?=
 =?us-ascii?Q?3pyqlcq/J4OUmLTD9a+phnHDrPM/NbKc+hUBA7wOB2uSLm02ZHXv9jD+Tuj1?=
 =?us-ascii?Q?4lgueW9cAH4+s2VKHOKZWELI0qYFeL4s7s+6ZUDWqM9RlqJ5TPvPoOqQCA4h?=
 =?us-ascii?Q?OZS8GTtvn7fAPVnlXDt7L8ovGygBOwV0mX7D1jcr2iO0TZhVAxFA9qAg2u7g?=
 =?us-ascii?Q?H2lsXWhYuj6nrGnqnmr4MrfQhaYaTh9O1+yCEjnQohySqGRpG3T3qXCw+EKQ?=
 =?us-ascii?Q?P/hxrjoUlXZujSpkT/0CnHgiPi4b+oVX+WNgwKMzeQCBA5/CSAzAw1F/02pC?=
 =?us-ascii?Q?xJRaO8W4ca5eNSRGvGklI7FPLuB7ltBlwiWSHqHYlbtWXZBxe0BMKd+0zNzU?=
 =?us-ascii?Q?fwizRd6vL7Eow6ErF5ZyFHcPOBEu8/x+UJTSjb6E1wBglfaCF5ohq3AF3aTT?=
 =?us-ascii?Q?pD4AignqASBj2sGR31+9BrZtqyel+5pm5v5RmMbrylVKK+sDLYIY/xSv4nbP?=
 =?us-ascii?Q?PvoofqtS9+YesCp1jIcHUXW/P7V/pYZ1AV+yaSjOfYoP84ZB7QvmMb3lP2t4?=
 =?us-ascii?Q?mEZ/2r3ghPEGNlvFfRzN+5iKWduISryhgXd8miakK53Z4GSlcwqzvgWvziuR?=
 =?us-ascii?Q?UXTSKxLKvVEr+LNrQ7QhK1wDzaqlu30wGB5M+nPJFOiRFwOiWxu2BNpq6+bQ?=
 =?us-ascii?Q?WoBxCpmVktC3y0t40tOy0mU02jazIBK8IeAEY4878O0cfvzs8lj3Eea4pGLA?=
 =?us-ascii?Q?+EBEIFR3KtblYyTeog2AZY5OS6/wX4M0jb51yXzD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebac8c18-4a99-4f2d-bfdf-08dcce41bd3a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 07:01:32.4323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNlomkDxGgfD/ycaq/QxaedzX+2OaPlrBVU1QAY474o0N6a6RobwqxL9X725MjjyE7RLbH1AdSo57dJzYSHhJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5494
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of directly casting and returning an error-valued pointer,
use ERR_CAST to make the error handling more explicit and improve
code clarity.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index fe2cb2a96f78..e055bed7ae55 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -53,7 +53,7 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 	if (IS_ERR(bo)) {
 		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
 			PTR_ERR(bo));
-		return (struct xe_sa_manager *)bo;
+		return ERR_CAST(bo);
 	}
 	sa_manager->bo = bo;
 	sa_manager->is_iomem = bo->vmap.is_iomem;
-- 
2.34.1

