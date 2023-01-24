Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C42467904B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 06:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D839410E5F6;
	Tue, 24 Jan 2023 05:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C0710E5F8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 05:47:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iM87LjVnH+LxTCt56gBjdaJAnD7O+oXt3DR5ose++ZigPWwUtYzT/JSk2sodB8Esd/2pAGWCdKIeDvVy93wUUKBLAhophYt0avOYcJNnEomf6WAHaDyDnvdgXep8QW9Ho1eAsEaYsw7+9qjzuvj2JmcAmP0jkE90zYODIyJPnw21PBY+VwSt6zZ1rPcNFeuxHKt0U3lwzj/0PJok7XC5pLu5XUclyRrYCVQ8nWu9Sh1zrVPt3iLVEawF1pF6jy9sNuRk6M3moTnb10KZvp2kC7KOGJxrGtYA32FnexQZQeZ7nEtrX5JCEohRWRCRAHdqBrntPsGZ8FDS/kGppvONmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfOwi5RzpCapi9SbxOiOdJVhxa3zxmIg1tK3h21oxUY=;
 b=EBIw5fLiyquEBTfsBzzU7UtXzOUXAQJYbEcT0v1nWurDZJfsP7eJZWc+hUt8bfRyMobi66mjw7fzXu2meU7NCkY3IiFj9K+MBaF9gPXBgvpy9b13xrnWa69opRsQb1PswohmV0qRYl/NoqVafBOp+lAUy7uW6uamZmVsO9AR3sVnpEoTaUWBo8ieLLM6j3b+8B5kPQetFn5WSnONlYE2h16WmkNnMfjA/EdL8ndC+pLtv5Z6BkJDxYiJHXTS3OFo/NFQrBSYZ900enZ/DoiFSkG0UT0HPchC9za5e9TVRyCwWvRJMq2+ILHEW1ttOEdTVb2D0SlcrqJDxeUcZ62oKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfOwi5RzpCapi9SbxOiOdJVhxa3zxmIg1tK3h21oxUY=;
 b=Rirx8ttd0moGXaEtWvfO+YWHa142yDjti7oXIS7dwc+qVbhsxYJNkmHVwasNjwhgdXsOzafAm4X+j2oGp7PBOYnO/xywE8Tc31hSsg1BjtWNUHS4eRh6Qtn1qZIpEWsUKIOZbGVDcpOo4i5Gsyau3BA0wtwOpNjOgqqMp2akRqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by VI1PR08MB10032.eurprd08.prod.outlook.com (2603:10a6:800:1cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Tue, 24 Jan
 2023 05:47:25 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 05:47:25 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/6] arm64: dts: rockchip: add pinctrls for 16-bit/18-bit
 rgb interface to rk356x
Date: Tue, 24 Jan 2023 06:47:06 +0100
Message-Id: <20230124054706.3921383-7-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230124054706.3921383-1-michael.riesch@wolfvision.net>
References: <20230124054706.3921383-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0189.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::6) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|VI1PR08MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: e503dffa-6983-42ce-c896-08dafdce7888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 10+lw8J8qBt+BZuHrlLrHOTXaR3pNQNMELUwqYJ97N3xW2RCE0W2lAJ5igylHt9PH/i38RMmP5A5sh4UtTz+zvk+WEQj2Uqb4CR8MdlzV0XGnwf4dOAgt7+qwtv5RPS0O1RiMRQ30kLk/5Jq8mLgzB5aiO5rAT7xvo2YzZisnvUDHpIK1Flq29n4unTY0ozh2R7gDdMUxYgQG1JDLOypbmd0pqw8HwxnuQ0ONuMRkAMXhnUVaP/WRGMI/fihqpbbbQ30PiAoo7BcYEZAAZXvLxaRGA0BAY2VKkayKAdqMdubn/0dyfNXr+7cDQGkQRt3QHZ4bFWHp9I97H6lLhaCayDXfORgJNUZkI1Hu/OW1BJzV3VK+1zFDash0IBOZ5doi3r+vgI6rDQKSvd0iAP+XDvS9R1aiQrI6klKTU7QZIMipvfD6FgDzQRWK5OuLbUbTibU9gstQJvPNMJBwSPHDNAMei5myCyBMAC9q7yA5EhUjm0eZ98TR7b1qMTwFf6pMeuNnCmoBmCOhhDLwTyrUTXMlsLokwDIPbgQZ/V45JPYwXhtjUoUjzVaSsFu847EpBtQ7GoQZodju3e3kXXaQRnC8WtMH023/119nJmx/e5Zwu8/gH1/2wmZ1AiUU4BhaQSZ1OW+1vpJvDWock0SxIuAFRYJAGgbIl6hwmPDGBBa/qRxGqBBYDAnY3u84XKu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(396003)(346002)(366004)(136003)(376002)(451199015)(36756003)(66946007)(2616005)(66476007)(66556008)(316002)(54906003)(8676002)(4326008)(6666004)(5660300002)(7416002)(2906002)(44832011)(83380400001)(107886003)(52116002)(6486002)(186003)(966005)(1076003)(478600001)(41300700001)(6506007)(86362001)(38100700002)(6512007)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lMVUArK4FxXE3B0XOp885Y7ijVWO1hZ0KaaWjK8Zr/KMseD/ilbWRnJMXgdt?=
 =?us-ascii?Q?uxQWHzx1JTWUi1VSupI3tDgLZfdpdXfEca8IGWOh/wwcy6CkSBZm+w+Gu7G9?=
 =?us-ascii?Q?tc7Qi/X0MS0jkcdsAjyoENvIu71raIDolcSn8r1YW0WlSaQvSd+leFp5VNJl?=
 =?us-ascii?Q?Lm2ve7ypowwZOpCBEnrWaDLzxuW254MFbvTqWOA631SqkWBW9032lZzdLjwb?=
 =?us-ascii?Q?OzSslfroOi/Bbn40rsIpvm8s66EEcve1l0XoXEQhXeABShfXzPwDppMkpZ8o?=
 =?us-ascii?Q?5lNcoVY0iZedkWOOg4myYamZiC+nKdY9HKG3Djdzz/5X8o7R8TFgtWG6SM68?=
 =?us-ascii?Q?rW9ZvLgr7+SAAEiKT6CDujroDVH0+FrNgqueeD9MGgmCE8JbbQE79unwcyaS?=
 =?us-ascii?Q?mhYu66sTKmRl+Qgknl9CKjw6wOMUUYEkjHGW5qkpWFCSb5xr+krYn5+uPmLq?=
 =?us-ascii?Q?S4cCyagUSt3ZwInduaD6bQWMeU9489yVcZWOgGIBgH1MYJZWeSmG650OTld6?=
 =?us-ascii?Q?TZn43eLV8KFp6aJLdHA7Ef6Kau5MhPLGW7E0b3xz+/Ra8B5z6L0XZ+nzuNAZ?=
 =?us-ascii?Q?dFffqVOXu28aVuqawbIJMwhKpjN+aXIrdNTDfWgaF+d833ElgzgLSWMSas+Y?=
 =?us-ascii?Q?BHiXxlRktXFWPD3u3UrKzbY6uBnFpRriVRvwoXAmuMQSaNcDWJ77Vjk2ysUm?=
 =?us-ascii?Q?cixnW17VmtAaQVsXDn8b2vmEEozgqkhXG88m5QyItRnB/E9sJZPoTx0p4K0+?=
 =?us-ascii?Q?9YpPLBkbnwFrmll5X/kVaiy2IeVYR//KXOMsAdWQJxemLO9Rh1xfanEtiru+?=
 =?us-ascii?Q?GL04SAg7saPPCbC49miGvWb2IwHi9BTuOHtm/E99S9h4GIse2xRiLeZijANP?=
 =?us-ascii?Q?ho0aDU54Ug+KLkgYzb2rAnbnQ9YVKpzEBx9ZgUr4GU8BehRkqxCjxrS1gnk+?=
 =?us-ascii?Q?S5/1MzqTq3pWtVODjM5RDwL1ZEgpcDI/Jikr6IQJKgxFrO8IrCay5ltrbw+Y?=
 =?us-ascii?Q?4NLywJhlgvGZQfPUh5HuWJtwBKeBNr3Pn6ketDgIgxKsrI65wrg37HYpVPaQ?=
 =?us-ascii?Q?1wvpRpX1CvX30QyzvI3o1wEOjlAMRDgWMTzW1YNCz6NFU+8dP8/R9rsIPei2?=
 =?us-ascii?Q?dk0WMcV07Ua/PhGvkmZeQ9PIE1UVgrW0DE4CJo1XYxCcno02Eew7PXFQo1D6?=
 =?us-ascii?Q?3yFqtuiuge5F6xMUeN7XIXc6Q7sqNl5WCHFI2FIdLBY9nXlzwp8haWfOZeMk?=
 =?us-ascii?Q?+H+dzfZUsPj5CpbEMHMSH53BmRiQJjR+TaLy8AiUcNM+gHOIIudlX1sWUycU?=
 =?us-ascii?Q?j7NJ4okP5pOjlzy3Oti1G/oZXJSIyfNLZebpI7MwMD+E0UJV+sv39xqD3PBm?=
 =?us-ascii?Q?wAaWDjzu2QzM1U7whBzaAvZYgbDbUid8krxaSq8cfffxAvjUiAxI6GfEQd7R?=
 =?us-ascii?Q?mIgJmGN17MmomeGfcP883FCrUXk3xIPFm/I/lgdYV3eDtbByP8rBZtFYKfIq?=
 =?us-ascii?Q?Nf9NVmmR0ttMyNeBIRNmPQ7o/asFtNVicq9Z0fduGzJliaP3nZhjo/WcNXwR?=
 =?us-ascii?Q?+C1khOBd7ChQIrWhrLFEWLeXLLsIYfYDhT1v2sjj+Mp8kDUuuPv2v/h2dykS?=
 =?us-ascii?Q?wxGNV9I61N0h3/jg/WG1EmUwuTw2sCHttCmYfF5cm34WDZfqyp2aduC/fqOn?=
 =?us-ascii?Q?AKQnINMggYsxqhtN3jS1esZ9RH0=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e503dffa-6983-42ce-c896-08dafdce7888
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:47:25.4603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsM0swrpIt4221ejF6gmWSD2muCKdJmsYrRUBqhpXjMezlKrntqeR6R1UlKKyCOV2uzKcL1B5uPeicCiFAfXwpKkIthfPDAUU9S+v/3NemY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10032
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rk3568-pinctrl.dtsi only defines the 24-bit RGB interface. Add separate
nodes for the 16-bit and 18-bit version, respectively. While at it, split
off the clock/sync signals from the data signals.

The exact mapping of the data pins was discussed here:
https://lore.kernel.org/linux-rockchip/f33a0488-528c-99de-3279-3c0346a03fd6@wolfvision.net/T/

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
v3:
 - no changes
v2:
 - no changes

 .../boot/dts/rockchip/rk3568-pinctrl.dtsi     | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
index 8f90c66dd9e9..0a979bfb63d9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
@@ -3117,4 +3117,98 @@ tsadc_pin: tsadc-pin {
 				<0 RK_PA1 0 &pcfg_pull_none>;
 		};
 	};
+
+	lcdc {
+		/omit-if-no-ref/
+		lcdc_clock: lcdc-clock {
+			rockchip,pins =
+				/* lcdc_clk */
+				<3 RK_PA0 1 &pcfg_pull_none>,
+				/* lcdc_den */
+				<3 RK_PC3 1 &pcfg_pull_none>,
+				/* lcdc_hsync */
+				<3 RK_PC1 1 &pcfg_pull_none>,
+				/* lcdc_vsync */
+				<3 RK_PC2 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		lcdc_data16: lcdc-data16 {
+			rockchip,pins =
+				/* lcdc_d3 */
+				<2 RK_PD3 1 &pcfg_pull_none>,
+				/* lcdc_d4 */
+				<2 RK_PD4 1 &pcfg_pull_none>,
+				/* lcdc_d5 */
+				<2 RK_PD5 1 &pcfg_pull_none>,
+				/* lcdc_d6 */
+				<2 RK_PD6 1 &pcfg_pull_none>,
+				/* lcdc_d7 */
+				<2 RK_PD7 1 &pcfg_pull_none>,
+				/* lcdc_d10 */
+				<3 RK_PA3 1 &pcfg_pull_none>,
+				/* lcdc_d11 */
+				<3 RK_PA4 1 &pcfg_pull_none>,
+				/* lcdc_d12 */
+				<3 RK_PA5 1 &pcfg_pull_none>,
+				/* lcdc_d13 */
+				<3 RK_PA6 1 &pcfg_pull_none>,
+				/* lcdc_d14 */
+				<3 RK_PA7 1 &pcfg_pull_none>,
+				/* lcdc_d15 */
+				<3 RK_PB0 1 &pcfg_pull_none>,
+				/* lcdc_d19 */
+				<3 RK_PB4 1 &pcfg_pull_none>,
+				/* lcdc_d20 */
+				<3 RK_PB5 1 &pcfg_pull_none>,
+				/* lcdc_d21 */
+				<3 RK_PB6 1 &pcfg_pull_none>,
+				/* lcdc_d22 */
+				<3 RK_PB7 1 &pcfg_pull_none>,
+				/* lcdc_d23 */
+				<3 RK_PC0 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		lcdc_data18: lcdc-data18 {
+			rockchip,pins =
+				/* lcdc_d2 */
+				<2 RK_PD2 1 &pcfg_pull_none>,
+				/* lcdc_d3 */
+				<2 RK_PD3 1 &pcfg_pull_none>,
+				/* lcdc_d4 */
+				<2 RK_PD4 1 &pcfg_pull_none>,
+				/* lcdc_d5 */
+				<2 RK_PD5 1 &pcfg_pull_none>,
+				/* lcdc_d6 */
+				<2 RK_PD6 1 &pcfg_pull_none>,
+				/* lcdc_d7 */
+				<2 RK_PD7 1 &pcfg_pull_none>,
+				/* lcdc_d10 */
+				<3 RK_PA3 1 &pcfg_pull_none>,
+				/* lcdc_d11 */
+				<3 RK_PA4 1 &pcfg_pull_none>,
+				/* lcdc_d12 */
+				<3 RK_PA5 1 &pcfg_pull_none>,
+				/* lcdc_d13 */
+				<3 RK_PA6 1 &pcfg_pull_none>,
+				/* lcdc_d14 */
+				<3 RK_PA7 1 &pcfg_pull_none>,
+				/* lcdc_d15 */
+				<3 RK_PB0 1 &pcfg_pull_none>,
+				/* lcdc_d18 */
+				<3 RK_PB3 1 &pcfg_pull_none>,
+				/* lcdc_d19 */
+				<3 RK_PB4 1 &pcfg_pull_none>,
+				/* lcdc_d20 */
+				<3 RK_PB5 1 &pcfg_pull_none>,
+				/* lcdc_d21 */
+				<3 RK_PB6 1 &pcfg_pull_none>,
+				/* lcdc_d22 */
+				<3 RK_PB7 1 &pcfg_pull_none>,
+				/* lcdc_d23 */
+				<3 RK_PC0 1 &pcfg_pull_none>;
+		};
+	};
+
 };
-- 
2.30.2

