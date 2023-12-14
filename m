Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB77813B3D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 21:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E91510E992;
	Thu, 14 Dec 2023 20:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BED410E920;
 Thu, 14 Dec 2023 20:07:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnwJ0EyPiKfjxD/zKoXBKiu0NYf9+IHVZLmWyfyqDJczRePnxcS/cTo1RX6EPrWqYg+R/avPBiDkM6GcdE89HKW30y8azVCiT44c5lQs42Ld063j32mCyhgvHoUNr/ZBsDUq1HRCc3SATmFSgi2wGmMBBLxZCNFWxi+aeyJ9MGhmLVjGtIWAKKQggzZReVwFiTJPTQS8GMXmIkAZCGKjJOW+MD8dUe9nPCLgdOMe8lBBu9rKllfgQWrcyM1AJAeT0xPZjGhS2oqLBjIHwuWNCzoaXrWSXP9RC1g02XfYnn+3LuJ/8TSKjIne389bSV+KFE6ZF/Pb0++3gW32Jfwwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CX1ysmFSuqh9wxWDp58sXpq9eEwOH/DgHML++Y7OmtM=;
 b=leCi/G7bE1RR0jukPZh1In+kAk3F0dXU4IInv0JMoltIxOOciswZBn/zrajoo45gKHkRpQwVCPF6LirUeZSs+EzN6MCsHFKQutgf+pTsq4UGcOOSW7rd5vXQU5x3tN2JZ/qUucoekbvXeIw48iKKEfVBL/R1ZNH0ITWfAjv49vclkRoFCt52TSdLMMVLtF/Lkw+Sd9ui++MwFKW8tfHn5PbLIo9EBKU7e6aGh4MAn4t15tRV6UX78yZjjepa6TZAOUt8NmrfpeS4dIdGjz720c+YmKEX2a3tg6kOMQcU8EmM1cMeJzVWnVVsJ/Sha5i8ZOvUcMzwDrXrTr4mzUxRzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CX1ysmFSuqh9wxWDp58sXpq9eEwOH/DgHML++Y7OmtM=;
 b=LjMfNqVFXi756iWryfeIZu0mOT/ALkfRi2U1zBjXDtkTECbGMpnysDVmNOYeg+7+ZQC9eKIjqQUq/4Y5LPVkOe/JSM+rDC9YImKH4YIh+u+2BPi2iGo/1w1t0LTYL0zYq76kpSsKFm0zFB1a/M98vTXu0MnOF3PIisIiosp0YlU=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by SN7PR12MB6912.namprd12.prod.outlook.com (2603:10b6:806:26d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 20:07:07 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::f081:16c7:9129:c010]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::f081:16c7:9129:c010%3]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 20:07:07 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Melissa Wen <mwen@igalia.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, 
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH] drm/amd/display: fix documentation for
 dm_crtc_additional_color_mgmt()
Thread-Topic: [PATCH] drm/amd/display: fix documentation for
 dm_crtc_additional_color_mgmt()
Thread-Index: AQHaLsYfqoCWPeQOrE+ebjQyIU4MN7CpNHyA
Date: Thu, 14 Dec 2023 20:07:06 +0000
Message-ID: <BL1PR12MB514450F981589703FD8F039DF78CA@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20231214194533.444097-1-mwen@igalia.com>
In-Reply-To: <20231214194533.444097-1-mwen@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=5ad11d07-6294-422d-8bbe-350bf72c7a5d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-12-14T20:06:30Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|SN7PR12MB6912:EE_
x-ms-office365-filtering-correlation-id: 664b3dab-9bfa-4823-a6bb-08dbfce03f7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wSN23tyaMTbb6Yc0tdt/+uN6z/cXeYcS7STYyE6Rmo0tzZn7MzzVznefF4crmVqOH9Alk9OQ4cLAn8NjLnNTk5DGSWO+nykjnpQRddRsERuw8NBxD0M8baLOZulR6203J5BE8Dx5ILxKjPibPayYRNfuUeLD4UuGzBm8NN+c+FYdRT2nxMgg/S3ie6PPL/G4wyj2S45gdT4WrChf4WygrtcW9wr8tg46/sgFwhRuKSHid2/08wK9fjPgMiS2K9BG8bhO3iEFEb/tBWH4dPcZVtN4KuVPfjZ3+D0Y7Uhd8Jw3ReRpoYEvP4WIZ8Wwb620TDFlOfsHlJ95cF/FdQZN/oXE98/cxFW7iO9L5TdOzIqnBjj/4gHLXqEuB7WPzyBn29iCxGsQT8O6O6yEk6kg+EJQoEt1Kr9e3utg2dEqq0ZPdmptUY6GCtQuFpk0pkXaEdmx5Q503jLI3NkwZ5IqXjEUYffuNXqZKYykIUFj5xoUOjnQ242e+yphkQLoZaq1YLODkVdmFBOtTbCkKR36OIPkMLgpEoADMt+7lH0Y+AXZDONcjh4tBsutI2yg99dzRc74ycUEvBc5QuJ/7QyCMezkFtmOaTcr9ptCVQj1n1m4+YhAJ6ZSHbyVVFF1gIcKQHlOElIlgWa++opLWpL6QvfPFNWvgv8Zt1GHeVyqdiA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(1800799012)(451199024)(55016003)(26005)(9686003)(7696005)(6506007)(71200400001)(86362001)(33656002)(921008)(38070700009)(38100700002)(5660300002)(52536014)(4326008)(8676002)(8936002)(83380400001)(53546011)(122000001)(66446008)(54906003)(110136005)(66946007)(66556008)(76116006)(64756008)(966005)(41300700001)(2906002)(316002)(478600001)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hhmlwaG2iilQevnlEYRA/ihTZUA3PaGFjVye0uTcD8gz1LgjoMXAAlYvlceO?=
 =?us-ascii?Q?ELaIGpUCcVWHR8evc0vLYruQfgLB1/pmPVOVr6PkS0Ntdtf4qV3U8jYUo8Id?=
 =?us-ascii?Q?c3o9iwqexusyyEE9dk766jiPQYd7U3we4LpUCTUCbj1CBIswlKivTy+3xmnu?=
 =?us-ascii?Q?ZtfSK82XRVa7e+y7u8+JUipD5NKg9kG/r9R/2o0i/thL7hvBMSGhNXYos22j?=
 =?us-ascii?Q?fKh2zFsg987s40QOV4Jx/5hKSl0tVag282o51B+m2sgFNyCXPgsGRPv0KQ/X?=
 =?us-ascii?Q?DHDm9Y1853zoznarG2xrlKi+zh4WDwUfxv9e1Vj1vwqrVTDZEpfUIegpuP8h?=
 =?us-ascii?Q?V+l17/DRInDULsOIIbUuNfkvgnrIYS9W/wvkM10ZiVWDcMheT55bDGL8j4FD?=
 =?us-ascii?Q?aUh1grmfngO7Nc2qPCh9uOmPSMogtE8Ymirf09e+OQ5VmOVFLnm4/pHfO+iB?=
 =?us-ascii?Q?2fDPljxGFJfPeG2g8tPgnEiTGHqgyuJ0Un3NM4kN8EPkst7bNlVOMaEgjJyu?=
 =?us-ascii?Q?dD5rq1UiRsppp5OIe14Dy5kU3/OO56hGkU8gPtcagBmjb5Uijm52LoSu8G6M?=
 =?us-ascii?Q?NVpzpjw9zcKvHfdBVE1pRYgXo3M+adM5pynxzOK4M0hS9dWaFV9L/dj1PJOk?=
 =?us-ascii?Q?hKfqM3Ce+9vCoAY5jOnlEPD9/39O9OkkfjMR4dgVCPd6KUQnRCRbiuWNCVGs?=
 =?us-ascii?Q?ZbvT87wAl6+KM7mjzqC+Dr9GY0IJ5hgM53F3iiGwSqVORD4hUbU8jAmZcnTj?=
 =?us-ascii?Q?Pe0xpYvf8kr9S2mwEViEdfke3m1nDAgzzHPgdwAe9uqLeb/r+7VZlLbO49ge?=
 =?us-ascii?Q?N//XD1XcYWE+/0Ib59I8Wpxoks+Vdm+L3O918waW0UhV/w4hxAEvAxXK56tw?=
 =?us-ascii?Q?Z/AmCiad0h3+wYk5QIVA8fpV3LYzInRwLgfNDfhWQhTvJHXcFgpoyHhHXNiE?=
 =?us-ascii?Q?DPkaky+m4VUhnM/1cgr2W5osfOHqpUImb3WcQdgX/pYUW0CCmPH0V8p4nFTI?=
 =?us-ascii?Q?g86moKgKlo2srZU+bz9qNX1RZsinOWoF8Wq+S6RsIjsHQIMxc0ID8osQQeny?=
 =?us-ascii?Q?46169RYa6QNENOMO3/TPwon5hsILwEl/Sfr0bjPJxgGqgEy9wGH2CKbJa0VX?=
 =?us-ascii?Q?XjzpJNvfsdMxqfnlxknsgFhJJmblxjCaOtwejmAtLPY3sq2L2a1XzCAIsRHE?=
 =?us-ascii?Q?c4thgGGKiWhrFevT+otvpVKNBtBx6m5H2W5LlcvtKB1c1CUgl/ArOSK6x+/+?=
 =?us-ascii?Q?dcXkzHPak0sdRBFM4VorHOSUIl9rP4JZ2gF0gN9mfM5VeAyA3lb0PUZs+FAF?=
 =?us-ascii?Q?WQ+UlO6Slsdi+dP8qzvAjgs+NHKU7ivzPmFSQwvoUwpavS9zr2X+oXTNgQoS?=
 =?us-ascii?Q?r7++XmXNUp1R9Olu9oFfOGYmyhR9QUehG4yo+kc0R016SbhP09RbO8r8e4ol?=
 =?us-ascii?Q?Wwj4YvZa2+nqCMifZ09YqMqS2HT9OgJxGPlWwHRF8a3VKTBWcuI/abEsR/36?=
 =?us-ascii?Q?ddOl5Mfjx3mIXgeDPpsoS6nUQxXi4G60IZ4LyyP80iJSFDDJyDySSMD4i6qe?=
 =?us-ascii?Q?u+bDDXbW9j0oJJ/CcHE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664b3dab-9bfa-4823-a6bb-08dbfce03f7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 20:07:07.0641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 065wUKUbzCEh2B2wrJgaRE6tyZgxagDqXZoufBrQGMqMzYWRUkKQGQLJk/CJa9R2SyVdCUWJji7HxoOGgSNA8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6912
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
Cc: "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: Melissa Wen <mwen@igalia.com>
> Sent: Thursday, December 14, 2023 2:45 PM
> To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo)
> <Sunpeng.Li@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>;
> Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@gmail.com; daniel@ffwll.ch
> Cc: kernel test robot <lkp@intel.com>; amd-gfx@lists.freedesktop.org; dri=
-
> devel@lists.freedesktop.org; kernel-dev@igalia.com
> Subject: [PATCH] drm/amd/display: fix documentation for
> dm_crtc_additional_color_mgmt()
>
> warning: expecting prototype for drm_crtc_additional_color_mgmt().
> Prototype was for dm_crtc_additional_color_mgmt() instead
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312141801.o9eBCxt9-
> lkp@intel.com/
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 8b3aa674741d..4439e5a27362 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -292,7 +292,7 @@ static int amdgpu_dm_crtc_late_register(struct
> drm_crtc *crtc)
>
>  #ifdef AMD_PRIVATE_COLOR
>  /**
> - * drm_crtc_additional_color_mgmt - enable additional color properties
> + * dm_crtc_additional_color_mgmt - enable additional color properties
>   * @crtc: DRM CRTC
>   *
>   * This function lets the driver enable post-blending CRTC regamma trans=
fer
> --
> 2.42.0

