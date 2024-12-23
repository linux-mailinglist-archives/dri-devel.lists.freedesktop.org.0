Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C289FAA83
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 07:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAA410E320;
	Mon, 23 Dec 2024 06:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="E+FVIOg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB4A10E321
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:42:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEQPaNbqnvfLKepqdmn+eGDDQgA2pIbJ32oTdIiIj3VMVIudvnpDQ8e7YEphB8bzRzS1D+ctklvH8AUoyjhMea9PJdmPfZjYab+wZ8/07ytSZfonI7Z90PhDyFoZNR3+2tT5JnzQOalgX81LpOdWagZ6rTvE/wqf82cipwcShtPyzZDxnQBLobt1nBSgamg+YTujBNuYJdrG4kwqpU1sKX8ynDjX9ekDIMeiUnyE9B5bcAXuXHPd6zQ/jJt7f/4CeguPipaNs4c8HX3ubKS38VcdKwWkclPF69EU7woGt3LAzNuqkxpy+HNzefUuasLD8NbUrdrfVQoYuUIIqUij3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbk+ILhMSF7ywy7xTFNmuGSg+/XA02i/wn8QqLLs6Es=;
 b=QcCgjwAdRvZ6iXwDfVtA3Z8xLaMed/NTS2LRYt5OI/svcNm0xGRDArFN08YTxQaFQcYOTMZqVsL5QR04ITU2nm2urbLsD31RMKiqzlp3Gdo9QI54wmg+FXwI3hoc6IefVKoy2kp0/3ad8Zx5hT6qDTCtI/mIhFiGBlpZ1qBVyh3EETcSszwusaFkEz9ZXcb5B+C2gi+sytImFdrhvrIBQYjMElkD9/PgUwFiKoCmW4VBJ7QabXR9DOqJIJvo/7wgkpZFZWSRG1a66ddXcH0YTrONGMREhJbJq8AIBXAd0sN4GcYQpanWtkhCJ3rBvK2N1fCZkUckNMnWsP4Zi6kGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbk+ILhMSF7ywy7xTFNmuGSg+/XA02i/wn8QqLLs6Es=;
 b=E+FVIOg3wPhvqaQ2skuGmiZNll+p03Ds7OO5E4zoR+k4r8X4Hm9LJGwRutDkCLBPFsF8/Q+3P39ggV6zLUD1pYGjZ/9ra/eH9rWoQMENsJEHvvSSMHWo9RreAY0KSygwbHBw7EhyS2BAQr4BvxV9YQ4Gar/Q5O4YWDqYkGLLBxthrm88Y22Qn6cARq/TRPDsmrpdEODn7IxDi2q0TeeQXs0F77BQ+KDr0kgSgqIRFV9xOpmu3EONFKa0acvzuerU7nS8JsgFjufUESyI9YW61kKo7v+KZpc9rTmtcoaIOKyYahrZA4ynYmLj/z4/8RXYMx7bq8m7cqt39vmIZpNU2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8986.eurprd04.prod.outlook.com (2603:10a6:20b:409::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 06:41:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:41:53 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: [PATCH v7 01/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller processing units
Date: Mon, 23 Dec 2024 14:41:29 +0800
Message-Id: <20241223064147.3961652-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223064147.3961652-1-victor.liu@nxp.com>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: 368290a4-7e43-4a7e-1c59-08dd231ce2fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DE/GZAc8C9KfReN6Xw0AeARD9Fls2/VERBDuZOZEQ1ecYLNGNTDcPcyO+s/U?=
 =?us-ascii?Q?eYkBFvks6wUaklX0ADlQ87jFDVQmyTSzj2HAjt7zY7hI5A/98AubB3GoAdme?=
 =?us-ascii?Q?WoXed12upwjwlJhqcaXdN1V8rYZ3UrsC4W3HHfAUrag2qrog8UZeJ5ojwY37?=
 =?us-ascii?Q?INRj0b6xIVS4MUV/G0P2toPGhYiZi7T/gEQZ3V9OHge6TwV1XlEIPbC10hlH?=
 =?us-ascii?Q?PwFcIwMnsTEPhYWpR0g+7yI1kGGY7hu56Rm4ybqwa68wIi6bjPRAUuxheRDT?=
 =?us-ascii?Q?z2YifNaUXUupqkT0+E7+s0hO7Oi07VI1cOmDo67cLiB6X28xPlTGlj4Rf5ng?=
 =?us-ascii?Q?5Rlfp3SPVEIGCiemssOObIOA2yhXj0f1ocW+5w9aVn7P4dKAo26APfMU4T/0?=
 =?us-ascii?Q?KR351uZINiwN4ehhgWO89kSSm6HH4qeMKzXCBCptYDSsTdNjU7lwdW+qgJCU?=
 =?us-ascii?Q?uqkUhGZxFOrUyoeXoAb9rXsEPel3+OgSF1zpyNTPUPNheumJhklRJdoHsZ+W?=
 =?us-ascii?Q?VxRDNscyt5NGIqK7yeYnoeiXRMSKMMbYu7os+hqZJz/aVdltj+HxNNh2WdBS?=
 =?us-ascii?Q?GLv/ubK/0n46FcztxKWU6qxPg4D+GXOlS9xFE61tHBuY66HxChw0rEmSZCXK?=
 =?us-ascii?Q?GCOW5DKhHNmEtjyJBmMKwbND3+kyOoUmW72uCtSsA862ZoS5xfVYNSvtE+Gp?=
 =?us-ascii?Q?2k9nwy8Y6Mfzbld3h3lHAtshw1gDewwGPM5Ogb2m1M3017Pqd3xgXuZ1lW3R?=
 =?us-ascii?Q?2W4kaTcJCzY+eSV6WEJCZN5y3wirChzhoC2MY55IVHuK3j6+sSTbkz6e90an?=
 =?us-ascii?Q?+3urNgwwveES2+Q0SU7sXVqf8j+CPDVZ/Vzh0vTCXiBn81LP64aFoxQhgxWt?=
 =?us-ascii?Q?AaCvhgCdTgiRN1x2Akkc5vRZbadAsczFeov2eJevFulEkijXa5Ju680GjqDI?=
 =?us-ascii?Q?i2ChvqQUHdPMYK0jePttEnDQFya4A8E/3kWgBTEBsHO82OjQ3KySt5BBf7Eh?=
 =?us-ascii?Q?mOSJLQnFQTAK0OcXidLlEN7xam883y6kqSIoAMOAGg552Oaf1I1ZhIOTJzmB?=
 =?us-ascii?Q?fO6iRDNgz5rdJzuaaKj8fM8OYqRIqFRBXrrkGUKAArxnaH+6BY/8zi3+G8X+?=
 =?us-ascii?Q?BmZ8N0wiRr7CAEw+yqwPjOyoPfwyxjoPhKEJ1z848USN1yBFjZIMvTpj9rqP?=
 =?us-ascii?Q?wRzhhAzqYxPILMe6asDkwrlbf9VPAA7A0vNsg1V5YUfenLluWHRrgQpzbdjI?=
 =?us-ascii?Q?VjXVR5fuOq1Mm36mX7T/+xTe73ABB3FW3Ljd+F1/8HI5JFefWwlpYifrwbou?=
 =?us-ascii?Q?kLe+2m53ukCKW+nVwZPEf7jRGHiwyntM6lFzX0duM9NXcsRzVKwnbBnWsXqc?=
 =?us-ascii?Q?kQMiJQpRiAi0yFEGmggBgNDP8uq/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?naUcX9tPdP6Mydb07o+Nhl4yVgJ+jXtbbqd61i4NRNCBy02SRjrieRoBLnw+?=
 =?us-ascii?Q?jpxDiREghO9LT/levvYqQduzrMlE824KXxz3P2GIb7NlMW9IiXhUtWNFGRZa?=
 =?us-ascii?Q?33zp7NKWIl11N4dFECj3XmQ3Svqvzs0vOB90prrbwX62xi2RsB1j39pIcc6D?=
 =?us-ascii?Q?25PZhShYpluaxBBS4XIvopuzMx5FmUzSHeEMV9WI86A497n0d47TBRNRGeiU?=
 =?us-ascii?Q?KPup59eR/j3R53E8sbJV6ugbE48fXe9eOmVvrsKaGsj81t29aEN03bNFC9oh?=
 =?us-ascii?Q?H2iOXAJqcyHzWjP7ZmD2HtnhKlDUke6sJjcAWZJQ1CaFstK6gOwM9oGYpHxm?=
 =?us-ascii?Q?RLjCTySQMA+fy14sZZsMq+6rmyJ0YnTLXtZJ1JPzu/GFhRpMTPP5uGWMAVF2?=
 =?us-ascii?Q?QDALYENjlSEZUrMTWwTcOAKm7zxbu0K6qzjGjPGa71zw9equlBUH3hlANXyB?=
 =?us-ascii?Q?2PiCZEwxoH2d6BDd0tglYJ/d0FqRqMnbQ7QTKaBpZQPgPgQl+5Ntzar8htzL?=
 =?us-ascii?Q?Z28cWsb82DRvD4xmqjBVzYu0Mg/V0fVlgAfWO0JkDuq8bUMJwqRt/g+DEDBm?=
 =?us-ascii?Q?JUDBW0XRRoE7kUureKMLmPRp8T6AOg+iki7/QgH18HnPTgzrov6AZxPTbzzd?=
 =?us-ascii?Q?Jk3nykOwtPbQustafmmK6M0NY/AnRdIenuSSN4bYe/XtPMH6Wb3ryo2bE2at?=
 =?us-ascii?Q?rpk+V0L9std/xqpguedvzYXbV96LuMcYo4+2Ocpy0bgWi9LRwe/+EeBH/Nhk?=
 =?us-ascii?Q?bshWLsmkjLQ9n7vC06Xdz9hizWU756AVE54wpOxYP4sH+zHiciTOg5eVsZe3?=
 =?us-ascii?Q?zbhrKxHmTAhAvn0cRuwEVMbyLuapj5wFc/PPDcbMkIZyEKShNBoGHRvU5Vkr?=
 =?us-ascii?Q?0gHI1vufg4EkikQ8wHK27AFh8pFOhGJ2cBHNSXReMJgLb2IrKRTAgoKQBHJ5?=
 =?us-ascii?Q?e93ZjAzPG0ZHcHK6bNZ4VS8CV/ux/sbtsqvKIC6YjMpPfLy2j0Y38axR6csK?=
 =?us-ascii?Q?Uo+8s6/At7saJe+odUmxR6FOBiYR6Joy6kG0wJx8So4XYPFNR4WA+18deSdk?=
 =?us-ascii?Q?3A9umnaeCvz5xF0JeSxkzwuvI1boFS95g4lbtSyYckQQAsK+KOVWXIdFPwF/?=
 =?us-ascii?Q?8QUm2d8f2XlUqykij9yxi55NzqacgVLp5MHvIJYu2qHrxDahW2j06oYxDnfh?=
 =?us-ascii?Q?3c+P7Ex6azrvsjvhjcdsxYxKoG9swZujOYicpgy1OdXDNp33DrW17k2svYp/?=
 =?us-ascii?Q?p6grHx1OqY/qIqbaHlT9C5aEdWfhAQA1gLuAU3O6BHfRK+AJIaEbnXom5kPb?=
 =?us-ascii?Q?vkfe+0Z1WmuYm68bU0i+fzWUBNwqgdKO+xLfsi3au89KezS9u8rJeV2P9YyB?=
 =?us-ascii?Q?8Ev6cUc3F1TnXclqebNJN4Ln95q6sOJfiPzzBuY6B2oBPIlSGmWS4AIS6DHg?=
 =?us-ascii?Q?z9PKazeWNb1LHB46DoU9e8BfH2NDb5RkOyR10g5bFV3Zu3RkdKcYNPQ12Ao0?=
 =?us-ascii?Q?wmtHJUWGjWI6C4CVjWLzqAAYv6LiTnYQIyTcWj5psKuPJUR181xE90HXpjBq?=
 =?us-ascii?Q?VnNfciyRX0uCedE91JOsOIJFYm6kEqXlF8sJtz8v?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368290a4-7e43-4a7e-1c59-08dd231ce2fa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:41:53.4368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szDNO3yHM/4b89Ymm2OoF1vgyizG59II84Wf6MwJdhJsB2ZahE9k+9ZOdo8H8hzOjAeefJvk953NwA6VD1idPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8986
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

Freescale i.MX8qxp Display Controller is implemented as construction set of
building blocks with unified concept and standardized interfaces.  Document
all existing processing units.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7:
* Drop DT alias documentations and add instance numbers to compatible strings.
  (Rob)

v6:
* No change.

v5:
* Document aliases for processing units which have multiple instances in
  the Display Controller.  Drop Rob's previous R-b tag. (Maxime)

v4:
* Collect Rob's R-b tag.

v3:
* Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
  fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
  into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
* Document all processing units. (Rob)

v2:
* Drop fsl,dc-*-id DT properties. (Krzysztof)
* Add port property to fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
* Fix register range sizes in examples.

 .../imx/fsl,imx8qxp-dc-blitblend9.yaml        |  41 +++++
 .../display/imx/fsl,imx8qxp-dc-clut9.yaml     |  44 ++++++
 .../imx/fsl,imx8qxp-dc-constframe0.yaml       |  48 ++++++
 .../display/imx/fsl,imx8qxp-dc-dither0.yaml   |  47 ++++++
 .../display/imx/fsl,imx8qxp-dc-extdst0.yaml   |  76 +++++++++
 .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 147 ++++++++++++++++++
 .../display/imx/fsl,imx8qxp-dc-filter9.yaml   |  43 +++++
 .../display/imx/fsl,imx8qxp-dc-framegen0.yaml |  66 ++++++++
 .../display/imx/fsl,imx8qxp-dc-gammacor0.yaml |  34 ++++
 .../imx/fsl,imx8qxp-dc-layerblend0.yaml       |  43 +++++
 .../display/imx/fsl,imx8qxp-dc-matrix0.yaml   |  76 +++++++++
 .../display/imx/fsl,imx8qxp-dc-rop9.yaml      |  43 +++++
 .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++++
 .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  87 +++++++++++
 .../imx/fsl,imx8qxp-dc-signature0.yaml        |  55 +++++++
 .../display/imx/fsl,imx8qxp-dc-store9.yaml    |  96 ++++++++++++
 .../display/imx/fsl,imx8qxp-dc-tcon0.yaml     |  47 ++++++
 17 files changed, 1027 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend9.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut9.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter9.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop9.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store9.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon0.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend9.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend9.yaml
new file mode 100644
index 000000000000..621f8b30efcd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend9.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-blitblend9.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Blit Blend Unit
+
+description:
+  Combines two input frames to a single output frame, all frames having the
+  same dimension.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-blitblend9
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    blitblend@56180920 {
+        compatible = "fsl,imx8qxp-dc-blitblend9";
+        reg = <0x56180920 0x10>, <0x56183c00 0x3c>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut9.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut9.yaml
new file mode 100644
index 000000000000..00e748d39a72
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut9.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-clut9.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Color Lookup Table
+
+description: |
+  The unit implements 3 look-up tables with 256 x 10 bit entries each. These
+  can be used for different kinds of applications. From 10-bit input values
+  only upper 8 bits are used.
+
+  The unit supports color lookup, index lookup, dithering and alpha masking.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-clut9
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clut@56180880 {
+        compatible = "fsl,imx8qxp-dc-clut9";
+        reg = <0x56180880 0x10>, <0x56182400 0x404>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe0.yaml
new file mode 100644
index 000000000000..aeaf65b126cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe0.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-constframe0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Constant Frame
+
+description: |
+  The Constant Frame unit is used instead of a Fetch unit where generation of
+  constant color frames only is sufficient. This is the case for the background
+  planes of content and safety streams in a Display Controller.
+
+  The color can be setup to any RGBA value.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-constframe0
+      - fsl,imx8qxp-dc-constframe1
+      - fsl,imx8qxp-dc-constframe4
+      - fsl,imx8qxp-dc-constframe5
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    constframe@56180960 {
+        compatible = "fsl,imx8qxp-dc-constframe0";
+        reg = <0x56180960 0xc>, <0x56184400 0x20>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither0.yaml
new file mode 100644
index 000000000000..aff739f23244
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither0.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-dither0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Dither Unit
+
+description: |
+  The unit can increase the physical color resolution of a display from 5, 6, 7
+  or 8 bits per RGB channel to a virtual resolution of 10 bits. The physical
+  resolution can be set individually for each channel.
+
+  The resolution is increased by mixing the two physical colors that are nearest
+  to the virtual color code in a variable ratio either by time (temporal
+  dithering) or by position (spatial dithering).
+
+  An optimized algorithm for temporal dithering minimizes noise artifacts on the
+  output image.
+
+  The dither operation can be individually enabled or disabled for each pixel
+  using the alpha input bit.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-dither0
+      - fsl,imx8qxp-dc-dither1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    dither@5618c400 {
+        compatible = "fsl,imx8qxp-dc-dither0";
+        reg = <0x5618c400 0x14>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst0.yaml
new file mode 100644
index 000000000000..5c64e897bc35
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst0.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-extdst0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller External Destination Interface
+
+description: |
+  The External Destination unit is the interface between the internal pixel
+  processing pipeline of the Pixel Engine, which is 30-bit RGB plus 8-bit Alpha,
+  and a Display Engine.
+
+  It comprises the following built-in Gamma apply function.
+
+  +------X-----------------------+
+  |      |          ExtDst Unit  |
+  |      V                       |
+  |  +-------+                   |
+  |  | Gamma |                   |
+  |  +-------+                   |
+  |      |                       |
+  |      V                       +
+  +------X-----------------------+
+
+  The output format is 24-bit RGB plus 1-bit Alpha. Conversion from 10 to 8
+  bits is done by LSBit truncation.  Alpha output bit is 1 for input 255, 0
+  otherwise.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-extdst0
+      - fsl,imx8qxp-dc-extdst1
+      - fsl,imx8qxp-dc-extdst4
+      - fsl,imx8qxp-dc-extdst5
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: framecomplete
+      - const: seqcomplete
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    extdst@56180980 {
+        compatible = "fsl,imx8qxp-dc-extdst0";
+        reg = <0x56180980 0x1c>, <0x56184800 0x28>;
+        reg-names = "pec", "cfg";
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <3>, <4>, <5>;
+        interrupt-names = "shdload", "framecomplete", "seqcomplete";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
new file mode 100644
index 000000000000..92f6600af49e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-fetchunit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Fetch Unit
+
+description: |
+  The Fetch Unit is the interface between the AXI bus for source buffer access
+  and the internal pixel processing pipeline, which is 30-bit RGB plus 8-bit
+  Alpha.
+
+  It is used to generate foreground planes in Display Controllers and source
+  planes in Blit Engines, and comprises the following built-in functions to
+  convert a wide range of frame buffer types.
+
+  +---------X-----------------------------------------+
+  |         |                           Fetch Unit    |
+  |         V                                         |
+  |    +---------+                                    |
+  |    |         |                                    |
+  |    | Decode  | Decompression [Decode]             |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    | Clip &  | Clip Window [All]                  |
+  |    | Overlay | Plane composition [Layer, Warp]    |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    | Re-     | Flip/Rotate/Repl./Drop [All]       |
+  X--> | sample  | Perspective/Affine warping [Persp] |
+  | |  |         | Arbitrary warping [Warp, Persp]    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         |                                    |
+  | |  | Palette | Color Palette [Layer, Decode]      |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  | Extract | Raw to RGBA/YUV [All]              |
+  | |  | &       | Bit width expansion [All]          |
+  | |  | Expand  |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Planar to packed                   |
+  | |->| Combine | [Decode, Warp, Persp]              |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | YUV422 to YUV444                   |
+  | |  | Chroma  | [Decode, Persp]                    |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | YUV to RGB                         |
+  | |  | Color   | [Warp, Persp, Decode, Layer]       |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Gamma removal                      |
+  | |  | Gamma   | [Warp, Persp, Decode, Layer]       |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Alpla multiply, RGB pre-multiply   |
+  |  ->| Multiply| [Warp, Persp, Decode, Layer]       |
+  |    |         |                                    |
+  |     ---------                                     |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    |         | Bilinear filter                    |
+  |    | Filter  | [Warp, Persp]                      |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  +---------X-----------------------------------------+
+
+  Note that different derivatives of the Fetch Unit exist. Each implements a
+  specific subset only of the pipeline stages shown above. Restrictions for the
+  units are specified in [square brackets].
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-fetchdecode0
+      - fsl,imx8qxp-dc-fetchdecode1
+      - fsl,imx8qxp-dc-fetchdecode9
+      - fsl,imx8qxp-dc-fetcheco0
+      - fsl,imx8qxp-dc-fetcheco1
+      - fsl,imx8qxp-dc-fetcheco2
+      - fsl,imx8qxp-dc-fetcheco9
+      - fsl,imx8qxp-dc-fetchlayer0
+      - fsl,imx8qxp-dc-fetchwarp2
+      - fsl,imx8qxp-dc-fetchwarp9
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  fsl,prg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Optional Prefetch Resolve Gasket associated with the Fetch Unit.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    fetchlayer@56180ac0 {
+        compatible = "fsl,imx8qxp-dc-fetchlayer0";
+        reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter9.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter9.yaml
new file mode 100644
index 000000000000..fbdac4526b7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter9.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-filter9.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Filter Unit
+
+description: |
+  5x5 FIR filter with 25 programmable coefficients.
+
+  Typical applications are image blurring, sharpening or support for edge
+  detection algorithms.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-filter9
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    filter@56180900 {
+        compatible = "fsl,imx8qxp-dc-filter9";
+        reg = <0x56180900 0x10>, <0x56183800 0x30>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen0.yaml
new file mode 100644
index 000000000000..72e88bbffb17
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen0.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-framegen0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Frame Generator
+
+description:
+  The Frame Generator (FrameGen) module generates a programmable video timing
+  and optionally allows to synchronize the generated video timing to external
+  synchronization signals.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-framegen0
+      - fsl,imx8qxp-dc-framegen1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: int0
+      - const: int1
+      - const: int2
+      - const: int3
+      - const: primsync_on
+      - const: primsync_off
+      - const: secsync_on
+      - const: secsync_off
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    framegen@5618b800 {
+        compatible = "fsl,imx8qxp-dc-framegen0";
+        reg = <0x5618b800 0x98>;
+        clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
+        interrupt-names = "int0", "int1", "int2", "int3",
+                          "primsync_on", "primsync_off",
+                          "secsync_on", "secsync_off";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor0.yaml
new file mode 100644
index 000000000000..0eab18192966
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor0.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-gammacor0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Gamma Correction Unit
+
+description: The unit supports non-linear color transformation.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-gammacor0
+      - fsl,imx8qxp-dc-gammacor1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    gammacor@5618c000 {
+        compatible = "fsl,imx8qxp-dc-gammacor0";
+        reg = <0x5618c000 0x20>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend0.yaml
new file mode 100644
index 000000000000..228cd0a9e9f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend0.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-layerblend0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Layer Blend Unit
+
+description: Combines two input frames to a single output frame.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-layerblend0
+      - fsl,imx8qxp-dc-layerblend1
+      - fsl,imx8qxp-dc-layerblend2
+      - fsl,imx8qxp-dc-layerblend3
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    layerblend@56180ba0 {
+        compatible = "fsl,imx8qxp-dc-layerblend0";
+        reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix0.yaml
new file mode 100644
index 000000000000..fe2a77b518f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix0.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-matrix0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Color Matrix
+
+description:
+  The unit supports linear color transformation, alpha pre-multiply and
+  alpha masking.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-matrix0
+      - fsl,imx8qxp-dc-matrix1
+      - fsl,imx8qxp-dc-matrix4
+      - fsl,imx8qxp-dc-matrix5
+      - fsl,imx8qxp-dc-matrix9
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    oneOf:
+      - const: cfg      # matrix in display engine
+      - items:          # matrix in pixel engine
+          - const: pec
+          - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qxp-dc-matrix0
+              - fsl,imx8qxp-dc-matrix1
+    then:
+      properties:
+        reg:
+          minItems: 1
+          maxItems: 1
+
+        reg-names:
+          const: cfg
+    else:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        reg-names:
+          items:
+            - const: pec
+            - const: cfg
+
+additionalProperties: false
+
+examples:
+  - |
+    matrix@5618bc00 {
+        compatible = "fsl,imx8qxp-dc-matrix0";
+        reg = <0x5618bc00 0x3c>;
+        reg-names = "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop9.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop9.yaml
new file mode 100644
index 000000000000..371bff3aaede
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop9.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-rop9.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Raster Operation Unit
+
+description: |
+  The unit can combine up to three input frames to a single output frame, all
+  having the same dimension.
+
+  The unit supports logic operations, arithmetic operations and packing.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-rop9
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    rop@56180860 {
+        compatible = "fsl,imx8qxp-dc-rop9";
+        reg = <0x56180860 0x10>, <0x56182000 0x20>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
new file mode 100644
index 000000000000..66c12948ab09
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-safety.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Safety Unit
+
+description:
+  The unit allows corresponding processing units to be configured in a path
+  leading to multiple endpoints.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-safety
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    safety@56180800 {
+        compatible = "fsl,imx8qxp-dc-safety";
+        reg = <0x56180800 0x1c>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
new file mode 100644
index 000000000000..f9cd25488584
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Scaling Engine
+
+description: |
+  The unit can change the dimension of the input frame by nearest or linear
+  re-sampling with 1/32 sub pixel precision.
+
+  Internally it consist of two independent blocks for horizontal and vertical
+  scaling. The sequence of both operations is arbitrary.
+
+  Any frame dimensions between 1 and 16384 pixels in width and height are
+  supported, except that the vertical scaler has a frame width maximum
+  depending of the system's functional limitations.
+
+  In general all scale factors are supported inside the supported frame
+  dimensions. In range of scale factors 1/16..16 the filtered output colors
+  are LSBit precise (e.g. DC ripple free).
+
+                       +-----------+
+                       |   Line    |
+                       |  Buffer   |
+                       +-----------+
+                             ^
+                             |
+                             V
+                 |\    +-----------+
+           ------+ |   |           |
+          |      | +-->| Vertical  |----
+          |  ----+ |   |  Scaler   |    |
+          | |    |/    +-----------+    |
+          | |                           |
+          | |                           |
+          | |                           |     |\
+          |  ------------- -------------+-----+ |
+  Input --+               X                   | +--> Output
+          |  ------------- -------------+-----+ |
+          | |                           |     |/
+          | |                           |
+          | |    |\    +-----------+    |
+          |  ----+ |   |           |    |
+          |      | +-->| Horizontal|----
+           ------+ |   |  Scaler   |
+                 |/    +-----------+
+
+  The unit supports downscaling, upscaling, sub pixel translation and bob
+  de-interlacing.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-hscaler4
+      - fsl,imx8qxp-dc-hscaler5
+      - fsl,imx8qxp-dc-hscaler9
+      - fsl,imx8qxp-dc-vscaler4
+      - fsl,imx8qxp-dc-vscaler5
+      - fsl,imx8qxp-dc-vscaler9
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    hscaler@561808c0 {
+        compatible = "fsl,imx8qxp-dc-hscaler9";
+        reg = <0x561808c0 0x10>, <0x56183000 0x18>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature0.yaml
new file mode 100644
index 000000000000..5add40dd7edd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature0.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-signature0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Signature Unit
+
+description: |
+  In order to control the correctness of display output, signature values can
+  be computed for each frame and compared against reference values. In case of
+  a mismatch (signature violation) a HW event can be triggered, for example a
+  SW interrupt.
+
+  This unit supports signature computation, reference check, evaluation windows,
+  alpha masking and panic modes.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-signature0
+      - fsl,imx8qxp-dc-signature1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: valid
+      - const: error
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    signature@5618d000 {
+        compatible = "fsl,imx8qxp-dc-signature0";
+        reg = <0x5618d000 0x140>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <22>, <23>, <24>;
+        interrupt-names = "shdload", "valid", "error";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store9.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store9.yaml
new file mode 100644
index 000000000000..3228b5206f0f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store9.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-store9.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Store Unit
+
+description: |
+  The Store unit is the interface between the internal pixel processing
+  pipeline, which is 30-bit RGB plus 8-bit Alpha, and the AXI bus for
+  destination buffer access. It is used for the destination of Blit Engines.
+  It comprises a set of built-in functions to generate a wide range of buffer
+  formats. Note, that these are exactly inverse to corresponding functions in
+  the Fetch Unit.
+
+  +------X-------------------------+
+  |      |              Store Unit |
+  |      V                         |
+  |  +-------+                     |
+  |  | Gamma | Gamma apply         |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Color | RGB to YUV          |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Chroma| YUV444 to 422       |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Reduce| Bit width reduction |
+  |  |       | dithering           |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Pack  | RGBA/YUV to RAW     |
+  |  | Encode| or Compression      |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  +------X-------------------------+
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-store9
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: framecomplete
+      - const: seqcomplete
+
+  fsl,lts:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Optional Linear Tile Store associated with the Store Unit.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    store@56180940 {
+        compatible = "fsl,imx8qxp-dc-store9";
+        reg = <0x56180940 0x1c>, <0x56184000 0x5c>;
+        reg-names = "pec", "cfg";
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <0>, <1>, <2>;
+        interrupt-names = "shdload", "framecomplete", "seqcomplete";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon0.yaml
new file mode 100644
index 000000000000..fc771c067f74
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon0.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-tcon0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Timing Controller
+
+description:
+  The TCon can generate a wide range of customized synchronization signals and
+  does the mapping of the color bits to the output.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-tcon0
+      - fsl,imx8qxp-dc-tcon1
+
+  reg:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: video output
+
+required:
+  - compatible
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    tcon@5618c800 {
+        compatible = "fsl,imx8qxp-dc-tcon0";
+        reg = <0x5618c800 0x588>;
+
+        port {
+            dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
+                remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
+            };
+        };
+    };
-- 
2.34.1

