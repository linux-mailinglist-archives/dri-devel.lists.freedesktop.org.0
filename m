Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C693B048C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 14:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7916E4D2;
	Tue, 22 Jun 2021 12:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2127.outbound.protection.outlook.com [40.107.244.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBC76E4D2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 12:32:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZszLQt7I5PiibwpH+Wi67LNCuYtGF2zf4iBkW/M+lOAy3NRpTP4D6dyOhgaly3e/2tAgMKfd1fb/gw1hHe/qdiADbbyiWr1aOBaq8Zm23R1pxGsrNPT7Jo88ntXFNPBvqZpqWz/jDgHWzGQIkp1vrhrs0Z5zwyt0VYNhflfBlILo2SghbkBcbEZQQvec3lZOO0CWTyVDamq1kNujab5a99qNf8qV8IiZgxzHa136jP/Qf/NLTHzSvwF3yGmXwuvYeKm5zeafT/hTjEDT2GI1V9wUp96A0AVjVsbrDgkhBbmXBk6nBFUPrrwabjo5w5ByINoFtkYR7xmyr2DfSnmGqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skmraAaRPuL+Dm2SJmUQIYDKd0zUAZM+B/rE9xFjvJw=;
 b=V6e7bj/djXh/rHEhrguF0+T2KaZcnZerhCk3wDr9rs4yLF+fkWYtlJEeiRd/ezEaLOneRpMgDzBrv4yHxyzujkPdUdB1W/1MKPEHVBYoLnwABUfDMleCWFCUmIDTYGYIigxciVhonoPUCvyVf8AtJD5rrySKzG13qBrd9sFjxXq70/c5tqJ5pX/wEEpZ5lG+M/68g7jzZFZNlfoIFuqJK7H1VJkpXnm6pINoE3p4FkII0StVlaRIoLnjZbN3ggSkI1+2kcOiph2XWSOQHFq0CzRy2MUw3ARF+h+np7yY3O5+xnvRwXAGAjlVlMkLIm4LsiReZyM6dQHmVQ1AwcDE1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skmraAaRPuL+Dm2SJmUQIYDKd0zUAZM+B/rE9xFjvJw=;
 b=Bv315c1qd2mvAZN/caFSxYKwd8vvjmF5US+r9p4B4/jYVOMb0Pe27Gy8XeuN0Q62Ji0MwLriz9mFFt++vOPVp/GUUhh2eE/uf2nnjuG+fqmAaQ87kPbvbQZ40Gt2x966dCprLRa1Xfru2KdIkzEQBSqFeVR5WTuLkJLq+5zXlPg=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6785.namprd04.prod.outlook.com (2603:10b6:a03:218::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 12:32:06 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4264.018; Tue, 22 Jun 2021
 12:32:06 +0000
Date: Tue, 22 Jun 2021 20:31:59 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v9 2/4] drm/bridge: anx7625: fix not correct return value
Message-ID: <86e9ad1dc0acadaeacaa8c5bb2c7c86086507e06.1624349480.git.xji@analogixsemi.com>
References: <cover.1624349479.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624349479.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HKAPR03CA0013.apcprd03.prod.outlook.com
 (2603:1096:203:c8::18) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HKAPR03CA0013.apcprd03.prod.outlook.com (2603:1096:203:c8::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.9 via Frontend Transport; Tue, 22 Jun 2021 12:32:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9984812d-f289-40b1-d6dc-08d93579beb4
X-MS-TrafficTypeDiagnostic: BY5PR04MB6785:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB678592857B7A3E7B8727BEF8C7099@BY5PR04MB6785.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: STz+zjceHMAyRinQFjB64IvJJUSibZuqIxMxqZBV+LKJfoi5/ymldTa2S2vz5hI9ROcJWau8GeQ+TA1UI8HamMO8fli4GQFUGxmwTj3LXxkizyIp02HxVOSbrfgSeC05qmvBDpYGxrY6ybY3UXokgIUCP3q4FhSJ58oMV3ColzOf8AQnypUOlrv362yiZLhrTo8DQ0bcDU3rDb+FyOzFvfafVUDiwMYqxBzJYfqnda5MYQk3tCLzTiEkQ4d1l4HblJr/BjoK2gDvBxDf6+LOuzk+MQXrBaRK4OGeWYB7V+mXW8Coe4nZEZiOghPf/NF+A/159Ollx8Xeu1ni37eJQZzvxlkq/ZfsptMilxSfXTN8UNpKXxjB6FsPL+g/SKz+L/LJGoHCF8kEqVvsKH60TfkQxlz6H1bqLMnGt3+YKvwZGFpMbiN/YspsT2a6D6LUKcKzYMfh5jaViBtKPYRaHqbW19cyQqzwoHjTGXE25FRhI0GEv8oB2NGcRvc9ExWM42QMIG3ZgqfbB298SuluQ3D4tRbSrI0JvLs3MFVAAzg040L66RmROOrHjfEwwfAYE3uQ4ei0dAc+oUT7k2V1b+oanJjcG+LTuNgoZvvBYjtj1g1+BXw8zy9wA/UGEl4hwzlahUfNeJSPWcT9sGMTevq+WxA8QwxbLUGDMPHL7KQQhDWoiPi24Xqx2xr6/HlSq/6M0MxnFTAiVbvMuwMcZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(136003)(346002)(376002)(366004)(86362001)(7416002)(66556008)(2616005)(16526019)(66946007)(2906002)(4326008)(6666004)(956004)(36756003)(66476007)(55236004)(26005)(38350700002)(83380400001)(38100700002)(186003)(6486002)(110136005)(8676002)(52116002)(316002)(5660300002)(54906003)(478600001)(8936002)(4744005)(6496006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U2qoJKHMG+kOGF2nMeyWExnvOfve852vzv+rzQk9k9N+Ipe3Nm2k0GZfWeew?=
 =?us-ascii?Q?fi8F6WKV4KDgVOs9bAWgYXCUcmZHPLqhpsEymLMXIY4FUVmheeJvrulj1GUF?=
 =?us-ascii?Q?vF7/poMzkTI7KsqyJFVvblRvixX77IDzFjuibYeF/9/VaDRnt/I4/qNFsW/z?=
 =?us-ascii?Q?4rMCQr96QoK1twPNEHdrnpxKsnf9xEPBPxDPWUnADDWW9bCzSFoddpK/FGTp?=
 =?us-ascii?Q?503497V8rFsD3n9iWEfjsSvwVQnCuZW/lmO/0fjZRlZZV2jmsM0F9QZY1ZUd?=
 =?us-ascii?Q?FlUcdt2dmwcoTbCa0zHnZbN7aZwDwpsziAewVtJuyjBYDmXuM7qU3rWavJvL?=
 =?us-ascii?Q?LzDEtrmdtVTwDWqa/JVtlsVZYa2YP0GHRrfXhJrwFXHxnvQprWUoyNSJOiJS?=
 =?us-ascii?Q?oWLmxNrUvlBnitmKsSgLHEYdWeTqCDXe5CFtGdcG8ho3UD7tMgmn6Iz0GSid?=
 =?us-ascii?Q?uKBxfQsTPTDylc+atg+4sKju0Kv3VE7P5v1616qseeYQhJn51l6rmIz+Ua5a?=
 =?us-ascii?Q?dqTtw+DLkEtesmDgxAseV6hYmnP+MGyMefIpaXdxBhQ4iFKf1E+Ach8PvewL?=
 =?us-ascii?Q?EDoQGY/O77aVee9V2S158/q6UY/M7s8KaR0EBKRGZgYLqfYDyAXkg+VzAS2u?=
 =?us-ascii?Q?YIkG60dkDgN5U/cUcxZ4bg0pg4niqREbrVPtjthol0HQokKYfGBcpsJb5jW3?=
 =?us-ascii?Q?T4nvladuEHlLlEUjvq1tjEPJsTn243twc7boNhgcggv2+Sow+3jj6t4nB/bR?=
 =?us-ascii?Q?ZpDEOIovCTbKe1vlNoA+eWo7XDPsUPyaMH0cd21+yhOzx4ijQqS+Aegw1khC?=
 =?us-ascii?Q?BzJcegAyj4AdXHdGeHoCjt1uE52zsTQJhlIb3xC2xLU4z4r7Ze6yEumalxK3?=
 =?us-ascii?Q?SST4EMrmA83HoeX96tbmy+DthHXfLtA+wZQ1ejQAIX+YX0A3VxUADnSRPcFG?=
 =?us-ascii?Q?GfUM29h3P0MakthsQ2UTuGQn+zsckc8mxcXMBOMB1qlYlxGjPUzr9X1tJnSB?=
 =?us-ascii?Q?4MNVBU9ug4tCBl3T+y6mgLAVTmmxAnLFk0EK4jLFkzli2ultDcL1NQOQ4bNS?=
 =?us-ascii?Q?URCoyxZUCwpMs/KNgQw0D9ZY+CNZ9PZPsUoJ9g81TthRGnKSbZ1bs2lyDKVB?=
 =?us-ascii?Q?ugg+mXD/uSHLjARg+2Oq4Zkjhu9B2SJ0nWAxgi2XAQGo1xrko6CnrJpPHMaa?=
 =?us-ascii?Q?rORLk8ej6WLYJnzPkdEG3xQO3pEDkX/G5K1II2EmOeUVDZ0yJ87i7oripzY6?=
 =?us-ascii?Q?Y9AKfsA49akov17XeqjSdWFvg2MuK1VYbUa/LNSL6a9445OjvrOnt2vA5aDN?=
 =?us-ascii?Q?UrbPlBa8mfY+xXZABb6e5yE7?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9984812d-f289-40b1-d6dc-08d93579beb4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 12:32:05.9520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85cf3FEPJFa2iLiAo9c2HQfrvddT4qfE/fylhuNPLQfywU+ilbyvBdnGeZ0i7OnYDq6QtHEP/gyG7PVHQISQzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6785
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

