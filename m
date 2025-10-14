Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B69BDA3F0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 17:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B2710E636;
	Tue, 14 Oct 2025 15:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eBgcKrka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013056.outbound.protection.outlook.com
 [40.107.162.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A2210E645
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:11:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIw6HSmBSGHnL7k7gFDxwn3sbM5+HpFNi23A3xH1c763Aoeng9DE5EXt6YW4Xiav14D2O0Ojpe/r45IlrnO5iaq8ysbuN864OMJGi2stSXQJJgh43tKIq3Jli4rAdTRe5F2r5RsIPjEpGtPN34czKOMf1/tkRCkLm+ns62Nso9Zx140VIMCBncE5PmYybBD61Fg198xz42Rjn2T6eawtLur9nHqRijZgrEaSzLSsOELNim9fRVtqCVnREujWA6iykZEb+cVk+D7HC7Lqo+z9f3kmjqkpPrpLOSb+4RApdeIl7x/zCNrJDOga27OZMKSykcC2hQtqFwya+B2Z/B9y0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1iN0grA+3a4euZW5QHajNgPHTabRJwAmD8+TmzljNw=;
 b=dXrhEMidOTSIcjGptHL7rq3aeT2OVoZqj032x54LJZfDe27HlfswZoQZY2EcjmNDbrM6qZq5UBrY+5Q82+jXEERs6tutZ1eyZ7qzdGGQh9bhzzhdgg7eV5CY6AzhQsEAt1GKy+tTszq0ZD7BUmvod+lz683VAVZJ4Li/SM1mUwe5vYYlOA9SjNjeSN7mprpsZEZWFdYXfu2/irVfFtuIR22K0JKXsXKFmeXXvHXJw0y0h3csaWwWxfSYR8Kxu8/G2ATMvVefs0rTqXeRONLXz3jyawnN7WpI38p85XIy5MSmxMb0dLMVvp2nfGyFJyvMIyVSwynGH4GuETlHjwt/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1iN0grA+3a4euZW5QHajNgPHTabRJwAmD8+TmzljNw=;
 b=eBgcKrkab7jGyK6s2FFN92dsp/mbx4H+X/7Q2I3l8AgzWuWLIQ7HKKrC/hgGH15N0Z+mmqBbM2kGWZ8dgmtQ4rDh0qwb1q1pEJuIWFsd3OUlnIXOeY/XrrC4NMuBpEoZrxAtAK2pepKnkxNYPDYZdUU27kMxtP8E1dShHpdJCWmem+r9S9aGYjitJT8D7PL3JKz20b1npMoxq4nxPsG7mTzHC+zs+qZ9FPrfFGQhOMFZyNnwGaj3ZoQXTCubZqqPw39K+uI0XDGXuWMVJtZpmh7wAQ3hz6GRTZ9tElDqz20M6clzKxElRLV6BFOyPjsOHv9arcouJoMnugJSGjUHiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VE1PR04MB7421.eurprd04.prod.outlook.com (2603:10a6:800:1b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:11:48 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:11:47 +0000
Date: Tue, 14 Oct 2025 11:11:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 05/39] drm/imx: dc: Rework dc_subdev_get_id() to drop
 ARRAY_SIZE() use
Message-ID: <aO5oKe14GLp3diGH@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-6-marek.vasut@mailbox.org>
 <aO0vLbkpXejre2Ta@lizhi-Precision-Tower-5810>
 <c7fee270-f3ff-402f-8266-0ffbb5077a61@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7fee270-f3ff-402f-8266-0ffbb5077a61@mailbox.org>
X-ClientProxiedBy: PH3PEPF000040AF.namprd05.prod.outlook.com
 (2603:10b6:518:1::5a) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VE1PR04MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc42639-e440-449f-5e89-08de0b33feb7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6st2MPZE3Y4qVPwN7BYSc5tIJDOZaJpH6hFQ0HJs+NB8B8Ws8K6b7o4plqeY?=
 =?us-ascii?Q?0Oau5lQOfapV4EKnr1NKpoVLNKxb2+MaCyq/Cw0KGuwawF3n3NGoJwNdqqeJ?=
 =?us-ascii?Q?YkykJwvtM8ZfgXMD2aVZX+Xot33/FYhQO72qb1aGcNSV4DPelP/FwHAJmhjW?=
 =?us-ascii?Q?VhvLNUhUIeJykXEOn6GZhWcWvv/s17IXw9k+BRRov6MVbYtHS1fnI/+kzuHX?=
 =?us-ascii?Q?noVg8VCcCx5NXJx+w3N5/wtTaifTZVTKik7AfQ6IzUY13dvSWDrzF5F2AVS1?=
 =?us-ascii?Q?QRFyfYVCQ1zkkrGws3v2tsLCj34vGQD+sEbQ0Dl4euM13q6ToOJ7jWi4ACwA?=
 =?us-ascii?Q?LLkE1ChDP1aJpESnEuupU/7LdXNgWP/czkU3d30kQFJI25rAEv36LlRFnaxd?=
 =?us-ascii?Q?2wtYaEaLA9wu+BehUtXc2CnXrKwQkd1Vw/GApGqqPgWtjkPWaCHKM3sT6/ET?=
 =?us-ascii?Q?TGRGLCOcqcUihC2GjHc9tbFsz1ThsSCEjkcjaUIuCh6GuadF1ty0305xs9CX?=
 =?us-ascii?Q?P/g6FUjzTxD+TaVaLnFPXT8mf26qVwQKcE+ZMs7G+aBRaYW225xHLMlJZi4K?=
 =?us-ascii?Q?JR1vPD1Bq9LFwjOCDk+wkaIqW2RgAzAXvkxiRrlzKPaRzRG+CwDbOGZcdlbg?=
 =?us-ascii?Q?SfXKjMNo7lGc5PTpE99ccvUTkXdzvB3L0N0mTFMfYSo1Las1AfTtjUDkUh2D?=
 =?us-ascii?Q?2bhuzWBKtrTxR2HCu/kY3BBDurpz/LiGwSOdZfQ1H/GVy6mg6hVcErlHJkAM?=
 =?us-ascii?Q?8mKdJoOIEaCz3Hppf0bVzNL4XW5QWpupHz8XuAtV6j2nwUsvAx55Cnj+myHl?=
 =?us-ascii?Q?aPKritEwGbRlcMuAJPfyTjBnV1aORjgRsorodV0qDx0MFNTH+6NxCMxbgFZx?=
 =?us-ascii?Q?6I2BHfRsgQPVBWcH9PX8K8G+w7BU6OuM5cPiNa5sIagfVq76IT5nN46WUOan?=
 =?us-ascii?Q?DEMjwY3BOL8p7g0irJzDxPAjsmnhvNH5cIdSj2Tp/pGf4+KD//rpubNb5g8S?=
 =?us-ascii?Q?LlaaNM1NXfAURiA7wGNdlwmKFdnHPvWI7WrAUCmXbrhGhi1T0id1AZgdXtXv?=
 =?us-ascii?Q?NmBF9PIohk767nJbcfsAkGdv75JeviaYMTr53FNf60CHm7HnCl1oMTZTX8+0?=
 =?us-ascii?Q?3PWWcdsbFTQYsBJ+cdC+dEIj3kv3LxS5k34VY+WDpFZ+eoPSSIi19Y3ZSmZL?=
 =?us-ascii?Q?xuAf1B2IOwkLb0BE2gQRLQzn9eXZobSMqMfBy3xW7gU3N0JsvOqLoC6KQHVz?=
 =?us-ascii?Q?RUCqTUMVRWdRug9KnyX7NAcbLqa8cPwh85ox3EjrVDSzjGKv45aJnNwIG4tf?=
 =?us-ascii?Q?jVZsvoW2Ki+5tmeO+YRQa1sw8B6v76h/hi75q7slK5zBMyjSksgqQvpGU4Ve?=
 =?us-ascii?Q?6jSmgGv6F0PN7thyUtwMEsMm1Zwh9rjPUbz4uSPyPVDrJGcPqCtc1lsbGprA?=
 =?us-ascii?Q?UUs9nsB8eKeI2b17I8c1Lk/hFwICIHg6WzudcsHtQ1Ksv2WMWc8mGKga1W6t?=
 =?us-ascii?Q?5Euq1mMLX3gG5Q9E4irFXFWUZzHfIgX7nXA7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GuQ1m/UxH6xi9whbCC54rNWPum1MsMmPVPRuuTYui1x3L1RJhnXOJKEgD6Of?=
 =?us-ascii?Q?4Ua6zfe+dSfpdPtaHdf78w5JuB82ZI6J95eBhHLRJUAIg7NgxfIxVBpgndLU?=
 =?us-ascii?Q?xMXGgmmEb7JzrtllZFqIeahugHUCK8Y9j5ZtocwLy45xp1GGw0/G6tcHwZvV?=
 =?us-ascii?Q?ANDYfuPpRqmth+HuGmYidA6v4yoIjZpSqTPe7ZW+ndFkJ7vf9Jig0ApqtbBN?=
 =?us-ascii?Q?b0ZPfzosqfY2f7X6GIfRTLF6SB7M+V+EWtF5OcTmu3fX7tEOd5vzJa9kq3KO?=
 =?us-ascii?Q?0y2knrEvd0aE+evzUwPmPONiut4HIpQmH+Rs78tpxenlRiJ++9L+aJzpQPEN?=
 =?us-ascii?Q?XPi4JvrZdUgbYtpsLrwT7vTej0y7Htq5WYK/LoL4JGUD/Fcqp/HTLNuxnrlB?=
 =?us-ascii?Q?8TczwMDrbVcjTenSnFPH9htqk6WTFkn6LUQlW5/9nsWMhH/ZScCEo/12MT4F?=
 =?us-ascii?Q?yk0BRvczaQKvkuxgeLWw/0W7ERqqBAZoXJ0KZSsjmDgpL2srAAXPVlv3YLtf?=
 =?us-ascii?Q?gBsdo9BSsX/sn/RAqAYDM4mN5K2ooSzmmidKOW7+BUOk5pUQ53Yp9HksvXzf?=
 =?us-ascii?Q?SltCLUknSQFxvJqaNXVCbmq/04tdiTpd11inkOhht0aU2P8Yyd+FJnzOAooo?=
 =?us-ascii?Q?tGi5Rba9sW07DWp8V+PYYdiIUe/gWXnOKZqVEYTuAMyDMNN7SGhQQTkrhB9C?=
 =?us-ascii?Q?aSBbKpmz9IygiIdUatvliWy3q5C/pLkvpD7Mb+89HmUh/iRzjHsHcFdBZk6n?=
 =?us-ascii?Q?nWqRhxT6jN8JcO5jGNfGANOHBYpJMqslZvIBXyG72zyaOf7PgfyHT7Rk8Z98?=
 =?us-ascii?Q?yoP4VhBC2K+xsnBoYL9PQciibn++mwjErNeN1YB+ik2Ng1eBHLtFXkzzatID?=
 =?us-ascii?Q?avYCnu43ySaqq5QCP48mo+ORUyRQeOeBQfaSpVZMEkb9dSiFPhJE4MnZo4yi?=
 =?us-ascii?Q?bXvSNCBbdBzNO6gZ6MMkxOBmvkNrfuZLAie03OP/6VhAnNE2UmfIni+cjCDn?=
 =?us-ascii?Q?yLGQI2ylCi1rmRh71YVIUiRYCVDtFrb4+lCcVZYe5gspWFIrmDSHcNQEljjk?=
 =?us-ascii?Q?b3CJZDOFuu5gt1xnMoiO8gGavib9yaYdGkE8XHBuq2hxeCAvHeektW8jDey8?=
 =?us-ascii?Q?Kug9ATF9MHVM22FX1epWFkV4O1AgWibxVzefHn50gGKuYafzkC/Gvp5MCBkM?=
 =?us-ascii?Q?bHAcZMWAauNzfRx6OhGX85wvJCU5MfyKnIY/7BFPiY1IvblbXecx2w8ZmYcC?=
 =?us-ascii?Q?VaTib104AQ0XVFQMzdf5WClELdTdcziwhV0LSqwqo6dazTc4MYW4Os1GlYbo?=
 =?us-ascii?Q?r6TzmSNIjs0+3+S6aprmSiwUdck8UfypdnOrAwgIInLi/mF+sw2KymBfJg8t?=
 =?us-ascii?Q?A3u/5naYheOlW8op8qeWbkb3W1HHFv2eH8vmLCZRVFoG/hO3f2M/NLCsScHt?=
 =?us-ascii?Q?fxHHl72ZoFDMR1cc/pW/A8BwAsoBDC1abNWRHJWVgxn61Hid4LoYiDaUHKUi?=
 =?us-ascii?Q?3oQGsLPMTQQwPjCNfjk4GInQ+/fASNzq+uESY18Tu3wLQeCeUD1CZ5ANxYMN?=
 =?us-ascii?Q?FjzoSeBPksNRfvsujwA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc42639-e440-449f-5e89-08de0b33feb7
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:11:47.9184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U967EAp+i/g1S1ByKZi6CGtdRGbwuye0s5pDava9pTPgC4A0UZzMaHHz7cCrNhVSvRA+7bESgwSAFn50fQLI9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7421
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

On Tue, Oct 14, 2025 at 04:03:37PM +0200, Marek Vasut wrote:
> On 10/13/25 6:56 PM, Frank Li wrote:
> > On Sat, Oct 11, 2025 at 06:51:20PM +0200, Marek Vasut wrote:
> > > Rework dc_subdev_get_id() to drop ARRAY_SIZE() use and use empty trailing
> > > entry in each ID look up array instead. This allows passing of those arrays
> > > around as OF match data, which will be useful when using this pipeline on
> > > i.MX95, which has different address-to-ID mapping.
> > >
> > > Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> >
> > This change is okay. but my questions is why need map register to id.
>
> This seems to be a recurring pattern in the driver, where some components
> need to find other components to link with them. The mapping is fixed, and
> since the DT does not encode link IDs, the resolution of the mapping has to
> happen by mapping the component base addresses to the IDs first.

In graphic link, port@<n>, n should be id? why not use it?

Frank
