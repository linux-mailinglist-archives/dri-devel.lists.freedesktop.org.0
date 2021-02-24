Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E173236A2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 06:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383716EA5C;
	Wed, 24 Feb 2021 05:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B316EA58;
 Wed, 24 Feb 2021 05:16:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRUs6UbTYl/Lk0Hbu0eVIr0s/XN2YquArTfoYVEK9i1XIuBRSdUIWIJt61gs533dKpVQhdFztGBvOMbOf2afnYiBsYfBJLzsFiOs+zE0q8Do07Gi73NCRWdhqa8qrUbYWVRpIwkeClpLDIOs7TgE3gF4cvH9DiUFCVdcpH6pvmeSW+FTnnhIqb6IT290L3WPgYRCtZ4JVT6i1LayXDHCTEYE6aovKqZvleCSJEH96L6wQR39lcEyQrMNxIq+bU2Vv+6Nr9br+kz/hUs7CyNEvqxoYUMhO9ZZYDVrIxzRyuAhwWJfxmJWkjlDl4/Y/xhVOT6nJFXkV9RVrx7qdrRiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jBKFeLIs2FKfDsVTzNXxQSmP3psX1OTLLlYp1JWqsI=;
 b=Fe7XQ9DDFFSRt9vSyt0OhQG97jIAnhCnnYNXvf0Ybgc5rmKOhAcXznvUVGD5+5zSqYjQadQ51HYlNcB47lxWtP5J4d6yX1T1wW7YX9QjRk960xc8FOzwmnR+Otlv3CObngJUNAJFNbWgt9TLC/6MmAgHnM+uRPzG8UooIT7oyKpmPBIkRWju2rQRAFocUVcRtUttDfD1XmEZ7kIdkOBHsTVzwXAjV7ms05Z+5K1uwcxtQdWdEzH/lt2ATDFczeRub7XdNgBSpQ6b2V4sQ/90dgQC6v88ef3ZB2vVwYqKR29MRm6Zipot+TB/76mhgBbI1qt9+nDtCSYiyC1nfMcexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jBKFeLIs2FKfDsVTzNXxQSmP3psX1OTLLlYp1JWqsI=;
 b=n3nzfWXcQvry6bZ/UGrP0GgqZEmNDCcTeU7X1bJuEbhZYYmGz4iVOHBXi62K9E6fdZhTUD/CQsa7qHv/8J0AHxciAy57mstpD6NKGlzrtEzdLEIomN3GbXOwxuhW5fxm2w03AxEqTR/+ovePzsEHurARK02xmqE0ZFblTyQFtMY=
Received: from CY4PR12MB1287.namprd12.prod.outlook.com (2603:10b6:903:40::8)
 by CY4PR1201MB0184.namprd12.prod.outlook.com (2603:10b6:910:1d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Wed, 24 Feb
 2021 05:16:09 +0000
Received: from CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::992b:4e6b:afe3:ff25]) by CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::992b:4e6b:afe3:ff25%2]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 05:16:09 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH] drm/ttm: Do not add non-system domain BO into swap list
Thread-Topic: [PATCH] drm/ttm: Do not add non-system domain BO into swap list
Thread-Index: AQHXCl0ke4Qblc/3YkilSfSBCNmMgKpmpzwAgAAcMvA=
Date: Wed, 24 Feb 2021 05:16:09 +0000
Message-ID: <CY4PR12MB128764AC47267AA5471E68DBF19F9@CY4PR12MB1287.namprd12.prod.outlook.com>
References: <20210224032808.150465-1-xinhui.pan@amd.com>
 <CADnq5_NhUK+VHVDNCYsV_k77DAONd+ML0fZo+tJBAiMGQKuWcw@mail.gmail.com>
In-Reply-To: <CADnq5_NhUK+VHVDNCYsV_k77DAONd+ML0fZo+tJBAiMGQKuWcw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-02-24T05:16:07Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=0d66b209-f62f-45a7-b41f-f02429f71e77;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b0c531a7-acb1-4f44-5fab-08d8d8834bbe
x-ms-traffictypediagnostic: CY4PR1201MB0184:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0184AE0F1DC21AA66E11C2C3F19F9@CY4PR1201MB0184.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sLPnD+X5L/dzfHeoWJyaS3HVwOMqQX51369gv9WhxoBznUlHFVY++S5GaB8Em18/p8e7meJ42uF9n0A2rGQqJjDzp4OxOcgvGEa6V/AEqjkVkwhW7rcW+aKu42PwxIy8E0KAkgtjI+WuD5BFzBNdkxb1SbZVm0LqS9FiVbYAKP6cVnVh5eT9fh3Kju3rOe8c5knQkoJn5PGoSzeZBs23Sd4y7b6c9ZVtH2P6XOZZOio0XmmIZrbTAty77GkZOoWMyFVi1Mqg1ZMqF5ARvjvv7kdC69tpNQazhxYid8a8oKYGeVDyff11KOMsmJ/6r3nRZ5kazL7Ftcz9B0D8q2mUKT9fV5yLrji7CHM6e5zqp4P/w0/4UacqpNLlfP3aRKJrPzaGkFESySOiC0C3qYg33ZL9PzpgWQbTJxeEEXo4l3G6D4RLM8NyJFF9xJnCnzz3YSG0EO+14Yvk+xIyBlYsQGa0kLMZ1jdikGA88gUMYnEC9fx2ypH5qH5tIWujBymeM9Z9dBP1AnKhYzzxI9LpPpFGXRT1R8Qi+JUaSKicp9y8mrkiMrCuHO+1j9tLo7aqxjthiX46CRXODnnd+fz+wDj6zyQgOb1hgdG1Zn1lEzE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1287.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(66946007)(6506007)(76116006)(966005)(45080400002)(66556008)(83380400001)(64756008)(186003)(8676002)(6636002)(33656002)(7696005)(66476007)(86362001)(66446008)(5660300002)(9686003)(53546011)(2906002)(55016002)(4326008)(54906003)(316002)(478600001)(110136005)(52536014)(26005)(71200400001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?lBB+px4J/7gRG2D8Uo3+/lQqNlm8dLWTg+TuxVWGBGZ+BwB7EoRQpruE/gyi?=
 =?us-ascii?Q?JgpyiOEyddOrmcIC/vpJ1LwqJ0VjGyfoTGhgNOvMCwzj0jfF3HPVEtnyamfv?=
 =?us-ascii?Q?qyoEx18MRDekkPC3phTJzGa84vEsEDs037zTLz67MidAU7iAIGIYQ++Wv9hL?=
 =?us-ascii?Q?+bVRcKw4Vhcg/mIwcUQY8AehTJwzDfPBzvO7j7DeBnvtONQ3IfcRIVGr02P1?=
 =?us-ascii?Q?Pv+8VZE1sxMAJBw+Sh1dGfJ8ZS9DLo8YybtoGWxHXZffg+/GrQWlZ4oUp/U4?=
 =?us-ascii?Q?/L3P1pcrj8DXkY+75CiRHcM4c6okMdfZwg6ATKeCUqRxjKWvXWc/kn/0RdsU?=
 =?us-ascii?Q?A5uoEa93VZrhS+Kidop1+FFSNNNe3yhB/+6/PIjXyEVi4kNFHspEVHpTsN4l?=
 =?us-ascii?Q?eSI0ogWk2MSYWQ9uEFL2mWT9Q5HodVuxiBA5OE8LR0+motJWRjoO70OMXtW7?=
 =?us-ascii?Q?C8OuOc/B9OvkirW4Kq3kLhXdaAt9d6GOeHiBAnL8vHg/w6T3SNCf6SSgeAUy?=
 =?us-ascii?Q?Jw2xsN1HeK/pPMlvJbIlS1wJJREyC4YT+c5eZAYzOniN9wb90hbeHAa94Dwi?=
 =?us-ascii?Q?jO64ufemTECnvOi0zT5xpZ/6w9gXjbNSEU7tz35RObqQRvJ3JB9aoXHvHapl?=
 =?us-ascii?Q?PiiLSTM88stQUdHlAIwIwEAtrNj2leqwHkUdZ50VUJB6vGjciPkv0rmQ3oew?=
 =?us-ascii?Q?OuglUHnwUlZhf3N9teMUUkkyiSZj3M0xlt3Pjmf+ReUfbXPev3ba+ATzIhJJ?=
 =?us-ascii?Q?s+KW9v4Rbx4nso9pA2eswlw+QH7BqrHfrXF5KBtZgTbqPBbbv+BllZ0KgFtX?=
 =?us-ascii?Q?ulXpljrSux79tVsLd6c/LO95R7Yb5THSzvigGgboGANsVScxttlH7fUtX7A3?=
 =?us-ascii?Q?pGFi6fowYQFxYOoaEJftrxMjJjMTx7lbATxEBntdMWI9gkyBrXECn/xMEX4V?=
 =?us-ascii?Q?hvB29oBNzuUnHCIvmjoaxLBSKHrmWpltmdjfRReUwrZEhq0V/NiK1dwcf9Uy?=
 =?us-ascii?Q?z4IMgWQpX6SEE5lKBwUj0usW05rm9uUXbXKKcfLLpqLGXkCDP8pkxMDbf6SG?=
 =?us-ascii?Q?Mi+Ou1n7PA3sV0C5gaXRqUi4Iv8x0NuixVC6TyYOsRLdwzj1I6X4OpQ7V/Vx?=
 =?us-ascii?Q?yEapCJlHcgg0wnOTMCltiNpKyWKn5JfGsXC9HjxK06yORzxAzPXmwG3WZ9U5?=
 =?us-ascii?Q?6miWUUojyFe9dRyhg7sVKMFKm44ugXrxoiY46+Jr1b95RUWcM9oUv6DvpTCs?=
 =?us-ascii?Q?vXX5wbm1jSGczqQkmXoB0ZNkx8XWnkk8gClwFccyWGy5WKszYpcfotAZTyfO?=
 =?us-ascii?Q?gXZQDHR7tRqWhcrMXwovsrAt?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1287.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c531a7-acb1-4f44-5fab-08d8d8834bbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 05:16:09.4718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lurdEwo4A0YvNRgCnc2TSQWiv+hhabVzxHXG+p8LpvGaCBTZiP/uFa8mKrQ5mvTp6gYi/IXAo9Js8V5+7uuISw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0184
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

Acked-by: Guchun Chen <guchun.chen@amd.com>

Regards,
Guchun

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex Deucher
Sent: Wednesday, February 24, 2021 11:35 AM
To: Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; Koenig, Christian <Christian.Koenig@amd.com>; amd-gfx list <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: Do not add non-system domain BO into swap list

On Tue, Feb 23, 2021 at 10:28 PM xinhui pan <xinhui.pan@amd.com> wrote:
>
> BO would be added into swap list if it is validated into system domain.
> If BO is validated again into non-system domain, say, VRAM domain. It 
> actually should not be in the swap list.
>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
> b/drivers/gpu/drm/ttm/ttm_bo.c index a97d41f4ce3c..3a10bebb75d6 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -111,6 +111,8 @@ void ttm_bo_move_to_lru_tail(struct 
> ttm_buffer_object *bo,
>
>                 swap = &ttm_glob.swap_lru[bo->priority];
>                 list_move_tail(&bo->swap, swap);
> +       } else {
> +               list_del_init(&bo->swap);
>         }
>
>         if (bdev->funcs->del_from_lru_notify)
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flist
> s.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=04%7C01%7C
> guchun.chen%40amd.com%7C554dbc7fd1fe4438268508d8d87529da%7C3dd8961fe48
> 84e608e11a82d994e183d%7C0%7C0%7C637497345043233977%7CUnknown%7CTWFpbGZ
> sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> D%7C1000&amp;sdata=2sWpQGXSETm6t%2FKwHXeuLjmcwHHMFKlIplpcL9T3VF8%3D&am
> p;reserved=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cguchun.chen%40amd.com%7C554dbc7fd1fe4438268508d8d87529da%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637497345043233977%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=7sfyxSHzKhpYeh6GzlzhjkBDDsNlxMhz3Ydcs6AHnPw%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
