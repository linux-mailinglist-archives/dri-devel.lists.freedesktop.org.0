Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98CA83246B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 06:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CF610E132;
	Fri, 19 Jan 2024 05:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B0010E132
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 05:54:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Diucc11LzgZsOgW8H7bOdNN2E+GHyWby2PAonVzfhKRueIhAEf1xX466bVw2r3w4xibXlunOyLwMRe2RnqNZCwbD3W8hVZ+2l0YZU01rBN1ErLeRCUgjXJYb98xtI3Dt7cTM6pYvjQwVSXs/yUzjgA8E7DcVcyZdBXaM5eQWmrVsTAfsxyDS2iXUUuc6R07bMuYsvfAMockE3yqHyOC197QDDwNwJMDJh6aLC5ZgYoBBvvmFm4ey0P2S6Iy1ooX9VqTfogQg1XTZhML2nFptlaR3xXHpamHjKnuas6QTolO8RBYB1wHnvrbiUDKn3wm1Y1Pm03q7nZzGaaK5B7QrrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duKIqo95zlgZ1rfnxZUP/+U4hZe686F/V+q4OViqZog=;
 b=gqjdjnG9PJ9fH8zxS76244Fn47HYmdZ7xQWwSbKj9Wv5AAXQIiXe3vrD92v22a7DxV+CrH4sUKqJLHGRB157X/b68eOOjf4WagKbMqzGm4W6ggklprwCydljrFYSYiEBexmGdyH/rurmyKd+7HmKzZDsdHkVKf2wdjq8P1eOvz+Xf/FWVOpNGG4pLJwZDUgJD8QruAVmaEQkf9yHLOu89TnxhutdFt80Z+3/K8Giv7mrJUv1AMCJ7cRfgePXkuXKPqRQtMMQQ+pLwFSw8LqIZPH7j13//FQo2MntAYTTw09J/iXmXf6rVCaAhW1qz62fomV+hWJXBcQC3SYTMcvHKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duKIqo95zlgZ1rfnxZUP/+U4hZe686F/V+q4OViqZog=;
 b=xSGgKPQ9XhBbTqPiXA5B2p3mMcfL4pFNQ8mMW8xMTUdL6kbqEcgjnvsH5gbn9WgzVADg2+IK63fKN/k0lKjTOnECvTwxz65FufJ8eXsS36uX96svCiciN7lSBtAbVk/qiOgXfmYeF5m0PO+Ygt62/FakIZKxBvH9ElCzOd1MsmE=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by PH8PR12MB7255.namprd12.prod.outlook.com (2603:10b6:510:224::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 05:54:17 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::374b:e99d:5ba7:1ec0]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::374b:e99d:5ba7:1ec0%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 05:54:17 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] drm: xlnx: zynqmp_dpsub: Set live video in format
Thread-Topic: [PATCH 4/4] drm: xlnx: zynqmp_dpsub: Set live video in format
Thread-Index: AQHaSpvwV2ddKk4ewUCknT81gjayjg==
Date: Fri, 19 Jan 2024 05:54:17 +0000
Message-ID: <MW4PR12MB7165E6FFB4F51BAC5B814C9FE6702@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <mailman.1703.1705505585.2414.dri-devel@lists.freedesktop.org>
In-Reply-To: <mailman.1703.1705505585.2414.dri-devel@lists.freedesktop.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|PH8PR12MB7255:EE_
x-ms-office365-filtering-correlation-id: c91fb033-e3c4-4fc6-832a-08dc18b312bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B/FpLHUYGCwvS8CtOecPiVR88nFBGg1qLDCPr4oZ35gHxEs0ofV2wfpb36rMpkBTfrLgWOvdmq+oHKnlPzt0QudZMGs4LJL9yEPbfOGkdMVuHsnfyybiEIfDTfuCwruRbnzVq0uCa3pJ7YZe1tEZj221GJTfb8WRcq4wiXWQRlA+Co0LvpClNPO8P5npvoZ8553+B/vQH30cH2APT9e5E5QzU7fSQTDrvW7akFgvw1/lpiPdwvtaKwJFLZTvCi5CJ/Xv9gw781oA200c8jqVVoijqHIBrLx8Hqie+QQXzbzYgT8ly19yI+KitLnrhaGzINvSKWxt+kX2dzCKwCyoxB5y9YhW12ZanmSsbOv1kdAJLBdHiP+Ijh4M6F+PcvW87qzox4753zZ9+M9MkWndD2WRcPmNUlsQEZHwb198GgzHnU6TN/uqs8C9zEA3NwWy22aYs7cgyxNSvfZKK3ByU04M6dVWGXJtnlOItzon3jC8QVw2E1mtY9JVS7uqx4cvLL6wQBh3ApklYpQ1EMU5c7dX+SAx0NALl0I6BAgDqWliaNuueHA0hJKQL992j4xs1KPW3N3k4FtwjG3bPR1/ppAIRPtjmQ5FFQxUkImOD6eSSXz25DgbE7brLsMhn1uA567EMXyoFKQ7lRYoih0VoxGwrhKIKJ+o/YTgfWFw7fsFgeuwZSRg5aMYWMrjNj56
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(110136005)(9686003)(66446008)(122000001)(38100700002)(83380400001)(86362001)(33656002)(41300700001)(7696005)(6506007)(8936002)(8676002)(5660300002)(52536014)(316002)(66946007)(71200400001)(64756008)(66476007)(2906002)(7416002)(76116006)(66556008)(26005)(30864003)(53546011)(478600001)(921011)(38070700009)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VkgLyDy8m9+670oi5yWNmkvbUCIpqDJEiJGG6aqEZ2a9k/T586x8bBIi1uoe?=
 =?us-ascii?Q?rMTwj6bMB4sQxVJ6dnCSSjhgEgc2Ux9TrLI4s9RRqTApBnHmoNCGL+jHLWrk?=
 =?us-ascii?Q?K2ZwCyMJIbP7GlytXETVcwWNjQhMkea0qhVG7eCLdMrOlWAD005IT0CeGSi5?=
 =?us-ascii?Q?xYGxFtXrWwDyIuI9kKOMoc7Ff+jqPEjQozW5UQyt/O9bl+WtEO2dvZtbkmVh?=
 =?us-ascii?Q?OxcazZSBThlZW7FGGN0RNxUHTVTsf5wN0wKsAMX3gH9a+aVUzRaOEpCBrC+g?=
 =?us-ascii?Q?v90xemIH0hFJVGM6BJv1tSOCtUhnU6Chf4+eF5sHt7zba1gtXKPxR3ZhU0Z0?=
 =?us-ascii?Q?T/AmiKOqk3UiQOTU9AoM4A5/FF0WrRMYCMFmU8ZDYHFMqFJ7R1m2Clh2Ds5B?=
 =?us-ascii?Q?aPSBU+ejsBNQim0ShA1FCPZ968BK5YYl5OWG/n76i1/js97CKerndhlo5qR7?=
 =?us-ascii?Q?akY9HFUBwn53iTnPtKlHH9zkAFDMB5CstLmLJ362I2R/Zd8NCR6KZcZbMu4v?=
 =?us-ascii?Q?WclnEKxFC+EQpUgROSyG/2PSo6yj6fQXoO2kK92h0z/o64392DW5bg3/JdKG?=
 =?us-ascii?Q?gPh+2EOdrZif1dj5r2zP7uablTZ2VnGUSOPhSDICKDHQEdAzEqGbfeDKznn0?=
 =?us-ascii?Q?1psB+jV9KyNJFiUlrN/K/9SHjErnsNisOY3IOwtSMlLNMXAd33TaJ5VFcMJa?=
 =?us-ascii?Q?mXrYVsY7TX0flEBYtf1d7bLaicnuBaYJO7i7qM3Lm4rsONqLUwltjfrF6bpE?=
 =?us-ascii?Q?C4k+XRVRND3dS0g9ps4k1lEBKIFZpUixgZhh2e1igCPUtgLR0O+KzEtge+U/?=
 =?us-ascii?Q?btdTlpNKXXi7O/IiaVaFPd7naFb4DWXShZGnTYvVbRque4EDQgxI/LyUlUP5?=
 =?us-ascii?Q?d0SY12C+eTq+Rbz7OTdNQxHvdkCp61CrLoHiXBovoGUvixuEeSODPGa2geJ2?=
 =?us-ascii?Q?LJ2X+ZIUUC3zTA/ORWTQ8KncRsnTQzsTetr9lkDMXrxPmKZVPzt5/cHWlo4I?=
 =?us-ascii?Q?1cBMobtnoMUNsM/LIQqFMv8RwBXP6VqNXPGeo5kt4dt9Db0W+ml4wuxCis9J?=
 =?us-ascii?Q?w3T4N0E39elfgNFUaFIHnU+suy+jGQO6ZxiC2oIFfR/fBqpQgkVLXTlxa+XY?=
 =?us-ascii?Q?TlZdjbhP1pUoNeaaFY4KiltUfj8ozDALiZp2C2o6YvMwR3o5whVT7dzcbBxJ?=
 =?us-ascii?Q?6akjUHLyBHZ8L8/JtvXZlRXKHbW/BVqQFJ+ZPgMUhQ9zv8NDv+MitVyKHL6b?=
 =?us-ascii?Q?wvYSN41CN6rv7hjujT9Q91v4+fgPwKkjSFuT/Si2glMrYc28UQylCtCpHq+K?=
 =?us-ascii?Q?dDOF7Z22gxyJm53hIoOL35SFcfITePYHXugxMkME7Hfi/Y8OsxLJ46uyHSL7?=
 =?us-ascii?Q?RSoIECCQO2fxyghEA1SKKb/GVfIDDr9Bwqc8FFa5+48sgVOwJMy8AXW5lxeC?=
 =?us-ascii?Q?oOPAKUT73nAx32A85zHgV4yUjjwodQwTaJOXINkdDPG50KxrMym13MGfvFZz?=
 =?us-ascii?Q?uUKfmpSX2Sd+Y6QYaqw3JKz1m1fPQGbQUqR0ik1Ij7iq6TC8qsCCfqV6jXry?=
 =?us-ascii?Q?JSUNlmi9BLyNZUo8wwQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91fb033-e3c4-4fc6-832a-08dc18b312bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 05:54:17.1713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EixLxEQ8r7QF5QSnOlRaCo+52jyoJ6/3n+Vhn9H6ZKCvbZq5xeo7B3CXGrNDBeopDxTmSmsqwn3gE3FZJ2QuFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7255
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

Hi Tommy,

Thank you for the comments.

> Date: Wed, 17 Jan 2024 17:32:57 +0200
> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
>         laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.=
com,
>         mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
>         daniel@ffwll.ch, michal.simek@amd.com,
>         dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead=
.org,
>         linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 4/4] drm: xlnx: zynqmp_dpsub: Set live video in
>         format
> Message-ID: <dc0c448e-f03d-43ea-b571-3e96d859f89b@ideasonboard.com>
> Content-Type: text/plain; charset=3DUTF-8; format=3Dflowed
>=20
> Hi Anatoliy,
>=20
> On 13/01/2024 01:42, Anatoliy Klymenko wrote:
> > Live video input format is expected to be set as "bus-format" property
> > in connected remote endpoint.
> > Program live video input format DPSUB registers.
> > Set display layer mode in layer creation context.
>=20
> Some comments inline below. But one thing to improve is the commit desc.
>=20
> I think this needs more explanation on what's the issue here. So basicall=
y
> something like what's the feature in question, why it's not working or wh=
at's
> missing, and what does this patch do to get it working.
>=20
> And while often it's reasonable to expect some level of understanding of =
the HW
> in question, it doesn't hurt to give some clarifications on the names use=
d (here the
> "live video input").
>=20

Sure, good point, how about something like
"    ZynqMP DPSUB supports 2 modes of operations in regard to video data
    input.

    In the first mode, DPSUB uses DMA engine to pull video data from memory
    buffers. To support this the driver implements CRTC and DRM bridge
    representing DP encoder.

    In the second mode, DPSUB acquires video data pushed from FPGA and
    passes it downstream to DP output. This mode of operation is modeled in
    the driver as a DRM bridge that should be attached to some external
    CRTC. DPSUB supports multiple input data formats. In order to properly
    operate exact media bus format should be negotiated between external
    CRTC and DPSUB bridge. DRM framework provides a mechanism to negotiate
    media bus formats between bridges connected into a chain, but not
    between CRTC and encoder (first bridge in the chain). This change
    mitigates the issue for FPGA based CRTC, which would typically have a
    single fixed media bus format.

    Expect live video input format to be set as "bus-format" property in
    connected remote endpoint.

    Set display layer mode in the layer creation context."?

> > Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> > ---
> >   drivers/gpu/drm/xlnx/zynqmp_disp.c      | 109 ++++++++++++++++++++++-=
-
> >   drivers/gpu/drm/xlnx/zynqmp_disp.h      |   3 +-
> >   drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |   8 +-
> >   drivers/gpu/drm/xlnx/zynqmp_dp.c        |   2 +-
> >   drivers/gpu/drm/xlnx/zynqmp_kms.c       |   2 +-
> >   5 files changed, 107 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > index 8a39b3accce5..83af3ad9cdb5 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > @@ -20,8 +20,10 @@
> >   #include <linux/dmaengine.h>
> >   #include <linux/module.h>
> >   #include <linux/of.h>
> > +#include <linux/of_graph.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/slab.h>
> > +#include <linux/media-bus-format.h>
>=20
> Alphabetical order, please.

Got it - will fix in the next version.

>=20
> >   #include "zynqmp_disp.h"
> >   #include "zynqmp_disp_regs.h"
> > @@ -67,12 +69,16 @@
> >   /**
> >    * struct zynqmp_disp_format - Display subsystem format information
> >    * @drm_fmt: DRM format (4CC)
> > + * @bus_fmt: Live video media bus format
> >    * @buf_fmt: AV buffer format
> >    * @swap: Flag to swap R & B for RGB formats, and U & V for YUV forma=
ts
> >    * @sf: Scaling factors for color components
> >    */
> >   struct zynqmp_disp_format {
> > -     u32 drm_fmt;
> > +     union {
> > +             u32 drm_fmt;
> > +             u32 bus_fmt;
> > +     };
> >       u32 buf_fmt;
> >       bool swap;
> >       const u32 *sf;
> > @@ -354,6 +360,16 @@ static const struct zynqmp_disp_format
> avbuf_gfx_fmts[] =3D {
> >       },
> >   };
> >
> > +/* TODO: add support for different formats */ static const struct
> > +zynqmp_disp_format avbuf_live_vid_fmts[] =3D {
> > +     {
> > +             .bus_fmt        =3D MEDIA_BUS_FMT_UYVY8_1X16,
> > +             .buf_fmt        =3D ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 =
|
> > +                               ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV4=
22,
> > +             .sf             =3D scaling_factors_888,
> > +     }
> > +};
> > +
> >   static u32 zynqmp_disp_avbuf_read(struct zynqmp_disp *disp, int reg)
> >   {
> >       return readl(disp->avbuf.base + reg); @@ -369,6 +385,34 @@
> > static bool zynqmp_disp_layer_is_video(const struct zynqmp_disp_layer *=
layer)
> >       return layer->id =3D=3D ZYNQMP_DPSUB_LAYER_VID;
> >   }
> >
> > +/**
> > + * zynqmp_disp_avbuf_set_live_format - Set live input format for a
> > +layer
> > + * @disp: Display controller
> > + * @layer: The layer
> > + * @fmt: The format information
> > + *
> > + * Set the live video input format for @layer to @fmt.
> > + */
> > +static void zynqmp_disp_avbuf_set_live_format(struct zynqmp_disp *disp=
,
> > +                                           struct zynqmp_disp_layer *l=
ayer,
> > +                                           const struct
> > +zynqmp_disp_format *fmt) {
> > +     u32 reg, i;
> > +
> > +     reg =3D zynqmp_disp_layer_is_video(layer)
> > +         ? ZYNQMP_DISP_AV_BUF_LIVE_VID_CONFIG
> > +         : ZYNQMP_DISP_AV_BUF_LIVE_GFX_CONFIG;
> > +     zynqmp_disp_avbuf_write(disp, reg, fmt->buf_fmt);
> > +
> > +     for (i =3D 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; ++i) {
> > +             reg =3D zynqmp_disp_layer_is_video(layer)
> > +                 ? ZYNQMP_DISP_AV_BUF_LIVD_VID_COMP_SF(i)
> > +                 : ZYNQMP_DISP_AV_BUF_LIVD_GFX_COMP_SF(i);
> > +             zynqmp_disp_avbuf_write(disp, reg, fmt->sf[i]);
> > +     }
> > +     layer->disp_fmt =3D fmt;
> > +}
> > +
> >   /**
> >    * zynqmp_disp_avbuf_set_format - Set the input format for a layer
> >    * @disp: Display controller
> > @@ -902,15 +946,12 @@ u32 *zynqmp_disp_layer_drm_formats(struct
> zynqmp_disp_layer *layer,
> >   /**
> >    * zynqmp_disp_layer_enable - Enable a layer
> >    * @layer: The layer
> > - * @mode: Operating mode of layer
> >    *
> >    * Enable the @layer in the audio/video buffer manager and the blende=
r. DMA
> >    * channels are started separately by zynqmp_disp_layer_update().
> >    */
> > -void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer,
> > -                           enum zynqmp_dpsub_layer_mode mode)
> > +void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
> >   {
> > -     layer->mode =3D mode;
> >       zynqmp_disp_avbuf_enable_video(layer->disp, layer);
> >       zynqmp_disp_blend_layer_enable(layer->disp, layer);
> >   }
> > @@ -950,11 +991,12 @@ void zynqmp_disp_layer_set_format(struct
> zynqmp_disp_layer *layer,
> >       layer->disp_fmt =3D zynqmp_disp_layer_find_format(layer, info->fo=
rmat);
> >       layer->drm_fmt =3D info;
> >
> > -     zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt)=
;
> > -
> > -     if (!layer->disp->dpsub->dma_enabled)
> > +     /* Live format set during layer creation */
> > +     if (layer->mode =3D=3D ZYNQMP_DPSUB_LAYER_LIVE)
> >               return;
> >
> > +     zynqmp_disp_avbuf_set_format(layer->disp, layer,
> > + layer->disp_fmt);
> > +
> >       /*
> >        * Set pconfig for each DMA channel to indicate they're part of a
> >        * video group.
> > @@ -1083,7 +1125,7 @@ static int zynqmp_disp_layer_request_dma(struct
> zynqmp_disp *disp,
> >       unsigned int i;
> >       int ret;
> >
> > -     if (!disp->dpsub->dma_enabled)
> > +     if (layer->mode =3D=3D ZYNQMP_DPSUB_LAYER_LIVE)
> >               return 0;
> >
> >       for (i =3D 0; i < layer->info->num_channels; i++) { @@ -1104,6
> > +1146,43 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp
> *disp,
> >       return 0;
> >   }
> >
> > +/**
> > + * zynqmp_disp_get_live_fmt - Get live video format
> > + * @disp: Display controller
> > + * @layer: Display layer
> > + *
> > + * Parse connected remote endpoint and retrieve configured bus-format
> > + *
> > + * Return: live format pointer on success, NULL otherwise  */ static
> > +const struct zynqmp_disp_format *zynqmp_disp_get_live_fmt(struct
> zynqmp_disp *disp,
> > +                                                              struct
> > +zynqmp_disp_layer *layer) {
> > +     struct device_node *local, *remote, *dpsub =3D disp->dev->of_node=
;
> > +     int rc, i;
> > +     u32 fmt;
> > +
> > +     local =3D of_graph_get_endpoint_by_regs(dpsub, layer->id, -1);
> > +     if (!local)
> > +             return NULL;
> > +
> > +     remote =3D of_graph_get_remote_endpoint(local);
>=20
> The "remote" here is some PL component that provides the live stream?
> I'm not sure if there's a rule for these, but I think usually a driver sh=
ould only read
> its own properties. I would add 'bus-format' to dp endpoint's DT data.
>=20

The point is that bus format limitation is imposed by FPGA IP (AXI-S to Nat=
ive Video Converter to be precise), and from a topology point of view, it s=
hould attribute the corresponding device tree node. Moving this property to=
 the DPSUB node may simplify the driver but would decouple the property fro=
m the attributed entity.

> > +     of_node_put(local);
> > +     if (!remote)
> > +             return NULL;
> > +
> > +     rc =3D of_property_read_u32_index(remote, "bus-format", 0, &fmt);
>=20
> Does this require a change to the DT bindings?
>=20

This will require an update of DT documentation for a few soft IP drivers i=
n the Xilinx downstream kernel. No changes in the upstream kernel are neede=
d.

> Why is this not of_property_read_u32()?
>=20

You are correct - it should be of_property_read_u32(). I will fix it in the=
 next version. Thank you.

> > +     of_node_put(remote);
> > +     if (rc)
> > +             return NULL;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(avbuf_live_vid_fmts); ++i)
> > +             if (avbuf_live_vid_fmts[i].bus_fmt =3D=3D fmt)
> > +                     return &avbuf_live_vid_fmts[i];
> > +
> > +     return NULL;
> > +}
> > +
> >   /**
> >    * zynqmp_disp_create_layers - Create and initialize all layers
> >    * @disp: Display controller
> > @@ -1130,9 +1209,15 @@ static int zynqmp_disp_create_layers(struct
> > zynqmp_disp *disp)
> >
> >       for (i =3D 0; i < ARRAY_SIZE(disp->layers); i++) {
> >               struct zynqmp_disp_layer *layer =3D &disp->layers[i];
> > +             const struct zynqmp_disp_format *disp_fmt;
> >
> >               layer->id =3D i;
> >               layer->disp =3D disp;
> > +             /* For now we assume dpsub works in either live or non-li=
ve mode for
> both layers.
> > +              * Hybrid mode is not supported yet.
> > +              */
> > +             layer->mode =3D disp->dpsub->dma_enabled ?
> ZYNQMP_DPSUB_LAYER_NONLIVE
> > +                                                    :
> > + ZYNQMP_DPSUB_LAYER_LIVE;
> >               layer->info =3D &layer_info[i];
> >
> >               ret =3D zynqmp_disp_layer_request_dma(disp, layer); @@
> > -1140,6 +1225,12 @@ static int zynqmp_disp_create_layers(struct
> zynqmp_disp *disp)
> >                       goto err;
> >
> >               disp->dpsub->layers[i] =3D layer;
> > +
> > +             if (layer->mode =3D=3D ZYNQMP_DPSUB_LAYER_LIVE) {
> > +                     disp_fmt =3D zynqmp_disp_get_live_fmt(disp, layer=
);
> > +                     if (disp_fmt)
> > +                             zynqmp_disp_avbuf_set_live_format(disp, l=
ayer, disp_fmt);
> > +             }
> >       }
> >
> >       return 0;
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h
> > b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> > index 123cffac08be..f3357b2d5c09 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> > @@ -62,8 +62,7 @@ void zynqmp_disp_blend_set_global_alpha(struct
> > zynqmp_disp *disp,
> >
> >   u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
> >                                  unsigned int *num_formats); -void
> > zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer,
> > -                           enum zynqmp_dpsub_layer_mode mode);
> > +void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
> >   void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
> >   void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
> >                                 const struct drm_format_info *info);
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
> > b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
> > index f92a006d5070..926e07c255bb 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
> > @@ -165,10 +165,10 @@
> >   #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_10               0x2
> >   #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_12               0x3
> >   #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_MASK
> GENMASK(2, 0)
> > -#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB               0x0
> > -#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444    0x1
> > -#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422    0x2
> > -#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY     0x3
> > +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB               0x00
> > +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444    0x10
> > +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422    0x20
> > +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY     0x30
>=20
> What's this about? Were these wrong before? Sounds like a separate patch
> needed for these.
>=20

It is an embedded bit shift that corresponds to DPSUB live video / gfx form=
at register layout. Original values are technically correct but would requi=
re extra bit shifts to operate with. The current patch is the first instanc=
e of actual use of those defines. Do you think it's worth to factor those c=
hanges out into a separate patch?

> >   #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_MASK
> GENMASK(5, 4)
> >   #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_CB_FIRST             BIT(8)
> >   #define ZYNQMP_DISP_AV_BUF_PALETTE_MEMORY           0x400
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index 571c5dbc97e5..59616ed1c3d9 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -1295,7 +1295,7 @@ static void zynqmp_dp_disp_enable(struct
> zynqmp_dp *dp,
> >       /* TODO: Make the format configurable. */
> >       info =3D drm_format_info(DRM_FORMAT_YUV422);
> >       zynqmp_disp_layer_set_format(layer, info);
> > -     zynqmp_disp_layer_enable(layer, ZYNQMP_DPSUB_LAYER_LIVE);
> > +     zynqmp_disp_layer_enable(layer);
> >
> >       if (layer_id =3D=3D ZYNQMP_DPSUB_LAYER_GFX)
> >               zynqmp_disp_blend_set_global_alpha(dp->dpsub->disp,
> > true, 255); diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> > b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> > index db3bb4afbfc4..43bf416b33d5 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> > @@ -122,7 +122,7 @@ static void
> > zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
> >
> >       /* Enable or re-enable the plane if the format has changed. */
> >       if (format_changed)
> > -             zynqmp_disp_layer_enable(layer, ZYNQMP_DPSUB_LAYER_NONLIV=
E);
> > +             zynqmp_disp_layer_enable(layer);
> >   }
> >
> >   static const struct drm_plane_helper_funcs
> > zynqmp_dpsub_plane_helper_funcs =3D {
>=20
>=20

Thank you,
Anatoliy
