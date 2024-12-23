Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B31829FAA9A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 07:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0EE10E3D9;
	Mon, 23 Dec 2024 06:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FgyZ8W6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AD410E411
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:43:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXvRgWay/OW4RYpdEZjTIz0yxbxrjICDJhm1qUfGa/rpESBReKkiwnDpZ2fI6LFkTCnLJgdjSKpNjylBkngENNRKBJQ0Ds9+HjdUs37vZHg9qAuAqrvaHATTx2TzAdsgGpG7YYy28L4KnXgLZXgGsCjI6cUTCtz5uYqcBXNH5nZ/PMSkIsIPfqqHiU/E49CWt3g9vFC7dnZqXPd2JlwiEl+b+ReERksWBfbY0UcvcPJQK1yuTAxJOJPK8NVU1cMRwnIZhhB9Z+UHvMjowo8I0zkLRJSKagxg7TOjhoJeJQQ/U4oiSSvsrQsRZOAPXIhy89CU1V7gbf/EaWPrsOFKbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvVlspONK4Ell/oxGGNW9RjJh/ikV3tQwHd8JQVXrHY=;
 b=k7fsnlcRJeyC6lwwNjaQrTxP5rUmIkZIYdyElLgArWXmB2AmIpwSbr5lRSsSArOEqfJL2dz3nWzLQq9Zx8mvVY01w6X3vylmsRX3WZbKReE8bBgBiMiE5hcHtbQ3+SVTU6oQ3Tkzv1ehfehf25mafia03qn7KIBKI8ww1iR3fUZ4q74N6uS25S1wpd9NmrVELWqM5KtGaIJlxKUdGicZrwgKnbQrKhQRpKXAUfe21Zg7VWtt5k3NdF2vATLzLs97vp19kQ55M3/VDuFCBnxeYhS+Ughbm8ORGtOucqtPwBctJKJ4lIym17ItvowmW65aF8EMCLIGZMqpbmSAVxHdbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvVlspONK4Ell/oxGGNW9RjJh/ikV3tQwHd8JQVXrHY=;
 b=FgyZ8W6qGNeKinNWycKAZgvTgJhQbFbvy6gFmISmY1D7Thtz+1LLPZmxwgad8zgKH/9UuPk6sN7UVAk6ScBLXpMG84cy76tQ23HTCl3pvvtWYImS/dWTSV93CXAcxGwOp6u5fT4crr1fWGcG6hao7acQcSnwH5LPrbB2mCRzuZLGHCjL73OXvQ6kwH7igZnXIfQyuJDjG3K3UFctl99OcgwOXo+GEQ8afC1EPvtrI5hrR+1SJDN3mMgpXwTj6fwG9c1iPK0K2atlnDzuV/yHm0AWpEahiWf7bmGWIlvsp1o4z3GMLzPHlQmR9oDevGXWN6/lo7HmFVa/ncGI/hw0iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7941.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 06:43:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:43:25 +0000
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
Subject: [PATCH v7 13/19] MAINTAINERS: Add maintainer for i.MX8qxp Display
 Controller
Date: Mon, 23 Dec 2024 14:41:41 +0800
Message-Id: <20241223064147.3961652-14-victor.liu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ab949d-ceaf-4fb5-e66c-08dd231d198c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QZUUVXw1Egr50jOGqg66eGI4oGIEz1H+m9p9ifAuuBMFM5ZxCEtuRGm0NXWP?=
 =?us-ascii?Q?Dihiht1j01q9q609EhxRmx9G4VZ7VSTyDsf+J8UwZvaEye0G2RUfVWazpjqr?=
 =?us-ascii?Q?M5INj84QhXF9kjgt15nv9VrB8aMgIwKweeyGDsrvAac1IbuehShjccCyAmLR?=
 =?us-ascii?Q?B1RC7POuM4vL/LJbsWJwJCK41oWvdTL6TYuNQhv1Cv1pX/pw0sH/pZEoAjAp?=
 =?us-ascii?Q?AEqc9Ovq/nH1RGrTmMUF/Hjgr22lwRqCzHNWFvdy8xMykU6zisX6bS2oGWIS?=
 =?us-ascii?Q?f1MuOpEt/zUXbfUAy8A8pNmPYqSwBSxqtkQpP/B41JqXU149nm21unDd41sR?=
 =?us-ascii?Q?lrHZciIf5f3rTUhhJOre1dfe+DhdzJxqnV4NMrkiB+aa/qirvjkASxlIpHmV?=
 =?us-ascii?Q?lOFZfYMvzBsVh9SUIAxX3CC8/SY65sOYSVU1ybWlizcPuGyPe63i25MYCBwC?=
 =?us-ascii?Q?1w5LpwyuPzZrfaW9iZsDvcufD3vlRgnUXMJMRntn/z0kC7ed9DqAVFd6YeNO?=
 =?us-ascii?Q?6gt/lJySUgKECaUY/DY3xnm9+WabbcsJ9XnCEg5V6YuTxVFyKdI8RrjISHde?=
 =?us-ascii?Q?sO+DUKNI5ltjhg0IdCw0t3WG7I++0aR/0DfsSWJfM9icuDwsRhoZIMWE8m/N?=
 =?us-ascii?Q?LJL/YwDrgg9RGOLiYdF8ahjktj8Hahl9Ua58CScTi22zvAIX5F6OxkY2nevG?=
 =?us-ascii?Q?XzkOavxcM9Kf9UXEiSFqJinrDVec7QMj3KmC/fAMtlZcrju+6akku9c7jdAA?=
 =?us-ascii?Q?RoQWARLRcN7RD6/4ndCwR0H44/nJFP4lJ+/rWdMh8RYo9KmaXTWtJJfkUIo/?=
 =?us-ascii?Q?YO6cc5ll12MCmtrwaz62jUfbYK+8wuWuE7rcSwvTLpW5tbSyyfKbWDBuqfZv?=
 =?us-ascii?Q?9/nzPD/vgzX0kHlCtBMKwMmQqTaK+GlyJ3w3MX7fz2NtpxO5//+5Adni1QSr?=
 =?us-ascii?Q?TYU544x+fXNgIwNKmBNYkxhXDGRmj3pjULOITZWudx4FRSmKBgRYyz4F42X/?=
 =?us-ascii?Q?0+b9WH8eC4LkFp/SoGcV5gw06JHFsLYSZOuWfGWm3IhQLCBa9wDrie6aayRe?=
 =?us-ascii?Q?JpF9H+kMexegBe/mPF1lBBRtQV6E6FgxHzxgszDrx7LgBbJXkNetz29AXmNe?=
 =?us-ascii?Q?TzGmTlBvlKjJ5pq8EiTbGuJq2syKZpk7V5No8n3/lgTXi7wU6UmEYaOb2/+X?=
 =?us-ascii?Q?/1AN0SinixFH5gr2Y/MfKBqLCoXt8LIFaZEpxxj2vuDrOhWY4QluLlW3UW6j?=
 =?us-ascii?Q?jhTABtLcDTRbGTDbGcqhGnxZM1nuHofrEi91YmdXOfsmQStpst5BSosExVbm?=
 =?us-ascii?Q?kkuGqaMV/xQ5bakZgp42MBZuvbSZxDMNfhvz2nSmwe1tJELgaXRJgY27QHRa?=
 =?us-ascii?Q?HiEtRJXlnHAj7XYhdptzATSi0GXgBbtHERXnmPpJJ90bba2+Ug=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+6x8mXKldD28lxgokqRGe0b9QnPW5doEkxtmI4262LgB75efu4X8r/Oh4d4A?=
 =?us-ascii?Q?3KRVMABTrKoDf1546x/0MnvpRHeztWb3WSNm0MFGu1HlzT4r1vwUl/xhyndZ?=
 =?us-ascii?Q?sylshMdhAhDGfdjUs3O0UoMDjXOrSp7TCd9jV+XBH+imd8zamcepdCNbRkX2?=
 =?us-ascii?Q?vg7OaE1YQZ1w6jzqBX4Rs7vLWYSv2xs1vY32bM4KlHlKcRtpfAkmCFbb7c3x?=
 =?us-ascii?Q?/cKiZEQL2y3OxrTJiE5hvJ3owuSfbZePDZ6jM6ZIMIq7NSxmhsSOy/VDxAER?=
 =?us-ascii?Q?3hZlUwhHu7bKWxc4+e0J0AI7Os5wXVYinA/+7BsHC3FLM3aFBukaAlobZ36t?=
 =?us-ascii?Q?FNzXhpQqKMtKmYN4z6rvscdm0ltQpRvv5nssjBc9N8QO3SWdvlwj3qR6sLlb?=
 =?us-ascii?Q?5ZXKQe67GrmT7k8616rDOQyUEVG0ZtSqNtzpuoPVRul7wpnDcLGAZtFx77sh?=
 =?us-ascii?Q?rsg0FoIySCtUPmuwyCr2yKN0dLWIleOu0ExtvzG3mIefUT/ULIyhIuiAeu5y?=
 =?us-ascii?Q?cor+CfFxSNhT78z9IfsCTaPSXjyFL6zHbayYTrJw6hRwW+1m/g/Wbdte5Ccl?=
 =?us-ascii?Q?fuVAHzelIymbc1HYWOjCXM83jipTAzMf5yHFcYCFFfdaWEg9cdeTrFP7d9ef?=
 =?us-ascii?Q?1GC0G0t0MNLsfZE1h6EyjFwRfvNCsk6te03JaIpqO3Dkax6Lt8SRNgYQ5ezy?=
 =?us-ascii?Q?xANffhqqtQvFOj4wYKVYZVBnRe8cO5AnvkwfBbX+QVZ5UaZY57sWiPOUp9S8?=
 =?us-ascii?Q?m/nbw7g/3WhJOdhhj9KGdLHjBysfWUsOXnRqcHokn9K9WVE4pEh9BtdKvABs?=
 =?us-ascii?Q?IYv6mNC0qsQYUJSwDtYg2tqjmh1BQj327JY944z9IgrH2MRGeA9ih8cDeOWQ?=
 =?us-ascii?Q?1S5dmgnJUpftqoG3LNY1bSKQbgE2l2l6euO4KDMQXjCjtJ2D2vXLlO4hHSos?=
 =?us-ascii?Q?JDwXgwg9cFe02dG6Anm/V8gjVEeSLibnXkhw6xP40MrBjxCMXwrXBQSJW/tM?=
 =?us-ascii?Q?dcehv5z2HNGhynsp77qyNL3LgN0t9rJAs2XqT59aVsuWsv7BBmtW6VksYasg?=
 =?us-ascii?Q?vWHceWm2mgkeQIR6t6+BDRcMR1k6LuTW0nrQ7yLN8+UxozTGG6dAj0NYUz9N?=
 =?us-ascii?Q?g2Hi6Aenx/efoF+Zht8YRNdVG1+6n89vT5k1KMQ6DFa+I7mapeX/KkVUu6ev?=
 =?us-ascii?Q?rO2yiOBFfk8rnBq3vuWoVz501ygy/eo/jFA+Bv5BLyCuOwZFk8aNxHR3k87t?=
 =?us-ascii?Q?L9Bl73wpCszQ1KRApoCrR/lPirtaTV9WpEHOCQNtYS0PK7QAfPLZtK3Jsx1D?=
 =?us-ascii?Q?wM3BN5hU0DMhaFAwHjIfyuV4Tr1KuQPDeb04LAqqASZbX0usw+OIUKgXg3Kj?=
 =?us-ascii?Q?NovxTLfYx2wh7FMt+cc+bzWro3rlvqakOlVzOZuFrsFKlTymabuwVQu4Ewx8?=
 =?us-ascii?Q?HVQjn6sWgQSBcCErT93qs3DF0o0DG/vx241mFInMMQCrWrmilTRBf8Z58WKh?=
 =?us-ascii?Q?B+N1owE2TzJUsG9Ax5vWVnd86HD4YrzpAhnmUVTMZOsMyoOlbB5FOZ5r4Im3?=
 =?us-ascii?Q?TI8qeIq/SxkvYkQprBoOLhcyQ+VtKMfcCsU54RDy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ab949d-ceaf-4fb5-e66c-08dd231d198c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:43:25.1389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NB3d0ubGT9KwsMDD9CdL0CObiXyWcRnglC7KeiMkCLfB7puR7uICybkY3+DilPSufr6p7zkn+PfwrZI1D4lGOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7941
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

Add myself as the maintainer of i.MX8qxp Display Controller.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* Improve file list. (Frank)

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d2ab799a0659..0459878925df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7735,6 +7735,14 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/ipuv3/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE IMX8 DISPLAY CONTROLLER
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc*.yaml
+F:	drivers/gpu/drm/imx/dc/
+
 DRM DRIVERS FOR FREESCALE IMX BRIDGE
 M:	Liu Ying <victor.liu@nxp.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.34.1

