Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BF13415D4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 07:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C682B6E988;
	Fri, 19 Mar 2021 06:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770127.outbound.protection.outlook.com [40.107.77.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581936E988
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 06:33:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5TAJ5pdYcY/TYyNdcut+vIZO84S+/gWK+JUCGC5YHDjNYoiRdBn7q25lc6VQRpdThPyGp1Lx8NZ653dR/ca9toy78DW8TPatavpLy69ZqtWDvioBO4KC5HrgPQvDZNNGkbgyGdaD2y0KRtVtIqHhjwP7bsH9uttp38FdJ8a1BrA3bj52Nl5kP3obWdekH8QB8H+9/xDE1IHRcZhIkU50t6LZFOAX2rNVU/5FfpHdAZWIjgbemyU7ENbgixKmLG5E5FQEPy33KS4s3pLu546RtE0inOShdLuCtxp3dIfwzvT91cQ+J/5I+i3pg03k5JRpWwiracdfQ1JdGse/Wj5MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1sWkhw0jo66GHx+WA9GVn7DV+2NBU0XzoMS8bK3xs0=;
 b=Bm9KJzPI4fDeXCzwHlv1AFUutbd8rWFt51Wz7CA2810fAoo+YSkg7pZW8Uu3ZLI9akFIIOSArlk8bXzyrgKGAgOx8/SFO79LYI1AWH1SeZP7jkHpi1qVRVJjALmW3uO+gv47lCwUYkcQJYBLBQ5kq3FYqJaciy9ffhxf4dIeT2WFiEC896TgxyLEfVZlKcN51VioWC7CmvvohnuAVtKZApXiCQeKxAIEb17fcuFcp+DKD9nsc/rRw0rpnDWSw7X+RzZo5jrbjGYEFVnuWVlQ39VVqYzYy19iPihy1mSLpS9qsnFEvL9iPtgCFpk2vLcpQCuFj9/b/lpeAtz4zdXTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1sWkhw0jo66GHx+WA9GVn7DV+2NBU0XzoMS8bK3xs0=;
 b=ztlNOq0W9ROYyykNpUAOjZHbjp6+nzJX3vNR9bM4oaVTvEWy2uAch7GVa8UvhZsurcOLI1l7r1HHVEn5il9V1pdUGYDwcDilmJwgJKzOo5nu4MfpVulQQ99xPhDJi7+JYfO6RbJQ1Zkuwc2uyt7McVZqndm7hRr1ws/oag487Ds=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4581.namprd04.prod.outlook.com (2603:10b6:a03:15::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 19 Mar
 2021 06:33:34 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 06:33:34 +0000
Date: Fri, 19 Mar 2021 14:33:28 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v6 2/5] drm/bridge: anx7625: fix not correct return value
Message-ID: <ff689dae07ba1440b96f4804468d9c4203d22d68.1616135353.git.xji@analogixsemi.com>
References: <cover.1616135353.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1616135353.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR02CA0222.apcprd02.prod.outlook.com
 (2603:1096:201:20::34) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0222.apcprd02.prod.outlook.com (2603:1096:201:20::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 06:33:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6347149f-2bdd-4732-f221-08d8eaa0eb92
X-MS-TrafficTypeDiagnostic: BYAPR04MB4581:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB4581A7CD05BF895C10A8D5C0C7689@BYAPR04MB4581.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XGNMo6zjF9vQyA5CubAjxfX3mT2Wl2ddaIQ0aRmFML+MKD1Kpe5A4ryXLSjFc5xBDcsjLmWJlj+SnhOlb6JdJUs3xQ/QjF6aeg4AcClE56RfdduU620yaqhhhRD7ZOo8N587idIvz8BuuP3VjbFnzwP1YqO+dZQf2BCJk+wgPhQTXpqf7w3+WSnwSV0PF0ABNHXRp0wrPX3nc0A2Xz5UvKR5YgZ/9GpTJYDOF7Dupr5Bk3uNNvDqHuAJScEOEJ3pUWSw5LJsilAYpCMnC5lUi1APiuktQcZtkcx8IER0NnRDypp0LfpkDjCKalyBGSSfIZywWZ6WOy4q03kkQ4tGJe7/laJrYu3tICzScFfVZ40dyE6U7X/p0PyIXjTNRdwp2LL+xqO06xXiSYVPzyEY9ltpOKguwXfj9JSyhPn3VIvZY0B1v+d8p2JsCUtUjEIuQmcF8nv4yh4ToTjW0/2M31MsxluZ6Uu0Y/0XBnzPC16Ht0eqZPjcY/dNWiMCcKC0NxHrrwBLtFeZo8jChMNHGwHiLe91TtTSlXFS/oRbseR7w7b7kL16kbyo/JQbG8WJha1Vv083hq+NWQWg62e/R6Rsn8KWVdAB0gjIePmkkNka4jA8sUnQWlLdicbCneBP8nMMSVrkGujyqZxd70PDog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(39840400004)(136003)(396003)(26005)(54906003)(7416002)(186003)(36756003)(2616005)(6486002)(86362001)(6496006)(956004)(38100700001)(16526019)(2906002)(52116002)(4744005)(8676002)(5660300002)(4326008)(110136005)(66476007)(316002)(478600001)(55236004)(66946007)(6666004)(83380400001)(66556008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?txbuBMZZYMM+Yzy8LQPcn6ohSX9TvuOmfJ1S8srlYWgy01YmiFgt9SC8X7vU?=
 =?us-ascii?Q?Ga2p6c8k2COpV6h4YPUzu+xhhA7Vyy0FNFZik0Fa/bFx9ZcJEyw50XjOu3rX?=
 =?us-ascii?Q?52jTtHZuZxV91pueF8+AvdSFhdiryzRv6mrP6QJ+4NDTWOJrMjeMUfMGwhcE?=
 =?us-ascii?Q?Sl1mhovEJRv4guWIYF/keBbcNdxubtxqqXE003plLZM9Wh4rwKlVuKts8yKS?=
 =?us-ascii?Q?dNtJRrL83HtFWis2lRES/Vlq9UbPX5o166TcSA5csH34HZvqWRcmFD7Tg12S?=
 =?us-ascii?Q?udfSmKXNvAMQKHgKJm5kvsdEZcBkMgSnnPNm8RZ9E7PL+4M5uDH3FEJa3UPQ?=
 =?us-ascii?Q?gSZPfW5o8bN1Eeocgyxx3nxFzcYn2ZRBazFvQ/H1pKp+uGSFzb9wQuTMpZjG?=
 =?us-ascii?Q?U5QFC2OIEKyhnhFysCEY/fz5WomhKbP2zz14Z2Zox8zQkxihrj0CDJZn3aNw?=
 =?us-ascii?Q?X73fV3JkFqBwgdB5lkJcWjSxDjsjw3ORwW3LmTl61bQ2vLZom7A20ooUPHFb?=
 =?us-ascii?Q?R5ocs/QWQENtEQloPf7/IeKk6//cj2zMAGrdp4AzgwkIcYvrzVd8ZPMwH+fz?=
 =?us-ascii?Q?ZYm6KLo8oKdfkmX9tq48Gg1w2hcGToRQuxmoDT+XV5Utgw3+UCR3Ey9uyZtZ?=
 =?us-ascii?Q?in0EsyNlGveM4jjkdmbHEZdKvSMj+0iYIgf2tldAVqZFu7gXZbtSgAMJNvQ7?=
 =?us-ascii?Q?hoYv97wwr8WpvHrjcnFgoY0DSGJptQSqpbee7ApJjEuj/4+gfpecgkNzZB3j?=
 =?us-ascii?Q?p9QRlXxKFfXrM6zoCrcaxbKUsVeLxcLE3aAVBoyi8on3PDA+l+6Dd8wPZSr8?=
 =?us-ascii?Q?RunorAuFJ7mCVkPBO2gMB6gl3cHcesfDJzHBgsJJ5oJztahJKVrFkzwBJ/0i?=
 =?us-ascii?Q?k2NQUnH96Bcxc+Xrk3kfL8Ng8y4iaR+0Rh1SSpHmzHuFktunEf69IMmNDXLH?=
 =?us-ascii?Q?+3onrLMXis/+9r51ocnDY629IsknJlt3jciZfXR5no3kM5rATElWoVtR9XbU?=
 =?us-ascii?Q?6HiLj+r+vmN82u9Ml2EgKcaGXt15Wo/u9zVShV/LmyfCElxHnaHB1aEvVwsh?=
 =?us-ascii?Q?n85i8FQbfHc4ewQm72jOuoB0CmFWIJT086jR9byOcUCXbBbS6PeHSXIlM0rE?=
 =?us-ascii?Q?5iAUXCZ72bkB/npryHPDjU0unoPw7qjEHdnvZpjOs4rnq4ugj/IX95e5Tot2?=
 =?us-ascii?Q?fafApkZkACUj9XhO80pI3BqGuvGknTPitibdx5TUzCxMlYU/gfMNItac/lR/?=
 =?us-ascii?Q?nk9/+4BP4yvpHVKpjhC9rclLP2Mfsaka2EgSzrvtHHKisciEmgu+nuouN1qV?=
 =?us-ascii?Q?X36TOksxc3Ax+oaJn4oBArZM?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6347149f-2bdd-4732-f221-08d8eaa0eb92
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 06:33:34.4263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5iway/n71q6MdSy6kqlG2D01nPyOJuFAHT2k8vF2o25i1ZYExi3JuORB2o/ugoAxPW3PJOeMRyPsY84FKyMQEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4581
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
index 65cc05982f82..04536cc7afe7 100644
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
