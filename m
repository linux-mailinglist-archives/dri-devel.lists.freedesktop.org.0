Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D03F59C885
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 21:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B519DA07E4;
	Mon, 22 Aug 2022 19:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-centralusazon11021014.outbound.protection.outlook.com [52.101.62.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE533A07C3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 19:20:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJs9ksO9wGu02ElyCvDL8dqQO1AQvmqoD4IJvWP8NHlno1vMiGcjf8TVjnWNuH02WNgIntoswK2mVeBqUbWjfAV1VvVk6vu5lzsjrZ4SK/hkNeeA/y0I1mjDbSMy2L0Zclpsbcn0UOW8/nr7fLQ+95FcphziIB1vrjTzfQAtDgW6AEZt6vVFj2x9TGQxhaysT/EtjU1B43bBixLrN8sRsgEfi5sJ/xvDAripjoH2QspPE00FYzrQeRI4gO/CgEEaxgZ8v51C0TcAvbO2wLkA2xBYXKjdTH97uT/gyAkuxaacxap5oby08bZEsECm21iZokaAS/2gshtka3AVhMuijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlggUH8e4VUcNt3Uv8qKFbeGCOPM86CBn/fRhuHNO+4=;
 b=S8Lei1dhRNkEaUqWytUGmOz62u4w0udn1ihf5eG8JXmC6PekZee+uf2ch/9Oc54CaP5J7IOkP10MoitcvHUgFAADdSkc55BJosHpbKTC0M9BqCNm4JBXTnIvfkmIntPlUGd937drk/dm1RVzr+O+FDMaFxO5Bo26/cqCFObs+9AL5vnM3DNjchju9kLFD2idJ9Hrm8RhmXKgrfmPbemhBpAb87K1m7C4qhKfG4D7t1weNBj6+qT/Q14GEC1n706mc2KvHMFDt+M0xQ66jcncG+cFow+oASJzzSd/99uLR1nvfun9anE330ZmEm2u+XhgHddDAYe+mvDDtflBoLtjxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlggUH8e4VUcNt3Uv8qKFbeGCOPM86CBn/fRhuHNO+4=;
 b=QI5EPliq+N5oOiA30fpydVqL35WVlap2TTYRc6+QDki+ziTEQCQ7fHvh5jy6vwNY0kVYAjPOZuImNx5khLQ0ZKVY35T2LVy/2YSN3NdWMgpcmeRRt4Fp/yYnZRlTThi4lPzvRGHctJUkKMp8k5vqcaXXmQNLPcZpX51N4U0gEbA=
Received: from PH0PR21MB3025.namprd21.prod.outlook.com (2603:10b6:510:d2::21)
 by DM4PR21MB3584.namprd21.prod.outlook.com (2603:10b6:8:a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.2; Mon, 22 Aug
 2022 19:05:04 +0000
Received: from PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::e848:505e:d1e3:97a0]) by PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::e848:505e:d1e3:97a0%7]) with mapi id 15.20.5588.002; Mon, 22 Aug 2022
 19:05:04 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: vkuznets <vkuznets@redhat.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v1 2/4] drm/hyperv: Don't forget to put PCI device when
 removing conflicting FB fails
Thread-Topic: [PATCH v1 2/4] drm/hyperv: Don't forget to put PCI device when
 removing conflicting FB fails
Thread-Index: AQHYsw5aa23T2mmDX0y2csq62S0MI627TK9g
Date: Mon, 22 Aug 2022 19:05:03 +0000
Message-ID: <PH0PR21MB3025F3C8768EB3ADE16E8B9AD7719@PH0PR21MB3025.namprd21.prod.outlook.com>
References: <20220818142508.402273-1-vkuznets@redhat.com>
 <20220818142508.402273-3-vkuznets@redhat.com>
In-Reply-To: <20220818142508.402273-3-vkuznets@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=724c5d43-efa5-4af9-80bd-8f6d2dfd3d4f;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-08-22T19:00:09Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87457473-9ea3-4ea9-5a31-08da8471386f
x-ms-traffictypediagnostic: DM4PR21MB3584:EE_
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U3YVAimfxGC4CVHGHpI7IIWDDslSlfmgevcoxCPhoX+COEBQ6H3+nFFMVZbqfUgE3alueMHsGONWU/aw1UNCf1x5NPWhOkFaox2YUsDQA1reOj5p2CTMReKRGqgEXn7CcbxKnr96BbiZrus23hjIh1oxX0zciwB1EEfZoH0g0kuuyZ9Zt0WmrZyjOj/HeITQh/am1eI1tt90ZKPQncAirprocbr5KW/qyGAVQyKMAo1vm76K3MZkzzrclZEoynV0Wyyb+/7k0tMFOoKgNDoI6dXQE9tc6ctj70ffihsMm/7apIo6+5wgNLn40PV1siR3SfRb/rPiwEfCayY6XDtpSF4hqmxbVW3nJa8WTZzsOqVKUBz/lBPawpD2465y9eAyhpVzyc63JgL2rUR+fOEmdwjNW2MmNPUUftqsuSjXwRTlslhrokaXpPiqFvTaf6r9iIO2OgQDRIw6lRldQMOVep5lPD9VFXsqx/lIOvQoYg+H3n5hndWtyhk+t+jQdfmOiW1Rmi9uaDJzrHit3DjcgDMogzuhIEMSFOwcunWi0cUu8A8sfrjT4z4p+bPsEK1La50Q7W/j4YkIsPvGVe3wJOCRcZwnhOiT/gwCIAcVkzLAdWi2n8EpXRvNMPEBD2mLhV4xoLFBz9TS8H7DrwvwyRPMGVLIeDIm1F12pPCBX3MR0i50mVGnWzPCX4K+EmRaU6tsOr+H7RVUbhzFRJtvNWn+j0pzkgdbIqOlNsj/pTiwSwLArR2uv+BkqOYWNDck6s0U84E2qEIq2cDDOF6G8PUvddKnVrJj5fTq4JwT7O9ougUTt/QGkABSd/x4DJZM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR21MB3025.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199009)(52536014)(64756008)(38100700002)(55016003)(66556008)(33656002)(66446008)(8676002)(76116006)(66476007)(4326008)(66946007)(5660300002)(2906002)(7696005)(41300700001)(478600001)(6506007)(8936002)(86362001)(9686003)(26005)(83380400001)(38070700005)(82950400001)(82960400001)(107886003)(8990500004)(186003)(10290500003)(316002)(54906003)(110136005)(71200400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HZLYUiDGX5X5iDNmAHb+TXO1B4WlGNr8RBaE4yiI98b4bTSMzqeyJcn8rFMs?=
 =?us-ascii?Q?cqJ5b8o2bYaCCIhLrgR/xX8cZNvTwkVWq+UJbT+96kppx3nb+hPbtErOs8MU?=
 =?us-ascii?Q?jrKjrO0iSUU531Z1FEn6GZrO42cMfGS/5lyAM1afHI8IVeBz8bLQCZwRXZeN?=
 =?us-ascii?Q?fz5jZYat1CmKpE/dxdTA0o6cpv3H6hHTyXnID4V6UiJDdN0Xq4qIi2WRYh9u?=
 =?us-ascii?Q?qfqof3BeGSG9u5RGwqRr5RhW+OW+IVwkJh+c21GtUXEorip5l4HTb/fOvUv9?=
 =?us-ascii?Q?uxqihbFRkDGXXll/OQYcb7j1f1HfsRsuwF1JVrrU3fDJ8LpO2oeIVGMzhZ/Z?=
 =?us-ascii?Q?yD+/9/MuMfOzwpUO4XPLrW+Zx8kseni0Z0qXgACs5dNt+z+nUOvrbOTQkHyh?=
 =?us-ascii?Q?vs2gdAPhj7nUlPZWJuWkxMDHinS/m1tr4ajh/eaGP3kDAOSPfYIL0ROAsQW1?=
 =?us-ascii?Q?kCY5tVQFiEj8JzSGmTNFE9oHehbPFu4CrL3wPuuT14yjzBoT0bZeX7Cnj0Kj?=
 =?us-ascii?Q?dJp57hLohV2q2XwKfyjnjogajJrLo5hM7b/NMQoi4qYpcFkgzcX0X2TbhcVC?=
 =?us-ascii?Q?WlkiwUvFcL9bCmYJXeHv6P6P2PZQ+uWPoF6JXoodJ82IlMvaRsT+MGx1aJue?=
 =?us-ascii?Q?jeFjgvhFPc4P/23iQuT1zKsfmu02zoOOUVCRPhbCkV+jfK6bn3yE0PofBW5Y?=
 =?us-ascii?Q?s8XSIFG1ZFhBFIPZUqJ8M/g38VRi1/vVFEHZh3ZjbN4ChXuIBpJ5NBHASaaA?=
 =?us-ascii?Q?vv0xivdxLAJonr+9XxNboaolNW4pIJeyaRLqbFWcPI1Lw8OzbvjaoufB958l?=
 =?us-ascii?Q?S52SBU66gOu79ErgaFWftTFbZNf9pu/ajl3ZJDERBGOdsylmd/qq1Bk3ra4S?=
 =?us-ascii?Q?WvPi4CllS94aTzv8HgjQYqAascy3RydRNalGnPBZ8y9i5SRm0kpG5mXSPF+G?=
 =?us-ascii?Q?+0lOysryvNsKOjkfb7sLCWnbNkay8VluPAvGnDmYpTQQ3BHjpK9LBU2UoPbc?=
 =?us-ascii?Q?yaB8ukiVfObpeRkfmoHN3oxyz4wP35veyTObhwk2KfKnr29GrvejJao/T27u?=
 =?us-ascii?Q?tuUxBTVjtKeflbnQuL6uXFs4rSLc/QR6d91D3ES0dr1H4CcL2XEJ0UgoT/Vw?=
 =?us-ascii?Q?IDE91oCKyP/m5qWCKWt/6ONRKh+XFo9M0XAaa2xWxivynLrevCQMQkk1d1XU?=
 =?us-ascii?Q?krrhTv0ntbO1/r0q5qtaE/NNjy7K8NZmz0ORNGSCySkzeimd/PthFoFjJNSa?=
 =?us-ascii?Q?Y1lmUjUJ6ihsPtxHaaxHwhdaAyWFqsFNkVY43pPF0C0LoJPK4LeW/yOiOeDF?=
 =?us-ascii?Q?Y9GspbaAAX023ewn2xPSqkMHnPMA2S1BKgYNJ6kknaXJdPozpYT4mCMnriwH?=
 =?us-ascii?Q?MJgNdE+B9IsjCKgtzCDi6tMu61rU17QVanUGEy4Z/943qndrj0Z0iYZTHCge?=
 =?us-ascii?Q?MdrO/PBBmADxu2os7pukfwoLjYHKvh3COFExq8Tf3Y6d87VpC5U5/bUHkrT1?=
 =?us-ascii?Q?keoeMuCZrdQ/ilLJbym5lUdSBh2tsuEOA4BtN5qysk5lhsrAsmV0YzwL3wYa?=
 =?us-ascii?Q?uWA9ReuniDcafWHshejq6XsH6hhpow/TYyK0jyri05d8k5Z+ivscVrjvOef5?=
 =?us-ascii?Q?4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR21MB3584
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Deepak Rawat <drawat.floss@gmail.com>, KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com> Sent: Thursday, August 18, 202=
2 7:25 AM
>=20
> When drm_aperture_remove_conflicting_pci_framebuffers() fails, 'pdev'
> needs to be released with pci_dev_put().
>=20
> Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic vid=
eo device")
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index 46f6c454b820..ca4e517b95ca 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -82,7 +82,7 @@ static int hyperv_setup_gen1(struct hyperv_drm_device *=
hv)
>  	ret =3D drm_aperture_remove_conflicting_pci_framebuffers(pdev,
> &hyperv_driver);
>  	if (ret) {
>  		drm_err(dev, "Not able to remove boot fb\n");
> -		return ret;
> +		goto error;
>  	}
>=20
>  	if (pci_request_region(pdev, 0, DRIVER_NAME) !=3D 0)
> --
> 2.37.1

This patch appears to be obsoleted by commit a0ab5abced55
that was merged into 6.0-rc1.  Of course, it does beg the question of
why the original function hyperv_setup_gen2(), which is now renamed
to hyperv_setup_vram(), doesn't check the return value from
drm_aperture_remove_conflicting_framebuffers().


Michael

