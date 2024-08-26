Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B136995E83D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 08:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213AD89B70;
	Mon, 26 Aug 2024 06:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="o9NQq++/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF62489B70
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 06:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xedqvGwz+3jf4B3IX0Fo2MTahAWQmuqbZKPb/s9jEzRRFqmLLKDLyhbogs+0L/VDi2Ls2NKrKkZopHZE2ov4400DjPUDFfULQCx2Zu9SMb/1FJV6YJI3sGd3RIenLexHon/6oiPNhyYqZUjmqpuQGwrkjVnFKErotgGF2q4NDSRSUB2A/gUtnawHO1GD6wB9XajPvEJk/aDgziDmxlSheKg6RHfFYC+3VwkHod+6aNYRvCdJb+rcDUp+jdGCaoveG41Wdqg1Z1gjeFpqcbq+7oaJ01Udu/rMrUlTrUucGKYqGg7eLdW+SZdMxtKtX/lOdwVnJ5EbFfoA6RAQuKF0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=os7iz3v3PeBD6YnX4f8jIbubQgo4D0hf8fIpvtcVVmE=;
 b=KtmbKWZNE8kN6uwNiRyTX0OtVoKeWgNsY9o81inHoOB2/Vi8M92tJMhO3ZKd55YWYMlpgVXdMG428hyqESTIdzmh87D68zsiHigjhrLDizHHEvF8hq68bHR1yEZD2CSddM2k/y5u5mocCA5lZwE/Q2QfSMMM//YbFKOj87ZLAULTpwldflJJWHwWNdaQUupkZjiuKy0c3EzThahN/01xXVIH2GpfdtLmIvDWzjh/GK2q82xJf8+22gVwVrOK6zoRZWtAKP4QDYlyq4juFyOSglqqhmJ6NfG8bkWJAc8VVJIEHAsODq/A79kw+xdLQaGnTceceXNBgpLC+53mNQqOMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=os7iz3v3PeBD6YnX4f8jIbubQgo4D0hf8fIpvtcVVmE=;
 b=o9NQq++/CZXbAsPfIb242a5Sar8MQmdR+qqpSEunIezPEaFGcmMRWRZxtVcn2v9sbLOpXUnjakVAV+Wktx4kCFdkLsEdqScjFkWJ1wKsn8qkMCRUnFMhaqr4y4WShzVG23f1cYzp08VzkTGYvYTlhH0zC+03SJs1gfx2qymLvzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5606.jpnprd01.prod.outlook.com
 (2603:1096:604:c5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 06:06:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 06:06:26 +0000
Message-ID: <87ikvnq0m6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 1/9] of: property: add of_graph_get_next_port()
In-Reply-To: <rlfczbgxjhnqeqskbg7q7rsvhyzznbqdjbtajl44pokpsdtdzx@ecirg7ytm6az>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
 <87bk1gqa0k.wl-kuninori.morimoto.gx@renesas.com>
 <rlfczbgxjhnqeqskbg7q7rsvhyzznbqdjbtajl44pokpsdtdzx@ecirg7ytm6az>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 Aug 2024 06:06:25 +0000
X-ClientProxiedBy: TYCP301CA0053.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: 90319596-f9ed-45cf-2080-08dcc595382e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|366016|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9H0AY/Xr1ijhZ0MITKOTjIACQ7bbTCpBsv43pe8TIKf6XMIH+kUlG756sbjH?=
 =?us-ascii?Q?YvvKfXhpWM4UUenvHg5Xo0RJtzw9jdFMKD1WviUU+9deT3AYXXdZACduLWJp?=
 =?us-ascii?Q?LZdmn5qA8Fx142ZoitNFjV2ldG9LWcMOWjod0DeYTVaXGqN10Gve2/ICNrWm?=
 =?us-ascii?Q?2045teShNbKgxPyHsJGUq4QpslC/Dx0evDAE7hovNXqrF4+7gV5+BxvDgd/C?=
 =?us-ascii?Q?EBoFEuNjEskKJWYrMxMhVoHIQN3mU0Scz16XNc/iwRgcLua3hQF1SSpPHxBD?=
 =?us-ascii?Q?qyVvSREPLO5WAlNlEjhDhmgyTs+/B7Wv/knDq3jI/7U3f7hX4TyExH9I3TBg?=
 =?us-ascii?Q?PZucY6n0HChRGR2eMGHV0hcFbPPQ3ZQPTj0RXlxVstppkAMGa2bm8yh6wnpV?=
 =?us-ascii?Q?6wR8mGw5Hj/VPd3xxOs/IP4SX6ONDTKkC1vI48OG2rivLKjev5jV53YjNkr2?=
 =?us-ascii?Q?xYKEtVXFJYmLTOd5jbpLEhBiFo2yzm9tYvD0BtpNxLNjF4QBM0yOd43p/gie?=
 =?us-ascii?Q?OjUU8bb4YdzReoxzoHjq8vWWBDEUiugD8EUewrJ+uWOMBA8U9NPqjHMUskef?=
 =?us-ascii?Q?hVXLy/jKM5Da6184t8PaZMgAWwIkN0Bk/nNjuVXpQWP6fYwPfYLp+XsqPuvv?=
 =?us-ascii?Q?BUVtBlsyrBE1ppu3pvU/v7T1iedEI/7g25++GewhU/NpXrPY0pKGuFKk/R2M?=
 =?us-ascii?Q?E9UvZE7ZtskvOhX1O+9cB7aObZwCAbt7FNCd/FY9w7n7hnfF2yODA81ZLIgM?=
 =?us-ascii?Q?WwE6Q07x1rbxCp82S1i5kwIO9vxhmcXArrZE5Hdoo/omfSR4gsBYDO0DvGPR?=
 =?us-ascii?Q?QkXkvkJQkrf8QLAf8gMp0+qV7JjFTDthnKudLBXTBeveBKNBA+vdVK1ljiDD?=
 =?us-ascii?Q?pw5FfkBmOpnuMhTbLquJMwYYQMcjoqFfBj8sVkDrNVoC7WkjYViMcRyCcsL7?=
 =?us-ascii?Q?burW5EZ8x5s6O7cwARnC0FmFFxAafaO84lwvvofo0+A3Ir5TXqJT3PJCAe7T?=
 =?us-ascii?Q?loFVZOl9NxhJSc4Br7agIPr2aVLJtdLGqSxRrvNjCEFqCPVYK2cvdpaF4H0g?=
 =?us-ascii?Q?ixysDh1MpYkiXZHTesdiGDY2KTluBaIE6xqyVzyNA3W0+yu8UJZoudvLbyXh?=
 =?us-ascii?Q?uDpk0ZbmyGrAq2ftvII7OSX6GvuTmBXCddHMjOUeTs4oFWocQVcieViqE6nx?=
 =?us-ascii?Q?jePUcCxAXSDBib4siH+v/shxqbQqbBesJ/AOU5a+2/aPYhOoZTdC+OEI94ry?=
 =?us-ascii?Q?DigSYSaoIOjFbz/IgubbfzDaudpqEoxzh43lwWcVHdIZIJnUVUM6hJ7lGKdO?=
 =?us-ascii?Q?yaQPjmnIFz9QHdGwUp0K89q8vLy13VyKvud8gnSdPUoAaSSacgyEwcVhDNsv?=
 =?us-ascii?Q?J5qmQDfKmIF6Wl3yQvxuUgyrRADc/tOFlObsMX7Dv7z0N8LjgA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4SSMEcXoyLaNtXae5WB8i7pUI62U4wfQaEAZVwtXQzbeFNyn2++owiMLP7Ri?=
 =?us-ascii?Q?StvcqOVaN/pZDZbRyJ7iTWOAC8cDgC8ihX4LJ9Lb8IOt0f5xhBU0ikZaHj1J?=
 =?us-ascii?Q?c6Zlzd++jKE1leFww4ngGXEb9lscmQra1qZkdWhmc2vcp01rvSm517aErELY?=
 =?us-ascii?Q?FRVXXvBtS0GR2mJZUega/RCyQgVkvgQecRXPeIz2p4hgbFLTOmFB7C8x3IS6?=
 =?us-ascii?Q?3oQONiFdyaG+hnX1RbltL1q9Lx0aBaI7/xysiqdt6KLBxm/ek53LFNbcB2vn?=
 =?us-ascii?Q?SUVHhEcGlzL7IJcnkqbSou7+ZGDhVKOGbDOUqbWgDtZGLsr+SbpDY2IExQ79?=
 =?us-ascii?Q?uSeiF0SBcdBJOHK6O/KdrMYcrGxIxTdkDAcLZ7MpS6hvhHPPxgD5cSG3o926?=
 =?us-ascii?Q?SWy+c6rIQZliqswxc4QPf8mDCX+ZZEmoLVgKStlqp6J843R4eVKczfW8IGhW?=
 =?us-ascii?Q?0G5mHD9sgJAareL+rDZthqfETjSXXkZ+52aVwHsAsO9l1vV5TOeVTegGHG4E?=
 =?us-ascii?Q?mBsp0OQ1shhre9E3yoH1zdQBpQRtbet6/uJG0qjPijIIttQFlP0IeMLQV5MP?=
 =?us-ascii?Q?WeVPG49Muoo9ntLJ4j99jYxYU3QNm+8KAXrwPmNx3Fc9gjH6IMflrY8PMBL+?=
 =?us-ascii?Q?7Zqg2QkkHmFxdhTUgYyHReIIrb1y8dWgLjTWKI7A69kgQHprJ7LASyq7vsFv?=
 =?us-ascii?Q?hcZiK13P2gxMhB6AGaNBmpynbmP+OSVFdakgp/+0MEVO6vK5/WYSN52JKmYh?=
 =?us-ascii?Q?mTtlnY2OsVYIm7a175hcfqj+jXhiSoDp/pnasLs4UULN8s6wYsRwoFZ/xAvu?=
 =?us-ascii?Q?ym3o4XGDU6vjIoYyqzOe22H9Q+JBJz2qQnwqZ5sr3S5PZ1mcKqVHGhX/Jysg?=
 =?us-ascii?Q?X9QWlTuwdMQUY+SjTf41I2sVRElFGuV34MQNT+H6sEONd6yViMltF8MbgfGj?=
 =?us-ascii?Q?tMQZKvMFS5qC/I4RolbdMZU8eEYMhiUnOKhMmc3Saz3EdQeClpxhtTY9/+kq?=
 =?us-ascii?Q?COVZRrEHAuksnPf0n9orn40ScY/TbN/lvy91sOywXQHt+fc7OfOE5N05Hd+p?=
 =?us-ascii?Q?FgXlH6LuLpDzVKFUiusNaJQlJo9GnBPRx7P+pcREYEldcWSTDzRqij8Pcqsd?=
 =?us-ascii?Q?tlfeDpKv8FTNSPjup2yA0MA4bJ40Di8ja1luLL2mxzlZxnwSF405ES0DLlsS?=
 =?us-ascii?Q?MFiu85yjvuHAY/G1mtlefpbwVySh70rxMj0CfUVgcQyhsRLpErv2R2H9yR6x?=
 =?us-ascii?Q?W+iDUoufymXRLknU9AY4NcoqL9ycz+TwGPKpxuYJO/amzOEwpWGXs+p/fB03?=
 =?us-ascii?Q?BGKdQDxOxKfuTyEfStudxjUkv6Q6EVAwQq/PHOpbmL48hZF0MBw5CubhvRcU?=
 =?us-ascii?Q?BJOdXL7lnwDZBfayYSgECl1tlJ9UHMhM4YbeizsQ+699e94TXvDLI1Y86xsq?=
 =?us-ascii?Q?tvpCTRRybeT64rHPxyEB27yPytxJxfGJ5c9LrdXLek06TyxiQ0EZaSDgDf9d?=
 =?us-ascii?Q?vBu5NPOwXXKgPGqmEkmIrZjMUkwbrLyiMLJ0iide8ZW18sxFr4bKjbNMUf1I?=
 =?us-ascii?Q?KyVDEz5fKtX6dy4P9yHNjauaa/AJAGFtySLjk0UrGnkve5KXOoig2lHAi9GN?=
 =?us-ascii?Q?KzCTTDELRQGigaKqQTXeClk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90319596-f9ed-45cf-2080-08dcc595382e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:06:26.4123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZC3ix95YaWgfFfMBsdzLOus/9j5QSsBJsCm1bmCOOWdZa0JJLpvwRg5V42P41EN8rX574jKG3OL6NifVgrNOr/M8jBCRoZCfVH50wtbseoBQOjNO/Mr1G+p4QEe8zCpi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5606
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


Hi Krzysztof

> > +		prev = of_get_child_by_name(parent, "ports");
(snip)
> > +		if (!prev) {
> > +			prev = of_node_get(parent);
> > +
> > +			/* check wether it has port node */
> > +			struct device_node *port __free(device_node) =
> > +				of_get_child_by_name(prev, "port");
> > +
> > +			if (!port)
> > +				prev = NULL;
> 
> It looks like you leak here "prev".

Oops, yes ineed.
Thank you for pointing it, will fix it in v4

Best regards
---
Kuninori Morimoto
