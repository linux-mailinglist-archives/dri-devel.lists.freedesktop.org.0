Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24519FF697
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 08:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DA410E1A9;
	Thu,  2 Jan 2025 07:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scioteq.com header.i=@scioteq.com header.b="FUwi5woe";
	dkim=pass (2048-bit key; unprotected) header.d=mail-dkim-us-east-2.prod.hydra.sophos.com header.i=@mail-dkim-us-east-2.prod.hydra.sophos.com header.b="nd5G0OOD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rd-use2.prod.hydra.sophos.com (rd-use2.prod.hydra.sophos.com
 [18.216.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E7410E1A9
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 07:18:14 +0000 (UTC)
Received: from ip-172-21-2-51.us-east-2.compute.internal
 (ip-172-21-2-51.us-east-2.compute.internal [127.0.0.1])
 by rd-use2.prod.hydra.sophos.com (Postfix) with ESMTP id 4YNyjK099CzdZML
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 07:18:13 +0000 (UTC)
X-Sophos-Product-Type: Gateway
X-Sophos-Email-ID: 09690140e972458d8080efe2493287cd
Received: from PAUP264CU001.outbound.protection.outlook.com
 (mail-francecentralazlp17011025.outbound.protection.outlook.com
 [40.93.76.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by relay-us-east-2.prod.hydra.sophos.com (Postfix) with ESMTPS id
 4YNyjH5bptzFpVZ; Thu,  2 Jan 2025 07:18:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poM4jiDymC4ZaArvb39gSComd/Qf+9+Uv/sTqXUr/cqKdg+knbmDeSCe+TGvM7Fr7DcIG+QhvXrb8+I0fopa1aFrzBYG1yvUA4ZkwNt2guzoimbaYPhufNCWuiRnolU58GoEVU7I55RKMbVXF0VDdrH3iKOm/GytfHqz4g3/O+dTFQyVigFKc1nbNEDrqY9azJIcM3mv9uYTQ2jZTUFqkqOUuoLKXkNWuKtfml223vwMi/Y0juqfbdHulCj1uusQ5uVsvFrZQH94ASA0tswh7Bsx/zBb8eoDSJ2bVb5ozVChtcFLsjkLKZoFqS5C0JRYMu7OH5kDk/Zjt8a02MtRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnUCt1KOAL5e0JJvi/TPFEJlcx6UpBUzYEXD8mKS00I=;
 b=CXTJOY8Bz5q2BRsxTLkB2k8kWjjYKwNjMrFKTbK1QoM1c3ANTS3vONnn1PxmnViYsDbEqEOuByOzoUTzaI/BXPmEIT+Db/jw/r4MYvJ3TzCZVvuZgJfCGj5zBa7AW0AHGNfBGqlmyC3tLTwl6Td6Ise5bXA3OJS/+aLClkkVioUY4+xhKykrDsS3Fd1upQEWCToY9fkyaN9d0DO9xRn9uLuBq2Vx3zG6TxKQMjBYRoqsg0lpYkZBejNB3tWsgt1j7xdIlTrGn6+RmAVsFvBZmbPgjiJf1NOrgf+h6Qf22ko8YxPpQSvR7+/V7GvZsL6sNCtuSLJJ2NT+azvk/NMTyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=scioteq.com; dmarc=pass action=none header.from=scioteq.com;
 dkim=pass header.d=scioteq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735802289; 
 s=sophose3b6b7cefe1d4c498861675e62b33ff6; d=scioteq.com;
 h=Content-Type:Date:Subject:CC:To:From;
 bh=DnUCt1KOAL5e0JJvi/TPFEJlcx6UpBUzYEXD8mKS00I=;
 b=FUwi5woeq8wlJgszdXIBqTWL6qmw78ANxDKUBxRNTqMed+blbLcLsj2qdlk+fUdA
 m74M03oZTPt/RnXqWVaI2KxQvQFSCVCbof9LDfVJv/5LwcLUMFXuyrRPOJjgz4wMfZe
 w3wv16vdhlqFztEKloj1qR9ax+OKjGTxrpbFRGWKnVSxjifMyY5db8kRnRYPsjatk40
 IutSVxBuo466n9CM5oeOzatOxTTCQhaNQp1p5BEzxCqp52Y35bnj6OygxPhbkGpclr8
 OxONah3EZf9jeV6haLVmCJPfkA0kQagxTV92s+AYWtXN4v02hWTebtLIIZbw0nmBt+3
 nA0dwjjfcg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735802289; 
 s=v1; d=mail-dkim-us-east-2.prod.hydra.sophos.com;
 h=Content-Type:Date:Subject:CC:To:From;
 bh=DnUCt1KOAL5e0JJvi/TPFEJlcx6UpBUzYEXD8mKS00I=;
 b=nd5G0OODiBq8dmRmssBvRZCBY/Ts6hvFqAJ9tGmygknQzDHA66vk/3b5PVYaHujF
 ciKfaAojyPS2ExovyMLQH6hGvnII2xl6WDUJ6KOQpDy4T3YrMkAqZjg5OprFic97fuu
 dUrHMpduwbyx3F5DuMFydTYHuxS3yPJVltwt4UrLU4Hqu9MnmUcPLAKRexaDvBmDhjW
 GLWelN9CijBtZEDmkgnuIQdeZKq3rfAPw0W4XLdVsPixWHfRVzW73nXLADrblT36Y7/
 CEln8u/5Aenar8W+1RK65D9t2Al3UliLar9GtzRDiN0VB3eEijzQPdXQbmW/JhnIayf
 aRTOIp9mdQ==
Received: from PASP264MB5297.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43b::20)
 by PAZP264MB2750.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Thu, 2 Jan
 2025 07:18:09 +0000
Received: from PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3de1:b804:8780:f3cd]) by PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3de1:b804:8780:f3cd%5]) with mapi id 15.20.8314.013; Thu, 2 Jan 2025
 07:18:09 +0000
From: Jesse Van Gavere <jesse.vangavere@scioteq.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: ADV7511/13 implementing atomic ops and bus formats
Thread-Topic: ADV7511/13 implementing atomic ops and bus formats
Thread-Index: AdtZbi8EHgRPTTpYSqu6qWF3rjBzcwBWKoWAAIexfNA=
Date: Thu, 2 Jan 2025 07:18:09 +0000
Message-ID: <PASP264MB5297004868639446AD16E7BAFC142@PASP264MB5297.FRAP264.PROD.OUTLOOK.COM>
References: <PASP264MB52976B917B5F002234D72DDEFC0F2@PASP264MB5297.FRAP264.PROD.OUTLOOK.COM>
 <rh4xzo2cxciakrmaiw6bm4hfx6qwf4zj7bqwdzzdovt7rp4wrl@ir34ydimkp25>
In-Reply-To: <rh4xzo2cxciakrmaiw6bm4hfx6qwf4zj7bqwdzzdovt7rp4wrl@ir34ydimkp25>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=scioteq.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PASP264MB5297:EE_|PAZP264MB2750:EE_
x-ms-office365-filtering-correlation-id: c3bfc1a7-36e7-44e9-40dc-08dd2afd9c78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?yvHN72gmVEB/xXzELpA3AB8T2jKiliMQ7hSHSe3vHQpJs6LWHd+DqulLvKx2?=
 =?us-ascii?Q?O9QTOpP9r/roR+mOv3poUbWHH8hOFpIApp72d2IMVKpN3+OsLmhTaS7xmjqm?=
 =?us-ascii?Q?pdNZSAJu1lnDwfjQmYbf5Tm1gaSFCggWfPZq6FAf4SaeBN1/vksc6npc1/y2?=
 =?us-ascii?Q?wO4qX86t+p/Ba/0m4UnLHYiP9JAPn81JTQDf8sXOGLKR0e1whqCnxHtOvx1y?=
 =?us-ascii?Q?7CbZqRznA8fzOwJ6O0b1QHD4awfK/At5JpU/L6YN7Ejw+kG6J9VgR9npCNee?=
 =?us-ascii?Q?69DiSmE+ORxnC/CfClfguyXfdR9WJXTcMDkkCJxgPwWzxNOk2ZeHH3L1/DAT?=
 =?us-ascii?Q?cJ8L4LBG6DlywxUL1/HQ1/iu0Vh45FpnsSK1QoUn7nKrVNdldzFKpDhzY0OJ?=
 =?us-ascii?Q?bPLO7Z85B4m2/11tC0Pfd6eXEvhH0Y7F2JvUQ/ZKKEQR6UHR0IteNonMOK0+?=
 =?us-ascii?Q?8osi5V2uSQR+Lwhk+lWyWKEvQjoWETMkm+ccLB12qsuhUtwPcaL9glinhABR?=
 =?us-ascii?Q?DTHrWxA4BBZlZ4hFtBWLPnYNxpj3qvfBWe1BOgWsZ/v8d7tjfNRMfv6l/M8F?=
 =?us-ascii?Q?XhrzBXxR/dqLkDl21p8ZbmwPx1lZEymuYzWqwjJP5ttP/EB1MYeUJ4KGQuHv?=
 =?us-ascii?Q?wE09Gka/KSiG2tcoBaoLRGJXRrzBWymsQq76sFYRmsOzY/Y+L7EtUomkd5M3?=
 =?us-ascii?Q?PoA0PGQqxQNK3jbSxvWpJgAsfrd9+5lE+pVSG1rU7RD9M9ZFNHcpY/r1DwYv?=
 =?us-ascii?Q?fSL23a9q7IaK4Jz+Pxl5UP+IVgMS7VqTbzfLch6iCgzJW+BZt9vPPUFIS2gH?=
 =?us-ascii?Q?lkjwQygAcLKQKrULKJi1HDMwsBzcF5RF65Bf7+CdUMyfkfnKMztLWWJbyslR?=
 =?us-ascii?Q?a4HyAdNsXJJVcuW1Tkv02gZCGwpjVmpmkdmUtPBZ1JojKhsFVHOGbOx5KlS7?=
 =?us-ascii?Q?BJlT3+8WVfByNT2xALwvZXLb1El0MNpUglTvAJf3pup2rD3EfAPPzGJrb3BE?=
 =?us-ascii?Q?1jGpaxYfHAfKEuBpjw+tmQpYiJ7TwhyA/zSRbp09sC3HDFjsoUdYZjAv1nL4?=
 =?us-ascii?Q?es47SSkx2o+h0vebVPT2poEubLsyBM+GK9itKK0FoJFt1/BUOu3yr06cphbH?=
 =?us-ascii?Q?MDXh861umS3zpiip//Jl9SIJZHRCg2Z2IADJLsOVaU8vMC/0u3q81ueacISw?=
 =?us-ascii?Q?IoLkDDLkabmwNbsGVsjR2EwAAqBg00CiFXIHgwI2wmTydNqSxIFWXofN8xdE?=
 =?us-ascii?Q?AthqO9CKVwZQnHyYjPr71MqnWn2lC2c+jMLDSbGb+ledrhGBF2MkAaoFPVB2?=
 =?us-ascii?Q?CWRRTOaFPPD7kqVbsEJ/bk9JgDfVkSoE7R0Yn/oBw0jqOysIKskWD0SQNctM?=
 =?us-ascii?Q?IjtiUTA1rvunXNBamVGvZhz8c5hicgocrpNmS+TlDEuoLOWXOppi93OXMeUu?=
 =?us-ascii?Q?/IzcVjaTMw8y9EDR0Sm+LwLCBM2P06H1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; 
 IPV:NLI; SFV:NSPM;
 H:PASP264MB5297.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE; 
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lVA41+sZlvkRSDpXew/7M2affcp4jBoDNCMhy9Hcuaq/jHl+a6va8PAnLPMC?=
 =?us-ascii?Q?FOb4bUsGN3tDQ30MWY30U9VTeO+/6RCYegXwnfJrFmFlGlivL77bRlX0Z/Tb?=
 =?us-ascii?Q?ySmvLroPScd7mA21tAY3AUYLo3y/bSElSLpqM0dVTb+sBofZwWYANW2Ec2EV?=
 =?us-ascii?Q?R3MWmHBqO5wxLdZI17rKwAJ1FHczefyp57u8UumXj747cxXkXfHe0bG43cpz?=
 =?us-ascii?Q?KhXKL0NXkll8Fem2EszEGrsWzOq5/xWuLFfbJNmuNR9zlTdjj0F97BGbExUx?=
 =?us-ascii?Q?3hOpH/nzZOOnmjH6Thry45ytDCCjEr413lnpQES24BunD1mXLbWxtttuEGNW?=
 =?us-ascii?Q?4Z95uGzdfeGUfeMu7dEfse3MBmAAOMaWio2GWyOdM5ztNVdW5iHJvggwTpQe?=
 =?us-ascii?Q?PbhNp49UcE+0jOjSr3aeAQIp7rZJk/13yskpRulnR6WbJg87GFVpyiHKwKo3?=
 =?us-ascii?Q?EEQ0l+ENwvE2AFiBCI7vX1CyxtsVB00E5ZBOD6BqhwUdxpC6xaqxS1b0uM8F?=
 =?us-ascii?Q?El9tGBfJrZNLISMi9AfOHHoxxw/90Tli+EJb/BiCuuDv4MlhTNVRxslgYSlz?=
 =?us-ascii?Q?uvfdifQH4GlV5iSjxcLTUOvANj3oYvShH0O6liCBoBrNvIW7AdM32FdYtxCt?=
 =?us-ascii?Q?rCPbtN7c+sp7Y845dwmM7CxDcS/RaHbnLY2v78O12JkVYdTELBtsftOKWrR+?=
 =?us-ascii?Q?8Bp8LtsrIWMhu8Ix6D6u2RIp8WqCi3q3Guz09pbUy/+arCaMu5vVtS2lZOk5?=
 =?us-ascii?Q?ze8yDcpUiC+Bdf7Htx5xyCBQgw/E9e4QkB6HpbGXgZTe2BrYZ1VJDRERUQc3?=
 =?us-ascii?Q?5jvEv4lqVOlDzHn/KOExi4ytlAHjXsYi6QCUld6WX4EUvNp0P1jk9+2sAPVt?=
 =?us-ascii?Q?A/MFxJGE18prrp+mK+keryksfnLWIBD27FHplInO4bARPFMBKmLlaFf5FT1U?=
 =?us-ascii?Q?OezA1rVAgv0OC53k56f0Or7QhUZPG1vawTM85E7fJPvS1pMT2h70hJHORcW9?=
 =?us-ascii?Q?guM0mQeLGgTP55cqPxGz3EuoUIpwArgTRJO6GiNU9SznL/dS6nsW99BL6pQ3?=
 =?us-ascii?Q?Cy7pFzw1TLvFhFIxLOdJvx6EgdVYTk+Y2vbvWw/RwAiimYT09Qm0gfo0gWSq?=
 =?us-ascii?Q?hHxlh6P8xp3acwRkeqQnmVU5W7J3Kep7AM5bpgZUASLhxYqCm6fB3Xq9oWZj?=
 =?us-ascii?Q?G3ZO68AIYatUgANq5eZciumrpA7dCNg66SS+1aaB8Yom9BBZpNfuUEA3A/i8?=
 =?us-ascii?Q?3oZu9JI4ksIgoB3QGlId2DNjrHhKXoq79rGWcsEtr3opeivBdXFV1iYjqI64?=
 =?us-ascii?Q?g5/7Zz07rqpISBiGmOxu89rrFqEqbM9nS2QZ1f1SLjTLPkLk/+ZfJVSElvvV?=
 =?us-ascii?Q?JPgtJNs7mWdRwaAzVIvuNyg/X9kngs9jC4TTckXcMpbO8cJ10Po+OsZWPLOm?=
 =?us-ascii?Q?xkL8ew+7kv7G/j10K8jYQLiN6y2W0UHPHpvHzfF8Ifa7l1SY8C6NUGsNnY+o?=
 =?us-ascii?Q?Buv/xZlkhM4dZrToSL0Dm9CVzzjeDrKiHdNCCoCPvsefWTe7KwpyNq4nda9o?=
 =?us-ascii?Q?uHcCZSNgJbwVOGV0Wmunx8yPpkJcHu8eEl90/2qhVh8ZDcCWh3+LKRbBO/A5?=
 =?us-ascii?Q?ew=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: qDe/i1CwAl/p7CDIY/Fy7BmihuDITwJKrxC3+WAl15HBSavr/cv8WB40T2SR38yvWt7LYFNMordqKIVDjL4Omz5uqpgfX1MspGuWEC+schtGCv7m+sHTRriRdUN4wSIVWcDLu8K83Zdi6gGQ/ouT7puHG/oPovm12EAdre44khmM5VMl/IEEo8AykIUoOf+ag3naebwYzJO64EWG/MTA9zapA5Gxt0cE1eqKmNG0uGjeRUiSkXkwRiIJtlfvVUmTkEPvQF8RN8chq3Ynph4fsVsvJ9k12qIJp8dK0vWDOe0mo078+ASYSSNMp5E1EtwwV74gzOESEWOfqE1/qLZKeqVH2K4VKBSvqB2atu7EPB42hghS8FDE7wXH/oFswPyBijDd3G/ePXQm5dH0w79QJ8wiCEPkXmzL+9BP1++iJgxB45rv9j6EGTpTT2C96zdtXNtqYjLjNVFK3OW9mGvnusLLa7HqsZJ5EUH8D5hW3wokDc+8nXSxZnj/g6BorLYG68x8Q7hu8w7WFabnr8HczW9DmW+FVjclm/n6TWtVSjbZqhk79+GTEQCwDcC/HhNA98quaiYQFJyo1g8ltdOJRPJHFi6Ng7x6RFJb3yH+LyRNR4T64cuXyG1KhqcXFn3oCBsansU8Lr0Hm45FeeBu+vAeMoNQ7HK/W24xpOF0Big=
X-OriginatorOrg: scioteq.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PASP264MB5297.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c3bfc1a7-36e7-44e9-40dc-08dd2afd9c78
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 07:18:09.6207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f3e5b271-16f7-46b9-bdb3-4271ac933ef0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SHfUgicyDQD7r5J+oSH2GhoAMjY/spOFDYnXXHKHKOAt/gEpzZRx24yC5E66Bk1mWs9MI6dvX4nOqp9t5hu3s2aTeKiFFvPuKXOr5ucKtzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2750
X_Sophos_TLS_Connection: OPP_TLS_1_3
X_Sophos_TLS_Delivery: true
X-Sophos-Email: [us-east-2] Antispam-Engine: 6.0.0,
 AntispamData: 2025.1.2.63346
X-LASED-From-ReplyTo-Diff: From:<scioteq.com>:0
X-LASED-SpamProbability: 0.085099
X-LASED-Hits: ARCAUTH_PASSED 0.000000, BODYTEXTP_SIZE_3000_LESS 0.000000,
 BODY_SIZE_1100_1199 0.000000, BODY_SIZE_2000_LESS 0.000000,
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 CTE_QUOTED_PRINTABLE 0.000000, DKIM_ALIGNS 0.000000, DKIM_SIGNATURE 0.000000, 
 FROM_NAME_PHRASE 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
 IMP_FROM_NOTSELF 0.000000, IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000,
 MSG_THREAD 0.000000, MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000,
 NO_CTA_FOUND 0.000000, NO_CTA_URI_FOUND 0.000000, NO_FUR_HEADER 0.000000,
 NO_URI_FOUND 0.000000, NO_URI_HTTPS 0.000000, OUTBOUND 0.000000,
 OUTBOUND_SOPHOS 0.000000, REFERENCES 0.000000, SUPERLONG_LINE 0.050000,
 SUSP_DH_NEG 0.000000, __ARCAUTH_DKIM_PASSED 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_MICROSOFT 0.000000, __ARC_SIGNATURE_MICROSOFT 0.000000,
 __BODY_NO_MAILTO 0.000000, __BOUNCE_CHALLENGE_SUBJ 0.000000,
 __BOUNCE_NDR_SUBJ_EXEMPT 0.000000, __BULK_NEGATE 0.000000, __CC_NAME 0.000000, 
 __CC_NAME_DIFF_FROM_ACC 0.000000, __CC_REAL_NAMES 0.000000, __CT 0.000000,
 __CTE 0.000000, __CTYPE_CHARSET_QUOTED 0.000000, __CT_TEXT_PLAIN 0.000000,
 __DKIM_ALIGNS_1 0.000000, __DKIM_ALIGNS_2 0.000000, __DQ_NEG_DOMAIN 0.000000, 
 __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
 __FROM_DOMAIN_NOT_IN_BODY 0.000000, __FROM_NAME_NOT_IN_BODY 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000,
 __IMP_FROM_MY_ORG 0.000000, __IMP_FROM_NOTSELF_MULTI 0.000000,
 __INVOICE_MULTILINGUAL 0.000000, __IN_REP_TO 0.000000,
 __JSON_HAS_SCHEMA_VERSION 0.000000, __JSON_HAS_TENANT_DOMAINS 0.000000,
 __JSON_HAS_TENANT_ID 0.000000, __JSON_HAS_TENANT_SCHEMA_VERSION 0.000000,
 __JSON_HAS_TENANT_VIPS 0.000000, __JSON_HAS_TRACKING_ID 0.000000,
 __MIME_BOUND_CHARSET 0.000000, __MIME_TEXT_ONLY 0.000000,
 __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
 __MSGID_32_64_CAPS 0.000000, __MULTIPLE_RCPTS_CC_X2 0.000000,
 __NO_HTML_TAG_RAW 0.000000, __OUTBOUND_SOPHOS 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __REFERENCES 0.000000,
 __SANE_MSGID 0.000000, __SCAN_D_NEG 0.000000, __SCAN_D_NEG2 0.000000,
 __SCAN_D_NEG_HEUR 0.000000, __SCAN_D_NEG_HEUR2 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_ALPHA_NEGATE 0.000000, __SUBJ_REPLY 0.000000,
 __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
 __TO_NAME_DIFF_FROM_ACC 0.000000, __TO_REAL_NAMES 0.000000,
 __URI_NO_MAILTO 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
 __X_FF_ASR_SFV_NSPM 0.000000
X-Sophos-Email-Transport-Route: opps_tls_13:
X-LASED-Impersonation: False
X-LASED-Spam: NonSpam
X-Sophos-MH-Mail-Info-Key: NFlOeWpLMDk5Q3pkWk1MLTE3Mi4yMS4yLjUx
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

Hello Dmitry,

> The atomic_check() function verifies if the passed set of changes (in the=
 form of drm_*_state) is valid from the driver's point of view. If you have=
 nothing to check, it's fine to skip the function.

I'll look over the other examples a bit then but I think the reason for imp=
lementing it was I thought TIDSS seemed to expect it.

> I'd say, it's fine to ommit the output formats handling. From what I can =
see only dw-hdmi does sensible job of calculating output bus formats for HD=
MI Bus. The it66121 simply returns MEDIA_BUS_FMT_RGB888_1X24.

Yeah the output formats are also not well defined in the ADV75xx docs so I'=
ll best leave that be for now.

> No, each bus (DSI, DPI, etc) have it's own data formats. This means=20
> ADV7511 (D[35:0]), ADV7513 (D[23:0]) and ADV7533/35 (4x D-PHY lanes + clo=
ck lane) have different input formats.

...

> Just uapi patch with explanation and justification.

Got it, I'll make inventory of what's all out there first then and send it.

> --
> With best wishes
> Dmitry

Thank you very much for all the information, should really help in writing =
the first patches to implement this!

Best regards,
Jesse
