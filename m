Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 199DC307EDC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAF26EA03;
	Thu, 28 Jan 2021 19:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770118.outbound.protection.outlook.com [40.107.77.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840D26E152
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:16:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UP7zJ3bjPn9hT5ed8OzgXrtD5zfLEJSB0X4E0blnRGQuu9iSR+6KJX8bUoMsL2KaVu/2JEcpKExAs42bFm5jIVjLUeqMNl/SwxOqYwev+dJqZu47wcvDBKACSpHNkKLuh4MwcwtXdKU96zR8D9a1zBUQ4GgzK8vN/VN0AAlR6l8lqqYw9T0PLUYpboZ//jbBweSGDKhq8GGc5BrHaz0npvOlPbyrCpWxJlduTu8KlJM+dXlqDdlivCGiDe/201vHEU4kV9AFIZt18x+ZI0fcPbcaKxoRzR8ryfhExJcCirRmpRgLfe8umLtanT0ZSEd713lQJV3kza53uAt+eNC4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t723LWYCFkSjcSMQHNgnVEc2UN3uFpA2uB9Y+LYUlHY=;
 b=AlL+16t5a6GOm9USfDrrOAKapZe0/hHkzK8okN8l248DS+mAzu7NREmHQSB/vKIKHhxe1CGjSv6XrFuFYwH3KKEfXzFq6RgSBZ+t/qfFWIC2RtdvxO+2Lg9da0T1lBXkMbUUPDN4tyRf7vLBcQz+8zVhSxqAHhTMKf1lI11uykpR+rmiM97eQ3KpNVNrVYrORxaG11oAS3WVnFmrRMYUGJyvO770omNfAN02pDN8RJCMtn1VnT4uAJ9mUsc8s+gXwpdh9y3qgfVea5ofSzpfK6x/wgSQEXu0tHhGGUYMi0kf6nuQ+/BHE/eJHzGK+nF1Cxe2hbgrAnA166Bfk3mTJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t723LWYCFkSjcSMQHNgnVEc2UN3uFpA2uB9Y+LYUlHY=;
 b=hA94KmnXmnLmWUAzI9sCTIBpSGxYqbD33JLc2ewhTgyFXYvWqggVWl+I7kAx2u/micEHtxCab4TuAj+yw312Td13/5cB+jNcuxBEW3j3TtOLAHKQAlwU5Iw7eCZuRilB0NC+32zE1D3xU+BYz0ZoTJtOBUa/qrY2c9WR9xpdVz8=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6440.namprd04.prod.outlook.com (2603:10b6:a03:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 11:16:26 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132%6]) with mapi id 15.20.3763.019; Thu, 28 Jan 2021
 11:16:26 +0000
Date: Thu, 28 Jan 2021 19:15:49 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] drm/bridge: anx7625: enable DSI EOTP
Message-ID: <20210128111549.GA8174@zhaomy-pc>
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR04CA0052.apcprd04.prod.outlook.com
 (2603:1096:202:14::20) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HK2PR04CA0052.apcprd04.prod.outlook.com (2603:1096:202:14::20) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 11:16:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a90c7ae0-2a2e-4ad9-d6f0-08d8c37e26fc
X-MS-TrafficTypeDiagnostic: BY5PR04MB6440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB6440CE731045C1203F8E8609C7BA9@BY5PR04MB6440.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smAtkoqpKnWluHWg4DnTeBZvVSOPYhUzG3NOjqQtT4Moor7rPAoovjdUmIPxtFI9PDQa2bgUbMkU/G5ZPoZXbVpkfdp8SXyRfP6JBWLx7EsHds1t9L3LB9xt7zic308Jhlys94c/eOKHQc2Lvl3d9qp6izeWLWtjr6zZLsgFILBo3QQ8Ud6wvrb/8AboEQuSO4Gy2n3i6b0w8x0xsMhKlimn3D7yZnHYISpQtgcGc9SU14x0ByyQGirLmmJTqDQnpBGfyAAj02ODj6amMK4RHMTOBHRsHWVP06WeEeFZLKqj9xHAulAecVy8qkIzMjim8hCHJq/Rk/SBIr7TK3k/yKkabnZt+zHtUEvCTGX+18acoZTtEgaE95JvL2ap3lajpIGpom2FVQaHb7Y7kEnUj7xs49WgEp9vPnC5X4GXsr9idQi45+kmbmlbqTPDVD8bSeSfBDukh2yz3JesMGcaJ19Q6s0JAu+mAo0txgeolElyXu7TZ5jB2MBWqhZK1ChzJdG3+cg0XlOW8FXlcrS5Qn4VicW2O+xxKSok+8yuS8s3yWai+Ga2BeDoop8cXQtww9pHucTZ1rbIEjL5lAbraA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39850400004)(366004)(346002)(376002)(55016002)(478600001)(2906002)(33716001)(9686003)(4326008)(86362001)(8936002)(6666004)(33656002)(8676002)(52116002)(956004)(66946007)(26005)(6496006)(66556008)(66476007)(1076003)(16526019)(186003)(110136005)(83380400001)(4744005)(7416002)(5660300002)(54906003)(316002)(16060500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OVh9GDJjxOcDW8sCNBTqDwtqaYiDVBCkQu7zLzq1Zg30B/jtH4mF4h6h5iNQ?=
 =?us-ascii?Q?pzHHQLg+2PDAi/z3BpGiyZ9jQMHnCCfoNPnWfLO/f4QzV6tfWIg7l2Rbuwxa?=
 =?us-ascii?Q?9gAUJ4vEW+5NcMjSc2D/Cg6QXaS+8zVZCHXVmdF4E/EZX7FYopU/K7BjXRUv?=
 =?us-ascii?Q?gVHRehxyX7DwFC0NR21NI7F0Vp3lNQnaFiXzwk6KX9dQkmucgo2XiKYk1P0e?=
 =?us-ascii?Q?+PCUqv9r8Jm6dAt5Cpf8lV2XynSQl7k/Fb8u1L64gYJj92ewlsm2C89cq4JW?=
 =?us-ascii?Q?/qjZqNpJ0Jp08PmlD0UDJe0d/Qu2QBmkRA9gJxG0IKIKjHbAfc4aEEG8NcdM?=
 =?us-ascii?Q?qXvW3GP7QmrGFY4AADpYTtLwcDXra3Xym6LpmfmMm/2OswCgKTcGvNpuZrTP?=
 =?us-ascii?Q?HJ3deM3bIIbKeuy7tPCm8qx7xCK9PlUy78yMHWyG2mNpDw951NPanTcOK+sf?=
 =?us-ascii?Q?zj4SEOBvMM3f4H1ZJuFCBiG+Gt8D01MLX9+MczTTk9OttZxQOHgpoUi7z9Tq?=
 =?us-ascii?Q?pmbK6FNNl3M2D2vB+0j0GXWDaQUS/P8i8eD6DtJ116wWav0kLC8glB6yhds3?=
 =?us-ascii?Q?pfAFJg6FlFmQIw3AvsjlIKVhnLfoSX/7G07LY6zME8fa9CmU+8DRioSajN46?=
 =?us-ascii?Q?SaNe/H+JF1jk447JY/2lCb2MPyNlzXvKapBLf0rN/CJaNXB+1FtXwhqhx/Pj?=
 =?us-ascii?Q?24CrWW7YaUVN0wgc+loLrfPBYISau0SVg5fMfVfr9yXAB/qRcncKYnzZ6M2R?=
 =?us-ascii?Q?TeiaaIlpJ/Fp2HaP3DY8+8pqwkJgDlNFDjpTUAMYljAGD41n8/sMnqvU6cpL?=
 =?us-ascii?Q?Az1hfe+I+ssKhI7XX+DTvHruCARKSVJeudlc3UQu9I0SLWF/Qlz/fd1ZJPrm?=
 =?us-ascii?Q?SbFVBsKB0mgGlQtrrX8IAhPSRALIgRd5oM9uU090EasMfTPOMfgiwlvi8xEG?=
 =?us-ascii?Q?kFnYwS0GqweMTP/i4VHf/VIWYtgerysobya4crnnQD2AZkCu3R9dUFI1WoV8?=
 =?us-ascii?Q?iUyZGzo+oSqXWhfDEVYLxMq05TTfiAM8XPAclAXpMfdD7kyqRUfRBhfTbbOg?=
 =?us-ascii?Q?XYCh20xn?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90c7ae0-2a2e-4ad9-d6f0-08d8c37e26fc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 11:16:26.2455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2G1yFSfidK6OKLc3/uy0DtVo/comYPQNtS4g7Ws3GP9fclxXiJ3rASkftxEzLC0uhOoVUxBXnF9sh6LgYYcwDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6440
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:34 +0000
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable DSI EOTP feature for fixing some panel screen constance
shift issue.
Removing MIPI flag MIPI_DSI_MODE_EOT_PACKET to enable DSI EOTP.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 65cc059..e31eeb1b 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1334,7 +1334,6 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
 		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
-		MIPI_DSI_MODE_EOT_PACKET	|
 		MIPI_DSI_MODE_VIDEO_HSE;
 
 	if (mipi_dsi_attach(dsi) < 0) {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
