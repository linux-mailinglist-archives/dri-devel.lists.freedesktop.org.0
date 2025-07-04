Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA65EAF8D55
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E3B10E9B1;
	Fri,  4 Jul 2025 09:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jM0i4w5/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2FD10E9B1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:03:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkCelHV0Ev7oBhfzckwahxg/kgA7tRFYQTeuyqktiaMCHX1QrkRUvV3xVFqLzS7C0Y0A1QBhzSQrI7SxZjWf7WNJe5OO+ptuzkOa32lWL9aTlVxnhdgSUx+9huXQY4NUmvj6yz4cq1SW7Lhb9sLGV4ZXdT3Z05WItqiePTDsPQlnsoH+/RKF+LaJ8YtrRIzTWSNzYOkqSa95JzDneB2Zf4KoZ0v8SBxrERzflf2x06tcuvIGVV+rt9nEr18Aewc0M7ZQYXxk7ouL/YzMeDB880atJy8z8KV0dUQbaK1o623WVWXg6OJIiJNINwysNbKmasVA71E/D6PDPbPZDTNqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRJ2vdQnEAzq/IMx2dPKZ1o09hNOIGb+GZ0gqyyFigc=;
 b=rqaFm6LMp9sYAnU/gyZs+QXhdn93/l9nmtZokFF/LAgpcBBMmvKdLR2ML5EQPNjTLSVKnPlOZOVYFO5vWI1r8jNyiziUax1jO2d3OxxmeE6HmBaTIYRW/fKrES15hExNtzMcntc6y5bd6j9Yf5/m9Qxn+GCXcNBy7q4u4Av1Hl+8AmCeU7IsNpYWQjMTsQ0T/WUhwfYLVEgTXkvi+k/tVjl5YEq1Ib5mp2j1KXTltpHb23dQTxMljueYe29UOP7qdvAZCk6tuEBXCIcDR8bmqrPZpuOEnzHuzM5ybVZ4l6Jc09jMnu9rrG6UuAgKCl1HoSxixGw+1KUjeaq59SmrDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRJ2vdQnEAzq/IMx2dPKZ1o09hNOIGb+GZ0gqyyFigc=;
 b=jM0i4w5/6THzvfmSPYTWtTV1bHoROlW4Ug+wODiCJn9Mnsmy2d7RRsdIvCvNakFsMQUhCVPYkfURn+Xgs0FbNWlrf9z/H+8ds7KL7OozN6ZvCHi9AX/LzRbCYG0eMhd/R8iNdfvE3HPEzN7e+z7pFFnZTVHHX3w1C3nhy07cBDDHmxUcGYNIYp1XTMFyv3cIWv0vAO7hSdZr0lqwHrh7RvtBhVEn/nuTOobEozU3NMcc6RPLxxsd2wd/SaqBhjUL3BDUDyXah+WZvbjV6/kD6pr/2Uh3yNJbPvq0HwyrIhb7RdkHNc7xkrPvrWPQruHWBDSAH+Q4NRC2zAycTsc8FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB11011.eurprd04.prod.outlook.com (2603:10a6:102:480::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:03:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:03:44 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 04 Jul 2025 17:03:56 +0800
Subject: [PATCH 09/14] drm/imx: dc-ed: Support getting source selection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-imx8-dc-prefetch-v1-9-784c03fd645f@nxp.com>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
In-Reply-To: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB11011:EE_
X-MS-Office365-Filtering-Correlation-Id: dd744cda-290d-47c8-45d0-08ddbad9addb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk1tTFY5STJvVytIWTl1S1NmRnRqYnRJSkdCVVRiQ1FnT2ZsQ3hrOExseWpj?=
 =?utf-8?B?TEdHVm8wMU4ybkZkLzY4R0NNTEhyc3BWYUxzOE9IUE9McHFJSlR1RUZ3Y1c0?=
 =?utf-8?B?eXordzRlUUdFVWJzRE1ST09tR2l3WUFOd3UwU2tJM3kwZ0tGbVNGVHZ3T09q?=
 =?utf-8?B?d0lWZUlJYXhWeUJUSlNpMmp6SUVFNmZPZytlZktpZi81cG4xcXhyRUJtZDBj?=
 =?utf-8?B?UU8xNXJDQmpOQ0gza3dMQ1R6aGU3aElYaVN2SG9zU1VsWmFXT2RxYWJlVVhi?=
 =?utf-8?B?TTRBRGxIbGNCNjhMcUU1cE43elIrTXUzdTJwblVTTUhRSkRtN0w3V2hqcDNh?=
 =?utf-8?B?TjBSQkR1U0U3OWRpVCtibG11VmtQNE9CbU0rSDdOR2ttTlI3OXpaSWUwLzFF?=
 =?utf-8?B?c0k2clpuUTFTcDB6Z3R0ejRPbG5hejd2RS9VOGovOTRPeFk2WG91ZFV0V3Rv?=
 =?utf-8?B?QXZvS2s5V0NDZ3lTY1NQSlZkb1RWWDI2RlpBaHFaWDgvVzFVem1PTUR6U0RV?=
 =?utf-8?B?VnlmdkRwVnhhMi9CaTZLaEVadzhFQVM4eWg4UVcvUTFOSFhSR09qRG94RDVr?=
 =?utf-8?B?NkRYTFZwN1BHYWlvRWlCSEUvQlhTTXgyMVBvNUxFZ2lPQlkrcmxOL1pZK0NQ?=
 =?utf-8?B?V2dNSm9ZMzFNdlJUcGNJSXJEK1cwWXIwVUMrREU2ZmY4L3U0MmpYT3ZwSG1t?=
 =?utf-8?B?LzJDSWgxQ1lmM0pLSmkxRklIVW5oUFBrdmQvZ1VacWkxVmROd24wMTQ4Ulhn?=
 =?utf-8?B?aGtRNExFS2RObzRtWG1CdVlzaHZrbW95Rzd0K0dqWXkrTk43R2lCcFdyV1U4?=
 =?utf-8?B?SThPRjZzUVBBNWxHdC9GY2ZQaDMwdllmaGg2OUNBYVFhUjVldnFFQmJITEJi?=
 =?utf-8?B?R0FzdkRTNCtWTGxOaW4wTFJSU084YjNxYTEyb09PNWRlQ0EySEZ3a2JLdFdS?=
 =?utf-8?B?VTRvVkRxS2VZYjJBdkMyOWJiVm5oMDFYNXVLNmJET0theFhiWFVKMHo3aURr?=
 =?utf-8?B?dkZvQTZJckhwemUyK1hMN0JTS0dWeHpsdkFlYmVrU2FjVGUyUzdocHRNYytZ?=
 =?utf-8?B?YmtKOUwrR01TejMrb0c5L3hOYmdQbHFyWDJUb05lZjlXcnFJWW8yV01zZFZw?=
 =?utf-8?B?eFJSVmRYQldPeVM2RTdvYVREbVhHQlRBTy94VlR2b1Z4d0t4c3E2cUFGSzJX?=
 =?utf-8?B?cW1GdVRQOGVUdXdjRnhGanUvOXVTWUZYWGY1RXp4SEpRM0NoNlpuOXkzWE85?=
 =?utf-8?B?UFJ5MTdVYXJ5TDNiK1ZIQ1d0STB3UXJSNlJIUFQ5Mmc0N1JXZm00bXZFR0Qw?=
 =?utf-8?B?dVorM1hGQ0xCRXVLNkNhejArbmt4NG1aZngreDA4ZmJHb0J5TGszUEdtcWR4?=
 =?utf-8?B?K0FHWmdQZ3VlcW9tSmwvdDUrWHllZjYwQ01BZE9SdXYraWZxN3ErZ2NSU1Yv?=
 =?utf-8?B?ZFpjTTd0czFiUE1lUFAzNW5EekRvMUQvUjllUUlsUXdTbEFqbm5xR3g4Nno5?=
 =?utf-8?B?ZzFDWnd0eVAzWkNTY1FjNDN2SDdFMUpqWWlneFowK1lYaE1vTGpGQjhSUmIx?=
 =?utf-8?B?RUNWOGJjTWNQQzF1Um53Ky9CdE9tK3lxNFZXQjJrOXd1VTFpc2dxRk1PQkhZ?=
 =?utf-8?B?V3FXUEIvQXhVaG0zd1dLazh1U1BiTzgvMjJERGVCU1YranM4UVN3YjhRQ2Vt?=
 =?utf-8?B?SmMwb24zejdXTVI2SWhkdmhJUW9laVBXUkdwL0c4d3A5VHpmbXN5MnVkcUp0?=
 =?utf-8?B?VFFOTm5LQ3o1QzFvSGI1WFhKZWY2K3Z3NDc1TzFvRDZWNlhCajFPbmZJMWNv?=
 =?utf-8?B?L1I1cmZGU0ZxOUFUVkpnQmNURmZVbUwxL2VrSGFHdDdOYlhualZiRkVWc3JO?=
 =?utf-8?B?bXN6aWxQQkpWbGdzOS9EQThiWGVOdGlVWG0zTHk4Qnd6bGZFVW5UdkpsTE9z?=
 =?utf-8?B?cDk0b0NDcWpqcFBXalpuMWdaWVlkeEczK0krRHZMNXMyelFSNmhVMDNFdGRL?=
 =?utf-8?Q?FKfW2tlgH+p14XibNtGtkgwKsopiCI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elFhR3Rqd2Iza0JXcmpMcGJMeHdTQXVWam1pQVFIV0JaWk1Nd0pBb0VsY25J?=
 =?utf-8?B?TGVaZmZFbmpvR2taRlNHL3pKb01qWGpaVWlLL0lUaGZzVnZwT0U4L1lSWDNi?=
 =?utf-8?B?YSs5R3RzWXVjenJyNFN0bSs3MXFINXE0QXNSb1lnOXdrTU9JWjY2M2tna3g5?=
 =?utf-8?B?eElEVjMvTThyaXVDN0RGNVFFNW9FSHFVUlZvRzNzaWl6VlpwU09Yd05lWUQw?=
 =?utf-8?B?djlWRU5GeEY2OU9TeGpGZHU2RzJlUFk1QytwdEFtSnFFWUxUelplakt0cUc2?=
 =?utf-8?B?NE1HZzJzZmc2M0dSc0pKQnVQZTVCbkwwb0lFNlJmZUNaUzBDekppUExzZnRs?=
 =?utf-8?B?MlZJc3JpNmtQMTFwdkFlUElmUkkya2FyS3Z2OSsxL1dyd3F4c2tvaE5UQ1p1?=
 =?utf-8?B?ZitaaEF6eHM2SGNGcVBvUEsrVXREenlnWG05ZjIzU1JlMFF1U3RrR0pWZzBq?=
 =?utf-8?B?cnQwSTZNNStISGx6UGU1Q1RYZGNYVGpKWSs0dE02bFZDdlJVODA4VS9tYkJM?=
 =?utf-8?B?MTF6Z25LU1VDM0EzT3FBbGwxT2xnb1F2RVJQaThXUVNtSXp4TlNnU3Y3Rk8x?=
 =?utf-8?B?VWRURGRFbnNTQmh4cGFzcWlaZ1BKbm5RdHlUazlvajRrblJQMVFKejB3SnFO?=
 =?utf-8?B?NWh5eWtGaDZOSCswZGVJRUs2TnZlTjBRNjNpRFVCZnJONjFwTTNMKzdPeGxo?=
 =?utf-8?B?UHQ3VHBCdEsrakxsZklJajhKK1ptc3QvVWpLbHAxemhPYzh4WjBqbUNGS1pw?=
 =?utf-8?B?OG1iaUZtU1FST3JEMTA5VmY3VjBwNDRCUmJjbE5TYmllTzdiYWNDNU9PTkMz?=
 =?utf-8?B?NCt2YUpBUjdJZXd0NDRhOGlkZkxCcnBETG1kUkw0ZDI2MHdhT1QzZTRGbHlp?=
 =?utf-8?B?ZHhjYWU2a0xpbGdmNlp6eDZPQk9ZNlVGZnJXM2NWbytZOTk0MndPVXkvWXR2?=
 =?utf-8?B?MU0xUCtqbkFVb2JaOHB4Nm1mMjQrZnhaSkcvNVpKcHZpemR6RktERE00SWRk?=
 =?utf-8?B?U2Y2cjJTZmpDdkhObWxwZU1vWndkTmo0QkhzMVdmNzhqWFpPVVkxcFhLNGVr?=
 =?utf-8?B?bzN5aXhnSDIvNU9XNG9SajZqbnFtTk9VcUhheSsyenk4QTF2NDdIZTBLZEdp?=
 =?utf-8?B?clNWRWVZbCtxRkY5aHd5UkZvMnIraTdzczBYZW5CWWtVWnlNMExOT3lzVnlZ?=
 =?utf-8?B?dTFxajN4bXJ6bVNlUGZGQ05ycTNpMEFlakVSbXcyTEljQU5BckxMenVZVXNY?=
 =?utf-8?B?Y2RoMVNTZ3dzbHlGVkUrSENsMnVGN0lMSlYyZHlHTFdvL0RIYlpnYWpSbUNM?=
 =?utf-8?B?SzR4Sm5KSFQvS3FMek1sVGdqS2E5VHJ0R1hWMGhQTjBHcHVsd3Z3Vml1Z29Q?=
 =?utf-8?B?allaQ1Y0bHFjMUU4a0Qra3N4azJCZ1RJT1JYQmdvc2ZmUk5zOHltZTg4NEFS?=
 =?utf-8?B?bTZMOG8rQ01GRHMxcUxjOXZpNWt1a2VhMk5oMnNoaWdERGFEbVg4c1dZajR4?=
 =?utf-8?B?ZWlVcThaSHZ5UVcwaDhRaWN3YkZ0SDhLUWRnNzFWejFvMHJwa3hjMzUvQkxm?=
 =?utf-8?B?QU9hdVpHZlNYeitBQzZTVlM3MXMvNzNxbjF4S2p6cXUrY0c0SjZvc3pReUFw?=
 =?utf-8?B?dTluTHJtSUFSOFRoODFQbk42N1Blak1UTk9HV1dkM2MwMEJiS1JoSnNsdUsw?=
 =?utf-8?B?ZjFsODdPL2Z4SFJ4QzRBWVp2cDFzT2lQSVQvazNZUGZIU1pHMGtKbHpYTUdR?=
 =?utf-8?B?Z29kNC93MFJoQ1RNL3FlTWxCalErd2ZBSWNDR1NGNzhpWTNqYVNaWnJsTFcx?=
 =?utf-8?B?ZjdMUTcwTmlpbDZub2tYcUZvTU1xNWJLTHVjRkNjcjFoMExvWHYxd0F1OHF0?=
 =?utf-8?B?WnQ3SmlXK3hOTFljRU9uaStXWE9vTjgwOGlHS1c2N2NKQlRnMHhGNDFwSDZG?=
 =?utf-8?B?RmltaXZHRjMxMHRrOURhbC9UUk9HRm9QSGZsVFRQdDY5MUg1VGM3elhYa0V0?=
 =?utf-8?B?dlhvdGh6TmVDTHRNaW9xMUowcXZyNFJTSi9WS3VYL0hxbk9ObjVZU0NNMm1h?=
 =?utf-8?B?YzRPcXNNUTROWDFienlORmo5SHloeERoZzNTa3dNUERTYzIvSmNZdkh2V1NG?=
 =?utf-8?Q?AA1AEsRK87gEFA4ZIebRsQ4P7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd744cda-290d-47c8-45d0-08ddbad9addb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:03:44.6061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NH3c5Fr4zEQY7ul+DeHS8bd/bEHMrIzJzL3p/0LgS5o2GFUaJvheSpwrnXNGTiiMGAOufKdYj5u8R5ZTtXtRpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11011
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

Add a helper to get ExtDst source selection.  This is needed by
disabling CRTC at boot in an upcoming commit which tries to get
the source selection.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dc/dc-ed.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index 86ecc22d0a554bf3eced218df0312b513e10e179..b514790bb765329295553f89d16ee1167ef411dd 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -150,6 +150,32 @@ void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src)
 	}
 }
 
+int dc_ed_pec_src_sel_get(struct dc_ed *ed, enum dc_link_id *src)
+{
+	u32 val;
+
+	regmap_read(ed->reg_pec, PIXENGCFG_DYNAMIC, &val);
+
+	switch (val) {
+	case LINK_ID_NONE:
+	case LINK_ID_CONSTFRAME0:
+	case LINK_ID_CONSTFRAME4:
+	case LINK_ID_CONSTFRAME1:
+	case LINK_ID_CONSTFRAME5:
+	case LINK_ID_FETCHWARP2:
+	case LINK_ID_FETCHLAYER0:
+	case LINK_ID_LAYERBLEND0:
+	case LINK_ID_LAYERBLEND1:
+	case LINK_ID_LAYERBLEND2:
+	case LINK_ID_LAYERBLEND3:
+		*src = val;
+		dev_dbg(ed->dev, "get source selection: 0x%02x\n", val);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 void dc_ed_pec_sync_trigger(struct dc_ed *ed)
 {
 	regmap_write(ed->reg_pec, PIXENGCFG_TRIGGER, SYNC_TRIGGER);
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index f5e01a6eb9e918516adfc89949665fdd2ff1e40e..0b81dc6b251c452e7ca72f1cd12af065bafaa198 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -85,6 +85,7 @@ void dc_cf_init(struct dc_cf *cf);
 
 /* External Destination Unit */
 void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src);
+int dc_ed_pec_src_sel_get(struct dc_ed *ed, enum dc_link_id *src);
 void dc_ed_pec_sync_trigger(struct dc_ed *ed);
 void dc_ed_init(struct dc_ed *ed);
 

-- 
2.34.1

