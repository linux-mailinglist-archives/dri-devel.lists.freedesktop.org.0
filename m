Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16195BDF0D4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 16:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440EB10E2A0;
	Wed, 15 Oct 2025 14:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cPEyu+ma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6524A10E2A0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 14:31:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnvc0N/pD8hUL77OOVSLxXodXa/Ko9PYDsIYuHEjbEyKYuqf0xc0XqU6Ihe2XM8boW7HOFdZkBo6qucA1So5mjHS/WXWQvIgq9+4Gt/LCK4MK6ow8gtSYDDi4O0GewlmtVBw47tV9DX61Wvd3joB11cYUFbabpbyXD1Qk/2HIVF2E7N7dNXw3AcFLJ6bcFlRlyQchaJVW9MXh/r25BzWCDHZ+ABMz1Kz/AY7jSb/jWD6HKq62CEy70/7Aj91UvRIhX0JW8pAgO0IptuPiuVxmKFDOpxgmtUGWrbQJyeLIE0JKk7AfQDbRV/d1H6ThHspdhg6ocXL1isrjLWz6qkn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecLrV/H7WOdea++PIOhJzOYjYvk7czStLHW65aL6bo4=;
 b=NdVmAYuReMXO5sfLuRdjrRFgIldxcW/tuXtyUWbkvXO5Ndk+KROGrSP+64PByfv46C/kG9AGJvNRdEsCTxIlyaZBsSMN+4MJENQaIA3aujGdp2pLeAmtHIo179hAfHz8y6AE8PkFF4Vx0A0AeruDz+VLrF3zHnRFzcjwz5uoZPvZt7tQ2HsAB9vXTghiVFWeOZho6A1ugsCfdAmJN8fm/8vynw2+7vY1UyxxpmtE9VouWLYTGjoKjgUAQj9gatbsgHCyEfka4WnfYrVZaTU7y8JNNygUI+sAdNcDNjqAYmx77CvxcrihBUfZ6zuvcmfcuOurRPC8KJFHMtaVx5r51g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecLrV/H7WOdea++PIOhJzOYjYvk7czStLHW65aL6bo4=;
 b=cPEyu+maOUGBdwkZT+yI2nj89TziuYv2Iy1WOujB6nrzN9FxcLyL6ZJAkaObSaqRMO0jBHQjsHVothSkLSBBFWRdOrKuGM2GodGQA4vT/zpxTQtxIeMX2NyS9VBMOKegE8+xpWo5PE4ZZaSiNcktOVdFxDo4KKykNIIDJ/lyieJD7kEfsYsWVTwIlc2HQ2TTKdtrS3/UEYCHJCc91KbyG1nKt0FPCQyEkETGT6JaYaKGF1D59M4CV26rExi3Spje+5YFWSFMW2v24QQ07XPtNA7AgsfCUJPNl54Ak+yEE8HPlUyUPkcIAfANEQ5fu5dhovmwGsVOnFBGfLvFHVPcAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by OSKPR04MB11416.eurprd04.prod.outlook.com (2603:10a6:e10:9b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 14:31:50 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 14:31:50 +0000
Date: Wed, 15 Oct 2025 10:31:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org,
 Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 05/39] drm/imx: dc: Rework dc_subdev_get_id() to drop
 ARRAY_SIZE() use
Message-ID: <aO+wTX13s3rkvHp0@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-6-marek.vasut@mailbox.org>
 <aO0vLbkpXejre2Ta@lizhi-Precision-Tower-5810>
 <c7fee270-f3ff-402f-8266-0ffbb5077a61@mailbox.org>
 <aO5oKe14GLp3diGH@lizhi-Precision-Tower-5810>
 <43e3e005-5d30-4450-8dbc-8c6b5a0fa951@mailbox.org>
 <be6bc134-1dfc-4cd5-8f1b-cd5431828eb3@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be6bc134-1dfc-4cd5-8f1b-cd5431828eb3@nxp.com>
X-ClientProxiedBy: PH7P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::26) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|OSKPR04MB11416:EE_
X-MS-Office365-Filtering-Correlation-Id: 62db47e2-841e-472f-dc59-08de0bf79432
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|1800799024|7416014|19092799006|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AGZ7dQDOe/9kmMlC8JqthqMv3kRuxCEKU0WtPWszXWEIKwI9Mqzt9nFQypB0?=
 =?us-ascii?Q?2Z6KzY1wNRZjob+woLr+Qay71NICuTGkwicL3/w59c/7cGCTT+JrUGYt/97K?=
 =?us-ascii?Q?LD7Hob3ioNx1L0gmaYAjLFbrrPHFr793vzMgR7OEjkTq7BAwIjTuT/7zsmyL?=
 =?us-ascii?Q?bZgHWbJsMs7UiBzLRjAD22vOCoYrZ3Bt9OF2aYSQ9k36xd3vWTLBIlqc8yKs?=
 =?us-ascii?Q?HTj5y2EfKoy/zHQcQba/hpyNPnoboxeW/Qr1AAbd0yqUVXbCmrwfDqVM9489?=
 =?us-ascii?Q?GUMLUJSBwPaUI5khLO14wwZZPwYxnJhv40WdUqExsHstCixZ7sCnft/9rLD8?=
 =?us-ascii?Q?Kf1DCjpYQnOFE3ke+3Q3HuFYW34Lglyi99AG29owkaMxeMXDEbTTtEs3Epn4?=
 =?us-ascii?Q?9Q+lQuDHJd6p4o3Ul8aClkS7ahAf+WjCSu4omaCxgpVEgeytij04OgN31Avy?=
 =?us-ascii?Q?fkt4JJPsJxybrq1t90lOwljiCcWlWMA9qScYfvsaMpT6UTwWAaGe9luHVCyn?=
 =?us-ascii?Q?uoHW94wU4hh+Gx/D5lPA537FUNqrWUq+OGvX1APc9DAng31c/Fud1CHfo4N4?=
 =?us-ascii?Q?XoHulKJfYIHkpdTR0E4Ut7atTUUxi0hVRZ1mSGLW9sCv7IX8WbVCqoFVBYxU?=
 =?us-ascii?Q?IpiyC4qJ5JpgBzNBed5X2nNZwD5GBlde2ps0DhRNs8oAdU2gPYXQT+bM4Lwm?=
 =?us-ascii?Q?BIxJ6i2CDnAmWsf7LT/+QO7vGaZio1tOkIJQAlMFmIyt874fMixh5DZ1sPbA?=
 =?us-ascii?Q?MZ/GCzdRBipDI+3yZ2BfwPHVJmtxp8PA9e77JtoecCkt75XsgQ9fMUhcsFPr?=
 =?us-ascii?Q?W/nAZgII5xTVjg2fkWRLuFr7+w9Cn+Qsxqx/j8/ZqxiRp43IHCmhqjf6EEaX?=
 =?us-ascii?Q?w/0IPabJa90cA2q6dBvje53mVVd4ZtGNdifLJzKyZk2+yfg69EWoSB054uUX?=
 =?us-ascii?Q?FlMceEtJ5yeGK6uFzO/jjFe0mAWygr2zXPWQcKOZgAz6DLeyku6awqrwTNZK?=
 =?us-ascii?Q?QUCztREXbVXUspVPedh8lAOXCGH1rxDCCw/EEz+olZemgXO/u0EAE0aoudnQ?=
 =?us-ascii?Q?6epqtw/WDDkvW1R3tOCaBHYY0czRlBLnT+uirJanXgXJiOG/HnykcUlETBsw?=
 =?us-ascii?Q?pXRFi+za1uh15cyPD3WN/i+YN/jBAAeVohSzy0gzlEuJ0Gvq/ayHCFwzy04f?=
 =?us-ascii?Q?0eSdGtWJ8U+OhZclljDuQ1i39wKa3lQorm5yvxOctFdsw5P5XnexYTpCEMsD?=
 =?us-ascii?Q?pCtWGpzqnLmAz7Azqffd0FztvKA/zFAtw7ZNdhos6zOL5pWJlWNehBbWr0Eh?=
 =?us-ascii?Q?bkYW+3IU814c1gebXvKE94PWz31kbr3VcyCHP9yCOr1Aek6bzqqoeC+I7Jy4?=
 =?us-ascii?Q?oB/n4JOPhril4VoRQ4jtlM3UWdbv37fLB8JX2436LQWWEFaEAjiA8JIv+sg6?=
 =?us-ascii?Q?KTl0oGiX3H0Umva3Sh7JDf/4xXVfuPmQLjYxxrFTAjC5j2tONhJdOCpU4Owp?=
 =?us-ascii?Q?7CvaUqIfL3fSQ4NGFH+/sv+Su/NUsd8eo+8x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(19092799006)(376014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U331wE177++GE1VtYJs73UlELgQ1XQe/8lvnIBHPxJNki3Qfir0MSQ+r9Tfa?=
 =?us-ascii?Q?K2k9Nn0AvHQ0SeKMGPWYpmUCmThNkkCsEmuD/tGbmBmxfjMsTtZ9s3/LrSHp?=
 =?us-ascii?Q?kLOdPPbEPSC6uW6a7ffT2qf3UARqrq8zSGb0+ZarAevjEe8zYSRuEofdto07?=
 =?us-ascii?Q?pk7Vh1Vex7cUg+iUjwFctpldKCqSxtcDZVGCgToZl9Vun8YxM8ep0cw+LFhf?=
 =?us-ascii?Q?v7GqlTVv7rqtKv0XnPxyDKbI1FvmiccsgeHJ2wr2dbC0oQCZEXfjGRmALTim?=
 =?us-ascii?Q?SU1ATvWihKrsL3m23zGUWO9xl9jxY1iP8YtqjMy1NW5TjBGGYA+9bOdyO82c?=
 =?us-ascii?Q?ZZKrmOkF5NTYZtbdBtIxYqQw9h7fqSlfF7TSluu3lUEPkB6zUxEk3b/FeOTO?=
 =?us-ascii?Q?f77ihU22y9ID6Xiys8vc1WR93SIcNvaetV6l/B6kfCXzDNAyM6qugX1x4L5K?=
 =?us-ascii?Q?zwgWvySNZpVhTMAfJmd7XlZQ5JXIp4eZPyhwhaGJxi1Q/scAuZ57EJk2p9Ma?=
 =?us-ascii?Q?7e/b7qEL7kp3c2uI9tiIq/kAe3jMAoLZIWbFbB5aC8JmQ1RwH5N/GMV6IWtv?=
 =?us-ascii?Q?vDlrSGqG4CY+uARACkqJwAohXZRIFVON6V85i2fU/VRdY3cKwefBhpAkfy7p?=
 =?us-ascii?Q?ZF+8fQOduV0JoEHROnFlZ5rUnv87dBGO94ByeZKozj+VGddu0R/Oeg0Bbhb5?=
 =?us-ascii?Q?lQhiSj6ptTo9GmHjL7iiNad7XbiVYE8QzVKF7bAmMQb3R76KU3qkZIbMFQnz?=
 =?us-ascii?Q?Gf2N7MhFLEgRQ0wRRD/CPxMWnm+CHFtwYyrDFVKczRhauZT7KYBVz/Ln83gH?=
 =?us-ascii?Q?uia4i7NJbjkMEiXvsk9T8cLZj/XEPiQpStQFHcmOuHU982PDcaW1dB3/X3Jq?=
 =?us-ascii?Q?+oD3g8rSMok5ZOPqs4Flm7PiazB2pFnKfXDP4VltjC/uIQk30V714K2hpEY0?=
 =?us-ascii?Q?HLmVDE1rIyMcPN62R7LbXjxah+vc+MXwHcfUAujOjb4+pQU4NDzPoL2ZzBj+?=
 =?us-ascii?Q?ayxvqGVk4r26ZyYUF93uso9PJvjmMduvUeZLfKdo5tkL/fqG4vc5pXOvu94E?=
 =?us-ascii?Q?Tr4znc8r5YDayey4FlKE8X2ny43yhrMuAdKguZfEpZoW+HSQiWyXTrM7Zb7j?=
 =?us-ascii?Q?E/vT+WzOiMFVpulhRis9WgHgbQkVofWM16HBqwMYhGZsyerQ5O7S1yIHgTfI?=
 =?us-ascii?Q?DB1qjOGDJGA/YZHa4ng+hqySFOC5gyDsZYXUqVJQ/zEUsxJ5S5QZrx1ftvYx?=
 =?us-ascii?Q?4DxNq9kxDs2Of5FjjQL5ioawDislDu065A9WT0ezp/1p+ZvuXI5HhB/yuQqB?=
 =?us-ascii?Q?BL2qFMOecrC//8o5COgG3Iu5Oy4DwLrej86ZMTmVDJalb1IirUvoWrorlfUG?=
 =?us-ascii?Q?tPrgoZf8QDV4jEpSEHfNFwFvnfwHEIRd7lTNUKYibMj0/EvfUF03Zr36B8if?=
 =?us-ascii?Q?fJIhEL1hXpAK056WKawySQfZwa2Kk/2YW7GUJ8c+44d3RikRUQZ/WrE+9jcQ?=
 =?us-ascii?Q?gPHTGxbZwMamQ0G0PaQVqwCJyh1MhVUWhQhh+TcbxbOdIDuOQ60fed2NVvbn?=
 =?us-ascii?Q?9Tqv3J9raJW6P72j3Kxz4QgFkaOoqlMEa6c5/WCD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62db47e2-841e-472f-dc59-08de0bf79432
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 14:31:50.6547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8x8uQPQnuShadTDpT3Lo7ExiK/SiTaA9bVbiApFvODzB/BzYud4t1un3CMOUu/X90iI31w2sXD1ZAdBCt+xO3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11416
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

On Wed, Oct 15, 2025 at 05:14:02PM +0800, Liu Ying wrote:
> On 10/14/2025, Marek Vasut wrote:
> > On 10/14/25 5:11 PM, Frank Li wrote:
> >> On Tue, Oct 14, 2025 at 04:03:37PM +0200, Marek Vasut wrote:
> >>> On 10/13/25 6:56 PM, Frank Li wrote:
> >>>> On Sat, Oct 11, 2025 at 06:51:20PM +0200, Marek Vasut wrote:
> >>>>> Rework dc_subdev_get_id() to drop ARRAY_SIZE() use and use empty trailing
> >>>>> entry in each ID look up array instead. This allows passing of those arrays
> >>>>> around as OF match data, which will be useful when using this pipeline on
> >>>>> i.MX95, which has different address-to-ID mapping.
> >>>>>
> >>>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> >>>>
> >>>> This change is okay. but my questions is why need map register to id.
> >>>
> >>> This seems to be a recurring pattern in the driver, where some components
> >>> need to find other components to link with them. The mapping is fixed, and
> >>> since the DT does not encode link IDs, the resolution of the mapping has to
> >>> happen by mapping the component base addresses to the IDs first.
> >>
> >> In graphic link, port@<n>, n should be id? why not use it?
> > I suspect you could model the relationships between the DC blocks using OF
> > graph, yes. I also suspect that description would be very complex in
> > DT, considering the amount of blocks and links this device contains. I
> > suspect this is why there is no such DT description using OF graph.
>
> Yes.  The design decision was made to avoid using OF graph to describe
> links between DC blocks due to the complexity.

Any previous discuission? Using registers base address to determiate ID
is not solution.

Frank

>
> >
> > I think it might also be good to talk to Liu directly about the original design
> > decision and why this id mapping was done the way it was done,
> > they should know better than me.
>
>
> --
> Regards,
> Liu Ying
