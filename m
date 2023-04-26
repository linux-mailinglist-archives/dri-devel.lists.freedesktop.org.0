Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7446EF833
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 18:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F131610E13D;
	Wed, 26 Apr 2023 16:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F306010E13D;
 Wed, 26 Apr 2023 16:14:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2LpU44mW3jbDbKWXmst+oSSeI8XdYqwcVfLqrrwi1CZfkNVz3Ybiz8o5g3krQTnqiRRCwmP+fqycg8OJ3/YrvICnorz1NkEllAuErVlVAHO4A3Z8YMBLh3o0CWtwQqP+Ic13IFUS/t2TjbGkJPpwF+jvKVdMEVLzz7FOQ+gvxfdZsf5g5gmQrFzb9OpIs90iX69E0pVQsD5suaZQSCgOSID5F9wm6vo8KvApUoclPuaOFInb6+K5Gn5z/0+6mpDqveX6naQzY8ZzKyjxIon0kV+xW0W83J6AVMSp98f2CqwcYdJltaKNqVfmH4aTXVnDpED/GU6TavUDQzc5hudUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2ZhrkGEUqXIKlCGCMHjsCQz/pWfu7Iv23kWA1rzzNI=;
 b=i4OrVOXYmX09ulw18HYlt0u+5WOu9LvMwXLCiTa2RruAU0fs1+JN7kUFvlFlLGfdn3uvJRgpwy5xf31FjK5fkEbohpGTzRDb63+/Ycf2Up/KFLEloEYHEKEQGsFt38vZdEImp+41mPhC7lr4D2ea+pNpK2JX4p4/UrR9vAtiVtoLt76lFT9sae9KR93Tdql6PObX0mInkdwjvtSLAoRlXWJXgvk849iSTUv7NcQ6WYFZ2nO3stNfBIc0wwHWOP0qMMMLHeZqr3kEPIARRY9xztMdvk6r5K8RIu8JLLeZAKtYbJtWjNIGMDKQYiFmyIoje/Gd7mLenvRripwXawyUCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2ZhrkGEUqXIKlCGCMHjsCQz/pWfu7Iv23kWA1rzzNI=;
 b=k7ExxXdEWlPd7/04oLKb8sbisgRDXmEQlN+7UnMCxN5ScLfmD6n1zZh12GMWFBi07SKGH7yv9K1Ml3rIpoF26VUbxcZUZ3T0DplFlUKgdPzQR+VFPmdYiffaqsPEGYiNSfliprOVS4mEjzlp8QBIgw+44BeANV00PEMaN6DrsYw=
Received: from BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7)
 by IA1PR12MB8553.namprd12.prod.outlook.com (2603:10b6:208:44e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 16:14:50 +0000
Received: from BL3PR12MB6425.namprd12.prod.outlook.com
 ([fe80::7ca6:a548:58f8:e0c0]) by BL3PR12MB6425.namprd12.prod.outlook.com
 ([fe80::7ca6:a548:58f8:e0c0%2]) with mapi id 15.20.6319.022; Wed, 26 Apr 2023
 16:14:50 +0000
From: "Joshi, Mukul" <Mukul.Joshi@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] drm/amdgpu: Set GTT size equal to TTM mem limit
Thread-Topic: [PATCH 2/3] drm/amdgpu: Set GTT size equal to TTM mem limit
Thread-Index: AQHZd+HjzvCZznY7yE653sCoE13HEK89GNOAgACrmcA=
Date: Wed, 26 Apr 2023 16:14:50 +0000
Message-ID: <BL3PR12MB6425D59426C25953DF7F280BEE659@BL3PR12MB6425.namprd12.prod.outlook.com>
References: <20230426015251.551223-1-mukul.joshi@amd.com>
 <20230426015251.551223-2-mukul.joshi@amd.com>
 <DM5PR12MB2469C179F28C965E3BF96CAFF1659@DM5PR12MB2469.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB2469C179F28C965E3BF96CAFF1659@DM5PR12MB2469.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-04-26T16:14:49Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=78b1b09b-58e9-4eb6-ae82-0bb4a89a169f;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR12MB6425:EE_|IA1PR12MB8553:EE_
x-ms-office365-filtering-correlation-id: 48a4240e-190d-4827-c4e1-08db46715cf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 58mKcaYvPqkXnd45Ensh4Asb7oBtDd45KtaZ8fkGNGZkrGetXScjGpn4xZUOuWSPZ7qr9jb5zCqXcZvafJNDwSGzrCfE2dfib6Cx+SKnXDNQhaSt+woBo6CB9NA9D+ofiAb7uhTY9nI2YXDEmDQDjN9YNGkHQChAWAdTgeX+dXo1ZzYJfoZQuJYZhjYZOj6Pb9mJc2XRTLpIaVvcOTCFAL7IM3K0zPDboVI/uZTshF62SdLIqjzE8xxQ/G2pymegQLJEpNI34XaAxIRY+3UFhdvBWGIse1thBNyi1dExBq2439LM7j5HAhQZ2QW7QQ1yjjyIz4REEpCsSRoO7pNQTU/LsZhgb9NITT9KLOWI/2KyrIOALhbh7AeV6ziOTRJkvKRVgm0L7sLpoKv9yn3JEFxGTAivpMhvEUXt7qsNiwRVQ2kAAifShiYQQ1Cpj8E9L3PfYk59cbH/0qoasR2uasmlNQUUo2pDEyDZQ9tUb69HSIB/50ennM4mZxVp1XNh2bSBuW+KF5gJMD5iokaieaEjbR0/JDvnVZZnKfS0rBvXFWu5ytsVtKzxax8HOuTkLp3n+mWVTARgfYxLCn9JCjIf7QCgacz/kJjlXDStyxQW3x4+Bm0cI7Gw+X3jlic4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6425.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199021)(54906003)(110136005)(450100002)(186003)(26005)(478600001)(38070700005)(86362001)(33656002)(83380400001)(2906002)(316002)(9686003)(53546011)(71200400001)(6506007)(7696005)(4326008)(38100700002)(122000001)(55016003)(8676002)(8936002)(76116006)(41300700001)(66476007)(66946007)(66556008)(66446008)(64756008)(5660300002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xpcrm25HquyHTDqRWx7hnUwdbgW/SsUw2ZqMHw/svfCpnKoNcQhWIZRtRhZW?=
 =?us-ascii?Q?7lC07WcJnPp7vUt2tINHaiPrMbTAkEMfkATXq25QZ2CjdpzdqeUqaGhsOQNI?=
 =?us-ascii?Q?dqLNL7KXg1SCMniW7qQtF2NZ6yepPh9ot1DwiegxPLyKUo/dbJFX8KqgYQWS?=
 =?us-ascii?Q?edSaG2rUX58JfHUjPbL8S4U5c/fmKZaPiXN8DEseWSlJhjFuMhbqhJTyR6kQ?=
 =?us-ascii?Q?XbuvG4y3oaEUXDKqHLlInmRjzPFcvqKnZDTMDh24qxX9BitleHXiCL5dLCrP?=
 =?us-ascii?Q?fYWEQuMQ/76KlsGKCiEl6DZd12/ZZoWTEXp8yLdc9f4lkMNnI9sHHXvYaY4e?=
 =?us-ascii?Q?SF7EnqNMo3aJOqH8RZzHQaR191hT0+47nqNMaREe3Wr/01llKaJzZoLNUZKZ?=
 =?us-ascii?Q?/kWiXCUpye81rxb6BCJyCtLpdWXw8DpKTPPNaGhCPTZWU0jJDKZMaVPwDHxg?=
 =?us-ascii?Q?62RjTC82+M9D1WGuxBcT3e09Ng4t3Ul1OA4lJCuh8BdVzmMhtn/2/360nHGX?=
 =?us-ascii?Q?ekANuYymAgFCtteRQj/5pJX30uerV3s/UuVt8LVQ2/XKMJwXWQxd3XWNSMRl?=
 =?us-ascii?Q?sBORtqga1u37fUhcULEx028ABYy1TxK6TSg0CdL3uI0b5Gt8b3DnJiXjAfy+?=
 =?us-ascii?Q?/mPZRSZ8j9dOyvMop7IEA5JTeiSvJ7zcmBlvWZTjg3OSlmfrmsZTi/SyECZ+?=
 =?us-ascii?Q?+6i8uA6R9tTDT7nlUprA7dgH4D6lzVyUm6Vq6Gag16coXe8jglVMd03BMJsW?=
 =?us-ascii?Q?J5H8XWDMd7OVPX352nmPKYyxexd8+2XHpZ1Ir6x/icPEqIQZj1qbUDF1bh8+?=
 =?us-ascii?Q?VSiyYQFRQvbnOA4r09ogG4sd6vNuNTWkN7TClYeVAYtEMy4EdGiBr/FgtBC0?=
 =?us-ascii?Q?j0t0IS+q46zx62OsKsBcAftrLUtnlP/OBZwrKVwg8S8HMWLBMSnQmWSFeoRH?=
 =?us-ascii?Q?B2RFRnUuyl6Fsmc/wOK6tkr+hws8cd9X3jdSbnBuhIReHG56tlbshWH6rsKq?=
 =?us-ascii?Q?X3zrOBkjy92RX+F7dWTkeEXmOCDFOBd0QWXZg6NFnmCqMVtp5mG4xA70l+65?=
 =?us-ascii?Q?9gBQOpDh5Msk97iZuijZjmb5w+c81ENrawINNBcpi4XftS55/MfycbBRMUTd?=
 =?us-ascii?Q?7J6kjbHqMabH2dhI1pzibyO1NMrXt2gIAXdKv8I+f/eNJFVI5jaAHTHzzblg?=
 =?us-ascii?Q?ugrV+knJwuOqDDk7CPgSIhvBgsZ6DXbJduspJoAoWkiNT3Osbchim1Lvt80x?=
 =?us-ascii?Q?ilGYc7Pz1xV45y4d/XqvI/oTw5pSmq4xN1Q/3R3Wg/0R+/prPMB526IUW7AK?=
 =?us-ascii?Q?/4A3GceruNRyjegCddd4S/zTuHqsZ/CvuP8QaQPkUWXHAfOOhwzlWrIYV+lZ?=
 =?us-ascii?Q?osK97fs0UH7/iLaPDq8Pc3d6kDqsD44LK7+93mUwRmDHsLzN+CKngfa2EwVS?=
 =?us-ascii?Q?aOdP7Zli8tYZ9KrWUvo3+MuKHKPuwUXSiU5JX2OAtAYX9WokFOUKJx7Kr0UV?=
 =?us-ascii?Q?X6JnXVOWXxa/H6U3wfK+lSsZl8kHpUXMKebUVYIShLcMGOo6/oBF3++NvJBs?=
 =?us-ascii?Q?cRJpa/8k/ifRWvcklhQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6425.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a4240e-190d-4827-c4e1-08db46715cf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 16:14:50.7855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MjPv9Gbtcsv4y4E2wqMD4G8UzgxKxGQFYtvyoDpaPo9PlECEZLmGlHIVWeVXWwiclCRYdkPzgV8SsYgJIO301Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8553
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]



> -----Original Message-----
> From: Chen, Guchun <Guchun.Chen@amd.com>
> Sent: Wednesday, April 26, 2023 2:00 AM
> To: Joshi, Mukul <Mukul.Joshi@amd.com>; amd-gfx@lists.freedesktop.org;
> dri-devel@lists.freedesktop.org
> Cc: Joshi, Mukul <Mukul.Joshi@amd.com>; Kuehling, Felix
> <Felix.Kuehling@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: RE: [PATCH 2/3] drm/amdgpu: Set GTT size equal to TTM mem limit
>=20
> Looks you can drop macro 'AMDGPU_DEFAULT_GTT_SIZE_MB' as well.
>=20
Thanks for catching this. Sorry I missed it. I will remove and send a v2.

Regards,
Mukul
> Regards,
> Guchun
>=20
> > -----Original Message-----
> > From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Mukul Joshi
> > Sent: Wednesday, April 26, 2023 9:53 AM
> > To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Cc: Joshi, Mukul <Mukul.Joshi@amd.com>; Kuehling, Felix
> > <Felix.Kuehling@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>
> > Subject: [PATCH 2/3] drm/amdgpu: Set GTT size equal to TTM mem limit
> >
> > Use the helper function in TTM to get TTM mem limit and set GTT size
> > to be equal to TTL mem limit.
> >
> > Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 25
> > ++++++-------------------
> >  1 file changed, 6 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > index ce34b73d05bc..ac220c779fc8 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -1807,26 +1807,13 @@ int amdgpu_ttm_init(struct amdgpu_device
> > *adev)
> >  	DRM_INFO("amdgpu: %uM of VRAM memory ready\n",
> >  		 (unsigned) (adev->gmc.real_vram_size / (1024 * 1024)));
> >
> > -	/* Compute GTT size, either based on 1/2 the size of RAM size
> > -	 * or whatever the user passed on module init */
> > -	if (amdgpu_gtt_size =3D=3D -1) {
> > -		struct sysinfo si;
> > -
> > -		si_meminfo(&si);
> > -		/* Certain GL unit tests for large textures can cause problems
> > -		 * with the OOM killer since there is no way to link this
> > memory
> > -		 * to a process.  This was originally mitigated (but not
> > necessarily
> > -		 * eliminated) by limiting the GTT size.  The problem is this
> > limit
> > -		 * is often too low for many modern games so just make the
> > limit 1/2
> > -		 * of system memory which aligns with TTM. The OOM
> > accounting needs
> > -		 * to be addressed, but we shouldn't prevent common 3D
> > applications
> > -		 * from being usable just to potentially mitigate that corner
> > case.
> > -		 */
> > -		gtt_size =3D max((AMDGPU_DEFAULT_GTT_SIZE_MB << 20),
> > -			       (u64)si.totalram * si.mem_unit / 2);
> > -	} else {
> > +	/* Compute GTT size, either based on TTM limit
> > +	 * or whatever the user passed on module init.
> > +	 */
> > +	if (amdgpu_gtt_size =3D=3D -1)
> > +		gtt_size =3D ttm_tt_pages_limit() << PAGE_SHIFT;
> > +	else
> >  		gtt_size =3D (uint64_t)amdgpu_gtt_size << 20;
> > -	}
> >
> >  	/* Initialize GTT memory pool */
> >  	r =3D amdgpu_gtt_mgr_init(adev, gtt_size);
> > --
> > 2.35.1
