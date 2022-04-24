Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7D350D506
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 22:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4FB10E77F;
	Sun, 24 Apr 2022 20:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8281510E46B;
 Sun, 24 Apr 2022 20:15:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ms4um4D+8HOTu+Ri1Jynzi4e9EguSkxe6blkUXHeP8xDhMU5r8Plh1VaQnsntooVROdwr9tdLqfJhRkdIlld7aQ/uS3447/xRUbnsdx3GsTN6aNwqnJ+Y3vHv8x2p0po9nCR9e4wOP8jzcbDEIX3dnpj2qsnmP8A6azjJQanLBIuAIMqXqvg048WhwzpODqMXE4w2NVdphv9cAzBIb2owyVFZ6s4emEhbex/+B+pxWMxgpDJ3F1wzPeLhAWLbY7y9F/SXSRyMCV/j+2fJX8ZlUnIALUyUEeAbQmK6gk3ijD07UqyNh48wfE9ASFmI5qzzy5yttV4eB+PO4c4p5Lfvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6XocEDhVwdNVYEyIfpwMFBJPXnKy8tXrfrZ3mJVu38=;
 b=JGQGm+imFlOON75pAIiQK1au9tJ7FjeuYasj4H5nhPXTW0vr8GgQN3a9Ez2kJbuwJ7LBg2WC7cnd1C96niakY6iBxJGJe1utI4mzvAXtMWbAF8+T8xq2Z0/Cuikh+iFS2IL1OwrhWs20/KjgZIgvI42xf5BZuW2J21XbqhNT4T7hz1zePWKu9lLpb8Plt1mTGMlsS0gVV1rmxow2CgtzqSdDgk8JI+f2C6aCUgrNZoAlCIBUsOwWpkUkAitEmgGI1uENAmMbjfsc8+9xoDnxkd+s7RdUkamt3BdrvedVg2sOUtuzdmkSTP97KHcJiztIYvqGxIMvyPU20dUORkgpZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6XocEDhVwdNVYEyIfpwMFBJPXnKy8tXrfrZ3mJVu38=;
 b=5GD4bARy28GMcNdSs7In+ESSdGGYY9PV/GSV8BaIfRg0fXWKP3NNOGAKOkJqdrofoAfHHpNtMQ/G8kw1MhffeM1SEQWSuB5eZ5o6+aVVbksY38b788UHHmmQtlcw7M5MG1mX8SJWLDq1/zrtP4w8wB1iqrVnYNJaBoeiid3cZ2M=
Received: from DM4PR12MB5214.namprd12.prod.outlook.com (2603:10b6:5:395::22)
 by CY4PR12MB1349.namprd12.prod.outlook.com (2603:10b6:903:40::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Sun, 24 Apr
 2022 20:15:16 +0000
Received: from DM4PR12MB5214.namprd12.prod.outlook.com
 ([fe80::a805:d518:afcb:4965]) by DM4PR12MB5214.namprd12.prod.outlook.com
 ([fe80::a805:d518:afcb:4965%5]) with mapi id 15.20.5186.021; Sun, 24 Apr 2022
 20:15:16 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: Guo Zhengkui <guozhengkui@vivo.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, "Liu, Charlene" <Charlene.Liu@amd.com>, "Lei, Jun"
 <Jun.Lei@amd.com>, =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, "open list:AMD DISPLAY CORE"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/amd/display: fix if == else warning
Thread-Topic: [PATCH] drm/amd/display: fix if == else warning
Thread-Index: AQHYV7qv7thHdmRXJkie4zu+ewRH+qz/gGaw
Date: Sun, 24 Apr 2022 20:15:15 +0000
Message-ID: <DM4PR12MB52143C2204F820E49D377A519EF99@DM4PR12MB5214.namprd12.prod.outlook.com>
References: <20220424090640.1865-1-guozhengkui@vivo.com>
In-Reply-To: <20220424090640.1865-1-guozhengkui@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=2940ef4c-806d-49dc-ad37-8ba4d9af77d5;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-04-24T20:14:40Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 437425b4-a468-41cf-7dbb-08da262f2575
x-ms-traffictypediagnostic: CY4PR12MB1349:EE_
x-microsoft-antispam-prvs: <CY4PR12MB1349B5CD5C36D86378F8E5259EF99@CY4PR12MB1349.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zx90lYEe1uvUBSHaVM95v4WaCmNRGFI+WsxJqX9otoyIazNHoTPYCsqxf3mDDtF9rJuY0aUt52SPpd3D0smEKB8WyAzmPI+rMsjj9hTZh0ZCuS3LSlah2gciP42X823UWSqbkUECtCH3FPhPTvgXGCbUX8csmmAnSjws86irYuEd+Z2gkEEm8bGtt3ttdZ5+dCwxO/ST/irpvatk/4cIWf3I/nbVIT9TLY5sZxsRzLHALrBK2b4Pf2kDjK+q/wFse7XAYzRsudgGlomlao0PeDb4TgUUKCKqqXsEYYAMutoiFO3ICeffeODeQ0WnAJvR6GaLQv5ZP9nCmACquIj8Yvv5GoolTXt51JoJU7QoHnHIEdQgQ4zeKXlUcX6v5OsRdWmTO0hibmmbbNoddDA0ClNg9TauY6mib9YppGH9ok4cIAFqZ/mc54RsALdFpst70/rvyorrl209ns6ckI+JsibUuE+TY9bYGdAkCNRo3+rLkIE8jLiCPT+czTi/684F9xZ/W3owqduMmb20VkAfmKG+1eUoHlk7LetIa+rwuw/pRMg2D/8jDvWuHsX9tJT1X/Nj3BdDJDkOizQDYpz+8xTTy5Gbqv0+xIt+22C1eqHoV2UkCZS/KSRgSkXoWxyVec8QRwcV6BElJR1Bz9a4WPM95ns3FOp3AdTY/kAygNmuQfOGBwQMkkPxUQ894ccUXgtsn5OU6XrQjSOz5e/abhCSjNYJutpf25ZYFjMjnLo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5214.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(921005)(122000001)(33656002)(66946007)(71200400001)(5660300002)(55016003)(38070700005)(38100700002)(76116006)(316002)(110136005)(508600001)(45080400002)(8676002)(26005)(53546011)(86362001)(83380400001)(6506007)(7696005)(9686003)(8936002)(52536014)(66476007)(66446008)(64756008)(66556008)(4326008)(186003)(66574015);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?acLlxNWg30suGGFpXCahAlngB0Xib6VYX4zShmx34usNEfsjc+Vn/qMYCz?=
 =?iso-8859-1?Q?0mJaIdH4GOy2s3hRv9WbYE9Dmx3W6P/MuxzOhAXi3m5l4x0/NTel13ubkZ?=
 =?iso-8859-1?Q?BjCfLrtbYjB+NkswxvK7N8QidJunlVidvpCLxDNVwbWuI7ej2LKhcfXgwc?=
 =?iso-8859-1?Q?/JgD6choouP9hQgDxEfVu/8MnA0KHABiHzwWDEFlURk3h3aKzOhdboRhgu?=
 =?iso-8859-1?Q?c6hviHoA+VJwIUPmbQABYIZHXZvgmlNNhaF1a5C7DLtI6qvxyBlTKdSd/3?=
 =?iso-8859-1?Q?pdI3umoggewGmRddq5kSNOSaPx+T6EC1BGuh3l5kZWGtvsyw14nG71U/i9?=
 =?iso-8859-1?Q?c9eB/494AWpCIG73scxMjF/9UHt1DByLy1Hhgv6jT2wq9/sMqn2OIxjajr?=
 =?iso-8859-1?Q?w/5zCopyw08M0+bYERG8iDB/AjBUPxsr/ysE2EGmV//x6crYHNBzbhXMWr?=
 =?iso-8859-1?Q?ViUJRDywYSuqq3lm/4/sgYAiwP+qlKAwFPjfEgDO0T0tUDJmJOVXT9glOp?=
 =?iso-8859-1?Q?++Nyby8YP/5EzdcDOq1JuRicxSRn/DhzDWDngURV26O623aDdt+OH7b8XA?=
 =?iso-8859-1?Q?PnWMf2rs+crvs8Q1MdnMA0k8iEhjTPkb5iAo7B/PumoaE41yl4036nCsUI?=
 =?iso-8859-1?Q?GfDRwpQkgco9NaPecK4Z8hPrDu1NE/yt7U8NuoZlvEcGilITdD3n5AvORd?=
 =?iso-8859-1?Q?Nz4CM58WZHQTkrk7jCdtKIxcRoMKe0DwLg7X32NUuKpWT5pDQiQU7KSsaR?=
 =?iso-8859-1?Q?oJayJ1i0WA8paWTFkaFSDzxAhTFRDwWUBAhiwb1aYWPgqFpes6nDkRZjVv?=
 =?iso-8859-1?Q?itETrCGRvH5zAZuadNH4VZ3RqfOb0+I0K0qR/JlK8ecYMIsghuCGSn7SN9?=
 =?iso-8859-1?Q?j8MXlOWwLpmIlut2a9/9mYAsfw7Impfz6s6XWu/Na903ssqFYgwD2qX+IZ?=
 =?iso-8859-1?Q?h7f8yIMKA/dV2fptUB0QBXLjBkFPwFSHK5hR200F0EYbuczYS2+/+sRwf9?=
 =?iso-8859-1?Q?ylqbYNE9tPguFS4pR4HR/dYR2H7AcVTyzFZg4CuvEeSsUKpbFE0BxEHjIr?=
 =?iso-8859-1?Q?yQVHPIOgCc60BWIH00TLgcAx7kJzEpYW7sVRNWFutB7UKTJ1A4KUeVrD1O?=
 =?iso-8859-1?Q?mV3JpCq/TsaIxojeZA/2S0VgigwS1rjfOKRbMUPiqsLYLd/wzIJurCoIyl?=
 =?iso-8859-1?Q?zzVuUvxXD7FK6cgqeVF9in07N1ER+uQeHznHWUjP6GOhvDAqTzFZnebQAH?=
 =?iso-8859-1?Q?RWLOMp0+3zjq9ky/Cg8cfsSRBQJ1uFhyTJHRhQSUgYjOICyHAx/ogc7pwm?=
 =?iso-8859-1?Q?Pk52FkFn8Ik45lrmIqTkkISO/Q8tehYPwK+XXtshY7PuRtHy/Qg7Q6kI+l?=
 =?iso-8859-1?Q?SeWziTk5CyuRnyY1g3i8cqkfttKi6zjgYqdWBXNQg3PtaKDBl5D5r83pfi?=
 =?iso-8859-1?Q?NAElVd5xRBErh7dneGVvfS/v6CWyWTVSA6LApfuuQwx898Ojw4WKBGmS5J?=
 =?iso-8859-1?Q?jdT20DMLDpLbNmKj0IrDiILnF+yNXK6si+fm1gZDsNoBUqt581RMmuXM8i?=
 =?iso-8859-1?Q?UAAsvdMYgkQWaMbRJtUtGAsOxPvFpUUn8peRTskdxp9IDbUR54bCuj5SAW?=
 =?iso-8859-1?Q?lgV/znbw8o2tP4SbOL6KQMhEl3CumKrn9l0rxkgMRmNm5uqJRyWDZTLAbO?=
 =?iso-8859-1?Q?1rUhGpgTLbPzeiEEdHCNfhRabp4AvcibV9gHlmigRWdbYDHx+naFTQGwBY?=
 =?iso-8859-1?Q?elDaM41cA8kQ4FwYb8967FwD3dYn2GyX9csnEV6Emz46CM?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5214.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437425b4-a468-41cf-7dbb-08da262f2575
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2022 20:15:15.9497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+PqDGAJGtqCt/15hWoSRwskmqLybVki6VbfkbV2f0INgrff9vq7yrtjJqLOGbxI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1349
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
Cc: "zhengkui_guo@outlook.com" <zhengkui_guo@outlook.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

> -----Original Message-----
> From: Guo Zhengkui <guozhengkui@vivo.com>
> Sent: 2022/April/24, Sunday 5:06 AM
> To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo)
> <Sunpeng.Li@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>;
> Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airli=
e
> <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Liu, Charlene
> <Charlene.Liu@amd.com>; Lei, Jun <Jun.Lei@amd.com>; Guo Zhengkui
> <guozhengkui@vivo.com>; Liu, Zhan <Zhan.Liu@amd.com>; Jos=E9 Exp=F3sito
> <jose.exposito89@gmail.com>; open list:AMD DISPLAY CORE <amd-
> gfx@lists.freedesktop.org>; open list:DRM DRIVERS <dri-
> devel@lists.freedesktop.org>; open list <linux-kernel@vger.kernel.org>
> Cc: zhengkui_guo@outlook.com
> Subject: [PATCH] drm/amd/display: fix if =3D=3D else warning
>
> Fix the following coccicheck warning:
>
> drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c:98:8-10:
> WARNING: possible condition with no effect (if =3D=3D else)
>
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>

Thanks a lot for fixing this warning.

Reviewed-by: Zhan Liu <zhan.liu@amd.com>

> ---
>  drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> index fe22530242d2..05b3fba9ccce 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> @@ -95,8 +95,6 @@ static void gpu_addr_to_uma(struct dce_hwseq *hwseq,
>       } else if (hwseq->fb_offset.quad_part <=3D addr->quad_part &&
>                       addr->quad_part <=3D hwseq->uma_top.quad_part) {
>               is_in_uma =3D true;
> -     } else if (addr->quad_part =3D=3D 0) {
> -             is_in_uma =3D false;
>       } else {
>               is_in_uma =3D false;
>       }
> --
> 2.20.1

