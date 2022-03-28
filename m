Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 157894E964E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 14:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895A410E28D;
	Mon, 28 Mar 2022 12:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2111.outbound.protection.outlook.com [40.107.237.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C8810E28D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 12:12:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4VCxqMggcvkW3C9dj8t2SGQNpmtVahoBgixwWQhixMaVRKyJPyDdbaRioI6oh+FgPNj+B9dmXuVnl0J16/q+Qqtm45DudqGgKb7qJFVE83l8pIKSORqdg0XaMKZeQpFybPQOaXBzhPhmjZeO2ZaxPA0XRPqRXc9sst1RHTVgA25Xi3NB1TnmZYJOJ0aLS8k5szZCEG3P5+h/WTLxCMEfT1jVzKI2A+mQ2jV3glNa7JvPK4130zpNaxx4AFpkKK1EkG5MiKVF0+E/Bcup4W04w6X7lIQ8ZX8sNZrAw13jQ/SFr6ps4gzU7BsftFD3NTNXaRXKgKvwXtfa2eh2hEl9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6wmurCUafD3OSxUP7M0ca2dU0L6ywOZT4i4P6S+8E4=;
 b=GtoWppOSi5ETfjOaO1SZB/LmQEthRHHz6DSqYKX2pE1mBaoOo+kKiCLJ4H3O0noj2w+ZPOB56W7AAxcz4vOJW7e52F825+N8Ot5pzM3igjZUtTD4bBJS29DAbS/wrcHg9Od9ZblVpoWSB++WK9m0LP8gjCUNBKW8KbxXtQm4hjVo4gNHqxrijx3YxrK3YKQoDk1frJC3aphufkAI8pfttSEkKv6zuqEnmiVPaaW6Qhv1S35gKXYQ8HELiy5lcJXn/MBhJBV57JIqtBBiNu9R6HATeHZoPjHbwBnmatVmclaPy8FFftMpJV3um/3X4geLSiGndgKWLJd2fHyrGNy95A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6wmurCUafD3OSxUP7M0ca2dU0L6ywOZT4i4P6S+8E4=;
 b=aqVUaTosKUm4ci7LAs22aBKBrsdcLzuCQV45xGzZLL2ue6JXU7Hugl95hEmZF2IjktO7zyv7uXC6ajdsd+Pz0Ax2MocbtidzcwwEPZwOOZLntwJV/UHGT9G45VMhRP2xz0kNr6RyDD1e+LxaG1gfwq8VK4yKD6oLrcbLhyWSYM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by DM6PR04MB4170.namprd04.prod.outlook.com (2603:10b6:5:9c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Mon, 28 Mar
 2022 12:12:10 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 12:12:10 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH 4/4] drm/bridge: anx7625: Use DPI bus type
Date: Mon, 28 Mar 2022 20:09:55 +0800
Message-Id: <20220328120956.1848795-4-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328120956.1848795-1-xji@analogixsemi.com>
References: <20220328120956.1848795-1-xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0174.apcprd02.prod.outlook.com
 (2603:1096:201:1f::34) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcb2e2b0-d9f7-4a4b-7e0b-08da10b42f9d
X-MS-TrafficTypeDiagnostic: DM6PR04MB4170:EE_
X-Microsoft-Antispam-PRVS: <DM6PR04MB417004CC17A0E1BC82BD481DC71D9@DM6PR04MB4170.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 940M2wU5dUCoJXLTLCx90tQ8tL2fSmkRi3Nhe00gMA/NYuPXSAh2FMUmfn73Xenh5yE2RkBD/qMN5ZmzK4UGQxUG0Ezvxxvs/6Z/wMHxoI31MAMbjSYqcQVG5rMS2XlVSDqaVtj40WeTuU5bCFqL/yXXXaxuDpDSQP7Y9x5tly6P9TNp5RQWfVEcmkJ6oyj43IazJST1fp6vV/FZQf1MI9asktDnb7hlwqEPhNm3Bo5+355RXMjPh1ncpUXcToM/9GFd8Ij0wct8BVV8szIg7ufewdncbpMZkNfswYuD7c2pGwM12DdfHznSxc/ggn10e0JmGeP6qeMo5+O+nkqwVTSHiOOVtVg8vY83xvH1rHz+i0p7ulajPebt4Dub1KuWvEMAkT3GNvjycZnWNbNOr2+73eh4WrFaujzmLl8LeMO2F+YJpvqemX/WE5tWnGVd4w9czpKbNz/hO6GLiJRai7T549Z2o6/4COMrUxfGm++b9L1FyL2uOq+hUoT7f6ImLgVrogOkAdzw3PojpldM1xByY2NwMXnCwobJXxSK+klEW2kEEyib3XWv3uhscLxrCGG7VxmAtaxCml5o3JBvvN6I1B8IUKom5EUevPVqI3UWMuMBFe2jDEle55WYav4bXYFkOy/Xehs5UC1n+fJA/SWU8TqcYUm62LTtg+1B+VJ6S2GVT8ZxK0FS7jyinITfuqSRgnndvH/GIWYi6n3skA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(8676002)(7416002)(2906002)(110136005)(5660300002)(38100700002)(316002)(38350700002)(66476007)(4326008)(7049001)(86362001)(52116002)(55236004)(66946007)(186003)(6512007)(1076003)(26005)(66556008)(2616005)(6486002)(6506007)(83380400001)(36756003)(508600001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w4pD3yyqZxYORSxta9mHXSFU5ir8G608XYh4NpaYkDTtSgvZ/3IsWzhxMwnJ?=
 =?us-ascii?Q?WRE7ulPmGrrzQQlohQqz3nq+AWMND/9O08NoBxVyLF/PQtA4ykvU9DE/hLq/?=
 =?us-ascii?Q?qcyy5XSYkXIaxX3U/ptJ0OZ3YBHOFGkMYW9LJKtOul9X1le8SeIVQbkZrZ77?=
 =?us-ascii?Q?AXwH1zcB5nmvJyVbKjJbDh/2ZTHeV55zyfL0TwxWtTDIo3vftQyaZmtbMmXk?=
 =?us-ascii?Q?AvTQCmAcoPE7OiPDaHkeUDbFxPeewCRTuDzZZj+K0HxQvAF9R0IEdKQ/Bm0u?=
 =?us-ascii?Q?2rHLmVFpvCc9GyUORj4GFdUC3LM8+TlAL6msEl7zrKvsu37HKa2mo4U0tdRV?=
 =?us-ascii?Q?VgEg95sRER9eDQSQrz/9vBIA+NV81QUiacxVFdFv2mpPFncrbu9jZ9zoeY+g?=
 =?us-ascii?Q?AWwiUG98FifzEIumBVEUtCo6bbc8DZZnaG/ehGEh/96cN8vEF3TZ4/FTk8bz?=
 =?us-ascii?Q?3+6O4h+u+Pq6M1bsIohsDD8k5aDn1Iovzc+Ol26h8aAhRKni/0rDtUIYB4/A?=
 =?us-ascii?Q?0FSK9j2hE278bbf1pr5IopIt3sI+14nGEcPLgTeVjju7oI4iV6kpXZ6jPN4B?=
 =?us-ascii?Q?3OMNRUqWJ18cimgCCQDtPtJdLJdOrjFiCtuj8rV0V8H4w0AF3vC08AO4XFN3?=
 =?us-ascii?Q?IBjWsa9eCveBS/J56talwPBq5wkKHPB6ZsWTe2wU48Zn8Ybt3QCRkiFQjN07?=
 =?us-ascii?Q?scI4srZ/o40fhtb0qep8uQZJlJKQN5P4+nEI5RinjImjPBekM+/5FTZYed5W?=
 =?us-ascii?Q?Va4EHjSKl3hsPgcS3uEx95jmGJ9OIHEisBLyxLMFer1H5tyolEpmxyD2pNIT?=
 =?us-ascii?Q?mXeSkm+CcWlpgZcvSbw/nUnadaidIDp5x4GP51m5to2dK1eCGvdid9aQ2duu?=
 =?us-ascii?Q?XhTXwU0ZPDHUwRD3GWsXCJ0JK0BHQcvcvivy7fc6ZGy28lJS+adgwLV/2M0H?=
 =?us-ascii?Q?UqX2BHBq1K1QzRMGWz9ChERxn1Osfr+S5PsSDXMqq9pKQFxVE/VmpS0ZLCkz?=
 =?us-ascii?Q?LQrFMaqCqv1TZzAUp3FR78FaaW1YAGd/x75WYbJyNGTLVPBhFI8y3n74vhq6?=
 =?us-ascii?Q?zRdyi58d8AXaFFjgN+fhc1iF/OSm0uDwJC+xY1IYIkEUk7NxPNvw1gpkQxTG?=
 =?us-ascii?Q?kzO1HKtWM5G1ucKnIsJSRZ2VutZDJg2i2Kju+vVx2ZrOS/vcqRZLS2rzyoWT?=
 =?us-ascii?Q?OvasohqQEPYzTeivK9WGFMtiAI00/VOc9oEW6zqdZgxnGtu1JP6tryopse/r?=
 =?us-ascii?Q?ytnl48Fgw+H1IroHg3z1sFdkFWT3Jj1LN0jI3Rw5uuQnUfYXEYZnCKZ61Kaf?=
 =?us-ascii?Q?HToe9OlZovWSHIIK51PrmvWbL1MIUWNuRXrqcRBAutfVGCEL+u/xi5gigH7g?=
 =?us-ascii?Q?K0/Ud6caxIN1phSl/jUOzay8cL7AJED6qokJ+BjBIab9pjJzb/P1WgRz+G/X?=
 =?us-ascii?Q?w+xw2J6zeKM2zJ8IXuvooCKPfQ2on86vLje1oOxuoh2cm3apDWYSS7PqPBY9?=
 =?us-ascii?Q?5xi7TvJ2NS977Cf0FkHvTMaNiDMx+2+KSqULV2qzHEGO3+KXUBpzoY/klkLn?=
 =?us-ascii?Q?QgPYVI/RvUaPXBlFFg4gi9LUhZzFane6jG102mRBDRE2Px9vSvG0rrffuXb4?=
 =?us-ascii?Q?wPDwbiOR3YgHOMWS4yw5vUSGV3Uyot7kqfni3fFOQNlp/kCaVe2lKR8d9OOz?=
 =?us-ascii?Q?TEQ4p/UwI5gheB7HGebEXi2TUl0FWhLynxglTtWuUzN0jtUWhmcV8EPLkjM8?=
 =?us-ascii?Q?Z1Yo927VYg=3D=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb2e2b0-d9f7-4a4b-7e0b-08da10b42f9d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 12:12:10.6605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9p/4jPjzf8oHJjBbpF4z8b/5ana3iqV2hLEYsRMBLt/+Alf59ZBKS7PleGdmOY/2ffQ4X7EnEU1B2FW7FdK/Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4170
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
Cc: qwen@analogixsemi.com, bliang@analogixsemi.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As V4L2_FWNODE_BUS_TYPE_PARALLEL not properly descript for DPI
interface, this patch use new defined V4L2_FWNODE_BUS_TYPE_DPI for it.

Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 9a2a19ad4202..c528fa2c9533 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1615,14 +1615,14 @@ static int anx7625_parse_dt(struct device *dev,
 
 	anx7625_get_swing_setting(dev, pdata);
 
-	pdata->is_dpi = 1; /* default dpi mode */
+	pdata->is_dpi = 0; /* default dsi mode */
 	pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
 	if (!pdata->mipi_host_node) {
 		DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
 		return -ENODEV;
 	}
 
-	bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
+	bus_type = 0;
 	mipi_lanes = MAX_LANES_SUPPORT;
 	ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
 	if (ep0) {
@@ -1632,8 +1632,8 @@ static int anx7625_parse_dt(struct device *dev,
 		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
 	}
 
-	if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
-		pdata->is_dpi = 0;
+	if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
+		pdata->is_dpi = 1;
 
 	pdata->mipi_lanes = mipi_lanes;
 	if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
-- 
2.25.1

