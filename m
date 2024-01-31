Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6939D844390
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 17:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736BF10FADE;
	Wed, 31 Jan 2024 16:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2114.outbound.protection.outlook.com [40.107.13.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A9A10FADE
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 16:00:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaD1pWIUhKFxe5SkX1C5si2KP3QDGNfkTe9B7pAgIrO54DL84zgS6gUj2RnL09p7tGpdQHamQ478bApOMuEcS9yfnb1bQRyH9FJENEHQvaseJnM0l0m/zXJr779HYAKWnBe1UeAjciSYkXTxBUTQF0X0QcrFU9aHZEo7zuzZtGaQWgJFT+cL7M1zX3JyfHkavsicgzd7BxbrbDg1N8RljvWNhUnlhQBiPY3HX0YdQkZRAT7KcPIMLAWRqe8KCX698mzoj6/oQPhvta483MlYnSmnik2Rs5SKFhNa8cojgIesXZh4qkc+MBUXFbgHdWwsty7bpaOSDv+1LI7kseXwhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfEq0nbWwNAVif0viQ8X+rouNSLt5H8FFxVajEvbxiE=;
 b=K52yyp9q3ks7QLtfTyk/toZBuPdC8x2/RK4F/1HZWMrp4b01ll6Ue/1MSdLHMIkqL0Y2lq3Y3s5BMMPtpar1qzAfcnexJ3W1Ym0SYZyxdEVH5dqg5QgK3GrT7C2/QdxdRfPxRdI+Ar8I01MPXDjY8VhSlUlANeI3xx+CRfumBVbERtaxPLa5ZUBd+9ybBThTIWqMIrLsdGZxTxGJ4iPO6vG22LcGA4utRjPKxmHN6UwWSO2s+N9deY808zdJqDkXJwbFLd4wqbKeRqeVF3ILJ45CoElLOKZClRRhGXnwo8ugMGV2oMDi8IP4ml81MhiDgO4ugJAPpF32kCG9oA953w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfEq0nbWwNAVif0viQ8X+rouNSLt5H8FFxVajEvbxiE=;
 b=N8CjPHW1NINspmGK5hUlYR4J/XZmetPA8RunOZ6WRlYlbhJFBLLUPalv/jB1eMNntk/6LYH5ei6JCSy+C2rujc1EJBAqqHylUs1vgRs6Q+k1+JPWaw9jvADv/l5mWnbLqJKgAQcRK/72+7r1AFaV8pUSm9Za+pcNavPU/KvBLfA=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by AS1PR01MB10126.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:479::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 16:00:30 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::f272:d554:d6b7:13cd]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::f272:d554:d6b7:13cd%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 16:00:30 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Sean Young <sean@mess.org>, Lee Jones <lee@kernel.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller
 <deller@gmx.de>, =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>
Subject: RE: [PATCH] backlight: mp3309c: Use pwm_apply_might_sleep()
Thread-Topic: [PATCH] backlight: mp3309c: Use pwm_apply_might_sleep()
Thread-Index: AQHaUgGOFtuwrSusFE2OvXE5fNuSCbD0F/6w
Date: Wed, 31 Jan 2024 16:00:30 +0000
Message-ID: <DU2PR01MB803436CB9EB04B690143F864F97C2@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20240128154905.407302-1-sean@mess.org>
In-Reply-To: <20240128154905.407302-1-sean@mess.org>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|AS1PR01MB10126:EE_
x-ms-office365-filtering-correlation-id: 99e9f8b0-6401-4c0a-2786-08dc2275bfbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: COOz85YMFmoCzr8Mh6WXO3D66qnG1ReC1gQHQypFxK/zeL2cyvqsfA5zXotuH9ELlUDqHnTpP5NLnwtwOO4vChdkAoIPLwWJgbksP6QSTxbj8Bq6KIWiJSRi7MDoMa3STviEHn9JtmFByYOP2iRKyvUXoaxnMp/7AKLfcb217JUOvDGocUxvob0LAZILQrquP9THSKVPRmB8yJU+0J4NvyWUDsBMhhEQBx6wTTyx+XcHDLs0OXsDC9OjVT86f5YXUGf/Omui6nfHOZG3j9xegzoYauzmes4f/NFWofw7CEy9XM4R/rwJtX3JB1F2wk/ox+e2Z7xVwEkTKxYgIN2KRDlG5HzCBN31fkYMmEEBfvLRKTM+uo5LHiWTefSbIpk27RpmIN4tKT46Hr8ALtvlYiczfy3p80hXqt/8dx1fpG6qR1DVKjy4Xl/qnUVPUFlZsXGQf0OIUvTdC3bTlhA5rvLw9/8OVbs46A5sj5Vr2B1ZZ7bho6cXaaTxtQXJ/5jLrUgZlI2GgCofMcta1y9iqOtB7JF9vGdCAHlIz1JF+vY8drTsgvd2c6rkvdq1985nOQBxJMsp/rbnlVpD2+0txBVX92OoZBDKasK+sVjHV0HKS92+lRD+6Ij0fHkpzpIn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39850400004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(38100700002)(26005)(9686003)(41300700001)(122000001)(54906003)(5660300002)(8676002)(64756008)(66556008)(478600001)(7416002)(7696005)(2906002)(316002)(6506007)(4744005)(71200400001)(66446008)(66476007)(8936002)(52536014)(76116006)(4326008)(66946007)(110136005)(38070700009)(33656002)(86362001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8BLTTUWMOc04TFCj77BY5Zg/ji2e835sXMUpFKF4l94R7f7FgwPmNOMBz1?=
 =?iso-8859-1?Q?zYeeuUx8HHlWfWxm8YNXnwjkUS0k2MKFTOXIILo13yVgZOFRN0g0sRcqyQ?=
 =?iso-8859-1?Q?AmzM5JP3cKddnW8LaRXxge6baiwQdYnOFXEpHK1uRCEyPCs99L23i4o0t6?=
 =?iso-8859-1?Q?/2xUv7sYtkkeVVOD0mAiIH5EgUkrYXT0PLh0WZnPvjX3iXtfoBhsjvVmm7?=
 =?iso-8859-1?Q?tdrScKYURVDbjsJv+JQ9Wg54zVMbVdBsWiODYsirgr6aLy260CumG1TKWd?=
 =?iso-8859-1?Q?qxN0r+5dREJGhchph6Hf/SrA6lqnm7kcwnSYfejWBvR/uDPVPAKmDNXGn9?=
 =?iso-8859-1?Q?MwRbWrNJTuMwWRxJAvOzKDKPGyiY4tX7zm2e5AzYClAOqqoU/7LqascTOr?=
 =?iso-8859-1?Q?Caegcb/XOdf3eo6G22SPAWCVVySUQ4Wzg0evatUzh+g75l3F9ttAmM665h?=
 =?iso-8859-1?Q?HrokpzDBXasC4KmGGltIZxVdLhWCDJAvYCG5rYXQW+t4UjeUYlcbFW+NRx?=
 =?iso-8859-1?Q?STYrRNLz/vd693vi4bJlkWOGT97id6847zJQjVf1boH9GgjehXh1I8jgUq?=
 =?iso-8859-1?Q?CDYlSCG3sWUnKnj9k+AFDIVTwCDQa6J+1tPySK6auSYMjdIHb7n/pMdnwe?=
 =?iso-8859-1?Q?VjpoLtA+/n1M9jNcC9R3o+1+4DDHy3mPb9zAAAWI6O2lzJgsmD63QVBrl4?=
 =?iso-8859-1?Q?HClDC8pZ+dMnGRBwlNRPv90OAqgkFv9vAbG57RfdC4wzoaRdTu5FTy35mm?=
 =?iso-8859-1?Q?LZ280YoFTRsHn0ONR/YhnKQ9QNvO3j9Bv5UaOs8WJh4tVzhJGVUnvA3n50?=
 =?iso-8859-1?Q?Y4sO0y8ctDlnP8UxNweghpPRwYkrBvNs8smlWUNgrlG/VDyr0sTZreKeJR?=
 =?iso-8859-1?Q?kCh5TtRlnPBLhRTRTmpu8XkswdNpBYXIHr2aeasYlKE+DkyPON+v2WDQFf?=
 =?iso-8859-1?Q?WRPzAZOEGa3GvEce8VvPtjZHltBiHqBphpnOiZOlFmmQcOTFlE1zKzd/5v?=
 =?iso-8859-1?Q?dqsvLbTysQIWPRTEhmexfq1M1IaC54ow3NgUERySmyWxTMqp7UU9ozXVHE?=
 =?iso-8859-1?Q?jbiMWgpr6akHjQI1Q0nK+yS0Wrgk3Vxu6EUYfwFkqtxqX6S5Dy8MYIUOBm?=
 =?iso-8859-1?Q?ujYexfODS0fbHH+3BrpFCJt2O8B/OqMdnKr6ZXGNTSMJgO42ot5TClW3dK?=
 =?iso-8859-1?Q?3H8jZdC4W5/+m45Hp40YJGkVElCFU1PZfhBncWcGN+ALDoo7vlcWqvDXx9?=
 =?iso-8859-1?Q?HL24NPBoGLdm1X7CbxLztKOElKGSAjmvq9bzvFt9B+/GlHyeeFcDHU1wd8?=
 =?iso-8859-1?Q?hHRQ3HUd6usSlJY0P7TxYAx+eMYNXofiqtk+Qx6q+OpxtD7atbt5Y+qDP6?=
 =?iso-8859-1?Q?/ei8rCp6IgUIEgjzRfaywir7xwJKdn/7XoUUuBCMaTvc4Y47+T/oS9hygU?=
 =?iso-8859-1?Q?wTZL5GCvnCfPuhKPBzdrRl1uMvcwqAeqOVxIHKw2KUwPkA/CCXKQVkhbpe?=
 =?iso-8859-1?Q?l7sb8O5+f7N4fBQceqiSuBlFfZK+hYuTSYjU2VVd67H5udNjd5un91mQqE?=
 =?iso-8859-1?Q?wKyb3GKG9P7KMpGeBvADXrFPJAWsKvkQEg+TfdpdzLOd2FRFhcLOhJBz0s?=
 =?iso-8859-1?Q?rn9T6zMgH0oiA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e9f8b0-6401-4c0a-2786-08dc2275bfbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 16:00:30.3028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qD3FbrG1XJ5PYszVLM94znaqW1AauFKS8RdTZaMUB6M4imjUSwzv4oeJ9a+LZm9OrmS9FT/zBTnaCgAjYya8Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB10126
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
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sean,

I've just tested your change on my board that uses the mp3309c.
All ok, thanks!

...

> Subject: [PATCH] backlight: mp3309c: Use pwm_apply_might_sleep()
>=20
> pwm_apply_state() is deprecated since commit c748a6d77c06a ("pwm:
> Rename
> pwm_apply_state() to pwm_apply_might_sleep()"). This is the final user in=
 the
> tree.
>=20
> Signed-off-by: Sean Young <sean@mess.org>
> ---

Tested-by: Flavio Suligoi <f.suligoi@asem.it>
