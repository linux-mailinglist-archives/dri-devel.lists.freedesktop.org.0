Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8394D9D0839
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 04:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEDB10E235;
	Mon, 18 Nov 2024 03:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Pjhx9i81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6B610E235
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 03:54:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQihbzPf8IQ6tfxFUZnlYOni7k1N2oXgni6vG7uCLeyE0S58Q2kqeOK+MgHtVaWs3G5uOy/TO+GN7WAXzKcXG3VbRF9Y04yq1N3dSmgJ7nXAxEiPmRJlsgwjRCcvM/+mpz5RxBu8SW08JUYroFQGecaFCUj/hS9C6cV3GzD53G4Dx8KAB4auK/vW8dJixU2Se8c8zROYVwASoPXcEJM3uq8ihsU8qoQiCy4WSNdxdq4qwzy2IT1T+4xTTvRNEkg8626fW5ZroYlDfCKcnVzHLIgj+Cb/lYtF5hamvQWfuVuPoZEAlaTZRKI/Kr9Ee41rlHbWFpgiJaZS9XHptwCH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRQCyaZF5+m7YqS9UJFBNsU41Nnad0NuvS3tTd83Mps=;
 b=n9T5QRqSGdP86qC45aYjdTkQlh7nZoTxYproKqAa2H0BV184lX/oUw0/37m2IhnXeGrQPZcP2cTQyGfhZwrF91inC2f34SIMHZnPGBKb2ND9wyVFMe224xCgYCYI06doid43eN/DloG8afGwySep7UtOdNMhtcsVUbw2TDom57X2noWDEz0S3UL379P42EiRLkoYAKQW/9ssHIUuF1ZU04RsW6pVRL+OnI/zg+lKzQlTPlNz+/bhzSy1sOG0x78ZNgmegGNc0oosZEAhtx/32QQssSWBJQ+09MFdwwjmxE27yc9C4T6MWcnwOphzez3kT4MzgODn81iydpQqDltjpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRQCyaZF5+m7YqS9UJFBNsU41Nnad0NuvS3tTd83Mps=;
 b=Pjhx9i81NNOebuTCa9bzvpdhEehR5sYo8w9Y/MAflv3SIN47alhw4y9/mjpWaATsGiClrAhTz8wcKMmkYU1vXenVne+urcsRNBmB6xxxrJ1DAP48wS9k/LzhicdD4FZPecnSsDpq2zLYQB+bOqvBrl7IyRRO8w4EwILs34mVxBZGA5hi75Gh8TjQLIaqpZtiK7Jvl1AgZ49L9amM2pKhuvk8vyt3KjtK+6iEFLjC//uFE3W3qE2nZz4Z2fYfnq268NBSgdSEaZsOGRQhFuTDbKvhnHZj+lySTuHPRvRhKTtJ6gZCtHAMmJXVByu/NujoDREjOiMXFyeAgL7WPm7NhA==
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB9013.eurprd04.prod.outlook.com (2603:10a6:20b:409::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Mon, 18 Nov
 2024 03:54:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8158.017; Mon, 18 Nov 2024
 03:54:37 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "abelvesa@kernel.org" <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>
Subject: RE: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
Thread-Topic: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
Thread-Index: AQHbNmKO+PHF1Z/Vm0OxVRcdedNQObK4R9AAgAQX1dA=
Date: Mon, 18 Nov 2024 03:54:37 +0000
Message-ID: <AM7PR04MB7046546A882A8D48E135D84698272@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20241114065759.3341908-1-victor.liu@nxp.com>
 <20241114065759.3341908-3-victor.liu@nxp.com>
 <df6ebdde-65f8-4aad-93c7-b1df695bd2ef@denx.de>
In-Reply-To: <df6ebdde-65f8-4aad-93c7-b1df695bd2ef@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM9PR04MB9013:EE_
x-ms-office365-filtering-correlation-id: d69532e0-f671-43bd-ec7c-08dd0784b8bd
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?REwyMVdwalorN3NWODE3VkNqUHZTYnRITVkxS3ZFdjl2RXQ3cmo2dnl1dDlE?=
 =?utf-8?B?VGFIOXZQUVRFVEdQRWM2RzU3S2wwM1dQZkZLbytDMlh3c1prUSszNzVtUll5?=
 =?utf-8?B?ZHcybWNjczZFZURFZ21UVFNHZkdCRkFOeG1DR0NwY2JCQXZlWUg0ZDE3UU5F?=
 =?utf-8?B?TUJaVWRrRkp4ZG1QRmVFMDNWdDRSVGh0M0sySlRGd0NaZjdXUEsxMzRMdHBy?=
 =?utf-8?B?eFVYaXhDdEJ0NlhaK3JKK0xrRDE1Qjcrbjc0QjhycUlCTFN3Wk5lRENmY2Zt?=
 =?utf-8?B?ckI2alFQbjhlVUFlN3dCNXpKbndhWXg2MWNnSnBBWFBxYWNyYXYyWXlraWcr?=
 =?utf-8?B?Wm1zZlc0MkkyQldLdDBmWUoyT3FEOXAySXpRRTh4RXNKWEhSY1JkZnBSVjZH?=
 =?utf-8?B?QTNhZnVNOFh6eGR1eHlyNGhYRlBROUsrU3VuZlBobFJ5UElXd0tvWnRXRnkv?=
 =?utf-8?B?WnFnTUdVaWZvT0VXQjFCNFB3dVdUbVVTZWZ4Mkwzc3F3UjJmS2NMbHdzY2hy?=
 =?utf-8?B?VVc2Y1RPL2NZVmVOcHMzY1diZTFmUWRqTFlJNnJnT3lrWm02Y1g1ZEx3L2hy?=
 =?utf-8?B?MVhITFA0cU1mdUU2NWJHenpPZUtYZkREL0FnT0QrNlcwMTdtS1BJMlNLQ2RC?=
 =?utf-8?B?dkh4bkZPTkUzaXFVK1JlWjlIWGs1ZFJmM1c4OHRsWTFIdXJMN2tKdFpuLy9k?=
 =?utf-8?B?NFNXZHpSZjVpM3A1WVNmZi83UFpqT3oxcFhTUDVjdUZMaXJOMW9BNXZUWjNt?=
 =?utf-8?B?R2VyeHhtTmRXeStMM0htZjhjeDNQQndBbzVxM0tpaFptRDF6UVRKdExOdU9L?=
 =?utf-8?B?NWNjd3VpK0xBS2dPUzgzY09tWmJoQ0ZtNG0vZnpVSUtjUDNDR1ZidTlEdjZ1?=
 =?utf-8?B?aXFlK3JBeGcwdnh6SE42NGptL25FNW50TVR3RTErZXVjOHdza1ZuSi9ORTVH?=
 =?utf-8?B?MEd6YVA4UG96QXp6SWg4dDNvU2VTb2s3OHg2L2xVYnVzcnRqdnMzYVlieU5u?=
 =?utf-8?B?V05WV3paYTY4NCt5UEJPTVl0NkE3UFpqdVIxaWRKa0hUQ25lNlBuNFVIVFR3?=
 =?utf-8?B?QVg1THBhOXMrbS9OazErU3FsQlNReEV1YiszTXhnYnpLRXVMTEJwLzVTYjhp?=
 =?utf-8?B?alJQMWNIelB5Nm5kR3FEczFIdUVncnFmc2VySjFwYTVVWC9SN1JqR3NlM3Vo?=
 =?utf-8?B?ZkVNK01mMU5iRkRHQUg0cWxLSGFrYW13Wm4xY3VlVVJWbU9EM3paMTM4WjRu?=
 =?utf-8?B?L2lRRUlqMzd5MG1vWDFNVlRNOGtTZUJWTTVKTExhU2pZNDZ1UFErcndCNkFK?=
 =?utf-8?B?NUhNb0RXVGpORWhvdHpDOEJWTnlkckRrZk9taStVYlF0dUNsZnFTV0xISmV4?=
 =?utf-8?B?V2ZQZjcyUUN6RjdxWTB0QTlha3dGeHBzeExwRUVWaEtEa0dSZkl5Q0JPOTVj?=
 =?utf-8?B?QUlDQXp5MzFOcGZHY1lOMm5COUxoN3l3b0Roa2hpa2djNmd0T3lOb1Q3L0xI?=
 =?utf-8?B?SHRQRjRyQkpUNmdsRVFzT2xsMEhEd2V2bEJkQ3JJRHNDcnF0M0syUWhORzMy?=
 =?utf-8?B?THlNN3U1MXBuMmhFZnJDeDdNRGp1SnpuNDBxanlCQ0d6dmtsWWgrT0o0M3RV?=
 =?utf-8?B?US9OR0ZlUVB1NU0yUE53RS9kbHIxOGFEWVZKM0JEKzJ2NjM5QnVjb2Jybksw?=
 =?utf-8?B?MDdnbDVVc0xsM05ENmcxd1JmUmJCSkt4dFg5cER0MTNjUEt1NEV2ODlFYnJV?=
 =?utf-8?B?elI5YVBLekV6NEFaSUhubExlMEU3UmhLcTdQUzE0QldxblNPRDFERmZBTVg4?=
 =?utf-8?Q?gxBvd51+Qv3CoXKsNE+XJ6/7vq5cJwDL/98Ik=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1MxcmpIOW0vME1pZVlNMmpScW40ZE1YOTM4Q0RDU0g5akQzamI3OVBVcisr?=
 =?utf-8?B?UmtLRGlKYTFBVm9iSVJNbE5KWUU4L1MxQVYyT1EwQXVCVm1XU20wSVFKLy96?=
 =?utf-8?B?MnRkZG5sRjlUVDZ3ZHNEL2FzNTA3b0g1RUNyckZlWVpubDh5Q0ZGdGR0bUd4?=
 =?utf-8?B?TndBU3JMWk50YjRmR3dHWkkzVHVOSnRZaTdXUmFOTmpOU2U3dzE2YXA1SE52?=
 =?utf-8?B?R2g4dEFEajRoaUJqRnZObS9KS2wybTBQd1pWMnNSeGU4T1pjQWNFS1BaMzc0?=
 =?utf-8?B?NlpHVmJJdHQwWXBQcEYyd09TbGNIZFhNMy9CMmtyazlUU3dudDVmZUE4OWY2?=
 =?utf-8?B?NmhwSkZ0WjNMMWlRZWUwWjBrNkJVUi9wTTQrRmFxQUdUMERaOUJXZm5RZG1w?=
 =?utf-8?B?RGFtZW5PMXU1eTVFakYzQ2xjTVZmamMrTnYvUnBDb2pGV1hCWGJHRWt3RnhG?=
 =?utf-8?B?TURBcVNuNitQMHpEaXkxblBNQjR1aUxCaVFlYVhSNFJac254a3dHVXYweVdN?=
 =?utf-8?B?Y09EY0xtRzh2VHpnc3hUWVpIbG5SaXVibS9Ga0lJUmhOQ0lDVlJ5OU4vUHFm?=
 =?utf-8?B?YThKeHBkZjFyQUNqYVZZYjVESWUwWm1jNkxkMnZ4OWJ3eDZLTjFyNSt0Vmlh?=
 =?utf-8?B?TjhXNkpQckh3UVo3L09tWkZCc3Yva2lqOHMzRGQyTHN3cVFYM3dtZ1MxUWR5?=
 =?utf-8?B?TzBGdTh0c2p0aWU4NFY1TFc2ODBvSXM5eitDYzNXa3Ixb2ZTWFBBSWxha0Ur?=
 =?utf-8?B?b3RUWURLSlRObTdwOU5OUWFtdUZuTTkzVm5HejIzaFJHNDRPOS93YlppZ2xs?=
 =?utf-8?B?Y1dTRENuazRianY0dU9IbFRvUGJTR0kwQzE5M2s3YU9vekZpeUJsL0xMVXZx?=
 =?utf-8?B?NUJIZDVYWlA4QVhyWVhyZXhrWWhNaHk2M3JFL3gyRm1UWkVGV0hBVVhjYUI3?=
 =?utf-8?B?OXZiVnd3SWpMWXZ0RXE5SnhERExRR0ZlN2FHa3VhK0Y1SDVWR05NMW9pNE9h?=
 =?utf-8?B?OXlPVWVreTdOWUs2SDRpV0IrUTdjUTcwSVdERlF0dlZKZGY1ampVMFIxR1lV?=
 =?utf-8?B?bXF4Nk9VdzFtWG1oWmR0cmViZC9adjRwbzdVWFRWenlDSG9XUUpLQnJDS0s5?=
 =?utf-8?B?MEVwVzQyTHhtMGdnb2l3bWVvSGZibGtNS3JoTFdDTFR0UjJVUDZDOWxLZ2Yw?=
 =?utf-8?B?aUR5WTlJTXlzOGZZZlNyMG83YllxWFEwd3B6aS9BNW8wS0RLdWI0WGV2WU9z?=
 =?utf-8?B?YlpzZVM4WTRnb0NldVBORDV0M0k0VnNKS0VpbXEzSzZNM005NEs3ZlZFb1VU?=
 =?utf-8?B?ekRuMmVUdG9XN081MHhxekl1dUs0MjZydm0vYlYvaUNFeE9Fd2FmV251STV3?=
 =?utf-8?B?VjZBQ2Q5UjFJQVZTUWd4WnNyUzJZYkVheEhWRFBzeU4yZlhFMzU0ZzlYMkRN?=
 =?utf-8?B?cXIzR2pkUHhac2dKMUtjdGxFSkFjdi85Q2FIT0YwT3p4V1d0Y1JkeUl2TkJk?=
 =?utf-8?B?NkpRRUxXRjZDRzBPVUV0eWRZMnVjVEFjVFkxMGJVK1lVNHF5dHlodytudFZI?=
 =?utf-8?B?WUVQa0JhbzFOTlk5QWZubHJ1dXc4TFB0bGlLZUkzUEcybmw0ZFk5b0VsNE1O?=
 =?utf-8?B?T2l5MUtLUWxiZDZPTG82cVY3UTVvZnV2SWNlUnBUck5hQVFVR0xUTU9kR0Q3?=
 =?utf-8?B?ZWptWng3RDVvL0M2Y2hRNE9hV0crUDhZbm52ZVNkdWEwZjlpeDVtaW9DaGdj?=
 =?utf-8?B?eC80Z3dxMFRrNDhpTWVnZHFOMFBFUU4wQkc4R1BZR3ZMNDR3Si9UTWl3SnB5?=
 =?utf-8?B?ejZqQUdLL28wS0VyU2lYYjJiOVFDaERIYkNVZkc0ZE1PYVFpMDhiY1J6THQ2?=
 =?utf-8?B?TnYyVjZwM3ltcTVWUStrcDN4UFpkK25lNk91eHVEbEM3eDg4WmM1M2JFL0du?=
 =?utf-8?B?UDVweHZYQmdQOFZNYnZuTG0yWUdsUTc5ejU5QTJrZ0pDTk1mendkb2ZwTDNx?=
 =?utf-8?B?NFVRZzJwWXI3Z2dDVEFnUkJkNW5INExHRVRwdm91aEVvY3NyaFdtV2d5Njdk?=
 =?utf-8?B?c05PTVNyeUFTOWpmY1pwMmVnZDhKdkd5bVNKUFhLY1hna3ZMeFVDRzhzU0NR?=
 =?utf-8?Q?2wfY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69532e0-f671-43bd-ec7c-08dd0784b8bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 03:54:37.2887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 07qb1FFUx7HxfHja78u72eBO/2bejFOtcQkYVzXl+0kdUehqIoD0qrAIptEnr5x0si84lIFZ4vJShFXLJQaaQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9013
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

SGkgTWFyZWssDQoNCk9uIDExLzE1LzIwMjQsIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiBPbiAxMS8x
NC8yNCA3OjU3IEFNLCBMaXUgWWluZyB3cm90ZToNCj4gPiBUaGlzIHJldmVydHMgY29tbWl0IGZm
MDZlYTA0ZTRjZjNiYTJmMDI1MDI0Nzc2ZTgzYmZiZGZhMDUxNTUuDQo+ID4NCj4gPiBtZWRpYV9k
aXNwMV9waXggY2xvY2sgaXMgdGhlIHBpeGVsIGNsb2NrIG9mIHRoZSBmaXJzdCBpLk1YOE1QIExD
RElGdjMNCj4gPiBkaXNwbGF5IGNvbnRyb2xsZXIsIHdoaWxlIG1lZGlhX2Rpc3AyX3BpeCBjbG9j
ayBpcyB0aGUgcGl4ZWwgY2xvY2sgb2YNCj4gPiB0aGUgc2Vjb25kIGkuTVg4TVAgTENESUZ2MyBk
aXNwbGF5IGNvbnRyb2xsZXIuICBUaGUgdHdvIGRpc3BsYXkNCj4gPiBjb250cm9sbGVycyBjb25u
ZWN0IHdpdGggU2Ftc3VuZyBNSVBJIERTSSBjb250cm9sbGVyIGFuZCBMVkRTIERpc3BsYXkNCj4g
PiBCcmlkZ2UoTERCKSByZXNwZWN0aXZlbHkuICBTaW5jZSB0aGUgdHdvIGRpc3BsYXkgY29udHJv
bGxlcnMgYXJlIGRyaXZlbg0KPiA+IGJ5IHNlcGFyYXRlIERSTSBkcml2ZXIgaW5zdGFuY2VzIGFu
ZCB0aGUgdHdvIHBpeGVsIGNsb2NrcyBtYXkgYmUgZGVyaXZlZA0KPiA+IGZyb20gdGhlIHNhbWUg
dmlkZW9fcGxsMV9vdXQgY2xvY2soc3lzX3BsbDNfb3V0IGNsb2NrIGNvdWxkIGJlIGFscmVhZHkN
Cj4gPiB1c2VkIHRvIGRlcml2ZSBhdWRpb19heGkgY2xvY2spLCB0aGVyZSBpcyBubyB3YXkgdG8g
bmVnb3RpYXRlIGEgZHluYW1pY2FsbHkNCj4gPiBjaGFuZ2VhYmxlIHZpZGVvX3BsbDFfb3V0IGNs
b2NrIHJhdGUgdG8gc2F0aXNmeSBib3RoIG9mIHRoZSB0d28gZGlzcGxheQ0KPiA+IGNvbnRyb2xs
ZXJzLiAgSW4gdGhpcyBjYXNlLCB0aGUgb25seSBzb2x1dGlvbiB0byBkcml2ZSB0aGVtIHdpdGgg
dGhlDQo+ID4gc2luZ2xlIHZpZGVvX3BsbDFfb3V0IGNsb2NrIGlzIHRvIGFzc2lnbiBhIHNlbnNp
YmxlL3VuY2hhbmdlYWJsZSBjbG9jaw0KPiA+IHJhdGUgZm9yIHZpZGVvX3BsbDFfb3V0IGNsb2Nr
LiAgVGh1cywgdGhlcmUgaXMgbm8gbmVlZCB0byBzZXQgdGhlDQo+ID4gQ0xLX1NFVF9SQVRFX1BB
UkVOVCBmbGFnIGZvciBtZWRpYV9kaXNwezEsMn1fcGl4IGNsb2NrcywgZHJvcCBpdCB0aGVuLg0K
PiA+DQo+ID4gRml4ZXM6IGZmMDZlYTA0ZTRjZiAoImNsazogaW14OiBjbGstaW14OG1wOiBBbGxv
dyBtZWRpYV9kaXNwIHBpeGVsIGNsb2NrDQo+IHJlY29uZmlndXJlIHBhcmVudCByYXRlIikNCj4g
PiBTaWduZWQtb2ZmLWJ5OiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPg0KPiBVaCwgSSBh
bG1vc3QgbWlzc2VkIHRoaXMgcmV2ZXJ0IGJldHdlZW4gYWxsIHRoZSBMREIgcGF0Y2hlcy4NCj4g
DQo+IFRoaXMgcmV2ZXJ0IHdpbGwgYnJlYWsgbXkgdXNlY2FzZSBvbiBNWDhNUCB3aGVyZSBJIG5l
ZWQgdG8gb3BlcmF0ZSB0d28NCj4gZGlzcGFyYXRlIHBhbmVscyBhdHRhY2hlZCB0byBMVkRTIGFu
ZCBUQzM1ODc2NyBEU0ktdG8tRFAgYnJpZGdlIGFuZCBJDQo+IG5lZWQgYWNjdXJhdGUgcGl4ZWwg
Y2xvY2sgZm9yIGJvdGguIE5vdCBiZWluZyBhYmxlIHRvIGNvbmZpZ3VyZSBhY2N1cmF0ZQ0KPiBw
aXhlbCBjbG9jayB3aWxsIG1ha2UgdGhlIGRpc3BsYXlzIG5vdCB3b3JrLCBzbyBmcm9tIG15IHNp
ZGUsIHRoaXMgaXMgYQ0KPiBOQUssIHNvcnJ5Lg0KDQpJcyB5b3VyIHVzZWNhc2UgaW4gdXBzdHJl
YW0ga2VybmVsPyBJZiB5ZXMsIHdoaWNoIERUIGZpbGUgaW1wbGVtZW50cyB0aGUNCnVzZWNhc2U/
ICBJIGd1ZXNzIGl0J3MgaW04bXAtZGhjb20tc29tLmR0c2kgYXV0aG9yZWQgYnkgeW91LCBidXQg
aXQgb25seQ0KY29udGFpbnMgdGhlIERUIG5vZGUgZm9yIFRDMzU4NzY3LCBidXQgbm90IExWRFMg
cGFuZWwuDQoNCkNhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZSBhYm91dCB0aGUgZmFpbHVyZSBjYXNl
Pw0KDQpZb3Ugc3RpbGwgbWF5IGFzc2lnbiBhbiBhY2N1cmF0ZSBQTEwgcmF0ZSBpbiBEVC4NClRo
aXMgcGF0Y2ggb25seSBtYWtlcyB0aGUgUExMIHJhdGUgYmUgdW5jaGFuZ2VhYmxlIGR5bmFtaWNh
bGx5IGluDQpydW50aW1lLiAgVGhhdCBtZWFucyB0aGUgZXhpc3RpbmcgaW14OG0tZGhjb20tc29t
LmR0c2kgd291bGQgdXNlDQpJTVg4TVBfVklERU9fUExMMV9PVVQocnVubmluZyBhdCAxLjAzOTVH
SHopIGFzIHRoZSBwYXJlbnQgY2xvY2sNCm9mIElNWDhNUF9DTEtfTUVESUFfRElTUDFfUElYIChm
b3IgTENESUYxL0RTSSksIHNpbmNlIGl0IGluY2x1ZGVzDQppbXg4bXAuZHN0aS4gIEkgYXNzdW1l
IGl0IHNob3VsZCBiZSBhYmxlIHRvIHN1cHBvcnQgdHlwaWNhbCB2aWRlbyBtb2Rlcw0KbGlrZSAx
MDgwcDYwIHZpZGVvIG1vZGUgd2l0aCAxNDguNU1IeiBwaXhlbCBjbG9jayBhdCBsZWFzdCB3aXRo
IDEuMDM5NUdIeg0KUExMIHJhdGUuICBHcmFudGVkIHRoYXQgbGVzcyB2aWRlbyBtb2RlcyByZWFk
IGZyb20gRFAgbW9uaXRvciB3b3VsZA0KYmUgc3VwcG9ydGVkIHdpdGhvdXQgZHluYW1pY2FsbHkg
Y2hhbmdlYWJsZSBQTEwgcmF0ZXMsIHRoaXMgaXMgc29tZXRoaW5nDQp3ZSBoYXZlIHRvIGFjY2Vw
dCBiZWNhdXNlIHNvbWUgaS5NWDhNUCBwbGF0Zm9ybXMobGlrZSBpLk1YOE1QIEVWSykNCmhhdmUg
dG8gc2hhcmUgSU1YOE1QX1ZJREVPX1BMTDFfT1VUIGJldHdlZW4gTFZEUyBhbmQgTUlQSSBEU0kN
CmRpc3BsYXkgcGlwZWxpbmVzLiAgVGhlIG1pc3NpbmcgcGFydCBpcyB0aGF0IHdlIG5lZWQgdG8g
ZG8gbW9kZSB2YWxpZGF0aW9uDQpmb3IgdGhlIE1JUEkgRFNJIGRpc3BsYXkgcGlwZWxpbmUgZWl0
aGVyIGluIHNhbXN1bmctZHNpbS5jIG9yIGxjZGlmX2ttcy5jDQp0byBmaWx0ZXIgdW5zdXBwb3J0
ZWQgdmlkZW8gbW9kZSBvdXQuICBJcyB0aGlzIG1pc3NpbmcgbW9kZSB2YWxpZGF0aW9uDQp0aGUg
Y2F1c2Ugb2YgeW91ciBmYWlsdXJlIGNhc2U/DQoNCj4gDQo+IFRoZXJlIGhhcyB0byBiZSBzb21l
IGJldHRlciBzb2x1dGlvbiB3aGljaCBzdGlsbCBhbGxvd3MgdGhlIFBMTA0KPiByZWNvbmZpZ3Vy
YXRpb24gdG8gYWNoaWV2ZSBhY2N1cmF0ZSBwaXhlbCBjbG9jay4NCg0KQXMgSSBtZW50aW9uZWQg
aW4gY292ZXIgbGV0dGVyLCB0aGUgb25seSBzb2x1dGlvbiB0byBzdXBwb3J0IExWRFMgYW5kDQpN
SVBJIERTSSBkaXNwbGF5cyBvbiBhbGwgaS5NWDhNUCBwbGF0Zm9ybXMgaXMgdG8gYXNzaWduIGEg
c2Vuc2libGUgYW5kDQp1bmNoYW5nZWFibGUgUExMIHJhdGUgaW4gRFQuICBTb21lIHBsYXRmb3Jt
cyBtYXkgdXNlIHR3byBzZXBhcmF0ZQ0KUExMcyBmb3IgdGhlIExWRFMgYW5kIE1JUEkgRFNJIGRp
c3BsYXkgcGlwZWxpbmVzLCB3aGlsZSBzb21lIG90aGVycw0KaGF2ZSB0byB1c2Ugb25seSB0aGUg
c2luZ2xlIElNWDhNUF9WSURFT19QTEwxX09VVCBiZWNhdXNlDQphbGwgb3RoZXIgZWxpZ2libGUg
UExMcyBhcmUgdXNlZCB1cC4gIFRoYXQncyBhbGwgZmluZSwganVzdCBiZWluZyBwbGF0Zm9ybXMN
CmRlcGVuZGVudC4gIFRoZSBvbmx5IGxpbWl0YXRpb24gb2YgdGhlIHNvbHV0aW9uIGlzIHRoYXQg
c29tZSBwbGF0Zm9ybXMNCmNvdWxkbid0IHN1cHBvcnQgc29tZSBwYXJ0aWN1bGFyIExWRFMgYW5k
IE1JUEkgRFNJIGRpc3BsYXlzIGF0IHRoZQ0Kc2FtZSB0aW1lIGR1ZSB0byBsYWNrIG9mIFBMTHMs
IGJ1dCB0aGlzIGhhcyB0byBiZSBhY2NlcHRlZCBzaW5jZQ0KdGhlIHNoYXJlZCBJTVg4TVBfVklE
RU9fUExMMV9PVVQgY2FzZSBuZWVkcyB0byBiZSBzdXBwb3J0ZWQgYW5kDQp0aGUgdHdvIGRpc3Bs
YXkgcGlwZWxpbmVzIGFyZSBub3QgYXdhcmUgb2YgZWFjaCBvdGhlciBmcm9tIGtlcm5lbCdzDQpw
b2ludCBvZiB2aWV3Lg0KDQpJIGhvcGUgdGhhdCB3ZSBjYW4gYWdyZWUgb24gdGhpcyBzb2x1dGlv
biBmaXJzdCBiZWZvcmUgc3ByZWFkaW5nDQpkaXNjdXNzaW9ucyBhY3Jvc3MgZGlmZmVyZW50IHRo
cmVhZHMgYW5kIGV2ZW50dWFsbHkgdGhlIE5BSyBjYW4gYmUNCnRha2VuIGJhY2suDQoNClJlZ2Fy
ZHMsDQpMaXUgWWluZw0K
