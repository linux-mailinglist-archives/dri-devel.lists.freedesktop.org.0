Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB0C673C3F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF5310E96F;
	Thu, 19 Jan 2023 14:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062.outbound.protection.outlook.com [40.107.241.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0AE10E96F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:39:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HH5TqMvcakH6MsIcZ0KN0hM+OwqmL5WPidXggE2Br4RuZL67pn5BmTcGxjB/PFsHou++30fZntUIiDKkrfsY6LVOFR8u22Le7tM9lCPzBB4kcOHH+ETAqFUQ0wqEtYfC/Bj123Uhgtz006zAb9Xlc6xNAW7+L9OTnLfL5YbND5l4TUhecW5G0Ah75EuZsZQLKpZrUNK1am8wi+Tw7Cf75K/mKstJlO0LpjzF8rPg7oOMB6I8fnKcizdjdFwSpoSLi2zDe2+oh/mEVKR986XKlo4tvWwnRQoH7/g6xNMAxdJscGT+l8zJ1uGeRucMH+7epfsr+fIQLrbXI59Iml9/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEYoPRCiCB8m/KrOhtmvJIRuuqANDjXR6bpxvNkok4g=;
 b=RSgGiFSutrZHGKI/4o/0iBKZQ4T3K2EMhS4IYfv33msQuB+IBkHWp9+qrv6gXdHAGF2nmA54SNr2FB5oeDTbuvhvv3O0pH/3lRmYYTXDQW+fbfn+7cXf09DkWHFtbT10bD/XXibaGwED6bPytq2TAzswjEM2Kn1ItbUISZoXrLK3MAVNUcmOWVpbK5tgGjko0FUKZsd0TO8NA/SZ8JgwTRQ6Ax2sBqNzbbBECwdUYp/alq45KAbDOjZWcfxqGB27I+RAk6HK3fWr2JgFzhJg+u3FyN40TxlczHGad++bsS0MluarBNlCI0gat7m2yAlDCew2Pmt0jrFRSiZ3xw+ByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEYoPRCiCB8m/KrOhtmvJIRuuqANDjXR6bpxvNkok4g=;
 b=0kWaI6JxeUoxLx/H0TuMOdLtDWKPxs2F5yMlbXi3DmZ2dhnxDq9JtG8pumtbHf3UfvVQYg28BW2RU8OUAYqZF3LjhNCdRY09iKhQ5fLcEn2cHUiBmC7SF+P2wiRhkuhrEmrGeyfcfUhPMaJGQlAbp950xVvbotdK0mvFgPiCMsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB9PR08MB6556.eurprd08.prod.outlook.com (2603:10a6:10:261::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 14:39:33 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 14:39:33 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/6] arm64: dts: rockchip: add pinctrls for 16-bit/18-bit
 rgb interface to rk356x
Date: Thu, 19 Jan 2023 15:39:11 +0100
Message-Id: <20230119143911.3793654-7-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
References: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0152.eurprd07.prod.outlook.com
 (2603:10a6:802:16::39) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB9PR08MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: efcff33e-f4c6-4713-1849-08dafa2afb17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RQy5FKOgLZHyqR8ZnIc1lb/ic1GvKWFf006Bvm9JC+y81HNi2HWnEQALTewxlP09MHGI91+pz4J02ZDGUJ3J0KJ1Qv5NaDOdfy76Lx3Le81+Nk07vCpAanehp8Ls6MnM+i3O1BpwgGxCaMQUnTEdmEL3uPCKTs7BMBVbjO51xn2aPjuKsxiZHw+ufkcvmjTcw0+QMkL+ywtnXRW5m+XrTux06UtyBzWGjjmihrwKvCHxS5ZnR+mLQYCFkYoef4+ZCOSZYoWeZO/v67Rzz4aa3dbqFqHkAyCSbObWLMFhp6yUZmlQ9gL0zkdu7lV2SR2coK4bWtJbyRzddChOi4G2z/uvNRuF8R85kLxDONbqS4ZFBe+ckJsTmD3CiTwyDQzI7u4WNXRdnL03vIyXbyMqOoNUiZsIRSOTuPmJT2+ou8wPBx7rcD2BFH4gWyoClsrIHefjRsgKCysjtEvzthjgx+Kezxjbk+wgmUiY3vXLAkgeUEBR2GwN0QW2m7bPsy6G0jWnygn/NvY7Fc+IT80W6NX5I7xRbMbhrs6pMLOnuiJkywmgl7xi7bqCiGUjODnvTob4zwD5cLC7tu2K21w+gGo7kr9CHuKi3wxIuhOYejiMk03hFqC+rd0Vqn9jGMUayFsjwyU+mCi3xARjrQr8vUAR+SU4SlDKLzEtvpGYREo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(451199015)(2616005)(52116002)(36756003)(966005)(478600001)(6512007)(8936002)(186003)(6486002)(5660300002)(83380400001)(41300700001)(7416002)(38100700002)(44832011)(316002)(1076003)(66556008)(66946007)(66476007)(86362001)(8676002)(107886003)(2906002)(4326008)(54906003)(6666004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lqSwEHA7XuhkBFUMjHdnVaTWE5NFU6XLPRRQHpiaEeOIvmNaiWPJGqSTt8Ic?=
 =?us-ascii?Q?gsP/nQy8S+92ZpjgiCc15qqBbskFwkrceJzZ+e9nXpi5VXkUBwmBHdv9Fexx?=
 =?us-ascii?Q?+zsfxo/nXj9/0C6sxqnRI15bnN0M/SxgdX6eOUysxugFi4CHyiBUGiuJN7GW?=
 =?us-ascii?Q?hrFCoEZumzNpC7CWHwa5L2RRFhg4ny2qcYBb2qOQzwFF/8EI6ifMOCblWEYQ?=
 =?us-ascii?Q?O6C8uIxykyz95i8aK3J0yz6cBZAJd5aEYX+f7CX7zVHg4+57zLw1Mx1Bne9c?=
 =?us-ascii?Q?2Roih7yIdd9ehOSNWXOeCj46JWo6EVTZi44NPrK9ZPPGdn2mp5FX35LvkzuO?=
 =?us-ascii?Q?Y494P8zMIegAONbxb5yMeLwKRiXyOw6qPyM+vmY2jXxtYYZqq+uzEnlZTdxC?=
 =?us-ascii?Q?oUV3IfNNHCsaXpHoKA1Dy13bfQ8uw282zX8wY9KzAenW0+/m7Mtfc/hk4wQB?=
 =?us-ascii?Q?iMY1PzUnEf44WZGo9dW6XJnrku8FkTDwDAFoQxXaPEE7XBsgxT17wnS+GjAv?=
 =?us-ascii?Q?tlFiZ75/i8PjvHZkNlGhDauHqKrnowt2ExMFZASCa1p6sQAHXssX2mc4mlyX?=
 =?us-ascii?Q?AF+trHOw47gs73dhg9KlOO8ta2p55Lyeuh2vqOX7h8hmUBCG3GU+3Ylkycss?=
 =?us-ascii?Q?QGtF9Kj9f8JhLennbjLs68SYPeguXx/IqrcVQCn8aQP/oh9QJMfqyScIslsA?=
 =?us-ascii?Q?y3y9Sqhr/PdHIo/jxh7CWqoVevySmdAgvyMoEcdiU4fqD1y/mkY0zGW+ukC8?=
 =?us-ascii?Q?dV36N9VG2habOAy/LKQuHs3bkR37s8iw4NSYhufvlh+iQWfDhXBXR40I5Rdl?=
 =?us-ascii?Q?7k2qlN+PNZSHMiDTLfNtgPjtACqADu/khNVGLj67GRPMOJBJtSFf1gOFK7T0?=
 =?us-ascii?Q?hRHy6EotIqNhd016EZdmmwXJVrXaQ1LpgjPUQEJtb06ZTRsD5oBTtvyCm6Pq?=
 =?us-ascii?Q?PQUx9asQZuezpHzhvNJpYOIhVWqiUMRjDF93SxLVJHyoKBd8pA9ySeUUgOM3?=
 =?us-ascii?Q?DkWpADTNpXflWly6Um/jI8jbplmsiwYZfPw1skImgAV3mCYHLtpzUwPl0+8P?=
 =?us-ascii?Q?uFzNJLTP1lBE+I67IO/fd8P90+5EmU0VbXQL1m4kHt/aa8P4GwXDFmyDO1b0?=
 =?us-ascii?Q?mkS/NjMl/QO7QuYRdFxEhrV+u+wJUy9SM2BqaJCI8OSwclZUgIPsclXIpvnc?=
 =?us-ascii?Q?bX+6U9/JnimQHtmWoviZleCqfEQFrAO4jrS+rBwe5646QWjSEG/vaGWK91U9?=
 =?us-ascii?Q?GnvDoTjxERsUkCnNRKYIjWWesDwsNJEynV8eZM5OYdr1G/o3mlTAbbtIBH1l?=
 =?us-ascii?Q?o3xmI9CMNNvm0MGtm07UUlGGXLWoSGlqwRzYWjilKcqiQoawlLOWZ4dVKix+?=
 =?us-ascii?Q?MafTiVF3AE+SOVglqD45qvO0UwIrwNzCqDg6xjCdwo0TBnSqGAMaj1Hs/i1c?=
 =?us-ascii?Q?fpGXw11p8zG4MEdRJ/Y1MVZ3NfB/FFLshc7z3B6UdBNY1gXwwFKV48ha/AOx?=
 =?us-ascii?Q?1YdsHFbFWs+0/cmPLsZCJ/WEfLThtVLlkZjzgxEqwECVj8onap9+gxNdIatW?=
 =?us-ascii?Q?YNdbptkDdXuimSB8c2jl/zRmx6xilbRd/BR/bn+nTNFEupVMjYIuZk8YGQ7w?=
 =?us-ascii?Q?Nw4foWRBiynJFXmXfPGYYkanuzVcyJPNqJS09zxDy7dO8M15ZlBdo0Yb/gwU?=
 =?us-ascii?Q?ODatbxQE3BYL2uRXzPi7DdJJ95E=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: efcff33e-f4c6-4713-1849-08dafa2afb17
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 14:39:33.5605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bf+w3d9qsXuEx76v1XZcMz8bWcibC+Xl0dMVuDF6G8WVbPdU+9lW35aQP/CX/KPkhdDTDy3cH0eZOxN5b/IyV/2wo5dg7qQ3ccWFD34tVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6556
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

