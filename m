Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D3D5E5A24
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 06:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5DE10E442;
	Thu, 22 Sep 2022 04:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060.outbound.protection.outlook.com [40.107.100.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CA710E289;
 Thu, 22 Sep 2022 04:23:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJSC8m8DBYpN4ZjlotGvyaUM3xtWwf/B2VmHmBTnmZ8TzTE1j6UJCjrLX8ouGqs1/KWiR+m5Zv5EN+0kijt+93INl/Ak0Mox61YjdRMzEgZz67lZ2PPgZt5i9ty8nkPoYtljE0lf+HDm5PQiuSPL3sOB/lI8e5pVggz8kNmWnrhaXCddInlp9ebpB88nqs/0v+CkOSx0Lu5eWjGDODFw4iECl0NXCWalpS6hWax6iaXGousplV1Z/Ly3PnG+v7sQT9lc5f8KgowWRK66WXPjIUESRnXWyornxiuG9v9tu84Izn1gEHVZ7YJ6fwKtizkxSn/TPRjN9Z6g+Wu6KTZTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adWP/IShM0YbKi43/1lLP9Qa6JSLnANDTYvE+1wpOGg=;
 b=aaIbrGWs6NURQkvPPSXt+mPgv6QqMb/MNPT4jazf4RStCYHQROH78WuEcz4Gbf0RwgFkk+oHKkH/a9Sh27djUJFLGFOppQVkmOBDtz7DlAF6Ff/np10YTeyBZg9NXwoj0H5p5hpfrgbEfDJrjYelOiDxoTZO0uDKy7gW568u/9Wr3ovCwISOby37MsL7kPlbLuMi3iTHw6wDqwUOrOyoDo/gCRrSn+lHDg6YCm96HwvbRnkU9+heYnk8ZKq+Fxoh48AwKYLpBu5cx5bPvP6OuVjrXpdXaStbFTNizmmFzVwAh1Wj4eHu/nRTNnlhWzfl9dQNinFG81VVp4j/5856ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adWP/IShM0YbKi43/1lLP9Qa6JSLnANDTYvE+1wpOGg=;
 b=iRShSM2N37tjotBihyz3D2kpHYOJEt+ODt3yf0sLVO0GzS4GiCoVnbJ1+fUKQCR8a9RL3ZtQLraB+o9DDZTwHUC2uJ4Z+7hWIk7izRpM8zRLjZuP8Hi9LPDUe7e+8azEIFCZgDfaMR4+/MEGnRLtTwCOTWXV4wIKachEeTLdWhA=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 MN0PR12MB6366.namprd12.prod.outlook.com (2603:10b6:208:3c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.18; Thu, 22 Sep
 2022 04:23:05 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::64a0:7cc8:5c5f:90fe]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::64a0:7cc8:5c5f:90fe%4]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 04:23:05 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Li Zhong <floridsleeves@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] drivers/amd/pm: check the return value of
 amdgpu_bo_kmap
Thread-Topic: [PATCH v2] drivers/amd/pm: check the return value of
 amdgpu_bo_kmap
Thread-Index: AQHYzjpa1Dn8rYVEDE+34iLXwHQeUq3q2Xgw
Date: Thu, 22 Sep 2022 04:23:05 +0000
Message-ID: <DM6PR12MB2619667E4A2723C1D1DE03F9E44E9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20220922041756.1681845-1-floridsleeves@gmail.com>
In-Reply-To: <20220922041756.1681845-1-floridsleeves@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-22T04:23:02Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=7818bbc5-0156-47e5-bcbe-36b75d5c9695;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|MN0PR12MB6366:EE_
x-ms-office365-filtering-correlation-id: bcf61ab3-a649-4b7a-74ce-08da9c52253a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2+evAKhGA2HFQti0jkbBa9s73q5nzQVziJu+2Gjw+BzJkqoyPp+AauexW2macRLPIOxUdZ0rWAjSls6xgyLjC6aZ3Sr97kJkMrimJ+CG55PVGqltFE06c/1pUxtchBY7gocuAeWJy/UV9KYYPMdYz/UL7fH82fwBsGZmEuAyX7RURG/LbW7uMDBdrd8qFhqN/qT3sUeAppGLoqEke34CRtqPRkJpJUiZkUfQyycthiStTerpnSyukJSEpiRRVCtkXymFJ5cKyO3kBRN7dgQW2MpX76pqiZo5SgZp/vYGaw5CyFBVcswfPbxy7jffqktolrfd1O6jvpOIGXRopXIOfA8OOEtFLvlsmzejjq36I2Sd32vcYAMKf/BbImuTCN0k2mF8LeB9hYTtcO+raHX2pxz6g/FwbH+tmoKkQHEQN8RfxPkNwUu64xNLtxz2L+Z7bbKanq3H0D3zo4DyBkLOiSrXm8VCV6yxF1zkihGRHLQrtIF1iayffTmyF9sOvBSe3QFZqk/QtCaVDJWrufacdsBV2stqm31te5QROi1D6g/UnMYWlPKpkt6ETkQpK/Wu0eo1oe+eKTn+2nhmApHWKZDvalW+AZSAHcHlDnAt8Flq1iZfClzR+Klu3JkdoctgUQh63iDHr2QcA60MTf9XoZMza/jLHyvnQi2XLvKLPJxGSysCNMVhGtXGT0B7tGCPDNElY6PaZAe5QmzI9b9hXbrfcEaX+UcuD6IXsF4krtuu9sg91hHbj7N4uPtLKtqjPehNhhQ6j4MJD9nfcNt5kw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199015)(9686003)(86362001)(478600001)(41300700001)(53546011)(6506007)(33656002)(71200400001)(122000001)(7696005)(26005)(38100700002)(2906002)(38070700005)(55016003)(186003)(66946007)(83380400001)(76116006)(66556008)(110136005)(54906003)(4326008)(316002)(66446008)(8676002)(64756008)(52536014)(5660300002)(66476007)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+R6Uko6KrvbcWO0dZKSHsz8YUua0T3xTp3QZeHwAwCKw/gSDPesHlG8wdu/I?=
 =?us-ascii?Q?l5AtE66W3KAm4zKq4kOInSoaNV5jUu9vXZz9g1EHOZP+tgRWBe6w6x6+VaqX?=
 =?us-ascii?Q?f3+hRx9S2OTlDiNnW5KDY8cB0ugBSBlUKoUn8qKQbIjR0d5ta3qjBD+tLeoh?=
 =?us-ascii?Q?bFUqsVV880nr5NtyJyD0vuYn562hTg5MM0g2afzelsydPqOb4wa9vDeAVjQk?=
 =?us-ascii?Q?/YQhNzIICYTad2+EDExMxMMCoaXvnB1QUdWNwTW0xJzJXQNinSg6AJ70g5Mi?=
 =?us-ascii?Q?l+9bA+Z/VgoZOvO5mo7Ilz7AgqxzFq/2n285LB/NTyIYUkNlTUPboGqfWf3Y?=
 =?us-ascii?Q?8MbEVLIiHPJhKJnYyktW6gtky+ep8x0l+yG1xQhGYpn2FGdTRDYrd6b486kw?=
 =?us-ascii?Q?QW2pxUMyz/u7okQYJUFGmDnEJKyqx+7GvaMJnk2Q/4kpzY2XplSufzK2gAyt?=
 =?us-ascii?Q?Dug5tge226O4l4zSoQPJS+5u8Zfw97HbISCP8DIF5wxCJteKZOk+Ioz8/0Td?=
 =?us-ascii?Q?hmcj/LCQ1JCJu9Pk1sDqCdM5kyDhN0BTpFUV+c852d2Ys4RBibsxy3fK86+E?=
 =?us-ascii?Q?3R6Up62Jb02VeOP7tYr1eGtOKqD5E3K6MNZ0/UyHQjHSlCgI5jX7EHPd802i?=
 =?us-ascii?Q?Y8VPtY0uhHNOBTl9UP89uM5CV1hU0Oh+gFYG0l/APq2Q7WT5tquciz1O/Thv?=
 =?us-ascii?Q?bRWt1FC8IVcJL6DALurP1PGJL/x/AuffOO8ddTTP6/OK0tto4sFzJpwdLnaF?=
 =?us-ascii?Q?X9F/K8zuU0QaP4iUmUCkc1d9u8IW4hdPER9rfhV8WIxDTsz5fsyxCfRNcOFQ?=
 =?us-ascii?Q?YgsuE5CQgoF8jcfLtQ2fsFT6q2ldlX+likYIIca0rW38pv8L1OjqKFHJUEl/?=
 =?us-ascii?Q?HJauDcyN6pf+Um0vZZqJN2x6uJjmhwk1uFDq9nW5ol2gtMRHyHdmiNb6/uUu?=
 =?us-ascii?Q?8Jlp3jy+1p333NNMHdlGn2cu4kfIBRQB/KS8A7pL/buJ+gFX1GEUNFDVT54X?=
 =?us-ascii?Q?fhOQE5W0TLuqDJCG+KYzBRo8KZdifrlpIcrcj+G85V5Vj/YzbQdckJJwMbaT?=
 =?us-ascii?Q?Didj9cmabrqRdg6bv3kbpAvmHAQPuGfrevkJIxwGQKeOqs/SCps6C7Uto1Vk?=
 =?us-ascii?Q?vQ0mmaJjNSDsRbsZOInkGYGBtzK3ObgTZ188+qeZ8QDRiEirYei02qWnqJNE?=
 =?us-ascii?Q?ejxIZZRPTGAMAUV1u7rQaZdGv6uIGnpY60Xsz3pyJaoVrNlYevD2ID/cv2q9?=
 =?us-ascii?Q?rNbv8fvOueG809RaQWb08V3w0i/zKiKrp2daIWUbUvP2WKc37bXEXcgIYf2E?=
 =?us-ascii?Q?sLx1YFWPAjrGRrImV2qJmXc+szfd29pwMTOtXGe1b107W/OJ7IS8oIfB4QXN?=
 =?us-ascii?Q?E5CqQ3dP6syP2YdofR8r49oSj4izi66q5w7Ojg9sl5fXvwvMkZQytlWYxutr?=
 =?us-ascii?Q?w6aDU5WXKURokVXXhJ1peAcLT4XExJCuYTJERlC3GFAiLZQn/lyivlSh4YKr?=
 =?us-ascii?Q?EutUHRc60CHdqVhtzbqoHf1u55cpae62ZDfmf417OBtdournTbPnAuenGDkP?=
 =?us-ascii?Q?YQJaOcnaOqk2bshxuSY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf61ab3-a649-4b7a-74ce-08da9c52253a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 04:23:05.2029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tTdQn6vMilxd5vw2I2Csf9C2Zh6fawkIjsGL9z1eIxNVU/hAujxY0cSlMsCsSYsA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6366
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
Cc: "jiapeng.chong@linux.alibaba.com" <jiapeng.chong@linux.alibaba.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>, "Powell,
 Darren" <Darren.Powell@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Reviewed-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: Li Zhong <floridsleeves@gmail.com>
> Sent: Thursday, September 22, 2022 12:18 PM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: jiapeng.chong@linux.alibaba.com; Powell, Darren
> <Darren.Powell@amd.com>; Chen, Guchun <Guchun.Chen@amd.com>;
> Limonciello, Mario <Mario.Limonciello@amd.com>; Quan, Evan
> <Evan.Quan@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>; daniel@ffwll.ch;
> airlied@linux.ie; Pan, Xinhui <Xinhui.Pan@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Li Zhong <floridsleeves@gmail.com>
> Subject: [PATCH v2] drivers/amd/pm: check the return value of
> amdgpu_bo_kmap
>=20
> amdgpu_bo_kmap() returns error when fails to map buffer object. Add the
> error check and propagate the error.
>=20
> Signed-off-by: Li Zhong <floridsleeves@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> index 1eb4e613b27a..ec055858eb95 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> @@ -1485,6 +1485,7 @@ static int pp_get_prv_buffer_details(void *handle,
> void **addr, size_t *size)
>  {
>  	struct pp_hwmgr *hwmgr =3D handle;
>  	struct amdgpu_device *adev =3D hwmgr->adev;
> +	int err;
>=20
>  	if (!addr || !size)
>  		return -EINVAL;
> @@ -1492,7 +1493,9 @@ static int pp_get_prv_buffer_details(void *handle,
> void **addr, size_t *size)
>  	*addr =3D NULL;
>  	*size =3D 0;
>  	if (adev->pm.smu_prv_buffer) {
> -		amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
> +		err =3D amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
> +		if (err)
> +			return err;
>  		*size =3D adev->pm.smu_prv_buffer_size;
>  	}
>=20
> --
> 2.25.1
