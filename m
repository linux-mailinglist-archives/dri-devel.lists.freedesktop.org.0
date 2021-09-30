Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317EF41D693
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 11:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19BB6E3C1;
	Thu, 30 Sep 2021 09:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320118.outbound.protection.outlook.com [40.107.132.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00C86E3C1;
 Thu, 30 Sep 2021 09:43:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpL5DUfu0Hi/Hr5P0RbyimMtwF6o0vJyqxFqMNXdXdpp0b4Dqn4J5YfJAl4Ht4JHiBUWAgdPcp8cD0XQ136N7P5ugy2m1dsoZpoa9N9+/cvXk3vQF3bRGZiIRkLDKc0JHTT0LvX3FCmZFyRvfoQH1xgzM+PD9d8xYR+e2Z+yxGlQNj/4eTDYIvp37+f/sMI7/UXGFEeNVkva11yUMOzxSEs1GI4UNu8y5VislMp3KtX1qh4YskWa9CCAop9ITvBLQTgElZN2QN1G7EHDWTNkXVL79ecNgRuWWzCiUbXCmXHNNQ5cI3v0DGqnJOYFc6Fn0KFkN4HbI9gQ7RWBbSpoig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1YfAmbMmiU9GZUOQZxb17hIS+xktquCrY8RQjnlbvNE=;
 b=OHdsNaCijltRfUlEeySr3kGH7kLIvXpVix4cnpKDKjNRvIbw0pUAscOYUltS4uTmbgsl6lq88AT1QBXFPTTurMXRsgf2JayvG2FIxxjYt0A0ZhENqTvr+VKF/yroIdFPxH255SMG3rb6d1Qh9m+wR7XH0nbKqCDw95vQ5yqQ0S8aS/6HLomV0VJhLYLorfbDwfYbH+qrnsD14z+2dyjPsOXTdovgxqT/mWZmnOCYqahTNHRArJfGTT8qkAeOmsIBEcsHDBsCyf8X7f4u3NMdDFz8/khgXDe20C8TtdqIFpxPK++PbiLae662BD57YToNdwVUBfHZNIIj2t2B+zYIgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YfAmbMmiU9GZUOQZxb17hIS+xktquCrY8RQjnlbvNE=;
 b=DrF9HtwZ7OljeIJWCzDTzx+pF19ck1XAEdUyc2UvimPc8UCWL+LowPaSUPqZ2tai8Y6Xkoh4hWT0GwgDE+UQSve8skticaZGjlYkljdJJM8398KpjeX0e8nKMc1kYTCFQpEXpm0hNdbN+1KQy370YxLqwr94HEcy+z+ExB+p8O8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by HK0PR06MB2721.apcprd06.prod.outlook.com (2603:1096:203:57::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 09:43:36 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::80d9:d4e4:300f:3156]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::80d9:d4e4:300f:3156%5]) with mapi id 15.20.4544.023; Thu, 30 Sep 2021
 09:43:36 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Guchun Chen <guchun.chen@amd.com>,
 Peng Ju Zhou <PengJu.Zhou@amd.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 Likun GAO <Likun.Gao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: kernel@vivo.com,
	Guo Zhengkui <guozhengkui@vivo.com>
Subject: [PATCH] drm/amdgpu: fix some repeated includings
Date: Thu, 30 Sep 2021 17:42:32 +0800
Message-Id: <20210930094239.7435-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR03CA0005.apcprd03.prod.outlook.com
 (2603:1096:203:c8::10) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
Received: from localhost.localdomain (218.213.202.190) by
 HKAPR03CA0005.apcprd03.prod.outlook.com (2603:1096:203:c8::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.13 via Frontend Transport; Thu, 30 Sep 2021 09:43:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09254884-03d9-49df-1e49-08d983f6c60b
X-MS-TrafficTypeDiagnostic: HK0PR06MB2721:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR06MB2721EAC8A75D29C2F5F1DFC4C7AA9@HK0PR06MB2721.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n42Rru+AHtRdwP2w0lvzktFfykmbLvYGBwPgfeEeNBSMZFZFyKpf2T1a7/BLxXpPVrg8Q5CLO4LQPJ0s1WXgUqhT8zD2fOxvJ3JBOG/HlEavC0UgVrMPcmkJwy3PK1v+90YN6vdeExbbD/WkoKpJhO7BBm9RWnGIPUDT+4XsJvzFGLrD674X7fNS/ZTUmXra0J23uv929Dnt8chMJE1TEoWLN550ePQH5CWbweTIqN/sTcYRm6VeTAV43k5l72JDPN/62DESqulNlfTKvgfZe61/7CPR6BsFtKQQAmUhnQI6P9oBjV+jbZH7ekt74D4CWJye9d7UTdjuxWIZYaNgqVeCn8bY53mlit+sd2TKBuVxTJACgE/kgEzwV6e61Hk/+QNH6XjWhH8qodfYLrtH873gG0SIpNmKvWFtKrIjRFWlrOvIEIvZAvbXuaP7PwdaaBZnX9J2+9xk8/sQI8doA6KPPNXsHOIj/XuaCRusHH0yb5/ZJAJSHm8Ym0EVPOz+tPUsTERoubOgzxdm1j8d4mGHuzyT7+L1efT9KLk/3KYgBuEOUwBWyyMt/DS1i71T+kslOXW3CcZeVjOr3QdD4rshjhPN4Sr3l/1wIAZ5cyEnTh2DeWTGc8gzUhfZ4tEk1zRQLW6tkC6YA4dNlKMlfxP8r8QvVoOy0KPBWl38LXzKoDycAWguWMG+FfEGEw7O0qSfsl2AjcEWdabIXYIq1gAZvlZM68/ZP99whaThf7Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(4744005)(5660300002)(508600001)(7416002)(86362001)(921005)(4326008)(36756003)(186003)(6486002)(6512007)(6666004)(316002)(38100700002)(38350700002)(110136005)(956004)(2616005)(6506007)(8676002)(107886003)(66946007)(2906002)(1076003)(83380400001)(66476007)(26005)(66556008)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QttDZiI1LvnyoPKir2JN3LFxpyryf7LAleY3uctpjVHM85qCRRjhnrxwos85?=
 =?us-ascii?Q?/tl0hR2C6kv9MX+Dlu/EFdLfbAwy1y3jm5eICmeO2mJV1AHMvzixCADLjypW?=
 =?us-ascii?Q?v0Xhp/Cm9FtZr2yfawM6Vt5uG0zHBo0K4pwSYOUHf+TaXZO11vARFlOew/Cr?=
 =?us-ascii?Q?TY0gcZApE4PyHQcXnX/nSWKXYqQ9tWBIQHpOoylcpi1GHuGLzXNdrPkuPsAf?=
 =?us-ascii?Q?BiYCCbaXBVyyzljzaANVE8e1aroDfE8tLj0MHLzbmBPcFgAhkROw9VKkORT9?=
 =?us-ascii?Q?80uB5FKb+BBgOzKkn0kFsIJbOJTn6/ivuYnQrcNLirGUCeAbTV7I+4dYxb2j?=
 =?us-ascii?Q?+zclVLrrbrha3iy7EMhie9vlO6pGrYzwhh89Az9Snfaz3Wl3PeLotT0QKnLp?=
 =?us-ascii?Q?tIHtRBfkWjuYBSDMgiN3nAPHK8yPt2+P1XlWFon3xFCJsBJcpNRrfO1L0GAD?=
 =?us-ascii?Q?KmHEs4bfQuwZKGWbZmQJmYtqIf+6q6AA68hn41G60zbj4DsI9IoblPJS2Nmc?=
 =?us-ascii?Q?rwlHKrJ8+CdXCl+ggQ612DQbv4Fu9OBo7+zzDWra3deVyR17bgJC6w0pwc1G?=
 =?us-ascii?Q?m0hMTxejh8o5Z+1LFbA8pnA5bM7xwS9qnYQp+pHo3uFwlt2TDToi84VoCTTu?=
 =?us-ascii?Q?p4kbcsNALIVBl5GE10grToMBG7aeJXFrPAeaJRqsM0A1amPMzYlRdqE26Y25?=
 =?us-ascii?Q?UldyHo1amY7IdNB121xfE986RI5AhvU8Li3HGT8q4125Kq6Y88M1yqZz/3MA?=
 =?us-ascii?Q?Dm5eQ0c6rCceoyAM1cp+cfjq0AdF/zE6LS+YVI0ZSwczMzzg7vRzIQoqOteW?=
 =?us-ascii?Q?q+yhad0iitm4fmAelh0M8qI7DblwJQ9BTYRYjN+hl+7X+8M1tqI6Hkt7NC9X?=
 =?us-ascii?Q?fUPLAYtZAT8NM4vkt7IGgXODzy2Zaa6ON+CFQE2kq3gQ6X3LSxgCdSvIQdOF?=
 =?us-ascii?Q?Q7KxAla1e+GlCKzBfJ5UhrbJ0Vnr3RJpGQQpPp4OXO9U/G6kuBcH8uiP/eDi?=
 =?us-ascii?Q?rQQ1sElsqauoa3r6TWF60QspwA0OzZhoAqHoMuTwAJHKxZq7LQby8nrRACO2?=
 =?us-ascii?Q?ORkcaWJ5ETa42JtELoCHbEVpnEy0k7hAdf15GUB1sbg+0pnTW+FqBRS9KLYA?=
 =?us-ascii?Q?k9HEekFuOxcytThoFz+uq1vYxXNhfddvUbuI34mzjkgkEFzOY0mbjOOzGfjO?=
 =?us-ascii?Q?+lCum22dyM8rI1YI8f/8D7sDuQS0rWgnZhOkEuEnahPmVAUS6unVUpowEpRJ?=
 =?us-ascii?Q?GYRcpnP7Xao0SwjlxGBkQyBpwHPmVFGzR6oO8//NmgBvv02/5Nfc6LXSVEgy?=
 =?us-ascii?Q?IRN+NZkfUZZZzb6yx0ONWWAg?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09254884-03d9-49df-1e49-08d983f6c60b
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 09:43:35.9295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1PgYXHtQ05/+/5v2qmLqArGRWrzYX7AD1n7fMeiotHRC3jvtMQLiCbGs0RVPVisaeNMVCVa0/WlkDGKjI3c2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2721
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

Remove two repeated includings in line 62 and 63.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 291a47f7992a..94fca56583a0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -59,8 +59,6 @@
 #include "gfx_v10_0.h"
 #include "sdma_v5_0.h"
 #include "sdma_v5_2.h"
-#include "vcn_v2_0.h"
-#include "jpeg_v2_0.h"
 #include "vcn_v3_0.h"
 #include "jpeg_v3_0.h"
 #include "amdgpu_vkms.h"
-- 
2.20.1

