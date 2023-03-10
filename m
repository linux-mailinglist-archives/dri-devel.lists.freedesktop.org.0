Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EFF6B385D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98EE10E1FA;
	Fri, 10 Mar 2023 08:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5F410E1FA;
 Fri, 10 Mar 2023 08:18:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3nvcFkJaKe/0ozUfCtcV+QYl0MbL5STkaMoX6FHeriuumql+2qX2cSE1DrlzUBjzrXJC5OM1pzpSHt5oJKbVClTT4GkMIP/95Zw63nWip42884SmitdkczgXYAUw0EC40TeB7gZqU0fHa56k1Br8zVPqArNsvymupFj5pgZJf7Oz8TnW+M3DxpieL2D8ZUOVZYxfHlnmjC6+YgqmhfrwL403IKn8zdDPOKK86VqpHuuV8xi5QBQ+sQeXJg9ZFwIHhozrwfOX4C3y7F25zeHBaYTDbMyYXow7TZWqFd0LjK7estHY/kG/sektJTtvyCvc2rfGmQgdTlFD2H0XgmuoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KABzB9zNe39RbQYQvO3NRs8EF3CbP9p5ccO4VQY7fMg=;
 b=oG1D+FQH8/Mifqe8KjcGmS0+ZBR4NtjsuUiq+nZXmUCicn971kd4stjVDJ5h/EYjo1llcPSUQlGihVo8P2HhpIGJkad9Q3IiybZfVag8vl+/Clc0OIPbQoiLo4Yztf8HZw8ocCzfKZWmnsZFvaymV5XbM8qgCbF9BraIpeka0ja47XNQLhwSX9ZNrU+OrWF8m+APsmvU/WUFkykPjt9mxNThqd2GBpajwDP2z+xi4soztMqEmPWnODGv2SGIpYn/WsJwvkD1JSNc6/lEcP5ovoloFAMymPFgBMHBcWZ4tJx6rYUK2ON2UhdoBhgLBm3y9km99SlR547E9qgT+J2HCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KABzB9zNe39RbQYQvO3NRs8EF3CbP9p5ccO4VQY7fMg=;
 b=Sy1DRrfeu2sEqjpO9BhR7tPyotNVxA/PuJdya/TNYxTt9UhvaZYG68lSlIAa0geoeFEm/NSLVAf2u950NLWEPfidZitBz7KKb0FEfzPrqwpXI4PDlIXJAtkXwJPeOhrLI2viwVxNU0MIDOjnMhzZPTByyoSs9DmGQACdvnb4NFw=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 MN0PR12MB5762.namprd12.prod.outlook.com (2603:10b6:208:375::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Fri, 10 Mar
 2023 08:18:49 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::5ca6:3a18:d6ee:c103]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::5ca6:3a18:d6ee:c103%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 08:18:49 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Zhenneng Li <lizhenneng@kylinos.cn>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm/amdgpu: resove reboot exception for si oland
Thread-Topic: [PATCH] drm/amdgpu: resove reboot exception for si oland
Thread-Index: AQHZUyayYDVcB0qNSkOAgOVEzBYkza7zqzhg
Date: Fri, 10 Mar 2023 08:18:49 +0000
Message-ID: <DM5PR12MB2469FEB1E81CA99C51E7DAF0F1BA9@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20230310074000.2078124-1-lizhenneng@kylinos.cn>
In-Reply-To: <20230310074000.2078124-1-lizhenneng@kylinos.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB2469:EE_|MN0PR12MB5762:EE_
x-ms-office365-filtering-correlation-id: 07966422-176d-4ba4-94ae-08db2140139c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3JuZ7nnhi2qzNnxSCnLl23zBIjf4FgeUISg7odeamHUxItenGI4AyADkwggJO5BIRcOCNkxcI+KbaQ2cw1mc5STFoWHlpHYzOmBNBIThLzcDeiYfwgqIWUs/i9ODBW+MNEKIOnUAN0asS9dXgGiO6rxpHCF5+p4VjD6SgXezCudwuABPjYoPGqKE3ASx9KWar7/zhyTymdO1YMKKkeX4bT9IKtRXSetIYQcY7vLxThbVHLrCfTzfNhZwLgwFqByeKXSQ0izLW/GV5MhMkcipQjau3p8P2fgTbVXknEga1gbnIOOQcpGVvC5Lgwh3phVG7b23jxydQdKRnwyEnR+lyf8ByPWhMeHxQo+GwIX23zkNxfRO9sz3P1n56DJgS/NpNTxEeUqUzQoRV/gZPBWevvQ392HCnfSF06ydQqkDZh/ISIyUWOUTyomHt1fz7Udylk62px3600/lSEI5ky/7FWTnfG81SJp8x+iR4AK6LZBJqztteOoMceVwa7GcV5qT2sSstLKEf9iIKMAkYqS1CJp88Omj3XFBeoLLMS3HK6u5PQXMbsEUvXICGSMhWKST06g4TU4AsjSD612NReK4vqXfWu8S+gfamL7mKIqU75mvoRx7lhBXL5MHU9ltYjGOKE+dtcnrR+YfUvsGunPZy0wkIlzZ2UMdRI69JVGuqRWwLQWdp7NDdMMG8hQdDLEpL+8r005d9QiySqgE3hEyPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199018)(33656002)(6636002)(186003)(110136005)(38100700002)(54906003)(316002)(478600001)(71200400001)(7696005)(41300700001)(66476007)(76116006)(2906002)(66556008)(64756008)(8676002)(4326008)(66946007)(66446008)(8936002)(5660300002)(38070700005)(122000001)(55016003)(86362001)(9686003)(52536014)(6506007)(26005)(53546011)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xuPXGEmIoozo3Wo8ExPkOO1N0SjIf3M8hXQMMT6US7ZS5nMZNhAvZAXPPk+B?=
 =?us-ascii?Q?KtobGowm1XXpEJyZxhPkD1PaqQnLPkINXUuco9gbMtlHe/MCLfnVmJsVk+AW?=
 =?us-ascii?Q?P+LHFmQQatCOfePrjSt8PAB/TbbydG1ZTW6x5hinyoVTb09bVKeAjJTais8J?=
 =?us-ascii?Q?ZJJNhShagjZ83xRG7Rr7nyJSmTe/oV0TylWkYBQ8JJWUb3MrU6rjUuqSdB8j?=
 =?us-ascii?Q?T9EVuvr/335XlKUEvbjSgAA5G13vYm9vzM4CRc//Baod6damGGpz5Ck12oq+?=
 =?us-ascii?Q?TkkkCpDlQANxNFgXpaD3iATbirARRCx+YwjAx2++C1izicjEXKJqqsZk7t7U?=
 =?us-ascii?Q?HzRxbo8SvaUWIXzGxqr/jo0jxG+BshPzrW9SWtip2qxlhorss10KwIZEZNO1?=
 =?us-ascii?Q?YzU0ez4sVj9Ul9DRSyIymDJrgGLMoJIKiMOs/8+AMB571lQe2jW8PeskvzDJ?=
 =?us-ascii?Q?qr/zNpbIzbdOUAu/gSGmTGpQwBsgViUEPa455OgNj+6ac9VZEE1NkA790pLA?=
 =?us-ascii?Q?/sOL8y2zlpQbbcO86ako+G3/s8ecT31cb8qs3WHn5mfiKK2XbY8WSpHdTq38?=
 =?us-ascii?Q?ig646zQgZW/8FFjYE2DdmESGl2jUOwwErpVh7tMUEF0dTcmFG1yXVKB618ZC?=
 =?us-ascii?Q?lC/xQtVGjy/vw7YSyoPI3sHxhv6S8YRcyXeNE7HptPOL3cllDHAjGNYWF/R6?=
 =?us-ascii?Q?jqRufD2ubUUq/sveKsM4ToZcYrCM6AjtozMgrWQ5xrKrg1dr176uoWyzb/5L?=
 =?us-ascii?Q?aAZFJ4xuYPgWgM326XEZnMNegnG+m3SXHV8umPojzTWNYqPnrK6CiWa+E4jK?=
 =?us-ascii?Q?082HcDHfpVAQO0ZMlrN3iuOqc5MV4mBVb5U7GL0sOpLh5TszHzuvbQqQgKsm?=
 =?us-ascii?Q?xqWtgk09VPcitYA23NIETSb76/GwUMXDWq22QKYrty+54fsvpBT/jvZ9UIxn?=
 =?us-ascii?Q?WcyykUXt+YrY6TSMFRE8qG/JQYyJEecaPye95rEqVHxpSzA1fbmuH70WmxUZ?=
 =?us-ascii?Q?kuH1zaa6idZ8FGVmByQ3XSGqI7oQhWvuO5+COJ0sIvlt42woJazg2o8XUfF+?=
 =?us-ascii?Q?WHKYMUy7HRlt/IZEb/f5acZ41T1kZP31YcgziR6TKwNcT5Lwfa9SQgqtZ/u+?=
 =?us-ascii?Q?1HSplYcVXPWhbN2J/6NljtqMItmG4RQkmyrw+I/iCYNq+jojr/A2zNxw5DYY?=
 =?us-ascii?Q?rysD/B3+6Dif6dLkMhTVew5655cw/Sk8EkBLIUGHTxXAvVlPY8VrNNLtIih1?=
 =?us-ascii?Q?N3HZWagdeqn5NNbQFRlQgoLIIvQcAfuPvrHN9ajt7X34GZK5WS7j3+pmoAKe?=
 =?us-ascii?Q?29yXVpyfHr/XTx5Nfu9v/K3jiEDC979/R4c5AwMhpxT23NJIN6vC1/8UhMTt?=
 =?us-ascii?Q?xeAQD9bWQv26Saf6c9ds7+euK8My8Rw2Iu9wuacjlvCoFi9hg/WbMDHvzJry?=
 =?us-ascii?Q?vLg+bXr69OLBUSF0ersSmdhBgeyg06vyqcozQD8HSTaI5sQLHs06XO7wT4vb?=
 =?us-ascii?Q?zqIYfer8u7VgBAPAWVskR9qOF3x/By4pOT7uzXxwhYDnrGL6CdaqyJvKyo0Z?=
 =?us-ascii?Q?j8u9vui1Vz/ZiODgWIzZ3mFsUJVXLF2B5i3EoSsl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07966422-176d-4ba4-94ae-08db2140139c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 08:18:49.3084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uuli/hJnEcypzGjD8LWXOSlr3jFkF/VWsFrtIIu+BYuHMOT2wnCBoaKBWZeQf7PMZvbiNIO7hE0kdNDYu8mxqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5762
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Zhenneng Li
> Sent: Friday, March 10, 2023 3:40 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>
> Cc: David Airlie <airlied@linux.ie>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; Zhenneng L=
i
> <lizhenneng@kylinos.cn>; amd-gfx@lists.freedesktop.org; Daniel Vetter
> <daniel@ffwll.ch>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: [PATCH] drm/amdgpu: resove reboot exception for si oland
>=20
> During reboot test on arm64 platform, it may failure on boot.
>=20
> The error message are as follows:
> [    6.996395][ 7] [  T295] [drm:amdgpu_device_ip_late_init [amdgpu]]
> *ERROR*
> 			    late_init of IP block <si_dpm> failed -22
> [    7.006919][ 7] [  T295] amdgpu 0000:04:00.0: amdgpu_device_ip_late_in=
it
> failed
> [    7.014224][ 7] [  T295] amdgpu 0000:04:00.0: Fatal error during GPU i=
nit
> ---
>  drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> index d6d9e3b1b2c0..dee51c757ac0 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> @@ -7632,9 +7632,6 @@ static int si_dpm_late_init(void *handle)
>  	if (!adev->pm.dpm_enabled)
>  		return 0;
>=20
> -	ret =3D si_set_temperature_range(adev);
> -	if (ret)
> -		return ret;

si_set_temperature_range should be platform agnostic. Can you please elabor=
ate more?

Regards,
Guchun

>  #if 0 //TODO ?
>  	si_dpm_powergate_uvd(adev, true);
>  #endif
> --
> 2.25.1

