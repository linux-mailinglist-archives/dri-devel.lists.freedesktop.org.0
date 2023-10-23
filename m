Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CAA7D3A38
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 17:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1AC10E20D;
	Mon, 23 Oct 2023 15:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03olkn20810.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::810])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BAE10E208
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:51:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJY/ZXDVDjvL69aFDQu398xptRevL6Fo3SKLmwVYnLvmRXnvfyNFsO6NVuQp33aA5SGSqukju2/0PbRGZy3xMJLlCHjEvCu2gTWvFXfR9+liOBAzF4Ft3Pic5o3wNU3Rwg9z5UQcSXekb1q/hBOEHxVjughGCeTs0QQ9BxsiZzXspOpp5QTlE14/oi/2cL+NyDRx4Nh0IBbKg0KhHeaH7tNlRaM/mIlHG6co7hjrR8VoMGm74od3aRxFzT4VxEKHOSIciEIMFpBrAKiT/iI61phHXfONKqWaxUYNBe787WGPCVPJve6B76iuBqfrS3hpEZ0tyrspyspZSykkEV8k2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2Opo2h+vKi2Wvz37ryT6uuEdVmLmJMtUn2eEgH4vX8=;
 b=S5gdDRJFPXvPiNTGHBMdOoh7TpFUeWTcfRlSCYdmzvCtcyKmL823Sd0xQwum6+jw5Q6OatUzj4pRd/GYbWqxGL55Ki6sbcHh8CuQakEbboPQ6PROtbPJvKWXnNb/Z4mcG12g4c++kxFREm+ro2h5Upbgbs+1isUv6c/UBQMZb7doBfo3W8tiksD0smo9kYgZi7QM5BQA2ksmB4jdnyD3kCUXsap0PvdlGkT4CQ0ScF4688Zk9hlj8t6jRiJ4pKK0aIoRU8g4iqREwgymquWEMR1WLMopyeTc9BU7t/7fIFB3XUfznlq9vqBnWCZ+I3IEbN5ST58pyLew36yP0hko1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2Opo2h+vKi2Wvz37ryT6uuEdVmLmJMtUn2eEgH4vX8=;
 b=GAvxAgSQ1NEs/FGHlgICV6Y9DmK4ACVnQnl4i9QqxwqMmDdjIQhCoR2Pep7ygm4WqnEVdzfdZ1Zjc89YyumM+fJphGWnsWj+WsgHptcgKFf5cfbzMM/iEw2XezI7j96c0jb7YCjRN7RiYY+HRxdz9M3qX8T76cFXilBwsgKerrs+/urCJauywaKP9Oe5jqLnB5maJeE/Gl+pVZCdthfQa9ldIQXznXlpm7dViBl46i+xaXlh2F8fgr7/vrWXQZcbMZN04l2DqGZiCQBhbuiLTmtCzXtOg9FVwp9eZn0OuPK8D8/HF+sYIoc0lAb1PxQ/LpcDP78aqTKDY7gwHNSMww==
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42a::7)
 by DB8PR10MB3257.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:113::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 14:51:37 +0000
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97]) by DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97%6]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 14:51:37 +0000
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: neil.armstrong@linaro.org
Subject: [RFC] Clean up check for already prepared panel
Date: Mon, 23 Oct 2023 20:21:16 +0530
Message-ID: <DB3PR10MB68352B33759F5DB6CC041C84E8D8A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [MhoxeqolqqPKQt99HjHdK4qA1ODMLGFg]
X-ClientProxiedBy: JNXP275CA0030.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::18)
 To DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:42a::7)
X-Microsoft-Original-Message-ID: <20231023145116.977508-1-yuran.pereira@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR10MB6835:EE_|DB8PR10MB3257:EE_
X-MS-Office365-Filtering-Correlation-Id: f8dc866d-ad50-4e90-2f28-08dbd3d78eba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F2T6j0/XhHSXlvvHLZoniRMEb25HmzAxpYG766zd5y35g1ENgs5HVxtZ2epsdXFqZfAVUEktCbPo2g2b/bru0Uyk6b5yJIimbbpy08Uus//cfXD0UAf4aZoB2ZAOh3g+eBwpsFx/DIyBwODz+yD3fU0GyWz1a680C+EhGpSU9y98CB0Er//93ntWC/OFv9ABwHN0uxcIWpRbJsxFIGsTXSINes6vLpOD9bhLOsXGL2Xc9ZR60E8/vdEUS64qOKQGClesLOeg3v0fKvWnxOtHqQsWONsNnt9cbaz2NlNUtociwcADamy3aa+O7hojqLpeY4AhhX3n8f4VkcyHlfpnh0M9dnJD3yZ6XE7VBWNgEbbuayG/1+BkhPv/JU4u02LP20fr2kLE1joT86u0usWtHDDyYXYbv9fd1n8WMsvoeJfoqd77q8OjC8gaTZ5p39MHRxfFY4SS3xYf98K1GWum+kyIp5UWhT6sAeVKd8IQ34WqKArrpdGQBZm51JMvYQOAadUSkJ0vpX5uJe+DKpWFiIwx1YPjwWpSPlqILUY76zpbDz+MPUkiED23HYRglAEqcj8sfSOl99+wwEXsOkesnwN3AKlCf4F6kAKstI5vl/27CBKTUuLjgnbsJhcdkixa
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nv45ZunlEQDzT7m+lGOoMGeF6lP1GVmgt64RkbzH4s91f76FcG1Ky7tMkZAx?=
 =?us-ascii?Q?Mk7wjSnMmVRAGihnj8gLPyO95Q18Vo0k+zgORSk8HJ9HfiQrm2wd05KJt1gs?=
 =?us-ascii?Q?83QIf8dMTNt7qav655uGGHOAhuKyG3s2/9rz86spYgNgiKtn+oDPfxOF4hG3?=
 =?us-ascii?Q?3lIpUYXvfjQoZoozaHqPz3fU3K2t96++KRdWoajLFOKCrqlokJ6rX36Q6Xq2?=
 =?us-ascii?Q?U0gcmr+mCinHWEIzKLzJ4yysX9Mzq0vxcgpZaCkvmv5U4URsjkD65PARrGMI?=
 =?us-ascii?Q?1FwIY97WyBa2Cn6FVPR+9Gu5t9bM1VGwikHnXIQKorIgSb8PhgIZU37uVvSa?=
 =?us-ascii?Q?dh2Q9wPigqe2F4NJElcoYsvfQxYkv2iTr+11N93BreZeMdWnd3pnA+uk482X?=
 =?us-ascii?Q?LQbcNbv5wBFl0zDSwKsPrevmfSomP2C8XOHCBVePcwjXI7kG4n0BNiQQLFEq?=
 =?us-ascii?Q?bEdi3yo7ATqdPxY1oYbGOVYNMiHpFBLoWpZC1LTrOdXkj4HlJiGcnkgEtqyt?=
 =?us-ascii?Q?qsUM/1eUrI85qir93eFXj6l6X8ymBJ0BkHy7iYzIPNk0TsHn51Ykhm5zgUc5?=
 =?us-ascii?Q?nWzXVDEOt87vKJrX0zKUUeD6gzannmpebirO0hm/deSntEB96yzGg243M4Yf?=
 =?us-ascii?Q?EV9xL/7SiUXlZc/h0d+sJupR1WhJiUkpVvAOKMZlvExOUaMTpXrkDRrL2pWH?=
 =?us-ascii?Q?8O/WpPUjAzm8IeSafrLl7RGtgaw3vw3SyXmO/IA1N6m1V6c1iNiFbJssMDj0?=
 =?us-ascii?Q?nBx6WeYt82DKGoz0QDEe5mKIFfTaXsVsk7FQH7VE/0C2qRmSQPKx76yE2DTk?=
 =?us-ascii?Q?quTzZnsFCIBB9bY52PHh0xjKJrB+QIppbi/tTiK3q45sjuUryZRuLEvbUju2?=
 =?us-ascii?Q?I6biMmbn68/2/mAyEANvFp9hbfB2IO//7qdTvrH3bJ+UORTSW55Pj9a8APx/?=
 =?us-ascii?Q?YBOrydh2pPoo5DSQvScEJxoA/U7wwHDxLJkc1kH0xWKqTFDr6rY0IOARxONS?=
 =?us-ascii?Q?KpaYe4K/ydtcY1vCC5r4DPsA1XYvslQpdU2u8SzL43pKQhsTaFAeFGHQFD/e?=
 =?us-ascii?Q?O387pfI7ef8C2ho7VkChuGVVkZxc+Ic1kgPvWa+2+iJIFuGpWf4MhUSFVZI3?=
 =?us-ascii?Q?KJfQuM5OhxAsZK6M3XQnmWvZmOPBpgIgXeO4ivQve4zYrWBNpzNOyovDDzbr?=
 =?us-ascii?Q?qTWdSbPb4i+1ze6/Jri5iiey2hHIYNn9s+dGosbAGiBC/vJ/Zp5TQedu9Zw?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f8dc866d-ad50-4e90-2f28-08dbd3d78eba
X-MS-Exchange-CrossTenant-AuthSource: DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 14:51:37.5072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3257
X-Mailman-Approved-At: Mon, 23 Oct 2023 15:00:21 +0000
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
Cc: sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 Yuran Pereira <yuran.pereira@hotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the core function drm_panel_prepare already checks if the
panel is prepared, we can remove this duplicate check from tm5p5_nt35596_prepare
which acts as a no-op. As suggested in the GPU TODO [1]

[1] https://docs.kernel.org/gpu/todo.html#clean-up-checks-for-already-prepared-enabled-in-panels

Suggested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
---
 drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
index 075a7af81eff..af83451b3374 100644
--- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
+++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
@@ -112,9 +112,6 @@ static int tm5p5_nt35596_prepare(struct drm_panel *panel)
 	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable regulators: %d\n", ret);
@@ -132,7 +129,6 @@ static int tm5p5_nt35596_prepare(struct drm_panel *panel)
 		return ret;
 	}
 
-	ctx->prepared = true;
 	return 0;
 }
 
-- 
2.25.1

