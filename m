Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F12643175D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 13:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78396E9DE;
	Mon, 18 Oct 2021 11:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310124.outbound.protection.outlook.com [40.107.131.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD136E9DE;
 Mon, 18 Oct 2021 11:31:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsItcok9o1/NIT7VeDHMldOTZUz9pRKvkiCxmjmZlEMM9NxVv4/+OKbD6pNIDnAjGJkasbV1Q5cCSlicLwNMJFo84toigXwNE2egbuCaPWWoOD8pClEiBp9mlZmRiogtOQsl4G0fmsNDuEuROdxnoyos+3cn47OYzAJSYBqinWKV9XqBI/HMMW7Ib6km9jkd8Qz9VnGrTNiwnB/gKJJFVD3LHTw0rfXQBHJfqFJUb/zcFfCId+YoFy7lbrHGqFIsTXkRwJGTVyuu86Ek5oHW19ww+RCLLC89OzRUKNlfW58PaMf4SCmtscIeLm8gnnQ/za00C7aD2D4ZFA4SzcBuTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dJvIoEXFjtdnuA0nJCH/oNc8e1HCNddQ5goz6ec+m0=;
 b=mflKPRO/CvBO+/xp5POYkySbu49vXxjiJPJHUByDl/iZDq9av9NARLsIcp9Y4IXlTtcMPxWgxw/ajN830FHGRJe3tfkY0zIR1iP9etG7KlOCoFfKhbxPrhMbklos32E33BIRBt5G5QWD5IK6L5JKU6tWho0z7p49fZJ/FP/SEFCsn9P6Kt5VkSzP6pqHlGqunx64MmMspguMI/tIoG53WwFP4IlODHhDUNYuAg9ibBrXJu3Ffq8HzirKj90MUvpJsk8UQE9PCx4hVB81Auhw+AkDmGprPl7LSmLbujDh3/3XNrjOACswCotiGyDyVfK94tMxa0Hq+0IWAGtjWYOOHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dJvIoEXFjtdnuA0nJCH/oNc8e1HCNddQ5goz6ec+m0=;
 b=nRryw/fAnHDhcan/OqgqS8zQjwhRbcRWBmDQmmu1rmFG4C76RrlJGy8BiTq3ZTniuolDFIrjMCajwkTRT/VaLiFc4dCZZYmnpHbQKcCSitc/xKsAru1Y2yiPIhNnDLbS26Wqjpx1knVpMk+K8sJr13GxtSwLC1R+CeZ9WFE4LBs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3034.apcprd06.prod.outlook.com (2603:1096:100:31::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 11:31:46 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 11:31:46 +0000
From: Qing Wang <wangqing@vivo.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Qing Wang <wangqing@vivo.com>
Subject: [PATCH V2] gpu: drm: nouveau: switch over to vmemdup_user()
Date: Mon, 18 Oct 2021 04:31:39 -0700
Message-Id: <1634556699-38892-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0022.apcprd03.prod.outlook.com
 (2603:1096:202::32) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.189) by
 HK2PR0302CA0022.apcprd03.prod.outlook.com (2603:1096:202::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4628.13 via Frontend Transport; Mon, 18 Oct 2021 11:31:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bafa1aa-5d68-45f7-cae1-08d9922ade10
X-MS-TrafficTypeDiagnostic: SL2PR06MB3034:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB30348A66D32E30ACE6F58AA8BDBC9@SL2PR06MB3034.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2+8I1tkH7PD+ASVvif1xRbICpRcLPLadIIq2YM2C9ICm9VWyRfBTk5M2qDOfnWnTYgfQenUXtMnperN7FdTBnrP4DpQsQzuq7AuoHDOLRKTU59qyCNZdcp6oCpctLtbxuJr/1je8u2hX71EIrZrOyPYKluiBRao0xAaKNyBpndj0JWYk2frz8VksIVfnr0u8YdvHWnjW2U1r1vEqfDcrbx+pileALOWA/7Wv1o/ilis/I6FO9CgYA/Al/Wibg3JnzKt5eF3O5g/AFIIYLtgZ6JEV2TUBJFJWDM1qD0a8D7wWZPjsskWVmkQilLbVLxSDpLKM8JOPFXBXW1wgnbaF+jlRo1LKOiY8H8wWsJo01RG/HmSgPwxylXNy+8qfF5TykYrbg96lqBgTUEWRKSFYD3O2woOfcBqYIDz8GUps30BPmyQWDXEylXAPWdUhZTUFL7aHSbvwkan3YNgAk1hRsYNjzV85UJrJoeeMcRhAvHspJGmUciCAKPjXDrjU2ZS3v5qeJmrJ5BsyDljsOl6T08QpaO0jhSFLDeVAdVCwnt1SbR9hfCUhTiRERemJrgzo36tpfvIWxE/IG/e4tcKeN0dvS7/Z7Al9Sqz4N7dL+osDwqq6aO6aM18BOuLY0OHpJhdNV+3bwOlr39FkFn5P4a3oQrIE7ivS9w4xuFxqK+cWlR2OoXE7d4S2J9vQBS+QNNCMvfz+ZDF8iZvHLSQiQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(6486002)(52116002)(8676002)(66476007)(2906002)(6666004)(186003)(6512007)(4326008)(6506007)(26005)(66946007)(66556008)(36756003)(107886003)(316002)(4744005)(83380400001)(956004)(5660300002)(110136005)(2616005)(86362001)(508600001)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1bOh8/DZ4ccHNnuqksAmatepfvBGwCauk7isWH4rZqbSb3kCVLLn4Oolah0o?=
 =?us-ascii?Q?HtqCKuem6VnjX0kS/eMWHGAuw1qy76SBv0Czf/w2yvEiHdnzkXv98viB6+Mo?=
 =?us-ascii?Q?GCXqjPzroVipyryu8158S/YFXO8fBcJaeYSy8Payo5HqpddyAgYU0rOO3hiW?=
 =?us-ascii?Q?Oo5D6R/X0jS18YhZpB8CJ1twhG/WTBlYRR5dd2U5aFiNfF97wRP2zwa5qLXS?=
 =?us-ascii?Q?qvK4cnxh+j8gosfX0nmHp+b/kwXRrXvc6nbTEQBbqjYcDsc5rQILT/vW7Zj5?=
 =?us-ascii?Q?CdmENDTBSUU2IOvjQPApNbLl9WKARFnc59Z/pM5Rrl2T3MqyGooi2VV/YkZb?=
 =?us-ascii?Q?wFNwJEoSVvBECmsiPgmOdNMir0e8MTBTtFYHsQQe+5iiRJEw7hS+Hf5GMxos?=
 =?us-ascii?Q?hfVbRhLS8UyBL7rGWLMn7DePCTnrzIA17Nrn4ey76Hf1EN+YRcnh8d/nH7eu?=
 =?us-ascii?Q?iDixid/btdMswJfEswPk1rPFTulUvf2TcipA29kqM9ThccO9xhWO8xVqnUho?=
 =?us-ascii?Q?OB6DdGXIBBqdUXJjJMJrotVCBTx/GsAcDxb6FzGCe4Zt30TuTF4RXtDJTJjp?=
 =?us-ascii?Q?DN62Sy0jfpDYzP+ZJka9UKOLkGGiJLWqpYWs1leuUqTip4wuEmbItDuVPjM8?=
 =?us-ascii?Q?yflD679hOcUDsc+EESozn34kXbIqtKoH/pgU8v+70j88bgoyRu5CChZINCKb?=
 =?us-ascii?Q?07lHiaCeYDaZ+6qMoZQirgEPSLYCO+BQoT/bdG0kWj+XFVJpnhzagNwZGMto?=
 =?us-ascii?Q?kJt+FxNU1670jgeNEKwJ3XWN/azFmjEDN5Xlq+VCfwm6ynZ9kf98f5Vta2hF?=
 =?us-ascii?Q?bePL4b20v0rZcszb3ilAgRHcuB2EXicMUQxAOezNzCDVK4IucCqLxpz0x9Uk?=
 =?us-ascii?Q?5KMrHCnveodbYOM6EtLNUYjkYvjHDe2nWTUub9biN1zf8r8AdugMpKPCMIlF?=
 =?us-ascii?Q?vlv5aR7VWzl7Agczszw8dGnJqAPDr7j5a+nYdEucKYConFOByMd38bbu6qge?=
 =?us-ascii?Q?peNu4CP8bsUky8kUgrxpQdPsa+zzQYSPOxOPegVSdeUToEVGmvhQL5DBk94e?=
 =?us-ascii?Q?wWDnLGChoa0Fbk/u/Jy1uCzTsy3JtgqoOG/0PFembcL0k2sz3x0Q3YY7MH8b?=
 =?us-ascii?Q?SeQJLlUaKB9US3D9HPPey3HGlb260h74o2Iov3aG3en9n6p3IuCWGWVYeP1G?=
 =?us-ascii?Q?pdsYvx+T8Fyv7clHRwe1NtmeGmcN+PPXFthC9oQJsaToL7LdxaNOXT+qXtjM?=
 =?us-ascii?Q?OJZGXJQ6N/pxJt487hdcw1ufsy9naP75XDFKhtzIDddIKVjV0Iz6WI3Nzn2+?=
 =?us-ascii?Q?xZqqmcDa195yu3Tlac9/mp2ZUp7BrtqpN6/52LJLHRbVbg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bafa1aa-5d68-45f7-cae1-08d9922ade10
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:31:46.3249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/DAyC1qBZ99DR4BwRmBsceSYnn+OrDnZO3xWU01IRLLiUhfbeub3nXDc7+Iqy6SYuoekedHMc+6KxC/BJFm1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3034
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

drivers/gpu/drm/nouveau/nouveau_gem.c:630: WARNING opportunity for vmemdup_user

Use vmemdup_user rather than duplicating its implementation
This is a little bit restricted to reduce false positives

Signed-off-by: Qing Wang <wangqing@vivo.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 8c2ecc2..3fc6959
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -627,14 +627,9 @@ u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
 
 	size *= nmemb;
 
-	mem = kvmalloc(size, GFP_KERNEL);
-	if (!mem)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(mem, userptr, size)) {
-		u_free(mem);
-		return ERR_PTR(-EFAULT);
-	}
+	mem = vmemdup_user(userptr, size);
+	if (IS_ERR(mem))
+		return ERR_CAST(mem);
 
 	return mem;
 }
-- 
2.7.4

