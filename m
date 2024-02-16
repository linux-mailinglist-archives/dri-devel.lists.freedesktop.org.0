Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F731858317
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 17:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9347E10E677;
	Fri, 16 Feb 2024 16:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kuoDW8ER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7D710E677
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 16:55:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDp8CNfOPiQz+dNIQzjHrOCEVpaQNFriq47xI1ahVmXv9ppyprxhMl78yy6zI8Y9mWry6xfhVCa8j86HBQtzlQP9iwqTmSC78gzyvLAXlW4pRiji21ImWb1jUBZsf5FW0kk3YVFR/SosoOxej/NKKTWFVOheae++wV5G9NypfGKpET/Yt5i3+H+UwmN0fU5gZ/27iQu5RsHs6XK/y4Yc1IiLn1VEFmRocHELOunPcx6/P38fbwjQZb9qnhcQ65akBVKMD+4r/7vV03Gnk2hjjRKd9KkXsOC8T09zRM139gvfZQji8KgxwTp94UxQuPiGCMHQCRsrF4Suut9q3KblxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xgzhH/0taBuRUAchzqUdtk+M7+YlJ03hQisewZsisE=;
 b=a4uPSzOz5BhpDZ6xbYJFouPaS4muDcB8vHTDIX4J4QrvfloNYxj2yjbZzytgveTWbhfEzarnBtBKFXB7IFeml2c94wquN1regrWVgqzqiEY7fIS3IvMyeIsRwlZDM4znO+25oFuP5hoT4RIHTsckBEPkXLC3abqDe3DMHhFVNSp7P2prN3w0xDx6tllj6pE7CzSU5NtDX6jz2WxKURCDd9cHq9r7dP4Sydi6KGu5NXnNKZjVFNcD1oEoEQiGbA0mSd5f/gnFBvqCar1UKskqAYPfkWRObt1Z5ESgYmCu2eKCtA9ZeZkGnrEocH0ESgPADFYEbjcvCzyo3fKLxoxVcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xgzhH/0taBuRUAchzqUdtk+M7+YlJ03hQisewZsisE=;
 b=kuoDW8ERqt6vQTMTrcj2GyI7p0WaKUIMf5tffXZVgCkjPK4OcyaBm3Vgvt810k7IXeTf7NBsnlqolTRdhobNfivgIFXU8jSp91WzNdENwO/X/zzY7K796YZkbguGMscozfWr69s0NIJX0g2uk2iPRBs1btbX+V9qQWRbzVD7J3I=
Received: from BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 by CO6PR12MB5490.namprd12.prod.outlook.com (2603:10b6:303:13d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15; Fri, 16 Feb
 2024 16:55:02 +0000
Received: from BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::6e21:1fd2:427:f362]) by BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::6e21:1fd2:427:f362%4]) with mapi id 15.20.7292.028; Fri, 16 Feb 2024
 16:55:02 +0000
From: "Sagar, Vishal" <vishal.sagar@amd.com>
To: "Visavalia, Rohit" <rohit.visavalia@amd.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "laurent.pinchart@ideasonboard.com"
 <laurent.pinchart@ideasonboard.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "Simek, Michal" <michal.simek@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm: xlnx: dp: Reset DisplayPort IP
Thread-Topic: [PATCH] drm: xlnx: dp: Reset DisplayPort IP
Thread-Index: AQHaYNVk/dyTH3WxcE2SdTB8Qq6HAbENLmyQ
Date: Fri, 16 Feb 2024 16:55:02 +0000
Message-ID: <BL1PR12MB59699BE91130AD94A8DC6E7D9C4C2@BL1PR12MB5969.namprd12.prod.outlook.com>
References: <20240216124043.1226713-1-rohit.visavalia@amd.com>
In-Reply-To: <20240216124043.1226713-1-rohit.visavalia@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=08ed79fb-0270-4135-92c6-c1deabc478ea;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-02-16T16:49:02Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5969:EE_|CO6PR12MB5490:EE_
x-ms-office365-filtering-correlation-id: 96de5079-69eb-4068-1bb0-08dc2f100497
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9tRyNVY3W5eIroqUyiq6CVNQchry94piIFgH9572kVrlR2cY8dmp1npi1obnu9Jfs6gm42WxZZnugZJ8Nua2ZS/d3mDQLNX2/tAKWceMfNxbo+Znt3uNCKM9Lbxmd0sS5ciC2ovKP0W4Y6qceDg59ki1YR8WiK5sC+MJl3QtGQiYWGtXRGXcWX7c3swju2gSjtRLxON9k7vmBvBpF6Mv41uCulQr4jBnM9LAXq5E/oY5XrbGs9S/zcn+gvfOMOzPBvwnW6oIesNf6u3FIdHqyQCPXW5etU3xYdKDHnyzGPcyKeE9Inw7F5tYeNxdWZK1As696xkSxaKEeDbkfMwkrUQqgE6Bwf8C00QevPeU4offRdy3qnVuiJCa6yB6q6VvcLcMzBVsekIUVisVvMNmKtL490rCmatUw7A/5u4IYvp2SwfD1FjN58j5pTQVDrhJ749Sk0jxhmv0L3FW8EEC8CPnuI+9v/eN1m3c8/totkoHKosvnhnpgMIyQ7RV0uzg6FyX7fE2/FqTkCVRy40rNknRjkM9LSy5dJRQYd5pXGT0G1GrlvKI7kOOm6h6PUS4IT4V/UMbPCauPbKiAKkOtZ3bompQi743Ow3r9q385CTxn8gKnVBg5xk0GO/MYdHN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5969.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(376002)(396003)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(83380400001)(122000001)(316002)(110136005)(71200400001)(38100700002)(7416002)(52536014)(5660300002)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(76116006)(8936002)(9686003)(26005)(2906002)(478600001)(7696005)(6506007)(921011)(53546011)(38070700009)(86362001)(33656002)(41300700001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TC/utbBRaEAVXY3bcrzg2y7XFbtGWMSHzXlRkqtrZDuT0lPUQMTlRPzaGTLW?=
 =?us-ascii?Q?Kl/HcDc638rJCHXi5xWsuov4+NdjBcpqoVOY0lXhwd4Mu8R1zH07rc6q51Zv?=
 =?us-ascii?Q?lPicXPKPaPiE/yVWAhfFx4kk0CwP0S+t5xJP9jP0KUY9PWYPWcLKxRcBS80X?=
 =?us-ascii?Q?F0PvBbv/xgEMb6Byc/IR3cuNcnYJVSV+unpIq7i4HGAj09OZsFV6Dho3I7xJ?=
 =?us-ascii?Q?4gctlwH72wk84N+sUI9Y0ZSz3d+l6AEWIQWFrNTdhYTb/lT4P7y22OHtarm1?=
 =?us-ascii?Q?A1lGY/Ak5vMtjPX6cZiQ6snkVihuRWBpVF8ffoxmyq8tsnoXHGkhsFwJ0Pnv?=
 =?us-ascii?Q?hke7LDknGtdCBeVY/GYj21Cx3s+V0XyP2VT9gSt7g53D03Wp5wbK1yNo0+Dm?=
 =?us-ascii?Q?A4cwlAaiQ1+FTzi5dxlJqqlb0C5GQ6QtJGjTwUfZmI1jbRsRTV3V/0BYfARK?=
 =?us-ascii?Q?6R0bxZ3zGCDrjIzv27Cq86VX7TmqO2SBMGKZMyTYSflmaFmecqD25dEOGSbs?=
 =?us-ascii?Q?ftf3jCi1kFCd/Q4QF+Vhy/AbLCyWxecIVUAohLhBkQ1RyxbUof4hr6rpD4Qd?=
 =?us-ascii?Q?Q/J764g9PjEiBba4MNJROL4M6OBP+qPYmpksEjVhGeHG8OenV25zIB2jLMdb?=
 =?us-ascii?Q?CV1UYnl3EANMOhnsz+qiZy+vIqgYdRqXBxRvXMqj7UodiJKYaS7uuNBc4z6r?=
 =?us-ascii?Q?4a2ORZRTNV/JjN+NYc/v6U40VSqxaLiNB9zD0iX763S674X2Jyz1Ir59EjI+?=
 =?us-ascii?Q?KszHGg1cdZrS0CQCPdlvaFjqdqOpJyBOEaN4D6y4o64rj3JUgm930AicRoXj?=
 =?us-ascii?Q?Zn+Q3TyqEsugYSu9mUG8mpZSqyldoZxnHXQrPf/prHv1/AXMOV7Tdls6Xt8F?=
 =?us-ascii?Q?54d/3OaL8T1eBOOj8D2Jebp0MJ8wN+g05ylN9t7TevB3yN1CjJA/wQq9DZCY?=
 =?us-ascii?Q?hzTsztNbeFMCcIVwYC7s9DeHJ88w11eAs6ggqM+ESNB7GX6pmJ2lGovT9pDK?=
 =?us-ascii?Q?lyZuAFTiMLQ4/KsXTbhzRAkVuzZyLd94prJ8lTm9+gJD+zmBvGwUXopxK1CE?=
 =?us-ascii?Q?CQT9/f4ogMxzmUd29Q5pxZjJZ4ZkuuKoI5KIFOQXsfTwJaOnkeoiyav8wuIl?=
 =?us-ascii?Q?Gst+n76hqooLqRWWpIY0CYuS32SWyguY71U/pSnPnu63sOfbr69czM+g7tZM?=
 =?us-ascii?Q?e09jphm6HyJWXexQJJjM1wTEr+5Xyt1YCxX+lzvqE34/wDOG4s6QpbvllWmU?=
 =?us-ascii?Q?NnFMxTxIFMaqY6IpnRDxcXh79lgukZMbx8FNJWYqyKJ46VzPu4sLiUYQ7sqt?=
 =?us-ascii?Q?1f/rZ6WxCQT1clGd2l7c1a+fAT83iw4vNkMOJXHOi/USfVqtCMrSH7PwmxbX?=
 =?us-ascii?Q?A3tdNueYHX2rwJkfYn1MrgULf7nyT/Qfe6RIMBV51LdHPOVt6c8PymK2JyeH?=
 =?us-ascii?Q?Pgwutd9jgWnu6tKFgYNWN5944qEXZXxdXYvqd1L/EastgDfdE4/ArVma/1Hg?=
 =?us-ascii?Q?cveP90twZk/GyZ5FKfcLekyM1XoAhPZDFDn4vakwmiTaUTe3pAYQO2SWT9BB?=
 =?us-ascii?Q?jp0BwTmifr61bifPtNc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5969.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96de5079-69eb-4068-1bb0-08dc2f100497
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2024 16:55:02.2380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i7NqGfyHt2FlR/Okhq/+lLAq8QCZGd7LqdeKXh9rdwDENpJPoGVXQbo9dthdvZN3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5490
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Hi Rohit,

Thanks for the patch.

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> Rohit Visavalia
> Sent: Friday, February 16, 2024 1:41 PM
> To: gregkh@linuxfoundation.org; laurent.pinchart@ideasonboard.com;
> maarten.lankhorst@linux.intel.com; mripard@kernel.org;
> tzimmermann@suse.de; airlied@gmail.com; daniel@ffwll.ch; Simek, Michal
> <michal.simek@amd.com>; dri-devel@lists.freedesktop.org; linux-arm-
> kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Subject: [PATCH] drm: xlnx: dp: Reset DisplayPort IP
>
> Assert DisplayPort reset signal before deasserting,
> it is to clear out any registers programmed before booting kernel.
>
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 1846c4971fd8..5a40aa1d4283 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1714,6 +1714,10 @@ int zynqmp_dp_probe(struct zynqmp_dpsub
> *dpsub)
>               goto err_free;
>       }
>
> +     ret =3D zynqmp_dp_reset(dp, true);
> +     if (ret < 0)
> +             return ret;
> +
>       ret =3D zynqmp_dp_reset(dp, false);
>       if (ret < 0)
>               goto err_free;
> --
> 2.25.1

This looks good to me.

Reviewed-by: Vishal Sagar<vishal.sagar@amd.com>

Regards
Vishal Sagar
