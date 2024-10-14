Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0650499BF81
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 07:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6169E10E1A8;
	Mon, 14 Oct 2024 05:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eRoWElxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D2810E1A8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 05:54:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgKWh10/Lklw/qAAcKeEEyQtAQrr7UhLzI4PX3KEYC4kD8rOPqfK2FveVpPQufgvorkpUyG6mS8WIxqlGDgz0RHCgGqAgfdE8pkXKb8Vo2f1VRnd5y9wZ48s2GtH+fL94AcKf7MKVMpfcsEbJRQh5wHGdQ3tASkuYrwFOM6BOjcoyxyFNkmmJ2T8VRmBCQaPrxAjD75KbiuaTDlMzUrNwI4bEfgPPffH6eGcgTbkslP1fZ/wM+BQkwd/gzQ9HyOUirXj9eWXboHKCVsFDcliTh2zEdzCzhojZH95dfMt78sDshbe9KCgyjHI9A1wjAmCqk573YOZm9UPYaM8rS6WpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF9kcJz63tE8uTNo3MbzofPdgdix4/dBeaXn20lQikc=;
 b=ek+7pVPX/ESKy2rwFve4rRoMLNjl5es5G1yAbGVYjS7zoJwawglKXixi8I0qJQEkKpb5pEPoSgha6hWqHo7hGB81Lh7Z4YOjNx8IIG9JhvJzIMihDWzTvj+lBWzxkkYS25QWm4klHyXg0o3GTJ7z1h+AiFWh+KQt29y4y2zQ3agWswT8XfciyRk34UF0WWfzscacrE9AHSiTR59ZYLaCJc5VUb5WbhrlWf1OfMpD4/w/+VqvUH3TkIZCIoQPnPwGKPKIrrI0+930yHutRQh1PZvatLR1j2g8DC2u/iuHO7qOLufNeJMUPEfFSN8j4BXXvEVBmMrfphfLWPRw6RyOXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF9kcJz63tE8uTNo3MbzofPdgdix4/dBeaXn20lQikc=;
 b=eRoWElxxB7Y7N6gr0aDGs3Vsw6t5m/bwGK7jktCuPFtpVrNuuyQEEGfoCeW/ioz69eNrnXeU0iHLjQJvADjEzOeQJncjF5I2Io1kLqxe2VBywmkPF9uHAWpmDaWcp8Po5yM6/bivhlIPV/sP/K1+jChXJ0i9wMENagOKnZdl9nzuo+koKYEp2m1DxN8es9LEiFxFgb7RrbpJmaXCVh6psG6DKTAbKi8fxUPTBpoJat//VaAH65xvLxQ3ruzZfRwFiZ8V0fv+81SphU06h9VWOfoZzQVkSTta0uIaMAi7aqQxiLrL0u1gkWm+Z2QXIjpjbKWZp0RdQmAbxj6pi1L5Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9968.eurprd04.prod.outlook.com (2603:10a6:10:4d8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 05:53:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 05:53:53 +0000
Message-ID: <03e97e7c-9793-4fd4-8733-f7cc43a4cf6c@nxp.com>
Date: Mon, 14 Oct 2024 13:54:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
From: Liu Ying <victor.liu@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, o.rempel@pengutronix.de, y.moog@phytec.de,
 marex@denx.de, isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>
 <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
 <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>
Content-Language: en-US
In-Reply-To: <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR06CA0211.apcprd06.prod.outlook.com
 (2603:1096:4:68::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9968:EE_
X-MS-Office365-Filtering-Correlation-Id: 240eaead-ad9a-415b-f55e-08dcec1495ae
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVpFMndFMkoxMlpMaTVvVHh6ZXZRS2ZLQ0xzQ0l3QVNLUEhWbkd3cXNnSFFD?=
 =?utf-8?B?eUFlZ2M3WFBXQVNGVy9kcjUvek1CRmlyaHJuaHk2N2tZZWFDVnIxKzZJcHhq?=
 =?utf-8?B?MUhPdVdLLzhpeWpKbnBDKytkNHQ5SWMvZkcveUl6Z25VV3BWUXNRdCtMbFpU?=
 =?utf-8?B?WkVFWVF4UDJ6eUwwUG05eVlGWmtzUjJ2V2IzbHFDTGN6N2RwTE9pcEU1TXcx?=
 =?utf-8?B?Q0JacTJnejlzcWlUK3RGemhOMDZBVVpoMDFYSWk1UmMzeHB1WWZZQ2lCWUQr?=
 =?utf-8?B?bmVmeFVyMnIrd3I3RFoxVjFHUnNSTHZiQUpRc3BjSkNXN1p2NnBsbVlKQ1pT?=
 =?utf-8?B?ekxEQ0FRRzNOWXJVcDg0UFdoZ2VjZTRVcE1RT2NXZGYxNGk5U0lDcEhPby9K?=
 =?utf-8?B?NVJ1VmcwV3lybjJPeC8zTWh3ZFJZRVFxZS9sSXNSa2hNUkZlZ1VhK1lPQ2k5?=
 =?utf-8?B?STlZMHVDcDh4OTM1REpoTWlWT0w2MjdVMFlwVE8yaXNjb2FhdFA5UU11ZUlQ?=
 =?utf-8?B?SXppOXJ6c3IxMDRydXFJSEk0TGRsTTVQRDdMNzRRMGl5N09VRUtzNjV4TkZR?=
 =?utf-8?B?ZXl0RjVucm1MN0NWTzBKWEI3VDdyNzRGV0FweE5JOTh4d2ZGNG0ySVJRL1U1?=
 =?utf-8?B?bHJvVTVVdlBlRDhqQVhLN0dMQU5JMjYrblNReU5yUUdGaDg5OCtqSFFJempQ?=
 =?utf-8?B?SW9GZ0tkNWdEbGlNRzdZYURPMHV5TjJVbkRQVzZQZkJUUENKRDIwdW1VeGpG?=
 =?utf-8?B?RlY5dCswWlFMNXNXWldLWFJSeHpRYXNvZ1VUUnVMV1pGQnhSOEJwMmxRcmdL?=
 =?utf-8?B?STd6aThzL0hXbGNDVkRBcitqb0N4b0VOUmlFM0E4TmRIK0JSTzBKelhrL0dj?=
 =?utf-8?B?OUZaL2cwT1ZheEZ6YVVrMWNoV0tpdEo3TUdYd3RudjN2eGxIbFlYOGtlNU5r?=
 =?utf-8?B?eWdzdmJrTGJNbUR4U1FPYldkY3RpRXlEU3BFOEkvb3g2Zk96VHgvcGN5UUs4?=
 =?utf-8?B?cEpyVHNUZDBuOG4zRnVTYVBDcEZlc0FXMjRmUlBCWTRHOFhjblB6T21EcEpF?=
 =?utf-8?B?R3l5aEtlNkZpb0FmZWxCdUxMeWtVd0IwQ0kxZ3EwSElEOWxPNTZOT3ZqMGJu?=
 =?utf-8?B?YmZ3SlNKKzhIdFZlUVlsZDV4cWtIZUN4cTN5S2tMRnlSelpZOVhkaXBDQWlQ?=
 =?utf-8?B?UTRFeFZYejFLdk9DeE50eWh3QTI2UlpWaitVYXZEV2pOVCtkK0kwRnlMM1JD?=
 =?utf-8?B?UDJlYk5MZm5IZVZyaWwvY09Ha2UrNW0vS3IwU2JWL3NEQ2hxVmtCSHpkaHhh?=
 =?utf-8?B?QlV2dkJZNFhlc0FqYzVwTWFldjBScUtvemZ6R1VYc01XbHBvd0RmY2tmWi9z?=
 =?utf-8?B?WmZtSDB4cndabkpvTExudWxiaEZMNDFTNTZhTzBBVXVPREUxNmpDRm8vc21J?=
 =?utf-8?B?ZG9TZm9wTVlZckh4QmVDeTRGSzNKdzluS1FzbE51Tmp6RHNJRm0zbDMzK0dx?=
 =?utf-8?B?K2VGWjdXc1I4WkZ5MEZSNnJ1Z3VrL3BDUUdjblNSUjlhb2J3S3AzMktEbzZ5?=
 =?utf-8?B?VitRVkZBWmJaYXVzNFQwalBDc0FteHZzOG5saWM0aWNhQ3pZbVJkNEVxcW9B?=
 =?utf-8?Q?7S2aBmk+LWLI0WHr1WriGJkWomrqMDbaZUgHEUbhVOm0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWNBUW1ETmdKd2xxOU1xVWg4cmtuVnVCS242aTVSQnMvekRPZENlS2NpYWZX?=
 =?utf-8?B?UkpUNlZXZzV3ZUJicEdwYU1qTDAwNHRkVmNaWUlOTGZVRjJCK0x5VWxxRld4?=
 =?utf-8?B?dWRMbWI1RVhOUFBVNUM0b3lyd2VpbVl0d2lNTjBKQWc0NTVSa01YVDVra0JS?=
 =?utf-8?B?OU93NHMza2RvN3hWanVjMUlyOFhuOEQ2WUc1b3ErdVplY04zelBSMS9kamJX?=
 =?utf-8?B?MFlmM2RBOW1hemYvOHNDYUt6YS9ZSEt5dUh2Z3BQZmNNalAxZ09XOEFIQ2dv?=
 =?utf-8?B?NStEakRGOGsrRFB5cVRVL1l2WVlZbEpkZ2J2Qlo5VGtMUXl0SFFJclVWZ2c0?=
 =?utf-8?B?UHNGUXI0OUNjdyt3ZEdEQmtOYkUyN21MN0xSSDc1RWtqYXcwdkFyZ1QwZEhL?=
 =?utf-8?B?WWQ2OFRJL3VBWU42OTdHYjRtdjhZQUtjU1lsbU0rRzZydXpNNFF2ODBNRHh6?=
 =?utf-8?B?aDB3bDAxTEE2WTMrSE5pOWQyMlF2ZGVDZ0UyaFozNnAyKzM3VmpXRHFZWk9h?=
 =?utf-8?B?aEh4V1hPWHdDN2d0ZWduZFRlSmIyMmpKclhoZWxjWXd0ZkFYQjRVZkZuOGVs?=
 =?utf-8?B?c3NjVnYzb09zQndScTg3U0N1N01lM2pvc2ZPWEFZd3dnaTVpOFFpOXFhejFx?=
 =?utf-8?B?SERHK2ZoTUFuZ0lMQlZPR0wvZ1VuVmhUbTFwR2FKMFZES2xDL1NMNHc1Q2x6?=
 =?utf-8?B?TERwZElYMU8vVHlpT3gySSthMkNUcytWWkh0emY0NkE2ZjJVYW5RY3BlR1Zy?=
 =?utf-8?B?ekg0K2lkMG1PRERIemYwa21Sa0txa0h1WmQzd1Iwb0ZXTVdWV3ZMQUxkeGNQ?=
 =?utf-8?B?cnVRSEhqUTlJSnRCcXdBR21PT0t0TkZ6TVd0RDE0eHZPSlBtTEQ3RzVpOU16?=
 =?utf-8?B?VzZHUk84ZVlhQzhFN21naHZxUGQwNHNHODA0MW5PK3dYWlpqQUk1RzkzVVNU?=
 =?utf-8?B?cm1ZWlhsMTF4VHlteWd4TU5ESE5nLzdrOVkwQXVjeWdma2tRMjZKREhGbEwy?=
 =?utf-8?B?cnhyTWN3YkxNZ01MZTNkVXY1eXR4Y2lqSHMvUlhHMG9WV3krYVMwUWRtbDhP?=
 =?utf-8?B?cHp2TllteTRLTlRQMkgwNUNGS3RSRkV1VmhVUlNady9sRW15aHplVCtCclJM?=
 =?utf-8?B?Z3lLRnl4Q2tOWlk1bjl1L0dEZTlhRit5cHVtVVFBYks3QXhNVmlROFRmRXJp?=
 =?utf-8?B?MndBdWpWRThPdlJwd05VVUNkNkJqcGdtYUVKOEZyaEd3S2t2QTkrcTVoTHNN?=
 =?utf-8?B?c1ZjL0NLa29xL3lyS3cvaUxua3NWdGQ0SytGbEg1RGFqRGlOWG5wc0xGRGVk?=
 =?utf-8?B?SGI4R0habWtIKzJJT0VhRmxXSUhDWTJ2NDZlVkt1SjYyV3pCVnZsU04xUVdF?=
 =?utf-8?B?UHFIbkVzUXRUK3NGNkk1eEpnN0kyVlFtZTFReVVXUGJLaXJKS0ZQa0F2Zjgw?=
 =?utf-8?B?SmtTcTJVdlpKU1VSbnVqQis0Q04yNDJ1VW44Tkg0NXU1bW53Tjg1NW1jSjQ5?=
 =?utf-8?B?cTJkdGVVdUNBQWd6SEdzY3g0cDVEaHpBcGp2bGJuWW1Ubk1LaXNOdlFTNU1a?=
 =?utf-8?B?S1N3S204R0pzSi9ISTZ1MjlhWXRlbUcyVXZtMEtQWTRlRDBqN25ScXFKT3Nt?=
 =?utf-8?B?Q1RSV3pLZkdPWlZ3WFVVWTJBMkt5Zkg5TW81S3hFSkNQSUtzakRvTUhFZlNh?=
 =?utf-8?B?U1VnWXVoVVptWGtMZ0dGTm51ZnNKZldqWDNoMEZjTUw3cm1SQWRVN2V2bkor?=
 =?utf-8?B?eWRiZUZ1Y2FHazRJZHVqTXZqNU5SRnJWcVJqT0ZaM3Q4RituOWZ4cGJYMjl4?=
 =?utf-8?B?SElRN1RBT2o1OUE0bVVQNTVHOTArcG9tR2RWZlJpb1dNQk5yQ3h1OUlobWl6?=
 =?utf-8?B?RlR6M3hWTSt6TkI0YzJLa2RiSzJQZEZqdmR2OXJEVjZRMDRrWUZaSGdOaUtD?=
 =?utf-8?B?WW8rSXZsM3BnUEVsU3hUSHRLeVQra2ZUVEZMSGFDdmRqSndqZlZuWU0veVVR?=
 =?utf-8?B?SlBWMzVxdHFnNG9WK0ttSWNIT09XYnh5cFdSYzFKLy9zOUp0RlcrcHRuYlR3?=
 =?utf-8?B?dXdCWFA5WWY3cmt1NDVyNGN2WjFJTXA2dlBGQStBQlA1SGtMYVM5Tm84WHhR?=
 =?utf-8?Q?TjNoOK8AjZLLjOsWAhFsEMGzd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 240eaead-ad9a-415b-f55e-08dcec1495ae
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 05:53:53.5594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXD3u0vQMxl03Tbg2aOyBVUzJ40t/EihQ0A9o/Ud5Fn+r/D+MdNbIO74uA7KNOBCUlEb3eL3Dn+uI7tvafcRfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9968
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

On 10/14/2024, Liu Ying wrote:
> On 10/14/2024, Dmitry Baryshkov wrote:
>> On Sat, Oct 12, 2024 at 05:14:13PM +0800, Liu Ying wrote:
>>> On 10/12/2024, Dmitry Baryshkov wrote:
>>>> On Sat, Oct 12, 2024 at 03:35:39PM +0800, Liu Ying wrote:
>>>>> Document ITE IT6263 LVDS to HDMI converter.
>>>>>
>>>>> Product link:
>>>>> https://www.ite.com.tw/en/product/cate1/IT6263
>>>>>
>>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>>> ---
>>>>> v2:
>>>>> * Document number of LVDS link data lanes.  (Biju)
>>>>> * Simplify ports property by dropping "oneOf".  (Rob)
>>>>>
>>>>>  .../bindings/display/bridge/ite,it6263.yaml   | 276 ++++++++++++++++++
>>>>>  1 file changed, 276 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..bc2bbec07623
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>>> @@ -0,0 +1,276 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: ITE IT6263 LVDS to HDMI converter
>>>>> +
>>>>> +maintainers:
>>>>> +  - Liu Ying <victor.liu@nxp.com>
>>>>> +
>>>>> +description: |
>>>>> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread Spectrum) LVDS
>>>>> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a transmitter,
>>>>> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
>>>>> +  The built-in LVDS receiver can support single-link and dual-link LVDS inputs,
>>>>> +  and the built-in HDMI transmitter is fully compliant with HDMI 1.4a/3D, HDCP
>>>>> +  1.2 and backward compatible with DVI 1.0 specification.
>>>>> +
>>>>> +  The IT6263 also encodes and transmits up to 8 channels of I2S digital audio,
>>>>> +  with sampling rate up to 192KHz and sample size up to 24 bits. In addition,
>>>>> +  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
>>>>> +
>>>>> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications v1.3 is
>>>>> +  provided by the IT6263 in two interfaces: the four I2S input ports or the
>>>>> +  S/PDIF input port.  With both interfaces the highest possible HBR frame rate
>>>>> +  is supported at up to 768KHz.
>>>>> +
>>>>> +properties:
>>>>
>>>> No LVDS data-mapping support?
>>>
>>> It is enough to document number of LVDS link data lanes
>>> because OS should be able to determine the data-mapping
>>> by looking at the number and the data-mapping capability
>>> of the other side of the LVDS link. 
>>
>> From what I can see, data-mapping is specified on the consumer sink side
>> of the LVDS link. This means it should go to the bridge's device node.
> 
> Then, I won't define data-lanes, because data-mapping implies it,
> e.g., jeida-24 implies data lanes 0/1/2/3, see lvds-data-mapping.yaml.
> 
> Please let me know which one you prefer.
> 
>>
>>>
>>>>
>>>>> +  compatible:
>>>>> +    const: ite,it6263
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 1
>>>>> +    description: audio master clock
>>>>> +
>>>>> +  clock-names:
>>>>> +    const: mclk
>>>>> +
>>>>> +  reset-gpios:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  ivdd-supply:
>>>>> +    description: 1.8V digital logic power
>>>>> +
>>>>> +  ovdd-supply:
>>>>> +    description: 3.3V I/O pin power
>>>>> +
>>>>> +  txavcc18-supply:
>>>>> +    description: 1.8V HDMI analog frontend power
>>>>> +
>>>>> +  txavcc33-supply:
>>>>> +    description: 3.3V HDMI analog frontend power
>>>>> +
>>>>> +  pvcc1-supply:
>>>>> +    description: 1.8V HDMI frontend core PLL power
>>>>> +
>>>>> +  pvcc2-supply:
>>>>> +    description: 1.8V HDMI frontend filter PLL power
>>>>> +
>>>>> +  avcc-supply:
>>>>> +    description: 3.3V LVDS frontend power
>>>>> +
>>>>> +  anvdd-supply:
>>>>> +    description: 1.8V LVDS frontend analog power
>>>>> +
>>>>> +  apvdd-supply:
>>>>> +    description: 1.8V LVDS frontend PLL power
>>>>> +
>>>>> +  "#sound-dai-cells":
>>>>> +    const: 0
>>>>> +
>>>>> +  ite,lvds-link-num-data-lanes:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint8
>>>>> +    enum: [3, 4, 5]
>>>>> +    description: number of data lanes per LVDS link
>>>>
>>>> Please use data-lanes property inside the OF graph.
>>>
>>> In both port@0 and port@1?
>>
>> Yes
> 
> I'm assuming if data-mapping is defined, then no need to
> define data-lanes.
> 
>>
>>>
>>>>
>>>>> +
>>>>> +  ite,i2s-audio-fifo-sources:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>> +    minItems: 1
>>>>> +    maxItems: 4
>>>>> +    items:
>>>>> +      enum: [0, 1, 2, 3]
>>>>> +    description:
>>>>> +      Each array element indicates the pin number of an I2S serial data input
>>>>> +      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.
>>>>
>>>> What does that mean from the board point of view? Routed audio links for
>>>> the multichannel audio?
>>>
>>> Yes, also for single channel audio.
>>>
>>>>
>>>>> +
>>>>> +  ite,rl-channel-swap-audio-sources:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>> +    minItems: 1
>>>>> +    maxItems: 4
>>>>> +    uniqueItems: true
>>>>> +    items:
>>>>> +      enum: [0, 1, 2, 3]
>>>>> +    description:
>>>>> +      Each array element indicates an audio source whose right channel and left
>>>>> +      channel are swapped by this converter. For I2S, the element is the pin
>>>>> +      number of an I2S serial data input line. For S/PDIF, the element is always
>>>>> +      0.
>>>>
>>>> Why?
>>>
>>> Because this converter has the capability to swap right channel
>>> and left channel and S/PDIF always uses audio source0. 
>>>
>>>>
>>>>> +
>>>>> +  ports:
>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>> +
>>>>> +    properties:
>>>>> +      port@0:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        unevaluatedProperties: false
>>>>> +        description:
>>>>> +          The first LVDS input link.
>>>>> +          In dual-link LVDS mode, this link works together with the second LVDS
>>>>> +          input link, and one link receives odd pixels while the other receives
>>>>> +          even pixels. Specify the pixels with one of the dual-lvds-odd-pixels
>>>>> +          and dual-lvds-even-pixels properties when and only when dual-link LVDS
>>>>> +          mode is used.
>>>>> +
>>>>> +        properties:
>>>>> +          dual-lvds-odd-pixels:
>>>>> +            type: boolean
>>>>> +            description: the first sink port for odd pixels
>>>>> +
>>>>> +          dual-lvds-even-pixels:
>>>>> +            type: boolean
>>>>> +            description: the first sink port for even pixels
>>>>> +
>>>>> +      port@1:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        unevaluatedProperties: false
>>>>> +        description: the second LVDS input link
>>>>> +
>>>>> +        properties:
>>>>> +          dual-lvds-even-pixels:
>>>>> +            type: boolean
>>>>> +            description: the second sink port for even pixels
>>>>> +
>>>>> +          dual-lvds-odd-pixels:
>>>>> +            type: boolean
>>>>> +            description: the second sink port for odd pixels
>>>>> +
>>>>> +        oneOf:
>>>>> +          - required: [dual-lvds-even-pixels]
>>>>> +          - required: [dual-lvds-odd-pixels]
>>>>
>>>> This still allows one to specify that both ports provide odd pixels. Is
>>>> that expected? Also why do you need two properties which specify the
>>>> same option.
>>>
>>> No, that is not expected. Description for port@0 already mentions
>>> one link receives odd pixels while the other receives even pixels.
>>
>> That's not expected, but permitted by the bindings.
> 
> It is not permitted by port@1. If "dual-lvds-odd-pixels;" is added
> to port@1 in the dual-link LVDS example, the below warning will be
> generated by dt_binding_check.
> 
> Documentation/devicetree/bindings/display/bridge/ite,it6263.example.dtb: hdmi@4c: ports:port@1: {'reg': [[1]], 'dual-lvds-even-pixels': True, 'dual-lvds-odd-pixels': True, 'endpoint': {'remote-endpoint': [[4294967295]]}} is valid under each of {'required': ['dual-lvds-odd-pixels']}, {'required': ['dual-lvds-even-pixels']}
> 	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
> 
> However, the binding for port@0 does allow DT writers to specify
> both even and odd pixels. I raised similar concerns in v1 discussion.
> According to Rob's comment in #devicetree IRC, the ports property
> is simplified to this form and more description for port@0 is added
> to tell when to specify the even/odd pixels.  If you know any better
> way to indicate the constraints, please shout.

Dmitry, if the binding in v1 may pass dt_binding_check against
dtschema-2024.9, then it looks like all constraints are implemented.
But, it can't pass. 

> 
>>
>>>
>>> Two options are supported for dual-link LVDS, not the same option:
>>> 1) LVDS link1(port@0) gets odd pixels
>>>    and
>>>    LVDS link2(port@1) gets even pixels.
>>>
>>> 2) LVDS link1(port@0) gets even pixels
>>>    and
>>>    LVDS link2(port@1) gets odd pixels.
>>> That's the reason why each port needs two properties to define
>>> odd/even pixels.
>>>
>>>>
>>>> My suggestion would be to add a single root-level property which
>>>> specifies which port provides even pixel data.
>>>
>>> That won't work.  The LVDS source side expects the ports of
>>> the sink side specify dual-lvds-{odd,even}-pixels properties.
>>
>> I didn't notice that these properties are already defined.
>>
>> As these properties are common between several schema files, please
>> extract them to a common schema file (like lvds.yaml).
> 
> I'm not sure how to do that. Is it obvious?
> Please shed some light. 
> 
> Only two panel schema files are defining even/odd pixels now -
> advantech,idk-2121wr.yaml and panel-simple-lvds-dual-ports.yaml.
> Maybe, extract them later when more schema files(especially for
> bridges) try to define the same?  I'd like to keep a low profile
> for now.
> 
>>
>>>
>>>>
>>>>> +
>>>>> +      port@2:
>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>> +        description: video port for the HDMI output
>>>>> +
>>>>> +      port@3:
>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>> +        description: sound input port
>>>>> +
>>>>> +    required:
>>>>> +      - port@0
>>>>> +      - port@2
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - ivdd-supply
>>>>> +  - ovdd-supply
>>>>> +  - txavcc18-supply
>>>>> +  - txavcc33-supply
>>>>> +  - pvcc1-supply
>>>>> +  - pvcc2-supply
>>>>> +  - avcc-supply
>>>>> +  - anvdd-supply
>>>>> +  - apvdd-supply
>>>>> +  - ite,lvds-link-num-data-lanes
>>>>> +  - ports
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    /* single-link LVDS input */
>>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>>> +
>>>>> +    i2c {
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <0>;
>>>>> +
>>>>> +        hdmi@4c {
>>>>> +            compatible = "ite,it6263";
>>>>> +            reg = <0x4c>;
>>>>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>>>>> +            ivdd-supply = <&reg_buck5>;
>>>>> +            ovdd-supply = <&reg_vext_3v3>;
>>>>> +            txavcc18-supply = <&reg_buck5>;
>>>>> +            txavcc33-supply = <&reg_vext_3v3>;
>>>>> +            pvcc1-supply = <&reg_buck5>;
>>>>> +            pvcc2-supply = <&reg_buck5>;
>>>>> +            avcc-supply = <&reg_vext_3v3>;
>>>>> +            anvdd-supply = <&reg_buck5>;
>>>>> +            apvdd-supply = <&reg_buck5>;
>>>>> +            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
>>>>> +
>>>>> +            ports {
>>>>> +                #address-cells = <1>;
>>>>> +                #size-cells = <0>;
>>>>> +
>>>>> +                port@0 {
>>>>> +                    reg = <0>;
>>>>> +
>>>>> +                    it6263_lvds_link1: endpoint {
>>>>> +                        remote-endpoint = <&ldb_lvds_ch0>;
>>>>> +                    };
>>>>> +                };
>>>>> +
>>>>> +                port@2 {
>>>>> +                    reg = <2>;
>>>>> +
>>>>> +                    it6263_out: endpoint {
>>>>> +                        remote-endpoint = <&hdmi_in>;
>>>>> +                    };
>>>>> +                };
>>>>> +            };
>>>>> +        };
>>>>> +    };
>>>>> +
>>>>> +  - |
>>>>> +    /* dual-link LVDS input */
>>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>>> +
>>>>> +    i2c {
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <0>;
>>>>> +
>>>>> +        hdmi@4c {
>>>>> +            compatible = "ite,it6263";
>>>>> +            reg = <0x4c>;
>>>>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>>>>> +            ivdd-supply = <&reg_buck5>;
>>>>> +            ovdd-supply = <&reg_vext_3v3>;
>>>>> +            txavcc18-supply = <&reg_buck5>;
>>>>> +            txavcc33-supply = <&reg_vext_3v3>;
>>>>> +            pvcc1-supply = <&reg_buck5>;
>>>>> +            pvcc2-supply = <&reg_buck5>;
>>>>> +            avcc-supply = <&reg_vext_3v3>;
>>>>> +            anvdd-supply = <&reg_buck5>;
>>>>> +            apvdd-supply = <&reg_buck5>;
>>>>> +            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
>>>>> +
>>>>> +            ports {
>>>>> +                #address-cells = <1>;
>>>>> +                #size-cells = <0>;
>>>>> +
>>>>> +                port@0 {
>>>>> +                    reg = <0>;
>>>>> +                    dual-lvds-odd-pixels;
>>>>> +
>>>>> +                    it6263_lvds_link1_dual: endpoint {
>>>>> +                        remote-endpoint = <&ldb_lvds_ch0>;
>>>>> +                    };
>>>>> +                };
>>>>> +
>>>>> +                port@1 {
>>>>> +                    reg = <1>;
>>>>> +                    dual-lvds-even-pixels;
>>>>> +
>>>>> +                    it6263_lvds_link2_dual: endpoint {
>>>>> +                        remote-endpoint = <&ldb_lvds_ch1>;
>>>>> +                    };
>>>>> +                };
>>>>> +
>>>>> +                port@2 {
>>>>> +                    reg = <2>;
>>>>> +
>>>>> +                    it6263_out_dual: endpoint {
>>>>> +                        remote-endpoint = <&hdmi_in>;
>>>>> +                    };
>>>>> +                };
>>>>> +            };
>>>>> +        };
>>>>> +    };
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>>
>>>
>>> -- 
>>> Regards,
>>> Liu Ying
>>>
>>
> 

-- 
Regards,
Liu Ying

