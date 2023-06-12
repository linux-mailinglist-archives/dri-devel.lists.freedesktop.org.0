Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0EC72C8D3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 16:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD86C10E297;
	Mon, 12 Jun 2023 14:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7AE10E08F;
 Mon, 12 Jun 2023 14:41:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACDmJxmg+tEcliI78RUVQP0NHkFpwUEg7KCqxClVdnot3HJs0J69q7hjAo/Ef55p4e8diMt8kz0sxv+t/35lqO/x0pw3xr+/E+xo1qgVFpt9049LwGQBN/a3hQf3qkiMQFrChUHa3XUIN0MVvjhLIph9/jA32T4zt7nK+mT2pioqXbSJyOPs0jqpm5T3nJgjBoSsC6ISBD4YpKNg0Y3NXdgoVVaYwwqOFQ9Ux47zv8kKMNMgMYDnFNFEA82rBKsWJ3eugO8b70cz/XReaIdMPl4odum0YAcZqyUIHw80L1HJnp/5zRaYKFZc+3ICXoo3FP/4UMaj+9+QknGajLmzrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zr7CaUb78zxGkBWlzeLtrB+SiTsZ0i0eMEPIJmAQsEI=;
 b=ESFXpJSRa83YmAB6rW1v3SwFd//2TAsDxTuH4hXG1aR6PalQiQjKuv0iYWAQzX9EEOrd6l9HXzWgRDqz1UtO/8EeF+yZgl+R+GbnrbVsK8za0CvxF5ya2poXuaWya+SaVRM7SeKysXovOBz+hki65u+k0B3YxcwTppwzVOt6o0uRqB7wJI7O0FyEOk+31H6Wbre+B1qBPffeaFUX5KPhEYc/tWWoetZwnVMk1COuHBmc980NKoBFNd72kTDY9knQYWpiiLQPiOM53fZSxM7RAzASI0QXH4UklmxjiFUfsWF2pXs0t/19TkQcHANzu0pdRMnL1Z5OmtH+YUIEE8B5XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr7CaUb78zxGkBWlzeLtrB+SiTsZ0i0eMEPIJmAQsEI=;
 b=oTjBnLzrh6wsXOxdR2F7am1YNEdXECRLBYuTZsGL3MzqpMGleXk1a5y+/K95Oqi+bhf7rlmKVWqtuUJBY/ncPGMaEUuqAsIo1AagdwDmg14vhPCiX9ybSbkAuLOh9HtwqvgEj845s70nr/RPnnktYhMiC4LIUE+n8rLmqGcFnyU=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CY8PR12MB8213.namprd12.prod.outlook.com (2603:10b6:930:71::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Mon, 12 Jun
 2023 14:41:15 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::c549:4aeb:a02f:56b2]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::c549:4aeb:a02f:56b2%4]) with mapi id 15.20.6455.043; Mon, 12 Jun 2023
 14:41:15 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Lee, Alvin"
 <Alvin.Lee2@amd.com>, "Lei, Jun" <Jun.Lei@amd.com>, "Zhuo, Qingqing
 (Lillian)" <Qingqing.Zhuo@amd.com>, "Liu, Wenjing" <Wenjing.Liu@amd.com>,
 "Tam, Samson" <Samson.Tam@amd.com>, "Varone, Dillon" <Dillon.Varone@amd.com>, 
 "Liu, HaoPing (Alan)" <HaoPing.Liu@amd.com>
Subject: RE: [PATCH v2] drm/amdgpu: Add error reporting code for the display
 core
Thread-Topic: [PATCH v2] drm/amdgpu: Add error reporting code for the display
 core
Thread-Index: AQHZnHjExsUIRS/8wUetf1h9p3C+Wa+HPmgw
Date: Mon, 12 Jun 2023 14:41:14 +0000
Message-ID: <BL1PR12MB5144EE0E3EB0D30F27D5F824F754A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20230611152351.24569-1-suijingfeng@loongson.cn>
In-Reply-To: <20230611152351.24569-1-suijingfeng@loongson.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=39c04b06-bf1c-4570-a52f-dfc09840778d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-06-12T14:39:31Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|CY8PR12MB8213:EE_
x-ms-office365-filtering-correlation-id: a809e64c-4c83-4224-8ef6-08db6b531322
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PrPwZCwF2gTjFGF3qcBFexwmowVMd6hjbqOiHcUl/fVFYRTmedMYKrJl6IWIlYzBY36bhGrY6RjUtufnWTpLVNZ/dAttHqtAmyG04ezC7LIHnmjIqqSTmxS4y5KLMEn3F1QF19rLkDGMOaUo+1IPoItHiw9OrxFlVpXsWLKq2x9aWu23q9EAGRb8rnuzXbUr+OAvILtu+hnedfqMPqPoSSg28fcbkeR/oVXY9C8rPopATYIQoIobbE/p5/nm6sUPCEl7JFDfOaxPsHG10VVclRMAT7ko7GXc2R/2SedlgAe/EJVKcP25rC/2DYnDnAvPU7ylEtrwXAtglVw3h8HI4t+a6S+xCiHugZ19gG6SAd//BzunlVPkdHuFQqL7zDfuK0a2RFjlA2Y+M0/0yM5UogAM+UnSNd12N69qunXL+grD+0h31POYYqXoLOh5Kmsp7xHs4hWhVyvJte0WwovnH8vsXrUZLetKi/XLpHpxi/RKHwuIYOEbQtEE5Dl4ilFpgk6DARIXlB3G1/27EojT8bBK2dqLY6CbPQP6gFpW6w6MpSPdNA0oxOTt0qCdIgjpBIBkoql041F/lL38QdtErjbFSIkQZMonQDSNbtywRPcRwpUXMLF0KQyQ5Dgm3e320UA4HYgrfhhqRfuh4oJpjA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199021)(6506007)(7696005)(71200400001)(55016003)(33656002)(86362001)(122000001)(9686003)(921005)(38100700002)(38070700005)(26005)(186003)(53546011)(83380400001)(8676002)(5660300002)(41300700001)(316002)(52536014)(2906002)(54906003)(110136005)(8936002)(66476007)(478600001)(76116006)(66446008)(64756008)(66556008)(4326008)(6636002)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7EnNWRiiWBO07CzxfFjvY2HxsmwtdL7CNVblmD76yM+l9LP2Q9si/UbMiMFE?=
 =?us-ascii?Q?AN9X8aLIRcvwkQSmW0BTNiOissvPVEofkYXTQgfJY/A6HjUrdWy/rCkWz7wz?=
 =?us-ascii?Q?uN+L1JvRSpntEFZ20WGLHs6n9tR8QGMcokUqDs1fjsq4yfH4mg4z60dGXs0h?=
 =?us-ascii?Q?HwQiV9wAtEY6WKWZlRktZPWlJBxRaOHAnbw+uP54OaDppngc8kcwOgXl1W35?=
 =?us-ascii?Q?neVLRHJX4FQgjwh2sgd++TlkqdOqPkAFpzlo+/q/vFc3k7dPBQA6gfeOQUqs?=
 =?us-ascii?Q?lnrj0vs6gI0EkGBaUmVmWGlg8VYbpH/P3UI7co4YFP4DPCaFmfhafidOviAv?=
 =?us-ascii?Q?6hapCe3i5/wlPHTHDimtv8EwGV2TAtqdfvu8e2Txh49wPud1MjBvWJI6WqOE?=
 =?us-ascii?Q?C563x2XHboBUrW9BzkCRCJjoIQL3YvKZDzsBePjEgpresx1xdo/1Gq6sd8B/?=
 =?us-ascii?Q?7mhrao8rmeu1iz6WcuCs1E+BeBxjD6xWbRTTXuvpulELxwQOy+dMsQgUQN1J?=
 =?us-ascii?Q?kIuusxk/hfsInNQdmtxnwfklO1/YMgPevQ/Q7L0HMzw0h8Cw2wSMzKOiUD2X?=
 =?us-ascii?Q?AUuGzhwL6angxEWzsRTUmJzcegZCk7R7lvU0kQi+CNAVlTorDsmqeCLu/kHV?=
 =?us-ascii?Q?nYdH7aKVuQ5t2JjY/nHBzJVSQj8xV2CpZfSh3KjcbqtPY7bVSdFxZup2JlYY?=
 =?us-ascii?Q?thbRFnLLC9oe4BPHDQlWO1CWPj35uaiAtXIzRBdoNVEfnGzS1KutekDOSkVX?=
 =?us-ascii?Q?bankVzJldn/3pzaEo7+kS8XC6B/jJqXe/GhekcGGIBDPV3Nb7l5x673LZWtE?=
 =?us-ascii?Q?wTstcOrco26TT6wWYqCp4pEva32aPvuhUtK1K1FVmGZ4O5EdQjBk7R8o9g0t?=
 =?us-ascii?Q?vEYViwGrEdLrAqXL4Ke2H2WJWvi7V6REOJX87l/6jqfNJ0bpSeczo76w9zFo?=
 =?us-ascii?Q?iCUXRe2Qv+r/wQOCPpacw4zD1N2cMz3rkOr2LtAPdmJHZmku5hGcObhAJcLo?=
 =?us-ascii?Q?oN7PgNrcdn1H4VMVJ3Cu9xwevYtWNbuXJccZx149TwoWT54lavyzQDxeQ6oe?=
 =?us-ascii?Q?wIN6ODJIT/ZDL51aDi27QqobfKTxVITtyTprqKeEHZBTKB/zqTviVp39PDcU?=
 =?us-ascii?Q?oFEy+pmr6cNFUPNMiqtYGlz1x6k0mEfs4bckN4HlBBhp5M/UjUaxcbl/aJAy?=
 =?us-ascii?Q?oR7+3UrmxF5zDfv5QEG55qvL0DnbfttPCLPB5lKm1aGts+NJXxPdxDhKyqhW?=
 =?us-ascii?Q?wuZ8i0AjU37exs7aKh4Amx5DcT4SuqZWk0tS17JwCYOvy1IAGcotu61BTuNW?=
 =?us-ascii?Q?HwuffoTB0sukzy2GxKPDbXUkjFF7r+Rqfh9NZGZ97UYtukHCU50U0/nthUDB?=
 =?us-ascii?Q?39P9KwaWH5MSLvpPCaDSzEbJz2n9qHFzcD4JGoPrgRFbRAcNhcBfkagUcZ83?=
 =?us-ascii?Q?Wb+r/Uw4n5YCz+3Mv7Q0+kVxyymLbNoBEJEuPmygCBcLeroCmcPwpHtZubDN?=
 =?us-ascii?Q?HOMi68JGQAIi7HzrY7Pi54Zg5szu98sDlN+GUhP3VhmthgcXQDOrK25FJ/K4?=
 =?us-ascii?Q?z7Vn5RGYT1w25dyko8Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a809e64c-4c83-4224-8ef6-08db6b531322
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 14:41:15.0109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 13aq6m7eFMTfJ4I2lwGBsnd6W/2WD4MwxZrpneA0xa7pyZyDm6pvCEG3XVwigYJOWbLd4017OLHptDphniWtlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8213
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> Sent: Sunday, June 11, 2023 11:24 AM
> To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo)
> <Sunpeng.Li@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>;
> Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Lee, Alvin
> <Alvin.Lee2@amd.com>; Lei, Jun <Jun.Lei@amd.com>; Zhuo, Qingqing (Lillian=
)
> <Qingqing.Zhuo@amd.com>; Liu, Wenjing <Wenjing.Liu@amd.com>; Tam,
> Samson <Samson.Tam@amd.com>; Varone, Dillon
> <Dillon.Varone@amd.com>; Liu, HaoPing (Alan) <HaoPing.Liu@amd.com>
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux=
-
> kernel@vger.kernel.org
> Subject: [PATCH v2] drm/amdgpu: Add error reporting code for the display
> core
>
> [why]
>
> Because the drm/amdgpu drivers do not work with Navi 10 [RX 5700] series
> GPUs on non-x86 platforms, this patch helps find out where the drivers fa=
il.
> After applying his patch, the following error message can be found:
>
> [drm:dc_create [amdgpu]] *ERROR* dc_construct: failed to create resource
> pool [drm:dc_create [amdgpu]] *ERROR* dc_create: dc construct failed [drm=
]
> Display Core failed to initialize with v3.2.230!

Curious what the failure was on your platform.  Resource create is mostly j=
ust allocating structures.

Alex

>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 29 ++++++++++++++++--------
>  1 file changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c
> b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 52564b93f7eb..d33b78aa3e58 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -951,7 +951,7 @@ static bool dc_construct(struct dc *dc,
>               goto fail;
>       }
>
> -        dc_ctx =3D dc->ctx;
> +     dc_ctx =3D dc->ctx;
>
>       /* Resource should construct all asic specific resources.
>        * This should be the only place where we need to parse the asic id
> @@ -990,16 +990,21 @@ static bool dc_construct(struct dc *dc,
>       }
>
>       dc->res_pool =3D dc_create_resource_pool(dc, init_params, dc_ctx-
> >dce_version);
> -     if (!dc->res_pool)
> +     if (!dc->res_pool) {
> +             dm_error("%s: failed to create resource pool\n", __func__);
>               goto fail;
> +     }
>
>       /* set i2c speed if not done by the respective dcnxxx__resource.c *=
/
>       if (dc->caps.i2c_speed_in_khz_hdcp =3D=3D 0)
>               dc->caps.i2c_speed_in_khz_hdcp =3D dc-
> >caps.i2c_speed_in_khz;
>
>       dc->clk_mgr =3D dc_clk_mgr_create(dc->ctx, dc->res_pool->pp_smu, dc=
-
> >res_pool->dccg);
> -     if (!dc->clk_mgr)
> +     if (!dc->clk_mgr) {
> +             dm_error("%s: failed to create clk manager\n", __func__);
>               goto fail;
> +     }
> +
>  #ifdef CONFIG_DRM_AMD_DC_FP
>       dc->clk_mgr->force_smu_not_present =3D init_params-
> >force_smu_not_present;
>
> @@ -1022,14 +1027,18 @@ static bool dc_construct(struct dc *dc,
>               goto fail;
>       }
>
> -     if (!create_links(dc, init_params->num_virtual_links))
> +     if (!create_links(dc, init_params->num_virtual_links)) {
> +             dm_error("%s: failed to create links\n", __func__);
>               goto fail;
> +     }
>
>       /* Create additional DIG link encoder objects if fewer than the
> platform
>        * supports were created during link construction.
>        */
> -     if (!create_link_encoders(dc))
> +     if (!create_link_encoders(dc)) {
> +             dm_error("%s: failed to create link encoders\n", __func__);
>               goto fail;
> +     }
>
>       dc_resource_state_construct(dc, dc->current_state);
>
> @@ -1314,11 +1323,15 @@ struct dc *dc_create(const struct dc_init_data
> *init_params)
>               return NULL;
>
>       if (init_params->dce_environment =3D=3D DCE_ENV_VIRTUAL_HW) {
> -             if (!dc_construct_ctx(dc, init_params))
> +             if (!dc_construct_ctx(dc, init_params)) {
> +                     DC_LOG_ERROR("%s: dc construct failed\n",
> __func__);
>                       goto destruct_dc;
> +             }
>       } else {
> -             if (!dc_construct(dc, init_params))
> +             if (!dc_construct(dc, init_params)) {
> +                     DC_LOG_ERROR("%s: dc construct failed\n",
> __func__);
>                       goto destruct_dc;
> +             }
>
>               full_pipe_count =3D dc->res_pool->pipe_count;
>               if (dc->res_pool->underlay_pipe_index !=3D
> NO_UNDERLAY_PIPE) @@ -1349,8 +1362,6 @@ struct dc *dc_create(const
> struct dc_init_data *init_params)
>
>       DC_LOG_DC("Display Core initialized\n");
>
> -
> -
>       return dc;
>
>  destruct_dc:
> --
> 2.25.1

