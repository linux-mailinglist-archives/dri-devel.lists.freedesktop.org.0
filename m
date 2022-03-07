Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444464CFF3B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 13:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0576710E6F1;
	Mon,  7 Mar 2022 12:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556F810E6F1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 12:55:23 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227Bk9I9009193; 
 Mon, 7 Mar 2022 12:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=UnJ22KqafJVcrQmR7mL7RwLPkSPne2F1zmVWmINNuUw=;
 b=X6/AzgBKnn3OJEPqsWawhwsHX08Vwh5xrJhMZegdYCPk6FzbpiHUFG7NYP4Zcd3ULx2M
 vDQMdG205F2AlcT647srcix+08rHdVbhLaCj2tDva/pexLa4TiNAvp+q9kOxwx0cUWFb
 a8T4hRx1Xum44WpMed5RaofouRxPPr2OCQoyLb8RI997srjdcLnMLkNRlB6oDCwQauyt
 ZQIIatWMZ94iWbaPPlHP/ikDKe69813DukE8m2E5uDhGkt5UQD0OipBJoN5Qf4rLk4PK
 QTAqQYhzzjpodU7ZK5uTolzL5Tte3sijV1/3n522Du8KhARIhxfWcAblV7GmQOKOW9MQ QQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekxf0ksft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 12:55:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227CpWFD095657;
 Mon, 7 Mar 2022 12:55:18 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by aserp3030.oracle.com with ESMTP id 3ekwwaymf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 12:55:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEXe+nXqzHgAClDh+3PXcjgyD0RG6QxctwMe/oMdOreqW52oFgZyXKPZhn0RCSmt6WiGnRV59UpEtQ53LrDPDJGEfVep6wakGVEp6hVIlLRHEpcpvr0UNC3/FzbZazXpoZ8kXjfAEa3DOgm8BAMgIcRmacZOWpu4keHzR/pQtcTX5Fs9mhUyRvaCnQmutuSPvKpCIQzXiXXj4YxDWRkbPL9JdPktaFtHy+beUb8xqncdZ8v/zM7eaEVsg4GweBShEK2ZW4lT0TlcxCGSHM9l3jL8ZZbjMoUhuMXhIcZco3qt/RxfELEpcAzGdbEfahxYeTordCXj2btn8g/ZYGsTaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnJ22KqafJVcrQmR7mL7RwLPkSPne2F1zmVWmINNuUw=;
 b=iC1IS8A7YpRJ3DFyTjoMlTk8rt8Oy0A/TjuhFTs80zv5n6BeiKlFRuaay96+igT87HpSY23AkZlwFUjGsXBvVVjgr2s9V422o3IKu/0Czwn89CRy2C3YYbZPD80QMWWZAvRASzuLxGWIcbkYWWN8SWoznDwE7TQFvLEp69u7ZtgSOQOHETpicNbzBxIXUkpRgugJUvhGFaxlJ3JoiGu5nuCbo7wHpBkBcUqm+aPj9C2PWq7IuSHWway8pTfS6sKSmvDr818Ta+AkpygGVmAmbLs7EpZryBbiHZLuJ+Bk3zO2LxUhyygXzb9PWHnrONx7K0gd9o3SmYfBxprQofDARg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnJ22KqafJVcrQmR7mL7RwLPkSPne2F1zmVWmINNuUw=;
 b=LWtA+dN0eU8JX3viVRY4PK1hoxuoO2ty3h7OtQSnUpJg/LfVh2KfWRem+ymNX108jOUpk8aSh1AtFXpG5wZePuRzw0PjLelJmBpNHk4v6PxaziCyoHD9hoHYv2kjtqRh9UND0QbvyM15FPANE3oSZrsG62vg1H16SVb/8b0VuBA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1614.namprd10.prod.outlook.com
 (2603:10b6:301:8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Mon, 7 Mar
 2022 12:55:15 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 12:55:15 +0000
Date: Mon, 7 Mar 2022 15:54:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Airlie <airlied@linux.ie>,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH] drm/selftests: missing error code in igt_buddy_alloc_smoke()
Message-ID: <20220307125458.GA16710@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0106.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d2e311c-9367-402e-b80b-08da0039b9ab
X-MS-TrafficTypeDiagnostic: MWHPR10MB1614:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB16140E53768257FAA560A6638E089@MWHPR10MB1614.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tTWeXnzhMzN2BXcfpBQ5tts2WMpfhkJKEdu0AXlVMHKyJsCchgeXiMGkvyhEQ23n9/ljTcAauBHQI7yWV0cLRHsVSAgaB6ML2hCHpmYIqnSTgvutlOMSxY8v7Qg17n99RRxBDx9jKHfppE8MLvIGwdomOw697RiB6QtAiG8Yc4Dsdms5fbMdtpyXci5/Z7Fr2pUlcwjf5czJeEkLwUobmNNYfe2x7SSq7Q03dGBVpAIMXWqH+AX2TYVdX8jEY7uq6cKq27rOqnQTIPL0JOFIR/ArUlEgV8lgoim+3EEd/kQHtVuojpwyBhivUVyY9+ueyziKmkpfuZBmz256ZeCoJ7tA1LH6XYfzIhuKlxuqGgY2LMdNz0PMEwqtglv9MGZMDs16K0UA2fyctFiv3EEBo3yTTkMWvlkEjxu2tytid/B6fuV0HnYMNneTGM95I2PEbabEmh8O3J+l7KsEQ90XCyito4amcu+fJq2K6L6oLhOv/voSr8b7CDYV5VqaSvkeQ/llhqSJ9EQDy/ClP0rN2z5VTSIdP3LnXE1/zrBA0EB7ubCKTpafRI69HBUBM9R2o9avE3hNQxopxexqQ5TYTxEcjfrtqbDD1HBnlFLBWflIl7mZntrmSkcimP2hYBWfW7UuTXg5P1UDIrVdC4WbushwUONuUwbm90cOewbcOfEmUiVS+E4h8BOIpRBlR0XtTgGhbq22Lie2agXrP2Q8vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(2906002)(4744005)(44832011)(508600001)(6486002)(66476007)(66556008)(110136005)(54906003)(66946007)(83380400001)(316002)(6666004)(9686003)(6512007)(33656002)(186003)(6506007)(86362001)(33716001)(26005)(5660300002)(1076003)(8936002)(4326008)(8676002)(38350700002)(52116002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ibTcY/mL82FEL+YhAd4hw9Vtx4tRTZkVdVchC7/hgyKWiWN5/4FhbOGbT7Ay?=
 =?us-ascii?Q?W3DEwxgtx73CpNldIkNe0+84d2qyr9r3eOpq+uei03lF8hLBFuzquo/Mt3i5?=
 =?us-ascii?Q?3+6jus+j2rWjwKK2O+bK4a4Y03yq9FBCq0e1PoTLUPMr2IcYU4WorWvFkQvb?=
 =?us-ascii?Q?6Kf+BdzPf3H4bmXKoCyCeAo3LWi12gePoUKo4pAeEJRRy1fSD0tsJGBPq0dB?=
 =?us-ascii?Q?E0/mHQnNUyIbfbVEYKewdKd+7x1ZS/hYpgtfsN5yc9IjF5OBJcJq+dQlPVcw?=
 =?us-ascii?Q?+oW5PVf18hCHODb3rXEoQIZ6BwbngpJTMO3DnC0DZatSIOO4+Ky5TseB4nuY?=
 =?us-ascii?Q?a6MZmZJZ/PMQKEJdYXKktvuGw8EtFiYbLP+doaQhl5tfHnlqWBRZ8nlVTa11?=
 =?us-ascii?Q?iqPrtagjY/sZaNFOCro53DxbILnw79rwci5jFS/kQMrFQNRt60mOP5OT0VKu?=
 =?us-ascii?Q?LX/Wa8lBp4XSwnA0q+UFyGPmGqw4xNzIY4+JLruW+RZSmuF4YP4BF8YaJcO6?=
 =?us-ascii?Q?HJk6ghAsT/PAdZaps7Eboy8pdJkf16LJP6YAeVVFfR/UoZZuRFcLrrm+YuvH?=
 =?us-ascii?Q?HEa6Qpjjp5vVpoYDhuqA3VG6Y0DprLGBZ233R4pkywNRqAaiF8ke2VyUt4D3?=
 =?us-ascii?Q?ZP6+7j/pkbrrqdhAPiymK8C0xAUvLaAqRs0j4vlzjGrmFF4H0Pj1GRxVapBx?=
 =?us-ascii?Q?jW7b3twcQIt0iVC0YaMdadOTUWMeX5FaAMDR7d+un/XkXsjpFfvlziRyVvYL?=
 =?us-ascii?Q?uTQAg3ANU/tyFQEiEd/IayUcGMWEu88kH6pKTpyuZlxFX5DmiXH6eKMWf/Ti?=
 =?us-ascii?Q?XN2nN+sKVThmX285pryejakw6pJDIRCXCW69XgnH9y1n4q21pdWsU51k2NK0?=
 =?us-ascii?Q?5lk4z9UQRa3OUg6mk7oagoj7pA2Q0BWsJZC2boiL386iFtK37fjxxMn3UtGn?=
 =?us-ascii?Q?jHzBIGoIvqMpjfwT+jD9q+QgX9dLK8V14sRmleeRGyUZ5Hh0STeJp1+Zf+KE?=
 =?us-ascii?Q?jD+hJwZrafYVNDSmXmFt/pYx16ZvJ65e4niLIEwHR7sk/2fSzano80GSyVH3?=
 =?us-ascii?Q?8BP4ZNacgVAJ9oeOveXlr62Z6wow6M5CSzYDWFyAddQEqf1QKAxFNNd9B0/1?=
 =?us-ascii?Q?v8ySEr0T4CUqMq8j17yVwL2N2tvKnR6fhO+Nh974UrE+qx/oy+JnC2EQyEaj?=
 =?us-ascii?Q?J1n+nYLKUeofhs6m8VsMLWgabcv67Agn8ItT9dKaaPWPboFs9PacrgW75mgq?=
 =?us-ascii?Q?gaGzCh84qkz3qvDuriwDq8P8JqO4AUnfHsJmeVo9QKmDT3R9rQ7bdlQbQDkR?=
 =?us-ascii?Q?6hAWs8pp5Q0944VHSQ7++60bjO4BP9Py6wYzpye62XpO+rnfzhuEpLEktUtU?=
 =?us-ascii?Q?ARAoPDxEOlqqPxyo/NsAfM7QuynP4zXNWDBWeCaD/T7+hHaYmrmOAzH0tzTW?=
 =?us-ascii?Q?p5F8srXWwm/VkDLE2wcECvCP7/not9JEEMjSdh71dqTJyiI19qYaAyXqxGaA?=
 =?us-ascii?Q?VWdDvxtlYFEfj28QTX8Lbc9K48MoZlw4UZwcrCjJp4gFZ9sq1Zii4pBtNu31?=
 =?us-ascii?Q?/nK3p05GTJgCDSe54bc30n5ME/2U4ejFOCLG0TvJzPChdNwHEA8N+ODgOwhm?=
 =?us-ascii?Q?MJQstAJY/Ati057npDFOD4sZN5Bn5Po2CqLT0RG1nl95EejiPyx2pN3aA3oV?=
 =?us-ascii?Q?K5/AZA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2e311c-9367-402e-b80b-08da0039b9ab
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 12:55:15.7958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZkufkH+TlnythlO262OlgnCGDEs8hYLRmtv9YCbSNHqeD5Vur8CnvWKNM1AaAM7e2DXAsULLDt6h71DJMPaSFJWNCLG3WQs6E42+KkVBzQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1614
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070074
X-Proofpoint-ORIG-GUID: 7K327CaqOV3Lg9Dzxb4ScD8pK1BZ_pWK
X-Proofpoint-GUID: 7K327CaqOV3Lg9Dzxb4ScD8pK1BZ_pWK
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
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the error code to -ENOMEM if drm_random_order() fails.

Fixes: e6ff5ef81170 ("drm/selftests: add drm buddy smoke testcase")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/selftests/test-drm_buddy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
index fa997f89522b..6eba590afa9b 100644
--- a/drivers/gpu/drm/selftests/test-drm_buddy.c
+++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
@@ -488,8 +488,10 @@ static int igt_buddy_alloc_smoke(void *arg)
 	}
 
 	order = drm_random_order(mm.max_order + 1, &prng);
-	if (!order)
+	if (!order) {
+		err = -ENOMEM;
 		goto out_fini;
+	}
 
 	for (i = 0; i <= mm.max_order; ++i) {
 		struct drm_buddy_block *block;
-- 
2.20.1

