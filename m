Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DCC453136
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 12:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7517A6EA4A;
	Tue, 16 Nov 2021 11:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BAB6EA2F;
 Tue, 16 Nov 2021 11:48:44 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AGBDduf025448; 
 Tue, 16 Nov 2021 11:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=AJhrg5i64tTcsR57qNo5VTj+yb1h11NtQ5u9oaoBsZQ=;
 b=ZYzIdbbuqBwFacDL+fd8GbW9F6q+bUceGbsDtfYUzWGC6YwzErMFlIN1JxRywE1ddltg
 K10VyfJFYYObkBiYWhzwegkAkS2y+cHrs9BFnoJ77t7V5M/HyvL8OXmfc5Jj3u/bJcrr
 srxzTJx7RKtc1INA6K0IfB1ji6hs0hMEUV/WttZMUigPoNW+lKbyX8aWUgg2oNv3WgXC
 imyH2OIeXqqbptbAiUCPtaznp5E9ceGDocXRAo+szVXBF70pmghewpo4apx2VeaD9Ojb
 lAlBCnmpFedJXb05kmlEn82yn4cw6//j5hIMY7JYHcqPDSCeUa1VQz9KAL8lixTABT0b Wg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cbhmns39j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 11:48:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AGBkhep017839;
 Tue, 16 Nov 2021 11:48:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by aserp3020.oracle.com with ESMTP id 3ca565a4kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 11:48:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkiKHpFTa6n5eFLvrhVqoIVyXZl6t7itLWHwahoTmyca/B2esz+Fy8RW0aBeCAwjFEiq4kygsFcBP/KblfmmDlezCENbLq9hfxQ5MV+CNYRZQR5BoM/evc/UpExqPr980bQSY/dCPAs/q/jCrSBOoGurGKU/eJdlzMDobyPYQoxD/pEqBmg6Q7xEH+AxiVhFKZ6KnrRPX7vn3WiHrz7V04pAxZ3skHEXihaL6aHXgA55BVQ8MRvlhcTeFcSkv2jVZM1CstXkAFPfoZGjSrPXhcZiPMLjILgesOMwLeUfMYBkri+dvn3U4FaPCoUqCFUzfcLlhYfLDrziNT+Y9BRI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJhrg5i64tTcsR57qNo5VTj+yb1h11NtQ5u9oaoBsZQ=;
 b=i95qMbps9+0wWXCAgjsIh/9OLNR31r+7rF9IEQE3WvaH1sJvj0SnRzZXhc9hiZ1+6JinTX7avnIPdjcRDZnkdPugCBuOnV3ZXdvHjlOhlgFzCF3PMO4oJndPZDRMV+LW+4kUx0DTPvNI9O61jSujML4kddbAONz/aTxZTcR6uXf25Rw1m38D77PefwfJTYgcrumfSMRn0boJfXlezXa+CV8j9hLNmeY+qHzxJ4efk5T6BPYZhNSscJeuivf9rZpwtGU1Nof5bekz+6E1MeYl+1lWL+mVtTdGIDVWcIzgWMHHqu4G2V7THm+xJrm8qI3D1PbCrawEnMA1E2aZj4mL2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJhrg5i64tTcsR57qNo5VTj+yb1h11NtQ5u9oaoBsZQ=;
 b=WPJN2tdNz/0DNu545CbMB//xLLgHYwdZxKIHJ+uIccOTxXFoIe7pc6u1KHL5YQGiBQMl5qsIx16OuKhAZEZa6yBVEubowprtloCakkj87cIqnhB2SM+Hzt5iU/rrkIM7n4fAnEF2aHYZ4EzVXq4lfgizj5hlGPdBgXQBLomJfkg=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=oracle.com; 
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2367.namprd10.prod.outlook.com
 (2603:10b6:301:30::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Tue, 16 Nov
 2021 11:48:32 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Tue, 16 Nov 2021
 11:48:31 +0000
Date: Tue, 16 Nov 2021 14:48:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/i915: Fix error pointer dereference in
 i915_gem_do_execbuffer()
Message-ID: <20211116114558.GA11936@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AS9PR05CA0059.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by
 AS9PR05CA0059.eurprd05.prod.outlook.com (2603:10a6:20b:489::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18 via Frontend
 Transport; Tue, 16 Nov 2021 11:48:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eb8b7fb-a687-468a-924f-08d9a8f702e5
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2367:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB236705AC9CCD7D50A2E442568E999@MWHPR1001MB2367.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oU4ZSPixKEsclP7LzI9KxUxg2RX8WAdMABgfnbOfGcM6/m9JvbA7lso9wlwotAIYelfe079TMtt4UVe6B/R9qUe38Sst/9NM8nzt023qb4dmUzKt0YTDuCdHiFPml9g4HRCdDAFbXJsLa1dcpIyTS6OkEJjJADsf8cVEeClGy4kP4fcZh48ZyKfvUIl8S4DMRwXUF+qhh+zY9l7vWEI2u9UnPWVfqP9L3S5kGCF0WkjT1MaxWmO5/Yb+6laLdDcHKEDpm3XSXnP8bEvvpam+wEUjwfdtaDs2Bn9FcMm0kfP7UDetfsB++47dmoCjSOki9jwfjU+LiA0Do2yBm+FNiqreMGLSIglLXTESUtb7CMjoQhPDBoCdjOaZIMIENZthNLCFSkvhMF4AUIfVYHN62W82IJoelKNP2N+6AzopyAj/47iJK/yn2S/aOHnGO2n7k3RLQ6HykxVWRNz/j5pfi3xTGlwFdyjjUZMDGGtR7ltAJEHnR2Yfk+G03x7UWWvq7AJnc2Wdt9k6nL6yvxY4qzR4NoDAE1nzDUgABxcocNX4FdjU2ZptE2nR7XsMFOM6UX+VrRwlVKYOxrpuunUS9pFetl9g+zyEvXFpA+dWEOpIey/TfACV1ivrIsp70UlUb/D0acQDAZXyxP+0s2aIchoerWvRK8je3gx2ka8ul6CY3zLcmJhz3Nx3t12pXNZXoBhH56nOkktA7wY0tfrF5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(52116002)(8676002)(6496006)(86362001)(9576002)(55016002)(4326008)(38100700002)(8936002)(66946007)(4744005)(54906003)(66556008)(508600001)(33656002)(66476007)(5660300002)(110136005)(316002)(9686003)(26005)(1076003)(6666004)(186003)(44832011)(83380400001)(2906002)(33716001)(7416002)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Njy9qcSl9ME4GhpHksjXaIDqMN8UcCgwYX8k1UjZEd3gDoy4XFgbamMMIpMr?=
 =?us-ascii?Q?g5WDSOaUaMjKwNbF5QW7zrwHyUsdDLDLbczP9yKKUp+mQ+3wI4W7w8ArXUNw?=
 =?us-ascii?Q?eEEWaIH9Fkf/JeQHwAers36MleoLpAJhnQZ2dxHtNC/AiKrCa5BbFAdgLd9E?=
 =?us-ascii?Q?rXGphCq9lWM3CkSIa0bhWXDipFKL1dz5xh0Y3LPC6SL2GgAmU+EA9LTJ3UDn?=
 =?us-ascii?Q?ffowv0dCKC5DDmxoNTdBwznnGJ6uZ9Si6PpI0oYQ4NU3XZCWpZAiWgLh6aDO?=
 =?us-ascii?Q?/K+Xm/7zdpfzK8VX9dgHDbGoVnyBtw27ioeHKvkEPchFmT2TPNTthzhclNUH?=
 =?us-ascii?Q?Qph4kQ/G1TO2zV5XIhVsl9+lQXX2Ucl9iMocP2op23qdugCExHDGbQFBSheD?=
 =?us-ascii?Q?3yK6aGcIaVpshfT2JEnWMIrk1Y3rPAC8cGfWufjwUxdBayClEQUiTpcSgi0/?=
 =?us-ascii?Q?m2kj/jvFYaxRZ5oldc3DuvvLHqOqDNJrVOS/Vdh3TLgYbfTtvZFaV1iEPC+F?=
 =?us-ascii?Q?SFdQdXq6ruc2md1wM2FY0QTSxnjMn1n2VyMIBuf67TlD6cZuHwdRR4wzhA9b?=
 =?us-ascii?Q?r/KRGOTgBL8XSPXbHm677xDVN85TAc8wBTIb6/bamzGP7yy3EQExzJkucA9V?=
 =?us-ascii?Q?jzgyn/R6Xtb/Wmk42IbYF5WPE9Rkk9qhX7GvbPzZIrf0sX+u8GfEgMErGSZk?=
 =?us-ascii?Q?SYFdAKpq3MXMu4Df878v/a/j/JinUnO/kFsvfIfxt/B8STDFQ6eatEqSzz7m?=
 =?us-ascii?Q?PhghAh898WLDjzyiJeb8LyzQVFwqcgZcLCHUC2RMWW0nERiURrtcjvKNUGE1?=
 =?us-ascii?Q?A6QOaU981JgDiQ9FyS/vq6YElOHXc7UlMTrcA5YL45MvRxq3fEcb9oB3Qw9h?=
 =?us-ascii?Q?rzg494HLm0mZ3+S7ipsHFBv+UuQmU9B+1tkbPrRgqT7WIy8YI451l5P7AH3E?=
 =?us-ascii?Q?UVA7LNhjYGD7v4A2LoFm+r5kq4bV2GqkYeRzE36zmieNG/AvmqEsbD839jM2?=
 =?us-ascii?Q?Cu05yOgoo91Zljnq+l9f0C3qt/4ZHBYldG3SLM1+Aq7XEcmCGj3xx2mqDBNb?=
 =?us-ascii?Q?encsHMVmS2ccfgAtmK+XHAiFi4jrEVvKi8FzMxyUvlJs/H4nPqn7KbRs1qLz?=
 =?us-ascii?Q?jvz7WYHcGNl486FiqiAXpHzET+7IOrJEnHslVEDcmlGw7wrcoYWfI5Yc2rXg?=
 =?us-ascii?Q?vDGcNF2YjIJNhPTKNlU+yokvdBR9hK0OFRAqrWvkXyZlQd2ajron0syEJ+U6?=
 =?us-ascii?Q?95M8zTUR5+qITorB1aRff6qqYVaZvCvCdiRmjymOq1fpQfeBapMV3SKaADqu?=
 =?us-ascii?Q?DyEzzs3JbohE8G/SgLbHvDx+pgWLBbANDDSaDSdrzH9/6FMBmQ34AMbzqNAC?=
 =?us-ascii?Q?v2bmyC3/xwj7DqmypEaSTP+f2qWrrldcRkCniHw2aOamXoJ0l1RJzcuU4Wbw?=
 =?us-ascii?Q?eCGwaPjOceG4HdPms+Wpbd0Uw8lhB8kxTIUuFXAyD8/czi3D3ZaW7LwgHRwk?=
 =?us-ascii?Q?c69g38cGIROSGIlgd75WYNQ0YOBia6cB+AkiVgB/RlOO94xetPStkgQlIRUx?=
 =?us-ascii?Q?/iuYQO7dIQxsJllHdYleJQ3MMB3lcw0SRFkWQGl9Bj3GBDJ2V2idUVzGGWQ5?=
 =?us-ascii?Q?/LY7/ZyZYBLygV26S+Ea9JxEI90GJsgEsGTtddKw/ex5CESWAfCKtsl2w5sj?=
 =?us-ascii?Q?puzn8Gmz6YxykNQ1B1MKCgV3dFM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb8b7fb-a687-468a-924f-08d9a8f702e5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 11:48:31.8138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PPg0+ns/6NdNaoslJWbekYR36/ch/QUDimvlNDDJR97xo37UpZoIAuIeDMwHOTY3LCwshO08wp7wm2EkROrZBMzAzmgtoNlljPT4cT5RL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2367
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10169
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111160060
X-Proofpoint-ORIG-GUID: u7hz8Cr4h8lVRieyiZKRndLq4oQxIOEA
X-Proofpoint-GUID: u7hz8Cr4h8lVRieyiZKRndLq4oQxIOEA
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Originally "out_fence" was set using out_fence = sync_file_create() but
which returns NULL, but now it is set with out_fence = eb_requests_create()
which returns error pointers.  The error path needs to be modified to
avoid an Oops in the "goto err_request;" path.

Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 4d7da07442f2..9b24d9b5ade1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3277,6 +3277,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	out_fence = eb_requests_create(&eb, in_fence, out_fence_fd);
 	if (IS_ERR(out_fence)) {
 		err = PTR_ERR(out_fence);
+		out_fence = NULL;
 		if (eb.requests[0])
 			goto err_request;
 		else
-- 
2.20.1

