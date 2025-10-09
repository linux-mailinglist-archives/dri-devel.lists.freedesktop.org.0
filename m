Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FE7BC9953
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 16:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2CF10EA78;
	Thu,  9 Oct 2025 14:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="k0yBgh13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7983810EA78
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 14:43:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHJTe+duatRULZ/KLglTb5iWseeFjD2nHoeirIdBgWnbM1OuNopozWyozUYaRVAAyyox4lCwSaDnJcslyKAxcbpYx5rG/xWsiN5AwYyfc1JHfM3K+dsEeoaIE7v41Ii2bbChsNZyeZNJN681kpR3Bo+fVsE4cLGp0lgwwf+sYdlFJqnccZ+JdhKBmvaXdHUDJNrjqioQ3T4qiTIP7O5jsfbHdIIjaRjgA4OVkCDghTiZ/iF3KyrFSFl9j4fP1TSIUYZWWcxxbg0Bef1ugPIn6MEjryunBtP5Mh0CaTmomZ8xEglmrSIGrrlQQjak40GPQVszcLnI0YOTDrjAIR5N2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqs/dkU9LhOzkklSogjn/20+idKBNIUgENfPrVc3qg0=;
 b=i3HQ+qoAA6dhijeRlWiYYvOYe7vX0YWepNqrMhB4rG9QLH/P6a91aUqYfNVgCo2V0HKRrVE90yoM3ZaCO4bo6CE7yc/QwB8CPaPvPdExDELhkmqgUvoRptQm3t6o2EuFSNYPOcDRMQHA0o+Ln/K6Tj4CdP7fQ6bWf8A2iGoZasn47hiiyeiydiWXG4MYFx9MhawjU2YqOFDLg3qso7UEjJSOpryHSyAMGtjxVHOecIXlfBA3FIgFIgFuB68PqdoqPLVF1InLIRSYcaVRpcitkeSypdGJGasJ3PqWJxaYdVSkG8bAqbZUCoL80uNfjCftEMglscrFXR+yLLWg1Gbr9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqs/dkU9LhOzkklSogjn/20+idKBNIUgENfPrVc3qg0=;
 b=k0yBgh13jmj99PIskcpBbI2iYtXnsuNr8vztKFek2+uxaVQ1IhNTtaKfwwnmU5M1Xl1Fc/ZqN2J9H5wftVAUkrC83Rv1/xxrIROoU8A5taCKxDlm8N9yrzzTipnj4pbGT6LOMVi100+mYbyb5aNqp+r/iHTndnAVPTFMFAMGRyS3+7BQsNeVSDaOgr7wHmq1ss+T/QXxVGjhfvHnZ6fuf6q0poqUf16FeyjmtZ6e/t8kLMqFO7nhPsajG3Ik6ofUn+ehgtrgRcNQdnJCTMDykKsQQxaYEQzhoxQEULySaB8TtDpYF7nLs/ukLE/ty55e2mKmwGF+XCr2dcoE2ZDLVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DBBPR04MB7803.eurprd04.prod.outlook.com (2603:10a6:10:1e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 14:43:30 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 14:43:30 +0000
Date: Thu, 9 Oct 2025 10:43:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Steven Price <steven.price@arm.com>
Cc: Rain Yang <jiyu.yang@oss.nxp.com>, imx@lists.linux.dev,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.co,
 simona@ffwll.ch, marek.vasut@mailbox.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, Rain Yang <jiyu.yang@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall: make mali-supply
 optional
Message-ID: <aOfKDbjIHnFi6AX1@lizhi-Precision-Tower-5810>
References: <20250928090334.35389-1-jiyu.yang@oss.nxp.com>
 <7c3b219f-f504-4c4c-a13a-6a25a0eda277@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c3b219f-f504-4c4c-a13a-6a25a0eda277@arm.com>
X-ClientProxiedBy: AM0PR04CA0054.eurprd04.prod.outlook.com
 (2603:10a6:208:1::31) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DBBPR04MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce9dfe5-6afa-479a-2a26-08de074236ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TXQIg+gHrXmcVGcQPPVel4hkGnEOoLB1EKNmx9jjyMb+yyoBSgC5mrPWtgXj?=
 =?us-ascii?Q?U2+2caD0C2p2F5VO12DC0OalFyrDJZmCxU5qbTP2ZTcWSHBvmgCEF+GH86Tp?=
 =?us-ascii?Q?CdrooYYyrLYnIGT/WAlTGIt4NjAdsY4N//2nrp+gEIVWZLx/UWfdPmi4udxE?=
 =?us-ascii?Q?XWqr3t/QY9JTShqYrdaxSbxvBjtyMPigX0XZkWYApkj7xAqx5j6UAP53WWtr?=
 =?us-ascii?Q?BlM9rcVcVpWNF55JW7pReljf+WXc9mgQZgnq0mMHBHOoIvHBnHNTOoI8C+9Q?=
 =?us-ascii?Q?xvHkwviyi3dPral4J1WKH+TKjal+4cQWR4COkzQB24tiM0DRADv7AcOkGTEM?=
 =?us-ascii?Q?XBPlTmQ/7NqJLpysnOnbYXfYd8srzO+PJvzUGCOGv1G6PF/6ewo6PRisKFPt?=
 =?us-ascii?Q?BDyGB7b5gN+7CEY+Jv7ImSpJ9OurVDRlwNb2rYYqYPFxvBVg+5Syj3kitaze?=
 =?us-ascii?Q?d7dlKfUTbBUhgOpMDVzvG6RmMYrWzv9iZzdsQmwoO4iEt+JWvCfx9U839iPH?=
 =?us-ascii?Q?qopBlP/eRKq37rgPfqAXd0Uo2PKw6Q0SPzKJjupFmNA0OWMHth0MAozZ2S1k?=
 =?us-ascii?Q?IjRgJN3az+mA34xTJNC8lMPzdFOufnDZ+f8++6CkDwYKZ+JdFvx+vV0gb3dk?=
 =?us-ascii?Q?ynRvLPrIPwYHDKt5dVPHKm/xDai3Y+wYP+ooaOxlffsMjPqNCpnwoHrD4Wll?=
 =?us-ascii?Q?pHZsphhr+/fABPoYXAsSc+eS5c5pEE1Q2QqzSPFWXRmDdrbqv/C8LNx5DlcI?=
 =?us-ascii?Q?4VHeYQmGD2amknGuWc5dvCUgRHtKD4NqFiZvMJKk8ptg0aTYY5f2wA20nlqU?=
 =?us-ascii?Q?7RF3OuHZm0xEuHN/EbuQbU9Z6T5+cwxizH3sBkJuiQC9nu8UZ8VMwyQim6hI?=
 =?us-ascii?Q?YL+XouGbBU4/OEO/O/dgdsk5AqFW6+KUkaI8FsvJO5r9Aa5TG3hdMkmD5Rt8?=
 =?us-ascii?Q?FkE0AjXWo9cBMBiY7EohHLJNwunAFkfiIi2sfzII7NKMWfkMN4nk4/gzPtq5?=
 =?us-ascii?Q?t+EtcTQjJEeA4T2wDYTTgwmDBd4YLmcsZTQ28IU93US40Jfn//7omuZOhrQa?=
 =?us-ascii?Q?9a/Q59D9/7aEsj+NMtGhKioZlATb4EA8ipWSx6PTfSLaAWjNKJMMBHJ4YIIF?=
 =?us-ascii?Q?ZpUQGc28zoioTvAUjiMF065DBMoJUop5rt9xxxF4woWhSS7i+AlCG63k3Vzh?=
 =?us-ascii?Q?4Nf5vmkTNJAWaVncMSlxF7WLE50DfJ+Wwg8t65MoaTGe3OdwCTVgesvNrFrI?=
 =?us-ascii?Q?ujs4XYWi3Caw+YlKENASVEyIHDD7n5oVHTq0Jz8xh6Tm1/q4PATAMh4nOb0U?=
 =?us-ascii?Q?D+s7QiFwzJKK89lr0PtGO11ozOxlebHlK+2FRP/P4+uxjl4HznYinIZrwjsG?=
 =?us-ascii?Q?uT4HmUBJzm3TWpdGqvk5OixH/xQjDsoDAfegxFOOgd45/Z9wW25brNaUs/f8?=
 =?us-ascii?Q?HzBys9SjUSF/4QxlfDpeGPYpHLghm8CsHTg6f2I6VgHkG6Mo9fWkdilxytvt?=
 =?us-ascii?Q?ofuF4eXWDiQ3BXlVtVwIAmhc0U1+a2nS5/bU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ibx2w4Ei69V88rjGnkL7zRC5xep3/j+22e2ur6dc61jE0cTYuvRnaMV7NxJK?=
 =?us-ascii?Q?CmHUAGI8aShF6xk0XxBwRA9nSvs+YCcLCQlQ8RtWNdATaeU5Er8yBA+/mLx7?=
 =?us-ascii?Q?irb6TiI73EOc++AAj3v9LALt/bj7B66Y8k3Uh2ywxLy7O3y8WdhyeVifm9aK?=
 =?us-ascii?Q?13vGsi+RYAc6JbMMr4dOOUvh6j6rmFHvTSrQUVfNBPAT4HFlQavDjF9A8Z6j?=
 =?us-ascii?Q?czsNc+mKmvPaMjtV1jWWUHFDluHT5G4Fn6LcICIVCClNPJYS+ZieX2v8B5q7?=
 =?us-ascii?Q?EVFbYa8iEtQJTI7imwrm5HQckpNsmF1OSTDf75hDOg7Ofa8c1cCkm9wVy9gE?=
 =?us-ascii?Q?Tp9O++z9lIZaO5zwTakw4mIkXxNfY8+OzYZJkvDpcLXs89RsjPBbgNS2syTz?=
 =?us-ascii?Q?DWvIYib4u7J9sex72KGuleiGppst1+2Pf0Jg1mp7zLoWVXXjrhhvJx58syBk?=
 =?us-ascii?Q?sCoq2bF+oFWdPv3WAXprJdMOVxbkpAw2RaKyjP6tYj5AD2TRfi/eg8GJaS4M?=
 =?us-ascii?Q?5NAKLP6GAIMc3KwW99Wr03l9SMP6m+ONcKWChPoBsQENtZcn0LSJym4LS/ki?=
 =?us-ascii?Q?hoEZLlEigVA8bOGu4yIk2JPp6Ty9bfHp0inffoKjvHy9MnOHYbhqQug2XLjL?=
 =?us-ascii?Q?E45tZ8Fh1JtutmD7kqh53Q/iywbG8BuxJSgAhZ1gR4HPUoMctJdUF52ivR89?=
 =?us-ascii?Q?bS/6AVrrZRWYGrMp9Pd3NwIs3U3EyhyXaBxCmEJieQGVQKI615d7o7Iyh/8R?=
 =?us-ascii?Q?y3PsKZEOXGXK8/XxuTdx2e1BMrsZXncewckhikwlLHDaGJY3SM/BYlP5fg0T?=
 =?us-ascii?Q?qv1wWV5Z3rL0GCO136Ka+if1MDJ1UlTR/Q6/GKTa+uj2us0s1M3l7I5ZKry+?=
 =?us-ascii?Q?53RJsNEw6dJeovuTCFsPQxWFau2i2gh0ejwZb8Z7/AVPxgZX6DcIzqXOdBWM?=
 =?us-ascii?Q?gGJk7fPSjvkhFEv3FE4w03WVY+/oZNcBDBChQhXc5/403gdg5C28MmDAWE42?=
 =?us-ascii?Q?ZWU0UVanoJtJHRsgLqF2kJMcKZWe/7wk+1sXQDFj9CEXQ3nAjqXn7rUetk5T?=
 =?us-ascii?Q?kRTxRBukTumFWa/TiyZ2i6lIib+KYR5Ixx48ZHs2XU9KCR0X9OL8XNgd3Icj?=
 =?us-ascii?Q?lAgvIVWVa74yOG7VUIiQp5Tp1sdbzP6BJRXoRYdznkR9xgJGrcnTSvHmodrB?=
 =?us-ascii?Q?WtbKRJQSTa5d4C5MImhSrCoX/nwsygZLUXyWPxA3kzJDtHG0H3KwVsuAHiXJ?=
 =?us-ascii?Q?LCkckgEIAhM87e6o/rcx6tZPYCOEW6xNxWjbJGdUH8fl3yGyrObUFFNnGQht?=
 =?us-ascii?Q?sQKhPvC8X5Jx8BxvNyOLTL7zup0AFqJI5P/zsaSHqXFiwVKAs38ex5yqsDDH?=
 =?us-ascii?Q?93MUgMqI0l6NveM5nYNUPhfVot15jo2xp6XbzrLK9iBfY+4lACSaj4pzPBCZ?=
 =?us-ascii?Q?ngB04xAhzVgBIrxJ8rGTBilYOjqJl1IdwvRVZPYJ5momzapUefYctcvTY7wM?=
 =?us-ascii?Q?+x/7q66wKZmaEcCwfz4+baisAD1Ewob71hffvEII+SWIP2Gbt4lbC10WsQjF?=
 =?us-ascii?Q?yYANT6R2TzxQ5TGXZAJg035CwjRoCxNF3fiJcma3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce9dfe5-6afa-479a-2a26-08de074236ef
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:43:30.6730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kq95v48rnK4t/IR4/ve4ll39WA8iKd6nXUJwFeRoY/XZbiCBwit+EtuQsWlbMjbxw3OhtN0QpPxQgB5LgoZARQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7803
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

On Thu, Oct 09, 2025 at 02:00:43PM +0100, Steven Price wrote:
> Series applied to drm-misc-next.

I have not seen DT team's acked tag for binding.

Frank

>
> Thanks,
> Steve
>
> On 28/09/2025 10:03, Rain Yang wrote:
> > From: Rain Yang <jiyu.yang@nxp.com>
> >
> > Not all platforms require the mali-supply regulator. This change removes
> > it from the required list in the binding schema, and make mali-supply
> > required for rk3588 only.
> >
> > Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
> > ---
> >  .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml          | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > index b220cbd5362f..ef9791d8ed95 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > @@ -92,7 +92,6 @@ required:
> >    - interrupts
> >    - interrupt-names
> >    - clocks
> > -  - mali-supply
> >
> >  additionalProperties: false
> >
> > @@ -109,6 +108,8 @@ allOf:
> >          power-domains:
> >            maxItems: 1
> >          power-domain-names: false
> > +      required:
> > +        - mali-supply
> >
> >  examples:
> >    - |
>
