Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BAD8D5660
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 01:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B149812BB79;
	Thu, 30 May 2024 23:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="kiOzTsXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2069.outbound.protection.outlook.com [40.107.114.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AB712BB79
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 23:42:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jp0IXTKi5oFpM12JCrUUmHjsC1WsQzDuXdul6iTo24sC7RPeW7uLthaGonZ/LmvQbYtvXTqRflNLRGOVF+SmiX/US27Xq0gEQ32CSAZ+oxUH3L6JoXs5xqEj6M0hal2MO8Bgdczh+jVNOJzMhtak5DD7NPSFDEqYeaxB2FI956QZbHYij5XxyLUISSClcFlEnGk+9GCeoqYXxPTjiw1naOxx9c9aC6SP76IsQ/xs8JDIXDKLbUbv3xzQ1Vsg8K/NU7vLA7gam/o3XLgqrPGS1vvR+Xhn5D/NA9etLUGaiIIlHpmdb6TpmKy2/9ntGe3CPcujwHKB5oUmVcmXYtHzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOIX+hcKVLYyys99qEEk/1GB6W32WGeCT8a/pXU8O+o=;
 b=VTBhuX/GNsqFIv5jxVJeIWT4aMqT5RD6sDzxFGUl4vrlHlYydGBq/S1Ipx58pKxw3AlTVUCWyWMIGiytQTXh2EIoA/h0607Q3n0m+D2iTXOdVdRPu4njsGoZTkckgjEvyW1ndVdQg59vXc1+THc6IkqAfP8N02I7FdeNCeq3311mIyN2mhRbNhG2r3hHRBeQNetendr24826huFQ7Uinxvq2qviPAAH1vSlrQ5LK3IeeZ2R4qicqKFZTI0zOqXLfAQwYM+ObhEHkv3f1ojyCaZaO8YuidvY9+7brtOGYw+/7EH/LLMxAcHTcXkA6oT+e7N80mpa/KjhJTmHq3yg74A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOIX+hcKVLYyys99qEEk/1GB6W32WGeCT8a/pXU8O+o=;
 b=kiOzTsXuoK+r7IzVfJbbUIvcvmUP4Jy7nuiJVxre6favUEQfeTQ0SzdwdqX61/VFEyy7fdBK2EFsRpqRZfd5ybBF8RZ5kiDxk2wUMHLF640Xf3jm8xAMFvD7CMIGs7GDLiq8PMHFC+4i5DOxWsoFA31JLVcimAzgQQfmBjsZlCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5523.jpnprd01.prod.outlook.com
 (2603:1096:604:af::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Thu, 30 May
 2024 23:41:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.021; Thu, 30 May 2024
 23:41:55 +0000
Message-ID: <87ttie98ak.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lad Prabhakar <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 7/9] staging: media: atmel: use
 for_each_endpoint_of_node()
In-Reply-To: <f0f1b989-2166-44ad-ba70-caf56a4d93c4@moroto.mountain>
References: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
 <87bk4ooxya.wl-kuninori.morimoto.gx@renesas.com>
 <f0f1b989-2166-44ad-ba70-caf56a4d93c4@moroto.mountain>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 23:41:55 +0000
X-ClientProxiedBy: TY2PR04CA0019.apcprd04.prod.outlook.com
 (2603:1096:404:f6::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5523:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d28d13-74bd-4bbd-0886-08dc8102170e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|366007|376005|1800799015|52116005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m9iDoq+M0QrcAq4c58L5+DZQbFPoEnK/MKcOvUaPFVxVYRIxSp+n1p0yxmUV?=
 =?us-ascii?Q?R0jwr79XU4Rr+XP1SP5WWDSdZHyMF03WImdIlPj/3lC/2+4yMOzisVIsuEp4?=
 =?us-ascii?Q?qacWnQmagYM3T+RMRHR3rA7KyM3jsgLKdgfb7HfWaBGG27rOUzTlrFstaGKD?=
 =?us-ascii?Q?54IWtUxI9y9VBc8v9SLpUOphweZnOOVia+pKUxrmhe8QTBNlZCc2uIRjtu1i?=
 =?us-ascii?Q?+ldWGK235XDQqsXHkMXDs0DJ4YxyO9MsOHhSwlG0uaJUAMAE4NeklAZn5XfB?=
 =?us-ascii?Q?LQQ8cjMQYe0RQyU5LzAOf+6thoXRkhrwwP1e2mR/xOUAjkEocFgQMbUHUk57?=
 =?us-ascii?Q?Wi5GFXEmhA2Ei2YNhEYT+4TI2r04uMdE78JGTzT1/J5zIMT4KVX2gogQnYNS?=
 =?us-ascii?Q?i2UC6mT51n2qR6sqr3vId8rtCM2wPfXvp8uumHWc2D3hh4RuhQORNoNzzQHq?=
 =?us-ascii?Q?MiZJ08S7mb2Dgir06dAUto8QjCQmn3VRjB0BSr/tZT6EuQ11lxnPEswQAX1T?=
 =?us-ascii?Q?v4RnkTJrhMsRw9HFINGxshH7fdjsOO4oJDxUqRXOc3eMfsHkntc6mDC/lfWn?=
 =?us-ascii?Q?of2m4hIqUBlEvt327/FYwKy9sScGsDzDFARur0I7fbyj42DLKJq+1Jzf11D6?=
 =?us-ascii?Q?APyCCuKRfTHYjHze1oyBmqqwAFCxvysR1GkG6hHgQLrJURtNx/U+2iSgkWY7?=
 =?us-ascii?Q?IsNnq6ACm63y+0edLUQM4WV+TE5UdjDqx8VVsyxgahnhALMIImfb29GiA0JU?=
 =?us-ascii?Q?P3P3g71sDGQ5yTkBEZtU2OBH43ei7mJkmrsuRcULlqxHgIeiug/VvqADz4m+?=
 =?us-ascii?Q?oEWxM0vU5gfpIgw/4VvAfIhISRXlrpgkTcpWDPuI0DMHGMioHvunPWUEdvda?=
 =?us-ascii?Q?3qkjQSeF4XymvWq1NUaspErErQu9zzs2hk6YAyrLYfnBbtIFyk6HxrQlO/ib?=
 =?us-ascii?Q?v7BXkcWcnuly9r6HIqxD1PkPP2al8m3iRPIfW5uoXQBb27FmSrrAnaSBLP95?=
 =?us-ascii?Q?zoAG3alrTRpj6cLp+i+yb6I1gfLR9AYFCtdJ95jzKYz4BKcjuCi33mM/n8Pc?=
 =?us-ascii?Q?PZrJ0mXuo3MhYqt6rS0kfjtV8Xs4n2BX/HkNdQkdEB4MYVZAexnJd5Un8Ok8?=
 =?us-ascii?Q?vRBZwajccDxT422zI2DPCQ82b1Hd4kCoWv+H4NhzU4riic4c6rENN017gYau?=
 =?us-ascii?Q?IVJPcrrTVNzonhjwVJQb8ZKtaXzKq7kKm4p27u5XwoaAwYAJSLlUExGLialA?=
 =?us-ascii?Q?no90G+2L+ExwJDhEcQ8Og/6BJpJSVgrG6Hp+orSnkOuZVPuvZ+/dQVQDH9dE?=
 =?us-ascii?Q?id7GtCEbQ4HbgJOQ6xpD4P4sfCmaIG22FAbQc8mKNa7NOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(366007)(376005)(1800799015)(52116005)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JriZrLv3x33QA2g8yvlMV7TeJpWuM8JT239g4lfqaapnroNDx+GEo2AK4wtX?=
 =?us-ascii?Q?asaPrgAz8Z6dL/c9PlKwAHoDrnH3ZGMZu133FjhnXhLrzCclKyYwXBZGgi6z?=
 =?us-ascii?Q?GTrdwuKmS6eLgzahZgVWUxUNU+HZWsjKn78qczeS/Lefv9AvYfM1Xi8INjIU?=
 =?us-ascii?Q?hnBaEH9Q3kAeqC5aK7Uy/B5AIkMa/DqNoWaKviVeKzxUHKT3Yd+5wsDELAVx?=
 =?us-ascii?Q?G9jBwgdkJTh60xr0D8vjZsZvhp5jBkVd+sk/U3iZsYsC5lWCuLMV1yj0xYo+?=
 =?us-ascii?Q?81m4P81+XrGUKE1b3ZGPFnaKY8iXbapH+cPWRJIDs/gZ7ibkTxCoDpnsUAVb?=
 =?us-ascii?Q?/6gDHDXP2PtuIeIxKB+UX3b7Ik0qiuKHCEDGt7B9umJmPaMLpSJrT22AyHiB?=
 =?us-ascii?Q?9jOWKeNJfXPopc8WYYpbRAm9418AeRGfwzx5SBb62TJzKVx/mVQRWZJCeHHX?=
 =?us-ascii?Q?m0S3626Vr17W4/KjEJOgsc9sElR14lOQrbd84Osy6dZw4ptpLJ0tsudb+dwd?=
 =?us-ascii?Q?hPjSejFgb4kfIESUTJg29Lh8Im6JXtjy6/JJLJAKgdp7RzCJTSw5TMEhvaMv?=
 =?us-ascii?Q?avP1egNTz9bDu3JLArdl/Ui1Hmq/5Ul1yG5hO/jmcRx/EWC2mDgVmAfpt96T?=
 =?us-ascii?Q?zhHB1CWXMGTO477ztr5wSHLkfes0Fb+mTf/faKERpTmdLRm7CabitD19+WEq?=
 =?us-ascii?Q?wfEJROy5nz9kUp/Oo5gcCuWNa6wzB4UNe5hKDv2ZxKsinZwb/jWIZmDDDX6y?=
 =?us-ascii?Q?c5v4ef6df/5PnKjn7EffEjEY/R8XS+RQkYA7E6tqTrYz7JYBX+sD/xiqaBUh?=
 =?us-ascii?Q?+Jy710A2fAwfzidj1bbkLF5GUAd0dUxcYVpTBVBmEp8XrTqVFU2mQvUkhcPI?=
 =?us-ascii?Q?qFqVMMKGPzL0R6Akx0u60nQtkX2Ue664pIY5KcgCjFWVxYfYNK1X/m59YAQd?=
 =?us-ascii?Q?P6rmBzgiGUGsys+lF2kNOn50q/Wsi9IGbgf+1tAmmDCtcxAUL0HXSJy3G5jS?=
 =?us-ascii?Q?fW0KoVO6RZYdtbAW/gCREEW3/iqMynkd2BoHFCJ9bNgGO/7DNYRE3SyGdOmp?=
 =?us-ascii?Q?RXAnpCOXWE4pTeqHN1iuft+/1E2p3VVahFW1PGU4kWrGPjbVYUZsfhqs6hjX?=
 =?us-ascii?Q?k86PwYts9vrRuQ1jdb0CyEuT0IlHZQ6uf7yj5H4HVao5Z6seni8Qo2V8BeqA?=
 =?us-ascii?Q?ccf0/DJDnDO7Pc0Kbhmbv35PSfMFBuTvN0wVNpQrOtNaZ/85qj7lbAV3JI13?=
 =?us-ascii?Q?ClV/vufVGdfrDEVhMF/Jcg2DOK4PeNuyF4kdHFusW4w+oBMudEA2cDVAbosZ?=
 =?us-ascii?Q?nCiUpIHXyK1T1uNDbU2PkSkgKKOg5hyGeswFwX0mK3C3FsGNnMDYy7S78txa?=
 =?us-ascii?Q?QxRQR4Pt7qBigQkvoFyDLQ0DBd9CiSSfJ/VuKjVYwvECxFq3xhUkGbevmm03?=
 =?us-ascii?Q?A1vCbrE4o49YX4Ih6db5HxXc6Tj5Bxds9SRuBXYb2UHAnCzforFriV6M6Kap?=
 =?us-ascii?Q?/trSWIEVGGJ/k0xc+uSluQZ+YR+iPK2wzBCb8ku/uk+mBzXt21Uuqi14r5id?=
 =?us-ascii?Q?Y5NbyywRdv6NxI+lDVDtX+j23IVLg7EXwyB5AGe2tnV42thPutIbXbKFmY/x?=
 =?us-ascii?Q?g2AB4AjDcShJlggtgFNrwOg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d28d13-74bd-4bbd-0886-08dc8102170e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 23:41:55.7717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I68x4oaud+uLn42ew8h5Nb0V5mFztHXOtgkojSCaFdx2pFejUYRKrdyC8dyUIK5ZoqCDvvVS9px5C1Vy+SpaRyQ9ON5OpX542jdgV1H7utvUTMU65I82ZvKbFe0IUR3N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5523
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


Hi Dan

> > -	while (1) {
> > +	for_each_endpoint_of_node(np, epn) {
> >  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
> >  
> > -		epn = of_graph_get_next_endpoint(np, epn);
> > -		if (!epn)
> > -			return 0;
> > -
> >  		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
> >  						 &v4l2_epn);
> >  		if (ret) {
> 
> This introduces a Smatch warning because now "ret" is uninitialized if
> the for_each_endpoint_of_node() list is empty.  Is that something which
> is possible?
> 
> I've been meaning to make a list of loops which always iterate at least
> one time.  for_each_cpu() etc.

Oh, OK thank you for pointing it.
I will fixup and post it next week

Thank you for your help !!
Best regards
---
Kuninori Morimoto
