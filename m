Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE9EB1DB55
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 18:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B03910E890;
	Thu,  7 Aug 2025 16:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YmncCSJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011034.outbound.protection.outlook.com
 [40.107.130.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A6E10E87F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 16:08:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMOogF3zMstVZvU96E4b9GVvSh1G1WKbgu99JqMFOeIn3jq19gaSER4NaxgXyIL3rLViVj0x0tH0YPyU7RFxKQ+AmpSVKf0eLrgPBxbmHTlyqqk4eTD7P1D8ZEpjgVz3iekS9I3aZ1p7kXF7O3gYReFzMGaO2RTqw3Z2xVaiOf+/lFv4VItzGQtkFobLg3d1FY4iJBvoTtS3SkTRhRDh+29qZEuA2yrs58KPB+2bhHL9+IVOMClfTYAWgp9mvAnLIAoWIhWUyaW0LdeD1/hoQuuqGuQXGbga1DvbVM3y8v//9/BHiLdnUOhnz+YW9EjgwT7m3pVcSlylCRkEMaDLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7UpJzhp5ezQQbhWB9L0jLx1FtfXL0J/xf2Ai3WvlOM=;
 b=GObpicRatSoU3n2ATdR8cqdhnsEJUSvBSyDDkkwZ1yv8+92gGgyQaeAZoCmwDnbYAVx223OvmL803mf3rl4RgroO2MH91QeHC2nkKrs8FCBpKIw7bZ1B2GgKDLtOXvArH/Z3GnZ75alATRcukPFD5EhIgTYKM7qQI6JnEK8ARvjp5YgXcfOLz6djtYEO0m4BTcSkbTNx4HYPTei7sMLJ68oJE3CAwu892MupkdD1nvUB1dREtUoSmYqRA9SzpefHHYN0drVu7AZb6eTm5X/P+q87mMXcIq9dmqr1TfWvfVK6TZef5ZNEKaQyrGEMrQOAHATq2hD1pie/UyitZmn1xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7UpJzhp5ezQQbhWB9L0jLx1FtfXL0J/xf2Ai3WvlOM=;
 b=YmncCSJzm/Y5VtYmxUPAYoo8lmWfgW+phXlia2H4TlvqmcG5heGvFvYK6Wg2ITePgh4ZtLN8EOH1E+OY7du2NpZfcYKVfNm/lvb5ABik7BpFKK6+XEGjF2fY9/KeUwTUCii5JU0xqFozrW2Z1d+8W+suGSwqGpJKbPFI/zGLZ/SkfRpe5+GK2nP6jeE7CNxbuO45bH1pKojUg+jycsgKLy3oCniuke/XV8tlPRkv9gBE+wtpRfSXtUbNCtd+HLQYOzwt0DHV8/u65F1VdwQPr1RcxxsjTN1M9xY+4RqaFYGVxtfcS1m15kjSpSlMKPCkRvgSFgiYMy0o1G5hK2QbNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9800.eurprd04.prod.outlook.com (2603:10a6:20b:677::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:08:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:08:15 +0000
Date: Thu, 7 Aug 2025 12:07:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandor Yu <sandor.yu@nxp.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/9] drm/imx: Add support for i.MX94 DCIF
Message-ID: <aJTPW8kJKs8/9aH8@lizhi-Precision-Tower-5810>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
 <20250806150521.2174797-6-laurentiu.palcu@oss.nxp.com>
 <aJN4Ns+Vt20Q2UIj@lizhi-Precision-Tower-5810>
 <rinow6t73wgrmu6hj5jailefeol4bh2tn2vyash7vta6hkunta@66x2rcxcubti>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rinow6t73wgrmu6hj5jailefeol4bh2tn2vyash7vta6hkunta@66x2rcxcubti>
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9800:EE_
X-MS-Office365-Filtering-Correlation-Id: cf02c295-869f-480d-3190-08ddd5cc9d7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vvU+FOJnD7n4LD6/LpUYpNLNo0GedYtwI14X5lYyd+T1P/2VokxR0JNJ4czD?=
 =?us-ascii?Q?ammu3CFLx3FwDk9IwS7DpN6MrR7wyEXJo54UReJ4MtgiaatU4pao2fOZgDtn?=
 =?us-ascii?Q?8SBSNoTAyjFGyVbHorO4XJGRlQ11sd6iLP5BG8T9zhXB18lzid8KnzMnyQ1l?=
 =?us-ascii?Q?osLGyugnhFMHmTUypLEg5Omm+0itzbPSL1pKIwZAGxJpDuoct/ZAi0AhkhEi?=
 =?us-ascii?Q?oqaRNpgMCQWISlLC7mHKMkQDMmhwiYZEOEVVcuTSTvvVBVcTLtTwIv3yG+Ot?=
 =?us-ascii?Q?sgyqdD0of+HIQOfPFfZuUSiNLuAqFsEo+iZdj5KIS7B7/iyYhyEcdY61iUpi?=
 =?us-ascii?Q?4nGfDcUwrXQikWaItvKoCZpC4giF0+GIO6UQswUcqb8vWbSBlWwwaUE6afKM?=
 =?us-ascii?Q?t0gUStY0kFuA/3320oNFHhXnksEsmK/pGw+Cp4sHQWv02J6Y3ZjIE+6yvyeD?=
 =?us-ascii?Q?lFDjndEUB+oFe20RPvvjaGYRkyayPxwOegvJEqfUpi4cAIZVIJNVq9GS49Wa?=
 =?us-ascii?Q?9V8paBgdVjMxjYFo2YDwPcaMITc19v/CkCQnSp38fH4SFGV4v70iT9rCuNtx?=
 =?us-ascii?Q?emhGSVkaz4lfvOi+0/SU4L5yc+/poeLxg9xKfIL63yd/hAbhFfzy8J28SkjM?=
 =?us-ascii?Q?O+Ed2IwXaZKsrpRehLQCM0NXelqsz7U1wNCgl+HpBcYbZlWH92VUvqYXnpiE?=
 =?us-ascii?Q?TWWjxFEfg+IFr7jzGZmqyIYCRwtriMKMxdWQxQBuHTtrPmV1TU/wN8Ji8qdv?=
 =?us-ascii?Q?/4hiqr4Oqj0L8Qhbxd2v3sxQYYdBs/faZCHFculQtGHQ2G7dngOyi9K9sHCg?=
 =?us-ascii?Q?eTP+2UawKQMAwAQFNGT9MIPtLkDyzDh34dM3XRt2Ogm96vhjQrl66acB1tPt?=
 =?us-ascii?Q?f7/5vaXP1bDtXaI2aXP3bzNQ2mdp/Z9P8lhG1LVelvgbpykMU/2SG/MSs++L?=
 =?us-ascii?Q?n4h/vZANudAfwwf+cJkaEkRXGPf2LdYnsqPryQ4srHDZqFntA0Pj/t+Ts/w0?=
 =?us-ascii?Q?xlc62zi2B1TPkV9M5UCAPNJOE4IcCHXfU6LrxwifxHE1javCSX1WFvGI3+TS?=
 =?us-ascii?Q?EEZga5zAzzitz9z+pP4q4lSMzKxK8u1I69SqyCItmS672GyCUwdporZ0PBSR?=
 =?us-ascii?Q?cVLRBHAMZLttfPOwB/k7MfUCzBuCQWX6Y63XQf47ZK5AqywWeCKePd/DEJ8d?=
 =?us-ascii?Q?A9GHiHrHAqN5oq/zcWBJGu6OE2r0jSAh9WxKUoaeE8FQYb6Ap8sleQZnCQzg?=
 =?us-ascii?Q?NSeFKR9IA8J1twceewXECztAovTpfAEI2M37GchqDlIzfBBFubffy4wpv7N2?=
 =?us-ascii?Q?CcnmMCn8HLYYDOurD0Eat22wQi3FKRYO+05cQF9qBbsz6gJ5KwCsFEOKBkpJ?=
 =?us-ascii?Q?PDXHSOH3Q7srMiwZkNAe4+wAXh9B1ho0neHGZ49YZWoF5B29Aiy5SWvYVbg/?=
 =?us-ascii?Q?8lRDVtcNUstNUsSnPQ8IBEYzTExpDJCMZCtBjTKbAIDbhLR8ccoVLA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0fruJyk9EzH8DPgyMwfG/E2bw/dAguEfOybwD0rg41rx2czy6eONC2LGs9pG?=
 =?us-ascii?Q?2jbe18821Ie4d6iLSggNvPYbWDzgim9jVf0qTetqeMZyMh399aL6k/0WwxPx?=
 =?us-ascii?Q?8xyVrcFG/uzvQcd7yhQ5zAsrU9U5NMeeQknMxAbMoxNG61dE4Eo/u+C1rRa7?=
 =?us-ascii?Q?/B31tYQ3TW1oCjaO3mUZ046RMR9Ny1XoWdiJlVMwyPjUtcdITLXxh09kH3qF?=
 =?us-ascii?Q?l0c57/eVrvq176+woqAr1LFDrtGx5DdQtBNYBgoyDFzYifEq9evI70QuNrch?=
 =?us-ascii?Q?clcUWSN/HNEYLdGhvloeC+iMdEv3X0+XekLyJWqDJaLWnHFnW74PKhlTk1gO?=
 =?us-ascii?Q?/q7IFfFYZhkfUIlVzsnJxevfqXKTw+jd+ObdKFDdX+/PK8RO0KYxQFOpvac5?=
 =?us-ascii?Q?YpTqrHQavLRZPgd2DLPfnEDO4Cv4nndBEkU/N6bFplWn1hT4XU9CsB6X8ZoA?=
 =?us-ascii?Q?XSnbyFV0390MpAplrDTzmLaHByVEuTTv34UHUTq+mTAgFY/IykRxOcm6cXy+?=
 =?us-ascii?Q?zc9lInmU6cj1pEZXC3RM2c3Wiy1++TCjwFAVQ1vfRpCNgLpdf0XAGHmfoj2T?=
 =?us-ascii?Q?c2MRp8GT+J6Yp25jBMWhrSzvuie56ONIuGgNLHsg5IYYOd+26oyH+pdmJTF2?=
 =?us-ascii?Q?/iFM6BlPB/33kRUYNVymQd4XI47D0V8nDV00suDAH39PO4VubCpEtf8NGoJY?=
 =?us-ascii?Q?3jlOfifIAYk0xp8AbgHOoHjBhJRRtZ0un5+nu2Ds985fw2zvp/7OY8vln156?=
 =?us-ascii?Q?43D11pxXQ2FrpQ/cSjJ3uREvEHtaqNJHwNAQWwq49VAxKt/4eFa4E9DnYCOH?=
 =?us-ascii?Q?G38dInbiaR0UzFQW6TXCQWATA3YQKYlfbefc/NUM9+28BZr67wLyDCgTocj5?=
 =?us-ascii?Q?7hJxyvVOh6T29UwqRONE5pno4ck49Lyv7m0ZQZ4FuM59r+ul+f6Gk94U36CT?=
 =?us-ascii?Q?5G4U/cziRAzTkO51iLpUS2A9aKoJWio/WRjGikov0LEzfLMaHIOCi4HRqtwU?=
 =?us-ascii?Q?uExlr8+kFnb+3NdAOZFlz7rRALkoU4jw4UyxjsL7R4d8B/hw2oOqR0YJcf9S?=
 =?us-ascii?Q?jpheSzjhXfUi6tiEogGjGrFu2RRnGtISJVReAdc1tZzosXhTHKSziQzNOHzv?=
 =?us-ascii?Q?M7Gz2cy7uyaiVE7iTE6ExLeWi44S8cWRGxLQz2TVnZahNLM+D+DLCfrXSSsl?=
 =?us-ascii?Q?8Pm7Z71p6HHHI+R8806XEb5OkFMzD+H6fY8piqTJs54zQ3ry+ZKegm1Yn+Ke?=
 =?us-ascii?Q?It937m0L2MlPa0YaJPYLhG4dvI88fvydFJH/eL6e9LDxVp3z8WjJ4S+tqq7c?=
 =?us-ascii?Q?HXEjo2gWZFlomj+n0l+OQv0rdWaFkGcGc4/CM06gOWRAmSiHaicAzJDLXLK0?=
 =?us-ascii?Q?j4LZ2/yQEV0QgDK5PHRbVBGThf9UnfMasaCP4Q6M9u/+d23k2mEj0WQNR5PI?=
 =?us-ascii?Q?mMpmgqa5TA14ZvRXh/ji980vkUcU6eWIi1CwXYQjsngb417PSrgq+RE65lFJ?=
 =?us-ascii?Q?WpUly9bIqoFOc8Pe0pys/+mdGzNDcfezvsxD/JcC+90lHAT+G/6B9A+GF6x9?=
 =?us-ascii?Q?9nlhxqW8M4I05s9xIz+c26PgCNnl770VVk9agm+f?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf02c295-869f-480d-3190-08ddd5cc9d7b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 16:08:15.4089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ncLeb6IjpUVHX5DTKXoilV8XEhnqyykG/2IqXvtuggjcyDuabs62zWm1NafrEnnvUexRxlc54WaAS+JbPwJ0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9800
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

On Thu, Aug 07, 2025 at 03:36:58PM +0300, Laurentiu Palcu wrote:
> On Wed, Aug 06, 2025 at 11:43:50AM -0400, Frank Li wrote:
> > On Wed, Aug 06, 2025 at 06:05:12PM +0300, Laurentiu Palcu wrote:
> > > From: Sandor Yu <sandor.yu@nxp.com>
> > >
> > > The i.MX94 Display Control Interface features:
> > >  * Up to maximum 3 layers of alpha blending:
> > >     - 1 background layer(Layer 0);
> > >     - 1 foreground layer(Layer 1);
> > >     - A programmable constant color behind the background layer;
> > >  * Each layer supports:
> > >     - programmable plane size;
> > >     - programmable background color;
> > >     - embedded alpha and global alpha;
> > >  * Data output with CRC checksum for 4 programmable regions;
> > >
> > > Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
> > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > > ---
> > >  drivers/gpu/drm/imx/Kconfig           |   1 +
> > >  drivers/gpu/drm/imx/Makefile          |   1 +
> > >  drivers/gpu/drm/imx/dcif/Kconfig      |  15 +
> > >  drivers/gpu/drm/imx/dcif/Makefile     |   5 +
> > >  drivers/gpu/drm/imx/dcif/dcif-crc.c   | 211 ++++++++
> > >  drivers/gpu/drm/imx/dcif/dcif-crc.h   |  52 ++
> > >  drivers/gpu/drm/imx/dcif/dcif-crtc.c  | 694 ++++++++++++++++++++++++++
> > >  drivers/gpu/drm/imx/dcif/dcif-drv.c   | 226 +++++++++
> > >  drivers/gpu/drm/imx/dcif/dcif-drv.h   |  84 ++++
> > >  drivers/gpu/drm/imx/dcif/dcif-kms.c   | 100 ++++
> > >  drivers/gpu/drm/imx/dcif/dcif-plane.c | 269 ++++++++++
> > >  drivers/gpu/drm/imx/dcif/dcif-reg.h   | 266 ++++++++++
> > >  12 files changed, 1924 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/imx/dcif/Kconfig
> > >  create mode 100644 drivers/gpu/drm/imx/dcif/Makefile
> > >  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crc.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crc.h
> > >  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crtc.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-drv.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-drv.h
> > >  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-kms.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-plane.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcif/dcif-reg.h
> > >
> > > diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
> > > index 3e8c6edbc17c2..1b6ced5c60b51 100644
> > > --- a/drivers/gpu/drm/imx/Kconfig
> > > +++ b/drivers/gpu/drm/imx/Kconfig
> > > @@ -1,6 +1,7 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >
> > ...
> > > +static int
> > > +dcif_crc_parse_source(const char *source_name, enum dcif_crc_source *s,
> > > +		      struct drm_rect *roi)
> > > +{
> > > +	static const char roi_prefix[] = "roi:";
> > > +
> > > +	if (!source_name) {
> > > +		*s = DCIF_CRC_SRC_NONE;
> > > +	} else if (!strcmp(source_name, "auto")) {
> > > +		*s = DCIF_CRC_SRC_FRAME;
> > > +	} else if (strstarts(source_name, roi_prefix)) {
> > > +		char *options __free(kfree), *opt;
> >
> > need set opt to NULL here
>
> Do I need to? Why? I don't see 'opt' being used before first asignment.

It is fixed pattern for clean up. In case, you add new code here in future
and is very easy to miss set opt = NULL, especial diff don't show

char *options __free(kfree), *opt;
in future patches.

There are two pattern for cleanup usage.

	char *options __free(kfree), *opt = NULL;

or
	....
	char *options __free(kfree), *opt = kstrdup(source_name + len, GFP_KERNEL);
	...

>
> >
> > > +		int len = strlen(roi_prefix);
> > > +		int params[4];
> > > +		int i = 0, ret;
> > > +
> > > +		options = kstrdup(source_name + len, GFP_KERNEL);
> > > +
> > ...
> > > +
> > > +static void dcif_crtc_atomic_enable(struct drm_crtc *crtc,
> > > +				    struct drm_atomic_state *state)
> > > +{
> > > +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> > > +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, crtc->primary);
> > > +	struct dcif_crtc_state *dcif_crtc_state = to_dcif_crtc_state(crtc_state);
> > > +	struct drm_display_mode *adj = &crtc_state->adjusted_mode;
> > > +	struct dcif_dev *dcif = crtc_to_dcif_dev(crtc);
> > > +	struct drm_device *drm = crtc->dev;
> > > +	dma_addr_t baseaddr;
> > > +
> > > +	dev_dbg(drm->dev, "mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(adj));
> > > +
> > > +	/* enable power when we start to set mode for CRTC */
> > > +	pm_runtime_get_sync(drm->dev);
> >
> > Need check return value here.
>
> I don't really need to but, I guess, it wouldn't hurt either.

Now it is quite common require to check return value of
pm_runtime_get_sync(), many maintainer already provide similar feedback.

if pm_runtime_get_sync() return failure, following register access will
cause system halt. The result is fatal for the whole system even though the
possiblity of return failure is quite low.

>
> >
> > > +
> > > +	drm_crtc_vblank_on(crtc);
> > > +
> > > +	dcif_crtc_mode_set_nofb(crtc_state, plane_state);
> > > +
> > > +	baseaddr = drm_fb_dma_get_gem_addr(plane_state->fb, plane_state, 0);
> > > +	if (baseaddr)
> > > +		regmap_write(dcif->regmap, DCIF_CTRLDESC4(0), baseaddr);
> > > +
> > > +	dcif_enable_plane_panic(dcif);
> > > +	dcif_enable_controller(dcif);
> > > +
> > > +	dcif_crtc_queue_state_event(crtc);
> > > +
> > > +	if (dcif->has_crc && dcif_crtc_state->crc.source != DCIF_CRC_SRC_NONE)
> > > +		dcif_crtc_enable_crc_source(dcif, dcif_crtc_state->crc.source,
> > > +					    &dcif_crtc_state->crc.roi, 0);
> > > +}
> > > +
> > ...
> > > +irqreturn_t dcif_irq_handler(int irq, void *data)
> > > +{
> > > +	struct drm_device *drm = data;
> > > +	struct dcif_dev *dcif = to_dcif_dev(drm);
> > > +	int domain = dcif->cpu_domain;
> > > +	u32 stat0, stat1, crc;
> > > +
> > > +	regmap_read(dcif->regmap, DCIF_IS0(domain), &stat0);
> > > +	regmap_read(dcif->regmap, DCIF_IS1(domain), &stat1);
> > > +
> > > +	if (stat0 & DCIF_INT0_VS_BLANK) {
> > > +		drm_crtc_handle_vblank(&dcif->crtc);
> > > +
> > > +		scoped_guard(spinlock_irqsave, &drm->event_lock) {
> > > +			if (dcif->event) {
> > > +				drm_crtc_send_vblank_event(&dcif->crtc, dcif->event);
> > > +				dcif->event = NULL;
> > > +				drm_crtc_vblank_put(&dcif->crtc);
> > > +			}
> > > +			if (dcif->crc_is_enabled) {
> > > +				regmap_read(dcif->regmap, DCIF_CRC_VAL_R(0), &crc);
> > > +				drm_crtc_add_crc_entry(&dcif->crtc, false, 0, &crc);
> > > +				dev_dbg(drm->dev, "crc=0x%x\n",  crc);
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	if (stat1 & (DCIF_INT1_FIFO_PANIC0 | DCIF_INT1_FIFO_PANIC1)) {
> > > +		u32 panic = stat1 & (DCIF_INT1_FIFO_PANIC0 | DCIF_INT1_FIFO_PANIC1);
> > > +
> > > +		dev_dbg_ratelimited(drm->dev, "FIFO panic on %s\n",
> > > +				    panic == (DCIF_INT1_FIFO_PANIC0 | DCIF_INT1_FIFO_PANIC1) ?
> > > +				    "layers 0 & 1" : panic == DCIF_INT1_FIFO_PANIC0 ? "layer 0" :
> > > +				    "layer 1");
> > > +	}
> > > +
> > > +	/* W1C */
> > > +	regmap_write(dcif->regmap, DCIF_IS0(domain), stat0);
> > > +	regmap_write(dcif->regmap, DCIF_IS1(domain), stat1);
> >
> > Need move above two lines to just after read it to avoid lost irq.
> The only interrupt that matters is the vertical blanking one. And it
> occurs every 16.66ms or more. I think we're safe.

But following known fixed irq handle pattern will reduce many problem in
future. Some time, some wrong implement in driver make a quite long
spin_lock_saveirq(), such print dbg message in spin_lock or irq handler
cause quite long irq latency.

It is not wonth to take this risk at here for just need move two line code.

Frank

>
> Laurentiu
>
> >
> > > +
> > > +	return IRQ_HANDLED;
> > > +}
> > > +
> > > +int dcif_crtc_init(struct dcif_dev *dcif)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = dcif_plane_init(dcif);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	drm_crtc_helper_add(&dcif->crtc, &dcif_crtc_helper_funcs);
> > > +	ret = drm_crtc_init_with_planes(&dcif->drm, &dcif->crtc, &dcif->planes.primary, NULL,
> > > +					&dcif_crtc_funcs, NULL);
> > > +	if (ret) {
> > > +		drm_err(&dcif->drm, "failed to initialize CRTC: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > ...
> > > +
> > > +static void dcif_read_chip_info(struct dcif_dev *dcif)
> > > +{
> > > +	struct drm_device *drm = &dcif->drm;
> > > +	u32 val, vmin, vmaj;
> > > +
> > > +	pm_runtime_get_sync(drm->dev);
> > > +
> > > +	regmap_read(dcif->regmap, DCIF_VER, &val);
> > > +
> > > +	dcif->has_crc = val & 0x2;
> >
> > 0x2 need register field define macro for it
> >
> > > +
> > > +	vmin = DCIF_VER_GET_MINOR(val);
> > > +	vmaj = DCIF_VER_GET_MAJOR(val);
> > > +	DRM_DEV_DEBUG(drm->dev, "DCIF version is %d.%d\n", vmaj, vmin);
> > > +
> > > +	pm_runtime_put_sync(drm->dev);
> > > +}
> > > +
> > ...
> > > +
> > > +#include <drm/drm_crtc.h>
> > > +#include <drm/drm_device.h>
> > > +#include <drm/drm_encoder.h>
> > > +#include <drm/drm_plane.h>
> > > +#include <drm/drm_vblank.h>
> > > +
> > > +struct dcif_dev {
> > > +	struct drm_device drm;
> > > +	void __iomem *reg_base;
> > > +
> > > +	struct regmap *regmap;
> > > +	int irq[3];
> >
> > 3 need define MAX_IRQ_NUMS macro for it.
> >
> > Frank
> > > +
> > > +	unsigned int num_clks;
> > > +	struct clk_bulk_data *clks;
> > > +
> > > +	struct drm_crtc crtc;
> > > +	struct {
> > > +		struct drm_plane primary;
> > > +		struct drm_plane overlay;
> > > +	} planes;
> > > +	struct drm_encoder encoder;
> > > +
> > > +	struct drm_pending_vblank_event *event;
> > > +
> > > +	/* Implement crc */
> > > +	bool has_crc;
> > > +	bool crc_is_enabled;
> > > +
> > > +	/* CPU domain for interrupt control */
> > > +	int cpu_domain;
> > > +};
> > > +
> > > +enum dcif_crc_source {
> > > +	DCIF_CRC_SRC_NONE,
> > > +	DCIF_CRC_SRC_FRAME,
> > > +	DCIF_CRC_SRC_FRAME_ROI,
> > > +};
> > > +
> > > +struct dcif_crc {
> > > +	enum dcif_crc_source	source;
> > > +	struct drm_rect		roi;
> > > +};
> > > +
> > > +struct dcif_crtc_state {
> > > +	struct drm_crtc_state	base;
> > > +	struct dcif_crc		crc;
> > > +	u32			bus_format;
> > > +	u32			bus_flags;
> > > +};
> > > +
> > > +static inline struct dcif_dev *to_dcif_dev(struct drm_device *drm_dev)
> > > +{
> > > +	return container_of(drm_dev, struct dcif_dev, drm);
> > > +}
> > > +
> > > +static inline struct dcif_dev *crtc_to_dcif_dev(struct drm_crtc *crtc)
> > > +{
> > > +	return to_dcif_dev(crtc->dev);
> > > +}
> > > +
> > > +static inline struct dcif_crtc_state *to_dcif_crtc_state(struct drm_crtc_state *s)
> > > +{
> > > +	return container_of(s, struct dcif_crtc_state, base);
> > > +}
> > > +
> > > +irqreturn_t dcif_irq_handler(int irq, void *data);
> > > +int dcif_crtc_init(struct dcif_dev *dcif);
> > > +int dcif_plane_init(struct dcif_dev *dcif);
> > > +int dcif_kms_prepare(struct dcif_dev *dcif);
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/imx/dcif/dcif-kms.c b/drivers/gpu/drm/imx/dcif/dcif-kms.c
> > > new file mode 100644
> > > index 0000000000000..69d999d178b0b
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/imx/dcif/dcif-kms.c
> > > @@ -0,0 +1,100 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +/*
> > > + * Copyright 2025 NXP
> > > + */
> > > +
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_bridge_connector.h>
> > > +#include <drm/drm_gem_framebuffer_helper.h>
> > > +#include <drm/drm_print.h>
> > > +#include <drm/drm_probe_helper.h>
> > > +#include <drm/drm_simple_kms_helper.h>
> > > +
> > > +#include "dcif-drv.h"
> > > +
> > > +static int dcif_kms_init(struct dcif_dev *dcif)
> > > +{
> > > +	struct drm_device *drm = &dcif->drm;
> > > +	struct device_node *np = drm->dev->of_node;
> > > +	struct drm_connector *connector;
> > > +	struct drm_bridge *bridge;
> > > +	int ret;
> > > +
> > > +	ret = dcif_crtc_init(dcif);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	bridge = devm_drm_of_get_bridge(drm->dev, np, 0, 0);
> > > +	if (IS_ERR(bridge))
> > > +		return dev_err_probe(drm->dev, PTR_ERR(bridge), "Failed to find bridge\n");
> > > +
> > > +	dcif->encoder.possible_crtcs = drm_crtc_mask(&dcif->crtc);
> > > +	ret = drm_simple_encoder_init(drm, &dcif->encoder, DRM_MODE_ENCODER_NONE);
> > > +	if (ret) {
> > > +		drm_err(drm, "failed to initialize encoder: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = drm_bridge_attach(&dcif->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > > +	if (ret) {
> > > +		drm_err(drm, "failed to attach bridge to encoder: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	connector = drm_bridge_connector_init(drm, &dcif->encoder);
> > > +	if (IS_ERR(connector)) {
> > > +		drm_err(drm, "failed to initialize bridge connector: %d\n", ret);
> > > +		return PTR_ERR(connector);
> > > +	}
> > > +
> > > +	ret = drm_connector_attach_encoder(connector, &dcif->encoder);
> > > +	if (ret)
> > > +		drm_err(drm, "failed to attach encoder to connector: %d\n", ret);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static const struct drm_mode_config_funcs dcif_mode_config_funcs = {
> > > +	.fb_create     = drm_gem_fb_create,
> > > +	.atomic_check  = drm_atomic_helper_check,
> > > +	.atomic_commit = drm_atomic_helper_commit,
> > > +};
> > > +
> > > +static const struct drm_mode_config_helper_funcs dcif_mode_config_helpers = {
> > > +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> > > +};
> > > +
> > > +int dcif_kms_prepare(struct dcif_dev *dcif)
> > > +{
> > > +	struct drm_device *drm = &dcif->drm;
> > > +	int ret;
> > > +
> > > +	ret = drmm_mode_config_init(drm);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = dcif_kms_init(dcif);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	drm->mode_config.min_width	= 1;
> > > +	drm->mode_config.min_height	= 1;
> > > +	drm->mode_config.max_width	= 1920;
> > > +	drm->mode_config.max_height	= 1920;
> > > +	drm->mode_config.funcs		= &dcif_mode_config_funcs;
> > > +	drm->mode_config.helper_private	= &dcif_mode_config_helpers;
> > > +
> > > +	ret = drm_vblank_init(drm, 1);
> > > +	if (ret < 0) {
> > > +		drm_err(drm, "failed to initialize vblank: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	drm_mode_config_reset(drm);
> > > +
> > > +	drmm_kms_helper_poll_init(drm);
> > > +
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/gpu/drm/imx/dcif/dcif-plane.c b/drivers/gpu/drm/imx/dcif/dcif-plane.c
> > > new file mode 100644
> > > index 0000000000000..54ab8edd11e0c
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/imx/dcif/dcif-plane.c
> > > @@ -0,0 +1,269 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +/*
> > > + * Copyright 2025 NXP
> > > + */
> > > +
> > > +#include <linux/regmap.h>
> > > +
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_blend.h>
> > > +#include <drm/drm_fb_dma_helper.h>
> > > +#include <drm/drm_fourcc.h>
> > > +#include <drm/drm_framebuffer.h>
> > > +#include <drm/drm_gem_atomic_helper.h>
> > > +#include <drm/drm_gem_dma_helper.h>
> > > +#include <drm/drm_print.h>
> > > +#include <drm/drm_rect.h>
> > > +
> > > +#include "dcif-drv.h"
> > > +#include "dcif-reg.h"
> > > +
> > > +static const u32 dcif_primary_plane_formats[] = {
> > > +	/* RGB */
> > > +	DRM_FORMAT_RGB565,
> > > +	DRM_FORMAT_RGB888,
> > > +	DRM_FORMAT_XBGR8888,
> > > +	DRM_FORMAT_XRGB1555,
> > > +	DRM_FORMAT_XRGB4444,
> > > +	DRM_FORMAT_XRGB8888,
> > > +
> > > +	/* Packed YCbCr */
> > > +	DRM_FORMAT_YUYV,
> > > +	DRM_FORMAT_YVYU,
> > > +	DRM_FORMAT_UYVY,
> > > +	DRM_FORMAT_VYUY,
> > > +};
> > > +
> > > +static const u32 dcif_overlay_plane_formats[] = {
> > > +	/* RGB */
> > > +	DRM_FORMAT_RGB565,
> > > +	DRM_FORMAT_RGB888,
> > > +	DRM_FORMAT_XBGR8888,
> > > +	DRM_FORMAT_XRGB1555,
> > > +	DRM_FORMAT_XRGB4444,
> > > +	DRM_FORMAT_XRGB8888,
> > > +};
> > > +
> > > +static inline struct dcif_dev *plane_to_dcif_dev(struct drm_plane *plane)
> > > +{
> > > +	return to_dcif_dev(plane->dev);
> > > +}
> > > +
> > > +static inline dma_addr_t drm_plane_state_to_baseaddr(struct drm_plane_state *state)
> > > +{
> > > +	struct drm_framebuffer *fb = state->fb;
> > > +	struct drm_gem_dma_object *dma_obj;
> > > +	unsigned int x = state->src.x1 >> 16;
> > > +	unsigned int y = state->src.y1 >> 16;
> > > +
> > > +	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
> > > +
> > > +	return dma_obj->dma_addr + fb->offsets[0] + fb->pitches[0] * y + fb->format->cpp[0] * x;
> > > +}
> > > +
> > > +static int dcif_plane_get_layer_id(struct drm_plane *plane)
> > > +{
> > > +	return (plane->type == DRM_PLANE_TYPE_PRIMARY) ? 0 : 1;
> > > +}
> > > +
> > > +static int dcif_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
> > > +{
> > > +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> > > +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> > > +	struct dcif_dev *dcif = plane_to_dcif_dev(plane);
> > > +	struct drm_framebuffer *fb = new_plane_state->fb;
> > > +	struct drm_framebuffer *old_fb = old_plane_state->fb;
> > > +	struct drm_crtc_state *crtc_state;
> > > +
> > > +	if (!fb)
> > > +		return 0;
> > > +
> > > +	crtc_state = drm_atomic_get_new_crtc_state(state, &dcif->crtc);
> > > +	if (WARN_ON(!crtc_state))
> > > +		return -EINVAL;
> > > +
> > > +	/*
> > > +	 * Force CRTC mode change if framebuffer stride or pixel format have changed.
> > > +	 */
> > > +	if (plane->type == DRM_PLANE_TYPE_PRIMARY && old_fb &&
> > > +	    (fb->pitches[0] != old_fb->pitches[0] || fb->format->format != old_fb->format->format))
> > > +		crtc_state->mode_changed = true;
> > > +
> > > +	return drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> > > +						   DRM_PLANE_NO_SCALING, DRM_PLANE_NO_SCALING, true,
> > > +						   true);
> > > +}
> > > +
> > > +static void dcif_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
> > > +{
> > > +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
> > > +	struct dcif_dev *dcif = plane_to_dcif_dev(plane);
> > > +	int layer_id = dcif_plane_get_layer_id(plane);
> > > +	struct drm_framebuffer *fb = new_state->fb;
> > > +	u32 crtc_x, crtc_y, crtc_h, crtc_w;
> > > +	u32 layer_fmt = 0, yuv_fmt = 0;
> > > +	dma_addr_t baseaddr;
> > > +	u32 reg;
> > > +
> > > +	if (!fb)
> > > +		return;
> > > +
> > > +	crtc_x = new_state->crtc_x;
> > > +	crtc_y = new_state->crtc_y;
> > > +	crtc_h = new_state->crtc_h;
> > > +	crtc_w = new_state->crtc_w;
> > > +
> > > +	/* visible portion of plane on crtc */
> > > +	regmap_write(dcif->regmap, DCIF_CTRLDESC1(layer_id),
> > > +		     DCIF_CTRLDESC1_POSX(crtc_x) | DCIF_CTRLDESC1_POSY(crtc_y));
> > > +	regmap_write(dcif->regmap, DCIF_CTRLDESC2(layer_id),
> > > +		     DCIF_CTRLDESC2_WIDTH(crtc_w) | DCIF_CTRLDESC2_HEIGHT(crtc_h));
> > > +
> > > +	/* pitch size */
> > > +	reg = DCIF_CTRLDESC3_P_SIZE(2) | DCIF_CTRLDESC3_T_SIZE(2) |
> > > +	      DCIF_CTRLDESC3_PITCH(fb->pitches[0]);
> > > +	regmap_write(dcif->regmap, DCIF_CTRLDESC3(layer_id), reg);
> > > +
> > > +	/*  address */
> > > +	baseaddr = drm_fb_dma_get_gem_addr(new_state->fb, new_state, 0);
> > > +
> > > +	drm_dbg_kms(plane->dev, "[PLANE:%d:%s] fb address %pad, pitch 0x%08x\n",
> > > +		    plane->base.id, plane->name, &baseaddr, fb->pitches[0]);
> > > +
> > > +	regmap_write(dcif->regmap, DCIF_CTRLDESC4(layer_id), baseaddr);
> > > +
> > > +	/* Format */
> > > +	switch (fb->format->format) {
> > > +	/* RGB Formats */
> > > +	case DRM_FORMAT_RGB565:
> > > +		layer_fmt = CTRLDESCL0_FORMAT_RGB565;
> > > +		break;
> > > +	case DRM_FORMAT_RGB888:
> > > +		layer_fmt = CTRLDESCL0_FORMAT_RGB888;
> > > +		break;
> > > +	case DRM_FORMAT_XRGB1555:
> > > +		layer_fmt = CTRLDESCL0_FORMAT_ARGB1555;
> > > +		break;
> > > +	case DRM_FORMAT_XRGB4444:
> > > +		layer_fmt = CTRLDESCL0_FORMAT_ARGB4444;
> > > +		break;
> > > +	case DRM_FORMAT_XBGR8888:
> > > +		layer_fmt = CTRLDESCL0_FORMAT_ABGR8888;
> > > +		break;
> > > +	case DRM_FORMAT_XRGB8888:
> > > +		layer_fmt = CTRLDESCL0_FORMAT_ARGB8888;
> > > +		break;
> > > +
> > > +	/* YUV Formats */
> > > +	case DRM_FORMAT_YUYV:
> > > +		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
> > > +		yuv_fmt = CTRLDESCL0_YUV_FORMAT_VY2UY1;
> > > +		break;
> > > +	case DRM_FORMAT_YVYU:
> > > +		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
> > > +		yuv_fmt = CTRLDESCL0_YUV_FORMAT_UY2VY1;
> > > +		break;
> > > +	case DRM_FORMAT_UYVY:
> > > +		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
> > > +		yuv_fmt = CTRLDESCL0_YUV_FORMAT_Y2VY1U;
> > > +		break;
> > > +	case DRM_FORMAT_VYUY:
> > > +		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
> > > +		yuv_fmt = CTRLDESCL0_YUV_FORMAT_Y2UY1V;
> > > +		break;
> > > +
> > > +	default:
> > > +		dev_err(dcif->drm.dev, "Unknown pixel format 0x%x\n", fb->format->format);
> > > +		break;
> > > +	}
> > > +
> > > +	if (plane->type == DRM_PLANE_TYPE_OVERLAY && yuv_fmt == CTRLDESCL0_YUV_FORMAT_Y2UY1V) {
> > > +		dev_err(dcif->drm.dev, "Overlay plane could not support YUV format\n");
> > > +		return;
> > > +	}
> > > +
> > > +	reg = DCIF_CTRLDESC0_EN | DCIF_CTRLDESC0_SHADOW_LOAD_EN |
> > > +	      DCIF_CTRLDESC0_FORMAT(layer_fmt) | DCIF_CTRLDESC0_YUV_FORMAT(yuv_fmt);
> > > +
> > > +	/* Alpha */
> > > +	reg |= DCIF_CTRLDESC0_GLOBAL_ALPHA(new_state->alpha >> 8) | ALPHA_GLOBAL;
> > > +
> > > +	regmap_write(dcif->regmap, DCIF_CTRLDESC0(layer_id), reg);
> > > +}
> > > +
> > > +static void dcif_overlay_plane_atomic_disable(struct drm_plane *plane,
> > > +					      struct drm_atomic_state *state)
> > > +{
> > > +	struct dcif_dev *dcif = plane_to_dcif_dev(plane);
> > > +
> > > +	regmap_update_bits(dcif->regmap, DCIF_CTRLDESC0(1),
> > > +			   DCIF_CTRLDESC0_EN | DCIF_CTRLDESC0_SHADOW_LOAD_EN,
> > > +			   DCIF_CTRLDESC0_SHADOW_LOAD_EN);
> > > +}
> > > +
> > > +static const struct drm_plane_helper_funcs dcif_primary_plane_helper_funcs = {
> > > +	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
> > > +	.atomic_check	= dcif_plane_atomic_check,
> > > +	.atomic_update	= dcif_plane_atomic_update,
> > > +};
> > > +
> > > +static const struct drm_plane_helper_funcs dcif_overlay_plane_helper_funcs = {
> > > +	.atomic_check	= dcif_plane_atomic_check,
> > > +	.atomic_update	= dcif_plane_atomic_update,
> > > +	.atomic_disable = dcif_overlay_plane_atomic_disable,
> > > +};
> > > +
> > > +static const struct drm_plane_funcs dcif_plane_funcs = {
> > > +	.update_plane		= drm_atomic_helper_update_plane,
> > > +	.disable_plane		= drm_atomic_helper_disable_plane,
> > > +	.destroy		= drm_plane_cleanup,
> > > +	.reset			= drm_atomic_helper_plane_reset,
> > > +	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
> > > +	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> > > +};
> > > +
> > > +int dcif_plane_init(struct dcif_dev *dcif)
> > > +{
> > > +	const u32 supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
> > > +					BIT(DRM_COLOR_YCBCR_BT709) |
> > > +					BIT(DRM_COLOR_YCBCR_BT2020);
> > > +	const u32 supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> > > +				     BIT(DRM_COLOR_YCBCR_FULL_RANGE);
> > > +	int ret;
> > > +
> > > +	/* primary plane */
> > > +	drm_plane_helper_add(&dcif->planes.primary, &dcif_primary_plane_helper_funcs);
> > > +	ret = drm_universal_plane_init(&dcif->drm, &dcif->planes.primary, 1, &dcif_plane_funcs,
> > > +				       dcif_primary_plane_formats,
> > > +				       ARRAY_SIZE(dcif_primary_plane_formats), NULL,
> > > +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> > > +	if (ret) {
> > > +		drm_err(&dcif->drm, "failed to initialize primary plane: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = drm_plane_create_color_properties(&dcif->planes.primary, supported_encodings,
> > > +						supported_ranges, DRM_COLOR_YCBCR_BT601,
> > > +						DRM_COLOR_YCBCR_LIMITED_RANGE);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = drm_plane_create_alpha_property(&dcif->planes.primary);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* overlay plane */
> > > +	drm_plane_helper_add(&dcif->planes.overlay, &dcif_overlay_plane_helper_funcs);
> > > +	ret = drm_universal_plane_init(&dcif->drm, &dcif->planes.overlay, 1, &dcif_plane_funcs,
> > > +				       dcif_overlay_plane_formats,
> > > +				       ARRAY_SIZE(dcif_overlay_plane_formats), NULL,
> > > +				       DRM_PLANE_TYPE_OVERLAY, NULL);
> > > +	if (ret) {
> > > +		drm_err(&dcif->drm, "failed to initialize overlay plane: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return drm_plane_create_alpha_property(&dcif->planes.overlay);
> > > +}
> > > diff --git a/drivers/gpu/drm/imx/dcif/dcif-reg.h b/drivers/gpu/drm/imx/dcif/dcif-reg.h
> > > new file mode 100644
> > > index 0000000000000..f918bbb6d2d15
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/imx/dcif/dcif-reg.h
> > > @@ -0,0 +1,266 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +
> > > +/*
> > > + * Copyright 2025 NXP
> > > + */
> > > +#ifndef __DCIF_REG_H__
> > > +#define __DCIF_REG_H__
> > > +
> > > +#include <linux/bits.h>
> > > +
> > > +/* Version ID Register */
> > > +#define DCIF_VER				0x0
> > > +#define   DCIF_VER_GET_FEATURE(x)		FIELD_GET(GENMASK(15, 0), x)
> > > +#define   DCIF_VER_GET_MINOR(x)			FIELD_GET(GENMASK(23, 16), x)
> > > +#define   DCIF_VER_GET_MAJOR(x)			FIELD_GET(GENMASK(31, 24), x)
> > > +
> > > +/* Parameter Registers */
> > > +#define DCIF_PAR_0				0x4
> > > +#define   DCIF_PAR_0_LAYER_NUM(x)		FIELD_PREP(GENMASK(3, 0), x)
> > > +#define   DCIF_PAR_0_DOMAIN_NUM(x)		FIELD_PREP(GENMASK(5, 4), x)
> > > +#define   DCIF_PAR_0_AXI_DATA_WIDTH(x)		FIELD_PREP(GENMASK(7, 6), x)
> > > +#define   DCIF_PAR_0_CLUT_RAM_NUM(x)		FIELD_PREP(GENMASK(11, 8), x)
> > > +#define   DCIF_PAR_0_CSC_NUM(x)			FIELD_PREP(GENMASK(13, 12), x)
> > > +#define   DCIF_PAR_0_CRC_REGION_NUM(x)		FIELD_PREP(GENMASK(18, 16), x)
> > > +#define   DCIF_PAR_0_BACKUP(x)			FIELD_PREP(GENMASK(31, 28), x)
> > > +
> > > +#define DCIF_PAR_1				0x8
> > > +#define   DCIF_PAR_1_LAYER0_FIFO_SIZE(x)	FIELD_PREP(GENMASK(3, 0), x)
> > > +#define   DCIF_PAR_1_LAYER1_FIFO_SIZE(x)	FIELD_PREP(GENMASK(7, 4), x)
> > > +
> > > +/* Display Control and Parameter Registers */
> > > +#define DCIF_DISP_CTRL				0x10
> > > +#define   DCIF_DISP_CTRL_DISP_ON		BIT(0)
> > > +#define   DCIF_DISP_CTRL_AXI_RD_HOLD		BIT(30)
> > > +#define   DCIF_DISP_CTRL_SW_RST			BIT(31)
> > > +#define DCIF_DISP_PAR				0x14
> > > +#define   DCIF_DISP_PAR_BGND_B(x)		FIELD_PREP(GENMASK(7, 0), x)
> > > +#define   DCIF_DISP_PAR_BGND_G(x)		FIELD_PREP(GENMASK(15, 8), x)
> > > +#define   DCIF_DISP_PAR_BGND_R(x)		FIELD_PREP(GENMASK(23, 16), x)
> > > +#define DCIF_DISP_SIZE				0x18
> > > +#define   DCIF_DISP_SIZE_DISP_WIDTH(x)		FIELD_PREP(GENMASK(11, 0), x)
> > > +#define   DCIF_DISP_SIZE_DISP_HEIGHT(x)		FIELD_PREP(GENMASK(27, 16), x)
> > > +
> > > +/* Display Status Registers */
> > > +#define DCIF_DISP_SR0				0x1C
> > > +#define   DCIF_DISP_SR0_AXI_RD_PEND(x)		FIELD_PREP(GENMASK(4, 0), x)
> > > +#define   DCIF_DISP_SR0_DPI_BUSY(x)		FIELD_PREP(GENMASK(14, 14), x)
> > > +#define   DCIF_DISP_SR0_AXI_RD_BUSY(x)		FIELD_PREP(GENMASK(15, 15), x)
> > > +#define DCIF_DISP_SR0_TXFIFO_CNT(x)		FIELD_PREP(GENMASK(23, 16), x)
> > > +
> > > +#define DCIF_DISP_SR1				0x20
> > > +#define   DCIF_DISP_SR1_H_CNT(x)		FIELD_PREP(GENMASK(11, 0), x)
> > > +#define   DCIF_DISP_SR1_V_CNT(x)		FIELD_PREP(GENMASK(27, 16), x)
> > > +
> > > +/* Interrupt Enable and Status Registers, n=0-2*/
> > > +#define DCIF_IE0(n)				(0x24 + (n) * 0x10000)
> > > +#define DCIF_IS0(n)				(0x28 + (n) * 0x10000)
> > > +#define   DCIF_INT0_VSYNC			BIT(0)
> > > +#define   DCIF_INT0_UNDERRUN			BIT(1)
> > > +#define   DCIF_INT0_VS_BLANK			BIT(2)
> > > +#define   DCIF_INT0_HIST_DONE			BIT(5)
> > > +#define   DCIF_INT0_CRC_ERR			BIT(6)
> > > +#define   DCIF_INT0_CRC_ERR_SAT			BIT(7)
> > > +
> > > +#define DCIF_IE1(n)				(0x2C + (n) * 0x10000)
> > > +#define DCIF_IS1(n)				(0x30 + (n) * 0x10000)
> > > +#define   DCIF_INT1_FIFO_PANIC0			BIT(0)
> > > +#define   DCIF_INT1_FIFO_PANIC1			BIT(1)
> > > +#define   DCIF_INT1_DMA_ERR0			BIT(8)
> > > +#define   DCIF_INT1_DMA_ERR1			BIT(9)
> > > +#define   DCIF_INT1_DMA_DONE0			BIT(16)
> > > +#define   DCIF_INT1_DMA_DONE1			BIT(17)
> > > +#define   DCIF_INT1_FIFO_EMPTY0			BIT(24)
> > > +#define   DCIF_INT1_FIFO_EMPTY1			BIT(25)
> > > +
> > > +/* DPI Control and Sync Parameter Registers */
> > > +#define DCIF_DPI_CTRL				0x40
> > > +#define   DCIF_DPI_CTRL_HSYNC_POL_LOW		BIT(0)
> > > +#define   DCIF_DPI_CTRL_VSYNC_POL_LOW		BIT(1)
> > > +#define   DCIF_DPI_CTRL_DE_POL_LOW		BIT(2)
> > > +#define   DCIF_DPI_CTRL_PCLK_EDGE_FALLING	BIT(3)
> > > +#define   DCIF_DPI_CTRL_POL_MASK		GENMASK(3, 0)
> > > +#define   DCIF_DPI_CTRL_DATA_INV(x)		FIELD_PREP(GENMASK(4, 4), x)
> > > +#define   DCIF_DPI_CTRL_DEF_BGND_EN(x)		FIELD_PREP(GENMASK(5, 5), x)
> > > +#define   DCIF_DPI_CTRL_FETCH_OPT(x)		FIELD_PREP(GENMASK(9, 8), x)
> > > +#define   DCIF_DPI_CTRL_DISP_MODE(x)		FIELD_PREP(GENMASK(13, 12), x)
> > > +#define   DCIF_DPI_CTRL_DATA_PATTERN_MASK	GENMASK(18, 16)
> > > +#define   DCIF_DPI_CTRL_DATA_PATTERN(x)		FIELD_PREP(GENMASK(18, 16), x)
> > > +#define   PATTERN_RGB888			0
> > > +#define   PATTERN_RBG888			1
> > > +#define   PATTERN_GBR888			2
> > > +#define   PATTERN_GRB888			3
> > > +#define   PATTERN_BRG888			4
> > > +#define   PATTERN_BGR888			5
> > > +#define   PATTERN_RGB555			6
> > > +#define   PATTERN_RGB565			7
> > > +
> > > +#define DCIF_DPI_HSYN_PAR			0x44
> > > +#define   DCIF_DPI_HSYN_PAR_FP_H(x)		FIELD_PREP(GENMASK(11, 0), x)
> > > +#define   DCIF_DPI_HSYN_PAR_BP_H(x)		FIELD_PREP(GENMASK(27, 16), x)
> > > +
> > > +#define DCIF_DPI_VSYN_PAR			0x48
> > > +#define   DCIF_DPI_VSYN_PAR_FP_V(x)		FIELD_PREP(GENMASK(11, 0), x)
> > > +#define   DCIF_DPI_VSYN_PAR_BP_V(x)		FIELD_PREP(GENMASK(27, 16), x)
> > > +
> > > +#define DCIF_DPI_VSYN_HSYN_WIDTH		0x4C
> > > +#define   DCIF_DPI_VSYN_HSYN_WIDTH_PW_H(x)	FIELD_PREP(GENMASK(11, 0), x)
> > > +#define   DCIF_DPI_VSYN_HSYN_WIDTH_PW_V(x)	FIELD_PREP(GENMASK(27, 16), x)
> > > +
> > > +/* Control Descriptor Registers, n=0-1*/
> > > +#define DCIF_CTRLDESC0(n)			(0x10000 + (n) * 0x10000)
> > > +#define   DCIF_CTRLDESC0_AB_MODE(x)		FIELD_PREP(GENMASK(1, 0), x)
> > > +#define   ALPHA_EMBEDDED			0
> > > +#define   ALPHA_GLOBAL				1
> > > +#define   DCIF_CTRLDESC0_YUV_FORMAT_MASK	GENMASK(15, 14)
> > > +#define   DCIF_CTRLDESC0_YUV_FORMAT(x)		FIELD_PREP(GENMASK(15, 14), x)
> > > +#define   CTRLDESCL0_YUV_FORMAT_Y2VY1U		0x0
> > > +#define   CTRLDESCL0_YUV_FORMAT_Y2UY1V		0x1
> > > +#define   CTRLDESCL0_YUV_FORMAT_VY2UY1		0x2
> > > +#define   CTRLDESCL0_YUV_FORMAT_UY2VY1		0x3
> > > +#define   DCIF_CTRLDESC0_GLOBAL_ALPHA(x)	FIELD_PREP(GENMASK(23, 16), x)
> > > +#define   DCIF_CTRLDESC0_FORMAT_MASK		GENMASK(27, 24)
> > > +#define   DCIF_CTRLDESC0_FORMAT(x)		FIELD_PREP(GENMASK(27, 24), x)
> > > +#define   CTRLDESCL0_FORMAT_RGB565		0x4
> > > +#define   CTRLDESCL0_FORMAT_ARGB1555		0x5
> > > +#define   CTRLDESCL0_FORMAT_ARGB4444		0x6
> > > +#define   CTRLDESCL0_FORMAT_YCBCR422		0x7
> > > +#define   CTRLDESCL0_FORMAT_RGB888		0x8
> > > +#define   CTRLDESCL0_FORMAT_ARGB8888		0x9
> > > +#define   CTRLDESCL0_FORMAT_ABGR8888		0xa
> > > +#define   DCIF_CTRLDESC0_SHADOW_LOAD_EN		BIT(30)
> > > +#define   DCIF_CTRLDESC0_EN			BIT(31)
> > > +
> > > +#define DCIF_CTRLDESC1(n)			(0x10004 + (n) * 0x10000)
> > > +#define   DCIF_CTRLDESC1_POSX(x)		FIELD_PREP(GENMASK(11, 0), x)
> > > +#define   DCIF_CTRLDESC1_POSY(x)		FIELD_PREP(GENMASK(27, 16), x)
> > > +
> > > +#define DCIF_CTRLDESC2(n)			(0x10008 + (n) * 0x10000)
> > > +#define   DCIF_CTRLDESC2_WIDTH(x)		FIELD_PREP(GENMASK(11, 0), x)
> > > +#define   DCIF_CTRLDESC2_HEIGHT(x)		FIELD_PREP(GENMASK(27, 16), x)
> > > +
> > > +#define DCIF_CTRLDESC3(n)			(0x1000C + (n) * 0x10000)
> > > +#define   DCIF_CTRLDESC3_PITCH(x)		FIELD_PREP(GENMASK(15, 0), x)
> > > +#define   DCIF_CTRLDESC3_T_SIZE(x)		FIELD_PREP(GENMASK(17, 16), x)
> > > +#define   DCIF_CTRLDESC3_P_SIZE(x)		FIELD_PREP(GENMASK(22, 20), x)
> > > +
> > > +#define DCIF_CTRLDESC4(n)			(0x10010 + (n) * 0x10000)
> > > +#define   DCIF_CTRLDESC4_ADDR(x)		FIELD_PREP(GENMASK(31, 0), x)
> > > +
> > > +#define DCIF_CTRLDESC5(n)			(0x10014 + (n) * 0x10000)
> > > +#define DCIF_CTRLDESC6(n)			(0x10018 + (n) * 0x10000)
> > > +#define   DCIF_CTRLDESC6_BCLR_B(x)		FIELD_PREP(GENMASK(7, 0), x)
> > > +#define   DCIF_CTRLDESC6_BCLR_G(x)		FIELD_PREP(GENMASK(15, 8), x)
> > > +#define   DCIF_CTRLDESC6_BCLR_R(x)		FIELD_PREP(GENMASK(23, 16), x)
> > > +#define   DCIF_CTRLDESC6_BCLR_A(x)		FIELD_PREP(GENMASK(31, 24), x)
> > > +
> > > +/* CLUT control Register */
> > > +#define DCIF_CLUT_CTRL				0x1003C
> > > +#define   DCIF_CLUT_CTRL_CLUT0_SEL(x)		FIELD_PREP(GENMASK(0, 0), x)
> > > +#define   DCIF_CLUT_CTRL_CLUT1_SEL(x)		FIELD_PREP(GENMASK(3, 3), x)
> > > +#define   DCIF_CLUT_CTRL_CLUT_MUX(x)		FIELD_PREP(GENMASK(29, 28), x)
> > > +#define   DCIF_CLUT_CTRL_CLUT_SHADOW_LOAD_EN(x)	FIELD_PREP(GENMASK(31, 31), x)
> > > +
> > > +/* FIFO Panic Threshold Register, n=0-1 */
> > > +#define DCIF_PANIC_THRES(n)			(0x10040 + (n) * 0x10000)
> > > +#define   DCIF_PANIC_THRES_LOW_MASK		GENMASK(11, 0)
> > > +#define   DCIF_PANIC_THRES_LOW(x)		FIELD_PREP(GENMASK(11, 00), x)
> > > +#define   DCIF_PANIC_THRES_HIGH_MASK		GENMASK(27, 16)
> > > +#define   DCIF_PANIC_THRES_HIGH(x)		FIELD_PREP(GENMASK(27, 16), x)
> > > +#define   DCIF_PANIC_THRES_REQ_EN		BIT(31)
> > > +#define   PANIC0_THRES_MAX			511
> > > +
> > > +/* Layer Status Register 0, n=0-1 */
> > > +#define DCIF_LAYER_SR0(n)			(0x10044 + (n) * 0x10000)
> > > +#define   DCIF_LAYER_SR0_L0_FIFO_CNT_MASK	GENMASK(9, 0)
> > > +#define   DCIF_LAYER_SR0_L0_FIFO_CNT(x)		FIELD_PREP(GENMASK(9, 0), x)
> > > +
> > > +/* Color Space Conversion Control and Coefficient Registers for Layer 0 */
> > > +#define DCIF_CSC_CTRL_L0			0x10050
> > > +#define   DCIF_CSC_CTRL_L0_CSC_EN		BIT(0)
> > > +#define   DCIF_CSC_CTRL_L0_CSC_MODE_YCBCR2RGB	BIT(1)
> > > +
> > > +#define DCIF_CSC_COEF0_L0			0x10054
> > > +#define   DCIF_CSC_COEF0_L0_A1(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> > > +#define   DCIF_CSC_COEF0_L0_A2(x)		FIELD_PREP_CONST(GENMASK(26, 16), x)
> > > +
> > > +#define DCIF_CSC_COEF1_L0			0x10058
> > > +#define   DCIF_CSC_COEF1_L0_A3(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> > > +#define   DCIF_CSC_COEF1_L0_B1(x)		FIELD_PREP_CONST(GENMASK(26, 16), x)
> > > +
> > > +#define DCIF_CSC_COEF2_L0			0x1005C
> > > +#define   DCIF_CSC_COEF2_L0_B2(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> > > +#define   DCIF_CSC_COEF2_L0_B3(x)		FIELD_PREP_CONST(GENMASK(26, 16), x)
> > > +
> > > +#define DCIF_CSC_COEF3_L0			0x10060
> > > +#define   DCIF_CSC_COEF3_L0_C1(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> > > +#define   DCIF_CSC_COEF3_L0_C2(x)		FIELD_PREP_CONST(GENMASK(26, 16), x)
> > > +
> > > +#define DCIF_CSC_COEF4_L0			0x10064
> > > +#define   DCIF_CSC_COEF4_L0_C3(x)		FIELD_PREP_CONST(GENMASK(10, 0), x)
> > > +#define   DCIF_CSC_COEF4_L0_D1(x)		FIELD_PREP_CONST(GENMASK(24, 16), x)
> > > +
> > > +#define DCIF_CSC_COEF5_L0			0x10068
> > > +#define   DCIF_CSC_COEF5_L0_D2(x)		FIELD_PREP_CONST(GENMASK(8, 0), x)
> > > +#define   DCIF_CSC_COEF5_L0_D3(x)		FIELD_PREP_CONST(GENMASK(24, 16), x)
> > > +
> > > +/* CRC Control, Threshold, and Histogram Coefficient Registers */
> > > +#define DCIF_CRC_CTRL				0x20100
> > > +#define   DCIF_CRC_CTRL_CRC_EN(x)		(1 << (x))
> > > +#define   DCIF_CRC_CTRL_HIST_REGION_SEL(x)	FIELD_PREP(GENMASK(17, 16), x)
> > > +#define   DCIF_CRC_CTRL_HIST_MODE		BIT(21)
> > > +#define   DCIF_CRC_CTRL_HIST_TRIG		BIT(22)
> > > +#define   DCIF_CRC_CTRL_HIST_EN			BIT(23)
> > > +#define   DCIF_CRC_CTRL_CRC_MODE		BIT(28)
> > > +#define   DCIF_CRC_CTRL_CRC_TRIG		BIT(29)
> > > +#define   DCIF_CRC_CTRL_CRC_ERR_CNT_RST		BIT(30)
> > > +#define   DCIF_CRC_CTRL_CRC_SHADOW_LOAD_EN	BIT(31)
> > > +
> > > +#define DCIF_CRC_THRES				0x20104
> > > +#define   DCIF_CRC_THRES_CRC_THRESHOLD_MASK	GENMASK(31, 0)
> > > +#define   DCIF_CRC_THRES_CRC_THRESHOLD(x)	FIELD_PREP(GENMASK(31, 0), x)
> > > +
> > > +#define DCIF_CRC_HIST_COEF			0x20108
> > > +#define   DCIF_CRC_HIST_COEF_HIST_WB_MASK	GENMASK(7, 0)
> > > +#define   DCIF_CRC_HIST_COEF_HIST_WB(x)		FIELD_PREP(GENMASK(7, 0), x)
> > > +#define   DCIF_CRC_HIST_COEF_HIST_WG_MASK	GENMASK(15, 8)
> > > +#define   DCIF_CRC_HIST_COEF_HIST_WG(x)		FIELD_PREP(GENMASK(15, 8), x)
> > > +#define   DCIF_CRC_HIST_COEF_HIST_WR_MASK	GENMASK(23, 16)
> > > +#define   DCIF_CRC_HIST_COEF_HIST_WR(x)		FIELD_PREP(GENMASK(23, 16), x)
> > > +
> > > +#define DCIF_CRC_ERR_CNT			0x2010C
> > > +#define   DCIF_CRC_ERR_CNT_CRC_ERR_CNT_MASK	GENMASK(31, 0)
> > > +#define   DCIF_CRC_ERR_CNT_CRC_ERR_CNT(x)	FIELD_PREP(GENMASK(31, 0), x)
> > > +
> > > +#define DCIF_CRC_SR				0x20110
> > > +#define   DCIF_CRC_SR_HIST_CNT_SAT_MASK		BIT(13)
> > > +#define   DCIF_CRC_SR_HIST_CNT_SAT(x)		FIELD_PREP(GENMASK(13, 13), x)
> > > +#define   DCIF_CRC_SR_HIST_SAT_MASK		BIT(14)
> > > +#define   DCIF_CRC_SR_HIST_SAT(x)		FIELD_PREP(GENMASK(14, 14), x)
> > > +#define   DCIF_CRC_SR_HIST_BUSY_MASK		BIT(15)
> > > +#define   DCIF_CRC_SR_HIST_BUSY(x)		FIELD_PREP(GENMASK(15, 15), x)
> > > +#define   DCIF_CRC_SR_CRC_STATUS_MASK		BIT(31)
> > > +#define   DCIF_CRC_SR_CRC_STATUS(x)		FIELD_PREP(GENMASK(31, 31), x)
> > > +
> > > +#define DCIF_CRC_HIST_CNT_B(n)			(0x20114 + (n) * 4)
> > > +#define   DCIF_B_BIN_CNT_MASK			GENMASK(20, 0)
> > > +#define   DCIF_B_BIN_CNT(x)			FIELD_PREP(GENMASK(20, 0), x)
> > > +
> > > +/* CRC Region Position, Size, Value, and Expected Value Registers, n=0-3 */
> > > +#define DCIF_CRC_POS_R(n)			(0x20214 + (n) * 0x10)
> > > +#define   DCIF_CRC_POS_CRC_HOR_POS(x)		FIELD_PREP(GENMASK(11, 0), x)
> > > +#define   DCIF_CRC_POS_CRC_VER_POS(x)		FIELD_PREP(GENMASK(27, 16), x)
> > > +
> > > +#define DCIF_CRC_SIZE_R(n)			(0x20218 + (n) * 0x10)
> > > +#define   DCIF_CRC_SIZE_CRC_HOR_SIZE(x)		FIELD_PREP(GENMASK(11, 0), x)
> > > +#define   DCIF_CRC_SIZE_CRC_VER_SIZE(x)		FIELD_PREP(GENMASK(27, 16), x)
> > > +
> > > +#define DCIF_CRC_VAL_R(n)			(0x2021C + (n) * 0x10)
> > > +#define   DCIF_CRC_VAL_CRC_VAL_MASK		GENMASK(31, 0)
> > > +#define   DCIF_CRC_VAL_CRC_VAL(x)		FIELD_PREP(GENMASK(31, 0), x)
> > > +
> > > +#define DCIF_CRC_EXP_VAL_R(n)			(0x20220 + (n) * 0x10)
> > > +#define   DCIF_CRC_EXP_VAL_CRC_EXP_VAL_MASK	GENMASK(31, 0)
> > > +#define   DCIF_CRC_EXP_VAL_CRC_EXP_VAL(x)	FIELD_PREP(GENMASK(31, 0), x)
> > > +
> > > +#endif /* __DCIF_REG_H__ */
> > > --
> > > 2.49.0
> > >
