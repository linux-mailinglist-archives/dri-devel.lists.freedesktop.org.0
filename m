Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A98924284
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 17:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF79310E639;
	Tue,  2 Jul 2024 15:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vz+IyPqC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2082.outbound.protection.outlook.com [40.107.114.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE3810E639
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 15:37:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+PHKyZhlAP0TYmWaI+Rifq8SwT60Qz2N6jYBGCHLV1oAU+uM5Dv1LcW34DyC7F77k2590+v93mvEd39eyOSGIdoNZN9SIQje1DtR+9KxUxwpjKGT2/Jpo6yI0yXo0jPvqJFJ8bbsuEBZo1CirYb9692LMvAGMCmP2QQdE7nLNLumhXu5fFPqHt55b5bMmf87/dsb2q8tjl0Q7VCbOYzE5hpQsHu1DFGQQ0+YWz5+u4Rz9JfOFInpf+CScyTbyn+Hug9Cko4X9Vm72LF2GlQAKNqukDAJH0Wfv2R+TUV3OMtxnPy8wilgN0SUeMbbnaVSZmOZsypv+uvIg3TfKaWRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89HztkbwXjWuw78gOXLxWLlgH59oZqjXbqeDOHkf+c8=;
 b=GYM7PTt5cprC6Irs9ou+9RD7I6dv4Zjti6DatE6HwIU9GbtZFn4U7ID8wJVo3xGKHEPs1UIJvf7kOJYetvEE4UvAoafgNKnnEjN+uOb8AmridwhLOP85L5Gnnpz3NRuNp4yRhbA3oOjdREFuQ/5RVbSmMByzfCsFN1Ko2NLGVHZmN36EfJ9pE1+MkoZOXZI4QlYNNrLVgW64vfPFBsTt/tV3dW8mg7JORKlgVdjL0nPzne2ilDSNakhogOEDQqdB5GSjWeOWjeOllWLW/jSn1rE3MO7ELKnTXKzyVBTN8y9QoaQHeFR2sTkSi7ddpig7GZXeZa54ncjOqYKVFJPhew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89HztkbwXjWuw78gOXLxWLlgH59oZqjXbqeDOHkf+c8=;
 b=vz+IyPqCO/7+Q/bWsFqGkgWlHuZe97Y2hWy4GJpkyohLEIem+KyAOOWXub6pktJocNxnPvOSLy78O3iynukQgSA+pYDwql5Fi3/BGQeyzqd41IT6gfnvBIjOeIuLHAHDvph6VsRdTJNfhumhR8K6n+DJ5Na0fVfQYEjItDqUgu0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6917.jpnprd01.prod.outlook.com (2603:1096:604:12c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Tue, 2 Jul
 2024 15:36:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 15:36:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH 3/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Thread-Topic: [PATCH 3/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Thread-Index: AQHazGTHQ9cZ4EeqwkOBDVP4aUPHjrHjha2AgAAH+fCAAASVgIAAABxQ
Date: Tue, 2 Jul 2024 15:36:51 +0000
Message-ID: <TY3PR01MB113466FDE1AFB49827CAAED8686DC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240702094630.41485-1-biju.das.jz@bp.renesas.com>
 <20240702094630.41485-4-biju.das.jz@bp.renesas.com>
 <20240702-choking-glitch-d97191325ac7@spud>
 <TY3PR01MB1134627D95970A6B463AC870B86DC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240702-flattery-statue-474590da5a20@spud>
In-Reply-To: <20240702-flattery-statue-474590da5a20@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6917:EE_
x-ms-office365-filtering-correlation-id: de455279-d800-4354-28f3-08dc9aaccb2d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Ajj2FNGIogWBu9fWLDGXDcqHslDoEl36Hu6Sk+na6o6KdJtccXxXEh6zWGE8?=
 =?us-ascii?Q?AnfTIXQgLBoMcLrTd52vGq6Wtc1e7jl0ace/e9Ev372LM1Urm7kZckPt8gAB?=
 =?us-ascii?Q?+7OXz9k00cYCbH63EpMfR6XV9jqQyjObrYlBkV6DiHvKTye3+nIEa/9+1yj6?=
 =?us-ascii?Q?AebQHSNhB6QZpLToXNUdQASE2SrJS6kIOymV2SxyO5phEcXK9cNrt6AxGDH+?=
 =?us-ascii?Q?jjTo16icrFZggNTId2HShKpJgVA2OS6wH9SOpT57+bR9t2agcnD6l6toYYxx?=
 =?us-ascii?Q?XtXBqBEa/PQts7/ZuiyI6+QMZf+HewPTwUb3iXa6WdrWZhCf2VKXW694wkvB?=
 =?us-ascii?Q?KLMSjXKqgsnmWek4c2YsqqNRf+CZf1iJzAI2gw6/REhTrOezv6Msq9Y4X5YE?=
 =?us-ascii?Q?//4T/7Hsx5+aezeZXXDaMt1DHCDvJA/0FztBX6cJNnybQmjDDl5iQr/7Wsx0?=
 =?us-ascii?Q?sww1q55t4lxKTMSbvqAY2xWI55TmU1BHOFujmYjTu35n/559mHcOZ25n5t+S?=
 =?us-ascii?Q?GLuHWR7K7ch88cszvhyC/n0iWrslmmNF5SSgHGrBOkFqq5ctOPCiMmrBRVD9?=
 =?us-ascii?Q?ty9tALe1si91dsln87Ba38nx5A4ImME2ETBJ/A5tzYdyB5oiGP5uue6Xhn++?=
 =?us-ascii?Q?HnQRF/4JQ/uuyaTOPSVv5NYxRUFvu+tCd5HeGGgwy0R/jkcuJwIPX1RsAm+T?=
 =?us-ascii?Q?4jS7vbrVDrj/rwW8Ts3RCDlB1e7IKFPgdHuclVZ6Qt5RDK4iYca1zoFdnzc4?=
 =?us-ascii?Q?h0zYFuSR1k4HacA/xqtMTFXKBMOtlms2AczxOfRoJZJsqy6TG1LHPQ9KE2dO?=
 =?us-ascii?Q?0epLHrzOLxNA9bNAktB+y7DmPrVWgpfOWh64gZ0L1VykfTaKsAPe48rlQ3Pr?=
 =?us-ascii?Q?BfFTInsbO6L7yUHOm6RQozQAZkx4TAj+4DcwnouEiACyNckNa46tyss/wC5S?=
 =?us-ascii?Q?bwjCmVG8LDYYjZLOMfKxv/PSkEDppv2BdM5Q8k3zuU21ukfczAVakFu0G8RA?=
 =?us-ascii?Q?ENGVWTxTub0bD9mSEt89027iPsI1UN/Y295sZVSwlwCwlsKyc62kWS4m/7sA?=
 =?us-ascii?Q?kO3EQTF7ga/1CHsCM7kXD5etyepbhEDSzVvtWZPup0xZlZ5oY+qdoCQa3LaZ?=
 =?us-ascii?Q?AMWscNuKeKCeYwpCiLKabxidmvZadq2aEUCnMiU11b9XKM6TZOwkvSAyFCbN?=
 =?us-ascii?Q?UNTUYAtALgo5hjXSHDtTrWmtGkR9sJlj411H9cuUXinaPvu3Unvg9FMzxENs?=
 =?us-ascii?Q?JaabdGVFGgDCKeoODkQJ6fVgZud46+MpBDIFa87KDK/civxaXOPAnfnzQC40?=
 =?us-ascii?Q?XI5c9zePl39ApwZ7EegKSLVMZVseAaHVSIhoEZhws+OqRNyyFZtTj03fUj97?=
 =?us-ascii?Q?y59zSxY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x6Ceg7SvSO8AsltWUP2f5l78OUbmHGLz4oeST09UHHhrBilyZ/XrXTPbdHIJ?=
 =?us-ascii?Q?JyXCaWIsmK3hpk0dzTT6DRjVe8goBZtQKwC9gH3fYOZ6j5ZEnsEDybESRHN/?=
 =?us-ascii?Q?nkfVvr1zbdlwPX6Hdb5XOaCV1I4E7rJPLqStevXg+VzJMzWZeYtoat0TsC/W?=
 =?us-ascii?Q?DsU2teBEdhFHHdA0NeEgTb0HPdIJ5yk50q8ZosbA8CwDyi11BRXUxAraF7vp?=
 =?us-ascii?Q?1IyMRZBVCUu30h6ke37v9LZbCll+qSb1WqtnW+tCVPDj6v1xaIo9mN9AiWU6?=
 =?us-ascii?Q?SCCs1jVHncSZg0UDBgYFGqj/DFwsNi0yWXIfJKOUq/jw/FH1UtSg3tj7YPX1?=
 =?us-ascii?Q?VyYhTQJ9cINcFsojwf8WAXUW1CA7Ut8ApZh+bjvuLoSnV4lFJhnklvBuvO+s?=
 =?us-ascii?Q?RUqEOdf0kmxq5m78ENIsWNwmZxN9HJQ1MZ7Cv+7STXaeRiDGPri+X8aChJwI?=
 =?us-ascii?Q?xcS4FZUd2X/wHEiaSH6dF+D/PbTXqr7RKOs1Jwrtk0Hf3OPIuL7xt5TLtp6x?=
 =?us-ascii?Q?jZWS84vlQnbL/C9mw+P3s6rlFUi4V0TVDveY+FgrPYQoFyW7v+PtI5sF0Mlr?=
 =?us-ascii?Q?9lydqq3eHZZjkyt9p7vebzB6iz5dNrZBxi6hAZUXbD4oC/EvWY6/m1LznBSx?=
 =?us-ascii?Q?kPzs5tZ5YIo6RRLICfF8Owosx1pDDX3VHKCzuTMhqPltwBKWr/Cx+6653YC3?=
 =?us-ascii?Q?fx+fWwYIS9DH+TfDR8Pgi8LV71hAqb4wx6PInpsemRo7RD99IpGbpnJqhmRc?=
 =?us-ascii?Q?PmHjJ5vt9zsUF1OCeiq2cm8S9quNRnyQgna995MS1mWCngYWil/8RpGCla22?=
 =?us-ascii?Q?qkAuonjSMoZaF6rzs3aS00ZwbRCndcJWU4x3E45RomHDJ/O1rmat2hW9FEaK?=
 =?us-ascii?Q?YWyK7wmhBm+/nz4l8+lW5rahQ4ol6PDsKUOcMDK8nYXbD1+eT2nOGNWjXMWL?=
 =?us-ascii?Q?ab5ht4kmLyfGlPKUgM5DVPPbPCoVxLjBuUJVmSFRnsCHS8m+OLB4ywmfu//C?=
 =?us-ascii?Q?kbsWlP36copj+tjL708nJZw7qfTxynv0TamG+Dtmy9AuCr29erJwSwZhjuTQ?=
 =?us-ascii?Q?A8vYmO+kP9TIYC4jsUnj/sehP/CcI9gix0bDyxfGmaT9uXmqBx9RwHT2CO6k?=
 =?us-ascii?Q?pkWK4ya161/pDPTSgtq/9s1SGsnCdXmpLB/0q3pTqy5DfN/k0V33oZpDmFvX?=
 =?us-ascii?Q?K0QgtfCR4QdB7qG6rKAtEHa2DwM/EgU5sRYtIJC72lI5QhMvT2PagWePH313?=
 =?us-ascii?Q?PxV/b6r6AWVwQYslaTyF90kNPFX3zGcSCkNHzy/uhAy8Nl6//jEv1cMmGcCv?=
 =?us-ascii?Q?VIPBdnzzetqQpVKP/kTuwWQGFjCZWNQTYkbJ11/Lnk47qjCAkuwkhFu+iOaX?=
 =?us-ascii?Q?ykg+t2Aks/hf8UddnAiIQO/4okW0RJV+0sNJXgUQMrwLhma9MT6ztp9IVbFc?=
 =?us-ascii?Q?YV27ejY8dgdGn6IrNGbMu9IMZ3lRtdQ1Wx0UOf0JyfsO2sOrz33KDMCmtT90?=
 =?us-ascii?Q?mSxHr9qp6CFpkKD5UjDQYUKYldhQGdnLZQysaKElTEd+rmWSMuXlM9v658lH?=
 =?us-ascii?Q?ThR6zv6ymnGCBklWcbe3GJfBSxkxiG1VfY9Y0qzT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de455279-d800-4354-28f3-08dc9aaccb2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 15:36:51.3186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UspVkT/tGXVi8QRrxtjXsh/YdMa78i9TLtSf1Bjdm/h3NiVtV+XYb3Ic7rHi51YunG2PuMUhPcahdFEf8kNpIPXnOdhXnISm6MXCILlCdkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6917
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

Hi Conor,

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Tuesday, July 2, 2024 4:36 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Subject: Re: [PATCH 3/9] dt-bindings: display: renesas,rzg2l-du: Document=
 RZ/G2UL DU bindings
>=20
> On Tue, Jul 02, 2024 at 03:33:17PM +0000, Biju Das wrote:
> > Hi Conor,
> >
> > Thanks for the feedback.
> >
> > > -----Original Message-----
> > > From: Conor Dooley <conor@kernel.org>
> > > Sent: Tuesday, July 2, 2024 3:51 PM
> > > Subject: Re: [PATCH 3/9] dt-bindings: display: renesas,rzg2l-du:
> > > Document RZ/G2UL DU bindings
> > >
> > > On Tue, Jul 02, 2024 at 10:46:13AM +0100, Biju Das wrote:
> > > > Document DU found in RZ/G2UL SoC. The DU block is identical to
> > > > RZ/G2L SoC, but has only DPI interface.
> > > >
> > > > While at it, add missing required property port@1 for RZ/G2L and
> > > > RZ/V2L SoCs.
> > >
> > > A new required property is an ABI break, it deserves more of an expla=
nation than "in passing..."
> >
> > RZ/G2L LCDC documents both port@0 and port@1 that is described here in
> > [1]
> >
> > [1]
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tr
> > ee/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml?h=3D=
n
> > ext-20240702#n59
> >
> > Unfortunately missed to add port@1 as required property.
> >
> > Currently there is no user for the DPI interface and there is no DPI
> > interface support in display driver. So, there is nothing for ABI
> > breakage.
> >
> > I will mention in the commit description that "currently there is no
> > user for the DPI interface and hence there won't be any ABI breakage
> > for adding
> > port@1 as required property for RZ/G2L and RZ/V2L SoCs".
>=20
> That seems reasonable. You can add my Acked-by with that wording update.

OK, will do.

Thanks,
Biju
