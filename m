Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C65F96DE638
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 23:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED4810E675;
	Tue, 11 Apr 2023 21:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A5710E673;
 Tue, 11 Apr 2023 21:11:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXcCk+S3m0KOZE3Fv3B5wEI15fKPMzOUiNefbDRpzsJAKKcdNtDNPNfj6Ygi8sarnhRtkOI5lJKvpc340LNfDAsaINP8YLX+zcCPBZRyLf0tBAkQLG0wEGZIZbbBqOWcfZMhFJFs54d/6+olCcgAKk06u2MSAOMJEHoPHvBMZBnZMZxw+3jr1Ngc4EwiC6Igm5Sx1sdmQsP6niLoKFktU7AbrbdgsLrOmsXcO9IrHHk6HZDRjtwa2+pfEnoQz2k8LFA+t+J3bnmxeXdNpCcF2SXhZrsvX1BGwSDVVKMzVVLRz1yjlQZkH4dIxlPKuoP1qP0ZwUFW611PGwMBHqy7/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTwJZvJd/POIa5qMYAywSt/CoeSIRyELZbSi0PYNBGs=;
 b=Ywo0etQ5NNqu4A1Q1wFeGhnHOQyTzY80ghcxz6D8OReWFBjxHmtE4oAsXJAz1d30AobirvL1V5vjnhLsD2iMMZxG6roVxdwRoTquS43P6BfIgl8pxP9YKXMGvpTAmt0P8yOBIHuI1gV1FRcYFGASKHW6GlWsVytTQg28JCFoNcCLwMhBIyGk/GcbPwVfhmjj+zW6ZDf3++llY4VfOXJLzZbv4e6l9qSVzRu+9F/66hJC6JMgeMKNi6Vis8wtWARG7O5fhoSWUFwLqTf5iqXg5RQ5gTA8m4sk/nPdirGh5f024hJksvuZtY57qoNFshIv8oQ/2aJIW5pNOH8f2vkRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTwJZvJd/POIa5qMYAywSt/CoeSIRyELZbSi0PYNBGs=;
 b=Ryj7/3xBSlMkZyumcaJwlv/WqhhTX4XTqDNTlxNBUNDLbsMEqxWo2JE/BoPTprk6YijkgVXh92bmOoiSpANHGIUlfQM0IkYDlMqNJGf1mZJofd6GYMqaEXOO+6ian9A6a0zPHAFODcftiIJbAAe+MIE/QQ+dnMPBNZmbBzNOjuU=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CH2PR12MB4056.namprd12.prod.outlook.com (2603:10b6:610:a5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.33; Tue, 11 Apr
 2023 21:11:17 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::34de:5470:103b:594b]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::34de:5470:103b:594b%6]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 21:11:16 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Subject: RE: [PATCH] radeon: avoid double free in ci_dpm_init()
Thread-Topic: [PATCH] radeon: avoid double free in ci_dpm_init()
Thread-Index: AQHZZloezoDmDcU/3E6bPWpOEdBWkq8mp1yg
Date: Tue, 11 Apr 2023 21:11:16 +0000
Message-ID: <BL1PR12MB51446866BAE5945297315399F79A9@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20230403182808.8699-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20230403182808.8699-1-n.zhandarovich@fintech.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-04-11T21:11:15Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=06a776f3-ad00-48ac-88e2-12826d5b7364;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-04-11T21:11:15Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 6100d905-4478-4258-8335-5b0f4186cc67
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|CH2PR12MB4056:EE_
x-ms-office365-filtering-correlation-id: bc8b8ac8-4228-40f8-f329-08db3ad149e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W2iRPRIBkduU8sds1UXqjSX5taVg5dkkZJTHv2ONfffqpB28YmhOPoWlM83LXq9EqqGa5hFpUMcC2ceyXObGz26nZXM2GS6DhdsiwdD+4gG2nbWppMt7ZyMd4qRKc5GvgblqcEtT7QwWE2PheF5sYcEF2j7EDUpWueQuBuHtm9MVmLdw/0FDd42GhdRAEwOwkhT7NT731sKe5VO1WoD2SBbJvphisLuZZVu/3JXpF86G0ZJJlJBVzM/0omwBZIgJRJ1G1lHuUXf50baj7K7ocot0H+Qe40oA1WsMYPMlTzshGhLDfp8IYnP/rGZ9yAcDP/BtLl4oA9kCTrCe7nqfU4EsfUBHxLGknbElNdlOBc9P9Wg4oE17xZwcRax/AF6zXjouwGeVImDR/JGQLxq0PkWxU0jndBj3aBDVR5HIZJpFc2SrKR38U5BkTsHvEnnbnAEopb3JCy4B9ajqzCtr9AwWjx8mtKduL6WSl3yf4+O4rJHpVcg81XGAO2/CYPSOboWM0DtWp16wDQAjBUTXYEFqhAnGc05+xJgpYcAD6FxiIYaFRhz3ZC9EQlRhzD7PX+damhjBifn5X/0INJP6eMsAKNHOB0nElZlh4Ecb7hW7//WI2W5i1zDGuvCuYSPX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199021)(316002)(55016003)(122000001)(41300700001)(8936002)(52536014)(71200400001)(38100700002)(33656002)(7696005)(86362001)(186003)(38070700005)(54906003)(9686003)(2906002)(5660300002)(26005)(6506007)(53546011)(66946007)(76116006)(478600001)(64756008)(6916009)(66446008)(4326008)(8676002)(66476007)(83380400001)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iLrXuXcce/CZRRxkhbdJjKA5pXQzykWIPZQQiA7FtWxh54Se1CRYT7nLZY+i?=
 =?us-ascii?Q?I0d1IiGk+DOJCHsoJIcsWemQN3/AyQCG41u2HXrz/zF2lhylXedET/PjpJLd?=
 =?us-ascii?Q?fmm1zHDXJlMeTRK+Im/6jKyIS0z6xf8BnE7Lps4X2wMktMJFn8S5CLfINdwF?=
 =?us-ascii?Q?WZZYpVBVx8n/jc/Z9CuvY7mKKM7sBtp8BxsT6H1+Tc4dzrkc6JbcYWzNOZ2q?=
 =?us-ascii?Q?bn5RTHR3VJN3x5yv/GsSpo1IlW82h4ZdqwFj/VACPwA4AoYFijCtuYZkeqn/?=
 =?us-ascii?Q?8FCttlqqv771JKPYW2RvPpEpMgFb/C5kkKSgyi2mb29ejq8uQlHwXtURUw5o?=
 =?us-ascii?Q?k3/WFX0MHb5uFXuSZJ/DNlCCs3P/ogZfGGEkjf3MryjhPF6Fyk65s1DMiBbP?=
 =?us-ascii?Q?EOWKf95HIkPwrvNep3Z2wJ2+KXkzP5Fczvp7kgm+VCyNB7Y9XcCWpgwLof+w?=
 =?us-ascii?Q?c34rGg6Tb5CrVbySFqr9P8GSPAHoYJGMy8d9XuPltOEl8ZpEGCNyys0MjBhK?=
 =?us-ascii?Q?G0xAFeVEA6e6g4XQXoC3ATT/kUyZ4/LCDHHnmd5PMDfIejTB6pBxm6aqED3k?=
 =?us-ascii?Q?zloEXXpEKzDoKRDGq2odix4tAmGoKjWReQ5so337l2UOdc1nLBrHisWEjKJF?=
 =?us-ascii?Q?b25ufKizY/6hOMXkjhPBhVl/6pxbLSwNxipXbmMSoLaNDkp9erH9rAP58u53?=
 =?us-ascii?Q?30tipz3hhnoqyiiBALuLiSBNmDNH9NJ8he8KhTVhE5+Hpov09whjJKzm1tVJ?=
 =?us-ascii?Q?yP1iUt0Yvb+/yZzMwbk8dfwlHAYsDPiCPFTArk5sfL/XwrK+49aXi50L9ENo?=
 =?us-ascii?Q?2lt+aoLiUeDKnOKyZIeVWOTpmRq7mn6LB8HqrUYv0kO6aciGnqh9KXa6EuVh?=
 =?us-ascii?Q?hNLo86OUYAf74ztvWJWBkrll2zq/lg5nIc5DcdcFzIu9xAMfbVmNcDTQkk2f?=
 =?us-ascii?Q?uIdfoB4OcogxxWOJYbQVPNFhkG/iZo+Kc79sqsYPZPbjRu677Eml0N/3iFvU?=
 =?us-ascii?Q?Tur2nHDf6BitwujyMMdj77ei/cuf5qv0IfIT60b+JEP9Wt4VzaPDi1SFeKqk?=
 =?us-ascii?Q?7dax5iBfKZE19JabOnc2PFM9fRPqPieG8GHtHdVeVyDFkLIGmk3+RdO8eO5V?=
 =?us-ascii?Q?1Z8XTYczult1Rujs8luuq006LEzmw62bNDej4NQ/JqbRgVaLLNaUSUiYEQJv?=
 =?us-ascii?Q?Y9yDDBU8fqmKCxZwyuTuelgYDtBl5smdbVBkw0yRNss0QKx7rgRXihWybFNy?=
 =?us-ascii?Q?EUdHAc8YumKHD3JMEQJJ4LzXg4RY9DW69+VNFXppm1Y7AWaECYyMyDkdzZ4Q?=
 =?us-ascii?Q?lxDcDOi2FRsvqv4Je4y38JwDXskLbtRpZoWmGph13tJsQttt01i/6dNSClP3?=
 =?us-ascii?Q?FD29S/4+3iJtQFbzYRp7FirVe1UOTT96XD4R55D9vumFUnQlREDfXt/43Mu7?=
 =?us-ascii?Q?6+61XPc3F3aDT/gneNxYsVNuTutQMUe0lpajwmo19rTi1rnnUGIMXt6BDT2h?=
 =?us-ascii?Q?DKHyblvnkv8zWAbw9BwMUixl5WbRGFSzUI38xz11f8YJhTrdrK2NLKZxSO25?=
 =?us-ascii?Q?pwXaCdj+xFHZHRmGIzg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8b8ac8-4228-40f8-f329-08db3ad149e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 21:11:16.5076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ma/YTKXDYVZAS5TrztcsMtaIhqYVbZTl4qn4eHZVBuG9OxXZdeSm8gK8qjp5r7iilpsD7FQiA+jqVbfafcjmug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4056
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
Cc: "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> Sent: Monday, April 3, 2023 2:28 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>
> Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org; lvc-project@linuxtesting.org
> Subject: [PATCH] radeon: avoid double free in ci_dpm_init()
>=20
> There are several calls to ci_dpm_fini() in ci_dpm_init() when there occu=
r
> errors in functions like r600_parse_extended_power_table().
> This is harmful as it can lead to double free situations: for instance,
> r600_parse_extended_power_table() will call for
> r600_free_extended_power_table() as will ci_dpm_fini(), both of which wil=
l
> try to free resources.
> Other drivers do not call *_dpm_fini functions from their respective
> *_dpm_init calls - neither should cpm_dpm_init().
>=20
> Fix this by removing extra calls to ci_dpm_fini().

You can't just drop the calls to fini().  You'll need to properly unwind to=
 avoid leaking memory.

Alex

>=20
> Found by Linux Verification Center (linuxtesting.org) with static analysi=
s tool
> SVACE.
>=20
> Fixes: cc8dbbb4f62a ("drm/radeon: add dpm support for CI dGPUs (v2)")
> Cc: stable@vger.kernel.org
> Co-developed-by: Natalia Petrova <n.petrova@fintech.ru>
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>=20
> ---
>  drivers/gpu/drm/radeon/ci_dpm.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/radeon/ci_dpm.c
> b/drivers/gpu/drm/radeon/ci_dpm.c index 8ef25ab305ae..7b77d4c93f1d
> 100644
> --- a/drivers/gpu/drm/radeon/ci_dpm.c
> +++ b/drivers/gpu/drm/radeon/ci_dpm.c
> @@ -5677,28 +5677,20 @@ int ci_dpm_init(struct radeon_device *rdev)
>  	pi->pcie_lane_powersaving.min =3D 16;
>=20
>  	ret =3D ci_get_vbios_boot_values(rdev, &pi->vbios_boot_state);
> -	if (ret) {
> -		ci_dpm_fini(rdev);
> +	if (ret)
>  		return ret;
> -	}
>=20
>  	ret =3D r600_get_platform_caps(rdev);
> -	if (ret) {
> -		ci_dpm_fini(rdev);
> +	if (ret)
>  		return ret;
> -	}
>=20
>  	ret =3D r600_parse_extended_power_table(rdev);
> -	if (ret) {
> -		ci_dpm_fini(rdev);
> +	if (ret)
>  		return ret;
> -	}
>=20
>  	ret =3D ci_parse_power_table(rdev);
> -	if (ret) {
> -		ci_dpm_fini(rdev);
> +	if (ret)
>  		return ret;
> -	}
>=20
>  	pi->dll_default_on =3D false;
>  	pi->sram_end =3D SMC_RAM_END;
> @@ -5749,10 +5741,8 @@ int ci_dpm_init(struct radeon_device *rdev)
>  		kcalloc(4,
>  			sizeof(struct
> radeon_clock_voltage_dependency_entry),
>  			GFP_KERNEL);
> -	if (!rdev-
> >pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries) {
> -		ci_dpm_fini(rdev);
> +	if (!rdev-
> >pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries)
>  		return -ENOMEM;
> -	}
>  	rdev->pm.dpm.dyn_state.vddc_dependency_on_dispclk.count =3D 4;
>  	rdev-
> >pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries[0].clk =3D 0;
>  	rdev-
> >pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries[0].v =3D 0;
