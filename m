Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3614D63D777
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 15:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1354A10E467;
	Wed, 30 Nov 2022 14:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320A610E464
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 14:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdNEkTC1szKEPvz+N/wexEr3Cxw9gMvu/hndOjI91FLuCOnm8D/XugIQtllJi7b0lUhsypPEodtBkWlygwNZZrpXNFPB20+D8bnnlPQn1M4YszteMPJg0m1JDkd+CtHEQBfFD4C2/b4KLxaJCyhiFQv/xWkuJ8dAl1ralTeo1/6KPgi9VXw1XkJhtBLpTdkzIbl7SOLpl/VZHr2DPg9F0Vx582kIrCSXg3VZRSosaAp+cILN49wmWTeGxxQJyNx2FF8xRSwqdY/HimvZ9K7Y7NHkL8d0r0e3AyNxOp2S5TyvWGnjo2FVVhGbqGgzNrM3svA+n6mPmi7sGGyk6/cfRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JWOS8lUvJPNqMcIJc8qzTn3TapYiYs8bxcc+17j4mQ=;
 b=kg30KorPmthHjI3f8c6ky/T60aZxz747j9Uhu910CHjvnB7ENKhiFw1ROwpkf7TfYmvtTNMeaxCT4Hiv6/HkOdoqVwLHyAAE7IhRqkVuEywdaiCXLQj/rjaWJH8kfQVqmxuiYGlCtCUH1pjYK5Z8ioaHJ8Pmrss+/qSdJRjBNWrOY4qyJYNmmW8mAfpCxiBB5z2Cpc9ebrFC3P42nDkRF160yyyz8b19pvLNJqqhvQGUkVkrEjccLYuG54hkGG1yjktgwCkRQlqFa7hhIQ94S56ulmTj/hZaYwWvZBLby6DraU+kGYuOqIL2KoyJJ6HPgBoOu8f8tbx+a30vIvQFyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JWOS8lUvJPNqMcIJc8qzTn3TapYiYs8bxcc+17j4mQ=;
 b=Hxq7lLfV/lMq8Ga655HdPXAHxUjJanG31bPdV9YQTRP+AQB22iRo5tBvB3gGqBPmnoGchAx+Z65KK+y/nektQ/pEBXxI3Zhwk1aRA+nzmC963WuAHUgNATVK+vLw5+cFc7ZhFq8rFY5Gkf5YNAFxiboEDbzShHEEPkWxB4H4ts0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS2PR08MB8695.eurprd08.prod.outlook.com (2603:10a6:20b:55e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 30 Nov
 2022 14:02:55 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::3643:6226:28c:e637]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::3643:6226:28c:e637%2]) with mapi id 15.20.5880.008; Wed, 30 Nov 2022
 14:02:55 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] arm64: dts: rockchip: add pinctrls for 16-bit/18-bit rgb
 interface to rk356x
Date: Wed, 30 Nov 2022 15:02:17 +0100
Message-Id: <20221130140217.3196414-6-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221130140217.3196414-1-michael.riesch@wolfvision.net>
References: <20221130140217.3196414-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0182.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::15) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS2PR08MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e981ed7-212a-435d-151d-08dad2db9403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RynORZ740K/YT8szrCdE9tlLiEuLsbO+Lb7RumomSmqkN406YrMoaMLHy5RVbVkZWUKU8sMy4Zx8h9g+I4cORDaebbuVsiO9DELYx0QnjdidKYL2Kwqr+fPVi2r8S+5NyCS/Qzpc7DXNwCQANi5RLACYV7txqwfXeYXoa9ThyH7+ePSvsefg1I8Wyky67+Ju135ooufthewMzrwrwQ1a9gHYE0vkhuz0SmxOLCONYIMLTl27LlFWQ7eZ/pxfqqnPKS/62bgNiQ6t9HDDuENQAJwio1WPqNnri6cptr9vtboMLLh59D02rxzv7bjhqNXTGey1/FmXbnoUtwsP2eiecF8604zbkYVVrXyL4uXtszr6+gnMPnI5fIOOQN1Cc/r/6Y3muoFqxmp2WQA5NwEuMdjh925sogY/iHgrA98xjBuTak+PePJLxpYmseNfBhkbjgjSVvVm3vMaRJg71Qctr6KzpEYhBWb2BLyHKsnTBTdVBeuYp9Qb42XIzW3U34Hl5bQsezkZs9NrmYiuDiKzRJ7/A0SFEvTnRmHKb64HSwrgnp3jYZJyx4WHgygPSJe8mbm/rkLERb03TNp15JlTbxIISgx0j2AwMF69abo6aP3XAhdYRtu3l/6BO/MnDYD55WTiXeJ7uoz8NG69Bob3/tqqxfhAxg55WKx86Wuq2rM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(136003)(396003)(376002)(39850400004)(451199015)(38100700002)(6486002)(966005)(54906003)(478600001)(316002)(8936002)(2906002)(41300700001)(83380400001)(1076003)(2616005)(86362001)(6512007)(107886003)(6666004)(36756003)(52116002)(6506007)(66556008)(7416002)(186003)(8676002)(66476007)(44832011)(5660300002)(66946007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Ye/RyJ/3TK3ZIIY2WqYP73ioxai3tlaU/+2VGrlqzNxiTfMtMBKBs/9poM/?=
 =?us-ascii?Q?cnpiOQjPmrJnHEgCeAOhTiLzjTQcohBGGwaMU7j/JHE1XpzXoDIvXjT6B8qp?=
 =?us-ascii?Q?zROW5SlvQWyY5hxIJ+UWpc/ziaT10SBjd6q7SlGS1NqQlkbxvOSj2H9qLIwA?=
 =?us-ascii?Q?HU4tWA5hy3AEyavrn84ye0moZGcXYZnBzUdsoteLp7VcTy3TBMSTFOCqQhF0?=
 =?us-ascii?Q?gThkVqMBW+hIdh5SZEdgUDQE1TPb0ssXcXTN9dbWxmMLsGcgiEafpvqaOhx/?=
 =?us-ascii?Q?K3CGIsqublFheecqtiDvcUWlp5kO+iOqaB3Trw+eyIBOIEKIVvV8I1XBqBpC?=
 =?us-ascii?Q?AV+71+WJj3dhYBzqSdwnvwt4xaUKmXwql4eNCI2FmHHBplMRs6KVklYx92ZF?=
 =?us-ascii?Q?T6vQDjtyp7h7N4l67Zlh4G4v2VKGRRCyRw2PJRoRYfUkpfnUlR1dQspd5zFY?=
 =?us-ascii?Q?LCHLdQTlc6wVSL8BvsBu6pftztPQkUupiHd5/oNaNQTGbPeoWVZbYSsiunYd?=
 =?us-ascii?Q?6xl4nanVAAwdQwF1VubvrykMrselLzfq5W1Oce4oiAmvw6l+w4XNWZzyO7yV?=
 =?us-ascii?Q?rN/zeJ6Y9pEvvBU/1A2kMYL8nlkMcUcr+nosKj8IWtPvzIzeB95ulFnWaBL4?=
 =?us-ascii?Q?WJ98ExE0Ni7drCk9MhArdNmy+CX3qtIujHmYu103vDNrHgwffGuD8jzD71ww?=
 =?us-ascii?Q?f2M0oFr5bdps8t5h8VR7pmhR+7TQPTKoCrv8Q0NhuXRVRgOKQIGw6tMA/tAh?=
 =?us-ascii?Q?AouzQMToDVvYmBpoRpgCt5hWW8ymLlpfSpbJoTHgEz0Lk81k65Z0cAYShVWN?=
 =?us-ascii?Q?FBkAMkFQBUcjgqL2Bc3v1n5hg+eqKXLVx4LVOBgJpfU9ylxcQOzFIvjLyICn?=
 =?us-ascii?Q?yMig/UahHU0POpViyh3vceHSavB0kN3KVA2OZR9xwrwBvi7C+ENU+Bz1wizu?=
 =?us-ascii?Q?wmBbSRk0xY6NQkk0H+n1OdZ0qJDeSW42AjJ5I43Goe5yVCzjitX1ec3Nr3XV?=
 =?us-ascii?Q?GlkXYZKfWpG3nDcG+HQUgqpFLGR3zkjvagjNj8eNyrmXS9CQ0BT8nXglx2NE?=
 =?us-ascii?Q?iApjfpXdexq8nUbYWwmB4Mvf6fCJcZk+jWbEAUXwxKjMJ+j02qHGe00pQB7M?=
 =?us-ascii?Q?WFuQBONr/LRIG6R5B34HbmhvxLneuvAckn7ArwrWR1NswfUCEXTfSSccK6KF?=
 =?us-ascii?Q?/MA7N7TE6HupsOqfMjwKJkx8ZOtHbrNwgCpt/cyOM+AYPxevqbtESSvTjiBR?=
 =?us-ascii?Q?mJue+MrQX5N45ERtt4G9FVsQuOYDY+wP3/sV8/UkZH4CYxfOBMK4hx8M6BcC?=
 =?us-ascii?Q?o44McyJnAp6XwuVnGasIW/UwsoYouXFlDV2RG4nGO4HCTAJJL2it4HEaPMC0?=
 =?us-ascii?Q?US7yOZ3riuKB8pVjh9PxQOuEgqxZsJn/3caEXWbcdtqsU75HjaqotepsTkA2?=
 =?us-ascii?Q?MlIQl2AnjawZvVtXKCCT22/VPKv/sXmFqpCE65VA1+uR09vMJVvcwf4+afH/?=
 =?us-ascii?Q?qtxa9N+X9SmXSCkW5nZnHD1+Zj46EAHDmdHYYA28q3xF6fmQXjTQ5YRMuUjg?=
 =?us-ascii?Q?rdi9gmW+iA99/MhqMllZuUzQuPxPNjNHj+m6MUPv7ecXY9gQFLluXb2ijZRI?=
 =?us-ascii?Q?rwLVBOneNite49oY3MuFXmtYxCtirX1XlxahtV86X+HC+T000wibreGWPNIn?=
 =?us-ascii?Q?iQrNwg=3D=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e981ed7-212a-435d-151d-08dad2db9403
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 14:02:55.0028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NfkpIVCCzCHDsdEUUZla4DY2Vm9LupILMZH7yJWwtzBFsjeVlFsTDa30/g+uThqdPjKsFgrog7QFExcb8g9/qBK0Y3nT8zYU4c1mXViRBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8695
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

