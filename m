Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A0ACEBDE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C2B10E0D3;
	Thu,  5 Jun 2025 08:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="FM8qdlbB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B073410E76D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 14:36:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBLf6sh+4Hmcst7OD8+QQoueAjdl0znvbbI/BCfXoJqTntGUqNV8Sw5eL5DEJQa4Vcsz1jZ7Wv2xgsoawc1EGqPD30bqMaZJDeU7hAAidxZ6wa4icbeOn353P+G1Cn51QbcReE+4Hu6ysGC43CmiSCixaUHar4Q9VkJoDodLo8xI6sLqGqXLDx7m6eVxiKoJv2ae2VBsRE37DhhKAAc+RQ77kPDn1roVluBJb24pNKfbLYTTF7CNy7A4zfUNKF3tg7sP9L7c+3Q3tBH5skOlYIc/ozzsVDAernflCyPFCxfdGNUkmVV4ig2w+2eBHb/KuHUUpRpdjZ/qV8cpNN03uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sfkCnhbjGmwxXyn9HpbA28AotFhvso36mNNQMQ+AY4=;
 b=PPIAXbwCAwfifnpgWqgAyJN1yzn10YkhbE5uTQ65lCliR74AmqMt17yaNM9VELUDNX6CkWwDswP6PKZ+wsh70k8BQxEeyErSohGGLsyS5ylg6lAP2IWUkBStEI9hV25jXkoW6dAZ9b794NsQ2JBTwHFkbTIYs1/M/7573M1fEgqWhq/lG5+Ixo80brW2/XzitlgqHqLk8DGuV7tGF6da2ccr8DtlNEKL2qX++EeOCm7nfVdvZORlxGRU+NFp5pPu34JZ1IVDwsmgyiiKDfKzQSEj8YPSrjtkoeI0fUn6+f63a5kL6pkjglSbBZ9hvaf9UaxZkfkBBUyQmGC3qIz8QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sfkCnhbjGmwxXyn9HpbA28AotFhvso36mNNQMQ+AY4=;
 b=FM8qdlbBYNHeZ/kTbEbaRbdkTA7kWH8qkXHRQ1/I7gkkxAdaeaxxKmCMyE2XTT+rUoyF7NFMqhYbK7Lu5cUZt5m+9GEYuGY5b3Tklnac1NlBMQpOqkUMPFTwzm+Z0Vvv/Qh0abm6pNwkk0AskIJMuiC1CW0pQ4/pjNomoFUl078=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TYAPR01MB6041.jpnprd01.prod.outlook.com (2603:1096:402:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 14:36:43 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5%5]) with mapi id 15.20.8813.020; Wed, 4 Jun 2025
 14:36:43 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: Biju Das <biju.das.jz@bp.renesas.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>
Subject: RE: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return packet
 size
Thread-Topic: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return
 packet size
Thread-Index: AQHbyydYZROipDs4Mk6V13hnElvTOLPy9BEwgAAgjQCAAA9nYA==
Date: Wed, 4 Jun 2025 14:36:43 +0000
Message-ID: <OS3PR01MB8319CB77A70EE45E7C5E17B48A6CA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250522143911.138077-1-hugo@hugovil.com>
 <20250522143911.138077-3-hugo@hugovil.com>
 <OS3PR01MB831999C4A5A32FE11CC04A078A6CA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <20250604093458.65c3999662a9fbc4d7cf22e5@hugovil.com>
In-Reply-To: <20250604093458.65c3999662a9fbc4d7cf22e5@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TYAPR01MB6041:EE_
x-ms-office365-filtering-correlation-id: 57b9320f-5d25-4b81-05f8-08dda37539e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?X/e4CKFo6hcf6Hb43TQq9y9ttb2FNWXFZaMNPG4JsCyofCWRh/rsEp/k5+/9?=
 =?us-ascii?Q?QJvRHr5v59En+uuARZeddCB+ImnFqgGXBq+kvS9TcqVJwmAFxmIbdk1p2uOW?=
 =?us-ascii?Q?4upGQEMBvaKh9howZr1DwMs1O2Y4XkeH+bjmNcdhnpC7LlvOCrSSjmQjT51X?=
 =?us-ascii?Q?S3tQo92NMvezUY2ZDMcq3U4U/cjFxzxk8cD8UlQ4ySqqeJyxlSfy2gDVLkEa?=
 =?us-ascii?Q?6ocQArCmTSfExRTE9nV9NEBguV3EpUojGQxIOc23moqvqXlODWZZCJpdwx2h?=
 =?us-ascii?Q?VduAOwKrMH8z46Dxhx6m03U3a4+8ilGTkmaL1aj5bcQsDskswSfUtYSFSfhu?=
 =?us-ascii?Q?QzDOM5PrYwCM/elcGvnbWy4khgh2R9Ak/3FHojMxH8oa0J5BBbtPXgTDFYUm?=
 =?us-ascii?Q?GDmllqIMhXYRYisGTp1D+fNq8dbLutQI/GAubvAMcvOE9Ak2dCvdKmCgD0Rc?=
 =?us-ascii?Q?NKj5OH4R43/ysSigk9QfcjEaKI/R1f+dOJM3oKOAKBu7g6LHqZqGdcGSTc1H?=
 =?us-ascii?Q?dud8P0V2h6s/vU+d9fpEq+gUXLR8fvwJWoIUOTYXLTRltpnSaHMSvWDlz8ug?=
 =?us-ascii?Q?QoxFbAxPq6SJw8I/NB1SCbWH0cKkNMG2PdpJAobMIVwHd44gyp0UbsAiasIo?=
 =?us-ascii?Q?3jF3hVM+jFYobB/vtIL/HNxjZDTJQa8HbtFXnuoAqugtLVQsuHwbf+i7qQhq?=
 =?us-ascii?Q?KVQcZr35jyDUNho8Kz3+SToOLNlS0/VJLEmakvZLsigWaptY0P4pgeheG6UT?=
 =?us-ascii?Q?1WU2A7DNgUp8q28XtESFCDT6gyJWdKfkDKSOsMu4vO4e0tKv77ywGd+WpqEc?=
 =?us-ascii?Q?2FK5/0m8MNGxnYHhKLKe2hg0SrnGNE28h23MYtB79ZdrPM//PTW+sMK5KWtF?=
 =?us-ascii?Q?4g7pp26yjhsoK2jQRoPQdcg7J+un0silJ0wnGtv0iu6v/nwS0USAay+XStL3?=
 =?us-ascii?Q?XRKYbKkWb26j1CUuqDpl5a6A/DnWraL7B2qTlkUk29GOOjliYnAnm9x0N3dr?=
 =?us-ascii?Q?q3ATAtM0Hi3N2up0TXOJo+OPmfN5T1dfmPDJJyAL9fqwpcMC7XzJzzJMoW9D?=
 =?us-ascii?Q?WnwUkXPZ4+R49fKamPR7nLw3hrBmr5UEWIxa+AYVpA5MwJoLvR0SKoHW1Qc9?=
 =?us-ascii?Q?hMV81wIJxMyYCn582t3M6200m67dxQieUOSKIvwnOEKTNHljCJR63Hk4nYEc?=
 =?us-ascii?Q?QoynYVHIORrcvkbLZAImZD9oLBO0m2r4unuHYWkr74CDFSw+H71aHf6pRZ/8?=
 =?us-ascii?Q?fUbasSxAYTFGnF5PXukMGopjRnId2EYJojb34cuRahYw1PBqdhdc3NoiGjoA?=
 =?us-ascii?Q?Rb87VZcHwXlvE/9Q7XBXT6JWlvkG7uLVfnKJ3SmpF6Z9wGhCLcbNhe9tks2M?=
 =?us-ascii?Q?P3u1CqSCDj+DxkdBW6tyqAatvtOwdH0j+TbkPQmmlDXF9b1gZiY4lZ0lZjBF?=
 =?us-ascii?Q?K1QI3Y8SS+IUvFcVAlpI0Waf7ybRZqNESpDHjZjsQDqmnM/Ac3uuDA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Dwx6B4JfxWeL2w2Q/bEgmCZTfkuqbrsXmPF7Y+jqGIWnrqwChwNbV7wiFv8/?=
 =?us-ascii?Q?6PNDpgWhS8NYhkmPiIeUVH8xMigBpcA2QGN18D2z379r7aOsg3U4R0ESoPFX?=
 =?us-ascii?Q?vxQIU3YUmhBeHGu0Qfyox/bX8qWBCGjPp2rTg8fq+RqN8B3TLurDMyk3jdWi?=
 =?us-ascii?Q?Q74VXRmFpSpZe0CYaLfToZMl+It5gVX0Us/CsNASrb32m3HvYKwMkxfwi4gE?=
 =?us-ascii?Q?l79qEGe0zp0rMNdOq3qT5sz6J/RnQAUFeS2OS8BvMLxsXOttGG0q7rTmRPDq?=
 =?us-ascii?Q?Y+PGBmpnm/iOcy6aAPRLUDr9c4s1EhkXylpNKLXV+g2FKHs5Qu7Ugo6HA6KU?=
 =?us-ascii?Q?4MVBoP+tzHpHQ476LHAuN6ykBZB9+JyGvuv5PPFUH/puKM6Gzmqt3BsQcv+S?=
 =?us-ascii?Q?rGl28Fwl0Up7Hkq4cB3CCo4WBTX9iFdy7WUbvruXoOf8233g/6AM+17Gxk6h?=
 =?us-ascii?Q?Yj22dj9QmDVbNGnIU5jmTDCDXK0q9EAaxQeV/buzErcpk5U266YwriIM/uPn?=
 =?us-ascii?Q?BTv4K571wQKCO0PjHuFXfocdsydidVTnsdgDuA1TLXwc5lUigEqBEtbr6XAE?=
 =?us-ascii?Q?xaOci3ePGGfzrOf24y+qKJBiKyENIOjsXaYVyRUyA8Da3fc7m6Silw93VEfB?=
 =?us-ascii?Q?N7g14jnHmjWa6UM1Dv5JphKuUBfEoqYiQWr+SXP7aL0O/Is+7eaSEcDvbOFo?=
 =?us-ascii?Q?9n4dbVx3ky0R/A1ZQ2glKumfjh/uuyBYubAjc532PzU9iixaKZIBColLo3zx?=
 =?us-ascii?Q?45VN3AncWOKfoKrv4qMszKYCvhQSzEC7Sm9aaAIdfDZmwOMnViK1aGCzYFEG?=
 =?us-ascii?Q?1/WA+GCG9qCVenPR64Vi8wjJYsmjqiscFLi7MlAKniWGZnS4Kw5KEV/piGwU?=
 =?us-ascii?Q?1r5sdeLoNDKwBTi86bMvBrKOhewOA8S5+9JcsiZt+HSRTPfn6TR4OyQ6FSV5?=
 =?us-ascii?Q?U5tYzP8bHvZE+YwBlBe7Aua7NEXAd3Mn5RNpNME8Vh4pKqEsfCWOufEE9JOK?=
 =?us-ascii?Q?mGiEt1GP9AFS5ztrCx9yCacMZ/9xoTH5YzD3ayrxD4b4CICKvQR07xpul4Jr?=
 =?us-ascii?Q?JViZB8Uc0B1vJM0Iqn4Cq6WOYufHLyaQpgp0OIL4y4gTEhoYfZl07M7Px15C?=
 =?us-ascii?Q?uY9QkScDVBVDnYOwAncJmXiSkY3/ONF3zPCa4wJox+4zrzVap977kW5h4jVs?=
 =?us-ascii?Q?P74ZkUO0Dsq8hNhVe5fgqt16JNq1h09CrsaLyPxY1jdXY2toocgCIZLQSSp4?=
 =?us-ascii?Q?Obgw3sCgCCYNgWNEnJ89bJxzipLJs9XmyjyX8eYPIe5jHMIrnnU9k7NAAIO6?=
 =?us-ascii?Q?oae+5mlPC+v3GEIWdPw5uO8AOIvE0HOJuTIpHHgl5mvfi8NMKWpW46UGuHNW?=
 =?us-ascii?Q?pOCSRawTVdgT2Zedl6MmEcLRRsmsnC1aTRnYP8S7o2p6I7SuTGTZjt8/Mdp2?=
 =?us-ascii?Q?AWKfPtxt288a0JN0M7Sw0/FpuDYh3yF1wOFX9O1o8+VxGfZfeczsVxYJHib4?=
 =?us-ascii?Q?eXKXBhARcuEX+OBOqYpZ8D1STaP3QWyU9j84GOoQV5jbop1MLW9iRI73D0uX?=
 =?us-ascii?Q?/32kXbbN5Tk0YSIhgdx/OGzvB2rkNtNHMx2L+T0b?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b9320f-5d25-4b81-05f8-08dda37539e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 14:36:43.3603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jcZ7lhXaZrTbyUBhNO6OaumWS2BK0HW4xumSN11swZuo/wt2o56i+75ST40Ua9BILHyaSJ0Xn+W59Px4a+26wPQCjYb8CG2L51Yqj4hJm+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6041
X-Mailman-Approved-At: Thu, 05 Jun 2025 08:29:58 +0000
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

Hi Hugo,

> Also, by default, most panels are configured to send a maximum of 1 byte,=
 so it is not absolutely required by default and not really a bug.

Thanks. I found that I needed to call mipi_dsi_set_maximum_return_packet_si=
ze() first in my panel driver, then I could receive multiple bytes.

Chris


-----Original Message-----
From: Hugo Villeneuve <hugo@hugovil.com>=20
Sent: Wednesday, June 4, 2025 9:35 AM
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>; maarten.lankhorst@linux.intel.co=
m; mripard@kernel.org; tzimmermann@suse.de; airlied@gmail.com; simona@ffwll=
.ch; dri-devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org; li=
nux-kernel@vger.kernel.org; Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return pac=
ket size

On Wed, 4 Jun 2025 11:54:28 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

Hi Chris,

> Hi Hugo,
>=20
> I'm fine with the code, but maybe it should go in a different location.
>=20
> Since it's a register setup, it should probably go in rzg2l_mipi_dsi_star=
tup() with the others.

It makes sense, I will move it there.

=20
> Additionally, since it is required to make=20
> rzg2l_mipi_dsi_host_transfer() operate properly, my suggestion is to add =
this to your previous patch instead of making it separate.
> Otherwise, it's like you are submitting one patch with a known bug, then =
immediately fixing it with a second patch.

I made it a separate patch to clearly show why this is needed, because it t=
ook me a lot of time to figure this out, and I didn't want that knowledge t=
o be lost :)

Also, by default, most panels are configured to send a maximum of 1 byte, s=
o it is not absolutely required by default and not really a bug.

But sure I can merge it, anyway my comment will clearly indicate why it is =
needed.

> This also would prevent the merge conflict with my patch that also modifi=
es rzg2l_mipi_dsi_atomic_enable().

Ok.

Hugo.


> Chris
>=20
>=20
> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: Thursday, May 22, 2025 10:39 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>;=20
> maarten.lankhorst@linux.intel.com; mripard@kernel.org;=20
> tzimmermann@suse.de; airlied@gmail.com; simona@ffwll.ch
> Cc: dri-devel@lists.freedesktop.org;=20
> linux-renesas-soc@vger.kernel.org; linux-kernel@vger.kernel.org;=20
> hugo@hugovil.com; Hugo Villeneuve <hvilleneuve@dimonoff.com>; Chris=20
> Brandt <Chris.Brandt@renesas.com>
> Subject: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return=20
> packet size
>=20
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>=20
> The default value of 1 will result in long read commands payload not bein=
g saved to memory.
>=20
> Fix by setting this value to the DMA buffer size.
>=20
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 10 ++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h |  4 ++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c=20
> b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index a048d473db00b..745aae63af9d8 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -549,6 +549,7 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_b=
ridge *bridge,
>  	const struct drm_display_mode *mode;
>  	struct drm_connector *connector;
>  	struct drm_crtc *crtc;
> +	u32 value;
>  	int ret;
> =20
>  	connector =3D drm_atomic_get_new_connector_for_encoder(state,=20
> bridge->encoder); @@ -561,6 +562,15 @@ static void=20
> rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> =20
>  	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> =20
> +	/*
> +	 * The default value of 1 will result in long read commands payload
> +	 * not being saved to memory. Set to the DMA buffer size.
> +	 */
> +	value =3D rzg2l_mipi_dsi_link_read(dsi, DSISETR);
> +	value &=3D ~DSISETR_MRPSZ;
> +	value |=3D FIELD_PREP(DSISETR_MRPSZ, RZG2L_DCS_BUF_SIZE);
> +	rzg2l_mipi_dsi_link_write(dsi, DSISETR, value);
> +
>  	ret =3D rzg2l_mipi_dsi_start_hs_clock(dsi);
>  	if (ret < 0)
>  		goto err_stop;
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h=20
> b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> index 0e432b04188d0..26d8a37ee6351 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -81,6 +81,10 @@
>  #define RSTSR_SWRSTLP			(1 << 1)
>  #define RSTSR_SWRSTHS			(1 << 0)
> =20
> +/* DSI Set Register */
> +#define DSISETR				0x120
> +#define DSISETR_MRPSZ			GENMASK(15, 0)
> +
>  /* Rx Result Save Slot 0 Register */
>  #define RXRSS0R				0x240
>  #define RXRSS0R_RXPKTDFAIL		BIT(28)
> --
> 2.39.5
>=20
>=20


--
Hugo Villeneuve
