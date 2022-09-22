Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AF75E6FEA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 00:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038B510E1D5;
	Thu, 22 Sep 2022 22:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eastus2azlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D9810E1D5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 22:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwpYlHF/JR4HUXxoESKfJLWP/KO5fUTkdyPRRmu8K+ajo9tWVQ6FCbcfPZlu4JIxPBHDJfkSGjIPlTbcdcFBeKz8Nfq8lQkujJkDzMa4NJRdzp79MXOpGe3XCvRonmQh34hcQBSkBeuo28+FK65y9KNk+8R1Vk9Q2M+G+iA9sy1a0uCTijtsXQZ2hfG+yYHJE6+Q0JxHAoKXXfqz4Sa5O9VpSKEGftiEK+v7SASz/6bd9zHhTLrec8C6JGxefH6JZT5/bADwVUPAbLLTOha+uflxIGc9RzoNjpA3DgFFs/cwGKpYpGMWEmAvPIE3ECukEFOVGbZXFWJ4QbxADeydTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciErrPeXvmubG0f6HC5COvoekUzJIRr8wIAPrRnpd4Q=;
 b=hqaQUWYZCYm6K4VUlt5PusEQzNvREGxBfe/ieel/2P3c1PxGWK5MYCV5Ly44lXUpZwFs+ZgBop9ddhqVWhUn2acKy/8SxUUtU07UcJRgqIDFnTS+oB+jV2pfcre6bEuIFw6qcqBo4YggaoqKC6z1kjDS9f0aFJkfTWjQkCZIYU0oE3bJ/rFcfQGbMcSgYT/6iuV2q894A1jU2BXMJipSM9gSLAFu+OsFWjh+m/Ge4scBvy+U2pMzaj0fm3e5PighgdMpJD4rSreOL/2s6y8i/JCL6BdYwaVHhXI3bSOROODnSnMq3DKg3ixnxGtqD5TgI+abKBjtO8f9notoXa6vtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciErrPeXvmubG0f6HC5COvoekUzJIRr8wIAPrRnpd4Q=;
 b=f/3DQm88U7phVc0afKIsX4M2qGeBOKenI7YzlOo3wKppvvvogoqbbXMIpV+xUcs1QhBUoXN870OPht4psEf0Mn2c4kFk5qVXAA2g/fyP3JmEZ9HRR80LQU1bPm+QRgypvKjbp8d9q8vtqUWrhFARj+I+yU/RmMMtagokJe/BzbU=
Received: from BYAPR21MB1688.namprd21.prod.outlook.com (2603:10b6:a02:bf::26)
 by PH0PR21MB2062.namprd21.prod.outlook.com (2603:10b6:510:ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.9; Thu, 22 Sep
 2022 22:46:14 +0000
Received: from BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::17f5:70e:721f:df7e]) by BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::17f5:70e:721f:df7e%4]) with mapi id 15.20.5676.007; Thu, 22 Sep 2022
 22:46:14 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>, Saurabh Singh Sengar
 <ssengar@microsoft.com>, "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/hyperv: Don't overwrite dirt_needed value set by host
Thread-Topic: [PATCH] drm/hyperv: Don't overwrite dirt_needed value set by host
Thread-Index: AQHYxrzuab2WaEtpTkGefKGEEbz+BK3sHEIg
Date: Thu, 22 Sep 2022 22:46:13 +0000
Message-ID: <BYAPR21MB1688F42554CEB542E760F3B5D74E9@BYAPR21MB1688.namprd21.prod.outlook.com>
References: <1662996766-19304-1-git-send-email-ssengar@linux.microsoft.com>
In-Reply-To: <1662996766-19304-1-git-send-email-ssengar@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=2cf5fe52-d0b9-4cef-ba0f-c6b727250160;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-09-22T22:44:26Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR21MB1688:EE_|PH0PR21MB2062:EE_
x-ms-office365-filtering-correlation-id: efcfbc1f-ffe1-46ab-cff4-08da9cec40d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u9+8G1NkrfI9IQQNUbretSnnt3/QjB17xyINgp3nfQdRUCv5RpZmOPW+LvnarPBRn6Y1y3L1/OO8epG/29XJutXT+4TcYy1yCXfjsYTzq1Wc4CrrJUzAvBHSB7vcDLG04icJhE+glfQAoIzWXBjXbQhWe4pra/8UhzSJja5BZCHsyzOLj/Pk5YWDc7ZCaW0TNvaLH7KskhtGvJpnDRb5+q8F/kLkWm5/4As9R5fkeleZWQPWNC5n5bbyxA95CFMNcHeqPSn3Ue1rEkHxTx3xnly7cWAU8kA4+z9Ip16wODlhjvXZhvV6jEu/qFlGLeoCnkrx8I8kOrW9TIMtcExc5QlaKU0Q5WxsTLnoQ9Ufddq+dyhuIKqPIlTHam/s8Bu/EH8nydYzNQWbo11pmuq/VsndDY9L0dmKb8riOSHKApZKpg4UHCA5CC3GO7qFjE01343iBRDwy7J2RnEs8IxsUCCaxSaVMsw7x3deVT4nr5drXZmEbhQ8wiUhms3eUG1+tFC8kNl8WOgUlEOR/hoaqVDXG4YcLOxkwdIpwUwbjhH9eRg7QotgKvTgsPtxyoivzEHcJ3ixt6ISk7GQD+AcaSR4OD0oSIp+3OUP68G25zWIy12zsGH6Ebw1So2uYpTTrk3p2CUJFibfRj32buYo0iwsa56iqUW7qwDVmpwptSqM8FTzrimKooxOJRKrdn8jHaMesBJhuEUGgKlHsBjJ023jiLSOHN4lXUi13p8os/XXY2bAAGh1nUio6nvr8cF42mc3CcU3rj5krHEzL5xHNDX2T/rKa9tCp1JwKLEkwff8vHvfAZGI3dtks9ccuNcU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1688.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199015)(8990500004)(5660300002)(8676002)(2906002)(41300700001)(71200400001)(33656002)(6506007)(26005)(7696005)(38100700002)(66476007)(9686003)(64756008)(66556008)(66446008)(66946007)(76116006)(8936002)(52536014)(86362001)(316002)(10290500003)(38070700005)(110136005)(478600001)(82960400001)(82950400001)(55016003)(122000001)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ODg912/8dsCA2XdB23dg6BpwH9a58vzCAwNKSlAUsLhXy005evTgfM+rYrFy?=
 =?us-ascii?Q?H7+zSdTH+ocblJLnsNha5RULIyvgKyhu4Jtkc6vj50KDlBpEc6CsqGUkWy6v?=
 =?us-ascii?Q?5dwt0u2C8/MmteGtu6Ie+SJ0vR/ZZpOHrg1sNhpQ37IkSlg2Tjh3R+wKrTa1?=
 =?us-ascii?Q?MX5q7GQff86JRMvObRrUQhBtQQdhDJxZq08QJYzwrw6gpKS+esU393JMza78?=
 =?us-ascii?Q?GQG8xNAApxLZXHu1TNadhvfGjskT229J8qWHBUWzq8WxXa1RBRTKwzLQisnV?=
 =?us-ascii?Q?TCTj9pN7yylXh6rmWZUF/cIeG+IdXwm8ifJhsKNCgMOcFaZQ+QKqzY+64KfK?=
 =?us-ascii?Q?g9FqLz6Bmj8lA2hVkP+qMpYGydIE1KOsjZZTxacPZKD449n+n4rA/5dpbGJV?=
 =?us-ascii?Q?G8KF4IoLrOvWe2M7nvKJxgBVLW69CcQD7fHUDjVdnAeVPcx+7aycd3dfbzJH?=
 =?us-ascii?Q?Ae5Neh/0U8LKrpaLAPR6hMtCJN/QPUmcIpa1gCg9eIne3AIZa3H9GbdlkdR/?=
 =?us-ascii?Q?IcamSi90XmYg7S5Me30FihRAdIKt5XChVO9Hvnx8LuIbQx+asoTUpeItF+ha?=
 =?us-ascii?Q?VZsrhSXR9pSEH18N1WcTGXZIHoog/Cs64E3Qdzb0MvSVFTaMFPKh8AmKqKJn?=
 =?us-ascii?Q?pbuz+VliTNiD5xcXNDyxOWBMZuZs+GBHi7zpLLea5FC1Pz1T07WfcVmbkzHF?=
 =?us-ascii?Q?tUMnnGnPU7qyAV++pmr0254U7FC0DhuZV7DlfHK7MLbvFI9OMLefFV+e7Dtl?=
 =?us-ascii?Q?yrRq2SfJVofRHLJVTGnfblEPqWIiYrZ29AVjcuN4CgJde90uu98xusQTuhg3?=
 =?us-ascii?Q?fE3LHujrKpPsWpAadve86CjEK6YM75cHoCGsJ4YRkDpPQpanxezy1KYdYJlM?=
 =?us-ascii?Q?zCJdyjnpjN8RrPsV4z0mgqseUTDKrBZCY2sR0X+AnnAemtCgijHmJ88vxFr4?=
 =?us-ascii?Q?smi950I2kWXlUtxFOgB2gIIon9yBtrAyVoMGR3F3I4egbDEnyCJUH3VBK1jq?=
 =?us-ascii?Q?18lNWMNPtPYMMzBFgqU0OsuJQybZZUyM9aA5dyH9Ox4QsbKQOYgwG8vHl+Ss?=
 =?us-ascii?Q?QF2ZwGsDC5P1ZhTPQNzRWmvjZT2MtGnlC3PxR/BE2HrcS//cPiD/U3SG0r84?=
 =?us-ascii?Q?OTMYLLNpGTA3N/A0vaCW6ajl+YOlviGLxOck1LWon15g6N/Z4rDAqAvgM2YH?=
 =?us-ascii?Q?Gktp/XKb4bExqpR+yJIschIDqD5CTtjXV7/P7Lyo739mJWU1l2ReMoXJqaVX?=
 =?us-ascii?Q?P0srnIppyDoudgFeiwRvh+GpOOKtMfG2VZO25Th8lFtoUwClg2C2XcVcYI7b?=
 =?us-ascii?Q?RxKZRN9iDIDcbAeaq1KA37qSWOaKjEZ25y/gpMofQ+caBjAYEuuj9nonz0rv?=
 =?us-ascii?Q?jVkqYkJVD1q7WHv3BwklTGrCwyjnIUGgAUL/P6SGJRqbMiYSJvfAL5ODfA6E?=
 =?us-ascii?Q?MCWGvG6UApfJs2xCMvZMaKzQEWYfPuO3/p+vwmgmhLYpAsNoX7zPtH+7AW62?=
 =?us-ascii?Q?ADKjMQnKfzkzu/cH/OhuEXe2SwPZXM4MoEvRSo9Ri+tPDTleBCM3lC4stUHG?=
 =?us-ascii?Q?P331l+kdcR7+boG1N9RQKBAiKmbiokSDx8hvIOa3SX3Nz4By+hnWJCnFRLHA?=
 =?us-ascii?Q?ww=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1688.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efcfbc1f-ffe1-46ab-cff4-08da9cec40d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 22:46:14.0134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wjtZWWwBag1WieLsgr7AWmAnw0AjOVqLj7xKVh0HFk+mAz4mhEdYNPnv1Ysip+jJpz2Y1VLkmgLJyrYZmGY4s0+lpkwl/fBMYQAQyEMHs2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR21MB2062
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

From: Saurabh Sengar <ssengar@linux.microsoft.com> Sent: Monday, September =
12, 2022 8:33 AM
>=20
> Existing code is causing a race condition where dirt_needed value is
> already set by the host and gets overwritten with default value. Remove
> this default setting of dirt_needed, to avoid overwriting the value
> received in the channel callback set by vmbus_open. Removing this
> setting also means the default value for dirt_needed is changed to false
> as it's allocated by kzalloc which is similar to legacy hyperv_fb driver.
>=20
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index 4a8941fa0815..57d49a08b37f 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -198,8 +198,6 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
>  	if (ret)
>  		drm_warn(dev, "Failed to update vram location.\n");
>=20
> -	hv->dirt_needed =3D true;
> -
>  	ret =3D hyperv_mode_config_init(hv);
>  	if (ret)
>  		goto err_vmbus_close;
> --
> 2.31.1

Reviewed-by: Michael Kelley <mikelley@microsoft.com>

