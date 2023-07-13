Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC87521EB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 14:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2671C10E690;
	Thu, 13 Jul 2023 12:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2108.outbound.protection.outlook.com [40.107.255.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E43110E644
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:07:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXQZbfWK1Nh0NTYjy/DFAlsreS2XFfYo+b0t4XUlYXDBW/Ia/cIpujewD/zLO4uhy1iLlUxWAb9hLmObIAmbahhZXMj5rGuTFAl5duEB2mG1VpUI77OQIMfF+GmesuCmtvLcewPUX2qOqA19O887r4GiOgKzlQvUh7lVh73z96+BzTc02thGi3SZBknSumrLPyeYNBD1XU6FiDq84ZNaGrD2oBiUsjtncniHke0LWJHMqnx8alCtN/8NARtNriDTpwy0lV0hP+C5HxFdyz9GTk7TSofelUnTXW3iggabWcGEc8v+cLOMYNdYG88GFHmQe9onuGoyVs/XRIzfNZsarQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0y+rDS3ZL+62JjvDt6QAhYsqIH809leEn9kseNghXM=;
 b=OG0bz/clY0fuLigxre3rRlZHcuITbsPa2loaqZbKqQ9uCsXhpBgZm15yEeswCxxVrL2Ja9hgrjonpTwSaInDLVvcznrqRYDmN9/rUJFhwWXQolslErthGWLG9o0chqll3TSv2vh1aWKFt21RbW5ekBuPZiseqd7FF102JT0xl/ymY/q+DnlAknEfEYEkNrPZSHoWMWX52PxjVZqZq0JR42DNONcqwln+GYPeGD1D/NOTP4kZqKi5s4d8Ebiv2jpg/4Uxs8iuSVcul66y06sZLZB4v/UkU3lI5NOaHGlwWOcYLK3vXlLxI1AP46BLnRLdhW/vSjo2zhrUA3WcXVxJ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0y+rDS3ZL+62JjvDt6QAhYsqIH809leEn9kseNghXM=;
 b=prk7mO3rYm1Kjp2Gz6+8HKgRiDo91dxDwqOW7NeidX2hhQ7bEFQHLsh9K5FMXiqXg9LSF4orL61xxuGgQd3N0o5xyzB8TGOse4boOH1oIcuzsw0Ftx7whgpLgaYRKomFBq0Yc22HJ+xstMT1e3B5X8XEEcpv8VSfQ+wT+qNB7GoeRTbmdYtxVWs4GJfR5JCJ0hjL7E62gm0fvPztU76sEDY9JaAm+dfvz5BneOcSlcS0+GSEtiCak2+1BfgPTBb7M5kS2wZV2g2H/cWatp5C/fEGEEx9nMZLKZVaDbeHq2PQohSu0G7Ov2hsGUvm3KojHyuM4N/F8+VeTVVaSADB7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9) by
 TYUPR06MB5912.apcprd06.prod.outlook.com (2603:1096:400:353::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20; Thu, 13 Jul 2023 09:07:34 +0000
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a]) by SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a%6]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 09:07:33 +0000
From: Minjie Du <duminjie@vivo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1] drm/panel: novatek-nt35950: fix parameter check in
 nt35950_probe()
Date: Thu, 13 Jul 2023 17:07:24 +0800
Message-Id: <20230713090724.12519-1-duminjie@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:404:e2::22) To SG2PR06MB5288.apcprd06.prod.outlook.com
 (2603:1096:4:1dc::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB5288:EE_|TYUPR06MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d5c8a4-2ab8-445a-0650-08db838097f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B/TbJe4/5YPOXm2+GDVimL1Hb17vdXAe6EdIEUmXch45QxhBXj8Sk58aHE6z7Oq6eHC0/vgyuPEvQ7EREQc+olxi50ifVRO/R35jHrrQO62rZ7i22rBsXLrMCzvb17f6i7bzCtzZRbKqtq5pmliF2cZCJ7e0BH0U4XxW+v8QavcaAmtpU25wbt/6+kJoj39lytNyjIXHH8FNkciAXjZeKn5hgNURpSKfxiUDiQ2OibQWn0xi3spljD1zMCy3mHwn4wx+aUnufjzavnBCoLyRIZhtNe5T6LJGYvzVCK8qIujEaOolMFjPgyp5pe10xxuKcA8x303OROPOzvZVX3peHzOKHQQVQCGsAj8ibZlb4zLRM7pvX0ySgK8aIZbdeRIMfF7bJjRtHZW/rP1+ASOJN8F8jXPBv7ymVl+xknFc6wThDalSNI1yFQ6KRaFGkOCxn2q8jLLvF7zAYJvrK0NSgNJKzilVb0qPer53ONun9tV2rk9o/W65ontqx/XCKIO4aZmY3ZTf019B/sTOGUPsb5OZ4nZ3SQf07v8hwnUN3iWpdzoR7rJpZltEN1Eejq7U1BkTFlMqLABVPZFZ+aFeFu08jRb7AvlTfiE36kYo9lX7tcjlvT0cMrxtgiC5Jp6z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB5288.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(107886003)(8936002)(8676002)(83380400001)(4744005)(36756003)(38100700002)(2906002)(38350700002)(2616005)(86362001)(26005)(5660300002)(1076003)(6506007)(186003)(6666004)(4326008)(66476007)(6486002)(110136005)(66556008)(66946007)(41300700001)(6512007)(52116002)(316002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xKUY4rm/oc6oYByYuOR8lQ1ZgqQaOkPUxbXtsj+xvdphtEUDUNyWXc9BP0on?=
 =?us-ascii?Q?nFnBE7JtPt1oj394PUCcZBcRPAGUp59WofXxwcFLcBZgEfBrQPuxYt77NsMs?=
 =?us-ascii?Q?1Rk+BXqm1VtQjvOYB0HKJd65/2UP04EbFiPEiAjHfVGzbhy+ocrf8CcawsgB?=
 =?us-ascii?Q?FsxFpdDdLotVeNzKkhwQtWBxXdcA+9/4mdp4wO1daHQBkojhSvh55/bhtjNg?=
 =?us-ascii?Q?ijAow4p0WAGnLMQr1WrJxi4yIsCNOaAqtTvEEX7temPObwB+9MePcDvqO7h4?=
 =?us-ascii?Q?nmqIQ1YxqkcxyIry8WzfSjkj0bEDqWPN8ve8YJ/oV1i72dAPCMSDBq2PMBzU?=
 =?us-ascii?Q?B/RbLVS0TnL7Z1e3P9nLLhkoCSN/PchfXRRaO4pymyzZQ2Z0MG1a251UJrZ2?=
 =?us-ascii?Q?1BrPnXi12c/cuvY5F7ikVdRIaAc+YLP+GfGSHjrqt4b2dVVZEDu6WY6DxB9O?=
 =?us-ascii?Q?/dngkyxbXfTITVjIxp6wroIwkDMfObvKLk4R8xH34YzHTZ/uC84Rw0rusqz0?=
 =?us-ascii?Q?rRRfiCDRWD/maJ+BCRUAQemXtGqNxuxM0HZeGo4LfHpDpe9nuyxrNfPc9Wk1?=
 =?us-ascii?Q?OPOJpYMho2R7Sa+mCl0oe4aYAnG2SA17c0NAXOsFH+z2lV/71pyVSCcExeSa?=
 =?us-ascii?Q?QqHBPGY9hAdr/23jRCxziCA1QFTq3vBztXan/hAoK8wKEZQIlLZ7Gw4hhRf5?=
 =?us-ascii?Q?MmXSgI61ieeglOaezk5BKP6JPkkjK7Utzyz82Fqi+61X1TZpC9bIlXOldzWK?=
 =?us-ascii?Q?yLY5gXFV/pqgF+X2FHxOTE27XCH+656K8MCSrljRNQSfOJI5M6zyVak19PH0?=
 =?us-ascii?Q?ASxnC+W+ZmCUkOuFvTXKo4ReAbSfPUcUdD4Jt8YJ/+OhsdGPOn92YooMi55+?=
 =?us-ascii?Q?ZjMAvg1ImhXVKbOBu1FBE8b981goV6xhbFjWhxAdaCsvJ8hovbHrrLiQf/5w?=
 =?us-ascii?Q?9BRMcD4W5Nbjt1KTg05xYOkP4d2nSS9pexel42qaIm4h8/0swo88khUlGAdO?=
 =?us-ascii?Q?GjoAFS4Vd/kXxfWg5k9bcWfTyO9Qk3UCyWViWrjDUBM38c4RhVmaCYAT4OXB?=
 =?us-ascii?Q?KziiXOHkOM4QRPLWxWfpXqhruAHUJggOpDggcu4tMfNYcQPnsfAgiO9Yxytl?=
 =?us-ascii?Q?0YJgO+USVOnSwNr5Ok+1OXwz0wmCBEQFPu9J1fXupgwCopUS7pCNBk/V++u+?=
 =?us-ascii?Q?IfgpWthYwCNQr5tBtM8MmTtv9m9WXvEh6D6rT1MCD6WROr21DK0Jx4w6rMFk?=
 =?us-ascii?Q?HkA+2K+roNgtaI1TFXnW4E7ib7DjDRNgsMq2KnfjCyc4ysrOz4chDKhT72gC?=
 =?us-ascii?Q?u5ycYH6zECegD4zXdq746AeOo25NEf8oNVm5qjckQBR2Ni3Siq5IuNydk4gz?=
 =?us-ascii?Q?YXSDlleZ9YE7VLZFJmt5mOkJJnbchnP8YkLF/rYgy/4d2Z30tbIqiyaI00A2?=
 =?us-ascii?Q?WEmwhT7pkqkHpP8qWRY1mUIvmARi9WwoeUCqCah3tu9Q4IGnRO8mx2r/Vrnf?=
 =?us-ascii?Q?+xUkY7p8gK1gnpTgdrWfGDnWrEGHrsQuj8OAqk66CnuFr2WBQseDHZI3tOTP?=
 =?us-ascii?Q?7ybeowC4r1825oC77L2uFPPwNd/GEvgqPGAaDG+1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d5c8a4-2ab8-445a-0650-08db838097f5
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB5288.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 09:07:33.3659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ionePz8A+/fhbAGZ4VFaCfOvsE4jremFEtSEZuwLzkb8AiE4SZSH5UjzENzlBpiFPTFM43YXVt59YX8lJbKe3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB5912
X-Mailman-Approved-At: Thu, 13 Jul 2023 12:53:45 +0000
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
Cc: opensource.kernel@vivo.com, Minjie Du <duminjie@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make IS_ERR() judge the mipi_dsi_device_register_full() function return
in nt35950_probe().

Signed-off-by: Minjie Du <duminjie@vivo.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35950.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
index 8b108ac80..4903bbf1d 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
@@ -571,7 +571,7 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
 		}
 
 		nt->dsi[1] = mipi_dsi_device_register_full(dsi_r_host, info);
-		if (!nt->dsi[1]) {
+		if (IS_ERR(nt->dsi[1])) {
 			dev_err(dev, "Cannot get secondary DSI node\n");
 			return -ENODEV;
 		}
-- 
2.39.0

