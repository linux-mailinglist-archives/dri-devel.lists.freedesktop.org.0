Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5626BAB72
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F52A10E972;
	Wed, 15 Mar 2023 09:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B18510E968
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:02:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SptzClbNMKOQhyRvvEtskaM2xqTx6jPcKKRl52NfuRgr6Cg95M3cnlYltDh8HuDevZtOthGxC/9mrXUqQyM9CXSmhsH9GAfz9wlSH4XtLCKO4VQuO/T+YzkqVLils+1yntwnhTYscmWVClChmgZ1/t+U5iEljNrCEUqFPzLR8FhPz44iVQNZl3AA/ProoMIPgdBkrPjb7Ku/XsxFGYtuuMlReRH5xZo12u7xI6HfXMgyIPjuxf/QaCCmOD9hSAzYyNf4bP2+zBCKxNMQ2Lk+tOMFZuVemQNvsVK/cAGfN9swfffElfIMlTZEiYys44BreMhP7/kvgALik7VQDOj9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yq0umAmUPl9tT/qdthTgg+GTSYvNtb7u+7kP+f4Kwxk=;
 b=kQYElQ9IJXi88oANIfn3wpDaeeAWEV5cMvChEc9dtoVXa9jupAszjVhweoZqhdGvGvoiHpXOPIBjTfT0Kwho3Eo6fAs3Hmf44s8/Vw+4KrUzuSTt/rI/G0w7AuTZiaDx1VL5HW1fcQlU1unInOYXiQWHRQMGNBtwUWjjkAB9Inqs5jmUBEyfy5TfpzttM7MLb5wGSey9vRSzV30cIhO0pO4v1qX9WtTFoBjY5qPh2eVMUN3sR+s2il7a+or8TD81VHievJ0LCaF814M9jX+hjqfLePB6SrqjbEA1zOZh5P+LY4TKcm79ovjhorOWnMqQq7ZhWtsMjacuEcfuHraE5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq0umAmUPl9tT/qdthTgg+GTSYvNtb7u+7kP+f4Kwxk=;
 b=squHl0/JMU9GqkzhyIi4vp7U99Q8aOA/0aQ0WfZ3OVekkD824amVXLsj1PRP/wZiyLHt2l7t7EBDeuEcEwbunSnBUwG0hq9a9XG2LWClFJnOLenoXWzUbXl7+utc6uxUDJCkesj+471imJbL8Pu3LCarFYvP/9cy3mNFaTTff4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB9932.eurprd08.prod.outlook.com (2603:10a6:20b:562::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 09:02:47 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 09:02:47 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: vop2: fix initialization of possible_crtcs
 variable
Date: Wed, 15 Mar 2023 10:01:58 +0100
Message-Id: <20230315090158.2442771-1-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0098.eurprd09.prod.outlook.com
 (2603:10a6:803:78::21) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB9932:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a311ea6-62cb-400f-a0c7-08db25340c09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uThRqHTCOLoHcRoUqAfYzRDF0eDWDcHAvhiZPmkRMOwUUir0eskuQIYFO7aZ2HoMdIXJ3m2A12qewPT3EAVpGpSaqEPCXZ9iSIWn2a0YqgFLVXQWRQUwYpwjR/chDxMC1YK6fK1LJxDtW7xUfWw9JE0/EOiYCJRLewgbQUuZCEV0LTDECqilPEsL5Ch/7sNSppuE5EeKTucshdUFfqHX9S60e2UYSCupeJW9ys7j4H8jBKDB0J0Y/U0xMSOu2x9+i3oswN7xsDUqzNAbg1x3WOuCJueywVYz4fxlyQ2gScBWD3P939lydMOYOPpzA47mdWufMlJCBDgaoFw9vSPUz7pyhw/M03dHBZOKnJEEL2xyRfppGZ7HvQJUDsYnBLsDNdnddOi4KROB1+Pk7Wc3bXg9Qj3reuxXTXXvI2Z+DHRVt3hUTLEd5t+7hAco032w6zpDeKX9jb5sjWxEZsgd5IwRVBZE6+WyQLRnaKDIbdV9JSeLNpUdfEcDiPS0qE1xUWPs+nybGOzNDXWBVx8IaGMwoQlFiiSo8dz4GyytO+0fF67lFA+Rkhr2+lJ/V7/6qpfPB5zqU3PCSPx0kcgo5m9z2pjTAvDJoLz0dytYIJxZmqWNQjxS8g358CNRlh2hxr1rcXOwPtxzqCJV5CoeTcZ0pjyOJE74yCjH46PAnS0ezts1LeqNRD/0CCQyf4s4oSvdekkHNkdfC3mMhvjUNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(39850400004)(396003)(451199018)(36756003)(83380400001)(54906003)(316002)(38100700002)(26005)(6666004)(52116002)(478600001)(8936002)(186003)(6506007)(5660300002)(7416002)(41300700001)(66556008)(66476007)(86362001)(44832011)(6512007)(2906002)(1076003)(4326008)(38350700002)(8676002)(2616005)(6486002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AKCAsoQFGNOTDDBTlEIXXTcCq6TIFi0qVkeR1kEuHuWN0v41SR3KNa01w3Kl?=
 =?us-ascii?Q?b+vP/UmTI9fH5vKy6OxvvtX+wneq0+AkvigFS1DhPYjwcGUVhkAL12Jj6yEV?=
 =?us-ascii?Q?iNhr93NxHcAkjhWa43cLN3VdCnJNMtt17fFPFm4dZBlUqKuy4GGfH2JfI8l8?=
 =?us-ascii?Q?Mh501322vUY8wqGI53dMnJW+p0I4Rnu3OjCXrZ5CbrrZIOXuZw0kldo9qwQb?=
 =?us-ascii?Q?ECOmPDfmST7vhv0Boxx/yaHMOULGr/XOKd73lct9BroplsIAVO7xiPzEQkL4?=
 =?us-ascii?Q?5H9zVGH1B/0Ej+kQNspOIKQMXflBNSUiGlN6H9f9rrac4ZsrCRq7xYe8LFHD?=
 =?us-ascii?Q?Iaggfbp/OkkWY1JLgzOwvd/KV1Sksw9EdlB8DSvdvzq0xKRb0myH8WmAMH20?=
 =?us-ascii?Q?S+s48DjZDbPRrObWKaWQpfLK3Kz5wDVfY2z7WSqiFLXdCOOfK+cFboMy1F9r?=
 =?us-ascii?Q?omrPBi6wjXPr5LhCkmt3iLfo3oPJ5zhDN0hJzK4KT3LHr6UlEre6L/0V5Fpw?=
 =?us-ascii?Q?WuL1BHEpBzLA6s/UoLhsNJrFVVHikIX0aEoOU3h6MZ74ftf3d8gMpd9P7WZr?=
 =?us-ascii?Q?kwONplJzATzPVstSN6+Z3mucRFNzZpBznZjJACrHwKTnQ5fmHnTNHa2SB3hU?=
 =?us-ascii?Q?gT46k7cdlKDKfPy2FQHYdD5MPIcEkeWEV08J5ltN4PaDRflXYm8iKN0fr/Fi?=
 =?us-ascii?Q?VANi72D3pLFlhiVpkRNK644unaFWt7rQIJYMRaUZmegM32uAZq1LoKa3vmjb?=
 =?us-ascii?Q?Tnuta5FB1EtCBUzt0V6JtoDY1w9GSgEdIOgEP5XTNbmOZTQe0kaHkWLqpKrF?=
 =?us-ascii?Q?2OGhPq0IvOVZ27i4795UvexqYAIEjRS3Ghy6X7Dx6UY2I2R5oKOmC9AmW5kX?=
 =?us-ascii?Q?9ms/VkUy03pKEQK08xb8X3e+eD4A4HnxD3vh+b8YH6k8eUGk2bleLBkqwWfq?=
 =?us-ascii?Q?aIh6WqgWyMBzNB/+YnDPNsJ0dZEqGiEoKC22+7e2Ng0hL1YQZCigBXuToHrs?=
 =?us-ascii?Q?oFadQsiOQYkovfO7Vxy8qHF02edHJXOtANGwAStEh9hRo2aCOrGgoM9vYeAS?=
 =?us-ascii?Q?ChvPYDdjxQxjyvD4LjsbLGjLGLeNUdZqnD6tuE5ubLWvgdh9oN7XSugf/VmC?=
 =?us-ascii?Q?bKUoYeZkdX2qedB+droAVxm9yikOWgVxfTyMQIjJ47Clqkj2vUXgEQEc5uuR?=
 =?us-ascii?Q?c2agDn4C4K22BBNcwa/l7kxECrFzeTg6drflnJt/H6NYvBdThCmPA8kXYrAx?=
 =?us-ascii?Q?pjWf/sBLidK1g8FhZQTEj7fDEisQQ2OmgaPngQgJNrZkf+5qYeL+ir4q/Byr?=
 =?us-ascii?Q?X65DyFRkYJgV/1/yWiiDQusUhijTwrwH5Cclwx+fhiMPZlLMPIOWiXeZMLuo?=
 =?us-ascii?Q?gqxYAqc3tzvgyCdeRKUma3KDbBPUJ9AWGClZfxNDbI9rT8ttRuHB91vEKMQp?=
 =?us-ascii?Q?yc23PYbMbSzGsJtwgIiP8u2mLfBw3tmd8FNLzBfO1u0/dm7pMxx2oC2ykXLG?=
 =?us-ascii?Q?6Yjec5tJCAQda831WCahy2+HjozxYbP81MFH7KEybWO+wMLri8SX0eYb0E+e?=
 =?us-ascii?Q?DFczF3rorMYMBKxrE4UFQtDq6C+grgQvgcFl1mdm8W3pfl478FoFEAfPU7Xr?=
 =?us-ascii?Q?WkFK6eHIuce0aIEo3L6ZI/4=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a311ea6-62cb-400f-a0c7-08db25340c09
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 09:02:47.4479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNzcpwfRjHFFaFHvv3iabw2N1BoyZvoDyKRZFdg/knyLY2yDBkRgPeI5xgt0S55v+yvX8iGXm3VX2Paoo8aBYa76MR/XDA/ImS2g9hHpEuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9932
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable possible_crtcs is not initialized properly since commit
604be85547ce ("drm/rockchip: Add VOP2 driver"). A first attempt to fix this
issue has been made in commit 368419a2d429 ("drm/rockchip: vop2: initialize
possible_crtcs properly") but turned out to be incomplete. Initialize the
variable with zero to cover all possible paths.

Fixes: 368419a2d429 ("drm/rockchip: vop2: initialize possible_crtcs properly")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 1667e5324b29..0569f1211d9b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2301,7 +2301,7 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 	nvp = 0;
 	for (i = 0; i < vop2->registered_num_wins; i++) {
 		struct vop2_win *win = &vop2->win[i];
-		u32 possible_crtcs;
+		u32 possible_crtcs = 0;
 
 		if (vop2->data->soc_id == 3566) {
 			/*
@@ -2329,8 +2329,6 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 			}
 		} else if (win->type == DRM_PLANE_TYPE_OVERLAY) {
 			possible_crtcs = (1 << nvps) - 1;
-		} else {
-			possible_crtcs = 0;
 		}
 
 		ret = vop2_plane_init(vop2, win, possible_crtcs);
-- 
2.30.2

