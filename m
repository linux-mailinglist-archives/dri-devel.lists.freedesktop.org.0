Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE78873AE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 20:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DA810F0DA;
	Fri, 22 Mar 2024 19:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PBwegXFB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7990D10F0DA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 19:15:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PK1ZbJx9DjmwOMhU30Klzm0ofl706Y37k902d6X2Sz67duUfkEiI7KEqJlM2jQGvTTQQGNHRuN/Avvqc7Uv0pVmPIYqB1vnrNEAzMzOs+38sbwjgrGZrzkDKVO+faRXPpySVInWgwgt6K926EcQXgyKC2d6/k26DEY8V+yarSTdRrrqHCSTDAjcGVF7yghuEd2yFDwy9BQTLxNiqy83WF21ygTDOJmXrLq/6mOkQW6asAjAUVmgxTfw7Y8PCWz4AgGAz8Pkis0pfRUxN23GDPoVhcR9QfEeQzFOusll2xMsRnMRyJlez1qP7nE2QIJ87RI++xeySoVC1pwnCGZSG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MekdISDQ1TZM+qZpdyZAV0e7ISX0CrRPCmPcsenNYcc=;
 b=QmXXRKdMI7sNxcRBGiE84yx2KTaRER/lSC/X9mBwia+VIvyEb3fO15FDoAHPgEJiXEpu4QAHRg9YGAAkQP9RPItoSKTMLJw58I7LOeVIW0bkvzaoC+cQRk/ZLQtIXyLQdZR2LdAwFSiXmdrECvfq3SLSeoNx48EIyNkv+uEzHOxib7RPi8Hf00vys6m4fiuQlyzqG4YaXNGt3TjPQYDldMHunv1NBs/ZkxLJf0B6nIxP8Syu9GzIrqATWsSokfzjhfPllS2Nt2wSG1qkVM74h61KVaL8y3QWciwAIVnWno65tlT7ejdCyWreH4VvEdhb8EGtIDg9JlJKNMn0K4VSAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MekdISDQ1TZM+qZpdyZAV0e7ISX0CrRPCmPcsenNYcc=;
 b=PBwegXFBQ4ZXf2KRvu0pQWa31rrLPf6ZkBjHARlhOpb9xOzARz8N0D24fAN3Ur6iX28Vz10+Q3KzeFh1ilJQfJxUIiHE8+u0HY9vitvJ6ClZBInyVeqpPfOixwNvuxqGyO4TOKF5E5iwVqnzmkTqUmgAZ5lO40upNAKlpRL5DkE=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 19:15:19 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7%4]) with mapi id 15.20.7386.031; Fri, 22 Mar 2024
 19:15:19 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Simek,
 Michal" <michal.simek@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas
 Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Subject: RE: [PATCH v3 7/9] drm/atomic-helper: Add select_output_bus_format
 callback
Thread-Topic: [PATCH v3 7/9] drm/atomic-helper: Add select_output_bus_format
 callback
Thread-Index: AQHae9CO/Tr0AMCKj0CJVuI96JUP97FDg30AgACewkA=
Date: Fri, 22 Mar 2024 19:15:19 +0000
Message-ID: <MW4PR12MB71657AF1E6B7AC96647133D6E6312@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
 <20240321-dp-live-fmt-v3-7-d5090d796b7e@amd.com>
 <20240322-passionate-lyrebird-of-trust-819718@houat>
In-Reply-To: <20240322-passionate-lyrebird-of-trust-819718@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|BY5PR12MB4116:EE_
x-ms-office365-filtering-correlation-id: c32740b9-8d54-4425-2007-08dc4aa46a08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BTsU6HnpezvyIbpzsncy5OTa/XtfPCSs3xDhqa9GNChQQi6fF7DyTvXnLA16NR0PJ2Ke+Yus3yqaHCcg7+zBzwSZrhWYOAePPtwvdRw5Mcf59eZn/Y4PviLuf8RJ2FJnay8J8n2EDtcEgqyngWPjKuviHtVR1bldF/2stWunXmqRDXtX4985MgjmL0UNnVO5hDWUe5RKnj5Buu2aHj8Rzx+OejYAiDwcjmSpi5CEmk3ihgSAfek4QFPCFlrq0oKEsbpTMVXVsYgkdo/5Q4H8iNSu4LZhSut5plpLmXvbs73wncq+4VC+GfGxi8flADFCCD37hWfl2qT23dWs/TeXxm7yX5LATMIXe3IhyJmDjyiQW+EO5jPpd7YErz94FrwH/IrrevfsDDlVQNE3FZVjd8TYrSFJucBZx5IHy+PDRYrujbFPPQHaXKF/uak8kZMAYbTsYXPR86rK6cn7Ib8FcAlf0xnXcbnvc7SF1qBzC3jdh1zCdO1H6xwFzu/wat2Rm8mdmVpOvmmgJY1DPnOKq8IwXcXkeYEYbIoEbQbu9UxP6TCZN/MDaVwy/5qzA31LcJ5q7kjjOUNnwluSLMtHi1BgsBGvTqNrFKWiAQq2HgwiRMTjDhXJUUWMD+lQRc4vmz68cOJ9P+yxS2a2OZFZcXUkfMVcMhzQMIUNW6ce9fuG0lWTjK9oenwo93aYxq/d6JNH9/Lsno6O3Ab3igz+Q63/a5Zx0T87J6EQ+g9F/HY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(7416005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KwVGEThl6V86wqEtJ5G9O3uX7hgmT0GyVKgLZCMBA/BnvO6f2iW4UDohFzts?=
 =?us-ascii?Q?OQOKZlg8XR4CpWG7H1RMIYIkNKDbOhEHU3iOBiKN4Tr0ShyxGrgncUzXkzlq?=
 =?us-ascii?Q?IRPr3yjMOb8JdTmPkhzwRPiiqau4GTJc03NuVD0mDZDURgBr8Mb+0Y1QW+Ex?=
 =?us-ascii?Q?wjMBLQWnzeqBkTN6CwEEtGeJk56Q+RyUSe6UJX0ivhwPYqCFJHQ8g+9tT0OA?=
 =?us-ascii?Q?pw5kxJ5kxFj50Rj7kbN9RiKHPLsMQHw6Sby3Gs27fETEP2h9b/Ao905PVQEu?=
 =?us-ascii?Q?A2e5xorCC7UvWUlZvSHXPm8NqbFub7mplDCwGbi3lIOttjZ2d0AXoJGobJ6k?=
 =?us-ascii?Q?MBDgm7thnznKmLZuA9+qmhgWF7RTg8wtgBa/klpszrB0ZjqiJ8XTYin60Kut?=
 =?us-ascii?Q?voobEM1P0NWnv16ZHiSpp2WZq/S2RTTax3xI4TuyoYU9ncyPbQmtDiHXHykJ?=
 =?us-ascii?Q?HgJmmEZN7B+nedsxtNjF6O3KMpGpahrSm4Yy4XZ0UqLcq9nmRLUOH0GoGVBo?=
 =?us-ascii?Q?fsHlTm2OsghosQW8/tjtVRWdWJhXoNUE3+gtLp7wxETYsDPx0DC2BgPXO2lv?=
 =?us-ascii?Q?Bmv83rk+oliFgsvvYs+bcJcNfd+RoJrk1eESIH6lOIXWqkvrib5CdNidYzyz?=
 =?us-ascii?Q?P1s2kriqcwYYvYQ2sHzUikxYH+s16l4UQLpHZHyMk89szTzQ0g65x01NpY/A?=
 =?us-ascii?Q?tFHDYg2t7uQB/tG1OFUrROwaKvdExM2IcJw/w/Qr4arvucJYeYxcARiwIMoe?=
 =?us-ascii?Q?xIvU4zkAfhYDSAUTOotjd9L7uyWCfYzSnpRh9PxubKCZbWtIPPgnb24zXxgQ?=
 =?us-ascii?Q?HIHn8eATtPtymEJsMU3NHnHs/ETur/ERNHWtGHgTl0/2zweZVoL2SLa3ttVq?=
 =?us-ascii?Q?MOxsLXPurFpSzcNNIAVRDahJsPYTDrngSnHP2AVkQbhJhTg0sHcLn5QOY8wR?=
 =?us-ascii?Q?rohmbzJjMQ1amPkDMowRnKXN2++/SmlpNxhYYGl0mtxyoX4WcMflq07FPG+h?=
 =?us-ascii?Q?f5A9CnH4E+zV7GEnqGTlijDPq37d3irdERuaj+oGBaqcar+d4GKFGkreXeom?=
 =?us-ascii?Q?MfgJrmXqqcyBCaGmVQIBqtK1qUz0+4KhYmoGxJehdejnlFjeA0vnT0sdAkea?=
 =?us-ascii?Q?p0mBCA2eHTR+D/LYm16c+4iA3YGxvR3plvOOY80W/S/ozeLrsF7BkMciK2sI?=
 =?us-ascii?Q?NFacOvdojndK5pmAi3ulgsqYFRevIiSvkAsyMECw5yeRp+gnyE0nlDDrvOD0?=
 =?us-ascii?Q?WcWhITgHPZloc+8jRV1tJYo9JUVGAFPkpzcYPmnb+a7dWBJS4GWOx8Xg+0Kr?=
 =?us-ascii?Q?V+I93IKMjzL6J4dQXAxm8PTDGBkXJlFY0MOen5UpD/8Irju2ILx1VkYBHI6V?=
 =?us-ascii?Q?trdirIkDOWVKGK6qVVZFoDkfaWJ0lLiwVgzNrIqypXSalK/5/fcqo4fk39zl?=
 =?us-ascii?Q?tgYtnQZXKbRFQhxj3ehycStFkXfWX0ItI8+nn+iB6H/N7E/9oYv5HSRMJlgW?=
 =?us-ascii?Q?qymyy+Ukq+NLOt9EDO0JPI3/D06HbIeZywPtURpGTmtAXFy/aJOW0xoqZ3Jz?=
 =?us-ascii?Q?WV2kNRijHvOzoTrt6gY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32740b9-8d54-4425-2007-08dc4aa46a08
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 19:15:19.3705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vs3wZcdgupwdjYK7S1camPKuIyqUx+QZDc5BHPVuDuGKXlksIlnUBz978UaEKQqEU53KP/9betpyP2qnn//ANA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
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

Hi Maxime,

Thank you for the review.

> -----Original Message-----
> From: Maxime Ripard <mripard@kernel.org>
> Sent: Friday, March 22, 2024 2:45 AM
> To: Klymenko, Anatoliy <Anatoliy.Klymenko@amd.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Maarten Lankhor=
st
> <maarten.lankhorst@linux.intel.com>; Thomas Zimmermann
> <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Daniel Vetter
> <daniel@ffwll.ch>; Simek, Michal <michal.simek@amd.com>; Andrzej Hajda
> <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@linaro.org>; Ro=
bert
> Foss <rfoss@kernel.org>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec
> <jernej.skrabec@gmail.com>; Rob Herring <robh+dt@kernel.org>; Krzysztof
> Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley
> <conor+dt@kernel.org>; Mauro Carvalho Chehab <mchehab@kernel.org>; Tomi
> Valkeinen <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.=
org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-media@vger.kernel.org
> Subject: Re: [PATCH v3 7/9] drm/atomic-helper: Add select_output_bus_form=
at
> callback
>=20
> On Thu, Mar 21, 2024 at 01:43:45PM -0700, Anatoliy Klymenko wrote:
> > diff --git a/drivers/gpu/drm/drm_crtc_helper.c
> > b/drivers/gpu/drm/drm_crtc_helper.c
> > index 2dafc39a27cb..f2e12a3c4e5f 100644
> > --- a/drivers/gpu/drm/drm_crtc_helper.c
> > +++ b/drivers/gpu/drm/drm_crtc_helper.c
> > @@ -1055,3 +1055,39 @@ int drm_helper_force_disable_all(struct
> drm_device *dev)
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_helper_force_disable_all);
> > +
> > +/**
> > + * drm_helper_crtc_select_output_bus_format - Select output media bus
> > +format
> > + * @crtc: The CRTC to query
> > + * @crtc_state: The new CRTC state
> > + * @supported_fmts: List of media bus format options to pick from
> > + * @num_supported_fmts: Number of media bus formats in
> > +@supported_fmts list
> > + *
> > + * Encoder drivers may call this helper to give the connected CRTC a
> > +chance to
> > + * select compatible or preffered media bus format to use over the
> > +CRTC encoder
> > + * link. Encoders should provide list of supported input
> > +MEDIA_BUS_FMT_* for
> > + * CRTC to pick from. CRTC driver is expected to select preferred
> > +media bus
> > + * format from the list and, once enabled, generate the signal accordi=
ngly.
> > + *
> > + * Returns:
> > + * Selected preferred media bus format or 0 if CRTC does not support
> > +any from
> > + * @supported_fmts list.
> > + */
> > +u32 drm_helper_crtc_select_output_bus_format(struct drm_crtc *crtc,
> > +					     struct drm_crtc_state *crtc_state,
> > +					     const u32 *supported_fmts,
> > +					     unsigned int num_supported_fmts) {
> > +	if (!crtc || !supported_fmts || !num_supported_fmts)
> > +		return 0;
> > +
> > +	if (!crtc->helper_private ||
> > +	    !crtc->helper_private->select_output_bus_format)
> > +		return supported_fmts[0];
> > +
> > +	return crtc->helper_private->select_output_bus_format(crtc,
> > +							crtc_state,
> > +							supported_fmts,
> > +							num_supported_fmts);
> > +}
>=20
> Again, the output of that selection must be found in the CRTC state, othe=
rwise
> CRTCs have no way to know which have been selected.
>=20

Yes, now I got it - thank you. I'll fix this in the next version.

> Maxime

Thank you,
Anatoliy
