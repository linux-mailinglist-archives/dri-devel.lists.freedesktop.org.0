Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EF5341308
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 03:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF14A6E321;
	Fri, 19 Mar 2021 02:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2137.outbound.protection.outlook.com [40.107.94.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D606E321
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:37:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yt4G9YYM1Sn6qgQqfvs+kikADC84r9uZGGuc4+T+DOwFqDoM8r2FgWsJmtAvX3fOghGl3MAyle0PET4LF1FC13O+yfdV6uvF3jb4zxVjplYL3/lqYHwKcBi8AV3QfKv2PXg/YX7q1i580/koLtbzoxBubRKNroCiRCUNyMKpVFfq+8INZjdpED1Bjoddzu6X1C/Xp8XWcqRc4qiQTF9gnRzEqzuYdOIOKUaf4/aAaavuH6d4LIvx36ql50hXYeO45a1RhQrHVWT3bW1Hchu/gMYzL63G/UUFkMJFrqWkWfTcyccQajetth/Wy8ivlSrwJz1e96HxWRm+U7ggDYBZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4WKA+YNRzBoG6SR2F+3Bes3gnhf1zBvtj9oDjXg+g4=;
 b=UKn+yZhQPWYaSWq5jtiPgh1uM50nAHw3iPPD7HNByzyxfvB3qgG6BPCtXchM2MFrbf8fWOzOBAS/HfKr1eXeFWTFJOsoYQHNOCc2N9wzKpweTOFbqa2/p+xzeqn+XVDTOOBwSJxwPsUyVGQf+/2oXiS4uSrO2zMcOWKtfCuIME09iqNaXEOa94mjUJJd9hP0rGjJJyB/wmcmT2isdtnb/v7pyEE5PIG1WhxyU1f8qTsMyIRigRKGJPKLddsPrauIjyA2dNazWrUVL8SpynxIiyDoR77+/9sQpWiXxZCIHjQjh8WTyFW/OKHZQE64BdLsip9HfzLYfLxtJHw/XdBVrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4WKA+YNRzBoG6SR2F+3Bes3gnhf1zBvtj9oDjXg+g4=;
 b=x8Ldv5jDL45AdPUisIOtF44rba0SUesqMzlXIzC8UmE0ANYvb6ZBz3sSOEjog+X2kN73Qoxi18BJB0Ny04hcXbkWju//wq3IIEd0eNiDdkepRxhcGqAaZ0Skrj/eifrVY5EQr1PO1jI8t5W9Z7hqm/ChiJvvd4NGd+x3nrRT8Y0=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4277.namprd04.prod.outlook.com (2603:10b6:a03::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Fri, 19 Mar 2021 02:37:09 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 02:37:09 +0000
Date: Fri, 19 Mar 2021 10:37:02 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v5 2/5] drm/bridge: anx7625: fix not correct return value
Message-ID: <2295557fc68b89505e18e11fe079c7df361153e8.1616071250.git.xji@analogixsemi.com>
References: <cover.1616071250.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1616071250.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR02CA0197.apcprd02.prod.outlook.com
 (2603:1096:201:21::33) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0197.apcprd02.prod.outlook.com (2603:1096:201:21::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 02:37:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2a7b84e-93d9-4c78-7736-08d8ea7fe435
X-MS-TrafficTypeDiagnostic: BYAPR04MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB42778C7F42F5ED48563EFCF7C7689@BYAPR04MB4277.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CB7jNRuLVF7E8r8eUMgO0hUn3JRBHnDpuluVTThboHnQ+TbDSxqu02HkKnED+2N3qkN3XKFjWUB1yPJcnzytn5lnXiQiu/prQwjUXYjRZzrkjiNWtuWmOYW0hiP+o71ahtVS8TTRl6EZ9k9AZZRaXPisrtXqAm+b6Ixyihm1JKQJRK5d0lpVcpdtNh1d9/OKGngDdHky6VbcA0QpoRP3Jy1+6dhV4ZZ2747tGai27M3KzK8yr1nSMAkgtZeJhVTTz5Tzl4E7iPMceuBfGT+R+AN79QDzVhDb4EmSyXFTU8X0k2FxPiK5EqeFoXmtaZ5UoAhY/OgUCwKlYzQVWIC6bjjM1RZELSuNF6sg0WeAcwDnqGv4QPzBJZqsnu7F4tfsmc+R+KR9IUtZJ1i27cuHFMK6VzB3B/uM5l2Wgo6WF+0s+LtfPbf4zuhw2PvhCfwLQpz+BGUS0QdSMk/VoWD6K8U6UAivN2YpOJTDkAixcWH90qbWQENCm0NpSuyFOrvvTT4FGOTHNYUSJLRnweCcLNSaQYdVHJHRoGduYLc0iAYPGqOCuYzzsgQ0TxwEViTgtFYzeLH18+V9zaFHE6ljl52oOw+G53dlQzF9hpn4sgShJbnvAFpO1Vq9TJ9b/h7zI+IberZhCqgHsfra7KsUvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(396003)(39840400004)(346002)(376002)(956004)(2906002)(8676002)(6496006)(110136005)(186003)(66556008)(55236004)(6486002)(52116002)(8936002)(26005)(86362001)(316002)(4326008)(83380400001)(66476007)(54906003)(66946007)(6666004)(36756003)(7416002)(4744005)(478600001)(16526019)(2616005)(5660300002)(38100700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ozF6FyR18Rfsrs/w/N69HvpTX82KFTugXohZNijQlHA9NvZIPoFUxTXVNlds?=
 =?us-ascii?Q?k5lmVvxFLty8gJ4U2A2gcteBHFtNraf6cZIAM7pf5w14VnuI1ArT7px9n+Sq?=
 =?us-ascii?Q?tggZCwUyR70AJ3nr3bKzz9AYgcmkpM2V5skLOKgS2NdiVKq60E3Et2J8lHOx?=
 =?us-ascii?Q?TyXGogB80xUnit9ya+7DM07GcZRMk64WWVEPihebDslCYHeMcdtFYkRYoOrC?=
 =?us-ascii?Q?mHSZ+J1vGgkKducfnPj/1gt91F5YfUiM71mhDlRbe/BbKmHdJy/zisJai8KO?=
 =?us-ascii?Q?G+TX2epefULagcToyiAksFvEv68CLGN+dtomsxcGos+glCkFZOWijBF0BvhA?=
 =?us-ascii?Q?WRGAT215U/TWXn60OvL7ar+ekoJD0PgbIk+436iypNC7TD0vZ8OObm2UVviJ?=
 =?us-ascii?Q?8erIOaY8xNW3lDEWmhL3RizvrEMZAGi4u6N5SO5+fsml5pUuunwMKkjMBz+T?=
 =?us-ascii?Q?qp5jdfHrIY6g8NnUlyD72Dh6dJnGsl9JXPIYhQWncT86mvlhdbu0b5mXgDZV?=
 =?us-ascii?Q?owprStnGtTNGyZW8T/V+oXI+m5EFv79sP+5Bfigo+enCmW4xgcHu7q7ueTon?=
 =?us-ascii?Q?xQf7S+uKFhFX0buBBK/0JHqCbK/RjEWWtt3MMiw52g8NWoxUH0aSjt0MjCrA?=
 =?us-ascii?Q?yaxBHUd2snEtjpU/KsPbREZxv7WQmbr+lid5Cg/n6Cpo5bDNPv0ZyNcQTCsl?=
 =?us-ascii?Q?6nHY7fT7d9GMLBHw5lxGCBGAqK5lSd+BIsYEvVguN+2nbgOJazUgrR2X0leL?=
 =?us-ascii?Q?IZjhNFM56c25UZvhq4/TiQPc+WVgdUEhfViuV5+gWpXp+iKGeBI0UFLWsRk1?=
 =?us-ascii?Q?Gx78XdQdaxhyBwLYZXplkOr4Y5GoJRn3AKAScMS3MzAouse4HC3eHFY50q9K?=
 =?us-ascii?Q?mDb12C8TkN31ONBqRXXqbNZrcAlxEkFSVFEVeU2j1DJluaxPwp8NTGxv3nHt?=
 =?us-ascii?Q?uwDFaSODv3YVgNMa5qj2JWo5oPy66+Y5T8QCnS6DQ45aN5UvCefexBxCVorE?=
 =?us-ascii?Q?xZ0YyPdfnq6q7T9K4+0w69X2TwtY+1Mm1DidoNyB+pPxb67KA1JUMcfxCnbV?=
 =?us-ascii?Q?AFporh9f8g/Hz62F4nUo8lLNBvKgDWr1HZnMoJvKyUKgVLbZxlVnkxGVnrQC?=
 =?us-ascii?Q?Tn8aHr4NWkrGHEdH8lYD7oE2WOHnP0XdI/xKSYNiuhXvKP2bfNTq05SaVYhB?=
 =?us-ascii?Q?xkeJmzOWvS/qv2p9LhN2ropfDLCGmxOsm6N2AMxEkFv+qhPn9Klgm73etFyV?=
 =?us-ascii?Q?0RZQEr82b78kfRQpXYf3ADZDRWtorfCkbVGnIu0se1kJ3lQLtfOGkvFgMyPL?=
 =?us-ascii?Q?a5bStve/tKZms/8PL2Db6jID?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a7b84e-93d9-4c78-7736-08d8ea7fe435
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 02:37:09.1554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/+SJrF76kh3s7qZvWy0YQ1yo/mOM+IAYIVmZAIc4BWTpkQzllXTT5Xg0IuXHlXVdCP+yx60UAWNFxHeIg02Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4277
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
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sheng Pan <span@analogixsemi.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At some time, the original code may return non zero value, force return 0
if operation finished.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 65cc059..04536cc 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -189,10 +189,10 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
 			       AP_AUX_CTRL_STATUS);
 	if (val < 0 || (val & 0x0F)) {
 		DRM_DEV_ERROR(dev, "aux status %02x\n", val);
-		val = -EIO;
+		return -EIO;
 	}
 
-	return val;
+	return 0;
 }
 
 static int anx7625_video_mute_control(struct anx7625_data *ctx,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
