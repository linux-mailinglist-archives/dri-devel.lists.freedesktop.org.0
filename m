Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B99144B606E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 02:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8798810E3DA;
	Tue, 15 Feb 2022 01:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2117.outbound.protection.outlook.com [40.107.255.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D4310E3C5;
 Tue, 15 Feb 2022 01:56:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUoDun5NGiSjISY5ivuzLbm1D8sOs5FrFwgK/p4e/DGTha5s5ocViPpjXVm2CEUxvnClstfGYYc2fyZywt+6Quuu64sJYJwx3Ln0tQxLjoBJkpbeLJThRenVjq9xXrSq4KRi65Jw2c4y9LCEbOspEam9u7oPhD29GzBkvBvv5oV5DuFlwFrnUxi8F1D6jMJiK4CN1DdF04nGCtCwrQ7QsR20azykkxkhq8AjG35eL+4ywnPCg239BhR7931qPpH5VLyu0mcP1RHD2nhMt9mGW4pbWyHXd3t9msi4DqawyZCZrlVkR2g+7Ozt/l0ev1KtF+JB+ZWnlQNucicATXHKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGZeuYGXyeAgcClI3wwE48MNOwGa8NGTXiURAfe/zbQ=;
 b=CE8ljgke7KO+nqn/dQu5NmRVl7EFnnOpcR7/4yo929YshXt12HRWiZG+NX5wW1+t1VQvDvqFwKnTKngkd5Y3Lxdcgw/uchZs5Qv0b+K0AZu+e53vlgBusb8BeYoSolkZ98pASlt7PgRYhQglnfKxg7ZwRAV6A3aSvEU1hCweYHTaBhVDU57PNzBDXemM1Et1Bs+CDwlnZKvFiygsy3Iz6HjhBZCWjHszmybasEFTfp2UivGVoY45Jt+1xm7v8FKMw+iTyjXD8uGVgbcgPSskrKcdk+Gb4dTyP3qzgMUaNsy33XPDiznjKEF8qYhVVeefkX0c4UDhAM/gfqDCRtxbCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGZeuYGXyeAgcClI3wwE48MNOwGa8NGTXiURAfe/zbQ=;
 b=iANhwTSzcDZNQAh46sy8MA5t0Tm7sOrPbpiotfOcNFxSh/5wKaN/BuHbPbneRlKd4PT4Gbudt2P4bW2Z+Ra4Ixd6QUJLTHrOCZPQgsikRrZyo/1rqahCcnVOIvKb2A9pZNlepDaZdOHVDZlBxoN4+lF762dDm4Kr+cqlv4oQFVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by HK0PR06MB2771.apcprd06.prod.outlook.com (2603:1096:203:58::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 01:56:57 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:56:56 +0000
From: Qing Wang <wangqing@vivo.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
 dm-devel@redhat.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH V3 9/13] media: si21xx: use time_is_before_jiffies() instead
 of open coding it
Date: Mon, 14 Feb 2022 17:55:46 -0800
Message-Id: <1644890154-64915-10-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eca22f0-7a4d-40e8-7914-08d9f026712e
X-MS-TrafficTypeDiagnostic: HK0PR06MB2771:EE_
X-Microsoft-Antispam-PRVS: <HK0PR06MB277188E6101087AF9235D086BD349@HK0PR06MB2771.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zcr4PVFb8yBmpl3ocaDvIF+2MN9J/vXB/CtUB6IOeyqRFToL+6Sv+aHpZnulkJjDqw8mT4QFXz2MZMt7vlO6lHXcEmTgPHn9mR0fIIkozVUMaNaKsgCsrWlDjBt6pvZHIefPbwWFVRRJkc6LnkoyDC337SyEZTrP7bXKuIRY3CJ6obcoC/cHd/Uopx+nVj3hBbKZblY7J/7/0rNV9xJvXHezWiv4IX8ov+WjqLzVAfU7jQi4tjRXAaQ4t7YyQ81aOdePBvy+Pgn/pNIrPP/j2FB6sDwffbv6JjEIYUVDWVU7YL7pfoLwlm5Uwq5/fev9FkauDwN4F7vInplEthZlAMGTbhMbwHLdkdoqdI93rPB40eB60pGo8oI6rgtky92Co9cEt0cbPNbHo1fl4ivKSQmIdEWuEwCh4wDE3DSiZvVkQHcxBo7JcFo0v1LzY/xsTlgX7QZkIvYrUHXDDR0XN4wY68zGamgkeCFI0abyV5157K/wtIoqdCFvjtJx6a2fvH9puGR/jDzOpl9qzV6EbZY/WkxCe7xi9hfZNZizMAViGwUtSp1+z/6PA/+MOoKriv0b1K9aiZnEVS9YDsNZDidZO3ws0YJLrQxQ+7QtE0xmnQA8e8W5juxb88RAUHAaxTok9ZxLfxiYEnhaTEvPA1F2Vo4azT7EGHwWl5YX52Bxn4oD60zEC3ycTaqC+2/Mzy6GdTgMGt+hgHM/JiuQ9Y6juTsuM10f5oRJugatg+I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(8936002)(83380400001)(26005)(186003)(6486002)(508600001)(107886003)(5660300002)(4744005)(2906002)(7416002)(7406005)(921005)(110136005)(316002)(66476007)(8676002)(36756003)(66946007)(4326008)(66556008)(6506007)(6512007)(52116002)(86362001)(2616005)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kvvvXYfY3SAz0fQ9bdPKkWwlseYrmsnnNXiKA6wvTFgdPbGpEpATtSEhOssr?=
 =?us-ascii?Q?QlRASukWmlcLYqBRGOFNNNK4w/V+ngXI1xag6H8zRzDxQrPUrjZ9W6MnNg3q?=
 =?us-ascii?Q?pFbtJcXzspJsA2abO+qTZMQG9SIQW0qn8Ne0SD4UM0x4ciWf2bDZSFwbdfXh?=
 =?us-ascii?Q?cs2PTH+5miWioUgV/xyqs7Va1FhtjT7sCq3cjKOipQ08RJ6TbapWnsAAj5uE?=
 =?us-ascii?Q?2EILgNocOgNkv35E06TC8KMCPyTlALhakB65xvyMqnR14gZVJzbxNIG4/xRS?=
 =?us-ascii?Q?/zGEBY9t9C0lBRHliJTokvqbnXNa6SCePt3wzejdqotwYiNwXk+cTLluVXPl?=
 =?us-ascii?Q?OQr+4QI1bofV9PVUDcKe+6QLCPcvEi3L6oxhi7R6/aij6Wbz2nz/1hGmW5Mp?=
 =?us-ascii?Q?kOfk3BDjRmjvLpQUMAbX/dhXwcTmFTyAAWvvEjJTjhnY8IbXYUBymb+8no7f?=
 =?us-ascii?Q?JEJcv4RMScCJ6KDoy6IbO+DobeBeACuMVXQ3uDH1ugN0C76r3DtFfUfaCG7U?=
 =?us-ascii?Q?3ECBaxjx+3VNKEU62+7QK3EdpuQOX8xVM2YRf4A4tCa5QlZm0vEETiRN+aTM?=
 =?us-ascii?Q?Ssp6Hsyq99dcLxRo2VCewp1/29iGwgIpdLgI+Rlx/wlBj0byLtp8SQKf6pcg?=
 =?us-ascii?Q?2GIVADcrpKH4bP2miyD45/KFg4Own0OY/iGh9aPKp0XR2dXACaMcnhs3UoTD?=
 =?us-ascii?Q?CcRDW8SW2bfEpr6M1T04LSPUf5qIq0k6GMaaKZDiwq/U9Moyl0Y2Uq1Uk/Ei?=
 =?us-ascii?Q?GhLUImQMqvU4whOPH9rj+4D+ZCdCdxOjm0X6wsEhLhM/+J2nPDlr3NPp7bRV?=
 =?us-ascii?Q?2FcTbVjYmn15s7Bdn6GKP8ZhOCuQ9/BdGCsGtImuNuCrmnYeFvi20PNhXwmV?=
 =?us-ascii?Q?3nPQ/ArLuuFuSsY0AlMRmHrw5unISCLDGfOJecHNr3pBv3qyFr8Mx2SbH42d?=
 =?us-ascii?Q?eYfEiFjZpmp9FzOhh8HdTPy0US5tt4Y9HtDxjy2G1TK9N6sUgfdZ2q21bsoo?=
 =?us-ascii?Q?RKseRe/BukyoibNAP0jclUFoSmIarhuBnp1HIlVvM9JkJgsCmEV7ZXG/3E7v?=
 =?us-ascii?Q?QFzkPKoLQl+U+I5cWR1wJ2tN4cNoGxQIPGUE2srDyezmTx3XYlrtexurw4I0?=
 =?us-ascii?Q?yVE2ZL8JRpVqjRSa0qlARtkcrySi6QURVfSAPvJY4LpYng4OHsUH1P95gkDb?=
 =?us-ascii?Q?6/9uS4aZPGpgppkcSf7myWhFfbF/pHMXDp8Y/yTBWHhXfem09LowM6/ZP4kO?=
 =?us-ascii?Q?8JgRLFh9QPaoiM8eDMnaC9Ep5D/MEAIwx509TTWswmx+UUjQZD025Z5LMpuK?=
 =?us-ascii?Q?ksVCJGc+j4tBioHZJjt6cGWAF3M5WQn7bstF4eoGWO/8AvzKWQbavaFYCn19?=
 =?us-ascii?Q?le+LZWVf47LShfnlJcMUI7Eiow7kqEaC4kSb9A1zT4TQE6C+qH90Ol421q5I?=
 =?us-ascii?Q?Q3NLK7IQm3biXnc7UCJNPhOn72OYI1wFGJTw2Zg3rc66lQ87OTURCmAUKlRd?=
 =?us-ascii?Q?BKwzuH9yL3ux6fS7DyC5O3m5ynichBH7gd/GsGSi9v8mbYYHiX3DfzZMjGxl?=
 =?us-ascii?Q?FN3nTH+szzB7dkCduacK0SzjkGcNqxQ6/VK40kSSGXROCwAM5PxX/JSqx+L1?=
 =?us-ascii?Q?BIqCa9hQvYDnHEU6b9AXadA=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eca22f0-7a4d-40e8-7914-08d9f026712e
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 01:56:55.0742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdL8lKhc7PkTAFDvkPlXyy4TydiXOxyB804HOKylwE/yyvZufo6UIyoDiyPNIrvNv8DSmBi8AE5pkUsS+m8X6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2771
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Qing <wangqing@vivo.com>

Use the helper function time_is_{before,after}_jiffies() to improve
code readability.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/media/dvb-frontends/si21xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/si21xx.c b/drivers/media/dvb-frontends/si21xx.c
index 001b235..1c6cf76
--- a/drivers/media/dvb-frontends/si21xx.c
+++ b/drivers/media/dvb-frontends/si21xx.c
@@ -336,7 +336,7 @@ static int si21xx_wait_diseqc_idle(struct si21xx_state *state, int timeout)
 	dprintk("%s\n", __func__);
 
 	while ((si21_readreg(state, LNB_CTRL_REG_1) & 0x8) == 8) {
-		if (jiffies - start > timeout) {
+		if (time_is_before_jiffies(start + timeout)) {
 			dprintk("%s: timeout!!\n", __func__);
 			return -ETIMEDOUT;
 		}
-- 
2.7.4

