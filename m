Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 209324B8376
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 09:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4791F10E83C;
	Wed, 16 Feb 2022 08:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25BD10E839
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 08:59:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6WrWP/hv+2FDmWK37kaixbQdPKeh1BR4tErh58D3mS1m4+MWSEukIViRFJhm19BcczSBjHDaKrDE1+DW9oWBBTMQDk3VFvr4yo/99s98h7fDD4Z0ffFRFeIKPJ6XCGbqBt3QYUrbW7D/cMrhmb0bxJ3hIR7E+kz/oFNKSYoQ4pRCrSve9LjZRNcuAPggiOp8D33x98UAW6o3BXSKY8HyoT+7up6fQWW+YhErmlSduArKhJdqw0XoXQtUvz3kcwSI9jQEkkzLdp4VHYny8UBRoBGrMKh/+Dk7t5fCriQ4zLde1Ixt4urFgchHfJRzoIoY2w4fwQCIOy4Mk/RsUdFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOnawplqAuAvBAeYlX8xriQ7Rq6wHLANn1LuB6a9yy8=;
 b=oFvKZoIxxd94iNJam5te675fEFbM3DoQiOcdA9+mzbqsW5v39xg3Osh8rvnwLX0KcGJ/qF5Ph3QU2MdBrqUMNtFJS4H0qin4jRH/Zd3ZzU20Nduw9TvDqS3Uy57BsDTCUkvMlgy0uXA5ybjEALzXXR8TLaPQ+XtczpcO+hhBkBjMzcIwV7Fdfi84JWsKc1yd2xUKP0WtuLdE80x5zsoqZXfA9DQn3kZ+MV4vAIxA1FYfqBiVIWIf6cvOVKeeQGINHGi31xzhJhovoaa4Y50XyGFOwjKB9G2BkUaUJ2yUzS1Ppfs5T8iH8XriuxfCAbycCa5sA7eBdRRW1Ycls7+r6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOnawplqAuAvBAeYlX8xriQ7Rq6wHLANn1LuB6a9yy8=;
 b=OVoyBuRHw53ZtmnGWIIVTF5IuA9XKm5dh6qvtEkxvMo9n2O2M3pb3z137sdRs0fsWkCkqxzjHWNv61ntYYDZRRt10eilmc06fueHD3Y6cwCXoFc4gPnny5XsbN768OESG1vAM2JjnPmHvPJYKK1yXErnCgo8UnG8vSxz12W82go=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB4078.eurprd04.prod.outlook.com (2603:10a6:803:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 08:59:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 08:59:38 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: nwl-dsi: Remove superfluous write to
 NWL_DSI_IRQ_MASK register
Date: Wed, 16 Feb 2022 16:58:42 +0800
Message-Id: <20220216085842.1973868-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7378318f-5d53-49c3-ad30-08d9f12aa910
X-MS-TrafficTypeDiagnostic: VI1PR04MB4078:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB4078CE7BFE2F8B497293A73798359@VI1PR04MB4078.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ItmIqHp4FRBVUC2vfEAdWX2Y3gd3aF/8206Z5/5g22U6i/XkkYCkC94IA2ugqlnp78KPcWLSip1j5+oC2c0f23AjRVENNUQLZBXfBEn3AbuaeP0ImUKC/lDPM4RSBUevWaDjNFrTZnyWPfTFhKJ7/I5yXakkAmgZpVcY7Gls5O48nYaalfUDWORHgfBuwLeI+GhM/uCt0YB2jIHLehe/tSB+HppnlICAjwSUZBqdJJNr5wdAbiqYs0G0PYQHjfLFnG3cEd787AMTAgl7fX01x1glgkWjxJeY1lCaWhvDR174DccMSs/MGARTuRQ8L+NjSRGls6YtrawsJRCWB/Fra7QVHmXpbOyYT2vbdf2eSqKHSTbil2uQFElokEYAt/BvyoxHmoSEf6Oc4RJvLnz6TI0Xc8BRo6MKvQ4PKHOp0qghq9MAs3e3QuaGs4ZBfUMH2KS077lrrN/eFW80ZXWAuEkYcw93GN7nshdbgBqmm9szIHZqWO6BPATg77ZdyyHS5/P/JTTSKjqgbUZ0t6V3ZCxIiEYSPhkgPghuszKcQe+2goB2GLtXxF+HrqEXF1e7UQHnQ+IM6Nx4cuC98uaPwuNxtROrKtb1X3CZsGuKqBE8GwMeQxf77xgoQIsGPBRw57foBaz11OUAbZj+Wdvqfo+ryemys6LUWvMeLCUcBDhSULXbjfYLHgMjfn8fDCDdgl0jkYkwensj+Yj0OnnC/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(508600001)(26005)(1076003)(186003)(2616005)(38100700002)(52116002)(6512007)(6666004)(36756003)(6506007)(8936002)(38350700002)(66946007)(5660300002)(8676002)(66556008)(4326008)(66476007)(86362001)(316002)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dqis+ct8IK+K1ZTngO9z2UbKm4MYmS8hMQp9iZ23FLVDW1ltOWAEHiRoyitj?=
 =?us-ascii?Q?moc2hn9wj26HtLkfz4OzdaBwDEno/LnIj15oCeip/52OYmS53P0jCADEDR3Y?=
 =?us-ascii?Q?kFNGGvzECWsPC+7sjTArOcXIYeCbRnVjiNJpnQ7IXAJK8U9Xn3PxhMLqp7cV?=
 =?us-ascii?Q?MNyF1j6kuEm/kya3sT5SR+aOE6UiDe2d6eg8lnd634KW334IVP2u09QB4t6A?=
 =?us-ascii?Q?LkvXUxgLLSMmMmlFV8jAnva5nCYx0DLL3l91Xpoal5fnWBBdqtnRO2oOqx9x?=
 =?us-ascii?Q?8SqqN7wuaWb1YLMc2JO11gPsPZBqH7yy30Y+ayc+BDxJbjPXoSzcgxCiDbjI?=
 =?us-ascii?Q?XJeJCFX5jfr0H0FBiHp0c1kt2MfG5iiMGGwHUEiz+5HWmbrcYzIqY5Gppyf4?=
 =?us-ascii?Q?k8R6aVjFL7+ZeImgPSLZQFUO5ycFNdeipSmss9qNYKxd00R4D9vXGq6st9kQ?=
 =?us-ascii?Q?AcaIy+Ghcm84J8qY9OUCJIUFJ/GkWs4ahV+5pvZ3ZZmFrrshxihDnUWuUWHQ?=
 =?us-ascii?Q?r5RlSEX+9xxdDkbYINmAKRAJ/6zk1576FzTPQLORSKAZBY/7h66qf2dwwh+7?=
 =?us-ascii?Q?II9jMct9XglWgc0I7SG83/lUPPWUl96Iw+mMBcNZpBXUJ6bNMBwpB9Q3tmKo?=
 =?us-ascii?Q?/xyTttJYsMo30bBwJWBPMo++iRc6LDxJhL4WvN+Ystn/f7AebmezVFNE78Mi?=
 =?us-ascii?Q?2S7jzFoIVxMAcnoD82QCZzznk0gdTazBFKkBz+TKnXF8bhgnFkL3iKpTFXh9?=
 =?us-ascii?Q?cqr/v/jwbbWOOaBT9UjcFWvuaChVQB4noHjEDPwOHz5fW4Yl60AYYpRl/PjD?=
 =?us-ascii?Q?HXaQeKCZNPRiqfzTv4IzuK/LIvzOpIEA7UJBtVbrot4OX5PcEA549KZBHazn?=
 =?us-ascii?Q?XLNeokGl6zy2AObYay2Dkl7CrKwAGXi6t5Trsxom3Cg1G0qI++fcg3EWYlBF?=
 =?us-ascii?Q?6XfZY57/8bTytu4U5AxzoTcaeDxJRY8eINbDgfQA92kk6hfyGL/wPN5XYCy5?=
 =?us-ascii?Q?A85NfZlTAWkiWEY8LZSQGEymFDSbgfF3pTBvK67FhFXsuZGE+lkEDQA73sZl?=
 =?us-ascii?Q?JbjJbJrtGxl59DOZDYAsarhfrNhTHi6DcowbuyOS7XQRmxHCF0JYlpdFeE6K?=
 =?us-ascii?Q?lYVVLgaEofbaY9ZgUPLobQPWBxpmhmLoyW6qLavS4QYuSJhYG8YRJnH+tUd3?=
 =?us-ascii?Q?fRERWv0h5zuSPNTz02bSHhOnniFlT/iN9zxCtTQa8n2bValeCJmqvtzySCFX?=
 =?us-ascii?Q?CEWwZYQIvboF23HCx0Qpj/au4RItzT+D/OmjqKlB1aqGBSXy8VouoVTPLUqw?=
 =?us-ascii?Q?Ah58hHsoInUzWr+j5kbh+Kz7qo7kagZ8YNiQWTgxaT5NHhXJCqkfXBSut9Y0?=
 =?us-ascii?Q?PnORFJcNcpHlKD/aGdsIb6tvkOO6Yc/MgzG5FemMIeTNpj4Q5cqvapbFHTdY?=
 =?us-ascii?Q?C7Gyf7KUkcBI+Ed20E0XFhBR6tgDARcvM6IIyYlAzPtwH0r2dQErGvt58TL+?=
 =?us-ascii?Q?pxrxL+qddDoUrQhMERQsXnH3CS4UuAxGgJTg8bvOV/+lW0i4kfh2zWybo4t4?=
 =?us-ascii?Q?9nIfI5aHcgG6oNWZkcjLdaOBsgDqsvAbWFT8o2zNK5Rd8/VdE+q1sGX0rT5Z?=
 =?us-ascii?Q?9BVnxNS2rC5dj2PBRRVjMN0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7378318f-5d53-49c3-ad30-08d9f12aa910
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 08:59:38.0278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABcY6EPFsZh8MfbT8TbYiH7RxvVMU14JwnFsQJa8hw0fCUIgnBrXTaofjadGSrhXeYrTQN8Afhr+Nq/iDIKvTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4078
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
Cc: agx@sigxcpu.org, linux-imx@nxp.com, robert.foss@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To initialize register NWL_DSI_IRQ_MASK, it's enough to write it
only once in function nwl_dsi_init_interrupts().

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index af07eeb47ca0..fcc4a2889ad4 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -333,17 +333,13 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
 
 static int nwl_dsi_init_interrupts(struct nwl_dsi *dsi)
 {
-	u32 irq_enable;
-
-	nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK, 0xffffffff);
-	nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK2, 0x7);
-
-	irq_enable = ~(u32)(NWL_DSI_TX_PKT_DONE_MASK |
-			    NWL_DSI_RX_PKT_HDR_RCVD_MASK |
-			    NWL_DSI_TX_FIFO_OVFLW_MASK |
-			    NWL_DSI_HS_TX_TIMEOUT_MASK);
+	u32 irq_enable = ~(u32)(NWL_DSI_TX_PKT_DONE_MASK |
+				NWL_DSI_RX_PKT_HDR_RCVD_MASK |
+				NWL_DSI_TX_FIFO_OVFLW_MASK |
+				NWL_DSI_HS_TX_TIMEOUT_MASK);
 
 	nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK, irq_enable);
+	nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK2, 0x7);
 
 	return nwl_dsi_clear_error(dsi);
 }
-- 
2.25.1

