Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D115832462
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 06:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9424210E1B6;
	Fri, 19 Jan 2024 05:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE1B10E0A1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 05:51:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wb8uiCCSuK9tfSlTw42tvX0on1qCFcQfoxrY9+XY5GK2oWI6ZOSV2DNlgm7j07sSFbLO8FRSXJHTOtqKSeV/5/Zz8LWwOHZpl8Cs4krd6YHotrMn7RYLOkAvO2KsJGwM48zdaC7eNuk4clKGBnIZjokVoV4YbtEUQiRhAUQ7jCI8iab8ZOvR9kJ4OdkLVbc3/fPISjJl3YQ7e+i8O3rxncZc897dlMsmRTCRNynwtEJGwcusaFDNyVUVyEyub3fK+j3SoWFurvctswZDkHn0gYbeMM9eW6NocyH71NJShCBkxlzR2EI47mGlfbP0LerfQA6ovioCd0WQgo0RFitlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fc1G93fYiLDIOzC5b4ngiV/zksrIUj19kdmeW+5op/w=;
 b=XM0VY4ISXlSovM70kK/PJbXDQKernmVR4WCjcjgn4SpMrpiTPBTLpsf1AOGV0zBR1RkQ3uPOdI8Zqd3C38OWaIrk/dJkxscDmDjQ8UMLY7HpvL+JbDhy6WfYI6+UXbpFmTDZ0fCvuDnxnEylT6PhLoOmo28Yjgpab1FRvf1Mmjzv674iqzKIEhNwSIqMJXNYsaXH/eQSZIylmpEEj5r8RovsyId8bpKP7iW/5K1ro3Ll4O4UixKLsB7eJT0nE3XQoiDXlo0FKgJGeKsU79mx1efEEduwQB7OPiyAqrzPEac84wyw7Wf4whQiuij2XmqVS0WN0nDY0ml5EgICjOUBzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fc1G93fYiLDIOzC5b4ngiV/zksrIUj19kdmeW+5op/w=;
 b=DxFYO4yOXCU4Nukk2MBdGBjngqvEH/mAC81es5p6595E0ANitwU1TzUKtwblwoksyfBZRUlIMZ6BnQLSnFGMFlzX1NmBODQYLAgAskafErD1Yh1fmrRPDu+te5btZoAU8uk+mD7kvNQIpoSYWWH529iGLKSwq/NeO/lWsqBR7PA=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by PH8PR12MB7255.namprd12.prod.outlook.com (2603:10b6:510:224::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 05:51:25 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::374b:e99d:5ba7:1ec0]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::374b:e99d:5ba7:1ec0%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 05:51:25 +0000
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
Subject: Re: [PATCH 1/4] drm: xlnx: zynqmp_dpsub: Make drm bridge
Thread-Topic: [PATCH 1/4] drm: xlnx: zynqmp_dpsub: Make drm bridge
Thread-Index: AQHaSpuJcD4UUx/110SWZX+U0WFS0g==
Date: Fri, 19 Jan 2024 05:51:25 +0000
Message-ID: <MW4PR12MB71654039C6E8B9ED30AC51BDE6702@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <mailman.1660.1705501214.2415.dri-devel@lists.freedesktop.org>
In-Reply-To: <mailman.1660.1705501214.2415.dri-devel@lists.freedesktop.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|PH8PR12MB7255:EE_
x-ms-office365-filtering-correlation-id: 0de0398f-f41d-4bae-9c2c-08dc18b2ac5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZB7FkdUzf8JJqItNWqED+hTN92LmKvrQOrVnSvBzwPMfpM23PGXG7+jp37Eho2t/KTOIzYBgEmaefMBXSTOqhupi0tleU9jBv4PMkD6YzbIOrm2B/k3+Lh4OZ3PBHXzgXhqh1V8gpaK3ldJ/aYdshq+409JT4u8zFDDVLjRL2sf0/0vR7qPQqYZalukvyQFOY0gLx9YjERIvbeFOGSWTIjZl7rrk5byfE9UYLiB2qn7OrbNMEzDrsBf7bxwEBAQiR0guRezgdld8MookZGuB56xlW8PJgioJ77wKIgCMt8+0VnBiEjDZAodWAdZeWvXOJa4jfyitDYE2lyVBIDSTZxC5pmAH3cbzdeHXYHIa+IB4exfXOn4okgFyiDVXaveuuAgv6wbwoMg9HKr3KUtstajnlwfo2lXG++6PvfCCNBRN3I5uLDE4beyO8QLeAhvawcBbOPZTx0gxNa0km+xZ8B/E4aX3rL2K3igWW6Us/7/mV/n6za+NoaEyTW3kaSMlPP6OQfSbNkF4eJwvz4vnrvaOAICZZsL+0HvWr1YxVUJIw2/qOot1uc2LEtKP2qkq/Va+53hcIuokEB0xru0WWxUWqBcMmOx6a5dU0Qxn4mE+2gMT2DItaHgqBdMh9GyG1+vLAa3MNHLN74IFX8is4Bv8XC/xWiUSJJfPL1THVG6PRcUaPYQPEtz77ByAnH7b
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(110136005)(9686003)(66446008)(122000001)(38100700002)(83380400001)(86362001)(33656002)(41300700001)(7696005)(6506007)(8936002)(8676002)(5660300002)(52536014)(316002)(66946007)(71200400001)(64756008)(66476007)(2906002)(7416002)(76116006)(66556008)(26005)(53546011)(478600001)(921011)(38070700009)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CPu2H2SJa1Y3e39IBFY691Yvv/e7bZ/L41bpPRlNRG+7dC60JmpXbyDAemNR?=
 =?us-ascii?Q?hkjRRl1Bv82hGC/O5/6FuLp4rkDg+fg1NAgNLuVUIpbq+xZhsLWWRtKymTYH?=
 =?us-ascii?Q?DMEjZ1lNpgj0xHfuT1ULREbLWfTMq74Sai8BDxoM3rAQ1XVCLwoK20hCPWQa?=
 =?us-ascii?Q?Kl4yFTuq7Z6uJwg4pQklX2Ncxcog+j+xZvntVDwTN4UEEfMb5gKG31SfKBLw?=
 =?us-ascii?Q?Ja3k+mTF4qXUx5h8RqEkENSwkfmS9Ix7exUA/JiiuaYQFEydF2ytxdm9yxDg?=
 =?us-ascii?Q?/WWUcgqcTZpQvTrjJ71HviQoClp23IENq+hqtE7t6M2F7FjUFEM72+T/3O7o?=
 =?us-ascii?Q?zYPvnpojVh6p26RmcOYrYGjgj3HXV/8ytnSI2kxD5xDFU+caEiKNmbNzHwaV?=
 =?us-ascii?Q?j+8xwEdbYo+KSI6qfAKGASlVngAcOsroy6yEz+IN/fMi+FOJP/Vx2x9TeRN/?=
 =?us-ascii?Q?DfkhTKuFulJWcNwGwPx+DvDUdGstwRJKz0FVhjUHwd1gWpWjis57hdHqZXTT?=
 =?us-ascii?Q?NQlkWCIcZKpjamxut4x6uuXMYFtNINwJUAzbHOUW9P5ZwRJSvxe4ss+C++Id?=
 =?us-ascii?Q?M6HksRdkogc5IgPyyqzjVAtPlJ5U97Xl9/IwapOd2Ph+d0Vh9AdAUwfXY7MI?=
 =?us-ascii?Q?C1++t6hzDZiEpZFI/QAlMNksbbCzK++UzXO6B/ZgSuC/Q9b7Mz51aqOlY8Er?=
 =?us-ascii?Q?sw7qfHybf1ZU4hJ/7taaJq0rZQgA+bE+UaEWVHA0IzoOH5fO8Xhz5/5Ol2+w?=
 =?us-ascii?Q?NzW3tN7wrNGmf4WP7pVQ6ioCoTXRCUA6QwA12l7BnIFe9aVLCGRO7L/Q5yQm?=
 =?us-ascii?Q?FOdQtBqxyxxQbZA36hbOn6iSyOBk2hBOb8WsytOb02FBolDCms8T5e0g7UPu?=
 =?us-ascii?Q?ZGvsQTSsn/TKhSNrIJbPIn1xnZOKsVf6Y12Nn5sd0j5+3gVxN2NM/lrq283x?=
 =?us-ascii?Q?WYRRocr1r8mlUjmrzDEnLHZn3q7zf93GaBfCi53t1t8ymQu8LQ/Pee655Wz8?=
 =?us-ascii?Q?poDAGeVN8498nrJSdEVCC+9+ul0wg5f0KkAlFbQrDKRlfS7WkwLlfJD5ScCr?=
 =?us-ascii?Q?Ja13/FbUyY6Wm+5x+wIugpcR7XoF+MMa++Kr8rBsGhcsg2PUoFVX2oXfYS3w?=
 =?us-ascii?Q?g5qx6PEhv8BKZTK5ztlIwCgDW8GPEztzqDqEFASHIHXDMxrHwtxs8hzW1krs?=
 =?us-ascii?Q?augO9xhMIukJ/b49zA30FcVYNF0nNomqmIb38XpaLpMh2qmIdlClI5xTimAu?=
 =?us-ascii?Q?BRl5jVc5YvIQsBC3/zvO5Ypz6yWnUAagxovt1z8WFXWvRgeUG2v8jcMeVSfE?=
 =?us-ascii?Q?+bw8xuxQ9yT5aj84i5nahhx+O+P7m6TmTybNE4e9/n4adDYQ/gr4H8GTMmga?=
 =?us-ascii?Q?4040LQSANvuuBZHD7cNfBEfsldW4KbrozYH9rGm1ktGh2jTlRs0SJiL7A0v2?=
 =?us-ascii?Q?L+s/yA3f71OH4FTTe4Q/TezkJo5vIWkm1drXF42Hhhd5ymILtJn9JAq/J5Br?=
 =?us-ascii?Q?N3lVkZ91waIvRBPdJo7W1DYx6x391sUSMlYBPRxXSJiu+0FfV1L3d6Ah2Zi9?=
 =?us-ascii?Q?CQRahI6dX+aMQKWGimE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de0398f-f41d-4bae-9c2c-08dc18b2ac5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 05:51:25.4507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gr1zrmIyU42WByaiCBMqmFQznIhIheeUv+TgnqR9Cn4pkS9W0xeNSiDEUdOEOsdzpMHm4rnckUX4TdmpWjmPZg==
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

Hi Tomi,

Thanks for your response.=20

> Date: Wed, 17 Jan 2024 16:06:31 +0200
> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
>         laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.=
com,
>         mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
>         daniel@ffwll.ch, michal.simek@amd.com,
>         dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead=
.org,
>         linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 1/4] drm: xlnx: zynqmp_dpsub: Make drm bridge
>         discoverable
> Message-ID: <98a9f4f1-dd55-47c3-bb1b-07e201b299cd@ideasonboard.com>
> Content-Type: text/plain; charset=3DUTF-8; format=3Dflowed
>=20
> On 13/01/2024 01:42, Anatoliy Klymenko wrote:
> > Assign device of node to bridge prior registering it. This will make
> > said bridge discoverable by separate crtc driver.
>=20
> I think a few words on why this is needed (and why it wasn't needed
> before) would be nice.

Sure. I will update.=20
"  ZynqMP DPSUB supports 2 input modes: DMA based and live video.

    In the first mode, the driver implements CRTC and DP encoder DRM bridge=
 to
    model the complete display pipeline. In this case, DRM bridge is being =
directly
    instantiated within the driver, not using any bridge discovery mechanis=
ms.

    In the live video input mode video signal is generated by FPGA fabric a=
nd passed
    into DPSUB over the connected bus. In this mode driver exposes the DP e=
ncoder as
    a DRM bridge, expecting external CRTC to discover it via
    drm_of_find_panel_or_bridge() or a similar call. This discovery relies =
on
    drm_bridge.of_node being properly set.

    Assign device OF node to the bridge prior to registering it. This will
    make said bridge discoverable by an external CRTC driver.".
How does this sound?

>=20
> Other than that:
>=20
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>=20
>   Tomi
>=20
> > Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> > ---
> >   drivers/gpu/drm/xlnx/zynqmp_dp.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index a0606fab0e22..d60b7431603f 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -1721,6 +1721,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
> >       bridge->ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
> >                   | DRM_BRIDGE_OP_HPD;
> >       bridge->type =3D DRM_MODE_CONNECTOR_DisplayPort;
> > +     bridge->of_node =3D dp->dev->of_node;
> >       dpsub->bridge =3D bridge;
> >
> >       /*
>=20
>=20

Regards
Anatoliy
