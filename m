Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF644BAA00A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 18:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BB210E00D;
	Mon, 29 Sep 2025 16:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xZIidCt6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013069.outbound.protection.outlook.com
 [52.101.83.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA6110E00D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 16:20:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AF869Jv3iMVgmhe2MyH3889wDEuqQbaHPogFifZA70vSKo1NzltsZFJIOaFCaYGD5z4BjKqhznL0PygIe7cAW03FECye9oHQgVqO60prP4rFuHzi8xdTWQKikChWs+4KyvqjiqdTp6lAO29exi+IUGoCt9agwb+muMbyn8qRwFB8zW2mNclYx/rYwdNXevX6SBA8p3p91xFWjldh04DQfPhRw6gDOPvsQhQU7kJkTHGuq95eU04L/i6jM/doL00/rRG1ydd9vP3fD1v3pxdtWlUe2CeGGM/wKfQrvB7FnmEwLB+kAat5v3xCyeRi8kszQfpRzKkgYK838G8M4boEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQwe2FhXVT1VGbKRfQQLD5z724mEPwGpCz3Y3SZ3pzc=;
 b=a9uDjogdnZ2MHbrcv9d28inhVDFPVOnE3giACYYjGpdFovHhI9OGf9k3wyo0ndP5QZwSqqxLW3ak05yuiKZaJTnC/YgC6U1pdI05OYfoxj6MHQnZC3T1FhNUzojYqyFf0jrA9MAUd3SmLVuf5p0EX49JXSTbz4kUf/hKVthwjyqCwLWs5hdj4oCVgBPoURfQdEKPdJd66lhOsL+vKK7OIakewFi5248u9DQx0EHm7DJCXUjZ5jKUb2ZN3vug5D80UhWXyg7EA3MzjUo7v9ERyedDVacWB9sQ/2fADwMZEnMk/337SpK9n0k4QFELVdfQW7G4EIGey16YG9fA3sLThw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQwe2FhXVT1VGbKRfQQLD5z724mEPwGpCz3Y3SZ3pzc=;
 b=xZIidCt6YRz+2oVK96kZ5zDQk9M1HtKmWNgtZe5hMWcbM1Ch0QcnKQi2btrooe2viX0uYC619dwaQAmUWxPgZYtSxrv60E/fDm7TV7ahfcAoI5M5Or1EtkJ4vbkQn4fZcy9oImn6vb8V++11GtI4ULfsTglneDBQGfLDuHKETv2CA60uAl9Xb8c4wbeDuRezlUtuNPrOxSb//wPMT0zlPLeQ8AzDesiWRkPZy2CtQyf1OaQ3bqU3NEYIxdt5yKjxmkpmXQva9CItCkCdGmESyqWFVCVhiKLFchFt9QcS6X0Wo8oh7BQR4KstAiseo5w6MwRF+tm4yUWsP+6vYLCQoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9)
 by AS8PR04MB7847.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 16:20:51 +0000
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7]) by AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7%4]) with mapi id 15.20.9160.013; Mon, 29 Sep 2025
 16:20:51 +0000
Date: Tue, 30 Sep 2025 00:20:57 +0800
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
Message-ID: <aNqx6XrUGBgUJ-pF@oss.nxp.com>
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <20250926055701.GC8204@nxa18884-linux.ap.freescale.net>
 <8f4ed393-f94a-4abb-9cdd-60dd693f3ec6@mailbox.org>
 <aNpYG5VITPmKkNgl@oss.nxp.com>
 <cc873c8b-435c-467f-b1e9-dc78ddbfb483@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc873c8b-435c-467f-b1e9-dc78ddbfb483@mailbox.org>
X-ClientProxiedBy: SG2PR01CA0121.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::25) To AS4PR04MB9624.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ce::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9624:EE_|AS8PR04MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: c2fd2bfb-1f57-41af-8515-08ddff742847
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xk6k+/vCCAWk1haNcuC618extLjUVRGwf9GgIEO7z90ZLSKjux/ymzJcEtPL?=
 =?us-ascii?Q?+e7PsaiqSReasFedFfiGTcGOpw6lPFJ+Ddynkejdv2h39H2y/C6VdbiMxRL7?=
 =?us-ascii?Q?3s8yws0DC3IpbPbdMgtxA3nzqUZm+3hNQebaWuuXMv1gj9dDUv8aZiUnjx5/?=
 =?us-ascii?Q?Bm+1kCFTo9vcog9dYGDTEKHk+Qb+9/4Q2+/G6hnzDa4v9+eVODGPKxwCADny?=
 =?us-ascii?Q?Slsg/vywdShnXgDiZSm75dlo29Wsw31rqhpSYOWhPOJVuyQBidcFvNC48E9p?=
 =?us-ascii?Q?VQh8q7l2xGqTqGJi+K7wg7iRCSQSXpaAUgpgoMK8mtUz+ilps4xVHXjvmQEz?=
 =?us-ascii?Q?1+VdDMxu922Q6BaaZCEztffsDEIGhzz6zGesZQkEL3H7uFDhgknmH/zV11Gy?=
 =?us-ascii?Q?JX00HVTFjG2WdWeB/q+lFViZom1LagvRTll6fc68o2GG4U2Bsu0+2d+ri70p?=
 =?us-ascii?Q?QYzodzlNdMbMr3Fg8oPiOWdvdZyZE/B74GIrDgKUWpymBdiQkIRuS4PIYR5x?=
 =?us-ascii?Q?2TUlmQQwjmtdplLQgMfqK2g17nVAJ9jC6DOeEGVkLPz/g5j6fapm+i34ZCZo?=
 =?us-ascii?Q?DE4ukhUt0RtWg7Mz2hkfwYXPhtKH30tHiWJxQX2KvwL/l6/3RAHArARElNrB?=
 =?us-ascii?Q?drWfFfor2l2ycB8pztvafg1ft35BfSqV/x/Z7OOHZwgLvaU9xZwMd7dpd12W?=
 =?us-ascii?Q?z7NoZLBEizcYKPH2nBnCVpNF/4q8G7ZyPkkXtW/QupVGx3ZaEHnwbA2Wlt39?=
 =?us-ascii?Q?PBKknsdFu1Mcv3zFWVtSa2OOGUbl4W1ypooiUTIHJEqo9EE49TliqhiydXhg?=
 =?us-ascii?Q?dMWsIcO8ooWGluXxgcSUjx4o1YCk7oxu8jylDXLr4lev/52VO+n8cRxlRzsO?=
 =?us-ascii?Q?55DFn7m3Of+hKEUIbCOIIsJTMqOctHxMIvSm6NCxh1s9kq5bsRyNwwOgyhD1?=
 =?us-ascii?Q?chEzS5GB8d2qjwarZpxGP1Wv4NdjACcoGKKnr8Z0HzR0FZj2Kf+3j2ca/6tR?=
 =?us-ascii?Q?O1x/bZtfAV+uFuP77dy4uJYQYlzn5TSBouttFNMRlnisThC71omBg9Qenygb?=
 =?us-ascii?Q?H80kl7qvZMcBtyhuA8n6DTkClqUO5/3wOG/YzfdQl18mrgScKiFfvRB5z7fG?=
 =?us-ascii?Q?QtXmrfYHmXH/ctt2auPq+kgMZJBIwjyYJKAFMcbXqLEHaYqFnEx6y1w3wHQb?=
 =?us-ascii?Q?kfT/7/GE9cmq+7tlMpkZMjWPM9nMUeMdcdZ0n+XQjdXzwLyfO+p+TxV7YXQz?=
 =?us-ascii?Q?WsYX1pAYCJY/g/7L2NiOF7TPMNVxddXVM/mRS5hOHM6yBncdzc3ScYgNCQTP?=
 =?us-ascii?Q?fs5PPLCfoE7rm2coE2bYk4AfNfviETiwXTkriRlAh90nzMvCvzEbaYNwyT6w?=
 =?us-ascii?Q?1z695qtRuKQx0B62Ktgo9Xpc823e55A/ns8yI/cjJEhqZgoiT0zpq6N7pSE4?=
 =?us-ascii?Q?bdAqse7q/Bh21EqNBi5HdaJ/fpmCwKalGC9WKTVy4kakRJYqWL+a5w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9624.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fYl1e3sepBbqt4EQx7Gbm3wp1tdwtpnY/LopKCtNEQNHRqS5oj6yOF20U4kz?=
 =?us-ascii?Q?mr171iUosfp3yEHuU8GKrICIWnuc1wy4ZhQYMR4pYKY3oCfA8VxKVKufcpxq?=
 =?us-ascii?Q?i6ySDLthqWZ9rJuPH/VpVryr2Yf/zVQNgi3t5qBM9uqTkLFkROs/+OL2/FG/?=
 =?us-ascii?Q?j/O0PfFAycKBQKqqFdBTnc73HynYCm9a6x41B8HXfyieKv46pgOifnzFCOmi?=
 =?us-ascii?Q?fgXsp3ugZdUwNRWLpn1fFv8lzlNCIhWs7UQJJK6t4kRZFCZ8A7eAQbsOFMzB?=
 =?us-ascii?Q?+OIiunSqCNY8ULVHqCrTDJK0eYHNOYgng8zjGiCm40mIrlla61DKGk4m6Mp4?=
 =?us-ascii?Q?uWf8acF9DeOa4/n4R+5gtQ+WMm78wXBme1lElPVf4+Ch12bgfXgHRxfm7tap?=
 =?us-ascii?Q?lXHimtkrB7Udv6u3pzb6sFzkWjwqsDkJDLZo1aMsohd4pu8N/62IXBIZs7f7?=
 =?us-ascii?Q?/+Cstnl+eDYDAxfocET38VKFuudF8IPZiH/7Gr78TvS6I34ZlK9iJ1OFEnTG?=
 =?us-ascii?Q?vlnfEE6kpT2IhZr5FpUaoigILytr+uoQ72yRYJAN6mVbV/OSZqMsBy4Lt+4g?=
 =?us-ascii?Q?jEmNGR7vlgIzkf2uK9/lBuUuC9VSEMNCjwQP77+MGlRYpXOZgeiqBo0iw+9P?=
 =?us-ascii?Q?75hNedwP6DmvfSCZGNlewGkLnwh2Wa+4QHLEgjs5bucJR78m0r0EHfO4M3zI?=
 =?us-ascii?Q?i/uiMwj/4IgYrY4E+KpEBYcb0JeRe9um0bPqmrxNuhD3bjjbJ4d7JKwhbxfL?=
 =?us-ascii?Q?tj/Dvqaw6E7WrgQMnXwa+2pd3YTROSXt4v+YA385YRrLHuhWeLwEO0Sqtq6p?=
 =?us-ascii?Q?rZVIdN2EcoxW06Pb15GiEcbn2Als0e48ZUdNjSOMQXAxo7qSNS9PE0bylZxU?=
 =?us-ascii?Q?CC/2y8KO7RUi/Tscrqo/UykFbg5rkTdDb9mCWVsTvlDlb/vzZvitgI4r3IGE?=
 =?us-ascii?Q?wkOxGnEebukoukn9TpeiQaDwUVUgDR5LDDtFLhnN+XoX9N0pn8tcKp4e+fVq?=
 =?us-ascii?Q?JhD2CL71nH4/eHNv+SfAR9rnE+x1STYVXF6lvIf7ZeJuwyPUWYFEiatQZIdt?=
 =?us-ascii?Q?ZtvxQ4kfR87fUGHOsonUbafQqpIUNjLz3UxZWSn0KClLm+g6jj+54PTw/Ru+?=
 =?us-ascii?Q?A8cfWPEkrAlavyYViyWVs7zAx3Cgq0OZBP2hjMY2YZh/879iNcF479fnUf31?=
 =?us-ascii?Q?Sh4S7z5+EOXOvfx/5KKIn/EyQOSSyhEEr9UC4uQNSa1lBB+DYitjSsgm6PPb?=
 =?us-ascii?Q?GbIruVVYJSmQ3Ah2XRD4m9IlDTOiA+VmmjvjciHXmNrxK83IicFK/4nqODuX?=
 =?us-ascii?Q?L+VhCt5WB+nvcpBBhD4xDOY0T4XGD3MvdTy6xiid6XQKHiQjKur/VEpmhWl+?=
 =?us-ascii?Q?rEygUVmZ0EU4SPSIXF7JAkW6es7cmYkXxU0iKxp3qxn7oOppUOIZvn7FDfJ+?=
 =?us-ascii?Q?wv3gQdUWf8cDW8R92YBR69JpA+yxx+XUUDWg1o+1sk+hrfnCIyxY3lWHSX29?=
 =?us-ascii?Q?9hvL+3Z7cIoxxsSSyOVceEQfQPPRj9bSQXMgV7n2aIvixwI2YwVQRqk7r3lA?=
 =?us-ascii?Q?frJhTqC8HzZvtVSys1Ycpijrg6Cb1EtE1S/Ot4rm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fd2bfb-1f57-41af-8515-08ddff742847
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9624.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 16:20:51.6471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymUDZFPyFml9M26C8fEdplYN6zMhia7QlbrGXVh9hbLUcocvJ7fMekmzZvJQgUkVDG7I1SvK/1BBamM06yXS3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7847
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

On Mon, Sep 29, 2025 at 03:09:01PM +0200, Marek Vasut wrote:
>On 9/29/25 11:57 AM, Rain Yang wrote:
>> On Mon, Sep 29, 2025 at 02:23:01AM +0200, Marek Vasut wrote:
>> > On 9/26/25 7:57 AM, Peng Fan wrote:
>> > 
>> > Hello Peng,
>> > 
>> > > On Thu, Sep 25, 2025 at 10:38:31PM +0200, Marek Vasut wrote:
>> > > > The instance of the GPU populated in i.MX95 is the G310, describe this
>> > > > GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
>> > > > 
>> > > > 
>> > > > +		gpu: gpu@4d900000 {
>> > > > +			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>> > > > +			reg = <0 0x4d900000 0 0x480000>;
>> > > > +			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
>> > > > +			clock-names = "core", "coregroup";
>> > > > +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>> > > > +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
>> > > > +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
>> > > > +			interrupt-names = "job", "mmu", "gpu";
>> > > > +			mali-supply = <&gpu_fixed_reg>;
>> > > > +			operating-points-v2 = <&gpu_opp_table>;
>> > > > +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>> > > > +			#cooling-cells = <2>;
>> > > > +			dynamic-power-coefficient = <1013>;
>> > > 
>> > > Sorry for my ignorance, would you please share how to get the value?
>> > Copy-pasted from NXP downstream kernel fork DT bindings, see:
>> > 
>> > https://github.com/nxp-imx/linux-imx.git
>> > 
>> > 11495de7c24a ("MGS-7621-4 dts: gpu: update devfreq para")
>> Hi Marek,
>> 
>> 1. this "mali: gpu@4d900000" label can be found in this commit you showed.
>> please correct this to be compatible with the downstream
>
>No, sorry, that's not how it works. Upstream is not being adjusted to match
>decisions made by downstream kernel forks unless there is a good rationale
>for such a change. "Downstream does this" is not a good one. (*)
>
>> and upstream kernel
>
>All of imx*.dts* use gpu: or gpu2d:/gpu3d:/vpuvg: for the GPU label.
>Also, variants of gpu: label seems more popular:
>
>linux$ grep -hro '[a-z0-9_]\+: gpu@' arch/ | sort | uniq -c
>      3 adreno_gpu: gpu@
>      1 bb2d: gpu@
>      1 gpu2d: gpu@
>      1 gpu3d: gpu@
>     80 gpu: gpu@
>      4 gpu_2d: gpu@
>      1 gpu_3d0: gpu@
>      4 gpu_3d: gpu@
>      6 gpu_mem: gpu@
>      1 gpu_reserved: gpu@
>      2 gpu_vg: gpu@
>     17 mali: gpu@
>      1 v3d: gpu@
>      2 zap_shader_region: gpu@
>

Existence does not necessarily imply validity. Since a single SoC may contain
multiple GPUs, it's generally better to use the specific GPU name as a label
rather than simply using 'gpu', to avoid potential conflicts.

>> 2. the compatible string is different from our downstream kernel,
>
>See above (*)
Additionally, there are still some performance differences between the upstream
driver and the Mali property driver. If compatibility with both can be achieved,
it would allow users to choose the driver that best suits their needs.
Personally, I find it convenient to switch between the two drivers using insmod
and rmmod, which allows for quick testing and comparison.

>
>> also you dropped the "nxp,imx95-mali" compatible patch in the panthor
>> driver, why?
>
>Because it is unnecessary, the generic compatible string is sufficient for
>the in-tree kernel driver.
>
>> this will impact the mali property driver too, which
>> has already been used in many customer project.
>
>See above (*)
>
>All the more reason to focus on upstream and avoid deployment of various
>downstream components, blobs and so on. They cannot be maintained in the long
>run, they break, and cause all kinds of maintenance problems.
>
>Upstream cannot be hindered by downstream blobs and their issues, sorry.
>
>> 3. the number of frequency in opp-table is only one, but there are two clocks
>> in clocks property, this really make people confused.
>> CLK/CLK_COREGROUP/CLK_STACK in i.MX95 are from the same source
>> <&scmi_clk IMX95_CLK_GPU>, the other clock <&scmi_clk IMX95_CLK_GPUAPB>
>> is always-on APB clock, which can't be changed by A-cores, and has been removed
>> from clocks property in the latest release.
>
>Can the APB clock be enabled/disabled from Linux, e.g. to save power ?

please note that the APB clock can't be turned off on the A-core.
