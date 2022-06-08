Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE46543028
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9083610F183;
	Wed,  8 Jun 2022 12:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2090.outbound.protection.outlook.com [40.107.117.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDB510F27E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:21:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dli5e1m2owulYFziVTF/6aC4LJZauxLRibsAumbKaVuhhpmticnKH5YXj0eK/5nFsX97pOa03l33Q8qCG07gHZwahoazGJT9GaQBy63q84KiCh0nvm4kq9wjbcIkTYPzw+4Bp3I87t4yDIVYJfs3fWbILTi++s6r71fPYt6imudXaZiouYWrvqpXQaiFvarK5eGCuzZ1vcmO2n1wzSbFk8srKGzwIuQfFy5tEjgg244lynvxU8UdwQKpk6rAjfbIfD33bQH7V06YLE7rPgltjdFC8UVLCvSCYonSDj9CRgcs8MPqjkp/0cJwuPoYI4KOT7LLqko0aPzuE0Hg1AXnlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBtzBXpi7o3aXSEzSsgPck3YY0k64isLnLXlSgSko7w=;
 b=QoEfpyI5YGpR2uqZaaUczevvcc7KYx1nBVLyIW+zEFOw9FOE0+hXOHdQD0K4pY++7srENM41nd85tlLo2xJ/frqr/c7Gh2u7kdJjbA17Kc229tRD0BbOyUw20uuGex7LTNsKFIrzGLn51Ru8Iy3oZgJjx1K2ts+tFqGhRO79mNA51mJbrfwY/+hhoXQsZFG6MwPLu9TuYhYEy45Am0H07Fktmxh0Lj2S6xdSSWqDx/xLib9qkSkWbtpMR+YUp4mRY/SRechd6eLgDWmMM68YB6XZbLudCaqRFICMF4TvrtVOYHcjvDMKU30TILSGzmCSrkQ6X2fqJj8lHcb3voaxOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBtzBXpi7o3aXSEzSsgPck3YY0k64isLnLXlSgSko7w=;
 b=iC7lAL8Uaie3jIf6we1vt72h4FN2pUC7QgGmKnHGrtxBZunncpUtg77aaCqcuKLGiFj+8GCu2QkFZXW8QEjZ9oTQgHnMtPmutGjhDQqM+XuuyD2UF4KdgeBHFrN/iI9SioAgj8SV0ulViaeB5kBxCcVAftb5t2sdoN484+4mY70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (20.182.85.142) by
 SG2PR06MB3808.apcprd06.prod.outlook.com (52.132.233.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12; Wed, 8 Jun 2022 12:21:46 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::a92b:6d92:5ad9:febb]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::a92b:6d92:5ad9:febb%9]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 12:21:45 +0000
From: Yihao Han <hanyihao@vivo.com>
To: Helge Deller <deller@gmx.de>, Yihao Han <hanyihao@vivo.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: au1100fb: Check before some function not needed
Date: Wed,  8 Jun 2022 04:43:25 -0700
Message-Id: <20220608114658.37105-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0054.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::23)
 To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f4eb776-0837-4898-c77c-08da49497431
X-MS-TrafficTypeDiagnostic: SG2PR06MB3808:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB38080CD3D805BED2DBDD91FBA2A49@SG2PR06MB3808.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VNKQf6lMdONnslB+YH0a60flU2+V7dY0rbE85uMsU3aLtMnx/vD1NILP6po3WG5AiFmdV4C0V7V7B2XiPD9uQXJ04mfzUadjYzxUB8tiO+j74BrqeDQ1rkt+F1wLb3crk/MxXqSQi2PKNlZdiAbmDO9YoIc3GBgPj8DX48yAIvSOPSjLa9E4aXTY+0PVxuShEdyxPSdXT5XNC8IST4/fa6Y61j2QJ2qcifPrrhlhBX1ZeMyuivpcxA43MV+SBG+qu5cZO1LjxjraUlEM5n1iBzpJV9sMyb6LRl+U1vY7tS8S17az/FmpkEQ/VfQmz1yu36AW0RvXSgCcBGZgthDuxAhcFIoSU7KnhpCJw1z77vEGVn/hnJeS9LNhtv0isk7cHVeCIGtcCxqqMvJW9kjdurUB/StCJYEDefufw0ozOsvBe2+qHe7wlBydFsLFjPtrMcn+Dumd2oPvvzLS+FdcpOAUudU9G3724oIR2EjjouBLBmyZg4dBEI1kJkj9TNsBby7k2IUhGtTomLPWfcZydF2Eg95zsNUbibTNHXK7I7wCnZtrQdARD8p7faS7CpBFG4v5PDAFDn6tNOslM5QlrUmXZJ7UuA1IUQwaTQMCdvRBksEtDpCLdcozOsJ34mbHx7YgU503kNFv6XRtePbAcHQEYSywl8ZXGuoOVXe+qJtdjt8aFwQ/6T+5rro2GtKE9LBDs+Y4I5VCHz47O4mayg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4173.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(2616005)(1076003)(6506007)(8936002)(36756003)(26005)(5660300002)(52116002)(6512007)(66556008)(6666004)(66476007)(66946007)(8676002)(186003)(38100700002)(38350700002)(2906002)(508600001)(83380400001)(110136005)(86362001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CXy1yzpqx3p+7bMI7giFataw65WvLWQCBRrkXb+Hbs6zbQiYV70RpOLbsaeP?=
 =?us-ascii?Q?UnWku0xPr17c7h0lEDBr4+ksUzTIeeimYJsjy5pXVKgCi5NyP5mmO5ybvJz8?=
 =?us-ascii?Q?mZQ1cJA1igeaiUGx5+xqMspLKiXyPCxzYhMhIzU87buz8UydgSotcqLl7QMx?=
 =?us-ascii?Q?dFbmfUswFnT6rTyL5z4mQxNcYWKXJTrb2DvubeZUzxic4bVpswk9XgAsoKtN?=
 =?us-ascii?Q?mFikEOYQ6JM4MylpFA254ByKSh8D51ianvv7CRx8/WgJpKDh3FPl7bh465Cv?=
 =?us-ascii?Q?cvOf1XB8uEAh7m5cFnlyARW2K7eJKVb1jdwUDsobvjxeharilUf9K64ZXSvV?=
 =?us-ascii?Q?4Y0OeQAYKhx6KaP1+//sedzi1pUSp8uWc6NllHTURg/pIRyB/NMQmUqxTIAg?=
 =?us-ascii?Q?s38MWLA/acMvUeOsaKAcnJ01HLUSbjinbD9d7C7atLfS9dOo4+WIJ+x46IRe?=
 =?us-ascii?Q?/zuLzKDrd9L5j1kXbndvCgy0+Z8KIo0T66OBj3oHJwZrD49OjIO2Vlrz0LzC?=
 =?us-ascii?Q?umJFVSypSCrZ+DipZBEZPK/JTy9FpzYYkeZ4qda91Yc99ZnX3bHJrCvYuapz?=
 =?us-ascii?Q?7cUXT8dCvSjEkCjvgowpRL8MiqN1AeNXp2kOTsV0nU3uMFjtBI1QsIdvigqE?=
 =?us-ascii?Q?ppe1C9nnuW7IqWPtI599lvcWLqZs6TX3uvLRV6uC7ZfOg1KBkitAKGQ/ZLv5?=
 =?us-ascii?Q?ojNawzl1ymkXdR5oyzPy33Q+6k11/8OjPYAkyrpO2PFUWEpdSy0l9FHhsyGZ?=
 =?us-ascii?Q?l2XJoa8Y6IaHT5Jimd0HwdYYgrTD0VSmKji3nJlxBsXESeyuHdJ6zkn7CAU5?=
 =?us-ascii?Q?VN55bjZDVrxeoJ9PRQpZIQ9FSf8ujreKSvE/ya0dHovTReFnaKsI7mMZzZF8?=
 =?us-ascii?Q?vzWk3b8+SrjYo5VtnjbGOMgRkIIl/P7cHbDFU1rMp+MZtiQOLSQX3RrTncAj?=
 =?us-ascii?Q?hRZlhHNPgBmeq9zPlUX/YxdDXKyeQRvV0Wh9J/c6OdzIPDi+AG7JdnNlBkwP?=
 =?us-ascii?Q?R4IQmnfPUIUuz7BAiaIMWz270in4E9Tm9CuTnu0xB8dL8iy4aH3nX/v38Vyn?=
 =?us-ascii?Q?Vw1PJ3gaT1EuiLPfkci4+YHUB/O3qRCvx4JVF/6EEeoxVvp4/Cmvvve/uEr2?=
 =?us-ascii?Q?MSxCB02OeXqfT/qw6geZ2hCliCmGK3q1Rk0ER8t/xDEKXKSJbiLb2XkjQaqY?=
 =?us-ascii?Q?16+VBHVk7jaK4Pfu6ydGBAso+ikmF1LMCHruWtQRXVrWNhqY1vkhzxv00pL3?=
 =?us-ascii?Q?jUfZSMF1G5o4ZPaBZvhcn5HShX7v79fAOsBLNLfBQWOxuQRYB3qSEuEgGnZb?=
 =?us-ascii?Q?Io1ra8gUDlfXHjhgzA/6TQ/efMDPf61dC435xEimr6vKbyESm35ZIRrcGe+d?=
 =?us-ascii?Q?uzOX1WH06wgS6Yt/MqQBjFvcKkn2rdj4DPyRqyz/McIccbTDCBrLgoJC2zvn?=
 =?us-ascii?Q?Uw3+AeZwXqwugqvi72Xof33xGtnDYfdkHbqR1TcmhSHj0Zzn8DJZJjPlaH6t?=
 =?us-ascii?Q?RN67CsTrFEeL3+Jv0Dmvo3jisO7hnheQurk50KvTSrVom90CBQrj9H+EdP5s?=
 =?us-ascii?Q?MdNS8APtdnhCHpZQKAYJNPynBjssARm32dArUuvbFsZBv9qUZ/jWuDcUCW2E?=
 =?us-ascii?Q?9O2g0ogDAX/GJgPKQaBYrHvbFZ9lQY8JI5GPUb50B5oIAc0URcfPq8RH9NTF?=
 =?us-ascii?Q?517wf2K3btTmpFea7ooYVRQAIGCHF7jTCTRmaCINd4vJHaQxQDgEDkP0hS22?=
 =?us-ascii?Q?zM17SLLq+w=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4eb776-0837-4898-c77c-08da49497431
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 12:21:45.9080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdbQWFrY5uTKm7Rv7cMl4cRlFvvyP5R53w2xYLyxId123p8xnjzcEw2jqNkkkbnHMd32zopdfzsDK+UHbug11w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3808
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

clk_disable() already checks the clk ptr using IS_ERR_OR_NULL(clk)
and clk_enable() checks the clk ptr using !clk, so there is no
need to check clk ptr again before calling them.

Signed-off-by: Yihao Han <hanyihao@vivo.com>
---
 drivers/video/fbdev/au1100fb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 52f731a61482..519313b8bb00 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -560,8 +560,7 @@ int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
 	/* Blank the LCD */
 	au1100fb_fb_blank(VESA_POWERDOWN, &fbdev->info);
 
-	if (fbdev->lcdclk)
-		clk_disable(fbdev->lcdclk);
+	clk_disable(fbdev->lcdclk);
 
 	memcpy(&fbregs, fbdev->regs, sizeof(struct au1100fb_regs));
 
@@ -577,8 +576,7 @@ int au1100fb_drv_resume(struct platform_device *dev)
 
 	memcpy(fbdev->regs, &fbregs, sizeof(struct au1100fb_regs));
 
-	if (fbdev->lcdclk)
-		clk_enable(fbdev->lcdclk);
+	clk_enable(fbdev->lcdclk);
 
 	/* Unblank the LCD */
 	au1100fb_fb_blank(VESA_NO_BLANKING, &fbdev->info);
-- 
2.17.1

