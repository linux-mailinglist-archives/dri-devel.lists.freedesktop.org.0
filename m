Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B80C970C15
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 05:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4639410E277;
	Mon,  9 Sep 2024 03:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="oIQRKxQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013031.outbound.protection.outlook.com [52.101.67.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD0910E0D3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 03:00:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvlfsjqzCshy07syRermM859RdfaP0huJMklOS7uq/f2bak2kwT7oWq8buBr0ps731DSjHSAkpJJcbmBl17MXHwA4+U7YNhXefDQUIf/6oV3MVrksbZC73gny7aonHUSElP+eMJIL+yr6ciw/GnH/Ex7TbTEp39ikdxY1byN9ETUb1IENgpzh4alfaHfpWtLJnJT4Isp2mwsIMJRRRVB/h0xRe7VtYFevp47wqHFUJ1sD6b6vruXPin51nwTdJpgGMBsi3mFIGGkstI+unWrNz8Cq3TXGLw9mCbpcYURzxEhUy91IqBS60Bd6yIWpdgS5QjNjwukE9x7H8mwWkSGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iwkvdl1D1NxX/p9JMbhSrlVwhWAoKUyppIISRIo7bUU=;
 b=mAEvjftM2A02du4DlNhHEgiUgmP4BJwuQOYLLW34oO0grr7YecX+t0umOW9M8v4nCHftl2BlNfQXmHsVHdDmjid+dR53D+yMMeOD3A1szLvBOQ7Pp5Z4R7GJB+CdA9IFfmItfWLkqzDU/3y7OYVmrnnPkkfHmZ/dO6bWgKTzjRPZklUoB4tzyltUbNU5i+lJt3nDnBJ84R6P+C4FDvPR6NpB7QRTXZNz+a7dIsghjYibesROOKuEJI5SJJst/spW2+MHFwXE7bUjx7jD96raqa9/47VjS0H48c8chZ7Af8UHrBR/FmxG+jPlM8G8GZyXIufjgbjZrM11ZnJ2j58ehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iwkvdl1D1NxX/p9JMbhSrlVwhWAoKUyppIISRIo7bUU=;
 b=oIQRKxQdld8BfqKaxxgpLm7a/ICldPN+6+aYvTrYosnRv2jqKm8cqbn1cL6+fiPqFp1r4LZBQXZT3+X0BEXdnAUX7Ju7MTuXISfPIrf5pVeNKy+HOlx4evr/v+Sh3c0RtDt5/aEiPxnMoc0c4bv5ohQwe8xR9rYlRtgP+WgrGGk77TGomcUudyFgj0RGJy02u83UD3jydudnpt3wk+/rcRNaUYayCgRgKdLYr5EbXgvVbuHhaBoD7Skmmad7PV3tig058hQqvTM5aMZmsDYXLAecIqqldWixtY7IMQyEL5nQgH8YVJsZX+re88TRTYpHBUq2GdGSebCW9ORLd46nzw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9734.eurprd04.prod.outlook.com (2603:10a6:150:112::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 03:00:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 03:00:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>, Adam Ford
 <aford173@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, Marek
 Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, arm-soc
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Dominique MARTINET
 <dominique.martinet@atmark-techno.com>
Subject: RE: i.MX8MP IMX-LCDIF Underrun Question(s)
Thread-Topic: i.MX8MP IMX-LCDIF Underrun Question(s)
Thread-Index: AQHa//6WtlDuwFi4/UGB5Pg318IjnrJLLygAgAOZQgA=
Date: Mon, 9 Sep 2024 03:00:46 +0000
Message-ID: <PAXPR04MB84592D4026EE5EBFBCC946A688992@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <CAHCN7xLL4hrTK1OqsqUa78cdp9ZcG0sC+cO5QKC3x_Y9-QVzSA@mail.gmail.com>
 <01d578b9-e42e-4767-a33f-b0892a602e23@kontron.de>
In-Reply-To: <01d578b9-e42e-4767-a33f-b0892a602e23@kontron.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB9734:EE_
x-ms-office365-filtering-correlation-id: 603732ed-cd23-4dda-7398-08dcd07b9a51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?M1JUQnZGcktNN3VVL3ZLZUw0VkNhcklyVzIyOXJ1QWF4TkZpQmk2VjZ2b0x2?=
 =?utf-8?B?OWRmT3FkQnRSM2V4dnBWWlBlUE1MYS9FdGw1Y05heWlDQXBiUFN3eUpRQytG?=
 =?utf-8?B?U2wwbVJ0UG9RT2FsM0I3ZjdKSzVZM0h5MzRvTVpKOVRHS1lGL0NGY0taYjhm?=
 =?utf-8?B?cWZGKzBmb3NXRnhkNG1iZzRiNUR0bSsxaFhaUzRBYXhzN1o2cWpMZ3FhSWxX?=
 =?utf-8?B?a2N2TUUxU3NML0lrYnN4dW80UzRpazlFVlN4Rmo0bFhwaFA4Sk9WUHVsRy93?=
 =?utf-8?B?NVcrQ2IvaGxVczRrVEJQdUw4RzZxQUxrY1ZnZWNLbVViNGRCUVplQjZqZ2FW?=
 =?utf-8?B?ZHhwOGxITHRQV252R0tEdll5SUtPSXQ4RmhWY1hzWjhRUnR5S3VjbVduWXh6?=
 =?utf-8?B?dTByQ083WThJUUtyUmxQc2dTclNWM0t3S01LdTVPWS8xUEtEZzNHRDU0Yjg4?=
 =?utf-8?B?TTZWN2JvUXI1Y3NkRGNOVFJkZEN6RVdqK3Vta3pNNm9zY3lYVkZncFl0UTBv?=
 =?utf-8?B?Ui9FNjZSSWZwQUZSTmUvVkV2VmdrTWt4ejdwcUgvcFBKQ1FVQWV3SmNHaWo4?=
 =?utf-8?B?bkprdUtaekE3ZklocmhtSERtY0RjckpzcTdKT3dpbGx4ZnFFYlphSTZXbU1Q?=
 =?utf-8?B?M1RaYjlTd1NHOVk3TWovWmdBT2pCMWE1VVBxTy9MVEJpSFVxSmRPamJTR3ZJ?=
 =?utf-8?B?aG5jUzFmcnlzZHVvTCtjSnJmV21RakpkZ3I2aUdHaTlLWkIvQVVsak14Q1pX?=
 =?utf-8?B?UGo1VmZWOEFaYkpHRlAwUzBnRVpFUTNlOCt1Rkg1VmtkRGlOR3hBMFl1VHhQ?=
 =?utf-8?B?NEZWcHNITjFuTEw1eWF4aTQvT1doa0NMSW0xc3lkaWhsd2tiejhQbmxhNlB6?=
 =?utf-8?B?eXFjSmtOSmdJUnh3dUFDa1dDbGl3SlRGUHZLT0o3MjlPU1hVdm1YL1NxNHRR?=
 =?utf-8?B?T0hyTTFUUGU3bWVHdVRTZk95QXJKZDJoN0V1RXpVUEo0aUJVT3lvaHlodStU?=
 =?utf-8?B?T3VMeGliRHRJSSswVlgyMERDNjRVWDJZazhoV3VHVkpBVVpPWUZmTWs4dW1W?=
 =?utf-8?B?d2pVa1Z5ckFYUWNWN1ZucEltU2hqYVBERkNzaXZKSFZPSnpJbDFGRlMxNzF4?=
 =?utf-8?B?K1hMM1NsWTV5dW9HWkFnaXVldW9aUlBEdUtGNk9ycjJTMkw2TXhZK09ySVE1?=
 =?utf-8?B?a01uTWFYZVhVWlF6V1hPaXE1OEFDdHlDamdZNUF3ck9udkxUNWt6Q0ZCNmZ5?=
 =?utf-8?B?elRMSHZEczlJd3dRamN1YUFBNGJPeFRkWVpsQ2h3UFFaUFQ3SHYyUVBZYXVn?=
 =?utf-8?B?WXNKRWlZdGE4Q1Q4RGVpeTJuaTc2amhXYzhCVEZRVzhiYWozN25FbmRSc0RG?=
 =?utf-8?B?ZitqZnBPdFVSME9UelhhaDBaczAxbmZOQmVoemNKY1M1dnM5dUNoY3FETzY2?=
 =?utf-8?B?OGlxYVh5OW0vNWZjMDVneFMxTUtsV2F3a2MvY0JYWExPYmhydnc5QS80Z3ZG?=
 =?utf-8?B?dEg2SDJVOVNTSkdEcU9yWnk1QnlBV2FRZjQvTU1VZ2szYW8wUHZYZUFFb1hi?=
 =?utf-8?B?Vkt3QVlpNkdxa2RMeFZNSGRRRzczWVM0dEZEVU1rTTViZUo1TG5Hb2J2NCta?=
 =?utf-8?B?QzRMbHpGZzRSWlM3TzhxT25SSllCa2RxSUFVMFR6VWJvaU9UTi91SDM3R1Zi?=
 =?utf-8?B?eTZOUDF2Yk5GVUUxbHA5ZXp0ZDc4TUt1UHlVT3FGTWZpNGhzdWNueWN4TDRj?=
 =?utf-8?B?ZXZsNXdMUXV0cWxyRU5EWDlUT2dBSThZVVRxV21CemxwWS9CMy9wRy9KTUgy?=
 =?utf-8?B?SXBxdVR1WmZwb1JYek5vQmF3dEdtb2tjN3pFN1p6a2Z0b2NxOHdIakZNMjJN?=
 =?utf-8?B?NHhmd0QzQkJEa05Jd0dxUWJuUmRPNFdwYjYxNjBOZnlzMEZwNnBBZmc0dGFG?=
 =?utf-8?Q?0e07vof8IPw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2Q0aThUQ1VPTnlpUk9sRmJmTnhXcFJsNHZVdDloSW0wQnhhb0JBMHE1ZFAy?=
 =?utf-8?B?WFRkWjRLczZ4VUVhR0JCUmdzeUFUSWdENWduYnRDSGpKMlZ0MkxKM3VSL3Zy?=
 =?utf-8?B?bVhLS3Btb3BoWEpFZUxwWUp0SnN5N3JNemhzVSs0QVBhM2VxSmIvcEIvam9N?=
 =?utf-8?B?OFRrWVY5YXlQRVNEQUhYWmttd3NHOGlKYVZVMEF4N2NHRDFHQ3p0OWZybElY?=
 =?utf-8?B?cW1QSmVtNEpObCt3c2drYW5PVENuYVpObS9qalhQbUJsYW55Z3pXL1laK0hp?=
 =?utf-8?B?VkJjQk1kTlZTY0xncEZ0Sm5yRVpORlRVbFp5V3grbzFRU3lPYUxXYjc2eUlL?=
 =?utf-8?B?U0pLUHBjMnRwaUxDZG5Uam5qOGhwOHRtakd1KyszUm55TUovQVhLaWJIRHRM?=
 =?utf-8?B?alY3N3BacStZNGx3bWliVDR0OVRFUUpFUVgwRUVtMG1RRmlpS0tKWExTbnZ0?=
 =?utf-8?B?YmZaQ1Q1eG90eVBVb0s5M1M5enptWFNQMndZd3lmdStxLzBSdEZ1Nk5rM2dN?=
 =?utf-8?B?dkYwZDRjYlAzMFRSaG1xUlA4VmpPTEF3YWtTcW9INE5UOHdqY25vY1JYR0Fr?=
 =?utf-8?B?a3dDSXJUUyt6a01ySkxuemxxOTNsK3dSWXhuc0Q0a1VJMnNhVEZxaXNDU1pW?=
 =?utf-8?B?UVpBcVljMFBaNStEd3g0SkR5MmpERlkrRVl6YkhiSVVYTy9La3J3bm1WWUhp?=
 =?utf-8?B?UXFYdndBLyt4SjlXUDNzb2NnZFE2ejI2TmdZUGxENW50ZHdkWTEyeFRETWdB?=
 =?utf-8?B?ZnBxZEpHVWVqd1AvOWxwamQwanpQK2tYWkZtK2xOajVCVko2Q05kbE9jUWRy?=
 =?utf-8?B?NW5NUFZMZmJmRFg1N0YySHNxWFJOc28vTVl3ZWFHMXNpTzRNN2xrT1FPRDVx?=
 =?utf-8?B?NkFmb1JOVkY0dWswSEVrM0g1RVh1WmJFTUNKbEJZaGFqRlFJamRLODZLVHNG?=
 =?utf-8?B?WEtOZjlRQmlwZDAvdkxCWUdsYzhoUG81OWZVVWNrL0pBdVpWelp1WE9CbThY?=
 =?utf-8?B?b1ludDJiR1BDRVlXRHpBenloMWNOZXlJK3B2dmo5VTFiV3hNOHRSVWpaK3M5?=
 =?utf-8?B?WHhHSnlPTzRGdzM4VkdjQVZHdURrSkVrbncwQXE2K0pMQThBSnpFTWZDdnU1?=
 =?utf-8?B?ZTJ5WUxhZ293T2dpUXczQk4xTWtxNG5FQnVEbjN6b1ZQekg5M0RXUUdaUDJU?=
 =?utf-8?B?ZXN3RmJmYm9OOHBxcUh0SkRxTUhJQXQ3d0FvZ3lIK0xiODFhRmtoTWFZYjJu?=
 =?utf-8?B?UjhOQzkzQWpsdGVOV0FXMmJEQjZZaEtkYkx0L1o3S2NONjQwQm9rc1FHTDFl?=
 =?utf-8?B?WjR6T2pUKytocUFzbk1MOGFzTWI0Tkd1dFY4UlZrcExCZThMSTVIQkdRNkh0?=
 =?utf-8?B?QVJoSkRndHp5TGRqaFVDNytZeVNSS2VaVHR2QmdyZXVsdDhqODZndi9rYlJI?=
 =?utf-8?B?R3BCWXU3clQ2N3hVMjFIcVdUb0RxTEVPcWxvTS9rNVFHMFk5bTg5VGdZM3VU?=
 =?utf-8?B?M0M2NlJxTVFHb2RUVGlRNTlWc2M2Q3hEMGhSdzlWVENiM0ZUUlVydXExNDhq?=
 =?utf-8?B?N2NVdzRRYWtQSE0yVkd0V3NhUVByek9XOUNMOW5malFjWWtzMzRSeHNKOC9l?=
 =?utf-8?B?SDBpS1NJTFQyTE1OQ2hQQThsMWJTNk1CT3RieUZrMVVFTWJ1VGpNa292S3c4?=
 =?utf-8?B?d0tMVUg2ZndSeUJkZkZCRFZZbnlEWnIvbVo5NE45UHpSZHNyQ3U5SVNQRmky?=
 =?utf-8?B?N1dzVHFiUG9rYzNXS2NOdzNSMEc1dmN6cDhiYnJBMkw0OG12WGZYc0pWdHlY?=
 =?utf-8?B?cE5Hc1NTK21FbDBEQXlxUnRhVzRMQ2lxRGlsMTUzRlNNL25oMjlCU21nQXpE?=
 =?utf-8?B?TGVnR0U5ZnBjTXhPQmFlWEJXOEJCUkdrQnQ0VWE5b1JOOGRHM3RiZzRMZjNj?=
 =?utf-8?B?M0JpbStyNG15UG1QdUNkalR5M1dRZFIzZlhuV3VkdUphYTAyQWRDdktHL1BI?=
 =?utf-8?B?Q0tGell0dWc5ZkUzVUoyQjE3NVlzaXdiTHdaUGo2YVpiQlFMOGxWT2NLNHRP?=
 =?utf-8?B?czlRWkVYNmJOTlBCYS9SWTdQQ1M4NUZPcnZtYmZJMlkxZmJPeFZyaVlCZ3Fa?=
 =?utf-8?Q?v+40=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 603732ed-cd23-4dda-7398-08dcd07b9a51
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 03:00:46.8334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QEEx/nFMqpV0VRGNxvW+eymb3XTf+9ZlNB4MxAcwtzdcNrOo61Z66jvqpoueoq1OQnJaxTm8mTqbmNyr3GT0tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9734
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

PiBTdWJqZWN0OiBSZTogaS5NWDhNUCBJTVgtTENESUYgVW5kZXJydW4gUXVlc3Rpb24ocykNCj4g
DQo+IE9uIDA2LjA5LjI0IDM6NDYgQU0sIEFkYW0gRm9yZCB3cm90ZToNCj4gPiBJIGhhdmUgYmVl
biB0ZXN0aW5nIHZhcmlvdXMgc2V0dGluZ3Mgb24gdGhlIEhETUkgb3V0IG9mIHRoZSBpLk1YOE1Q
Lg0KPiA+DQo+ID4gSSBub3RpY2VkIHRoYXQgc29tZXRpbWVzIG15IG1vbml0b3Igd291bGQgbm90
IHN5bmMsIGJ1dCBzb21ldGltZXMNCj4gaXQNCj4gPiB3b3VsZCBvbiB0aGUgc2FtZSByZXNvbHV0
aW9uL3JlZnJlc2ggcmF0ZS4gIEZyaWVkZXIgbm90ZWQgdGhlIExDRElGDQo+ID4gd2FzIHNvbWV0
aW1lcyB1bmRlcmZsb3dpbmcsIHNvIHJlYWQgdXAgb24gaXQgYSBsaXR0bGUgYml0Lg0KPiA+DQo+
ID4gSW4gdGhlIGNvbW1lbnRzIG9mIHRoZSBMQ0RJRiBkcml2ZXIsIGl0J3Mgbm90ZWQ6DQo+ID4g
ICAgIFNldCBGSUZPIFBhbmljIHdhdGVybWFya3MsIGxvdyAxLzMsIGhpZ2ggMi8zIC4NCj4gPg0K
PiA+IEhvd2V2ZXIsIGluIHRoZSBkb3duc3RyZWFtIGtlcm5lbHMsIE5YUCBjaGFuZ2VzIHRoZSB0
aHJlc2hvbGQgdG8NCj4gMS8yDQo+ID4gYW5kIDMvNCBvbiB0aGUgTENESUYgdGhhdCBkcml2ZXMg
dGhlIEhETUksIHdoaWxlIGxlYXZpbmcgdGhlIG90aGVyDQo+ID4gTENESUYgaW50ZXJmYWNlcyBh
dCB0aGUgZGVmYXVsdC4NCj4gPg0KPiA+IFdoZW4gSSBpbmNyZWFzZWQgdGhlIHRocmVzaG9sZCB0
byAxLzIgYW5kIDMvNCwgaXQgYXBwZWFyZWQgdGhhdA0KPiA+IHNldmVyYWwgcmVzb2x1dGlvbnMg
dGhhdCBteSBtb25pdG9yIHdhcyBzdHJ1Z2dsaW5nIHRvIHN5bmMgc3RhcnRlZA0KPiA+IHdvcmtp
bmcsIGFuZCBpdCBhcHBlYXJlZCB0byBzeW5jIGZhc3Rlci4gIEkgZG9uJ3QgaGF2ZSBhbiBIRE1J
DQo+ID4gYW5hbHl6ZXIsIHNvIEkgY2Fubm90IHZlcmlmeSBtdWNoIGJleW9uZCBrbm93aW5nIGlm
IG15IG1vbml0b3IgY2FuDQo+IG9yDQo+ID4gY2Fubm90IHN5bmMuDQo+IA0KPiBGb3IgbWUgdGhp
cyBjaGFuZ2UgZG9lc24ndCBzZWVtIHRvIGNhdXNlIGFueSBpbXByb3ZlZCBiZWhhdmlvci4gTXkN
Cj4gbW9uaXRvciBzdGlsbCBmYWlscyB0byBzeW5jIGV2ZXJ5IGZldyB0aW1lcyBJIHJ1biAibW9k
ZXRlc3QgLXMiIC4NCj4gDQo+IEFsc28gd2UgaGF2ZSBhIGRvd25zdHJlYW0ga2VybmVsIGJhc2Vk
IG9uIDYuMSB3aXRoIGJhY2twb3J0ZWQNCj4gSERNSSBzdXBwb3J0IGFuZCBJIGRvbid0IHNlZSB0
aGUgaXNzdWVzIHRoZXJlLiBCdXQgSSBuZWVkIHRvIG1ha2UNCj4gc29tZSBmdXJ0aGVyIHRlc3Rz
IHRvIG1ha2UgYW55IHJlbGlhYmxlIHN0YXRlbWVudHMuDQo+IA0KDQpEb3duc3RyZWFtIGtlcm5l
bCBoYXMgc29tZSBOT0Mgc2V0dGluZ3MgdGhhdCBub3Qgc3VwcG9ydGVkDQppbiB1cHN0cmVhbSBr
ZXJuZWwsIHRoYXQgbWF5YmUgdGhlIGlzc3VlLg0KDQpJZiB5b3UgY2hlY2sgNi42IGtlcm5lbCwg
eW91IGNvdWxkIHNlZSBzb21lIG5vYyByZWxhdGVkIHNldHRpbmdzDQppbiBpbXg4bXAtYmxrLWN0
bC5jIGlteDhtLWJsay1jdGwuYyBhbmQgZ3BjdjIuYy4gWW91IG1heSBnaXZlIGENCnRyeSB3aXRo
IHRob3NlIG5vYyBzZXR0aW5ncyBhcHBsaWVkIGFuZCBzZWUgd2hldGhlciB0aGF0IHdvdWxkDQpp
bXByb3ZlLg0KDQpSZWdhcmRzLA0KUGVuZy4NCg0KPiA+DQo+ID4gQ291bGQgdGhlIHRocmVzaG9s
ZCBhbmQgdW5kZXJydW4gY2F1c2UgdGhpcyBtb25pdG9yIGludGVybWl0dGVudA0KPiA+IGlzc3Vl
LCBvciB3b3VsZCB0aGlzIGJlIHNvbWV0aGluZyBlbHNlPw0KPiA+DQo+ID4gRG9lcyBpdCBtYWtl
IHNlbnNlIHRvIGhhdmUgYSBmbGFnIG9yIGRldmljZSB0cmVlIG9wdGlvbiB0byBvdmVycmlkZQ0K
PiA+IHRoZSBkZWZhdWx0IHRocmVzaG9sZHMgdG8gY2hhbmdlIHRoZSBwYW5pYyBsZXZlbD8NCj4g
Pg0KPiA+IGFkYW0NCg0K
