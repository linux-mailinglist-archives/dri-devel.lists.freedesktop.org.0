Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C76B87ADC48
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 17:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5E010E29A;
	Mon, 25 Sep 2023 15:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2FE10E29D;
 Mon, 25 Sep 2023 15:49:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwrkJ906k/+e2nlIv6WIMYEOpaUZu3ZhUT89PiDmhV4zGRSv4TvVETycUlCOUxljCH7cUWl+1asnuYaqWStGGiE77yx6u+Nuktclv1swJSCD5h5Z3tK04XhZIy6SjrIVtRYorwY6EHjaOsnx2GnL/HRmQMBsRTFhn5FFa1wT7t1lGLFlCuzRifWALlUlewoGRm66w+m4cgoneCQIfmfDW3kuxaT2jdFyKkqMrW6pri4qEfDiy8gRosTzzg/NBc1Y6+n7JpyA+3mIoE25OavQnLayoTxiY41iJ8k9cdoyHbB+v76ekQqDQ1extpActuADapxaO0R9c0CD5LqJVkBjzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83q49xgyG+q22La9XLiNW30O0wLRVLuYAiaO8SRHId8=;
 b=huDSbqbG8X7UupPFjXh+S6acRb+wXtypIlHV5f83zdJFJLFsmoAM1mBogsyNJZkst/SSCaP2SqXpuaDd2UhDqKZk8WR/uyjaddvP3giYq115BKJES/yj7VSNVl9KTZbxRb1srXLX8v6mf27+NcJqE4zx3gKmIRHXlhHx26m6Cd49KH91klZEpUIjDCK0Rg2z6JWine+N4UMEGRfIBOJU91bt7GMM0GuqLIaUiX6rZKtLHoYyQuvVEGLLWIXMHLwM/uqdQmAgKiFLST5wC+t/D+1nHy1aEJ6cwYwXSl4iAgtWqvcrRuJf6/LXha3SQl3IG2T8R3hpMjDYXXekOURVQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83q49xgyG+q22La9XLiNW30O0wLRVLuYAiaO8SRHId8=;
 b=ZL0KnzwVPRcmfAXyyhaPoSb6jRZw0jorO/bNLEjJVjzs19ePdk4ojN5F2ZmbUgM2yDoW2xY8D2/YVRHsvhdRbCvbd5cQDKAwg3OdjJZzcgi5yXfW3b5XkxqZPZNOeFWYUlXpSgxVjkH9fItoPjyIOL1izyVrQ2B6YiUp0yo8SR0=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by SA0PR12MB4431.namprd12.prod.outlook.com (2603:10b6:806:95::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 15:49:01 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::a2bb:870f:8aaa:1ba2]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::a2bb:870f:8aaa:1ba2%6]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 15:49:01 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Douglas Anderson <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Maxime
 Ripard <mripard@kernel.org>
Subject: RE: [RFT PATCH v2 11/12] drm/radeon: Call
 drm_helper_force_disable_all() at shutdown/remove time
Thread-Topic: [RFT PATCH v2 11/12] drm/radeon: Call
 drm_helper_force_disable_all() at shutdown/remove time
Thread-Index: AQHZ7MHYod4J6E7jf0WMA7zTOxztK7ArtE/g
Date: Mon, 25 Sep 2023 15:49:01 +0000
Message-ID: <BL1PR12MB51446279B27EC69BE91D865EF7FCA@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20230921192749.1542462-1-dianders@chromium.org>
 <20230921122641.RFT.v2.11.I022cfc2dcd30e77d4f7005a2d912dd7ab76c0338@changeid>
In-Reply-To: <20230921122641.RFT.v2.11.I022cfc2dcd30e77d4f7005a2d912dd7ab76c0338@changeid>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=83f6047d-c446-4fa6-9b25-45b3fcf77133;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-09-25T15:42:47Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|SA0PR12MB4431:EE_
x-ms-office365-filtering-correlation-id: 8834d53f-92b8-4462-55bc-08dbbddef080
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B5oQCoEzG24vBHgn4HHWZSTvZFcJ/rLXyv+QVn24cWWf44R3GbcHFKP+m3HZlCwgHRZzLixOzQtZOL6q9LMCuHzzATbw7elEaBpUyxKPS/b9S30Ds8zGR/oD0aEmbFr5f6Dz/Cm/e3mzzH/Zjc7QTk5T3RTxmp4Cbqmaby8SVZ6lTSGp2qLLJBQ5iAEsCEzyn/4K9mzVOYPOK+zaCf6jNbRqcsZwtjcq/oefAhmGhquEHCA0vfZQ5NBkUBF8E9EZIwciUFUIBStO4D3NxMlbjJ9dS359rIbvnjaxH6/jAGL66Y/1nBuKxuoaQEVjCV2qNBpxE7Hs3O/l6vldLaIO4PbgYXnsy/zepOYiK8eLPbrl0ocEEVOlEzo7s7rMAYoxvONsjR1XsGcP2HeTGmchIrCDu9hYnFNoKQxhnAYV9EXqLVrxA3KyGaVkd9CUVJ9YEtwbabRvmXVsZSbWPLug0hnJGdmu90QfniWpbEMYLzRBOtmvioYiHWE0N551GMmghTK+Gs1/J0MarqtS8841PE25/w+QEX90kJikc3p8BqWl5+lh/inljrfL88Ft1n4B7g7s6AJgWMHihwo52LV6axsP30mwIBfahtTnwr0PFDj0dLdUpvKNh/AHMLi+bUxX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(396003)(39860400002)(366004)(230922051799003)(186009)(451199024)(1800799009)(2906002)(86362001)(33656002)(38070700005)(7696005)(6506007)(9686003)(5660300002)(38100700002)(53546011)(71200400001)(83380400001)(122000001)(478600001)(55016003)(8676002)(4326008)(8936002)(41300700001)(26005)(52536014)(110136005)(76116006)(66446008)(66476007)(64756008)(66946007)(66556008)(54906003)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PFNCJhjGrIiWoGRtRSvPOTjUAHCT/kuuWXS/AvWCDdqc10Dqgb5WgjyrJUm4?=
 =?us-ascii?Q?JgcXvK6aoGq5PdhuJAO38UAjGqtmoNvZuBsvb/MwQve9dkftB/tQIkKKYF3o?=
 =?us-ascii?Q?638jROYHyyPHzR5fte86pBl7PpAOGOlXa/OQlkEGSiSAsJ4pWKbTnqPittM+?=
 =?us-ascii?Q?Dx14oXgHfdPdBq87Z2ij3Wl4/w/ATBOlaMLR0puEgv6E896ghKi5ysMm1cJz?=
 =?us-ascii?Q?R8FUEZS7VqBs4ExLZE88n4d/Xn2aPc5FrF7sFL/8Wl3/HlBMxdyGj0IhPwmx?=
 =?us-ascii?Q?YSEnSQxEcAmWlhsZVIfiBKj68CWAZbcwIAHKR9jlFikx80Mk9Y36U7m4psa6?=
 =?us-ascii?Q?YUyfHJZv9U2ikNcFK5WpB0LBkQuIWSh0PqiUUzIN6eFge8QAksvkmbbVB24o?=
 =?us-ascii?Q?Fv+UiFhWXv4OlswrtU2jsU2i5QQpneNPmYHTr0unhnPPG6M2uO/NPclda2vI?=
 =?us-ascii?Q?lA+GrV3sMnRVAKuGFKlVpAb2uTzX6oEfxWceiqwmtOdsdHWv5h7tDdrFofO6?=
 =?us-ascii?Q?b6OGkUd0fBfsOTPFICgE414CpuWWzi3Jn9VMMjk0pUftVt1c0C9dfHuH1G9/?=
 =?us-ascii?Q?hF5j6W1ectGnAVCspmqa8nfxvFKWpvJZaFl07fFlVqlF2dnZAXJCTM/yg7B2?=
 =?us-ascii?Q?OzX/jbucdMfmUjQXQURHJSXfMYCKC7X6fF7HmFSj2SuXsOiBKgDKS1DIZ/De?=
 =?us-ascii?Q?bmSfz13fQxm8hl7KxfXfPK8pZXjFsfUT0enjNQYBVmR8YmwJeEFi0PARnkS1?=
 =?us-ascii?Q?8y71WEvucbnP2rggJlQeJUtLWQnAWNE+J6aLiMRf30qppJcAR54ll6AGN1+w?=
 =?us-ascii?Q?cqmDTsQPSxEyBKQsrllJyFB0xnu7gpPVnj2kdH87p39U6fedl5kSpSXgrIjj?=
 =?us-ascii?Q?eOljzsmkzf7HAYGrGEa97DhCIaT4OaVKa5ZssGOkd5bYfWYoWBCuOluu3Ky2?=
 =?us-ascii?Q?BIxWjQ0T2Rbv0eQx01H+KoqoIEq98zCjqfrkvWe29XKtnFZMb/OcR0l2DkRI?=
 =?us-ascii?Q?DwT1QhuZeg1FqpLyZ2RBNwa2JVPsNeuGQiYOmhvAMO1Npn2WlKL+K9e4DcGg?=
 =?us-ascii?Q?qBQR/D1xlYZANwa4lVkKreNmFim086YhxZhxXvknim9c4fTWV7drM8+1UKvg?=
 =?us-ascii?Q?QxOklE+TqsndFjtlqcx8Umg5tmDCF2gUjegr6c9YFYQBtKlsLQNKKqFjlAMJ?=
 =?us-ascii?Q?BZHgVn4OK40Bppeo/x397QmCTL81kL5S+U8KDpVKUI0GPAw8AthJ5sD6SmeS?=
 =?us-ascii?Q?x88T+54Pi8zh//yXezIraUbwCY4W0esYaYmdK8xg8lxMaRn1jZg++BuUA0zN?=
 =?us-ascii?Q?mhudaGKJviL2PebgyPUx/W9VZbszaNUiPliabYQfUFEjTfMjMt2Oy4btJbQT?=
 =?us-ascii?Q?cpSskjFdxYL/0G3l718GSwN2nUcAD12rUyBRIzkiKn6+OKAWvKz7tZPiKHj2?=
 =?us-ascii?Q?DwjhbLPddG0ERovXHu2hgatHY47f02/W+Bxh6h3t9c2bDWb8EJN8t5h6FJKY?=
 =?us-ascii?Q?lHHU5U4NCgiMGZe5AYMy+JfiIMFhzZB3pCgIfi/e/nHTQkC5fs1Ed/SsjySx?=
 =?us-ascii?Q?96gWCahsUkpgWrJ4yaU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8834d53f-92b8-4462-55bc-08dbbddef080
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 15:49:01.8145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RtWZYGwuqnAsVE2h99oBgjBVTncFLD1aOAQNu9/MGvAhku8px/KMImRKqAxyvGPxdOmn18QPux6n4dYITyrNNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4431
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: Douglas Anderson <dianders@chromium.org>
> Sent: Thursday, September 21, 2023 3:27 PM
> To: dri-devel@lists.freedesktop.org; Maxime Ripard <mripard@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>; Pan, Xinhui
> <Xinhui.Pan@amd.com>; airlied@gmail.com; Deucher, Alexander
> <Alexander.Deucher@amd.com>; amd-gfx@lists.freedesktop.org; Koenig,
> Christian <Christian.Koenig@amd.com>; daniel@ffwll.ch; linux-
> kernel@vger.kernel.org
> Subject: [RFT PATCH v2 11/12] drm/radeon: Call
> drm_helper_force_disable_all() at shutdown/remove time
>
> Based on grepping through the source code, this driver appears to be miss=
ing
> a call to drm_atomic_helper_shutdown(), or in this case the non-atomic
> equivalent drm_helper_force_disable_all(), at system shutdown time and at
> driver remove time. This is important because
> drm_helper_force_disable_all() will cause panels to get disabled cleanly =
which
> may be important for their power sequencing. Future changes will remove a=
ny
> custom powering off in individual panel drivers so the DRM drivers need t=
o
> start getting this right.
>
> The fact that we should call drm_atomic_helper_shutdown(), or in this cas=
e
> the non-atomic equivalent drm_helper_force_disable_all(), in the case of =
OS
> shutdown/restart comes straight out of the kernel doc "driver instance
> overview" in drm_drv.c.
>
> NOTE: in order to get things inserted in the right place, I had to replac=
e the
> old/deprecated drm_put_dev() function with the equivalent new calls.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I honestly have no idea if I got this patch right. The shutdown() functio=
n
> already had some special case logic for PPC, Loongson, and VMs and I don'=
t
> 100% for sure know how this interacts with those. Everything here is just
> compile tested.

I think the reason for most of this funniness is to reduce shutdown time.  =
Lots of users complain if driver takes a while to shutdown and there is a p=
oint to be made that if the system is going into power down, there is not m=
uch reason to spend a lot of time messing with the hardware.

Alex

>
> (no changes since v1)
>
>  drivers/gpu/drm/radeon/radeon_drv.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c
> b/drivers/gpu/drm/radeon/radeon_drv.c
> index 39cdede460b5..67995ea24852 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -38,6 +38,7 @@
>  #include <linux/pci.h>
>
>  #include <drm/drm_aperture.h>
> +#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
> @@ -357,7 +358,9 @@ radeon_pci_remove(struct pci_dev *pdev)  {
>       struct drm_device *dev =3D pci_get_drvdata(pdev);
>
> -     drm_put_dev(dev);
> +     drm_dev_unregister(dev);
> +     drm_helper_force_disable_all(dev);
> +     drm_dev_put(dev);
>  }
>
>  static void
> @@ -368,6 +371,8 @@ radeon_pci_shutdown(struct pci_dev *pdev)
>        */
>       if (radeon_device_is_virtual())
>               radeon_pci_remove(pdev);
> +     else
> +             drm_helper_force_disable_all(pci_get_drvdata(pdev));
>
>  #if defined(CONFIG_PPC64) || defined(CONFIG_MACH_LOONGSON64)
>       /*
> --
> 2.42.0.515.g380fc7ccd1-goog

