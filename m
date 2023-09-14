Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F354E7A00E9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 11:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71AE10E51E;
	Thu, 14 Sep 2023 09:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58DF10E51E;
 Thu, 14 Sep 2023 09:53:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMVvQ0qkcDAA8n897Awetg3joNrCQoJHjZzBPwn6FZauTMYab/y0zbEU9+72VhEUhcD8hskMe0H8FUPrd3xXRfDW5fkF4aeMicTvgzJButUCi9+prPotTQGGRUfTSInIy6MdBWg4B1eBE7lbE0K1XsbQN0wls8h7ZTNWfL3fRGP70A0XaREKTZgsYb1Do5biHwwNIBq4td11+lFSHRpTN2eZwbxUzR02hKExIjJSWTX6jbbE4cSAsbjM+1xkP7LqMDmuTm0oHn3j4VIKebV74jHxszsXFVfWPYw+jbOA+wY6YCXcbx95YSx+61zLTEqTy8JETpBwh77yd7AXAoNWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Sn3Ps9X7z1eS6nV7r9qkfMK7Blkuaz6gTPh1D/6zZw=;
 b=CDnz9NYnRBfc4n3VpT9gwHlbNhSitj0m6HC7p7s82yTwJAIv2/b4ukuNT67gqjTNr4g5SG+QcbpD+mqv6kFI2WEYhdPQE0HoyQjzUk3vf4mmLfkKxMmu91USsHJ2YqxeLn8CVMErjVcBBNEsiO/5KgqXYejETNNfyI8g7pRUsuu2uu2tocQnzxW5Z9nadSfbw4Phff0bMGGz6ybWXuNb1BWSM7AlvaZ3/cVdyUdzA0kOvya++bZdMHEEORq2uQgOBgkFGr4TnTHgz52XoLsLsn66aJtKhuhh3abA1FhaSW2agz3id1PDh8kAmj8C9cninuk8ODuwOxNmfQ/TctwskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Sn3Ps9X7z1eS6nV7r9qkfMK7Blkuaz6gTPh1D/6zZw=;
 b=To3TalDUr7lw255oQOF1V2t2OjEjPRK/hneMs5soCSiZwvCw7Ls9xjPvkeaIkFSv7Yw7QcQJraHSSPQ1uRe3ZrxdPzWr1q13+crqBuKPGC5k9UOV7AT5I53SmyxIirPGK1XIU+X1FK+AP5xKGZphqkU1WUDTXYdC5z2WZCkc5ms=
Received: from BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 by SN7PR12MB8818.namprd12.prod.outlook.com (2603:10b6:806:34b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 09:53:29 +0000
Received: from BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::186c:dd6c:34f0:5632]) by BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::186c:dd6c:34f0:5632%6]) with mapi id 15.20.6792.019; Thu, 14 Sep 2023
 09:53:29 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: Cong Liu <liucong2@kylinos.cn>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, "Yang, Stanley" <Stanley.Yang@amd.com>
Subject: RE: [PATCH] fix a memory leak in amdgpu_ras_feature_enable
Thread-Topic: [PATCH] fix a memory leak in amdgpu_ras_feature_enable
Thread-Index: AQHZ5vBjNnY649fsxkyGyJQYBJiMbbAaFKdw
Date: Thu, 14 Sep 2023 09:53:29 +0000
Message-ID: <BN9PR12MB52574EE1CDCCD04336E963FFFCF7A@BN9PR12MB5257.namprd12.prod.outlook.com>
References: <20230914094533.213548-1-liucong2@kylinos.cn>
In-Reply-To: <20230914094533.213548-1-liucong2@kylinos.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=c61b1444-a713-4f4b-a750-efac169591ff;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-09-14T09:53:09Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5257:EE_|SN7PR12MB8818:EE_
x-ms-office365-filtering-correlation-id: 35b59347-8934-48c8-7de7-08dbb50872a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PppgtTlYwEw4GXQQwxDxt8cs+Le/SFsN/fF6tpBEMtddRj3/f3kepsX6QIntBpSeOpS9DcENRoc/HCosG/kSSGXj+HfLmyWM/vlG53BS3gfFsX3kC3om3WIi/+b+bJyQssersTLVbQZadcvxTOMPImwoaPVppJMUgWpRdWJEHECr+G13+nQ9fPFGIg8o4FCmHUTQWTZhh2JoThworHqb8sRm6kIX4M+Lr8osdj8/BPZiC7vuPwLiiGl9Phi9Ol/IciUHHZmQ65ZrJ6k+SPDsdJuwJhfJQpFulin96JnHUDHScaMhwTvzlNcWNdIQn4YRGpSZP+PdYMzj2jnPRyO3Ihp1Mzmf0OrjSrOrpwf523Dn5kwKsNQlXWTYPNmweOnILKQ6D+tFJxjHwZk58RAv6KX4cij9ipw+7YjfWhRLFJC3/4F60Z0LPsWN1RSdmW/lRWyeOj69Yzdrfx+G8bxGn7DkcxPZ9wDeU0IPcDyxJApzp7XzuwHHKeVDYw+oL+ZiqAd1Fc9UCdrQ/67gNIdXqgtRc5WV+OzYjj424e3CibpF9BkRZc4K0AsO9esGPi45xnjUKnwBh8TvjKW3Eo+yv4UWFqcwvvUPUjnw2FLWVZWAzE/+QjYR80NeX9nR7/6xORmySMGx0pDer1WHj3Z5mw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5257.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(396003)(136003)(186009)(1800799009)(451199024)(2906002)(86362001)(9686003)(53546011)(33656002)(26005)(478600001)(6506007)(71200400001)(7696005)(83380400001)(38070700005)(38100700002)(921005)(122000001)(55016003)(41300700001)(52536014)(8936002)(4326008)(8676002)(5660300002)(76116006)(66946007)(64756008)(66446008)(66556008)(66476007)(54906003)(6636002)(316002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qek+w2rl7N61SGN76eZ6RaHW2i/MOnZYJvqkFTirCqwE+95hOdyvWc3/eRUT?=
 =?us-ascii?Q?fNtxVBrgU+VpaJ4CGKKUxjlsuStmNZ8xCQVemz0VgIUsjZf+7bGF9oQyeH32?=
 =?us-ascii?Q?nQjAPxPpJew27uub7G5lwOy0eDW4WmCGefk46Xxkf61YYeucMqxLYqe75o/2?=
 =?us-ascii?Q?Tg47DdgoL4qP8+To391Lc7EL8BdBGATwx1E/1O6gRdaP4MPs7HbVChFcBT4k?=
 =?us-ascii?Q?ZVh+7aestUA9A0KIGkmDL62jfkrYpuGowIKqrY+r0Mm8qboOU0aYk1N+Bltv?=
 =?us-ascii?Q?/WXwi9rCJ9ckwItOKPCKMfnwEmzFc5PSvySNmb3jEU8oN2eqtlQ+5tvW6lC6?=
 =?us-ascii?Q?c6/c0nYd5PPYsmOQD2MZpFX0ppZ+jKlsYo2V8JRl416cCEfWGQeW0J9W0q8H?=
 =?us-ascii?Q?0NEdiPZ6VglNEMiSaVwDQZ6nchqIBhD10cOSj6TMsUl5lY5O7N920lsQGffQ?=
 =?us-ascii?Q?2qZrS8d4G7EHKvksQ3FXxfJIeZCKH2XDEHEwryRCCKF7N1VaRUi2+dUDuyAi?=
 =?us-ascii?Q?LwW4TgWAsgMikwH9RWpxrWNbiqI068ewEq1mguQ1OiJ3NiSauI4jsGkfiLr0?=
 =?us-ascii?Q?rNRHkoKiPItJ6lPTzit2Cp5aacLgfknq9ck7ZDJlR+Hd/PTdGFAbgM9F3tYR?=
 =?us-ascii?Q?bAQU6BOTVS8mqnw9d+KsyilI7fLOpkp32IHqwbNs6oyc4VwCkOs+Jp1D57VY?=
 =?us-ascii?Q?dqtXDRS0LaYpoYHNe/oEq9U4UUE7nTENZBy9s/lv97mfQJsaiKX8v2ftp1mY?=
 =?us-ascii?Q?k9a/av5zO1LQr0JgkT/jtWCRWyb9ejKEfJmlEhL4s0/X0I5n3vSykkScT9iF?=
 =?us-ascii?Q?I9wBMFWu+iOZt6hhWrmZijCrxOtdZ7sR7QrVGR+WKtzPUQQwCz8gaNHBlXuU?=
 =?us-ascii?Q?/E3xRB3MI/A4Lr2OsMbGxG79bicKRZPRg6j7835BdPlUvFXysz0sKcTDfflR?=
 =?us-ascii?Q?yrSTNnHJTM2lwyKLjabpu7n0b8fviPgycpt4NCSrWTm9VwNCeIcW8nIFUqcE?=
 =?us-ascii?Q?YP+1rEDhlVirT2bjJ4U9j5lx2xxc7ymbJMiw27EusoDx5Ge9kciRvAwBtYYx?=
 =?us-ascii?Q?sbHL7MbIiI2Ipsc2/py7uJ8K7ackEKkJZDqZ4VORWCGnMJ7+8s36d5Rmngdx?=
 =?us-ascii?Q?w0blBRV9k3Ti1cyxOlkdzEDokgw9DRQ6dUNU38uqP7wgt7S2ix4f1A651N6G?=
 =?us-ascii?Q?TXI0tPKYPXej8rStN9QNgcaOE5WDiiIgAirS1chzF7de2Sdr/yrqqJGRtGAn?=
 =?us-ascii?Q?2a0O4uvtBtnHiPIqR3nyE7IYqjyAngNh+47x1duSJw7pmj5l0TEaj7sOW6TS?=
 =?us-ascii?Q?NJovjdlFwb9c3yZ+GHFb+f0MGmDgcJX1DzgA1HAv1UbFGbOhKBbkakmOvecI?=
 =?us-ascii?Q?AUYSqb7bEWNQEO8ugnU7BeRsitYZ7BeyO3WuYDO5Nxd+nNsNVG5hW+YEkx/5?=
 =?us-ascii?Q?ACR4QD/eZaCZJdaUd6Qfub660kxldJD06fiWIaCK1cpiHiTArsluy/oZNKK9?=
 =?us-ascii?Q?noWCDwc/Twg+2Jd5k/tWxq3dswCx/PoR9Iw0T3AQH80NM7X/44gSQSzkbjAv?=
 =?us-ascii?Q?wiWyyJymYVlpppY+16w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5257.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b59347-8934-48c8-7de7-08dbb50872a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 09:53:29.0389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p5OWu5VZfwqlOwnddxUkJWQtGsjRflMdP9TgwqlaijSzauMCWUJYYIF/Jn62TJYjlHvCOPG53nwfjYyZDtCqKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8818
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

Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>

Regards,
Hawking
-----Original Message-----
From: Cong Liu <liucong2@kylinos.cn>
Sent: Thursday, September 14, 2023 17:46
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <airl=
ied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Yang, Stanley <Stanley.Yan=
g@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
Cc: Cong Liu <liucong2@kylinos.cn>; amd-gfx@lists.freedesktop.org; dri-deve=
l@lists.freedesktop.org; linux-kernel@vger.kernel.org
Subject: [PATCH] fix a memory leak in amdgpu_ras_feature_enable

This patch fixes a memory leak in the amdgpu_ras_feature_enable() function.
The leak occurs when the function sends a command to the firmware to enable=
 or disable a RAS feature for a GFX block. If the command fails, the kfree(=
) function is not called to free the info memory.

Fixes: bf7aa8bea9cb ("drm/amdgpu: Free ras cmd input buffer properly")
Signed-off-by: Cong Liu <liucong2@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c
index 8eb6f6943778..b4a8ea946410 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -802,6 +802,7 @@ int amdgpu_ras_feature_enable(struct amdgpu_device *ade=
v,
                                enable ? "enable":"disable",
                                get_ras_block_str(head),
                                amdgpu_ras_is_poison_mode_supported(adev), =
ret);
+                       kfree(info);
                        return ret;
                }

--
2.34.1

