Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E46722B04
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 17:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC2610E2E0;
	Mon,  5 Jun 2023 15:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E0610E2DE;
 Mon,  5 Jun 2023 15:29:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZRGk9bg8kkOl0ywdE+SPbldKLxhUiw5JXlTN04+H8iwiOcFKdyr4Kh5FrC70EkPlLvw2dHxWMbOBplf2YU5ZBRri19PcTE1/PN/A2fKs+kp2W71lK0KjZ+x5Qo42wSh0FckGZ8nIAPUhoIRmHFv53SKZE5xktAiPm7aBkQAYtihhP8e7FBGgkA1Lu+L/7xDscUfbr1++v0q1sw6kB/XcnnjXjzywB8GmpHQTK3gfjhbmMWcLosWpsRvTH4+3L+oIpPbgx6UDlB8jAH4M+JvfDx0oPU9HhwnGTfgtjVXzv5+82ICsJKlnE6K1bXrPClmC0FUbL+w+sypTj8BqOO9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsLhMZ2mjYQFLctcUqqGtwIYERc+AniRGirTI53J+h8=;
 b=L5yww7TyAaJDENEUTHmJe8ZMYp6+TWv+mjqjr/kHqBegUnxkg8YJlzdvSxOUmBhgfPet9mVF2zGwFI/C/hMsEDP73VMgQbq62CssA2Kqv2RqmSYZey7ax1gZklssW2iAAbOviLXY2gC2HVQmPLMdq2od7MxvnIVCepOegiI1SVj33Tt41zGGnC8MZt0WTiLNm+8zs13gw+3IU/yJSxHU8w1Jgxq7qqBk+g85bf8gYnRlsQPYfTMXwb++m+ojGQIg9zd8j+DRIIOqeFYl4xFPvSoyyRGS0hu2wiUsMJEuudrv48d+E6XvZYIp5UXzdXMnd514T9Or6TObj60Rk3aMow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsLhMZ2mjYQFLctcUqqGtwIYERc+AniRGirTI53J+h8=;
 b=sHZGg75OeGYMMWUgqeywwoy3rXVaJek0vGRCIoIrhAD5DYrXdOveA0V2Ah+2xVuzakfgJeCciy3VggeztOMBMnj9oEAo1wv9aFU9fqLPkz64/mZ3Pfwjie8M91WGZuhO+z3bpFZ+XeqN1T/4HxGqBFJVDnkX6wtcbRxwWPhKpms=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CH0PR12MB5138.namprd12.prod.outlook.com (2603:10b6:610:bd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 15:28:57 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::c549:4aeb:a02f:56b2]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::c549:4aeb:a02f:56b2%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 15:28:57 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH] drm/amdgpu: Log if device is unsupported
Thread-Topic: [PATCH] drm/amdgpu: Log if device is unsupported
Thread-Index: AQHZl8GmBf1fuDCUxkan6FATlzGhAa98VOew
Date: Mon, 5 Jun 2023 15:28:57 +0000
Message-ID: <BL1PR12MB51449DDCC16D5E3035B5571CF74DA@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20230605152300.171794-1-pmenzel@molgen.mpg.de>
In-Reply-To: <20230605152300.171794-1-pmenzel@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=929ec35b-e2c4-4b6d-8fef-54cc674948f3;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-06-05T15:27:16Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|CH0PR12MB5138:EE_
x-ms-office365-filtering-correlation-id: 178d5a55-8064-4a72-be3c-08db65d9941e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J3wifOQ1vbZz7h3qBHz2cTEUUEZHVEsbvDv4xeymdsspKA262+rVcM2l/9hPhfjEL0kxZXBPRY7kwQEd9LSqBymhdVn6YlZSzEtFziYcaYeumNWQ+F3mpD++F5BPDQvU1SltPaRxfhQtgb84kLCKDvWCb6/xgh+Q47OKOIAv8/1KI81CqPaY3GD3K0VArK0+SoACIXOBzdmFb3lGNj1eZl1zWP8t9jR5CqmYFa2yy8+MsR2ayjtZKRDt8qnOlBbvtCGvLYS6UaBnMQD3TA42rQ0VHm4/xReLZtV2bThJKsbxiop8pdl+a+c9ayQR3cYqtoy8eN4+k1SOn58JIuJZxXgxjZaYCGfaaz30fTDTEevN2mooQs/r/aAQt7IWqAVXsb3PJLDIswpCI1xRoAS2rdtdIWya3Pr6gV8aTStLeCTrAO8NpxZl2prAHcinMrsc72XovJHGE3FsHAzVkIGIhLA16mPaD2fKNFyRvfV+oFsinkRkPaJMDdHO9G2PoK5zegtZRkG3Aadhe3oCRZSYvTutXRdBkQPCW4g7mN3xqBz9napIX+GjB8lTnrJNL9Pv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199021)(110136005)(54906003)(2906002)(38070700005)(71200400001)(33656002)(478600001)(86362001)(52536014)(38100700002)(41300700001)(8936002)(8676002)(5660300002)(55016003)(316002)(4326008)(66556008)(76116006)(64756008)(66476007)(122000001)(83380400001)(66946007)(66446008)(6506007)(9686003)(53546011)(26005)(186003)(966005)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zf1UspMa/L5fHrRQN/LQMG/SSCaI/W0D/9L8ZyMmMD/qSw0z8VD9G+9E23TM?=
 =?us-ascii?Q?VWX1yaJQHa9uJD4NrSD7U38/dB0O3oqhu3d73Lb0/Z4qdXK7W8b/B+J+McP+?=
 =?us-ascii?Q?u8daC5ryDS1ifvuD4X396G7cwfZR1N7sB7rYj+JOtBPDbUGuwUpzrVsxS2sw?=
 =?us-ascii?Q?TZRibnctKof3UtMBPYkivncmcl3ozdVpzQROVyyp4OjNODepzFdQ6OvwYCrw?=
 =?us-ascii?Q?zX0pcnqi9k7/6SZBz2FijPbVh9ZdHBPtUTR6TZ8E5uBeaPUqUKMOL+GwwFkv?=
 =?us-ascii?Q?8vzjvLqjHXqIVBS5bjhoL4NMPBIINjPLzCWx4WHCYo3gl4ehEIsRis7CJTJn?=
 =?us-ascii?Q?MyLlycFH8ciEUBCTgfGOD2ysd4juncF0R0TP3Mc6a1MPCELIh1ozT7k0b2oa?=
 =?us-ascii?Q?rJVpYlUH1J3/B83Ph8zbqbAqQ3gl4CaUnGxIzEIjpl3M27mU07OA6l6YAmSW?=
 =?us-ascii?Q?vUEytsP2JAvNucq3/3WRMBlbfyN6978wrECnPsyq3q9lkuZxTrnhJ0w6Lxh8?=
 =?us-ascii?Q?rdiLGJj9voJme4oSiD0tJ8GNe1vzXU/O5AUDJpz86fGGMCek+h5A68G54GpT?=
 =?us-ascii?Q?2l0bkrIV/W8+k/iPruML65KiZGkm/ObmqqYA/OwBP7qa020++ItJ3yAfF01w?=
 =?us-ascii?Q?/cPZQy/XYOwxNUGA6Hm93lGf6arQ7oocVOKhE3OXGXAnAgoILITe913+vBw1?=
 =?us-ascii?Q?z2w0w9Lt+Q+GxFsZZRjgVL+V2I1HX1ingGJeFBimSSyvEvyfuVdYbA14oR4B?=
 =?us-ascii?Q?DXIHaM3/3Vrov91/k6+jCFuitm3YSA6/gg5+7dljGs2jvi+SJYVbDwSknzxt?=
 =?us-ascii?Q?UngZ5t/2A+5dXppg9z+CRiZURmb065KNAf42Okw0v7qxbQtlPbSURpBSfGbC?=
 =?us-ascii?Q?5WYnjvUtaABFs1Gonr2mu70xhfu7AzSFW+tX6QJTmWuqmkevuF9cn9UlqOPp?=
 =?us-ascii?Q?O08jxSLr1fNdc1P+4giK/2vRQDY/MkjvnLhKlpebiUd22OceRgKx5DGt7OMR?=
 =?us-ascii?Q?NVdUPlp1qUBwTixgERLr3TbkSgIsV9Zv3iLQR/Jt1knGRhBSvqNRSpAztqKT?=
 =?us-ascii?Q?9rKfov2Ie43yX8qUVDhpVTW3UVTXoNSTyw3j34wOZErPK5EZEVWcji6t8JvH?=
 =?us-ascii?Q?WXkfC8XJRlmTfVb+jpoywpO0vjnIit6tNznafI+sakM67VezeqfB1+/U8lSk?=
 =?us-ascii?Q?4E0y90VIucRcQmnoCVaY3kVSXMmeSk9oLK6ykI5v+tprN+vBYFlUmFcbQBB4?=
 =?us-ascii?Q?PcOwVMH1T/lfX9vv6Zl7xKpoYJeyb64Z/nr4z8RqLkyd8qQYy5Ce2yIqYmAb?=
 =?us-ascii?Q?hMKEz/lPUCxo3q1yMc2MGcZUylrnQfNWmQcigaxabrqrO4OCyU1YtgL/PlGv?=
 =?us-ascii?Q?6DrxSejKERuamZlnNpL+Jg16CpC8hSKH1Z4nP0JY+mHxWVjIr3OmOYO/NgR5?=
 =?us-ascii?Q?o0omB5XTZc7Ds78qEEyCS9jkyE51OpzHrGKfzok19aMfOllh1S+i1RhhJWMR?=
 =?us-ascii?Q?T2axzFaaMWKB8k511NdeNUpSw33X4XPB1O92IqrmL/9fe+y1zlBMKXktPk7b?=
 =?us-ascii?Q?Z4VdSVfSg1lQGjXogaI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 178d5a55-8064-4a72-be3c-08db65d9941e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 15:28:57.0342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o2oB7g3kuHAvo0FPuOhjhE+NhzVJgJaemDJ2f3lBMlx86HozWzdMTWMzP48bys5Q5DXtUZt1O9OdYcMVy11SHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5138
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

[AMD Official Use Only - General]

> -----Original Message-----
> From: Paul Menzel <pmenzel@molgen.mpg.de>
> Sent: Monday, June 5, 2023 11:23 AM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>
> Cc: Paul Menzel <pmenzel@molgen.mpg.de>; amd-gfx@lists.freedesktop.org;
> dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] drm/amdgpu: Log if device is unsupported
>
> Since there is overlap in supported devices, both modules load, but only =
one
> will bind to a particular device depending on the model and user's
> configuration.
>
> amdgpu binds to all display class devices with VID 0x1002 and then
> determines whether or not to bind to a device based on whether the
> individual device is supported by the driver or not. Log that case, so us=
ers
> looking at the logs know what is going on.
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2608
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 86fbb4138285..410ff918c350 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2062,8 +2062,10 @@ static int amdgpu_pci_probe(struct pci_dev
> *pdev,
>
>       /* skip devices which are owned by radeon */
>       for (i =3D 0; i < ARRAY_SIZE(amdgpu_unsupported_pciidlist); i++) {
> -             if (amdgpu_unsupported_pciidlist[i] =3D=3D pdev->device)
> +             if (amdgpu_unsupported_pciidlist[i] =3D=3D pdev->device) {
> +                     DRM_INFO("This hardware is only supported by
> radeon.");
>                       return -ENODEV;

I think this will confuse users even more.  As there will be a new "error" =
message reported.  I'd suggest either dropping the message in init per my p=
roposed patch or just leaving things as is.

Alex

> +             }
>       }
>
>       if (amdgpu_aspm =3D=3D -1 && !pcie_aspm_enabled(pdev))
> --
> 2.40.1

