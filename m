Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768AC9FE312
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 07:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EA310E0C8;
	Mon, 30 Dec 2024 06:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="LmUxWncm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2046.outbound.protection.outlook.com [40.107.104.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A8010E0C8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 06:56:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0bAk3Mc1zScf99YHCzJ8m6HtxK9I1PMK4jVJ/5lIT7aOmMniYEhHHW5YGAjVFsSYsWBU84MfHTI1KldNxY+435ir77tLivPOGQdVALuoy5oJu0AEAPaGZF6m0iumG8alw7YgWs8R9bszdlZHosN1ml0x1RgaaAI1A7IH3UcpqNyPGjzmCiN8pBsJnNrIsDvAmU9BnSp1i+w5mAKEBvmMVDIC768gb/pTJd26hBHL+n0R+K4eSolmRv328w6m4GCHLgWUQeX4GAra5/xKsyPS4AKyQ8AYZdUHtzK0H46rrOMc83K9KxOB9bzjWwAR8HruVc2KQ6FdKscT3P39HI3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4nn7u49JxycUnPrv2690UF2EnRJMNtHpIvO9arRGKQ=;
 b=qHYcfN2jKzAH4L6KTjIa9TTcKOtf/RZl+vOOw1DoAkPkI5nBLfIJ8b0c3HXg1jSUv+HHh07GBimghtptja/fLyyS97kqKe1obdjFio8bGe7CUYZ0YsMYdmaedw78g3gdt80BKrP6oGojNeChskL5lsdLR/EKm3Ryca+gQm91HdmdTqL3uI9IUYkTC6vg06Imo3xQPKTr7WQBIIoHivXrTdmxHDPHnvOdhZkDcMK3FJLm8lXowVZ57bTlAntIEiBMO+BDsuVhmcnyDBIbZ1POkKINy9cQVzra3x94yzyIO3T3Zn+8CrdTjnyS56vjZ0AY2q03c2AX08vw66VAHeMBxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4nn7u49JxycUnPrv2690UF2EnRJMNtHpIvO9arRGKQ=;
 b=LmUxWncm9OJwzOP286bLosjmpgGy1RChR+IVj6C4EmutKqHn2pmEX6oAgsfMwak71vPtyMyVE3eQKqwISqGj2ZJe3Yk8buwNDzvU4Ydk81IcCIT5/h2LUw4v/h9wtc5EpACz6oQAUXiOxbEWW9R0AT4mHhXE3vnL9PrqV6Ug0Dkx/PwCgY4o6GMgSdLc6YrE91FlNBa5VdIvWWkuBWBoM43Pr085+BktGmsgYYMKV3SVixmEDIv4rKp62n/VCFiep5A2qPofPZE+xxLTMNzCGYdBfC9xpcA30/hfWUxbrhjJG1IF8sm3cTDMQHb5c/nj/Vm2umt0/5T/ssNJygDYxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10196.eurprd04.prod.outlook.com (2603:10a6:150:1ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 06:56:33 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 06:56:33 +0000
Message-ID: <0140bb0c-35f0-4a5e-b100-32e09bc8c617@nxp.com>
Date: Mon, 30 Dec 2024 14:57:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241224014701.253490-1-marex@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241224014701.253490-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10196:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c1ff0c-d7b1-45d1-2829-08dd289f1861
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2xTOEZLN1pHNkhWS2tybDZ4L1VTM0dSbHV5YUhXQVhUR3dUNHdJRmtlcXEr?=
 =?utf-8?B?WFVaa3RZR2Jub3V4SGlaVWdvUlVVTllDY1UyeDBvbzBDQnhMeUVxZm5KdFEr?=
 =?utf-8?B?ZXhKOU5abUhxN2F6b2ErMW02aDdOa3NGd3pwVisva3kxcUZySVZBd00xWkRu?=
 =?utf-8?B?WEU1SVNMYXAzak8rUFRmSlFOY2JvNVJOTTlsaWpEaWFHbE44MG10dW84U0w0?=
 =?utf-8?B?TnFDdjRpNE5SSmduMEo4QVlPV09MVWJIZ0lNeWN6U2lkWjAyb2xCQVFqSmk3?=
 =?utf-8?B?SEMwcy81TGh4OGpUSmVJNXVoa3BGWk5wU1MxY25PNWVRQnpISlpmZ1A1Nm9z?=
 =?utf-8?B?b043Rm5BVy9uYkF2c2lHcDlUMkJzNmNIU0FoNG1ieG1MT3V2cDBEcnk4WVF5?=
 =?utf-8?B?TTEyanRFNUl5OEhGNWVTRm5KUHgzT1NiS0ZJV0crTWF6OWZBME1GVUs1bzU4?=
 =?utf-8?B?NlhSTVpyWjJ2ajhlT1hMZm9VdXdPTU9HejVtekJ2Y2FaY3RFU0JYeVk1NHh3?=
 =?utf-8?B?dk9mQ0lDQ1hOdUhKc3hyK3RBcWJxR20vblRyYUpUeDJjRVQ0THVCSmhpY2l3?=
 =?utf-8?B?NWZiWmFRY0x1bWJuSGc1TVRqN0tReGJYRnEzZkxVK1QwYm5IWE1HWWQ0TXkx?=
 =?utf-8?B?Q0FNV3BzNk9udUQwUXppVHB2MkdDNkhldkZQQ0RlNTM3Ym1IUUw4S0x3eG1J?=
 =?utf-8?B?VDFGMms3amJoQW1zZHhHOGdQYXhZUDFVT3d6Ykg2N0dBcEJuU0RuRTBxdXhM?=
 =?utf-8?B?bnBuU3JscWxreVlpM2tzMlBTSmdxN0ZUSnZpV0ZtRVVMc1dCQ2VJWGgrTmI0?=
 =?utf-8?B?dWJiclJ6RVdRRjBaa3J0blBkYlM5S3ovSmZzOFhscFRpWHFwMUJOY0poVXB2?=
 =?utf-8?B?Z29tVzkzZFBxZUpzd1dnSHRKLzFPbkpqWWF5MVJ4S0F4emdsTHhpOFJzeEJU?=
 =?utf-8?B?RDVZNktpWnZQdkpSc3pPZWttTGFBZzVBRThuQ3VTWHlENEpQaFlPMDQ3RW1t?=
 =?utf-8?B?N0RjSlVrTzRqcU5jSkxPbERtOEsrOUFycE05MDdqdGdtTnN5Z0tOU1R3ZlBO?=
 =?utf-8?B?emg5c3MvaUlud3c1SnBSSnU0SDMxQkEzMmtLNXRwVlcvRW10cmNIcGpaM05l?=
 =?utf-8?B?UkRicDBBUmFINmhsaTlaVzNwamhGT2lKQk1kOGMxaGJ0NWdRSEpGa1Z3WUI1?=
 =?utf-8?B?Umc4L20vdGFvN2dqM3NiSkpsV21kU1VVMEFxUVkxSHJoOThWN3RvS1doL01z?=
 =?utf-8?B?dVBSRXc4NTRRem5lT2IxMlR2RjZWb2ZvcFZrTS9NYTg0eS83SFBSSkpodUpp?=
 =?utf-8?B?NnNaMEJMRFhaZ3l2dk04VW05SGE2blZkK0t2K1lZcVJIRXM4RDRsUmg4TEk0?=
 =?utf-8?B?TUk3R2RWU2t2b09NanZvOUpjY1kxZU1yUGFUb2NVU0RwQTJGMFJhLzF0Y0lr?=
 =?utf-8?B?anpGYy92Wm1qTUNTYWlMZzBGZmhCcUxDSVpabklndnhqVUt2dG5EMXJOR2xo?=
 =?utf-8?B?U1VEeEVhU05sc2c3ckUyVEdqUDZxS0hodXlxNUJRYWI4WW9qTklkTVp5MUxZ?=
 =?utf-8?B?MXJxNWx4MEdnbVVmRnV1REhmQ0tHbEdDRGRJUHUrd09nSXVkNTFkMDNOWUll?=
 =?utf-8?B?R2xtWWx2ZmxaZ2RxRFUvTk9Oc2NrUlNEa3hObm5wbWJ2VkprWlhBQ29rbW91?=
 =?utf-8?B?R0JHSVduVUY5ZkY0WmFRTDNEbFU1OGpPYlpwVXNvTjhPdmxlVEZ1a3U1Um1p?=
 =?utf-8?B?aldDL1U2SitCT2RLOUtFeVRqd01DV0sxWUw1TmlNZVByTG1kRkV0T1ZwRmgx?=
 =?utf-8?B?eDRVdzcxWXNKeCtSb0ZMMkVCcGhjOVJCa1o4and3ZGFNT1ZnWTJDNVZydzlS?=
 =?utf-8?Q?PM+2ZUEQ+WzZf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEczVUVpZTJEQzRSa1NpTWgvRnhaUTBlSnBwMTEvQmJDTURWeVdJajEvbzBE?=
 =?utf-8?B?Risvd3BscndsbWhQZU1UWWhxbWxMemE4VXlOOUhESlllMTdrdHp3eDlNWDdI?=
 =?utf-8?B?UkZrZDRMcmZ6OUFoN08xOFlKQUFBa1ZLcGNWOExoVVV3YzNHNmMxdmEyRWtz?=
 =?utf-8?B?VXRsNjNvdnNDQy9lTjhjMTNpZ1pEQlpXb3hrMzEvNll1SUc1ZUE4T2o5ZXEz?=
 =?utf-8?B?TzkweHFzSHVPYTIxdXpqMzZEQWxNcnIrSHRjbTNPb0dST3RIYjdCL0U0MFNN?=
 =?utf-8?B?MW8rRGVLRE1QcGZydzlzWmp6dWpQREkwV2ZyWGhjMnBQVHlmdE01cFVNM01F?=
 =?utf-8?B?N1B0dmoxdjc2MTdVSldoZTFuZnBjd2NJQ3lrRVA4ZVozUlZaS1BWbExTM3Fq?=
 =?utf-8?B?akZLSlFZZGVQUC9vNUNTQmlPTmh2M3lBZXlhN3ZGWTZUQ2JiNVBxUnkyZERC?=
 =?utf-8?B?L1VaNlFGNFVKeVVCZVlWR3NxRUc1QVphTDZydFNBVjJQejhORmZVaFFxOEI4?=
 =?utf-8?B?RXp6VUdSbDBEVG1xUloyMm9ncENjM3RobmJTQ3JUeGRmRHZmTE1ibG9mOUYv?=
 =?utf-8?B?QWdKSitDU0wxSEc0NEJhSWpIMG95cHFKdytvclAyTzlhazdlM2VxUG9ocUo2?=
 =?utf-8?B?cTVKYS9aSGZRcVZMa21weUZOUElNNE1xRGtEaDlFMWFTUjBJMVlFQnY3S2s5?=
 =?utf-8?B?ZWdxcFJWMWFWd0l5elVhRlVsZ21nbmY1OXVBTTFwZWM4K1kwRjRmdnNEc0xh?=
 =?utf-8?B?Z3hOQmVvS1pVNnBWTDN3dUk4Qkgxc1BESWhuVXpKQ2IrM0lTVFl0Y043Y0N0?=
 =?utf-8?B?V3BKb1NhcVUzSFEwTzVuZmdad2NKVW1oTzM0RE5EWlpDRVNQcXVsQzdvNm5Q?=
 =?utf-8?B?c0hleEhZczVMK0c3Y2NVRUh1MHhoMlF1OU00cGZ3R0FqamVTbjJKQmkzT0Rt?=
 =?utf-8?B?dE1RRk1acllxN3hTdFVDWHF1TTIxdmxudG5JeUgxVFM1QW9wbzR1bVlHbGtO?=
 =?utf-8?B?UFNsS2EwblgxNDRFei92L2RvV0FIOHptYVkvYnd6bk50MWMyclhlWE13QlJD?=
 =?utf-8?B?VE9OVWhkZ1pJK2dvMTBDZGp6NkxjdFZqdFp2eVQ5Mk5neHJYQkRGQkZENEI0?=
 =?utf-8?B?NWZRR1VMSCt5RTREMStUQjUwZ2E2clNLTWRWeVhRRHA5elFBYVQzaTFzcW5B?=
 =?utf-8?B?eWhkSTBHSndUZkJqaUovTWIzKzZaSmlKWDVPKzFuOUlVa1ArNWJYUFh1MmI4?=
 =?utf-8?B?UndlREErZ0tWS1NwUCt1Mzd1M2pLdXJicUtmYVRyWG10eGRBV0hKR0lJZUw1?=
 =?utf-8?B?SnBjSy9tV2g0MXVKNHZEaUprZ3hZV1l1R3JESXd5RmJrYUFpUVY1RW5pQUlR?=
 =?utf-8?B?WVJtWm9wZWJFL2l1amtpOFlzUVV1Uld3WEZuajJKQUNia0FrdklTSzc3bXds?=
 =?utf-8?B?TTRROFRXek9hakhWR2hYMWxDSWdzTUpwK1J0dCtDdEFQRFg3RTZOSlFVY1Q2?=
 =?utf-8?B?MGRoWDIzblcrMW8yK3lGZC8zQWJTcGJoR2dLTE83RmNrdWJBT0UrbFZVV1Bw?=
 =?utf-8?B?eEtLUVRBa0s3cXRQK2ZOODFEZUE5c2F6aFNVZi9EZXFDL3NzME9YaFh3M2hE?=
 =?utf-8?B?anZJNHBMbFdQWk9nTnY5SG5QVW1Zam9qVzhna0FZQmRNbHlDMHp4aGJOdC94?=
 =?utf-8?B?TVU3bks1UmZZU3VROXNwOG9wWGdRTDZCYmZCcWpEMU81L2ZvMnpFQy9iQytG?=
 =?utf-8?B?L0lDeU5lcnlwckRZRzVub2ZvZmFYM0oxOXY2Nnl2eGV4UG1hYXYxNmJ0a2hw?=
 =?utf-8?B?WFZwdVZ1UXhIVU5GZlRjOU9pQThDdUFGclFlS2xtaEFyWFljbHFDRXptYnpF?=
 =?utf-8?B?Y2JYek9WNTIxZTBkdG9qbFpmd1VsTnR6ZkI2SkdFdzc0bHZtcnB1UHV5QlYz?=
 =?utf-8?B?ZnA0NjJudTQwcllrZG13Y1JSRTJzUjNVaDVoNURtekZhbWlQOVhnVzNGSFFH?=
 =?utf-8?B?aUVFMVdSWGhmNmQ4d0U2dzNVSEFacGYwY2ozWGlxeEl2bk9ZRVRvaTJzWnla?=
 =?utf-8?B?Q3Q2cncwTHpzNUhBUC9CSzRXOVhrbjhWdmY0eWU5SnRLQ3RHTFFFelN4TVor?=
 =?utf-8?Q?pEr4GrRrCiENrKHaYZw8R1hG5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c1ff0c-d7b1-45d1-2829-08dd289f1861
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 06:56:33.1756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVkV4yB8lLqWyLUQ3+cp4R8XYwr3TuLnpmlqyFDNW/Qx6W4L3Fvv0AGqpeQfcL0yn8X2BK9G0zjBkVh147ZP+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10196
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

On 12/24/2024, Marek Vasut wrote:
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> The output_port set to 1 makes the DW HDMI driver core look up the
> next bridge in DT, where the next bridge is often the hdmi-connector .
> 
> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: No change
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9a480c6abb856..d8e9fbf75edbb 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  config DRM_IMX8MP_HDMI_PVI
>  	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>  	depends on OF
> +	select DRM_DISPLAY_CONNECTOR

Select it for DRM_IMX8MP_DW_HDMI_BRIDGE instead?
Furthermore, if yes, should it be even selected for DRM_DW_HDMI instead?

I'm not sure if this is needed to be selected though, since only DRM_MESON is
selecting it while CONFIG_DRM_DISPLAY_CONNECTOR is enabled in multiple
defconfig files(like arch/arm/configs/multi_v7_defconfig).

>  	help
>  	  Choose this to enable support for the internal HDMI TX Parallel
>  	  Video Interface found on the Freescale i.MX8MP SoC.
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 1e7a789ec2890..4ebae5ad072ad 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>  	plat_data->priv_data = hdmi;
>  	plat_data->phy_force_vendor = true;
> +	plat_data->output_port = 1;

Dmitry's comment applies here.
https://lore.kernel.org/all/vvsj6ri2ke25nzocbq736yv7rphzma6pn3yk2uh7iu43zfe2sa@2fwye4k4w6he/

>  
>  	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>  	if (IS_ERR(hdmi->dw_hdmi))

-- 
Regards,
Liu Ying
