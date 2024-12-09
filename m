Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C950B9E89DD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 04:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3BA10E47C;
	Mon,  9 Dec 2024 03:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="nfHI+/pr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2043.outbound.protection.outlook.com [40.107.249.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0A610E47C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 03:41:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E82GafAHtrWEKLCnUUC5+XD4qqtoIufYZaX2YJG61U1PkkEi+1J/3dornbW40P/phf9vYyFTZ5lnUGDZTR+mgZhG+qWmY3oT9K+DvVUJRUGT62fKDkmNENZuDVJGwcxFePGaPLX7LCA5cyRktA/1FWqExsXAWysZn9iXHDalbtkVc8TyXx3fjyMSR3hpSQ9LC+/DmHBPhHLwtkaDEyhyO9a5uvDKNRjsfrUTo2PsZ8kBHMKQT1h1u3Pcv1BmHNideEov7CSQSjnuPDPrSrYeUdQfPZdSn+SILpPesITd1Nm1hGGOOPaPjlYTcjER1hbTmOe1YtkFARHrqlw0qfPNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgia5aQI5wH4ef0uSKDaectWOyE6PJ/NhEeq+pN5wcU=;
 b=DSHlP/PPtJTrRDgbgLBjopWlSKDDkE6wosxy/khv/4tcY9zz+QioDs3L70C+47S1K6StvGFeu27/ohC9HL9n4cI/km2EkvHWQBvin3sKN819ce6tQESNqd/Xm/5hSGec77spU/wTFiasnyjfT8A1S9gW9pvsQdAagmdlFGVkUW142jPYSNI/2ToeMaMuvJy25CKdqXJX+iJ34k+JyfZPW5Zqp9oN+sdTWnRQqc2b/hXIQjXJLZHfdLnTprij7C6bstQ19wqTJ/wwEMrHUfaiOlarT1D+D/ynvkKbJilyAuBtkZVR7PPkq3uInIEcgMBflM7Fi1v57+gfp9uPjNwCcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgia5aQI5wH4ef0uSKDaectWOyE6PJ/NhEeq+pN5wcU=;
 b=nfHI+/pra+zgNHsG1HAYp2buwjxomdLKpAkMz/H4c3CVTSsd++aSdONsv79Uj6zSrOZrK1fqOxVpXMSGYLHPwAJxuIj99Aev4bbJ2NeRPoBU0lbkhP2L8GPWfKJLqLNI3ksY58t8qT4oCRwJm+rZczm/F5vE7jkZoNLtc9N4JWtavOgGEpZW5OLPJ9VBUrMD+RJORH7SNvUPcUGN1eTZfInLzvY8p1WKQ+vTToMNuiHskOeZbUSGkArpolN0myOAK1xz42tM+iw54l8/Y4lwfGyQC6RL8w7kXIwo4X9k30oPMLvL5BI7YNSWSt1mtDgdLunTYSxYrS1lY826WFkjbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9438.eurprd04.prod.outlook.com (2603:10a6:102:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 9 Dec
 2024 03:41:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 03:41:54 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com, dmitry.baryshkov@linaro.org,
 u.kleine-koenig@baylibre.com
Subject: [DO NOT MERGE PATCH v6 18/19] arm64: dts: imx8qxp-mek: Enable display
 controller
Date: Mon,  9 Dec 2024 11:39:22 +0800
Message-Id: <20241209033923.3009629-19-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209033923.3009629-1-victor.liu@nxp.com>
References: <20241209033923.3009629-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf9fcf1-b8b5-4c58-dcb6-08dd18036ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a7iCtrh2v0ZPkuaOt2wpninWgf27H6MerRlts8/5tkRyqZYw9f1M527uKBB9?=
 =?us-ascii?Q?YWlwTA9WBLx5Ud84IpPVf5oM+IxIA4yHzlmUPrqFw9uVoopsD2wc8SMTTbKu?=
 =?us-ascii?Q?XfNzrT6Dy7i8MAYoysZ1kFNBW+IraeIxmW9DSvpMhBOBozmLdT9NBPEnsbRf?=
 =?us-ascii?Q?mH36BhZY+eqyt0/8qMznzpgprCy8ihADL/wrl7BUaUhbIpQv3OFwZ66ae+YL?=
 =?us-ascii?Q?JxrGXMe9j5HQbS+seR6tSl6xcVPTcBttSP0tlvnCtCDRJVxVASdd1tUuPUSV?=
 =?us-ascii?Q?8XqS6HFvNFUVBBlDgT4iuCbqhPy8P1KftXoUkJb8OgSz7YypNrTQ0idhRh0J?=
 =?us-ascii?Q?wezxRwW4yNg+2koQO/cfRTdOcOHe4a5VQxdD3ZIpuWsfsmOm2J1znRhNdDRV?=
 =?us-ascii?Q?Lg7u4tuoECqxabfckqWHHgGzP9PL9d55lT6oOaX4OAV9T9B/C8AJ4b84JFDP?=
 =?us-ascii?Q?8K3vf/A93suMGhzwwPBiy5Ino6QhQffRejbsGF7VYCbZIrab6c4v8Uk31ZDn?=
 =?us-ascii?Q?W6xsQ0AnoeGA7r3w8y4qaN7HUOprhswOWTydgo0TTJsO3FTWGEVEhIejLRp7?=
 =?us-ascii?Q?9yVQ+4DQGbFZYZGmSSP0hDYowQdAmzsc7hkcdVpzYuVui+2vTMe/3Q65+1Uy?=
 =?us-ascii?Q?za9jtriRIq3Pvg0hk/1aHAoYucNin/0VPko++TlN2pnzl1CASnjpyt7vWhHV?=
 =?us-ascii?Q?BUEf+qhlGe+pxtg3j5lVeVPI0AA9CLbQHWmBFjsgLgZ/Olj1vsRa6GtjkyN2?=
 =?us-ascii?Q?LmtEr76myCz7ALAO4LBlopL7H6rdcWIHwVGXe7pH1zp2nCQeF/Ivifqhult1?=
 =?us-ascii?Q?5X4yifDr4xk7goPlKHeTZSKQC2KeA4bBR1Rf0g5LKaaJkD6aGnhHxK8U8m2+?=
 =?us-ascii?Q?UszEvLYN1w1th1bSqjZXQ50YeKduxfHyhGyaRVL73NjYbMb/aExcpMk+sgI+?=
 =?us-ascii?Q?/TRYWn39eJXFXz+kZK+Z4UrNh3/Ih6p63ayakhELFeelvOUn2VN+KbepB7P/?=
 =?us-ascii?Q?XEK2blGQAKdq1XufD3k2WrsD4n4utLXTytN7h+tRV1ppJrNJeoeTbxBpEBqw?=
 =?us-ascii?Q?OJDnxE607+WDhJVHBROF2QXIyiTozZani+s9GCPdBLPxD221XVT0npE9GM74?=
 =?us-ascii?Q?9K3ju6u/itz4yrdLLbcW1gDn3r6nm0+fh42dyfiAf4q7sX9SR675pqy4ykfs?=
 =?us-ascii?Q?DQxeBjQJPYkeLvGKUOB4rV27V3MQ220sGAvwYeuBKNVmOHVXlfAsvmtSYJH/?=
 =?us-ascii?Q?auyE6y0Fec5JsQ8v8oBZqOL70EsdOMg4xG7ObQf24ntMFPc150wHeNT3hdnh?=
 =?us-ascii?Q?5q2g9GAnCi0KJlUrwCbfEYy694EjJNZ7gGfOjRRxsm/IZRUd+F0yu3lVruPH?=
 =?us-ascii?Q?CNlmSxPJULFKfNI31/U0CMz+HiUY91p+h34oPB7EKonbxVpQwQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rdm8w36hzdhg++eeP+lZITEX+OQJQpfk7YlOE/oR5e5vUv/x3WIwwJ9eXUbk?=
 =?us-ascii?Q?9QuEYHRlmEQPP2EHqCqx5p+hCoJprn62r30fb1brtGqqbfn1oXyw5N9jgO1Z?=
 =?us-ascii?Q?fMvVXqBWPBG6G1rfLJ3e0M++CIXlIMWMgKLHXwVCJdMiKfNMBuF0qFDgWUBr?=
 =?us-ascii?Q?n0tRpih+rZje0pUBG+eaqUXGdvTaaXnKaQSqcrpJg52nThuZ0utDSN3U+13s?=
 =?us-ascii?Q?7SJcXDk45abHxIB4a1Yibo/iDjm9rkU7AA2kMMHKmx1zU57Z/KkfL9fmloQf?=
 =?us-ascii?Q?H6Gt4Ob3LHoOnqfvS8RdTHicLomCx2GWfg5MQr/qLcrj9SkBfgyWQv+axuCC?=
 =?us-ascii?Q?HiQqjalrnmpQEVPfb5cDb1PhiNdQmgtPEJGfeUrKUngxGN7EVL21kXVw81Cc?=
 =?us-ascii?Q?m3NsZm5zmhFVZr3OVmO3Jt9kKnYWXeBAUFjRtqmpT0OikxB4DG7uYVfOQVva?=
 =?us-ascii?Q?jcuqztMV0TKm3YxcdSH4DOv7fxhrl0uZGr/PoYyi6sQwBk5kbVodnpqplo3K?=
 =?us-ascii?Q?vsYS1Wr83+pYJlK3QQtiEQJCcWot7ye4h3jP83rUnfAmTgqPxjYhcBX4dNe7?=
 =?us-ascii?Q?YkBG04rE5M/r06abj86hHI+Qd1orjWuRMEy/b2XAuI3vsTlomYb8E4i4sg5s?=
 =?us-ascii?Q?vGto5HKHbWULvmNwqQjERz+D0JidxwzSr/dJFAxFtgINuHDClQfcpK8JQOUA?=
 =?us-ascii?Q?auWcQQ1wti3SXvQXouGhsUVHbgMhCzXOhcaEexoJLnuh86+Jtq13NeXH7Zke?=
 =?us-ascii?Q?lC78TAXvj9U7VxkH8/2Rq+1wJd4Z8WcPY5IQULRm9rEwOFXxpIaLAkL81vf0?=
 =?us-ascii?Q?nGJbqm02QO0vGjHqUNTYVtmZ/5R5hHHQ16I2F8X4Md+dVQBH0afgMlTDPUGM?=
 =?us-ascii?Q?GqhotT6YOXn72absOk4L3E5fYr+hncqD693c6F5ke3nG6IspKyVYtvEi0oJs?=
 =?us-ascii?Q?QmDDW/HipWsHUKdT+CtobQbvvth+HGEORMMe2KBjRnPf8RuREt4Q9Y+B/6yP?=
 =?us-ascii?Q?vHZEeYeaajpfNIvJHzqC2wIfTlON2keaPcsDVvmNhu/Z17CKGRH81bzA16mN?=
 =?us-ascii?Q?j6x8H9zFHIdbkq227uR+NbHyyzHqlFyJnmojNpS6M3rzKiV6fwPx/ueFkOhp?=
 =?us-ascii?Q?wpjgUJKtwrxchOzvdOHJAnNAF0hWRaW5nvfZZ+esJdwxQS1wStqgZzzumTZV?=
 =?us-ascii?Q?5GX532+DAZv21w8PofB0sD/35NLhF3jaHGpyGVvQ6TC8fqkTh082NWjkxZa/?=
 =?us-ascii?Q?mF50HqK9LqKstNL6dMwwz1yKSUM8AIoXaFIXWfZh27szpr9XnA2+k9W3lFf+?=
 =?us-ascii?Q?AZEkkX6MAS4mf38d4dcN4ZQhwUCZKgovxvrcy+729ejPJZuzLHzSyqcqgl0g?=
 =?us-ascii?Q?TS3IBXPyu9fnpyIVZxL3An6jnqxTg6ZMuDyUfg8HGqIk2IpaNZGWRFz7A2y7?=
 =?us-ascii?Q?TShzHrfr0KvElFJ+lqSBeLad2gK8LVaxX1Q9T2aXA4alv6pFmizfjOv93syP?=
 =?us-ascii?Q?SE9ooPho+ICaK1W3SzjUJq49pZyeWky0W+cnZzl4/nWACug9a71GK75KU0Ee?=
 =?us-ascii?Q?2WedZt+0OZOTxmba+c9Ery8xbUpOIWO36GVIUOAo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf9fcf1-b8b5-4c58-dcb6-08dd18036ca1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 03:41:54.6089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQWLApvlAh+lRqN+1Vz6mMbXtFMn0KwT8HS9cCMHK0n6Ja8aBkvMZ0x35JSPe/jRyR4KHbIYOKDrs5oHcjr7Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9438
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

Enable display controller for i.MX8qxp MEK.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch. (Francesco)

 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index be79c793213a..c7b4015c7bf7 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -234,6 +234,10 @@ &asrc0 {
 	status = "okay";
 };
 
+&dc0 {
+	status = "okay";
+};
+
 &dsp {
 	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
 			<&dsp_vdev0vring1>, <&dsp_reserved>;
-- 
2.34.1

