Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05969A9531
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 02:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA0010E133;
	Tue, 22 Oct 2024 00:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="GzPDasW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011033.outbound.protection.outlook.com [52.101.125.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED8510E133
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 00:53:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNWmMCbLyFn+ryrsWOLSm277Jx/jNBmrc39ug2XwdnQ37+VyNgz+71yF/ZmHIkPQuKgthCx/XpUL4HFwxtqO6d2RtcBhMw/KZnmjI9zqNpxDHWY2R+Q7wc8c7eDT1Shz6fLH+3BiWLSD5Gnaih3I1VvWmsbVibmUWBHOtc527LfToRdWvoKXgsycBWekq8Y0B5jrkkHkfoNUhalQHqkmtim9whsMJ50pg2iBD2yj3yRJY0zGx9qoItYUyv1x4kdhzvuwl/rZT8quWOGomJ0wk/Pf4udVLo9GcbjJdSUEVJswrd9aOVn7cCWGtrUbTgWxcdeiGA8DMvpx82v5NqSIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QAbNwFxbMGZ+CBBAvHztvOlsBI20cI+mO2/lSVIfMQ=;
 b=VbEGZpx2ZuD3RE+2hemkIpFe7vD5wQ1yc5gllO+4IOWnZj5vQZy1LwZTX4mwRVF+crsDbaVYwu576LmarUIg3VwaodfnHK8qGeXg3mwQqTJdj7dALeWrmFiOTQkE+RliNwkoc5Z2iqJMXzBNoFv8TgrAPy77+lJlhEdTgsnUs8Go7sbNvgA8XZOav37vmKxmHPVi5TJCgGDe2lcYBkR6qMGpiQG90c0VQw9+ygdj+r6xTj9+bz4TCndbaGMO9dD42iSXQhaEC4IsohKapdXn/n7A9N8ihSeyli7i9mUNmGh/sKjtiFfFCc5yqO0zrQStts2oTfGTKnq7sJDrMppjWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QAbNwFxbMGZ+CBBAvHztvOlsBI20cI+mO2/lSVIfMQ=;
 b=GzPDasW2hk/5EDdoJNqRV+MzZFBJu3erOasJH8PV3/w7iHqvCmu4zrnMONFa35kCnea9LawjlulmGPhATipQth65ddR7aXwGalhlJ8aIZY601AbLeFyoZTDyYnXPge3FSJBcRmVBE3mUigrTKX8vrkmv0wtZLBSwjFj8uNQiH6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5863.jpnprd01.prod.outlook.com
 (2603:1096:604:c6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Tue, 22 Oct
 2024 00:53:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 00:53:27 +0000
Message-ID: <87a5exot4p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/9] of: property: add of_graph_get_next_port()
In-Reply-To: <ZxYiD5CCzcrwbD1o@valkosipuli.retiisi.eu>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
 <87v7y2rqwf.wl-kuninori.morimoto.gx@renesas.com>
 <ZxYiD5CCzcrwbD1o@valkosipuli.retiisi.eu>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 22 Oct 2024 00:53:26 +0000
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: f15389b9-47bf-4161-680d-08dcf233f04c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9rB2HBjn+6FBvWkqOO3uDP9bdUKNcH4enaPubUyJ5iWZcZm47JhCiSoCSV3C?=
 =?us-ascii?Q?2JjcVrfTRgNs2ApACGrIZQXJdqv0bPAlvpeStghyhHkcklFQD8HnSKuF6Q4A?=
 =?us-ascii?Q?hcOYCbEWxvakwZWO01jp73cBxklxXLAGU90umkF7cUArkt0y/7nqrrtMeAcQ?=
 =?us-ascii?Q?79TiW+cb4o9OgBdPCefNhvA3WgIh88e0NbFeYDAjVkFORc1U7YCaT0GHWtBY?=
 =?us-ascii?Q?3k3d+ZlFo0O1KUToDqmdrQucOSBx1Kba0svksqIl4MluRwQ7ZGZFLMvC+oCx?=
 =?us-ascii?Q?wdkNyGOP2Ti3ds2K5ocm3cW8NUPgns6WNpzWdGo3XzlmA9JkgaOmPrM57Gk5?=
 =?us-ascii?Q?NP1rmTfrXluHdCBsS1kvzHJ7mCe2BoCdQQwB/u5qfvTCzxbBvE1OlcQ/OuzF?=
 =?us-ascii?Q?ceFa/7Jjt1PVpat4Tjpq2ww7Ept6d/FNS4tVs1GZ2CvQ1sjUroD6Zdf/3aH6?=
 =?us-ascii?Q?AYuxCmTe6qvpicyg9adzNj6ItoZ+uekvWOergNyNj2dSmTlQcu979XiRYnJB?=
 =?us-ascii?Q?iWwP8HhEUYhiwofr/bm3vSt0fN04t/qBkaIXx6n+q8eFCayOdJx/RnlvmFD0?=
 =?us-ascii?Q?D3wEiKVPJ7nF7jyO4XHguYjKz3qezu2Ku/xUcbSQkPiVBSnsAWBQ4GpmJ1ka?=
 =?us-ascii?Q?H4RCRE7uUl3AjoIFgWrAwdqgkfCHnyKRMBG22eEKxVRR4CO2T+oLA3wxrBgg?=
 =?us-ascii?Q?USBw3QA6srTdQZF+nPHjhMBNrY6HVcmtMx2DZMEYw4LzlnLRfjnMtDJThkip?=
 =?us-ascii?Q?CeJFBvU52Uq8KW7V499INLS+sBIcXv8DD2cPPq4zt7q2grVe4Zw/V4DtLeas?=
 =?us-ascii?Q?fJIVedCxuYbX2RsTTiYKx4S6Ko5PhkWIGHM609vYHda51deLuGYtxlVzaRbA?=
 =?us-ascii?Q?xtUZdiB88pncuV8AFiGd1cOhxoo0ASRyEl17nalWvZV4mFmgFs5qUtg1wyn9?=
 =?us-ascii?Q?248GCFK6IKY1yvZvhwNqcABggki72IZT/Kc7xx+NdvNVfYaV7+6QqlNTWM7j?=
 =?us-ascii?Q?vxGxjWvNViQn7SNBSih/8NudBajXAnNIz18qcXa9YReEHb+0MAuoFnfTa7Ug?=
 =?us-ascii?Q?r7LackEz3d1LZcyrTH1vlSRcZ480gYqUF+vYop+KBWCcstpXcDBueQdm/Mmh?=
 =?us-ascii?Q?4MspU8P+wliH5RrTprYtwqb8CkXs+6E0WComfmntRedazUbg8iy6X0Qljo0d?=
 =?us-ascii?Q?gdIO+SGT/oL0We1Dcx/hBjUceIO6zh2fpAke04UO8jHaLSwwArQb8PdzkZaE?=
 =?us-ascii?Q?8T4ugpklExejzBjOX0aJQhrWPp+FqAbmlKU+3KbBDRz0/Bd6sx+f6X5+5KP1?=
 =?us-ascii?Q?GNoM1B2hghCBePpmcBKErYKZyZCzJuf9e4lLL0VX5YgTTmF4s5QcMmcdZzQq?=
 =?us-ascii?Q?/u8/NFA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9jlFSqdW39FGTQHpJrXbkJ5IZ7AMiwM2wRqDqSO6e3ib/4wETJB66hxr01wh?=
 =?us-ascii?Q?gEk99WwQAscbWYn+WURLZ7beUsjk9vDUcViGyZziUydTxkbhrO0UFEr5Rwgs?=
 =?us-ascii?Q?rPBradNZWqlFUI99LKyvSh9e8OMPEcPShWaR5WRhtNG4fxFgDSvdQB3Cd41p?=
 =?us-ascii?Q?50ISXeiFnR230aeXmbD6SriYR6LwJeZadPzGs/SVBtwHXPzUjd8HbrMwTiCb?=
 =?us-ascii?Q?tZ2zZlFLBsvEROCdOYsM6KLiCZETad+SLB2QOcm2VQ8hNabwSZlWbU9i57N0?=
 =?us-ascii?Q?IuxaRcAfMmChub5qBmWKh/Bj5VCbDN4x+nO4pf5K2Zr/ahxdc32ocKKkkfAm?=
 =?us-ascii?Q?yPWVNzbEW7WtKqUXJGAo0tNTRQuJXtdQBiyhKxRWrVC7MxfkxspiIqVEkdSa?=
 =?us-ascii?Q?EsSRXJTY8gZS/dPWovlcvWRXie5x45P/LXvwepCSrFXUH3vXzY9J2lgU40oi?=
 =?us-ascii?Q?7/HdCS+dxY7vCaXWA2NuH/CTi37aZxIXFZ4TaXP06UZAJZ+JYAEbDEOt7c88?=
 =?us-ascii?Q?7xwfyczRGYuMXdHrinI1FCKX/5c0J+Y0ZAd89GDE3XbDLWomVa5fWWsqqMrs?=
 =?us-ascii?Q?J42UIZMNLbRCgajMUaxMxnWPVC4YvT8zfLITvCK8kuk/blMJpbT+o0KuC2yp?=
 =?us-ascii?Q?bElJGkYyhEdR9QMDe5pvuP33Pn+YicRAoDVZb1sYPBSaTGo+C1IzlaOyEWRQ?=
 =?us-ascii?Q?aNsBDPInYVnrAjnd3aKGDK8Dp6Kr+EFwPftrqXwFXsJgcogq/ZWYqZdfg+Fm?=
 =?us-ascii?Q?K5upsW3Ni8RyYZwI5M6fs4UY5SPBp5O9etjBz7rQcOujzUjrLhohKHhOTdFt?=
 =?us-ascii?Q?O+sVZO4xBkdTOgnwg2ppKBX5qcBqIB071JkeKPUpCo3G+9XpHhT92eOeawWX?=
 =?us-ascii?Q?40twM7sFB2nVVlwx73dO6ykJwXPPLxY7sG+XWfc3KBJ+Us3lZO6ejxwu+Old?=
 =?us-ascii?Q?/AxAmB3sUYuMCcNcfmddn2cqdK34Q9oXeYK9zZqur/alWvaeBI18RIV6ZbwQ?=
 =?us-ascii?Q?QujXTBmYjcg6dRylJ6hk/QOsmwAFd4Wu2t54F8uWsHBOLFpPbLJBzOCylhhf?=
 =?us-ascii?Q?m/S5T0qCauWfTPah67p8zWsHnIzATd8qT9QDZA4OW+yhqAO62Rs6Z2f/36f7?=
 =?us-ascii?Q?Rla2gjM+Rci9Szq57ZQslTXe7F0BhG5j6T9TZtAq3Nn46jJXpvVmNo8MiKNz?=
 =?us-ascii?Q?78+t/zSl2+2xdXX+rGtv0zkDYd8px0VJTbxPLmKb9LxU5LGq+ClXyr6ftVXZ?=
 =?us-ascii?Q?cN47nXSmhykx/qp+QbPtzzlTL8aP5Rrkuc90LHw2XCb7D3bAbA14bYHI2mCz?=
 =?us-ascii?Q?9O9vTHj/+vBdFubH7HqC2aU3SvD9l6q7IEk7AxYoER+NhNnsDqZohQjvzmaQ?=
 =?us-ascii?Q?rqITR7slT+OAaDiGPoXW9QOL9EhPKBhpIPHFIluvNI0l1FLwVLmUwx+EtsI5?=
 =?us-ascii?Q?790VjG3c6IYYq1sioG0qaeL+MxB//AtZK9l9TjGXt5Ke300H98QJ+LZjWPsm?=
 =?us-ascii?Q?N1lkK5kScBGtnoWONGSv+bKa5ayKUOoHvuoiFn5N05xSpNEomvw1oHfLtdpo?=
 =?us-ascii?Q?Te/oSF4NF8ZDJyYhcfU5xftd4ZjN5BsE5DWU4QOl2DJ9pMVGN4HQo7h1j81C?=
 =?us-ascii?Q?IVrdCmc36wQ/yze+/uLOgFU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15389b9-47bf-4161-680d-08dcf233f04c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 00:53:26.9870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJVDK6hVNTAhrkmFLC+EZC6kW4xe3xcPOFoy7cTLy/S0OoMAr1lKfACV/dyJeoPf860y/JNWoy9SXOXaoN3nzKy1PMIaoqJUhhYvMkJ9ZrwMybReuZrdadE8F40789yF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5863
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


Hi Sakari, Rob

> > +/**
> > + * of_graph_get_next_port() - get next port node.
> > + * @parent: pointer to the parent device node, or parent ports node
> > + * @prev: previous port node, or NULL to get first
> > + *
> > + * Parent device node can be used as @parent whether device node has ports node or not.
> 
> This line should be wrapped, no reason to have it longer than 80 chars.
> 
> Maybe this could be done while applying?

Thank you for pointing it, Sakari.

Rob, I think it is under your queue already (?)
I can post v8 patch-set, but what is the best way for you ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
