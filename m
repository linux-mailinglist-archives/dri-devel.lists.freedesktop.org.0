Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CBzLv6HgWmzGwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:30:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28347D4B7A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6539810E52E;
	Tue,  3 Feb 2026 05:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cUwccLxh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013041.outbound.protection.outlook.com
 [40.93.196.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B73E10E52E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 05:30:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYIc6HvXJBYvdM1NZW4rpG4ZBXje+CE2gFHK1YdFDm9b74YzNi2JdzmqBkJOB3s4MqpbXD7EscBAXa/scOajcCg7rWPyJ4vKioBMbHYwh7D1lsArUG/GmkixATGk6Vj5afQrUGUtVuN+ecCHMaLRwZa0DKaYfrSZTMC5cAQTGx3FuJNCFdHZQk2JKDG0q4bkhE8RGNaLDpWeibSTnIrU+Hhk+/BZPOXKJ5pE6bkstV/qeu2e152bU13Dwhid+oZLxSNEXVzOcEQsAnRKs5xMMDfJ5mMb9yuE/QU810bqDedLqUcqxL3cUjsdjLNYgDS/06FCTlkib+f9JdEcemA0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohim5e6XBRhd8KjIzJJ7lrEPEXaoN9JveoUwxxudQf4=;
 b=bW/zkbep4MooKHjROTbFvcsaYKHvfREzML1ljJxZUODahuTYvL1MxI1tKOJVPq9dGGJeE1RdJInOvMYvTPbyNuhzzMoAdolgagF/dh5CR1NTpwlqCMixA4uDrKOCSU00mlM05O5S4V5Irn3aPNKECDBpPzMc9ilM5qDfOj8PjEQr7qLMjdfBs6STlBfZiKl6QdXnNRE43Kbpmf5qQo3p+12j+3h4mSBkOlJ9EVJtu8oAYV0O7vtmOTi20qXwRyqDC9SmPwuoGu4kPGNUN3W7Qqsf/nRrAdIyAN+PMgEYglCVZivGYvS570MVL9PkNaL+ljQMO3ZkP7PYk7h9TW0t4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohim5e6XBRhd8KjIzJJ7lrEPEXaoN9JveoUwxxudQf4=;
 b=cUwccLxhh66czNwClIMhTk/duOy6Doi8AqTl1nvShXL4GYm+cGcFzZ3AR1DJrOqJ7NWaz7sk/+4cTlYKI8tj67JfAmeEYBG3e0TpyC1Podjn/sEkYeGKQIlCnLefuBzeJJ/Ija7WNgqoTHZuAC/lNN3xssXqSAE29N2QAbeTAGqc/prVoihKIzfxN93hIBAjnyCgEGdzHkGJ+Cs6xOrMJ5JzAuLAPN0LheO9104vv96jfEKlwipAT3Xi57U8jjVPcayttlMmk5EqIICSmLhWkPQddtxmcAyYd4P7Xhu99mCib8EaxmFtCg97pYOwGlyTyZfxFuvodHZ1P687pUQRRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 05:30:29 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 05:30:28 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>, webgeek1234@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kurt Kiefer <kekiefer@gmail.com>,
 Jasper Korten <jja2000@gmail.com>, Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Enable cmu for Tegra186 and Tegra194
Date: Tue, 03 Feb 2026 14:30:25 +0900
Message-ID: <2541037.jE0xQCEvom@senjougahara>
In-Reply-To: <20260202-tegra-drm-cmu-v2-1-a1bcb37f3e85@gmail.com>
References: <20260202-tegra-drm-cmu-v2-1-a1bcb37f3e85@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0059.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::19) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 6362f12f-b6b1-41f5-4667-08de62e55749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzVMTHBpN2pWVFhDSFRWck9nSCtVMUJ3a0NGS2JybkJwWElJWmg4dGRrMkY2?=
 =?utf-8?B?S1lrcjdmQklNY2dwRStDcy9MOEp1K0RBenhtOERFLzlLL2FvUnVTb20rcThI?=
 =?utf-8?B?Ym1nS0RrbVdiL1FwMGJsVm5hN3hEdlVpbldoOTJ0NzdxZElabUl6MzRZbGMy?=
 =?utf-8?B?L3dhMnBuSFNSSERZRVBLMW9wVzBmOXM5UHRuSjFEVkVkaUlYd2RLZGtib3hF?=
 =?utf-8?B?QkhETlZZeDdFNXhsTVgwNjE2QlI2U2srbk9NRXNqdndFSmRIaXE4RjQ1a1hJ?=
 =?utf-8?B?REdxaEhPby9Vc1JVUURnM2lrdGI1RjhLRGlmTjBnYjJlcGFiQ0xMUEFkRVlv?=
 =?utf-8?B?SnNiQXhXZ3V1MjNlSHVKWEdXRWNYdTdjTExIRnBjUzY5OHpuN2diRlNMeE13?=
 =?utf-8?B?emU0dU9jYXFDWmFudzMrQmNFalRzbzBDeVhUb244eEhwSWEwR2xkcXJqQUI2?=
 =?utf-8?B?RUNsSnFVVU01cjlvK2Z3ZFozaG1FR25Uck1HWmJtQ29DSFpJekszTXNNdlVn?=
 =?utf-8?B?SXJyYnFxVjJFN2N5dDhUaWo1ZER4QW5OWlZmd0UyQTRtUk93MEpxeEg4OWtu?=
 =?utf-8?B?ZkxwOG9LY0ZyTmxTaFFUL21SZ0t3d0VZZnBabmxyU0hFMUs0anJWY2RJOUVa?=
 =?utf-8?B?dHJKSFZ0MEwwWk9aU1BlZ1A2dG94UGRDRThDSWRwSkJwb0xtT1N6SFhjMXdO?=
 =?utf-8?B?bCtBR2gxRUIva1VUc2VuYm8rVkNySi91dCs5dW5VMC9BdHI1TEpBMEt3dE8z?=
 =?utf-8?B?aHQvSVpQM3loN2VTbkdJaVp4OVNUM05OeUZGVWNwT0c2Q2hMY0QxTTJFWHlV?=
 =?utf-8?B?ZGdNaHpnd0Z3cko0cEJBcmtOeWg4dzNXcHh0WjhvWHRXenY0TTJjRDRTK0c1?=
 =?utf-8?B?SU5VbW9sQXpyNXc1VTNybTUvVlUyTlN4ekE5RUtOaDN6Tk9KMmR4YUdCMVpy?=
 =?utf-8?B?YXVVcVpuRmkzTFhzeGZRSkpodmZlQTBIaVo3RmxoYTR0SW1LMlhYMmlBU3dq?=
 =?utf-8?B?Ry84UVEvOVlYK0RuZ0ZQbys1M2NpTWgxS3BVSWNId2JlVVFwRXN5YzliQnFI?=
 =?utf-8?B?VmhUcnczOHg0R1U2VnpQVGVCb2RzRjV4RWYxTkM4bXVGRHkvWjRYWm9yNnJS?=
 =?utf-8?B?RzdCeWtQbXR4UE9GNDkzNlQ2dm1QWEEzdmx6RDJCNk9XMWtxb1VBVklDVHhB?=
 =?utf-8?B?R2Q2NmNhTXZOT3NXS3M3bDYra1ZncExSOEgvOXdTMExNSS91b3J4SWtoWTVx?=
 =?utf-8?B?dkhDa2JhdkJpLzNlUDhkTzloK0ZNTEdvS1lZZXo4cDBlZThVTzg1Zm1ROU5i?=
 =?utf-8?B?RC92SWRwbjJpNGxwTnhRcjVZaUw4d0kxV3NhSW1jblc5L1l2MXhGSUY0OWRC?=
 =?utf-8?B?QVJRRHBYZlU4dG9rcS9sWW1nWGVEQXN3cUMrNUVXc3Zidm00ZjRVTHIyRHk1?=
 =?utf-8?B?RWpFT2RVU2JXMTNDbExaVlBtcWZhYSthbUxoK3BLS0MzUnZRcTg1WVphakd6?=
 =?utf-8?B?SXhRN0Z2cXVZbzVKSUpqT1Bjc2p2TTl6bmdIc2dvbGFCekxZUjVaekVqelF6?=
 =?utf-8?B?eGV2Qy9rZWhBVkdmM29KQkdGb0RPYVJqZ09tNUlHcTR2eU4wZTBaZVBPSjNu?=
 =?utf-8?B?Ukg2cWVLeHR6WmJkN0Q0U01FOHp1alV0SGlrQnowcUlZTThYZVg2TXJQUDYy?=
 =?utf-8?B?ODZJZmtkbXJVY2NDSVJtQ095dTR4STFxakQ3Umx3VHBNWGJ2eTZ3SDdHY0lS?=
 =?utf-8?B?TzJMWU1ldFVvNmh5a3ZNaXExUkxFM29NcGUxOVRhYUdIb0E1cFdRYTE3aXl1?=
 =?utf-8?B?Y3dEenNOV0tKUWtkRnF1Mmljc2g0WVdzVUt1eEZLUXdBeTZYTDUxRHZYMDNh?=
 =?utf-8?B?dGhVbEdxSHdTRDB5UnlpQlJTQUtJaFhVbFp5djdwTm5hMUdMYjJ3V1FHVmFN?=
 =?utf-8?B?dWU1SUovTzdaTlpaTXZscUdWSC9VVEw2Wjc3Nk1xbU0zT0lqU1JXdTQxMlIy?=
 =?utf-8?B?cGVNSGY0bHBEaFpQYmFMeDZ5Z080V2xkcVV5eTJXTjZpeFhENmVMbTN1aDJF?=
 =?utf-8?B?RTZKL20yS2dqSnpqanNkYndQR3dTMlEwMnNDOUFSV1oyQWtwU2lZblp4YlBp?=
 =?utf-8?Q?31ZY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzlxeGNMM1BFUjlCQXFCY1NGL0IxbEU3SnZrdkpxZjZCbDlmUTZ4cE16bjEr?=
 =?utf-8?B?L2ZzOVNaK0x0TC9Pdmh4SDN6NVVDa2EvSW5yM3NTd3Qybk56UHFuYTVCMTJo?=
 =?utf-8?B?aXRUYjZ0cnlqWW1NNUc3V25BdnhWV3l4Zi81THlwU09YRlJ2TlppTUFubjA1?=
 =?utf-8?B?ZzRpbkpBZXJIcGlPUE1rRzI3NHJlOEZPb0FJdWE4Tnc1YnVqTnJ0M0VTcXhU?=
 =?utf-8?B?djJJYWl3VlpmVVU5OFRZbC9iWExVY0FacWg3b0ViOXBtbWlicWN0d1FIZlVU?=
 =?utf-8?B?OUowUUpPU1dhajlvdSsydUMzZkNab1V2TWlwVGVkeXl6UnJsVkI0UlU3MW9R?=
 =?utf-8?B?bGR4UEFDU1Z0czUvbEpUYlBhMENkN3BIS0R4Uk5OQkhONnlmTHVHeDFhVndx?=
 =?utf-8?B?YXpRcDlpUWhWRGJWWmxnMjZnWVc2WWI3ckhlOXpZWGx5RllHNUZwRXN6bmE5?=
 =?utf-8?B?bmREaUg1Vlc4bWZOL2habUZieEV3WFY1OC9iTmxtQXdYbC9vcy8yaWVrTGxJ?=
 =?utf-8?B?MGdyZGxRVFZmTW1qTmtmb3NBTE1FRTdjdVN2YU1zR0c5aXZOQzc4SU1QcVdr?=
 =?utf-8?B?cGZuelZLVUtXVWROdGdLZit6bVYzM0FlakxYNFBVQWY2MTFaT0lLdENEZ0NX?=
 =?utf-8?B?UkprSGh4d2dBRGlhTGdjMU1DSk9wbk9BdE9VRTlOQWR3MUpBQmpNYkVoTjly?=
 =?utf-8?B?UStYZnZ1ajBWejFmUTlyTm5CWSt2R2M5QTJHV3NDc1lpY0l3aGpDREdUNTV1?=
 =?utf-8?B?djVmSjBwbVpwNmVlZ3NLdUNKZFpwYlZXY0kxeS9mRXQvdmhWWVhoUVNJQmY4?=
 =?utf-8?B?TjYvTmtBVWZRdGhMWlRaSVdqSVgrVThQeFpkRFlqTFFaM29qUnpjZXFoVVVW?=
 =?utf-8?B?b2hvTS9USDYrNVpzSitlS1NxeThNKzVFNEh0MmxrSFVjNk0xSWJaTGZBKytN?=
 =?utf-8?B?MzlMY1c0YXhFRlFxKys0V2NQcEhKRk1RaHZwUGU4VmZhbDdheGRnaFZoeTV1?=
 =?utf-8?B?NFZrOE9FMXIwMUtZWXZqYWVya1d1NEVqZlRuSVJsNXJQK3pSdlA1MndIVGpI?=
 =?utf-8?B?K3o2c1dOVm16a2pQdmxFaWExbEhEMXR2S2twOVN2Q09mRFZYaHpZdkdZRmhk?=
 =?utf-8?B?Yzd3Si9sWUVZTTdpZ2h0cExCY04rcEVjWXZIYlVzMUdTYkdLOUVNQzAwQmRG?=
 =?utf-8?B?MmpOc1hpZXdZMjdXdVhjaVk1OE1JQkFSeUtVOXE3RXcvWGJSZWNnaG5HMlJV?=
 =?utf-8?B?NSs3eEFEeEtnOG1TZjdoMWZGUFFQR2lEZzM0WXhHMXo3c2xGZ0gyaEEzeVhh?=
 =?utf-8?B?Mk1PQkxPR0dZLzZqemtpc2tQYzR5bTFLc21LRFhBQ25CUFFreGxjK0RYMEJq?=
 =?utf-8?B?TUFFcGM1emRtVWM5RjUvR2EvNFdXdjNJQ0FkRlhqZjNhOEVmVnM5cmR3S0VM?=
 =?utf-8?B?VzlHQ3VGbHBrNHJncFhaZktRRUtnK3NpbjBVWjlueUt5SklNbXhXZmdCc3RN?=
 =?utf-8?B?TzROc3dGVDZoNSs1SC9DNnk5SXdaSEJ5V1hORnRlM1lzMHRlTXBuUjZ6R3hV?=
 =?utf-8?B?TXE0T2hJSHNPRjZxYUovcGZpQjdDVis3MURYN1FpMkNzQ0poUVFIQUNJdW0r?=
 =?utf-8?B?MnVTR253aVp3VVk0aUN3QWJXbkE2ZWQ5SW03RjZacnpubG40dTFZUTFCY3NB?=
 =?utf-8?B?a2JsdGNLQ0FvT2dvRFcwWlJFUG5udVVSOWJWSmhGdm9HZjJFWEpPY0orNWg0?=
 =?utf-8?B?YmlESjZUdG4zdzZzRmJtcDJVS283K0E3YWVMVmUwMEpsSm5ZQU50ZXJUVks0?=
 =?utf-8?B?Z0lRRE9IWFhZek96Wk5HWnZIeUh1WXBVOVFxVlhXU2JLYy9KRG4vMUdPSXlx?=
 =?utf-8?B?WDUxUjhwNmdlYzhTSFhqZ25ZOGNUOWdQSXZjTmJOMWpzQkVXVi9vTWNkUUpm?=
 =?utf-8?B?YmxpL011a3Z5a2V2UzRXSlhPQXFQSDBXYllXYzgwV2hCSThEcm9IellwNjJu?=
 =?utf-8?B?OFVBKy9Ha1NZR1ZIZjFzVE9OMHdUR3VxT1d6bFlCQ1hJZkdMalBIZXRzS0l3?=
 =?utf-8?B?cVVleDhjWmZFZHBScW1Ddndnb3pMcklmelVXRm1FRFVWVDRkd3B4ZnZlWHBR?=
 =?utf-8?B?VEZNaWNaMWVBRG90QnBkbTczanZxUk1qcHZTUTNSakFES1Q2bzJWWWdIWCtB?=
 =?utf-8?B?aHNsWW5rOUpzOVdYcnEzZWo0NTNWNWpnNVIzcVp0a0QrZVN3MDhJd1RBY1NH?=
 =?utf-8?B?VzBSRjF0VzV6bWNaVk1rTXVQdldYalFpM3QyMG9MTnN4bWN5UVRJTmhRN2xV?=
 =?utf-8?B?dW9Bd3BRWlBlOVIyS1htN3NrbGNzLzdtN24xNkR2b0NLcVEwNkdZdnROWW9i?=
 =?utf-8?Q?t9oh1q1HBkXdXbPkQ2OVQyF6ZzrEykP9ueui9wxnI7Vgm?=
X-MS-Exchange-AntiSpam-MessageData-1: 8qOyCiIyAOXT9A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6362f12f-b6b1-41f5-4667-08de62e55749
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 05:30:28.6555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+2dl8zZV1Kh57HF45GvSk/M9mmr8CXhe7S8eXuv4+0yD8pv7HccNn95lAu6xnrwpxyPnMoqot0hAAangwPKtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:webgeek1234@gmail.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kekiefer@gmail.com,m:jja2000@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 28347D4B7A
X-Rspamd-Action: no action

On Tuesday, February 3, 2026 10:55=E2=80=AFAM Aaron Kling via B4 Relay wrot=
e:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> Without the cmu, nvdisplay will display colors that are notably darker
> than intended. The vendor bootloader and the downstream display driver
> enable the cmu and sets a sRGB table. Loading that table here results in
> the intended colors.
>=20
> Co-authored-by: Kurt Kiefer <kekiefer@gmail.com>
> Tested-by: Jasper Korten <jja2000@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v2:
> - Several formatting changes per v1 review
> - Move cmu alloc/free to dc, where it can be handled in probe/remove
> - Enable cmu for displayport as well
> - Link to v1: https://lore.kernel.org/r/20251101-tegra-drm-cmu-v1-1-21179=
9755ab8@gmail.com
> ---
>  drivers/gpu/drm/tegra/dc.c  | 120 ++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/tegra/dc.h  |  13 +++++
>  drivers/gpu/drm/tegra/sor.c |  25 +++++++++
>  3 files changed, 158 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 01e9d5011dd86d610f511573b8dcc389985c6bd4..b6761ffd6ff3454a1c80dbc10=
71b725ca36f4aae 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -36,6 +36,103 @@
>  #include "hub.h"
>  #include "plane.h"
> =20
> +static u16 default_srgb_lut[] =3D {

static const

> +	0x6000, 0x60CE, 0x619D, 0x626C, 0x632D, 0x63D4, 0x6469, 0x64F0, 0x656B,=
 0x65DF, 0x664A,
> +	0x66B0, 0x6711, 0x676D, 0x67C4, 0x6819, 0x686A, 0x68B8, 0x6904, 0x694D,=
 0x6994, 0x69D8,
> +	0x6A1B, 0x6A5D, 0x6A9C, 0x6ADA, 0x6B17, 0x6B52, 0x6B8C, 0x6BC5, 0x6BFD,=
 0x6C33, 0x6C69,
> +	0x6C9E, 0x6CD1, 0x6D04, 0x6D36, 0x6D67, 0x6D98, 0x6DC7, 0x6DF6, 0x6E25,=
 0x6E52, 0x6E7F,
> +	0x6EAC, 0x6ED7, 0x6F03, 0x6F2D, 0x6F58, 0x6F81, 0x6FAA, 0x6FD3, 0x6FFB,=
 0x7023, 0x704B,
> +	0x7071, 0x7098, 0x70BE, 0x70E4, 0x7109, 0x712E, 0x7153, 0x7177, 0x719B,=
 0x71BF, 0x71E2,
> +	0x7205, 0x7227, 0x724A, 0x726C, 0x728E, 0x72AF, 0x72D0, 0x72F1, 0x7312,=
 0x7333, 0x7353,
> +	0x7373, 0x7392, 0x73B2, 0x73D1, 0x73F0, 0x740F, 0x742D, 0x744C, 0x746A,=
 0x7488, 0x74A6,
> +	0x74C3, 0x74E0, 0x74FE, 0x751B, 0x7537, 0x7554, 0x7570, 0x758D, 0x75A9,=
 0x75C4, 0x75E0,
> +	0x75FC, 0x7617, 0x7632, 0x764D, 0x7668, 0x7683, 0x769E, 0x76B8, 0x76D3,=
 0x76ED, 0x7707,
> +	0x7721, 0x773B, 0x7754, 0x776E, 0x7787, 0x77A0, 0x77B9, 0x77D2, 0x77EB,=
 0x7804, 0x781D,
> +	0x7835, 0x784E, 0x7866, 0x787E, 0x7896, 0x78AE, 0x78C6, 0x78DD, 0x78F5,=
 0x790D, 0x7924,
> +	0x793B, 0x7952, 0x796A, 0x7981, 0x7997, 0x79AE, 0x79C5, 0x79DB, 0x79F2,=
 0x7A08, 0x7A1F,
> +	0x7A35, 0x7A4B, 0x7A61, 0x7A77, 0x7A8D, 0x7AA3, 0x7AB8, 0x7ACE, 0x7AE3,=
 0x7AF9, 0x7B0E,
> +	0x7B24, 0x7B39, 0x7B4E, 0x7B63, 0x7B78, 0x7B8D, 0x7BA2, 0x7BB6, 0x7BCB,=
 0x7BE0, 0x7BF4,
> +	0x7C08, 0x7C1D, 0x7C31, 0x7C45, 0x7C59, 0x7C6E, 0x7C82, 0x7C96, 0x7CA9,=
 0x7CBD, 0x7CD1,
> +	0x7CE5, 0x7CF8, 0x7D0C, 0x7D1F, 0x7D33, 0x7D46, 0x7D59, 0x7D6D, 0x7D80,=
 0x7D93, 0x7DA6,
> +	0x7DB9, 0x7DCC, 0x7DDF, 0x7DF2, 0x7E04, 0x7E17, 0x7E2A, 0x7E3C, 0x7E4F,=
 0x7E61, 0x7E74,
> +	0x7E86, 0x7E98, 0x7EAB, 0x7EBD, 0x7ECF, 0x7EE1, 0x7EF3, 0x7F05, 0x7F17,=
 0x7F29, 0x7F3B,
> +	0x7F4D, 0x7F5E, 0x7F70, 0x7F82, 0x7F93, 0x7FA5, 0x7FB6, 0x7FC8, 0x7FD9,=
 0x7FEB, 0x7FFC,
> +	0x800D, 0x801E, 0x8030, 0x8041, 0x8052, 0x8063, 0x8074, 0x8085, 0x8096,=
 0x80A7, 0x80B7,
> +	0x80C8, 0x80D9, 0x80EA, 0x80FA, 0x810B, 0x811C, 0x812C, 0x813D, 0x814D,=
 0x815D, 0x816E,
> +	0x817E, 0x818E, 0x819F, 0x81AF, 0x81BF, 0x81CF, 0x81DF, 0x81EF, 0x81FF,=
 0x820F, 0x821F,
> +	0x822F, 0x823F, 0x824F, 0x825F, 0x826F, 0x827E, 0x828E, 0x829E, 0x82AD,=
 0x82BD, 0x82CC,
> +	0x82DC, 0x82EB, 0x82FB, 0x830A, 0x831A, 0x8329, 0x8338, 0x8348, 0x8357,=
 0x8366, 0x8375,
> +	0x8385, 0x8394, 0x83A3, 0x83B2, 0x83C1, 0x83D0, 0x83DF, 0x83EE, 0x83FD,=
 0x840C, 0x841A,
> +	0x8429, 0x8438, 0x8447, 0x8455, 0x8464, 0x8473, 0x8481, 0x8490, 0x849F,=
 0x84AD, 0x84BC,
> +	0x84CA, 0x84D9, 0x84E7, 0x84F5, 0x8504, 0x8512, 0x8521, 0x852F, 0x853D,=
 0x854B, 0x855A,
> +	0x8568, 0x8576, 0x8584, 0x8592, 0x85A0, 0x85AE, 0x85BC, 0x85CA, 0x85D8,=
 0x85E6, 0x85F4,
> +	0x8602, 0x8610, 0x861E, 0x862C, 0x8639, 0x8647, 0x8655, 0x8663, 0x8670,=
 0x867E, 0x868C,
> +	0x8699, 0x86A7, 0x86B5, 0x86C2, 0x86D0, 0x86DD, 0x86EB, 0x86F8, 0x8705,=
 0x8713, 0x8720,
> +	0x872E, 0x873B, 0x8748, 0x8756, 0x8763, 0x8770, 0x877D, 0x878B, 0x8798,=
 0x87A5, 0x87B2,
> +	0x87BF, 0x87CC, 0x87D9, 0x87E6, 0x87F3, 0x8801, 0x880E, 0x881A, 0x8827,=
 0x8834, 0x8841,
> +	0x884E, 0x885B, 0x8868, 0x8875, 0x8882, 0x888E, 0x889B, 0x88A8, 0x88B5,=
 0x88C1, 0x88CE,
> +	0x88DB, 0x88E7, 0x88F4, 0x8900, 0x890D, 0x891A, 0x8926, 0x8933, 0x893F,=
 0x894C, 0x8958,
> +	0x8965, 0x8971, 0x897D, 0x898A, 0x8996, 0x89A3, 0x89AF, 0x89BB, 0x89C8,=
 0x89D4, 0x89E0,
> +	0x89EC, 0x89F9, 0x8A05, 0x8A11, 0x8A1D, 0x8A29, 0x8A36, 0x8A42, 0x8A4E,=
 0x8A5A, 0x8A66,
> +	0x8A72, 0x8A7E, 0x8A8A, 0x8A96, 0x8AA2, 0x8AAE, 0x8ABA, 0x8AC6, 0x8AD2,=
 0x8ADE, 0x8AEA,
> +	0x8AF5, 0x8B01, 0x8B0D, 0x8B19, 0x8B25, 0x8B31, 0x8B3C, 0x8B48, 0x8B54,=
 0x8B60, 0x8B6B,
> +	0x8B77, 0x8B83, 0x8B8E, 0x8B9A, 0x8BA6, 0x8BB1, 0x8BBD, 0x8BC8, 0x8BD4,=
 0x8BDF, 0x8BEB,
> +	0x8BF6, 0x8C02, 0x8C0D, 0x8C19, 0x8C24, 0x8C30, 0x8C3B, 0x8C47, 0x8C52,=
 0x8C5D, 0x8C69,
> +	0x8C74, 0x8C80, 0x8C8B, 0x8C96, 0x8CA1, 0x8CAD, 0x8CB8, 0x8CC3, 0x8CCF,=
 0x8CDA, 0x8CE5,
> +	0x8CF0, 0x8CFB, 0x8D06, 0x8D12, 0x8D1D, 0x8D28, 0x8D33, 0x8D3E, 0x8D49,=
 0x8D54, 0x8D5F,
> +	0x8D6A, 0x8D75, 0x8D80, 0x8D8B, 0x8D96, 0x8DA1, 0x8DAC, 0x8DB7, 0x8DC2,=
 0x8DCD, 0x8DD8,
> +	0x8DE3, 0x8DEE, 0x8DF9, 0x8E04, 0x8E0E, 0x8E19, 0x8E24, 0x8E2F, 0x8E3A,=
 0x8E44, 0x8E4F,
> +	0x8E5A, 0x8E65, 0x8E6F, 0x8E7A, 0x8E85, 0x8E90, 0x8E9A, 0x8EA5, 0x8EB0,=
 0x8EBA, 0x8EC5,
> +	0x8ECF, 0x8EDA, 0x8EE5, 0x8EEF, 0x8EFA, 0x8F04, 0x8F0F, 0x8F19, 0x8F24,=
 0x8F2E, 0x8F39,
> +	0x8F43, 0x8F4E, 0x8F58, 0x8F63, 0x8F6D, 0x8F78, 0x8F82, 0x8F8C, 0x8F97,=
 0x8FA1, 0x8FAC,
> +	0x8FB6, 0x8FC0, 0x8FCB, 0x8FD5, 0x8FDF, 0x8FEA, 0x8FF4, 0x8FFE, 0x9008,=
 0x9013, 0x901D,
> +	0x9027, 0x9031, 0x903C, 0x9046, 0x9050, 0x905A, 0x9064, 0x906E, 0x9079,=
 0x9083, 0x908D,
> +	0x9097, 0x90A1, 0x90AB, 0x90B5, 0x90BF, 0x90C9, 0x90D3, 0x90DD, 0x90E7,=
 0x90F1, 0x90FB,
> +	0x9105, 0x910F, 0x9119, 0x9123, 0x912D, 0x9137, 0x9141, 0x914B, 0x9155,=
 0x915F, 0x9169,
> +	0x9173, 0x917D, 0x9186, 0x9190, 0x919A, 0x91A4, 0x91AE, 0x91B8, 0x91C1,=
 0x91CB, 0x91D5,
> +	0x91DF, 0x91E9, 0x91F2, 0x91FC, 0x9206, 0x9210, 0x9219, 0x9223, 0x922D,=
 0x9236, 0x9240,
> +	0x924A, 0x9253, 0x925D, 0x9267, 0x9270, 0x927A, 0x9283, 0x928D, 0x9297,=
 0x92A0, 0x92AA,
> +	0x92B3, 0x92BD, 0x92C6, 0x92D0, 0x92DA, 0x92E3, 0x92ED, 0x92F6, 0x9300,=
 0x9309, 0x9313,
> +	0x931C, 0x9325, 0x932F, 0x9338, 0x9342, 0x934B, 0x9355, 0x935E, 0x9367,=
 0x9371, 0x937A,
> +	0x9384, 0x938D, 0x9396, 0x93A0, 0x93A9, 0x93B2, 0x93BC, 0x93C5, 0x93CE,=
 0x93D7, 0x93E1,
> +	0x93EA, 0x93F3, 0x93FC, 0x9406, 0x940F, 0x9418, 0x9421, 0x942B, 0x9434,=
 0x943D, 0x9446,
> +	0x944F, 0x9459, 0x9462, 0x946B, 0x9474, 0x947D, 0x9486, 0x948F, 0x9499,=
 0x94A2, 0x94AB,
> +	0x94B4, 0x94BD, 0x94C6, 0x94CF, 0x94D8, 0x94E1, 0x94EA, 0x94F3, 0x94FC,=
 0x9505, 0x950E,
> +	0x9517, 0x9520, 0x9529, 0x9532, 0x953B, 0x9544, 0x954D, 0x9556, 0x955F,=
 0x9568, 0x9571,
> +	0x957A, 0x9583, 0x958C, 0x9595, 0x959D, 0x95A6, 0x95AF, 0x95B8, 0x95C1,=
 0x95CA, 0x95D3,
> +	0x95DB, 0x95E4, 0x95ED, 0x95F6, 0x95FF, 0x9608, 0x9610, 0x9619, 0x9622,=
 0x962B, 0x9633,
> +	0x963C, 0x9645, 0x964E, 0x9656, 0x965F, 0x9668, 0x9671, 0x9679, 0x9682,=
 0x968B, 0x9693,
> +	0x969C, 0x96A5, 0x96AD, 0x96B6, 0x96BF, 0x96C7, 0x96D0, 0x96D9, 0x96E1,=
 0x96EA, 0x96F2,
> +	0x96FB, 0x9704, 0x970C, 0x9715, 0x971D, 0x9726, 0x972E, 0x9737, 0x9740,=
 0x9748, 0x9751,
> +	0x9759, 0x9762, 0x976A, 0x9773, 0x977B, 0x9784, 0x978C, 0x9795, 0x979D,=
 0x97A6, 0x97AE,
> +	0x97B6, 0x97BF, 0x97C7, 0x97D0, 0x97D8, 0x97E1, 0x97E9, 0x97F1, 0x97FA,=
 0x9802, 0x980B,
> +	0x9813, 0x981B, 0x9824, 0x982C, 0x9834, 0x983D, 0x9845, 0x984D, 0x9856,=
 0x985E, 0x9866,
> +	0x986F, 0x9877, 0x987F, 0x9888, 0x9890, 0x9898, 0x98A0, 0x98A9, 0x98B1,=
 0x98B9, 0x98C1,
> +	0x98CA, 0x98D2, 0x98DA, 0x98E2, 0x98EB, 0x98F3, 0x98FB, 0x9903, 0x990B,=
 0x9914, 0x991C,
> +	0x9924, 0x992C, 0x9934, 0x993C, 0x9945, 0x994D, 0x9955, 0x995D, 0x9965,=
 0x996D, 0x9975,
> +	0x997D, 0x9986, 0x998E, 0x9996, 0x999E, 0x99A6, 0x99AE, 0x99B6, 0x99BE,=
 0x99C6, 0x99CE,
> +	0x99D6, 0x99DE, 0x99E6, 0x99EE, 0x99F6, 0x99FE, 0x9A06, 0x9A0E, 0x9A16,=
 0x9A1E, 0x9A26,
> +	0x9A2E, 0x9A36, 0x9A3E, 0x9A46, 0x9A4E, 0x9A56, 0x9A5E, 0x9A66, 0x9A6E,=
 0x9A76, 0x9A7E,
> +	0x9A86, 0x9A8E, 0x9A96, 0x9A9D, 0x9AA5, 0x9AAD, 0x9AB5, 0x9ABD, 0x9AC5,=
 0x9ACD, 0x9AD5,
> +	0x9ADC, 0x9AE4, 0x9AEC, 0x9AF4, 0x9AFC, 0x9B04, 0x9B0C, 0x9B13, 0x9B1B,=
 0x9B23, 0x9B2B,
> +	0x9B33, 0x9B3A, 0x9B42, 0x9B4A, 0x9B52, 0x9B59, 0x9B61, 0x9B69, 0x9B71,=
 0x9B79, 0x9B80,
> +	0x9B88, 0x9B90, 0x9B97, 0x9B9F, 0x9BA7, 0x9BAF, 0x9BB6, 0x9BBE, 0x9BC6,=
 0x9BCD, 0x9BD5,
> +	0x9BDD, 0x9BE5, 0x9BEC, 0x9BF4, 0x9BFC, 0x9C03, 0x9C0B, 0x9C12, 0x9C1A,=
 0x9C22, 0x9C29,
> +	0x9C31, 0x9C39, 0x9C40, 0x9C48, 0x9C50, 0x9C57, 0x9C5F, 0x9C66, 0x9C6E,=
 0x9C75, 0x9C7D,
> +	0x9C85, 0x9C8C, 0x9C94, 0x9C9B, 0x9CA3, 0x9CAA, 0x9CB2, 0x9CBA, 0x9CC1,=
 0x9CC9, 0x9CD0,
> +	0x9CD8, 0x9CDF, 0x9CE7, 0x9CEE, 0x9CF6, 0x9CFD, 0x9D05, 0x9D0C, 0x9D14,=
 0x9D1B, 0x9D23,
> +	0x9D2A, 0x9D32, 0x9D39, 0x9D40, 0x9D48, 0x9D4F, 0x9D57, 0x9D5E, 0x9D66,=
 0x9D6D, 0x9D75,
> +	0x9D7C, 0x9D83, 0x9D8B, 0x9D92, 0x9D9A, 0x9DA1, 0x9DA8, 0x9DB0, 0x9DB7,=
 0x9DBE, 0x9DC6,
> +	0x9DCD, 0x9DD5, 0x9DDC, 0x9DE3, 0x9DEB, 0x9DF2, 0x9DF9, 0x9E01, 0x9E08,=
 0x9E0F, 0x9E17,
> +	0x9E1E, 0x9E25, 0x9E2D, 0x9E34, 0x9E3B, 0x9E43, 0x9E4A, 0x9E51, 0x9E58,=
 0x9E60, 0x9E67,
> +	0x9E6E, 0x9E75, 0x9E7D, 0x9E84, 0x9E8B, 0x9E92, 0x9E9A, 0x9EA1, 0x9EA8,=
 0x9EAF, 0x9EB7,
> +	0x9EBE, 0x9EC5, 0x9ECC, 0x9ED4, 0x9EDB, 0x9EE2, 0x9EE9, 0x9EF0, 0x9EF7,=
 0x9EFF, 0x9F06,
> +	0x9F0D, 0x9F14, 0x9F1B, 0x9F23, 0x9F2A, 0x9F31, 0x9F38, 0x9F3F, 0x9F46,=
 0x9F4D, 0x9F55,
> +	0x9F5C, 0x9F63, 0x9F6A, 0x9F71, 0x9F78, 0x9F7F, 0x9F86, 0x9F8D, 0x9F95,=
 0x9F9C, 0x9FA3,
> +	0x9FAA, 0x9FB1, 0x9FB8, 0x9FBF, 0x9FC6, 0x9FCD, 0x9FD4, 0x9FDB, 0x9FE2,=
 0x9FE9, 0x9FF0,
> +	0x9FF7, 0x9FFF,
> +};
> +
>  static void tegra_crtc_atomic_destroy_state(struct drm_crtc *crtc,
>  					    struct drm_crtc_state *state);
> =20
> @@ -3251,6 +3348,25 @@ static int tegra_dc_probe(struct platform_device *=
pdev)
>  	if (dc->irq < 0)
>  		return -ENXIO;
> =20
> +	if (dc->soc->has_nvdisplay) {
> +		unsigned int i;
> +		u64 r;
> +
> +		dc->cmu_output_lut =3D
> +			dma_alloc_coherent(dc->dev, ARRAY_SIZE(default_srgb_lut) * sizeof(u64=
),
> +					   &dc->cmu_output_phys, GFP_KERNEL);

I believe you can use dmam_alloc_coherent and avoid explicitly freeing the =
memory (including in error case, which is currently not handled).

> +
> +		if (!dc->cmu_output_lut || !dc->cmu_output_phys) {

The cmu_output_phys check is incorrect. A zero IOVA is valid -- you should =
only check for cmu_output_lut being NULL.

> +			dev_err(dc->dev, "failed to allocate lut for cmu\n");
> +			return -ENOMEM;
> +		}
> +
> +		for (i =3D 0; i < ARRAY_SIZE(default_srgb_lut); i++) {
> +			r =3D default_srgb_lut[i];
> +			dc->cmu_output_lut[i] =3D (r << 32) | (r << 16) | r;
> +		}
> +	}
> +
>  	err =3D tegra_dc_rgb_probe(dc);
>  	if (err < 0 && err !=3D -ENODEV)
>  		return dev_err_probe(&pdev->dev, err,
> @@ -3287,6 +3403,10 @@ static void tegra_dc_remove(struct platform_device=
 *pdev)
> =20
>  	tegra_dc_rgb_remove(dc);
> =20
> +	if (dc->soc->has_nvdisplay)
> +		dma_free_coherent(dc->dev, ARRAY_SIZE(default_srgb_lut) * sizeof(u64),
> +				  dc->cmu_output_lut, dc->cmu_output_phys);
> +
>  	pm_runtime_disable(&pdev->dev);
>  }
> =20
> diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> index 0559fa6b1bf70416e51d5067cc04a6ae6572de23..973ab0bb15c9260be6256b445=
9cd03c018d3dea5 100644
> --- a/drivers/gpu/drm/tegra/dc.h
> +++ b/drivers/gpu/drm/tegra/dc.h
> @@ -103,6 +103,9 @@ struct tegra_dc {
>  	const struct tegra_dc_soc_info *soc;
> =20
>  	bool has_opp_table;
> +
> +	u64 *cmu_output_lut;
> +	dma_addr_t cmu_output_phys;
>  };
> =20
>  static inline struct tegra_dc *
> @@ -447,6 +450,7 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
>  #define BASE_COLOR_SIZE_888    (  8 << 0)
>  #define BASE_COLOR_SIZE_101010 ( 10 << 0)
>  #define BASE_COLOR_SIZE_121212 ( 12 << 0)
> +#define CMU_ENABLE_ENABLE      (1 << 20)
> =20
>  #define DC_DISP_SHIFT_CLOCK_OPTIONS		0x431
>  #define  SC1_H_QUALIFIER_NONE	(1 << 16)
> @@ -732,6 +736,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
>  #define PROTOCOL_MASK (0xf << 8)
>  #define PROTOCOL_SINGLE_TMDS_A (0x1 << 8)
> =20
> +#define DC_DISP_CORE_HEAD_SET_CONTROL_OUTPUT_LUT	0x431
> +#define  OUTPUT_LUT_MODE_MASK        (3 << 5)
> +#define  OUTPUT_LUT_MODE_INTERPOLATE (1 << 5)
> +#define  OUTPUT_LUT_SIZE_MASK        (3 << 1)
> +#define  OUTPUT_LUT_SIZE_SIZE_1025   (2 << 1)
> +
> +#define DC_DISP_COREPVT_HEAD_SET_OUTPUT_LUT_BASE	0x432
> +#define DC_DISP_COREPVT_HEAD_SET_OUTPUT_LUT_BASE_HI	0x433
> +
>  #define DC_DISP_PCALC_HEAD_SET_CROPPED_POINT_IN_CURSOR	0x442
>  #define DC_DISP_PCALC_HEAD_SET_CROPPED_SIZE_IN_CURSOR	0x446
> =20
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 4023cb5998f1691bb28453bc19ec91578a57833d..2c5cf401e62f42d19e478bd6e=
9bc2da6fdd8e454 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -2557,6 +2557,17 @@ static void tegra_sor_hdmi_enable(struct drm_encod=
er *encoder)
>  	value =3D tegra_dc_readl(dc, DC_DISP_DISP_COLOR_CONTROL);
>  	value &=3D ~DITHER_CONTROL_MASK;
>  	value &=3D ~BASE_COLOR_SIZE_MASK;
> +	if (dc->soc->has_nvdisplay && dc->cmu_output_lut) {
> +		tegra_dc_writel(dc, lower_32_bits(dc->cmu_output_phys),
> +				DC_DISP_COREPVT_HEAD_SET_OUTPUT_LUT_BASE);
> +		tegra_dc_writel(dc, upper_32_bits(dc->cmu_output_phys),
> +				DC_DISP_COREPVT_HEAD_SET_OUTPUT_LUT_BASE_HI);
> +
> +		tegra_dc_writel(dc, OUTPUT_LUT_MODE_INTERPOLATE | OUTPUT_LUT_SIZE_SIZE=
_1025,
> +				DC_DISP_CORE_HEAD_SET_CONTROL_OUTPUT_LUT);
> +
> +		value |=3D CMU_ENABLE_ENABLE;
> +	}
> =20
>  	switch (state->bpc) {
>  	case 6:
> @@ -2921,6 +2932,20 @@ static void tegra_sor_dp_enable(struct drm_encoder=
 *encoder)
>  	if (err < 0)
>  		dev_err(sor->dev, "failed to attach SOR: %d\n", err);
> =20
> +	value =3D tegra_dc_readl(dc, DC_DISP_DISP_COLOR_CONTROL);

If we're only going to adjust the value in the conditional block, better to=
 put the read and write inside it as well.

> +	if (dc->soc->has_nvdisplay && dc->cmu_output_lut) {
> +		tegra_dc_writel(dc, lower_32_bits(dc->cmu_output_phys),
> +				DC_DISP_COREPVT_HEAD_SET_OUTPUT_LUT_BASE);
> +		tegra_dc_writel(dc, upper_32_bits(dc->cmu_output_phys),
> +				DC_DISP_COREPVT_HEAD_SET_OUTPUT_LUT_BASE_HI);
> +
> +		tegra_dc_writel(dc, OUTPUT_LUT_MODE_INTERPOLATE | OUTPUT_LUT_SIZE_SIZE=
_1025,
> +				DC_DISP_CORE_HEAD_SET_CONTROL_OUTPUT_LUT);
> +
> +		value |=3D CMU_ENABLE_ENABLE;
> +	}
> +	tegra_dc_writel(dc, value, DC_DISP_DISP_COLOR_CONTROL);
> +
>  	value =3D tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
>  	value |=3D SOR_ENABLE(sor->index);
>  	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
>=20
> ---
> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
> change-id: 20251031-tegra-drm-cmu-697e8e030978
>=20
> Best regards,
>=20




