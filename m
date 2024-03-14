Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8076287BF1D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 15:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F17F10FBDB;
	Thu, 14 Mar 2024 14:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="13gjzTv4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A16B10FBDA;
 Thu, 14 Mar 2024 14:40:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kn7XBlkKpzs7znalaHCOkznVfsjC7njVFMKPAGkaTPYharHTq4lImloUn+D5kIrh2TbqxBDrTMaQmSLBCIt1lVl8k6NAvxnnmJkUuq7ZNxtF9By9QT5WENaOjYPjPNGgZWp9lMGotGirUM06e0lres2k/20vYaHyy/Xxv5wW1bJZL0q/M1sM1tHGFDqgNGRSyuvNRlrVUqMIS8NlvDCQSQ5GwsxZnNl+34q/EbyNwkx+ztJ1rBlz9W8jHdf3pEV+ntqNzyKFd6PV547Ujl036c8fybYFnoPx5PvQkHi4vVIy3eKJsp3nSXoXcrEUYTcfnSWvIzDYTCJRWEne/vpMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swD6T/RgLjivDz91v2PAuhPqj4jTfq7HpwbMhSlFdJA=;
 b=C768septOhDnjzmYZS8deL9mjYC6mCi1duhlhNAwn/8hIp1O/d5vMZtx4yN5wzzqw5XBwvapdTN7wFwK5HdRQ2PhtQlpXyiCFy2GdrdZMqXDr118T5fDXyNO6tqvy57FSQUNle54bzhRUVxe3HYD3Ff/qe9wzVVoEAYbFWcojel8AeI9tsQEXZadgosz/TP4UXChg5mNvprh+XW844GGCkJ33I0oEo6xwCHfZKCOlaTybIs3Kb3Yq8EgWvIARt5XtAI+SbaaJPMil/3Gii3tyhy2Uimi8vv6OD+xWJ0C5u1nh8jkdAgDWqlTw2VH4xEkwvO3MzdopSsy7QgYHcAZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swD6T/RgLjivDz91v2PAuhPqj4jTfq7HpwbMhSlFdJA=;
 b=13gjzTv4pWM3vCZWhZ3OuoxAUkB6vgTNz+MUj+aXSuvq5pv0Y0voPxQUNRZLvEfkNSIYkHgROkO8/aQyMP9xTlE8fPyFYAWCYM46M2cT+QCt1R/1/Gm18TA2pIDSxTOTyGjuC9TQCkhhOwiT1Dn3eqh/CGqa0KmeEfVhUfh9i4s=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by SA3PR12MB7857.namprd12.prod.outlook.com (2603:10b6:806:31e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 14:40:41 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::b001:1430:f089:47ae]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::b001:1430:f089:47ae%7]) with mapi id 15.20.7362.035; Thu, 14 Mar 2024
 14:40:41 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Qiang Ma <maqianga@uniontech.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>,
 "sunran001@208suo.com" <sunran001@208suo.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] drm/amdgpu: Clear the hotplug interrupt ack bit before
 hpd initialization
Thread-Topic: [PATCH v2] drm/amdgpu: Clear the hotplug interrupt ack bit
 before hpd initialization
Thread-Index: AQHaVBuV1+DuIno39kWTMzibKUqKELE1dE6AgAIefBA=
Date: Thu, 14 Mar 2024 14:40:40 +0000
Message-ID: <BL1PR12MB5144F6A9CAB0504C8AD5728CF7292@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20240131075703.24600-1-maqianga@uniontech.com>
 <A65A2F93D9F165EC+20240313141827.40f30bd5@john-PC>
In-Reply-To: <A65A2F93D9F165EC+20240313141827.40f30bd5@john-PC>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=be9acc67-a4ec-4e26-9175-6848817506c8;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-03-14T14:40:38Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|SA3PR12MB7857:EE_
x-ms-office365-filtering-correlation-id: 564fd3d9-222a-4cde-8bd5-08dc4434b8dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kg2KOrVU49WCPmbEVAENvfbhvss6iNXwpOvbgxJK9aN6OYE1nxXUqu9FYNN7OQQXJ5CT1RUzkY84CxAmIrO0Odah2S0CNo2tm65fXLQ5rxZNMr3YfNg9OTqwnsMiJmdPHdM13YpjXmNuZwTg0J/zzYuyLNvfRzLiXHbjcDaqssJxkJF0cTWYqD4YezniWCG2xprvOpH9KmiKnL8OyJ62ehFlvXsvX4AQguMlDNq/4FaxsJnefa1a5I5VDRRWQEnGtJ1pjxKhhRnAV+SMlNye/qd78yG83rQJELu84QaXP2SbgGHX2e1ryYxMXJ7u5UEQ1VT5MTUjVj0u//jig6p55pQVnZ7cv+shUrpBp8tLFc4s9TG6EtkIaYYb88EOSPkOhzC+STF/kaNm/3VP+edUsT2/mXxcfcjjR9ePUS5syKQFthjU6R6t/aTrh3tjBXkObPBnz3CWrvDEiCEb2t2fLWcF8oVud/mZuDMSPZDg3Sw2azU3+mE96V5Hu/StC3wDJ4b5kkRgQdNfTo1iYNey4Jj6TyBqcWVAPgcl6f6L+a+qANo8DK/AyvCydltBxgHHuERjxBJQCZMVrIFu5FDIuSxLhVHJhL49VZjWkyVK3fYFcNcmGTExrItGDSp+GVgDpGtC3e8y7ww98aTf5mG2tTXZ7S872tkq6xeaPXWw900WZnsyZiMIHy8iQWfkl65b0k7gIo3O35VFIpN7vBwCXJqxhqwQ9CO8Hx3jcV+AN4U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(921011)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fxOu+4x3629nwmL1ykAmQzvrGQJdbvLQ8try7lEvONd9pz1iEdOyh3EFAcWm?=
 =?us-ascii?Q?dIJ+6NAyesP4DALXDjdqEqt9ChBaVwiBloS/dw0LqupYzQKbqsRMYUdMh1a/?=
 =?us-ascii?Q?yFzm6ecZyr7Hup1R2gqiSzEtWr/4uCpfl/jRB2ADwjo1E8pa8dift3NmKy3+?=
 =?us-ascii?Q?OvwL8XCySvTg+TiM48eoLZsORTeFd2ivh0DtSWsM19ZOaAQy9YVGsH74/zHk?=
 =?us-ascii?Q?B4goSth7zsk6Uwrz3zMM7LJcf89X1Z5DWROHnoT4aCruxmrqnG8+QPl/0dAG?=
 =?us-ascii?Q?cgHbthIZVkMZpBizX/Oe5OsgYhRQyKfjQXNWG6X9mj5f9Pr/ciEy7P7jU3Or?=
 =?us-ascii?Q?rVxv7xoaguC+ZyRufd7S//cJtJfq2BQX7krX9tP9oN3Un5HJavvyNFeW4BDx?=
 =?us-ascii?Q?D9B9/+hLeNCpZZaB0HnxrGKA7pWZwIety1Kuaj8lI9DH1HSlnkd2VdnU4Rbv?=
 =?us-ascii?Q?hnyCh7Ubm16DXcXjiWfOyrLoFJEwspA+3GutnV+xK2JADYYSPX40peCn67G/?=
 =?us-ascii?Q?Ghy//3QnKVmEh0rq9siWIInTbBaHQFWXnrHjvZHUNEpNTnQfeM8Tal3AqOKi?=
 =?us-ascii?Q?2zvs3VaMB0ifhkna8BzooGUbyWlc/Morpq9YZ/yRh+gnwqjo0Tw/SsRcgaKV?=
 =?us-ascii?Q?NAbN9r6h9OqHlmdccZAoZFba8AP/jY8oKfQQ8ITHIHmQOJevQbUr5mWTYiUN?=
 =?us-ascii?Q?Ghfqw5uVn6M+OtVx+/HLnHDBlez0wlu/9t9bMEYEglMU84KtGsIe5wr6TuHb?=
 =?us-ascii?Q?0xoMqqOLEEM7wr24Dca12lD8nT3O9i4kHVnw5MUdRE6/RjWXWNFPPIfB+VhW?=
 =?us-ascii?Q?oBxrs6qcxX07el1BQEN/xObJE0EbSTz8GOvV7oFYv621QfAhFdqQCIvw4RwO?=
 =?us-ascii?Q?Ni3GvM5Yefhc9dGh8FXOOmsHLmRkHn/Yb6oCZX0VNxOIJinT6oC2p44Qt3eC?=
 =?us-ascii?Q?gMVOc6kC15o2HDSHx+uxPekl6SKaPvLXdBm8ikJMqjhLsWqBc1j52v1J8ELz?=
 =?us-ascii?Q?7gJDeHttIdB9V+WHHj/A0gpuOH0oeYvT5uFu0ieWfGX1KS0EPgaI9P96VT13?=
 =?us-ascii?Q?8V+jxJxQa16CDocnbhCe7D+7JE3JIcQZtv/vQ9fPPRcWhPP3gmQbyOToPLKy?=
 =?us-ascii?Q?/45j/zUG8YEktPE4M8QCMrXIXU732yOfVP+5zvsLikB6b6NwiTe0z1cJNVqQ?=
 =?us-ascii?Q?WzXvWqza9tM+i1oRQfSmuraGngbdxzSHr44xsH0VV9/Pbc/Ga6qSeOdsJW2C?=
 =?us-ascii?Q?yUP1vp9GzfptEKtRRtVgIHD0lEXuO1B4lvVwEZLuP8eQFPApmpBwwyfXBHzv?=
 =?us-ascii?Q?6IqVMBT/mLs302J47gmuiWw/r8C+4psgkg7Ua1+PLeOK/V4sDXMFmXOtex9T?=
 =?us-ascii?Q?jdooN1YIfE5h8Kz/jkEa/E20qg8AXEZmlNJdeXIntfe46GS55iG1Gx8d9Zvk?=
 =?us-ascii?Q?qd2GoskWbX2NPh91tSSXk/PBzsk0Qr7dv0Pk/v2ElRlKHABgsA3xf3f88qNB?=
 =?us-ascii?Q?vWfTV/Df8Gpnhv2BlFkerPwNNve8zgqzI4kJP3cNs5HaulH/eyrQQjZf9H75?=
 =?us-ascii?Q?LobHTDxSJJPZY214na8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 564fd3d9-222a-4cde-8bd5-08dc4434b8dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 14:40:40.9824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: woV682h9I9/se5JBSwt8Uhgkvn5XaoUAVEhTSAqK0Htty1NTMkp6+mKSYOHH6zkLEzWhTGmHHkpoD/puVU0Jvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7857
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

[Public]

> -----Original Message-----
> From: Qiang Ma <maqianga@uniontech.com>
> Sent: Wednesday, March 13, 2024 2:18 AM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@gmail.com; daniel@ffwll.ch; SHANMUGAM, SRINIVASAN
> <SRINIVASAN.SHANMUGAM@amd.com>; sunran001@208suo.com
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux=
-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v2] drm/amdgpu: Clear the hotplug interrupt ack bit
> before hpd initialization
>
> On Wed, 31 Jan 2024 15:57:03 +0800
> Qiang Ma <maqianga@uniontech.com> wrote:
>
> Hello everyone, please help review this patch.

This was applied back in January, sorry if I forget to reply.

Alex

>
>   Qiang Ma
>
> > Problem:
> > The computer in the bios initialization process, unplug the HDMI
> > display, wait until the system up, plug in the HDMI display, did not
> > enter the hotplug interrupt function, the display is not bright.
> >
> > Fix:
> > After the above problem occurs, and the hpd ack interrupt bit is 1,
> > the interrupt should be cleared during hpd_init initialization so that
> > when the driver is ready, it can respond to the hpd interrupt
> > normally.
> >
> > Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> > ---
> > v2:
> >  - Remove unused variable 'tmp'
> >  - Fixed function spelling errors
> >
> > drivers/gpu/drm/amd/amdgpu/dce_v10_0.c |  2 ++
> > drivers/gpu/drm/amd/amdgpu/dce_v11_0.c |  2 ++
> > drivers/gpu/drm/amd/amdgpu/dce_v6_0.c  | 22 ++++++++++++++++++---
> -
> > drivers/gpu/drm/amd/amdgpu/dce_v8_0.c  | 22 ++++++++++++++++++---
> -
> >  4 files changed, 40 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> > b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c index
> > bb666cb7522e..12a8ba929a72 100644 ---
> > a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c +++
> > b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c @@ -51,6 +51,7 @@
> >
> >  static void dce_v10_0_set_display_funcs(struct amdgpu_device *adev);
> > static void dce_v10_0_set_irq_funcs(struct amdgpu_device *adev);
> > +static void dce_v10_0_hpd_int_ack(struct amdgpu_device *adev, int
> > hpd);
> >  static const u32 crtc_offsets[] =3D {
> >     CRTC0_REGISTER_OFFSET,
> > @@ -363,6 +364,7 @@ static void dce_v10_0_hpd_init(struct
> > amdgpu_device *adev) AMDGPU_HPD_DISCONNECT_INT_DELAY_IN_MS);
> >             WREG32(mmDC_HPD_TOGGLE_FILT_CNTL +
> > hpd_offsets[amdgpu_connector->hpd.hpd], tmp);
> > +           dce_v10_0_hpd_int_ack(adev,
> > amdgpu_connector->hpd.hpd); dce_v10_0_hpd_set_polarity(adev,
> > amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> >                            amdgpu_connector->hpd.hpd); diff --git
> > a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> > b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c index
> > 7af277f61cca..745e4fdffade 100644 ---
> > a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c +++
> > b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c @@ -51,6 +51,7 @@
> >
> >  static void dce_v11_0_set_display_funcs(struct amdgpu_device *adev);
> > static void dce_v11_0_set_irq_funcs(struct amdgpu_device *adev);
> > +static void dce_v11_0_hpd_int_ack(struct amdgpu_device *adev, int
> > hpd);
> >  static const u32 crtc_offsets[] =3D
> >  {
> > @@ -387,6 +388,7 @@ static void dce_v11_0_hpd_init(struct
> > amdgpu_device *adev) AMDGPU_HPD_DISCONNECT_INT_DELAY_IN_MS);
> >             WREG32(mmDC_HPD_TOGGLE_FILT_CNTL +
> > hpd_offsets[amdgpu_connector->hpd.hpd], tmp);
> > +           dce_v11_0_hpd_int_ack(adev,
> > amdgpu_connector->hpd.hpd); dce_v11_0_hpd_set_polarity(adev,
> > amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> > amdgpu_connector->hpd.hpd); } diff --git
> > a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> > b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c index
> > 143efc37a17f..28c4a735716b 100644 ---
> > a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c +++
> > b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c @@ -272,6 +272,21 @@
> static
> > void dce_v6_0_hpd_set_polarity(struct amdgpu_device *adev,
> > WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
> >
> > +static void dce_v6_0_hpd_int_ack(struct amdgpu_device *adev,
> > +                            int hpd)
> > +{
> > +   u32 tmp;
> > +
> > +   if (hpd >=3D adev->mode_info.num_hpd) {
> > +           DRM_DEBUG("invalid hdp %d\n", hpd);
> > +           return;
> > +   }
> > +
> > +   tmp =3D RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
> > +   tmp |=3D DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> > +   WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
> > +
> >  /**
> >   * dce_v6_0_hpd_init - hpd setup callback.
> >   *
> > @@ -311,6 +326,7 @@ static void dce_v6_0_hpd_init(struct
> amdgpu_device
> > *adev) continue;
> >             }
> >
> > +           dce_v6_0_hpd_int_ack(adev,
> > amdgpu_connector->hpd.hpd); dce_v6_0_hpd_set_polarity(adev,
> > amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> > amdgpu_connector->hpd.hpd); } @@ -3088,7 +3104,7 @@ static int
> > dce_v6_0_hpd_irq(struct amdgpu_device *adev, struct amdgpu_irq_src
> > *source,
> >                         struct amdgpu_iv_entry *entry)  {
> > -   uint32_t disp_int, mask, tmp;
> > +   uint32_t disp_int, mask;
> >     unsigned hpd;
> >
> >     if (entry->src_data[0] >=3D adev->mode_info.num_hpd) { @@ -3101,9
> > +3117,7 @@ static int dce_v6_0_hpd_irq(struct amdgpu_device *adev,
> > mask =3D interrupt_status_offsets[hpd].hpd;
> >
> >     if (disp_int & mask) {
> > -           tmp =3D RREG32(mmDC_HPD1_INT_CONTROL +
> > hpd_offsets[hpd]);
> > -           tmp |=3D
> DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> > -           WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd],
> > tmp);
> > +           dce_v6_0_hpd_int_ack(adev, hpd);
> >             schedule_delayed_work(&adev->hotplug_work, 0);
> >             DRM_DEBUG("IH: HPD%d\n", hpd + 1);
> >     }
> > diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> > b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c index
> > adeddfb7ff12..8ff2b5adfd95 100644 ---
> > a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c +++
> > b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c @@ -264,6 +264,21 @@
> static
> > void dce_v8_0_hpd_set_polarity(struct amdgpu_device *adev,
> > WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
> >
> > +static void dce_v8_0_hpd_int_ack(struct amdgpu_device *adev,
> > +                            int hpd)
> > +{
> > +   u32 tmp;
> > +
> > +   if (hpd >=3D adev->mode_info.num_hpd) {
> > +           DRM_DEBUG("invalid hdp %d\n", hpd);
> > +           return;
> > +   }
> > +
> > +   tmp =3D RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
> > +   tmp |=3D DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> > +   WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
> > +
> >  /**
> >   * dce_v8_0_hpd_init - hpd setup callback.
> >   *
> > @@ -303,6 +318,7 @@ static void dce_v8_0_hpd_init(struct
> amdgpu_device
> > *adev) continue;
> >             }
> >
> > +           dce_v8_0_hpd_int_ack(adev,
> > amdgpu_connector->hpd.hpd); dce_v8_0_hpd_set_polarity(adev,
> > amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> > amdgpu_connector->hpd.hpd); } @@ -3176,7 +3192,7 @@ static int
> > dce_v8_0_hpd_irq(struct amdgpu_device *adev, struct amdgpu_irq_src
> > *source,
> >                         struct amdgpu_iv_entry *entry)  {
> > -   uint32_t disp_int, mask, tmp;
> > +   uint32_t disp_int, mask;
> >     unsigned hpd;
> >
> >     if (entry->src_data[0] >=3D adev->mode_info.num_hpd) { @@ -3189,9
> > +3205,7 @@ static int dce_v8_0_hpd_irq(struct amdgpu_device *adev,
> > mask =3D interrupt_status_offsets[hpd].hpd;
> >
> >     if (disp_int & mask) {
> > -           tmp =3D RREG32(mmDC_HPD1_INT_CONTROL +
> > hpd_offsets[hpd]);
> > -           tmp |=3D
> DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> > -           WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd],
> > tmp);
> > +           dce_v8_0_hpd_int_ack(adev, hpd);
> >             schedule_delayed_work(&adev->hotplug_work, 0);
> >             DRM_DEBUG("IH: HPD%d\n", hpd + 1);
> >     }

