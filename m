Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BFA6EEDE0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 07:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E8510E89A;
	Wed, 26 Apr 2023 05:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E91810E896;
 Wed, 26 Apr 2023 05:59:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlGFwyPM6ujS5LTWlhvhu6KUNFRrHCGmXwfGqAi+j5S9M2H/lrIrVqkzoU4PjlCwg70tr+yoSazTooAjc6lpdXCwPNuAzOpTCfCSKcfLYaoI5bt/lNonBxKlEdEJf2ET//+vFkRz/wZwic5ieqVlQPRDwEju2ne6vFs5rDekLNWAn6OQyM//QUTRd+dpIt3eTo4k57QITj2DmitEyfb+FcJT3DeyZp4tKICmGdWFCPMdpgNr/8bMi2ZwLPncL5iSQYZowc4sYIvqELM0l+ljSoOu2w6hNt0NyHw0tkCFrvO4edOQl9lEMPhT22MxL2YkZs9IHtaRaUHF0o8yjORFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8E7feUsWBkBkBZicUGrbldMjqx7ZfJhbkKrAqZLFuOQ=;
 b=hUo1x27fF4ZCdDyfDqVDeM3xgv4JEkTtHBZsQrDQcgjnP1EpIDHJ1nY7LdCVF17sqaZrMOGBfqIEr/A/8pw2g0HIr0bLjkF/haN9qeBssMpZr5yXjud+B+l2+h4wfx85ixHnqj7AQIyBjzTBxk/BMVFj8qVRp/PFO/jrYWZN5uvs9YoOVm8M2KRdjt5fz0syUUyVS2BWkogsGHUpUcJX2S6u/Fe9x0FXHeo1I0NlNHfsCzufURr6DJ0mpjyHvortcF8P/CJfXVwghdzNIUa3fI83HW9EOqnpedwZKUWT9gj17Q+RRmqAMCJ68YhoqRIs3XLQbaXpOVGNSS2ishME+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E7feUsWBkBkBZicUGrbldMjqx7ZfJhbkKrAqZLFuOQ=;
 b=N175o89xC2NCiYG4sbLc+I0GETlSnrRwQlTS0oM11xVJFiPUcn5Jz5sybgT7YIZjNd3vS3hpr7ocFH6t+bMdZGRg2EsEkpAByQhD7Z+2U/BfUxQ+EF+VBa0NlEJ5BzzZu21YyPIh3BTCooDg9LWDqXSgWA+JpaemqlEEK8BQIO4=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 PH7PR12MB8828.namprd12.prod.outlook.com (2603:10b6:510:26b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 05:59:44 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::c7b1:f457:da06:8bc8]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::c7b1:f457:da06:8bc8%3]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 05:59:43 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Joshi, Mukul" <Mukul.Joshi@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] drm/amdgpu: Set GTT size equal to TTM mem limit
Thread-Topic: [PATCH 2/3] drm/amdgpu: Set GTT size equal to TTM mem limit
Thread-Index: AQHZd+Hr5HgVjHAtSUyHclKdJfweo689GHJg
Date: Wed, 26 Apr 2023 05:59:43 +0000
Message-ID: <DM5PR12MB2469C179F28C965E3BF96CAFF1659@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20230426015251.551223-1-mukul.joshi@amd.com>
 <20230426015251.551223-2-mukul.joshi@amd.com>
In-Reply-To: <20230426015251.551223-2-mukul.joshi@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB2469:EE_|PH7PR12MB8828:EE_
x-ms-office365-filtering-correlation-id: d4726c3d-6869-4516-28da-08db461b6e81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: REYH1IVjM+/1D28IHys/oEw+eVcrm5828nglD11bCZnU+ZcSPfHebjERiP/537muR5rch8lPCMi762yrdnzhnkZ2qbV/b1WGkw0z9dRvl5ZLO1SjcbumJPFUvWW/BnflCOKoHwXeIsWkENIYHjjFZSxkxkz3wvrKEQlAxlV7CROHZiSRWJwAEdMycBfyzTv1xwXVTHSwn3jT+zkD1be/YVZc6bWxrJSVFrVuHdTYL1kAv52fEmmGYR663WlWShLSoJZCH6jcNZhrRKsArwLRPwW195JYzKGBeh25zpx+SSDBbby+KXEI9gVDyALG5bANnL6RTbSlMX49uh9ahpsKbbUEc4UKTBVegdut3VtmSABPx2haUpg2L7SZDvxPv3lT3kemzvdyV8u+ABiCXbWZhoxsOnDdM2hs1qtH7w2wVCCPayOv1es9TweQ/9tlgfYPEj0rlJeb9ZQyXL0pyXuRaRRDSTqYLVDFPjhzJy8c0Nel2CFuQ8nhPfzPIAGDbv3qGRRxLZrYx+2T/jKnvKMmMBsO1eCzsWiVUPmjBa+IuSS0Aq5L/gM/CNJcpJsTZ3UkCDwqkATJJvMR3SdQqSz4AB7PXnCGseruUaZ0zwE+4hOBLNKkY7z7X2hVlmqPoJDi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199021)(478600001)(110136005)(54906003)(86362001)(186003)(53546011)(26005)(9686003)(33656002)(55016003)(6506007)(71200400001)(4326008)(66556008)(316002)(66446008)(66476007)(64756008)(83380400001)(66946007)(76116006)(450100002)(2906002)(41300700001)(8676002)(122000001)(38100700002)(7696005)(38070700005)(5660300002)(8936002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pOJTTJiupvdTLjytCA1geMRkn5IBJIAPA9YaRZBh453/092sfWIdYsoYIylw?=
 =?us-ascii?Q?JPbZgIbxbw/bJEt7kMcFOqSgwDhfKFrKdO0u5aVS2VEVDOgkBVOkyknrzIq4?=
 =?us-ascii?Q?HlsUWor7lBgqweule7zc+XhVF58Has0KposP6fuqlh2Uo9/JMwNVwumirzSh?=
 =?us-ascii?Q?65NJQslY0HepJVO3sCbMw7CjcYQJYv1NHJ3o9MIpXKWlCb0k2iPIFguIcdfS?=
 =?us-ascii?Q?AaVyZdhgEsf4OOEGkAD/qy1ZwvK1M4/Qj5309RbrOhWoJJujMWhWGBi4PNb1?=
 =?us-ascii?Q?429KRRZTOEWwD4qR4rrGzawhUXri1/Iwf0DdMWCJtuUmgQByO5wrJ0z+b9Xl?=
 =?us-ascii?Q?zh1thgg4hcK/qccvvd0qQd4/MVVA0hBfepR+NeA6gyOlmlJnY2tKRlRT95SW?=
 =?us-ascii?Q?O3sjxTNBw7fGA5C8D+0CFXUyOPEU0FcorL+oRVM1LA6cfxzm0wVkjAOvoqLe?=
 =?us-ascii?Q?4XhQZj8LwDWab4cnG3ek3YeEAIIRn/CCupQvnuLaokPhIb1ifX8kEP3i0gQ7?=
 =?us-ascii?Q?DJ8OaN1mrXK/sHuiH7uHl/wzF3lDEnrl7L/71TWiMOdls3Rnsx7SCJ3ZH4yD?=
 =?us-ascii?Q?np2uifCs/Qb2Qu6T6W5seXiRElgKM/uRlP03jh1ziR7WVr05Ep8cihGUIjWH?=
 =?us-ascii?Q?Rb4+Vkohv7cDpcskIHah0+drG0TJkvK0sT7DtDY9IV/Uc04enJVGlL6czuYP?=
 =?us-ascii?Q?7i0R/a3fEwIjN1SQA9DvCmnDHJ6ngPDPUW+Vx5ZFbUPRTdl9+7S4FVDQI47s?=
 =?us-ascii?Q?RrsIh8n/V7b9yd/Ff+kfReYhabl0v0FYVHRPv/FJ5SKjEOEhqWbP5Ez9x3wW?=
 =?us-ascii?Q?1ZSv+fmyLg4hdH2+dfd/yyXP8v6k/affRlm7yRDCjFHZQRhZblAzEuNbfuzX?=
 =?us-ascii?Q?W0YMAyZvG7Z3C3akJg3wALXmOrulhiVl1lUplqQBj1ptMVunY+8bQnxfkc0P?=
 =?us-ascii?Q?6iFWociDXgicNUFKnqeTQM5HJdMUBkkUd2tyJrhoqRMlqmfl1zH3LO3TOHjH?=
 =?us-ascii?Q?myQnUhAOXmLJ/IrEFfVgJQIoXAqoov3nXzN78AvkgBmOhFRDMBZXXJjPKo/2?=
 =?us-ascii?Q?YU22H9cYgNisxsVhutROBErhbvosPDbjZUgMTxe8+yLH+XrxGei+A56m8hV6?=
 =?us-ascii?Q?qXGdjtYuR/TWDtM9Rsm6BQsaK4x7NP7NvzCMPEpSfE9d6209+W8ENZMh0znJ?=
 =?us-ascii?Q?NH8KXBD5ub/q5LY3lt/dVy/RW3S7v6lgKHYkgfS1KyCFuyVDm4CCsSg/zEcm?=
 =?us-ascii?Q?oCvXV+fAQW0GNWe91Oe4AgcVejVsO2KxAUapZMv9OSK/TJ1p7OvYF1iR8akC?=
 =?us-ascii?Q?EH5DPNqHJyn9grO4VYHRp618E0VhRuC/GKnCtY22DBF9IGPlcxzBe/UALSHv?=
 =?us-ascii?Q?Ol3co4fliCIjaS+pRf3ie8fNxUsyiT6efaPRSMb2QTcVBzqOElFpcdoYR1Mi?=
 =?us-ascii?Q?thGfnvBTgrpmsArjax3lpS/nq7JAkPJ+ckCefC1CLoQI5v6nb7FZngdY7Hn4?=
 =?us-ascii?Q?f9snDF0fuRklLrPR+2ecdDGSeI9bru8pjqSmOGVws8gZywsZPFtOTI11Okeo?=
 =?us-ascii?Q?PZeGK0Cc2uZvStZ457c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4726c3d-6869-4516-28da-08db461b6e81
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 05:59:43.4598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Yl0FbdJ3D6tjm8up34MaSlNKBcbdktMJXbc/4biKJoHOkjVMSkN71DiLp12733Zm7/gWsNE2lUlkwIW3kDqFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8828
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
Cc: "Joshi, Mukul" <Mukul.Joshi@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks you can drop macro 'AMDGPU_DEFAULT_GTT_SIZE_MB' as well.

Regards,
Guchun

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Mukul Joshi
> Sent: Wednesday, April 26, 2023 9:53 AM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Joshi, Mukul <Mukul.Joshi@amd.com>; Kuehling, Felix
> <Felix.Kuehling@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: [PATCH 2/3] drm/amdgpu: Set GTT size equal to TTM mem limit
>=20
> Use the helper function in TTM to get TTM mem limit and set GTT size to b=
e
> equal to TTL mem limit.
>=20
> Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 25 ++++++-------------------
>  1 file changed, 6 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index ce34b73d05bc..ac220c779fc8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1807,26 +1807,13 @@ int amdgpu_ttm_init(struct amdgpu_device
> *adev)
>  	DRM_INFO("amdgpu: %uM of VRAM memory ready\n",
>  		 (unsigned) (adev->gmc.real_vram_size / (1024 * 1024)));
>=20
> -	/* Compute GTT size, either based on 1/2 the size of RAM size
> -	 * or whatever the user passed on module init */
> -	if (amdgpu_gtt_size =3D=3D -1) {
> -		struct sysinfo si;
> -
> -		si_meminfo(&si);
> -		/* Certain GL unit tests for large textures can cause problems
> -		 * with the OOM killer since there is no way to link this
> memory
> -		 * to a process.  This was originally mitigated (but not
> necessarily
> -		 * eliminated) by limiting the GTT size.  The problem is this
> limit
> -		 * is often too low for many modern games so just make the
> limit 1/2
> -		 * of system memory which aligns with TTM. The OOM
> accounting needs
> -		 * to be addressed, but we shouldn't prevent common 3D
> applications
> -		 * from being usable just to potentially mitigate that corner
> case.
> -		 */
> -		gtt_size =3D max((AMDGPU_DEFAULT_GTT_SIZE_MB << 20),
> -			       (u64)si.totalram * si.mem_unit / 2);
> -	} else {
> +	/* Compute GTT size, either based on TTM limit
> +	 * or whatever the user passed on module init.
> +	 */
> +	if (amdgpu_gtt_size =3D=3D -1)
> +		gtt_size =3D ttm_tt_pages_limit() << PAGE_SHIFT;
> +	else
>  		gtt_size =3D (uint64_t)amdgpu_gtt_size << 20;
> -	}
>=20
>  	/* Initialize GTT memory pool */
>  	r =3D amdgpu_gtt_mgr_init(adev, gtt_size);
> --
> 2.35.1

