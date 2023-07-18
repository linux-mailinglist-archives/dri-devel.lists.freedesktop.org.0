Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F148758081
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 17:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E84910E0ED;
	Tue, 18 Jul 2023 15:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2053.outbound.protection.outlook.com [40.107.241.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AD710E0ED
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWAVGkf6ANQOLCGGlJdak+GqsbboNrIT3B9t8qyQa21KkR43kYXpV54erL30k7+gEEtp1n0DX6Yx44iQimy4uluY+qWMcR532gxebSqyZQm5+2HUPXrDtapfH1PshAUU85PCNZGpEzgkP4CW72fnAviX1DJTCdVZ786TMDB5sbl6TnhTmdW/jh7GG0lCP7w6klmwMXigjaZNE3X40PIZB+90Dm7QxpRlylRVRw7gfmAZ8QwicaR6MZo6wkmEG0wRiK6z1bRQ3CGFd80kTUmN1Fo8IvbO5WLNERJowzaBO2ECYbf71JgM4l4mHEiDC5s7lKFdumFDltxNHyOAzjgwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ak9MXHVidtAsYAFVlfhJHUv7MoGB+lZyh8bnNiOLUNY=;
 b=JsVOHJqy0iSCx2sX5gwIfdkIf6t3AgbJsR3XxzBLcduyqGVAieYBUNQDWEnJeXTUDK987gxqZs+5rZH6tys7j2xaUEFJTlPvMGuTSU/ktS6PvXEVrk5llabbfUqBkNSA6TQzNjIKEfu2Zvfe9nTXEtJxLc+a+AP7N4a2Orr3RfDhF+ebjrHdpXupmmtSV7vljn3zYzHcgbTmQsJNl8hgqPr0VeNAv5Tof2NfsIDxOhBk3qJXCPpLcsOTQy89Z+BywBOYDSvwiTmNwF7VQXwoiJFKGANJhl/I43zhPaDq4Ch9vq5SGk3kyM+4KGhsmZtB/gsnv8bJ3wr51mjvIdntfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ak9MXHVidtAsYAFVlfhJHUv7MoGB+lZyh8bnNiOLUNY=;
 b=YyIi+PbycbAsYkuhU33AsO1jJHLM20PX8I6RFD46XZHgs28tCQS41q60SbnhhvaInU+JPbc3lE29eOTPVA1V1TK1R/HYqhV3sDR4ZgNkAzYgqlBnZihYnBwiFmc5dV0v5+QhYT3OF4pJxI9VlRmjKAOBkzPEbnm2Amm03GXItLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB8PR08MB5482.eurprd08.prod.outlook.com (2603:10a6:10:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 15:12:56 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4fd7:91a9:a92b:295a]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4fd7:91a9:a92b:295a%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:12:56 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH 0/2] drm/panel: sitronix-st7789v: add panel orientation support
Date: Tue, 18 Jul 2023 17:12:44 +0200
Message-Id: <20230718-feature-st7789v-v1-0-76d6ca9b31d8@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOyrtmQC/x2NQQqDQAwAvyI5N7BG6Wq/UnpY11gDsi2JSkH8u
 6HHGRjmAGMVNnhUByjvYvIpDvWtgjyn8maU0RkoUBNi3eHEad2U0dYYu37HdgyZ8p2ppR68GpI
 xDppKnr0r27K4/CpP8vtvnq/zvADU3gLmdgAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689693175; l=1043;
 i=michael.riesch@wolfvision.net; s=20230406; h=from:subject:message-id;
 bh=GNOScjzXERVDwwTTAU2ZNKkyZGQj3Ff3agEWGXZII8Q=;
 b=zL36ITx/qbgpx33tj11csWBuEZff9pWQqvRpbfZoMfRzxq6HMzaoWvy4kTEhn8gzty9dYR9wR
 9xFFfRctjIzBSbutJfJPPOM5/61pP6r5fUyIal/1/JiNa7ZGvvVuPQj
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=G03kuYHL670EcdsWaNfVA7KnHWmkSpj98XziQm/hjbk=
X-ClientProxiedBy: VI1PR08CA0247.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::20) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB8PR08MB5482:EE_
X-MS-Office365-Filtering-Correlation-Id: df4ef3b1-eef3-422d-846c-08db87a17725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JbWYt3gMr4JFmItf6WTAyD5XC3xWtkfSGNsURsIi5XChzEznIT1UryHHFQ/UtbxeyRswTJKaoa/wa06V12SkWJ3O/BIRWP4eX6MJWUKvP54dKjR/DwB6/OViA0U2M3raXaoJHz4wdPWUHasUIBMppI8xpijOFVOS4FDZKTA7fOsOzSg7qey+LVbf8KHc9j7656f1xMfkd/M6AbjquSPjlsVMHEAVhAKGaYMNUsvD89SXzUrnl4aEt1VS60eiwhWV+oEl+wcCbwDAGJCr8GcqAJ6IHHq+QQdmsbMY1rPuvFybQDaQ++i64HjmvDfR1ab6QixtQzjpsq9oTTBVbwZxECHwgC3mv7v1Blfd7DhZguUEY25DC4921WnakAi4eySlg9kjD1kN5me9h2LB/p3A9rjvP+jkm/KvYjmxWnJ6WCYZGQLNUTQmVK9WTZFuaEkQNzanr91xcBhsTdKpUEmJ9oZ2eOJkcsPfQd1xxVwx9va12JKb9SWBwdXeJtJcOjDaHRM1/WIrbqBHUGZdvRol/WSNpeQB1vdfo/nnyHzdtJeqkh+QPi+03hdWV9quo4EcaYy9gf1OAdusalY6g9BE/WDpFbO44prEoJQxLrPPZYgDTNw3yb6H3+Wgkj2iE4y7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(136003)(376002)(346002)(366004)(396003)(451199021)(186003)(110136005)(478600001)(6506007)(26005)(107886003)(6666004)(6486002)(6512007)(966005)(83380400001)(2906002)(66476007)(2616005)(52116002)(6636002)(41300700001)(38350700002)(86362001)(5660300002)(4326008)(38100700002)(66946007)(316002)(66556008)(36756003)(8936002)(7416002)(8676002)(44832011)(4744005)(921005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjdneHRSTTJYbFJ6TXViRUducENSRjB2OSt6OUROMldGeHZ1bVNxMkoyWEZm?=
 =?utf-8?B?TGMyaE5LT21ESTFRdkQ3WUd5WWFzemVvVEFQMjVadkdvQk1namo1cXBzMjN3?=
 =?utf-8?B?Z0xKaFQxQVhZMytzRURNK21OQ1ZEVFdLN1RGUXFlMEJyUHlybFFySk9IdWZM?=
 =?utf-8?B?L3RxNjloV2ZGSzdNRzhiU296OHZ5ZkRSd2Rmd3JyTjBOWXlhSThYcnREWlAz?=
 =?utf-8?B?VjZ1ejdOQzU0NXkwQkxrS3FIdi9LUFd4bkFqWmw0ZmUyOVBqSElaVjdpUVFT?=
 =?utf-8?B?Q1VuRmd5eXpNY25VOUxsaHJwVmhaZlE5eEw1NW5yUlFFeW1VSkEyMWNMRWRD?=
 =?utf-8?B?WUJMaHRmMnFIcHBPVlRudCs0TDJaYzFIWm5BSVZWMGYySFBhcHB2SXpiMjlu?=
 =?utf-8?B?WVM5OHJlWnludjZtR2RIT1BselE3RXhZbWJtMFpYd015WElkRlZyM2tyV0pW?=
 =?utf-8?B?SzRpWktQSEQrWExaOUpSYnNDZm10a1lBbnFqYTd1dTBhb1BUVFBrQ0Nqdnl3?=
 =?utf-8?B?YkwyZHdRMzc4aUtTVFY2SCsvS3pvWjdZZGJUaVQybzEwcnhvaGlQZTgweFJy?=
 =?utf-8?B?M0hvWFZlc3RiYmFGRWZzZzlSbTB3a0VXMDJvWTFRK0VZTjJjUWRZVCtYTWE0?=
 =?utf-8?B?VWNGT0l6QWNPUFdTL01CM3dRNTFtYTl1bEJJWXVMQjNqS2svdFlVMGgzYlo5?=
 =?utf-8?B?MTg4YTl1Q2Q5Wkw5anhmWWJvaE4wU054RitYUkphYnVvU3EvQ2FLTUpNMG0y?=
 =?utf-8?B?ZFp6YWVFNWZJdVdWYU4vR3lyRE1IRk5YRkxQdHRYNW5JMUZwK2V2czR2bVBF?=
 =?utf-8?B?S2krMXA3R1dJcUZ3N2F4UGI4enNNVE1zSE1YRTVjcTVIS3NhVU5MVTBsaUox?=
 =?utf-8?B?TElDMWlhOWZwNU0xbUF5RVRrOEgvdXFrc2Zud1ppWW1jMmgwZkM1b0xScWRq?=
 =?utf-8?B?OVMwRDRRRTJ2QTJxaFZldktiODh0SHA0YUxMVThZSnBaK1ppanN2L1JkT3E2?=
 =?utf-8?B?aWdEc2NwRlIyeUoyN3FPdHJLZHBWbVNJOSswcnpHblJnVEZGOVpsMHBraDJm?=
 =?utf-8?B?Yk1UcC9SZGJRNW1nY0N2V2h0WFhGZFpWOVBlVkd6Z2YrYXFnM2JTbTZDaUhJ?=
 =?utf-8?B?OUdOd2wyaUJkK0p6VTE4UGl1WDk1U3VjTnNSY1A1UGwwbGI4TjB0RGNGdkVR?=
 =?utf-8?B?TVVjWFIvdTc4eUFMaktxWDdjdEtSQ3h2RjRGTTAxUTNnN1NQSXcxVXVhNWZJ?=
 =?utf-8?B?Nkh3ZmVUL1FKdGpWL3hMbVVzRWo1K0RBSFJTT29CcHRaQVRabXhFYlFyT3Uy?=
 =?utf-8?B?TjZLcTFDKzg0VWFkRW1FWWY4T2sxa2Q3Y0VyaGhjVkdXa0VNdm9WY0o0cDhZ?=
 =?utf-8?B?SUZHWW5qc2FaMk8wa0I1OFNOUGJ1WmVVTWtSNWVsUW5iaG82b1d4VnU3SXFx?=
 =?utf-8?B?czNTWE14TGdhUTQ2Y2pEc0wzRlNuSUtWQ2g1Z3VvdGtKSGw3Y253c0FpcnFB?=
 =?utf-8?B?QStsYjloUEwvaDg1TXNkKzZ0WkhIN3RoSW9Cb3V6QUZnSlVQUmdsS2RFL0J0?=
 =?utf-8?B?ZXJvdmhENlZwSWtESGVobkpWRFNBL080Mm85dkhlaXdjZG1aenpWcGJIdDBr?=
 =?utf-8?B?MENVYTNId0hhSEpNM0NuUnBVaWhFVlZvVUhXSkJlWVdTd28veU0yb2p0dDV4?=
 =?utf-8?B?dUNYdDdaVS90VTVZZnRsai9pQ0QyQThFdnQydWpJUzhyQWoyWU1hWmhxQkZj?=
 =?utf-8?B?bUF5Q2M1RU1aclBQZ2dpNER2Zmx6a3hFN3JDcDJEMk9tckxPUVFTU3dVSjhv?=
 =?utf-8?B?elBDWThVN1FHUmZDMGRYcVVqZ09RSjNJZUVkQ3g2aUxCWVFnYWx5M01ldjRR?=
 =?utf-8?B?TEpMRDdxU25QRFVNbUxFNUVoTVhXK2lHL3E2Z3QvUUhlVk9yM1pRcnQySUc2?=
 =?utf-8?B?ZmlTZ0poc29LeGFFTTVUenFmMFZWUUU2aUdzbUtXeTZUa2trQWo1TW5pMjF1?=
 =?utf-8?B?UUorN0ZLVlM4ejJEZ1crdWJtajFWaUlvbmZpcHZlaDNrc2RuQ2l0S3JRRmU1?=
 =?utf-8?B?eEh5cldiQWlLVU1FSmhkL3FnV2loY3JraHdyd2doOVZOdmJVMUdOOStIaHhv?=
 =?utf-8?B?QzgwazMvdzZtQkh6Q0pLTE0rSGRhVzVTdkVSREtQaVlHSlFPSmhrTWQ4alp3?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: df4ef3b1-eef3-422d-846c-08db87a17725
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:12:56.2696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gfuRtZElNUgJIzPxwzZHRGtZIXIe6r9baBifLViq8+Qse5shwwtGvY/YKCskUYrj/lcep7XRvplIwlhasrxhMZFnoBOr+Ef90HYxqRcf6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5482
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This series adds support for orientation specification in the device
tree to the Sitronix ST7789V panel driver. 

This is can be seen as reduced version of [0] (some things of [0] have
been implemented in more general fashion in the scope of [1], other
things have been rejected).

Looking forward to your comments!

[0] https://lore.kernel.org/lkml/20230314115644.3775169-1-gerald.loacker@wolfvision.net/
[1] https://lore.kernel.org/lkml/20230714013756.1546769-1-sre@kernel.org/

---
Michael Riesch (2):
      drm/panel: sitronix-st7789v: add panel orientation support
      dt-bindings: display: add rotation property to sitronix,st7789v

 .../bindings/display/panel/sitronix,st7789v.yaml   |  2 ++
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     | 28 ++++++++++++++++++----
 2 files changed, 25 insertions(+), 5 deletions(-)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230718-feature-st7789v-4d0c2c6e2429

Best regards,
-- 
Michael Riesch <michael.riesch@wolfvision.net>

