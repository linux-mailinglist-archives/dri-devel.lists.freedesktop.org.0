Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8757D4AB36E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 04:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7235D10EACB;
	Mon,  7 Feb 2022 03:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B9510EACB;
 Mon,  7 Feb 2022 03:30:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=og5qCXKHzIixIoG93zAnExYLejGK8IL3CrpfgAe4TbKrMEqktYJbWZtFFaTZWt9TqWPy5iinVGJc9Vsy8iZXgfFBlp3sjN3RQGLIVqdwkdynv0aAMt2WfLS/ZICFw0yXneWs/s5M5mJXrEfB66K0n5ykyw4qFQGLfIyYQPYZ/Re3VmuiksGO+f1eXiOqwQyaOm7wYbwIkrHP2UH5Wt2SKIwGJ3o3qkA+sPKCdxEGTMbpKLkw4Mt8hIo5YgMThLm+guNzIS8YTZF7OujObEfzoBb3NauBfSqY2Pl9Zqyp9T0QAjNjsL+uWdfxn0zE2mRX26ZiwyGUGXC9N1HWCtZL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzWVgmpPJlmPMecU3JhUV57rCwC0Lay5y4PVz93VGpE=;
 b=OQlI2c7/kfgkW6dImkHxz3ZdYVHpph1co1c4mGfhzkVaFbfU22O7e5lO0Ks26McmIGtt9++a97gs7yrDnncTs/Kl9uBql5HAVLYPM7Twu/iud1oZ//tKUn0FeoCDJ6mkiFqYAvgAf3VahmEEl/TykuAZrjlr4pgxXttwkNjjGD57sVDu0GcJD8d6B8e72tHLtFW+hmqElGioeg93LuBu1dFomNemVoiIv5v8drp14DHyHT3G6g+C4Oas4Vu5QhZGBD1tJtKSOla/mTrlaW4SkoaGt573LiWbz6mdpKy0p/2E29w+E94aASSNNMP8Bxqg4S1We3O6Oy5Ai+cxph8ncQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzWVgmpPJlmPMecU3JhUV57rCwC0Lay5y4PVz93VGpE=;
 b=ZofT7zHhWc1Oxah5HOTXFuwP1okKytDW87eNo0j4nOMrIqlBUcmF1ZYOV4xjvF413S3f43+n6852mUj2K9sOpycybMVshpo6ScR+fd1/TYonazqlwkG6VwvTLP7AYTjI/rTAGnP7f3MJVhLjltLUqRXlG6suyxpOPKWnRo4RO8Q=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM5PR12MB1916.namprd12.prod.outlook.com (2603:10b6:3:112::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Mon, 7 Feb 2022 03:30:01 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::a894:300e:5c16:5639]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::a894:300e:5c16:5639%6]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 03:30:01 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: =?iso-8859-1?Q?Ma=EDra_Canal?= <maira.canal@usp.br>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "nathan@kernel.org" <nathan@kernel.org>, 
 "ndesaulniers@google.com" <ndesaulniers@google.com>, "Lazar, Lijo"
 <Lijo.Lazar@amd.com>, "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Chen, Guchun"
 <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "jiapeng.chong@linux.alibaba.com" <jiapeng.chong@linux.alibaba.com>
Subject: RE: [PATCH] drm/amd/pm: add missing prototypes to amdgpu_dpm_internal
Thread-Topic: [PATCH] drm/amd/pm: add missing prototypes to amdgpu_dpm_internal
Thread-Index: AQHYGJaXQ42Lm1VvwEmwNUASEbtx+KyHdI7w
Date: Mon, 7 Feb 2022 03:30:01 +0000
Message-ID: <DM6PR12MB26199543AD01C2DA18CCFB64E42C9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <YfskWvNqt81rZZpQ@fedora>
In-Reply-To: <YfskWvNqt81rZZpQ@fedora>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-02-07T03:29:57Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=ad92e81e-ea20-44bd-89a5-ec95d51ef386;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c95d8c5-d6ed-4db9-fe23-08d9e9ea1fd4
x-ms-traffictypediagnostic: DM5PR12MB1916:EE_
x-microsoft-antispam-prvs: <DM5PR12MB1916D8B0AF426A7040C6DAFCE42C9@DM5PR12MB1916.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RPLQs25PhX2D5evhmAxJgAMvhZ4QtIrq5Y/8JB96JJDl/6tRAWSeosystKKONrnBIOyv/YmcDrtEyzFfmec6mD66s0Xp3VAqoA0NGT4FsgfImes0T4RVS6fQM8Sl1GELKmmfwgglHEaVvBzMf9pSONWhw2esczFNQqRnePg8h73W9pNbq01SezcwcDISaMqVlrPCxzd90y+slBlfptMcygZU+qvnr+fwZIdvX/vgNeOdT59PwiuCI13H5+1s00AMCIpiTydnF2ZKZGcgyTZG2zu5kS8f2Zz6JqUexI3pcM27T3zHu198LqMPlDalGaKy1ECMfZFSCW/ic29Zgtx5eEaKJCXdJs4s/753xwFqB7yL+jOgKSM6715qoHTHoV0u3Z5hKS0ADDmrqC0j6KwYlFbxSDnjtnd/Ouz+DZDdWyGVshak5DXHjpRuMFwPeJdNgQAXjlXphzd/PBnWQjFjAPLZgHxoGCjAY6/c8xclfUcVpONX/JN3HrNNfTrheD53ydmQKYbUNoRsyNLte4PKbIxbfbUTlX3GN8RIFNMpHowv7ygoHg5C8PP+UdMRwajg728cAFfXYwcIbw5ZDdd6NbJzQDP0ymMo1OIgyKghR/7kixz991Y5d08CPtdbddH6AZCB08eWPCTU/uPum6bpVxsjPj46SWL/NYOiWiROpkW0BrQyxoeFNBfa4XpY10TXb19xCIN+VtPw91Wr5S3Y0IqPXESmW8Af2mzmN4dUmA4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(8936002)(4326008)(83380400001)(52536014)(66476007)(66574015)(66446008)(64756008)(55016003)(8676002)(508600001)(33656002)(26005)(6506007)(38100700002)(38070700005)(110136005)(86362001)(53546011)(122000001)(9686003)(921005)(5660300002)(76116006)(66946007)(54906003)(7696005)(316002)(186003)(2906002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZwjK+uiHDSWCPXeoJ8gX4ymigSKew65Kkj369/OOz6PPL5vEe7m9VtiX+W?=
 =?iso-8859-1?Q?r93Uu+pwD47KpQREZTtoSFAAOOagHgC8B+MOaR7nAPjmwq/9GVljHD+G/8?=
 =?iso-8859-1?Q?GpPnb+EMzAwN54Q3FqoZdMOTwRWWBmz/FcyHCzD7TXPnMG7N7bHtns/ZLe?=
 =?iso-8859-1?Q?0XQNSRk4rOaH7+bA+tJc/CGmqtSvyyzE5IfYmBfblzZWJGcH+hGu205T5p?=
 =?iso-8859-1?Q?Kny6FT/rYERSxzYisfoglsUCOY1rQ0ZvI3mA61OKRhixlr2mcN4j4sba7v?=
 =?iso-8859-1?Q?ZRIKGLpt4Zy726rCbwD/VPx/QQ9iMqyZl5YWsNdqkqeAla2TbjDeJeSDMN?=
 =?iso-8859-1?Q?Y8561OQXVOYtox12wBd9O0g++v5xVbJpU5noIdGt4Xpkdqx04f40nUbi03?=
 =?iso-8859-1?Q?e0MGGQCmJeABzfaLi0ijvuWrgKX5wvLKr/1O2WlUohx1kF/xF+Tth4zOZI?=
 =?iso-8859-1?Q?gKd0K6aA3Eiph4Al02EqW0v1r+KQGXO01c8/StY65xy0KjJTGcvFaHQ1cr?=
 =?iso-8859-1?Q?r8zagcfxtI8J7OWfSSMq/4D2GqHOhJ2SkB22mTKz+OZl1789WrsGhSpgdu?=
 =?iso-8859-1?Q?5DJjwcX9741OnCtfaLL7rD5uRRX4E6Ea+vDpo8IYc1GGi6zFN7EbNLnBVi?=
 =?iso-8859-1?Q?heHwJzn4c3gzNEdJ/9noV5ME5vUvDf9vnQX+gP3QX60FjfLjPPsd2IB+Oa?=
 =?iso-8859-1?Q?9SB27ghaudrz1e5GgxOY6z2WsaT7fXHkAcrYUfClDg5DNaJCqYSCcuImwi?=
 =?iso-8859-1?Q?upZRvD/DcxXq1aPGmGydbwiByj23Q9UF7ffypNLUdFaGW9HmRO+fHUNyXN?=
 =?iso-8859-1?Q?E93JEmCGdE9iAexVLRbG4JcA/mDUOve1hC2MyAhQF27QEv1vnif/OSJmR7?=
 =?iso-8859-1?Q?Fb+B0f7G3XE1x37h1SgriQU7fe5YR8b5IczYY3PaMB+d0/P1Ca8KWOrhdW?=
 =?iso-8859-1?Q?SND9NsCL75/KKNzdreVCasJLqQzLHWOAjgMH0r/JBrVTNiekcpL7cxDqrt?=
 =?iso-8859-1?Q?xJ5lQHQs4EF6irdRh9dM2y+trZ8Q+D85iaMOTf40VWMcOIeBMCadP/Gtp3?=
 =?iso-8859-1?Q?AA/ctLXy8HebPQn21RpKyO/otcbMisbqRXGhoZWSZMrBcN9ilPU+oqQIQX?=
 =?iso-8859-1?Q?Gqxj0lNyanJZS6Gy77ImN5Rlo4vwGKdt3nTrcqTH0X8T6RSoKlSwogq1Zj?=
 =?iso-8859-1?Q?BUryDQF7SsoyFlMk9SmNv/EE8uq9DmjA3tBOsLUvm7TqpQGV91Zb1y+u0z?=
 =?iso-8859-1?Q?ESm5INa87eJJ3Mhi7K+vYRoxp1fMiTONsJG3E6pnxaG21dfzCWKSWtAWAe?=
 =?iso-8859-1?Q?1UI7rqdM9nhsWRlcqQabyFs61E4uUo/2pvDlaSK0qZq/eUT/SftDWQP+l1?=
 =?iso-8859-1?Q?qsZuaHzLGemYM9zFFWBuTHzq8aoof/uLCkczDHdZA3M67bVv3NADrXGhD1?=
 =?iso-8859-1?Q?vjEuvfag9WjQWEhI1f5UtUcft/Zr75jEEwyT2Y15gm8KFO8bezA10F/Ere?=
 =?iso-8859-1?Q?chQWSaXa4j08UTJl7OSaQeDk7lodhYpDJczsNadz0D0VxSPJ1fHtTuU5oC?=
 =?iso-8859-1?Q?OfiaJb3dNeggX5uHcWlEXHyA4BqPHJzOAReibR9/ro9wn/K0nfnzjt6YA6?=
 =?iso-8859-1?Q?X0Dp+ULPpwO5g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c95d8c5-d6ed-4db9-fe23-08d9e9ea1fd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 03:30:01.4369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRnGRLBidpl8e6F8yrO2zVwcLD0xITVqUzE3/TBSN/tycuuzlaoXxFpQ+IaqDeRZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1916
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

[AMD Official Use Only]

Thanks for the fix!
Reviewed-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: Ma=EDra Canal <maira.canal@usp.br>
> Sent: Thursday, February 3, 2022 8:40 AM
> To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@linux.ie; daniel@ffwll.ch; nathan@kernel.org;
> ndesaulniers@google.com; Lazar, Lijo <Lijo.Lazar@amd.com>; Tuikov, Luben
> <Luben.Tuikov@amd.com>; Chen, Guchun <Guchun.Chen@amd.com>;
> Zhang, Hawking <Hawking.Zhang@amd.com>;
> jiapeng.chong@linux.alibaba.com
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux=
-
> kernel@vger.kernel.org
> Subject: [PATCH] drm/amd/pm: add missing prototypes to
> amdgpu_dpm_internal
>=20
> Include the header with the prototype to silence the following clang
> warnings:
>=20
> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm_internal.c:29:6:
> warning: no
> previous prototype for function 'amdgpu_dpm_get_active_displays'
> [-Wmissing-prototypes]
> void amdgpu_dpm_get_active_displays(struct amdgpu_device *adev)
>      ^
> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm_internal.c:29:1: note:
> declare
> 'static' if the function is not intended to be used outside of this
> translation unit
> void amdgpu_dpm_get_active_displays(struct amdgpu_device *adev)
> ^
> static
> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm_internal.c:76:5:
> warning: no
> previous prototype for function 'amdgpu_dpm_get_vrefresh'
> [-Wmissing-prototypes]
> u32 amdgpu_dpm_get_vrefresh(struct amdgpu_device *adev)
>     ^
> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm_internal.c:76:1: note:
> declare
> 'static' if the function is not intended to be used outside of this
> translation unit
> u32 amdgpu_dpm_get_vrefresh(struct amdgpu_device *adev)
> ^
> static
> 2 warnings generated.
>=20
> Besides that, remove the duplicated prototype of the function
> amdgpu_dpm_get_vblank_time in order to keep the consistency of the
> headers.
>=20
> fixes: 6ddbd37f ("drm/amd/pm: optimize the amdgpu_pm_compute_clocks()
> implementations")
>=20
> Signed-off-by: Ma=EDra Canal <maira.canal@usp.br>
> ---
>  drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c | 1 +
>  drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h      | 1 -
>  drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c   | 1 +
>  3 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c
> b/drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c
> index ba5f6413412d..42efe838fa85 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c
> @@ -25,6 +25,7 @@
>  #include "amdgpu_display.h"
>  #include "hwmgr.h"
>  #include "amdgpu_smu.h"
> +#include "amdgpu_dpm_internal.h"
>=20
>  void amdgpu_dpm_get_active_displays(struct amdgpu_device *adev)
>  {
> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> index 5cc05110cdae..09790413cbc4 100644
> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> @@ -343,7 +343,6 @@ struct amdgpu_pm {
>  	struct amdgpu_ctx       *stable_pstate_ctx;
>  };
>=20
> -u32 amdgpu_dpm_get_vblank_time(struct amdgpu_device *adev);
>  int amdgpu_dpm_read_sensor(struct amdgpu_device *adev, enum
> amd_pp_sensors sensor,
>  			   void *data, uint32_t *size);
>=20
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> index 7427c50409d4..caae54487f9c 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> @@ -28,6 +28,7 @@
>  #include "amdgpu_pm.h"
>  #include "amdgpu_dpm.h"
>  #include "amdgpu_atombios.h"
> +#include "amdgpu_dpm_internal.h"
>  #include "amd_pcie.h"
>  #include "sid.h"
>  #include "r600_dpm.h"
> --
> 2.34.1
