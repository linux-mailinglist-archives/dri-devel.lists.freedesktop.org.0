Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6E38928CF
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 03:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43C210E529;
	Sat, 30 Mar 2024 02:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y4jl9Crp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2104.outbound.protection.outlook.com [40.107.223.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A49010E51E
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 02:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RizkHLvXtw5YCNpeH7yQf7jWVJEiGC8XKi0cniipfpFgvjgQNfL1EHPBdhcofeH5SmAuArmBGSWHsIvwbxTOzagqadLH4G4dQppL4CkBs/PRPfI4bZ1kKAFzuYcIApwtOm8PArl/v2UTjnxNXdnhiNQEC/vemv+Q0y47cCvUlQAVkPOd6STRCQKXE/2dvZpV59cxddCiZp0oYBUgNPwX9d9JGw2iwUCco+GyP0aa/eNEQpJQLvxIgpsKXZPAvkqiPMJmmwtjPioA99p/EdzqBbk9Ck6gQ0Q2odEGqsbnL5qG/DtYXjSSk3QgLFhgTipt6gkBC3UgAXWaFvuJRNv2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFrdI/+a9fd20Ujis877H7/rItG9XCCE15Dl4ufR0HI=;
 b=g6xF34NdptKLVEeBGO2X+AgWEmCePc5cmlSFbpPKHAA53KwOV0aV9PZ2fGvU2VcEYRe60h2F2Z9rZJnmGteLivW4T5h/mDw3keAA/UBVUhGgYUIu6mlufNGun/P8watKzHXKSnewnUQDgxXVNym7BMDPHUmbIBwieikK3NAyTQWKBrYdEoRlirAzWW/cXUAydpm1+dBAYo5JFFBg9RQL23qjg6uy9tV9OTvkfyoXAvIWPRpWR4G9Ba31213jTSH3LA3DgbCG72SWaL6XYlktv5fV9jdnFnByQWSBGwDqLVjSgNb5SRYM9Pcni5hMAxBaH60k21CHVphX8455Pybx1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFrdI/+a9fd20Ujis877H7/rItG9XCCE15Dl4ufR0HI=;
 b=y4jl9CrpkmKqXvEdDhEp4yJk3YTav1DPvvGfLVlAbw5Fdr9wqp71hJwF6pm/ZitEA8CfZ6pcO5HfPAqSb/O3C50HAYHat91/oRt74u0YVjS/UiRMqLw74h9PUsEl+UF+BKLcAXEvD8J+wjQ3lz6saJ8holAZrLrdLGl1b5/Hjq8=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by BY5PR12MB4068.namprd12.prod.outlook.com (2603:10b6:a03:203::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.41; Sat, 30 Mar
 2024 02:02:15 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7%4]) with mapi id 15.20.7409.031; Sat, 30 Mar 2024
 02:02:15 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Conor Dooley <conor@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Subject: RE: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindings
Thread-Topic: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindings
Thread-Index: AQHae9CWOJYT8G1vaUajPKAdUatgu7FDRIUAgADPWeCAAQwKAIAIv8BAgAEJYoCAAKRcwA==
Date: Sat, 30 Mar 2024 02:02:15 +0000
Message-ID: <MW4PR12MB7165E47719C72CD5CEB68218E6392@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
 <20240321-dp-live-fmt-v3-8-d5090d796b7e@amd.com>
 <a82d525c-737a-4ac4-9d71-e88f4ba69ea1@linaro.org>
 <MW4PR12MB7165889CE7F27A3F0B29DC7EE6312@MW4PR12MB7165.namprd12.prod.outlook.com>
 <c0d70ba9-34ef-4121-834d-4d107f03d7f0@linaro.org>
 <MW4PR12MB716570A3676218F0C6375E37E63A2@MW4PR12MB7165.namprd12.prod.outlook.com>
 <20240329-overture-tank-d20888f2cb6e@spud>
In-Reply-To: <20240329-overture-tank-d20888f2cb6e@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|BY5PR12MB4068:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RJibeOS7pyKaKGmMCJaeZJiGIOXWEOtXM2YcsSDzbo48N2oDBzvSaQ2HYbPaA4Ed8WKfArwiR6AltgxqEC8ihNeDAA4qI1XfyLTd3rbvI8P3yajPGXGuGIC/Z1x0LzUu6wve3qZWrEdzWCAoW8V6he8d3Zr2obxBlpa13C99xPDnaffesXEhag7UgufOPr2yteZX/inG5SnZun6SgLdLa2aDpo094JuQzVhJpXptuA+YiS5r9pKRDoPIR/LQw30AkFl6+gtSAGY4dWkqRMgm9d0vfcgcqLSwwFzk2PUGg7lvLpIuSt50OPCE9n2TZc+JjCK3eD41cd7rWHT+5fxXI5o/u5fQ3AGDybPfpH6cGYMpCHv5Xe0Hut7647oTfY0kaYsTGO9fqu05XUfkcnSxPqPzQW2m4YSsmZRzrBPJPyR1OuJyJM3/HC8XS9YAqL6nB2cC4jlRUg2jLTQqNxA5f3+39xeb+s0OkA1eYbFfK0UgRTybbq+FMBv2C6Nq0feaFhYMg9ucLOjJhxzlcCJlHNtTImzxk8yJcfeJYcVJmXlpD7F0PGPw9Y89155u3swh/I4HLbH8A850Ie+YTZopGLSqjLxDnmkP/i2EDxrfz03A7eBxj0yF55UTUKJv+McnB7qRYMxLmOKId4tQ/M67wWyzkDUicp3Q93DQ1ig1v88=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PCdvyZBcoJwxbz6H/JuA1UcBsBO5CCm4pg57WINkuMNoERhDiT9n5QOeGp7u?=
 =?us-ascii?Q?7u0V39JfFncoQAo7j+G8Zs+jpsBW/LA0WqCz2ekBpvJMCPWjqcP6bnGsuvji?=
 =?us-ascii?Q?RMhVutwYuH2ak7d6UyZYQ+Rj7qoIGtSdlu79XYYcd7YSn8dtRQrN2Ycj0ncN?=
 =?us-ascii?Q?2c1tdgSuulVzkZK0mbQVLT/PE+2ZtBGEABtIVnJcuc+HYFHMBwhy6K2gPKh9?=
 =?us-ascii?Q?GBFGKdF5LqSCs1Cpc3FZifFBub8LpwRd3Nvcf8qHrRx2p5npRy5LFGcia6sf?=
 =?us-ascii?Q?kbssyj7KbYqoQh36ZphS7a8u5g0JR5S2sBrZWPGVvlG7IU6MNcigZg1pFbF/?=
 =?us-ascii?Q?u+OjC3vkoOe7NpJX8irCgGWFSUQZZhXKuh4Wpj7N2t8ccdwSplcUWn+j4G5Y?=
 =?us-ascii?Q?x/VlnhOFf9eiFq2KZGfqob1dKgaYGzF970cN2DvTQFOgJXT+b652qrDrDkcA?=
 =?us-ascii?Q?JRgjgJQX74wARSCt+0Dw3dkxuHMb7Q4NBy8GHQclQJBIMdPq8rZ7o6/qyIo2?=
 =?us-ascii?Q?tTAb5MjDUhbotsADAzyf+i8Iw0NCRRi1BWmhLXbQ2ZTKUEX+hJ2x44N+1jIn?=
 =?us-ascii?Q?0YuC9BwISnCuoJitVgpvM6DFUnJ+VBKCnOPTQN+yBntHnSdslviMEwPVjXrT?=
 =?us-ascii?Q?ijzekrzfjOeYn/LaEaHovUP1L85fG+Ix+Uf+k2/wkzRJAKKOjToLG81Vvrea?=
 =?us-ascii?Q?Rg38CQYO77oZzaR3vQqqWM8F/pb5YtAY6s5IH007naEuEogpDCHcF0PgJlBI?=
 =?us-ascii?Q?w4zIAZXfXD6GDdyDpJDGDNS8L8pXIh1MdM9b1QCr0TyAsAaij9as4EIqThel?=
 =?us-ascii?Q?2OZyLWQvOFEmsZBg87gZaONTr8JMk7Ej3x2IX0TvtronQLPXzmaaqJsyjiRo?=
 =?us-ascii?Q?/KBxsX0/Xkl9vuIssT0SZaVz1wOpcYExUrJyzHiax5a/+QFZs0n94B/wsOhK?=
 =?us-ascii?Q?B/k18KL88jxpLsxK+sDnz3VSRSHHXjjTZiG+mW6CvefVpG7OvMnFC0szH7Xg?=
 =?us-ascii?Q?8Jc924BlkYzuumnGek/L3nHX2AVKCFz+3WQvKw6XEBjvJLuzT9xRW9tOBD1M?=
 =?us-ascii?Q?ryiJMeMrHZLqnpXbPz88HHLgEfIO/o2LIJtyUU+LnqkCte2jrFXtrfnUPbXC?=
 =?us-ascii?Q?S1QvjvcsXpLXGlAw/GPV7MOe3n+xmRoaFo8JnCZeOrw8FC3+z1PdnTnAQB3w?=
 =?us-ascii?Q?GWctnBJCWIULIqTKf6z2jEHsDq4/b8FaIQcqxo+dxaO/W/N7f6bON0XpatAR?=
 =?us-ascii?Q?ivT6MLGJwdvTQw96t+d1ukIgBMenppNFZT0b4BtVo4QwaFhbjxQVLZxi+2UE?=
 =?us-ascii?Q?rOhHRI85YeV/Nqg92hrXlzM4qGgQiQ9eEfvjzGrWKjCJoeThAB2o+CQb0HA1?=
 =?us-ascii?Q?/sxkFJ7y57hcEMHOZaSWrb0SnW01aG/ME32gaoayTmpZVZbMaMjJ1lM8URnt?=
 =?us-ascii?Q?DyU/Qy2oTHqYht9EoQ2wJEOYVhbn1wJHgAbxn8L6o7ndXe2pt2Y44FTWnyt1?=
 =?us-ascii?Q?82aQ4YXhuG6iZJ26325aXCy/zT7D7ia7A+Zs0umGmh4KekFxotkdQ4PaY905?=
 =?us-ascii?Q?GFsVyas4yBEPC45YMqQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c45a82d-3a99-4d84-ffbe-08dc505d6bf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2024 02:02:15.2277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a22Zv405TSk+Pa75bdaXjgDdNP6dLL+RGijPGg+UM3Ak/haHbxBFGxSka1bxWInOzAHrUwB6WrFgcpMWcb3ALw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4068
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



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Friday, March 29, 2024 8:47 AM
> To: Klymenko, Anatoliy <Anatoliy.Klymenko@amd.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>; Laurent Pinchar=
t
> <laurent.pinchart@ideasonboard.com>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Simek,
> Michal <michal.simek@amd.com>; Andrzej Hajda
> <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@linaro.org>;
> Robert Foss <rfoss@kernel.org>; Jonas Karlman <jonas@kwiboo.se>; Jernej
> Skrabec <jernej.skrabec@gmail.com>; Rob Herring <robh+dt@kernel.org>;
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley
> <conor+dt@kernel.org>; Mauro Carvalho Chehab <mchehab@kernel.org>;
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>; dri-
> devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
> media@vger.kernel.org
> Subject: Re: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindings
>=20
> On Fri, Mar 29, 2024 at 12:38:33AM +0000, Klymenko, Anatoliy wrote:
> > Thank you for the feedback.
> > > From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Subject: Re: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindin=
gs
> > > On 22/03/2024 20:12, Klymenko, Anatoliy wrote:
> > > >> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > >> On 21/03/2024 21:43, Anatoliy Klymenko wrote:
> > > >>> diff --git a/include/dt-bindings/media/media-bus-format.h
> > > >>> b/include/dt-
> > > >> bindings/media/media-bus-format.h
> > > >>> new file mode 100644
> > > >>> index 000000000000..60fc6e11dabc
> > > >>> --- /dev/null
> > > >>> +++ b/include/dt-bindings/media/media-bus-format.h
> > > >>> @@ -0,0 +1,177 @@
> > > >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> > > >>> +/*
> > > >>> + * Media Bus API header
> > > >>> + *
> > > >>> + * Copyright (C) 2009, Guennadi Liakhovetski
> > > >>> +<g.liakhovetski@gmx.de>
> > > >>> + *
> > > >>> + * This program is free software; you can redistribute it and/or
> > > >>> +modify
> > > >>> + * it under the terms of the GNU General Public License version =
2
> > > >>> +as
> > > >>> + * published by the Free Software Foundation.
> > > >>
> > > >> That's not true. Your SPDX tells something entirely different.
> > > >>
> > > >
> > > > Thank you - I'll see how to fix it.
> > > >
> > > >> Anyway, you did not explain why you need to copy anything anywhere=
.
> > > >>
> > > >> Specifically, random hex values *are not bindings*.
> > > >>
> > > >
> > > > The same media bus format values are being used by the reference
> > > > driver in patch #9. And, as far as I know, we cannot use headers fr=
om
> > > > Linux API headers directly (at least I
> > >
> > > I don't understand what does it mean. You can use in your driver
> whatever
> > > headers you wish, I don't care about them.
> > >
> > >
> > > noticed the same pattern in ../dt-bindings/sdtv-standarts.h for insta=
nce).
> > > What would be the best approach to reusing the same defines on DT and
> > > driver sides from your point of view? Symlink maybe?
> > > >
> > >
> > > Wrap your messages to match mailing list discussion style. There are =
no
> > > defines used in DT. If there are, show me them in *THIS* or other
> > > *upstreamed* (being upstreamed) patchset.
> > >
> >
> > Sorry, I didn't explain properly what I'm trying to achieve. I need to
> > create a DT node property that represents video signal format, one of
> > MEDIA_BUS_FMT_* from include/uapi/linux/media-bus-format.h. It would
> be
> > nice to reuse the same symbolic values in the device tree. What is the
> > best approach here? Should I create a separate header in
> > include/dt-bindings with the same or similar (to avoid multiple
> > definition errors) defines, or is it better to create a symlink to
> > media-bus-format.h like include/dt-bindings/linux-event-codes.h?
>=20
> Isn't there already a property for this, described in
> Documentation/devicetree/bindings/media/xilinx/video.txt
> ?

Those properties are very similar, indeed but not exactly the same. The
one you noticed maps Xilinx video data format on AXI4-Stream transport
that covers color space and chroma subsampling only. The rest of the
signal attributes are either conventional or left out. MEDIA_BUS_FMT_*
collection is more specific and embeds additional information about
video signals, like bits per component and component ordering.
