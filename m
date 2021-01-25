Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4548303807
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3656E426;
	Tue, 26 Jan 2021 08:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2128.outbound.protection.outlook.com [40.107.243.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA1389CDB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 11:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lI6SK4E3xRljlAFfWTyVhX7ESBmlgFpjBLJNGWh1KiMypPMwjO905t2jVnRv0IEY8ASo0KM+kwhOC0SUNvijmu4899No4Rl2Xa0SNl0gMstFAbXfiHoNwf9YLOUQmNSJ5uUOngkzUTrRtpEPEFeTAXrAGpuby+2mEiadD4kCoHHXOeaLoLs+e2xe31uLXQE8WevuTvVx51iDJxMGj1Ly2xKh3a2iXJ5FSKWJXCHT5UqfWkPGy8Kw3EOKDiGKVU/bsJCf4jz3n5fOROmiRFI9CdPuU5fZIfs84onYgpvJ0ooAt0uHKkQpEzQdFtemV3AdY8VAfKY3T5eEbd2law+X7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxJSPytLTGbJfuVaYKZUvuN+jvubAhBytBbcyAoj2zg=;
 b=bX0y1lG4b8FE9VN1aJGGCoXNm6bXJ+kyfs8Nyf0R2HyTUurwVS6iuxUAfd81nNefBHrEm2Ts8NDm4vRD1DbRWFWnCxh8qfnWC0f9u7cekBrZyctJE+gpI0tUidSaWmWmervfuMsWZQYxpFScABoPo+0ma+DYTwbwcv+n4M4WQbW4A20eFKFQkykXKbAjcCGHkmpRxpbl8yjAOQ6zyC5Y2LvRabOim2tkRiE4zCWSudoc3w46XlgcmvNUarUTQ2ukkZ/yNsFXPvyn27X8NZsSdYv0mHDhLoH2zeTJHjSt1XMayjnCq/8jJCcS52w96m/FXjbt1QZaD5KVmwKdp9vjIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxJSPytLTGbJfuVaYKZUvuN+jvubAhBytBbcyAoj2zg=;
 b=t9J+MmmjbqU3hd5Qr3KGI9Zm4gzGIQGO9vhBVY6/C8gRgJ+OjiG9kL4DVj4vBBcggA52V+fEFHcE5jnO9lOLDwIB76d7h1lCQY0VbISpqkHHaE30q6V7o4p4bRfY7tNnY3OicN8Yf3O2TPzyRlFTA9wVFtfa4lrbg9xmi5i6kIU=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB6262.namprd04.prod.outlook.com (2603:10b6:a03:e3::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 11:14:09 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132%6]) with mapi id 15.20.3763.015; Mon, 25 Jan 2021
 11:14:09 +0000
Date: Mon, 25 Jan 2021 19:13:40 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 2/3] drm/bridge: anx7625: fix not correct return value
Message-ID: <b585748741a9a4c20175e7f62ecad2d86de4a161.1611572143.git.xji@analogixsemi.com>
References: <cover.1611572142.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1611572142.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HKAPR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:203:d0::15) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HKAPR04CA0005.apcprd04.prod.outlook.com (2603:1096:203:d0::15) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 11:14:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea6472dc-de02-4ad1-38ac-08d8c1225625
X-MS-TrafficTypeDiagnostic: BYAPR04MB6262:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB626253E9EB2FE57C32AA0404C7BD9@BYAPR04MB6262.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wu1NqyjrAS/vuvHwieTCtuFiy1w4qRfc3YXDWDczgOIWAB3yxLtHgeKSV8T+8BbjEIlGNEPyuY0PIIyI1yAFvIERzhvRRWJm+KIobbyx+iEyTAqxvWfyg3wgXcvUPyaYsefGYkikeCxwaagnbGcPhFp3Zoxrb1XkvKTEqDYgCefKm3WblcZDaIhxTdYQlG6WZBBzSyOUi45ipoDBNd0QgWmmQ3YQR33+O1EgvCAGNlw2BXzpNEp8LSKIKlE/Z/KvFFgvSI4e4o4AVmloaiR5hgNPxF/yeMVIoTUs2HXRmJmAE2eE8B2JbhX6WjFl6/8lX0/js2Lvwxyztvy7iif52eNioQvn0GtGp1a+P7GfALYs2JF7/MI4kdCWPAtGzGIrLNp1HROi8As5L+dqh0hg7fOs4B6/jiHpERx7ul+JpluRk0ZfzdGbfc+gsrcpUoTruE8mg1KjL4eJcexJR2GXpbVN4As3C6hsytMfCO3AvO2uhNUb2OXSQh352fL4FPZKZfinq2HQEpnXNOXsLfDhiphfGi4czdJm9Cihz0hMdW6Tmn8jYYXgp4eepk7M96oMwHKjzbPearqIZRA/rsnbyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(136003)(39850400004)(376002)(346002)(26005)(186003)(6486002)(16526019)(83380400001)(2616005)(956004)(478600001)(66946007)(4744005)(316002)(110136005)(54906003)(8676002)(8936002)(6496006)(66476007)(52116002)(4326008)(66556008)(86362001)(36756003)(7416002)(5660300002)(2906002)(6666004)(16060500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ODh3Bt1n/+sqMReuQsywQIgR6W5nnxwklUNQp5uO5jQX4mnYS1yWI5KtzjAd?=
 =?us-ascii?Q?L3oEkJJT3z5vVB2qSbQkBEalSi6X/GDVZTSGg5TRewiVgRlcY+oZV+zOvDBN?=
 =?us-ascii?Q?OhMmpBmSMdI04i1DnUnlcb564k4elGSCfDW9ZMpsPgUVpt9+VkiBUbmuHAUz?=
 =?us-ascii?Q?00WtE7YZRWvyoX6Z79Sg6AeoNsQQ+es5BIWTOnDIZeNtPVp+r3F9dniumXn3?=
 =?us-ascii?Q?+Dx3OriBw63jI7ySAL2mZF/EfEV6FU35VwgO7JMhjza64DZ+GOz3YZnUjlH8?=
 =?us-ascii?Q?N4FAbUb6W4eST31mwMeIGcD1RcLZzV7A9/o0IydxSXtZuXQWBGlEz46iB0ix?=
 =?us-ascii?Q?XRn0XDek4+7jWrv3+QyxNDtxlfrRZa5/dn4UTRVhfejkLaZXQlRmDm1PnVtj?=
 =?us-ascii?Q?CJuf6KH2JYesdNGF7VaRvdW5q+jyoDf6um+p25oFTFkFj0euRdNA2mQHNp4P?=
 =?us-ascii?Q?b7etygpAR+2SBl70wFqgWyeNPwXRGFACED7w8PIebCagKb/9FamT1/fNf2+n?=
 =?us-ascii?Q?fMZW19KI8ebg+JGvdXR3MzZdUukvgwMqgbfMc4vqNrZXvlHtfxb1jDPUTiyj?=
 =?us-ascii?Q?dYLnrxdYNUyACxizc/FIVZC2jnDL4Je61zFNOcVEd5xGiMMAY7JeyzEInmhF?=
 =?us-ascii?Q?uEd9jArDCra1Ooi/JUeUS5NGnNM+CPmlRRDr4cNMps11H4njZ2a+0l+SlZWz?=
 =?us-ascii?Q?cRyDFHjiDhn/GHwlKNlgXVXzjhz0EHI4R3lYlHGLcjDk12oyDQrRhB0G8MsK?=
 =?us-ascii?Q?ll3/5EXTmThtGPNIuaxTCpxtUoZxwmUUEg5MBnZIAJgSU68Tv62vtr3RMfbF?=
 =?us-ascii?Q?8pSPx/oL8nduqpMKRxsMoLua2ePVX3iDeoqMyywFA4puXUaXeIlviyjV2W2Y?=
 =?us-ascii?Q?DjaSsfmNM/ogBCu2S2TDvegQlxHvJP3LqhAk9TrL+ts2WE1RhPNqg6KsdYlF?=
 =?us-ascii?Q?EvOGuMFmyghnHkICiZKTHI+SK6edgv8LDnCGfk3PZTK9UsVmT6kwsbT1gwL4?=
 =?us-ascii?Q?3GjyauTmUWOkKEN7h1myN7MW7giJGVkrrJ5/IoU3tX8uHZZvYVZ8GgT1Wma7?=
 =?us-ascii?Q?JzpokN97?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea6472dc-de02-4ad1-38ac-08d8c1225625
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 11:14:09.5555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxewNBCuJfcAzxbhJKvZEsCamLhV2ei7FdwJnfW9Y6x2welQ2OqXNYhrXkrocDPkCqYvgJmZq7q16Mlbpux24Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6262
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Sheng Pan <span@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At some time, the original code may return non zero value, force return 0
if operation finished

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
