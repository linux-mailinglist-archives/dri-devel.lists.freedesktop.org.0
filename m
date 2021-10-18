Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9FB4311BA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2ED6E983;
	Mon, 18 Oct 2021 08:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310131.outbound.protection.outlook.com [40.107.131.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9876E983
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 08:00:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ir3w5SSoSqWvXy9el+anYf3jpMxYL6mommQmIY5Sw5p7ft3prFwjfFogfoPEUrgJjLAdT30nCHVrb8u3IGhJdPPJkbnh53EFW5OXsVg/y4sCfzm8r99u44h0d4XMO7cGUEz8kBwpd5J+2erasXRH5WJbrpsASYtrGkHxRyitK3f9yT8nXJnA1RaTrjlypzVFtK9IjQATy+gAeX7FpiB1CECgRVDM4h7hn9lktG6Dw7xmFxMughgMkYt5tJMAaOOhPhED5cEY6g85TkXuJQQ9CORU+5vJWKJ6efPD9ftDxatrLFfLErQRMyY6WrcyyPH98++Nk2P+JqHowBDJRsc3Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7N5ohZGvjJi3k+WmKw4uI+z/e0NY311QI1EOE7jz2Gg=;
 b=Q+UVyBJYqWASOpOhgznM2xakPgc5OXCTSlnVyA68nRsShbntKacmud6sz8CMpl++oI3QvcEWhHiD1sMEW0dRfFtgTMN7RQiHD7DlWtf+Uv+xKiO8kBLX00bWwyHqki3UJ7itLzmJ9Vj9tCGqBiKW+K9EFpN3tjBD5LuIL/k3dZXPuY3RUqKyIxh7nmQW1U/MQXOw7ONj6DjUTQOI6JeP6IET5/7/qpgXGymbVEm2aWDI1RqnOXWIvyY+CZk8C8yGQ5m+rNnH0+PgLI/29/cp2icnOPWVpuVgo1WeRrFBw3lVfyvSY2BGGp9Tqk0mHgmm7/qftXRYtPxZav2QgDluGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7N5ohZGvjJi3k+WmKw4uI+z/e0NY311QI1EOE7jz2Gg=;
 b=eBOYHLyYOwkxGdZXm09ZAi0zHs6bHeX6b3R/kS2lgEEqs4RsqwsAV6t2wv7x4eSLALTR2VtWFNh/nOmMDFloyIB1n4QLfrHXma/EVhJZ6Ysf2yW7pniSvme7EK2uHJw3VT8kMFA1Z21a2xgw7GNVPqj7X+2XDlcIyqGSyIewcIg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3387.apcprd06.prod.outlook.com (2603:1096:100:3d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14; Mon, 18 Oct
 2021 08:00:30 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:00:30 +0000
From: Qing Wang <wangqing@vivo.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Qing Wang <wangqing@vivo.com>
Subject: [PATCH] gpu: drm: tegra: switch over to vmemdup_user()
Date: Mon, 18 Oct 2021 01:00:19 -0700
Message-Id: <1634544019-36822-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.189) by
 SG2PR01CA0145.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4608.18 via Frontend
 Transport; Mon, 18 Oct 2021 08:00:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f682449-3069-4294-a144-08d9920d5abf
X-MS-TrafficTypeDiagnostic: SL2PR06MB3387:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB33877AB14D7276796E7F6843BDBC9@SL2PR06MB3387.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UMOMXQvfCpBjbalKpEHpuuu6nqRs9SlkzonzLTos5WGCCqhdpJ4srnzyOdJ5ZXL5U20aRlhnJK29B0KUyWfRMip2/8YdrBRN4dTeoXxg5yTzJlCRkE5s69lfKsSlsfufiBTBPovFIfwIPwAOJcYbagGazAWlegrEIkkh7JiN9oZKRM/QQyV4FDioTWKdGaWpD+apsS6mIW1DFpJIfMYR3EsnDTBHU2uUfOyzSiFaWreD7vhM2Uc8VTfquNchYQSUzV+2cNUjchQqDbknzgFbMtZb2LRDZ7qQo7K8+wEi29mcuYGMbITJoARUWwEipQBTqVtNvbdbKXoEQ/jRqtE2YAcrN/dWzxlAK9PnI6W7q+fZ74/j56BaVkpQuLPFTrlt8XdtmQcK+89QfaL/G/CAtm4eTYFPL1S+PgIT3DWbB0y7bEz7PLKckhE6tizNlCH6zR2uwVL1xPz2ujYQhdSppmpa05S+yB1W9rSh0ZSJKh6KfN63MXlg+t0DboSAmbCy28mf3h2XN65wo3TU1vaRO7TVhoEH1WEr6BS5g4EAPI/tI8h5vJ87jwU9wtqw5zFdlLycQxB15soTUgvrrM5s+9QJQh8ghbitX9axbSnta3JH0lPl2adm90hmjhVgvBNAgCpIGZr5TucSDECjBZfF1g+T0I1NFumk2C1kOCdDSKFtScm+CbP8cxY9ZL5YGsFoWlT6VaRcVMdKW+OKAB3mTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(6512007)(6506007)(26005)(6486002)(86362001)(8936002)(66556008)(66476007)(66946007)(107886003)(2616005)(956004)(6666004)(316002)(5660300002)(110136005)(2906002)(36756003)(83380400001)(52116002)(38100700002)(4326008)(38350700002)(8676002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5BWaxM9B6IR9gcTGeIfRQDJAmkE/Z1NyQvzmd51uP0oDAzp1yXUC1pn0RZf3?=
 =?us-ascii?Q?tkcHgsRsAOMeKLUCqiJ3lliCk5XdCi+l7QEaDF4ZtlP+5pXuZQJzd1O/OxT7?=
 =?us-ascii?Q?XweVVhfdqJD6Yki+DcTzHQD09umliKUXRwFWVhUEZsUCI/1YtJIOGruiYUpf?=
 =?us-ascii?Q?cLmtwjmHk77ZbKCdZN9zV/oxoheJw/BTxsthYYKLxdhYk1ohlaYBALUR6q5E?=
 =?us-ascii?Q?Ndx16wONUp/j5eluDzg/hduWFyC/uC0fi0ZoxVJ5sMWFl5Zo/b2ridN2vOl0?=
 =?us-ascii?Q?x6tqpavSYH/FeBbMhMbFZznbEWg7jdF+o4OGfhhna65Z5UeQl5nl/9ogzzDY?=
 =?us-ascii?Q?anLQ/CS4porOHX0VORRHgZWIdTwBy94RTO8lJXnOon1MDlqPInGz3EGvdYZU?=
 =?us-ascii?Q?i9WsK8C2BdcL7mjokHx5canfLou1IYx0Bu7R4RV2qCD8MhygWZ3j409Ed+2j?=
 =?us-ascii?Q?BIDKE+pg/Tc8nN0oCmmnXuACjgdY4HtQjjbNv7OAH4q0aBifongXY7AYtAAj?=
 =?us-ascii?Q?9MORLSPVxz+vdHc44LguHy+MordLYv/wEGuEIIvDgUYnfELj8nCaQfwDo+ah?=
 =?us-ascii?Q?VYNb4ljcsNhhjkH9qRpQe2OpFw6ZdY8725Ptef3hv/3GF1TTbjoAXEMxolyE?=
 =?us-ascii?Q?N3uniaGHsRkBsWekpGuDv2jKnqEiWJMQj7F5GX9Suj+owYGb936yVA1JzFxn?=
 =?us-ascii?Q?hz+SFPbqs0OvJbZi+uFuX1MYPeLJAEO+xjjN7embcahDi/p0Vp9RURmoGd3w?=
 =?us-ascii?Q?AZhBGgl6IJYKgnb9fo3PiczlcUfc1C5Xa2gQg49A6wuFeMtazi/vsvfykAYx?=
 =?us-ascii?Q?PMrSKrG/TxzmjWxKzfhc6dVN6GOFcWTjcR/AblexTnvx/mbgfcyb9LeWPAt3?=
 =?us-ascii?Q?cFHdkb8dA1GECDMXElcHHdpDREGRErQLnc/my3gTroDIQ99bOtxRnyHhA+Q0?=
 =?us-ascii?Q?7HPdUsN/UnIb5PIKo62rt9acFAcLx8Cse2TstGRHAHYNurII3vyufjoPXFRY?=
 =?us-ascii?Q?X+2kp84yGLoqIIYlNAnVwqd2ChFmNg0Kg1PIM28nFTm4e0isWPnHyMG8phau?=
 =?us-ascii?Q?ycln7CJtg7M7BCKuC1eDfLtPJpRBs2QB/N80iMsNN5pg62XSwbPwnr6AkgVS?=
 =?us-ascii?Q?OXzBSWg1Jd+l4mQ7+Cd09Ewx1zpaPiH2nN8/kvJZz7/trfKxzqQmu4ufPHnH?=
 =?us-ascii?Q?shi4PUFXSD2JfCNts4Auikmb8I5VCb6IXQ82xM097ykyAojsuKkURpCpIrch?=
 =?us-ascii?Q?9J2JDbO0vaMOZDzlYZfwMA2vJh48XWFJUtVwwW4p1Pu6ihuCZvrK+E5rizOd?=
 =?us-ascii?Q?2vob5zHv9RqdR2/WunYQCpaD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f682449-3069-4294-a144-08d9920d5abf
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:00:30.7242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qA08X/2HPxbukceuBN+i0dtWuRqV3ksj6EIzmFeLM+cnJbohh4PWYL0ToZDdC1CKCkaNasu0amrakESuCKt85g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3387
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

This patch fixes the following Coccinelle warning:

drivers/gpu/drm/tegra/submit.c:173:8-15: WARNING \
	opportunity for vmemdup_user
	
Use vmemdup_user rather than duplicating its implementation
This is a little bit restricted to reduce false positives

Signed-off-by: Qing Wang <wangqing@vivo.com>
---
 drivers/gpu/drm/tegra/submit.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index c326984..0b11f1a
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -169,14 +169,9 @@ static void *alloc_copy_user_array(void __user *from, size_t count, size_t size)
 	if (copy_len > 0x4000)
 		return ERR_PTR(-E2BIG);
 
-	data = kvmalloc(copy_len, GFP_KERNEL);
-	if (!data)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(data, from, copy_len)) {
-		kvfree(data);
-		return ERR_PTR(-EFAULT);
-	}
+	data = vmemdup_user(from, copy_len);
+	if (IS_ERR(data))
+		return ERR_PTR(PTR_ERR(data));
 
 	return data;
 }
-- 
2.7.4

