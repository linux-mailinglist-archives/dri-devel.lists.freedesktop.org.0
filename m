Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8503CD197
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 12:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFBF6E05D;
	Mon, 19 Jul 2021 10:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2105.outbound.protection.outlook.com [40.107.244.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0206E05D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 10:10:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fn97hVcuxTh2RNVORIrTHHK9lqtx0yxvqVy7PYWwE7YJg7QexShhyatQO3FXnQ+vgxyHdbyF4QHI5oGO0/JyBwrCcZgxSQeHdtPBsRlXPsRJp7wgqx4Ik1n7MeMeOa5Bz2bWDDXpLdwp9fGcFQYqI4Opocq/SVtHnSRGKfePNdcVvintawiUQ7KfRnmcl+OP5pbv3Ae4IXiE/J8Uy2oETAOBV506eUoBQVHSljPBPSd+ITkfuVSK5GRvVCALOG9Pt0hl3eklvX21MAKuYldlKmKhtiY4icFIjWFrr0lXSt1wENjqTAe5Eqs/6vPPlDlMCk5kpqzSXF8GhnF22rUICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skmraAaRPuL+Dm2SJmUQIYDKd0zUAZM+B/rE9xFjvJw=;
 b=H8ertGhLFXu4v+fNNXF/cLQyAmNv81RZb+Bd7H8mW9ZZy4bPzw0b9qTGO4DPobN7KyKrPZugjCOoB6BVVLXRg4ttyA6yu4eFn9m6OQeD85PjRIjXecXNl1LXFPBr/YdbyiR+AXma2C5jyIgw8dZoGOtx3PM3uoDty5jlFXjaUF8jD7j7o6iOOEmM2ZzXhAs3bx6Oan7i3rKc2WpOjiteIQLbqxF3HNx65GGyXdA2ji6c3zgc0gclartB/On2qOSKYRj1nC5njPavr0qpE4yKU+k46aqokSS6oJDv8y9mBcYR9rF6MNfFa0oE6US8VuuLkG3vHiZ6iZYlpCJQjzgmdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skmraAaRPuL+Dm2SJmUQIYDKd0zUAZM+B/rE9xFjvJw=;
 b=cD1M49IqPdZ1ojvx4SdAo8FTKaAg1XybbJmkZOib4NAVHRHVbSyGpYRDW/dk8MpWHvfzgYSeWho6jQs+GCvJBUTEF7Nn05UVPNoZAGkOIxD+cB0L/XiOzW0b/V4SblT2OhQXPOQMZuiSEaP0m+quY/xgqur5hrK2cVV1wbBcnYE=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6568.namprd04.prod.outlook.com (2603:10b6:a03:1de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 10:10:56 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 10:10:56 +0000
Date: Mon, 19 Jul 2021 18:10:51 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v10 2/4] drm/bridge: anx7625: fix not correct return value
Message-ID: <bc6bc1015acbcdadfbfce306cb3c9959a502cbc4.1626685856.git.xji@analogixsemi.com>
References: <cover.1626685856.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1626685856.git.xji@analogixsemi.com>
X-ClientProxiedBy: HK2P15301CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::23) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2P15301CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.0 via Frontend Transport; Mon, 19 Jul 2021 10:10:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e373bd74-2e1b-4028-77b1-08d94a9d7f98
X-MS-TrafficTypeDiagnostic: BY5PR04MB6568:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB65685F9F5B6B64BA160EBA79C7E19@BY5PR04MB6568.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2TfibFyVzgj+MhTuTDwu9FCUd55ia0UN1GaZ33teqc/OGNzz3+7OC4449Tdb86aEFzadwbpCJRCuO0QgwBe9+4WmA4durd3t1aZ4vn+6Mmmsn/phoFp3xAeqGwbiThV7Z2bptV4VlEzUZSjRLlLpvVJgdCpMoIw3ZJVCIvy1IrApkfV4bOMf9PefSfJwELSyz0KUBa6+SbUVFeh0k8U74+38AfygENRR48N9lIw6TZzDxX57jF2i5lBF6MgFLM5gVnsvoqJlK0EnjytuisqbW2105Xe7TTOG4qFNSwz0mi4aTf1BK3087fHjkkEo/FEincusk3BTKbhPzloe/ZDLZgXoEzseUKUHJf1DXDFUCXDVn4llCQw2bn5zsIdhb+yMivb0m5eMwueljpj6W9B++oTpShjLyVQq/J43EcXhKak/DXxKtiS3BBATVNZx2Bkk12DsaoVze0RU1cAT7NR/+MvmBnuyH4IdJxL512aiO3E+Zv6UukLW6Pb81IB+Fd6BrK1OXeGC7Qd04oPF2CjGIxLSKTuYuHK5TtkBFsbJtRtVWQYwvxkdn/om65akWo2ip2j1BRxfz9FR6sx+FSLUANLgYDWqx+SyAk4Dip64M+QUAn67rOlQAUQLLD9Bbt2XTfl0eaaEXAbYebgnzcmjIMkrMuyJPLFbQnGFec2A4o/X8k5Klnk05ZqeidpwO4RHtFQFzbxPBkIvG+5u8oeeSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(39840400004)(396003)(346002)(186003)(52116002)(83380400001)(6486002)(8936002)(86362001)(4326008)(6666004)(26005)(2906002)(55236004)(36756003)(5660300002)(66556008)(7416002)(66476007)(4744005)(54906003)(956004)(316002)(2616005)(8676002)(110136005)(38350700002)(66946007)(38100700002)(6496006)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2J44bxZZZDTh8ch/pqblttxPPD1v0DGZwJ3pC9Otw9C/CJBLL8pnBSNvZt/J?=
 =?us-ascii?Q?oYo+0syU7l9CA+Dcm3Z4+gotYBYy2H6Z/7emWYlX8fNwoRgwD1EYUgpDYqnO?=
 =?us-ascii?Q?WPBJI9AE2zKDa65t+aY76jymF+WkzctzUTd/p2r6Dhgqv4R3DgUFXqEqAcb3?=
 =?us-ascii?Q?W+TwYUmAbOKJU0hB2adczTBDKSvUYcvnHHDUBoL8tocdXXXXJXlA+G0mg1L4?=
 =?us-ascii?Q?C/AtcjdmP5BQZw50enVf4/otrmUiEl9SW5hLSXWzCm9/VMp6JSCkHTfpJghE?=
 =?us-ascii?Q?VSCwd7/qhgEJm8G96LZXl7op5ithc2PNcPUDQttDbayeVxZr8EKpa23EkUL9?=
 =?us-ascii?Q?E1pkjY7qZ4CIjd75u6yJnfaZjznvFMYdTGkTu5qSHyuXy0uPACC3oDqudsfg?=
 =?us-ascii?Q?1v4H2XrijWGA+BR0O++jNTGZ9IXZ92Mu2QZWptPOvisElWjJ0W+0WugIVqCc?=
 =?us-ascii?Q?MaR3rcpTLyGDNnCFhRA9oW6HTqvQ2sa4PmpV+HlmlrHmimMyhAOEd/z25LX0?=
 =?us-ascii?Q?5KADUh8c75A8TaZ5Rrafd7293Xulgr8ZcIRUDl4eGPlos3VFfdZTPajmZmGj?=
 =?us-ascii?Q?l7Xb+Ei0laWglDZz7D22L/ygZVBKOHEkB46lBXwFY8d1UZ37KjLxmoXoha6F?=
 =?us-ascii?Q?K1Ww85l/L65MgP8//GESXv1tOrcSu769ghj9Byh/cJscAJ2MEQUsdVrMBpam?=
 =?us-ascii?Q?zV7XO7yrcHeeiFUYt/jRLymHxHU7clC8/vL9j3uqFMz1dOpjaAA4oPhEuH1C?=
 =?us-ascii?Q?B7OY2mOYAL1Tkv/wPAnQhlkotV7wwZLnwFS1DydVNpkVkuG3ccr7REElBTIk?=
 =?us-ascii?Q?jJZ3LgySdO9+NTmNKDucB53W+hu5+QYWZebLpn6XQkMY07I9eOcS9HN+ms1o?=
 =?us-ascii?Q?apTBBxtJR78t4rbb1Ydq2fNRAdP+yQr2JCi9VGG6DlCUbruKmk8qCbty/yIc?=
 =?us-ascii?Q?TwEgkUn0F6sjgMxf2jgY3lwAnZ/qLeWrqBRedEqcY0Y4XTGdpV/qnD4n1NUY?=
 =?us-ascii?Q?WXhAtD8D6MzxN5pM1ncYrnrfuJdQiBlPW+/uZQs+uetE1WOX8cP1EGFmblR/?=
 =?us-ascii?Q?DLLDQCdeDwBTT5ivMEFdebDZkTNBm/UwW/fBf2DtOm43oP+F0Ht2qYQ5RNZD?=
 =?us-ascii?Q?7mI3wrVddUA1+xbIYe5JaZhJZDvYTzjktLgrsQ6F9QNgZZyl5yFnhxks8Omr?=
 =?us-ascii?Q?Cmf+XqVjvvI7MXOEzblktxflKIUoyPfqFu5gA6qu3QP5kZ6XfgzZbo1nEeUG?=
 =?us-ascii?Q?1zvdEkC4afveknW86lSb7l5KJ03iDVaWqZmzXlGy9KtmY6V3MXtdh2hCaf0R?=
 =?us-ascii?Q?CUfZnTbh9n+dahJ15MREtKXc?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e373bd74-2e1b-4028-77b1-08d94a9d7f98
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 10:10:56.4199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bs1NTdmFaY+V4ozNinUbd7ERGELPUgDFknzEniwAyD8zRi7Ns2AxY1Fp7CMcOSNVK41Sc/W/yz4yWmXwk0HZsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6568
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
Cc: devel@driverdev.osuosl.org, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At some time, the original code may return non zero value, force return 0
if operation finished.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a3d82377066b..3fc6b7ce7fc7 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -191,10 +191,10 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
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

