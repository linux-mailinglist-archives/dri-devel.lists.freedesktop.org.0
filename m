Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5443D3CCA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 17:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC026E952;
	Fri, 23 Jul 2021 15:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6703D6E868;
 Fri, 23 Jul 2021 15:50:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5O9lVeZ5VHNbo9OVAUVUZQLDo+ayL84JXIZsgu+I8KzawZiN+upG+mRmAJAaaWtLteUBYPlGpVztlkQzjPBLF5/OwJG8+ayU0AEYB2dW3i2KLpyh0K3tEGAIUL1mqYPBphqP/Qh2FY3Fua4kqHCoH2HNKruiqdaFTodlV4Zg1ed/GLVptM1nppXdnJzAgre7LRono1Rcd/HsCApwktXAohbuJSohsQpBTxe035icfFqaZexIw17bhtHMTzHKxek3iddpHwNraHIsACr0h55cIVk6lw9+GEmytBWXKbrO+tL1SX7CjrEX/4AGTx4X36avYvGaXzhplZ+qsX14ZCYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kih5xI8JwWfEnJYr+ijrCdhyxXMbXW6VlKrggUOxj1E=;
 b=D2RuwaIDGLqKLrLgqUJr4nOCm/KUv9oqWkRbwmtyQEQrL2Wzm6syZCx4Oy9vJg1YfhU85CsJTzV4P7bgSIOOeG4/vR+6AcIiiVNXGCS4xCxjXOT6aJyPbtT4QO/4XUqHQ/REJfzE3XdRZjwyFMJhENN5T1OuaT9xDqO0S8rCfTe1JBeWcBrMlqmCSckIkYUaEPqfzCbelsoctcfAtXwmtHK16gUFyZkTft9TSRa0eqTn6Ov9vtGWGbGBnRpeRMGdgpNmXti+vTooly9MLRMXf92+0jqEh6gQTyla/pwLj9E/4M+Ka6gkQuczCRMlNQX5L7xDjschWM2LuLiPM78WXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kih5xI8JwWfEnJYr+ijrCdhyxXMbXW6VlKrggUOxj1E=;
 b=pcsw2zijtyn6iOHtlXpulMpF8SMqiM3Ky4BeIQ8783I9bz5HTgEbIof8y+kBqL3xr8sQGHpY0aH/jERLKVh/l/WNmHjqrpsa26Q87LtStyBRS4DsWj55Mno8ounIsQZ4Nj0nfIrbWj3mDaCNNbqJ/wEv1gkhJSlJiAVFXDpTqK4=
Received: from BYAPR12MB3221.namprd12.prod.outlook.com (2603:10b6:a03:135::29)
 by BY5PR12MB3906.namprd12.prod.outlook.com (2603:10b6:a03:1a9::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Fri, 23 Jul
 2021 15:50:33 +0000
Received: from BYAPR12MB3221.namprd12.prod.outlook.com
 ([fe80::945b:ed20:571c:3525]) by BYAPR12MB3221.namprd12.prod.outlook.com
 ([fe80::945b:ed20:571c:3525%3]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 15:50:32 +0000
From: "Taylor, Ryan" <Ryan.Taylor@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: replace dce_virtual with amdgpu_vkms (v3)
Thread-Topic: [PATCH 3/3] drm/amdgpu: replace dce_virtual with amdgpu_vkms (v3)
Thread-Index: AQHXflLlrW+DvOZs70Kn4juiIxTV36tQor8AgAAQCSI=
Date: Fri, 23 Jul 2021 15:50:32 +0000
Message-ID: <BYAPR12MB32218D88F93BC85251C9C483EAE59@BYAPR12MB3221.namprd12.prod.outlook.com>
References: <20210721170705.4201-1-Ryan.Taylor@amd.com>
 <20210721170705.4201-4-Ryan.Taylor@amd.com>,
 <CADnq5_PejZBML=rjvnyi1s-cbe0vxnRt0sNxu_V9FR1cHrmsFA@mail.gmail.com>
In-Reply-To: <CADnq5_PejZBML=rjvnyi1s-cbe0vxnRt0sNxu_V9FR1cHrmsFA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-07-23T15:50:32.236Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c0a4426-db3b-4e94-5559-08d94df19ac8
x-ms-traffictypediagnostic: BY5PR12MB3906:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB3906EC7F3A53744C7CDB2A99EAE59@BY5PR12MB3906.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mcRyZ+fwGEuVkJ+zVON13cg0Ywq0BHrsuo8d7Zgcib5oIrRhP0J4kL+GXgUIJbAu9OEJsGoRdqAJxGJ6FeV9FpVb3uESdzRJjWhsTQXRjczm3RVrdzl3ZCE5BQHJt7k/f/wDxfacdHfrI129Jwi3dSSVYSKMmpXJEcVQ5nODbed1BNKRDJIIvqycWmx37CyHPbq2UK80+St+A16wRDAZDzjSDm4bYw/3iEZeWRzrFAIQIn4KfWUjTE2xHm+9wV0NwBrcPFkw3U6WzQ5K4Y3F19lRJLYCYbynTuOWrsE11/P+rk+XzEEO/EwFLQDYcIZt3aGhIh9927tTsSrGvzLMSnXYzbcoZHXcxPvej8BO+YtPjPcnaY2i5EvYldr/6K/0tnXdPKB/pBNFPj+dRP22c3jcbxN1H6pOC5LA4Okvl1nfBZrM8dE2VE7pknsJSOK23uSC/DgsWiYkio3zI0MtxFxNs5HciD4I/ql7yBW4j8TMgWbN837OV2mbKMytPjjVkq8BCD66ts4puUtbZsfvgIYiymkZt57nZXypIphOuow67zJJ+nduqANPbE/EnCW+9botcAexPqs+ZfzFO2n8zxr5rqAcy4W8JPj0K9QfowfB2UNeTP+nYGHJoyyBSTw8bo9Wq7Gy4ZiSGaXdCxlEvm6QxhjlzYOQQ0loQWQ1bWHh6zcu2D3zJYcxUuixHpP+2sRdh+nGOAPIXqy0DHReWA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3221.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(316002)(86362001)(5660300002)(6916009)(30864003)(2906002)(54906003)(33656002)(83380400001)(19627405001)(66556008)(64756008)(53546011)(8676002)(8936002)(76116006)(71200400001)(4326008)(186003)(6506007)(66446008)(52536014)(478600001)(9686003)(55016002)(7696005)(38100700002)(122000001)(66946007)(66476007)(38070700004)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ksjgXOneSwT1IX9EhvcfHW6C7oM2RlrPtELog2hXDPtmsLbuwKkLN0VqtUN9?=
 =?us-ascii?Q?atIhYK1cq8+3h1ppbR7YjTWPQnEaxhQ7FUKDb6C15G+dJxxVPM/qht3wUZYk?=
 =?us-ascii?Q?L1pMgHyyeySgYu0uvsUtqTypwJ2P5Sa2agO0/97+YOfzwisJuhzhRrTronxu?=
 =?us-ascii?Q?PRrUzt5Dykz9o89hR/r08UIQVOwoHj8InWnfu8HQHKX9SJ5fqDWzNyK1CDlz?=
 =?us-ascii?Q?5zp57Mvz1RqlR2mbNzrvniJmvAtIAx5L6FFcu9rOMxZ9kFkECRuIhmNYoiv2?=
 =?us-ascii?Q?wR89inCs0hK/+y6nph13B9K+ATMu2rVgFJHT9u4LCz1sGQhmI31QNF1WQi9L?=
 =?us-ascii?Q?jRdZ3mxQzb0Swelz8IgH9RcHRl9LW6EMoqYrRADm924q8gAktQ/plnvIrHUw?=
 =?us-ascii?Q?uBvYv+wrTtjTKg065K403jm+puUXmsIkJG04qLDOD9AGitCNLPdIKoOdxtMe?=
 =?us-ascii?Q?i/IfL33qLwcYN/S45awA6aVOfSO5fel3Ew65TXjE9pHzp/FZUg70s+x0UooP?=
 =?us-ascii?Q?AzW25gw+QWNWjwkRnXwUDBVa2nIqmaGYVqz+Gf1Gm5XfD+qe5kQet1KQFAo0?=
 =?us-ascii?Q?nAz4Jq62/yCujLQ8keUiyXUCmiHGThXH/poZmE6S7pV/Yfh2qxnuIKg33V0E?=
 =?us-ascii?Q?AQ9BFmybNESheYb4r4xmJk7U60KzHiICWmVGewBd2R+1Uozp/THObpP42xqv?=
 =?us-ascii?Q?uPsEp1n73+cxOD5Us4DXUHzaU48x2UqX3blbjIQ8pvv2xg0P60BPtVtSd/yT?=
 =?us-ascii?Q?OAeQtbFErhhxw31zRyFiqLvifp12Edqwzs47tsDJtgIUjHjmzUay+Yn7EbFu?=
 =?us-ascii?Q?gsb6ItpBN6rfCVHoS8Y5hs6/kWftYD9Vgf/pUzGV+SowpXWiG28y1XtBl8jS?=
 =?us-ascii?Q?NvEgjkGVQc4IInrNSrx2wHZ42YgCsl9sjXs5TGTVio95Vn7DluRRTFgKg2aR?=
 =?us-ascii?Q?HegAyh4NBKb6mHGJbhsWVYUEP63HUOH5Iiy/yRReoMQ5B8sBTIgKK4xVE69x?=
 =?us-ascii?Q?RkUfwZ2NxyGKrfnVil5A1SUlXmqp3jHCGFpslAwQ82iiyf8hX8YCXmfNsKF0?=
 =?us-ascii?Q?fyTnu3zveEiZOxStN6lprk4Gnw64+rAO5Sq7ueoMOKpzxQWK67rQyudYwZFG?=
 =?us-ascii?Q?OZcGKEblYE2sVIMgZf33rf5Ek6Zd+5u0IQIrGUUAAa6Wpq76yCA0azx+4T0E?=
 =?us-ascii?Q?Z6kZJjhZFU+BqQFxRYzeKCcxmZa/Dy8H8XICc7bruLM3qLB5NuZtz+v3Aq1M?=
 =?us-ascii?Q?hOCF07o3c4783cp/rYag0hGD9TT9gXwrpsxqlf+GePMz28EmgzG83DDAG75o?=
 =?us-ascii?Q?20On4obbnvTviaDpuAITsD6FnLtMID4MqT9azPqCX5RpCwjEGbA9C5Q656G8?=
 =?us-ascii?Q?dyFkSGc=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB32218D88F93BC85251C9C483EAE59BYAPR12MB3221namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3221.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0a4426-db3b-4e94-5559-08d94df19ac8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 15:50:32.8043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P85wzXZA16qy00vdHM0h0uwiuJokpOI/QisC+up4/fMj2iypqeXv2fYuX6XrFYt7HY5PbGvP3gdtPwfQanFMkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3906
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
Cc: kernel test robot <lkp@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR12MB32218D88F93BC85251C9C483EAE59BYAPR12MB3221namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Thanks Alex! I will make these changes.

Best,
Ryan
________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Friday, July 23, 2021 7:33 AM
To: Taylor, Ryan <Ryan.Taylor@amd.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx=
 list <amd-gfx@lists.freedesktop.org>; kernel test robot <lkp@intel.com>; D=
aniel Vetter <daniel.vetter@ffwll.ch>; Siqueira, Rodrigo <Rodrigo.Siqueira@=
amd.com>; Melissa Wen <melissa.srw@gmail.com>; Deucher, Alexander <Alexande=
r.Deucher@amd.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: replace dce_virtual with amdgpu_vkms (=
v3)

On Wed, Jul 21, 2021 at 1:07 PM Ryan Taylor <Ryan.Taylor@amd.com> wrote:
>
> Move dce_virtual into amdgpu_vkms and update all references to
> dce_virtual with amdgpu_vkms.
>
> v2: Removed more references to dce_virtual.
>
> v3: Restored display modes from previous implementation.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Alex Deucher <Alexander.Deucher@amd.com>
> Signed-off-by: Ryan Taylor <Ryan.Taylor@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile      |   3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 234 ++++++++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h |   5 +-
>  drivers/gpu/drm/amd/amdgpu/cik.c         |  10 +-
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.c | 223 ---------------------
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.h |  30 ---
>  drivers/gpu/drm/amd/amdgpu/nv.c          |  20 +-
>  drivers/gpu/drm/amd/amdgpu/si.c          |   8 +-
>  drivers/gpu/drm/amd/amdgpu/soc15.c       |  10 +-
>  drivers/gpu/drm/amd/amdgpu/vi.c          |  14 +-
>  10 files changed, 264 insertions(+), 293 deletions(-)
>  delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.c
>  delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/am=
dgpu/Makefile
> index 30cbcd5ce1cc..0d814c957461 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -120,8 +120,7 @@ amdgpu-y +=3D \
>  amdgpu-y +=3D \
>         dce_v10_0.o \
>         dce_v11_0.o \
> -       amdgpu_vkms.o \
> -       dce_virtual.o
> +       amdgpu_vkms.o
>
>  # add GFX block
>  amdgpu-y +=3D \
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vkms.c
> index d5c1f1c58f5f..538d41e6666a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -5,6 +5,15 @@
>  #include <drm/drm_vblank.h>
>
>  #include "amdgpu.h"
> +#ifdef CONFIG_DRM_AMDGPU_SI
> +#include "dce_v6_0.h"
> +#endif
> +#ifdef CONFIG_DRM_AMDGPU_CIK
> +#include "dce_v8_0.h"
> +#endif
> +#include "dce_v10_0.h"
> +#include "dce_v11_0.h"
> +#include "ivsrcid/ivsrcid_vislands30.h"
>  #include "amdgpu_vkms.h"
>  #include "amdgpu_display.h"
>
> @@ -180,12 +189,45 @@ static const struct drm_connector_funcs amdgpu_vkms=
_connector_funcs =3D {
>
>  static int amdgpu_vkms_conn_get_modes(struct drm_connector *connector)
>  {
> -       int count;
> +       struct drm_device *dev =3D connector->dev;
> +       struct drm_display_mode *mode =3D NULL;
> +       unsigned i;
> +       static const struct mode_size {
> +               int w;
> +               int h;
> +       } common_modes[] =3D {
> +               { 640,  480},
> +               { 720,  480},
> +               { 800,  600},
> +               { 848,  480},
> +               {1024,  768},
> +               {1152,  768},
> +               {1280,  720},
> +               {1280,  800},
> +               {1280,  854},
> +               {1280,  960},
> +               {1280, 1024},
> +               {1440,  900},
> +               {1400, 1050},
> +               {1680, 1050},
> +               {1600, 1200},
> +               {1920, 1080},
> +               {1920, 1200},
> +               {2560, 1440},
> +               {4096, 3112},
> +               {3656, 2664},
> +               {3840, 2160},
> +               {4096, 2160},
> +       };
> +
> +       for (i =3D 0; i < ARRAY_SIZE(common_modes); i++) {
> +               mode =3D drm_cvt_mode(dev, common_modes[i].w, common_mode=
s[i].h, 60, false, false, false);
> +               drm_mode_probed_add(connector, mode);
> +       }
>
> -       count =3D drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
>         drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
>
> -       return count;
> +       return ARRAY_SIZE(common_modes);
>  }
>
>  static const struct drm_connector_helper_funcs amdgpu_vkms_conn_helper_f=
uncs =3D {
> @@ -409,3 +451,189 @@ int amdgpu_vkms_output_init(struct drm_device *dev,
>
>         return ret;
>  }
> +
> +const struct drm_mode_config_funcs amdgpu_vkms_mode_funcs =3D {
> +       .fb_create =3D amdgpu_display_user_framebuffer_create,
> +       .atomic_check =3D drm_atomic_helper_check,
> +       .atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +static int amdgpu_vkms_sw_init(void *handle)
> +{
> +       int r, i;
> +       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +
> +       adev_to_drm(adev)->max_vblank_count =3D 0;
> +
> +       adev_to_drm(adev)->mode_config.funcs =3D &amdgpu_vkms_mode_funcs;
> +
> +       adev_to_drm(adev)->mode_config.max_width =3D XRES_MAX;
> +       adev_to_drm(adev)->mode_config.max_height =3D YRES_MAX;
> +
> +       adev_to_drm(adev)->mode_config.preferred_depth =3D 24;
> +       adev_to_drm(adev)->mode_config.prefer_shadow =3D 1;
> +
> +       adev_to_drm(adev)->mode_config.fb_base =3D adev->gmc.aper_base;
> +
> +       r =3D amdgpu_display_modeset_create_props(adev);
> +       if (r)
> +               return r;
> +
> +       adev->amdgpu_vkms_output =3D kzalloc(sizeof(struct amdgpu_vkms_ou=
tput) * adev->mode_info.num_crtc, GFP_KERNEL);
> +
> +       /* allocate crtcs, encoders, connectors */
> +       for (i =3D 0; i < adev->mode_info.num_crtc; i++) {
> +               r =3D amdgpu_vkms_output_init(adev_to_drm(adev), &adev->a=
mdgpu_vkms_output[i], i);
> +               if (r)
> +                       return r;
> +       }
> +
> +       drm_kms_helper_poll_init(adev_to_drm(adev));
> +
> +       adev->mode_info.mode_config_initialized =3D true;
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_sw_fini(void *handle)
> +{
> +       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       int i =3D 0;
> +
> +       for (i =3D 0; i < adev->mode_info.num_crtc; i++)
> +               if (adev->mode_info.crtcs[i])
> +                       hrtimer_cancel(&adev->mode_info.crtcs[i]->vblank_=
timer);
> +
> +       kfree(adev->mode_info.bios_hardcoded_edid);
> +       kfree(adev->amdgpu_vkms_output);
> +
> +       drm_kms_helper_poll_fini(adev_to_drm(adev));
> +
> +       adev->mode_info.mode_config_initialized =3D false;
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_hw_init(void *handle)
> +{
> +       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +
> +       switch (adev->asic_type) {
> +#ifdef CONFIG_DRM_AMDGPU_SI
> +       case CHIP_TAHITI:
> +       case CHIP_PITCAIRN:
> +       case CHIP_VERDE:
> +       case CHIP_OLAND:
> +               dce_v6_0_disable_dce(adev);
> +               break;
> +#endif
> +#ifdef CONFIG_DRM_AMDGPU_CIK
> +       case CHIP_BONAIRE:
> +       case CHIP_HAWAII:
> +       case CHIP_KAVERI:
> +       case CHIP_KABINI:
> +       case CHIP_MULLINS:
> +               dce_v8_0_disable_dce(adev);
> +               break;
> +#endif
> +       case CHIP_FIJI:
> +       case CHIP_TONGA:
> +               dce_v10_0_disable_dce(adev);
> +               break;
> +       case CHIP_CARRIZO:
> +       case CHIP_STONEY:
> +       case CHIP_POLARIS10:
> +       case CHIP_POLARIS11:
> +       case CHIP_VEGAM:
> +               dce_v11_0_disable_dce(adev);
> +               break;
> +       case CHIP_TOPAZ:
> +#ifdef CONFIG_DRM_AMDGPU_SI
> +       case CHIP_HAINAN:
> +#endif
> +               /* no DCE */
> +               break;
> +       default:
> +               break;
> +       }
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_hw_fini(void *handle)
> +{
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_suspend(void *handle)
> +{
> +       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       int r;
> +
> +       r =3D drm_mode_config_helper_suspend(adev_to_drm(adev));
> +       if (r)
> +               return r;
> +       return amdgpu_vkms_hw_fini(handle);
> +}
> +
> +static int amdgpu_vkms_resume(void *handle)
> +{
> +       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       int r;
> +
> +       r =3D amdgpu_vkms_hw_init(handle);
> +       if (r)
> +               return r;
> +       return drm_mode_config_helper_resume(adev_to_drm(adev));
> +}
> +
> +static bool amdgpu_vkms_is_idle(void *handle)
> +{
> +       return true;
> +}
> +
> +static int amdgpu_vkms_wait_for_idle(void *handle)
> +{
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_soft_reset(void *handle)
> +{
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_set_clockgating_state(void *handle,
> +                                         enum amd_clockgating_state stat=
e)
> +{
> +       return 0;
> +}
> +
> +static int amdgpu_vkms_set_powergating_state(void *handle,
> +                                         enum amd_powergating_state stat=
e)
> +{
> +       return 0;
> +}
> +
> +static const struct amd_ip_funcs amdgpu_vkms_ip_funcs =3D {
> +       .name =3D "amdgpu_vkms",
> +       .early_init =3D NULL,
> +       .late_init =3D NULL,
> +       .sw_init =3D amdgpu_vkms_sw_init,
> +       .sw_fini =3D amdgpu_vkms_sw_fini,
> +       .hw_init =3D amdgpu_vkms_hw_init,
> +       .hw_fini =3D amdgpu_vkms_hw_fini,
> +       .suspend =3D amdgpu_vkms_suspend,
> +       .resume =3D amdgpu_vkms_resume,
> +       .is_idle =3D amdgpu_vkms_is_idle,
> +       .wait_for_idle =3D amdgpu_vkms_wait_for_idle,
> +       .soft_reset =3D amdgpu_vkms_soft_reset,
> +       .set_clockgating_state =3D amdgpu_vkms_set_clockgating_state,
> +       .set_powergating_state =3D amdgpu_vkms_set_powergating_state,
> +};
> +
> +const struct amdgpu_ip_block_version amdgpu_vkms_ip_block =3D
> +{
> +       .type =3D AMD_IP_BLOCK_TYPE_DCE,
> +       .major =3D 1,
> +       .minor =3D 0,
> +       .rev =3D 0,
> +       .funcs =3D &amdgpu_vkms_ip_funcs,
> +};
> +
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vkms.h
> index 5dab51fbecf3..97f1b79c0724 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> @@ -4,7 +4,7 @@
>  #define _AMDGPU_VKMS_H_
>
>  #define XRES_DEF  1024
> -#define YRES_DEF   764
> +#define YRES_DEF   768

Squash this fix into the original patch that added this macro.


>
>  #define XRES_MAX  16384
>  #define YRES_MAX  16384
> @@ -23,7 +23,4 @@ struct amdgpu_vkms_output {
>         struct drm_pending_vblank_event *event;
>  };
>
> -int amdgpu_vkms_output_init(struct drm_device *dev,
> -                           struct amdgpu_vkms_output *output, int index)=
;
> -
>  #endif /* _AMDGPU_VKMS_H_ */
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgp=
u/cik.c
> index c0fcc41ee574..54f28c075f21 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik.c
> @@ -70,7 +70,7 @@
>
>  #include "amdgpu_dm.h"
>  #include "amdgpu_amdkfd.h"
> -#include "dce_virtual.h"
> +#include "amdgpu_vkms.h"
>
>  static const struct amdgpu_video_codec_info cik_video_codecs_encode_arra=
y[] =3D
>  {
> @@ -2259,7 +2259,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &cik_sdma_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2277,7 +2277,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &cik_sdma_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2295,7 +2295,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &cik_sdma_ip_block);
>                 amdgpu_device_ip_block_add(adev, &kv_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2315,7 +2315,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &cik_sdma_ip_block);
>                 amdgpu_device_ip_block_add(adev, &kv_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/a=
md/amdgpu/dce_virtual.c
> deleted file mode 100644
> index 18369b47eac7..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> +++ /dev/null
> @@ -1,223 +0,0 @@
> -/*
> - * Copyright 2014 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining=
 a
> - * copy of this software and associated documentation files (the "Softwa=
re"),
> - * to deal in the Software without restriction, including without limita=
tion
> - * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be includ=
ed in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> -
> -#include <drm/drm_atomic_helper.h>
> -
> -#include "amdgpu.h"
> -#ifdef CONFIG_DRM_AMDGPU_SI
> -#include "dce_v6_0.h"
> -#endif
> -#ifdef CONFIG_DRM_AMDGPU_CIK
> -#include "dce_v8_0.h"
> -#endif
> -#include "dce_v10_0.h"
> -#include "dce_v11_0.h"
> -#include "dce_virtual.h"
> -#include "ivsrcid/ivsrcid_vislands30.h"
> -#include "amdgpu_display.h"
> -#include "amdgpu_vkms.h"
> -
> -const struct drm_mode_config_funcs dce_virtual_mode_funcs =3D {
> -       .fb_create =3D amdgpu_display_user_framebuffer_create,
> -       .atomic_check =3D drm_atomic_helper_check,
> -       .atomic_commit =3D drm_atomic_helper_commit,
> -};
> -
> -static int dce_virtual_sw_init(void *handle)
> -{
> -       int r, i;
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -
> -       adev_to_drm(adev)->max_vblank_count =3D 0;
> -
> -       adev_to_drm(adev)->mode_config.funcs =3D &dce_virtual_mode_funcs;
> -
> -       adev_to_drm(adev)->mode_config.max_width =3D XRES_MAX;
> -       adev_to_drm(adev)->mode_config.max_height =3D YRES_MAX;
> -
> -       adev_to_drm(adev)->mode_config.preferred_depth =3D 24;
> -       adev_to_drm(adev)->mode_config.prefer_shadow =3D 1;
> -
> -       adev_to_drm(adev)->mode_config.fb_base =3D adev->gmc.aper_base;
> -
> -       r =3D amdgpu_display_modeset_create_props(adev);
> -       if (r)
> -               return r;
> -
> -       adev->amdgpu_vkms_output =3D kzalloc(sizeof(struct amdgpu_vkms_ou=
tput) * adev->mode_info.num_crtc, GFP_KERNEL);
> -
> -       /* allocate crtcs, encoders, connectors */
> -       for (i =3D 0; i < adev->mode_info.num_crtc; i++) {
> -               r =3D amdgpu_vkms_output_init(adev_to_drm(adev), &adev->a=
mdgpu_vkms_output[i], i);
> -               if (r)
> -                       return r;
> -       }
> -
> -       drm_kms_helper_poll_init(adev_to_drm(adev));
> -
> -       adev->mode_info.mode_config_initialized =3D true;
> -       return 0;
> -}
> -
> -static int dce_virtual_sw_fini(void *handle)
> -{
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -       int i =3D 0;
> -
> -       for (i =3D 0; i < adev->mode_info.num_crtc; i++)
> -               if (adev->mode_info.crtcs[i])
> -                       hrtimer_cancel(&adev->mode_info.crtcs[i]->vblank_=
timer);
> -
> -       kfree(adev->mode_info.bios_hardcoded_edid);
> -       kfree(adev->amdgpu_vkms_output);
> -
> -       drm_kms_helper_poll_fini(adev_to_drm(adev));
> -
> -       adev->mode_info.mode_config_initialized =3D false;
> -       return 0;
> -}
> -
> -static int dce_virtual_hw_init(void *handle)
> -{
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -
> -       switch (adev->asic_type) {
> -#ifdef CONFIG_DRM_AMDGPU_SI
> -       case CHIP_TAHITI:
> -       case CHIP_PITCAIRN:
> -       case CHIP_VERDE:
> -       case CHIP_OLAND:
> -               dce_v6_0_disable_dce(adev);
> -               break;
> -#endif
> -#ifdef CONFIG_DRM_AMDGPU_CIK
> -       case CHIP_BONAIRE:
> -       case CHIP_HAWAII:
> -       case CHIP_KAVERI:
> -       case CHIP_KABINI:
> -       case CHIP_MULLINS:
> -               dce_v8_0_disable_dce(adev);
> -               break;
> -#endif
> -       case CHIP_FIJI:
> -       case CHIP_TONGA:
> -               dce_v10_0_disable_dce(adev);
> -               break;
> -       case CHIP_CARRIZO:
> -       case CHIP_STONEY:
> -       case CHIP_POLARIS10:
> -       case CHIP_POLARIS11:
> -       case CHIP_VEGAM:
> -               dce_v11_0_disable_dce(adev);
> -               break;
> -       case CHIP_TOPAZ:
> -#ifdef CONFIG_DRM_AMDGPU_SI
> -       case CHIP_HAINAN:
> -#endif
> -               /* no DCE */
> -               break;
> -       default:
> -               break;
> -       }
> -       return 0;
> -}
> -
> -static int dce_virtual_hw_fini(void *handle)
> -{
> -       return 0;
> -}
> -
> -static int dce_virtual_suspend(void *handle)
> -{
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -       int r;
> -
> -       r =3D drm_mode_config_helper_suspend(adev_to_drm(adev));
> -       if (r)
> -               return r;
> -       return dce_virtual_hw_fini(handle);
> -}
> -
> -static int dce_virtual_resume(void *handle)
> -{
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -       int r;
> -
> -       r =3D dce_virtual_hw_init(handle);
> -       if (r)
> -               return r;
> -       return drm_mode_config_helper_resume(adev_to_drm(adev));
> -}
> -
> -static bool dce_virtual_is_idle(void *handle)
> -{
> -       return true;
> -}
> -
> -static int dce_virtual_wait_for_idle(void *handle)
> -{
> -       return 0;
> -}
> -
> -static int dce_virtual_soft_reset(void *handle)
> -{
> -       return 0;
> -}
> -
> -static int dce_virtual_set_clockgating_state(void *handle,
> -                                         enum amd_clockgating_state stat=
e)
> -{
> -       return 0;
> -}
> -
> -static int dce_virtual_set_powergating_state(void *handle,
> -                                         enum amd_powergating_state stat=
e)
> -{
> -       return 0;
> -}
> -
> -static const struct amd_ip_funcs dce_virtual_ip_funcs =3D {
> -       .name =3D "dce_virtual",
> -       .early_init =3D NULL,
> -       .late_init =3D NULL,
> -       .sw_init =3D dce_virtual_sw_init,
> -       .sw_fini =3D dce_virtual_sw_fini,
> -       .hw_init =3D dce_virtual_hw_init,
> -       .hw_fini =3D dce_virtual_hw_fini,
> -       .suspend =3D dce_virtual_suspend,
> -       .resume =3D dce_virtual_resume,
> -       .is_idle =3D dce_virtual_is_idle,
> -       .wait_for_idle =3D dce_virtual_wait_for_idle,
> -       .soft_reset =3D dce_virtual_soft_reset,
> -       .set_clockgating_state =3D dce_virtual_set_clockgating_state,
> -       .set_powergating_state =3D dce_virtual_set_powergating_state,
> -};
> -
> -const struct amdgpu_ip_block_version dce_virtual_ip_block =3D
> -{
> -       .type =3D AMD_IP_BLOCK_TYPE_DCE,
> -       .major =3D 1,
> -       .minor =3D 0,
> -       .rev =3D 0,
> -       .funcs =3D &dce_virtual_ip_funcs,
> -};
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.h b/drivers/gpu/drm/a=
md/amdgpu/dce_virtual.h
> deleted file mode 100644
> index ed422012c8c6..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.h
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -/*
> - * Copyright 2014 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining=
 a
> - * copy of this software and associated documentation files (the "Softwa=
re"),
> - * to deal in the Software without restriction, including without limita=
tion
> - * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be includ=
ed in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> -
> -#ifndef __DCE_VIRTUAL_H__
> -#define __DCE_VIRTUAL_H__
> -
> -extern const struct amdgpu_ip_block_version dce_virtual_ip_block;
> -
> -#endif
> -
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu=
/nv.c
> index 436fb13e32f0..696ecc1ccb28 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -58,7 +58,7 @@
>  #include "jpeg_v2_0.h"
>  #include "vcn_v3_0.h"
>  #include "jpeg_v3_0.h"
> -#include "dce_virtual.h"
> +#include "amdgpu_vkms.h"
>  #include "mes_v10_1.h"
>  #include "mxgpu_nv.h"
>  #include "smuio_v11_0.h"
> @@ -721,7 +721,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                     !amdgpu_sriov_vf(adev))
>                         amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_bl=
ock);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -749,7 +749,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                 if (adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
>                         amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_bl=
ock);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -779,7 +779,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                     is_support_sw_smu(adev))
>                         amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_bl=
ock);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -802,7 +802,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                     is_support_sw_smu(adev))
>                         amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_bl=
ock);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -823,7 +823,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                         amdgpu_device_ip_block_add(adev, &psp_v11_0_ip_bl=
ock);
>                 amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -843,7 +843,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                     is_support_sw_smu(adev))
>                         amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_bl=
ock);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                  else if (amdgpu_device_has_dc_support(adev))
>                          amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -865,7 +865,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &gfx_v10_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &sdma_v5_2_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -883,11 +883,11 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
>                         amdgpu_device_ip_block_add(adev, &psp_v13_0_ip_bl=
ock);
>                 amdgpu_device_ip_block_add(adev, &smu_v13_0_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>                 amdgpu_device_ip_block_add(adev, &gfx_v10_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &sdma_v5_2_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu=
/si.c
> index 7cbc2bb03bc6..e6d2f74a7976 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si.c
> @@ -44,7 +44,7 @@
>  #include "dce_v6_0.h"
>  #include "si.h"
>  #include "uvd_v3_1.h"
> -#include "dce_virtual.h"
> +#include "amdgpu_vkms.h"
>  #include "gca/gfx_6_0_d.h"
>  #include "oss/oss_1_0_d.h"
>  #include "oss/oss_1_0_sh_mask.h"
> @@ -2759,7 +2759,7 @@ int si_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &si_dma_ip_block);
>                 amdgpu_device_ip_block_add(adev, &si_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC) && defined(CONFIG_DRM_AMD_DC_SI)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2777,7 +2777,7 @@ int si_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &si_dma_ip_block);
>                 amdgpu_device_ip_block_add(adev, &si_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC) && defined(CONFIG_DRM_AMD_DC_SI)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2795,7 +2795,7 @@ int si_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &si_dma_ip_block);
>                 amdgpu_device_ip_block_add(adev, &si_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>                 break;
>         default:
>                 BUG();
> diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amd=
gpu/soc15.c
> index a5e085e570f7..f7b56a746c15 100644
> --- a/drivers/gpu/drm/amd/amdgpu/soc15.c
> +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
> @@ -74,7 +74,7 @@
>  #include "smuio_v9_0.h"
>  #include "smuio_v11_0.h"
>  #include "smuio_v13_0.h"
> -#include "dce_virtual.h"
> +#include "amdgpu_vkms.h"
>  #include "mxgpu_ai.h"
>  #include "amdgpu_ras.h"
>  #include "amdgpu_xgmi.h"
> @@ -843,7 +843,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
>                         amdgpu_device_ip_block_add(adev, &pp_smu_ip_block=
);
>                 }
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -863,7 +863,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &sdma_v4_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -885,7 +885,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
>                 }
>
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>                 amdgpu_device_ip_block_add(adev, &gfx_v9_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &sdma_v4_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
> @@ -909,7 +909,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &gfx_v9_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &sdma_v4_0_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                  else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu=
/vi.c
> index 3d21c0799037..fe9a7cc8d9eb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -77,7 +77,7 @@
>  #if defined(CONFIG_DRM_AMD_ACP)
>  #include "amdgpu_acp.h"
>  #endif
> -#include "dce_virtual.h"
> +#include "amdgpu_vkms.h"
>  #include "mxgpu_vi.h"
>  #include "amdgpu_dm.h"
>
> @@ -2102,7 +2102,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &sdma_v2_4_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>                 break;
>         case CHIP_FIJI:
>                 amdgpu_device_ip_block_add(adev, &vi_common_ip_block);
> @@ -2112,7 +2112,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &sdma_v3_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2132,7 +2132,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &sdma_v3_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)=
)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2155,7 +2155,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &sdma_v3_1_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2173,7 +2173,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &sdma_v3_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> @@ -2194,7 +2194,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
>                 amdgpu_device_ip_block_add(adev, &sdma_v3_0_ip_block);
>                 amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
>                 if (adev->enable_virtual_display)
> -                       amdgpu_device_ip_block_add(adev, &dce_virtual_ip_=
block);
> +                       amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_=
block);
>  #if defined(CONFIG_DRM_AMD_DC)
>                 else if (amdgpu_device_has_dc_support(adev))
>                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
> --
> 2.32.0
>

--_000_BYAPR12MB32218D88F93BC85251C9C483EAE59BYAPR12MB3221namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Thanks Alex! I will make these changes.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Best,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Ryan<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> Friday, July 23, 2021 7:33 AM<br>
<b>To:</b> Taylor, Ryan &lt;Ryan.Taylor@amd.com&gt;<br>
<b>Cc:</b> Maling list - DRI developers &lt;dri-devel@lists.freedesktop.org=
&gt;; amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;; kernel test robot=
 &lt;lkp@intel.com&gt;; Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;; Sique=
ira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; Melissa Wen &lt;melissa.srw@=
gmail.com&gt;;
 Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 3/3] drm/amdgpu: replace dce_virtual with amdgpu=
_vkms (v3)</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, Jul 21, 2021 at 1:07 PM Ryan Taylor &lt;Ry=
an.Taylor@amd.com&gt; wrote:<br>
&gt;<br>
&gt; Move dce_virtual into amdgpu_vkms and update all references to<br>
&gt; dce_virtual with amdgpu_vkms.<br>
&gt;<br>
&gt; v2: Removed more references to dce_virtual.<br>
&gt;<br>
&gt; v3: Restored display modes from previous implementation.<br>
&gt;<br>
&gt; Reported-by: kernel test robot &lt;lkp@intel.com&gt;<br>
&gt; Suggested-by: Alex Deucher &lt;Alexander.Deucher@amd.com&gt;<br>
&gt; Signed-off-by: Ryan Taylor &lt;Ryan.Taylor@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 3 +-<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 234 +++++++++++++++++=
+++++-<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h |&nbsp;&nbsp; 5 +-<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/cik.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 10 +-<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/dce_virtual.c | 223 -----------------=
----<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/dce_virtual.h |&nbsp; 30 ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/nv.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 20 +-<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/si.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 +-<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/soc15.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 10 +-<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/vi.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 14 +-<br>
&gt;&nbsp; 10 files changed, 264 insertions(+), 293 deletions(-)<br>
&gt;&nbsp; delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.c<br>
&gt;&nbsp; delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.h<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd=
/amdgpu/Makefile<br>
&gt; index 30cbcd5ce1cc..0d814c957461 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; @@ -120,8 +120,7 @@ amdgpu-y +=3D \<br>
&gt;&nbsp; amdgpu-y +=3D \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dce_v10_0.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dce_v11_0.o \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_vkms.o \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dce_virtual.o<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_vkms.o<br>
&gt;<br>
&gt;&nbsp; # add GFX block<br>
&gt;&nbsp; amdgpu-y +=3D \<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_vkms.c<br>
&gt; index d5c1f1c58f5f..538d41e6666a 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c<br>
&gt; @@ -5,6 +5,15 @@<br>
&gt;&nbsp; #include &lt;drm/drm_vblank.h&gt;<br>
&gt;<br>
&gt;&nbsp; #include &quot;amdgpu.h&quot;<br>
&gt; +#ifdef CONFIG_DRM_AMDGPU_SI<br>
&gt; +#include &quot;dce_v6_0.h&quot;<br>
&gt; +#endif<br>
&gt; +#ifdef CONFIG_DRM_AMDGPU_CIK<br>
&gt; +#include &quot;dce_v8_0.h&quot;<br>
&gt; +#endif<br>
&gt; +#include &quot;dce_v10_0.h&quot;<br>
&gt; +#include &quot;dce_v11_0.h&quot;<br>
&gt; +#include &quot;ivsrcid/ivsrcid_vislands30.h&quot;<br>
&gt;&nbsp; #include &quot;amdgpu_vkms.h&quot;<br>
&gt;&nbsp; #include &quot;amdgpu_display.h&quot;<br>
&gt;<br>
&gt; @@ -180,12 +189,45 @@ static const struct drm_connector_funcs amdgpu_v=
kms_connector_funcs =3D {<br>
&gt;<br>
&gt;&nbsp; static int amdgpu_vkms_conn_get_modes(struct drm_connector *conn=
ector)<br>
&gt;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int count;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D conne=
ctor-&gt;dev;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_display_mode *mode =
=3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned i;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static const struct mode_size {<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; int w;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; int h;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } common_modes[] =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; { 640,&nbsp; 480},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; { 720,&nbsp; 480},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; { 800,&nbsp; 600},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; { 848,&nbsp; 480},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {1024,&nbsp; 768},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {1152,&nbsp; 768},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {1280,&nbsp; 720},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {1280,&nbsp; 800},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {1280,&nbsp; 854},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {1280,&nbsp; 960},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {1280, 1024},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {1440,&nbsp; 900},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {1400, 1050},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {1680, 1050},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {1600, 1200},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {1920, 1080},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {1920, 1200},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {2560, 1440},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {4096, 3112},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {3656, 2664},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {3840, 2160},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; {4096, 2160},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(=
common_modes); i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; mode =3D drm_cvt_mode(dev, common_modes[i].w, common_modes[=
i].h, 60, false, false, false);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; drm_mode_probed_add(connector, mode);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count =3D drm_add_modes_noedid(c=
onnector, XRES_MAX, YRES_MAX);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_set_preferred_mode=
(connector, XRES_DEF, YRES_DEF);<br>
&gt;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return count;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ARRAY_SIZE(common_modes);=
<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt;&nbsp; static const struct drm_connector_helper_funcs amdgpu_vkms_conn_=
helper_funcs =3D {<br>
&gt; @@ -409,3 +451,189 @@ int amdgpu_vkms_output_init(struct drm_device *d=
ev,<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&nbsp; }<br>
&gt; +<br>
&gt; +const struct drm_mode_config_funcs amdgpu_vkms_mode_funcs =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fb_create =3D amdgpu_display_us=
er_framebuffer_create,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_check =3D drm_atomic_hel=
per_check,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_commit =3D drm_atomic_he=
lper_commit,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int amdgpu_vkms_sw_init(void *handle)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r, i;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D (=
struct amdgpu_device *)handle;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;max_vblank=
_count =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_confi=
g.funcs =3D &amp;amdgpu_vkms_mode_funcs;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_confi=
g.max_width =3D XRES_MAX;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_confi=
g.max_height =3D YRES_MAX;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_confi=
g.preferred_depth =3D 24;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_confi=
g.prefer_shadow =3D 1;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_confi=
g.fb_base =3D adev-&gt;gmc.aper_base;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_display_modeset_cre=
ate_props(adev);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return r;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;amdgpu_vkms_output =3D =
kzalloc(sizeof(struct amdgpu_vkms_output) * adev-&gt;mode_info.num_crtc, GF=
P_KERNEL);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* allocate crtcs, encoders, con=
nectors */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; adev-&gt;mo=
de_info.num_crtc; i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; r =3D amdgpu_vkms_output_init(adev_to_drm(adev), &amp;adev-=
&gt;amdgpu_vkms_output[i], i);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_kms_helper_poll_init(adev_to=
_drm(adev));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mode_info.mode_config_i=
nitialized =3D true;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int amdgpu_vkms_sw_fini(void *handle)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D (=
struct amdgpu_device *)handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; adev-&gt;mo=
de_info.num_crtc; i++)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (adev-&gt;mode_info.crtcs[i])<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hrtimer_can=
cel(&amp;adev-&gt;mode_info.crtcs[i]-&gt;vblank_timer);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(adev-&gt;mode_info.bios_ha=
rdcoded_edid);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(adev-&gt;amdgpu_vkms_outpu=
t);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_kms_helper_poll_fini(adev_to=
_drm(adev));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mode_info.mode_config_i=
nitialized =3D false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int amdgpu_vkms_hw_init(void *handle)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D (=
struct amdgpu_device *)handle;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (adev-&gt;asic_type) {<br=
>
&gt; +#ifdef CONFIG_DRM_AMDGPU_SI<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_TAHITI:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_PITCAIRN:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_VERDE:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_OLAND:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; dce_v6_0_disable_dce(adev);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
&gt; +#endif<br>
&gt; +#ifdef CONFIG_DRM_AMDGPU_CIK<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_BONAIRE:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_HAWAII:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_KAVERI:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_KABINI:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_MULLINS:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; dce_v8_0_disable_dce(adev);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
&gt; +#endif<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_FIJI:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_TONGA:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; dce_v10_0_disable_dce(adev);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_CARRIZO:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_STONEY:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_POLARIS10:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_POLARIS11:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_VEGAM:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; dce_v11_0_disable_dce(adev);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_TOPAZ:<br>
&gt; +#ifdef CONFIG_DRM_AMDGPU_SI<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_HAINAN:<br>
&gt; +#endif<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /* no DCE */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int amdgpu_vkms_hw_fini(void *handle)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int amdgpu_vkms_suspend(void *handle)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D (=
struct amdgpu_device *)handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D drm_mode_config_helper_sus=
pend(adev_to_drm(adev));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return r;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return amdgpu_vkms_hw_fini(handl=
e);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int amdgpu_vkms_resume(void *handle)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D (=
struct amdgpu_device *)handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_vkms_hw_init(handle=
);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return r;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return drm_mode_config_helper_re=
sume(adev_to_drm(adev));<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool amdgpu_vkms_is_idle(void *handle)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int amdgpu_vkms_wait_for_idle(void *handle)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int amdgpu_vkms_soft_reset(void *handle)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int amdgpu_vkms_set_clockgating_state(void *handle,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; enum amd_clockgating_state state)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int amdgpu_vkms_set_powergating_state(void *handle,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; enum amd_powergating_state state)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct amd_ip_funcs amdgpu_vkms_ip_funcs =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;amdgpu_vkms&quot=
;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .early_init =3D NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .late_init =3D NULL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sw_init =3D amdgpu_vkms_sw_init=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sw_fini =3D amdgpu_vkms_sw_fini=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hw_init =3D amdgpu_vkms_hw_init=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hw_fini =3D amdgpu_vkms_hw_fini=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .suspend =3D amdgpu_vkms_suspend=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .resume =3D amdgpu_vkms_resume,<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .is_idle =3D amdgpu_vkms_is_idle=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .wait_for_idle =3D amdgpu_vkms_w=
ait_for_idle,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .soft_reset =3D amdgpu_vkms_soft=
_reset,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_clockgating_state =3D amdgp=
u_vkms_set_clockgating_state,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_powergating_state =3D amdgp=
u_vkms_set_powergating_state,<br>
&gt; +};<br>
&gt; +<br>
&gt; +const struct amdgpu_ip_block_version amdgpu_vkms_ip_block =3D<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .type =3D AMD_IP_BLOCK_TYPE_DCE,=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .major =3D 1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .minor =3D 0,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .rev =3D 0,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .funcs =3D &amp;amdgpu_vkms_ip_f=
uncs,<br>
&gt; +};<br>
&gt; +<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_vkms.h<br>
&gt; index 5dab51fbecf3..97f1b79c0724 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h<br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;&nbsp; #define _AMDGPU_VKMS_H_<br>
&gt;<br>
&gt;&nbsp; #define XRES_DEF&nbsp; 1024<br>
&gt; -#define YRES_DEF&nbsp;&nbsp; 764<br>
&gt; +#define YRES_DEF&nbsp;&nbsp; 768<br>
<br>
Squash this fix into the original patch that added this macro.<br>
<br>
<br>
&gt;<br>
&gt;&nbsp; #define XRES_MAX&nbsp; 16384<br>
&gt;&nbsp; #define YRES_MAX&nbsp; 16384<br>
&gt; @@ -23,7 +23,4 @@ struct amdgpu_vkms_output {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_pending_vbl=
ank_event *event;<br>
&gt;&nbsp; };<br>
&gt;<br>
&gt; -int amdgpu_vkms_output_init(struct drm_device *dev,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; struct amdgpu_vkms_output *output, int index);<br>
&gt; -<br>
&gt;&nbsp; #endif /* _AMDGPU_VKMS_H_ */<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/am=
dgpu/cik.c<br>
&gt; index c0fcc41ee574..54f28c075f21 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/cik.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/cik.c<br>
&gt; @@ -70,7 +70,7 @@<br>
&gt;<br>
&gt;&nbsp; #include &quot;amdgpu_dm.h&quot;<br>
&gt;&nbsp; #include &quot;amdgpu_amdkfd.h&quot;<br>
&gt; -#include &quot;dce_virtual.h&quot;<br>
&gt; +#include &quot;amdgpu_vkms.h&quot;<br>
&gt;<br>
&gt;&nbsp; static const struct amdgpu_video_codec_info cik_video_codecs_enc=
ode_array[] =3D<br>
&gt;&nbsp; {<br>
&gt; @@ -2259,7 +2259,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;cik_sdma_ip=
_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;pp_smu_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -2277,7 +2277,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;cik_sdma_ip=
_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;pp_smu_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -2295,7 +2295,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;cik_sdma_ip=
_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;kv_smu_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -2315,7 +2315,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;cik_sdma_ip=
_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;kv_smu_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/dr=
m/amd/amdgpu/dce_virtual.c<br>
&gt; deleted file mode 100644<br>
&gt; index 18369b47eac7..000000000000<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,223 +0,0 @@<br>
&gt; -/*<br>
&gt; - * Copyright 2014 Advanced Micro Devices, Inc.<br>
&gt; - *<br>
&gt; - * Permission is hereby granted, free of charge, to any person obtain=
ing a<br>
&gt; - * copy of this software and associated documentation files (the &quo=
t;Software&quot;),<br>
&gt; - * to deal in the Software without restriction, including without lim=
itation<br>
&gt; - * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,<br>
&gt; - * and/or sell copies of the Software, and to permit persons to whom =
the<br>
&gt; - * Software is furnished to do so, subject to the following condition=
s:<br>
&gt; - *<br>
&gt; - * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; - * all copies or substantial portions of the Software.<br>
&gt; - *<br>
&gt; - * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO =
EVENT SHALL<br>
&gt; - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMA=
GES OR<br>
&gt; - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,<br>
&gt; - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR<br>
&gt; - * OTHER DEALINGS IN THE SOFTWARE.<br>
&gt; - *<br>
&gt; - */<br>
&gt; -<br>
&gt; -#include &lt;drm/drm_atomic_helper.h&gt;<br>
&gt; -<br>
&gt; -#include &quot;amdgpu.h&quot;<br>
&gt; -#ifdef CONFIG_DRM_AMDGPU_SI<br>
&gt; -#include &quot;dce_v6_0.h&quot;<br>
&gt; -#endif<br>
&gt; -#ifdef CONFIG_DRM_AMDGPU_CIK<br>
&gt; -#include &quot;dce_v8_0.h&quot;<br>
&gt; -#endif<br>
&gt; -#include &quot;dce_v10_0.h&quot;<br>
&gt; -#include &quot;dce_v11_0.h&quot;<br>
&gt; -#include &quot;dce_virtual.h&quot;<br>
&gt; -#include &quot;ivsrcid/ivsrcid_vislands30.h&quot;<br>
&gt; -#include &quot;amdgpu_display.h&quot;<br>
&gt; -#include &quot;amdgpu_vkms.h&quot;<br>
&gt; -<br>
&gt; -const struct drm_mode_config_funcs dce_virtual_mode_funcs =3D {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fb_create =3D amdgpu_display_us=
er_framebuffer_create,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_check =3D drm_atomic_hel=
per_check,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_commit =3D drm_atomic_he=
lper_commit,<br>
&gt; -};<br>
&gt; -<br>
&gt; -static int dce_virtual_sw_init(void *handle)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r, i;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D (=
struct amdgpu_device *)handle;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;max_vblank=
_count =3D 0;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_confi=
g.funcs =3D &amp;dce_virtual_mode_funcs;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_confi=
g.max_width =3D XRES_MAX;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_confi=
g.max_height =3D YRES_MAX;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_confi=
g.preferred_depth =3D 24;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_confi=
g.prefer_shadow =3D 1;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_confi=
g.fb_base =3D adev-&gt;gmc.aper_base;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_display_modeset_cre=
ate_props(adev);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return r;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;amdgpu_vkms_output =3D =
kzalloc(sizeof(struct amdgpu_vkms_output) * adev-&gt;mode_info.num_crtc, GF=
P_KERNEL);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* allocate crtcs, encoders, con=
nectors */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; adev-&gt;mo=
de_info.num_crtc; i++) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; r =3D amdgpu_vkms_output_init(adev_to_drm(adev), &amp;adev-=
&gt;amdgpu_vkms_output[i], i);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (r)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<b=
r>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_kms_helper_poll_init(adev_to=
_drm(adev));<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mode_info.mode_config_i=
nitialized =3D true;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int dce_virtual_sw_fini(void *handle)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D (=
struct amdgpu_device *)handle;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 0;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; adev-&gt;mo=
de_info.num_crtc; i++)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (adev-&gt;mode_info.crtcs[i])<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hrtimer_can=
cel(&amp;adev-&gt;mode_info.crtcs[i]-&gt;vblank_timer);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(adev-&gt;mode_info.bios_ha=
rdcoded_edid);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(adev-&gt;amdgpu_vkms_outpu=
t);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_kms_helper_poll_fini(adev_to=
_drm(adev));<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mode_info.mode_config_i=
nitialized =3D false;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int dce_virtual_hw_init(void *handle)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D (=
struct amdgpu_device *)handle;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (adev-&gt;asic_type) {<br=
>
&gt; -#ifdef CONFIG_DRM_AMDGPU_SI<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_TAHITI:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_PITCAIRN:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_VERDE:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_OLAND:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; dce_v6_0_disable_dce(adev);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
&gt; -#endif<br>
&gt; -#ifdef CONFIG_DRM_AMDGPU_CIK<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_BONAIRE:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_HAWAII:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_KAVERI:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_KABINI:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_MULLINS:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; dce_v8_0_disable_dce(adev);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
&gt; -#endif<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_FIJI:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_TONGA:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; dce_v10_0_disable_dce(adev);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_CARRIZO:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_STONEY:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_POLARIS10:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_POLARIS11:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_VEGAM:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; dce_v11_0_disable_dce(adev);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_TOPAZ:<br>
&gt; -#ifdef CONFIG_DRM_AMDGPU_SI<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_HAINAN:<br>
&gt; -#endif<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /* no DCE */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int dce_virtual_hw_fini(void *handle)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int dce_virtual_suspend(void *handle)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D (=
struct amdgpu_device *)handle;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D drm_mode_config_helper_sus=
pend(adev_to_drm(adev));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return r;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dce_virtual_hw_fini(handl=
e);<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int dce_virtual_resume(void *handle)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D (=
struct amdgpu_device *)handle;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D dce_virtual_hw_init(handle=
);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return r;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return drm_mode_config_helper_re=
sume(adev_to_drm(adev));<br>
&gt; -}<br>
&gt; -<br>
&gt; -static bool dce_virtual_is_idle(void *handle)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int dce_virtual_wait_for_idle(void *handle)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int dce_virtual_soft_reset(void *handle)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int dce_virtual_set_clockgating_state(void *handle,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; enum amd_clockgating_state state)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static int dce_virtual_set_powergating_state(void *handle,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; enum amd_powergating_state state)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; -}<br>
&gt; -<br>
&gt; -static const struct amd_ip_funcs dce_virtual_ip_funcs =3D {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;dce_virtual&quot=
;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .early_init =3D NULL,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .late_init =3D NULL,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sw_init =3D dce_virtual_sw_init=
,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sw_fini =3D dce_virtual_sw_fini=
,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hw_init =3D dce_virtual_hw_init=
,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .hw_fini =3D dce_virtual_hw_fini=
,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .suspend =3D dce_virtual_suspend=
,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .resume =3D dce_virtual_resume,<=
br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .is_idle =3D dce_virtual_is_idle=
,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .wait_for_idle =3D dce_virtual_w=
ait_for_idle,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .soft_reset =3D dce_virtual_soft=
_reset,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_clockgating_state =3D dce_v=
irtual_set_clockgating_state,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_powergating_state =3D dce_v=
irtual_set_powergating_state,<br>
&gt; -};<br>
&gt; -<br>
&gt; -const struct amdgpu_ip_block_version dce_virtual_ip_block =3D<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .type =3D AMD_IP_BLOCK_TYPE_DCE,=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .major =3D 1,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .minor =3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .rev =3D 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .funcs =3D &amp;dce_virtual_ip_f=
uncs,<br>
&gt; -};<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.h b/drivers/gpu/dr=
m/amd/amdgpu/dce_virtual.h<br>
&gt; deleted file mode 100644<br>
&gt; index ed422012c8c6..000000000000<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,30 +0,0 @@<br>
&gt; -/*<br>
&gt; - * Copyright 2014 Advanced Micro Devices, Inc.<br>
&gt; - *<br>
&gt; - * Permission is hereby granted, free of charge, to any person obtain=
ing a<br>
&gt; - * copy of this software and associated documentation files (the &quo=
t;Software&quot;),<br>
&gt; - * to deal in the Software without restriction, including without lim=
itation<br>
&gt; - * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,<br>
&gt; - * and/or sell copies of the Software, and to permit persons to whom =
the<br>
&gt; - * Software is furnished to do so, subject to the following condition=
s:<br>
&gt; - *<br>
&gt; - * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; - * all copies or substantial portions of the Software.<br>
&gt; - *<br>
&gt; - * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO =
EVENT SHALL<br>
&gt; - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMA=
GES OR<br>
&gt; - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,<br>
&gt; - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR<br>
&gt; - * OTHER DEALINGS IN THE SOFTWARE.<br>
&gt; - *<br>
&gt; - */<br>
&gt; -<br>
&gt; -#ifndef __DCE_VIRTUAL_H__<br>
&gt; -#define __DCE_VIRTUAL_H__<br>
&gt; -<br>
&gt; -extern const struct amdgpu_ip_block_version dce_virtual_ip_block;<br>
&gt; -<br>
&gt; -#endif<br>
&gt; -<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amd=
gpu/nv.c<br>
&gt; index 436fb13e32f0..696ecc1ccb28 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/nv.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/nv.c<br>
&gt; @@ -58,7 +58,7 @@<br>
&gt;&nbsp; #include &quot;jpeg_v2_0.h&quot;<br>
&gt;&nbsp; #include &quot;vcn_v3_0.h&quot;<br>
&gt;&nbsp; #include &quot;jpeg_v3_0.h&quot;<br>
&gt; -#include &quot;dce_virtual.h&quot;<br>
&gt; +#include &quot;amdgpu_vkms.h&quot;<br>
&gt;&nbsp; #include &quot;mes_v10_1.h&quot;<br>
&gt;&nbsp; #include &quot;mxgpu_nv.h&quot;<br>
&gt;&nbsp; #include &quot;smuio_v11_0.h&quot;<br>
&gt; @@ -721,7 +721,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !amdgpu_sriov_vf(adev))<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;smu_v11_0_ip_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -749,7 +749,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;firmware.load_type =3D=3D AMDGPU_FW_=
LOAD_PSP)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;smu_v11_0_ip_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -779,7 +779,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_support_sw_smu(adev))<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;smu_v11_0_ip_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -802,7 +802,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_support_sw_smu(adev))<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;smu_v11_0_ip_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -823,7 +823,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;psp_v11_0_ip_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;smu_v11_0_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -843,7 +843,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_support_sw_smu(adev))<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;smu_v11_0_ip_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev)=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; amdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -865,7 +865,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;gfx_v10_0_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;sdma_v5_2_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -883,11 +883,11 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;psp_v13_0_ip_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;smu_v13_0_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;gfx_v10_0_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;sdma_v5_2_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amd=
gpu/si.c<br>
&gt; index 7cbc2bb03bc6..e6d2f74a7976 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/si.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/si.c<br>
&gt; @@ -44,7 +44,7 @@<br>
&gt;&nbsp; #include &quot;dce_v6_0.h&quot;<br>
&gt;&nbsp; #include &quot;si.h&quot;<br>
&gt;&nbsp; #include &quot;uvd_v3_1.h&quot;<br>
&gt; -#include &quot;dce_virtual.h&quot;<br>
&gt; +#include &quot;amdgpu_vkms.h&quot;<br>
&gt;&nbsp; #include &quot;gca/gfx_6_0_d.h&quot;<br>
&gt;&nbsp; #include &quot;oss/oss_1_0_d.h&quot;<br>
&gt;&nbsp; #include &quot;oss/oss_1_0_sh_mask.h&quot;<br>
&gt; @@ -2759,7 +2759,7 @@ int si_set_ip_blocks(struct amdgpu_device *adev)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;si_dma_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;si_smu_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC) &amp;&amp; defined(CONFIG_DRM_AMD=
_DC_SI)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -2777,7 +2777,7 @@ int si_set_ip_blocks(struct amdgpu_device *adev)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;si_dma_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;si_smu_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC) &amp;&amp; defined(CONFIG_DRM_AMD=
_DC_SI)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -2795,7 +2795,7 @@ int si_set_ip_blocks(struct amdgpu_device *adev)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;si_dma_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;si_smu_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; BUG();<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/=
amdgpu/soc15.c<br>
&gt; index a5e085e570f7..f7b56a746c15 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&gt; @@ -74,7 +74,7 @@<br>
&gt;&nbsp; #include &quot;smuio_v9_0.h&quot;<br>
&gt;&nbsp; #include &quot;smuio_v11_0.h&quot;<br>
&gt;&nbsp; #include &quot;smuio_v13_0.h&quot;<br>
&gt; -#include &quot;dce_virtual.h&quot;<br>
&gt; +#include &quot;amdgpu_vkms.h&quot;<br>
&gt;&nbsp; #include &quot;mxgpu_ai.h&quot;<br>
&gt;&nbsp; #include &quot;amdgpu_ras.h&quot;<br>
&gt;&nbsp; #include &quot;amdgpu_xgmi.h&quot;<br>
&gt; @@ -843,7 +843,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;pp_smu_ip_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -863,7 +863,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;sdma_v4_0_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;pp_smu_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -885,7 +885,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;gfx_v9_0_ip=
_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;sdma_v4_0_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;smu_v11_0_i=
p_block);<br>
&gt; @@ -909,7 +909,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;gfx_v9_0_ip=
_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;sdma_v4_0_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev)=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amd=
gpu/vi.c<br>
&gt; index 3d21c0799037..fe9a7cc8d9eb 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/vi.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/vi.c<br>
&gt; @@ -77,7 +77,7 @@<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_ACP)<br>
&gt;&nbsp; #include &quot;amdgpu_acp.h&quot;<br>
&gt;&nbsp; #endif<br>
&gt; -#include &quot;dce_virtual.h&quot;<br>
&gt; +#include &quot;amdgpu_vkms.h&quot;<br>
&gt;&nbsp; #include &quot;mxgpu_vi.h&quot;<br>
&gt;&nbsp; #include &quot;amdgpu_dm.h&quot;<br>
&gt;<br>
&gt; @@ -2102,7 +2102,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;sdma_v2_4_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;pp_smu_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_FIJI:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;vi_common_i=
p_block);<br>
&gt; @@ -2112,7 +2112,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;sdma_v3_0_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;pp_smu_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -2132,7 +2132,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;sdma_v3_0_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;pp_smu_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sri=
ov_vf(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -2155,7 +2155,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;sdma_v3_1_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;pp_smu_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -2173,7 +2173,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;sdma_v3_0_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;pp_smu_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; @@ -2194,7 +2194,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;sdma_v3_0_i=
p_block);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;pp_smu_ip_b=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devi=
ce_ip_block_add(adev, &amp;amdgpu_vkms_ip_block);<br>
&gt;&nbsp; #if defined(CONFIG_DRM_AMD_DC)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else if (amdgpu_device_has_dc_support(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a=
mdgpu_device_ip_block_add(adev, &amp;dm_ip_block);<br>
&gt; --<br>
&gt; 2.32.0<br>
&gt;<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BYAPR12MB32218D88F93BC85251C9C483EAE59BYAPR12MB3221namp_--
