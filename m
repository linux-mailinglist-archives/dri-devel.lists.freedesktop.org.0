Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E13445E82
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 04:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA3B6E141;
	Fri,  5 Nov 2021 03:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2137.outbound.protection.outlook.com [40.107.223.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4121D6E114
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 03:19:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpRXePvimk1VS7wUd9STbbbP3wuu9qyTM5fKM5naYuaAg+bs2xq/nCvN1luEQ3K7gOEjS6+VyNsCZ3zdmmRs1NHn8criPlykuz2+dQR2+BHcDZzw2PEHi03vRPTCmiGQ6BfkzsUj0KOzNFxW9GE8XUkfayWb9EXvezu+jD9rtIVh6FosXKI8/ZMsQ9zCX64L/ui/eSqXKQTZsI82Uos4D6rIANM9Y4XjkbdijvByNQv9Yr2uVhqVFohKxvW7lE4vCxvuHl76Bk3cdvsyDd91BFV1U76/yLX/N4dex8qgrRHnZnhzNMAjFvzYqTVBMWErfJP6FElEA+qec4NO6gq91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcXEx1GPvsg6ED0t33FFSJvqci2SrnctcPjfO/WKyiU=;
 b=ZjNCAJXBQmx1Mi7uB0rREKeTUFrvcjjEobiUHS4G6vOd7QBQwRvRP+1roOfNALGsFLVXU5b/PJlqQRZroE8LM8E0D2FAOkR3trpryTcKN/Y7fNpZL4zMVoq8zs8eFWeZKVaWQ8+EUSsywIUzNDZObotoigOn7ILqJqOrRw/DdEIqIsz5dy40n9S+WYvWmSb7TR3cKchTnnLqbKfuXNRfUXipC5fE7o0LI3Ckg3I1vhlZadZf7SCY/D4gBAliSDBU4UhHAkpuAWCpyG1dJklj/nrZVXdFZuo+iQoJwmRaOUkVvRbGqcJAbvW9eoolLXuMQrmciI3ALdOU4SXwe2s8Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcXEx1GPvsg6ED0t33FFSJvqci2SrnctcPjfO/WKyiU=;
 b=j9aI74cnuruy5qeG+dA7QMhey71PmrOcA/oj/+JKIrX3uwyG9i+M4bSOuem+1vnQ9+fFYuK6Ed2eh3ho8ltWLO3rSOvgaxQ3g8CXwO15ArAVcR9hbZE+Eko9781BIEfPoTZyjoVyRgyc5QfQOgYhXbSVCUCsYfFrT/McStR6FFM=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6438.namprd04.prod.outlook.com (2603:10b6:a03:1f2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 03:19:38 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 03:19:38 +0000
From: Xin Ji <xji@analogixsemi.com>
To: a.hajda@samsung.com, narmstrong@baylibre.com, dan.carpenter@oracle.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, pihsun@chromium.org, tzungbi@google.com,
 maxime@cerno.tech, drinkcat@google.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bliang@analogixsemi.com, qwen@analogixsemi.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v12 2/4] drm/bridge: anx7625: fix not correct return value
Date: Fri,  5 Nov 2021 11:19:02 +0800
Message-Id: <20211105031904.2641088-2-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105031904.2641088-1-xji@analogixsemi.com>
References: <20211105031904.2641088-1-xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:203:d0::14) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HKAPR04CA0004.apcprd04.prod.outlook.com (2603:1096:203:d0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.13 via Frontend Transport; Fri, 5 Nov 2021 03:19:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93f3ed15-4924-4884-eb92-08d9a00b1983
X-MS-TrafficTypeDiagnostic: BY5PR04MB6438:
X-Microsoft-Antispam-PRVS: <BY5PR04MB6438EDFE0BB4AC65F0A5E5AFC78E9@BY5PR04MB6438.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aqcT56nVOFUnHYHHlzOV5sMWxJLjUNKzigzo6pOE/eNC71aLo3SwS1bDhCiAjICfeTyPA2Rh6tRa1wKAwOCEYLqsD3mTFI0YBV6Ny0KIw5CKbN2nkOWLIIEbZR/FB3DFdxbX6q+1cF0VI/UXFkKPDf8QJrHZRs3U37qG3yjiYHSh65owfpBBTwzxF4uk7aLz8hldphyvMuGVWoaUiqQuZ7xo6oajqDjF3RSi+Jko5v6Vy3ikkElyyW4H4HrbKX2+1fLbMox+kkZ/s8myNaYLghPiMzGAHS9gv1P+9tWI0UO+LBT12mzZWH50liJ1m7XQiQz9nTdsUo142uxZvlW7mgR/zZDCB40YC4Rp0XnVwPWhvuDiI6e9Y6p6ZAsOT7YsjoOuq5ZTa9Vnz/Tu6GwECBQwLeGD4kqddTp++f5F6GqfjGWJGfU0TVrDZSl9wgFG48Fg3ug372zwnMvtQi/N5bizWc7EZKfWH1w1gF91p5U03+Gpd0BD8wLX7vlp1qc9t+g8ajF0QTo+L5Uwl3LWwMXXFtOZP7bEDEeXmTk5fMWsWDN5+VOoKJ4RCxgBJ/9E+W0DvvUtx1uh0P7Bt6GBMbKHdatfCC4H6roLJc+oL1laM71AsK8aZkC+Gjc66ivXoKhDmegybUeN48cEwl1NsN/8xR7teS3v2/Np3Ta8eZ7Ljhxy4W4uIeij9jkGYg54EXB/y4CcUHP7+HUDDAQnONLnpYdGbIezvHQhWc3UEkI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(66556008)(316002)(66476007)(38350700002)(55236004)(66946007)(38100700002)(8936002)(4326008)(7416002)(508600001)(1076003)(6666004)(4744005)(83380400001)(8676002)(36756003)(86362001)(921005)(26005)(186003)(5660300002)(956004)(107886003)(2616005)(2906002)(52116002)(6496006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oTRCH9uATP3CHu9eZMYxi1MYE0HTOd8xQlWYAhcIsoXVGe9w9gQ6rZIKzDeG?=
 =?us-ascii?Q?+qNwdSRDk0u6bHsny6ItKs43znOYmW4mVKBY+X369wzHVLk3CO0uvgC06oGY?=
 =?us-ascii?Q?sZtxxnPrW7tHkaV0nDRxZQHOHnyLgVu2Sk1L0+6DNMUK6yrrno9GelKhQN18?=
 =?us-ascii?Q?olLNKXAoLa+7wdFF064/mCU/p0pzGIEpHugb3A2oc9k6K+roJfJS+C+wcHfE?=
 =?us-ascii?Q?wqJCYWUqONjrR3pHqejpMi328BxVPPU1uVx4vANhlOTfJPMewwRy/1kxE9Wr?=
 =?us-ascii?Q?3mzg0B1qE4S/X0kBI5Qb7pV021ebQmVn4N1PjTrIKGfh6aKvxR74qBryCmxB?=
 =?us-ascii?Q?k1t8x33AWIhPKO0pC9etqsMi7IX5LMDutDMBZhW/hpYv5jWggRUtC5JyCs++?=
 =?us-ascii?Q?zi4VgX5bLpiOfHlnFHFoGjsKCKooxNkqYyscskaTykvs1Ih9gHptHKFRhBHe?=
 =?us-ascii?Q?eM3A5s/GZDjkJ6fetwOJriqsE+x6IKq8DHs5J1SPOuf5TUgBXyzFXTCBJDhz?=
 =?us-ascii?Q?o3m9QOYeue+kttei8wpmmovMQhv+aarf4Q+ZJsqMCfyHc99ak5H+tUxo6DhO?=
 =?us-ascii?Q?9co1O2mSkSVKstWATHGHWKqbikWFZzoEi2IzGXZhvI6PxWZdHqBeE57/2ovc?=
 =?us-ascii?Q?MFCc+AQV9WVmg7OaY853Bbmp0+HC2U5W1bI/RdG2K6woG3IQwBmyVT5Wtudt?=
 =?us-ascii?Q?Y0aOj266tQElyT8IZoZiIQdbDHsv0eiqYYyvYcXmfiC6H/3dxudgosa1QCon?=
 =?us-ascii?Q?IdJZgUzo12HyZtbEu9AFDqHhlso0ZH8bXxwe3Wk/942Jlg4xTNpJXAK+rmbz?=
 =?us-ascii?Q?zGNaFkvolGpKylyKnvPc3Rb7txiOxIwbEKQJdvfiKgYuqAbHs0NDKJ4Ld4Le?=
 =?us-ascii?Q?M1IjFXh1xCsGNHU1Ogs0JNtieCOo2GtMVpT71dexlnhDT/YCS1Of4pKCDBC1?=
 =?us-ascii?Q?1iJuWSYSrKjvkIFA9/0CW6Jxgju+8Jdt0xquT2LEzFfpqFdZ2YobMFLpC4KJ?=
 =?us-ascii?Q?gUWO3BzLbEi5vqhjSXDgyA80ftPs/JWgp16KPsJ9UiBh2myWwfcvcSsMFl14?=
 =?us-ascii?Q?YGW49j6z+QqbO9Wio+e3GuJy5eczMclJ5n0cXiPy8bhXBE1uD11CKhGlxBTZ?=
 =?us-ascii?Q?Q4OWtXK6fzcng0i4/TR9yQJcIfr5m46asbIC/56DeXAZoeIWeRQ2d493YfKq?=
 =?us-ascii?Q?g/bk/NmhkgFsIvz8s+mCJs+hJTz/gbXq7nn2IytAGs86/DaNc3c7s3AJ6SjJ?=
 =?us-ascii?Q?9T7FaxpspvdIOjms/9JgFEdosd91c85yIHoNp6am+1lyh/GEp5lRnLrpjp6D?=
 =?us-ascii?Q?Ie8NQjoVWT7J5UeWEfXqCpLXYER3+wRbIztvtDevcSQjL0Sco4gcItqN5ZWJ?=
 =?us-ascii?Q?NQtgwLdBIn4RLlajOVnxa/rgYNN5Lv5ZjFAN+Wjb5UUaVcY37mDIrOR6tgwA?=
 =?us-ascii?Q?V77JFpl12e7mrm14B7cP7M6Wz1zvZASi+BO9SXnNVFD9VCQDI7PKe+HKrdLG?=
 =?us-ascii?Q?HygNVpGtctKCUVxEAkmzEx2SXsSoLBAH+jbgnf5P/i2TID364MG6nyl3Jo+9?=
 =?us-ascii?Q?XqBDk6du7RFKQ2SZPJpIfc7ikFWxMw1LoLsYw2KSfCy/UAeZ62HEnUjxuFVX?=
 =?us-ascii?Q?BCcd6fs3g0cSvwNlMxyMfdU=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f3ed15-4924-4884-eb92-08d9a00b1983
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 03:19:38.4190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Fir9mUlhugHHjL+v6g061mAsDfIxjDewJnrj/HWlJ4/v8SXczc6Cy1h540aJobqNNn0vx6ZdfqWCQcRspWM7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6438
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
Cc: Xin Ji <xji@analogixsemi.com>
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
index d0317651cd75..f48e91134c20 100644
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

