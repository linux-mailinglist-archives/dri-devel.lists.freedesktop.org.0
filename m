Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFnmEtTirmmoJgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:10:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A429D23B532
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C4310E52A;
	Mon,  9 Mar 2026 15:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="K6quY1jq";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="nLo0K7bQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA73B10E52C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 15:10:07 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6296qPCL4154199; Mon, 9 Mar 2026 15:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=4sG2Vm9pZzZ+kdxAIKf7v4N3I
 tXnqBGwxx2jwELrZ7s=; b=K6quY1jqUKtfg5SU8s1ERyHnzwNDBCtUaL5n34hFQ
 BYNMoEoVH9jX1G0wrRhtW7hkMeGWw7qCOeWXZB4PaPgnEhFLI4I0lDURKl/DcVS+
 WFVrpHsXjFnGqJ2jUxpUmucLlgdnWuS7MjJPhZZz4UZ0/VvhjUP+I217haNnCMYu
 Dnjscd6toeSqsyZP7lCIXR42xsw/mCznz+qjS6hzIN/gdqiXf+dYFyW5dbcF0gv5
 hPJDjV6kuoYZScpzADWeGiBMF9pYEnvAtMn64PIShkSSrkcgCtaIXAO/oe5f1inn
 i2d6nH1ssV57dDaib7L+8f6li4Lxh5bq6ofGVl15vharg==
Received: from cwxp265cu010.outbound.protection.outlook.com
 (mail-ukwestazon11022120.outbound.protection.outlook.com [52.101.101.120])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4crb5thjbc-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2026 15:09:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsk9MJbZ/1gvTjvxwTjqumOI1mtD6SaQKDm98aEnmaGQ6ZR3Seldsro8TnLnKBGlGk0mwkHWlBUl42QvrMklVNYjKfAQRDHqV/wFTgav5MQ71wqxKvVmFxQmCRxXriY+BvU0gwJIBDmokStyuNqmSTGOkkpYQ83b73sWhTLUt0moJohwjgtOShXUFk4tyTkH2H4FJ3ngH64diCaZYy5A0fZcJ8QBXUyhO1ZN+LMDasoZ4HEGhpxc1HPbMzAVXN9O8TjjTottyMM/RyBvHKRLBIvXvlQP6Gs+5fz8HkAvug455amJ25zG4PkfJWRk3Eiqt6/uiXNXqxHWSapmIH7KNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sG2Vm9pZzZ+kdxAIKf7v4N3ItXnqBGwxx2jwELrZ7s=;
 b=rgYTqhQPurKDYRJzVu3EKUj1pVM8U/mUmOunkv78OjGGp4J22/sdMW27Vq1I4pSllUUHIkLW79MjzUjA50tEdbyIpL83sxWtIiTl8OmPS5com/Krlm4b7T2WwC473RfMf/h8aczGvkONb4QVA68TTpdhjOCYX0y4sDDpzHbnfHdrUUvLVjNCtt6bQGFHuJoc8vfHF7KEU/36BcwBwOSOcyHItpmPFvBsb+AqKsb2KyiQSpx3+E304rPjfUUHme3TI4G8xVYeQz/6tDVJxMUgevSIY5O/ZGI9dzxHKe3OPnRfAhcxgYrMmbpr0fhtYTkB7FO/IgaXbVAFUbTSbMiBLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sG2Vm9pZzZ+kdxAIKf7v4N3ItXnqBGwxx2jwELrZ7s=;
 b=nLo0K7bQOzHhTLl50JP3FqPL526VAhczJS3nghg69dN7hzEjR/wI+jejEW8wOcwbAbp6tOTkLzGbeT3WfWpB4NJzvBV8DHStFIY+ex0i5bURNF3RIWawqJDOELMp8PmYhD8YDsRf4Zj73iWi/YSjZcBFjrYN4Q0K4qXSmZy/ngE=
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e2::14)
 by LNXP265MB2443.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 15:09:45 +0000
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6]) by CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6%6]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 15:09:44 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Alexandru Dadu <Alexandru.Dadu@imgtec.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Binns
 <Frank.Binns@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>, Brajesh
 Gupta <Brajesh.Gupta@imgtec.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/imagination: Implement handling of context reset
 notification
Thread-Topic: [PATCH] drm/imagination: Implement handling of context reset
 notification
Thread-Index: AQHcrLDhtzXVQAVtxkqz4+M5lUA62bWmVCMA
Date: Mon, 9 Mar 2026 15:09:44 +0000
Message-ID: <994e5179-62fd-4006-9ab2-74dde3d29637@imgtec.com>
References: <20260305-b4-firmware-context-reset-notification-handling-v1-1-46e2ce8d46ef@imgtec.com>
In-Reply-To: <20260305-b4-firmware-context-reset-notification-handling-v1-1-46e2ce8d46ef@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB3393:EE_|LNXP265MB2443:EE_
x-ms-office365-filtering-correlation-id: 353f4db8-f3bd-4334-b070-08de7dede5ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|6049299003|38070700021|4053099003; 
x-microsoft-antispam-message-info: pYRDGvTWWyenIwMTP+vLg/ityUGGZHLfQnOAQMzhrOHSXRUpwG0Y1+CkZ6GKIfCaz6yp1EgE+RQpx5V+JT6BTT5Ow2z92Nd/j9dieWK58fYQI37jk5q0bOS3sEVakVP0wX6q1Auif4MPUtCawUbuW1eY2eRni4C1e4/ZC6O4nV8d1CcPn99G/cLJOmRxratFGIksBG07xroufFgC9paMQVNfjeS+JWglZ93vEb/YFQ8yWJkJFEJgRUfZXXLAZREHv6mhKIBRZvDfvKKcFLhEMviay7RLaqNqReJB9K0rtulPO74y5p4UuuaRX0A/iN+SF/oiRQdhyfg2HMWaLWWMGvcPG8gzB07RfB2Tif4F1RD/qbhoZEnK6IIfeP2i4hjoCnVmqGyLTYm6ipHoVaZZ7GipYk2ffD+5TKNo2+LN7BkkgoZzmLZfltPnwMpn52JnAcSHPyy/HTH0CIyTgFW/DS6SPq0+iyjaJPhp5yTkKSHxM/CCU5j3AA/YZEhJHwNHDf1cnXJ4J6PvhPkV6Vql7dGckOdip2bXh8SoNr9zr8qmfQ/jqMdXpuYTrAMNTt85ICm9fxR9FKURFgj7E9lQsY0RL4YOppiEPm9A7CGcI8GZCNckevjYCJ9j1GjFNtkctSfgDOceHj68kPUVAaptTXbmE0USy82A7zeWZKqfXZFNz8kXie+7hYOMBS+JGjwg4gCm1pSM4Na3S7Lc93ROaNoEafANOw9fFfY2S9aJZ/q3sX1Iz6E/wMzW2kOeoO4g/lu1ZgORd1ylgz3nK5kMR9SmiA4V7KQQLzlyVTTnuVA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(6049299003)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2xyd0M3MWluV2tjcVJqME1HU1MrdUtvTU1TcVFSa3RNRXliWnJEM0plWXhp?=
 =?utf-8?B?cSs3V1JBZ3UrMk5DWE9vQ2l2YVUrZVNFMW5XODJqb2FqQ1FlSElCc012bDlS?=
 =?utf-8?B?M1hVdVJNdmo3NzEwL2dPWmRSMHh5bEpLSy9ZdlB0eFl6am1uYkZCSjFCc3NX?=
 =?utf-8?B?UnFtUFhJdllqc2xtWTRKek1xbFhyb2RrY1Y0SW5ubGxzQ3lBVlUxM283bHBB?=
 =?utf-8?B?REd1eXA0Z3BzR3h0UnZiZS8vTmZwVy8xMXN3TkFxSGJaSE5jQ2hmbG5tbWVu?=
 =?utf-8?B?NDVJSXQ5NnV3TzZoeGVQVi9zWVJ1blpNU2NkT1ZhQ2RIRVpGbWE3V2txK0Rp?=
 =?utf-8?B?a05PaCtGL1I5UkE4MEp2TW9lRjllKy9odGhadmRGZFIrcjB5dVhnT2ZkZjdY?=
 =?utf-8?B?dmovdFkxbjhESW9HSTZtckU3WEQwNC8zb2NxMVVob2NHelFjb2x6Ykx2SXRU?=
 =?utf-8?B?L21yTVJjOEgrTW5ZeDFCNzloRVhWSXJOSFZ3VUMzejZLTmpESmtWQmNDOE1O?=
 =?utf-8?B?TVpxOHV5U0cwWHlkSXMzR1Zsa2VFcXFORUo1Y05jdGdvbll1dVJmSUh6ZElv?=
 =?utf-8?B?c1lXajhMNzVyTDZOWmthUmN5ampoZVFNZ29YdWFDV2hCUEZUTHE1VUxTbThm?=
 =?utf-8?B?WklaOXVzUS94cndIZkNRcWcvb3V5ODJ3MVFibVRJZWl3VENNM2k4bWh3YzNh?=
 =?utf-8?B?cUxaNEEzdVNGaHErdGJicUd3VEVpZmoxWlhpZWphKzVPd212T1VjSjdKcTZR?=
 =?utf-8?B?cmJXR3lOZGZEZVhUK2plT2JUK0VJS1Zkc01BRHNHZDZJbERuK1loTFdXek9i?=
 =?utf-8?B?MnBhL3FvM0gwTDRwMHBpZGZTR3JvSVd1TXlDeWJWcHhNM2l5SE5yY0tGajN5?=
 =?utf-8?B?KzNLUnVmQVA5Mkc0b2trR1pOTVNOM0k2bHVVVWlobEoxOGhTM2loVmJhbVVm?=
 =?utf-8?B?d1Fuc2I0Nkw5RXF2MnE0MG8zNVhMRmVjMGxqNU1VTkZxR01iWFV4TEw3c1FF?=
 =?utf-8?B?M04xdUo0MVNUT0dIVllYNEhxL1p3Y00wMHl6NzZPWlhQYmRNb2tsYU5RY01V?=
 =?utf-8?B?bUJKK2NtVS9jT1UwWEkzeDAxV0QzcURLbmxzWnBOd1FncDFiWlF3NlgyMmVo?=
 =?utf-8?B?Q0J0N1kxdWg4UlZjMW4reHBPYnhGKzdMOG8wbjhXellON0tCcDlDYXhTbWRX?=
 =?utf-8?B?cHRCVkVaWkdISU04OG8wZ3JVK0FPMzhWV1VyTjRiY1AwL041STNUNGZCQXJR?=
 =?utf-8?B?RzFMbkdQZ2w5ZzE2SFVmMGVFdGZxQXVJKzQvdkoyUXY0OWdEQWNITHJwR1FR?=
 =?utf-8?B?NVdzQkYvME96TDRBRFR2UitkVzVmNjR6NVBlYmlmMzVaSE5PaWRxSTM0RVlj?=
 =?utf-8?B?ZWxaK0RDeXI0R2lJSDROOGpSWWJwQThZemJMdXpUMlhNejZRRG8vMzZpSVNK?=
 =?utf-8?B?dDRweWcrS1QwMUwyTmhwajcrOS9EWU5OaGxtOHA2NGNMZ2hacWx6TjlNNnZt?=
 =?utf-8?B?dk5vTlFFTC8rcHYrT3NIM3Nja0tiYVBLV055UG42T2kyUGtHWTljUE91aHlL?=
 =?utf-8?B?OHZOZ21tL0MwU3l3SXp4RFBNbjEvSWsxQkszT1A0bXlIcUgyRG5oeXhScGpp?=
 =?utf-8?B?OEFXVnF5Q1N0Ry81WS9qTE5zS1JnU2l0Z2Z6ck5rV29yZEdGSEJBNjJwUFZk?=
 =?utf-8?B?a3VSNnFxdFJ2UnhsRktVYVVjd2UyOTlDZ0hzbWhKS1ozK1RWei9SYlAzTSsv?=
 =?utf-8?B?TjNidDVzRGFFZ29XS2UxZjF3SjNCcnQweHp4RTJxeGtveDJuRFBQS2dRdDEz?=
 =?utf-8?B?YXRnZjl5RXFFSHpWL2tSSFQwZWdGai9FSXEyUGNhRGZINmhmOGkvcisrMFlR?=
 =?utf-8?B?WmREMkhuTE8rbUdGRStmRWtiREZ3N1R3ZFMxUGROOVJsZVhoUW9VUnBuZUs5?=
 =?utf-8?B?cFhNeC9CTDhsTDBPYnpubnA5ZElQenMrekVWdFUrWUlKRDBzYitYSFBNQjR1?=
 =?utf-8?B?TVB4UG5QOXFiL0RhK0NZNS9FK0oyNDB4TjBYSUJGVEJCNVQzNElSYmxWN3NE?=
 =?utf-8?B?a0E3ei91SmUzRnFNWmRUM0oyU0RydDZmN2ZDVWFmVW1TQ3BsTDdzbU9POXBa?=
 =?utf-8?B?TmsxakJRaXVldVBtQXFrL0c2dzBIaFUxSDNva0t0RVRjaW5VVWtJckw0ZnBU?=
 =?utf-8?B?NVdYdTlVaGVOS1hUQWJZU0JWYTB6anpLM21WcGpVT0FseUoxdHZUVHpkVTRo?=
 =?utf-8?B?YW1YY1dlN3dnZyszd0xNL0xWem1NN3RsYUVCcmtwalNib0w5aWhYamREZW53?=
 =?utf-8?B?MUtuOE9yMGZneHd6dlZaYVhocnE1VlpxeDAzZTI2SFFqU3gzWlRnbzU0dlVj?=
 =?utf-8?Q?qF7SU39Oodu/ARYs=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PkJIEzYnbmEYkX0JM17Nlo7A"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Hn54AyTOouzgRFE4d+HGS5P4keeEtsif9T8PmqjzZQNZGNrYdQkbpnxt/paNNqrt6wSkj7N5qx725eVM35RdS+NRWxU4h254n7iWwLIdovYAeO8rodVlG9oooE7n/GRQ3jT4+4y8yh7+Cdbhbh1VDocc/bBszWH3IBibXzeqo7dl+0fskWlhAT/9ONvKp1dXZmzGcwYgxViEXUOVXbNH9V39oU7m3zYGpkVTckYUwNLC2r3ZgF0V1XZcr1+LRCWmAs8x3+fTCsng3fIwx40477kwVjXydpM70VN36NUlOrC/zxrPDqy8SLTvgC9pzKnvFTMRUW6leIuK/wZrXe01PQ==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 353f4db8-f3bd-4334-b070-08de7dede5ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 15:09:44.6800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GAABkxiKfwB3vEx+DTYArk0TNE8/Gs2kE9pvRES5nNTxXV3zqyYp8x5tMqedMRnWf2PL9V2SD4bYiXIByG9nTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2443
X-Proofpoint-ORIG-GUID: w_02_Y_Xlzzi-I-OuJE6N87GlrsNVYw9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzNyBTYWx0ZWRfX2AJCAmFKaIJH
 XoGSs9vt3eV+qo8Qby+h80hanMn/fiouc8SgUfOb9TlKwKfabuTMg4aSEnub67EKWHwcjS8V2qS
 PFIvv+s9VoUaRT/SaAg9V6HcroVGRTjy+ryRgQ6J+U+Meji+qBySLfS8X+gJAK8V/68T/tFqDQH
 IyH9v5hdAL6ntmSmb3AuLpOJXQoabMF+JiQmF+ZIXQmFOF2OSkmGMcDBbAUC+L/4IUSM0dcjYCq
 oxhQptK91l+Bgdpy/KOxVEiKlkpxCuoExzN2v5F+pON4fSDRBC6Si65Y1pYkIXalTls4HbeW2t0
 nV9H5Wxqw8XQ16SXqzt7xF9CuoaolLIPr1A1IcYPJo0PE+WFbtiNs8ascfpcNQ89Ih1KXEDAieL
 63zPtt+v3OZzorJMngyMdA+aD2BVFh5m8wJpi9Z8px4OUzmQruvMFCBoaKEmElmXC2VzQ/8ZWBw
 XMjzPADTGXJl8Uo4ofQ==
X-Authority-Analysis: v=2.4 cv=VN7QXtPX c=1 sm=1 tr=0 ts=69aee2be cx=c_pps
 a=tfanM9ScQIhv4mDjZMYfug==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22
 a=qZQ2PDNLMSdLoqI-hfl9:22 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=hoGtS_Y6aJxen0g1pOQA:9 a=QEXdDO2ut3YA:10 a=bWxViC3JaAGoryFn3FAA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: w_02_Y_Xlzzi-I-OuJE6N87GlrsNVYw9
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
X-Rspamd-Queue-Id: A429D23B532
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,imgtec.com,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Alexandru.Dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Frank.Binns@imgtec.com,m:Alessio.Belle@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	FORGED_SENDER(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,IMGTecCRM.onmicrosoft.com:dkim]
X-Rspamd-Action: no action

--------------PkJIEzYnbmEYkX0JM17Nlo7A
Content-Type: multipart/mixed; boundary="------------h9hFWrVbboFX2w2gRSs9ciZA";
 protected-headers="v1"
Message-ID: <994e5179-62fd-4006-9ab2-74dde3d29637@imgtec.com>
Date: Mon, 9 Mar 2026 15:09:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: Implement handling of context reset
 notification
To: Alexandru Dadu <alexandru.dadu@imgtec.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260305-b4-firmware-context-reset-notification-handling-v1-1-46e2ce8d46ef@imgtec.com>
Content-Language: en-GB
From: Matt Coster <matt.coster@imgtec.com>
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI
In-Reply-To: <20260305-b4-firmware-context-reset-notification-handling-v1-1-46e2ce8d46ef@imgtec.com>

--------------h9hFWrVbboFX2w2gRSs9ciZA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/03/2026 15:00, Alexandru Dadu wrote:
> The firmware will send the context reset notification message as
> part of handling hardware recovery (HWR) events. This commit decodes
> the message and prints via drm_info(). This eliminates the  "Unknown
> FWCCB command" message that was previously printed.

Hi Alex,

Thanks for taking over this change! Just a couple comments from me. Feel
free to ignore the nits, especially if no other changes are required
around them.

>=20
> Co-authored-by: Sarah Walker <sarah.walker@imgtec.com>
> Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
> ---
>  drivers/gpu/drm/imagination/Makefile               |   1 +
>  drivers/gpu/drm/imagination/pvr_ccb.c              |   6 ++
>  drivers/gpu/drm/imagination/pvr_dump.c             | 111 +++++++++++++=
++++++++
>  drivers/gpu/drm/imagination/pvr_dump.h             |  17 ++++
>  .../gpu/drm/imagination/pvr_rogue_fwif_shared.h    |  12 +++
>  5 files changed, 147 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/ima=
gination/Makefile
> index f5072f06b4c4..1222a14262e4 100644
> --- a/drivers/gpu/drm/imagination/Makefile
> +++ b/drivers/gpu/drm/imagination/Makefile
> @@ -8,6 +8,7 @@ powervr-y :=3D \
>         pvr_device.o \
>         pvr_device_info.o \
>         pvr_drv.o \
> +       pvr_dump.o \
>         pvr_free_list.o \
>         pvr_fw.o \
>         pvr_fw_meta.o \
> diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/im=
agination/pvr_ccb.c
> index 9294b4ba1de7..95d91cde7241 100644
> --- a/drivers/gpu/drm/imagination/pvr_ccb.c
> +++ b/drivers/gpu/drm/imagination/pvr_ccb.c
> @@ -4,6 +4,7 @@
>  #include "pvr_ccb.h"
>  #include "pvr_device.h"
>  #include "pvr_drv.h"
> +#include "pvr_dump.h"
>  #include "pvr_free_list.h"
>  #include "pvr_fw.h"
>  #include "pvr_gem.h"
> @@ -150,6 +151,11 @@ process_fwccb_command(struct pvr_device *pvr_dev, =
struct rogue_fwif_fwccb_cmd *c
>                 pvr_free_list_process_grow_req(pvr_dev, &cmd->cmd_data.=
cmd_free_list_gs);
>                 break;
>=20
> +       case ROGUE_FWIF_FWCCB_CMD_CONTEXT_RESET_NOTIFICATION:
> +               pvr_context_reset_notification(pvr_dev,
> +                                              &cmd->cmd_data.cmd_conte=
xt_reset_notification);
> +               break;
> +

This hunk does not currently apply cleanly on drm-misc-next. It's fairly
obvious what the resolution is, but would you mind rebasing if/when you
send a v2?

>         default:
>                 drm_info(from_pvr_device(pvr_dev), "Received unknown FW=
CCB command %x\n",
>                          cmd->cmd_type);
> diff --git a/drivers/gpu/drm/imagination/pvr_dump.c b/drivers/gpu/drm/i=
magination/pvr_dump.c
> new file mode 100644
> index 000000000000..4b7ea38a83bd
> --- /dev/null
> +++ b/drivers/gpu/drm/imagination/pvr_dump.c
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/* Copyright (c) 2026 Imagination Technologies Ltd. */
> +
> +#include <drm/drm_print.h>
> +#include <linux/types.h>
> +#include "pvr_device.h"
> +#include "pvr_dump.h"
> +#include "pvr_rogue_fwif.h"

Nit: our include order in most places is to have the "pvr_*" lines
first, then a blank line, then the <*> lines.

> +
> +static const char *
> +get_reset_reason_desc(enum rogue_context_reset_reason reason)
> +{
> +       switch (reason) {
> +       case ROGUE_CONTEXT_RESET_REASON_NONE:
> +               return "None";
> +       case ROGUE_CONTEXT_RESET_REASON_GUILTY_LOCKUP:
> +               return "Guilty lockup";
> +       case ROGUE_CONTEXT_RESET_REASON_INNOCENT_LOCKUP:
> +               return "Innocent lockup";
> +       case ROGUE_CONTEXT_RESET_REASON_GUILTY_OVERRUNING:
> +               return "Guilty overrunning";
> +       case ROGUE_CONTEXT_RESET_REASON_INNOCENT_OVERRUNING:
> +               return "Innocent overrunning";
> +       case ROGUE_CONTEXT_RESET_REASON_HARD_CONTEXT_SWITCH:
> +               return "Hard context switch";
> +       case ROGUE_CONTEXT_RESET_REASON_WGP_CHECKSUM:
> +               return "CDM Mission/safety checksum mismatch";
> +       case ROGUE_CONTEXT_RESET_REASON_TRP_CHECKSUM:
> +               return "TRP checksum mismatch";
> +       case ROGUE_CONTEXT_RESET_REASON_GPU_ECC_OK:
> +               return "GPU ECC error (corrected, OK)";
> +       case ROGUE_CONTEXT_RESET_REASON_GPU_ECC_HWR:
> +               return "GPU ECC error (uncorrected, HWR)";
> +       case ROGUE_CONTEXT_RESET_REASON_FW_ECC_OK:
> +               return "Firmware ECC error (corrected, OK)";
> +       case ROGUE_CONTEXT_RESET_REASON_FW_ECC_ERR:
> +               return "Firmware ECC error (uncorrected, ERR)";
> +       case ROGUE_CONTEXT_RESET_REASON_FW_WATCHDOG:
> +               return "Firmware watchdog";
> +       case ROGUE_CONTEXT_RESET_REASON_FW_PAGEFAULT:
> +               return "Firmware pagefault";
> +       case ROGUE_CONTEXT_RESET_REASON_FW_EXEC_ERR:
> +               return "Firmware execution error";
> +       case ROGUE_CONTEXT_RESET_REASON_HOST_WDG_FW_ERR:
> +               return "Host watchdog";
> +       case ROGUE_CONTEXT_GEOM_OOM_DISABLED:
> +               return "Geometry OOM disabled";
> +
> +       default:
> +               return "Unknown";
> +       }
> +}
> +
> +static const char *
> +get_dm_name(u32 dm)
> +{
> +       switch (dm) {
> +       case PVR_FWIF_DM_GP:
> +               return "General purpose";
> +       case PVR_FWIF_DM_2D:
> +               return "2D";

Have you considered PVR_FWIF_DM_TDM for this branch? They have the same
value but a hardware feature determines which is present. Can you either
pass the struct pvr_device down and check the feature in this branch to
determine the correct string, or, more simply, just update the string to
indicate that it could be either (e.g. "2D or TDM").

> +       case PVR_FWIF_DM_GEOM:
> +               return "Geometry";
> +       case PVR_FWIF_DM_FRAG:
> +               return "Fragment";
> +       case PVR_FWIF_DM_CDM:
> +               return "Compute";
> +       case PVR_FWIF_DM_RAY:
> +               return "Raytracing";
> +       case PVR_FWIF_DM_GEOM2:
> +               return "Geometry 2";
> +       case PVR_FWIF_DM_GEOM3:
> +               return "Geometry 3";
> +       case PVR_FWIF_DM_GEOM4:
> +               return "Geometry 4";
> +
> +       default:
> +               return "Unknown";
> +       }
> +}
> +
> +/**
> + * pvr_context_reset_notification() - Handle context reset notificatio=
n from FW
> + * @pvr_dev: Device pointer.
> + * @data: Data provided by FW.
> + *
> + * This will decode the data structure provided by FW and print the re=
sults via drm_info().
> + */
> +void
> +pvr_context_reset_notification(struct pvr_device *pvr_dev,

Nit: can we make this pvr_dump_context_reset_notification() or similar
to make it clear we're not really doing anything about the context reset
in this function?

> +                              struct rogue_fwif_fwccb_cmd_context_rese=
t_data *data)
> +{
> +       struct drm_device *drm_dev =3D from_pvr_device(pvr_dev);
> +
> +       if (data->flags & ROGUE_FWIF_FWCCB_CMD_CONTEXT_RESET_FLAG_ALL_C=
TXS) {
> +               drm_info(drm_dev, "Received context reset notification =
for all contexts\n");
> +       } else {
> +               drm_info(drm_dev, "Received context reset notification =
on context %u\n",
> +                        data->server_common_context_id);
> +       }
> +
> +       drm_info(drm_dev, "  Reset reason=3D%u (%s)\n", data->reset_rea=
son,

I was going to point out that we probably need a cast here since the
underlying type of an enum is unspecified and could technically be any
integer type, but the larger problem is that we shouldn't have such
ambiguity in the firmware interface at all.

Can you update struct rogue_fwif_fwccb_cmd_context_reset_data->reset_reas=
on
to be a u32 (I suspect 32-bits was the intended size here) so the layout
is more explicit? This should be a separate commit with a Fixes: tag
pointing to the commit that added the structure. There's another use of
that enum in struct rogue_context_reset_reason_data, that should be
updated too. I'd annotate the fields with a comment indicating that the
valid values for those fields are those of enum rogue_context_reset_reaso=
n
too.

> +                get_reset_reason_desc(data->reset_reason));

This line will need a cast after that change though.

> +       drm_info(drm_dev, "  Data Master=3D%u (%s)\n", data->dm, get_dm=
_name(data->dm));
> +       drm_info(drm_dev, "  Job ref=3D%u\n", data->reset_job_ref);
> +
> +       if (data->flags & ROGUE_FWIF_FWCCB_CMD_CONTEXT_RESET_FLAG_PF) {=

> +               drm_info(drm_dev, "  Page fault occurred, fault address=
=3D%llx\n",
> +                        (unsigned long long)data->fault_address);

This cast is unnecessary as %llx is already the correct format specifier
for u64[1] (and, by extension, aligned_u64).

> +       }
> +}
> diff --git a/drivers/gpu/drm/imagination/pvr_dump.h b/drivers/gpu/drm/i=
magination/pvr_dump.h
> new file mode 100644
> index 000000000000..450e8b9ebab8
> --- /dev/null
> +++ b/drivers/gpu/drm/imagination/pvr_dump.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/* Copyright (c) 2026 Imagination Technologies Ltd. */
> +
> +#ifndef __PVR_DUMP_H__
> +#define __PVR_DUMP_H__

Nit: I think this should just be PVR_DUMP_H.

> +
> +/* Forward declaration from pvr_device.h. */
> +struct pvr_device;
> +
> +/* Forward declaration from pvr_rogue_fwif.h. */
> +struct rogue_fwif_fwccb_cmd_context_reset_data;
> +
> +void
> +pvr_context_reset_notification(struct pvr_device *pvr_dev,
> +                              struct rogue_fwif_fwccb_cmd_context_rese=
t_data *data);
> +
> +#endif /* __PVR_DUMP_H__ */
> diff --git a/drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h b/driv=
ers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
> index 6c09c15bf9bd..f622553cdc11 100644
> --- a/drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
> +++ b/drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
> @@ -236,6 +236,18 @@ enum rogue_context_reset_reason {
>         ROGUE_CONTEXT_RESET_REASON_INNOCENT_OVERRUNING =3D 4,
>         /* Forced reset to ensure scheduling requirements */
>         ROGUE_CONTEXT_RESET_REASON_HARD_CONTEXT_SWITCH =3D 5,
> +       /* CDM Mission/safety checksum mismatch */
> +       ROGUE_CONTEXT_RESET_REASON_WGP_CHECKSUM =3D 6,
> +       /* TRP checksum mismatch */
> +       ROGUE_CONTEXT_RESET_REASON_TRP_CHECKSUM =3D 7,
> +       /* GPU ECC error (corrected, OK) */
> +       ROGUE_CONTEXT_RESET_REASON_GPU_ECC_OK =3D 8,
> +       /* GPU ECC error (uncorrected, HWR) */
> +       ROGUE_CONTEXT_RESET_REASON_GPU_ECC_HWR =3D 9,
> +       /* FW ECC error (corrected, OK) */
> +       ROGUE_CONTEXT_RESET_REASON_FW_ECC_OK =3D 10,
> +       /* FW ECC error (uncorrected, ERR) */
> +       ROGUE_CONTEXT_RESET_REASON_FW_ECC_ERR =3D 11,

Filling out the rest of this enum feels useful even without the rest of
the patch. Maybe this should be split out into a separete patch before
this one?

Chers,
Matt

[1]: https://www.kernel.org/doc/html/latest/core-api/printk-formats.html

>         /* FW Safety watchdog triggered */
>         ROGUE_CONTEXT_RESET_REASON_FW_WATCHDOG =3D 12,
>         /* FW page fault (no HWR) */
>=20
> ---
> base-commit: 68b271a3a94cfd6c7695a96b6398b52feb89e2c2
> change-id: 20260305-b4-firmware-context-reset-notification-handling-694=
a1b5e6b8c
>=20
> Best regards,
> --
> Alexandru Dadu <alexandru.dadu@imgtec.com>
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------h9hFWrVbboFX2w2gRSs9ciZA--

--------------PkJIEzYnbmEYkX0JM17Nlo7A
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaa7iuAUDAAAAAAAKCRB5vBnz2d5qsLkL
AP42ATbZ0+XbN4pIIZDa3SVjyODVbsJquHxiLbyrR8AxEwD+KtDnG0H7k8246LRyTh9u26d8iWBC
9rkAfh1RxjQMOQE=
=9qaV
-----END PGP SIGNATURE-----

--------------PkJIEzYnbmEYkX0JM17Nlo7A--
