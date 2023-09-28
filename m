Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 936587B1F73
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 16:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C306210E66E;
	Thu, 28 Sep 2023 14:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC2A10E66E;
 Thu, 28 Sep 2023 14:30:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8Krt9bHv6rysnyy0z9b1Ssz+ppdUnZW1lWS7HVILrulC4J99g+ffL5ZlT6UkiAy4GcnGPYjc0IX798bljPwIEe8Ap8pkdV1TMeMZi/MDUm62Rsm0VIP8bmFOpgV+71potHEviMgm1yXylYB1urJ3iyA4NsFil9dH0mWm3zYMfZOK3ZtKo80pwPLZngb+w+8u+yo6VW0ANu8Rn8ABYqPp/L48vuDoyzPPmoOwkpxu+xPn0RD3qyaZff6Yvf0jbdjZbk/SjwslPd1WrP/bvRcVUMxUrTyFBZl0o01qF3ieT/MqjGktZfAgnZqe96aTsSNXDX74TlRjyWpUnF/O6fvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85wjYwr3Ns/UtT7dhip8QiITG+sFDnmNg9IuixAWdog=;
 b=RQ9T5LhQUMp40hMEpa4T011OtvvGMXC22YfOtGP0YBQP6fP/TEba/FitmndumLAT6BB/69YW0p9FHqAnsKFlwLkj9X9go4jyLn+mwW9o9Vph3DCmsVPmdMx0so2FYMCw+A1FEOd9cM0kJnjTfwSWo9YJaHCglDWpPlPluy6BhD1++I+M4vtcSP/h5/5njCt0BgB8QQLXQzFfpEbKR1WztUDaJnl5TZRbQ9uO/GkncZmmF2EERrufSegnmb3GFnP7oVc7CUdEgl6TbZ09unZuvvHT6JU45Cgk3k3egRxCDVhLnRzEGRG+n6tFDwXzG6Pu0EE5NGcSdpKmIzlkhiKEuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85wjYwr3Ns/UtT7dhip8QiITG+sFDnmNg9IuixAWdog=;
 b=IXeq7qaMPxFaULmXVEol9OpLSmJtzfgGA3jGNMTW728puYRb/zUL2o/mYNJjhT+HxLkrGvsmygU1FEKeQZnzs6xk3LPl/Fw53pJHejMLZZ4ld0JhNT1y8a5MOozUBDkajLenFoppbXeMHgFf02ec8DClbe6AXOsXbItYYGW7FcA=
Received: from DM4PR12MB6445.namprd12.prod.outlook.com (2603:10b6:8:bd::20) by
 MN0PR12MB5788.namprd12.prod.outlook.com (2603:10b6:208:377::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.28; Thu, 28 Sep 2023 14:30:47 +0000
Received: from DM4PR12MB6445.namprd12.prod.outlook.com
 ([fe80::ee5c:5153:5f01:6a00]) by DM4PR12MB6445.namprd12.prod.outlook.com
 ([fe80::ee5c:5153:5f01:6a00%5]) with mapi id 15.20.6813.024; Thu, 28 Sep 2023
 14:30:47 +0000
From: "Joshi, Mukul" <Mukul.Joshi@amd.com>
To: "Yadav, Arvind" <Arvind.Yadav@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "Sharma, Shashank" <Shashank.Sharma@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH v2 1/1] drm/amdkfd: Fix unaligned doorbell absolute offset
 for gfx8
Thread-Topic: [PATCH v2 1/1] drm/amdkfd: Fix unaligned doorbell absolute
 offset for gfx8
Thread-Index: AQHZ8fHg0eQZm//2TkudphXmbY2wz7AwSZIQ
Date: Thu, 28 Sep 2023 14:30:47 +0000
Message-ID: <DM4PR12MB6445548E05C8E3B29AAEAFCAEEC1A@DM4PR12MB6445.namprd12.prod.outlook.com>
References: <20230928095427.4337-1-Arvind.Yadav@amd.com>
 <20230928095427.4337-2-Arvind.Yadav@amd.com>
In-Reply-To: <20230928095427.4337-2-Arvind.Yadav@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=1dc08773-f74e-4a9a-b97c-14478189a0ec;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-09-28T14:19:02Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6445:EE_|MN0PR12MB5788:EE_
x-ms-office365-filtering-correlation-id: 80a7d418-e197-48ef-81f2-08dbc02f8173
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3OQSQU0Wg9a7Ni9s5RKDZ/Z4+0pTkQTbPOcvyvH3M1vuWlgibYOqNEP/Wph+oH26L57JeugmK+n3zqpNok9iINbGJe6Vh8S7EaHeUUV0VF4O1O/XqOk7Epd2NRtu1mEGQf8BHVORWWPNDizATVIU/Rxy6Pn25ZP9OhzVpBPUF0JwwN9OnNwvqOr2Kn3UzKExIEFjIlIcBHAE8eetI81IZLUGG5ZEqYYaZip028UsmpLP4Nb/KQ41z92D/G+ORNs8WhVyjQic/HF4441kOevquxJ85kT5KrfGwLLZutOaD/Ul0MtNn0fjTyH7oBj2x241H0ici/QfF/H8Q6hlm/ePaPL6LBP3lgpgWyGL+7V9AoMFK8NshG8QoOP3BosEdyHNuTy1i30EXmui1rNiuTAOQkLvK4KmqU7VonwdUzUX3D7hXWjcGJt05+NDUtXGcoXxTBgdYSmvEWArMZJ91NHZN56dI2g4Tuo9ZGwGFZ9YJZVRLzIPp/JA4mghjiWd3UUyRIb65gdNKsHgvhm4mijQfgI+xbyeajAxv4haM/04631Z44pDLjNH4GT2fqcMK+EnJs9C2O94F3tqMMocmxqrRUQcfBMdaP1c2klh65QMa5XrebmarayUZAmh4Yu8D7wSa0dRQWdCWhXxDIzU8Sr28Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6445.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2906002)(9686003)(33656002)(6506007)(86362001)(53546011)(7696005)(478600001)(55016003)(71200400001)(8676002)(4326008)(8936002)(41300700001)(38070700005)(38100700002)(83380400001)(122000001)(26005)(5660300002)(921005)(52536014)(76116006)(110136005)(66556008)(66446008)(66946007)(66476007)(316002)(54906003)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d/HmNdaYYVeW6PilqtfQ9PbwBAlvfWWnDP4POHkA4hegwNYMww6/KSqGUTjD?=
 =?us-ascii?Q?DiLa96P2jKmjXdV2Q9mUWduVpOxNLXoTL6S+ksU/IBMWcuFgmmewNcpw+FQr?=
 =?us-ascii?Q?37rlwFJ9fFADhb+9MBgy0+cqd5RqSWaIwQXW30DQhyVnf40Y7NuLDLpd6hjJ?=
 =?us-ascii?Q?GMU7Q4ZdEyLTGJT/b0dWjeLbXVqcXByRc5p+EUNRsAOm8ubfxteS3aVFvIOL?=
 =?us-ascii?Q?G0SqZfAW6xULdjnZy4gwxUEBrpKEIDLCfgkkKbnpM9iIUUlFuD8iGbcGTC+c?=
 =?us-ascii?Q?5VDGxA5M0YB+h0LMO3BCJVEqNbch3qcGeWBn9UbQbatwFGftw9gJ9Za0vB6V?=
 =?us-ascii?Q?JQSytMxBPg+oaZ+ssMs6Bfz/AQu4kF2uvdQkCTo78UnnqewYVjbpQQa1AHiq?=
 =?us-ascii?Q?dWbNjo//5QeQL5NgWxeiYo0XW9eofBobSEDfwUKe4vUm+FfqTtx/7fK4nseP?=
 =?us-ascii?Q?3xWpR6d98luAMV2z93DqqGegGADlmmFJV1lJwJTSevU81aaLfVcqR7EDBGmo?=
 =?us-ascii?Q?gxMS/0z5Y1Tr77DV7VjxBLBAK0OiHOHM0wGYxrLk+4N27Q0Lx6wYchxiV0B9?=
 =?us-ascii?Q?xDmuWShOulaeXhphjQl4xYiJANDxIw8j9s+sVLu3k6dr3A7KQsrarPaInUFC?=
 =?us-ascii?Q?hA0+t/xAQfZPqoBFaeWsm7r0MEyrHep3v3FKelCBDMEfc/7fygF78VjcYYo7?=
 =?us-ascii?Q?qJ+NoC3FstX3PM8LWzygMAiogRBkBNPvkbcyob6U5Er+U5/VOxab+G245b0f?=
 =?us-ascii?Q?n0OxgUPx2tVtCvqxLyW39/1K75hTVY/wBCtewTa0AggI70LkrntKspYKLzPD?=
 =?us-ascii?Q?QQNousugb2vRjI0qHvuTFsk6jg0+7xBPyXo/HQ1GqpBEvvWie2JGyS+zD5wD?=
 =?us-ascii?Q?cXQPiOzqAvLGDVeX7U7/5yimlcuu3POYZSy3w/u1bZSn17YGiUPNrPwyrcJq?=
 =?us-ascii?Q?VML59JEKL6HrYdQHBZLVZD2ttLbtvq/DaVp9daerrVNh8xfsjqk5GK81DvbD?=
 =?us-ascii?Q?lQzXSNG/tbq0DdspEaSxhUVwi0JLcVcqomHwZsKoJXpRwJ/L6///Y/zX2r17?=
 =?us-ascii?Q?nB7BwrcH4i9cgdUkRHDm7tgciFGWJ7bnrBrUwFu2G3UEqOBuP4akpIBzSulD?=
 =?us-ascii?Q?sWqS+taz2affBZ60cfxQYiC4/NzNPYwDIabXUPr7qIvtqG1TdhXhzXlHoNGj?=
 =?us-ascii?Q?zCf+IF6Td20finpViF5y2UEse0qR9E8hidh+mP/t/vM48mz4pls/oCZ1ETR8?=
 =?us-ascii?Q?L9tprSJwymooiz5gS1GIxVkp9Xo1RUYae2+8qfEhnTDRe55YMi5cRHSsPDvR?=
 =?us-ascii?Q?ScjwucIgzpD1FwB1SrrHi+Ye5PH7yzxdHKy/krwDRZ8Htybf/TnzEi/j5PI2?=
 =?us-ascii?Q?20yXfTkPFoGkg+mRppBibLVGeRkO+E6tctFt18dR2VtJUSALRdIneFdPC0da?=
 =?us-ascii?Q?mcj/qED2PUM0f9yA8NM8Ku35pdco2+HHOXPJmzuDnvLYlaM42AG/DA9jCZBX?=
 =?us-ascii?Q?0L0BpgKbxZbrJOZi8OQBe5DCACXceLyZG1sVaIXn1TujJr7QoGSpG1muysha?=
 =?us-ascii?Q?Uv3EZAjGRyTbzg3rRAk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6445.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a7d418-e197-48ef-81f2-08dbc02f8173
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2023 14:30:47.0702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vDXhjIngrSZlWm40Xq35Qoo9wjDkKz6MrSjyWjE9T7wELin6Lh/Gkl8lnI3xd4+wFIqbobkuFiZcwbib6XcpuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5788
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

> -----Original Message-----
> From: Yadav, Arvind <Arvind.Yadav@amd.com>
> Sent: Thursday, September 28, 2023 5:54 AM
> To: Koenig, Christian <Christian.Koenig@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Sharma, Shashank
> <Shashank.Sharma@amd.com>; Kuehling, Felix <Felix.Kuehling@amd.com>;
> Joshi, Mukul <Mukul.Joshi@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@gmail.com; daniel@ffwll.ch
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux=
-
> kernel@vger.kernel.org; Yadav, Arvind <Arvind.Yadav@amd.com>; Koenig,
> Christian <Christian.Koenig@amd.com>
> Subject: [PATCH v2 1/1] drm/amdkfd: Fix unaligned doorbell absolute offse=
t
> for gfx8
>
> This patch is to adjust the absolute doorbell offset against the doorbell=
 id
> considering the doorbell size of 32/64 bit.
>
> v2:
> - Addressed the review comment from Felix.
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 0d3d538b64eb..c54c4392d26e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -407,7 +407,14 @@ static int allocate_doorbell(struct
> qcm_process_device *qpd,
>
>       q->properties.doorbell_off =3D amdgpu_doorbell_index_on_bar(dev-
> >adev,
>                                                                 qpd-
> >proc_doorbells,
> -                                                               q-
> >doorbell_id);
> +                                                               0);
> +

It looks like amdgpu_doorbell_index_on_bar() works only for 64-bit doorbell=
s.
Shouldn't it work for both 32-bit and 64-bit doorbells considering this is =
common
doorbell manager code?

Thanks,
Mukul

> +     /* Adjust the absolute doorbell offset against the doorbell id
> considering
> +      * the doorbell size of 32/64 bit.
> +      */
> +     q->properties.doorbell_off +=3D q->doorbell_id *
> +                                   dev->kfd->device_info.doorbell_size /=
 4;
> +
>       return 0;
>  }
>
> --
> 2.34.1

