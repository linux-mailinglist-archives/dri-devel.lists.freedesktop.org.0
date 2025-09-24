Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE797B9A529
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 16:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E334710E73C;
	Wed, 24 Sep 2025 14:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="chJSUAaT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9871E10E73C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 14:46:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UN0qjMPQyqW5NSyJSN+u1bIs3SJlAKwjYtrkuBtRscEkCrbGYMX765ZwZCz13uX1or7+vnNUtndN5icmRxiVhegJ8grq7PrYdZp0sWIp9C+iam8kI6b5l2aU19oN0xdhYXVw4dTRWSL0RPW76pyRUOoi6pMCbWR9EbFfACD5vfsOfmYTWuR8fZsubfLswxz4Swb3SRb03A3++SLawSOkv6JNOxpggOypvWLwFCM1Mnnnoym9VPEfx6QqwuDGxWmuaLontMe/D9PlTJXjcyLFB7B1f5m9mlWFP9aF9M5MecDyhJvOOcCsXhyOeGFFlFRvFSuCpD2KiEr2BIEl/RGeuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXSpbhwLUDDkDaRiWjoicUT5N2T/HZgomzMDNR8yQLI=;
 b=SxMnx1sAxgmlJcI/fp0NFZX6ftMRt3lBa3Y1hU13UrVCKQ/+SOL9e7Iu8OJ0LaA/Wah8aPBPU+64v6inFwwYUA5DW7kjkhEe5YLnbxhja61p4KNuy8uobdSjK96wIdk94rEcM4Aekhrm2tm5e9YStTbDtF0euTfuYBlPsnXX5E/vI1Srp0/wuUEbWPmeYOlnhK/r7+z7H8zMWb5O847FUA5C9aOyXAlx99f2yyzspc8S8sN06ueZ/B5Xx+7LSoRtDpKC4aX3TVuOY86IlMS01VimSXRIrIzVw/W91/ZTgKRzAY4ZSres7TxK7e7fayxmfq/TLlW92hpDqQyFDwwpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXSpbhwLUDDkDaRiWjoicUT5N2T/HZgomzMDNR8yQLI=;
 b=chJSUAaTOSl4/ledBqap/br5sKGp0zD8s+dYXiwJ4/5ZL1QITiQzEGUzEA9XdLJi52mEGgKZLQBCuQUeApxODl38wsKAjFaFpDomDOmCcs9phKkzkbe8EIgkTdvcEgvffDnvnL4pjWjATKkB7ILnS3MUQBdCYIq7ctSE+Uiq/Gm5TsBicFblal871CbPbKvKE8SpBkIcQnzjpK4q95St79ni1tgu9kCaxZtUG9SUiEmgJYMzdQxz2uwYSzeVrHA2vM45OgmKtH5cmf/YPluktpdPtv6kh2M4u7QEEg68YATnDOx9B3rx9LFXFkxIAD/HGuofyAC12HQsxrpake29fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM9PR04MB8522.eurprd04.prod.outlook.com (2603:10a6:20b:431::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 14:46:10 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 14:46:09 +0000
Date: Wed, 24 Sep 2025 10:46:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Johan Hovold <johan@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/imx: drop unused module aliases
Message-ID: <aNQEKc+7500FA/dj@lizhi-Precision-Tower-5810>
References: <20250924092643.26113-1-johan@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924092643.26113-1-johan@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0200.namprd05.prod.outlook.com
 (2603:10b6:a03:330::25) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM9PR04MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: d18fb006-89fa-4a23-429e-08ddfb7919a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zMaD0zgPcQccc3K6W+Ep+L9ZXZiTfxI8ztAXnlb7CCvTS4uP0J2U1i2l/vRF?=
 =?us-ascii?Q?mrFK1+bL5TcCABQ8upYlRzf/D5LqgzLhhlkTbK965lS0R7a7WisxT57us420?=
 =?us-ascii?Q?AAh0h6Xh+hNM32jZzLdXmuJv0JiLp2OR0Aui0OhYlc4/xokCInhZPxkr2rCu?=
 =?us-ascii?Q?OYog5QXlz0ZSVp8m4Jvct/LOxpXlqrVZos8dkx3g5+l2bBEMTWGGwXYhaU2B?=
 =?us-ascii?Q?9p76dq3dBpUPZuTPiu75msh76upmX0SRYtE3D735gCBdo3+2ZznT1TyPVmr/?=
 =?us-ascii?Q?sm6Z7zukZ5wmEnj0Cf5aB2nVBuMKtNOVXjc+cH+sUj1hGkJIcqoX3dy4A24A?=
 =?us-ascii?Q?Tq9tbilxmsA67jG0womZVIXNV0l318qTVCygPTIS6IuyeWBs8/w9BkfS3DXF?=
 =?us-ascii?Q?ay+Wh+E7u/y8Y7bITXr/HCNK6k/U5mtLiqZjxYT05KHQdtTYV8F7tlwwkifE?=
 =?us-ascii?Q?c7lJifS8sVLR1HUqOv1qOnpn79HbfDeC8m1bR37le/8C4XkmWand0PS4C9ZN?=
 =?us-ascii?Q?3WSF36+cOkyviYbkH3SlTBucOe9priLMIihLxwbnXBW5a63Wkc4c7DGFT+M3?=
 =?us-ascii?Q?aNU6IQUnOwTH050EkDQ6B85VEy3eyKz8FWwSVrRS41Mbl3t17r76pO3EEC6m?=
 =?us-ascii?Q?B+yx2lwr4TEIR+y2fvEZE+joFk2zaVtSGEogVwElDSYhmNb4IXxN/jQRfBNZ?=
 =?us-ascii?Q?M1SSkZCTBYShrb/CL8f+O6rsvWbGqyuNKWs+SOu5mmnwKPOrOwSKDoZZkCEO?=
 =?us-ascii?Q?9uz0JcKIvKAQfIiibXFTcHFsfiRfMj4ypJEmbNi+9D3NOXYlXzIHYHviodTs?=
 =?us-ascii?Q?ctyrnFC8GvhMyprDziU/BkFiImKB6pefUZFMHpfVeanamZguRUHRF+i/QfPJ?=
 =?us-ascii?Q?MkdT+pe7Gpoe4qBrI45rxR86gP00Gdh4jxS1S9nXU8G6J2ZKy+GwGMo8+GLr?=
 =?us-ascii?Q?bxOrnN4vjq86d1iF8teJpxeHhuYgnQ66b/oZlzlS5mOF6Qw2lN9QiRnn2M1E?=
 =?us-ascii?Q?r3WAMllEU8HbJCSgdNw1NH9obJxjYupu5Q6bPzsMofGVBDXXjRhtL1y9I1G7?=
 =?us-ascii?Q?1SMKH5yLT0FAIYBMTM6jMa9Y6VifMpZ5wmV9/qGXDqLD5SC3HbBf0yGPfVSO?=
 =?us-ascii?Q?qWcdQbYIOrgxqfWFXv98HSlWWNpw9JeZyJ6pJib3SqIekiI4ninebELRlhel?=
 =?us-ascii?Q?L5GsmW8WTeSBdfRBgCHs+BXAYj8j48GzLpMHY/jLcwOI+981Ncu/mJkSBaG9?=
 =?us-ascii?Q?IMDtHeybtHy740ugu5BJ2f9NLeAESaXP/ied9rJIeJ01H/X4iHZA3qBLQ6HV?=
 =?us-ascii?Q?fgO12W6W+6GY4kB0Qf6ISZxop2Nrqp8TY7PI3otKERFoFw4XbCsaF76JXpIE?=
 =?us-ascii?Q?4R0xTvv1GU+5rkVLnOT5+lZcIgXPgcYdGor0fYGJ44PykLlA1WcI/hUGxvPl?=
 =?us-ascii?Q?7calRKpjYS6hUhEKHly0jEP28dp7uqPviQy8INpqfsIG5VDeV9lS8Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tyDZ4j/eK46z/sWMENq8LowLOYHhCYC734LGtN1zZtx7MktrpY8m1AssSa8H?=
 =?us-ascii?Q?2HD0pexBY7uVwMmOUSF7ar43Ug0bv27HZP/R6ahEbUMTSR5Lf2pwNkJ9bK7k?=
 =?us-ascii?Q?bdz7YZu9uYo4fO5sCz09epOWcochcrbHvFSqY138SDpD1v5Kx8WeGr0NoPgi?=
 =?us-ascii?Q?cv+CxXdC+4WfzHfH5xZpux6NFUVwqBuJ2fD4o5DPYurQsgtd0tS9wZTkbLZI?=
 =?us-ascii?Q?5GVMPu2kCnixBh+x7c3nzDkvE9sj1YrdBdBu2Y8rilwJ7FlPmF6QvkfxgbMy?=
 =?us-ascii?Q?41O2tQXFJdHiMqoUUaAV99eecX6mcLS22iCLSotiKqAMmDUDo/yjZoPEbRbI?=
 =?us-ascii?Q?McM2/gIZ1l5SoG1NZUpUaLAZcRxXOj6QtFYSvi/RG99MuuQidGJFqI9E9QGz?=
 =?us-ascii?Q?l2s3wmhFvyjFASLtVbkkbgSX844n+ht5QFA+r995whJOd4+56T8dgMh183Vn?=
 =?us-ascii?Q?M/hpDXtvoHy2WEprusPGSLHHvdLtSHz/XCg95lRdMeNYMSUZM6F0QpKW5+Qd?=
 =?us-ascii?Q?JEu8usxRRfD8LvgtLnYcEQskQXDStNhhUm6BfbjZQzTdBp4SO1b+Tz8X30/a?=
 =?us-ascii?Q?WCGQEp0Ui1iBWVTtMlnFhxDgfUeV4k0wr2/zr/KsIrsiXL8INNbx81MJqFRX?=
 =?us-ascii?Q?lxW4mHsfJJQmiZCgLjPgND+/gQys7hD88OqWvc+1O0Y+oEmrrtc/Fil6Gofd?=
 =?us-ascii?Q?EkGW0KD5XmsMNtWqY1Qz5a3Q0HXPVi+nmuL3B18pNCAqvhi2Uf0xCgE5sYah?=
 =?us-ascii?Q?cxqkCDKRVDrhgsYzEt+m5I5AS9Ra+pn6CmQtk/Wm7oIgg/QLrmJF3jA6m99b?=
 =?us-ascii?Q?tpieU17RIs7299kgdBIxOL6ry7wJpEC4Iqz6qDuyvjb1Mil2K3/46XPmlXc3?=
 =?us-ascii?Q?yCp6ga4aNs4GXRachESPdXmYexg4n3lA3pdTxCWjbW+k3uap8ku8WoZmyjZr?=
 =?us-ascii?Q?UR7L47riwtOJ/RRSyNUXMpr3XnU1ddxys+NAW22CW9AO8jtB7KFYdbJQOxrl?=
 =?us-ascii?Q?VfYPD5VcmRHQGGe+xFA9OskzIM6Z4n6ow93Ph9a83lvqzsq+/9eoOHY+4WDJ?=
 =?us-ascii?Q?KXKy2yPqfbpx/3jMNrGhDNEhp+v4xPW2ckVzOMlbaYEF86r/+nUC1NTheVjU?=
 =?us-ascii?Q?6Eq5mhJb0cjBgIKdrw7I9dKYSZOWiAe1iHSlsm5RmT2spY8TjhNvDuH1dt0s?=
 =?us-ascii?Q?U0qCP4n9F/Qn6QkGKcF2HpT7oNA5FyABKVwCNiXM+9OWhZk7nxou/+edOh3T?=
 =?us-ascii?Q?Ii6Oy+q6xlShZjhpDtVnYb1McSP2Lbn1XXrkQqZQSQjA2lbgXbM9zwbxBw4r?=
 =?us-ascii?Q?Q7qYxDBgrEBWmvIOH5m2Dgs/jhcMUn0x1kn55wDrQlDaD6GdjnZMzin23H1r?=
 =?us-ascii?Q?6ZN+0CnwYJrDZ1vQDX1nAD3/StB0we1aOCCxNpOH24Uzq/PsVq4qQm36Yy6H?=
 =?us-ascii?Q?aci532bZ2ASSFnm5x8qWjcq02ryneoj6eFXf5ud/uaUyeKKJEI1xPCb8Tc8Y?=
 =?us-ascii?Q?tTWJyoBjHetjXN2XOn6LiK+qu4FE3Ol2rigH29HjN35Bp/fgyNYTpRITtkEK?=
 =?us-ascii?Q?mY2yL1fxLQYrulHEIu9Ecami1KIg5Gyxm8slGHp/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18fb006-89fa-4a23-429e-08ddfb7919a6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 14:46:09.9051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/JpA8ZA54/KMoSm4Cc52dhklhPfKRGgmsBA+6Le9Ko6GbCH8Y+NqzVTLU647HyjIWgg3JKgf7eDhxZPtLAShw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8522
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

On Wed, Sep 24, 2025 at 11:26:39AM +0200, Johan Hovold wrote:
> When fixing up a device reference leak in the tve drivers I noticed it
> had an unused platform alias. This series drops unused aliases from the
> imx drm drivers.
>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Johan
>
>
> Johan Hovold (4):
>   drm/imx/dw-hdmi: drop unused module alias
>   drm/imx/ldb: drop unused module alias
>   drm/imx/tve: drop unused module alias
>   drm/imx/parallel-display: drop unused module alias
>
>  drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c      | 1 -
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c          | 1 -
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c          | 1 -
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c | 1 -
>  4 files changed, 4 deletions(-)
>
> --
> 2.49.1
>
