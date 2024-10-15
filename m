Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D7099DE3D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 08:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0D810E500;
	Tue, 15 Oct 2024 06:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="JSB7YzC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2079.outbound.protection.outlook.com [40.107.249.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DBF10E500
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 06:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYWqGHEykaiRqPxC/LWWtV6Hx7lG8pll7pFMOgfnJxHJEydZs9D/lxMyTqlbBx3JOFEhB5UEZCvQzSU8wJTKyCbunCPuMwMbWbCFfqreIgNdNGgPdj5ecd87AjmHkZwbEEdVemxXoQAJcNxj3hcCvGBvIOiJX+dQFxE3BDksyis6MHgChh1eAfzlS+14V8y7nqSLIc9CnP1/Yht+WjGoTk+Emg32JBbsyI2nQ7YZk2CPoyioDyrOh/bD3ZyXYBAHJgnNhAsZLrJ5FNIkHhgGdncQ7QRRe+jemTpEvRlUubfLJmU0r4KUZq96wvFccw6Z7QQeLvhEfCMZzHWH2GleIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baUv/vvnch8Zm9oR7Xd1UOXSl6HroaWFj3fre3/4WtE=;
 b=QAbskv9SlJ8UYS4Q+3QS1SG/cZRcb/qSF1nM5+P9oQtWi3+ORMdP9U5Q1N1VhBqOwI8XeIlUXrTAum2WbIMDesqMidxlmgO0pFAKczkDt6bJkSfIkPZi76Y3lt4yMTV1IhN0nmnRsks6I8C8JQjnWmeaXtWtisjSCXHkEGv0E9YBulatiLXqSIyWccOYPMyCVG6ZD6s5cpbWE5ccFv5CRpdjqCZGKT49Vhm1zunsauj0XSAImo0pq81HBAeEafvGTHTqdJfVBiZZ+DefmYecEES0AfsOn0NmIt5QQ6R0pMiKUje2uWJSwM5AmAf6J1995U6Qxg/tUL3qPKKNYjWB3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baUv/vvnch8Zm9oR7Xd1UOXSl6HroaWFj3fre3/4WtE=;
 b=JSB7YzC2+CYeDmopGu0g6EDoeJNzRKKiqBlyEBiHaY35B+to0DVrzub8Z6ie1BYUniUhr33Alo0EBL9eUXpz0OrFevBZ8teNuCAvL17AL+Swj8njujpNs0VWihS9BM0q7dBBOhDs7RxzLRMTO8zvyIQRkdbvtXcvc+De43EFCcTg8Fb7MWGVcr8R6h6ZmmU8JAYlYlRgkkZX74+dZ2/t69Vc16LFh4szxulBNExegauzgf9q2dGJM06GwRdHbVz7PoXV9I0+A6CcEFCnb+HSxhF6BRio5/iwdbnBujDWDTtGk9A6e7GfeS8r8c6/SbDoy7nxAXfonCy15Zj2hMEqhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10777.eurprd04.prod.outlook.com (2603:10a6:150:227::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 06:27:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 06:27:36 +0000
Message-ID: <d5d62f61-808f-4c40-bc71-4e168baf4b1b@nxp.com>
Date: Tue, 15 Oct 2024 14:28:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
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
 <lcogrc6uztckwwwsuag5tlk5otidmo7rudsl7zshe3wpfot3wc@ziljns5phhfe>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <lcogrc6uztckwwwsuag5tlk5otidmo7rudsl7zshe3wpfot3wc@ziljns5phhfe>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10777:EE_
X-MS-Office365-Filtering-Correlation-Id: e37f5ea7-6215-461e-0f2a-08dcece2760b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amhGOU51TnF0SkRZNE15S1BwV0cyOWZjQXB5K1djQmxHN0RCUzUxL3BzTkNT?=
 =?utf-8?B?RmM0Ymsyd0lVeHdMQ1hYRVdqajJlcFpSOHZWSi8xZDdub3lqZ2hPTitkam9o?=
 =?utf-8?B?bW5MY1ExWW41anFVMzA0WkptM1FXN3VkQlhFYnZkK0dldXhrWWRwMW55blAz?=
 =?utf-8?B?U3ZIRFJtYTNSaDlvc25pRDl0R3Z2TytTVER1QkdwSXQrTFJnL1JNcWx6cnBD?=
 =?utf-8?B?QWdwTFc0THFSaWdjcFVCWG43cGhQRXlQd1RvVVFSbDZCSnZpc0tHU0R4SjBr?=
 =?utf-8?B?Q1diR2V3azR4MFVHc1YxQS9DYUQwb3JKTHBIdEk4aG1HS2VsTWdmU00wYytI?=
 =?utf-8?B?UW14MFk3dVJFWW04bkRqT3hVNHFHU0dHZHpHek1ic3ROVkllWW4vL0JpbGpT?=
 =?utf-8?B?enl2bFN0MUVNZHpLdEVreEpzSGNjc0R0TWtWaXJqc0NXQWVpekIvd2U4VWFS?=
 =?utf-8?B?ODZwaGZMUjN5cG1oWFluSE1iYlBQUTh4cm5IblVIK1NycERsdnRRK0t5VFZR?=
 =?utf-8?B?VnB0OVNVRmd0eUlxR1FQak9vU2dXSUNlMHpTdXBYOHdYNG1iZlAxaG5ETUJR?=
 =?utf-8?B?dVNoUXdoYUlIbGU0bHo2S1dGTFdBYlBGOUtRZHFuZjBIaGwraTlFVWpQd3RH?=
 =?utf-8?B?YVlWZGRLT3BMUFZkVm5PdC9sMEJoZnhaYWxzU3F0TWh4LzZBOWh6TjZna2ls?=
 =?utf-8?B?bUI2MXY3dXMxMUZsMUI5aEUrTERnSTZzZmJsZ01iZ2dnakprbndrRWJhdWl2?=
 =?utf-8?B?bnUxckhUOXc5blRLOUIwWEUybTFXcmEyR0VqR1AzclhISzByOUg5VHRPbklN?=
 =?utf-8?B?aVhIdW1GRWErZWNwY01DUld1cFV6YVhDbkY2RXB5SmhEaWJ5emR3cS85SHB2?=
 =?utf-8?B?RlV5Y1htVnBIbGJIaXRDck10SlpIZmJXUUhuY3lPdHhyelhyTGx2aHhRUEh5?=
 =?utf-8?B?bVRxeVJGeUk3NHcrcTR6QlQxN25sTm43TlRvN1RwS2huaFFYNjM1NVRRY0Vu?=
 =?utf-8?B?YlFJTVR1YXZyTCtyN3lWci85OUZ6MkY5R0J4ZTNPTDNPL0lVL2R6RWlOdERM?=
 =?utf-8?B?TGpIQk9laDN1TVd4NEJNd0lmYTFoTjlxUkxXQjJVK2lkZzBvZkZ2ZVJtSWpi?=
 =?utf-8?B?dy9QUlc0bGNMNnlRZG1ZVDdmS3dVaFUvbG8yKy9acVpOZ0hDZ09jZXI4Y0dZ?=
 =?utf-8?B?T254TElzbkhwRy9XbDY2bEFCSVc3TUJoUVpnVFdNQnZNN05nUWE5WkhDcTBw?=
 =?utf-8?B?cDUraGNibE1OU1RFVk9oWCtZaWthN2J3dFNEcTl1dUlXazlsQ0R4UWpYTlg5?=
 =?utf-8?B?c0dqSkQ0dU9JZkZyQzNVOExyWFZpUkI1ZDcvQldlOGF6d3B1QkY1aHJ6dFdr?=
 =?utf-8?B?L1FGR1FIOTFZVSs0T2hTdXFDNDhvNGhuV2J2K2NmaGdhaWpmVDRTSjVGdFJr?=
 =?utf-8?B?bytiOXA2MlRacUZsWlpqWVdlOFFuM0FDUWxONWhQN2YwdjRSQlQ0SDFFUzF5?=
 =?utf-8?B?WmZKSG5UcnM4OHFlMlQvYUhOQWpoRjgzLzd3SlFsOStPM0VGLytvRVpBWDV1?=
 =?utf-8?B?eEZuUmxTYTg0NnlRS1lwT1hjNTlsK0NmZTNUVFdOa2ZYZnNEaUFYMWhUd0Nj?=
 =?utf-8?Q?S3+9slpM+Ro5t2jp3xetK4aDe4eBYm/PLhxi8xZmcbwE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnFaT0ZvYUlpQ0hYRVhOZTdweWwrdXNnMXhaSFNTTkt2RmFhdUYybGFyR3JJ?=
 =?utf-8?B?OWtkQlNhK3c4UVpSSEhHL0JBVDkzK2xpcS94VGt4eW12TVRuTzZnZzkzZHRh?=
 =?utf-8?B?aG5iY0RJamRvcERXdjJibXp5UXRocWszYlgraGN1ZG1FOFYwcktKSW9iVjhC?=
 =?utf-8?B?NFpsZkNtVGwvNUVmb0NUSFFVK2Y5RUwyVndUVjNSNlpic2hlb0ZlLzFXWC94?=
 =?utf-8?B?TUF1eFBYTnE0VVc2VHgzYU5odmJDQzdQT2FhRXo1Y3VNcWpJeG1aMURQeTI3?=
 =?utf-8?B?QnUyQkFUdUhKa2svWjFiSk9Yc2hkVmU3L1RlTXdXRmoyeUVDL2NJYVlaRkJI?=
 =?utf-8?B?MkdlWUxDYWFwNFdhaVRoTWYwR05TWGdFZmpNbEJFbnVETFYzRkZGQTJFMjRG?=
 =?utf-8?B?Ri9SeVkrSTIyZFk1ZlhGSXBoSUZpbU5BSjI3VDNsanF5eWNiQ1ZLK1M0TGVt?=
 =?utf-8?B?N3I2ZjNGNmUzU1F1a1EvNHkvNFhGeFpWZ0I1K21La2syRS81Q1JEcHE2UWg4?=
 =?utf-8?B?MVkvM0NZNFp5RXVwY0hmWVBQR2RjczI5bnNYU3ZpazdLclFGZHBQelRwUUNj?=
 =?utf-8?B?Slc4VmtFZDJETjZ6ZFZRMXpvakQzQjNtWm51eTNPVldMaEp4ZkFlUUY1NDht?=
 =?utf-8?B?QjJUcGo3ellEZXR4b1hDVW1vaWJOdDZ0OWJKTE0vQm1wdVFHUEtWVVFXOWtx?=
 =?utf-8?B?ZWxvbTJrb1FSMGI1YXk5NzJNWnFObjZ2KzFMRnRuVG40R3QzUGY4SG9nZDJK?=
 =?utf-8?B?dUVSdWJsZ042ZlBxNDZDSitraDFPa0NJc0llY21vNmVFd3ZHYVFudEY1cFJK?=
 =?utf-8?B?K3RtcUhUNDJ2dksvYlJtTFFmcUx2MzR5VGVMTlBqRXhwSThNVEJ4NnpKQUhu?=
 =?utf-8?B?SHUvU2dpTWtxYmZRTHpyRkV2SkRKcnRBbUVOSU9KZjRlNmI1NW5oMUtab2Vo?=
 =?utf-8?B?aTlnZ0kvd0FMS2VzZnBGTVRUY1dmcnF2WlRyeGl4Qm9HTDEyREZDV0lYaGlS?=
 =?utf-8?B?Q1A1SFo4Ujd4YjRCaGtFd0tkUUxEaG5KRkxRWS80SDRBZU91R29nUWNGTmVP?=
 =?utf-8?B?Q2M4OXhybm5rNnd0ZnYxSmFxYSt3RTlBZm5nUEExQm11cjZuVTg2TTdib3Ey?=
 =?utf-8?B?RFNFc0d2MmNHTytYeGhIY0ZUclVwa2RFUndkS0lZRUtHZ1BTWVRqS3R3UHk4?=
 =?utf-8?B?TFBxU3U5Yi92MVVodGZZcWxGMlh0Y2pDdFBsdVI3U0gwZDdjOEVubndPcFdX?=
 =?utf-8?B?UlVCN3BtMjRESFFSVFZhQ2I5Y0dZVnVnK1ZHZlhWb2x6VTh3WENaZnovTTB2?=
 =?utf-8?B?S3BVRk4rVFVrYWxNenlWQnZOdXA5S0tUdGttcDY1SEs5c3cyOThrWVZWQXZo?=
 =?utf-8?B?STl3eGMyNDBBVVBqRDZwTVF0c1VNTW5HTm1hNGQ1UUZkVTFpNXltUHRoZWdn?=
 =?utf-8?B?R204aXB1eStHLzZKaTRhQnZla2QzM2hkaU1BdFJrWld6SmUxL1Jvb25UZlZ0?=
 =?utf-8?B?Tlo0UW1HaENob2xDWGlEWWFiOWtpYlFlRlZMdWNSSGkxNHJhNUdGazc5RDV0?=
 =?utf-8?B?OWE4Rmp0bFNPQ2RPc2FpSzJtclpJd1ZoUUVuWitJblU5UllVdXplU2dpQ01J?=
 =?utf-8?B?cjlod21CcUxUaXcwelJRQ1RCN0VMOVE2MHhRR1ZXcEpoMXdVemNrMTlPVHFC?=
 =?utf-8?B?azlubmpheWRERTkzZm1VVjNiN3hFNmFsNFBUUXhVQWs2Y2R1d0paeTYyNFdQ?=
 =?utf-8?B?RE1OMGZSNC9OQ0hLMERQS25CRVp3Y09aRTMrZmRXeG1JR2VnczdHaTJwUHAr?=
 =?utf-8?B?Y3RVa2N6M0RkbzFpdzl1VFREUGFraTdjWkV0Z2ZWMnRrQ3BVRVYreDJBNlF4?=
 =?utf-8?B?Qm8xS29tMHNMUCs2dGpiYmp5K2xDajNsVzhmMkZqNjBrTzd5cU9CRkV2YVB6?=
 =?utf-8?B?Q0NvYnRibm9SNmZvUG5VVjBSQ0JCWkFkb0orOVBEdjc5V29mVmROK2lhL0NS?=
 =?utf-8?B?ZEtLcWw1Y253SlFxekhMTXZ1cUY0cVpxcytqNGdVbkpsamhxOVJtcHRvTDlv?=
 =?utf-8?B?YkJ6SUMwcklXaGxnWlZ2bE1wVmNEMHJ0ZTVIdW1GK25TQ1d6NEYrSmdhSkNQ?=
 =?utf-8?Q?ZUkzqulmdrItSiPzntEWC7s5U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e37f5ea7-6215-461e-0f2a-08dcece2760b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 06:27:36.8181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CH4VhSMM+1L6ZrrP6xpc0zrb9Jzz+fd07aaJHcpuH4HRdE4Cy0O3Mnda1Ep8vIKwx2zdi3I/dKPG5QeqDXuoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10777
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

On 10/14/2024, Dmitry Baryshkov wrote:
> On Mon, Oct 14, 2024 at 01:33:44PM +0800, Liu Ying wrote:
>> On 10/14/2024, Dmitry Baryshkov wrote:
>>> On Sat, Oct 12, 2024 at 05:14:13PM +0800, Liu Ying wrote:
>>>> On 10/12/2024, Dmitry Baryshkov wrote:
>>>>> On Sat, Oct 12, 2024 at 03:35:39PM +0800, Liu Ying wrote:
>>>>>> Document ITE IT6263 LVDS to HDMI converter.
>>>>>>
>>>>>> Product link:
>>>>>> https://www.ite.com.tw/en/product/cate1/IT6263
>>>>>>
>>>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>>>> ---
>>>>>> v2:
>>>>>> * Document number of LVDS link data lanes.  (Biju)
>>>>>> * Simplify ports property by dropping "oneOf".  (Rob)
>>>>>>
>>>>>>  .../bindings/display/bridge/ite,it6263.yaml   | 276 ++++++++++++++++++
>>>>>>  1 file changed, 276 insertions(+)
>>>>>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..bc2bbec07623
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>>>> @@ -0,0 +1,276 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: ITE IT6263 LVDS to HDMI converter
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Liu Ying <victor.liu@nxp.com>
>>>>>> +
>>>>>> +description: |
>>>>>> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread Spectrum) LVDS
>>>>>> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a transmitter,
>>>>>> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
>>>>>> +  The built-in LVDS receiver can support single-link and dual-link LVDS inputs,
>>>>>> +  and the built-in HDMI transmitter is fully compliant with HDMI 1.4a/3D, HDCP
>>>>>> +  1.2 and backward compatible with DVI 1.0 specification.
>>>>>> +
>>>>>> +  The IT6263 also encodes and transmits up to 8 channels of I2S digital audio,
>>>>>> +  with sampling rate up to 192KHz and sample size up to 24 bits. In addition,
>>>>>> +  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
>>>>>> +
>>>>>> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications v1.3 is
>>>>>> +  provided by the IT6263 in two interfaces: the four I2S input ports or the
>>>>>> +  S/PDIF input port.  With both interfaces the highest possible HBR frame rate
>>>>>> +  is supported at up to 768KHz.
>>>>>> +
>>>>>> +properties:
>>>>>
>>>>> No LVDS data-mapping support?
>>>>
>>>> It is enough to document number of LVDS link data lanes
>>>> because OS should be able to determine the data-mapping
>>>> by looking at the number and the data-mapping capability
>>>> of the other side of the LVDS link. 
>>>
>>> From what I can see, data-mapping is specified on the consumer sink side
>>> of the LVDS link. This means it should go to the bridge's device node.
>>
>> Then, I won't define data-lanes, because data-mapping implies it,
>> e.g., jeida-24 implies data lanes 0/1/2/3, see lvds-data-mapping.yaml.
>>
>> Please let me know which one you prefer.
> 
> I'd prefer data-mapping.

Before I go ahead to use it, I'd like to get confirmation that
it'll cover data mapping which supports 30-bit RGB pixel transmission,
because it is something supported by IT6263 as I mentioned in v1
dt-binding discussion.  For now, data-mapping only supports jeida-18,
jeida-24 and vesa-24, see lvds-data-mapping.yaml.  And, I'm not
sure the 30-bit data mappings specified in IT6263 datasheet are
standard or not.

Note that if we use data-lanes instead, then this is not a concern
from DT PoV, as data mapping can be inferred by OS.

-- 
Regards,
Liu Ying

