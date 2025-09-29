Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F485BA8CBA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 11:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0423010E3D4;
	Mon, 29 Sep 2025 09:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="W7FaLt5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF3410E3E2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 09:57:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niehbc3n1eXSn0UR6XPyiIXluX56PD1oVu0oupd+pZRMHeMVvgOa00Nwv3U37J2KbpDZ4YHzyruD9ZaSZjAEkcDuMwouBe1WALyF3+BQOeGdJA8SGWYGmQ4vlV619pWYee94YYqDNMKabNMd8ztTpMPlyzLbAhP3Rf6UsY8Q4tli+LliCOOMhn+3H1S/s8m39Kj5IOYQlEkW79CXR9xaNY2Z/k1wHt7gqHHvOEX0aNnI41qnV6UxK+N462p/0UQYK72s1H/SbGIcjb5BN1yM+BK1+2bCt8GBJfPAdrC3xrbfmQJkhuHzVaDkQbscTl+B7MAXOsYcxCWc9SG5CMv+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rvrwqjO8hlU+ToWAS34Y0c1WZY8PHU/HtLDel06PO4=;
 b=PnU+rfgJXvohfxszwCzMNZgeghXerSTDATwrSfFVvQy8Hcss/6AbBURXSXQ2xdGN2O10QVVlzVbwWX+GOW53H7lzJ0OGTMY/BmBqL+dEV9zL7i8RtxbGL+Pv1lXfuoy4K33MNXb+3ejGuwHy6yx/FrnQNVTH07p2l/fyiNOMt6xP9X2+JWQOJRH1y+Uc9REm4EZqJ6tl/H7kAXi1Wux7/x+SSD8sWzKzxBaE+hOKzuGFy1wgYbGp0e04X8k4sNg3SH97/NEv+x9bST5mRy67kSfws/T2xQjr/tU3+dU1y8nNH8Cu/d7NrQwhp/KSiu5aZGeSTXL4n058EH3qiySCLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rvrwqjO8hlU+ToWAS34Y0c1WZY8PHU/HtLDel06PO4=;
 b=W7FaLt5T6iKM5fWfZZkrUGfdDBWvZR0FVyNIcvdGjvG/ruvRXMwRyv0A0Z6kftRu746sOQ1K+2zxgCMGE/zVwcyTxbXc1c9ZYkT6Vl4TrLvxsV1ZC4MYgheavi1wNIEyC3SrrS1vrkLLuDZ/vRJYmqAdQoWxC7xwRs0kwJZ5WH3jy8Gh2ed3Qw7Xb35qlhgiNaE/I2ur9gs7FuOpZRtjcmKQ37mYbKI/O64oLKdzdSdJwTDV7DbuDwKKx+oAZvYF6noz+zc+ONPjui9+/g2OlQiLkRHulSabvQECKJQ/7darTkrARFH7v7cHbsfO79u4qEPP4q0Iw8fKK97EEfZrbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9)
 by DUZPR04MB9796.eurprd04.prod.outlook.com (2603:10a6:10:4e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 09:57:46 +0000
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7]) by AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7%4]) with mapi id 15.20.9160.013; Mon, 29 Sep 2025
 09:57:46 +0000
Date: Mon, 29 Sep 2025 17:57:47 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Frank.Li@nxp.com, airlied@gmail.com, alexander.stein@ew.tq-group.com,
 boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, jiyu.yang@oss.nxp.com,
 kernel@pengutronix.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, simona@ffwll.ch, sre@kernel.org,
 steven.price@arm.com, tzimmermann@suse.de, xianzhong.li@nxp.com
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <aNpYG5VITPmKkNgl@oss.nxp.com>
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <20250926055701.GC8204@nxa18884-linux.ap.freescale.net>
 <8f4ed393-f94a-4abb-9cdd-60dd693f3ec6@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f4ed393-f94a-4abb-9cdd-60dd693f3ec6@mailbox.org>
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To AS4PR04MB9624.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ce::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9624:EE_|DUZPR04MB9796:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a59534-b2e8-4ef4-a354-08ddff3ea38f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RpyU7k9YaloGN0ziaouasTV0V4XKx8xw+Qw2dCylVurM5f+JDXw9TvKmr5UN?=
 =?us-ascii?Q?zhQz3F8vHX8y21zSMavQE8Ko862gcirji8Pc0WTlmpBJVvROpxqKI3h4cuqd?=
 =?us-ascii?Q?AEsVPsJmL3Okbhert2dTbTAPuHrNUYTB/8C6kyaHJKpSCJdgh8kvb7LA0iCI?=
 =?us-ascii?Q?Vv/Cc5gRjqnaWKtS1ZkMv8UVaOjNGQkGR95whXocwLEWEpYivhINidCinK1A?=
 =?us-ascii?Q?KjynbJbV/5jqBtvSHojiTZam7Lf7ojmeH7ZtQKjch+2WcN3hOZahMYfwlzwh?=
 =?us-ascii?Q?L8YVAi6YNxH7c4Sq1gDvs57+oiXqzcdU4RYjIbgJw2zEqD0GqWBHTwqr1jl0?=
 =?us-ascii?Q?GZD5IQnZ20HIwjnZ1kDQGAVknV22P/uh1HJ7/i+LC378p2Ao5qe1mQIU2Jr/?=
 =?us-ascii?Q?rpCGxLZqDEw05d5tsh/505/s3C/nxqtSRLlGeL3XUhh7wkYHp9oMqllzkp0Y?=
 =?us-ascii?Q?6hmzIliD0Zs1eqMGwC28JY2/j/Ywm/Y/WoGeefGfc7KMsujOVVY4Lt4jj9No?=
 =?us-ascii?Q?ZnUWPRdWft/O1Y6w3YoH6OSXSYG6Uf+RyCxonuvUcs3NhGfU6F9SrFeEcOMP?=
 =?us-ascii?Q?eXzm/3JuDuO2FWU00TPejRsjlvyfcyFkmHNCtqBwjvJhfEKUlatCqhCG/Pax?=
 =?us-ascii?Q?ZJ9LCgnppbIdRTOTUsKm9YTzHw4lYcSqtbER6x9sR05y0yYOwui1oRWnyfSK?=
 =?us-ascii?Q?F5lTUVCl0cV/fc5AGBoC3nhCsFWNAsgJ3g6RAmRSb1JaWQvL9vMzARqmF4hk?=
 =?us-ascii?Q?fvHfhJenDoahZJrRzzPajnxxK7EC9t49YSvxAO7B692j7Av4CkX7TyauQ5pP?=
 =?us-ascii?Q?1zDUnB2JH5SWmtNIBzwEJPhgYTSoTEf+YFCtkCMdEWotuk+Vf/LJkVmqMfW4?=
 =?us-ascii?Q?1pg7XOzmaeQN74YInNPDBLsrfLPsHDu7dUubnFmT3eJ0rgUTOexKc8F3ib27?=
 =?us-ascii?Q?RBGX3hR+9w74IdgwbsGYM7c7UZo9VGv/fWpVebgFby3nGVWoaUcf6A7BuF11?=
 =?us-ascii?Q?eTpRePQ2pa/WXQ/bPTLIgqqrxbj4iVlOqWgjMt1wcivvJtY9ucO97QVm6vZI?=
 =?us-ascii?Q?PJMN6SA0XPnO9rShvB1CJygkCAwFnwpGwfaTv+rfdxpTWlCvCqWLwrysizbS?=
 =?us-ascii?Q?DYYV3l827YNpaJt233yPXDN31rtVqG4f+IosCd6CH3MkdFfZV1AO6DeSxek9?=
 =?us-ascii?Q?ZDrhv0anRXMPQaze1QN2z2/e3LB5wwtvyFb2j9x+SlV9c+ie+/OVzr80SG5S?=
 =?us-ascii?Q?elDoLwrnnTXGeFZMkhyg1HkgAYyrkLE16gFNkiAgx+VSJ1a5hyXG8kDmxcSL?=
 =?us-ascii?Q?QCPHO89PFonx7+4FcSH/JuUM3mUaujn3EgTwJ18nC0YAXPu929wGMwqjLQF/?=
 =?us-ascii?Q?wVJVbS+kdmMX241YZwGqLPV7+o2uECI2uSr2lRKoR9F3njnr2wrWVDC7LkD7?=
 =?us-ascii?Q?jjtmRO3haVSBh/1EAJAQUZKHhoctpVzBz/KVFKzk4Cb9sj220Qq+xQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9624.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vd9lhBetzAx9IcqwhkXL6Gum1ZE6b/737YkshG/t2yDcS7JNBFnfkVe5yzLu?=
 =?us-ascii?Q?0ntTf4Mk24l+WvjvE3ODr4T9y1vuznRPdY+sUvrXQ7MRjb60CQw9Czy2Ij8A?=
 =?us-ascii?Q?ZEf4YCq6dW0QtDOgDIx+M+rpOzKX9niNcC5fXnoxC2GNp8YeFSZMM6F8PpQW?=
 =?us-ascii?Q?hXnMgy7e1cqvwfNJiAoFeVV3nijv3Ulu5df18CHdcJQSWbwqPFZfrt7GBsal?=
 =?us-ascii?Q?X/oxKVhL5gFRPKObO3mBKrvRKwwshiuBixLhMcS/DG/sCOI6gcWKTs7ZqQ3v?=
 =?us-ascii?Q?MVMjBfKyboqzJfu84w7KYb3YehAw1jZAKAkwRygHcjRWSgYnnQP3gQl+PGoo?=
 =?us-ascii?Q?NQKNJwF7CtKij0KZXoCriAHXFOdSocJ1O/QnKhqridv/ecLp7mHRAZhBkz1o?=
 =?us-ascii?Q?5qMnwhPnmQ0CKTRs9+3zNSxXSWCXxxkzy7diG2EkXOI3nDWD3DonM8H/sQFB?=
 =?us-ascii?Q?b5mexGBMUhGxnzRt3q2kmqaBSNaCNd55BfhZ/pi5HILQoxJwGzY5jvlsxaX+?=
 =?us-ascii?Q?WN2BnrVCizlAi9v4dt66Mn9zUjTlZl3l57+6Ka4gbtfVUPaZDLmxBCE++wfG?=
 =?us-ascii?Q?XiSGXfIZVqC/SCR05XRG/Ddm73Ew8+cQT/iN6fr17hRw87sWl17DsU2QArZB?=
 =?us-ascii?Q?ChRd5LDx+zlnBRUwcYLPrEKR0uwzvfOahHs1wfBQJyHRvFaJj+Ui/m+59gaQ?=
 =?us-ascii?Q?x/bRBR9SpXcJFcrIqCKP5gLn8nJ3t1+n8hWZUdyVbKgVZvvfOw5QWLuFf9KN?=
 =?us-ascii?Q?buSfRPccGJFC9z89ldYhi8G3vfMRSCJWIA+0zIGAYwZLqbVNMyLICSCYM9g2?=
 =?us-ascii?Q?4LVwqC7kZ0D+moeSLolfmBl8wfUVKY2e8ZFzVCWfeHNSkR0bcr/4DaXD1qB7?=
 =?us-ascii?Q?b1y5vZUvLmk2fILbmymTH/pufRJn42FczFBZg0Y4aJCeXfhtpRf94web7UXW?=
 =?us-ascii?Q?a28epQ4lCAUU3Alga7XuzTQ9Vq+r2vv1nxHT7cAmYUI1o8fAV5A373G4BYIL?=
 =?us-ascii?Q?Q9Y+DBgcOCsfasPhwZTXmSeTpqrV6L6O4tBD/JPRiHw4x5RTbk1BumOJUgiv?=
 =?us-ascii?Q?tFSis1MguaPYZcFUjwROmMnO6oi1zqPxuBd9W5ArvuTVK0EunXv3IRt0ja/7?=
 =?us-ascii?Q?UrXJBqQa9/xH0+eWkkc1lcPvw/4+T+lZKviapaMa/HIKquL9ybbpRw5iyZKx?=
 =?us-ascii?Q?IOpsPiKX8jxvPJWOnpv4g9GgmxT2q0RrtW9EIq8bxjGmNwBGEqXYt5upro7y?=
 =?us-ascii?Q?JIsZZ8gEzsXlFmgk2RZuKeG32gTUEXgVGwRKLqO3WpFbU2ditM0a2CUHkEf9?=
 =?us-ascii?Q?bMjUtnoyF/NA4RRshilEPuZTNmKqi10R8Oc2zhVP8sJtBhNJrqrYsVT2d7if?=
 =?us-ascii?Q?Z6IZWsoYauFjvU4nT82A4/FfwIMy5jifXvLwauI94oLSS6ZNrarXYC41dAEI?=
 =?us-ascii?Q?OJaosZ033fbAkN1m9nfzB7MZDVuC76fEzb2YPYGoE6ywMLuXiZxuPFs18jaw?=
 =?us-ascii?Q?TclMuUhMSSIQ5XgAFqVYTbrrgtPEfwls8W2OYTzYdqBtn3Uwkm3YkrWbTK2L?=
 =?us-ascii?Q?LN3QxZqsuhh1skr+525Ebw60BbQT/ey1QM/ChSYq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a59534-b2e8-4ef4-a354-08ddff3ea38f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9624.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 09:57:45.8557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96J1nS2IxIvVOAldd5xZWBR6xURlO+RXkQdJIAFexS0T7ipUAhSa6iIit2fiHJrrl05ccdPQjJcM55FFRalpQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9796
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

On Mon, Sep 29, 2025 at 02:23:01AM +0200, Marek Vasut wrote:
>On 9/26/25 7:57 AM, Peng Fan wrote:
>
>Hello Peng,
>
>> On Thu, Sep 25, 2025 at 10:38:31PM +0200, Marek Vasut wrote:
>> > The instance of the GPU populated in i.MX95 is the G310, describe this
>> > GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
>> > 
>> > 
>> > +		gpu: gpu@4d900000 {
>> > +			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>> > +			reg = <0 0x4d900000 0 0x480000>;
>> > +			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
>> > +			clock-names = "core", "coregroup";
>> > +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>> > +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
>> > +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
>> > +			interrupt-names = "job", "mmu", "gpu";
>> > +			mali-supply = <&gpu_fixed_reg>;
>> > +			operating-points-v2 = <&gpu_opp_table>;
>> > +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>> > +			#cooling-cells = <2>;
>> > +			dynamic-power-coefficient = <1013>;
>> 
>> Sorry for my ignorance, would you please share how to get the value?
>Copy-pasted from NXP downstream kernel fork DT bindings, see:
>
>https://github.com/nxp-imx/linux-imx.git
>
>11495de7c24a ("MGS-7621-4 dts: gpu: update devfreq para")
Hi Marek,

1. this "mali: gpu@4d900000" label can be found in this commit you showed.
please correct this to be compatible with the downstream and upstream kernel 

2. the compatible string is different from our downstream kernel,
also you dropped the "nxp,imx95-mali" compatible patch in the panthor
driver, why?  this will impact the mali property driver too, which
has already been used in many customer project.

3. the number of frequency in opp-table is only one, but there are two clocks
in clocks property, this really make people confused.
CLK/CLK_COREGROUP/CLK_STACK in i.MX95 are from the same source
<&scmi_clk IMX95_CLK_GPU>, the other clock <&scmi_clk IMX95_CLK_GPUAPB>
is always-on APB clock, which can't be changed by A-cores, and has been removed
from clocks property in the latest release.
