Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38518602024
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 03:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989B410E029;
	Tue, 18 Oct 2022 01:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583A010E045;
 Tue, 18 Oct 2022 01:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8UQGpK+fIYSaGSQ/oxRZpZ8xSYSJZlMcIf7L39eMhmCFjg1ZKxPJF1BdR+2Kan+nvq5YyQKk7GhxtO4DwqAjoK8HWaikn2+V48Dx/sp1JVzUmsn7Miwa/cZtJc9y8uFhBmwbo/9/Y4Fxg6j8ISf9V+rbn+Gw+6RgNP/ybsq4Q/pegXlnhJxp6Uy3pLp3XKWLW34AReMuHXL4KIr6GdlBvm4opLsT3WxVr0DkfFbgWadNmS18E8prtMarTmJ3xcMyjtXcOwRn92sfYaBc8jXjCZLVvf5EmPrx9IlnAghgkgdVHhMPRfxUO/t/LPOgfeqQW9qDjQGYh8OrmLL0oTpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCjvU5vK8nByf1DbfeZ/qc4PMFmTe0ZFlP/5DKc6V1A=;
 b=i8PxuSx2clvj2W50RE4L4/t1abXPo7brB26yZ6tgZ32d83UXQe88G9Fr1CV9ljkkSmz46q37EiTUAvsHKfga5D8zAekSsltPp3DEuDhPYNJ5jl2M6q338KSvfDZqgWZ/ETDaiGAMrIdxr7tbRLq7dDgkTcz5gUEMAg9JBfpA9epXvfX/UUQ65KZPqXDjaVHJxYPpoZNN7YZ1vvCti+/21yg4cFzCDvqDJMbC7/7W0mbs5nCL1cawnWiN4itO2bTsc6ms5+NwvDfIUyA5FYDrcsiYzsWBofDCBhhGQxRtZVx5eMhtBvHKWco863wpnmOlPDeWRpV8tF9/SOt6nJtR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCjvU5vK8nByf1DbfeZ/qc4PMFmTe0ZFlP/5DKc6V1A=;
 b=GU94ySzj1K4svg4HjW+UqO66MLc5nj3sM7vFAtdHcH4uw//2wuukWsYuX0l/QfMHrjQIkC+44S2gpbngic0OLeUGvcNf5dWf2/BdB3X3zGQe0kMI29Bjeq9bKHrJ2r4LzYHQm3WU/V7g46xyCNOck6rTpw5ZRtc1aeUcT9NmknY=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 MW3PR12MB4585.namprd12.prod.outlook.com (2603:10b6:303:54::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32; Tue, 18 Oct 2022 01:06:51 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::5bec:8c52:5bb9:3f0e]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::5bec:8c52:5bb9:3f0e%7]) with mapi id 15.20.5723.026; Tue, 18 Oct 2022
 01:06:51 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Rafael Mendonca <rafaelmendsr@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH] drm/amdgpu/powerplay/psm: Fix memory leak in power state
 init
Thread-Topic: [PATCH] drm/amdgpu/powerplay/psm: Fix memory leak in power state
 init
Thread-Index: AQHY4owqBZzRMiaEAUqHgfokFan31a4TVoFg
Date: Tue, 18 Oct 2022 01:06:51 +0000
Message-ID: <DM6PR12MB261914D4B306F738E6CA9B27E4289@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20221018005357.887009-1-rafaelmendsr@gmail.com>
In-Reply-To: <20221018005357.887009-1-rafaelmendsr@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-10-18T01:06:48Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=abd31a9b-7c0c-4e33-99c9-98e80f7e2d91;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|MW3PR12MB4585:EE_
x-ms-office365-filtering-correlation-id: 62219fa6-11e1-4b22-7c5d-08dab0a50a41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qVZY5OY17iDOxQ/1CGMEJJ6Xr2OQ5QbET3uyfigSbEc+7LOAuHTsh5oEI7c4N+O+U+fEB7p9oL8T4jm1EqdmzBH3Co6MSE605+hnuf+8ZciEf0uX2GoWhQ9d21O6iPdXX71CDsQjQ+zwyeqQ3VkFODyLyj52wQVGLKWmFvG18XRpHwbJRlfU9HuLO7XUDr6/YX446XK0/tphTZf4OOFjUWGD05FU1ZEu5af2cGS2ge87e3clAypuGC9ZGhDLnJVtVLePG8ysVXvwQBi3r3EMGdQKzFs/hObhhISqmq2nrFRK5+uRSy7ydtQCOmU/okw5HsnWsWDo7s/uzh9ylQtst3mjc8NEVIFA8g6gt3exDhfwZW8FOrVl78DzD1HIgeNLdu8ShwHTMKpWweh7brthb/0h3HZDWTP6KCY8H4RCgA88IvUiHPmW3bjAKuP3qjOB7gufpWX5F8O2w/ZMrcOn/E/7eKBrqPsbrOm3DCNkW6eJW0tAz2CNz2DlPn1M2RMW1osU1eVOwa8UZ4ZYV6UGrMiCelzJIc0tF8BmnkBj/mTKsEuCyceGusp8l8jrVU53lCSLVzGDa2MeiIH3Pi/vN9kDlQCZjP1ySBxkTvfsOo2qkKifyd/g/Wzvngqu3UguCMRglVbne+4QKAxM62gZvWUsnjNPLCMIv4wJL00gNksC27sUAUEmi2E7b0m264056XRo8hrgxFpWI3T03oMLGITxTud00y2pnwXaEn3VQGzV4iawfiQ8+6UdWotsmsV/09xGYD6NQNW079k0bt/Dwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199015)(38100700002)(8936002)(52536014)(5660300002)(122000001)(4326008)(64756008)(33656002)(53546011)(9686003)(7696005)(6506007)(55016003)(8676002)(66946007)(66476007)(66556008)(83380400001)(66446008)(76116006)(316002)(110136005)(54906003)(41300700001)(71200400001)(26005)(478600001)(86362001)(2906002)(186003)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2qVTa0lMX/UsdAJiBfA0SpqaHz4kEQ96p185F+tShWIZm+ZRcd49QqLS+oX/?=
 =?us-ascii?Q?r2Hx7AhJY02vxSStQSqVslL1uFwjTuNJSNuoN/McbuMDAg9306f8BVwGHp+7?=
 =?us-ascii?Q?kIkpC0DwtEvLf/Byozxtjnlpek2HHvUbhUYbY97HzBJyPzfDc4fAp0EikpNt?=
 =?us-ascii?Q?f69XZ5NwLhsUw3y2d3aIrXT+MmLqnpCG4OFYYCrByCvRT46mH/hytBn0uXne?=
 =?us-ascii?Q?Pc4sMy45uwqjpWS+tvroEMIs9L2tjC2+wAxXC1vRZlNkVqNtu37+Jl6n2PNC?=
 =?us-ascii?Q?Rfcsa5PSsLhB2k1JfkKccVweBx+tWWu/6Icl+ZhD+DpG5wBP7gxKA+OlFm3e?=
 =?us-ascii?Q?KaGXnlWXnHLUQqI+2paHg8GZog4hORkuq+0RwnSrAZkCAAoD10J6HmWc3RoB?=
 =?us-ascii?Q?o3rSW7I/Mxsh/wNoMHnVAuOBybyIuGHVOTVAR02YuA/3PhBq16d8WmuXRbyg?=
 =?us-ascii?Q?1eJfiBEFILku+fpFokd4JUkIdikmsbjH0em2xNZfsy7Hzk0I4HaK9j2zdTPm?=
 =?us-ascii?Q?CzJoRl/A1KIvS1Fk7ItiRvdgQf1R6CzZe2F8vpXMdoxkHNuCCEBp4ZRcPaED?=
 =?us-ascii?Q?mATm6INwZiw20bnbYFP6kFq0e9Iaoq6ATfs+Zp8hQYPvAJptP3j7gyZIWLlo?=
 =?us-ascii?Q?Fd8p52cH8OKSCkLgAOotGQjCz8pGwf4i930lxynqvlg6ofaHqPAh1Ud+HgD4?=
 =?us-ascii?Q?c8wZ3znV3J2Cv9Yl9UD3iKM+jVK5BQuR9BryG0lUQ2+mDYmSPMhygpYft4e5?=
 =?us-ascii?Q?VWtVh/+uc06I4N8n5TzqGfhrsA757nDk68xDnISBkU+qEIPKlwLuXGamS9ZD?=
 =?us-ascii?Q?lZwxApSxrgty3eqUiLI3S4yGjFpPaS5MrY13Egvsngf4miNbfm10j3T5QXJr?=
 =?us-ascii?Q?v/Csbeslw6Icl+eBYmvZfbku2AwXRXescS1b6nM40+9lhusL2Kv0JQ9ObbB5?=
 =?us-ascii?Q?csppcLqmmqbcxCFm7bNwsrwVAHc4kBF2Ju/DfGYp/b14rtz6OE+uURQwwEsf?=
 =?us-ascii?Q?T7f1Bg1HHG8Ojg265NxGNPH5rYSMrZQxNwUDNrJ5hvitTL9TEkCgPl0lk27T?=
 =?us-ascii?Q?aXdBp4LtN3aIbwExudqXZ2Ab49sNopApKQqNLG80M0KNnxite9clqcDzemi8?=
 =?us-ascii?Q?3UHrC0slQbdInaeoqfnDS4LkK2qq16sMAhoFr+dfhHV0nHce0NDwf7r1mUHy?=
 =?us-ascii?Q?1Z1H5i2h5XdjFOjqSDBMyJhGlXekPCeU7J8KiDkGf3g4T1WXDUrItkI9N0x6?=
 =?us-ascii?Q?JAofLa/wHi6wADJPftCWZdJ0vuZ6AYgNgBK+wKgx/Je4jozMg99mlszTB9ff?=
 =?us-ascii?Q?iFXoS6xBSwXkL8oibs5Oz7skPgEB63DQP3dRSFQ6qR5NfrbnBjpl3N3YfGpK?=
 =?us-ascii?Q?8ZgDhPTeS0cRthN5TkClLsG7fCTUxNgF5yqdLDQG94BBECTA5AhIE4zSR9XR?=
 =?us-ascii?Q?plK++pQKTucRXLO+El9g+D9PkiU7vDxaqcZ5/qse/rNe3fnY88r5SeKqk629?=
 =?us-ascii?Q?YltbLZ6wE2XN4LfEbjDYPuW44MXJLJB2miMPRH3bXGSFTz7NcwQmya2Y+pJO?=
 =?us-ascii?Q?X9aOGodJDOq5YHG81rg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62219fa6-11e1-4b22-7c5d-08dab0a50a41
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2022 01:06:51.4346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16NwbngVMwGUJDRN1Ep8nR6mP2PVj/bsfLdchUeDZXU5BAijtG+wK0pMdnBQUv8o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4585
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

Reviewed-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: Rafael Mendonca <rafaelmendsr@gmail.com>
> Sent: Tuesday, October 18, 2022 8:54 AM
> To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>
> Cc: Rafael Mendonca <rafaelmendsr@gmail.com>; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH] drm/amdgpu/powerplay/psm: Fix memory leak in power
> state init
>=20
> Commit 902bc65de0b3 ("drm/amdgpu/powerplay/psm: return an error in
> power state init") made the power state init function return early in cas=
e of
> failure to get an entry from the powerplay table, but it missed to clean =
up the
> allocated memory for the current power state before returning.
>=20
> Fixes: 902bc65de0b3 ("drm/amdgpu/powerplay/psm: return an error in
> power state init")
> Signed-off-by: Rafael Mendonca <rafaelmendsr@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c
> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c
> index 67d7da0b6fed..1d829402cd2e 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c
> @@ -75,8 +75,10 @@ int psm_init_power_state_table(struct pp_hwmgr
> *hwmgr)
>  	for (i =3D 0; i < table_entries; i++) {
>  		result =3D hwmgr->hwmgr_func->get_pp_table_entry(hwmgr,
> i, state);
>  		if (result) {
> +			kfree(hwmgr->current_ps);
>  			kfree(hwmgr->request_ps);
>  			kfree(hwmgr->ps);
> +			hwmgr->current_ps =3D NULL;
>  			hwmgr->request_ps =3D NULL;
>  			hwmgr->ps =3D NULL;
>  			return -EINVAL;
> --
> 2.34.1
