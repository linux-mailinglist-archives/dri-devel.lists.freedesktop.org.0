Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6B9430E06
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 05:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B198D6E93A;
	Mon, 18 Oct 2021 03:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2110.outbound.protection.outlook.com [40.107.94.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A30D6E93A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 03:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnL1pwZW6M28s9i7YayOZg9bVeTy2/ueqn8ejb9GFSQo38bwSaM/1Ih6/xdqtf5K34WWHMOm4a/NnnL5z1fc64GOo9kQUgcQulnDgzSf2IW4j6iXUkbch7FXMRNW9hQV+qB/uJzdvPRcDb+uBdgLvYcmqiMqnbZIl2ookwKYqLxxX+g9nit4u4DG4Q6qSOs9Sw1yd5gt74RAmVXYLuajPcPwWZauolwRa89F1J91eL1pL28brNZDdJiipWNB1mN86zblkSjTWCtoAfaa/aTvfvceSrm741v/cidJys2WNQfwy3ZrtkgLfeMYKqwITywhJsojR5ubgHCn4JGeRkN6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62WVvWzK+pB/K0a4jPqlwmMuNIxX++bTARPe39RkU/w=;
 b=c+/P6+QqcFmeKE+yDxgKq6kPuDWgrOXs7opMMgrcWftR//9/OHqt1u/oAY99D8j4V2uCrp9bWV+rgC/wGj+Ul7JY+k14JvOeoULnmKa5p9ySYxPLwQV1lUDEeP2GUsW1nZnwT2i7M28ikAA5jEt7/DqDR4XRpdv9KPXOlwQt50VszbgtHsVWVZnq9bmMvQrF59bW/mWPwTWaZrDXB2KSVKYWHIfxi4JJojEOVMrbsOtBfd5zREPkpRNQmYIXfd4/QEpadrhYx5I9RqUNlmN7kUB0WEayn0Zs/yRvba2oSHe95/7aRRewNed1m8Jzty1p3pW6N9+TD9mV+hkS3+YgRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62WVvWzK+pB/K0a4jPqlwmMuNIxX++bTARPe39RkU/w=;
 b=RUBehavzQOUymTm1cPDIjIBlbJvFW8206odvXg6X16uJ5o30i+3s3VpxxIjTQmSupOa3e0UyvO++zEsDOqi62UeIkeLRk3X2YdIZh6VENJjNfl14kaNXXNbzdxia11g+NiWo/sD89SS1lT/SdohNvpNi1XcJBEDAVH18RCT6nAA=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB3862.namprd04.prod.outlook.com (2603:10b6:a02:ad::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 03:04:13 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e149:c2d4:fd23:a682]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e149:c2d4:fd23:a682%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 03:04:13 +0000
From: Xin Ji <xji@analogixsemi.com>
To: xji@analogixsemi.com
Cc: Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com, airlied@linux.ie,
 anarsoul@gmail.com, bliang@analogixsemi.com, boris.brezillon@collabora.com,
 dan.carpenter@oracle.com, daniel@ffwll.ch, devel@driverdev.osuosl.org,
 dri-devel@lists.freedesktop.org, drinkcat@google.com, duwe@lst.de,
 hsinyi@chromium.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 m.szyprowski@samsung.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 sam@ravnborg.org, span@analogixsemi.com, zhenli@analogixsemi.com
Subject: [PATCH v11 2/4] drm/bridge: anx7625: fix not correct return value
Date: Mon, 18 Oct 2021 11:04:05 +0800
Message-Id: <20211018030405.2055161-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <14407ca8fd8627ebd41e6f37b22a8f4fae3fedc6.1628161369.git.xji@analogixsemi.com>
References: <14407ca8fd8627ebd41e6f37b22a8f4fae3fedc6.1628161369.git.xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0084.apcprd04.prod.outlook.com
 (2603:1096:202:15::28) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR04CA0084.apcprd04.prod.outlook.com (2603:1096:202:15::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 03:04:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e01a2a9b-b920-4b8f-70dd-08d991e3f67d
X-MS-TrafficTypeDiagnostic: BYAPR04MB3862:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB3862271D3917455ACC469975C7BC9@BYAPR04MB3862.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Gi0Bvl93xc82u5a+YskWna/wwLdkL4zdE1AM/GHdIbeOzo1OFXnX5UeKKK9ANKx/MWY62DPMVTfTAIKiese8HUK56L1r5AOOtHOdcuLE59WZPRxzh/apFuZn8HyHSs5E6NORrpJHU53SM7wPrBSmJVB1C+Y3fmVZlOBBt7/LgU/t+omHIv9Wtnz3y1kPM3mIxAh2VzDXd+tqPNhSlvMzI2FtxZKOTi7swEKyGpRv58RLo9vAtoB6ekEp2da720QbGd9UVc14OmxLzc4jU01Rgif5HmWO/K/eIBydzlH3xPouJ5yTfWKeDzQ58eWg9T6Qpi28S2fPuCqs5J/ye1gQUcRPylqbuDNi6r4rQes5/h4STSIphtZeVNe49c/O5GRfdsJNe/daUA87oDAu82JwsE2KatazBd3NPiKbAMcsQTGJF8T2E818UODlInzbPC6P/DLvH6MqrX+G96vKxynNWhWrbO2oo8csTHjxBBL/4XRdOYS1leekp7I2A0UGxZ8ekpCJ+dhlTurl++VepAb6h5akpi1ZD12dMZskAKTy4BOh1cu3xSBBKTs7mbUFn9p+OTENPxspKSbjNPMsqdZNwz2NSQB/xKZJcjGO1F+ZiBCLG53p/Y3TXK4blcI+D4393rmNfRXQAddIaVzUmNQeZ1PJg7Wcp9n6iTIUd96Ngs3MN8lzzxsbIS2/jv0L6TL3/TRqtBJui60lpZxttBE8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(2906002)(38100700002)(186003)(6666004)(1076003)(34206002)(6496006)(55236004)(52116002)(107886003)(36756003)(2616005)(4744005)(956004)(26005)(8676002)(66946007)(6486002)(38350700002)(7416002)(5660300002)(4326008)(37006003)(86362001)(8936002)(508600001)(316002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?53zH5Go+zMRRiWRZTXqTKsLTeHm5rmwXABJlx2F+Z4He+K5BQg8ENXX/IOq5?=
 =?us-ascii?Q?K26VsDS7+WLjbZ359m+CVaSGYe+cQF0Ddqwy7gDSHOGppDk/yYg+Wq+5YoTk?=
 =?us-ascii?Q?RLF9hp0WpNyAwjaiDdzzBb+5m3rPftpVpr08gAA1j6OFNAkjyOjM8yUluCFr?=
 =?us-ascii?Q?J6jsJCpArbajbK84TX/B/aAHtZuYTAZjHRIE0yaB2WGzxbfTeNRQijWZgoPK?=
 =?us-ascii?Q?HqRguVw+NRF+t8y2poPu7YJ0Ykjf9/EEGE9oJd8Www/5B4jiiFUWZdgjQ7Px?=
 =?us-ascii?Q?TwsPj1kCegoe3NgwtjNKFTPgd6qDgAovDOJLAaOqvCzFntaWFRM3vrcuThyt?=
 =?us-ascii?Q?2YcLAdqjApCwjPVUusIFu1JJSnpozFclezAgXhuXVTyH9sQQkxVrPl6TnyOC?=
 =?us-ascii?Q?1MgfCCg0RAP8lUTH2fNxSak1OHLx5YDqQhF32RnpH9ov/qdrh33dLXvRSz93?=
 =?us-ascii?Q?vPHxr5kTiCojFPfjyXf4eaUfzE1v6Z2aESvZ83+doscilcUiNzVOKnYtdjdx?=
 =?us-ascii?Q?ZWOv5MxPvx6BLtsQQy5GN2xfD8UqDcwj8hEZOr/Qfljx895Fv738igIYE5dr?=
 =?us-ascii?Q?odu88qVx2GQ1bKwh8Imwlk+Y1r4wnByiZNCEa4TRDGv2xusAqOZ6xpe0qsNg?=
 =?us-ascii?Q?Ord40J1NUghWfVfiiwppFIUHDYBKoYLEFLGc3vYnFHJbPnhdgy+fT0vZ30Ke?=
 =?us-ascii?Q?5a8u68pkJoVGpx/tneJ3ka+4YMm11al5iuuBSeMsom9IBxClCjY6CLugm9lV?=
 =?us-ascii?Q?KvkpnOLFs8lou6SKVLTYu95Z73LDZkvNAkQJvj5MvzjxsGUE3WUjzOy0zfjH?=
 =?us-ascii?Q?0NvhgrL5xpWG73o4dRkBbJfdmxB0T4oUSHO1nasyriw6bOY/GCPUWyq7aIYJ?=
 =?us-ascii?Q?uQaUuPgVZ4v4aoasctFLgiJazpiSJTxTCppWP3mZniywuZ+fixndlhRlC/dc?=
 =?us-ascii?Q?zs/BpiRsb2HwtT63TO1mvKeApaO2JXIcpt8WaLI3zp/TQf8LLxqroWV+FkpN?=
 =?us-ascii?Q?QIfLWrelE6tRCb7oXOGLvxfnTfXLMKvHVcbqzxlbFUC15WoG0kW+/XFk3rl/?=
 =?us-ascii?Q?32ts45+d73tV4aCwUCNnRWaBkmW5F8g3Ggi9+TXAUuIZL4ihwix4T8xd/648?=
 =?us-ascii?Q?x7AI206zxUKtOXKGBXAlmEe0J7fYHOpKEqUYMZYYd9VdptRqmtfUQsaP+c/w?=
 =?us-ascii?Q?jGBXstBdoXWlGd9k0ijiuDOqgNgjqPPFc/6Qt4NMoqmppKCHEfcHEVO0lO0N?=
 =?us-ascii?Q?WlS4HxvUvhtH/jPRG5vf3yjhl+p/CkK8EIRhGERorfACWYFe1NrLrITEGbGS?=
 =?us-ascii?Q?A7w9DAJaJRmAKx0TFhZ+Fgn3?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01a2a9b-b920-4b8f-70dd-08d991e3f67d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 03:04:13.3056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7v65VM9+vzkJE0Zbtjo4spEbbsBmP2q412VljS15194PJw3/MmGgNzNlmjx8Wc3/yKrQYc80wVTFap17bRC0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3862
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

At some time, the original code may return non zero value, force return 0
if operation finished.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 1a871f6b6822..469037f2fd3d 100644
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

