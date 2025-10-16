Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC575BE1BBD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033C310E96F;
	Thu, 16 Oct 2025 06:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="SXksxSHj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B52510E954
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:33:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WC1K8s7eW4F1iesiD885Ho3I0PpaUIWBUDkyM/9KCaKb5ewu+mvgbJmSsHX8kPQhxEpcdH5fv2ji4+DSa3E2jBWs8TNa+Ck63x7gebkOcwzpfs2OE6E9xxRh+hJGSeSraYvJ5rlSOwxnQr9NCzVs/63KaMYmLaf/Dq+krP38+RBPvV7gcdY0niLHzmZbIS8BI0joXdBsqargt964sl5FP1ldpoPMJBL9sBsAzjXtLGVXfj5loCgJd8hOTNuvKIF5Lh7+SPb9IxyO8JjBYfDJGEmH7vGX13rdFleUoHIJYybmf0o5Tp5DBKBoPiJxvM9nUEnUwsxWqup8VNbPMKipgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJDWuUoMeRaW1CEUs/x2kC9u1WcRhDUCnVdtmZwAPBs=;
 b=tY6BngOlSD2YrMz0VPlYf9OzbKYfTLQ57P605WnZDq5bwAgk6bNNoahlp5pc6EV9b4K4C2Gg10Ow92ujGjV3L/1nTHNBTixVDs+FQUtj8HEL41Hhwqq/tZZEKL0mRLlDftgY4MV6eQglgX3nzljRdeydwdWUvU8uIj2JhMllx8sFfAP5Z2MpGNPNORl+nc2lUngUusZsj4tGCtjsHDojCCN9mTtmWHNNHcaOZUkk7jpKsvaI3vB2XSlz7ItNFU7l2jQoSzVCxbA2WR+Y1NzHoX6u8VgyXoU2j6+wM+JdYqVV7IqVMEMTw1nPEPYK3X4JkzGSNWQ/0KTtRW7P+joeHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJDWuUoMeRaW1CEUs/x2kC9u1WcRhDUCnVdtmZwAPBs=;
 b=SXksxSHj/I6MvlqlVWlwvxRfbYICD0jInePWfSfaF9ToFMvBw2bxREDsOqC1SDh29aFdo4XHLtMxPQa5H46O7CAukEbnt333+OSxlw5m1tmnsfi7289r+xT4F0l7cjx0JW1q0PsA1otr9c6FVP3N7GiuafhxsbLdLg3RYc0pWkC9JKoLE2BZ/bYFXgxaZMzWLQbSDOJt4J573Co+3LA3pM0yXY5ogrXeybT5Hi1xcOCicH4ii0dfSZk5csxbz5knwX4vZ8275bPTcegImHlCckZdR+BqOoZFqtqZGIiNmc1qnnb0pKtBh8pwAkSeIh7iTcb7xadXt4+ldpDcKS6LGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9964.eurprd04.prod.outlook.com (2603:10a6:10:4c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:32:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:32:57 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Thu, 16 Oct 2025 14:32:23 +0800
Subject: [PATCH v4 05/14] drm/imx: dc-crtc: Disable at boot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx8-dc-prefetch-v4-5-dfda347cb3c5@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
In-Reply-To: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
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
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9964:EE_
X-MS-Office365-Filtering-Correlation-Id: 086b4a1e-bf95-44c8-d274-08de0c7dd7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M25SM2hKSGNTYms5c0pyZTRLVERqQnhHZlUwNElxYTZaUG16SER1QmlQRGJP?=
 =?utf-8?B?TFhUYy8rYmJ4SU0yT1FPU2lxVDBaUm4zNXJWYXdYU01jdElodEJMMlFnY1Vh?=
 =?utf-8?B?ckgwK0dwWTVDMmNqTjF5UitXbUdRUmlIVXUxUnFMTnRUZ1ZFMlRlcEs4eFZP?=
 =?utf-8?B?ODBsdVRaMFhreEEwVXJEblRmVFZwYmpyNDQvTVptM3lhbWJsT2xjZW1IaUJQ?=
 =?utf-8?B?Uko0Y3Ird2REclREb2hiSG42cWJlMDN4UUl2bmN4a2gycDg0ZFlHSCttWjRF?=
 =?utf-8?B?WTljZXpicW5sOVdvMUxQOW5JKzlzNmJjYmthN05ZT3l0cEh6Ryt0emc1RFAr?=
 =?utf-8?B?cEJuZ3pHWmJMcWVzRi9vSWt5Rk41YS94MTFITlNqSEpvV1VJQTlFQk93Ymxl?=
 =?utf-8?B?aFA4TGFocXVsdStWdEwxWDI5ZTIxa0JRRjhRdVhYcWFqcVFWV2ptWHptNGxK?=
 =?utf-8?B?a2NWdDN6QWlXNm5zSXM4ZTZlYTRpSHFPeVErUFR4aGY0a2hQMzBXd0x5elRG?=
 =?utf-8?B?cGRVanc1U002ZnE5b0UxZXRrclFUSXYvQVdJU1psbHpLdm1Vb3drc3JJYzI1?=
 =?utf-8?B?RytPQ0pVTXk3VzRkRGEwWWltMWJQWXFGMmcvRE40ODVxYzg1YmRHRGZFM1NI?=
 =?utf-8?B?aWRPTkgwN054bmRaQm04TDM3eXQ0ZlVyOVg2WFlBMy9RUTFNbHJUZXY0aFY3?=
 =?utf-8?B?OXRFM3U1NllwbklUY1V2TEtVeitKcmpGaVNpVy9OOVc0d3h3c0wxaXdYWjF4?=
 =?utf-8?B?SkxlV1ZyUEJhZzNKYk9FSlBvYytJVitVcTliamgyWUgrdUR1VEgyVGFKUUpX?=
 =?utf-8?B?eXlUQmhnL1B3S2M3Y2YvOHZEcDNDSDVURHNxTUVCcmlWbFU4d1hpUFZmWERv?=
 =?utf-8?B?U2ZmSVRQQTJTR1dVQjE5V3JHRjhzNFFteU0vVXpiTnBsSFp0cWVnL0lnMGx4?=
 =?utf-8?B?M1hxUGdzaHVjNGRLT2ZkUWZXaFpVcHVOU2xKYkw1OTRZZEo3bWJPQUZ6ZDA2?=
 =?utf-8?B?L3pvaUxZWlFJRk9lVXFHYmhEMTV6V2drcHQ5blRNaVVTUXFSME01K25BbXF1?=
 =?utf-8?B?bklkNGNkWkYveC9wMWU2UzdhUjFpYXNrd3Q2WXFVREtiUi9yNVdpdkJ3WWNi?=
 =?utf-8?B?bjNHRWdTNDh3VGJrV0xQNEx3K09aNEpmMWJ5OE9ZYWh0RXBCM1lXWWtWaWlI?=
 =?utf-8?B?eTRVdzNHNmVpYUhENXd3L25iVU90aVFERXUyVHBqMVRFd29obitseFRoeTZn?=
 =?utf-8?B?SkFabUNtM1FvYlpGczl6L0s3K282blBxd2V6Y2hUeTlRZ0Z4Tko1S3BVZGND?=
 =?utf-8?B?WDBHSmtKMDdDTHNEdStCUGgyWjVYU1FZc0kxbXpGZ2FRZmVFZWNVNWdLYWpp?=
 =?utf-8?B?eGZtWElYTDk1ZTNoOU1VbWlrWGM4cS8rOERvb1Jvdk51UUdmYis0aWNHaHFK?=
 =?utf-8?B?NjdjV2Q4TEZxT042a3M2MklZMUdvOC9keXlJT09NTmN2cVVIMWZySmxCNGQ1?=
 =?utf-8?B?ZFYyUzFiUXduZWd2SWo1UTN5MUJSN01xdGNWUk9xUzZZUnJXbSswVnd0MU1E?=
 =?utf-8?B?a2hhVWg2a2VtR2FXSzh6a054dzJWckxoWm5SMEpMQVIwbVJMSTNxS1RnZUJ6?=
 =?utf-8?B?ZHVnM0hmSUxhYmhvcnhKcFZzRHc1cmhWNWR4QXFRZUJqRnYzbmJHL2JLN3M0?=
 =?utf-8?B?NlRZN3ZVVEErM0JzM0dwMGIrTkVhSDdnQ3FGc0tsaWtnU1B3bTZwN0VpVFBD?=
 =?utf-8?B?RjRnb2sxZlc2emZSdUdjMDlzdUU2d1VBRWpBaGtqZVZDckc4ZTdzUVZzczY5?=
 =?utf-8?B?bzNrVXFTNnhNTDRGbDd5aTI1S3BPb2RrY1N3YTJNbG1xZDB1N0txaVFNNDNv?=
 =?utf-8?B?RmdGeUpmNWJrdVZGcDFZUFlYd1FDNWx1ZWRURm9LZE9jQlN0Wm5MRmNDa1dN?=
 =?utf-8?B?cFJtVTk3U0ZXUE4xM0FVa0hvTUlrMHY0ZWJnZDNZZDNoNGNtMnlGOFlGWVdE?=
 =?utf-8?B?Z3RvV2RqUWl6cmZqbGU2cnphL0R6cFkrYWdhOHg4MzlORUJMdkpRd3hpd3kx?=
 =?utf-8?B?anVkZyt1TGptc29NbitkTlFkM2dkaTlRUE1CUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3U1T1RLUitLUDg4TWtmSEx6Q0hUNjloTENPTHJULzRQTXpnQUF0VG5SeHpj?=
 =?utf-8?B?WG5JeVduTXBObnZhVnVrSjdPOW5WZTF5eVVLamp1bkhyZ1NLQk8rOXJuRDlY?=
 =?utf-8?B?TXNPVHZPTVUxKzlhNmljcmJ5K21lY2VEZ3lFSTh2T2VEOFkvOW9sMGpKdC9J?=
 =?utf-8?B?NUYzVTdaMHNLd0VneldoYWZyK09JMzNGc3NJbWZKMy9BU1dQbzhCenNkUkFh?=
 =?utf-8?B?aHhjSi83WERwQWpGK0JURDdPblovN0FEK2Y0VTR4OWJzTnYvajVROGpTWkU3?=
 =?utf-8?B?SXd5WU9yQ1FuOHM3OGxYc3U1N1ZLcnd0aGVsTmNkak5hTXJTT2tGRHFiVzdC?=
 =?utf-8?B?Q0JEd2Z4R0h1djRSOHU4UGlyOElVbHlRWFR1M3QyTU0ra2IvUmhGZUk3Wk8x?=
 =?utf-8?B?SFhtTU0wbWFmTW1BR1lDTUZicWpCcmVETUp6STNQM0MvS09qYkJGWlh2cVh3?=
 =?utf-8?B?UmlkeXhNUDRzMkhRQXdpN29xbiswcGhvM0hLcUJNajAxdjRrZi9JMEhYZlpZ?=
 =?utf-8?B?TUlEUDk0M0RFOVp5OWZlVC9sRzJwZmIzQk1EZ05PTFZMT3NJN092b2lJTnZR?=
 =?utf-8?B?K2tlZ0VETG9GQnVSdnMzQytQTEQxSzc3ODA4S3cvc2pESVoxWi81OXcxaFpk?=
 =?utf-8?B?MlBZbHczaEJzWDZ0TXVNamNYdjVvZE0xR3o5NU5vbHl6dVdmWmFUcEFJVnFW?=
 =?utf-8?B?TVBDYXQwUGtJSFlRYnZyanNiVTRLdWllelB5UkNFRTFsSG82Qks0ZkphOFBB?=
 =?utf-8?B?TFl1TlJxWWJYNGlCTlhNd091MlE5Y3JhbnJmWm80RzFCR3lmMVd4WGtBMFRV?=
 =?utf-8?B?Mmx1L21NelZhOSsxQkhOQ1dXaDdpQjNZV2FVd3dSVVRhdHplK3VaK0hKT0ti?=
 =?utf-8?B?enkvbE9yOS9mYm82bjNkcUJzZXdWWVlIT0x2a29Bb29ES2I4OE9XN2NDblc4?=
 =?utf-8?B?TUNmekxNVWlFWjVPZk9CSDBQZldwNTJHL0pacFdDQzJsM29jUzFlTWdHK21s?=
 =?utf-8?B?Tkt3NGJ4SjMwS1ZGQlBtQ2E2N1JqZVBhWm9UWGIrcjlraEZuSXN2UHErYytn?=
 =?utf-8?B?UlZJUWhQejlWYnorQXFLUVgxUk9CUHVwU2w2K2lDQm1NaHJmMVVXRjN3U2Ez?=
 =?utf-8?B?UkJBcGI2QjJibkF6TlA4UmhUSVZjTjZ4MmhzdFBnRUhyVWM0Z2lNZnQ3WDl0?=
 =?utf-8?B?OHRQT1FzU1JnZnNwWDMrMmJEYUdLRE5UUlcwR2hvWVZYZVk3UUlHT1ZJZis0?=
 =?utf-8?B?cmlGdng3dlJOMEpkRnlyaUF2akc5aWorWDBnWCtSQzJZb1BrSXozUkJiendr?=
 =?utf-8?B?cVRnZzA0UEFNbzlrZzhnU1dGRTJUK3lkQkhXem1Fb3FXblBlNi9nSTR6L2ow?=
 =?utf-8?B?aG56dnp0YVhOd2RGblF0dmJMdUg5eUZTTGhtdlpPUWRHS2ZWL3lXSnNxSlM5?=
 =?utf-8?B?VGVLSldkaVJKWnVDcXVvdHdEZmdZa0kvaVlIK0dqU0tMWlZxZjUxUUJVT2E2?=
 =?utf-8?B?YXVQTVphUXpoNnZ5QUE5VU0rTWVHMEhKRlVxN0N4VExiS1NtTnI1YlFYSE45?=
 =?utf-8?B?V0VLSUFDSHNxSG1Gdm1acjJTTEU0cXhDVlRxbVBKZHZuVFRMNyt4MlF6NC8z?=
 =?utf-8?B?d0MwK053RGlCUHZrbFYreFAzb3JqVUpTd0kyZnJ0eVRmS1FXaVprT2R2OVVn?=
 =?utf-8?B?T2JLTHlVc3o2ZEVMeFhHZTcxTUF2Sjc1YjBCb2JTdElmSnBuODUxQ29CVXQx?=
 =?utf-8?B?b1NxZ0gzU1Z1bHRTVjFLYm1rdUVxaUU3MXVNeGJ4M0IyQlVxUzBrY05sUDlo?=
 =?utf-8?B?ZElzamNLOFVCSVZKSzQzRkpod2NMdHAycGo5aFY4SW1yZXRlOCtnYyt6VDJZ?=
 =?utf-8?B?L09wUWVhNzNPK1JNeExCb0kwRUZ5MG5KYnUreDVoS0NnVE1mSEFacVBIR2Np?=
 =?utf-8?B?NnBXWmtUMnFhM0F2aTBNV3Fwc2VXaWdmdlk0cWZscmtSUEFyMFlUbjhqeW5j?=
 =?utf-8?B?a3pua3lLOTlyT09RVUcxU1dFMHZKemlCK0hmK3FXWjZic1RHb3VTdkczcUJk?=
 =?utf-8?B?NURFQ0F3Z3pLVDkwVTdqYWR2OWFaZ1FyVDhvQkdUOVFoRVlWcDBZZGhpMVRn?=
 =?utf-8?Q?tuB/eyJw2hEObfWvtQv6ju6wd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086b4a1e-bf95-44c8-d274-08de0c7dd7cc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:32:56.9659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9E0tBRXcdScx2c7Pf+hPbby2JXYG8YtDd2yxCgsxwfhLlUMlW6SvMa2NPZ8C0O82GK+W1nb0L2X/JYEvdaAQDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9964
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

CRTC(s) could still be running after the DRM device is unplugged by
calling drm_dev_unplug(), because the CRTC disablement logic is
protected and bypassed by the drm_dev_enter()/drm_dev_exit() pair.
Hence, Pixel Engine's AXI clock use count(managed by Pixel Engine
driver's runtime PM) and pixel clock use count could be inbalanced
after removing and re-installing the driver module.  To fix this,
add a helper dc_crtc_disable_at_boot() and call it to properly
disable all CRTCs before advertising DRM device to user-space by
calling drm_dev_register().

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-crtc.c | 50 ++++++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/imx/dc/dc-drv.c  |  5 ++++
 drivers/gpu/drm/imx/dc/dc-drv.h  |  3 +++
 3 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 31d3a982deaf7a0390937285c9d5d00100323181..45a87df1ad6a8bd768aa5ed38d6f03f14052b3d7 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -293,6 +293,16 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	dc_crtc_queue_state_event(new_crtc_state);
 }
 
+static inline void __dc_crtc_disable_fg(struct drm_crtc *crtc)
+{
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+
+	enable_irq(dc_crtc->irq_dec_seqcomplete);
+	dc_fg_disable(dc_crtc->fg);
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
+	disable_irq(dc_crtc->irq_dec_seqcomplete);
+}
+
 static void
 dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
@@ -305,11 +315,7 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	if (!drm_dev_enter(crtc->dev, &idx))
 		goto out;
 
-	enable_irq(dc_crtc->irq_dec_seqcomplete);
-	dc_fg_disable(dc_crtc->fg);
-	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
-	disable_irq(dc_crtc->irq_dec_seqcomplete);
-
+	__dc_crtc_disable_fg(crtc);
 	dc_fg_disable_clock(dc_crtc->fg);
 
 	/* request pixel engine power-off as plane is off too */
@@ -337,6 +343,40 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
+void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
+{
+	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
+	if (ret < 0) {
+		dc_crtc_err(crtc, "failed to get DC display engine RPM: %d\n",
+			    ret);
+		return;
+	}
+
+	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg)) {
+		dc_crtc_dbg(crtc, "FrameGen frame index isn't moving\n");
+		goto out;
+	}
+
+	dc_crtc_dbg(crtc, "disabling at boot\n");
+	__dc_crtc_disable_fg(crtc);
+	dc_fg_disable_clock(dc_crtc->fg);
+
+	if (!dc_drm->pe_clk_axi_disabled) {
+		clk_disable_unprepare(dc_drm->pe->clk_axi);
+		dc_drm->pe_clk_axi_disabled = true;
+	}
+
+out:
+	ret = pm_runtime_put(dc_crtc->de->dev);
+	if (ret < 0)
+		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
+			    ret);
+}
+
 static bool dc_crtc_get_scanout_position(struct drm_crtc *crtc,
 					 bool in_vblank_irq,
 					 int *vpos, int *hpos,
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 04f021d2d6cfc93972aa8d9073be24d347152602..f93766b6bfbfae8510db05278d104820ca0719c4 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -17,6 +17,7 @@
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
@@ -96,6 +97,7 @@ static int dc_drm_bind(struct device *dev)
 	struct dc_priv *priv = dev_get_drvdata(dev);
 	struct dc_drm_device *dc_drm;
 	struct drm_device *drm;
+	struct drm_crtc *crtc;
 	int ret;
 
 	dc_drm = devm_drm_dev_alloc(dev, &dc_drm_driver, struct dc_drm_device,
@@ -118,6 +120,9 @@ static int dc_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	drm_for_each_crtc(crtc, drm)
+		dc_crtc_disable_at_boot(crtc);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
 		dev_err(dev, "failed to register drm device: %d\n", ret);
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index eb61b8c7626933adc7688f046139e2167665dad1..68e99ba7cedbca1b8bdc0d8ced7a610a1056bfc7 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -50,6 +50,8 @@ struct dc_drm_device {
 	struct dc_pe *pe;
 	/** @tc: tcon list */
 	struct dc_tc *tc[DC_DISPLAYS];
+	/** @pe_clk_axi_disabled: disablement flag at boot */
+	bool pe_clk_axi_disabled;
 };
 
 struct dc_subdev_info {
@@ -96,6 +98,7 @@ static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
 	return -EINVAL;
 }
 
+void dc_crtc_disable_at_boot(struct drm_crtc *crtc);
 void dc_de_post_bind(struct dc_drm_device *dc_drm);
 void dc_pe_post_bind(struct dc_drm_device *dc_drm);
 

-- 
2.34.1

