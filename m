Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32BB1B08F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 10:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE47110E259;
	Tue,  5 Aug 2025 08:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fT3gUee8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701B910E259
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 08:59:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fREWEdJkusE/PXqsuzgdSSRoM8PsA6z2weSmRGzUyYUP8Gne5LO1VsZZ0ETr39xZW863GTUGTs3gqMiMbqTB/JzthRQYwYxM17guNh7pr6KADpa3r9Q4P5VKJsqqZtDMRx64ijq5UUr7cXoUtKt5KXdUQD1vIgycLwjzs0vUEBdK0JXpugBW0b9FaNsD0Hyk+fmQh6/v2kT5fW8P7u60nukb6qclGe7cnzE4WNIg2G+6rnB8V2Pb2/6DmioLYWd+wohsdfQmo87Drn81uFtV9lPV7VRa3wi+xDxo2JzavQdxXkFbJKeQ/e7jvc5EmJkKDLzoTQTDb2Tl7Ek40BgIJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5S1OzrpLUhkp//OOC0lL6dUuZquUTnFmDr/KEO71PJM=;
 b=cK8hyXnRNrfYOfIguPtFWQEoBm4zjHekDBGLsk8C1UzkHyAuj8SBPoDZTMqxmPTd3EOtOGTFuGKCE2kWVk2uHgHY6f5oqw32H0KNIk6b5gg8BVcRDGVnme4hBX8MvTRZycKbEWUncwjTjn/y2dGiukVkGno65UXYmHjoMBh+nAxg1GlGpePQfctThR0aUG93PLu7ppTK0/AV9306JLrXqb2CEN+ZzmTbgD/ZdqPZcFUzp2vQtwqUm1eVLrK03Zc8jznEfd/vVDPgyxFJLKMcFm+gJI0ngV1GJ0lcgP+rqzt8gZAzMtjEEZeqKnkWQBe8/rSDNUnHQpEDZCg32yFHxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5S1OzrpLUhkp//OOC0lL6dUuZquUTnFmDr/KEO71PJM=;
 b=fT3gUee8I5RnPdNr7EJV/MwG41SeluaBR1kSzET21RW5fxQ/bbDsy8UlfqcZUUUegxsfDnbcDLi/+QeEn1R1HkV08nbdBx9nRuvhOB4WdwZZw1UN7NcxKRC4xd/j3MpW3eHKZRAKZV0iToB1MasGDlJrAWW68j1SbphzcL4aPkwckptwy0xF4mkMYsXbyhpHc0b82KIQceaErZneefdj4ZopsaAm2b1XAGaOMxZ3eFJK98FtjMqV9Ts11EZ/0EFanhoxfa0A4aLlEt0t01306+lUn5/TSYNjnDNlahpFBwdU4lYg+m1hcv6ufkS81+LOSjPmCD2KvGcuTYgQlryD0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7949.eurprd04.prod.outlook.com (2603:10a6:102:cc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 08:59:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 08:59:12 +0000
Message-ID: <1b696867-6cf7-45b1-8bad-be19393dad98@nxp.com>
Date: Tue, 5 Aug 2025 17:00:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] drm/bridge: dw-hdmi: Add API
 dw_hdmi_to_plat_data() to get plat_data
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-4-shengjiu.wang@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250804104722.601440-4-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: ef5a0e41-5435-43bd-240f-08ddd3fe58db
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTd6YTNIajBIeEpXV2RZVDVpWE9ZQnY2MXArNkdReU5rUjZNcUZERDhZRWRE?=
 =?utf-8?B?azJKNFpNOGFqaFM4MHZTcVJwSjdxMVdNdlc4MVdJK0ZoaDZBeXMvb2xydkhH?=
 =?utf-8?B?SlpiaDE3MjFva3ZrV25Ic0lMYi91aXJmNloxYWRyeGNiU3Nod3ZlZ0kySU51?=
 =?utf-8?B?d3hIL09kcnJEb3NwZ1doVmdZZkVycVEvdWNqREhuR0pHQkdyaE1DVEt1MDhR?=
 =?utf-8?B?OWQ0YTg5V3dLL1hKbEEyS0c2T3JUWk1uVlZCYWcyQkxNTnVHTERadUZzS21X?=
 =?utf-8?B?SU5xN3ZhRHY0cmFISEt0bk1WZDUwSm9DZUVEYTRTUTdsVlNRcDhaZEdaTEdv?=
 =?utf-8?B?VzZ1andpOERnenBZb2d5d0xkMUV1UDBzZURJOUhyUkZ5NTJrRU4xVkdGWHRn?=
 =?utf-8?B?LzVabUNsckpQU1hKS1BDN2J0Q3hoSWtyM0JGaW8xNWN1MXhqc3VtSHpNQ0h2?=
 =?utf-8?B?VndTelNxWmhCcHhIMnRtTFZYR3BHdjRGVk4xOE9Ud3d4MWpOVXVrcjY2M3V6?=
 =?utf-8?B?akFrcGxjWnZsV21KTlNhWUNNendpV2NkZ3U1SHV4dkFaS3d4TVVaaGFxUjdD?=
 =?utf-8?B?OVlXSW9FaitVTDF6WmxrQ0F1eUdiQVlRTGdNVTM4VENyMHNDNEluMjNjOUlY?=
 =?utf-8?B?SlkzNW9RR1Z2WFVtZXBqWFVKdGdkUU1NcVIxWlR5VHc2bUx4bG9jRU5qYmF3?=
 =?utf-8?B?MUl4amRRL0lRS0w3Q21EcXIwZnlHNW03Vm04M1BSWTRBMWhSSEhDaTA4VXVW?=
 =?utf-8?B?SktwaXpQWGp3WVUwSUp0UUFMQjduVytXM0pOdnZxTTZ3cjJmazAwMng3RENS?=
 =?utf-8?B?U1ExaCt1MEEyS3Z4VXRuK3JTTjJoTUJwQjhxVjFvMytiZVlJSzUyR0JYTlV3?=
 =?utf-8?B?UE9uY20vUkhvUzU0TnZabDV5aTMxVUZ5UFdkWU9lalUxRWVOeVVUU1lRaUlK?=
 =?utf-8?B?b0d5VXlBVzNsZGVsbTdZYmtYeFltaVhiRGdGZWxSV2xHMjRnTWloaUhzQk5O?=
 =?utf-8?B?VDhXNnFzUU8wRVVpcFRHWmdwaEZVL3lPeU9uS3BpRmpIckFUL2VRYXlzNm9M?=
 =?utf-8?B?eXdEV29EWTVsaGN6alpTSGw5YzRkOHJtSmNVZVFTYnhyZEdUTDFMK1dERi9K?=
 =?utf-8?B?aUdGR1NISnFJb2ZUSFd1d3JaM0RieFFQZFNXenVLTmZUT1NxNzM5eVkvZUNE?=
 =?utf-8?B?aFlqS2h2aWM4YitxczIyMWYzc3J2WXZTcTJtRVZEUU1TQ2dJSkUxNUtzNmR6?=
 =?utf-8?B?U2VwYUFaUzFFQ1J4YWZCYU93LzJjN1M5cjF3SGVtVmp3Y3JzSmdLdmxoZ1By?=
 =?utf-8?B?UU5mcFp6MWx5cTBLM2RsTGJSamtrRzNJYlBFdVJRYUVRS0R0K0ZkeExpbk5t?=
 =?utf-8?B?clVJT1R0WGJWNHRpVVlGMnF1MHdYRWpiZ1dwa2JvWXlWQ1FXZFVMVnJXNERN?=
 =?utf-8?B?b2Z3OWFBYi9DaUQ4NlZ3dDNKZXdIZGxEaDZYNVhKaG5xcFg4VkdDSFd1YXcv?=
 =?utf-8?B?MjZyQTJmMWRoeHlXeTdqSEtaZzV3VTJsOW1ybEFRbUNWOU9pczZEamhYYU9O?=
 =?utf-8?B?TEFNMDdHSWo2L3VjcnIxZEw2MXJOdUlMNjY0ckJseVplc2lOc0cwSHhHZG5G?=
 =?utf-8?B?d0tkSHREUFdJdFZtektYYkFwcFl4eGhVbnpPbVMrVDEvSm5aNHZYV2tiVm1Y?=
 =?utf-8?B?KzA0SFZBdjF4a2MzT0pvUHhyVGZEVW5WVUFtN3EzdXZUSWZrU21kMVRncWcw?=
 =?utf-8?B?bk10UzJpazZxYVBZUkdNeU5weEIvMnNhOW9NQ09yUWI4SHM4a1lCLzFrT003?=
 =?utf-8?B?VWFUUUI4UGh3aHpJWUZabXB1VkxGL0dUSjNjaHc4Z1B5N3NKMm9PRDdjYXVz?=
 =?utf-8?B?YmZ2dmk2Y2RPRHgzZko4SXBydXlzakJlaytTYmVVNlFXUXZlWFBwbUl0UXBT?=
 =?utf-8?B?REpMbCtuK2lFOEY0Ungzd1hlTHhueFpYNFNNUHY2UnZUYXI1TTNDVzlOSmpX?=
 =?utf-8?B?S2MyMjNicVlRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjlvTVBGT04xZmZ3Tk1XcUhsU2JRblRpMXNud2hJNU5yWThGMklpUzcxd2tY?=
 =?utf-8?B?M0RGSlFSNkNrckpoMWYzSVhzR1hZQ0FPWGN5S1UxbWgwRzdGaGRBcVVmSjVT?=
 =?utf-8?B?aU0vRkJOZlI3MHk4VGlQMHJjQTlpUllwaTArNVRham9aODBWU3dMOHZUaXU5?=
 =?utf-8?B?VmJIMFlQbEtndmxVTUlnYng3SDhwbW5HWVNOUWpqd1hkREhEU3ZTUk5tYnA2?=
 =?utf-8?B?ZXFGN3VPQTJxVklEY3FwU0xQTWpBMkJyWUI5RnowQWgyYkNTdytwWDhwaGNR?=
 =?utf-8?B?d2ZjVTFUd2ZId1J2NGd4Zkd4eVVnaTcyNEtDSk0wa1lpM1dkdUNQR25DVGJ2?=
 =?utf-8?B?Z0FnMnF6azVNQnpKVXlWQ2tHSlp1bk1UbDIvcXJPZGxQT1dyVkhMN1RxOXhx?=
 =?utf-8?B?TUJhSnJuVVphZUZhRlZtQk9RbUgwb1F0emVlbk93VVBrWHpjNmtNa2o2bDds?=
 =?utf-8?B?K3I5ZzExbnlDMWR2NmVPbllrU2gzREkxcXZpOVc4WWFneEJhSUs5bU9rSTFL?=
 =?utf-8?B?Sk5UeVJnREN5ZlJtOGZjek8wSTU3WFVKUFJJdUFNWHU4c0V0K2hxSGEzMWk1?=
 =?utf-8?B?UWk0b01jRXVMM0ZlUHVtS3QyaUY5Y0p0VjRlMnNPaEtFd09mZC94REhJK0hG?=
 =?utf-8?B?MUMxV3VNaWJkTTFqbnJqZ05Nai9JRitySlJWQjVrU2VVMFdyTXJpM0xUbmhE?=
 =?utf-8?B?Y0dXZU40MUFleVI5ak13MGJ2ZUN5WElHU3QxcVYxdTR4QW95LytSSkhndDYw?=
 =?utf-8?B?MmtzSWljL2ZzSHhuMXUzY1BMREtaejRxWVA4WHljMEZkZ29yODdQL1I0K2R3?=
 =?utf-8?B?S3FPRDQ5WTM1ci9oSXNVdTdMcDZKdC9rTXFpTnZxOUcxb0JkUUsxSGw3dkFj?=
 =?utf-8?B?WHFqcXpMa2xKaWdFWCtyckt5ai8wMXQydFhrRzZxcHdlM1VDMDlYTkJua2l0?=
 =?utf-8?B?RFNEeFkvYzNNclVZbW1Wd2M5ZHptNmc2czZUUjRHNXFKR1lWZXE5MXlYOEt6?=
 =?utf-8?B?NjVIL0hzT1lNTlFYTTF0Z3dGNENLM0pzeHFOcFM2aG1QZ294dUVPbWduUW9k?=
 =?utf-8?B?RVBvRklJbjl1WmpOK1pObEwxeEsrZHIyTHlEWWtrKzZTR3hmdUYrdXpUSndZ?=
 =?utf-8?B?aVhuSUhVNm4xUXhXUXJ5RENGSEdKVEp1Y3BZRW1qVzNDYjduZE8rOFpsRW5S?=
 =?utf-8?B?WlZsUnlzemI0YStRb2FlNGFSYTFwWkRvL3Jlc042b2djWUsxSUlEakMwUnRP?=
 =?utf-8?B?L01QK1pkaCtHOXV2NGVYTzlna2tJMXo3ZnF1SUVVamtJaUVGSDB0UEV3cW5W?=
 =?utf-8?B?cEVzMUoreGk4OERucGQ1WXdyQmMvZElxTzFac2xRa25JVFlYdTFYVEVTaGtO?=
 =?utf-8?B?cDBrcTNLaGxQZTd0ck1wNnA3dnIzRHE4R0grZ0RJSHBkS2hwUHh6R0hBMG5G?=
 =?utf-8?B?dWVVZlN5cFVkaEJWTUZaY0FicVNWV1lCVzE2bXdlRTNrVndZNTJRWm80Vy9a?=
 =?utf-8?B?aUc3YTY0VERiZStXR2ZQeHRZb2NFZU5BdGdNVkpTeDVRTERsa2FtbW9BSzIx?=
 =?utf-8?B?YkxWWlNkWVBIZk9yNG82WXRVTzd4REhKVXYralJjM0VRazdkMGFUZkZndERh?=
 =?utf-8?B?QnNrbFc1TUxLWS94WFc4WDd0Wi85YVVMTUdoYzQ1L1RzVEp3cTNmVkR1WjB1?=
 =?utf-8?B?OHdVaFVmNi9RcTIvdlp2elMzMktGL3VkT0xYZnVqZFBKYVdqVEk5VnVhZTlM?=
 =?utf-8?B?eEorRHNaTk4zM1Z6WDJCZEdvdWtQZmVhaGRzOUlBWTg1TDZydXRYSlkzQ3Zk?=
 =?utf-8?B?Y1l4T1NyZ1Y3emF5bXNGVUJ3dE4ydnlYd1hhU1llM1laUDNvNlB3eDZwMjg3?=
 =?utf-8?B?REVVYXk1NmhlQVBrZ2lJVzJXY1JEYldrU2M5eVcxVm5hcHlqQnVENzZVa0xk?=
 =?utf-8?B?Q2o4K0tGQVdrdjVRMFQxb2t5NGdEZFZqMnZ0d3hhamxvTWhCWjUwQzZwMHpk?=
 =?utf-8?B?YXM5TVFJbDM0eElqSFBTeFVuU2lhV2NBNDFyNnFFajV5eWFaS0pIQWtFRXlt?=
 =?utf-8?B?VFA5dG5zeUp1Q3Yyc3V5TUhtUGJObWxxZG56RDVGbzNUZXc0K09GZEEreXJM?=
 =?utf-8?Q?0l8hKLQofRoTbiFCD08HRXDLY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5a0e41-5435-43bd-240f-08ddd3fe58db
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 08:59:12.5874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4Ton/iMzYXIoM1rCa8kFHrGqkzOzY4fA1KWz6uSpRm6/SdKk/eUJOK/w+DEqnlaEQMfUfBVLpiprbni4x7Prw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7949
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

On 08/04/2025, Shengjiu Wang wrote:
> Add API dw_hdmi_to_plat_data() to fetch plat_data because audio device
> driver needs it to enable(disable)_audio().
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
>  include/drm/bridge/dw_hdmi.h              | 2 ++
>  2 files changed, 8 insertions(+)

Acked-by: Liu Ying <victor.liu@nxp.com>
