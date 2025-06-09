Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48026AD1880
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 08:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3B010F1CF;
	Mon,  9 Jun 2025 06:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="e8fMuB/I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1723D10F192
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 06:09:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6bzspiftLRPzUhNIbS8ki2knDzLLfV3vwd5pgtiF62+Tdw6dnG4OzwJKYGh0ukBysf4Lo1ec0+IOdBL50WYw+Dhvc5tsOyAwG2ayqH0TSOjtxFoMyYwY25M96ntVEc3Tjyk4zepOQCsPsYRIJEr13IWdG+yPy1iaX0c86pFswIWqA0rT24bCMbc2LCZdQQPd95Tv2ATwNMAfypuI96EcSGpS09V7tAYtLJuNXKarJAVRU0/SwkBHMir7Le3koqhS6i9cBojTW4y8aRqhW3R3Q7gkHUFdGpS6yRU8w4NRn70yUTaVDymgaEfDveBCHwAovk/bHrW0yErFEI8FdHSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUfgnNVJbR+AybGtJb+9bt+2h0JsCZzUFAEtSnnvEac=;
 b=ol4B/kr9RhxELF8FqvH1u7Kx06g3iEmi+D79ex0E85U28SjZv9w4rpasP/yZ/xjXqBUPiOa8hol0t9vLA0ADBJhLKhEkpLoOgtvR1yAuRddXvkUfO+SWB33goD/lKwYdzZGscqm9rms5CuSsXmDKNSZEB27Mob3ofgI+I0Fg1YL6NEaA/zsRZ8sUZAVmJUT3WVluX8CLnEALldVc9laLPJ3hZYqOId/aPDpwmOMpeIahz3+mVfWSlHsKXjvWOMiTl/HMuTmjZdYg5bBI1gbGt6CMuSJ3SUvgynMEbwJQxdaE38sMxTadbs7eLYRu0wGeKvFA1FQNMr9CMzY983g3wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUfgnNVJbR+AybGtJb+9bt+2h0JsCZzUFAEtSnnvEac=;
 b=e8fMuB/It09gtNVLw7U3Xvp4QjOWjBguZ0ZSiyitlBpNv0ttHKbp306ySHRRCGjxky1V7oMCP4U8iZQVedqdr+Sj8WOtDHTEIcMExqQc2m5wHz4Cr+OlOukeQaOdtqfr2YAXLniPRAnP9nVrNMqo1RQtIiNwaNDZ2lPmlncshH8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB6235.jpnprd01.prod.outlook.com (2603:1096:402:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 06:09:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 06:08:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Brandt
 <Chris.Brandt@renesas.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Tommaso
 Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: RE: [PATCH v4 0/1] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI command
 support
Thread-Topic: [PATCH v4 0/1] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI
 command support
Thread-Index: AQHb1WCz9MxMOKGcF0qVRVo3sAs1R7P6Xm1A
Date: Mon, 9 Jun 2025 06:08:56 +0000
Message-ID: <TY3PR01MB113467BF7F5D6A042AA5CDFD0866BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250604145306.1170676-1-hugo@hugovil.com>
In-Reply-To: <20250604145306.1170676-1-hugo@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB6235:EE_
x-ms-office365-filtering-correlation-id: 624af4d9-40ec-426c-02ab-08dda71c1e27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?arU9zqRFmsOCWbJaiSuUzQSpiyLaBicEZvWp/sFTgMCiymFmJ08qGYIGFFL/?=
 =?us-ascii?Q?rpgDDkWUh2libK/HZdtfeEmZ+FV5AyVNG5+YJWTXdrpWCM0rJpxLTsfqzJr+?=
 =?us-ascii?Q?2Nsk8/ZrxcFq2Zlj9La1hid0CMlnKxxTffJZtR4s4DfOhpjcw+OkgxqDnHBF?=
 =?us-ascii?Q?xbN9V5S3FcauTsBNB9pTUELks2xfHCSyB2VcfKYi2OzAzWckqCDxVv6G1J6a?=
 =?us-ascii?Q?vvoCQziXyl0XNrcEBpuYwr2bbqNHgz0YmRA1WMBzFgBSGxpQBOKiFVOOE0X3?=
 =?us-ascii?Q?jCk5iWVrWG904XdkvIsWYm7SqEcGy5oEzNUmkDj34WpU02taiOpS/s6JHPgd?=
 =?us-ascii?Q?R8V7j0glk4KiEkptO4bJ3G1x0q+9BIZj4DDtZLPUhtRpiHGCDxUcFhcmroNd?=
 =?us-ascii?Q?I/ElrJNLkzqW3TE2B5iXWGXSHASVgeTRvla2Za66CX/D0mQRarc/JPtRMeoS?=
 =?us-ascii?Q?YifJr4ftd4gaeaS/4gz2Flvfs8tf+lKbTMdVRVBkAt/ef1gKmnUdS0SKl7BY?=
 =?us-ascii?Q?lxMODey3gn9LWmGYYJHNjCtn2S4CpOG79+zHAr8o3MT8kjtX+/Wb5I99AETR?=
 =?us-ascii?Q?2ufrArQq3vL/VI4pdHbdIk9EWcL3mKOmsqLxzxjBZP3JEDT/7p9sEI5iukpU?=
 =?us-ascii?Q?+P9bRtnli56m4g9SuE9PsyTgp0FTZh2SihH/FsKEZJLJUVaGxn56jodwhYu8?=
 =?us-ascii?Q?oZRmGfTzYpxCOLFScEoODQXKc/RV5X6h5SVUWYTDwpcLOoDmeCUO/8ZNAMyW?=
 =?us-ascii?Q?YX2hOWL5oATuCUkCu4kr5Dqk0Yl/rbztsKIYdWVMQEOOwI6w3nRB28Je8RsB?=
 =?us-ascii?Q?4/6cjGnjAQYeRI6BaN6xM7rEH9EOTMHPylS3nckBEr2i1EKNwsnkx+/q616q?=
 =?us-ascii?Q?tDG3HcWVqG5qJXCyo6506l3e9qTtBT87m2gvh5wvnIglrHF3dm8OAKMV8zi9?=
 =?us-ascii?Q?bj4fD9Q9ibbN9sx+0oiq6camx8hxAFzMpUBeMULR/5/PzM9BMOB+b7pp6xO8?=
 =?us-ascii?Q?i4g0AB6eoct4HVucc5IZgS7j7GcrqOU9yV2HY279lcjTIBJnsMNwlgG/gxal?=
 =?us-ascii?Q?l+a2uW/WhqlTfXxx7Yaa0ESjT51Cq7M+t3qEi7y2Mt/8NqOaugG2EVvgs9bQ?=
 =?us-ascii?Q?Ge+S2NWZ5ZUsczhlmF6ayWXZ1T0CqvWDjhQNNVGgAs9YZUlr9CLYCNKE4cuj?=
 =?us-ascii?Q?nLq9krim0FPsFiSuJ8Wa9awgMQriUQubx9XmBh9BT8E2XTRzoIvzKF/Jztf1?=
 =?us-ascii?Q?WULUyOpOAUOGlRCRtg4jbhhbyxWyd1fLtDKD7JGTx0yOzUjFNQd0F5srNuAw?=
 =?us-ascii?Q?LQeUnzSgaJeZLafSZBpQXc9mr0l5C+LV/VwbULoNUnWOc/OcY7wq4FD7vha2?=
 =?us-ascii?Q?3xHoXm4MiiV9Muc7+TdWcYq8J54Q5Zo+PEWfXkvwsuA+stxXFcI3uUfjrQQ3?=
 =?us-ascii?Q?ubEIkxU1HXk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Sr4r7dtr40Bh18ibPtaU0NOW0rqI31IuLVmpizHY+qzQ2Vli+QfnwWw/zIQb?=
 =?us-ascii?Q?cKHT3sFQuYJC2GEEP1ggn45gAu/Lq4C9KT0EaIoWuBE9L3SQ0fzEUhergwzi?=
 =?us-ascii?Q?QgBfKqClhKJgidZjcgWKaiUkEjvE2Eh0fcTyg/N0uk8r1yggagb8epm9Mz8q?=
 =?us-ascii?Q?7k7g8pda9Of0iz/rM1yuyU9TWHx9SP4xt5EqZ5Dxdyj6M564FIhh3Q0cmtOJ?=
 =?us-ascii?Q?s5Y2FoRh2skRJBQF/ydU3znRMDsgAXaKpWPbZ3uM1t9SJlstKx6zgHenpenH?=
 =?us-ascii?Q?9dmOhF9Nsij/tMuA8W6OxL7ISo82Xd55/kXy2oC/fZmHvZj/TEtsjH51fQpu?=
 =?us-ascii?Q?R6fCUSeAMJ9vOVMdBBng4b+Lr0eW0wT2dDVlczaYJ4qG/ffLi6Bj/LqZmNoL?=
 =?us-ascii?Q?Hrgp7wCEyiRkQj6nGKJXYNcyYK0mGl/IXDB3kDlTTNJG0Zg+qFWUp38qYVxg?=
 =?us-ascii?Q?hOCJlqzM1+P1b8W9MDpmKGTGWaBvT7ghmXu05z3tfPy/eZrZqLpn4yQmQgTS?=
 =?us-ascii?Q?Vquto4YbW9TKmAAQJNVZMVRLBKNwV4/WnmHy55e+q7RMIp6j0aU4PPn8X50q?=
 =?us-ascii?Q?9DFVFogBpbYbuo4St8akeMaOwl1FFzZGZUTJXvPf140/DAQkys8jvGaQUyJn?=
 =?us-ascii?Q?jAhadtHPyPSBq/fQWW0q4AMG7HpScU5WIVl5oOLL/NLEBwFp1mqJ+6mJuxlW?=
 =?us-ascii?Q?6C4YFbqs6nXC0Tr80C8RRlvtuoGV8gjPeIjoKcV5AeJ4yB9VbUbBARJih9lF?=
 =?us-ascii?Q?YOv/6u9BBwb9fIIc0e5Kr80XADiz9emlJmDT8YAvpqGdKjsUrN6dqNLD+sUf?=
 =?us-ascii?Q?Hub1x5lFmqZgQRXI3vWpoJQ7zAKYvKpx6xVd/YhBas81dQo1woL0aLAUQB2U?=
 =?us-ascii?Q?XdtwAiNwPfSvS35XkUcXAnTNbDGdi2hPp4VT70KEEZJ0neJlrlQzSx3Ab+BK?=
 =?us-ascii?Q?lucFItIrYoIT+8pAj8kj6rVud896qQbHMmaKIHqu/pyU4yjMr2FUY4htkNDQ?=
 =?us-ascii?Q?UYMal5A2Nx4V8WX4Jg0V6mJMg8zoZfJ+jvhD3WyjVDafOi/cGxwW0Xmj+m/i?=
 =?us-ascii?Q?DYxHru9kNbjlwZYmrkJAbta+rpfatSAfwKZAuzbIQWwhY76Zcn/UsZJHKjgJ?=
 =?us-ascii?Q?Wq2xM3AKwc2udPVHuxl8SF//cnMQ8WxV0dESZp6tQyD92SkOMyD8nJiyGO3l?=
 =?us-ascii?Q?uIWU301xCckwvjHuLXiP6OJIL+l2obkR4Q52jLjjkuTN2StUiuSDGTHYgszO?=
 =?us-ascii?Q?UJC/2JpWX0oINn6e/l+FGKPQyP9wLLwkicUKq3OhUpoWJqTalnrI5+Ss9EBJ?=
 =?us-ascii?Q?F8GMVX27/IwVeoDJw4/iEr0THJes8oVemoARpdV8ZFJMBRDvS/lwJX1fAep6?=
 =?us-ascii?Q?BeZxH/ZuNKAf46n1US+zSt8WCOvR97HRT8dzcrNexLN7NLgeLTI3/qUhiayq?=
 =?us-ascii?Q?43LWb33dFcXd5jbeCBQalWKzspd4pRd9+IrWZKzklhMhrMGQ4ghzsn2ZQ51P?=
 =?us-ascii?Q?AxMf+nbyNLZN3/+Xq207ahbGxo9OZsYI+Rbs49k9Uo0F4JRnDx/pV80RMFlU?=
 =?us-ascii?Q?8PTP/KWG91qpq94Q8vhJ0eYjpHmdNYSvpLhINDuL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 624af4d9-40ec-426c-02ab-08dda71c1e27
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 06:08:56.2850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kmiu0uh8ihhAoc+QQUmsau6LTUHWAe3FqOf1mpWA5b4OSXbqs8z71R1VbrKMga1oLgzQjNGs3qZMTF2JyvOqygi3Ql4OmpUpkqoBupI/zuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6235
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

> Subject: [PATCH v4 0/1] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI comman=
d support
>=20
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>=20
> Hello,
> this patch series add support for sending MIPI DSI command packets to the=
 Renesas RZ/G2L MIPI DSI
> driver.
>=20
> Tested on a custom board with a SolidRun RZ/G2L SOM, with two different L=
CD panels using the jd9365da
> and st7703 drivers.
>=20
> Tested short and long writes.
>=20
> Tested read of 1 byte, 2 bytes and long reads. Note that to test long rea=
ds, most LCD panels need to
> be sent a DCS configuration command to increase the maximum packet size, =
which is set to 1 byte by
> default (at least on the two panels that I tested).
>=20
> Thank you.
>=20
> Link: [v1] https://lore.kernel.org/all/20250520164034.3453315-1-hugo@hugo=
vil.com
> Link: [v3] https://lore.kernel.org/all/20250522143911.138077-1-hugo@hugov=
il.com
> Link: [dep1] https://lore.kernel.org/all/20250521210335.3149065-1-chris.b=
randt@renesas.com/raw
>=20
> Changes for V4:
> - Rebased on drm-misc-next, since this series depends on [dep1]
> - Move init of DCS maximum return packet size to rzg2l_mipi_dsi_startup()
> - Reworded comment for DCS maximum return packet size
> - Merged patches 1 and 2
>=20
> Changes for V3:
> - No code change, resending after fixing mail server config resulting in
>   only cover letter being sent
>=20
> Changes for V2:
> - Change commit message prefix to "drm: renesas: rz-du: "
> - Reorder variables in rzg2l_mipi_dsi_read_response()
> - Remove unused macros
> - Add missing bitfield include (kernel test robot)
>=20
> Hugo Villeneuve (1):
>   drm: renesas: rz-du: Implement MIPI DSI host transfers
>=20
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 186 ++++++++++++++++++
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  54 +++++
>  2 files changed, 240 insertions(+)
>=20
>=20
> base-commit: 685c407f168cb49a12cc703230d1e2d62767bfd2
> --
> 2.39.5

Applied to drm-misc-next

Thanks,
Biju

