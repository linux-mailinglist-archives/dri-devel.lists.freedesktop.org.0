Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7269BAEA0A8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 16:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BAD10E2CB;
	Thu, 26 Jun 2025 14:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="HIPPUfbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022074.outbound.protection.outlook.com [52.101.66.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC2910E2CB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 14:33:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFWlORP1laUH43bMoH4rT6fs/C36iFGTZNzxPxQwImOhlhqnpBFViqXXt4vkL76T5lFMkpfFXfiMqE17JfXrUT0MjjHF4FbbewLLbR9ZBLn2GKZxK+tINzOlFHBrpdK51pEqd8f+xScsjPOBwHF++QCMCUEu1t8w//E8KA1XtvCuq94D4GWtLHjuvAJjvlEcD/0AMNNeNeMPBdz6c8nD+4vgfNcAzo0dI6jno2+R9Thw+qrsWcOiAicACoZINftpE3njUpN7o3VhB1IwvheSRRVBtJsOHSpHSgGvX95yMI9iPw6KvieLygZU7BFzIKzVbMRkAuuV4n8ZDm+JWJWMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxb83iDBxh9KCeQ98gWFFBezAdpVYApVN0ZW3squQMU=;
 b=Ixcy0j+YCOPhp501/J5BnbseY90YKqpcdHrKbfoXJiKJQrwGan7Xtb3CuNzEJpATeBg8mBAYbeG9j1ucc4haS4X8kvvr/2k9ZXcJuXBJjkJ9aKJX0edsb49bsd65XPLrTTJa0giwsqC7ByaCF1scRTsSSVGBe9g/vzNau42CSsJFf/7OLvjy16+MrMXcXI5jefvxERWFWs1ru1NVTSoJQKptofjZgbMc6lQnZPiambW1MYLqvRpivVYEkY39vZJeZDGwO13quFoXybO8hcuKL8edD5P5+g2EBi0Z7fOybhqg9bPSzvRhAw2S93io1KKIw8f0x50kt/w1+UwTMtNP1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxb83iDBxh9KCeQ98gWFFBezAdpVYApVN0ZW3squQMU=;
 b=HIPPUfbFT8LxTH1a+um3+BlNzZjWVmcLM1ilFh1yp2Ano4B8jhK8uWx7JDToAVIWHbu0w/e5wKFLKKHyxtPYNQO/TeuEfZcmqQOBmU4Pg6ARwlF96AUGb8A99b00kmYLjnw4gzOglluwQNpl3WOBXqBvZCQwI8Sb+/EeHvZvx5WjjuAs5asgdPTMHZkDGKy7vi1qqn3aI4jW95qfu6pRgogXfjUbfev6wjsCiySrxL7aY62b9lijcjcPkqZRTVNMZ7GqW4g88hD50Nu1DWKzMqhaIMkUvYbsO7BoGL1cudTHApI1YVfA4Us2AtbQSQegtR3ia0jvFOlcDUqmjb0oJQ==
Received: from MR1P264CA0151.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:54::8) by
 VI0PR04MB10758.eurprd04.prod.outlook.com (2603:10a6:800:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 14:33:29 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:501:54:cafe::f6) by MR1P264CA0151.outlook.office365.com
 (2603:10a6:501:54::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.20 via Frontend Transport; Thu,
 26 Jun 2025 14:33:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 14:33:28 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com (40.93.65.71) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Thu, 26 Jun 2025 14:33:26 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AS8PR04MB7911.eurprd04.prod.outlook.com (2603:10a6:20b:28b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 14:33:24 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%3]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 14:33:24 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: dri-devel@lists.freedesktop.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
 Herve Codina <herve.codina@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/bridge: ti-sn65dsi83: Improve error reporting and
 handling
Date: Thu, 26 Jun 2025 16:32:09 +0200
Message-ID: <20250626143317.6887-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0052.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::6) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AS8PR04MB7911:EE_|DB1PEPF000509ED:EE_|VI0PR04MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: 101e2b82-828c-46ed-f03c-08ddb4be6aa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|366016|376014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?FqzbBcxirBK9O+aNPuovTGxkYsmJ2f7oD9Qicx9nOyn4Fwtl7VSzef6IsKRk?=
 =?us-ascii?Q?4AwaB6bHTYpm6Njhy8mVhRWhByym6j3aTTww8KqAMcQHhZTRL6Nea3DM1IUj?=
 =?us-ascii?Q?nkFC9ysGAZwO+fOBDpxgn9S27bLR8gfFG3ss73u8Oy4YfOPhCzR4W+hOGNQc?=
 =?us-ascii?Q?3GIwARUyYVbnAPl5dsydLHDAieIMbSbs3hFXLhwDUVoDUJ3mKN4ui6XH5Ngl?=
 =?us-ascii?Q?WPbbNH8YH/RBBzc7IOAcAUaiDw4DxDPZhb4oDHkXsbzS8GodmDcTnd63kV/G?=
 =?us-ascii?Q?ailcxbL89G604VzgIdBHB4uBPCZGfFrj8xsuUYN+MM5Y7Uyp7KfmEzbhBdvt?=
 =?us-ascii?Q?ErDyti1F+qIvXUKE8w2GDmA2oyPbMQlWkIUCCUuR5UO3SSfOEaRi4lujwapc?=
 =?us-ascii?Q?RXhMhvIWpF1KZ2pWLiECZS8wIntBz7cBZLwUQV1GPqoMix4RgmiD+ZhQxCwk?=
 =?us-ascii?Q?NDNAovRhPrd0u7wn+EBhw5S65q3qWv9A6rNNUjw40pakQuGTz6tZDVwDvWyp?=
 =?us-ascii?Q?RieEYP9afWcUoWm0jWtrBgpt/XGiEujLebe6uRD/YhPSLyxGZ4xhhmc6gGTu?=
 =?us-ascii?Q?srSbUxJGssVXj2i4LwZsx09wyPmtNkAs6/UvsYFXkAvQvSKSVg0L4g7Ru+cM?=
 =?us-ascii?Q?7D281DbS+RgcJlqxtc1bTIrzWMsl3b40kv767JA0c/7jSx4c5F8Foz60qgvX?=
 =?us-ascii?Q?eV1kOeKDD9zfk2eHNe6g9KX+G2FQPR+jY7OmKbvlIie+Y9KioKIdHr26Mj2H?=
 =?us-ascii?Q?2gVY1JZd/09ef6wKViogkOU9vvgrSkIqin+5RVGwxlrs6GFFSlKWSw4Yn2we?=
 =?us-ascii?Q?YtZS/z78zXw1BqUsqUHyTNvfrP169oHv8PN999w2qi9aNYDQ4n+ehVTTPQrb?=
 =?us-ascii?Q?JJHpLGunfIX/HL8DfZim02snFHfFyJGC8UewiwLUEatqaHuM3k5SWPoLSouT?=
 =?us-ascii?Q?wz2UudBtXURPKkQoiMvXPVloE6PwPTKEG5Utc1d62BMJINygkLq1DxxYJz5h?=
 =?us-ascii?Q?TYZjVsxhYGVhKdjz1YGznpocrLugn+rqH+3kzM85/r+wp7ykOCVQybeIhe8b?=
 =?us-ascii?Q?RpqlSwn3Az8uqMBgtzPfK+6y9C856TrnbbQaYWedrzkm6SFdzZiJb+Bzn7MZ?=
 =?us-ascii?Q?vrUp2G1XgNRNZquUBCpry3rn9B+JyYPYQ24YJDuvEvijGVgp8WW0dmteLkZn?=
 =?us-ascii?Q?ggGFpu1R4ZGHGf2jaYBTXVLB+KeZ+FJ4j9q4AVD8gCUiFi98uu777ABLHnkL?=
 =?us-ascii?Q?T37/Tl/Bjzzc1aIEECC0O5H9Wbn+zJwQbgEF2dDD3AkBJ/L6JIJKaNvduIG4?=
 =?us-ascii?Q?nncgDJUSmvDpKZz8ZmvXpflin5Dfdw0sdXeiZinKWQTrqgSZ9tsOWBmvk+zg?=
 =?us-ascii?Q?5fOAFKfkV1wyDBshBzDSaRPtj4HnhOmc80h54j9x8OJ3olXPWVQVECseNyD3?=
 =?us-ascii?Q?dIqKNPJavVc85KNJslF6GMw47UgOY/DPQeuPF84gbLjBRVyyVVPF7g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7911
X-CodeTwo-MessageID: e7ed014c-3cb4-4049-82ea-b9ac4353a51a.20250626143326@westeu12-emailsignatures-cloud.codetwo.com
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.8e64d001-44d0-4ed0-bd88-0e403104fd4c@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b084e303-8930-4e7c-9069-08ddb4be6846
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|14060799003|35042699022|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q/Cqlw0Z8UV2YfC77FR1pTsimSDVj3KZRPSXzSY+4Bc3hvi07Aklmw/f5w4B?=
 =?us-ascii?Q?xN2w+iZHzHD7ZQ6itH/7xthCchKe/KeGe8aBYQABRKorKZ4qKnwUa1Oe64ko?=
 =?us-ascii?Q?CvhK+btRryh2V0Sy6Ei1ipVRCA6a2XoEy/fH1a+oQWzAOP5ZvGkYBUsKWjto?=
 =?us-ascii?Q?sT+4YYA55o3uA14sREZoNOk5xbmJxVIhcyTYD+x5iEEMCn472SV4uBbrLuVO?=
 =?us-ascii?Q?8ZezHFzvho2STFCkE6SrMUYKD0KqS6aXUXSnmbQ3ri4CGL6iO/BOIAnk90zJ?=
 =?us-ascii?Q?b3vxuAk/nlZEENAaWW7hthK3V9sJhr3x1i8UUgg9qK/htktR7xY4/1ud4pct?=
 =?us-ascii?Q?6cNQmlwvp3ZunSVfboTLDAaSkhSxesuYJddefdjjoTbI1AJp3OwaeancpGeU?=
 =?us-ascii?Q?yi4cqt1JAf86JgahOFW5sG73wGvwy0NyV2z3vcqvFDollweoAp23YbhToMHp?=
 =?us-ascii?Q?rc9oJehue/+EEM2D0P2EMwN7uXy9llWp38yHap5HeWs57evs7tTorNoXvvpY?=
 =?us-ascii?Q?qaiWLJpuyKcjruzMqzdldPYQE8eTm4FyBZ5mlY3N1S13nn/XVtOtdaI7dddW?=
 =?us-ascii?Q?dHQEK+22WX+BfgY/1+yAG1I30CJ/tpimKigSoghrSnR0BcXpyQguAwHZEnWk?=
 =?us-ascii?Q?Sz1QMZYizST2s3XDqO5u/JqyvQYYjjLbTT3XJJO22WoUj1W+LxK0CM1DF3gV?=
 =?us-ascii?Q?Tt0reAMGbr8HJBdKP9PrAuoF9Ammek4qBe8+89O6qqcRn2uXXZIT9kXsq8hF?=
 =?us-ascii?Q?OIlcdTseoxw2j2DposicoT4u1YPZY5I/UJz/gcZOYKM3Nx649cxYbk+LlYQE?=
 =?us-ascii?Q?HImtQbQdWjK7m59N7GF9XF5PDuVByMAiSE/t/nedAg0onVWphjzrBiO5yndK?=
 =?us-ascii?Q?sPdYiv4i+rJ9tRqvyS5FnWY4ywlnmhB105WOmUMI4ye3SCFPxxjBOah7hSS/?=
 =?us-ascii?Q?NFubb6riDf0oblHou8gP/qIRT+HASrtUe7HENQ6WpuT3dA6A96DOxKxpPKuy?=
 =?us-ascii?Q?VyYCTzLhpDQ2hqikCL4Ya8i88TXZskmuAQnCv4zJfpliKh276oyhObJX7aav?=
 =?us-ascii?Q?EXNrzE/svB6EyJIe1vpMZ+/wMoB5Vm2l20PnY3jwBxW5gFLQqLb38eX4SimG?=
 =?us-ascii?Q?zlBzT10Ec4ImJmkclRiYnoisrq+JJqbUwKVXNWPb8cGbfwKMuhrsB3H/bhyN?=
 =?us-ascii?Q?kUvmU8ytiZu4HejU/bheJIbTa7p8UbgYtjwWvKSenHsViFaqrpxUp+HPev0I?=
 =?us-ascii?Q?+5098998V2CJ2qaUxPkY+r2hc9CrFj/NzkoXCx7pu8Dtn57Y9m56oFe14JNz?=
 =?us-ascii?Q?eOO/Rw3aJfNPK69rr8Qt1jglsDbslbL8OEqqLIf3JNaYmVJr+AmMarb4GsNL?=
 =?us-ascii?Q?Fn9+3wbIf5zgFJBDjaoH1P7hDSSv7FmcQulpZ2dRJPVEqGBE2v98WHoZaq2H?=
 =?us-ascii?Q?EH1ZsuMYNNN/hYHBttreGPeko1a+r0ciM9Cx+QKLis7M+5XO3APmzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(14060799003)(35042699022)(82310400026)(376014)(7416014);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 14:33:28.0280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 101e2b82-828c-46ed-f03c-08ddb4be6aa6
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10758
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

The datasheet advises to wait 5ms after starting the video stream before
resetting the error registers. The driver only waits 1ms. Change the
sequence to match the datasheet:
- Turn on the DSI
- Wait 5ms
- Write 0xFF to CSR 0xE5 to clear the error registers

Don't read the error register (which may fail), just write 0xff as the
datasheet suggests.

The driver creates a timer or IRQ handler that reads the error register,
which implements the "wait some time and read the register" part.

When using a timer to poll the status register, the timer did not stop
when the error handler triggers a reset. This has been observed to cause
a series of multiple resets. Let handle_errors return a bool indicating
whether all is fine, and only extend the time when it returns true. That
also allows the IRQ disable call to move to the interrupt routine.

When the error handler does trigger, log a message that explains the
reset cause.

Fixes: ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error recovery mechani=
sm")
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>

---

Changes in v2:
Added missing verb "re-enabled" in IRQ comment (as suggested by HC)

 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 50 +++++++++++++++------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge=
/ti-sn65dsi83.c
index 033c44326552..8b21d8d689e4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -417,7 +417,7 @@ static void sn65dsi83_reset_work(struct work_struct *ws=
)
 		enable_irq(ctx->irq);
 }
=20
-static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
+static bool sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
 {
 	unsigned int irq_stat;
 	int ret;
@@ -430,17 +430,20 @@ static void sn65dsi83_handle_errors(struct sn65dsi83 =
*ctx)
=20
 	ret =3D regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
 	if (ret || irq_stat) {
-		/*
-		 * IRQ acknowledged is not always possible (the bridge can be in
-		 * a state where it doesn't answer anymore). To prevent an
-		 * interrupt storm, disable interrupt. The interrupt will be
-		 * after the reset.
-		 */
-		if (ctx->irq)
-			disable_irq_nosync(ctx->irq);
+		if (ret) {
+			dev_err(ctx->dev, "Communication failure\n");
+		} else {
+			dev_err(ctx->dev, "Error status: 0x%02x\n", irq_stat);
+			/* Clear errors if the chip was still responding */
+			regmap_write(ctx->regmap, REG_IRQ_STAT, irq_stat);
+		}
=20
 		schedule_work(&ctx->reset_work);
+
+		return false;
 	}
+
+	return true;
 }
=20
 static void sn65dsi83_monitor_work(struct work_struct *work)
@@ -448,9 +451,8 @@ static void sn65dsi83_monitor_work(struct work_struct *=
work)
 	struct sn65dsi83 *ctx =3D container_of(to_delayed_work(work),
 					     struct sn65dsi83, monitor_work);
=20
-	sn65dsi83_handle_errors(ctx);
-
-	schedule_delayed_work(&ctx->monitor_work, msecs_to_jiffies(1000));
+	if (sn65dsi83_handle_errors(ctx))
+		schedule_delayed_work(&ctx->monitor_work, msecs_to_jiffies(1000));
 }
=20
 static void sn65dsi83_monitor_start(struct sn65dsi83 *ctx)
@@ -639,18 +641,13 @@ static void sn65dsi83_atomic_enable(struct drm_bridge=
 *bridge,
 				    struct drm_atomic_state *state)
 {
 	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
-	unsigned int pval;
=20
+	/* Wait 5 ms after starting DSI stream */
+	usleep_range(5000, 5500);
 	/* Clear all errors that got asserted during initialization. */
-	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
-	regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
-
-	/* Wait for 1ms and check for errors in status register */
-	usleep_range(1000, 1100);
-	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
-	if (pval)
-		dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
+	regmap_write(ctx->regmap, REG_IRQ_STAT, 0xff);
=20
+	/* Start checking for errors in status register */
 	if (ctx->irq) {
 		/* Enable irq to detect errors */
 		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, REG_IRQ_GLOBAL_IRQ_EN);
@@ -929,7 +926,16 @@ static irqreturn_t sn65dsi83_irq(int irq, void *data)
 {
 	struct sn65dsi83 *ctx =3D data;
=20
-	sn65dsi83_handle_errors(ctx);
+	if (!sn65dsi83_handle_errors(ctx)) {
+		/*
+		 * IRQ acknowledged is not always possible (the bridge can be in
+		 * a state where it doesn't answer anymore). To prevent an
+		 * interrupt storm, disable interrupt. The interrupt will be
+		 * re-enabled after the reset.
+		 */
+		disable_irq_nosync(ctx->irq);
+	}
+
 	return IRQ_HANDLED;
 }
=20
--=20
2.43.0

base-commit: 78f4e737a53e1163ded2687a922fce138aee73f5
branch: linux-master-sn65dsi83-errorhandling

Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
