Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBCAA3E11D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F23A10E099;
	Thu, 20 Feb 2025 16:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="PqqvWBgz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011039.outbound.protection.outlook.com
 [52.103.68.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9307910E099
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 16:44:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FM6+r8CsZhlCTDq2bzAbOtRvmNCIiNl9r52ARwvGDF60T8McrzE75EfNFtcgT9VtyjJ9aeHjJc+BxzWUET4wxiylBm6eBsJz7OuOUy84th9dr+NSO3QQCnrgwWVp2nWlK3M44bxKRkdOcLqaZPldEeFLhpT3IKWLI6kwm8lzKD4q8TZmitr1LLhk8n9biHpQokoKL689hXfXPIcPqb0W0imTgx7AzwH4SoR55gNbhKI2ZaFLJZs3lPwq6V9hcnNgmQbuozgZdRlB7Pke6Z7o/MC4dLZYBnAi794v/AzzCEa8vDjSgf4Mcl5bE6hjqCh+yGckTfT3Z6EI+H8Se7EMcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtfvByskf5Zk4HeboQj+5SYcyI31XBrjW6lYuqO/pkY=;
 b=QBqTTx3Bh/IvCn5iUyU4bc0shQby6GhBDRIZEIUrF9PmbWaJb4+9wBuWsIvWBBmX3i+BGKF/nDbyX3UM+UTuxmfFSGg7M2boZzk9aad4JKr3Q/QV1MTEOYta4vo8By8YyH7NrWJkR74ho+dGH6o1Awv/Zi3qy+JDXjSTdW/WE69IImzDgQcn5A1GI3B7RL+MlKMZFm8PyygjXpQ0BnwMvGSXt0MHGg3wKeW4Vi4iGfF2+uzgl+fm8orKBvq92wX+d7kbgCSRbyG8R6TVSolNQXk3AYHDBOJ8pOhSWBIKgUT1H4osXRqQS3R82O7pJEfACALhPwrxJOO9khPYREIx5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtfvByskf5Zk4HeboQj+5SYcyI31XBrjW6lYuqO/pkY=;
 b=PqqvWBgzJ467ol/HQSWHVBd6H+twHOfk02yaNIbYTJjhgVcymOvh3SMzvLKE6/Ig75QLG4Zu1QQnpJyHZv+FwmcAuvJ7vkMVR+Nqnp9QEEIh40kmK+1NeS1zry71c5fgrN4QnG5BraIGiSD/FTNN8LXXqkRZndE6DNE/Jv4dvTrYChJ1rfUOrL3tRJESaq/Vw4j5Tcg1BVbhmRPyKDFC8KERPT/llAAcnlnUgHV+tbLKtDBsar63VufFp9O817lh5rWJEcQe8d4uE/VI67vpkDqqgBLXMjoTEzQ+CM7dqaMYy6mRVaEVF0oUkgBCR/+fN7G6CScVm4uXTOHFaOZR3w==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PNZPR01MB4206.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 16:44:03 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 16:44:03 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay
 <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
Thread-Topic: [PATCH 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
Thread-Index: AQHbgW0jg2AkJlVClEWW91xnm1SunLNM14qAgAA9boCAAS6yAIAAHTcAgAADcYCAAAhqAIABknWAgAALKXOAAGAJgA==
Date: Thu, 20 Feb 2025 16:44:03 +0000
Message-ID: <6C15EEF1-9C70-45C5-B110-6E9638EEB1E7@live.com>
References: <81731c1c-b74d-4b60-8c01-cda9a92d9c1b@suse.de>
 <9E4CE61A-1FA3-4409-B402-6C51D453B085@live.com>
 <95bcb1d4-c8dd-4a30-a496-e7e54717f124@suse.de>
 <PNZPR01MB4478D862E7B3ACDF1839191DB8C42@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PNZPR01MB4478D862E7B3ACDF1839191DB8C42@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PNZPR01MB4206:EE_
x-ms-office365-filtering-correlation-id: d94d0b5d-97eb-40aa-e2d5-08dd51cdc8b1
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|461199028|19110799003|7092599003|8062599003|8060799006|102099032|1602099012|4302099013|440099028|10035399004|3412199025;
x-microsoft-antispam-message-info: =?us-ascii?Q?UVFHtQZ1J3smwCHbq6J/GxlMjwY4isn5xDUX/FOCTua6NeBIaRJWkkrmN7Za?=
 =?us-ascii?Q?ZKWE9Aorq0fiiawAt6txv+LyNRa/ILiZHgXeWoL9uao3NUHCb8xogw1RZbn0?=
 =?us-ascii?Q?NFfuGGR45Fhj3jOC8VUJZvlKNks9oQJgzRrRvl0o5ty/Qpr+HofHMJk1xNIZ?=
 =?us-ascii?Q?3pjRBCQ11O9wlrI5HBz3cnnoQAlAh75F8Y0uHF1W2Zj425W72MpknYpXO/XV?=
 =?us-ascii?Q?0taSW519fOjY/Jn9gblvVGSvPDrQpkcNMzPz/p4Dfa1UCTT2PnO5hEQUHG35?=
 =?us-ascii?Q?zPjIFfRAHNn+lYTOdXZjJMGUzBYbG0sW+eBU0bcx2GJFM0A73+3faiLmmYQB?=
 =?us-ascii?Q?+E4ymeo0npSsTlU2sdXEflBRQFmIcSLsqKmrRemDBQgO7abGsQlQB8TJyHfQ?=
 =?us-ascii?Q?eDiOJcgtNiwC8o0b94HzoNDfs3allK+jpX1jixBkiatqMk32UBw4FrEmD/np?=
 =?us-ascii?Q?hegvk5rlssgQvucrUZ82ucyOAFdGdOFSPMPqpdsb+3o/6Re3O8vR1CVQ+ro3?=
 =?us-ascii?Q?7m50KSZtkqx+z1sWJ692QUAHr8voLHQV37bthdi4KRJfiJm1sIgkXEso8DbF?=
 =?us-ascii?Q?+mMqV0GVdMSV5SmSVl7m9iR5zJboz4eDQsyvMZFXfnuObtjgNLLfKxjaGm9J?=
 =?us-ascii?Q?N3StOK7hi5/mGGQ1BteZYYui37mSqwZi9IAoJT8PcUzXD+tTZgaSmG+FoVzI?=
 =?us-ascii?Q?VzKfXlJReg6O34SAhCT+cpkkYeUddskTpcmJGHfwXoblfBo21fCA8ZStpidh?=
 =?us-ascii?Q?S5krFmJKAQ5+gWJyY+NXywAxzLo+gao6QQl6RiObnNtMbdEBns8lAw1NIbeK?=
 =?us-ascii?Q?dNGAfrEQYLPtec4dh5kMOYTk1FbUt09Dv+tYVOITDQXHMJ8AxYOO0cL6ruOy?=
 =?us-ascii?Q?IxP/y9J8u+wdQGiHU6hCNh1ojxwuz5Fa058EIm/+77PGXnTegxXRWY3OJuZB?=
 =?us-ascii?Q?+uDVt9lOdVh/XXMQV2Ty56EE2mua7GgYLJrTNFH4yJnu+xZXtYheoskDS4fQ?=
 =?us-ascii?Q?3roo/NSTJpdhm2pNg5P1+vMTslhW4N3yM8eXca+34PEJG/EXz4YA38J16XUK?=
 =?us-ascii?Q?EokI2wb4FJ7qb9m6r3Z/ikKZPJU4BSKZafNiMEC6vjvYSQebnpmJI9PLfMI0?=
 =?us-ascii?Q?dCvF46/YDyyrk6++Yx9UO1ZS0ztGHFB+o03q8jEvbnCPLNniEXnFO4EMetZs?=
 =?us-ascii?Q?ZPxLj5HiEvoanw2w?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Dc7FVTw70V+GKC33D+0hf7ZsTPLUVS+vCKrBitFhGB4epEIJceXKZf4LsvI4?=
 =?us-ascii?Q?4HqhhV1O99nzNncPLmY4FFHkygtVl1ejwCABT2xUu3CrXPlCIvI+YKtiROY5?=
 =?us-ascii?Q?34SFvSoFI6H9tZ2omXWvzc1TXE/c/TvRM/iifuNe7cR2DsoOQfYb5u0v60vB?=
 =?us-ascii?Q?qpc8Wfeh6QZu8uQE9KuQo1ZwAqa+h8eP7IMwW7cguGPFRZBnQSni2/ffF18o?=
 =?us-ascii?Q?FDr5f6x7HYwHFwHicqi5C89SVd9Om2AQhgoKrGSzwmtXZcE95VadbsV4tOrC?=
 =?us-ascii?Q?YrgesBpfVse3nwWv0BWwtcGx3VumhFkRodi6HWYnc1cfNlATbizkethlP7Oj?=
 =?us-ascii?Q?fEVT2R5JWzO7IzdY5UhUpczHeAwxW3CmmvlbCdXFmBaEfmbzZgPvutg0/u1b?=
 =?us-ascii?Q?YTz80W97SJYsmqCFQIgxI6M+UYOd7K+ZcLsp9vSfIgZscUlYuJ45J0DNSYfy?=
 =?us-ascii?Q?P1spta0XUvwvtwKZhFmwhVQ5RdVcsTORGtrwGoq6tDYtKV7g8ob6dQ6LgOlH?=
 =?us-ascii?Q?CiKq0Bk+kr/LKxyXzryjPVPUnWLqPCARNFcZVkkzNl8lMQAmgy5npEBptdjs?=
 =?us-ascii?Q?YRNaJtnCvEJPNYNIe2CQ6DjJspq4yMLpWuX5E7VxsibyPGCde8gb1FUTucMH?=
 =?us-ascii?Q?tyMtRMm7PXdkNypqnQzcoXCi1N/tY/7Usi1MVizDDCatchJQmhsqHOXBcTS0?=
 =?us-ascii?Q?L6z8X8C1W2iTo5Rtve0JO0aqkgFzQByhRJHkCnv42LX/Fbd+Ycvn6n5xJlQC?=
 =?us-ascii?Q?Zm86qBLqIUlV/ozO2IxmrQPOwrzaAIzX4pwDvo2v1MaoaD5j1yO47Vfu7Ibx?=
 =?us-ascii?Q?+cE0WaSnn+iGj4yM2z0AiyTiZAdk59bus8sxvTaiEvrbsjBnMYElt4+9snw7?=
 =?us-ascii?Q?p5x9bRIW0FtxuTrFVDZHsURJlPoc+ONCKyix4QB0rawtVVqwFhHRn2mhiulK?=
 =?us-ascii?Q?QM2hjgoUh/uLnCSZ6Pa1DDGrD/UpW97cKt6/+cSdCR9Uf2YbdrzbbTW0iDF8?=
 =?us-ascii?Q?8sOSqYCnFllj3gnQqkXYfZ2BIt0K6TaPhcCK71+4qKfIujvR19822+NOB4ih?=
 =?us-ascii?Q?TOgtUkG7k76knb3ToN+kEQxwl0VGnC7BkTFJ9Nfjr89pxGtQEDeNWnv9g/Wf?=
 =?us-ascii?Q?b3nD0HlJd78nD4reFh69uvZYSEj1lC1b9wrTRH12ylptB+R1KjYLYgaAHe4L?=
 =?us-ascii?Q?YfSfHH24uGlGlTXJyqEG7p0A+Bj0IO44lx79dRvux5R8t+JvjBSA+VgQPonY?=
 =?us-ascii?Q?j7trG7ZoAww0zBopeGzVOeyxSGGv0MX3SImxhrbi7eacMNTdYz3e1CwEnsmM?=
 =?us-ascii?Q?QWYexBzKMDi9JMPIElHQ5g7f?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1F5B05F3246E874A9103CEF79BE0A5DB@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d94d0b5d-97eb-40aa-e2d5-08dd51cdc8b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 16:44:03.3366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4206
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


>=20
> The thing is I am still new to DRM code and APIs, it's my first driver (a=
nd probably the last). I actually thought I could learn more here, but I'll=
 try to find solutions myself now.
>=20
> I'll send a v2 once all the issues are addressed
>=20


V2 with all the problems pointed out solved (hopefully) sent here:

https://lore.kernel.org/dri-devel/716BCB0A-785B-463A-86C2-94BD66D5D22E@live=
.com/T/#t=
