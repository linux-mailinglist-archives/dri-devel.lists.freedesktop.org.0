Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEAC9D927B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 08:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F49510E130;
	Tue, 26 Nov 2024 07:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="JmKggbDI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013053.outbound.protection.outlook.com
 [40.107.162.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A192110E130
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 07:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lptu380q02GKZNwTR+kCXngKJxUy2lGFZLYh6y+/vhbzkvNcL9/WSOwyuKEfCYqUVXnqQuZFQ16OQZWL7P6NV6vxKrGxdWFBToFZb0GVdt8TgrANVULjHsfQaDl1PJvVgqlCMVNSJSMzlTLsdMCAWv4rMlD04nnFkyL+cCj/97UiFVe6V3EPhO1Fp5OYpncQqA99fvcbYnLhommp2u1I1oxKZMuSvQPBwRwE7fxZjES9uC9rVbd1myn96OJm3E/YlWG1wKPYJVcwQtDpGotJAL/AdL4ZB3daoyV1eaPIdxgv5FbWt9O7GPvOuoPyW168tKWt2XDj13udaqp7HRoABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FJjDJvQcVp/KdhZJEJAM6DkEK11WtwPVEr6LGks/0I=;
 b=fJk78IxBLKgk6gWX+yTCfDOLkRQAsZrv27brxDvmnHu8ifTklIrIJdF+b2AiGZxA3mSb+XFNl/FuisX1aSAPldr5ji04dlNLVGJEHch3Hkuno8ld6tFIduiWnJEiImlrh09x2/eU8nB5WR29eIwApx9Hojj4xYh8Z4FImL2WHm170E9tDBVgfzBX0Rtjzf5rsY1mucqQI+RcHT815Lhch+aANK9L4We4sUq1xNCcOvkVmKrqwjsrXODUxSC+vVhkX9iBXFvKJEhBFgmK+ChW5q6V8aXP8PtXq8xepknq9dS5UPr795ujnVH3eho9PrJn1zK19Z8GYnt7HXoS5evexQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FJjDJvQcVp/KdhZJEJAM6DkEK11WtwPVEr6LGks/0I=;
 b=JmKggbDIrB+W8t3B7zAuy+RcriF+XBNgwq+BTuz72Wnq17ZqROubefrwswGrIkXcnwRWPOYNEdTl2vEJheyaQt/Ketc3DB500Fs4tPvLRGGxAvtcGffNYSYEBSGadtU8lIyCh849gar2Oam+xiaQGDixCT+JMEreboCKhR1FKlbxQmEpnYj3s6NH2jrZNgkxaVZx7pgbAxItkRoliytkyhpBTZO8P1ev7U2tRlf9QZ9C2qXPssUXb57ZV00v/v68kAna9xpNhSqjmB/s4PcBSgUxG1Os3vCW2bVSYyhu8HPvLvwOaWxursbiJ2yBxr4/YDPJMbJ6djhJCARiDEVrSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8569.eurprd04.prod.outlook.com (2603:10a6:20b:434::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 07:33:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 07:33:03 +0000
Message-ID: <741238a9-cde5-4a1c-9598-68d8ac29cfbd@nxp.com>
Date: Tue, 26 Nov 2024 15:33:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [DO NOT MERGE PATCH v4 15/19] dt-bindings: firmware: imx: Add SCU
 controlled display pixel link nodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
References: <20241125093316.2357162-1-victor.liu@nxp.com>
 <20241125093316.2357162-16-victor.liu@nxp.com>
 <6rijytubyumhgvhlvzx3dtyfncknizs3iz7arhno2mjottyu33@subihom7khzl>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <6rijytubyumhgvhlvzx3dtyfncknizs3iz7arhno2mjottyu33@subihom7khzl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: c4833259-2de1-4159-6f9c-08dd0dec8fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFJ6V2hyNjRZZ0ducVdpSFJPM1B4cHRhL0dacldpSjFUMGcrS1JwR2dqT0Ix?=
 =?utf-8?B?ckZ3MjZsT0lLdUh1ZFJkS0J3QndEaFhQbUR3Mjh0TmxJejlwSFkyWkRGREVa?=
 =?utf-8?B?RzRvS0FvK0ZYSlpld3NudTRFZ2RaUWxxSExCcC95bHNnZGFMWTNGZmpSV0Ra?=
 =?utf-8?B?YlJvSDFocDlqUTVWUm1jWU0rWTBka0FsM3d5V0gzRS9KRURvazB6UFlSdnNM?=
 =?utf-8?B?cEUzQ0wwYmpodGY3bTRNZXZ2bWhvWE9kU1BiTlZPcm5Vd1pEcXdJeDNpeUty?=
 =?utf-8?B?cUlIeXplYkhGNWU3cWw1Z0h1aFIyVmZHQ1lUWUl5MGk2eDlPOGJTYlFWYU5S?=
 =?utf-8?B?c0Jic2JJekFxTDJsMWZUbzdpU1V0UDVXM21Da2FrU0JTR2F2T0JEaW9zRHg1?=
 =?utf-8?B?aW9vOHNySUJDTEV6MUZyR0ZTUDZoQ3RTcjFVRkR4ZmVaYzc4VGFQcnp3OWpX?=
 =?utf-8?B?b1k2T1hQVklxZlJHTHdEeUVTdDNQUlZnN2E1Y3JqYnVjMGlUZ2MwRTRQWnh6?=
 =?utf-8?B?ODI0aHhkZGtWK1duWUt2amgvajBOZUs4ZDkrR3IvTW9CZU5LSHBMSUlBamZ5?=
 =?utf-8?B?T1h6Q21zNUJHbGp2NVZBem9sYWgwanRrbnk4T3VoL1Q4cUtLY2tTeWZ2NDlq?=
 =?utf-8?B?UXNmZkcvTTFNUWhXdmlaL1FqZkxQT05KZ0FSbUE3YjVmdGFYVm5PTFFHcGhJ?=
 =?utf-8?B?TWFMdHZGOU41OFR6d0ZIdGVHS1ZYT1lHZGtueit2eURJZ3Z0WXNJYUdUWFNG?=
 =?utf-8?B?L1pHS1lmOEt3dHJLaG1iQUo3TmlSYmppNUVEQ2paeXBKWkt0UnJIME1Xc0FH?=
 =?utf-8?B?bGxrQUtnWXJSQ1V0TXNNZ0l1a1dPRmoxK0VBVlV4M1Qyb1QwdE43ZmllZENr?=
 =?utf-8?B?Mnk4bEp3TmZzbm1JSnF2QTE0QllnRTRGcjBkZ3pDOXFrRWxKdk13OVVxaTVK?=
 =?utf-8?B?NVpvSGlJbERWVmd6eDd5TTBmaHJtWEVZOU54MlpHWHdBU2NzdkZQcFJ4SFc5?=
 =?utf-8?B?b1d4eTc4UDNvZFVydUZWcG1sQktlNjEzdFNjaCtjWjBHTWxTR3djVzd4bERX?=
 =?utf-8?B?VmoySkdwbDU0cm54cEZxb1dSeXFsby91bWlFTjRjV1E4bTJPSXArY1NUek9K?=
 =?utf-8?B?dzR2Z21PZURRNk02VUFzUmliNGVHT3N4UGlTRTBSRlBvYTlQL0tJdXJYcWxm?=
 =?utf-8?B?ZnFSSW4rYW9ybngzZkNlSnYwWHZBTHF6WnNFNU9lcHJvT3NNRDV5MGlhUE5E?=
 =?utf-8?B?aFNwbWdsUXVpMjVvM1Y1ek9ESHFlUVVvcmE4cUpKc1lRZUFtbEhOOEN3YUhB?=
 =?utf-8?B?SU9ROFRhb0RsOElNdndRZzNwQVFScWVvS2pCeXo2SytJWElOL1RPNVpaUVZM?=
 =?utf-8?B?QWpoV09lbTAydklGYko0cE9tYUNFVlNVS3MvNithS2U4Ulo5eUpZbU56dUV1?=
 =?utf-8?B?Rm5ucTdjTzZIdXpFRk1LTHFWVDRWakkwT211YUhRRW9RVENlVk9sS011dTd4?=
 =?utf-8?B?OHl2Yk9ENkZnVTJGTW01cmpqZDdzWDh2bkgyditoenBTaFVtQXNKb1JzbVhD?=
 =?utf-8?B?dllBREFGT25qcW0xQUp1Z2VEUi8wRDgrSTJtZTdjWUcza1RuTlNWWm9hSU5w?=
 =?utf-8?B?a3c4QmloM3VqYTg1ckJta2tvdDdqTWhjSmlHUm9tSUlBWmZMU2FjakhpVUNi?=
 =?utf-8?B?NTF3OUNJZTgyMmZBNkJCRGpTSDAvVmp0Z3Z5NFJjSTNCOFJQUW45cXhUenpm?=
 =?utf-8?Q?u0M3geQMF4HV6DI1z4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nzd2eDJJTjFCc3c1SkJjSVVjaVJuVHJ6c1pCeSt4T0s0Q2h0d252aGNYREMr?=
 =?utf-8?B?YjFFN09YbElrVittSmsrbXhzWThCNmErRk1Ld3F6ZmlDWndjdGM1blFLSHVw?=
 =?utf-8?B?WjYzc2FOU0pQeTZpM2U2OGZEc1dRcVlzZndQWXNRRnd1cnJWWUZzRUIxb2gy?=
 =?utf-8?B?VzcrTS9oM0dzcWJZRkxnZGphaFMwTlBwZjVGc3dqY003RWxaRjNwTlJNN0Iy?=
 =?utf-8?B?bjR4SGVNQmlYekFSekJxQjY5R1FBdTZWWUhOaDBRV1ZkYnhnZmhMRit2YzI4?=
 =?utf-8?B?c3VBTWlZeGxObFpUS2FpWEY3N3dmNXlMWVRodi9lZmdSZGczL1hGU1kxbDda?=
 =?utf-8?B?RUp1dHdIRkhiTnZNMmUxMTQya3M2U1U1SEhrK2JGa1hRWWNDbHlJZU5IbW1n?=
 =?utf-8?B?TXh6N21xTTBDdXdicUs3VGFOZ01uUTQydnkvVHVJNDZybWx4OEtEYVBjZzlk?=
 =?utf-8?B?QVRxSkFEcHBmd0U5Z0krdDQxV0sxMmMyZ3l2WHl2NVI3NStyQUZBUllGV0lK?=
 =?utf-8?B?dFlWNlV6aU9iSzZhZUNNYmdobVQwMTVPMmlnRjc3Mm9pUnJCQjY5SThmL3BL?=
 =?utf-8?B?ZC93RXdadHczYzZZNzkwMlBNcXpHV2kvYm5aSmdabzV6ZzBiZFlQQjhhL0U1?=
 =?utf-8?B?bW54bE44VW9BS1VjaGl3YjE0aUZ0U0V0cTBUenAzVkxUeTZYNURXb21KQk5j?=
 =?utf-8?B?ZWYxb3BWUnlwV0VpM1liWWFRWEtXMElXMHl5cGh6UE41Vmlac2JzenV3a0xK?=
 =?utf-8?B?T1FtWkJSUnF0MnJvbWZ2VzJiTVFRbXp4TUZWUjU4QlRKRU1sdzU2RGQzRksz?=
 =?utf-8?B?T1lUUVhsR0dONnRpS1RWRWZCMVROWlVPejJtaDlEUGtFd3NIcXA2M1I0bTdy?=
 =?utf-8?B?eld3aUEyN3Z0OE1rOWZFdDdHZHFnb3g4dEpuMllkblhPT0RjYmFwVHRiNzJy?=
 =?utf-8?B?MHMvN1FaVnhKaS85cnRKNVhVaVFmTmdzekNtQkRiL2JCR3VNeUtUL3pkbUp1?=
 =?utf-8?B?YW1wMVU3SzdRMEF5MFZTT1QyUFN4dTdtV1JPalROR0Z0NGt6LzZLZ1lDL2Fl?=
 =?utf-8?B?czc2TEl3TkN6bk04UjVVQ21YaEVRZzU0RFJVTk5XVGFZVE9UVEJJN0NpYzVQ?=
 =?utf-8?B?ZFJUNThpM2Qyb24vVHN5RTJlS1YyNEFzWnZTSm5halNGckNvR3RYMytuZkpn?=
 =?utf-8?B?Z090ZTBPZFZPWTFXaGNLdkhxM25LUnozMmErd0FCdFZCZzlWeEJIYWhneWFy?=
 =?utf-8?B?VUFyMjRoendSTXZlTFJ4YVcxeFpxZnArR2NLNmFoOTBmL3BkdHFwN0xSRlJ0?=
 =?utf-8?B?eDd3ZzJ4akNxRHUzZ2ZtcTJ5akNyYzRvbE41eWM1bFhLVTFGQXhKaEdCRzBr?=
 =?utf-8?B?Z1RqNEliMmZidXY3a2l4UlA1TzhsWk5xSnFLYkh2T2ZFTkpzUXdCNC9iNWZQ?=
 =?utf-8?B?eVE0MVZmK2xIZG4ydzhkTmV6WW9FM1R5WnNQd0dkVVRBL1pjWW5RTFpyYnB2?=
 =?utf-8?B?WHpUYkFuaGM2NlhkdU4vZGMra0lYTE5pTmJadjZnVmNzb2crRmZ6anF2aUxC?=
 =?utf-8?B?RU9QVzIzWmE5WndXVWU5MCs5QVRkang3L3BEWGxqaXRPa3gyZlVXTlZZVDJ3?=
 =?utf-8?B?MFc2ak5talNybnAxdU4rdXNaaE02S1Rad1JXTGRCcTBKSXIrZE9UbnpCQmF6?=
 =?utf-8?B?cHJyZHljZDNsRUZSYk4ydHhoRUd1bU5uL1FUaFpZZW1qSHRMY1RmQ1RXZzEr?=
 =?utf-8?B?eXZWYzRiYitXNFNBcVhtL253NTRqcThwMUN5Unk5bVBqbE9NNE5VTUdGVk9V?=
 =?utf-8?B?ZzJjY21UUzZBZ3ZWZm8wUXlJMnRKWHhqVThWeEEwTFN0Ky96VzA0SmV1MW1Z?=
 =?utf-8?B?c1Noa1VnT0lPRi9kdHdOKzg3Umtob2VwOUNrUkh0SVBodUcxQXFqR2VqOWQ3?=
 =?utf-8?B?b0VuOENRcXk1SWRvbkcxR08yVFYxdHNEdk9GMitKVTNhR2xLVDdaTkJvd1cv?=
 =?utf-8?B?bllZZk1LRXN3ME1NOWxGMmk1QVJaY0pzWnJHNGRTQi9sY3hIYkhpd2ZCUEdm?=
 =?utf-8?B?RmowNmFMNHU2QkIvbmdkSEdhUnFYNDhabnY5RjJqSUpPYkVSTHpnRTVvOFp6?=
 =?utf-8?Q?F2zRQKBBtfyNsubYctAX7BtxT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4833259-2de1-4159-6f9c-08dd0dec8fdf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 07:33:03.6558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vb4ZTxq2LxF5PV0kik3ILEa8mCbi6i4GijDO1Ya5+b0EbcHTwEiGCqz6tPl1+MLFGzJwTx/v3dxMxbEzhQr9zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8569
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

On 11/26/2024, Krzysztof Kozlowski wrote:
> On Mon, Nov 25, 2024 at 05:33:12PM +0800, Liu Ying wrote:
>> Document SCU controlled display pixel link child nodes.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v4:
>> * No change.
>>
>> v3:
>> * No change.
>>
>> v2:
>> * New patch as needed by display controller subsystem device tree.
> 
> DO NOT MERGE means also do not review?

According to Rob's comment on v2, DO NOT MERGE means no need to review.

https://www.spinics.net/lists/devicetree/msg720125.html

> 
> Your cover letter does not explain what you want here, except not
> merging. Why posting things which should not be merged, without context?

The patches with "DO NOT MERGE" prefix facilitate testing a LVDS panel
on i.MX8qxp MEK as requested by Francesco.  Francesco suggested the
prefix.

https://lkml.org/lkml/2024/7/5/709

The cover letter mentions that the patch series facilitates the test.
But, I'll clarify things better in cover letter in next version if
needed. 

> 
> I'll ignore this patch for now.
> 
> Best regards,
> Krzysztof
> 

-- 
Regards,
Liu Ying

