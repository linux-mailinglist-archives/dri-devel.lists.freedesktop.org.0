Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0164967E54
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 06:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FA110E1EC;
	Mon,  2 Sep 2024 04:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="UR1a/d1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B1110E1EC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 04:00:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTQ40NCYqcy0cJLQj29FijRGv4+0qK/RjAL0b2hcwXOvaHbSRC81Q23ANvXB5zFFA24n/o4mA5C7HD5CX9DexDgaL/h3PVN7Ynh3GOkWRfdxjQ1Vu/E3OEAL58MD/nw2qhjMCBEuJR2Ys8lSt2k8WcjGmNXbSd2oDRmhmNQ4N0o9Kiw9EKBvZAgvcylajg4+eKG1WWY6a2ejpzMXaGJTCPZXdkXsUkVj26fzupMvHrnKPmHlf5cp6T/q3EPvHa0kvzFEZEJxY3+31fP9ljJjqwb1hlwdqE0uXSXMtPlsS0LxTldJib8n8RrMIreUAs1teKOn3oMapxatLND8Q3CUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJmHfcV61Bf3K5eLD8Prf/1EGp+U0coH1SOetgnzSCc=;
 b=qWbAlrc2lDjyWTpaL6AFsiVqmDo5GvcRDOoEBgQfokZT8Vfu0UgS9r+VG2yrX89gK958mQR5M3rCjO9o2tt9TIvwYJZ3jKAgDnZoeydHj8GU2cHhtJ4TZJkkdqvKMtNoF8IdqXzFCPmIepREstCK+YUt7CGkCYIhLUvsYk1UATRQMQwRZjQrgv7hBRWAaBFoyTn/PtHAQvJ3gFQoD5IcPzHY6biyUFtldgagLxl6+lsbsLpwNI/cFVzWjKLnose/s6z6nV2S8QhYrd1EUKHaUb4hfpeCmyC9T1ss7l8P7tzwgeMwZNPU/s6h5F4E4m4VtIO3ADP6BDLwkG8AGcBwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJmHfcV61Bf3K5eLD8Prf/1EGp+U0coH1SOetgnzSCc=;
 b=UR1a/d1FBxen9gTKot1a0eqd4hRdtqZWtBGe9Z7PundlGI6+IQvmYr71CgplD3utuA0xzoR8VL+NgbeOXz/ZfiIe3Sv5mwjO6dS2ZB5vFby/ssj2AB9KOvqonHwRsBFcOVNrkvRUP/EHhiF3F4AJHCXUqll3O3+z9/RC5gWaIXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11529.jpnprd01.prod.outlook.com
 (2603:1096:400:374::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 04:00:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 04:00:33 +0000
Message-ID: <87cylmogbj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>,
 Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Saravana
 Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org, Sakari Ailus
 <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 2/9] of: property: add of_graph_get_next_port_endpoint()
In-Reply-To: <20240831112440.3fa997a1@jic23-huawei>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
 <87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com>
 <20240826154009.GA300981-robh@kernel.org>
 <87bk1ebz59.wl-kuninori.morimoto.gx@renesas.com>
 <CAL_JsqLysakbSdENNy+_XvotK9_eHG0KP50s6gtfFUYntawyWw@mail.gmail.com>
 <20240831112440.3fa997a1@jic23-huawei>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 2 Sep 2024 04:00:32 +0000
X-ClientProxiedBy: TYCP286CA0250.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11529:EE_
X-MS-Office365-Filtering-Correlation-Id: 39961d16-38d9-4001-da23-08dccb03cadd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5IbFcs/ROyN6zKpdzqa5chIIB2APf8pa+KD/QcwaoslTIJgYHNdWC1n27pHY?=
 =?us-ascii?Q?HmSNOLaLh+hgXTYUldmHIFn9W/MZesxg2Q2ZtxtR1sKjvtjmHc3PFUbc6ax9?=
 =?us-ascii?Q?EYNxrmS6w6laCsS7pq4Rr/GuFQcFTjAMJY6JoQLxvBvuxZMXs4DG1nrnsdNV?=
 =?us-ascii?Q?Oishhj+IYKfIkL9leThqKAmGeDixuqcvZmepCgQQAZJV4cjVCZEyV64CwPXO?=
 =?us-ascii?Q?NYzJE+h9iRkYZrf2rn3q6/G5E6J4xYblTOX96FSNAcNMdqfEu1CFD+OXoOip?=
 =?us-ascii?Q?TpeSeq1fk7LAt16VJXkz+sxQ6l6K7J9fqyG2rOpHHRf9a5tPpXJBb8bsBYXG?=
 =?us-ascii?Q?wLGwILkdi6OoOQWQtjEqyfsuKZIuDUzIvkBJydOMhhw6/y1bPxOCGMhv8uQ7?=
 =?us-ascii?Q?GZ5R2KfPbqWdQO/08vcfb8nyyzw1Io28nsB+x9ujZ/BziFvL35XiDh9FIVHf?=
 =?us-ascii?Q?Y5XoeWXs/7gFUVNk41vyxiPLOdpk72WXWGdbBAabQ+ezXBF3dLyv3XGOu5+b?=
 =?us-ascii?Q?m4snvqtTWp552K80D5Zi+MTbn2Z2QPqC3+IAgfUAQ18IDK38i0ixKfoAVRi7?=
 =?us-ascii?Q?yyISzjdocF8eXYWvJhLnsgadMToKltebbw26197irokSB2GP+bzVA1tvu8Xx?=
 =?us-ascii?Q?yosrlsNj4St1fJTaeEjVJn7ofa7ip0KKpjA1JYKeiwSssj5wOO/7QtnlI/1y?=
 =?us-ascii?Q?wMf2aP7IbjHDqYqVAvUi1buDefJS4khM/ZNx3me9hOQH5cYvmHOzK4QV/VeR?=
 =?us-ascii?Q?3xdPZN3oXCm8OXBoq59sbct+q1WIGFbECvms8Q4oOEmDZzPHOoGFYbycaj81?=
 =?us-ascii?Q?TOuNhJg2D+hTeXLRDThSQ3UmZkX2E27f5lZ+HBLBp8tK23txUWdCn+/KcZMP?=
 =?us-ascii?Q?HA9Q7HCCGeongCFu+5I//6UGaSBZDVnpmB6NCMcAhMl7kueyJ6mnWL+6JjwU?=
 =?us-ascii?Q?v0clGk7GtmboNXdxo8P5e1EBYTRG9c3W32kU5iehOTUz7w4LxOGKu/lrHK9+?=
 =?us-ascii?Q?D9M1EJ/1hMRB3XHsOPqQB7AcDpkJq3IKVKJgG8mYHYvhJ3F2PyXsLevlZzH8?=
 =?us-ascii?Q?/79y4zVHnbXuMBodbdSLImd8mSBA62S9S+Q1rYDU5/iHwjstz2MhE1/Uz+gm?=
 =?us-ascii?Q?V8zqK3ObOK7UJf+SBifNALw6bePWxgQtNjEWO9DOTajU7YaBfS0vlVtMrYTq?=
 =?us-ascii?Q?pikRdpMeSAfYrCUxhyj7sxELKoFFiPFfepA5bOOcwvCpf+WligO6eJELctOn?=
 =?us-ascii?Q?lYrEGTGeaSE4MwMmRw6AuRoo1Z4xe+Gx6itghI+q+IGjfV8qVuGoJNriWuTw?=
 =?us-ascii?Q?Dj4dP7FcEPc/w/Eoz1F58jkUixjrdCYrvytoogMNBW9t+P90K9jQIJerUUaf?=
 =?us-ascii?Q?q+cViVgD3TVGeWYjivaIxVTDiJJaxb2gtR5HFJLyoTpj8X9iLw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yLUD0fjdxzXQF6c9SloAEHqPpUXtUq9LI0knYUZVCuASBexDj/bnsu/vRpuN?=
 =?us-ascii?Q?ppXq/D/KnbFZhsHXPBFr1d2aC0/OGzYz1MQsEWcJK0Q2xzcQm0GTvvKXeeM4?=
 =?us-ascii?Q?47xFmMvKylbvS/26zCigwpTXvY5LtWLhv/YAo+NZ4zsrcqGP8Qx8+AIxWQkf?=
 =?us-ascii?Q?q5trI5zhDOvF9Jr+/glymPqPQXv7qxiFF6Ny1BTJLgQTDyvsd82SLVk4/qTv?=
 =?us-ascii?Q?1ZfUe+C64aQiUa4EOeOgfzj2ka65yMdBEBQqhX6m6SUcq+w9Y3i2anrf55ch?=
 =?us-ascii?Q?60EZbb9n0YYXcIKhMthb+RLhfJKBbo430IBwYcfMasHnTH6trkaHHVSGBdv4?=
 =?us-ascii?Q?ymzvSoxi5I3Y+gbjNxV6/c5/Bou3QvapicIVTq9t5tyOyQ10Y/0HZj1S/9Ib?=
 =?us-ascii?Q?+PmXQ4ujupA3GtIOyS6N8Qad0r7r1nvEMSE3n3W6hLXqylREZpZzNGAdSGsp?=
 =?us-ascii?Q?zJJIes4mf2Lda/TVoeL2Sj/ixY3McdT89jmvnac3PlV2WUsAKzxlUgVBbMK2?=
 =?us-ascii?Q?klft09fQn7tUhE3VJmcY7oZEsG3Zhlez0MuVaWkI8F21t6wuS0NtZT5dN2Dd?=
 =?us-ascii?Q?0hO+Sp+8nSqZira9Tm4NPCgJOz14eGJVCFHaXiekNCzZKVrQWO+AJt0VZyS4?=
 =?us-ascii?Q?4CWA4hivzKgkyiprPZvQRa20/dzeGA983Eo61OUqbLlsFQ9z7u4rklFSrqKM?=
 =?us-ascii?Q?O6K1Ulw/he2BVRxs+mB9Nkusie7UxIIxS86ljuKN3Bi6W79BwuehUMaK475j?=
 =?us-ascii?Q?lla8MIghdb4hKFNX4PFu92msQUF3vE7YrgOlL/DJrrQBXAsVAOhWSR80M1ab?=
 =?us-ascii?Q?42/9N9d14a1/jga+ZlEunfOJqaAE1y7a7oaACWuKDoqxrEk13HL6gkvtPfXG?=
 =?us-ascii?Q?C4zA4QO/LEaSy/2emlz30IyXnTKiny2lyhoaBSlyzRXXyfoyq1L4ZZr/D4Sr?=
 =?us-ascii?Q?N3hPVaLGue18xJqx7UqRJGLCXwRXTWnPy7gLI5EzBDMdB+IhqETb0nrTte97?=
 =?us-ascii?Q?W47sTRCyFNlcLiApSHPuX1Eb8qdjqwSs67Ky44o1M2boJ1V/ZEe8We8OXw5x?=
 =?us-ascii?Q?wkOesIBWvJhiQkzlfNtVUquLHG0+48P0dtogDYQPPq3DOOCB/MFydsb8vpW+?=
 =?us-ascii?Q?W87SSTqV+I0lY8YUmDh7+USh8WUD2XhwwK0FedMKwV/o7ElLcslbn6Q87+Z8?=
 =?us-ascii?Q?lW3zWoQwRpEp5ccTXGbBM/ii6DspTkEUdSSGPzxntQtbBO1PgIFkeebeCIRx?=
 =?us-ascii?Q?KiToFPbtSqXY5dbME1G7SSJ4u/8GwJPjQxJYPJzWwsFgitYLK/vsbtOoolzI?=
 =?us-ascii?Q?TBNMwFLRoGzH86zxo6Gxl6XeeC2tF7iLrz8a1RD/2OwQQQGZDECC64YzlbBt?=
 =?us-ascii?Q?SaZEEYNZifg7a+jF7w4hCWdV3/I5ELOHvPXJBucw2o8zeIv+9hMazcjYqaUW?=
 =?us-ascii?Q?rFBEsooLaHzlerLSUV0YnanLBpNpnsZxZE79ey67dt3sektHXFRU/SCisOnN?=
 =?us-ascii?Q?jbtJTlw62xlVwvsQBadUo/IkPZR/rQjf9auKv3EW7n2d7jIlGSpr6clb4v4+?=
 =?us-ascii?Q?jDQ/QnPcH8rgjcEmKWr2Cbd8yMgv0mGgaD/i2o1Uv+OznDDkTGGjK8ik+nZd?=
 =?us-ascii?Q?gdO50HDyxhyw7ujF7W17QYo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39961d16-38d9-4001-da23-08dccb03cadd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 04:00:33.0123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5W0bA30qpnek0N1M+kutXr/FZAB7NcaOoU7g1NXO+RlCjCzH3WENshL8tJ03ZYaS1r4ugZQRaI1UZ2GIGWPeKxCvSI8OzT/XzYHD6CCJbsIA/zInK+DtoJrCqDtnPRw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11529
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


Hi Jonathan, Rob

> > > Do you mean it should include __free() inside this loop, like _scoped() ?
(snip)
> > > In such case, I wonder does it need to have _scoped() in loop name ?
(snip)
> > So back to the name, I don't think we need _scoped in it. I think if
> > any user treats the iterator like it's the old style, the compiler is
> > going to complain.
> 
> Hmm.  Up to you but I'd be concerned that the scoping stuff is non
> obvious enough that it is worth making people really really aware
> it is going on.
> 
> However I don't feel strongly about it.
> For the other _scoped iterators there is some push back
> on the churn using them is causing so I doubt we'll ever get rid
> of the non scoped variants.  For something new that's not a concern.

I noticed that we can write below code, and then, and there is no waning/error
from compiler.

Now for_each macro is using __free()

	#define for_each_of_graph_port(parent, child)	\
		for (... *child __free(device_node) = ...)

(A)	struct device_node *node = xxx;

	for_each_of_graph_port(parent, node) {
(B)		/* do something */
	}

(C)	xxx = node;

In this case, "(A) node" and "(C) node" are same, but "(B) node" are different.
New user might confuse about this behavior.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
