Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75666C5A73D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F02C10E956;
	Thu, 13 Nov 2025 23:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TsGMAqyD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012037.outbound.protection.outlook.com [52.101.43.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684CC10E955
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:03:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkMF68MYu6kuYyQeCMcOJRnm51bZjcyalpMKS7tvv/FgGeX568kg8lgF7FaunVslNX4p++Xyc1+2TkMBhuJgNGLXrSE6cjsTXbMdN+qsIzbUsHslENh+XaYktLBPjiAPaqAIAK7c9WTdYmw0NDPIqqZ/0x5/ebfRaFZDsd5El3g+tqEga0NSM/mARayjilvxy5TG6DJZjcYndlulFgKcFxtKtranJ42w2kof5BOuI3gnwODvz7gX3WtG/cJDEaKGWV5Z9jkxk4nXGsSFTdJNZ5D1EbWFkQ2S0ebx+YGnS27IRuqoyau9XZ/W5U+BXhlPFuYQBE3oWNKDK0mQAaHBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+SigxA3jIw4aLehrwkR3qFXSxAjyqmmsOTF8/NvVms=;
 b=x8plUV8SmNLm4HOpar/wDNoaR2oDFq9Q46EFGXlKt+5vkJMwsOB0UPMUyQ+vbdw0iQT+vlChQQ6wLNRtt8mbCIurSZ13A3tAGgMms+9ft5oGCjXxauYsOxsAZ+ih6S+Av09+PE1BIRrVTkU/mAWIPadf8Supm8tz17ecv6aQYAuRyrIfYRy+/zgJkkx3mMFbHUoEvXBSohpM9bYhGoM4EcUvoWl2SwVlY6K93knKDE5rTHuf5J2TkHh5R62U4DLb0Lpk01lfLrql6RBqhJhgGaIWp+gRUUTGncwQtSuXNs1xgWR0jMVyNxTiwrY2hJTCIZW3md9RTWk1CNPmWa7ugA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+SigxA3jIw4aLehrwkR3qFXSxAjyqmmsOTF8/NvVms=;
 b=TsGMAqyDKFlENJ9dhkAo0+lfdVyMSJabWRUu+7Em1xRJT8FWpnkWavJpMNbNy90udlOMEAkCb8qgUGme3QJ1F/CL5F0k3xJ57GpLdW5XwRdOMC5FLIoSU3vvpr1AqFPP6UBvIkgX/j1PLvCxehSVWUBdEayhpi6ltMmnMEdQ4WY=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by CH3PR12MB8583.namprd12.prod.outlook.com (2603:10b6:610:15f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 23:03:54 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076%5]) with mapi id 15.20.9298.010; Thu, 13 Nov 2025
 23:03:47 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Sean Anderson <sean.anderson@linux.dev>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mike
 Looijmans <mike.looijmans@topic.nl>, David Airlie <airlied@gmail.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Simona Vetter <simona@ffwll.ch>,
 "Simek, Michal" <michal.simek@amd.com>
Subject: RE: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics plane
Thread-Topic: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
 plane
Thread-Index: AQHcVN1gVOfL1cVpIU6CqHq/hvIMtrTxNXCg
Date: Thu, 13 Nov 2025 23:03:47 +0000
Message-ID: <MW4PR12MB716514EB76EE4585605D0E5AE6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
 <20251113203715.2768107-4-sean.anderson@linux.dev>
In-Reply-To: <20251113203715.2768107-4-sean.anderson@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-11-13T22:48:09.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|CH3PR12MB8583:EE_
x-ms-office365-filtering-correlation-id: 99f2ce67-8da4-42f0-02b0-08de2308e732
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1xbRP18jbwqk2Bc74qyqEnFtJcZb8kNBb6uZUOR9hCZpF+V0VoEQuqoqhNWM?=
 =?us-ascii?Q?V7OtTTvO495tEFozAT4eTzqSqVNPRQFtYhL7ToF5O+bFdBBXc28/OJDHzTGy?=
 =?us-ascii?Q?AVXLZ9PxTD+f9VmZy+YB718XWjmzzDOT8kWDc2Ctj2AK3RLHSWeYj3PsqQja?=
 =?us-ascii?Q?N2VN6r9WMJPYa+ful9tMwnVh230dsyN/UDd8ptouD/MSbsXNdNFEmnzcabya?=
 =?us-ascii?Q?vKxD87fmipNlyvfOokR95F12XHeDU741HvdUCa0MMlozKJPIEfPWAtgdLe8q?=
 =?us-ascii?Q?rJy5N00w2lol4pdzt6lg0t80umy6a8isaU8C45ijuIJE5hPSGg7wVF5sYkgw?=
 =?us-ascii?Q?Jnjv2q7NvDt9bt3IDsrJ1uPmnPlFEWYmGaQI22DJkN6BF8VJpc93i00exPnQ?=
 =?us-ascii?Q?yF5pVo84fQoh+tlhfhTmUVm8L14KUJIUD0+bd3SJEYiM3mVFTFNnkyBYuTnR?=
 =?us-ascii?Q?VA8gLDLoRketO2q5dJKFnk2N+ys9tUvg3xH/PmaKBCmUt80wUKfs8+xc1XBP?=
 =?us-ascii?Q?TRbMicu3VjuZI9Oib3z5RLJwwQEv1iKhNapp9Q6tVpF+NdemZpcbbMHcS8nc?=
 =?us-ascii?Q?XrNHVC++NcEEoUWXTaubhuL/xi8gsHcPXQ9ZJuE1McE4gBPovKz5HtWopuhk?=
 =?us-ascii?Q?JnC7PkElJxgmizaYBJXXhyF00g96yhMxL7Skcnxn1VzeNlaz729/INKF3ckh?=
 =?us-ascii?Q?6emuxDUT4j+sd3q5QYTm9x62fb42TGRuS7NomfQpXgLbKe+27rczQ+bjXjLG?=
 =?us-ascii?Q?RlB9Pa5WKwmydysEVzKlZN/5ZdPtGFnC+P5D02mFstzOav9o5QuIl8slZOPz?=
 =?us-ascii?Q?ib4IolbnKO9LKLzZGsmEsVwBEkaFQTc98gkWVpjMbDP+/WOEePSmgO3dDgAp?=
 =?us-ascii?Q?ymXtbZjfhyPAg5pkV2G+v1GMadrHZaDuROYfXeXrdYblLsr03xTd3RJ+ex3X?=
 =?us-ascii?Q?eCL6S+oPw8ET0osCHpauZxCDVsP+QNP/UVIgIXS3QVAiBvXgyNTZ6SycyTyC?=
 =?us-ascii?Q?tUBNmP4j5bYrWkqHZ9Mwwel1pBglC7ehGL/4fPBBbTi9z+xarOjF7ufsrqVp?=
 =?us-ascii?Q?W19ZiXpVt+kGhEHjyIckEH3by0zT9gJxwc9Pu+haHqYT7CBNpDuvAoQe8MHZ?=
 =?us-ascii?Q?EkrFzFr1tFl99k19JhZwz0JS/Neod+MqeYis0xDk3b/DLDGq7CQbhZvHy39Z?=
 =?us-ascii?Q?C5K8vZIWEaffz0coBsAgyRF/qR3IQKO3m80HMGN1IBzlSGpeddMjzyxVrZwL?=
 =?us-ascii?Q?x7CUN/3kzvttG2fyl0wxQM/yDcAMzUWQAMvD0bcoI+V7KiRUVCbHD3LM6pN7?=
 =?us-ascii?Q?HLUEL+qcGZQ6rgtQwMn/vOjLuXYO+YZtOdqU5TB/iKIX/1Kt06BYfV+PHFRf?=
 =?us-ascii?Q?aMF6CUIkqfRNrvrF/2eCyM90G0gaE92ByG9sPGvJ0A3fXItl05lTFraVAR4X?=
 =?us-ascii?Q?PjpxMQ/ogXt6lSxUzeNR0n13kt0qaAImfm1sPX2ZrnicAz5oEjcSwNqMNf1a?=
 =?us-ascii?Q?1VBrY9SXM5KGDLOXLJRhedl9ztFTiTAzDQLb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xkymapVumhJwwK+KfRbrnwUy//NuUIszeA9d0kBwMzJ4/F/EZdsiSBka2kty?=
 =?us-ascii?Q?NiUymYS6zP9tR2r0tuIc5MO78+V703u7xGmbTGfcfUkeevv7VOBmPBPWVKW4?=
 =?us-ascii?Q?o/zoyqvRQj/1/Q05anyGv/sxo8Zk8bE47SXGqp1bXIbvQGYatBUUU2y3Veup?=
 =?us-ascii?Q?I2Mv+0Y5+EKDbTc6+m29GN9jw/I84N8A+EBrBw9fLenYQv3jNt2YK+uRzwQ+?=
 =?us-ascii?Q?OArA9gdvMtlbbd4efT3c2n4XFukulgdqGLuvYlgxdy9+nEqvEbdRye2L7dEK?=
 =?us-ascii?Q?4OJ9+2j3MwtwfPV1RMvaNvgkkRJAGcYyPrbxVX1FpKOVrVlVv7JZ/1nDazlQ?=
 =?us-ascii?Q?BZDN7a3QJ3kzrrAlCv0iYqlJ4sBAPSp49z+1nim0bdd6LNGdixaDIRl1DKNl?=
 =?us-ascii?Q?BLCTtsJpw9GNDdUfKlTmafCuDZXWgKfNqSmAB3pxJ547WBtPxTK3WnMhU2lR?=
 =?us-ascii?Q?kwD9n4785gqdCG1HF9z7Aw9xbFVjH2BYzjVyanZjrrlO0ookMrBn37UnZpIo?=
 =?us-ascii?Q?NjFsw/ceA+RQYli3JJ/p/tLVJlo4DIPlkGh5oE+UtRBGi0onBgXvszTSnJMq?=
 =?us-ascii?Q?TbtC4TXBFHnOzMXe+p8xEs9GOZvGJcDr1IukHBV9LxTWOlZm7G4tnKrS2ptr?=
 =?us-ascii?Q?0gx9rZ2NHjaky9ZCJYtAZunCXIXZd5jthxkQ7Aic/AhLT2cUg5Pktlk5kzBw?=
 =?us-ascii?Q?Dw1pGWVSeU22YHPsFzwav8HLDbOaDGeYZXRfi/a8jhsb5tNatvR+sb+RPD2T?=
 =?us-ascii?Q?5vadPwbcCgmb3/lteh4oWH8vRsCb/tuYrDwO3QwFkEpXix2cHOqzWZ2qmMtt?=
 =?us-ascii?Q?uy2a5xFkHTuGRXzWIsBgQpfitd4Lzrc4b57PtpvSQ5amM/Ng6OI4DrLGO77f?=
 =?us-ascii?Q?kG/vDXvC4yrEWKWeFFJCFYMHFO4NZNrEchynVSuHsQJ7QNsP845lRYlY8DyH?=
 =?us-ascii?Q?D+L+fy1wbwbj6lSU9Hy5RbCrtR9TxgVNO35OtJuXhl4dVDSfIBvTTHxYuylg?=
 =?us-ascii?Q?7TShApSaWf5vBQ/JXAFUqwkv603zWDIlpDdDpLKYXwvMfVz06p63/skJ8S9Y?=
 =?us-ascii?Q?dcQETXWSgHUi/E/+lM1FUS6AQWISIS+TFd9LGXOgLRCwnICFoanpyq0DZHqF?=
 =?us-ascii?Q?XHZW234/JA2lwnmp6QqJsou8lAXw4MH9WkzFjgnGlf5MepzdGrKWEumv+mU8?=
 =?us-ascii?Q?BKX2+uBTPDP1Gueio49WV4GNG47DVtEusRk9kqtsHDxIXYqa68QCLHJQXvnl?=
 =?us-ascii?Q?ykO4E5aQbVwbKgEAQ2BDbzTt5nJHZVT3jiaS4yawMQq1apVlpY2EIB2aMcVP?=
 =?us-ascii?Q?dBwdpkeLJZSB2hma44qiqp5UKonA2CRZxU8i9osTRozZZjdPcibuPua+bfOr?=
 =?us-ascii?Q?N+A8ffPoj6gFD2NapZ6tEiRYT7lcuzXrqLNMHhCC+iz0IuVkjedHVXZ6OS/n?=
 =?us-ascii?Q?TBAds5pgzDOCPKS44+8EEtng+I6N35V2uZqD67BE7AHlHVZQt2rH6gc18V6f?=
 =?us-ascii?Q?2e8ytUlhz5X9J4VHRyBgeKivizRNJFr9FchBKihYkd9h5NT/9H15ArL1n2WP?=
 =?us-ascii?Q?qlHcmOhxqn+3xL5E7zU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f2ce67-8da4-42f0-02b0-08de2308e732
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 23:03:47.8470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HE06jRnfwOxUBJjj+AZjq9Xiv2+Qhz41SFc5XAn+UUB3hEaZTly/woLteMECzPPMdSlX4mr51ZNM1q4NYa2HAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8583
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

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Sean,

Thank you for the patch.

> -----Original Message-----
> From: Sean Anderson <sean.anderson@linux.dev>
> Sent: Thursday, November 13, 2025 12:37 PM
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org; Mike Looijmans <mike.looijmans@topic.nl=
>;
> David Airlie <airlied@gmail.com>; Thomas Zimmermann
> <tzimmermann@suse.de>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Klymenko, Anatoliy
> <Anatoliy.Klymenko@amd.com>; Maxime Ripard <mripard@kernel.org>; linux-
> arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
> Michal <michal.simek@amd.com>; Sean Anderson
> <sean.anderson@linux.dev>
> Subject: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics pla=
ne
>
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>
>
> When global alpha is enabled, per-pixel alpha is ignored. Allow
> userspace to explicitly specify whether to use per-pixel alpha by
> exposing it through the blend mode property. I'm not sure whether the
> per-pixel alpha is pre-multiplied or not [1], but apparently it *must* be
> pre-multiplied so I guess we have to advertise it.
>
> [1] All we get is "The alpha value available with the graphics stream
>     will define the transparency of the graphics."
>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
>
>  drivers/gpu/drm/xlnx/zynqmp_kms.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index 456ada9ac003..fa1cfc16db36 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -61,6 +61,13 @@ static int zynqmp_dpsub_plane_atomic_check(struct
> drm_plane *plane,
>         if (!new_plane_state->crtc)
>                 return 0;
>
> +       if (new_plane_state->pixel_blend_mode !=3D
> DRM_MODE_BLEND_PIXEL_NONE &&
> +           new_plane_state->alpha >> 8 !=3D 0xff) {
> +               drm_dbg_kms(plane->dev,
> +                           "Plane alpha must be 1.0 when using pixel alp=
ha\n");
> +               return -EINVAL;
> +       }
> +
>         crtc_state =3D drm_atomic_get_crtc_state(state, new_plane_state->=
crtc);
>         if (IS_ERR(crtc_state))
>                 return PTR_ERR(crtc_state);
> @@ -117,9 +124,13 @@ static void
> zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
>
>         zynqmp_disp_layer_update(layer, new_state);
>
> -       if (plane->index =3D=3D ZYNQMP_DPSUB_LAYER_GFX)
> -               zynqmp_disp_blend_set_global_alpha(dpsub->disp, true,
> +       if (plane->index =3D=3D ZYNQMP_DPSUB_LAYER_GFX) {
> +               bool blend =3D plane->state->pixel_blend_mode =3D=3D
> +                            DRM_MODE_BLEND_PIXEL_NONE;
> +
> +               zynqmp_disp_blend_set_global_alpha(dpsub->disp, blend,
>                                                    plane->state->alpha >>=
 8);
> +       }
>
>         /*
>          * Unconditionally enable the layer, as it may have been disabled
> @@ -179,9 +190,18 @@ static int zynqmp_dpsub_create_planes(struct
> zynqmp_dpsub *dpsub)
>                         return ret;
>
>                 if (i =3D=3D ZYNQMP_DPSUB_LAYER_GFX) {
> +                       unsigned int blend_modes =3D
> +                               BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +                               BIT(DRM_MODE_BLEND_PREMULTI);

| BIT(DRM_MODE_BLEND_COVERAGE) - this is what implemented in the hardware.

> +
>                         ret =3D drm_plane_create_alpha_property(plane);
>                         if (ret)
>                                 return ret;
> +
> +                       ret =3D drm_plane_create_blend_mode_property(plan=
e,
> +                                                                  blend_=
modes);
> +                       if (ret)
> +                               return ret;
>                 }
>         }
>
> --
> 2.35.1.1320.gc452695387.dirty

Thank you,
Anatoliy

